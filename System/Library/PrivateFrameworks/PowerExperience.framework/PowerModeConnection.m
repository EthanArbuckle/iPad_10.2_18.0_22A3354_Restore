@implementation PowerModeConnection

- (PowerModeConnection)init
{
  os_log_t v3;
  void *v4;
  NSObject *v5;
  PowerModeConnection *v6;
  uint64_t v7;
  NSXPCConnection *connection;
  NSObject *v9;
  void *v10;
  NSXPCConnection *v11;
  uint64_t v12;
  NSXPCConnection *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id buf[2];
  objc_super v31;

  v3 = os_log_create("com.apple.PowerExperienceFramework", "PowerModeConnection");
  v4 = (void *)_log_0;
  _log_0 = (uint64_t)v3;

  v5 = _log_0;
  if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_2446D7000, v5, OS_LOG_TYPE_INFO, "PowerModeConnection init", (uint8_t *)buf, 2u);
  }
  v31.receiver = self;
  v31.super_class = (Class)PowerModeConnection;
  v6 = -[PowerModeConnection init](&v31, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.powerexperienced.powermodes"), 4096);
    connection = v6->_connection;
    v6->_connection = (NSXPCConnection *)v7;

    v9 = _log_0;
    if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_2446D7000, v9, OS_LOG_TYPE_INFO, "established connection to powerexperienced", (uint8_t *)buf, 2u);
    }
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25737D068);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v6->_connection, "setRemoteObjectInterface:", v10);

    -[NSXPCConnection setExportedObject:](v6->_connection, "setExportedObject:", v6);
    objc_initWeak(buf, v6);
    v11 = v6->_connection;
    v12 = MEMORY[0x24BDAC760];
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __27__PowerModeConnection_init__block_invoke;
    v28[3] = &unk_25156B378;
    objc_copyWeak(&v29, buf);
    -[NSXPCConnection setInterruptionHandler:](v11, "setInterruptionHandler:", v28);
    v13 = v6->_connection;
    v23 = v12;
    v24 = 3221225472;
    v25 = __27__PowerModeConnection_init__block_invoke_16;
    v26 = &unk_25156B378;
    objc_copyWeak(&v27, buf);
    -[NSXPCConnection setInvalidationHandler:](v13, "setInvalidationHandler:", &v23);
    -[NSXPCConnection resume](v6->_connection, "resume", v23, v24, v25, v26);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
    objc_destroyWeak(buf);
  }
  else
  {
    v14 = _log_0;
    if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_ERROR))
      -[PowerModeConnection init].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);
  }
  return v6;
}

void __27__PowerModeConnection_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = _log_0;
    if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_ERROR))
      __27__PowerModeConnection_init__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

}

void __27__PowerModeConnection_init__block_invoke_16(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = _log_0;
    if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_ERROR))
      __27__PowerModeConnection_init__block_invoke_16_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

}

- (BOOL)enablePowerMode:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __39__PowerModeConnection_enablePowerMode___block_invoke_18;
  v7[3] = &unk_25156B3C0;
  v7[4] = &v8;
  objc_msgSend(v5, "enablePowerMode:withReply:", v4, v7);

  LOBYTE(v5) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return (char)v5;
}

void __39__PowerModeConnection_enablePowerMode___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_ERROR))
    __39__PowerModeConnection_enablePowerMode___block_invoke_cold_1();

}

uint64_t __39__PowerModeConnection_enablePowerMode___block_invoke_18(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)disablePowerMode:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_20);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __40__PowerModeConnection_disablePowerMode___block_invoke_21;
  v7[3] = &unk_25156B3C0;
  v7[4] = &v8;
  objc_msgSend(v5, "disablePowerMode:withReply:", v4, v7);

  LOBYTE(v5) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return (char)v5;
}

void __40__PowerModeConnection_disablePowerMode___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_ERROR))
    __39__PowerModeConnection_enablePowerMode___block_invoke_cold_1();

}

uint64_t __40__PowerModeConnection_disablePowerMode___block_invoke_21(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)updatePowerMode:(id)a3 withState:(BOOL)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a4;
  v6 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_22);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __49__PowerModeConnection_updatePowerMode_withState___block_invoke_23;
  v9[3] = &unk_25156B3C0;
  v9[4] = &v10;
  objc_msgSend(v7, "updatePowerMode:withState:andReply:", v6, v4, v9);

  LOBYTE(v4) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return v4;
}

void __49__PowerModeConnection_updatePowerMode_withState___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_ERROR))
    __39__PowerModeConnection_enablePowerMode___block_invoke_cold_1();

}

uint64_t __49__PowerModeConnection_updatePowerMode_withState___block_invoke_23(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)updateAllowOnCharger:(id)a3 withState:(BOOL)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a4;
  v6 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_24);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __54__PowerModeConnection_updateAllowOnCharger_withState___block_invoke_25;
  v9[3] = &unk_25156B3C0;
  v9[4] = &v10;
  objc_msgSend(v7, "updateAllowOnCharger:withState:andReply:", v6, v4, v9);

  LOBYTE(v4) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return v4;
}

void __54__PowerModeConnection_updateAllowOnCharger_withState___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_ERROR))
    __39__PowerModeConnection_enablePowerMode___block_invoke_cold_1();

}

uint64_t __54__PowerModeConnection_updateAllowOnCharger_withState___block_invoke_25(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)updateEntryDelay:(id)a3 withDelay:(double)a4
{
  id v6;
  void *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v6 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_26);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __50__PowerModeConnection_updateEntryDelay_withDelay___block_invoke_27;
  v9[3] = &unk_25156B3C0;
  v9[4] = &v10;
  objc_msgSend(v7, "updateEntryDelay:withDelay:andReply:", v6, v9, a4);

  LOBYTE(v7) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return (char)v7;
}

void __50__PowerModeConnection_updateEntryDelay_withDelay___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_ERROR))
    __39__PowerModeConnection_enablePowerMode___block_invoke_cold_1();

}

uint64_t __50__PowerModeConnection_updateEntryDelay_withDelay___block_invoke_27(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)updateMaxEngagementDuration:(id)a3 withDuration:(double)a4
{
  id v6;
  void *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v6 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_28);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __64__PowerModeConnection_updateMaxEngagementDuration_withDuration___block_invoke_29;
  v9[3] = &unk_25156B3C0;
  v9[4] = &v10;
  objc_msgSend(v7, "updateMaxEngagementDuration:withDuration:andReply:", v6, v9, a4);

  LOBYTE(v7) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return (char)v7;
}

void __64__PowerModeConnection_updateMaxEngagementDuration_withDuration___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_ERROR))
    __39__PowerModeConnection_enablePowerMode___block_invoke_cold_1();

}

uint64_t __64__PowerModeConnection_updateMaxEngagementDuration_withDuration___block_invoke_29(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
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

- (void)init
{
  OUTLINED_FUNCTION_0(&dword_2446D7000, a1, a3, "Failed to initialize PowerModeConnection", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __27__PowerModeConnection_init__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2446D7000, a1, a3, "Connection to service interrupted", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __27__PowerModeConnection_init__block_invoke_16_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2446D7000, a1, a3, "Connection to service invalidated", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __39__PowerModeConnection_enablePowerMode___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_2446D7000, v0, v1, "Connection error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
