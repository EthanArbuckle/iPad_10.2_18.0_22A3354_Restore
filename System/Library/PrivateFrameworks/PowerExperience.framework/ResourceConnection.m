@implementation ResourceConnection

- (BOOL)createResourceHint:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  _QWORD v12[5];
  id v13;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v16;
  char v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)_log_1;
  if (os_log_type_enabled((os_log_t)_log_1, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    objc_msgSend(v4, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_2446D7000, v6, OS_LOG_TYPE_DEFAULT, "ResourceConnection: createResource %@", (uint8_t *)&buf, 0xCu);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v16 = 0x2020000000;
  v17 = 0;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __41__ResourceConnection_createResourceHint___block_invoke_22;
  v12[3] = &unk_25156B448;
  v12[4] = self;
  v9 = v4;
  v13 = v9;
  p_buf = &buf;
  objc_msgSend(v8, "createResourceHint:withReply:", v9, v12);

  v10 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;
  _Block_object_dispose(&buf, 8);

  return v10;
}

void __41__ResourceConnection_createResourceHint___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  v3 = _log_1;
  if (os_log_type_enabled((os_log_t)_log_1, OS_LOG_TYPE_ERROR))
    __41__ResourceConnection_createResourceHint___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

void __41__ResourceConnection_createResourceHint___block_invoke_22(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  if (v3)
  {
    v5 = v3;
    v4 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
    objc_sync_enter(v4);
    objc_msgSend(*(id *)(a1 + 40), "setUuid:", v5);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), v5);
    objc_sync_exit(v4);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v3 = v5;
  }

}

- (void)restoreResourceHints:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  v5 = _log_1;
  if (os_log_type_enabled((os_log_t)_log_1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_2446D7000, v5, OS_LOG_TYPE_INFO, "restoring resources", v7, 2u);
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_24_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "restoreResourceHints:", v4);

}

void __43__ResourceConnection_restoreResourceHints___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  v3 = _log_1;
  if (os_log_type_enabled((os_log_t)_log_1, OS_LOG_TYPE_ERROR))
    __41__ResourceConnection_createResourceHint___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

- (BOOL)updateResourceHint:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSMutableDictionary *resourceHints;
  void *v9;
  void *v10;
  uint64_t v11;
  NSXPCConnection *connection;
  uint64_t v13;
  void *v14;
  id v15;
  BOOL v16;
  _QWORD v18[5];
  id v19;
  uint64_t v20;
  _QWORD v21[5];
  _BYTE buf[24];
  char v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)_log_1;
  if (os_log_type_enabled((os_log_t)_log_1, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = objc_msgSend(v4, "state");
    _os_log_impl(&dword_2446D7000, v6, OS_LOG_TYPE_DEFAULT, "ResourceConnection:updateResourceHint %@ with state %lu", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v23 = 1;
  -[ResourceConnection resourceHints](self, "resourceHints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  resourceHints = self->_resourceHints;
  objc_msgSend(v4, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](resourceHints, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v4, "state");
  objc_msgSend(v10, "setState:", objc_msgSend(v4, "state"));

  objc_sync_exit(v7);
  connection = self->_connection;
  v13 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __41__ResourceConnection_updateResourceHint___block_invoke;
  v21[3] = &unk_25156B470;
  v21[4] = buf;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v13;
  v18[1] = 3221225472;
  v18[2] = __41__ResourceConnection_updateResourceHint___block_invoke_25;
  v18[3] = &unk_25156B498;
  v18[4] = self;
  v15 = v4;
  v19 = v15;
  v20 = v11;
  objc_msgSend(v14, "updateResourceHint:withReply:", v15, v18);

  v16 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;
  _Block_object_dispose(buf, 8);

  return v16;
}

void __41__ResourceConnection_updateResourceHint___block_invoke(uint64_t a1, void *a2)
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
  v4 = _log_1;
  if (os_log_type_enabled((os_log_t)_log_1, OS_LOG_TYPE_ERROR))
    __41__ResourceConnection_updateResourceHint___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;

}

void __41__ResourceConnection_updateResourceHint___block_invoke_25(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if ((a2 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)_log_1, OS_LOG_TYPE_ERROR))
      __41__ResourceConnection_updateResourceHint___block_invoke_25_cold_1();
    objc_msgSend(*(id *)(a1 + 32), "resourceHints");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v3);
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setState:", *(_QWORD *)(a1 + 48));
    objc_sync_exit(v3);

  }
}

- (ResourceConnection)init
{
  os_log_t v3;
  void *v4;
  ResourceConnection *v5;
  uint64_t v6;
  NSXPCConnection *connection;
  NSObject *v8;
  void *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *resourceHints;
  NSXPCConnection *v12;
  uint64_t v13;
  NSXPCConnection *v14;
  ResourceConnection *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id buf[2];
  objc_super v25;

  v3 = os_log_create("com.apple.PowerExperienceFramework", "ResourceConnection");
  v4 = (void *)_log_1;
  _log_1 = (uint64_t)v3;

  v25.receiver = self;
  v25.super_class = (Class)ResourceConnection;
  v5 = -[ResourceConnection init](&v25, sel_init);
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)_log_1, OS_LOG_TYPE_ERROR))
      -[ResourceConnection init].cold.1();
    goto LABEL_8;
  }
  v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.powerexperienced.resourceusage"), 4096);
  connection = v5->_connection;
  v5->_connection = (NSXPCConnection *)v6;

  v8 = _log_1;
  if (v5->_connection)
  {
    if (os_log_type_enabled((os_log_t)_log_1, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_2446D7000, v8, OS_LOG_TYPE_INFO, "established connection to powerexperienced", (uint8_t *)buf, 2u);
    }
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25737D0C8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v5->_connection, "setRemoteObjectInterface:", v9);

    -[NSXPCConnection setExportedObject:](v5->_connection, "setExportedObject:", v5);
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    resourceHints = v5->_resourceHints;
    v5->_resourceHints = v10;

    objc_initWeak(buf, v5);
    v12 = v5->_connection;
    v13 = MEMORY[0x24BDAC760];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __26__ResourceConnection_init__block_invoke;
    v22[3] = &unk_25156B378;
    objc_copyWeak(&v23, buf);
    -[NSXPCConnection setInterruptionHandler:](v12, "setInterruptionHandler:", v22);
    v14 = v5->_connection;
    v17 = v13;
    v18 = 3221225472;
    v19 = __26__ResourceConnection_init__block_invoke_41;
    v20 = &unk_25156B378;
    objc_copyWeak(&v21, buf);
    -[NSXPCConnection setInvalidationHandler:](v14, "setInvalidationHandler:", &v17);
    -[NSXPCConnection resume](v5->_connection, "resume", v17, v18, v19, v20);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(buf);
LABEL_8:
    v15 = v5;
    goto LABEL_12;
  }
  if (os_log_type_enabled((os_log_t)_log_1, OS_LOG_TYPE_ERROR))
    -[ResourceConnection init].cold.2();
  v15 = 0;
LABEL_12:

  return v15;
}

void __26__ResourceConnection_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && os_log_type_enabled((os_log_t)_log_1, OS_LOG_TYPE_ERROR))
    __26__ResourceConnection_init__block_invoke_cold_1();

}

void __26__ResourceConnection_init__block_invoke_41(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && os_log_type_enabled((os_log_t)_log_1, OS_LOG_TYPE_ERROR))
    __26__ResourceConnection_init__block_invoke_41_cold_1();

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_42);
  return (id)sharedInstance_obj;
}

void __36__ResourceConnection_sharedInstance__block_invoke()
{
  ResourceConnection *v0;
  void *v1;

  v0 = objc_alloc_init(ResourceConnection);
  v1 = (void *)sharedInstance_obj;
  sharedInstance_obj = (uint64_t)v0;

}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (NSMutableDictionary)resourceHints
{
  return self->_resourceHints;
}

- (void)setResourceHints:(id)a3
{
  objc_storeStrong((id *)&self->_resourceHints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceHints, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __41__ResourceConnection_createResourceHint___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2446D7000, a2, a3, "Connection error %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __41__ResourceConnection_updateResourceHint___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2446D7000, a2, a3, "Error connecting to service %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __41__ResourceConnection_updateResourceHint___block_invoke_25_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2446D7000, v0, v1, "Failed to update resource hint state with service", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2446D7000, v0, v1, "connection to com.apple.powerexperienced does not exist", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __26__ResourceConnection_init__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2446D7000, v0, v1, "Connection to service interrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __26__ResourceConnection_init__block_invoke_41_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2446D7000, v0, v1, "Connection to service invalidated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
