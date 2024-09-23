@implementation SPBeaconSharingManager

- (SPBeaconSharingXPCProtocol)proxy
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  FMXPCServiceDescription *v11;
  FMXPCServiceDescription *serviceDescription;
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
  -[SPBeaconSharingManager session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[SPBeaconSharingManager serviceDescription](self, "serviceDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      objc_initWeak(location, self);
      v5 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __31__SPBeaconSharingManager_proxy__block_invoke;
      aBlock[3] = &unk_1E5E16690;
      objc_copyWeak(&v29, location);
      v6 = _Block_copy(aBlock);
      v26[0] = v5;
      v26[1] = 3221225472;
      v26[2] = __31__SPBeaconSharingManager_proxy__block_invoke_2;
      v26[3] = &unk_1E5E16690;
      objc_copyWeak(&v27, location);
      v7 = _Block_copy(v26);
      v8 = objc_alloc(MEMORY[0x1E0D20238]);
      +[SPBeaconSharingManager exportedInterface](SPBeaconSharingManager, "exportedInterface");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[SPBeaconSharingManager remoteInterface](SPBeaconSharingManager, "remoteInterface");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (FMXPCServiceDescription *)objc_msgSend(v8, "initWithMachServiceName:options:exportedObject:exportedInterface:remoteObjectInterface:interruptionHandler:invalidationHandler:", CFSTR("com.apple.icloud.searchpartyd.beaconsharingservice"), 0, self, v9, v10, v6, v7);

      serviceDescription = self->_serviceDescription;
      self->_serviceDescription = v11;

      objc_destroyWeak(&v27);
      objc_destroyWeak(&v29);
      objc_destroyWeak(location);
    }
    v13 = objc_alloc(MEMORY[0x1E0D20240]);
    -[SPBeaconSharingManager serviceDescription](self, "serviceDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithServiceDescription:", v14);
    -[SPBeaconSharingManager setSession:](self, "setSession:", v15);

    LogCategory_BeaconSharing();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      -[SPBeaconSharingManager serviceDescription](self, "serviceDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "machService");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v18;
      _os_log_impl(&dword_1AEA79000, v16, OS_LOG_TYPE_DEFAULT, "SPBeaconSharingManager: Establishing XPC connection to %@", (uint8_t *)location, 0xCu);

    }
    -[SPBeaconSharingManager session](self, "session");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "resume");

    LogCategory_BeaconSharing();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      -[SPBeaconSharingManager serviceDescription](self, "serviceDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "machService");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v22;
      _os_log_impl(&dword_1AEA79000, v20, OS_LOG_TYPE_DEFAULT, "SPBeaconSharingManager: Established XPC connection to %@", (uint8_t *)location, 0xCu);

    }
  }
  -[SPBeaconSharingManager session](self, "session");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "proxy");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return (SPBeaconSharingXPCProtocol *)v24;
}

- (FMXPCSession)session
{
  return self->_session;
}

- (FMXPCServiceDescription)serviceDescription
{
  return self->_serviceDescription;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

+ (id)remoteInterface
{
  if (remoteInterface_onceToken_6 != -1)
    dispatch_once(&remoteInterface_onceToken_6, &__block_literal_global_61_0);
  return (id)remoteInterface_interface_5;
}

+ (id)exportedInterface
{
  if (exportedInterface_onceToken_5 != -1)
    dispatch_once(&exportedInterface_onceToken_5, &__block_literal_global_10);
  return (id)exportedInterface_interface_5;
}

uint64_t __68__SPBeaconSharingManager_startRefreshingSharesWithBlock_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)setShareUpdateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (SPBeaconSharingManager)init
{
  SPBeaconSharingManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  SPRetryCount *v6;
  SPRetryCount *retryCount;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SPBeaconSharingManager;
  v2 = -[SPBeaconSharingManager init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.icloud.searchpartyd.SPBeaconSharingManager", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = objc_alloc_init(SPRetryCount);
    retryCount = v2->_retryCount;
    v2->_retryCount = v6;

  }
  return v2;
}

void __54__SPBeaconSharingManager_sharingLimitsWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD block[5];
  id v5;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__SPBeaconSharingManager_sharingLimitsWithCompletion___block_invoke_2;
  block[3] = &unk_1E5E16720;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, block);

  objc_destroyWeak(&location);
}

void __68__SPBeaconSharingManager_startRefreshingSharesWithBlock_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__SPBeaconSharingManager_startRefreshingSharesWithBlock_completion___block_invoke_2;
  v4[3] = &unk_1E5E16DA8;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  dispatch_async(v2, v4);

  objc_destroyWeak(&location);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

void __54__SPBeaconSharingManager_sharingLimitsWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[16];

  LogCategory_BeaconSharing();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "Looking for current share limits.", buf, 2u);
  }

  v3 = *(id *)(a1 + 32);
  objc_msgSend(v3, "proxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__SPBeaconSharingManager_sharingLimitsWithCompletion___block_invoke_145;
  v5[3] = &unk_1E5E177E0;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "sharingLimitsWithCompletion:", v5);

}

void __68__SPBeaconSharingManager_startRefreshingSharesWithBlock_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[6];
  id v7;
  id v8;
  uint8_t buf[16];

  LogCategory_BeaconSharing();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "Starting share update monitoring", buf, 2u);
  }

  v3 = *(id *)(a1 + 32);
  objc_msgSend(v3, "proxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__SPBeaconSharingManager_startRefreshingSharesWithBlock_completion___block_invoke_125;
  v6[3] = &unk_1E5E17740;
  v5 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v6[5] = v3;
  v7 = v5;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v4, "startRefreshingSharesWithCompletion:", v6);

}

- (void)sharingLimitsWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD activity_block[5];
  id v7;

  v4 = a3;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __54__SPBeaconSharingManager_sharingLimitsWithCompletion___block_invoke;
  activity_block[3] = &unk_1E5E16720;
  activity_block[4] = self;
  v7 = v4;
  v5 = v4;
  _os_activity_initiate(&dword_1AEA79000, "SPOwnerSession: Calling sharingLimitsWithCompletion", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __68__SPBeaconSharingManager_startRefreshingSharesWithBlock_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  dispatch_get_global_queue(17, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__SPBeaconSharingManager_startRefreshingSharesWithBlock_completion___block_invoke_4;
  v7[3] = &unk_1E5E17278;
  v5 = *(id *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

void __43__SPBeaconSharingManager_exportedInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE1E4B8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)exportedInterface_interface_5;
  exportedInterface_interface_5 = v0;

  v2 = (void *)exportedInterface_interface_5;
  v3 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_receivedUpdatedShares_, 0, 0);

}

void __41__SPBeaconSharingManager_remoteInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE27B58);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)remoteInterface_interface_5;
  remoteInterface_interface_5 = v0;

  v2 = (void *)remoteInterface_interface_5;
  v3 = (void *)MEMORY[0x1E0C99E60];
  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_allSharesWithCompletion_, 0, 1);

  v6 = (void *)remoteInterface_interface_5;
  v7 = (void *)MEMORY[0x1E0C99E60];
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_allSharesIncludingHiddenWithCompletion_, 0, 1);

  v10 = (void *)remoteInterface_interface_5;
  v11 = (void *)MEMORY[0x1E0C99E60];
  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_share_recipients_shareType_completion_, 1, 0);

  v14 = (void *)remoteInterface_interface_5;
  v15 = (void *)MEMORY[0x1E0C99E60];
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  v20 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v16, v18, v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_share_recipients_shareType_completion_, 1, 1);

}

- (void)startRefreshingSharesWithBlock:(id)a3 completion:(id)a4
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
  activity_block[2] = __68__SPBeaconSharingManager_startRefreshingSharesWithBlock_completion___block_invoke;
  activity_block[3] = &unk_1E5E16DA8;
  activity_block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_1AEA79000, "SPOwnerSession: Calling startRefreshingSharesWithBlock:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __31__SPBeaconSharingManager_proxy__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "interruptionHandler:", v3);

}

void __31__SPBeaconSharingManager_proxy__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "invalidationHandler:", v3);

}

- (void)interruptionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  LogCategory_BeaconSharing();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v9 = v4;
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "SPBeaconSharingManager: interruptionHandler %@", buf, 0xCu);
  }

  -[SPBeaconSharingManager queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__SPBeaconSharingManager_interruptionHandler___block_invoke;
  block[3] = &unk_1E5E16668;
  block[4] = self;
  dispatch_async(v6, block);

}

void __46__SPBeaconSharingManager_interruptionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  uint8_t buf[4];
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "shareUpdateBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "retryCount");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "decayWaitInterval");
    v5 = v4;

    LogCategory_BeaconSharing();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v14 = v5;
      _os_log_impl(&dword_1AEA79000, v6, OS_LOG_TYPE_DEFAULT, "SPBeaconSharingManager: Will attempt to re-subscribe to share updates after %f seconds", buf, 0xCu);
    }

    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    v7 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__SPBeaconSharingManager_interruptionHandler___block_invoke_8;
    block[3] = &unk_1E5E16B08;
    objc_copyWeak(&v12, (id *)buf);
    dispatch_after(v7, v8, block);

    objc_msgSend(*(id *)(a1 + 32), "retryCount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "increment");

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    LogCategory_BeaconSharing();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AEA79000, v10, OS_LOG_TYPE_DEFAULT, "SPBeaconSharingManager: Will *NOT* attempt to re-subscribe to share updates", buf, 2u);
    }

  }
}

void __46__SPBeaconSharingManager_interruptionHandler___block_invoke_8(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  _BOOL4 v4;
  _QWORD v5[5];
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "shareUpdateBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LogCategory_BeaconSharing();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AEA79000, v3, OS_LOG_TYPE_DEFAULT, "SPBeaconSharingManager Successfully: re-subscribing to share updates", buf, 2u);
    }

    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __46__SPBeaconSharingManager_interruptionHandler___block_invoke_9;
    v5[3] = &unk_1E5E17678;
    v5[4] = WeakRetained;
    objc_msgSend(WeakRetained, "startRefreshingSharesWithBlock:completion:", v2, v5);
  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AEA79000, v3, OS_LOG_TYPE_DEFAULT, "SPBeaconSharingManager shareUpdateBlock is nil, not resubscribing.", buf, 2u);
    }

  }
}

void __46__SPBeaconSharingManager_interruptionHandler___block_invoke_9(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a3;
  LogCategory_BeaconSharing();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1AEA79000, v7, OS_LOG_TYPE_DEFAULT, "SPBeaconSharingManager Successfully: re-subscribed to share updates", v8, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "retryCount");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject reset](v7, "reset");
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __46__SPBeaconSharingManager_interruptionHandler___block_invoke_9_cold_1((uint64_t)v5, v7);
  }

}

- (void)invalidationHandler:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconSharing();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[SPBeaconSharingManager serviceDescription](self, "serviceDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "debugDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1AEA79000, v4, OS_LOG_TYPE_DEFAULT, "SPBeaconSharingManager: invalidationHandler %@", (uint8_t *)&v7, 0xCu);

  }
}

- (void)share:(id)a3 recipients:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD activity_block[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __54__SPBeaconSharingManager_share_recipients_completion___block_invoke;
  activity_block[3] = &unk_1E5E16D08;
  activity_block[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  _os_activity_initiate(&dword_1AEA79000, "SPOwnerSession: Calling share:recipient:completion", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __54__SPBeaconSharingManager_share_recipients_completion___block_invoke(id *a1)
{
  NSObject *v2;
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;
  id v9;
  id location;

  objc_initWeak(&location, a1[4]);
  objc_msgSend(a1[4], "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__SPBeaconSharingManager_share_recipients_completion___block_invoke_2;
  block[3] = &unk_1E5E16D08;
  v6 = a1[5];
  v3 = a1[6];
  v4 = a1[4];
  v7 = v3;
  v8 = v4;
  v9 = a1[7];
  dispatch_async(v2, block);

  objc_destroyWeak(&location);
}

void __54__SPBeaconSharingManager_share_recipients_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconSharing();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v14 = v3;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "Offering a share of %@ to %@", buf, 0x16u);
  }

  v5 = *(id *)(a1 + 48);
  objc_msgSend(v5, "proxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__SPBeaconSharingManager_share_recipients_completion___block_invoke_108;
  v9[3] = &unk_1E5E176A0;
  v10 = v7;
  v11 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 56);
  objc_msgSend(v6, "share:recipients:shareType:completion:", v10, v8, 2, v9);

}

void __54__SPBeaconSharingManager_share_recipients_completion___block_invoke_108(_QWORD *a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  int v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  LogCategory_BeaconSharing();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = a1[4];
    v8 = a1[5];
    v9 = 138413058;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    v13 = 1024;
    v14 = a2;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_1AEA79000, v6, OS_LOG_TYPE_DEFAULT, "Completed offering a share of %@ to %@ (%d, %@)", (uint8_t *)&v9, 0x26u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)share:(id)a3 recipients:(id)a4 shareType:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD activity_block[5];
  id v17;
  id v18;
  id v19;
  unint64_t v20;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __64__SPBeaconSharingManager_share_recipients_shareType_completion___block_invoke;
  activity_block[3] = &unk_1E5E172A0;
  activity_block[4] = self;
  v17 = v10;
  v19 = v12;
  v20 = a5;
  v18 = v11;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  _os_activity_initiate(&dword_1AEA79000, "SPOwnerSession: Calling share:recipient:completion", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __64__SPBeaconSharingManager_share_recipients_shareType_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__SPBeaconSharingManager_share_recipients_shareType_completion___block_invoke_2;
  v6[3] = &unk_1E5E172A0;
  v7 = *(id *)(a1 + 40);
  v3 = *(id *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v4;
  v5 = *(void **)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 64);
  v10 = v5;
  dispatch_async(v2, v6);

  objc_destroyWeak(&location);
}

void __64__SPBeaconSharingManager_share_recipients_shareType_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconSharing();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v15 = v3;
    v16 = 2112;
    v17 = v4;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "Offering a share of %@ to %@", buf, 0x16u);
  }

  v5 = *(id *)(a1 + 48);
  objc_msgSend(v5, "proxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 64);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__SPBeaconSharingManager_share_recipients_shareType_completion___block_invoke_110;
  v10[3] = &unk_1E5E176A0;
  v11 = v7;
  v12 = *(id *)(a1 + 40);
  v13 = *(id *)(a1 + 56);
  objc_msgSend(v6, "share:recipients:shareType:completion:", v11, v8, v9, v10);

}

void __64__SPBeaconSharingManager_share_recipients_shareType_completion___block_invoke_110(_QWORD *a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  int v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  LogCategory_BeaconSharing();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = a1[4];
    v8 = a1[5];
    v9 = 138413058;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    v13 = 1024;
    v14 = a2;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_1AEA79000, v6, OS_LOG_TYPE_DEFAULT, "Completed offering a share of %@ to %@ (%d, %@)", (uint8_t *)&v9, 0x26u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)requestShare:(id)a3 completion:(id)a4
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
  activity_block[2] = __50__SPBeaconSharingManager_requestShare_completion___block_invoke;
  activity_block[3] = &unk_1E5E16770;
  activity_block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_1AEA79000, "SPOwnerSession: Calling requestShare:unknownBeacon:completion", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __50__SPBeaconSharingManager_requestShare_completion___block_invoke(id *a1)
{
  NSObject *v2;
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id location;

  objc_initWeak(&location, a1[4]);
  objc_msgSend(a1[4], "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__SPBeaconSharingManager_requestShare_completion___block_invoke_2;
  v5[3] = &unk_1E5E16770;
  v3 = a1[5];
  v4 = a1[4];
  v6 = v3;
  v7 = v4;
  v8 = a1[6];
  dispatch_async(v2, v5);

  objc_destroyWeak(&location);
}

void __50__SPBeaconSharingManager_requestShare_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconSharing();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v11 = v3;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "Requesting a share of %@", buf, 0xCu);
  }

  v4 = *(id *)(a1 + 40);
  objc_msgSend(v4, "proxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__SPBeaconSharingManager_requestShare_completion___block_invoke_111;
  v7[3] = &unk_1E5E176C8;
  v8 = v6;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v5, "requestShare:completion:", v8, v7);

}

void __50__SPBeaconSharingManager_requestShare_completion___block_invoke_111(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  LogCategory_BeaconSharing();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138412802;
    v9 = v7;
    v10 = 1024;
    v11 = a2;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_1AEA79000, v6, OS_LOG_TYPE_DEFAULT, "Completed requesting a share of %@ (%d, %@)", (uint8_t *)&v8, 0x1Cu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)removeShare:(id)a3 completion:(id)a4
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
  activity_block[2] = __49__SPBeaconSharingManager_removeShare_completion___block_invoke;
  activity_block[3] = &unk_1E5E16770;
  activity_block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_1AEA79000, "SPOwnerSession: Calling removeShare:completion", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __49__SPBeaconSharingManager_removeShare_completion___block_invoke(id *a1)
{
  NSObject *v2;
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id location;

  objc_initWeak(&location, a1[4]);
  objc_msgSend(a1[4], "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__SPBeaconSharingManager_removeShare_completion___block_invoke_2;
  v5[3] = &unk_1E5E16770;
  v3 = a1[5];
  v4 = a1[4];
  v6 = v3;
  v7 = v4;
  v8 = a1[6];
  dispatch_async(v2, v5);

  objc_destroyWeak(&location);
}

void __49__SPBeaconSharingManager_removeShare_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconSharing();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v10 = v3;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "Removing share %@", buf, 0xCu);
  }

  v4 = *(id *)(a1 + 40);
  objc_msgSend(v4, "proxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__SPBeaconSharingManager_removeShare_completion___block_invoke_112;
  v7[3] = &unk_1E5E176F0;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v5, "removeShare:completion:", v6, v7);

}

uint64_t __49__SPBeaconSharingManager_removeShare_completion___block_invoke_112(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)revokeShare:(id)a3 completion:(id)a4
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
  activity_block[2] = __49__SPBeaconSharingManager_revokeShare_completion___block_invoke;
  activity_block[3] = &unk_1E5E16770;
  activity_block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_1AEA79000, "SPOwnerSession: Calling revokeShare:completion", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __49__SPBeaconSharingManager_revokeShare_completion___block_invoke(id *a1)
{
  NSObject *v2;
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id location;

  objc_initWeak(&location, a1[4]);
  objc_msgSend(a1[4], "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__SPBeaconSharingManager_revokeShare_completion___block_invoke_2;
  v5[3] = &unk_1E5E16770;
  v3 = a1[5];
  v4 = a1[4];
  v6 = v3;
  v7 = v4;
  v8 = a1[6];
  dispatch_async(v2, v5);

  objc_destroyWeak(&location);
}

void __49__SPBeaconSharingManager_revokeShare_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconSharing();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v10 = v3;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "Marking revoke for share %@", buf, 0xCu);
  }

  v4 = *(id *)(a1 + 40);
  objc_msgSend(v4, "proxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__SPBeaconSharingManager_revokeShare_completion___block_invoke_113;
  v7[3] = &unk_1E5E176F0;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v5, "revokeShare:completion:", v6, v7);

}

uint64_t __49__SPBeaconSharingManager_revokeShare_completion___block_invoke_113(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)acceptShare:(id)a3 completion:(id)a4
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
  activity_block[2] = __49__SPBeaconSharingManager_acceptShare_completion___block_invoke;
  activity_block[3] = &unk_1E5E16770;
  activity_block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_1AEA79000, "SPOwnerSession: Calling acceptShare:completion", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __49__SPBeaconSharingManager_acceptShare_completion___block_invoke(id *a1)
{
  NSObject *v2;
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id location;

  objc_initWeak(&location, a1[4]);
  objc_msgSend(a1[4], "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__SPBeaconSharingManager_acceptShare_completion___block_invoke_2;
  v5[3] = &unk_1E5E16770;
  v3 = a1[5];
  v4 = a1[4];
  v6 = v3;
  v7 = v4;
  v8 = a1[6];
  dispatch_async(v2, v5);

  objc_destroyWeak(&location);
}

void __49__SPBeaconSharingManager_acceptShare_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconSharing();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v10 = v3;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "Accepting share %@", buf, 0xCu);
  }

  v4 = *(id *)(a1 + 40);
  objc_msgSend(v4, "proxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__SPBeaconSharingManager_acceptShare_completion___block_invoke_114;
  v7[3] = &unk_1E5E176F0;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v5, "acceptShare:completion:", v6, v7);

}

uint64_t __49__SPBeaconSharingManager_acceptShare_completion___block_invoke_114(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)declineShare:(id)a3 completion:(id)a4
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
  activity_block[2] = __50__SPBeaconSharingManager_declineShare_completion___block_invoke;
  activity_block[3] = &unk_1E5E16770;
  activity_block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_1AEA79000, "SPOwnerSession: Calling declineShare:completion", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __50__SPBeaconSharingManager_declineShare_completion___block_invoke(id *a1)
{
  NSObject *v2;
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id location;

  objc_initWeak(&location, a1[4]);
  objc_msgSend(a1[4], "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__SPBeaconSharingManager_declineShare_completion___block_invoke_2;
  v5[3] = &unk_1E5E16770;
  v3 = a1[5];
  v4 = a1[4];
  v6 = v3;
  v7 = v4;
  v8 = a1[6];
  dispatch_async(v2, v5);

  objc_destroyWeak(&location);
}

void __50__SPBeaconSharingManager_declineShare_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconSharing();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v10 = v3;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "Declining share %@", buf, 0xCu);
  }

  v4 = *(id *)(a1 + 40);
  objc_msgSend(v4, "proxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__SPBeaconSharingManager_declineShare_completion___block_invoke_115;
  v7[3] = &unk_1E5E176F0;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v5, "declineShare:completion:", v6, v7);

}

uint64_t __50__SPBeaconSharingManager_declineShare_completion___block_invoke_115(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)stopSharing:(id)a3 completion:(id)a4
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
  activity_block[2] = __49__SPBeaconSharingManager_stopSharing_completion___block_invoke;
  activity_block[3] = &unk_1E5E16770;
  activity_block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_1AEA79000, "SPOwnerSession: Calling stopSharing:completion", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __49__SPBeaconSharingManager_stopSharing_completion___block_invoke(id *a1)
{
  NSObject *v2;
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id location;

  objc_initWeak(&location, a1[4]);
  objc_msgSend(a1[4], "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__SPBeaconSharingManager_stopSharing_completion___block_invoke_2;
  v5[3] = &unk_1E5E16770;
  v3 = a1[5];
  v4 = a1[4];
  v6 = v3;
  v7 = v4;
  v8 = a1[6];
  dispatch_async(v2, v5);

  objc_destroyWeak(&location);
}

void __49__SPBeaconSharingManager_stopSharing_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconSharing();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v10 = v3;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "Stopping sharing for beacon %@", buf, 0xCu);
  }

  v4 = *(id *)(a1 + 40);
  objc_msgSend(v4, "proxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__SPBeaconSharingManager_stopSharing_completion___block_invoke_116;
  v7[3] = &unk_1E5E176F0;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v5, "stopSharing:completion:", v6, v7);

}

uint64_t __49__SPBeaconSharingManager_stopSharing_completion___block_invoke_116(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)cleanupAllRecordsOfType:(unint64_t)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD activity_block[5];
  id v9;
  unint64_t v10;

  v6 = a4;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __61__SPBeaconSharingManager_cleanupAllRecordsOfType_completion___block_invoke;
  activity_block[3] = &unk_1E5E16D80;
  v9 = v6;
  v10 = a3;
  activity_block[4] = self;
  v7 = v6;
  _os_activity_initiate(&dword_1AEA79000, "SPOwnerSession: Calling cleanupAllRecordsOfType:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __61__SPBeaconSharingManager_cleanupAllRecordsOfType_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  uint64_t v7;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__SPBeaconSharingManager_cleanupAllRecordsOfType_completion___block_invoke_2;
  v5[3] = &unk_1E5E16D80;
  v4 = *(void **)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v5[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v6 = v4;
  dispatch_async(v2, v5);

  objc_destroyWeak(&location);
}

void __61__SPBeaconSharingManager_cleanupAllRecordsOfType_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[16];

  LogCategory_BeaconSharing();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "cleanup All Item Sharing Info", buf, 2u);
  }

  v3 = *(id *)(a1 + 32);
  objc_msgSend(v3, "proxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__SPBeaconSharingManager_cleanupAllRecordsOfType_completion___block_invoke_117;
  v6[3] = &unk_1E5E176F0;
  v5 = *(_QWORD *)(a1 + 48);
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v4, "cleanupAllRecordsOfType:completion:", v5, v6);

}

uint64_t __61__SPBeaconSharingManager_cleanupAllRecordsOfType_completion___block_invoke_117(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)forceBreakAllSharesOfType:(unint64_t)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD activity_block[5];
  id v9;
  unint64_t v10;

  v6 = a4;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __63__SPBeaconSharingManager_forceBreakAllSharesOfType_completion___block_invoke;
  activity_block[3] = &unk_1E5E16D80;
  v9 = v6;
  v10 = a3;
  activity_block[4] = self;
  v7 = v6;
  _os_activity_initiate(&dword_1AEA79000, "SPOwnerSession: Calling forceBreakAllSharesOfType:completion", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __63__SPBeaconSharingManager_forceBreakAllSharesOfType_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  uint64_t v7;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__SPBeaconSharingManager_forceBreakAllSharesOfType_completion___block_invoke_2;
  v5[3] = &unk_1E5E16D80;
  v3 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 48);
  v5[4] = v4;
  v6 = v3;
  dispatch_async(v2, v5);

  objc_destroyWeak(&location);
}

void __63__SPBeaconSharingManager_forceBreakAllSharesOfType_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconSharing();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 134217984;
    v10 = v3;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "Force breaking all shares of type %lu", buf, 0xCu);
  }

  v4 = *(id *)(a1 + 32);
  objc_msgSend(v4, "proxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__SPBeaconSharingManager_forceBreakAllSharesOfType_completion___block_invoke_118;
  v7[3] = &unk_1E5E176F0;
  v6 = *(_QWORD *)(a1 + 48);
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v5, "forceBreakAllSharesOfType:completion:", v6, v7);

}

uint64_t __63__SPBeaconSharingManager_forceBreakAllSharesOfType_completion___block_invoke_118(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)forceBreakAllSharesWithUser:(id)a3 completion:(id)a4
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
  activity_block[2] = __65__SPBeaconSharingManager_forceBreakAllSharesWithUser_completion___block_invoke;
  activity_block[3] = &unk_1E5E16770;
  activity_block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_1AEA79000, "SPOwnerSession: Calling forceBreakAllSharesWithUser:completion", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __65__SPBeaconSharingManager_forceBreakAllSharesWithUser_completion___block_invoke(id *a1)
{
  NSObject *v2;
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id location;

  objc_initWeak(&location, a1[4]);
  objc_msgSend(a1[4], "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__SPBeaconSharingManager_forceBreakAllSharesWithUser_completion___block_invoke_2;
  v5[3] = &unk_1E5E16770;
  v3 = a1[5];
  v4 = a1[4];
  v6 = v3;
  v7 = v4;
  v8 = a1[6];
  dispatch_async(v2, v5);

  objc_destroyWeak(&location);
}

void __65__SPBeaconSharingManager_forceBreakAllSharesWithUser_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconSharing();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v10 = v3;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "Force breaking all shares with user %@", buf, 0xCu);
  }

  v4 = *(id *)(a1 + 40);
  objc_msgSend(v4, "proxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__SPBeaconSharingManager_forceBreakAllSharesWithUser_completion___block_invoke_119;
  v7[3] = &unk_1E5E176F0;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v5, "forceBreakAllSharesWithUser:completion:", v6, v7);

}

uint64_t __65__SPBeaconSharingManager_forceBreakAllSharesWithUser_completion___block_invoke_119(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)forceDeclineShare:(id)a3 completion:(id)a4
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
  activity_block[2] = __55__SPBeaconSharingManager_forceDeclineShare_completion___block_invoke;
  activity_block[3] = &unk_1E5E16770;
  activity_block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_1AEA79000, "SPOwnerSession: Calling forceDeclineShare:completion", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __55__SPBeaconSharingManager_forceDeclineShare_completion___block_invoke(id *a1)
{
  NSObject *v2;
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id location;

  objc_initWeak(&location, a1[4]);
  objc_msgSend(a1[4], "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__SPBeaconSharingManager_forceDeclineShare_completion___block_invoke_2;
  v5[3] = &unk_1E5E16770;
  v3 = a1[5];
  v4 = a1[4];
  v6 = v3;
  v7 = v4;
  v8 = a1[6];
  dispatch_async(v2, v5);

  objc_destroyWeak(&location);
}

void __55__SPBeaconSharingManager_forceDeclineShare_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconSharing();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v10 = v3;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: Calling forceDeclineShare of shareIdentifier = %@", buf, 0xCu);
  }

  v4 = *(id *)(a1 + 40);
  objc_msgSend(v4, "proxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__SPBeaconSharingManager_forceDeclineShare_completion___block_invoke_120;
  v7[3] = &unk_1E5E176F0;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v5, "forceDeclineShare:completion:", v6, v7);

}

uint64_t __55__SPBeaconSharingManager_forceDeclineShare_completion___block_invoke_120(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)forceStopSharing:(id)a3 completion:(id)a4
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
  activity_block[2] = __54__SPBeaconSharingManager_forceStopSharing_completion___block_invoke;
  activity_block[3] = &unk_1E5E16770;
  activity_block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_1AEA79000, "SPOwnerSession: Calling forceStopSharing:completion", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __54__SPBeaconSharingManager_forceStopSharing_completion___block_invoke(id *a1)
{
  NSObject *v2;
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id location;

  objc_initWeak(&location, a1[4]);
  objc_msgSend(a1[4], "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__SPBeaconSharingManager_forceStopSharing_completion___block_invoke_2;
  v5[3] = &unk_1E5E16770;
  v3 = a1[5];
  v4 = a1[4];
  v6 = v3;
  v7 = v4;
  v8 = a1[6];
  dispatch_async(v2, v5);

  objc_destroyWeak(&location);
}

void __54__SPBeaconSharingManager_forceStopSharing_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconSharing();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v10 = v3;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "Force stopping sharing for beacon %@", buf, 0xCu);
  }

  v4 = *(id *)(a1 + 40);
  objc_msgSend(v4, "proxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__SPBeaconSharingManager_forceStopSharing_completion___block_invoke_121;
  v7[3] = &unk_1E5E176F0;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v5, "forceStopSharing:completion:", v6, v7);

}

uint64_t __54__SPBeaconSharingManager_forceStopSharing_completion___block_invoke_121(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)allSharesWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD activity_block[5];
  id v7;

  v4 = a3;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __50__SPBeaconSharingManager_allSharesWithCompletion___block_invoke;
  activity_block[3] = &unk_1E5E16720;
  activity_block[4] = self;
  v7 = v4;
  v5 = v4;
  _os_activity_initiate(&dword_1AEA79000, "SPOwnerSession: Calling allSharesWithCompletion", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __50__SPBeaconSharingManager_allSharesWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD block[5];
  id v5;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__SPBeaconSharingManager_allSharesWithCompletion___block_invoke_2;
  block[3] = &unk_1E5E16720;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, block);

  objc_destroyWeak(&location);
}

void __50__SPBeaconSharingManager_allSharesWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[16];

  LogCategory_BeaconSharing();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "Listing all shares", buf, 2u);
  }

  v3 = *(id *)(a1 + 32);
  objc_msgSend(v3, "proxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__SPBeaconSharingManager_allSharesWithCompletion___block_invoke_122;
  v5[3] = &unk_1E5E17228;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "allSharesWithCompletion:", v5);

}

void __50__SPBeaconSharingManager_allSharesWithCompletion___block_invoke_122(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  LogCategory_BeaconSharing();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1AEA79000, v4, OS_LOG_TYPE_DEFAULT, "Completed listing all shares: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)allSharesIncludingHiddenWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD activity_block[5];
  id v7;

  v4 = a3;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __65__SPBeaconSharingManager_allSharesIncludingHiddenWithCompletion___block_invoke;
  activity_block[3] = &unk_1E5E16720;
  activity_block[4] = self;
  v7 = v4;
  v5 = v4;
  _os_activity_initiate(&dword_1AEA79000, "SPOwnerSession: Calling allSharesIncludingHidden:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __65__SPBeaconSharingManager_allSharesIncludingHiddenWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD block[5];
  id v5;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__SPBeaconSharingManager_allSharesIncludingHiddenWithCompletion___block_invoke_2;
  block[3] = &unk_1E5E16720;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, block);

  objc_destroyWeak(&location);
}

void __65__SPBeaconSharingManager_allSharesIncludingHiddenWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[16];

  LogCategory_BeaconSharing();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "Listing all shares, including hidden", buf, 2u);
  }

  v3 = *(id *)(a1 + 32);
  objc_msgSend(v3, "proxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__SPBeaconSharingManager_allSharesIncludingHiddenWithCompletion___block_invoke_124;
  v5[3] = &unk_1E5E17228;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "allSharesIncludingHiddenWithCompletion:", v5);

}

void __65__SPBeaconSharingManager_allSharesIncludingHiddenWithCompletion___block_invoke_124(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  LogCategory_BeaconSharing();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1AEA79000, v4, OS_LOG_TYPE_DEFAULT, "Completed listing all shares, including hidden: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __68__SPBeaconSharingManager_startRefreshingSharesWithBlock_completion___block_invoke_125(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[6];
  id v12;
  char v13;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__SPBeaconSharingManager_startRefreshingSharesWithBlock_completion___block_invoke_2_126;
  v11[3] = &unk_1E5E17718;
  v13 = a2;
  v11[4] = *(_QWORD *)(a1 + 32);
  v8 = *(id *)(a1 + 48);
  v11[5] = *(_QWORD *)(a1 + 40);
  v12 = v8;
  dispatch_sync(v7, v11);

  (*(void (**)(_QWORD, uint64_t, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), a2, v6, v9, v10);
}

void __68__SPBeaconSharingManager_startRefreshingSharesWithBlock_completion___block_invoke_2_126(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "setShareUpdateBlock:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "proxy");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __68__SPBeaconSharingManager_startRefreshingSharesWithBlock_completion___block_invoke_3;
    v3[3] = &unk_1E5E17228;
    v4 = *(id *)(a1 + 48);
    objc_msgSend(v2, "allSharesWithCompletion:", v3);

  }
}

- (void)stopRefreshingSharesWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD activity_block[5];
  id v7;

  v4 = a3;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __61__SPBeaconSharingManager_stopRefreshingSharesWithCompletion___block_invoke;
  activity_block[3] = &unk_1E5E16720;
  activity_block[4] = self;
  v7 = v4;
  v5 = v4;
  _os_activity_initiate(&dword_1AEA79000, "SPOwnerSession: Calling stopRefreshingSharesWithCompletion", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __61__SPBeaconSharingManager_stopRefreshingSharesWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD block[5];
  id v5;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__SPBeaconSharingManager_stopRefreshingSharesWithCompletion___block_invoke_2;
  block[3] = &unk_1E5E16720;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, block);

  objc_destroyWeak(&location);
}

void __61__SPBeaconSharingManager_stopRefreshingSharesWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[16];

  LogCategory_BeaconSharing();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "Stopping share update monitoring", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setShareUpdateBlock:", 0);
  v3 = *(id *)(a1 + 32);
  objc_msgSend(v3, "proxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__SPBeaconSharingManager_stopRefreshingSharesWithCompletion___block_invoke_127;
  v5[3] = &unk_1E5E176F0;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "stopRefreshingSharesWithCompletion:", v5);

}

uint64_t __61__SPBeaconSharingManager_stopRefreshingSharesWithCompletion___block_invoke_127(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)uploadKeysWithCircleIdentifier:(id)a3 isInitialUpload:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD activity_block[5];
  id v13;
  id v14;
  BOOL v15;

  v8 = a3;
  v9 = a5;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __84__SPBeaconSharingManager_uploadKeysWithCircleIdentifier_isInitialUpload_completion___block_invoke;
  activity_block[3] = &unk_1E5E17768;
  activity_block[4] = self;
  v13 = v8;
  v15 = a4;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  _os_activity_initiate(&dword_1AEA79000, "os_activity_initiate: Calling uploadKeysWithCircleIdentifier:isInitialUpload:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __84__SPBeaconSharingManager_uploadKeysWithCircleIdentifier_isInitialUpload_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  _QWORD block[4];
  id v6;
  uint64_t v7;
  id v8;
  char v9;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__SPBeaconSharingManager_uploadKeysWithCircleIdentifier_isInitialUpload_completion___block_invoke_2;
  block[3] = &unk_1E5E17768;
  v3 = *(id *)(a1 + 40);
  v9 = *(_BYTE *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v4;
  v8 = *(id *)(a1 + 48);
  dispatch_async(v2, block);

  objc_destroyWeak(&location);
}

void __84__SPBeaconSharingManager_uploadKeysWithCircleIdentifier_isInitialUpload_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  const __CFString *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconSharing();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = CFSTR("high");
    if (!*(_BYTE *)(a1 + 56))
      v4 = CFSTR("low");
    *(_DWORD *)buf = 138412546;
    v12 = v3;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "Uploading keys for owner circle identifier: %@, priority: %@", buf, 0x16u);
  }

  v5 = *(id *)(a1 + 40);
  objc_msgSend(v5, "proxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(unsigned __int8 *)(a1 + 56);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __84__SPBeaconSharingManager_uploadKeysWithCircleIdentifier_isInitialUpload_completion___block_invoke_132;
  v9[3] = &unk_1E5E176F0;
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v6, "uploadKeysWithCircleIdentifier:isInitialUpload:completion:", v7, v8, v9);

}

void __84__SPBeaconSharingManager_uploadKeysWithCircleIdentifier_isInitialUpload_completion___block_invoke_132(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  LogCategory_BeaconSharing();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "Completed keys upload", v6, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)downloadKeysWithCircleIdentifier:(id)a3 fromBookmark:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD activity_block[5];
  id v13;
  id v14;
  BOOL v15;

  v8 = a3;
  v9 = a5;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __83__SPBeaconSharingManager_downloadKeysWithCircleIdentifier_fromBookmark_completion___block_invoke;
  activity_block[3] = &unk_1E5E17768;
  activity_block[4] = self;
  v13 = v8;
  v15 = a4;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  _os_activity_initiate(&dword_1AEA79000, "os_activity_initiate: Calling downloadKeysWithCircleIdentifier:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __83__SPBeaconSharingManager_downloadKeysWithCircleIdentifier_fromBookmark_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  _QWORD block[4];
  id v6;
  uint64_t v7;
  id v8;
  char v9;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__SPBeaconSharingManager_downloadKeysWithCircleIdentifier_fromBookmark_completion___block_invoke_2;
  block[3] = &unk_1E5E17768;
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v4;
  v9 = *(_BYTE *)(a1 + 56);
  v8 = *(id *)(a1 + 48);
  dispatch_async(v2, block);

  objc_destroyWeak(&location);
}

void __83__SPBeaconSharingManager_downloadKeysWithCircleIdentifier_fromBookmark_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconSharing();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v11 = v3;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "Downloading keys for member circle identifier: %@", buf, 0xCu);
  }

  v4 = *(id *)(a1 + 40);
  objc_msgSend(v4, "proxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(unsigned __int8 *)(a1 + 56);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__SPBeaconSharingManager_downloadKeysWithCircleIdentifier_fromBookmark_completion___block_invoke_133;
  v8[3] = &unk_1E5E176F0;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v5, "downloadKeysWithCircleIdentifier:fromBookmark:completion:", v6, v7, v8);

}

void __83__SPBeaconSharingManager_downloadKeysWithCircleIdentifier_fromBookmark_completion___block_invoke_133(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  LogCategory_BeaconSharing();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "Completed keys download", v6, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updatedCircleIdentifiers:(id)a3 completion:(id)a4
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
  activity_block[2] = __62__SPBeaconSharingManager_updatedCircleIdentifiers_completion___block_invoke;
  activity_block[3] = &unk_1E5E16770;
  activity_block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_1AEA79000, "SPOwnerSession: Calling updatedCircleIdentifiers:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __62__SPBeaconSharingManager_updatedCircleIdentifiers_completion___block_invoke(id *a1)
{
  NSObject *v2;
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id location;

  objc_initWeak(&location, a1[4]);
  objc_msgSend(a1[4], "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__SPBeaconSharingManager_updatedCircleIdentifiers_completion___block_invoke_2;
  v5[3] = &unk_1E5E16770;
  v3 = a1[5];
  v4 = a1[4];
  v6 = v3;
  v7 = v4;
  v8 = a1[6];
  dispatch_async(v2, v5);

  objc_destroyWeak(&location);
}

void __62__SPBeaconSharingManager_updatedCircleIdentifiers_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconSharing();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v10 = v3;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "Updating circle identifiers: %@ ", buf, 0xCu);
  }

  v4 = *(id *)(a1 + 40);
  objc_msgSend(v4, "proxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__SPBeaconSharingManager_updatedCircleIdentifiers_completion___block_invoke_134;
  v7[3] = &unk_1E5E176F0;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v5, "updatedCircleIdentifiers:completion:", v6, v7);

}

uint64_t __62__SPBeaconSharingManager_updatedCircleIdentifiers_completion___block_invoke_134(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)checkDataIntegrityWithShareIdentifier:(id)a3 completion:(id)a4
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
  activity_block[2] = __75__SPBeaconSharingManager_checkDataIntegrityWithShareIdentifier_completion___block_invoke;
  activity_block[3] = &unk_1E5E16770;
  activity_block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_1AEA79000, "SPOwnerSession: Calling checkDataIntegrityWithShareIdentifier:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __75__SPBeaconSharingManager_checkDataIntegrityWithShareIdentifier_completion___block_invoke(id *a1)
{
  NSObject *v2;
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id location;

  objc_initWeak(&location, a1[4]);
  objc_msgSend(a1[4], "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__SPBeaconSharingManager_checkDataIntegrityWithShareIdentifier_completion___block_invoke_2;
  v5[3] = &unk_1E5E16770;
  v3 = a1[5];
  v4 = a1[4];
  v6 = v3;
  v7 = v4;
  v8 = a1[6];
  dispatch_async(v2, v5);

  objc_destroyWeak(&location);
}

void __75__SPBeaconSharingManager_checkDataIntegrityWithShareIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  __CFString *v3;
  NSObject *v4;
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(": %@"), v2);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_1E5E19868;
  }
  LogCategory_BeaconSharing();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v3;
    _os_log_impl(&dword_1AEA79000, v4, OS_LOG_TYPE_DEFAULT, "Checking data integrity%@ ", buf, 0xCu);
  }

  v5 = *(id *)(a1 + 40);
  objc_msgSend(v5, "proxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__SPBeaconSharingManager_checkDataIntegrityWithShareIdentifier_completion___block_invoke_140;
  v8[3] = &unk_1E5E17790;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v6, "checkDataIntegrityWithShareIdentifier:completion:", v7, v8);

}

uint64_t __75__SPBeaconSharingManager_checkDataIntegrityWithShareIdentifier_completion___block_invoke_140(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)lookForOrphanedRecordsWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD activity_block[5];
  id v7;

  v4 = a3;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __63__SPBeaconSharingManager_lookForOrphanedRecordsWithCompletion___block_invoke;
  activity_block[3] = &unk_1E5E16720;
  activity_block[4] = self;
  v7 = v4;
  v5 = v4;
  _os_activity_initiate(&dword_1AEA79000, "SPOwnerSession: Calling lookForOrphanedRecordsWithCompletion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __63__SPBeaconSharingManager_lookForOrphanedRecordsWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD block[5];
  id v5;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__SPBeaconSharingManager_lookForOrphanedRecordsWithCompletion___block_invoke_2;
  block[3] = &unk_1E5E16720;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, block);

  objc_destroyWeak(&location);
}

void __63__SPBeaconSharingManager_lookForOrphanedRecordsWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[16];

  LogCategory_BeaconSharing();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "Looking for orphaned item sharing records.", buf, 2u);
  }

  v3 = *(id *)(a1 + 32);
  objc_msgSend(v3, "proxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__SPBeaconSharingManager_lookForOrphanedRecordsWithCompletion___block_invoke_142;
  v5[3] = &unk_1E5E177B8;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "lookForOrphanedRecordsWithCompletion:", v5);

}

uint64_t __63__SPBeaconSharingManager_lookForOrphanedRecordsWithCompletion___block_invoke_142(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeExpiredSharesWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD activity_block[5];
  id v7;

  v4 = a3;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __60__SPBeaconSharingManager_removeExpiredSharesWithCompletion___block_invoke;
  activity_block[3] = &unk_1E5E16720;
  activity_block[4] = self;
  v7 = v4;
  v5 = v4;
  _os_activity_initiate(&dword_1AEA79000, "SPOwnerSession: Calling removeExpiredSharesWithCompletion", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __60__SPBeaconSharingManager_removeExpiredSharesWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD block[5];
  id v5;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__SPBeaconSharingManager_removeExpiredSharesWithCompletion___block_invoke_2;
  block[3] = &unk_1E5E16720;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, block);

  objc_destroyWeak(&location);
}

void __60__SPBeaconSharingManager_removeExpiredSharesWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[16];

  LogCategory_BeaconSharing();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "Removing expired share suggestions and share requests.", buf, 2u);
  }

  v3 = *(id *)(a1 + 32);
  objc_msgSend(v3, "proxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__SPBeaconSharingManager_removeExpiredSharesWithCompletion___block_invoke_144;
  v5[3] = &unk_1E5E176F0;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "removeExpiredSharesWithCompletion:", v5);

}

uint64_t __60__SPBeaconSharingManager_removeExpiredSharesWithCompletion___block_invoke_144(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __54__SPBeaconSharingManager_sharingLimitsWithCompletion___block_invoke_145(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)receivedUpdatedShares:(id)a3
{
  id v4;
  id v5;
  _QWORD activity_block[5];
  id v7;

  v4 = a3;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __48__SPBeaconSharingManager_receivedUpdatedShares___block_invoke;
  activity_block[3] = &unk_1E5E16818;
  activity_block[4] = self;
  v7 = v4;
  v5 = v4;
  _os_activity_initiate(&dword_1AEA79000, "SPOwnerSession: Called receivedUpdatedShares", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __48__SPBeaconSharingManager_receivedUpdatedShares___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__SPBeaconSharingManager_receivedUpdatedShares___block_invoke_2;
  v4[3] = &unk_1E5E16818;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_sync(v2, v4);

}

void __48__SPBeaconSharingManager_receivedUpdatedShares___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[16];

  LogCategory_BeaconSharing();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "Received updated shares", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "shareUpdateBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "shareUpdateBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(17, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48__SPBeaconSharingManager_receivedUpdatedShares___block_invoke_147;
    v7[3] = &unk_1E5E17278;
    v9 = v4;
    v8 = *(id *)(a1 + 40);
    v6 = v4;
    dispatch_async(v5, v7);

  }
}

void __48__SPBeaconSharingManager_receivedUpdatedShares___block_invoke_147(uint64_t a1)
{
  NSObject *v1;
  uint8_t v2[16];

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  LogCategory_BeaconSharing();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1AEA79000, v1, OS_LOG_TYPE_DEFAULT, "Share update block called.", v2, 2u);
  }

}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void)setServiceDescription:(id)a3
{
  objc_storeStrong((id *)&self->_serviceDescription, a3);
}

- (void)setProxy:(id)a3
{
  objc_storeStrong((id *)&self->_proxy, a3);
}

- (id)shareUpdateBlock
{
  return self->_shareUpdateBlock;
}

- (SPRetryCount)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(id)a3
{
  objc_storeStrong((id *)&self->_retryCount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryCount, 0);
  objc_storeStrong(&self->_shareUpdateBlock, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_serviceDescription, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __46__SPBeaconSharingManager_interruptionHandler___block_invoke_9_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AEA79000, a2, OS_LOG_TYPE_ERROR, "SPBeaconSharingManager: Error re-subscribing share updates %@", (uint8_t *)&v2, 0xCu);
}

@end
