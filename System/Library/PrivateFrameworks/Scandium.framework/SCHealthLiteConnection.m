@implementation SCHealthLiteConnection

- (SCHealthLiteConnection)initWithDelegate:(id)a3 onQueue:(id)a4
{
  id v6;
  id v7;
  SCHealthLiteConnection *v8;
  SCHealthLiteConnection *v9;
  SCHealthLiteConnection *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SCHealthLiteConnection;
  v8 = -[SCHealthLiteConnection init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_queue, a4);
    -[SCHealthLiteConnection connectToHealthLite](v9, "connectToHealthLite");
    v10 = v9;
  }

  return v9;
}

- (void)connectToHealthLite
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id buf[2];

  sc_get_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_2457F9000, v3, OS_LOG_TYPE_DEFAULT, "connecting to HealthLite", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  -[SCHealthLiteConnection queue](self, "queue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.healthlite.scandium_plugin"), 0);
  -[SCHealthLiteConnection setConnection:](self, "setConnection:", v5);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2574B50E8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteObjectInterface:", v6);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2574B3880);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v7);

  objc_msgSend(v5, "setExportedObject:", self);
  v8 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __45__SCHealthLiteConnection_connectToHealthLite__block_invoke;
  v20[3] = &unk_25169CFA0;
  v9 = v4;
  v21 = v9;
  objc_copyWeak(&v22, buf);
  objc_msgSend(v5, "setInterruptionHandler:", v20);
  v14 = v8;
  v15 = 3221225472;
  v16 = __45__SCHealthLiteConnection_connectToHealthLite__block_invoke_3;
  v17 = &unk_25169CFA0;
  v10 = v9;
  v18 = v10;
  objc_copyWeak(&v19, buf);
  objc_msgSend(v5, "setInvalidationHandler:", &v14);
  objc_msgSend(v5, "resume", v14, v15, v16, v17);
  objc_msgSend(v5, "remoteObjectProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCHealthLiteConnection setHealthlite:](self, "setHealthlite:", v11);

  -[SCHealthLiteConnection healthlite](self, "healthlite");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "connect");

  -[SCHealthLiteConnection delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleInitialConnect");

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v22);

  objc_destroyWeak(buf);
}

void __45__SCHealthLiteConnection_connectToHealthLite__block_invoke(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  v1 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__SCHealthLiteConnection_connectToHealthLite__block_invoke_2;
  block[3] = &unk_25169CF08;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void __45__SCHealthLiteConnection_connectToHealthLite__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "interruptionHandler");

}

void __45__SCHealthLiteConnection_connectToHealthLite__block_invoke_3(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  v1 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__SCHealthLiteConnection_connectToHealthLite__block_invoke_4;
  block[3] = &unk_25169CF08;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void __45__SCHealthLiteConnection_connectToHealthLite__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidationHandler");

}

- (void)invalidationHandler
{
  OUTLINED_FUNCTION_0(&dword_2457F9000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)interruptionHandler
{
  OUTLINED_FUNCTION_0(&dword_2457F9000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)dealloc
{
  OUTLINED_FUNCTION_0(&dword_2457F9000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)abortSession
{
  OUTLINED_FUNCTION_0(&dword_2457F9000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __38__SCHealthLiteConnection_abortSession__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "abortSession");

}

- (void)beginSession
{
  OUTLINED_FUNCTION_0(&dword_2457F9000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __38__SCHealthLiteConnection_beginSession__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "beginSession");

}

- (void)setBackgroundAllowed:(BOOL)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v15[5];
  BOOL v16;

  sc_get_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SCHealthLiteConnection setBackgroundAllowed:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  -[SCHealthLiteConnection queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __47__SCHealthLiteConnection_setBackgroundAllowed___block_invoke;
    v15[3] = &unk_25169CFF0;
    v15[4] = self;
    v16 = a3;
    dispatch_async(v13, v15);
  }

}

void __47__SCHealthLiteConnection_setBackgroundAllowed___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundAllowed:", *(unsigned __int8 *)(a1 + 40));

}

- (SCHLDaemon)healthlite
{
  return self->_healthlite;
}

- (void)setHealthlite:(id)a3
{
  objc_storeStrong((id *)&self->_healthlite, a3);
}

- (SCHealthLiteConnectionDelegate)delegate
{
  return (SCHealthLiteConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (void)setConnection:(id)a3
{
  objc_storeWeak((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connection);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_healthlite, 0);
}

- (void)setBackgroundAllowed:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2457F9000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
