@implementation BYSettingsManagerClient

- (BYSettingsManagerClient)init
{
  BYSettingsManagerClient *v2;
  BYSettingsManagerClient *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BYSettingsManagerClient;
  v2 = -[BYSettingsManagerClient init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[BYSettingsManagerClient _connectToDaemon](v2, "_connectToDaemon");
  return v3;
}

- (BOOL)hasStashedValuesOnDisk
{
  void *v2;
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  -[BYSettingsManagerClient connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_18);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__BYSettingsManagerClient_hasStashedValuesOnDisk__block_invoke_2;
  v5[3] = &unk_1E4E27508;
  v5[4] = &v6;
  objc_msgSend(v3, "hasStashedValuesOnDisk:", v5);
  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);

  return (char)v2;
}

void __49__BYSettingsManagerClient_hasStashedValuesOnDisk__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  NSObject *v4;
  int v5;
  void *v6;
  void *v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _BYLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    if ((_BYIsInternalInstall() & 1) != 0)
    {
      v5 = 0;
      v6 = v3;
    }
    else if (v3)
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v3, "domain");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v2, objc_msgSend(v3, "code"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 1;
    }
    else
    {
      v5 = 0;
      v6 = 0;
    }
    *(_DWORD *)buf = 138543362;
    v9 = v6;
    _os_log_error_impl(&dword_1A4E92000, v4, OS_LOG_TYPE_ERROR, "Unable to retrieve whether or not stashed values exist on disk: %{public}@", buf, 0xCu);
    if (v5)
    {

    }
  }

}

uint64_t __49__BYSettingsManagerClient_hasStashedValuesOnDisk__block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)_connectToDaemon
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.purplebuddy.budd.settings.xpc"), 0);
  -[BYSettingsManagerClient setConnection:](self, "setConnection:", v3);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE799890);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BYSettingsManagerClient connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteObjectInterface:", v4);

  -[BYSettingsManagerClient connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInvalidationHandler:", &__block_literal_global_53);

  -[BYSettingsManagerClient connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInterruptionHandler:", &__block_literal_global_55_0);

  -[BYSettingsManagerClient connection](self, "connection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resume");

}

void __43__BYSettingsManagerClient__connectToDaemon__block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  _BYLoggingFacility();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __43__BYSettingsManagerClient__connectToDaemon__block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

void __43__BYSettingsManagerClient__connectToDaemon__block_invoke_54()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  _BYLoggingFacility();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __43__BYSettingsManagerClient__connectToDaemon__block_invoke_54_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

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

void __43__BYSettingsManagerClient__connectToDaemon__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1A4E92000, a1, a3, "Settings manager client connection invalidated!", a5, a6, a7, a8, 0);
}

void __43__BYSettingsManagerClient__connectToDaemon__block_invoke_54_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1A4E92000, a1, a3, "Settings manager client connection interrupted!", a5, a6, a7, a8, 0);
}

@end
