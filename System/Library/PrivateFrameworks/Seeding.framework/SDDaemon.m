@implementation SDDaemon

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance_daemon;
}

void __26__SDDaemon_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_daemon;
  sharedInstance_daemon = v0;

}

- (void)dealloc
{
  objc_super v3;

  -[SDDaemon _stopListeningForProfileChanges](self, "_stopListeningForProfileChanges");
  v3.receiver = self;
  v3.super_class = (Class)SDDaemon;
  -[SDDaemon dealloc](&v3, sel_dealloc);
}

- (void)start
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  Log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    v15 = "-[SDDaemon start]";
    _os_log_impl(&dword_1D4F89000, v3, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  v4 = +[SDAnalytics deviceIdentifier](SDAnalytics, "deviceIdentifier");
  +[SDBetaManager sharedManager](SDBetaManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_migrateFromProfilesIfNeeded");

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.seeding.client"));
  -[SDDaemon setListener:](self, "setListener:", v6);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-listener-queue"), CFSTR("com.apple.seeding.client"));
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = dispatch_queue_create((const char *)objc_msgSend(v7, "cStringUsingEncoding:", 4), 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __17__SDDaemon_start__block_invoke;
  block[3] = &unk_1E98CF0A0;
  block[4] = self;
  dispatch_async(v8, block);

  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0CB3368];
    objc_msgSend(MEMORY[0x1E0CB3A38], "defaultStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v9, "addObserverForName:object:queue:usingBlock:", v10, v11, 0, &__block_literal_global_15);

  }
  if (_os_feature_enabled_impl())
    -[SDDaemon _startListeningForProfileChanges](self, "_startListeningForProfileChanges");
  -[SDDaemon checkIn](self, "checkIn");

}

void __17__SDDaemon_start__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;

  Log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __17__SDDaemon_start__block_invoke_cold_2(v2, v3, v4);

  v5 = *(void **)(a1 + 32);
  objc_msgSend(v5, "listener");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", v5);

  Log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __17__SDDaemon_start__block_invoke_cold_1(v7);

  objc_msgSend(*(id *)(a1 + 32), "listener");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resume");

}

void __17__SDDaemon_start__block_invoke_13(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  Log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_impl(&dword_1D4F89000, v3, OS_LOG_TYPE_DEFAULT, "Got an iCKVS notification: %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3A38], "defaultStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "synchronize");

}

- (void)_startListeningForProfileChanges
{
  NSObject *v3;
  int *p_profileToken;
  int profileToken;
  NSObject *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  Log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    v12 = "-[SDDaemon _startListeningForProfileChanges]";
    _os_log_impl(&dword_1D4F89000, v3, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  profileToken = self->_profileToken;
  p_profileToken = &self->_profileToken;
  if (!profileToken)
  {
    Log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4F89000, v6, OS_LOG_TYPE_INFO, "Registering to listen for profile installations.", buf, 2u);
    }

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.seeding"));
    v9 = CFSTR("EnableProfiles");
    v10 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "registerDefaults:", v8);

    notify_register_dispatch("com.apple.ManagedConfiguration.profileListChanged", p_profileToken, MEMORY[0x1E0C80D38], &__block_literal_global_21);
    +[SDProfileUtilities removeSeedProfileIfRestricted](SDProfileUtilities, "removeSeedProfileIfRestricted");

  }
}

uint64_t __44__SDDaemon__startListeningForProfileChanges__block_invoke()
{
  NSObject *v0;
  uint8_t v2[16];

  Log();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1D4F89000, v0, OS_LOG_TYPE_DEFAULT, "Detected installation of a profile, will try removing if it's a seed profile.", v2, 2u);
  }

  return +[SDProfileUtilities removeSeedProfileIfRestricted](SDProfileUtilities, "removeSeedProfileIfRestricted");
}

- (void)_stopListeningForProfileChanges
{
  NSObject *v3;
  int profileToken;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  Log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v5 = 136446210;
    v6 = "-[SDDaemon _stopListeningForProfileChanges]";
    _os_log_impl(&dword_1D4F89000, v3, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v5, 0xCu);
  }

  profileToken = self->_profileToken;
  if (profileToken)
  {
    notify_cancel(profileToken);
    self->_profileToken = 0;
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id WeakRetained;
  BOOL v19;
  NSObject *v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  id v27;
  int v28;
  _QWORD v29[4];
  id v30;
  id v31;
  int v32;
  uint8_t buf[4];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "valueForEntitlement:", CFSTR("com.apple.private.seeding.client"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && (objc_msgSend(v8, "BOOLValue") & 1) != 0)
  {

    v10 = objc_msgSend(v7, "processIdentifier");
    Log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v34 = v10;
      _os_log_impl(&dword_1D4F89000, v11, OS_LOG_TYPE_DEFAULT, "New connection from pid [%ld]", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    +[SDDaemonCommon _allowListedXPCClientInterface](SDDaemonCommon, "_allowListedXPCClientInterface");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRemoteObjectInterface:", v12);

    +[SDDaemonCommon _allowListedXPCServerInterface](SDDaemonCommon, "_allowListedXPCServerInterface");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExportedInterface:", v13);

    objc_msgSend(v7, "setExportedObject:", self);
    objc_msgSend(v7, "description");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __47__SDDaemon_listener_shouldAcceptNewConnection___block_invoke;
    v29[3] = &unk_1E98CF148;
    v16 = v14;
    v30 = v16;
    objc_copyWeak(&v31, (id *)buf);
    v32 = v10;
    objc_msgSend(v7, "setInvalidationHandler:", v29);
    v22 = v15;
    v23 = 3221225472;
    v24 = __47__SDDaemon_listener_shouldAcceptNewConnection___block_invoke_24;
    v25 = &unk_1E98CF148;
    v17 = v16;
    v26 = v17;
    objc_copyWeak(&v27, (id *)buf);
    v28 = v10;
    objc_msgSend(v7, "setInterruptionHandler:", &v22);
    WeakRetained = objc_loadWeakRetained((id *)buf);
    objc_msgSend(WeakRetained, "_storeAppConnection:", v7, v22, v23, v24, v25);

    objc_msgSend(v7, "resume");
    objc_destroyWeak(&v27);

    objc_destroyWeak(&v31);
    objc_destroyWeak((id *)buf);
    v19 = 1;
  }
  else
  {
    Log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[SDDaemon listener:shouldAcceptNewConnection:].cold.1(v7);

    v19 = 0;
  }

  return v19;
}

void __47__SDDaemon_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  Log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1D4F89000, v2, OS_LOG_TYPE_DEFAULT, "connection [%{public}@] was invalidated", (uint8_t *)&v5, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_releaseAppConnectionWithPid:", *(unsigned int *)(a1 + 48));

}

void __47__SDDaemon_listener_shouldAcceptNewConnection___block_invoke_24(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  Log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1D4F89000, v2, OS_LOG_TYPE_DEFAULT, "connection [%{public}@] was interrupted", (uint8_t *)&v5, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_releaseAppConnectionWithPid:", *(unsigned int *)(a1 + 48));

}

- (void)_storeAppConnection:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  SDDaemon *v7;
  void *v8;
  void *v9;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  Log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = objc_msgSend(v4, "processIdentifier");
    _os_log_impl(&dword_1D4F89000, v5, OS_LOG_TYPE_DEFAULT, "Storing connection from PID [%i]", (uint8_t *)v10, 8u);
  }

  if (objc_msgSend(v4, "effectiveUserIdentifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v4, "effectiveUserIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SDDaemon setUserIdentifier:](self, "setUserIdentifier:", v6);

  }
  v7 = self;
  objc_sync_enter(v7);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "processIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SDDaemon appConnections](v7, "appConnections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v4, v8);

  objc_sync_exit(v7);
}

- (void)_releaseAppConnectionWithPid:(int)a3
{
  uint64_t v3;
  SDDaemon *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _DWORD v8[2];
  uint64_t v9;

  v3 = *(_QWORD *)&a3;
  v9 = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  Log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl(&dword_1D4F89000, v5, OS_LOG_TYPE_DEFAULT, "Clearing connection [%i]", (uint8_t *)v8, 8u);
  }

  -[SDDaemon appConnections](v4, "appConnections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v7);

  objc_sync_exit(v4);
}

- (id)_connectionForPid:(id)a3
{
  id v4;
  SDDaemon *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[SDDaemon appConnections](v5, "appConnections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  return v7;
}

- (id)remoteObjectProxyForPID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[SDDaemon _connectionForPid:](self, "_connectionForPid:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __36__SDDaemon_remoteObjectProxyForPID___block_invoke;
  v9[3] = &unk_1E98CF170;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __36__SDDaemon_remoteObjectProxyForPID___block_invoke(uint64_t a1)
{
  NSObject *v2;

  Log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __36__SDDaemon_remoteObjectProxyForPID___block_invoke_cold_1(a1);

}

- (void)checkIn
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD handler[5];
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[SDDaemon _verifyCurrentDevice](self, "_verifyCurrentDevice");
  Log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    +[SDDevice _currentDevice](SDDevice, "_currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v9 = v5;
    _os_log_impl(&dword_1D4F89000, v3, OS_LOG_TYPE_DEFAULT, "Checking in device %@", buf, 0xCu);

  }
  v6 = (void *)*MEMORY[0x1E0C80748];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __19__SDDaemon_checkIn__block_invoke;
  handler[3] = &unk_1E98CF198;
  handler[4] = self;
  xpc_activity_register("com.apple.betaenrollmentd.verify", v6, handler);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", MEMORY[0x1E0C80D38], &__block_literal_global_32);
}

void __19__SDDaemon_checkIn__block_invoke(uint64_t a1, xpc_activity_t activity)
{
  xpc_activity_state_t state;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  state = xpc_activity_get_state(activity);
  if (state == 2)
  {
    Log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1D4F89000, v5, OS_LOG_TYPE_DEFAULT, "Verifying device enrollment on XPC Activity schedule.", v6, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_verifyCurrentDevice");
  }
  else if (!state)
  {
    Log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4F89000, v4, OS_LOG_TYPE_DEFAULT, "Verify activity checking in.", buf, 2u);
    }

  }
}

- (void)_verifyCurrentDevice
{
  NSObject *v2;
  void *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  Log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v4 = 136446210;
    v5 = "-[SDDaemon _verifyCurrentDevice]";
    _os_log_impl(&dword_1D4F89000, v2, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v4, 0xCu);
  }

  +[SDBetaManager sharedManager](SDBetaManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ensureThisRunsAfterMigration:", &__block_literal_global_33);

}

void __32__SDDaemon__verifyCurrentDevice__block_invoke()
{
  id v0;

  +[SDDevice _currentDevice](SDDevice, "_currentDevice");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_verifyEnrollmentWithUserIdentifier:completion:", 0, &__block_literal_global_35);

}

void __32__SDDaemon__verifyCurrentDevice__block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  Log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = CFSTR("NOT valid, unenrolling.");
    if (a2)
      v4 = CFSTR("valid");
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_1D4F89000, v3, OS_LOG_TYPE_DEFAULT, "Verified enrollment as %{public}@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)getCurrentDevice:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  Log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    v10 = "-[SDDaemon getCurrentDevice:]";
    _os_log_impl(&dword_1D4F89000, v4, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  +[SDBetaManager sharedManager](SDBetaManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __29__SDDaemon_getCurrentDevice___block_invoke;
  v7[3] = &unk_1E98CF240;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "ensureThisRunsAfterMigration:", v7);

}

void __29__SDDaemon_getCurrentDevice___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[SDDevice _currentDevice](SDDevice, "_currentDevice");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

- (void)enrollDevice:(id)a3 inProgram:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  SDDaemon *v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  Log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    v22 = "-[SDDaemon enrollDevice:inProgram:completion:]";
    _os_log_impl(&dword_1D4F89000, v11, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  +[SDBetaManager sharedManager](SDBetaManager, "sharedManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __46__SDDaemon_enrollDevice_inProgram_completion___block_invoke;
  v16[3] = &unk_1E98CF268;
  v17 = v8;
  v18 = v9;
  v19 = self;
  v20 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  objc_msgSend(v12, "ensureThisRunsAfterMigration:", v16);

}

void __46__SDDaemon_enrollDevice_inProgram_completion___block_invoke(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  void *v4;
  char v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;

  v2 = (id *)(a1 + 32);
  v3 = objc_msgSend(*(id *)(a1 + 32), "platform");
  if (v3 != objc_msgSend(*(id *)(a1 + 40), "platform"))
  {
    +[SDSeedingLogging fwHandle](SDSeedingLogging, "fwHandle");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __46__SDDaemon_enrollDevice_inProgram_completion___block_invoke_cold_3(v2, (id *)(a1 + 40), v14);

    SDErrorForBetaManagerErrorType(5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(_QWORD, void *))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v15);
    goto LABEL_12;
  }
  +[SDBetaManager sharedManager](SDBetaManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_isEnrollmentAllowedByDeviceManagement_legacy");

  if ((v5 & 1) == 0)
  {
    Log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __46__SDDaemon_enrollDevice_inProgram_completion___block_invoke_cold_2(v6, v16, v17, v18, v19, v20, v21, v22);
    goto LABEL_11;
  }
  if (+[SDMDMConfiguratorDaemon isBetaEnrollmentDisabled](SDMDMConfiguratorDaemon, "isBetaEnrollmentDisabled"))
  {
    Log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __46__SDDaemon_enrollDevice_inProgram_completion___block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
LABEL_11:

    v23 = *(_QWORD *)(a1 + 56);
    SDErrorForBetaManagerErrorType(13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v23 + 16))(v23, v15);
LABEL_12:

    return;
  }
  v24 = *(void **)(a1 + 32);
  v25 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "userIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "_enrollInBetaProgram:userIdentifier:", v25, v26);

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)getDevicesForPlatforms:(unint64_t)a3 completion:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  unint64_t v10;

  v5 = a4;
  +[SDBetaManager sharedManager](SDBetaManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__SDDaemon_getDevicesForPlatforms_completion___block_invoke;
  v8[3] = &unk_1E98CF290;
  v9 = v5;
  v10 = a3;
  v7 = v5;
  objc_msgSend(v6, "ensureThisRunsAfterMigration:", v8);

}

void __46__SDDaemon_getDevicesForPlatforms_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[SDDevice _devicesMatchingPlatforms:](SDDevice, "_devicesMatchingPlatforms:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

- (void)queryProgramsForSystemAccountsWithPlatforms:(unint64_t)a3 completion:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  Log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = 136446210;
    v9 = "-[SDDaemon queryProgramsForSystemAccountsWithPlatforms:completion:]";
    _os_log_impl(&dword_1D4F89000, v6, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v8, 0xCu);
  }

  +[SDBetaManager sharedManager](SDBetaManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_queryProgramsForSystemAccountsWithPlatforms:completion:", a3, v5);

}

- (void)canDeviceEnrollInBetaUpdates:(id)a3 completion:(id)a4
{
  void (**v4)(id, uint64_t);
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t))a4;
  Log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v8 = 136446210;
    v9 = "-[SDDaemon canDeviceEnrollInBetaUpdates:completion:]";
    _os_log_impl(&dword_1D4F89000, v5, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v8, 0xCu);
  }

  +[SDBetaManager sharedManager](SDBetaManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_canCurrentDeviceEnrollInBetaUpdates");

  v4[2](v4, v7);
}

- (void)isDeviceEnrolledInBetaProgram:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  Log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    v15 = "-[SDDaemon isDeviceEnrolledInBetaProgram:completion:]";
    _os_log_impl(&dword_1D4F89000, v7, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  +[SDBetaManager sharedManager](SDBetaManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__SDDaemon_isDeviceEnrolledInBetaProgram_completion___block_invoke;
  v11[3] = &unk_1E98CF2B8;
  v12 = v5;
  v13 = v6;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v8, "ensureThisRunsAfterMigration:", v11);

}

uint64_t __53__SDDaemon_isDeviceEnrolledInBetaProgram_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_isEnrolled");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)unenrollDevice:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  SDDaemon *v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  Log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v17 = "-[SDDaemon unenrollDevice:completion:]";
    _os_log_impl(&dword_1D4F89000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  +[SDBetaManager sharedManager](SDBetaManager, "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __38__SDDaemon_unenrollDevice_completion___block_invoke;
  v12[3] = &unk_1E98CF2E0;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v9, "ensureThisRunsAfterMigration:", v12);

}

uint64_t __38__SDDaemon_unenrollDevice_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "userIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_unenrollWithUserIdentifier:", v3);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)canFileFeedbackOnDevice:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  Log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    v15 = "-[SDDaemon canFileFeedbackOnDevice:completion:]";
    _os_log_impl(&dword_1D4F89000, v7, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  +[SDBetaManager sharedManager](SDBetaManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__SDDaemon_canFileFeedbackOnDevice_completion___block_invoke;
  v11[3] = &unk_1E98CF308;
  v12 = v5;
  v13 = v6;
  v9 = v5;
  v10 = v6;
  objc_msgSend(v8, "ensureThisRunsAfterMigration:", v11);

}

uint64_t __47__SDDaemon_canFileFeedbackOnDevice_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "_canFileFeedback"), 0);
}

- (void)enrolledBetaProgramForDevice:(id)a3 completion:(id)a4
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  Log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    v11 = "-[SDDaemon enrolledBetaProgramForDevice:completion:]";
    _os_log_impl(&dword_1D4F89000, v5, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  +[SDBetaManager sharedManager](SDBetaManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__SDDaemon_enrolledBetaProgramForDevice_completion___block_invoke;
  v8[3] = &unk_1E98CF240;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "ensureThisRunsAfterMigration:", v8);

}

void __52__SDDaemon_enrolledBetaProgramForDevice_completion___block_invoke(uint64_t a1)
{
  id v2;

  +[SDBetaManager _currentBetaProgram](SDBetaManager, "_currentBetaProgram");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)getCurrentSeedingAppleIDForDevice:(id)a3 completion:(id)a4
{
  void (**v4)(id, void *, _QWORD);
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _QWORD))a4;
  Log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v8 = 136446210;
    v9 = "-[SDDaemon getCurrentSeedingAppleIDForDevice:completion:]";
    _os_log_impl(&dword_1D4F89000, v5, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v8, 0xCu);
  }

  +[SDBetaManager sharedManager](SDBetaManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_seedingAppleIDUsername");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v7, 0);

}

- (void)getCurrentPrimaryAppleIDForDevice:(id)a3 completion:(id)a4
{
  void (**v4)(id, void *);
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a4;
  Log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v8 = 136446210;
    v9 = "-[SDDaemon getCurrentPrimaryAppleIDForDevice:completion:]";
    _os_log_impl(&dword_1D4F89000, v5, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v8, 0xCu);
  }

  +[SDBetaManager sharedManager](SDBetaManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_deviceAppleIDUsername");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v7);

}

- (void)setAppleAccountIdentifierFromAlternateDSID:(id)a3 forDevice:(id)a4 completion:(id)a5
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  v7 = a3;
  Log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    v14 = "-[SDDaemon setAppleAccountIdentifierFromAlternateDSID:forDevice:completion:]";
    _os_log_impl(&dword_1D4F89000, v8, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  +[SDBetaManager sharedManager](SDBetaManager, "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__SDDaemon_setAppleAccountIdentifierFromAlternateDSID_forDevice_completion___block_invoke;
  v11[3] = &unk_1E98CF330;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "_saveAppleAccountIdentifierWithAlternateDSID:completion:", v7, v11);

}

uint64_t __76__SDDaemon_setAppleAccountIdentifierFromAlternateDSID_forDevice_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deleteSeedingAppleAccountForDevice:(id)a3 completion:(id)a4
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  Log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    v11 = "-[SDDaemon deleteSeedingAppleAccountForDevice:completion:]";
    _os_log_impl(&dword_1D4F89000, v5, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  +[SDBetaManager sharedManager](SDBetaManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__SDDaemon_deleteSeedingAppleAccountForDevice_completion___block_invoke;
  v8[3] = &unk_1E98CF330;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "_deleteSeedingAppleAccountWithCompletion:", v8);

}

uint64_t __58__SDDaemon_deleteSeedingAppleAccountForDevice_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)isDeviceUsingSeedingAppleID:(id)a3 completion:(id)a4
{
  void (**v4)(id, uint64_t);
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t))a4;
  Log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 136446210;
    v8 = "-[SDDaemon isDeviceUsingSeedingAppleID:completion:]";
    _os_log_impl(&dword_1D4F89000, v5, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v7, 0xCu);
  }

  +[SDBetaManager sharedManager](SDBetaManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, objc_msgSend(v6, "_isUsingSeedingAppleID"));

}

- (void)invalidateDaemonCacheWithCompletion:(id)a3
{
  void (**v3)(id, _QWORD);
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, _QWORD))a3;
  Log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = 136446210;
    v7 = "-[SDDaemon invalidateDaemonCacheWithCompletion:]";
    _os_log_impl(&dword_1D4F89000, v4, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v6, 0xCu);
  }

  +[SDBetaManager sharedManager](SDBetaManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidateCache");

  v3[2](v3, 0);
}

- (void)enrollInProgramWithToken:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  Log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136446467;
    v10 = "-[SDDaemon enrollInProgramWithToken:completion:]";
    v11 = 2113;
    v12 = v5;
    _os_log_impl(&dword_1D4F89000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}s token [%{private}@]", (uint8_t *)&v9, 0x16u);
  }

  +[SDBetaManager sharedManager](SDBetaManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enrollInProgramWithToken:userIdentifier:completion:", v5, 0, v6);

}

- (void)configureWithOfferProgramTokens:(id)a3 requireProgramToken:(id)a4 enrollmentPolicy:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  int v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = a4;
  v12 = a3;
  Log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136446210;
    v16 = "-[SDDaemon configureWithOfferProgramTokens:requireProgramToken:enrollmentPolicy:completion:]";
    _os_log_impl(&dword_1D4F89000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}s", (uint8_t *)&v15, 0xCu);
  }

  -[SDDaemon userIdentifier](self, "userIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[SDMDMConfiguratorDaemon configureWithOfferProgramTokens:requireProgramToken:enrollmentPolicy:userIdentifier:completion:](SDMDMConfiguratorDaemon, "configureWithOfferProgramTokens:requireProgramToken:enrollmentPolicy:userIdentifier:completion:", v12, v11, a5, v14, v10);

}

- (void)loadMDMConfigurationWithCompletion:(id)a3
{
  void (**v3)(id, id, void *);
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, id, void *))a3;
  Log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v9 = "-[SDDaemon loadMDMConfigurationWithCompletion:]";
    _os_log_impl(&dword_1D4F89000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}s", buf, 0xCu);
  }

  v7 = 0;
  +[SDPersistence loadMDMConfigurationWithError:](SDPersistence, "loadMDMConfigurationWithError:", &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7;
  v3[2](v3, v6, v5);

}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 16, 1);
}

- (void)setListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableDictionary)appConnections
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAppConnections:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSNumber)userIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUserIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (int)profileToken
{
  return self->_profileToken;
}

- (void)setProfileToken:(int)a3
{
  self->_profileToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_appConnections, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

void __17__SDDaemon_start__block_invoke_cold_1(NSObject *a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v2;
  OUTLINED_FUNCTION_3(&dword_1D4F89000, a1, v3, "resuming listener from thread %@", (uint8_t *)&v4);

  OUTLINED_FUNCTION_1();
}

void __17__SDDaemon_start__block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = CFSTR("com.apple.seeding.client");
  OUTLINED_FUNCTION_3(&dword_1D4F89000, a1, a3, "listening for service %@", (uint8_t *)&v3);
}

- (void)listener:(void *)a1 shouldAcceptNewConnection:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "processIdentifier");
  OUTLINED_FUNCTION_0(&dword_1D4F89000, v1, v2, "A client [%ld] tried to use Seeding.fmwk but is not entitled.", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_1();
}

void __36__SDDaemon_remoteObjectProxyForPID___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "stringValue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_1D4F89000, v2, v3, "XPC object could not be fetched for pid [%{public}@]", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

void __46__SDDaemon_enrollDevice_inProgram_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D4F89000, a1, a3, "Beta enrollment is restricted. Will not enroll in program.", a5, a6, a7, a8, 0);
}

void __46__SDDaemon_enrollDevice_inProgram_completion___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D4F89000, a1, a3, "Beta enrollment is restricted (legacy). Will not enroll in program.", a5, a6, a7, a8, 0);
}

void __46__SDDaemon_enrollDevice_inProgram_completion___block_invoke_cold_3(id *a1, id *a2, NSObject *a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(*a1, "platform");
  v6 = objc_msgSend(*a2, "platform");
  v7 = 134218240;
  v8 = v5;
  v9 = 2048;
  v10 = v6;
  _os_log_error_impl(&dword_1D4F89000, a3, OS_LOG_TYPE_ERROR, "Attempting to enroll device in a non-matching platform: device is [%ld] and program is [%ld].", (uint8_t *)&v7, 0x16u);
}

@end
