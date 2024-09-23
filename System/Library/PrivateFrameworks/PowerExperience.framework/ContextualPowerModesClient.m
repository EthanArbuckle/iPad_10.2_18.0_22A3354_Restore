@implementation ContextualPowerModesClient

- (void)registerWithIdentifier:(id)a3 queue:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  id v18;
  _QWORD v19[5];

  v19[4] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[ContextualPowerModesClient setIdentifier:](self, "setIdentifier:", v8);
  -[ContextualPowerModesClient setCallback:](self, "setCallback:", v9);

  -[ContextualPowerModesClient setCallback_queue:](self, "setCallback_queue:", v10);
  v11 = (void *)MEMORY[0x24BDBCF20];
  v19[0] = CFSTR("RestrictedPerfMode");
  v19[1] = CFSTR("InUseChargingMode");
  v19[2] = CFSTR("AcceleratedChargingMode");
  v19[3] = CFSTR("LongChargingMode");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[ContextualPowerModesClient setInterestedModes:](self, "setInterestedModes:", v13);
  -[ContextualPowerModesClient connection](self, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "registerWithIdentifier:forModes:", v8, v13);

  v16 = _log_2;
  if (os_log_type_enabled((os_log_t)_log_2, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412290;
    v18 = v8;
    _os_log_impl(&dword_2446D7000, v16, OS_LOG_TYPE_DEFAULT, "Registered %@ for all modes", (uint8_t *)&v17, 0xCu);
  }

}

void __68__ContextualPowerModesClient_registerWithIdentifier_queue_callback___block_invoke(uint64_t a1, void *a2)
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
  v3 = _log_2;
  if (os_log_type_enabled((os_log_t)_log_2, OS_LOG_TYPE_ERROR))
    __68__ContextualPowerModesClient_registerWithIdentifier_queue_callback___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

- (void)registerWithIdentitifer:(id)a3 forModes:(id)a4 queue:(id)a5 callback:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = a5;
  -[ContextualPowerModesClient setIdentifier:](self, "setIdentifier:", v10);
  -[ContextualPowerModesClient setCallback:](self, "setCallback:", v12);

  -[ContextualPowerModesClient setCallback_queue:](self, "setCallback_queue:", v13);
  -[ContextualPowerModesClient setInterestedModes:](self, "setInterestedModes:", v11);
  -[ContextualPowerModesClient connection](self, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "registerWithIdentifier:forModes:", v10, v11);

  v16 = _log_2;
  if (os_log_type_enabled((os_log_t)_log_2, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412546;
    v18 = v10;
    v19 = 2112;
    v20 = v11;
    _os_log_impl(&dword_2446D7000, v16, OS_LOG_TYPE_DEFAULT, "Registered %@ for modes %@", (uint8_t *)&v17, 0x16u);
  }

}

void __78__ContextualPowerModesClient_registerWithIdentitifer_forModes_queue_callback___block_invoke(uint64_t a1, void *a2)
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
  v3 = _log_2;
  if (os_log_type_enabled((os_log_t)_log_2, OS_LOG_TYPE_ERROR))
    __68__ContextualPowerModesClient_registerWithIdentifier_queue_callback___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

- (void)updateState:(BOOL)a3 forMode:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  -[ContextualPowerModesClient callback_queue](self, "callback_queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__ContextualPowerModesClient_updateState_forMode___block_invoke;
  block[3] = &unk_25156B520;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

void __50__ContextualPowerModesClient_updateState_forMode___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "callback");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD))v2 + 2))(v2, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (void)reRegister
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[ContextualPowerModesClient connection](self, "connection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ContextualPowerModesClient identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ContextualPowerModesClient interestedModes](self, "interestedModes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerWithIdentifier:forModes:", v4, v5);

}

void __40__ContextualPowerModesClient_reRegister__block_invoke(uint64_t a1, void *a2)
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
  v3 = _log_2;
  if (os_log_type_enabled((os_log_t)_log_2, OS_LOG_TYPE_ERROR))
    __68__ContextualPowerModesClient_registerWithIdentifier_queue_callback___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

- (ContextualPowerModesClient)init
{
  ContextualPowerModesClient *v2;
  id *p_isa;
  uint64_t v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  id v13;
  uint32_t v14;
  NSObject *v15;
  ContextualPowerModesClient *v16;
  _QWORD handler[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id buf[2];
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)ContextualPowerModesClient;
  v2 = -[ContextualPowerModesClient init](&v25, sel_init);
  p_isa = (id *)&v2->super.isa;
  if (initLogging_onceToken == -1)
  {
    if (v2)
      goto LABEL_3;
LABEL_14:
    if (os_log_type_enabled((os_log_t)_log_2, OS_LOG_TYPE_ERROR))
      -[ResourceConnection init].cold.1();
    goto LABEL_16;
  }
  dispatch_once(&initLogging_onceToken, &__block_literal_global_2);
  if (!p_isa)
    goto LABEL_14;
LABEL_3:
  v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.powerexperienced.powermodesservice"), 4096);
  v5 = p_isa[2];
  p_isa[2] = (id)v4;

  v6 = _log_2;
  if (p_isa[2])
  {
    if (os_log_type_enabled((os_log_t)_log_2, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_2446D7000, v6, OS_LOG_TYPE_INFO, "established connection to powerexperienced", (uint8_t *)buf, 2u);
    }
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25737D128);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa[2], "setRemoteObjectInterface:", v7);

    objc_msgSend(p_isa[2], "setExportedObject:", p_isa);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25737CB08);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa[2], "setExportedInterface:", v8);

    objc_initWeak(buf, p_isa);
    v9 = p_isa[2];
    v10 = MEMORY[0x24BDAC760];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __34__ContextualPowerModesClient_init__block_invoke;
    v22[3] = &unk_25156B378;
    objc_copyWeak(&v23, buf);
    objc_msgSend(v9, "setInterruptionHandler:", v22);
    v11 = p_isa[2];
    v20[0] = v10;
    v20[1] = 3221225472;
    v20[2] = __34__ContextualPowerModesClient_init__block_invoke_25;
    v20[3] = &unk_25156B378;
    objc_copyWeak(&v21, buf);
    objc_msgSend(v11, "setInvalidationHandler:", v20);
    objc_msgSend(p_isa[2], "resume");
    v12 = MEMORY[0x24BDAC9B8];
    v13 = MEMORY[0x24BDAC9B8];
    handler[0] = v10;
    handler[1] = 3221225472;
    handler[2] = __34__ContextualPowerModesClient_init__block_invoke_27;
    handler[3] = &unk_25156B568;
    objc_copyWeak(&v19, buf);
    v14 = notify_register_dispatch("com.apple.powerexperienced.restart", (int *)&init_syncToken, v12, handler);

    if (v14)
    {
      v15 = _log_2;
      if (os_log_type_enabled((os_log_t)_log_2, OS_LOG_TYPE_ERROR))
        -[ContextualPowerModesClient init].cold.3(v14, v15);
    }
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(buf);
LABEL_16:
    v16 = p_isa;
    goto LABEL_17;
  }
  if (os_log_type_enabled((os_log_t)_log_2, OS_LOG_TYPE_ERROR))
    -[ContextualPowerModesClient init].cold.2();
  v16 = 0;
LABEL_17:

  return v16;
}

void __34__ContextualPowerModesClient_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (os_log_type_enabled((os_log_t)_log_2, OS_LOG_TYPE_ERROR))
      __26__ResourceConnection_init__block_invoke_cold_1();
    objc_msgSend(WeakRetained, "setConnectionInterrupted:", 1);
  }

}

void __34__ContextualPowerModesClient_init__block_invoke_25(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && os_log_type_enabled((os_log_t)_log_2, OS_LOG_TYPE_ERROR))
    __26__ResourceConnection_init__block_invoke_41_cold_1();

}

void __34__ContextualPowerModesClient_init__block_invoke_27(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  uint8_t v4[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained && objc_msgSend(WeakRetained, "connectionInterrupted"))
  {
    v3 = _log_2;
    if (os_log_type_enabled((os_log_t)_log_2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_2446D7000, v3, OS_LOG_TYPE_DEFAULT, "powerexperienced has restarted", v4, 2u);
    }
    objc_msgSend(v2, "reRegister");
    objc_msgSend(v2, "setConnectionInterrupted:", 0);
  }

}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (OS_dispatch_queue)callback_queue
{
  return self->_callback_queue;
}

- (void)setCallback_queue:(id)a3
{
  objc_storeStrong((id *)&self->_callback_queue, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSSet)interestedModes
{
  return self->_interestedModes;
}

- (void)setInterestedModes:(id)a3
{
  objc_storeStrong((id *)&self->_interestedModes, a3);
}

- (BOOL)connectionInterrupted
{
  return self->_connectionInterrupted;
}

- (void)setConnectionInterrupted:(BOOL)a3
{
  self->_connectionInterrupted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interestedModes, 0);
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_callback_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __68__ContextualPowerModesClient_registerWithIdentifier_queue_callback___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2446D7000, a2, a3, "Failed to connect to powerexperienced %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)init
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_2446D7000, a2, OS_LOG_TYPE_ERROR, "Failed to register for reconnect with powerd 0x%x", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_1();
}

@end
