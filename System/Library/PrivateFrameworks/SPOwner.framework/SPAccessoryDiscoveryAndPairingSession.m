@implementation SPAccessoryDiscoveryAndPairingSession

- (SPAccessoryDiscoveryAndPairingSession)init
{
  return -[SPAccessoryDiscoveryAndPairingSession initWithPreviousState:](self, "initWithPreviousState:", 0);
}

- (SPAccessoryDiscoveryAndPairingSession)initWithPreviousState:(id)a3
{
  id v4;
  SPAccessoryDiscoveryAndPairingSession *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *callbackQueue;
  SPAccessoryDiscoverySessionState *v12;
  SPAccessoryDiscoverySessionState *state;
  SPAccessoryDiscoverySessionState *v14;
  uint64_t v15;
  SPAccessoryDiscoverySessionState *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SPAccessoryDiscoveryAndPairingSession;
  v5 = -[SPAccessoryDiscoveryAndPairingSession init](&v18, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.icloud.searchpartyd.SPAccessoryDiscoverySession", v6);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.icloud.searchpartyd.SPAccessoryDiscoverySession.callback", v9);
    callbackQueue = v5->_callbackQueue;
    v5->_callbackQueue = (OS_dispatch_queue *)v10;

    if (v4)
    {
      v12 = (SPAccessoryDiscoverySessionState *)v4;
      state = v5->_state;
      v5->_state = v12;
    }
    else
    {
      v14 = [SPAccessoryDiscoverySessionState alloc];
      state = (SPAccessoryDiscoverySessionState *)objc_alloc_init(MEMORY[0x1E0C99E60]);
      v15 = -[SPAccessoryDiscoverySessionState initWithAccessories:](v14, "initWithAccessories:", state);
      v16 = v5->_state;
      v5->_state = (SPAccessoryDiscoverySessionState *)v15;

    }
  }

  return v5;
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
  LogCategory_AccessoryDiscovery();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "SPAccessoryDiscoverySession: interruptionHandler %@", buf, 0xCu);
  }

  -[SPAccessoryDiscoveryAndPairingSession sessionInvalidatedCallback](self, "sessionInvalidatedCallback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SPAccessoryDiscoveryAndPairingSession callbackQueue](self, "callbackQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__SPAccessoryDiscoveryAndPairingSession_interruptionHandler___block_invoke;
    block[3] = &unk_1E5E16668;
    block[4] = self;
    dispatch_sync(v7, block);

  }
}

void __61__SPAccessoryDiscoveryAndPairingSession_interruptionHandler___block_invoke(uint64_t a1)
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
  LogCategory_AccessoryDiscovery();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "SPAccessoryDiscoverySession: invalidationHandler %@", buf, 0xCu);
  }

  -[SPAccessoryDiscoveryAndPairingSession setSession:](self, "setSession:", 0);
  -[SPAccessoryDiscoveryAndPairingSession sessionInvalidatedCallback](self, "sessionInvalidatedCallback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SPAccessoryDiscoveryAndPairingSession callbackQueue](self, "callbackQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__SPAccessoryDiscoveryAndPairingSession_invalidationHandler___block_invoke;
    block[3] = &unk_1E5E16668;
    block[4] = self;
    dispatch_sync(v7, block);

  }
}

void __61__SPAccessoryDiscoveryAndPairingSession_invalidationHandler___block_invoke(uint64_t a1)
{
  void (**v1)(void);

  objc_msgSend(*(id *)(a1 + 32), "sessionInvalidatedCallback");
  v1 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v1[2]();

}

- (SPAccessoryDiscoveryXPCProtocol)proxy
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
  -[SPAccessoryDiscoveryAndPairingSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SPAccessoryDiscoveryAndPairingSession session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[SPAccessoryDiscoveryAndPairingSession serviceDescription](self, "serviceDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_initWeak(location, self);
      v6 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __46__SPAccessoryDiscoveryAndPairingSession_proxy__block_invoke;
      aBlock[3] = &unk_1E5E16690;
      objc_copyWeak(&v26, location);
      v7 = _Block_copy(aBlock);
      v23[0] = v6;
      v23[1] = 3221225472;
      v23[2] = __46__SPAccessoryDiscoveryAndPairingSession_proxy__block_invoke_2;
      v23[3] = &unk_1E5E16690;
      objc_copyWeak(&v24, location);
      v8 = _Block_copy(v23);
      v9 = objc_alloc(MEMORY[0x1E0D20238]);
      +[SPAccessoryDiscoveryAndPairingSession exportedInterface](SPAccessoryDiscoveryAndPairingSession, "exportedInterface");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[SPAccessoryDiscoveryAndPairingSession remoteInterface](SPAccessoryDiscoveryAndPairingSession, "remoteInterface");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v9, "initWithMachServiceName:options:exportedObject:exportedInterface:remoteObjectInterface:interruptionHandler:invalidationHandler:", CFSTR("com.apple.icloud.searchpartyd.accessorydiscoverysession"), 0, self, v10, v11, v7, v8);
      -[SPAccessoryDiscoveryAndPairingSession setServiceDescription:](self, "setServiceDescription:", v12);

      objc_destroyWeak(&v24);
      objc_destroyWeak(&v26);
      objc_destroyWeak(location);
    }
    v13 = objc_alloc(MEMORY[0x1E0D20240]);
    -[SPAccessoryDiscoveryAndPairingSession serviceDescription](self, "serviceDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithServiceDescription:", v14);
    -[SPAccessoryDiscoveryAndPairingSession setSession:](self, "setSession:", v15);

    LogCategory_AccessoryDiscovery();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      -[SPAccessoryDiscoveryAndPairingSession serviceDescription](self, "serviceDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "machService");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v18;
      _os_log_impl(&dword_1AEA79000, v16, OS_LOG_TYPE_DEFAULT, "SPAccessoryDiscoverySession: Establishing XPC connection to %@", (uint8_t *)location, 0xCu);

    }
    -[SPAccessoryDiscoveryAndPairingSession session](self, "session");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "resume");

  }
  -[SPAccessoryDiscoveryAndPairingSession session](self, "session");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "proxy");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return (SPAccessoryDiscoveryXPCProtocol *)v21;
}

void __46__SPAccessoryDiscoveryAndPairingSession_proxy__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "interruptionHandler:", v3);

}

void __46__SPAccessoryDiscoveryAndPairingSession_proxy__block_invoke_2(uint64_t a1, void *a2)
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
  if (exportedInterface_onceToken_7 != -1)
    dispatch_once(&exportedInterface_onceToken_7, &__block_literal_global_16);
  return (id)exportedInterface_interface_7;
}

void __58__SPAccessoryDiscoveryAndPairingSession_exportedInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE24088);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)exportedInterface_interface_7;
  exportedInterface_interface_7 = v0;

}

+ (id)remoteInterface
{
  if (remoteInterface_onceToken_9 != -1)
    dispatch_once(&remoteInterface_onceToken_9, &__block_literal_global_141);
  return (id)remoteInterface_interface_8;
}

void __56__SPAccessoryDiscoveryAndPairingSession_remoteInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE27C18);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)remoteInterface_interface_8;
  remoteInterface_interface_8 = v0;

}

- (void)startAccessoryDiscoveryWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD activity_block[5];
  id v7;

  v4 = a3;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __79__SPAccessoryDiscoveryAndPairingSession_startAccessoryDiscoveryWithCompletion___block_invoke;
  activity_block[3] = &unk_1E5E16720;
  activity_block[4] = self;
  v7 = v4;
  v5 = v4;
  _os_activity_initiate(&dword_1AEA79000, "SPAccessoryDiscoverySession.start", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __79__SPAccessoryDiscoveryAndPairingSession_startAccessoryDiscoveryWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  uint8_t buf[16];

  LogCategory_AccessoryDiscovery();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "-[SPAccessoryDiscoverySession start]", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __79__SPAccessoryDiscoveryAndPairingSession_startAccessoryDiscoveryWithCompletion___block_invoke_160;
  v5[3] = &unk_1E5E16720;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  dispatch_sync(v3, v5);

}

void __79__SPAccessoryDiscoveryAndPairingSession_startAccessoryDiscoveryWithCompletion___block_invoke_160(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  objc_msgSend(*(id *)(a1 + 32), "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessories:", v2);

  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __79__SPAccessoryDiscoveryAndPairingSession_startAccessoryDiscoveryWithCompletion___block_invoke_2;
  v5[3] = &unk_1E5E166F8;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "startAccessoryDiscoveryWithCompletion:", v5);

}

void __79__SPAccessoryDiscoveryAndPairingSession_startAccessoryDiscoveryWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  LogCategory_AccessoryDiscovery();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __79__SPAccessoryDiscoveryAndPairingSession_startAccessoryDiscoveryWithCompletion___block_invoke_2_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "-[SPAccessoryDiscoverySession start] completion", v6, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)stop
{
  _QWORD activity_block[5];

  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __45__SPAccessoryDiscoveryAndPairingSession_stop__block_invoke;
  activity_block[3] = &unk_1E5E16668;
  activity_block[4] = self;
  _os_activity_initiate(&dword_1AEA79000, "SPAccessoryDiscoverySession.stop", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __45__SPAccessoryDiscoveryAndPairingSession_stop__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[16];

  LogCategory_AccessoryDiscovery();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "-[SPAccessoryDiscoverySession stop]", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__SPAccessoryDiscoveryAndPairingSession_stop__block_invoke_162;
  block[3] = &unk_1E5E16668;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_sync(v3, block);

}

uint64_t __45__SPAccessoryDiscoveryAndPairingSession_stop__block_invoke_162(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "setServiceDescription:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setAccessoryDiscoveredCallback:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setSessionInvalidatedCallback:", 0);
  objc_msgSend(*(id *)(a1 + 32), "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

  return objc_msgSend(*(id *)(a1 + 32), "setSession:", 0);
}

- (void)stopAccessoryDiscoveryWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD activity_block[5];
  id v7;

  v4 = a3;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __78__SPAccessoryDiscoveryAndPairingSession_stopAccessoryDiscoveryWithCompletion___block_invoke;
  activity_block[3] = &unk_1E5E16720;
  activity_block[4] = self;
  v7 = v4;
  v5 = v4;
  _os_activity_initiate(&dword_1AEA79000, "SPAccessoryDiscoverySession.stopAccessoryDiscovery", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __78__SPAccessoryDiscoveryAndPairingSession_stopAccessoryDiscoveryWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  uint8_t buf[16];

  LogCategory_AccessoryDiscovery();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "-[SPAccessoryDiscoverySession stopAccessoryDiscovery]", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __78__SPAccessoryDiscoveryAndPairingSession_stopAccessoryDiscoveryWithCompletion___block_invoke_163;
  v5[3] = &unk_1E5E16720;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  dispatch_sync(v3, v5);

}

void __78__SPAccessoryDiscoveryAndPairingSession_stopAccessoryDiscoveryWithCompletion___block_invoke_163(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __78__SPAccessoryDiscoveryAndPairingSession_stopAccessoryDiscoveryWithCompletion___block_invoke_2;
  v3[3] = &unk_1E5E166F8;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "stopAccessoryDiscoveryWithCompletion:", v3);

}

void __78__SPAccessoryDiscoveryAndPairingSession_stopAccessoryDiscoveryWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  LogCategory_AccessoryDiscovery();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __78__SPAccessoryDiscoveryAndPairingSession_stopAccessoryDiscoveryWithCompletion___block_invoke_2_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "-[SPAccessoryDiscoverySession stopAccessoryDiscovery] completion)", v6, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)discoveredAccessory:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  LogCategory_AccessoryDiscovery();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "discoveredAccessory() called from daemon", buf, 2u);
  }

  -[SPAccessoryDiscoveryAndPairingSession queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__SPAccessoryDiscoveryAndPairingSession_discoveredAccessory___block_invoke;
  v8[3] = &unk_1E5E16818;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v6, v8);

}

void __61__SPAccessoryDiscoveryAndPairingSession_discoveredAccessory___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  uint64_t v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 40));

  if (v4)
  {
    LogCategory_AccessoryDiscovery();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v21 = v6;
      _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "Ignoring known accessory %@.", buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "state");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessories");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "state");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "accessories");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setByAddingObject:", *(_QWORD *)(a1 + 40));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 40));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __61__SPAccessoryDiscoveryAndPairingSession_discoveredAccessory___block_invoke_164;
    v17 = &unk_1E5E16818;
    v18 = *(_QWORD *)(a1 + 32);
    v19 = v11;
    v5 = v11;
    dispatch_async(v12, &v14);

    objc_msgSend(*(id *)(a1 + 32), "state", v14, v15, v16, v17, v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAccessories:", v5);

  }
}

void __61__SPAccessoryDiscoveryAndPairingSession_discoveredAccessory___block_invoke_164(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "accessoryDiscoveredCallback");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 40));

}

- (void)lostAccessory:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  LogCategory_AccessoryDiscovery();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "lostAccessory() called from daemon", buf, 2u);
  }

  -[SPAccessoryDiscoveryAndPairingSession queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__SPAccessoryDiscoveryAndPairingSession_lostAccessory___block_invoke;
  v8[3] = &unk_1E5E16818;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v6, v8);

}

void __55__SPAccessoryDiscoveryAndPairingSession_lostAccessory___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToSet:", v4);

  if ((v7 & 1) == 0)
  {
    v8 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(*(id *)(a1 + 32), "state");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAccessories:", v8);

    objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__SPAccessoryDiscoveryAndPairingSession_lostAccessory___block_invoke_2;
    block[3] = &unk_1E5E16668;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(v10, block);

  }
}

void __55__SPAccessoryDiscoveryAndPairingSession_lostAccessory___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void (**v4)(id, void *);

  objc_msgSend(*(id *)(a1 + 32), "accessoryDiscoveredCallback");
  v4 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v3);

}

- (void)accessoryDiscoveryError:(id)a3
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
  LogCategory_AccessoryDiscovery();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "[accessoryDiscoveryError called from client]. Error %@", buf, 0xCu);
  }

  -[SPAccessoryDiscoveryAndPairingSession callbackQueue](self, "callbackQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__SPAccessoryDiscoveryAndPairingSession_accessoryDiscoveryError___block_invoke;
  v8[3] = &unk_1E5E16818;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v6, v8);

}

void __65__SPAccessoryDiscoveryAndPairingSession_accessoryDiscoveryError___block_invoke(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "accessoryDiscoveryErrorCallback");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 40));

}

- (void)initiatePairingWith:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  LogCategory_AccessoryDiscovery();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v6;
    _os_log_impl(&dword_1AEA79000, v8, OS_LOG_TYPE_DEFAULT, "[SPAccessoryDiscoverySession initiatePairingWith]. Accessory %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  -[SPAccessoryDiscoveryAndPairingSession queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__SPAccessoryDiscoveryAndPairingSession_initiatePairingWith_completion___block_invoke;
  block[3] = &unk_1E5E16748;
  objc_copyWeak(&v15, (id *)buf);
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __72__SPAccessoryDiscoveryAndPairingSession_initiatePairingWith_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "initiatePairingWith:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)startLocalFindableAccessoryDiscoveryWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD activity_block[5];
  id v7;

  v4 = a3;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __92__SPAccessoryDiscoveryAndPairingSession_startLocalFindableAccessoryDiscoveryWithCompletion___block_invoke;
  activity_block[3] = &unk_1E5E16720;
  activity_block[4] = self;
  v7 = v4;
  v5 = v4;
  _os_activity_initiate(&dword_1AEA79000, "SPAccessoryDiscoverySession.start", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __92__SPAccessoryDiscoveryAndPairingSession_startLocalFindableAccessoryDiscoveryWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  uint8_t buf[16];

  LogCategory_AccessoryDiscovery();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "-[SPAccessoryDiscoverySession start]", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __92__SPAccessoryDiscoveryAndPairingSession_startLocalFindableAccessoryDiscoveryWithCompletion___block_invoke_165;
  v5[3] = &unk_1E5E16720;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  dispatch_sync(v3, v5);

}

void __92__SPAccessoryDiscoveryAndPairingSession_startLocalFindableAccessoryDiscoveryWithCompletion___block_invoke_165(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  objc_msgSend(*(id *)(a1 + 32), "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessories:", v2);

  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __92__SPAccessoryDiscoveryAndPairingSession_startLocalFindableAccessoryDiscoveryWithCompletion___block_invoke_2;
  v5[3] = &unk_1E5E166F8;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "startLocalFindableAccessoryDiscoveryWithCompletion:", v5);

}

void __92__SPAccessoryDiscoveryAndPairingSession_startLocalFindableAccessoryDiscoveryWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  LogCategory_AccessoryDiscovery();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __92__SPAccessoryDiscoveryAndPairingSession_startLocalFindableAccessoryDiscoveryWithCompletion___block_invoke_2_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "-[SPAccessoryDiscoverySession startLocalFindableAccessoryDiscoveryWithCompletion] completion", v6, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)stopLocalFindableAccessoryDiscoveryWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD activity_block[5];
  id v7;

  v4 = a3;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __91__SPAccessoryDiscoveryAndPairingSession_stopLocalFindableAccessoryDiscoveryWithCompletion___block_invoke;
  activity_block[3] = &unk_1E5E16720;
  activity_block[4] = self;
  v7 = v4;
  v5 = v4;
  _os_activity_initiate(&dword_1AEA79000, "SPAccessoryDiscoverySession.stopAccessoryDiscovery", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __91__SPAccessoryDiscoveryAndPairingSession_stopLocalFindableAccessoryDiscoveryWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  uint8_t buf[16];

  LogCategory_AccessoryDiscovery();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "-[SPAccessoryDiscoverySession stopAccessoryDiscovery]", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __91__SPAccessoryDiscoveryAndPairingSession_stopLocalFindableAccessoryDiscoveryWithCompletion___block_invoke_166;
  v5[3] = &unk_1E5E16720;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  dispatch_sync(v3, v5);

}

void __91__SPAccessoryDiscoveryAndPairingSession_stopLocalFindableAccessoryDiscoveryWithCompletion___block_invoke_166(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __91__SPAccessoryDiscoveryAndPairingSession_stopLocalFindableAccessoryDiscoveryWithCompletion___block_invoke_2;
  v3[3] = &unk_1E5E166F8;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "stopLocalFindableAccessoryDiscoveryWithCompletion:", v3);

}

void __91__SPAccessoryDiscoveryAndPairingSession_stopLocalFindableAccessoryDiscoveryWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  LogCategory_AccessoryDiscovery();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __91__SPAccessoryDiscoveryAndPairingSession_stopLocalFindableAccessoryDiscoveryWithCompletion___block_invoke_2_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "-[SPAccessoryDiscoverySession stopLocalFindableAccessoryDiscoveryWithCompletion] completion)", v6, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)initiatePairingForAccessoryWith:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  id buf[2];

  v6 = a3;
  v7 = a4;
  LogCategory_AccessoryDiscovery();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1AEA79000, v8, OS_LOG_TYPE_DEFAULT, "[SPAccessoryPairingSession initiatePairingForAccessoryWith:completion:]", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  -[SPAccessoryDiscoveryAndPairingSession queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__SPAccessoryDiscoveryAndPairingSession_initiatePairingForAccessoryWith_completion___block_invoke;
  block[3] = &unk_1E5E16748;
  objc_copyWeak(&v15, buf);
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(buf);
}

void __84__SPAccessoryDiscoveryAndPairingSession_initiatePairingForAccessoryWith_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "proxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __84__SPAccessoryDiscoveryAndPairingSession_initiatePairingForAccessoryWith_completion___block_invoke_2;
  v5[3] = &unk_1E5E185A0;
  v4 = *(_QWORD *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "initiatePairingAndLocateAccessoryWithIdentifier:completion:", v4, v5);

}

void __84__SPAccessoryDiscoveryAndPairingSession_initiatePairingForAccessoryWith_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  LogCategory_AccessoryDiscovery();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __84__SPAccessoryDiscoveryAndPairingSession_initiatePairingForAccessoryWith_completion___block_invoke_2_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "-[SPAccessoryPairingSession initiatePairingForAccessoryWith] succeeded!", v6, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)initiatePairingAndLocateAccessoryWith:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  id buf[2];

  v6 = a3;
  v7 = a4;
  LogCategory_AccessoryDiscovery();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1AEA79000, v8, OS_LOG_TYPE_DEFAULT, "[SPAccessoryPairingSession initiatePairingAndLocateAccessoryWith:completion:]", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  -[SPAccessoryDiscoveryAndPairingSession queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__SPAccessoryDiscoveryAndPairingSession_initiatePairingAndLocateAccessoryWith_completion___block_invoke;
  block[3] = &unk_1E5E16748;
  objc_copyWeak(&v15, buf);
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(buf);
}

void __90__SPAccessoryDiscoveryAndPairingSession_initiatePairingAndLocateAccessoryWith_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "proxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __90__SPAccessoryDiscoveryAndPairingSession_initiatePairingAndLocateAccessoryWith_completion___block_invoke_2;
  v5[3] = &unk_1E5E185A0;
  v4 = *(_QWORD *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "initiatePairingAndLocateAccessoryWithIdentifier:completion:", v4, v5);

}

void __90__SPAccessoryDiscoveryAndPairingSession_initiatePairingAndLocateAccessoryWith_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v9[16];

  v5 = a2;
  v6 = a3;
  LogCategory_AccessoryDiscovery();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __84__SPAccessoryDiscoveryAndPairingSession_initiatePairingForAccessoryWith_completion___block_invoke_2_cold_1();
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1AEA79000, v8, OS_LOG_TYPE_DEFAULT, "-[SPAccessoryPairingSession initiatePairingForAccessoryWith] succeeded!", v9, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)pairingStatus:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  id buf[2];

  v6 = a3;
  v7 = a4;
  LogCategory_AccessoryDiscovery();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1AEA79000, v8, OS_LOG_TYPE_DEFAULT, "[SPAccessoryPairingSession pairingStatus:completion:]", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  -[SPAccessoryDiscoveryAndPairingSession queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__SPAccessoryDiscoveryAndPairingSession_pairingStatus_completion___block_invoke;
  block[3] = &unk_1E5E175D8;
  v13 = v6;
  v10 = v6;
  objc_copyWeak(&v15, buf);
  v14 = v7;
  v11 = v7;
  dispatch_async(v9, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(buf);
}

void __66__SPAccessoryDiscoveryAndPairingSession_pairingStatus_completion___block_invoke(uint64_t a1)
{
  SPAccessoryDiscoveryPairingStatusRequest *v2;
  id WeakRetained;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = -[SPAccessoryDiscoveryPairingStatusRequest initWithIdentifier:]([SPAccessoryDiscoveryPairingStatusRequest alloc], "initWithIdentifier:", *(_QWORD *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "proxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__SPAccessoryDiscoveryAndPairingSession_pairingStatus_completion___block_invoke_2;
  v5[3] = &unk_1E5E185C8;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "pairingStatusWithRequest:completion:", v2, v5);

}

void __66__SPAccessoryDiscoveryAndPairingSession_pairingStatus_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = a3;
    (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, objc_msgSend(a2, "pairingStatus"), v5);

  }
}

- (void)pairingStatusWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  id buf[2];

  v6 = a3;
  v7 = a4;
  LogCategory_AccessoryDiscovery();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1AEA79000, v8, OS_LOG_TYPE_DEFAULT, "[SPAccessoryPairingSession pairingStatusWithRequest:completion:]", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  -[SPAccessoryDiscoveryAndPairingSession queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__SPAccessoryDiscoveryAndPairingSession_pairingStatusWithRequest_completion___block_invoke;
  block[3] = &unk_1E5E16748;
  objc_copyWeak(&v15, buf);
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(buf);
}

void __77__SPAccessoryDiscoveryAndPairingSession_pairingStatusWithRequest_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pairingStatusWithRequest:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)finalizePairingWith:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id buf[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  LogCategory_AccessoryDiscovery();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1AEA79000, v11, OS_LOG_TYPE_DEFAULT, "[SPAccessoryDiscoverySession finalizePairingWith]", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  -[SPAccessoryDiscoveryAndPairingSession queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __86__SPAccessoryDiscoveryAndPairingSession_finalizePairingWith_configuration_completion___block_invoke;
  v16[3] = &unk_1E5E178A8;
  objc_copyWeak(&v20, buf);
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  dispatch_async(v12, v16);

  objc_destroyWeak(&v20);
  objc_destroyWeak(buf);
}

void __86__SPAccessoryDiscoveryAndPairingSession_finalizePairingWith_configuration_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finalizePairingWith:configuration:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)invalidatePairingWith:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  id buf[2];

  v6 = a3;
  v7 = a4;
  LogCategory_AccessoryDiscovery();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1AEA79000, v8, OS_LOG_TYPE_DEFAULT, "[SPAccessoryDiscoverySession invalidatePairingWith]", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  -[SPAccessoryDiscoveryAndPairingSession queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__SPAccessoryDiscoveryAndPairingSession_invalidatePairingWith_completion___block_invoke;
  block[3] = &unk_1E5E16748;
  objc_copyWeak(&v15, buf);
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(buf);
}

void __74__SPAccessoryDiscoveryAndPairingSession_invalidatePairingWith_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidatePairingWith:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (SPAccessoryDiscoverySessionState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)sessionInvalidatedCallback
{
  return self->_sessionInvalidatedCallback;
}

- (void)setSessionInvalidatedCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)accessoryDiscoveredCallback
{
  return self->_accessoryDiscoveredCallback;
}

- (void)setAccessoryDiscoveredCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)accessoryDiscoveryErrorCallback
{
  return self->_accessoryDiscoveryErrorCallback;
}

- (void)setAccessoryDiscoveryErrorCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
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
  objc_storeStrong(&self->_accessoryDiscoveryErrorCallback, 0);
  objc_storeStrong(&self->_accessoryDiscoveredCallback, 0);
  objc_storeStrong(&self->_sessionInvalidatedCallback, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

void __79__SPAccessoryDiscoveryAndPairingSession_startAccessoryDiscoveryWithCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AEA79000, v0, v1, "-[SPAccessoryDiscoverySession start] completion. Error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __78__SPAccessoryDiscoveryAndPairingSession_stopAccessoryDiscoveryWithCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AEA79000, v0, v1, "-[SPAccessoryDiscoverySession stopAccessoryDiscovery] completion. Error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __92__SPAccessoryDiscoveryAndPairingSession_startLocalFindableAccessoryDiscoveryWithCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AEA79000, v0, v1, "-[SPAccessoryDiscoverySession startLocalFindableAccessoryDiscoveryWithCompletion] completion. Error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __91__SPAccessoryDiscoveryAndPairingSession_stopLocalFindableAccessoryDiscoveryWithCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AEA79000, v0, v1, "-[SPAccessoryDiscoverySession stopLocalFindableAccessoryDiscoveryWithCompletion] completion. Error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __84__SPAccessoryDiscoveryAndPairingSession_initiatePairingForAccessoryWith_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AEA79000, v0, v1, "-[SPAccessoryPairingSession initiatePairingForAccessoryWith] failed %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
