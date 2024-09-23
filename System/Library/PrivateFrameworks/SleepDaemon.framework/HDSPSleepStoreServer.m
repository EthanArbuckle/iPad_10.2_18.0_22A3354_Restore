@implementation HDSPSleepStoreServer

uint64_t __67__HDSPSleepStoreServer__performWhenEnvironmentIsReady_withContext___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __56__HDSPSleepStoreServer__performWhenClientIsReady_block___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __55__HDSPSleepStoreServer_getSleepSettingsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543618;
    v13 = (id)objc_opt_class();
    v14 = 2114;
    v15 = v3;
    v5 = v13;
    _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] performing request for sleep settings from: %{public}@", (uint8_t *)&v12, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "environment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sleepScheduleModelManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sleepSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  HKSPLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_opt_class();
    v12 = 138543618;
    v13 = v10;
    v14 = 2114;
    v15 = v3;
    v11 = v10;
    _os_log_impl(&dword_21610C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] completing request for sleep settings from: %{public}@", (uint8_t *)&v12, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __56__HDSPSleepStoreServer__performWhenClientIsReady_block___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __56__HDSPSleepStoreServer__performWhenClientIsReady_block___block_invoke_2;
  v3[3] = &unk_24D4E4520;
  v5 = *(id *)(a1 + 56);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_performWhenEnvironmentIsReady:withContext:", v3, *(_QWORD *)(a1 + 48));

}

- (void)_performWhenEnvironmentIsReady:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __67__HDSPSleepStoreServer__performWhenEnvironmentIsReady_withContext___block_invoke;
  v10[3] = &unk_24D4E4570;
  v11 = v6;
  v9 = v6;
  objc_msgSend(WeakRetained, "performWhenEnvironmentIsReady:withContext:", v10, v7);

}

- (void)getSleepSettingsWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  id WeakRetained;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  void (**v14)(id, _QWORD, void *);
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, void *))a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v6 = objc_msgSend(WeakRetained, "isDisabled");

  if (v6)
  {
    HKSPLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v16 = (id)objc_opt_class();
      v12 = v16;
      _os_log_error_impl(&dword_21610C000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sleep.HDSPSleepStoreServer"), 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v8);
  }
  else
  {
    -[HDSPSleepStoreServer connectionListener](self, "connectionListener");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    HKSPLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v16 = (id)objc_opt_class();
      v17 = 2114;
      v18 = v8;
      v11 = v16;
      _os_log_impl(&dword_21610C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] request received for sleep settings from: %{public}@", buf, 0x16u);

    }
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __55__HDSPSleepStoreServer_getSleepSettingsWithCompletion___block_invoke;
    v13[3] = &unk_24D4E45C0;
    v13[4] = self;
    v14 = v4;
    -[HDSPSleepStoreServer _performWhenClientIsReady:block:](self, "_performWhenClientIsReady:block:", v8, v13);

  }
}

- (void)getSleepEventRecordWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  id WeakRetained;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  void (**v14)(id, _QWORD, void *);
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, void *))a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v6 = objc_msgSend(WeakRetained, "isDisabled");

  if (v6)
  {
    HKSPLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v16 = (id)objc_opt_class();
      v12 = v16;
      _os_log_error_impl(&dword_21610C000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sleep.HDSPSleepStoreServer"), 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v8);
  }
  else
  {
    -[HDSPSleepStoreServer connectionListener](self, "connectionListener");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    HKSPLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v16 = (id)objc_opt_class();
      v17 = 2114;
      v18 = v8;
      v11 = v16;
      _os_log_impl(&dword_21610C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] request received for sleep event record from: %{public}@", buf, 0x16u);

    }
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __58__HDSPSleepStoreServer_getSleepEventRecordWithCompletion___block_invoke;
    v13[3] = &unk_24D4E45C0;
    v13[4] = self;
    v14 = v4;
    -[HDSPSleepStoreServer _performWhenClientIsReady:block:](self, "_performWhenClientIsReady:block:", v8, v13);

  }
}

- (void)connectWithCompletion:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *, _QWORD))a3;
  -[HDSPSleepStoreServer connectionListener](self, "connectionListener");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  HKSPLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543618;
    v12 = (id)objc_opt_class();
    v13 = 2114;
    v14 = v6;
    v8 = v12;
    _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] connect received from %{public}@", (uint8_t *)&v11, 0x16u);

  }
  -[HDSPSleepStoreServer syncAnchorContainer](self, "syncAnchorContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "inMemoryCopy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v10, 0);

}

- (HKSPXPCConnectionListener)connectionListener
{
  return self->_connectionListener;
}

- (HKSPPersistentSyncAnchorContainer)syncAnchorContainer
{
  return self->_syncAnchorContainer;
}

- (void)_performWhenClientIsReady:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    +[HDSPEnvironmentContext contextWithSource:](HDSPEnvironmentContext, "contextWithSource:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clientIdentifierProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __56__HDSPSleepStoreServer__performWhenClientIsReady_block___block_invoke;
    v19[3] = &unk_24D4E4548;
    v19[4] = self;
    v22 = v7;
    v20 = v6;
    v21 = v8;
    v10 = v8;
    v11 = v7;
    v12 = (id)objc_msgSend(v9, "addCompletionBlock:", v19);

  }
  else
  {
    HKSPLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v24 = (id)objc_opt_class();
      v15 = v24;
      _os_log_error_impl(&dword_21610C000, v13, OS_LOG_TYPE_ERROR, "[%{public}@] client was nil!", buf, 0xCu);

    }
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __56__HDSPSleepStoreServer__performWhenClientIsReady_block___block_invoke_192;
    v16[3] = &unk_24D4E4520;
    v17 = 0;
    v18 = v7;
    v14 = v7;
    -[HDSPSleepStoreServer _performWhenEnvironmentIsReady:](self, "_performWhenEnvironmentIsReady:", v16);

    v10 = v18;
  }

}

void __58__HDSPSleepStoreServer_getSleepEventRecordWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543618;
    v13 = (id)objc_opt_class();
    v14 = 2114;
    v15 = v3;
    v5 = v13;
    _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] performing request for sleep event record from: %{public}@", (uint8_t *)&v12, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "environment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sleepScheduleModelManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sleepEventRecord");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  HKSPLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_opt_class();
    v12 = 138543618;
    v13 = v10;
    v14 = 2114;
    v15 = v3;
    v11 = v10;
    _os_log_impl(&dword_21610C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] completing request for sleep event record from: %{public}@", (uint8_t *)&v12, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (HDSPEnvironment)environment
{
  return (HDSPEnvironment *)objc_loadWeakRetained((id *)&self->_environment);
}

- (void)connectionListenerDidRemoveClient:(id)a3
{
  -[HDSPProcessStateManager stopMonitoringProcessState:](self->_processStateManager, "stopMonitoringProcessState:", objc_msgSend(a3, "processID"));
}

- (void)connectionListenerDidAddClient:(id)a3
{
  -[HDSPProcessStateManager startMonitoringProcessState:](self->_processStateManager, "startMonitoringProcessState:", objc_msgSend(a3, "processID"));
}

- (HDSPSleepStoreServer)initWithEnvironment:(id)a3
{
  id v4;
  HDSPProcessStateManager *v5;
  HDSPSleepStoreServer *v6;

  v4 = a3;
  v5 = objc_alloc_init(HDSPProcessStateManager);
  v6 = -[HDSPSleepStoreServer initWithEnvironment:connectionListenerProvider:processStateManager:](self, "initWithEnvironment:connectionListenerProvider:processStateManager:", v4, &__block_literal_global_3, v5);

  return v6;
}

id __44__HDSPSleepStoreServer_initWithEnvironment___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)MEMORY[0x24BEA9970];
  v3 = *MEMORY[0x24BEA9668];
  v4 = a2;
  HKSPSleepClientInterface();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPSleepServerInterface();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoForMachServiceName:remoteObjectInterface:exportedObject:exportedObjectInterface:lifecycleNotification:requiredEntitlement:options:", v3, v5, v4, v6, *MEMORY[0x24BEA9660], *MEMORY[0x24BEA9588], 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEA9978], "listenerWithConnectionInfo:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (HDSPSleepStoreServer)initWithEnvironment:(id)a3 connectionListenerProvider:(id)a4 processStateManager:(id)a5
{
  id v8;
  void (**v9)(id, HDSPSleepStoreServer *);
  id v10;
  HDSPSleepStoreServer *v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  HKSPXPCConnectionListener *connectionListener;
  id v17;
  objc_class *v18;
  void *v19;
  id WeakRetained;
  void *v21;
  uint64_t v22;
  HKSPPersistentSyncAnchorContainer *syncAnchorContainer;
  HDSPSleepStoreServer *v24;
  objc_super v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  HDSPSleepStoreServer *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, HDSPSleepStoreServer *))a4;
  v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)HDSPSleepStoreServer;
  v11 = -[HDSPSleepStoreServer init](&v26, sel_init);
  if (v11)
  {
    HKSPLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v28 = v13;
      v29 = 2048;
      v30 = v11;
      v14 = v13;
      _os_log_impl(&dword_21610C000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] initializing...", buf, 0x16u);

    }
    objc_storeWeak((id *)&v11->_environment, v8);
    if (v9)
    {
      v9[2](v9, v11);
      v15 = objc_claimAutoreleasedReturnValue();
      connectionListener = v11->_connectionListener;
      v11->_connectionListener = (HKSPXPCConnectionListener *)v15;
    }
    else
    {
      connectionListener = v11->_connectionListener;
      v11->_connectionListener = 0;
    }

    -[HKSPXPCConnectionListener setDelegate:](v11->_connectionListener, "setDelegate:", v11);
    objc_storeStrong((id *)&v11->_processStateManager, a5);
    -[HDSPProcessStateManager setDelegate:](v11->_processStateManager, "setDelegate:", v11);
    v17 = objc_alloc(MEMORY[0x24BEA98D0]);
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&v11->_environment);
    objc_msgSend(WeakRetained, "userDefaults");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v17, "initWithIdentifier:defaults:", v19, v21);
    syncAnchorContainer = v11->_syncAnchorContainer;
    v11->_syncAnchorContainer = (HKSPPersistentSyncAnchorContainer *)v22;

    v24 = v11;
  }

  return v11;
}

- (void)startListening
{
  NSObject *v3;
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = (id)objc_opt_class();
    v4 = v6;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] startListening", (uint8_t *)&v5, 0xCu);

  }
  -[HKSPXPCConnectionListener startListening](self->_connectionListener, "startListening");
}

- (void)_performWhenCurrentClientIsReady:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HDSPSleepStoreServer connectionListener](self, "connectionListener");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentClient");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[HDSPSleepStoreServer _performWhenClientIsReady:block:](self, "_performWhenClientIsReady:block:", v6, v4);
}

uint64_t __56__HDSPSleepStoreServer__performWhenClientIsReady_block___block_invoke_192(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_performWhenEnvironmentIsReady:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HDSPSleepStoreServer connectionListener](self, "connectionListener");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentClient");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  +[HDSPEnvironmentContext contextWithSource:](HDSPEnvironmentContext, "contextWithSource:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPSleepStoreServer _performWhenEnvironmentIsReady:withContext:](self, "_performWhenEnvironmentIsReady:withContext:", v4, v6);

}

- (void)environmentWillBecomeReady:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543362;
    v13 = (id)objc_opt_class();
    v6 = v13;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] environmentWillBecomeReady", (uint8_t *)&v12, 0xCu);

  }
  objc_msgSend(v4, "sleepScheduleModelManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:", self);

  objc_msgSend(v4, "sleepScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addEventHandler:", self);

  objc_msgSend(v4, "sleepCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:", self);

  objc_msgSend(v4, "sleepModeManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:", self);

  objc_msgSend(v4, "diagnostics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addProvider:", self);
}

- (void)environmentDidBecomeReady:(id)a3
{
  NSObject *v3;
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = (id)objc_opt_class();
    v4 = v6;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] environmentDidBecomeReady", (uint8_t *)&v5, 0xCu);

  }
}

- (void)environmentWillInvalidate:(id)a3
{
  NSObject *v4;
  id v5;
  HKSPXPCConnectionListener *connectionListener;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = (id)objc_opt_class();
    v5 = v8;
    _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Environment will become invalid", (uint8_t *)&v7, 0xCu);

  }
  connectionListener = self->_connectionListener;
  self->_connectionListener = 0;

}

- (void)checkInWithSyncAnchorContainer:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  id WeakRetained;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  void (**v18)(id, uint64_t, _QWORD);
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v9 = objc_msgSend(WeakRetained, "isDisabled");

  if (v9)
  {
    HKSPLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v20 = (id)objc_opt_class();
      v15 = v20;
      _os_log_error_impl(&dword_21610C000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);

    }
    v7[2](v7, 1, 0);
  }
  else
  {
    -[HDSPSleepStoreServer connectionListener](self, "connectionListener");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentClient");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    HKSPLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v20 = (id)objc_opt_class();
      v21 = 2114;
      v22 = v12;
      v23 = 2114;
      v24 = v6;
      v14 = v20;
      _os_log_impl(&dword_21610C000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] check in received from %{public}@ with sync anchor container: %{public}@", buf, 0x20u);

    }
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __66__HDSPSleepStoreServer_checkInWithSyncAnchorContainer_completion___block_invoke;
    v16[3] = &unk_24D4E4598;
    v16[4] = self;
    v17 = v6;
    v18 = v7;
    -[HDSPSleepStoreServer _performWhenClientIsReady:block:](self, "_performWhenClientIsReady:block:", v12, v16);

  }
}

uint64_t __66__HDSPSleepStoreServer_checkInWithSyncAnchorContainer_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_notifyClient:forMissedMessagesWithSyncAnchorContainer:", a2, *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)getSleepScheduleWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  id WeakRetained;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  void (**v14)(id, _QWORD, void *);
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, void *))a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v6 = objc_msgSend(WeakRetained, "isDisabled");

  if (v6)
  {
    HKSPLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v16 = (id)objc_opt_class();
      v12 = v16;
      _os_log_error_impl(&dword_21610C000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sleep.HDSPSleepStoreServer"), 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v8);
  }
  else
  {
    -[HDSPSleepStoreServer connectionListener](self, "connectionListener");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    HKSPLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v16 = (id)objc_opt_class();
      v17 = 2114;
      v18 = v8;
      v11 = v16;
      _os_log_impl(&dword_21610C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] request received for sleep schedule from: %{public}@", buf, 0x16u);

    }
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __55__HDSPSleepStoreServer_getSleepScheduleWithCompletion___block_invoke;
    v13[3] = &unk_24D4E45C0;
    v13[4] = self;
    v14 = v4;
    -[HDSPSleepStoreServer _performWhenClientIsReady:block:](self, "_performWhenClientIsReady:block:", v8, v13);

  }
}

void __55__HDSPSleepStoreServer_getSleepScheduleWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543618;
    v13 = (id)objc_opt_class();
    v14 = 2114;
    v15 = v3;
    v5 = v13;
    _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] performing request for sleep schedule from: %{public}@", (uint8_t *)&v12, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "environment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sleepScheduleModelManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sleepSchedule");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  HKSPLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_opt_class();
    v12 = 138543618;
    v13 = v10;
    v14 = 2114;
    v15 = v3;
    v11 = v10;
    _os_log_impl(&dword_21610C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] completing request for sleep schedule from: %{public}@", (uint8_t *)&v12, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)saveSleepSchedule:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  id WeakRetained;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  void (**v18)(id, void *);
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v9 = objc_msgSend(WeakRetained, "isDisabled");

  if (v9)
  {
    HKSPLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v20 = (id)objc_opt_class();
      v15 = v20;
      _os_log_error_impl(&dword_21610C000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sleep.HDSPSleepStoreServer"), 1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v11);
  }
  else
  {
    -[HDSPSleepStoreServer connectionListener](self, "connectionListener");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currentClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    HKSPLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v20 = (id)objc_opt_class();
      v21 = 2114;
      v22 = v6;
      v23 = 2114;
      v24 = v11;
      v14 = v20;
      _os_log_impl(&dword_21610C000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] request received to save current sleep schedule: %{public}@ from: %{public}@", buf, 0x20u);

    }
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __53__HDSPSleepStoreServer_saveSleepSchedule_completion___block_invoke;
    v16[3] = &unk_24D4E4598;
    v16[4] = self;
    v17 = v6;
    v18 = v7;
    -[HDSPSleepStoreServer _performWhenClientIsReady:block:](self, "_performWhenClientIsReady:block:", v11, v16);

  }
}

void __53__HDSPSleepStoreServer_saveSleepSchedule_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_opt_class();
    v6 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v21 = v5;
    v22 = 2114;
    v23 = v6;
    v24 = 2114;
    v25 = v3;
    v7 = v5;
    _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] performing request to save current sleep schedule: %{public}@ from: %{public}@", buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "environment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sleepScheduleModelManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 40);
  v19 = 0;
  v11 = objc_msgSend(v9, "saveSleepSchedule:error:", v10, &v19);
  v12 = v19;

  HKSPLogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v11 || v12)
  {
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    v18 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v21 = v18;
    v22 = 2114;
    v23 = v12;
    v17 = v18;
    _os_log_error_impl(&dword_21610C000, v14, OS_LOG_TYPE_ERROR, "[%{public}@] request received to save current sleep schedule failed: %{public}@", buf, 0x16u);
    goto LABEL_7;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_opt_class();
    v16 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v21 = v15;
    v22 = 2114;
    v23 = v16;
    v24 = 2114;
    v25 = v3;
    v17 = v15;
    _os_log_impl(&dword_21610C000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] completing request to save current sleep schedule: %{public}@ from: %{public}@", buf, 0x20u);
LABEL_7:

  }
LABEL_9:

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)saveSleepSettings:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  id WeakRetained;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  void (**v18)(id, void *);
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v9 = objc_msgSend(WeakRetained, "isDisabled");

  if (v9)
  {
    HKSPLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v20 = (id)objc_opt_class();
      v15 = v20;
      _os_log_error_impl(&dword_21610C000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sleep.HDSPSleepStoreServer"), 1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v11);
  }
  else
  {
    -[HDSPSleepStoreServer connectionListener](self, "connectionListener");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currentClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    HKSPLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v20 = (id)objc_opt_class();
      v21 = 2114;
      v22 = v6;
      v23 = 2114;
      v24 = v11;
      v14 = v20;
      _os_log_impl(&dword_21610C000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] request received to save current sleep settings: %{public}@ from: %{public}@", buf, 0x20u);

    }
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __53__HDSPSleepStoreServer_saveSleepSettings_completion___block_invoke;
    v16[3] = &unk_24D4E4598;
    v16[4] = self;
    v17 = v6;
    v18 = v7;
    -[HDSPSleepStoreServer _performWhenClientIsReady:block:](self, "_performWhenClientIsReady:block:", v11, v16);

  }
}

void __53__HDSPSleepStoreServer_saveSleepSettings_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_opt_class();
    v6 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v21 = v5;
    v22 = 2114;
    v23 = v6;
    v24 = 2114;
    v25 = v3;
    v7 = v5;
    _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] performing request to save current sleep settings: %{public}@ from: %{public}@", buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "environment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sleepScheduleModelManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 40);
  v19 = 0;
  v11 = objc_msgSend(v9, "saveSleepSettings:error:", v10, &v19);
  v12 = v19;

  HKSPLogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v11 || v12)
  {
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    v18 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v21 = v18;
    v22 = 2114;
    v23 = v12;
    v17 = v18;
    _os_log_error_impl(&dword_21610C000, v14, OS_LOG_TYPE_ERROR, "[%{public}@] request received to save current sleep settings failed: %{public}@", buf, 0x16u);
    goto LABEL_7;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_opt_class();
    v16 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v21 = v15;
    v22 = 2114;
    v23 = v16;
    v24 = 2114;
    v25 = v3;
    v17 = v15;
    _os_log_impl(&dword_21610C000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] completing request to save current sleep settings: %{public}@ from: %{public}@", buf, 0x20u);
LABEL_7:

  }
LABEL_9:

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)saveSleepEventRecord:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  id WeakRetained;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  void (**v18)(id, void *);
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v9 = objc_msgSend(WeakRetained, "isDisabled");

  if (v9)
  {
    HKSPLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v20 = (id)objc_opt_class();
      v15 = v20;
      _os_log_error_impl(&dword_21610C000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sleep.HDSPSleepStoreServer"), 1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v11);
  }
  else
  {
    -[HDSPSleepStoreServer connectionListener](self, "connectionListener");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currentClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    HKSPLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v20 = (id)objc_opt_class();
      v21 = 2114;
      v22 = v6;
      v23 = 2114;
      v24 = v11;
      v14 = v20;
      _os_log_impl(&dword_21610C000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] request received to save current sleep event record: %{public}@ from: %{public}@", buf, 0x20u);

    }
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __56__HDSPSleepStoreServer_saveSleepEventRecord_completion___block_invoke;
    v16[3] = &unk_24D4E4598;
    v16[4] = self;
    v17 = v6;
    v18 = v7;
    -[HDSPSleepStoreServer _performWhenClientIsReady:block:](self, "_performWhenClientIsReady:block:", v11, v16);

  }
}

void __56__HDSPSleepStoreServer_saveSleepEventRecord_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_opt_class();
    v6 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v21 = v5;
    v22 = 2114;
    v23 = v6;
    v24 = 2114;
    v25 = v3;
    v7 = v5;
    _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] performing request to save current sleep event record: %{public}@ from: %{public}@", buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "environment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sleepScheduleModelManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 40);
  v19 = 0;
  v11 = objc_msgSend(v9, "saveSleepEventRecord:error:", v10, &v19);
  v12 = v19;

  HKSPLogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v11 || v12)
  {
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    v18 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v21 = v18;
    v22 = 2114;
    v23 = v12;
    v17 = v18;
    _os_log_error_impl(&dword_21610C000, v14, OS_LOG_TYPE_ERROR, "[%{public}@] request received to save current sleep event record failed: %{public}@", buf, 0x16u);
    goto LABEL_7;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_opt_class();
    v16 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v21 = v15;
    v22 = 2114;
    v23 = v16;
    v24 = 2114;
    v25 = v3;
    v17 = v15;
    _os_log_impl(&dword_21610C000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] completing request to save current sleep event record: %{public}@ from: %{public}@", buf, 0x20u);
LABEL_7:

  }
LABEL_9:

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)getSleepScheduleModelWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  id WeakRetained;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  void (**v14)(id, _QWORD, void *);
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, void *))a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v6 = objc_msgSend(WeakRetained, "isDisabled");

  if (v6)
  {
    HKSPLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v16 = (id)objc_opt_class();
      v12 = v16;
      _os_log_error_impl(&dword_21610C000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sleep.HDSPSleepStoreServer"), 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v8);
  }
  else
  {
    -[HDSPSleepStoreServer connectionListener](self, "connectionListener");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    HKSPLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v16 = (id)objc_opt_class();
      v17 = 2114;
      v18 = v8;
      v11 = v16;
      _os_log_impl(&dword_21610C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] request received for sleep schedule model from: %{public}@", buf, 0x16u);

    }
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __60__HDSPSleepStoreServer_getSleepScheduleModelWithCompletion___block_invoke;
    v13[3] = &unk_24D4E45C0;
    v13[4] = self;
    v14 = v4;
    -[HDSPSleepStoreServer _performWhenClientIsReady:block:](self, "_performWhenClientIsReady:block:", v8, v13);

  }
}

void __60__HDSPSleepStoreServer_getSleepScheduleModelWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543618;
    v13 = (id)objc_opt_class();
    v14 = 2114;
    v15 = v3;
    v5 = v13;
    _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] performing request for sleep schedule model from: %{public}@", (uint8_t *)&v12, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "environment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sleepScheduleModelManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sleepScheduleModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  HKSPLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_opt_class();
    v12 = 138543618;
    v13 = v10;
    v14 = 2114;
    v15 = v3;
    v11 = v10;
    _os_log_impl(&dword_21610C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] completing request for sleep schedule model from: %{public}@", (uint8_t *)&v12, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)getSleepModeWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  id WeakRetained;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  void (**v14)(id, _QWORD, void *);
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, void *))a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v6 = objc_msgSend(WeakRetained, "isDisabled");

  if (v6)
  {
    HKSPLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v16 = (id)objc_opt_class();
      v12 = v16;
      _os_log_error_impl(&dword_21610C000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sleep.HDSPSleepStoreServer"), 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v8);
  }
  else
  {
    -[HDSPSleepStoreServer connectionListener](self, "connectionListener");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    HKSPLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v16 = (id)objc_opt_class();
      v17 = 2114;
      v18 = v8;
      v11 = v16;
      _os_log_impl(&dword_21610C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] request received for sleep mode on from: %{public}@", buf, 0x16u);

    }
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __51__HDSPSleepStoreServer_getSleepModeWithCompletion___block_invoke;
    v13[3] = &unk_24D4E45C0;
    v13[4] = self;
    v14 = v4;
    -[HDSPSleepStoreServer _performWhenClientIsReady:block:](self, "_performWhenClientIsReady:block:", v8, v13);

  }
}

void __51__HDSPSleepStoreServer_getSleepModeWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543618;
    v13 = (id)objc_opt_class();
    v14 = 2114;
    v15 = v3;
    v5 = v13;
    _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] performing request for sleep mode on from: %{public}@", (uint8_t *)&v12, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "environment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sleepModeManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sleepMode");

  HKSPLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_opt_class();
    v10 = v9;
    NSStringFromHKSPSleepMode();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v9;
    v14 = 2114;
    v15 = v11;
    v16 = 2114;
    v17 = v3;
    _os_log_impl(&dword_21610C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] completing request for sleep mode: %{public}@ from: %{public}@", (uint8_t *)&v12, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)setSleepMode:(int64_t)a3 reason:(unint64_t)a4 completion:(id)a5
{
  void (**v8)(id, void *);
  id WeakRetained;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  void (**v21)(id, void *);
  int64_t v22;
  unint64_t v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = (void (**)(id, void *))a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v10 = objc_msgSend(WeakRetained, "isDisabled");

  if (v10)
  {
    HKSPLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v25 = (id)objc_opt_class();
      v19 = v25;
      _os_log_error_impl(&dword_21610C000, v11, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sleep.HDSPSleepStoreServer"), 1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v12);
  }
  else
  {
    -[HDSPSleepStoreServer connectionListener](self, "connectionListener");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "currentClient");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    HKSPLogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_opt_class();
      v16 = v15;
      NSStringFromHKSPSleepMode();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromHKSPSleepModeChangeReason();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v25 = v15;
      v26 = 2114;
      v27 = v17;
      v28 = 2114;
      v29 = v18;
      v30 = 2114;
      v31 = v12;
      _os_log_impl(&dword_21610C000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] request received to set sleep mode: %{public}@ (%{public}@) from: %{public}@", buf, 0x2Au);

    }
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __55__HDSPSleepStoreServer_setSleepMode_reason_completion___block_invoke;
    v20[3] = &unk_24D4E45E8;
    v20[4] = self;
    v22 = a3;
    v23 = a4;
    v21 = v8;
    -[HDSPSleepStoreServer _performWhenClientIsReady:block:](self, "_performWhenClientIsReady:block:", v12, v20);

  }
}

void __55__HDSPSleepStoreServer_setSleepMode_reason_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_opt_class();
    v6 = v5;
    NSStringFromHKSPSleepMode();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromHKSPSleepModeChangeReason();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138544130;
    v17 = v5;
    v18 = 2114;
    v19 = v7;
    v20 = 2114;
    v21 = v8;
    v22 = 2114;
    v23 = v3;
    _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] performing request set sleep mode: %{public}@ (%{public}@) from: %{public}@", (uint8_t *)&v16, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 32), "environment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sleepModeManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSleepMode:reason:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  HKSPLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_opt_class();
    v13 = v12;
    NSStringFromHKSPSleepMode();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromHKSPSleepModeChangeReason();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138544130;
    v17 = v12;
    v18 = 2114;
    v19 = v14;
    v20 = 2114;
    v21 = v15;
    v22 = 2114;
    v23 = v3;
    _os_log_impl(&dword_21610C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] completing request to set sleep mode: %{public}@ (%{public}@) from: %{public}@", (uint8_t *)&v16, 0x2Au);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)getSleepScheduleStateWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  id WeakRetained;
  int v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  void (**v13)(id, _QWORD, void *);
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, void *))a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v6 = objc_msgSend(WeakRetained, "isDisabled");

  HKSPLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v15 = (id)objc_opt_class();
      v11 = v15;
      _os_log_error_impl(&dword_21610C000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sleep.HDSPSleepStoreServer"), 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v9);

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = (id)objc_opt_class();
      v10 = v15;
      _os_log_impl(&dword_21610C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] request received for sleep schedule state", buf, 0xCu);

    }
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __60__HDSPSleepStoreServer_getSleepScheduleStateWithCompletion___block_invoke;
    v12[3] = &unk_24D4E45C0;
    v12[4] = self;
    v13 = v4;
    -[HDSPSleepStoreServer _performWhenCurrentClientIsReady:](self, "_performWhenCurrentClientIsReady:", v12);

  }
}

void __60__HDSPSleepStoreServer_getSleepScheduleStateWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = (id)objc_opt_class();
    v3 = v11;
    _os_log_impl(&dword_21610C000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] performing request for sleep schedule state", (uint8_t *)&v10, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sleepCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentSleepScheduleState");

  HKSPLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class();
    v8 = v7;
    NSStringFromHKSPSleepScheduleState();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v7;
    v12 = 2114;
    v13 = v9;
    _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] completing request for sleep schedule state: %{public}@", (uint8_t *)&v10, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)getSleepWidgetStateWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  id WeakRetained;
  int v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  void (**v13)(id, _QWORD, void *);
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, void *))a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v6 = objc_msgSend(WeakRetained, "isDisabled");

  HKSPLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v15 = (id)objc_opt_class();
      v11 = v15;
      _os_log_error_impl(&dword_21610C000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sleep.HDSPSleepStoreServer"), 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v9);

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = (id)objc_opt_class();
      v10 = v15;
      _os_log_impl(&dword_21610C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] request received for sleep widget state", buf, 0xCu);

    }
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __58__HDSPSleepStoreServer_getSleepWidgetStateWithCompletion___block_invoke;
    v12[3] = &unk_24D4E45C0;
    v12[4] = self;
    v13 = v4;
    -[HDSPSleepStoreServer _performWhenCurrentClientIsReady:](self, "_performWhenCurrentClientIsReady:", v12);

  }
}

void __58__HDSPSleepStoreServer_getSleepWidgetStateWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = (id)objc_opt_class();
    v3 = v11;
    _os_log_impl(&dword_21610C000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] performing request for sleep widget state", (uint8_t *)&v10, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sleepWidgetManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentSleepWidgetState");

  HKSPLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class();
    v8 = v7;
    NSStringFromHKSPSleepWidgetState();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v7;
    v12 = 2114;
    v13 = v9;
    _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] completing request for sleep widget state: %{public}@", (uint8_t *)&v10, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)publishNotificationWithIdentifier:(id)a3 userInfo:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  id WeakRetained;
  int v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  void (**v21)(id, _QWORD, void *);
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v12 = objc_msgSend(WeakRetained, "isDisabled");

  HKSPLogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v23 = (id)objc_opt_class();
      v17 = v23;
      _os_log_error_impl(&dword_21610C000, v14, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sleep.HDSPSleepStoreServer"), 1, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v15);

  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v23 = (id)objc_opt_class();
      v24 = 2112;
      v25 = v8;
      v16 = v23;
      _os_log_impl(&dword_21610C000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Request received to publish notification: %@", buf, 0x16u);

    }
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __78__HDSPSleepStoreServer_publishNotificationWithIdentifier_userInfo_completion___block_invoke;
    v18[3] = &unk_24D4E4610;
    v18[4] = self;
    v19 = v8;
    v20 = v9;
    v21 = v10;
    -[HDSPSleepStoreServer _performWhenCurrentClientIsReady:](self, "_performWhenCurrentClientIsReady:", v18);

  }
}

void __78__HDSPSleepStoreServer_publishNotificationWithIdentifier_userInfo_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void (**v9)(void);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)objc_opt_class();
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v20 = v3;
    v21 = 2112;
    v22 = v4;
    v5 = v3;
    _os_log_impl(&dword_21610C000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Performing request to publish notification: %@", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "environment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BEA98F8];
  v8 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v6, "currentDateProvider");
  v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v9[2]();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sleepEventWithIdentifier:dueDate:context:", v8, v10, *(_QWORD *)(a1 + 48));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sleepScheduler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "notifyForOverdueEvents:", v13);

  HKSPLogForCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_opt_class();
    v16 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v20 = v15;
    v21 = 2112;
    v22 = v16;
    v17 = v15;
    _os_log_impl(&dword_21610C000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Completing request to publish notification: %@", buf, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)publishWakeUpResultsNotificationWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  id WeakRetained;
  int v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  void (**v13)(id, _QWORD, void *);
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, void *))a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v6 = objc_msgSend(WeakRetained, "isDisabled");

  HKSPLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v15 = (id)objc_opt_class();
      v11 = v15;
      _os_log_error_impl(&dword_21610C000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sleep.HDSPSleepStoreServer"), 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v9);

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = (id)objc_opt_class();
      v10 = v15;
      _os_log_impl(&dword_21610C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Request received to publish wake up results notification", buf, 0xCu);

    }
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __71__HDSPSleepStoreServer_publishWakeUpResultsNotificationWithCompletion___block_invoke;
    v12[3] = &unk_24D4E45C0;
    v12[4] = self;
    v13 = v4;
    -[HDSPSleepStoreServer _performWhenCurrentClientIsReady:](self, "_performWhenCurrentClientIsReady:", v12);

  }
}

void __71__HDSPSleepStoreServer_publishWakeUpResultsNotificationWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v15 = (id)objc_opt_class();
    v3 = v15;
    _os_log_impl(&dword_21610C000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Performing request to publish wake up results notification", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wakeUpResultsNotificationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "wakeUpResultsNotificationManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "performImmediateQueryForNotification");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __71__HDSPSleepStoreServer_publishWakeUpResultsNotificationWithCompletion___block_invoke_197;
    v11[3] = &unk_24D4E4638;
    v13 = *(id *)(a1 + 40);
    v12 = v4;
    v8 = (id)objc_msgSend(v7, "addCompletionBlock:", v11);

    v9 = v13;
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sleep.HDSPSleepStoreServer"), 2, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v9);
  }

}

void __71__HDSPSleepStoreServer_publishWakeUpResultsNotificationWithCompletion___block_invoke_197(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(void);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    objc_msgSend(a2, "buildNotification");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v5 = (void *)MEMORY[0x24BEA98F8];
      objc_msgSend(v3, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "currentDateProvider");
      v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v7[2]();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "userInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sleepEventWithIdentifier:dueDate:context:", v6, v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "sleepScheduler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v10;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "notifyForOverdueEvents:", v12);

      v13 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v10, "context");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v13 + 16))(v13, v14, 0);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0);
  }
}

- (void)setLockScreenOverrideState:(int64_t)a3 userInfo:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  id WeakRetained;
  int v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  void (**v21)(id, _QWORD, void *);
  int64_t v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = (void (**)(id, _QWORD, void *))a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v11 = objc_msgSend(WeakRetained, "isDisabled");

  HKSPLogForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v24 = (id)objc_opt_class();
      v18 = v24;
      _os_log_error_impl(&dword_21610C000, v13, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sleep.HDSPSleepStoreServer"), 1, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v14);

  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_opt_class();
      v16 = v15;
      NSStringFromHKSPSleepLockScreenState();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v24 = v15;
      v25 = 2112;
      v26 = v17;
      v27 = 2112;
      v28 = v8;
      _os_log_impl(&dword_21610C000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Request received to override lock screen state: %@ (userInfo: %@)", buf, 0x20u);

    }
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __71__HDSPSleepStoreServer_setLockScreenOverrideState_userInfo_completion___block_invoke;
    v19[3] = &unk_24D4E4660;
    v19[4] = self;
    v22 = a3;
    v20 = v8;
    v21 = v9;
    -[HDSPSleepStoreServer _performWhenCurrentClientIsReady:](self, "_performWhenCurrentClientIsReady:", v19);

  }
}

void __71__HDSPSleepStoreServer_setLockScreenOverrideState_userInfo_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)objc_opt_class();
    v4 = v3;
    NSStringFromHKSPSleepLockScreenState();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v3;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_21610C000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Performing request override lock screen state: %@", (uint8_t *)&v17, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "environment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sleepLockScreenManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "sleepLockScreenManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "overrideLockScreenState:userInfo:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  }
  else
  {
    HKSPLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)objc_opt_class();
      v17 = 138543362;
      v18 = v15;
      v16 = v15;
      _os_log_error_impl(&dword_21610C000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] lock screen not supported on this device", (uint8_t *)&v17, 0xCu);

    }
    v10 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sleep.HDSPSleepStoreServer"), 2, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v8);
  }

  HKSPLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_opt_class();
    v13 = v12;
    NSStringFromHKSPSleepLockScreenState();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v12;
    v19 = 2112;
    v20 = v14;
    _os_log_impl(&dword_21610C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Completing request override lock screen state: %@", (uint8_t *)&v17, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)setWidgetOverrideState:(int64_t)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  id WeakRetained;
  int v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  void (**v17)(id, _QWORD, void *);
  int64_t v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, _QWORD, void *))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v8 = objc_msgSend(WeakRetained, "isDisabled");

  HKSPLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v20 = (id)objc_opt_class();
      v15 = v20;
      _os_log_error_impl(&dword_21610C000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sleep.HDSPSleepStoreServer"), 1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v11);

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_opt_class();
      v13 = v12;
      NSStringFromHKSPSleepWidgetState();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v12;
      v21 = 2112;
      v22 = v14;
      _os_log_impl(&dword_21610C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Request received to override sleep widget state: %@", buf, 0x16u);

    }
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __58__HDSPSleepStoreServer_setWidgetOverrideState_completion___block_invoke;
    v16[3] = &unk_24D4E4688;
    v16[4] = self;
    v18 = a3;
    v17 = v6;
    -[HDSPSleepStoreServer _performWhenCurrentClientIsReady:](self, "_performWhenCurrentClientIsReady:", v16);

  }
}

void __58__HDSPSleepStoreServer_setWidgetOverrideState_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)objc_opt_class();
    v4 = v3;
    NSStringFromHKSPSleepWidgetState();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v3;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_21610C000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Performing request to override sleep widget state: %@", (uint8_t *)&v17, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "environment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sleepWidgetManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "sleepWidgetManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "overrideWidgetState:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    HKSPLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)objc_opt_class();
      v17 = 138543362;
      v18 = v15;
      v16 = v15;
      _os_log_error_impl(&dword_21610C000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] widgets not supported on this device", (uint8_t *)&v17, 0xCu);

    }
    v10 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sleep.HDSPSleepStoreServer"), 2, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v8);
  }

  HKSPLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_opt_class();
    v13 = v12;
    NSStringFromHKSPSleepWidgetState();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v12;
    v19 = 2112;
    v20 = v14;
    _os_log_impl(&dword_21610C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Completing request to override sleep widget state: %@", (uint8_t *)&v17, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)clearWidgetOverrideWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  id WeakRetained;
  int v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  void (**v13)(id, _QWORD, void *);
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, void *))a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v6 = objc_msgSend(WeakRetained, "isDisabled");

  HKSPLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v15 = (id)objc_opt_class();
      v11 = v15;
      _os_log_error_impl(&dword_21610C000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sleep.HDSPSleepStoreServer"), 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v9);

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = (id)objc_opt_class();
      v10 = v15;
      _os_log_impl(&dword_21610C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Request received to clear sleep widget override", buf, 0xCu);

    }
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __58__HDSPSleepStoreServer_clearWidgetOverrideWithCompletion___block_invoke;
    v12[3] = &unk_24D4E45C0;
    v12[4] = self;
    v13 = v4;
    -[HDSPSleepStoreServer _performWhenCurrentClientIsReady:](self, "_performWhenCurrentClientIsReady:", v12);

  }
}

void __58__HDSPSleepStoreServer_clearWidgetOverrideWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138543362;
    v15 = (id)objc_opt_class();
    v3 = v15;
    _os_log_impl(&dword_21610C000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Performing request clear sleep widget override", (uint8_t *)&v14, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sleepWidgetManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "sleepWidgetManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clearWidgetOverrideState");
  }
  else
  {
    HKSPLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)objc_opt_class();
      v14 = 138543362;
      v15 = v12;
      v13 = v12;
      _os_log_error_impl(&dword_21610C000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] widgets not supported on this device", (uint8_t *)&v14, 0xCu);

    }
    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sleep.HDSPSleepStoreServer"), 2, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v6);
  }

  HKSPLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_opt_class();
    v14 = 138543362;
    v15 = v10;
    v11 = v10;
    _os_log_impl(&dword_21610C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Completing request to clear sleep widget override", (uint8_t *)&v14, 0xCu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)createSleepFocusInState:(unint64_t)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  id WeakRetained;
  int v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  void (**v17)(id, _QWORD, void *);
  unint64_t v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, _QWORD, void *))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v8 = objc_msgSend(WeakRetained, "isDisabled");

  HKSPLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v20 = (id)objc_opt_class();
      v15 = v20;
      _os_log_error_impl(&dword_21610C000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sleep.HDSPSleepStoreServer"), 1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v11);

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_opt_class();
      v13 = v12;
      NSStringFromHKSPSleepFocusConfigurationState();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v12;
      v21 = 2114;
      v22 = v14;
      _os_log_impl(&dword_21610C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Request received to create sleep focus mode (%{public}@)", buf, 0x16u);

    }
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __59__HDSPSleepStoreServer_createSleepFocusInState_completion___block_invoke;
    v16[3] = &unk_24D4E4688;
    v16[4] = self;
    v18 = a3;
    v17 = v6;
    -[HDSPSleepStoreServer _performWhenCurrentClientIsReady:](self, "_performWhenCurrentClientIsReady:", v16);

  }
}

void __59__HDSPSleepStoreServer_createSleepFocusInState_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)objc_opt_class();
    v4 = v3;
    NSStringFromHKSPSleepFocusConfigurationState();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v3;
    v17 = 2114;
    v18 = v5;
    _os_log_impl(&dword_21610C000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Performing request to create sleep focus mode (%{public}@)", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "environment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sleepModeManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 48);
  v14 = 0;
  objc_msgSend(v7, "createFocusModeInState:error:", v8, &v14);
  v9 = v14;

  HKSPLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_opt_class();
    v12 = v11;
    NSStringFromHKSPSleepFocusConfigurationState();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v11;
    v17 = 2114;
    v18 = v13;
    _os_log_impl(&dword_21610C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Completing request to create sleep focus mode (%{public}@)", buf, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)deleteSleepFocusModeWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  id WeakRetained;
  int v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  void (**v13)(id, _QWORD, void *);
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, void *))a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v6 = objc_msgSend(WeakRetained, "isDisabled");

  HKSPLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v15 = (id)objc_opt_class();
      v11 = v15;
      _os_log_error_impl(&dword_21610C000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sleep.HDSPSleepStoreServer"), 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v9);

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = (id)objc_opt_class();
      v10 = v15;
      _os_log_impl(&dword_21610C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Request received to delete sleep focus mode", buf, 0xCu);

    }
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __59__HDSPSleepStoreServer_deleteSleepFocusModeWithCompletion___block_invoke;
    v12[3] = &unk_24D4E45C0;
    v12[4] = self;
    v13 = v4;
    -[HDSPSleepStoreServer _performWhenCurrentClientIsReady:](self, "_performWhenCurrentClientIsReady:", v12);

  }
}

void __59__HDSPSleepStoreServer_deleteSleepFocusModeWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v3 = v12;
    _os_log_impl(&dword_21610C000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Performing request to delete sleep focus mode", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sleepModeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v5, "deleteFocusModeWithError:", &v10);
  v6 = v10;

  HKSPLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v12 = v8;
    v9 = v8;
    _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Completing request to delete sleep focus mode", buf, 0xCu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)configureSleepFocusWithState:(unint64_t)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  id WeakRetained;
  int v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  void (**v17)(id, _QWORD, void *);
  unint64_t v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, _QWORD, void *))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v8 = objc_msgSend(WeakRetained, "isDisabled");

  HKSPLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v20 = (id)objc_opt_class();
      v15 = v20;
      _os_log_error_impl(&dword_21610C000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sleep.HDSPSleepStoreServer"), 1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v11);

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_opt_class();
      v13 = v12;
      NSStringFromHKSPSleepFocusConfigurationState();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v12;
      v21 = 2114;
      v22 = v14;
      _os_log_impl(&dword_21610C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Request received to configure sleep focus mode (state: %{public}@)", buf, 0x16u);

    }
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __64__HDSPSleepStoreServer_configureSleepFocusWithState_completion___block_invoke;
    v16[3] = &unk_24D4E4688;
    v16[4] = self;
    v18 = a3;
    v17 = v6;
    -[HDSPSleepStoreServer _performWhenCurrentClientIsReady:](self, "_performWhenCurrentClientIsReady:", v16);

  }
}

void __64__HDSPSleepStoreServer_configureSleepFocusWithState_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = (id)objc_opt_class();
    v3 = v13;
    _os_log_impl(&dword_21610C000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Performing request to configure sleep focus mode", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sleepModeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 48);
  v11 = 0;
  objc_msgSend(v5, "configureFocusModeWithState:error:", v6, &v11);
  v7 = v11;

  HKSPLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v13 = v9;
    v10 = v9;
    _os_log_impl(&dword_21610C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Completing request to configure sleep focus mode", buf, 0xCu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)confirmAwakeWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  id WeakRetained;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  void (**v14)(id, _QWORD, void *);
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, void *))a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v6 = objc_msgSend(WeakRetained, "isDisabled");

  if (v6)
  {
    HKSPLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v16 = (id)objc_opt_class();
      v12 = v16;
      _os_log_error_impl(&dword_21610C000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sleep.HDSPSleepStoreServer"), 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v8);
  }
  else
  {
    -[HDSPSleepStoreServer connectionListener](self, "connectionListener");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    HKSPLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v16 = (id)objc_opt_class();
      v17 = 2114;
      v18 = v8;
      v11 = v16;
      _os_log_impl(&dword_21610C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Request received to confirm awake from: %{public}@", buf, 0x16u);

    }
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __51__HDSPSleepStoreServer_confirmAwakeWithCompletion___block_invoke;
    v13[3] = &unk_24D4E45C0;
    v13[4] = self;
    v14 = v4;
    -[HDSPSleepStoreServer _performWhenClientIsReady:block:](self, "_performWhenClientIsReady:block:", v8, v13);

  }
}

void __51__HDSPSleepStoreServer_confirmAwakeWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = (id)objc_opt_class();
    v3 = v10;
    _os_log_impl(&dword_21610C000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Performing request to confirm awake", (uint8_t *)&v9, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "confirmWakeUp:", 1);
  HKSPLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class();
    v9 = 138543362;
    v10 = v7;
    v8 = v7;
    _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Completing request to confirm awake", (uint8_t *)&v9, 0xCu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)dismissGoodMorningWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  id WeakRetained;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  void (**v14)(id, _QWORD, void *);
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, void *))a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v6 = objc_msgSend(WeakRetained, "isDisabled");

  if (v6)
  {
    HKSPLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v16 = (id)objc_opt_class();
      v12 = v16;
      _os_log_error_impl(&dword_21610C000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sleep.HDSPSleepStoreServer"), 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v8);
  }
  else
  {
    -[HDSPSleepStoreServer connectionListener](self, "connectionListener");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    HKSPLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v16 = (id)objc_opt_class();
      v17 = 2114;
      v18 = v8;
      v11 = v16;
      _os_log_impl(&dword_21610C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Request received to dismiss good morning from: %{public}@", buf, 0x16u);

    }
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __57__HDSPSleepStoreServer_dismissGoodMorningWithCompletion___block_invoke;
    v13[3] = &unk_24D4E45C0;
    v13[4] = self;
    v14 = v4;
    -[HDSPSleepStoreServer _performWhenClientIsReady:block:](self, "_performWhenClientIsReady:block:", v8, v13);

  }
}

void __57__HDSPSleepStoreServer_dismissGoodMorningWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = (id)objc_opt_class();
    v3 = v10;
    _os_log_impl(&dword_21610C000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Performing request to dismiss good morning", (uint8_t *)&v9, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dismissGoodMorning");
  HKSPLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class();
    v9 = 138543362;
    v10 = v7;
    v8 = v7;
    _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Completing request to dismiss good morning", (uint8_t *)&v9, 0xCu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)dismissSleepLockWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  id WeakRetained;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  void (**v14)(id, _QWORD, void *);
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, void *))a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v6 = objc_msgSend(WeakRetained, "isDisabled");

  if (v6)
  {
    HKSPLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v16 = (id)objc_opt_class();
      v12 = v16;
      _os_log_error_impl(&dword_21610C000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sleep.HDSPSleepStoreServer"), 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v8);
  }
  else
  {
    -[HDSPSleepStoreServer connectionListener](self, "connectionListener");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    HKSPLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v16 = (id)objc_opt_class();
      v17 = 2114;
      v18 = v8;
      v11 = v16;
      _os_log_impl(&dword_21610C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Request received to dismiss sleep lock from: %{public}@", buf, 0x16u);

    }
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __55__HDSPSleepStoreServer_dismissSleepLockWithCompletion___block_invoke;
    v13[3] = &unk_24D4E45C0;
    v13[4] = self;
    v14 = v4;
    -[HDSPSleepStoreServer _performWhenClientIsReady:block:](self, "_performWhenClientIsReady:block:", v8, v13);

  }
}

void __55__HDSPSleepStoreServer_dismissSleepLockWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = (id)objc_opt_class();
    v3 = v10;
    _os_log_impl(&dword_21610C000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Performing request to dismiss sleep lock", (uint8_t *)&v9, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dismissSleepLock");
  HKSPLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class();
    v9 = 138543362;
    v10 = v7;
    v8 = v7;
    _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Completing request to dismiss sleep lock", (uint8_t *)&v9, 0xCu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)sleepAlarmWasDismissedOnDate:(id)a3 source:(unint64_t)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  id WeakRetained;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  void (**v22)(id, _QWORD, void *);
  unint64_t v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, _QWORD, void *))a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v11 = objc_msgSend(WeakRetained, "isDisabled");

  if (v11)
  {
    HKSPLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v25 = (id)objc_opt_class();
      v19 = v25;
      _os_log_error_impl(&dword_21610C000, v12, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sleep.HDSPSleepStoreServer"), 1, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v13);
  }
  else
  {
    -[HDSPSleepStoreServer connectionListener](self, "connectionListener");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "currentClient");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    HKSPLogForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_opt_class();
      v17 = v16;
      NSStringFromHKSPAlarmSource();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v25 = v16;
      v26 = 2114;
      v27 = v8;
      v28 = 2114;
      v29 = v18;
      v30 = 2114;
      v31 = v13;
      _os_log_impl(&dword_21610C000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Request received for sleep alarm dismissal on %{public}@ (%{public}@) from: %{public}@", buf, 0x2Au);

    }
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __71__HDSPSleepStoreServer_sleepAlarmWasDismissedOnDate_source_completion___block_invoke;
    v20[3] = &unk_24D4E46B0;
    v20[4] = self;
    v21 = v8;
    v23 = a4;
    v22 = v9;
    -[HDSPSleepStoreServer _performWhenEnvironmentIsReady:](self, "_performWhenEnvironmentIsReady:", v20);

  }
}

void __71__HDSPSleepStoreServer_sleepAlarmWasDismissedOnDate_source_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)objc_opt_class();
    v4 = *(_QWORD *)(a1 + 40);
    v12 = 138543618;
    v13 = v3;
    v14 = 2114;
    v15 = v4;
    v5 = v3;
    _os_log_impl(&dword_21610C000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Performing request for sleep alarm dismissal on %{public}@", (uint8_t *)&v12, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "environment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "sleepAlarmDismissedOnDate:source:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  HKSPLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_opt_class();
    v10 = *(_QWORD *)(a1 + 40);
    v12 = 138543618;
    v13 = v9;
    v14 = 2114;
    v15 = v10;
    v11 = v9;
    _os_log_impl(&dword_21610C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Completing request for sleep alarm dismissal on %{public}@", (uint8_t *)&v12, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)sleepAlarmWasSnoozedUntilDate:(id)a3 source:(unint64_t)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  id WeakRetained;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  void (**v22)(id, _QWORD, void *);
  unint64_t v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, _QWORD, void *))a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v11 = objc_msgSend(WeakRetained, "isDisabled");

  if (v11)
  {
    HKSPLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v25 = (id)objc_opt_class();
      v19 = v25;
      _os_log_error_impl(&dword_21610C000, v12, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sleep.HDSPSleepStoreServer"), 1, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v13);
  }
  else
  {
    -[HDSPSleepStoreServer connectionListener](self, "connectionListener");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "currentClient");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    HKSPLogForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_opt_class();
      v17 = v16;
      NSStringFromHKSPAlarmSource();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v25 = v16;
      v26 = 2114;
      v27 = v8;
      v28 = 2114;
      v29 = v18;
      v30 = 2114;
      v31 = v13;
      _os_log_impl(&dword_21610C000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Request received for sleep alarm snooze until %{public}@ (%{public}@) from: %{public}@", buf, 0x2Au);

    }
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __72__HDSPSleepStoreServer_sleepAlarmWasSnoozedUntilDate_source_completion___block_invoke;
    v20[3] = &unk_24D4E46B0;
    v20[4] = self;
    v21 = v8;
    v23 = a4;
    v22 = v9;
    -[HDSPSleepStoreServer _performWhenEnvironmentIsReady:](self, "_performWhenEnvironmentIsReady:", v20);

  }
}

void __72__HDSPSleepStoreServer_sleepAlarmWasSnoozedUntilDate_source_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)objc_opt_class();
    v4 = *(_QWORD *)(a1 + 40);
    v12 = 138543618;
    v13 = v3;
    v14 = 2114;
    v15 = v4;
    v5 = v3;
    _os_log_impl(&dword_21610C000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Performing request for sleep alarm snooze until %{public}@", (uint8_t *)&v12, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "environment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "sleepAlarmSnoozedUntilDate:source:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  HKSPLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_opt_class();
    v10 = *(_QWORD *)(a1 + 40);
    v12 = 138543618;
    v13 = v9;
    v14 = 2114;
    v15 = v10;
    v11 = v9;
    _os_log_impl(&dword_21610C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Completing request for sleep alarm snooze until %{public}@", (uint8_t *)&v12, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)sleepAlarmWasModifiedFromSource:(unint64_t)a3 completion:(id)a4
{
  void (**v5)(id, _QWORD, void *);
  id WeakRetained;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  void (**v17)(id, _QWORD, void *);
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = (void (**)(id, _QWORD, void *))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v7 = objc_msgSend(WeakRetained, "isDisabled");

  if (v7)
  {
    HKSPLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v19 = (id)objc_opt_class();
      v15 = v19;
      _os_log_error_impl(&dword_21610C000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sleep.HDSPSleepStoreServer"), 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, 0, v9);
  }
  else
  {
    -[HDSPSleepStoreServer connectionListener](self, "connectionListener");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentClient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    HKSPLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_opt_class();
      v13 = v12;
      NSStringFromHKSPAlarmSource();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v19 = v12;
      v20 = 2114;
      v21 = v14;
      v22 = 2114;
      v23 = v9;
      _os_log_impl(&dword_21610C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Request received for sleep alarm modified (%{public}@) from: %{public}@", buf, 0x20u);

    }
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __67__HDSPSleepStoreServer_sleepAlarmWasModifiedFromSource_completion___block_invoke;
    v16[3] = &unk_24D4E46D8;
    v16[4] = self;
    v17 = v5;
    -[HDSPSleepStoreServer _performWhenEnvironmentIsReady:](self, "_performWhenEnvironmentIsReady:", v16);

  }
}

void __67__HDSPSleepStoreServer_sleepAlarmWasModifiedFromSource_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = (id)objc_opt_class();
    v3 = v10;
    _os_log_impl(&dword_21610C000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Performing request for sleep alarm modified", (uint8_t *)&v9, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sleepAlarmWasModified");
  HKSPLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class();
    v9 = 138543362;
    v10 = v7;
    v8 = v7;
    _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Completing request for sleep alarm modified", (uint8_t *)&v9, 0xCu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)sleepScheduleModelManager:(id)a3 didUpdateSleepSchedule:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  -[HDSPSleepStoreServer environment](self, "environment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDSPSleepStoreServer connectionListener](self, "connectionListener");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "connectedClients");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __73__HDSPSleepStoreServer_sleepScheduleModelManager_didUpdateSleepSchedule___block_invoke;
  v27[3] = &unk_24D4E4700;
  v11 = v7;
  v28 = v11;
  objc_msgSend(v9, "na_firstObjectPassingTest:", v27);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  HKSPLogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543874;
    v30 = v14;
    v31 = 2114;
    v32 = v11;
    v33 = 2114;
    v34 = v5;
    v15 = v14;
    _os_log_impl(&dword_21610C000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] source: %{public}@ didUpdateSleepSchedule: %{public}@", buf, 0x20u);

  }
  -[HDSPSleepStoreServer syncAnchorContainer](self, "syncAnchorContainer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "incrementSleepScheduleSyncAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDSPSleepStoreServer connectionListener](self, "connectionListener");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v5;
  v25 = v17;
  v26 = v12;
  v19 = v12;
  v20 = v17;
  v21 = v5;
  -[HDSPSleepStoreServer _checkForSuspendedBlock](self, "_checkForSuspendedBlock", v10, 3221225472, __73__HDSPSleepStoreServer_sleepScheduleModelManager_didUpdateSleepSchedule___block_invoke_200, &unk_24D4E4728);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "performRemoteBlockOnClients:passingTest:", &v23, v22);

}

BOOL __73__HDSPSleepStoreServer_sleepScheduleModelManager_didUpdateSleepSchedule___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) == a2;
}

void __73__HDSPSleepStoreServer_sleepScheduleModelManager_didUpdateSleepSchedule___block_invoke_200(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  HKSPSleepScheduleWrapWithSyncAnchor();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "clientIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sleepScheduleChanged:clientIdentifier:", v5, v4);

}

- (void)sleepScheduleModelManager:(id)a3 didUpdateSleepSettings:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  -[HDSPSleepStoreServer environment](self, "environment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDSPSleepStoreServer connectionListener](self, "connectionListener");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "connectedClients");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __73__HDSPSleepStoreServer_sleepScheduleModelManager_didUpdateSleepSettings___block_invoke;
  v27[3] = &unk_24D4E4700;
  v11 = v7;
  v28 = v11;
  objc_msgSend(v9, "na_firstObjectPassingTest:", v27);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  HKSPLogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543874;
    v30 = v14;
    v31 = 2114;
    v32 = v11;
    v33 = 2114;
    v34 = v5;
    v15 = v14;
    _os_log_impl(&dword_21610C000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] source: %{public}@ didUpdateSleepSettings: %{public}@", buf, 0x20u);

  }
  -[HDSPSleepStoreServer syncAnchorContainer](self, "syncAnchorContainer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "incrementSleepSettingsSyncAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDSPSleepStoreServer connectionListener](self, "connectionListener");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v5;
  v25 = v17;
  v26 = v12;
  v19 = v12;
  v20 = v17;
  v21 = v5;
  -[HDSPSleepStoreServer _checkForSuspendedBlock](self, "_checkForSuspendedBlock", v10, 3221225472, __73__HDSPSleepStoreServer_sleepScheduleModelManager_didUpdateSleepSettings___block_invoke_202, &unk_24D4E4728);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "performRemoteBlockOnClients:passingTest:", &v23, v22);

}

BOOL __73__HDSPSleepStoreServer_sleepScheduleModelManager_didUpdateSleepSettings___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) == a2;
}

void __73__HDSPSleepStoreServer_sleepScheduleModelManager_didUpdateSleepSettings___block_invoke_202(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "objectWithSyncAnchor:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "clientIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sleepSettingsChanged:clientIdentifier:", v7, v6);

}

- (void)sleepScheduleModelManager:(id)a3 didUpdateSleepEventRecord:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  -[HDSPSleepStoreServer environment](self, "environment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDSPSleepStoreServer connectionListener](self, "connectionListener");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "connectedClients");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __76__HDSPSleepStoreServer_sleepScheduleModelManager_didUpdateSleepEventRecord___block_invoke;
  v27[3] = &unk_24D4E4700;
  v11 = v7;
  v28 = v11;
  objc_msgSend(v9, "na_firstObjectPassingTest:", v27);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  HKSPLogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543874;
    v30 = v14;
    v31 = 2114;
    v32 = v11;
    v33 = 2114;
    v34 = v5;
    v15 = v14;
    _os_log_impl(&dword_21610C000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] source: %{public}@ didUpdateSleepEventRecord: %{public}@", buf, 0x20u);

  }
  -[HDSPSleepStoreServer syncAnchorContainer](self, "syncAnchorContainer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "incrementSleepEventRecordSyncAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDSPSleepStoreServer connectionListener](self, "connectionListener");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v5;
  v25 = v17;
  v26 = v12;
  v19 = v12;
  v20 = v17;
  v21 = v5;
  -[HDSPSleepStoreServer _checkForSuspendedBlock](self, "_checkForSuspendedBlock", v10, 3221225472, __76__HDSPSleepStoreServer_sleepScheduleModelManager_didUpdateSleepEventRecord___block_invoke_203, &unk_24D4E4728);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "performRemoteBlockOnClients:passingTest:", &v23, v22);

}

BOOL __76__HDSPSleepStoreServer_sleepScheduleModelManager_didUpdateSleepEventRecord___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) == a2;
}

void __76__HDSPSleepStoreServer_sleepScheduleModelManager_didUpdateSleepEventRecord___block_invoke_203(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "objectWithSyncAnchor:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "clientIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sleepEventRecordChanged:clientIdentifier:", v7, v6);

}

- (void)sleepEventIsDue:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v17 = (id)objc_opt_class();
    v18 = 2114;
    v19 = v4;
    v6 = v17;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleepEventIsDue: %{public}@", buf, 0x16u);

  }
  -[HDSPSleepStoreServer syncAnchorContainer](self, "syncAnchorContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "incrementSleepEventSyncAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDSPSleepStoreServer connectionListener](self, "connectionListener");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v14 = v4;
  v15 = v8;
  v10 = v8;
  v11 = v4;
  -[HDSPSleepStoreServer _checkForSuspendedBlock](self, "_checkForSuspendedBlock", v13, 3221225472, __40__HDSPSleepStoreServer_sleepEventIsDue___block_invoke, &unk_24D4E4750);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "performRemoteBlockOnClients:passingTest:", &v13, v12);

}

void __40__HDSPSleepStoreServer_sleepEventIsDue___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "objectWithSyncAnchor:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sleepEventOccurred:", v5);

}

- (id)eventIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEA98F8], "standardEventIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = *MEMORY[0x24BEA95C0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)sleepScheduleStateDidChange:(unint64_t)a3 previousState:(unint64_t)a4 reason:(unint64_t)a5
{
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  unint64_t v21;
  unint64_t v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_opt_class();
    v11 = v10;
    NSStringFromHKSPSleepScheduleState();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromHKSPSleepScheduleStateChangeReason();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v24 = v10;
    v25 = 2114;
    v26 = v12;
    v27 = 2114;
    v28 = v13;
    _os_log_impl(&dword_21610C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleepScheduleStateDidChange: %{public}@ (%{public}@)", buf, 0x20u);

  }
  if (a3 != a4)
  {
    -[HDSPSleepStoreServer syncAnchorContainer](self, "syncAnchorContainer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "incrementSleepScheduleStateSyncAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDSPSleepStoreServer connectionListener](self, "connectionListener");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __73__HDSPSleepStoreServer_sleepScheduleStateDidChange_previousState_reason___block_invoke;
    v19[3] = &unk_24D4E4778;
    v21 = a3;
    v22 = a5;
    v20 = v15;
    v17 = v15;
    -[HDSPSleepStoreServer _checkForSuspendedBlock](self, "_checkForSuspendedBlock");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "performRemoteBlockOnClients:passingTest:", v19, v18);

  }
}

void __73__HDSPSleepStoreServer_sleepScheduleStateDidChange_previousState_reason___block_invoke(_QWORD *a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x24BEA9940];
  v4 = a2;
  v5 = (id)objc_msgSend([v3 alloc], "initWithScheduleState:changeReason:syncAnchor:", a1[5], a1[6], a1[4]);
  objc_msgSend(v4, "sleepScheduleStateChanged:", v5);

}

- (void)sleepModeDidChange:(int64_t)a3 previousMode:(int64_t)a4 reason:(unint64_t)a5
{
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  int64_t v20;
  unint64_t v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  int64_t v25;
  __int16 v26;
  int64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_opt_class();
    v11 = v10;
    NSStringFromHKSPSleepModeChangeReason();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v23 = v10;
    v24 = 2048;
    v25 = a3;
    v26 = 2048;
    v27 = a4;
    v28 = 2114;
    v29 = v12;
    _os_log_impl(&dword_21610C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleepModeDidChange: %ld previousMode: %ld reason: %{public}@", buf, 0x2Au);

  }
  if (a3 != a4)
  {
    -[HDSPSleepStoreServer syncAnchorContainer](self, "syncAnchorContainer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "incrementSleepModeSyncAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDSPSleepStoreServer connectionListener](self, "connectionListener");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __63__HDSPSleepStoreServer_sleepModeDidChange_previousMode_reason___block_invoke;
    v18[3] = &unk_24D4E4778;
    v20 = a3;
    v21 = a5;
    v19 = v14;
    v16 = v14;
    -[HDSPSleepStoreServer _checkForSuspendedBlock](self, "_checkForSuspendedBlock");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "performRemoteBlockOnClients:passingTest:", v18, v17);

  }
}

void __63__HDSPSleepStoreServer_sleepModeDidChange_previousMode_reason___block_invoke(_QWORD *a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x24BEA9920];
  v4 = a2;
  v5 = (id)objc_msgSend([v3 alloc], "initWithSleepMode:changeReason:syncAnchor:", a1[5], a1[6], a1[4]);
  objc_msgSend(v4, "sleepModeChanged:", v5);

}

- (id)_checkForSuspendedBlock
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __47__HDSPSleepStoreServer__checkForSuspendedBlock__block_invoke;
  v3[3] = &unk_24D4E4700;
  v3[4] = self;
  return (id)MEMORY[0x2199F586C](v3, a2);
}

uint64_t __47__HDSPSleepStoreServer__checkForSuspendedBlock__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  NSObject *v5;
  id v6;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "isProcessSuspended:", objc_msgSend(v3, "processID"));
  if (v4)
  {
    HKSPLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543618;
      v9 = (id)objc_opt_class();
      v10 = 2114;
      v11 = v3;
      v6 = v9;
      _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] skipping notification to suspended client: %{public}@", (uint8_t *)&v8, 0x16u);

    }
  }

  return v4 ^ 1u;
}

- (void)_notifyClient:(id)a3 forMissedMessagesWithSyncAnchorContainer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;

  v6 = a3;
  v7 = a4;
  -[HDSPSleepStoreServer syncAnchorContainer](self, "syncAnchorContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __79__HDSPSleepStoreServer__notifyClient_forMissedMessagesWithSyncAnchorContainer___block_invoke;
  v21[3] = &unk_24D4E47A0;
  v21[4] = self;
  v22 = v6;
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __79__HDSPSleepStoreServer__notifyClient_forMissedMessagesWithSyncAnchorContainer___block_invoke_3;
  v19[3] = &unk_24D4E47A0;
  v19[4] = self;
  v20 = v22;
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __79__HDSPSleepStoreServer__notifyClient_forMissedMessagesWithSyncAnchorContainer___block_invoke_5;
  v17[3] = &unk_24D4E47A0;
  v17[4] = self;
  v18 = v20;
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __79__HDSPSleepStoreServer__notifyClient_forMissedMessagesWithSyncAnchorContainer___block_invoke_7;
  v15[3] = &unk_24D4E47A0;
  v15[4] = self;
  v16 = v18;
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __79__HDSPSleepStoreServer__notifyClient_forMissedMessagesWithSyncAnchorContainer___block_invoke_9;
  v13[3] = &unk_24D4E47A0;
  v13[4] = self;
  v14 = v16;
  v11[0] = v9;
  v11[1] = 3221225472;
  v11[2] = __79__HDSPSleepStoreServer__notifyClient_forMissedMessagesWithSyncAnchorContainer___block_invoke_11;
  v11[3] = &unk_24D4E47A0;
  v11[4] = self;
  v12 = v14;
  v10 = v14;
  objc_msgSend(v8, "compareWithContainer:sleepScheduleSyncAnchorOutOfDate:sleepSettingsSyncAnchorOutOfDate:sleepEventRecordSyncAnchorOutOfDate:sleepScheduleStateSyncAnchorOutOfDate:sleepModeSyncAnchorOutOfDate:sleepEventSyncAnchorOutOfDate:", v7, v21, v19, v17, v15, v13, v11);

}

void __79__HDSPSleepStoreServer__notifyClient_forMissedMessagesWithSyncAnchorContainer___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "connectionListener");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __79__HDSPSleepStoreServer__notifyClient_forMissedMessagesWithSyncAnchorContainer___block_invoke_2;
  v8[3] = &unk_24D4E4750;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v8[4] = v5;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "performRemoteBlock:onClient:", v8, v6);

}

void __79__HDSPSleepStoreServer__notifyClient_forMissedMessagesWithSyncAnchorContainer___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "environment");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sleepScheduleModelManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sleepSchedule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPSleepScheduleWrapWithSyncAnchor();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sleepScheduleChanged:clientIdentifier:", v6, 0);

}

void __79__HDSPSleepStoreServer__notifyClient_forMissedMessagesWithSyncAnchorContainer___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "connectionListener");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __79__HDSPSleepStoreServer__notifyClient_forMissedMessagesWithSyncAnchorContainer___block_invoke_4;
  v8[3] = &unk_24D4E4750;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v8[4] = v5;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "performRemoteBlock:onClient:", v8, v6);

}

void __79__HDSPSleepStoreServer__notifyClient_forMissedMessagesWithSyncAnchorContainer___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "environment");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sleepScheduleModelManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sleepSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectWithSyncAnchor:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sleepSettingsChanged:clientIdentifier:", v7, 0);

}

void __79__HDSPSleepStoreServer__notifyClient_forMissedMessagesWithSyncAnchorContainer___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "connectionListener");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __79__HDSPSleepStoreServer__notifyClient_forMissedMessagesWithSyncAnchorContainer___block_invoke_6;
  v8[3] = &unk_24D4E4750;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v8[4] = v5;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "performRemoteBlock:onClient:", v8, v6);

}

void __79__HDSPSleepStoreServer__notifyClient_forMissedMessagesWithSyncAnchorContainer___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "environment");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sleepScheduleModelManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sleepEventRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectWithSyncAnchor:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sleepEventRecordChanged:clientIdentifier:", v7, 0);

}

void __79__HDSPSleepStoreServer__notifyClient_forMissedMessagesWithSyncAnchorContainer___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "connectionListener");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __79__HDSPSleepStoreServer__notifyClient_forMissedMessagesWithSyncAnchorContainer___block_invoke_8;
  v8[3] = &unk_24D4E4750;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v8[4] = v5;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "performRemoteBlock:onClient:", v8, v6);

}

void __79__HDSPSleepStoreServer__notifyClient_forMissedMessagesWithSyncAnchorContainer___block_invoke_8(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (objc_class *)MEMORY[0x24BEA9940];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(*(id *)(a1 + 32), "environment");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sleepCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithScheduleState:changeReason:syncAnchor:", objc_msgSend(v6, "currentSleepScheduleState"), 6, *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "sleepScheduleStateChanged:", v7);

}

void __79__HDSPSleepStoreServer__notifyClient_forMissedMessagesWithSyncAnchorContainer___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "connectionListener");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __79__HDSPSleepStoreServer__notifyClient_forMissedMessagesWithSyncAnchorContainer___block_invoke_10;
  v8[3] = &unk_24D4E4750;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v8[4] = v5;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "performRemoteBlock:onClient:", v8, v6);

}

void __79__HDSPSleepStoreServer__notifyClient_forMissedMessagesWithSyncAnchorContainer___block_invoke_10(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (objc_class *)MEMORY[0x24BEA9920];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(*(id *)(a1 + 32), "environment");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sleepModeManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithSleepMode:changeReason:syncAnchor:", objc_msgSend(v6, "sleepMode"), 10, *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "sleepModeChanged:", v7);

}

void __79__HDSPSleepStoreServer__notifyClient_forMissedMessagesWithSyncAnchorContainer___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "connectionListener");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __79__HDSPSleepStoreServer__notifyClient_forMissedMessagesWithSyncAnchorContainer___block_invoke_12;
  v8[3] = &unk_24D4E4750;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v8[4] = v5;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "performRemoteBlock:onClient:", v8, v6);

}

void __79__HDSPSleepStoreServer__notifyClient_forMissedMessagesWithSyncAnchorContainer___block_invoke_12(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "environment");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sleepScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastStandardSleepEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectWithSyncAnchor:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sleepEventOccurred:", v7);

}

- (void)processNoLongerSuspended:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __49__HDSPSleepStoreServer_processNoLongerSuspended___block_invoke;
  v3[3] = &unk_24D4E3EC8;
  v3[4] = self;
  v4 = a3;
  -[HDSPSleepStoreServer _performWhenEnvironmentIsReady:](self, "_performWhenEnvironmentIsReady:", v3);
}

void __49__HDSPSleepStoreServer_processNoLongerSuspended___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "connectionListener");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connectedClientsWithPID:", *(unsigned int *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __49__HDSPSleepStoreServer_processNoLongerSuspended___block_invoke_2;
  v4[3] = &unk_24D4E47F0;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "na_each:", v4);

}

void __49__HDSPSleepStoreServer_processNoLongerSuspended___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v11 = (id)objc_opt_class();
    v12 = 2114;
    v13 = v3;
    v5 = v11;
    _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] asking newly running client to check in: %{public}@", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "connectionListener");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__HDSPSleepStoreServer_processNoLongerSuspended___block_invoke_207;
  v8[3] = &unk_24D4E4750;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v7 = v3;
  objc_msgSend(v6, "performRemoteBlock:onClient:", v8, v7);

}

void __49__HDSPSleepStoreServer_processNoLongerSuspended___block_invoke_207(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__HDSPSleepStoreServer_processNoLongerSuspended___block_invoke_2_208;
  v6[3] = &unk_24D4E47C8;
  v4 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  objc_msgSend(v5, "clientShouldCheckInWithCompletion:", v6);

}

void __49__HDSPSleepStoreServer_processNoLongerSuspended___block_invoke_2_208(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  id v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_opt_class();
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543874;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    v12 = 2114;
    v13 = v3;
    v7 = v5;
    _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] check in received from %{public}@ with container: %{public}@", (uint8_t *)&v8, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_notifyClient:forMissedMessagesWithSyncAnchorContainer:", *(_QWORD *)(a1 + 48), v3);

}

- (void)processDidBecomeSuspended:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __50__HDSPSleepStoreServer_processDidBecomeSuspended___block_invoke;
  v3[3] = &unk_24D4E3EC8;
  v3[4] = self;
  v4 = a3;
  -[HDSPSleepStoreServer _performWhenEnvironmentIsReady:](self, "_performWhenEnvironmentIsReady:", v3);
}

void __50__HDSPSleepStoreServer_processDidBecomeSuspended___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "connectionListener");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connectedClientsWithPID:", *(unsigned int *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __50__HDSPSleepStoreServer_processDidBecomeSuspended___block_invoke_2;
  v4[3] = &unk_24D4E47F0;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "na_each:", v4);

}

void __50__HDSPSleepStoreServer_processDidBecomeSuspended___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  id v4;
  int v5;
  id v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543618;
    v6 = (id)objc_opt_class();
    v7 = 2114;
    v8 = v2;
    v4 = v6;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] client did become suspended: %{public}@", (uint8_t *)&v5, 0x16u);

  }
}

- (id)diagnosticDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HDSPSleepStoreServer syncAnchorContainer](self, "syncAnchorContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPSleepStoreServer connectionListener](self, "connectionListener");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "connectedClients");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Sync Anchor Container: %@\nConnected Clients: %@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)diagnosticInfo
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  -[HDSPSleepStoreServer connectionListener](self, "connectionListener");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connectedClients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "na_map:", &__block_literal_global_214);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = v5;
  else
    v6 = CFSTR("none");
  v9 = CFSTR("Connected Clients");
  v10[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __38__HDSPSleepStoreServer_diagnosticInfo__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = a2;
  v4 = objc_msgSend(v3, "processID");
  objc_msgSend(v3, "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "loggingIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("(pid: %ul, id: %@)"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (HDSPProcessStateManager)processStateManager
{
  return self->_processStateManager;
}

- (void)setSyncAnchorContainer:(id)a3
{
  objc_storeStrong((id *)&self->_syncAnchorContainer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncAnchorContainer, 0);
  objc_storeStrong((id *)&self->_processStateManager, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_destroyWeak((id *)&self->_environment);
}

@end
