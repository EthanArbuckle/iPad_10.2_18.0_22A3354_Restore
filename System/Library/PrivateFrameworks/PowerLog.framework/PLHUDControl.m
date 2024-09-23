@implementation PLHUDControl

- (void)invalidate
{
  -[BSServiceConnectionClient invalidate](self->_connection, "invalidate");
}

- (void)_ensureConnection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BSServiceConnectionClient *v7;
  BSServiceConnectionClient *connection;
  BSServiceConnectionClient *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  PLHUDControl *v16;
  id v17;
  id location;

  if (!self->_connection)
  {
    objc_msgSend(MEMORY[0x1E0D03450], "endpointForMachName:service:instance:", CFSTR("com.apple.internal.PerfPowerHUD.service"), CFSTR("com.apple.internal.PerfPowerHUD.service.hudctl"), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D03438], "interfaceWithIdentifier:", CFSTR("com.apple.internal.PerfPowerHUD.service.hudctl"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D017E8], "protocolForProtocol:", &unk_1EE534490);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setClient:", v5);

    objc_msgSend(MEMORY[0x1E0D017E8], "protocolForProtocol:", &unk_1EE5344F0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setServer:", v6);

    objc_msgSend(v4, "setClientMessagingExpectation:", 0);
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0D03440], "connectionWithEndpoint:", v3);
    v7 = (BSServiceConnectionClient *)objc_claimAutoreleasedReturnValue();
    connection = self->_connection;
    self->_connection = v7;

    v9 = self->_connection;
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __33__PLHUDControl__ensureConnection__block_invoke;
    v14 = &unk_1E4166750;
    v10 = v4;
    v15 = v10;
    v16 = self;
    objc_copyWeak(&v17, &location);
    -[BSServiceConnectionClient configureConnection:](v9, "configureConnection:", &v11);
    -[BSServiceConnectionClient activate](self->_connection, "activate", v11, v12, v13, v14);
    objc_destroyWeak(&v17);

    objc_destroyWeak(&location);
  }
}

void __33__PLHUDControl__ensureConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v3 = a2;
  objc_msgSend(v3, "setInterface:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0D03480], "userInitiated");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__PLHUDControl__ensureConnection__block_invoke_2;
  v5[3] = &unk_1E4166728;
  objc_copyWeak(&v6, (id *)(a1 + 48));
  objc_msgSend(v3, "setInvalidationHandler:", v5);
  objc_destroyWeak(&v6);

}

void __33__PLHUDControl__ensureConnection__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __33__PLHUDControl__ensureConnection__block_invoke_2_cold_1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
    objc_msgSend(WeakRetained, "connection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "invalidate");

    objc_msgSend(WeakRetained, "setConnection:", 0);
  }

}

- (void)dealloc
{
  objc_super v3;

  -[BSServiceConnectionClient invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PLHUDControl;
  -[PLHUDControl dealloc](&v3, sel_dealloc);
}

- (id)_hudServer
{
  BSServiceConnectionClient *connection;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[PLHUDControl _ensureConnection](self, "_ensureConnection");
  connection = self->_connection;
  objc_msgSend(MEMORY[0x1E0D87CD8], "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("BasicAngelIPC"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSServiceConnectionClient remoteTargetWithLaunchingAssertionAttributes:](connection, "remoteTargetWithLaunchingAssertionAttributes:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)internalHUDEnabled
{
  void *v2;
  char v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v13;

  -[PLHUDControl _hudServer](self, "_hudServer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v3 = objc_msgSend(v2, "isHUDVisibleWithError:", &v13);
  v4 = v13;

  if (v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[PLHUDControl internalHUDEnabled].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

  return v3;
}

- (void)setInternalHUDEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  v3 = a3;
  -[PLHUDControl _hudServer](self, "_hudServer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(v4, "setHUDVisible:withError:", v5, &v7);
  v6 = v7;

  if (v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[PLHUDControl setInternalHUDEnabled:].cold.1(v3, (uint64_t)v6);

}

- (BSServiceConnectionClient)connection
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

void __33__PLHUDControl__ensureConnection__block_invoke_2_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_19EA99000, MEMORY[0x1E0C81028], a3, "HUD: Invalidated/Interrupted connection %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)internalHUDEnabled
{
  OUTLINED_FUNCTION_0_2(&dword_19EA99000, MEMORY[0x1E0C81028], a3, "HUD: service encountered error when querying state %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setInternalHUDEnabled:(char)a1 .cold.1(char a1, uint64_t a2)
{
  _DWORD v2[2];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109378;
  v2[1] = a1 & 1;
  v3 = 2112;
  v4 = a2;
  _os_log_error_impl(&dword_19EA99000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "HUD: service encountered error when setting enabled:%d %@", (uint8_t *)v2, 0x12u);
  OUTLINED_FUNCTION_1();
}

@end
