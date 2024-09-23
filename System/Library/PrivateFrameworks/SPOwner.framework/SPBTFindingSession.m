@implementation SPBTFindingSession

- (SPBTFindingSession)initWithConfig:(id)a3
{
  id v5;
  NSObject *v6;
  SPBTFindingSession *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *callbackQueue;
  objc_super v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  LogCategory_BTFinding();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v5;
    _os_log_impl(&dword_1AEA79000, v6, OS_LOG_TYPE_DEFAULT, "SPBTFindingSession: initWithConfig %@", buf, 0xCu);
  }

  v15.receiver = self;
  v15.super_class = (Class)SPBTFindingSession;
  v7 = -[SPBTFindingSession init](&v15, sel_init);
  if (v7)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.icloud.searchpartyd.SPBTFindingSession", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.icloud.searchpartyd.SPBTFindingSession.callback", v11);
    callbackQueue = v7->_callbackQueue;
    v7->_callbackQueue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v7->_config, a3);
    -[SPBTFindingSession updateConfig:](v7, "updateConfig:", v5);
  }

  return v7;
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
  LogCategory_BTFinding();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "SPBTFindingSession: interruptionHandler %@", buf, 0xCu);
  }

  -[SPBTFindingSession sessionInvalidatedCallback](self, "sessionInvalidatedCallback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SPBTFindingSession callbackQueue](self, "callbackQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__SPBTFindingSession_interruptionHandler___block_invoke;
    block[3] = &unk_1E5E16668;
    block[4] = self;
    dispatch_sync(v7, block);

  }
}

void __42__SPBTFindingSession_interruptionHandler___block_invoke(uint64_t a1)
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
  LogCategory_BTFinding();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "SPBTFindingSession: invalidationHandler %@", buf, 0xCu);
  }

  -[SPBTFindingSession setSession:](self, "setSession:", 0);
  -[SPBTFindingSession sessionInvalidatedCallback](self, "sessionInvalidatedCallback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SPBTFindingSession callbackQueue](self, "callbackQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__SPBTFindingSession_invalidationHandler___block_invoke;
    block[3] = &unk_1E5E16668;
    block[4] = self;
    dispatch_sync(v7, block);

  }
}

void __42__SPBTFindingSession_invalidationHandler___block_invoke(uint64_t a1)
{
  void (**v1)(void);

  objc_msgSend(*(id *)(a1 + 32), "sessionInvalidatedCallback");
  v1 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v1[2]();

}

- (SPBTFindingXPCProtocol)proxy
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
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  _QWORD aBlock[4];
  id v29;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  -[SPBTFindingSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SPBTFindingSession session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[SPBTFindingSession serviceDescription](self, "serviceDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_initWeak(location, self);
      v6 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __27__SPBTFindingSession_proxy__block_invoke;
      aBlock[3] = &unk_1E5E16690;
      objc_copyWeak(&v29, location);
      v7 = _Block_copy(aBlock);
      v26[0] = v6;
      v26[1] = 3221225472;
      v26[2] = __27__SPBTFindingSession_proxy__block_invoke_2;
      v26[3] = &unk_1E5E16690;
      objc_copyWeak(&v27, location);
      v8 = _Block_copy(v26);
      v9 = objc_alloc(MEMORY[0x1E0D20238]);
      +[SPBTFindingSession exportedInterface](SPBTFindingSession, "exportedInterface");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[SPBTFindingSession remoteInterface](SPBTFindingSession, "remoteInterface");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v9, "initWithMachServiceName:options:exportedObject:exportedInterface:remoteObjectInterface:interruptionHandler:invalidationHandler:", CFSTR("com.apple.searchparty.btfindingsession"), 0, self, v10, v11, v7, v8);
      -[SPBTFindingSession setServiceDescription:](self, "setServiceDescription:", v12);

      objc_destroyWeak(&v27);
      objc_destroyWeak(&v29);
      objc_destroyWeak(location);
    }
    v13 = objc_alloc(MEMORY[0x1E0D20240]);
    -[SPBTFindingSession serviceDescription](self, "serviceDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithServiceDescription:", v14);
    -[SPBTFindingSession setSession:](self, "setSession:", v15);

    LogCategory_BTFinding();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      -[SPBTFindingSession serviceDescription](self, "serviceDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "machService");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v18;
      _os_log_impl(&dword_1AEA79000, v16, OS_LOG_TYPE_DEFAULT, "SPBTFindingSession: Establishing XPC connection to %@", (uint8_t *)location, 0xCu);

    }
    -[SPBTFindingSession session](self, "session");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "resume");

    LogCategory_BTFinding();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      -[SPBTFindingSession serviceDescription](self, "serviceDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "machService");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v22;
      _os_log_impl(&dword_1AEA79000, v20, OS_LOG_TYPE_DEFAULT, "SPBTFindingSession: Established XPC connection to %@", (uint8_t *)location, 0xCu);

    }
  }
  -[SPBTFindingSession session](self, "session");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "proxy");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return (SPBTFindingXPCProtocol *)v24;
}

void __27__SPBTFindingSession_proxy__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "interruptionHandler:", v3);

}

void __27__SPBTFindingSession_proxy__block_invoke_2(uint64_t a1, void *a2)
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
  if (exportedInterface_onceToken_4 != -1)
    dispatch_once(&exportedInterface_onceToken_4, &__block_literal_global_8);
  return (id)exportedInterface_interface_4;
}

void __39__SPBTFindingSession_exportedInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE1D608);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)exportedInterface_interface_4;
  exportedInterface_interface_4 = v0;

}

+ (id)remoteInterface
{
  if (remoteInterface_onceToken_5 != -1)
    dispatch_once(&remoteInterface_onceToken_5, &__block_literal_global_58);
  return (id)remoteInterface_interface_4;
}

void __37__SPBTFindingSession_remoteInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE27AF8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)remoteInterface_interface_4;
  remoteInterface_interface_4 = v0;

}

- (void)updateConfig:(id)a3
{
  id v4;
  id v5;
  _QWORD activity_block[5];
  id v7;

  v4 = a3;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __35__SPBTFindingSession_updateConfig___block_invoke;
  activity_block[3] = &unk_1E5E16818;
  activity_block[4] = self;
  v7 = v4;
  v5 = v4;
  _os_activity_initiate(&dword_1AEA79000, "SPBTFindingSession.updateConfig", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __35__SPBTFindingSession_updateConfig___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  uint8_t buf[16];

  LogCategory_BTFinding();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "-[SPBTFindingSession updateConfig]", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__SPBTFindingSession_updateConfig___block_invoke_68;
  v5[3] = &unk_1E5E16818;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  dispatch_async(v3, v5);

}

void __35__SPBTFindingSession_updateConfig___block_invoke_68(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateConfig:completion:", *(_QWORD *)(a1 + 40), &__block_literal_global_70);

}

void __35__SPBTFindingSession_updateConfig___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = a2;
  LogCategory_BTFinding();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __35__SPBTFindingSession_updateConfig___block_invoke_2_cold_1();
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1AEA79000, v4, OS_LOG_TYPE_DEFAULT, "-[SPBTFindingSession updateConfig] completion", v5, 2u);
  }

}

- (void)startFindingBeacon:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD activity_block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __52__SPBTFindingSession_startFindingBeacon_completion___block_invoke;
  activity_block[3] = &unk_1E5E16770;
  activity_block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_1AEA79000, "SPBTFindingSession.start", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __52__SPBTFindingSession_startFindingBeacon_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  _QWORD block[5];
  id v6;
  id v7;
  uint8_t buf[16];

  LogCategory_BTFinding();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "-[SPBTFindingSession start]", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__SPBTFindingSession_startFindingBeacon_completion___block_invoke_71;
  block[3] = &unk_1E5E16770;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v7 = *(id *)(a1 + 48);
  dispatch_sync(v3, block);

}

void __52__SPBTFindingSession_startFindingBeacon_completion___block_invoke_71(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__SPBTFindingSession_startFindingBeacon_completion___block_invoke_2;
  v4[3] = &unk_1E5E166F8;
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "start:completion:", v3, v4);

}

void __52__SPBTFindingSession_startFindingBeacon_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  LogCategory_BTFinding();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __52__SPBTFindingSession_startFindingBeacon_completion___block_invoke_2_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "-[SPBTFindingSession start] completion", v6, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)startFastAdvertisingForBeacon:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD activity_block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __63__SPBTFindingSession_startFastAdvertisingForBeacon_completion___block_invoke;
  activity_block[3] = &unk_1E5E16770;
  activity_block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_1AEA79000, "SPBTFindingSession.startFastAdvertising", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __63__SPBTFindingSession_startFastAdvertisingForBeacon_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  _QWORD block[5];
  id v6;
  id v7;
  uint8_t buf[16];

  LogCategory_BTFinding();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "-[SPBTFindingSession startFastAdvertising]", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__SPBTFindingSession_startFastAdvertisingForBeacon_completion___block_invoke_72;
  block[3] = &unk_1E5E16770;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v7 = *(id *)(a1 + 48);
  dispatch_sync(v3, block);

}

void __63__SPBTFindingSession_startFastAdvertisingForBeacon_completion___block_invoke_72(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__SPBTFindingSession_startFastAdvertisingForBeacon_completion___block_invoke_2;
  v4[3] = &unk_1E5E166F8;
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "startFastAdvertisingForBeacon:completion:", v3, v4);

}

void __63__SPBTFindingSession_startFastAdvertisingForBeacon_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  LogCategory_BTFinding();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __63__SPBTFindingSession_startFastAdvertisingForBeacon_completion___block_invoke_2_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "-[SPBTFindingSession startFastAdvertising] completion", v6, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)stopFastAdvertisingForBeacon:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD activity_block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __62__SPBTFindingSession_stopFastAdvertisingForBeacon_completion___block_invoke;
  activity_block[3] = &unk_1E5E16770;
  activity_block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_1AEA79000, "SPBTFindingSession.stopFastAdvertising", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __62__SPBTFindingSession_stopFastAdvertisingForBeacon_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  _QWORD block[5];
  id v6;
  id v7;
  uint8_t buf[16];

  LogCategory_BTFinding();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "-[SPBTFindingSession stopFastAdvertising]", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__SPBTFindingSession_stopFastAdvertisingForBeacon_completion___block_invoke_73;
  block[3] = &unk_1E5E16770;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v7 = *(id *)(a1 + 48);
  dispatch_sync(v3, block);

}

void __62__SPBTFindingSession_stopFastAdvertisingForBeacon_completion___block_invoke_73(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__SPBTFindingSession_stopFastAdvertisingForBeacon_completion___block_invoke_2;
  v4[3] = &unk_1E5E166F8;
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "stopFastAdvertisingForBeacon:completion:", v3, v4);

}

void __62__SPBTFindingSession_stopFastAdvertisingForBeacon_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  LogCategory_BTFinding();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __62__SPBTFindingSession_stopFastAdvertisingForBeacon_completion___block_invoke_2_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "-[SPBTFindingSession stopFastAdvertising] completion", v6, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)stopFindingBeacon:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD activity_block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __51__SPBTFindingSession_stopFindingBeacon_completion___block_invoke;
  activity_block[3] = &unk_1E5E16770;
  activity_block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_1AEA79000, "SPBTFindingSession.stop", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __51__SPBTFindingSession_stopFindingBeacon_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  _QWORD block[5];
  id v6;
  id v7;
  uint8_t buf[16];

  LogCategory_BTFinding();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "-[SPBTFindingSession stop]", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__SPBTFindingSession_stopFindingBeacon_completion___block_invoke_74;
  block[3] = &unk_1E5E16770;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v7 = *(id *)(a1 + 48);
  dispatch_sync(v3, block);

}

void __51__SPBTFindingSession_stopFindingBeacon_completion___block_invoke_74(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__SPBTFindingSession_stopFindingBeacon_completion___block_invoke_2;
  v4[3] = &unk_1E5E166F8;
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "stop:completion:", v3, v4);

}

void __51__SPBTFindingSession_stopFindingBeacon_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  LogCategory_BTFinding();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __51__SPBTFindingSession_stopFindingBeacon_completion___block_invoke_2_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "-[SPBTFindingSession stop] completion)", v6, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updatedBTRSSIMeasurement:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  LogCategory_BTFinding();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "updatedBTRSSIMeasurement() called from daemon", buf, 2u);
  }

  -[SPBTFindingSession callbackQueue](self, "callbackQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__SPBTFindingSession_updatedBTRSSIMeasurement___block_invoke;
  v8[3] = &unk_1E5E16818;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __47__SPBTFindingSession_updatedBTRSSIMeasurement___block_invoke(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "didUpdateBTRSSIMeasurementCallback");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 40));

}

- (void)updatedBTRSSIResult:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  LogCategory_BTFinding();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "updatedBTRSSIResult() called from daemon", buf, 2u);
  }

  -[SPBTFindingSession callbackQueue](self, "callbackQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__SPBTFindingSession_updatedBTRSSIResult___block_invoke;
  v8[3] = &unk_1E5E16818;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __42__SPBTFindingSession_updatedBTRSSIResult___block_invoke(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "didUpdateBTRSSIResultCallback");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 40));

}

- (void)findingSessionError:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  LogCategory_BTFinding();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v4;
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "[findingSessionError called from client]. Error %{public}@", buf, 0xCu);
  }

  -[SPBTFindingSession callbackQueue](self, "callbackQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__SPBTFindingSession_findingSessionError___block_invoke;
  v8[3] = &unk_1E5E16818;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v6, v8);

}

void __42__SPBTFindingSession_findingSessionError___block_invoke(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "findingSessionErrorCallback");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 40));

}

- (SPBTFindingSessionConfig)config
{
  return self->_config;
}

- (id)sessionInvalidatedCallback
{
  return self->_sessionInvalidatedCallback;
}

- (void)setSessionInvalidatedCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)didUpdateBTRSSIMeasurementCallback
{
  return self->_didUpdateBTRSSIMeasurementCallback;
}

- (void)setDidUpdateBTRSSIMeasurementCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)didUpdateBTRSSIResultCallback
{
  return self->_didUpdateBTRSSIResultCallback;
}

- (void)setDidUpdateBTRSSIResultCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)findingSessionErrorCallback
{
  return self->_findingSessionErrorCallback;
}

- (void)setFindingSessionErrorCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSUUID)beacon
{
  return self->_beacon;
}

- (void)setBeacon:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
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
  objc_storeStrong((id *)&self->_beacon, 0);
  objc_storeStrong(&self->_findingSessionErrorCallback, 0);
  objc_storeStrong(&self->_didUpdateBTRSSIResultCallback, 0);
  objc_storeStrong(&self->_didUpdateBTRSSIMeasurementCallback, 0);
  objc_storeStrong(&self->_sessionInvalidatedCallback, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

void __35__SPBTFindingSession_updateConfig___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AEA79000, v0, v1, "-[SPBTFindingSession updateConfig] completion. Error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __52__SPBTFindingSession_startFindingBeacon_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AEA79000, v0, v1, "-[SPBTFindingSession start] completion. Error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __63__SPBTFindingSession_startFastAdvertisingForBeacon_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AEA79000, v0, v1, "-[SPBTFindingSession startFastAdvertising] completion. Error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __62__SPBTFindingSession_stopFastAdvertisingForBeacon_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AEA79000, v0, v1, "-[SPBTFindingSession stopFastAdvertising] completion. Error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __51__SPBTFindingSession_stopFindingBeacon_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AEA79000, v0, v1, "-[SPBTFindingSession stop] completion. Error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
