@implementation SPBeaconScanningSession

- (SPBeaconScanningSession)init
{
  SPBeaconScanningSession *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *callbackQueue;
  uint64_t v9;
  SPBeaconScanningSession *v10;
  void *v11;
  SPBeaconScanningSession *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  FMXPCServiceDescription *serviceDescription;
  _QWORD v20[4];
  SPBeaconScanningSession *v21;
  _QWORD aBlock[4];
  SPBeaconScanningSession *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)SPBeaconScanningSession;
  v2 = -[SPBeaconScanningSession init](&v24, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.icloud.searchpartyd.SPBeaconScanningSession", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.icloud.searchpartyd.SPBeaconScanningSession.callback", v6);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v7;

    v9 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __31__SPBeaconScanningSession_init__block_invoke;
    aBlock[3] = &unk_1E5E167C8;
    v10 = v2;
    v23 = v10;
    v11 = _Block_copy(aBlock);
    v20[0] = v9;
    v20[1] = 3221225472;
    v20[2] = __31__SPBeaconScanningSession_init__block_invoke_2;
    v20[3] = &unk_1E5E167C8;
    v12 = v10;
    v21 = v12;
    v13 = _Block_copy(v20);
    v14 = objc_alloc(MEMORY[0x1E0D20238]);
    +[SPBeaconScanningSession exportedInterface](SPBeaconScanningSession, "exportedInterface");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[SPBeaconScanningSession remoteInterface](SPBeaconScanningSession, "remoteInterface");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v14, "initWithMachServiceName:options:exportedObject:exportedInterface:remoteObjectInterface:interruptionHandler:invalidationHandler:", CFSTR("com.apple.searchparty.BeaconScanningSession"), 0, v12, v15, v16, v11, v13);
    serviceDescription = v12->_serviceDescription;
    v12->_serviceDescription = (FMXPCServiceDescription *)v17;

  }
  return v2;
}

uint64_t __31__SPBeaconScanningSession_init__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "interruptionHandler:", a2);
}

uint64_t __31__SPBeaconScanningSession_init__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidationHandler:", a2);
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
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "SPBeaconScanningSession: interruptionHandler %@", buf, 0xCu);
  }

  -[SPBeaconScanningSession sessionInvalidatedCallback](self, "sessionInvalidatedCallback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SPBeaconScanningSession callbackQueue](self, "callbackQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__SPBeaconScanningSession_interruptionHandler___block_invoke;
    block[3] = &unk_1E5E16668;
    block[4] = self;
    dispatch_sync(v7, block);

  }
}

void __47__SPBeaconScanningSession_interruptionHandler___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "SPBeaconScanningSession: invalidationHandler %@", buf, 0xCu);
  }

  -[SPBeaconScanningSession setSession:](self, "setSession:", 0);
  -[SPBeaconScanningSession sessionInvalidatedCallback](self, "sessionInvalidatedCallback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SPBeaconScanningSession callbackQueue](self, "callbackQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__SPBeaconScanningSession_invalidationHandler___block_invoke;
    block[3] = &unk_1E5E16668;
    block[4] = self;
    dispatch_sync(v7, block);

  }
}

void __47__SPBeaconScanningSession_invalidationHandler___block_invoke(uint64_t a1)
{
  void (**v1)(void);

  objc_msgSend(*(id *)(a1 + 32), "sessionInvalidatedCallback");
  v1 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v1[2]();

}

- (SPBeaconScanningXPCProtocol)proxy
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[SPBeaconScanningSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SPBeaconScanningSession session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0D20240]);
    -[SPBeaconScanningSession serviceDescription](self, "serviceDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithServiceDescription:", v6);
    -[SPBeaconScanningSession setSession:](self, "setSession:", v7);

    LogCategory_AccessoryDiscovery();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[SPBeaconScanningSession serviceDescription](self, "serviceDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "machService");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v10;
      _os_log_impl(&dword_1AEA79000, v8, OS_LOG_TYPE_DEFAULT, "SPBeaconScanningSession: Establishing XPC connection to %@", (uint8_t *)&v15, 0xCu);

    }
    -[SPBeaconScanningSession session](self, "session");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resume");

  }
  -[SPBeaconScanningSession session](self, "session");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "proxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (SPBeaconScanningXPCProtocol *)v13;
}

+ (id)exportedInterface
{
  if (exportedInterface_onceToken_1 != -1)
    dispatch_once(&exportedInterface_onceToken_1, &__block_literal_global_1);
  return (id)exportedInterface_interface_1;
}

void __44__SPBeaconScanningSession_exportedInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE18600);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)exportedInterface_interface_1;
  exportedInterface_interface_1 = v0;

}

+ (id)remoteInterface
{
  if (remoteInterface_onceToken_1 != -1)
    dispatch_once(&remoteInterface_onceToken_1, &__block_literal_global_55);
  return (id)remoteInterface_interface_1;
}

void __42__SPBeaconScanningSession_remoteInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE27918);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)remoteInterface_interface_1;
  remoteInterface_interface_1 = v0;

}

- (void)startScanningIncludeServiceCharacteristics:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __70__SPBeaconScanningSession_startScanningIncludeServiceCharacteristics___block_invoke;
  v3[3] = &unk_1E5E16880;
  v4 = a3;
  v3[4] = self;
  _os_activity_initiate(&dword_1AEA79000, "SPBeaconScanningSession.startScanningIncludeServiceCharacteristics", OS_ACTIVITY_FLAG_DEFAULT, v3);
}

void __70__SPBeaconScanningSession_startScanningIncludeServiceCharacteristics___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  NSObject *v4;
  _QWORD v5[5];
  char v6;
  uint8_t buf[4];
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconScanning();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(unsigned __int8 *)(a1 + 40);
    *(_DWORD *)buf = 67109120;
    v8 = v3;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "-[SPBeaconScanningSession startScanningIncludeServiceCharacteristics:%d]", buf, 8u);
  }

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__SPBeaconScanningSession_startScanningIncludeServiceCharacteristics___block_invoke_63;
  v5[3] = &unk_1E5E16880;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = *(_BYTE *)(a1 + 40);
  dispatch_sync(v4, v5);

}

void __70__SPBeaconScanningSession_startScanningIncludeServiceCharacteristics___block_invoke_63(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startScanningIncludeServiceCharacterstics:completion:", *(unsigned __int8 *)(a1 + 40), &__block_literal_global_65);

}

void __70__SPBeaconScanningSession_startScanningIncludeServiceCharacteristics___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11[16];

  v2 = a2;
  LogCategory_BeaconScanning();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __70__SPBeaconScanningSession_startScanningIncludeServiceCharacteristics___block_invoke_2_cold_1((uint64_t)v2, v4, v5, v6, v7, v8, v9, v10);
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1AEA79000, v4, OS_LOG_TYPE_DEFAULT, "-[SPAccessoryDiscoverySession startScanningIncludeServiceCharacteristics:] completion.", v11, 2u);
  }

}

- (void)stopScanning
{
  _QWORD activity_block[5];

  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __39__SPBeaconScanningSession_stopScanning__block_invoke;
  activity_block[3] = &unk_1E5E16668;
  activity_block[4] = self;
  _os_activity_initiate(&dword_1AEA79000, "SPBeaconScanningSession.stopScanning", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __39__SPBeaconScanningSession_stopScanning__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[16];

  LogCategory_BeaconScanning();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "-[SPBeaconScanningSession stopScanning]", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__SPBeaconScanningSession_stopScanning__block_invoke_66;
  block[3] = &unk_1E5E16668;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_sync(v3, block);

}

void __39__SPBeaconScanningSession_stopScanning__block_invoke_66(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stopScanningWithCompletion:", &__block_literal_global_67);

}

void __39__SPBeaconScanningSession_stopScanning__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11[16];

  v2 = a2;
  LogCategory_BeaconScanning();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __39__SPBeaconScanningSession_stopScanning__block_invoke_2_cold_1((uint64_t)v2, v4, v5, v6, v7, v8, v9, v10);
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1AEA79000, v4, OS_LOG_TYPE_DEFAULT, "-[SPAccessoryDiscoverySession] completion.", v11, 2u);
  }

}

- (void)discoveredObject:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[SPBeaconScanningSession beaconDiscoveredCallback](self, "beaconDiscoveredCallback");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SPBeaconScanningSession beaconDiscoveredCallback](self, "beaconDiscoveredCallback");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

  }
}

- (void)discoveryFinished:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = (void (**)(_QWORD))a4;
  -[SPBeaconScanningSession discoveryFinishedCallback](self, "discoveryFinishedCallback");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SPBeaconScanningSession discoveryFinishedCallback](self, "discoveryFinishedCallback");
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v8)[2](v8, v9);

  }
  v6[2](v6);

}

- (id)sessionInvalidatedCallback
{
  return self->_sessionInvalidatedCallback;
}

- (void)setSessionInvalidatedCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)beaconDiscoveredCallback
{
  return self->_beaconDiscoveredCallback;
}

- (void)setBeaconDiscoveredCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)discoveryFinishedCallback
{
  return self->_discoveryFinishedCallback;
}

- (void)setDiscoveryFinishedCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
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
  objc_storeStrong(&self->_discoveryFinishedCallback, 0);
  objc_storeStrong(&self->_beaconDiscoveredCallback, 0);
  objc_storeStrong(&self->_sessionInvalidatedCallback, 0);
}

void __70__SPBeaconScanningSession_startScanningIncludeServiceCharacteristics___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AEA79000, a2, a3, "-[SPAccessoryDiscoverySession startScanningIncludeServiceCharacteristics:] completion. Error %@", a5, a6, a7, a8, 2u);
}

void __39__SPBeaconScanningSession_stopScanning__block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AEA79000, a2, a3, "-[SPAccessoryDiscoverySession stopScanning] completion. Error %@", a5, a6, a7, a8, 2u);
}

@end
