@implementation BYBuddyDaemonProximityTargetClient

- (BYBuddyDaemonProximityTargetClient)init
{
  BYBuddyDaemonProximityTargetClient *v2;
  BYBuddyDaemonProximityTargetClient *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BYBuddyDaemonProximityTargetClient;
  v2 = -[BYBuddyDaemonProximityTargetClient init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[BYBuddyDaemonProximityTargetClient connectToDaemon](v2, "connectToDaemon");
  return v3;
}

+ (id)proximityTargetClientInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE78F718);
}

- (void)connectToDaemon
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

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.purplebuddy.budd.proximity.target.xpc"), 0);
  -[BYBuddyDaemonProximityTargetClient setConnection:](self, "setConnection:", v3);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE7997D0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BYBuddyDaemonProximityTargetClient connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteObjectInterface:", v4);

  objc_msgSend((id)objc_opt_class(), "proximityTargetClientInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BYBuddyDaemonProximityTargetClient connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedInterface:", v6);

  -[BYBuddyDaemonProximityTargetClient connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setExportedObject:", self);

  -[BYBuddyDaemonProximityTargetClient connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setInvalidationHandler:", &__block_literal_global_4);

  -[BYBuddyDaemonProximityTargetClient connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setInterruptionHandler:", &__block_literal_global_82);

  -[BYBuddyDaemonProximityTargetClient connection](self, "connection");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resume");

}

void __53__BYBuddyDaemonProximityTargetClient_connectToDaemon__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  _BYLoggingFacility();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A4E92000, v0, OS_LOG_TYPE_DEFAULT, "Proximity target client connection invalidated!", v1, 2u);
  }

}

void __53__BYBuddyDaemonProximityTargetClient_connectToDaemon__block_invoke_81()
{
  NSObject *v0;
  uint8_t v1[16];

  _BYLoggingFacility();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A4E92000, v0, OS_LOG_TYPE_DEFAULT, "Proximity target client connection interruption!", v1, 2u);
  }

}

- (void)beginAdvertisingProximitySetup
{
  void *v2;
  id v3;

  -[BYBuddyDaemonProximityTargetClient connection](self, "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginAdvertisingProximitySetup");

}

- (void)endAdvertisingProximitySetup
{
  void *v2;
  id v3;

  -[BYBuddyDaemonProximityTargetClient connection](self, "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endAdvertisingProximitySetup");

}

- (void)endPairing
{
  void *v2;
  id v3;

  -[BYBuddyDaemonProximityTargetClient connection](self, "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endPairing");

}

- (void)sendData:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[BYBuddyDaemonProximityTargetClient connection](self, "connection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendData:", v4);

}

- (void)hasConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[BYBuddyDaemonProximityTargetClient connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__BYBuddyDaemonProximityTargetClient_hasConnection___block_invoke;
  v8[3] = &unk_1E4E26BB0;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "hasConnection:", v8);

}

uint64_t __52__BYBuddyDaemonProximityTargetClient_hasConnection___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)resumeProximitySetup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[BYBuddyDaemonProximityTargetClient connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__BYBuddyDaemonProximityTargetClient_resumeProximitySetup___block_invoke;
  v8[3] = &unk_1E4E26BD8;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "resumeProximitySetup:", v8);

}

uint64_t __59__BYBuddyDaemonProximityTargetClient_resumeProximitySetup___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)storeInformation:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[BYBuddyDaemonProximityTargetClient connection](self, "connection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_86);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storeInformation:", v4);

}

void __55__BYBuddyDaemonProximityTargetClient_storeInformation___block_invoke(uint64_t a1, void *a2)
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
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
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
    _os_log_impl(&dword_1A4E92000, v4, OS_LOG_TYPE_DEFAULT, "Unable to store proximity information: %{public}@", buf, 0xCu);
    if (v5)
    {

    }
  }

}

- (void)storeHandshake:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[BYBuddyDaemonProximityTargetClient connection](self, "connection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_90);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storeHandshake:", v4);

}

void __53__BYBuddyDaemonProximityTargetClient_storeHandshake___block_invoke(uint64_t a1, void *a2)
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
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
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
    _os_log_impl(&dword_1A4E92000, v4, OS_LOG_TYPE_DEFAULT, "Unable to store proximity handshake: %{public}@", buf, 0xCu);
    if (v5)
    {

    }
  }

}

- (id)fileTransferSessionTemplate
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  -[BYBuddyDaemonProximityTargetClient connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_91);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__BYBuddyDaemonProximityTargetClient_fileTransferSessionTemplate__block_invoke_92;
  v6[3] = &unk_1E4E26C40;
  v6[4] = &v7;
  objc_msgSend(v3, "fileTransferSessionTemplate:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __65__BYBuddyDaemonProximityTargetClient_fileTransferSessionTemplate__block_invoke(uint64_t a1, void *a2)
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
    _os_log_error_impl(&dword_1A4E92000, v4, OS_LOG_TYPE_ERROR, "Unable to begin device to device migration: %{public}@", buf, 0xCu);
    if (v5)
    {

    }
  }

}

void __65__BYBuddyDaemonProximityTargetClient_fileTransferSessionTemplate__block_invoke_92(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)endDeviceToDeviceMigration
{
  void *v2;
  id v3;

  -[BYBuddyDaemonProximityTargetClient connection](self, "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endDeviceToDeviceMigration");

}

- (void)showMigrationInterfaceOnSource
{
  void *v2;
  id v3;

  -[BYBuddyDaemonProximityTargetClient connection](self, "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showMigrationInterfaceOnSource");

}

- (void)suspendConnectionForSoftwareUpdate:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[BYBuddyDaemonProximityTargetClient connection](self, "connection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "suspendConnectionForSoftwareUpdate:", v4);

}

- (void)beginSIMSetupExternalAuthentication
{
  void *v2;
  id v3;

  -[BYBuddyDaemonProximityTargetClient connection](self, "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginSIMSetupExternalAuthentication");

}

- (void)endSIMSetupExternalAuthentication
{
  void *v2;
  id v3;

  -[BYBuddyDaemonProximityTargetClient connection](self, "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endSIMSetupExternalAuthentication");

}

- (void)proximitySetupCompleted:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BYBuddyDaemonProximityTargetClient delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "proximitySetupCompleted:", v4);

}

- (void)displayProximityPinCode:(id)a3 visual:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[BYBuddyDaemonProximityTargetClient delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayProximityPinCode:visual:", v6, v4);

}

- (void)dismissProximityPinCode
{
  id v2;

  -[BYBuddyDaemonProximityTargetClient delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissProximityPinCode");

}

- (void)proximityConnectionPreparing:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BYBuddyDaemonProximityTargetClient delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "proximityConnectionPreparing:", v4);

}

- (void)proximityConnectionInitiated
{
  id v2;

  -[BYBuddyDaemonProximityTargetClient delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "proximityConnectionInitiated");

}

- (void)proximityConnectionTerminated
{
  id v2;

  -[BYBuddyDaemonProximityTargetClient delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "proximityConnectionTerminated");

}

- (void)proximityConnectionReconnected
{
  id v2;

  -[BYBuddyDaemonProximityTargetClient delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "proximityConnectionReconnected");

}

- (void)receivedLanguages:(id)a3 locale:(id)a4 model:(id)a5 deviceClass:(id)a6 accessibilitySettings:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[BYBuddyDaemonProximityTargetClient delegate](self, "delegate");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "receivedLanguages:locale:model:deviceClass:accessibilitySettings:", v16, v15, v14, v13, v12);

}

- (BYBuddyDaemonProximityTargetProtocol)delegate
{
  return (BYBuddyDaemonProximityTargetProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
