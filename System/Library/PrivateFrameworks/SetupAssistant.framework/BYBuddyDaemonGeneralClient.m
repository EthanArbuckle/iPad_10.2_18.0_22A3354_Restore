@implementation BYBuddyDaemonGeneralClient

+ (id)factory
{
  return &__block_literal_global_9;
}

BYBuddyDaemonGeneralClient *__37__BYBuddyDaemonGeneralClient_factory__block_invoke()
{
  return objc_alloc_init(BYBuddyDaemonGeneralClient);
}

- (BYBuddyDaemonGeneralClient)init
{
  BYBuddyDaemonGeneralClient *v2;
  uint64_t v3;
  NSLock *connectionLock;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BYBuddyDaemonGeneralClient;
  v2 = -[BYBuddyDaemonGeneralClient init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    connectionLock = v2->_connectionLock;
    v2->_connectionLock = (NSLock *)v3;

    -[NSLock setName:](v2->_connectionLock, "setName:", CFSTR("BYBuddyXPCLock"));
  }
  return v2;
}

- (BOOL)setupAssistantNeedsToRun
{
  void *v2;
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  -[BYBuddyDaemonGeneralClient _daemonConnection](self, "_daemonConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__BYBuddyDaemonGeneralClient_setupAssistantNeedsToRun__block_invoke_8;
  v5[3] = &unk_1E4E27508;
  v5[4] = &v6;
  objc_msgSend(v3, "setupAssistantNeedsToRun:", v5);
  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);

  return (char)v2;
}

void __54__BYBuddyDaemonGeneralClient_setupAssistantNeedsToRun__block_invoke(uint64_t a1, void *a2)
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
    _os_log_error_impl(&dword_1A4E92000, v4, OS_LOG_TYPE_ERROR, "setupAssistantNeedsToRun: budd returned an error: %{public}@", buf, 0xCu);
    if (v5)
    {

    }
  }

}

uint64_t __54__BYBuddyDaemonGeneralClient_setupAssistantNeedsToRun__block_invoke_8(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)ensureSilentLoginUpgrade
{
  void *v2;
  id v3;

  -[BYBuddyDaemonGeneralClient _daemonConnection](self, "_daemonConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_10);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "ensureSilentLoginUpgrade:", &__block_literal_global_13);
}

void __54__BYBuddyDaemonGeneralClient_ensureSilentLoginUpgrade__block_invoke(uint64_t a1, void *a2)
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
    _os_log_error_impl(&dword_1A4E92000, v4, OS_LOG_TYPE_ERROR, "ensureSilentLoginUpgrade: budd returned an error: %{public}@", buf, 0xCu);
    if (v5)
    {

    }
  }

}

void __54__BYBuddyDaemonGeneralClient_ensureSilentLoginUpgrade__block_invoke_11()
{
  NSObject *v0;
  uint8_t v1[16];

  _BYLoggingFacility();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A4E92000, v0, OS_LOG_TYPE_DEFAULT, "ensureSilentLoginUpgrade did complete", v1, 2u);
  }

}

- (void)ensureShortLivedTokenUpgrade
{
  void *v2;
  id v3;

  -[BYBuddyDaemonGeneralClient _daemonConnection](self, "_daemonConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_14);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "ensureShortLivedTokenUpgrade:", &__block_literal_global_16);
}

void __58__BYBuddyDaemonGeneralClient_ensureShortLivedTokenUpgrade__block_invoke(uint64_t a1, void *a2)
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
    _os_log_error_impl(&dword_1A4E92000, v4, OS_LOG_TYPE_ERROR, "ensureShortLivedTokenUpgrade: budd returned an error: %{public}@", buf, 0xCu);
    if (v5)
    {

    }
  }

}

void __58__BYBuddyDaemonGeneralClient_ensureShortLivedTokenUpgrade__block_invoke_15()
{
  NSObject *v0;
  uint8_t v1[16];

  _BYLoggingFacility();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A4E92000, v0, OS_LOG_TYPE_DEFAULT, "ensureShortLivedTokenUpgrade did complete", v1, 2u);
  }

}

- (id)backupMetadata
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

  -[BYBuddyDaemonGeneralClient _daemonConnection](self, "_daemonConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_17);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__BYBuddyDaemonGeneralClient_backupMetadata__block_invoke_18;
  v6[3] = &unk_1E4E27570;
  v6[4] = &v7;
  objc_msgSend(v3, "backupMetadata:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __44__BYBuddyDaemonGeneralClient_backupMetadata__block_invoke(uint64_t a1, void *a2)
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
    _os_log_error_impl(&dword_1A4E92000, v4, OS_LOG_TYPE_ERROR, "backupMetadata: budd returned an error: %{public}@", buf, 0xCu);
    if (v5)
    {

    }
  }

}

void __44__BYBuddyDaemonGeneralClient_backupMetadata__block_invoke_18(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)observeFinishSetupTriggers
{
  void *v2;
  id v3;

  -[BYBuddyDaemonGeneralClient _daemonConnection](self, "_daemonConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_20);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "observeFinishSetupTriggers:", &__block_literal_global_22);
}

void __56__BYBuddyDaemonGeneralClient_observeFinishSetupTriggers__block_invoke(uint64_t a1, void *a2)
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
    _os_log_error_impl(&dword_1A4E92000, v4, OS_LOG_TYPE_ERROR, "observeFinishSetupTriggers: budd returned an error: %{public}@", buf, 0xCu);
    if (v5)
    {

    }
  }

}

void __56__BYBuddyDaemonGeneralClient_observeFinishSetupTriggers__block_invoke_21()
{
  NSObject *v0;
  uint8_t v1[16];

  _BYLoggingFacility();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A4E92000, v0, OS_LOG_TYPE_DEFAULT, "observeFinishSetupTriggers did complete", v1, 2u);
  }

}

- (void)performSilentICDPUpgrade
{
  void *v2;
  id v3;

  -[BYBuddyDaemonGeneralClient _daemonConnection](self, "_daemonConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_23);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "performSilentICDPUpgrade:", &__block_literal_global_25);
}

void __54__BYBuddyDaemonGeneralClient_performSilentICDPUpgrade__block_invoke(uint64_t a1, void *a2)
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
    _os_log_error_impl(&dword_1A4E92000, v4, OS_LOG_TYPE_ERROR, "performSilentICDPUpgrade: budd returned an error: %{public}@", buf, 0xCu);
    if (v5)
    {

    }
  }

}

void __54__BYBuddyDaemonGeneralClient_performSilentICDPUpgrade__block_invoke_24()
{
  NSObject *v0;
  uint8_t v1[16];

  _BYLoggingFacility();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A4E92000, v0, OS_LOG_TYPE_DEFAULT, "performSilentICDPUpgrade did complete", v1, 2u);
  }

}

- (void)deferDataMigratorExit
{
  void *v2;
  id v3;

  -[BYBuddyDaemonGeneralClient _daemonConnection](self, "_daemonConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_26);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "deferDataMigratorExit:", &__block_literal_global_28);
}

void __51__BYBuddyDaemonGeneralClient_deferDataMigratorExit__block_invoke(uint64_t a1, void *a2)
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
    _os_log_error_impl(&dword_1A4E92000, v4, OS_LOG_TYPE_ERROR, "Deferring data migrator exit failed: %{public}@", buf, 0xCu);
    if (v5)
    {

    }
  }

}

void __51__BYBuddyDaemonGeneralClient_deferDataMigratorExit__block_invoke_27()
{
  NSObject *v0;
  uint8_t v1[16];

  _BYLoggingFacility();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A4E92000, v0, OS_LOG_TYPE_DEFAULT, "Deferring data migrator exit completed", v1, 2u);
  }

}

- (void)cancelDataMigratorDeferredExit
{
  void *v2;
  id v3;

  -[BYBuddyDaemonGeneralClient _daemonConnection](self, "_daemonConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_29);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "cancelDataMigratorDeferredExit:", &__block_literal_global_31);
}

void __60__BYBuddyDaemonGeneralClient_cancelDataMigratorDeferredExit__block_invoke(uint64_t a1, void *a2)
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
    _os_log_error_impl(&dword_1A4E92000, v4, OS_LOG_TYPE_ERROR, "Cancelling data migrator deferred exit failed: %{public}@", buf, 0xCu);
    if (v5)
    {

    }
  }

}

void __60__BYBuddyDaemonGeneralClient_cancelDataMigratorDeferredExit__block_invoke_30()
{
  NSObject *v0;
  uint8_t v1[16];

  _BYLoggingFacility();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A4E92000, v0, OS_LOG_TYPE_DEFAULT, "Cancelling data migrator deferred exit completed", v1, 2u);
  }

}

- (void)enrollInSeedProgramNamed:(id)a3 withAssetAudience:(id)a4 programID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[BYBuddyDaemonGeneralClient _daemonConnection](self, "_daemonConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_32);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "enrollInSeedProgramNamed:withAssetAudience:programID:completion:", v10, v9, v8, &__block_literal_global_34);
}

void __83__BYBuddyDaemonGeneralClient_enrollInSeedProgramNamed_withAssetAudience_programID___block_invoke(uint64_t a1, void *a2)
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
    _os_log_error_impl(&dword_1A4E92000, v4, OS_LOG_TYPE_ERROR, "Enroll in seed program named failed: %{public}@", buf, 0xCu);
    if (v5)
    {

    }
  }

}

void __83__BYBuddyDaemonGeneralClient_enrollInSeedProgramNamed_withAssetAudience_programID___block_invoke_33()
{
  NSObject *v0;
  uint8_t v1[16];

  _BYLoggingFacility();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A4E92000, v0, OS_LOG_TYPE_DEFAULT, "Enroll in seed program completed", v1, 2u);
  }

}

- (void)storeAuthenticationContextforApplyPay:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    -[BYBuddyDaemonGeneralClient _daemonConnection](self, "_daemonConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_35);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "storeAuthenticationContextforApplyPay:completion:", v4, &__block_literal_global_37);
  }
}

void __68__BYBuddyDaemonGeneralClient_storeAuthenticationContextforApplyPay___block_invoke(uint64_t a1, void *a2)
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
    _os_log_error_impl(&dword_1A4E92000, v4, OS_LOG_TYPE_ERROR, "Failed to store context for Apple Pay: %{public}@", buf, 0xCu);
    if (v5)
    {

    }
  }

}

void __68__BYBuddyDaemonGeneralClient_storeAuthenticationContextforApplyPay___block_invoke_36()
{
  NSObject *v0;
  uint8_t v1[16];

  _BYLoggingFacility();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A4E92000, v0, OS_LOG_TYPE_DEFAULT, "Successfully stored context for Apple Pay", v1, 2u);
  }

}

- (id)fetchAuthenticationContextForApplePay
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

  -[BYBuddyDaemonGeneralClient _daemonConnection](self, "_daemonConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_38);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__BYBuddyDaemonGeneralClient_fetchAuthenticationContextForApplePay__block_invoke_39;
  v6[3] = &unk_1E4E27698;
  v6[4] = &v7;
  objc_msgSend(v3, "fetchAuthenticationContextForApplePay:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __67__BYBuddyDaemonGeneralClient_fetchAuthenticationContextForApplePay__block_invoke(uint64_t a1, void *a2)
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
    _os_log_error_impl(&dword_1A4E92000, v4, OS_LOG_TYPE_ERROR, "Failed to fetch Apple Pay context: %{public}@", buf, 0xCu);
    if (v5)
    {

    }
  }

}

void __67__BYBuddyDaemonGeneralClient_fetchAuthenticationContextForApplePay__block_invoke_39(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)storeAuthenticationContextforBiometric:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    -[BYBuddyDaemonGeneralClient _daemonConnection](self, "_daemonConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_41);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "storeAuthenticationContextforBiometric:completion:", v4, &__block_literal_global_43);
  }
}

void __69__BYBuddyDaemonGeneralClient_storeAuthenticationContextforBiometric___block_invoke(uint64_t a1, void *a2)
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
    _os_log_error_impl(&dword_1A4E92000, v4, OS_LOG_TYPE_ERROR, "Failed to store context for biometric: %{public}@", buf, 0xCu);
    if (v5)
    {

    }
  }

}

void __69__BYBuddyDaemonGeneralClient_storeAuthenticationContextforBiometric___block_invoke_42()
{
  NSObject *v0;
  uint8_t v1[16];

  _BYLoggingFacility();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A4E92000, v0, OS_LOG_TYPE_DEFAULT, "Successfully stored context for biometric", v1, 2u);
  }

}

- (id)fetchAuthenticationContextForBiometric
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

  -[BYBuddyDaemonGeneralClient _daemonConnection](self, "_daemonConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_44);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__BYBuddyDaemonGeneralClient_fetchAuthenticationContextForBiometric__block_invoke_45;
  v6[3] = &unk_1E4E27698;
  v6[4] = &v7;
  objc_msgSend(v3, "fetchAuthenticationContextForBiometric:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __68__BYBuddyDaemonGeneralClient_fetchAuthenticationContextForBiometric__block_invoke(uint64_t a1, void *a2)
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
    _os_log_error_impl(&dword_1A4E92000, v4, OS_LOG_TYPE_ERROR, "Failed to fetch biometric context: %{public}@", buf, 0xCu);
    if (v5)
    {

    }
  }

}

void __68__BYBuddyDaemonGeneralClient_fetchAuthenticationContextForBiometric__block_invoke_45(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)startExpressSettingsUpload
{
  void *v2;
  id v3;

  -[BYBuddyDaemonGeneralClient _daemonConnection](self, "_daemonConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_46);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "startExpressSettingsUpload");
}

void __56__BYBuddyDaemonGeneralClient_startExpressSettingsUpload__block_invoke(uint64_t a1, void *a2)
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
    _os_log_error_impl(&dword_1A4E92000, v4, OS_LOG_TYPE_ERROR, "Failed to start express settings upload: %{public}@", buf, 0xCu);
    if (v5)
    {

    }
  }

}

- (void)migrateWithStoredMigratorVersion:(unsigned int)a3 userDataDisposition:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  -[BYBuddyDaemonGeneralClient _daemonConnection](self, "_daemonConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_47);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "migrateWithStoredMigratorVersion:userDataDisposition:", v5, v4);
}

void __83__BYBuddyDaemonGeneralClient_migrateWithStoredMigratorVersion_userDataDisposition___block_invoke(uint64_t a1, void *a2)
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
    _os_log_error_impl(&dword_1A4E92000, v4, OS_LOG_TYPE_ERROR, "Failed to migrate with stored migration version: %{public}@", buf, 0xCu);
    if (v5)
    {

    }
  }

}

- (id)_daemonConnection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  void *v7;
  NSXPCConnection *v8;
  uint64_t v9;
  NSXPCConnection *v10;
  NSXPCConnection *v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  -[NSLock lock](self->_connectionLock, "lock");
  connection = self->_connection;
  if (!connection)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.purplebuddy.budd.xpc"), 0);
    v5 = self->_connection;
    self->_connection = v4;

    v6 = self->_connection;
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE799830);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v6, "setRemoteObjectInterface:", v7);

    objc_initWeak(&location, self);
    v8 = self->_connection;
    v9 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __47__BYBuddyDaemonGeneralClient__daemonConnection__block_invoke;
    v15[3] = &unk_1E4E26980;
    objc_copyWeak(&v16, &location);
    -[NSXPCConnection setInterruptionHandler:](v8, "setInterruptionHandler:", v15);
    v10 = self->_connection;
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __47__BYBuddyDaemonGeneralClient__daemonConnection__block_invoke_119;
    v13[3] = &unk_1E4E26980;
    objc_copyWeak(&v14, &location);
    -[NSXPCConnection setInvalidationHandler:](v10, "setInvalidationHandler:", v13);
    -[NSXPCConnection resume](self->_connection, "resume");
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  v11 = connection;
  -[NSLock unlock](self->_connectionLock, "unlock");
  return v11;
}

void __47__BYBuddyDaemonGeneralClient__daemonConnection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *WeakRetained;
  id *v4;
  id v5;
  __int16 v6[8];

  _BYLoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 0;
    _os_log_impl(&dword_1A4E92000, v2, OS_LOG_TYPE_DEFAULT, "Connection to budd was interrupted!", (uint8_t *)v6, 2u);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[1], "lock");
    v5 = v4[2];
    v4[2] = 0;

    objc_msgSend(v4[1], "unlock");
  }

}

void __47__BYBuddyDaemonGeneralClient__daemonConnection__block_invoke_119(uint64_t a1)
{
  NSObject *v2;
  id *WeakRetained;
  id *v4;
  id v5;
  __int16 v6[8];

  _BYLoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 0;
    _os_log_impl(&dword_1A4E92000, v2, OS_LOG_TYPE_DEFAULT, "Connection to budd was invalidated.", (uint8_t *)v6, 2u);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[1], "lock");
    v5 = v4[2];
    v4[2] = 0;

    objc_msgSend(v4[1], "unlock");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_connectionLock, 0);
}

@end
