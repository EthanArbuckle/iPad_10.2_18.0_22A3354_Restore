@implementation SPLocalFindableConnectionMaterialMonitoringSession

- (SPLocalFindableConnectionMaterialMonitoringSession)init
{
  SPLocalFindableConnectionMaterialMonitoringSession *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *callbackQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SPLocalFindableConnectionMaterialMonitoringSession;
  v2 = -[SPLocalFindableConnectionMaterialMonitoringSession init](&v10, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.icloud.searchpartyd.SPLocalFindableConnectionMaterialMonitoringSession", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.icloud.searchpartyd.SPLocalFindableConnectionMaterialMonitoringSession.callback", v6);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v7;

  }
  return v2;
}

- (void)interruptionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  LogCategory_LocalFindableConnectionMaterialMonitoring();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "SPLocalFindableConnectionMaterialMonitoring: interruptionHandler %@", buf, 0xCu);
  }

  -[SPLocalFindableConnectionMaterialMonitoringSession sessionInvalidatedCallback](self, "sessionInvalidatedCallback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SPLocalFindableConnectionMaterialMonitoringSession callbackQueue](self, "callbackQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__SPLocalFindableConnectionMaterialMonitoringSession_interruptionHandler___block_invoke;
    block[3] = &unk_1E5E16668;
    block[4] = self;
    dispatch_sync(v7, block);

  }
}

void __74__SPLocalFindableConnectionMaterialMonitoringSession_interruptionHandler___block_invoke(uint64_t a1)
{
  void (**v1)(void);

  objc_msgSend(*(id *)(a1 + 32), "sessionInvalidatedCallback");
  v1 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v1[2]();

}

- (void)invalidationHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  LogCategory_LocalFindableConnectionMaterialMonitoring();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "SPLocalFindableConnectionMaterialMonitoring: invalidationHandler %@", buf, 0xCu);
  }

  -[SPLocalFindableConnectionMaterialMonitoringSession setSession:](self, "setSession:", 0);
  -[SPLocalFindableConnectionMaterialMonitoringSession sessionInvalidatedCallback](self, "sessionInvalidatedCallback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SPLocalFindableConnectionMaterialMonitoringSession callbackQueue](self, "callbackQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__SPLocalFindableConnectionMaterialMonitoringSession_invalidationHandler___block_invoke;
    block[3] = &unk_1E5E16668;
    block[4] = self;
    dispatch_sync(v7, block);

  }
}

void __74__SPLocalFindableConnectionMaterialMonitoringSession_invalidationHandler___block_invoke(uint64_t a1)
{
  void (**v1)(void);

  objc_msgSend(*(id *)(a1 + 32), "sessionInvalidatedCallback");
  v1 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v1[2]();

}

- (SPLocalFindableConnectionMaterialMonitoringXPCProtocol)proxy
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  _QWORD aBlock[4];
  id v26;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  -[SPLocalFindableConnectionMaterialMonitoringSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SPLocalFindableConnectionMaterialMonitoringSession session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[SPLocalFindableConnectionMaterialMonitoringSession serviceDescription](self, "serviceDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_initWeak(location, self);
      v6 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __59__SPLocalFindableConnectionMaterialMonitoringSession_proxy__block_invoke;
      aBlock[3] = &unk_1E5E16690;
      objc_copyWeak(&v26, location);
      v7 = _Block_copy(aBlock);
      v23[0] = v6;
      v23[1] = 3221225472;
      v23[2] = __59__SPLocalFindableConnectionMaterialMonitoringSession_proxy__block_invoke_2;
      v23[3] = &unk_1E5E16690;
      objc_copyWeak(&v24, location);
      v8 = _Block_copy(v23);
      v9 = objc_alloc(MEMORY[0x1E0D20238]);
      +[SPLocalFindableConnectionMaterialMonitoringSession exportedInterface](SPLocalFindableConnectionMaterialMonitoringSession, "exportedInterface");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[SPLocalFindableConnectionMaterialMonitoringSession remoteInterface](SPLocalFindableConnectionMaterialMonitoringSession, "remoteInterface");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v9, "initWithMachServiceName:options:exportedObject:exportedInterface:remoteObjectInterface:interruptionHandler:invalidationHandler:", CFSTR("com.apple.icloud.searchpartyd.localFindableConnectionMaterialSession"), 0, self, v10, v11, v7, v8);
      -[SPLocalFindableConnectionMaterialMonitoringSession setServiceDescription:](self, "setServiceDescription:", v12);

      objc_destroyWeak(&v24);
      objc_destroyWeak(&v26);
      objc_destroyWeak(location);
    }
    v13 = objc_alloc(MEMORY[0x1E0D20240]);
    -[SPLocalFindableConnectionMaterialMonitoringSession serviceDescription](self, "serviceDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithServiceDescription:", v14);
    -[SPLocalFindableConnectionMaterialMonitoringSession setSession:](self, "setSession:", v15);

    LogCategory_LocalFindableConnectionMaterialMonitoring();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      -[SPLocalFindableConnectionMaterialMonitoringSession serviceDescription](self, "serviceDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "machService");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v18;
      _os_log_impl(&dword_1AEA79000, v16, OS_LOG_TYPE_DEFAULT, "SPLocalFindableConnectionMaterialMonitoring: Establishing XPC connection to %@", (uint8_t *)location, 0xCu);

    }
    -[SPLocalFindableConnectionMaterialMonitoringSession session](self, "session");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "resume");

  }
  -[SPLocalFindableConnectionMaterialMonitoringSession session](self, "session");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "proxy");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return (SPLocalFindableConnectionMaterialMonitoringXPCProtocol *)v21;
}

void __59__SPLocalFindableConnectionMaterialMonitoringSession_proxy__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "interruptionHandler:", v3);

}

void __59__SPLocalFindableConnectionMaterialMonitoringSession_proxy__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "invalidationHandler:", v3);

}

+ (id)exportedInterface
{
  if (exportedInterface_onceToken != -1)
    dispatch_once(&exportedInterface_onceToken, &__block_literal_global);
  return (id)exportedInterface_interface;
}

void __71__SPLocalFindableConnectionMaterialMonitoringSession_exportedInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE17C00);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)exportedInterface_interface;
  exportedInterface_interface = v0;

}

+ (id)remoteInterface
{
  if (remoteInterface_onceToken != -1)
    dispatch_once(&remoteInterface_onceToken, &__block_literal_global_54);
  return (id)remoteInterface_interface;
}

void __69__SPLocalFindableConnectionMaterialMonitoringSession_remoteInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE27858);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)remoteInterface_interface;
  remoteInterface_interface = v0;

}

- (void)startLocalFindableConnectionMaterialMonitoringWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD activity_block[5];
  id v7;

  v4 = a3;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __115__SPLocalFindableConnectionMaterialMonitoringSession_startLocalFindableConnectionMaterialMonitoringWithCompletion___block_invoke;
  activity_block[3] = &unk_1E5E16720;
  activity_block[4] = self;
  v7 = v4;
  v5 = v4;
  _os_activity_initiate(&dword_1AEA79000, "SPLocalFindableConnectionMaterialMonitoringSession.start", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __115__SPLocalFindableConnectionMaterialMonitoringSession_startLocalFindableConnectionMaterialMonitoringWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  uint8_t buf[16];

  LogCategory_LocalFindableConnectionMaterialMonitoring();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "-[SPLocalFindableConnectionMaterialMonitoringSession start]", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __115__SPLocalFindableConnectionMaterialMonitoringSession_startLocalFindableConnectionMaterialMonitoringWithCompletion___block_invoke_63;
  v5[3] = &unk_1E5E16720;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  dispatch_sync(v3, v5);

}

void __115__SPLocalFindableConnectionMaterialMonitoringSession_startLocalFindableConnectionMaterialMonitoringWithCompletion___block_invoke_63(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __115__SPLocalFindableConnectionMaterialMonitoringSession_startLocalFindableConnectionMaterialMonitoringWithCompletion___block_invoke_2;
  v3[3] = &unk_1E5E166F8;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "startLocalFindableConnectionMaterialMonitoringWithCompletion:", v3);

}

void __115__SPLocalFindableConnectionMaterialMonitoringSession_startLocalFindableConnectionMaterialMonitoringWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12[16];

  v3 = a2;
  LogCategory_LocalFindableConnectionMaterialMonitoring();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __115__SPLocalFindableConnectionMaterialMonitoringSession_startLocalFindableConnectionMaterialMonitoringWithCompletion___block_invoke_2_cold_1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "-[SPLocalFindableConnectionMaterialMonitoringSession start] completion", v12, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)stopLocalFindableConnectionMaterialMonitoringWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD activity_block[5];
  id v7;

  v4 = a3;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __114__SPLocalFindableConnectionMaterialMonitoringSession_stopLocalFindableConnectionMaterialMonitoringWithCompletion___block_invoke;
  activity_block[3] = &unk_1E5E16720;
  activity_block[4] = self;
  v7 = v4;
  v5 = v4;
  _os_activity_initiate(&dword_1AEA79000, "SPLocalFindableConnectionMaterialMonitoringSession.stop", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __114__SPLocalFindableConnectionMaterialMonitoringSession_stopLocalFindableConnectionMaterialMonitoringWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  uint8_t buf[16];

  LogCategory_LocalFindableConnectionMaterialMonitoring();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "-[SPLocalFindableConnectionMaterialMonitoringSession stop]", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __114__SPLocalFindableConnectionMaterialMonitoringSession_stopLocalFindableConnectionMaterialMonitoringWithCompletion___block_invoke_65;
  v5[3] = &unk_1E5E16720;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  dispatch_sync(v3, v5);

}

void __114__SPLocalFindableConnectionMaterialMonitoringSession_stopLocalFindableConnectionMaterialMonitoringWithCompletion___block_invoke_65(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __114__SPLocalFindableConnectionMaterialMonitoringSession_stopLocalFindableConnectionMaterialMonitoringWithCompletion___block_invoke_2;
  v3[3] = &unk_1E5E166F8;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "stopLocalFindableConnectionMaterialMonitoringWithCompletion:", v3);

}

void __114__SPLocalFindableConnectionMaterialMonitoringSession_stopLocalFindableConnectionMaterialMonitoringWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12[16];

  v3 = a2;
  LogCategory_LocalFindableConnectionMaterialMonitoring();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __114__SPLocalFindableConnectionMaterialMonitoringSession_stopLocalFindableConnectionMaterialMonitoringWithCompletion___block_invoke_2_cold_1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "-[SPLocalFindableConnectionMaterialMonitoringSession stop] completion", v12, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)peripheralConnectionMaterialForAccessoryIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD activity_block[4];
  id v11;
  SPLocalFindableConnectionMaterialMonitoringSession *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __116__SPLocalFindableConnectionMaterialMonitoringSession_peripheralConnectionMaterialForAccessoryIdentifier_completion___block_invoke;
  activity_block[3] = &unk_1E5E16770;
  v11 = v6;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_1AEA79000, "SPLocalFindableConnectionMaterialMonitoringSession.peripheralConnectionMaterialForAccessoryIdentifier", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __116__SPLocalFindableConnectionMaterialMonitoringSession_peripheralConnectionMaterialForAccessoryIdentifier_completion___block_invoke(id *a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  LogCategory_OwnerSession();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1[4], "UUIDString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v10 = v3;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "peripheralConnectionMaterial for %@", buf, 0xCu);

  }
  objc_initWeak((id *)buf, a1[5]);
  objc_msgSend(a1[5], "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __116__SPLocalFindableConnectionMaterialMonitoringSession_peripheralConnectionMaterialForAccessoryIdentifier_completion___block_invoke_66;
  block[3] = &unk_1E5E16748;
  objc_copyWeak(&v8, (id *)buf);
  v6 = a1[4];
  v7 = a1[6];
  dispatch_async(v4, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __116__SPLocalFindableConnectionMaterialMonitoringSession_peripheralConnectionMaterialForAccessoryIdentifier_completion___block_invoke_66(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "peripheralConnectionMaterialForAccessoryIdentifier:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)updatedConnectionMaterialForAccessory:(id)a3 connectionMaterial:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[SPLocalFindableConnectionMaterialMonitoringSession callbackQueue](self, "callbackQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __111__SPLocalFindableConnectionMaterialMonitoringSession_updatedConnectionMaterialForAccessory_connectionMaterial___block_invoke;
  block[3] = &unk_1E5E16798;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __111__SPLocalFindableConnectionMaterialMonitoringSession_updatedConnectionMaterialForAccessory_connectionMaterial___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "peripheralConnectionMaterialCallback");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD))v2 + 2))(v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (id)sessionInvalidatedCallback
{
  return self->_sessionInvalidatedCallback;
}

- (void)setSessionInvalidatedCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)peripheralConnectionMaterialCallback
{
  return self->_peripheralConnectionMaterialCallback;
}

- (void)setPeripheralConnectionMaterialCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (FMXPCServiceDescription)serviceDescription
{
  return self->_serviceDescription;
}

- (void)setServiceDescription:(id)a3
{
  objc_storeStrong((id *)&self->_serviceDescription, a3);
}

- (FMXPCSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (void)setProxy:(id)a3
{
  objc_storeStrong((id *)&self->_proxy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_serviceDescription, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_peripheralConnectionMaterialCallback, 0);
  objc_storeStrong(&self->_sessionInvalidatedCallback, 0);
}

void __115__SPLocalFindableConnectionMaterialMonitoringSession_startLocalFindableConnectionMaterialMonitoringWithCompletion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AEA79000, a2, a3, "-[SPLocalFindableConnectionMaterialMonitoringSession start] completion. Error - %@", a5, a6, a7, a8, 2u);
}

void __114__SPLocalFindableConnectionMaterialMonitoringSession_stopLocalFindableConnectionMaterialMonitoringWithCompletion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AEA79000, a2, a3, "-[SPLocalFindableConnectionMaterialMonitoringSession stop] completion. Error - %@", a5, a6, a7, a8, 2u);
}

@end
