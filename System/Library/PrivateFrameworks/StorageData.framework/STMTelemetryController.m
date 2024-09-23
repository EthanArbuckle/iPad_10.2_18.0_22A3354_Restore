@implementation STMTelemetryController

- (void)getTelemetry:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __39__STMTelemetryController_getTelemetry___block_invoke;
  v6[3] = &unk_24C75FD18;
  v7 = v4;
  v5 = v4;
  -[STMTelemetryController retrieveTelemetryWithCompletionHandler:](self, "retrieveTelemetryWithCompletionHandler:", v6);

}

void __39__STMTelemetryController_getTelemetry___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
  {
    v8 = v5;
    if (!v5)
    {
      STStorageLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __39__STMTelemetryController_getTelemetry___block_invoke_cold_1((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);

      v7 = *(_QWORD *)(a1 + 32);
      v8 = (id)MEMORY[0x24BDBD1B8];
    }
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);
  }

}

- (void)retrieveTelemetryWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[16];

  v4 = a3;
  -[STMTelemetryController connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.storagedatad"), 0);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549C8AC0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRemoteObjectInterface:", v7);

    objc_msgSend(v6, "resume");
    -[STMTelemetryController setConnection:](self, "setConnection:", v6);

  }
  STStorageLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D6A4000, v8, OS_LOG_TYPE_INFO, "Connecting to StorageDataService", buf, 2u);
  }

  -[STMTelemetryController connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __65__STMTelemetryController_retrieveTelemetryWithCompletionHandler___block_invoke;
  v16[3] = &unk_24C75FD40;
  v11 = v4;
  v17 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __65__STMTelemetryController_retrieveTelemetryWithCompletionHandler___block_invoke_5;
  v14[3] = &unk_24C75FD68;
  v15 = v11;
  v13 = v11;
  objc_msgSend(v12, "storageInfoDict:", v14);

}

void __65__STMTelemetryController_retrieveTelemetryWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
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
  STStorageLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __65__STMTelemetryController_retrieveTelemetryWithCompletionHandler___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __65__STMTelemetryController_retrieveTelemetryWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)stopService
{
  void *v3;

  -[STMTelemetryController connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[STMTelemetryController setConnection:](self, "setConnection:", 0);
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

void __39__STMTelemetryController_getTelemetry___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_20D6A4000, a2, a3, "Failed to retrieve storage telemetry: %@", a5, a6, a7, a8, 2u);
}

void __65__STMTelemetryController_retrieveTelemetryWithCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_20D6A4000, a2, a3, "Error connecting to StorageDataService: %@", a5, a6, a7, a8, 2u);
}

@end
