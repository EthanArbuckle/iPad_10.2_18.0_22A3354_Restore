@implementation SPCBPeripheralManager

- (void)handleDarwinNotificationNamed:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  LogCategory_CBPeripheralManagement();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "SPCBPeripheralManager: handleDarwinNotificationNamed %{public}@: ", (uint8_t *)&v6, 0xCu);
  }

  -[SPCBPeripheralManager fetch](self, "fetch");
}

- (SPCBPeripheralManager)init
{
  SPCBPeripheralManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *callbackQueue;
  uint64_t v9;
  FMQueueSynchronizer *queueSynchronizer;
  uint64_t v11;
  FMTokenBucket *tokenBucket;
  uint64_t v13;
  NSMutableSet *pendingPairingIdentifiers;
  NSObject *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *cbQueue;
  NSObject *v19;
  uint64_t v20;
  SPCBPeripheralManager *v21;
  SPCBPeripheralManager *v22;
  void *v23;
  SPCBPeripheralManager *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  FMXPCServiceDescription *serviceDescription;
  NSMutableDictionary *v30;
  NSMutableDictionary *sessionMetadata;
  _QWORD v33[4];
  SPCBPeripheralManager *v34;
  _QWORD aBlock[4];
  SPCBPeripheralManager *v36;
  _QWORD block[4];
  SPCBPeripheralManager *v38;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)SPCBPeripheralManager;
  v2 = -[SPCBPeripheralManager init](&v39, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.searchparty.SPCBPeripheralManagement", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.searchparty.SPCBPeripheralManagement.callback", v6);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D20208]), "initWithQueue:", v2->_queue);
    queueSynchronizer = v2->_queueSynchronizer;
    v2->_queueSynchronizer = (FMQueueSynchronizer *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D20220]), "initWithFillRate:capacity:", 10.0, 50.0);
    tokenBucket = v2->_tokenBucket;
    v2->_tokenBucket = (FMTokenBucket *)v11;

    v13 = objc_opt_new();
    pendingPairingIdentifiers = v2->_pendingPairingIdentifiers;
    v2->_pendingPairingIdentifiers = (NSMutableSet *)v13;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_USER_INITIATED, -1);
    v16 = objc_claimAutoreleasedReturnValue();

    v17 = dispatch_queue_create("com.apple.searchparty.SPCBPeerDelegate", v16);
    cbQueue = v2->_cbQueue;
    v2->_cbQueue = (OS_dispatch_queue *)v17;

    v19 = v2->_queue;
    v20 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __29__SPCBPeripheralManager_init__block_invoke;
    block[3] = &unk_1E5E16668;
    v21 = v2;
    v38 = v21;
    dispatch_async(v19, block);
    aBlock[0] = v20;
    aBlock[1] = 3221225472;
    aBlock[2] = __29__SPCBPeripheralManager_init__block_invoke_2;
    aBlock[3] = &unk_1E5E167C8;
    v22 = v21;
    v36 = v22;
    v23 = _Block_copy(aBlock);
    v33[0] = v20;
    v33[1] = 3221225472;
    v33[2] = __29__SPCBPeripheralManager_init__block_invoke_3;
    v33[3] = &unk_1E5E167C8;
    v24 = v22;
    v34 = v24;
    v25 = _Block_copy(v33);
    v26 = objc_alloc(MEMORY[0x1E0D20238]);
    +[SPCBPeripheralManager remoteInterface](SPCBPeripheralManager, "remoteInterface");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "initWithMachServiceName:options:remoteObjectInterface:interruptionHandler:invalidationHandler:", CFSTR("com.apple.searchparty.managedperipheral"), 0, v27, v23, v25);
    serviceDescription = v24->_serviceDescription;
    v24->_serviceDescription = (FMXPCServiceDescription *)v28;

    v30 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sessionMetadata = v24->_sessionMetadata;
    v24->_sessionMetadata = v30;

  }
  return v2;
}

void __29__SPCBPeripheralManager_init__block_invoke(uint64_t a1)
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)observerTrampoline, CFSTR("SPManagedCBPeripheralChangedNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

uint64_t __29__SPCBPeripheralManager_init__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "interruptionHandler:", a2);
}

uint64_t __29__SPCBPeripheralManager_init__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidationHandler:", a2);
}

- (void)startSessionForUserIdentifier:(id)a3 bundleId:(id)a4 vendorIdentifierList:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[SPCBPeripheralManager queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__SPCBPeripheralManager_startSessionForUserIdentifier_bundleId_vendorIdentifierList_completion___block_invoke;
  block[3] = &unk_1E5E17E80;
  v22 = v12;
  v23 = v13;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  v18 = v13;
  dispatch_async(v14, block);

}

void __96__SPCBPeripheralManager_startSessionForUserIdentifier_bundleId_vendorIdentifierList_completion___block_invoke(uint64_t a1)
{
  char v2;
  void *v3;
  void *v4;
  NSObject *v5;
  SPCBPeripheralManagerSessionKey *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  id v25;
  _QWORD block[4];
  id v27;
  SPCBPeripheralManagerSessionKey *v28;
  _QWORD v29[4];
  id v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v2 = _os_feature_enabled_impl();
  v3 = *(void **)(a1 + 32);
  if ((v2 & 1) != 0)
  {
    objc_msgSend(v3, "_enforceRateLimit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
      v5 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __96__SPCBPeripheralManager_startSessionForUserIdentifier_bundleId_vendorIdentifierList_completion___block_invoke_14;
      block[3] = &unk_1E5E17278;
      v28 = (SPCBPeripheralManagerSessionKey *)*(id *)(a1 + 64);
      v27 = v4;
      dispatch_async(v5, block);

      v6 = v28;
    }
    else
    {
      v6 = -[SPCBPeripheralManagerSessionKey initWithUserIdentifier:bundleIdentifier:]([SPCBPeripheralManagerSessionKey alloc], "initWithUserIdentifier:bundleIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      LogCategory_CBPeripheralManagement();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        -[SPCBPeripheralManagerSessionKey userIdentifier](v6, "userIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPCBPeripheralManagerSessionKey bundleId](v6, "bundleId");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "descriptionForVendorIdentifierList:", *(_QWORD *)(a1 + 56));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 141558786;
        v32 = 1752392040;
        v33 = 2112;
        v34 = v9;
        v35 = 2114;
        v36 = v10;
        v37 = 2114;
        v38 = v11;
        _os_log_impl(&dword_1AEA79000, v8, OS_LOG_TYPE_DEFAULT, "SPCBPeripheralManager: Created session for <%{mask.hash}@:%{public}@>: %{public}@", buf, 0x2Au);

      }
      v12 = *(_QWORD *)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 32), "sessionMetadata");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v6);

      objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
      v14 = objc_claimAutoreleasedReturnValue();
      v21 = MEMORY[0x1E0C809B0];
      v22 = 3221225472;
      v23 = __96__SPCBPeripheralManager_startSessionForUserIdentifier_bundleId_vendorIdentifierList_completion___block_invoke_16;
      v24 = &unk_1E5E17460;
      v25 = *(id *)(a1 + 64);
      dispatch_async(v14, &v21);

      objc_msgSend(*(id *)(a1 + 32), "fetch", v21, v22, v23, v24);
      if (*MEMORY[0x1E0C97780])
      {
        v15 = objc_alloc(MEMORY[0x1E0C97728]);
        objc_msgSend(*(id *)(a1 + 32), "queue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v15, "initWithDelegate:queue:", 0, v16);
        objc_msgSend(*(id *)(a1 + 32), "setCentralManager:", v17);

        v18 = *(void **)(a1 + 32);
        objc_msgSend(v18, "centralManager");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "sharedPairingAgent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setDelegate:", v18);

      }
    }

  }
  else
  {
    objc_msgSend(v3, "callbackQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __96__SPCBPeripheralManager_startSessionForUserIdentifier_bundleId_vendorIdentifierList_completion___block_invoke_2;
    v29[3] = &unk_1E5E17460;
    v30 = *(id *)(a1 + 64);
    dispatch_async(v7, v29);

    v4 = v30;
  }

}

void __96__SPCBPeripheralManager_startSessionForUserIdentifier_bundleId_vendorIdentifierList_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  LogCategory_CBPeripheralManagement();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __96__SPCBPeripheralManager_startSessionForUserIdentifier_bundleId_vendorIdentifierList_completion___block_invoke_2_cold_1();

  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.spowner.SPCBPeripheralErrorDomain"), 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

}

uint64_t __96__SPCBPeripheralManager_startSessionForUserIdentifier_bundleId_vendorIdentifierList_completion___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __96__SPCBPeripheralManager_startSessionForUserIdentifier_bundleId_vendorIdentifierList_completion___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)stopSessionForUserIdentifier:(id)a3 bundleId:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SPCBPeripheralManager queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __74__SPCBPeripheralManager_stopSessionForUserIdentifier_bundleId_completion___block_invoke;
  v15[3] = &unk_1E5E17EA8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_async(v11, v15);

}

void __74__SPCBPeripheralManager_stopSessionForUserIdentifier_bundleId_completion___block_invoke(uint64_t a1)
{
  char v2;
  void *v3;
  void *v4;
  NSObject *v5;
  SPCBPeripheralManagerSessionKey *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];
  _QWORD block[4];
  id v22;
  SPCBPeripheralManagerSessionKey *v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = _os_feature_enabled_impl();
  v3 = *(void **)(a1 + 32);
  if ((v2 & 1) != 0)
  {
    objc_msgSend(v3, "_enforceRateLimit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
      v5 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __74__SPCBPeripheralManager_stopSessionForUserIdentifier_bundleId_completion___block_invoke_18;
      block[3] = &unk_1E5E17278;
      v23 = (SPCBPeripheralManagerSessionKey *)*(id *)(a1 + 56);
      v22 = v4;
      dispatch_async(v5, block);

      v6 = v23;
    }
    else
    {
      v6 = -[SPCBPeripheralManagerSessionKey initWithUserIdentifier:bundleIdentifier:]([SPCBPeripheralManagerSessionKey alloc], "initWithUserIdentifier:bundleIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      LogCategory_CBPeripheralManagement();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        -[SPCBPeripheralManagerSessionKey userIdentifier](v6, "userIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPCBPeripheralManagerSessionKey bundleId](v6, "bundleId");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 141558530;
        v27 = 1752392040;
        v28 = 2112;
        v29 = v9;
        v30 = 2114;
        v31 = v10;
        _os_log_impl(&dword_1AEA79000, v8, OS_LOG_TYPE_DEFAULT, "SPCBPeripheralManager: Deleted session for <%{mask.hash}@:%{public}@>", buf, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 32), "sessionMetadata");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, v6);

      objc_msgSend(*(id *)(a1 + 32), "sessionMetadata");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      v14 = *(void **)(a1 + 32);
      if (v13)
      {
        objc_msgSend(v14, "fetch");
      }
      else
      {
        objc_msgSend(v14, "peripheralsUpdatedCallback");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
          v16 = objc_claimAutoreleasedReturnValue();
          v20[0] = MEMORY[0x1E0C809B0];
          v20[1] = 3221225472;
          v20[2] = __74__SPCBPeripheralManager_stopSessionForUserIdentifier_bundleId_completion___block_invoke_19;
          v20[3] = &unk_1E5E16668;
          v20[4] = *(_QWORD *)(a1 + 32);
          dispatch_async(v16, v20);
        }
        else
        {
          LogCategory_CBPeripheralManagement();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            __74__SPCBPeripheralManager_stopSessionForUserIdentifier_bundleId_completion___block_invoke_cold_1();
        }

      }
      objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
      v17 = objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __74__SPCBPeripheralManager_stopSessionForUserIdentifier_bundleId_completion___block_invoke_20;
      v18[3] = &unk_1E5E17460;
      v19 = *(id *)(a1 + 56);
      dispatch_async(v17, v18);

    }
  }
  else
  {
    objc_msgSend(v3, "callbackQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __74__SPCBPeripheralManager_stopSessionForUserIdentifier_bundleId_completion___block_invoke_2;
    v24[3] = &unk_1E5E17460;
    v25 = *(id *)(a1 + 56);
    dispatch_async(v7, v24);

    v4 = v25;
  }

}

void __74__SPCBPeripheralManager_stopSessionForUserIdentifier_bundleId_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  LogCategory_CBPeripheralManagement();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __96__SPCBPeripheralManager_startSessionForUserIdentifier_bundleId_vendorIdentifierList_completion___block_invoke_2_cold_1();

  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.spowner.SPCBPeripheralErrorDomain"), 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

}

uint64_t __74__SPCBPeripheralManager_stopSessionForUserIdentifier_bundleId_completion___block_invoke_18(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __74__SPCBPeripheralManager_stopSessionForUserIdentifier_bundleId_completion___block_invoke_19(uint64_t a1)
{
  void (**v1)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "peripheralsUpdatedCallback");
  v1 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v1[2](v1, MEMORY[0x1E0C9AA60]);

}

uint64_t __74__SPCBPeripheralManager_stopSessionForUserIdentifier_bundleId_completion___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)enableSystemWakesForUpdate:(BOOL)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  -[SPCBPeripheralManager queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__SPCBPeripheralManager_enableSystemWakesForUpdate_completion___block_invoke;
  block[3] = &unk_1E5E16DD0;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

void __63__SPCBPeripheralManager_enableSystemWakesForUpdate_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;
  uint8_t buf[4];
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  LogCategory_CBPeripheralManagement();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(unsigned __int8 *)(a1 + 48);
    *(_DWORD *)buf = 67109120;
    v8 = v3;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPCBPeripheralManager: enableSystemWakesForUpdate: %d", buf, 8u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setEnableSystemWakes:", *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__SPCBPeripheralManager_enableSystemWakesForUpdate_completion___block_invoke_21;
  block[3] = &unk_1E5E17460;
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, block);

}

uint64_t __63__SPCBPeripheralManager_enableSystemWakesForUpdate_completion___block_invoke_21(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)successfulConnectionForPeripheral:(id)a3 leMAC:(id)a4 ltk:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[SPCBPeripheralManager queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__SPCBPeripheralManager_successfulConnectionForPeripheral_leMAC_ltk_completion___block_invoke;
  block[3] = &unk_1E5E17E80;
  v22 = v11;
  v23 = v13;
  block[4] = self;
  v20 = v10;
  v21 = v12;
  v15 = v11;
  v16 = v12;
  v17 = v10;
  v18 = v13;
  dispatch_async(v14, block);

}

void __80__SPCBPeripheralManager_successfulConnectionForPeripheral_leMAC_ltk_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  char v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[5];
  id v19;
  _QWORD block[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[16];

  LogCategory_CBPeripheralManagement();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPCBPeripheralManager: successfulConnectionForPeripheral:leMAC:ltk:", buf, 2u);
  }

  v3 = _os_feature_enabled_impl();
  v4 = *(void **)(a1 + 32);
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v4, "_enforceRateLimit");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
      v6 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __80__SPCBPeripheralManager_successfulConnectionForPeripheral_leMAC_ltk_completion___block_invoke_23;
      block[3] = &unk_1E5E17278;
      v22 = *(id *)(a1 + 64);
      v5 = v5;
      v21 = v5;
      dispatch_async(v6, block);

      v7 = v22;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "ltkIndexMap");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "unsignedLongLongValue");

      objc_msgSend(*(id *)(a1 + 32), "proxy");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "userIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "beaconIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(*(id *)(a1 + 40), "primaryIndex");
      v17 = *(_QWORD *)(a1 + 48);
      v16 = *(_QWORD *)(a1 + 56);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __80__SPCBPeripheralManager_successfulConnectionForPeripheral_leMAC_ltk_completion___block_invoke_2;
      v18[3] = &unk_1E5E17ED0;
      v18[4] = *(_QWORD *)(a1 + 32);
      v19 = *(id *)(a1 + 64);
      objc_msgSend(v12, "successfulConnectionForUserIdentifier:beaconIdentifier:primaryIndex:leMAC:ltkIndex:ltk:completion:", v13, v14, v15, v16, v11, v17, v18);

      v7 = v19;
    }

  }
  else
  {
    objc_msgSend(v4, "callbackQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __80__SPCBPeripheralManager_successfulConnectionForPeripheral_leMAC_ltk_completion___block_invoke_22;
    v23[3] = &unk_1E5E17460;
    v24 = *(id *)(a1 + 64);
    dispatch_async(v8, v23);

    v5 = v24;
  }

}

void __80__SPCBPeripheralManager_successfulConnectionForPeripheral_leMAC_ltk_completion___block_invoke_22(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  LogCategory_CBPeripheralManagement();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __96__SPCBPeripheralManager_startSessionForUserIdentifier_bundleId_vendorIdentifierList_completion___block_invoke_2_cold_1();

  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.spowner.SPCBPeripheralErrorDomain"), 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

}

uint64_t __80__SPCBPeripheralManager_successfulConnectionForPeripheral_leMAC_ltk_completion___block_invoke_23(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __80__SPCBPeripheralManager_successfulConnectionForPeripheral_leMAC_ltk_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__SPCBPeripheralManager_successfulConnectionForPeripheral_leMAC_ltk_completion___block_invoke_3;
  v7[3] = &unk_1E5E17278;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __80__SPCBPeripheralManager_successfulConnectionForPeripheral_leMAC_ltk_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  SPCBPeripheralManager *v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  LogCategory_CBPeripheralManagement();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v5;
    _os_log_impl(&dword_1AEA79000, v6, OS_LOG_TYPE_DEFAULT, "SPCBPeripheralManager: pairingAgent:peerDidCompletePairing %{public}@", buf, 0xCu);
  }

  -[SPCBPeripheralManager cbQueue](self, "cbQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__SPCBPeripheralManager_pairingAgent_peerDidCompletePairing___block_invoke;
  v9[3] = &unk_1E5E16818;
  v10 = v5;
  v11 = self;
  v8 = v5;
  dispatch_async(v7, v9);

}

void __61__SPCBPeripheralManager_pairingAgent_peerDidCompletePairing___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  int8x16_t v10;
  _QWORD v11[4];
  int8x16_t v12;

  if (objc_msgSend(*(id *)(a1 + 32), "hasTag:", CFSTR("A2538")))
  {
    objc_msgSend(*(id *)(a1 + 40), "pendingPairingIdentifiers");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v2, "containsObject:", v3);

    if ((v4 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "pendingPairingIdentifiers");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v6);

      objc_msgSend(*(id *)(a1 + 40), "proxy");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __61__SPCBPeripheralManager_pairingAgent_peerDidCompletePairing___block_invoke_2;
      v11[3] = &unk_1E5E17EF8;
      v10 = *(int8x16_t *)(a1 + 32);
      v9 = (id)v10.i64[0];
      v12 = vextq_s8(v10, v10, 8uLL);
      objc_msgSend(v7, "pairLowEnergyAccessoryWithIdentifier:completion:", v8, v11);

    }
  }
}

void __61__SPCBPeripheralManager_pairingAgent_peerDidCompletePairing___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  LogCategory_CBPeripheralManagement();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v7 = 138543362;
      v8 = v3;
      _os_log_impl(&dword_1AEA79000, v4, OS_LOG_TYPE_DEFAULT, "SPCBPeripheralManager: pairLowEnergyAccessory did complete with error %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_1AEA79000, v4, OS_LOG_TYPE_DEFAULT, "SPCBPeripheralManager: pairLowEnergyAccessory completed successfully!", (uint8_t *)&v7, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "pendingPairingIdentifiers");
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject removeObject:](v4, "removeObject:", v6);

  }
}

- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  LogCategory_CBPeripheralManagement();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = v5;
    _os_log_impl(&dword_1AEA79000, v6, OS_LOG_TYPE_DEFAULT, "SPCBPeripheralManager: pairingAgent:peerDidUnpair %{public}@", buf, 0xCu);
  }

  -[SPCBPeripheralManager cbQueue](self, "cbQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__SPCBPeripheralManager_pairingAgent_peerDidUnpair___block_invoke;
  v9[3] = &unk_1E5E16818;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_async(v7, v9);

}

void __52__SPCBPeripheralManager_pairingAgent_peerDidUnpair___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unpairLowEnergyAccessoryWithIdentifier:completion:", v2, &__block_literal_global_14);

}

void __52__SPCBPeripheralManager_pairingAgent_peerDidUnpair___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  _BOOL4 v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  LogCategory_CBPeripheralManagement();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v8 = 138543362;
      v9 = v2;
      v5 = "SPCBPeripheralManager: unpairLowEnergyAccessory did complete with error %{public}@";
      v6 = v3;
      v7 = 12;
LABEL_6:
      _os_log_impl(&dword_1AEA79000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v8, v7);
    }
  }
  else if (v4)
  {
    LOWORD(v8) = 0;
    v5 = "SPCBPeripheralManager: unpairLowEnergyAccessory completed successfully!";
    v6 = v3;
    v7 = 2;
    goto LABEL_6;
  }

}

- (void)interruptionHandler:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  LogCategory_CBPeripheralManagement();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1AEA79000, v4, OS_LOG_TYPE_DEFAULT, "SPCBPeripheralManager: interruptionHandler %{public}@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)invalidationHandler:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  LogCategory_CBPeripheralManagement();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "SPCBPeripheralManager: invalidationHandler %{public}@", (uint8_t *)&v6, 0xCu);
  }

  -[SPCBPeripheralManager setSession:](self, "setSession:", 0);
}

- (SPCBPeripheralManagementXPCProtocol)proxy
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__5;
  v11 = __Block_byref_object_dispose__5;
  v12 = 0;
  -[SPCBPeripheralManager queueSynchronizer](self, "queueSynchronizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__SPCBPeripheralManager_proxy__block_invoke;
  v6[3] = &unk_1E5E17398;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "conditionalSync:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (SPCBPeripheralManagementXPCProtocol *)v4;
}

void __30__SPCBPeripheralManager_proxy__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D20240]);
    objc_msgSend(*(id *)(a1 + 32), "serviceDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithServiceDescription:", v4);
    objc_msgSend(*(id *)(a1 + 32), "setSession:", v5);

    LogCategory_CBPeripheralManagement();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "serviceDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "machService");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v8;
      _os_log_impl(&dword_1AEA79000, v6, OS_LOG_TYPE_DEFAULT, "SPCBPeripheralManager: Establishing XPC connection to %{public}@", (uint8_t *)&v14, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "session");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resume");

  }
  objc_msgSend(*(id *)(a1 + 32), "session");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "proxy");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

}

+ (id)remoteInterface
{
  if (remoteInterface_onceToken_8 != -1)
    dispatch_once(&remoteInterface_onceToken_8, &__block_literal_global_28);
  return (id)remoteInterface_interface_7;
}

void __40__SPCBPeripheralManager_remoteInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE27A38);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)remoteInterface_interface_7;
  remoteInterface_interface_7 = v0;

}

- (id)descriptionForVendorIdentifierList:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "fm_map:", &__block_literal_global_84);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("[%@]"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __60__SPCBPeripheralManager_descriptionForVendorIdentifierList___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%08x"), objc_msgSend(a2, "unsignedIntValue"));
}

- (double)timeIntervalToNextFireDateFromDate:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;

  v3 = a3;
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v5 = ceil(v4 / 900.0);
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v7 = v6;

  return -(v7 - v5 * 900.0);
}

- (void)timerFiredForActivity:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SPCBPeripheralManager *v9;

  v4 = a3;
  -[SPCBPeripheralManager queueSynchronizer](self, "queueSynchronizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__SPCBPeripheralManager_timerFiredForActivity___block_invoke;
  v7[3] = &unk_1E5E16818;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "conditionalSync:", v7);

}

uint64_t __47__SPCBPeripheralManager_timerFiredForActivity___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  LogCategory_CBPeripheralManagement();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPCBPeripheralManager: timerFired: %{public}@", (uint8_t *)&v5, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 40), "fetch");
  objc_msgSend(*(id *)(a1 + 40), "setForceUpdateCriteria:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "updateCriteria");
}

- (void)fetch
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LogCategory_CBPeripheralManagement();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v3;
    _os_log_impl(&dword_1AEA79000, v4, OS_LOG_TYPE_DEFAULT, "SPCBPeripheralManager: fetch (fetchBase: %@)", buf, 0xCu);
  }

  -[SPCBPeripheralManager queueSynchronizer](self, "queueSynchronizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __30__SPCBPeripheralManager_fetch__block_invoke;
  v7[3] = &unk_1E5E16818;
  v7[4] = self;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "conditionalSync:", v7);

}

void __30__SPCBPeripheralManager_fetch__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  SPCBPeripheralKeyRequest *v6;
  uint64_t v7;
  SPCBPeripheralKeyRequest *v8;
  _QWORD v9[5];
  SPCBPeripheralKeyRequest *v10;
  uint64_t v11;
  _QWORD v12[5];

  objc_msgSend(*(id *)(a1 + 32), "sessionMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __30__SPCBPeripheralManager_fetch__block_invoke_2;
  v12[3] = &unk_1E5E17F60;
  v12[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "fm_map:", v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SPCBPeripheralKeyRequest initWithDate:requestParameters:]([SPCBPeripheralKeyRequest alloc], "initWithDate:requestParameters:", *(_QWORD *)(a1 + 40), v5);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __30__SPCBPeripheralManager_fetch__block_invoke_3;
  v9[3] = &unk_1E5E17FB0;
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v6;
  v11 = v7;
  v8 = v6;
  _os_activity_initiate(&dword_1AEA79000, "fetch", OS_ACTIVITY_FLAG_DEFAULT, v9);

}

SPCBPeripheralKeyRequestParameters *__30__SPCBPeripheralManager_fetch__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  SPCBPeripheralKeyRequestParameters *v4;
  void *v5;
  void *v6;
  SPCBPeripheralKeyRequestParameters *v7;

  v3 = a2;
  v4 = [SPCBPeripheralKeyRequestParameters alloc];
  objc_msgSend(*(id *)(a1 + 32), "sessionMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SPCBPeripheralKeyRequestParameters initWithSessionKey:vendorIdentifierList:](v4, "initWithSessionKey:vendorIdentifierList:", v3, v6);

  return v7;
}

void __30__SPCBPeripheralManager_fetch__block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[6];

  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __30__SPCBPeripheralManager_fetch__block_invoke_4;
  v4[3] = &unk_1E5E17F88;
  v4[5] = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "bluetoothConnectionKeysFor:completion:", v3, v4);

}

void __30__SPCBPeripheralManager_fetch__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  double v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  double v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  _QWORD block[5];
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  double v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v8 = v7;
  v9 = *(double *)(a1 + 40);
  LogCategory_CBPeripheralManagement();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v35 = (v8 - v9) * 1000.0;
    _os_log_impl(&dword_1AEA79000, v10, OS_LOG_TYPE_DEFAULT, "SPCBPeripheralManager: fetch duration: %.02f ms", buf, 0xCu);
  }

  if (v6)
  {
    LogCategory_CBPeripheralManagement();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __30__SPCBPeripheralManager_fetch__block_invoke_4_cold_2((uint64_t)v6, v11);

  }
  else if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "peripheralsUpdatedCallback");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    LogCategory_CBPeripheralManagement();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12)
    {
      v25 = a1;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "peripherals");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = COERCE_DOUBLE(objc_msgSend(v15, "count"));
        *(_DWORD *)buf = 134217984;
        v35 = v16;
        _os_log_impl(&dword_1AEA79000, v14, OS_LOG_TYPE_DEFAULT, "SPCBPeripheralManager: peripheral count: %lu", buf, 0xCu);

      }
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v26 = v5;
      objc_msgSend(v5, "peripherals");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v30 != v20)
              objc_enumerationMutation(v17);
            v22 = *(double *)(*((_QWORD *)&v29 + 1) + 8 * i);
            LogCategory_CBPeripheralManagement();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v35 = v22;
              _os_log_impl(&dword_1AEA79000, v23, OS_LOG_TYPE_DEFAULT, "SPCBPeripheralManager: peripheral: %@", buf, 0xCu);
            }

          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        }
        while (v19);
      }

      objc_msgSend(*(id *)(v25 + 32), "callbackQueue");
      v24 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __30__SPCBPeripheralManager_fetch__block_invoke_96;
      block[3] = &unk_1E5E16818;
      block[4] = *(_QWORD *)(v25 + 32);
      v5 = v26;
      v28 = v26;
      dispatch_async(v24, block);

    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __74__SPCBPeripheralManager_stopSessionForUserIdentifier_bundleId_completion___block_invoke_cold_1();

    }
  }

}

void __30__SPCBPeripheralManager_fetch__block_invoke_96(uint64_t a1)
{
  void *v2;
  void (**v3)(id, void *);

  objc_msgSend(*(id *)(a1 + 32), "peripheralsUpdatedCallback");
  v3 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "peripherals");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v2);

}

- (id)_enforceRateLimit
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__5;
  v11 = __Block_byref_object_dispose__5;
  v12 = 0;
  -[SPCBPeripheralManager queueSynchronizer](self, "queueSynchronizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__SPCBPeripheralManager__enforceRateLimit__block_invoke;
  v6[3] = &unk_1E5E17398;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "conditionalSync:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __42__SPCBPeripheralManager__enforceRateLimit__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "tokenBucket");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "operationAllowed");

  if ((v3 & 1) == 0)
  {
    v13[0] = CFSTR("delay");
    v4 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "tokenBucket");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalUntilOperationAllowed");
    objc_msgSend(v4, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = CFSTR("stats");
    v14[0] = v6;
    objc_msgSend(*(id *)(a1 + 32), "tokenBucket");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dumpStatistics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.spowner.SPCBPeripheralErrorDomain"), 2, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
}

- (id)peripheralsUpdatedCallback
{
  return self->_peripheralsUpdatedCallback;
}

- (void)setPeripheralsUpdatedCallback:(id)a3
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

- (FMQueueSynchronizer)queueSynchronizer
{
  return self->_queueSynchronizer;
}

- (void)setQueueSynchronizer:(id)a3
{
  objc_storeStrong((id *)&self->_queueSynchronizer, a3);
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (FMTokenBucket)tokenBucket
{
  return self->_tokenBucket;
}

- (void)setTokenBucket:(id)a3
{
  objc_storeStrong((id *)&self->_tokenBucket, a3);
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

- (NSMutableDictionary)sessionMetadata
{
  return self->_sessionMetadata;
}

- (void)setSessionMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_sessionMetadata, a3);
}

- (BOOL)enableSystemWakes
{
  return self->_enableSystemWakes;
}

- (void)setEnableSystemWakes:(BOOL)a3
{
  self->_enableSystemWakes = a3;
}

- (BOOL)forceUpdateCriteria
{
  return self->_forceUpdateCriteria;
}

- (void)setForceUpdateCriteria:(BOOL)a3
{
  self->_forceUpdateCriteria = a3;
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setCentralManager:(id)a3
{
  objc_storeStrong((id *)&self->_centralManager, a3);
}

- (NSMutableSet)pendingPairingIdentifiers
{
  return self->_pendingPairingIdentifiers;
}

- (void)setPendingPairingIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_pendingPairingIdentifiers, a3);
}

- (OS_dispatch_queue)cbQueue
{
  return self->_cbQueue;
}

- (void)setCbQueue:(id)a3
{
  objc_storeStrong((id *)&self->_cbQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cbQueue, 0);
  objc_storeStrong((id *)&self->_pendingPairingIdentifiers, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_sessionMetadata, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_serviceDescription, 0);
  objc_storeStrong((id *)&self->_tokenBucket, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_queueSynchronizer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_peripheralsUpdatedCallback, 0);
}

void __96__SPCBPeripheralManager_startSessionForUserIdentifier_bundleId_vendorIdentifierList_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_1AEA79000, v0, v1, "FindMy/ManagedCBPeripheral feature flag is not enabled!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __74__SPCBPeripheralManager_stopSessionForUserIdentifier_bundleId_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_1AEA79000, v0, v1, "SPCBPeripheralManager: fetch response with no callback registered!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __30__SPCBPeripheralManager_fetch__block_invoke_4_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AEA79000, a2, OS_LOG_TYPE_ERROR, "SPCBPeripheralManager: fetch error: %@", (uint8_t *)&v2, 0xCu);
}

@end
