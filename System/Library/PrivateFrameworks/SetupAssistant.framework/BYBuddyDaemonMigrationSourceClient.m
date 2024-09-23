@implementation BYBuddyDaemonMigrationSourceClient

- (BYBuddyDaemonMigrationSourceClient)init
{
  BYBuddyDaemonMigrationSourceClient *v2;
  BYBuddyDaemonMigrationSourceClient *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BYBuddyDaemonMigrationSourceClient;
  v2 = -[BYBuddyDaemonMigrationSourceClient init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[BYBuddyDaemonMigrationSourceClient _connectToDaemon](v2, "_connectToDaemon");
  return v3;
}

+ (id)clientInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE796178);
}

- (void)cancel
{
  void *v2;
  id v3;

  -[BYBuddyDaemonMigrationSourceClient connection](self, "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

}

- (void)registerAsUserInterfaceHost:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[BYBuddyDaemonMigrationSourceClient connection](self, "connection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerAsUserInterfaceHost:", v4);

}

- (void)launchSetupForMigration
{
  void *v2;
  id v3;

  -[BYBuddyDaemonMigrationSourceClient connection](self, "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "launchSetupForMigration");

}

- (void)setFileTransferTemplate:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[BYBuddyDaemonMigrationSourceClient connection](self, "connection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFileTransferTemplate:", v4);

}

- (void)_connectToDaemon
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.purplebuddy.budd.migration.source.xpc"), 0);
  -[BYBuddyDaemonMigrationSourceClient setConnection:](self, "setConnection:", v3);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE7998F0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BYBuddyDaemonMigrationSourceClient connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteObjectInterface:", v4);

  objc_msgSend((id)objc_opt_class(), "clientInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BYBuddyDaemonMigrationSourceClient connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedInterface:", v6);

  -[BYBuddyDaemonMigrationSourceClient connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setExportedObject:", self);

  -[BYBuddyDaemonMigrationSourceClient connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setInvalidationHandler:", &__block_literal_global_25);

  -[BYBuddyDaemonMigrationSourceClient connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setInterruptionHandler:", &__block_literal_global_61);

  -[BYBuddyDaemonMigrationSourceClient connection](self, "connection");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resume");

}

void __54__BYBuddyDaemonMigrationSourceClient__connectToDaemon__block_invoke()
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
    __54__BYBuddyDaemonMigrationSourceClient__connectToDaemon__block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

void __54__BYBuddyDaemonMigrationSourceClient__connectToDaemon__block_invoke_60()
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
    __54__BYBuddyDaemonMigrationSourceClient__connectToDaemon__block_invoke_60_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

- (void)didUpdateProgress:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BYBuddyDaemonMigrationSourceClient delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceMigrationManager:didUpdateProgress:", 0, v4);

}

- (void)didFinishWithError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BYBuddyDaemonMigrationSourceClient delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceMigrationManager:didCompleteWithError:", 0, v4);

}

- (void)didChangeConnectionInformation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BYBuddyDaemonMigrationSourceClient delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceMigrationManager:didChangeConnectionInformation:", 0, v4);

}

- (BYDeviceMigrationDelegate)delegate
{
  return (BYDeviceMigrationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
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
  objc_destroyWeak((id *)&self->_delegate);
}

void __54__BYBuddyDaemonMigrationSourceClient__connectToDaemon__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1A4E92000, a1, a3, "Migration source client connection invalidated!", a5, a6, a7, a8, 0);
}

void __54__BYBuddyDaemonMigrationSourceClient__connectToDaemon__block_invoke_60_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1A4E92000, a1, a3, "Migration source client connection interruption!", a5, a6, a7, a8, 0);
}

@end
