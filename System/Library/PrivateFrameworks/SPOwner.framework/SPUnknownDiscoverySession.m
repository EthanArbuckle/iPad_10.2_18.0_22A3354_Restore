@implementation SPUnknownDiscoverySession

- (SPUnknownDiscoverySession)init
{
  return -[SPUnknownDiscoverySession initWithPreviousState:](self, "initWithPreviousState:", 0);
}

- (SPUnknownDiscoverySession)initWithPreviousState:(id)a3
{
  id v4;
  SPUnknownDiscoverySession *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *callbackQueue;
  SPUnknownDiscoverySessionState *v12;
  SPUnknownDiscoverySessionState *state;
  SPUnknownDiscoverySessionState *v14;
  uint64_t v15;
  SPUnknownDiscoverySessionState *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SPUnknownDiscoverySession;
  v5 = -[SPUnknownDiscoverySession init](&v18, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.icloud.searchpartyd.SPUnknownDiscoverySession", v6);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.icloud.searchpartyd.SPUnknownDiscoverySession.callback", v9);
    callbackQueue = v5->_callbackQueue;
    v5->_callbackQueue = (OS_dispatch_queue *)v10;

    if (v4)
    {
      v12 = (SPUnknownDiscoverySessionState *)v4;
      state = v5->_state;
      v5->_state = v12;
    }
    else
    {
      v14 = [SPUnknownDiscoverySessionState alloc];
      state = (SPUnknownDiscoverySessionState *)objc_alloc_init(MEMORY[0x1E0C99E60]);
      v15 = -[SPUnknownDiscoverySessionState initWithUnknownAccessories:](v14, "initWithUnknownAccessories:", state);
      v16 = v5->_state;
      v5->_state = (SPUnknownDiscoverySessionState *)v15;

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
  LogCategory_UnknownDiscovery();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "SPUnknownDiscoverySession: interruptionHandler %@", buf, 0xCu);
  }

  -[SPUnknownDiscoverySession sessionInvalidatedCallback](self, "sessionInvalidatedCallback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SPUnknownDiscoverySession callbackQueue](self, "callbackQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__SPUnknownDiscoverySession_interruptionHandler___block_invoke;
    block[3] = &unk_1E5E16668;
    block[4] = self;
    dispatch_sync(v7, block);

  }
}

void __49__SPUnknownDiscoverySession_interruptionHandler___block_invoke(uint64_t a1)
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
  LogCategory_UnknownDiscovery();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "SPUnknownDiscoverySession: invalidationHandler %@", buf, 0xCu);
  }

  -[SPUnknownDiscoverySession setSession:](self, "setSession:", 0);
  -[SPUnknownDiscoverySession sessionInvalidatedCallback](self, "sessionInvalidatedCallback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SPUnknownDiscoverySession callbackQueue](self, "callbackQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__SPUnknownDiscoverySession_invalidationHandler___block_invoke;
    block[3] = &unk_1E5E16668;
    block[4] = self;
    dispatch_sync(v7, block);

  }
}

void __49__SPUnknownDiscoverySession_invalidationHandler___block_invoke(uint64_t a1)
{
  void (**v1)(void);

  objc_msgSend(*(id *)(a1 + 32), "sessionInvalidatedCallback");
  v1 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v1[2]();

}

- (SPUnknownDiscoveryXPCProtocol)proxy
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
  FMXPCServiceDescription *v12;
  FMXPCServiceDescription *serviceDescription;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[5];
  _QWORD aBlock[5];
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[SPUnknownDiscoverySession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SPUnknownDiscoverySession session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[SPUnknownDiscoverySession serviceDescription](self, "serviceDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __34__SPUnknownDiscoverySession_proxy__block_invoke;
      aBlock[3] = &unk_1E5E167C8;
      aBlock[4] = self;
      v7 = _Block_copy(aBlock);
      v24[0] = v6;
      v24[1] = 3221225472;
      v24[2] = __34__SPUnknownDiscoverySession_proxy__block_invoke_2;
      v24[3] = &unk_1E5E167C8;
      v24[4] = self;
      v8 = _Block_copy(v24);
      v9 = objc_alloc(MEMORY[0x1E0D20238]);
      +[SPUnknownDiscoverySession exportedInterface](SPUnknownDiscoverySession, "exportedInterface");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[SPUnknownDiscoverySession remoteInterface](SPUnknownDiscoverySession, "remoteInterface");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (FMXPCServiceDescription *)objc_msgSend(v9, "initWithMachServiceName:options:exportedObject:exportedInterface:remoteObjectInterface:interruptionHandler:invalidationHandler:", CFSTR("com.apple.icloud.searchpartyd.unknowndiscoverysession"), 0, self, v10, v11, v7, v8);
      serviceDescription = self->_serviceDescription;
      self->_serviceDescription = v12;

    }
    v14 = objc_alloc(MEMORY[0x1E0D20240]);
    -[SPUnknownDiscoverySession serviceDescription](self, "serviceDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithServiceDescription:", v15);
    -[SPUnknownDiscoverySession setSession:](self, "setSession:", v16);

    LogCategory_UnknownDiscovery();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      -[SPUnknownDiscoverySession serviceDescription](self, "serviceDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "machService");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v27 = v19;
      _os_log_impl(&dword_1AEA79000, v17, OS_LOG_TYPE_DEFAULT, "SPUnknownDiscoverySession: Establishing XPC connection to %@", buf, 0xCu);

    }
    -[SPUnknownDiscoverySession session](self, "session");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "resume");

  }
  -[SPUnknownDiscoverySession session](self, "session");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "proxy");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return (SPUnknownDiscoveryXPCProtocol *)v22;
}

uint64_t __34__SPUnknownDiscoverySession_proxy__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "interruptionHandler:", a2);
}

uint64_t __34__SPUnknownDiscoverySession_proxy__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidationHandler:", a2);
}

+ (id)exportedInterface
{
  if (exportedInterface_onceToken_0 != -1)
    dispatch_once(&exportedInterface_onceToken_0, &__block_literal_global_0);
  return (id)exportedInterface_interface_0;
}

void __46__SPUnknownDiscoverySession_exportedInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE182F8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)exportedInterface_interface_0;
  exportedInterface_interface_0 = v0;

}

+ (id)remoteInterface
{
  if (remoteInterface_onceToken_0 != -1)
    dispatch_once(&remoteInterface_onceToken_0, &__block_literal_global_61);
  return (id)remoteInterface_interface_0;
}

void __44__SPUnknownDiscoverySession_remoteInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE278B8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)remoteInterface_interface_0;
  remoteInterface_interface_0 = v0;

}

- (void)startDiscoveryWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD activity_block[5];
  id v7;

  v4 = a3;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __58__SPUnknownDiscoverySession_startDiscoveryWithCompletion___block_invoke;
  activity_block[3] = &unk_1E5E16720;
  activity_block[4] = self;
  v7 = v4;
  v5 = v4;
  _os_activity_initiate(&dword_1AEA79000, "SPUnknownDiscoverySession.startDiscovery", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __58__SPUnknownDiscoverySession_startDiscoveryWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  uint8_t buf[16];

  LogCategory_UnknownDiscovery();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "-[SPUnknownDiscoverySession startDiscoveryWithCompletion]", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__SPUnknownDiscoverySession_startDiscoveryWithCompletion___block_invoke_73;
  v5[3] = &unk_1E5E16720;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  dispatch_sync(v3, v5);

}

void __58__SPUnknownDiscoverySession_startDiscoveryWithCompletion___block_invoke_73(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__SPUnknownDiscoverySession_startDiscoveryWithCompletion___block_invoke_2;
  v3[3] = &unk_1E5E166F8;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "startUnknownDiscoveryWithCompletion:", v3);

}

void __58__SPUnknownDiscoverySession_startDiscoveryWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  LogCategory_UnknownDiscovery();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1AEA79000, v4, OS_LOG_TYPE_DEFAULT, "-[SPUnknownDiscoverySession startDiscoveryWithCompletion] completion. Error %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)startDiscoveryWithScanRate:(int64_t)a3 timeout:(double)a4 completion:(id)a5
{
  id v8;
  id v9;
  _QWORD activity_block[5];
  id v11;
  int64_t v12;
  double v13;

  v8 = a5;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __75__SPUnknownDiscoverySession_startDiscoveryWithScanRate_timeout_completion___block_invoke;
  activity_block[3] = &unk_1E5E167F0;
  v11 = v8;
  v12 = a3;
  v13 = a4;
  activity_block[4] = self;
  v9 = v8;
  _os_activity_initiate(&dword_1AEA79000, "SPUnknownDiscoverySession.startDiscoveryWithScanRate:timeout:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __75__SPUnknownDiscoverySession_startDiscoveryWithScanRate_timeout_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t buf[16];

  LogCategory_UnknownDiscovery();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "-[SPUnknownDiscoverySession startDiscoveryWithScanRate:timeout:completion:]", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[2] = __75__SPUnknownDiscoverySession_startDiscoveryWithScanRate_timeout_completion___block_invoke_75;
  v6[3] = &unk_1E5E167F0;
  v5 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6[4] = *(_QWORD *)(a1 + 32);
  v8 = v4;
  v6[1] = 3221225472;
  v9 = *(_QWORD *)(a1 + 56);
  v7 = v5;
  dispatch_sync(v3, v6);

}

void __75__SPUnknownDiscoverySession_startDiscoveryWithScanRate_timeout_completion___block_invoke_75(uint64_t a1)
{
  void *v2;
  double v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(double *)(a1 + 56);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__SPUnknownDiscoverySession_startDiscoveryWithScanRate_timeout_completion___block_invoke_2;
  v5[3] = &unk_1E5E166F8;
  v4 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v2, "startDiscoveryWithScanRate:timeout:completion:", v4, v5, v3);

}

void __75__SPUnknownDiscoverySession_startDiscoveryWithScanRate_timeout_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  LogCategory_UnknownDiscovery();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1AEA79000, v4, OS_LOG_TYPE_DEFAULT, "-[SPUnknownDiscoverySession startDiscoveryWithScanRate:timeout:completion:] completion. Error %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)stopDiscoveryWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD activity_block[5];
  id v7;

  v4 = a3;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __57__SPUnknownDiscoverySession_stopDiscoveryWithCompletion___block_invoke;
  activity_block[3] = &unk_1E5E16720;
  activity_block[4] = self;
  v7 = v4;
  v5 = v4;
  _os_activity_initiate(&dword_1AEA79000, "SPUnknownDiscoverySession.stopDiscovery", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __57__SPUnknownDiscoverySession_stopDiscoveryWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  uint8_t buf[16];

  LogCategory_UnknownDiscovery();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "-[SPUnknownDiscoverySession stopDiscoveryWithCompletion]", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__SPUnknownDiscoverySession_stopDiscoveryWithCompletion___block_invoke_76;
  v5[3] = &unk_1E5E16720;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  dispatch_sync(v3, v5);

}

void __57__SPUnknownDiscoverySession_stopDiscoveryWithCompletion___block_invoke_76(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __57__SPUnknownDiscoverySession_stopDiscoveryWithCompletion___block_invoke_2;
  v3[3] = &unk_1E5E166F8;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "stopUnknownDiscoveryWithCompletion:", v3);

}

void __57__SPUnknownDiscoverySession_stopDiscoveryWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  LogCategory_UnknownDiscovery();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1AEA79000, v4, OS_LOG_TYPE_DEFAULT, "-[SPUnknownDiscoverySession stopUnknownDiscoveryWithCompletion] completion. Error %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)stop
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  LogCategory_UnknownDiscovery();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v3, OS_LOG_TYPE_DEFAULT, "-[SPUnknownDiscoverySession stop]", buf, 2u);
  }

  -[SPUnknownDiscoverySession queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__SPUnknownDiscoverySession_stop__block_invoke;
  block[3] = &unk_1E5E16668;
  block[4] = self;
  dispatch_sync(v4, block);

}

uint64_t __33__SPUnknownDiscoverySession_stop__block_invoke(uint64_t a1)
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

- (void)fetchEncryptedPayloadForUnknownBeacon:(id)a3 completion:(id)a4
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
  LogCategory_UnknownDiscovery();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v6;
    _os_log_impl(&dword_1AEA79000, v8, OS_LOG_TYPE_DEFAULT, "[SPUnknownDiscoverySession fetchEncryptedPayloadForUnknownBeacon]. Beacon %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  -[SPUnknownDiscoverySession queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__SPUnknownDiscoverySession_fetchEncryptedPayloadForUnknownBeacon_completion___block_invoke;
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

void __78__SPUnknownDiscoverySession_fetchEncryptedPayloadForUnknownBeacon_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchEncryptedPayloadForUnknownBeacon:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)discoveredUnknownAccessory:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  LogCategory_UnknownDiscovery();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "discoveredUnknownAccessory() called from daemon", buf, 2u);
  }

  -[SPUnknownDiscoverySession queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__SPUnknownDiscoverySession_discoveredUnknownAccessory___block_invoke;
  v8[3] = &unk_1E5E16818;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v6, v8);

}

void __56__SPUnknownDiscoverySession_discoveredUnknownAccessory___block_invoke(uint64_t a1)
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
  objc_msgSend(v2, "unknownAccessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 40));

  if (v4)
  {
    LogCategory_UnknownDiscovery();
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
    objc_msgSend(v7, "unknownAccessories");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "state");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "unknownAccessories");
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
    v16 = __56__SPUnknownDiscoverySession_discoveredUnknownAccessory___block_invoke_77;
    v17 = &unk_1E5E16818;
    v18 = *(_QWORD *)(a1 + 32);
    v19 = v11;
    v5 = v11;
    dispatch_async(v12, &v14);

    objc_msgSend(*(id *)(a1 + 32), "state", v14, v15, v16, v17, v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setUnknownAccessories:", v5);

  }
}

void __56__SPUnknownDiscoverySession_discoveredUnknownAccessory___block_invoke_77(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "accessoryDiscoveredCallback");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 40));

}

- (void)lostUnknownAccessory:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  LogCategory_UnknownDiscovery();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "lostUnknownAccessory() called from daemon", buf, 2u);
  }

  -[SPUnknownDiscoverySession queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__SPUnknownDiscoverySession_lostUnknownAccessory___block_invoke;
  v8[3] = &unk_1E5E16818;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v6, v8);

}

void __50__SPUnknownDiscoverySession_lostUnknownAccessory___block_invoke(uint64_t a1)
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
  objc_msgSend(v2, "unknownAccessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unknownAccessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToSet:", v4);

  if ((v7 & 1) == 0)
  {
    v8 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(*(id *)(a1 + 32), "state");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setUnknownAccessories:", v8);

    objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__SPUnknownDiscoverySession_lostUnknownAccessory___block_invoke_2;
    block[3] = &unk_1E5E16668;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(v10, block);

  }
}

void __50__SPUnknownDiscoverySession_lostUnknownAccessory___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void (**v4)(id, void *);

  objc_msgSend(*(id *)(a1 + 32), "accessoryDiscoveredCallback");
  v4 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unknownAccessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v3);

}

- (void)unknownAccessoryDiscoveryError:(id)a3
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
  LogCategory_UnknownDiscovery();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "[unknownAccessoryDiscoveryError called from client]. Error %@", buf, 0xCu);
  }

  -[SPUnknownDiscoverySession callbackQueue](self, "callbackQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__SPUnknownDiscoverySession_unknownAccessoryDiscoveryError___block_invoke;
  v8[3] = &unk_1E5E16818;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v6, v8);

}

void __60__SPUnknownDiscoverySession_unknownAccessoryDiscoveryError___block_invoke(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "accessoryDiscoveryErrorCallback");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 40));

}

- (void)unknownAccessoryDiscoveryFinished
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  LogCategory_UnknownDiscovery();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v3, OS_LOG_TYPE_DEFAULT, "[unknownAccessoryDiscoveryFinished called from client].", buf, 2u);
  }

  -[SPUnknownDiscoverySession callbackQueue](self, "callbackQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__SPUnknownDiscoverySession_unknownAccessoryDiscoveryFinished__block_invoke;
  block[3] = &unk_1E5E16668;
  block[4] = self;
  dispatch_sync(v4, block);

}

void __62__SPUnknownDiscoverySession_unknownAccessoryDiscoveryFinished__block_invoke(uint64_t a1)
{
  void (**v1)(void);

  objc_msgSend(*(id *)(a1 + 32), "accessoryDiscoveryFinishedCallback");
  v1 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v1[2]();

}

- (SPUnknownDiscoverySessionState)state
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

- (id)accessoryDiscoveryFinishedCallback
{
  return self->_accessoryDiscoveryFinishedCallback;
}

- (void)setAccessoryDiscoveryFinishedCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
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
  objc_storeStrong(&self->_accessoryDiscoveryFinishedCallback, 0);
  objc_storeStrong(&self->_accessoryDiscoveryErrorCallback, 0);
  objc_storeStrong(&self->_accessoryDiscoveredCallback, 0);
  objc_storeStrong(&self->_sessionInvalidatedCallback, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

@end
