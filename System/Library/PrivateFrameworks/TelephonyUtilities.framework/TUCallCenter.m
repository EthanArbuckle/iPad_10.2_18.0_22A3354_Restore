@implementation TUCallCenter

+ (id)sharedInstanceWithQueue:(id)a3 server:(id)a4 shouldRegister:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  BOOL v19;

  v8 = a3;
  v9 = a4;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __62__TUCallCenter_sharedInstanceWithQueue_server_shouldRegister___block_invoke;
  v15[3] = &unk_1E38A4508;
  v17 = v9;
  v18 = a1;
  v16 = v8;
  v19 = a5;
  v10 = sharedInstanceWithQueue_server_shouldRegister__pred;
  v11 = v9;
  v12 = v8;
  if (v10 != -1)
    dispatch_once(&sharedInstanceWithQueue_server_shouldRegister__pred, v15);
  v13 = (id)sharedInstanceWithQueue_server_shouldRegister__sharedInstance;

  return v13;
}

- (unint64_t)currentCallCount
{
  void *v2;
  unint64_t v3;

  -[TUCallCenter callContainer](self, "callContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "currentCallCount");

  return v3;
}

- (TUCall)activeVideoCall
{
  void *v2;
  void *v3;

  -[TUCallCenter callContainer](self, "callContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeVideoCall");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TUCall *)v3;
}

- (TUCallContainerPrivate)callContainer
{
  void *v2;
  void *v3;

  -[TUCallCenter callServicesInterface](self, "callServicesInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TUCallContainerPrivate *)v3;
}

- (TUCallServicesInterface)callServicesInterface
{
  return self->_callServicesInterface;
}

+ (TUCallCenter)sharedInstance
{
  return (TUCallCenter *)objc_msgSend(a1, "sharedInstanceWithQueue:server:shouldRegister:", 0, 0, 1);
}

void __62__TUCallCenter_sharedInstanceWithQueue_server_shouldRegister___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 48), "callCenterWithQueue:server:shouldRegister:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)sharedInstanceWithQueue_server_shouldRegister__sharedInstance;
  sharedInstanceWithQueue_server_shouldRegister__sharedInstance = v1;

}

+ (TUCallCenter)callCenterWithQueue:(id)a3 server:(id)a4 shouldRegister:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  TUCallCenter *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  BOOL v20;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithQueue:", v9);

  objc_msgSend(v10, "callServicesInterface");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __58__TUCallCenter_callCenterWithQueue_server_shouldRegister___block_invoke;
  v17[3] = &unk_1E38A26F0;
  v12 = v10;
  v18 = v12;
  v19 = v8;
  v20 = a5;
  v13 = v8;
  objc_msgSend(v11, "performBlockOnQueue:", v17);

  v14 = v19;
  v15 = (TUCallCenter *)v12;

  return v15;
}

void __58__TUCallCenter_callCenterWithQueue_server_shouldRegister___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "callServicesInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServer:", v2);

  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "registerWithCompletionHandler:", 0);
}

uint64_t __46__TUCallCenter_registerWithCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetchTUUIXPCDataSource");
}

- (TUCallCenter)initWithQueue:(id)a3
{
  return -[TUCallCenter initWithQueue:wantsCallNotifications:](self, "initWithQueue:wantsCallNotifications:", a3, 1);
}

- (void)fetchTUUIXPCDataSource
{
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  uint8_t buf[16];

  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "register for UI data source", buf, 2u);
  }

  -[TUCallCenter callServicesInterface](self, "callServicesInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__TUCallCenter_fetchTUUIXPCDataSource__block_invoke;
  v5[3] = &unk_1E38A44E0;
  v5[4] = self;
  objc_msgSend(v4, "fetchAnonymousXPCEndpoint:", v5);

}

- (void)registerWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  TUCallCenter *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = self;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "for %@", buf, 0xCu);
  }

  -[TUCallCenter callServicesInterface](self, "callServicesInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestCurrentStateWithCompletionHandler:", v4);

  -[TUCallCenter callServicesInterface](self, "callServicesInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__TUCallCenter_registerWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E38A1360;
  v8[4] = self;
  objc_msgSend(v7, "performBlockOnQueue:", v8);

}

- (NSArray)displayedCalls
{
  void *v2;
  void *v3;

  -[TUCallCenter callContainer](self, "callContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayedCalls");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (TUVideoDeviceController)videoDeviceController
{
  TUVideoDeviceController *videoDeviceController;
  TUVideoDeviceController *v4;
  void *v5;
  TUVideoDeviceController *v6;
  TUVideoDeviceController *v7;

  videoDeviceController = self->_videoDeviceController;
  if (!videoDeviceController)
  {
    v4 = [TUVideoDeviceController alloc];
    -[TUCallCenter queue](self, "queue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[TUVideoDeviceController initWithSerialQueue:](v4, "initWithSerialQueue:", v5);
    v7 = self->_videoDeviceController;
    self->_videoDeviceController = v6;

    videoDeviceController = self->_videoDeviceController;
  }
  return videoDeviceController;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CNContactStore)contactStore
{
  CNContactStore *contactStore;
  CNContactStore *v4;
  CNContactStore *v5;

  contactStore = self->_contactStore;
  if (!contactStore)
  {
    objc_msgSend(MEMORY[0x1E0C97298], "tu_contactStore");
    v4 = (CNContactStore *)objc_claimAutoreleasedReturnValue();
    v5 = self->_contactStore;
    self->_contactStore = v4;

    contactStore = self->_contactStore;
  }
  return contactStore;
}

void __38__TUCallCenter_fetchTUUIXPCDataSource__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  TUUIXPCClientConnection *v7;
  _BOOL4 v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    TUDefaultLog();
    v7 = (TUUIXPCClientConnection *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_ERROR))
      __38__TUCallCenter_fetchTUUIXPCDataSource__block_invoke_cold_1((uint64_t)v6, &v7->super);
  }
  else
  {
    TUDefaultLog();
    v7 = (TUUIXPCClientConnection *)objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(&v7->super, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v8)
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_19A50D000, &v7->super, OS_LOG_TYPE_DEFAULT, "Received UI data source", v9, 2u);
      }

      v7 = -[TUUIXPCClientConnection initWithListenerEndpoint:callCenter:]([TUUIXPCClientConnection alloc], "initWithListenerEndpoint:callCenter:", v5, *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 32), "setUiDataSource:", v7);
    }
    else if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19A50D000, &v7->super, OS_LOG_TYPE_DEFAULT, "No UIDataSource is stored in callservicesd", buf, 2u);
    }
  }

}

- (void)setUiDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_uiDataSource, a3);
}

+ (TUCallCenter)callCenterWithQueue:(id)a3
{
  return (TUCallCenter *)objc_msgSend(a1, "callCenterWithQueue:server:shouldRegister:", a3, 0, 1);
}

- (NSArray)bargeCalls
{
  void *v2;
  void *v3;
  void *v4;
  NSArray *v5;

  -[TUCallCenter callContainer](self, "callContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "bargeCalls");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  if (v3)
    v4 = v3;
  else
    v4 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v4;

  return v5;
}

- (id)bargeCallWithUniqueProxyIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TUCallCenter callContainer](self, "callContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "bargeCallWithUniqueProxyIdentifier:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)bargeCallsPassingTest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[TUCallCenter callContainer](self, "callContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "bargeCallsPassingTest:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (v6)
    v7 = v6;
  else
    v7 = (void *)MEMORY[0x1E0C9AA60];
  v8 = v7;

  return v8;
}

- (TUCall)frontmostBargeCall
{
  void *v2;
  void *v3;

  -[TUCallCenter callContainer](self, "callContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "frontmostBargeCall");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (TUCall *)v3;
}

- (BOOL)handleWiredHeadsetFlashButtonForBargeCalls
{
  void *v3;
  BOOL v4;

  -[TUCallCenter frontmostBargeCall](self, "frontmostBargeCall");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "accessoryButtonEventsEnabled"))
    goto LABEL_7;
  if (objc_msgSend(v3, "transmissionMode") == 2)
    goto LABEL_3;
  if (!v3)
  {
LABEL_7:
    v4 = 0;
    goto LABEL_8;
  }
  if (objc_msgSend(v3, "isSendingTransmission"))
  {
    v4 = 1;
    -[TUCallCenter stopTransmissionForBargeCall:sourceIsHandsfreeAccessory:](self, "stopTransmissionForBargeCall:sourceIsHandsfreeAccessory:", v3, 1);
    goto LABEL_8;
  }
  if ((objc_msgSend(v3, "isOnHold") & 1) != 0
    || objc_msgSend(v3, "isReceivingTransmission") && !objc_msgSend(v3, "transmissionMode"))
  {
    v4 = 1;
    -[TUCallCenter startTransmissionForBargeCall:sourceIsHandsfreeAccessory:](self, "startTransmissionForBargeCall:sourceIsHandsfreeAccessory:", v3, 1);
    goto LABEL_8;
  }
LABEL_3:
  v4 = 1;
LABEL_8:

  return v4;
}

- (BOOL)handleMediaRemoteCommandForBargeCalls:(unsigned int)a3
{
  return 0;
}

+ (id)sharedContactStore
{
  if (sharedContactStore_onceToken != -1)
    dispatch_once(&sharedContactStore_onceToken, &__block_literal_global_57);
  return (id)sharedContactStore_gSharedContactStore;
}

void __34__TUCallCenter_sharedContactStore__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedContactStore_gSharedContactStore;
  sharedContactStore_gSharedContactStore = v0;

}

- (TUCallCenter)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TUCallCenter.m"), 268, CFSTR("%s is not available. Use a designated initializer instead."), "-[TUCallCenter init]");

  return 0;
}

- (TUCallCenter)initWithQueue:(id)a3 wantsCallNotifications:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  TUFeatureFlags *v7;
  TUCallCenter *v8;

  v4 = a4;
  v6 = a3;
  v7 = objc_alloc_init(TUFeatureFlags);
  v8 = -[TUCallCenter initWithQueue:wantsCallNotifications:featureFlags:](self, "initWithQueue:wantsCallNotifications:featureFlags:", v6, v4, v7);

  return v8;
}

- (TUCallCenter)initWithQueue:(id)a3 wantsCallNotifications:(BOOL)a4 featureFlags:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  TUCallCenter *v10;
  NSObject *v11;
  OS_dispatch_queue *v12;
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v14;
  id v15;
  TUDelegateController *v16;
  TUCallCenterDelegate *delegateController;
  TUCallServicesInterface *v18;
  TUCallServicesInterface *callServicesInterface;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  FBSDisplayLayoutMonitor *monitor;
  uint64_t v25;
  void *v26;
  id launchAppForJoinRequestBlock;
  void *v28;
  id isOnenessActiveBlock;
  NSObject *v30;
  _QWORD v32[4];
  id v33;
  _QWORD aBlock[4];
  id v35;
  id location;
  objc_super v37;
  uint8_t buf[4];
  TUCallCenter *v39;
  uint64_t v40;

  v6 = a4;
  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v37.receiver = self;
  v37.super_class = (Class)TUCallCenter;
  v10 = -[TUCallCenter init](&v37, sel_init);
  if (v10)
  {
    TUDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v10;
      _os_log_impl(&dword_19A50D000, v11, OS_LOG_TYPE_DEFAULT, "Initializing TUCallCenter %@", buf, 0xCu);
    }

    v10->_accessorLock._os_unfair_lock_opaque = 0;
    if (v8)
    {
      v12 = (OS_dispatch_queue *)v8;
      queue = v10->_queue;
      v10->_queue = v12;
    }
    else
    {
      v14 = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
      v15 = MEMORY[0x1E0C80D38];
      queue = v10->_queue;
      v10->_queue = v14;
    }

    objc_storeStrong((id *)&v10->_featureFlags, a5);
    v16 = objc_alloc_init(TUDelegateController);
    delegateController = v10->_delegateController;
    v10->_delegateController = (TUCallCenterDelegate *)v16;

    +[TUCallCapabilities initializeCachedValues](TUCallCapabilities, "initializeCachedValues");
    v18 = -[TUCallServicesInterface initWithQueue:callCenter:wantsCallNotifications:]([TUCallServicesInterface alloc], "initWithQueue:callCenter:wantsCallNotifications:", v10->_queue, v10, v6);
    callServicesInterface = v10->_callServicesInterface;
    v10->_callServicesInterface = v18;

    objc_initWeak(&location, v10);
    v20 = (void *)CUTWeakLinkClass();
    v21 = (void *)CUTWeakLinkClass();
    objc_msgSend(v20, "configurationForContinuityDisplay");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setNeedsUserInteractivePriority:", 1);
    objc_msgSend(v22, "setTransitionHandler:", &__block_literal_global_106);
    objc_msgSend(v21, "monitorWithConfiguration:", v22);
    v23 = objc_claimAutoreleasedReturnValue();
    monitor = v10->_monitor;
    v10->_monitor = (FBSDisplayLayoutMonitor *)v23;

    v25 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __66__TUCallCenter_initWithQueue_wantsCallNotifications_featureFlags___block_invoke_107;
    aBlock[3] = &unk_1E38A4550;
    objc_copyWeak(&v35, &location);
    v26 = _Block_copy(aBlock);
    launchAppForJoinRequestBlock = v10->_launchAppForJoinRequestBlock;
    v10->_launchAppForJoinRequestBlock = v26;

    v32[0] = v25;
    v32[1] = 3221225472;
    v32[2] = __66__TUCallCenter_initWithQueue_wantsCallNotifications_featureFlags___block_invoke_110;
    v32[3] = &unk_1E38A4578;
    objc_copyWeak(&v33, &location);
    v28 = _Block_copy(v32);
    isOnenessActiveBlock = v10->_isOnenessActiveBlock;
    v10->_isOnenessActiveBlock = v28;

    TUDefaultLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v10;
      _os_log_impl(&dword_19A50D000, v30, OS_LOG_TYPE_DEFAULT, "Initialized TUCallCenter %@", buf, 0xCu);
    }

    objc_destroyWeak(&v33);
    objc_destroyWeak(&v35);

    objc_destroyWeak(&location);
  }

  return v10;
}

void __66__TUCallCenter_initWithQueue_wantsCallNotifications_featureFlags___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__TUCallCenter_initWithQueue_wantsCallNotifications_featureFlags___block_invoke_2;
  v5[3] = &unk_1E38A1360;
  v6 = v3;
  v4 = v3;
  TUDispatchMainIfNecessary(v5);

}

void __66__TUCallCenter_initWithQueue_wantsCallNotifications_featureFlags___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Layout monitor changed: layout: %@", (uint8_t *)&v4, 0xCu);
  }

}

BOOL __66__TUCallCenter_initWithQueue_wantsCallNotifications_featureFlags___block_invoke_107(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  void *v5;
  NSObject *WeakRetained;
  void *v8;
  int v9;
  id v10;
  uint8_t v11[16];

  v3 = a2;
  v4 = +[TUCallCenter supportsJoiningConversationWithRequest:](TUCallCenter, "supportsJoiningConversationWithRequest:", v3);
  if (v4)
  {
    objc_msgSend(v3, "activity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {

LABEL_8:
      TUOpenUserActivityForConversationRequest(v3);
      goto LABEL_9;
    }
    if ((objc_msgSend(v3, "hasAnySiriDisplayNames") & 1) != 0)
      goto LABEL_8;
    objc_msgSend(v3, "provider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isDefaultProvider");

    if (v9)
    {
      objc_msgSend(v3, "URL");
      WeakRetained = objc_claimAutoreleasedReturnValue();
      TUOpenURL(WeakRetained);
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      v10 = (id)-[NSObject joinConversationWithConversationRequest:](WeakRetained, "joinConversationWithConversationRequest:", v3);
    }
  }
  else
  {
    TUDefaultLog();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_19A50D000, WeakRetained, OS_LOG_TYPE_DEFAULT, "[WARN] Device does not support multiway", v11, 2u);
    }
  }

LABEL_9:
  return v4;
}

BOOL __66__TUCallCenter_initWithQueue_wantsCallNotifications_featureFlags___block_invoke_110(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "monitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0;
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%@\n"), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallCenter callServicesInterface](self, "callServicesInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "debugDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Call services interface: %@\n"), v5);

  -[TUCallCenter audioDeviceController](self, "audioDeviceController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "debugDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Audio device controller: %@\n"), v7);

  -[TUCallCenter providerManager](self, "providerManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "debugDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Provider manager: %@\n"), v9);

  return (NSString *)v3;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  objc_super v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  TUCallCenter *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = self;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "for %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  -[FBSDisplayLayoutMonitor invalidate](self->_monitor, "invalidate");
  -[TUCallCenter callServicesInterface](self, "callServicesInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __23__TUCallCenter_dealloc__block_invoke;
  v8[3] = &unk_1E38A1360;
  v9 = v5;
  v6 = v5;
  objc_msgSend(v6, "performBlockOnQueue:", v8);

  v7.receiver = self;
  v7.super_class = (Class)TUCallCenter;
  -[TUCallCenter dealloc](&v7, sel_dealloc);
}

uint64_t __23__TUCallCenter_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "tearDownXPCConnection");
}

- (void)fetchCurrentCalls
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "Fetching current calls", v5, 2u);
  }

  -[TUCallCenter callServicesInterface](self, "callServicesInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchCurrentCalls");

}

- (id)fetchCurrentCallUpdates
{
  void *v2;
  void *v3;

  -[TUCallCenter callServicesInterface](self, "callServicesInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchCurrentCallUpdates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)screenWithRequest:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TUCallCenter callServicesInterface](self, "callServicesInterface");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "screenWithRequest:", v4);

}

- (void)saveCustomGreeting:(id)a3 forAccountUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  TUSandboxExtendedURL *v9;

  v6 = a4;
  v7 = a3;
  v9 = -[TUSandboxExtendedURL initWithURL:withExtensionType:]([TUSandboxExtendedURL alloc], "initWithURL:withExtensionType:", v7, 0);

  -[TUCallCenter callServicesInterface](self, "callServicesInterface");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "saveCustomGreeting:forAccountUUID:", v9, v6);

}

- (id)customGreetingForAccountUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TUCallCenter callServicesInterface](self, "callServicesInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "customGreetingForAccountUUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)deleteCustomGreetingForAccountUUID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TUCallCenter callServicesInterface](self, "callServicesInterface");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteCustomGreetingForAccountUUID:", v4);

}

- (id)defaultGreeting
{
  void *v2;
  void *v3;

  -[TUCallCenter callServicesInterface](self, "callServicesInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultGreeting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)callServicesClientCapabilities
{
  void *v2;
  void *v3;

  -[TUCallCenter callServicesInterface](self, "callServicesInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callServicesClientCapabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (TUAudioDeviceController)audioDeviceController
{
  TUAudioDeviceController *audioDeviceController;
  TUAudioDeviceController *v4;
  void *v5;
  void *v6;
  TUAudioDeviceController *v7;
  TUAudioDeviceController *v8;

  audioDeviceController = self->_audioDeviceController;
  if (!audioDeviceController)
  {
    v4 = [TUAudioDeviceController alloc];
    -[TUCallCenter callServicesInterface](self, "callServicesInterface");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUCallCenter queue](self, "queue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[TUAudioDeviceController initWithActionsDelegate:serialQueue:](v4, "initWithActionsDelegate:serialQueue:", v5, v6);
    v8 = self->_audioDeviceController;
    self->_audioDeviceController = v7;

    audioDeviceController = self->_audioDeviceController;
  }
  return audioDeviceController;
}

- (TURouteController)routeController
{
  void *v3;
  void *v4;
  TURouteController *v5;
  void *v6;
  void *v7;
  TURouteController *v8;
  void *v9;
  void *v10;
  void *v11;

  -[TUCallCenter callServicesInterface](self, "callServicesInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localRouteController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = [TURouteController alloc];
    -[TUCallCenter callServicesInterface](self, "callServicesInterface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUCallCenter queue](self, "queue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[TURouteController initWithActionsDelegate:serialQueue:](v5, "initWithActionsDelegate:serialQueue:", v6, v7);
    -[TUCallCenter callServicesInterface](self, "callServicesInterface");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLocalRouteController:", v8);

  }
  -[TUCallCenter callServicesInterface](self, "callServicesInterface");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localRouteController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (TURouteController *)v11;
}

- (TURouteController)pairedHostDeviceRouteController
{
  void *v3;
  void *v4;
  TURouteController *v5;
  void *v6;
  void *v7;
  TURouteController *v8;
  void *v9;
  void *v10;
  void *v11;

  -[TUCallCenter callServicesInterface](self, "callServicesInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pairedHostDeviceRouteController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = [TURouteController alloc];
    -[TUCallCenter callServicesInterface](self, "callServicesInterface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUCallCenter queue](self, "queue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[TURouteController initWithActionsDelegate:serialQueue:](v5, "initWithActionsDelegate:serialQueue:", v6, v7);
    -[TUCallCenter callServicesInterface](self, "callServicesInterface");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPairedHostDeviceRouteController:", v8);

  }
  -[TUCallCenter callServicesInterface](self, "callServicesInterface");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pairedHostDeviceRouteController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (TURouteController *)v11;
}

- (TUCallFilterController)callFilterController
{
  TUCallFilterController *callFilterController;
  TUCallFilterController *v4;
  void *v5;
  void *v6;
  TUCallFilterController *v7;
  TUCallFilterController *v8;

  callFilterController = self->_callFilterController;
  if (!callFilterController)
  {
    v4 = [TUCallFilterController alloc];
    -[TUCallCenter callServicesInterface](self, "callServicesInterface");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUCallCenter queue](self, "queue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[TUCallFilterController initWithActionsDelegate:serialQueue:](v4, "initWithActionsDelegate:serialQueue:", v5, v6);
    v8 = self->_callFilterController;
    self->_callFilterController = v7;

    callFilterController = self->_callFilterController;
  }
  return callFilterController;
}

- (TUNeighborhoodActivityConduit)neighborhoodActivityConduit
{
  TUNeighborhoodActivityConduit *neighborhoodActivityConduit;
  TUNeighborhoodActivityConduit *v4;
  void *v5;
  TUNeighborhoodActivityConduit *v6;
  TUNeighborhoodActivityConduit *v7;

  neighborhoodActivityConduit = self->_neighborhoodActivityConduit;
  if (!neighborhoodActivityConduit)
  {
    v4 = [TUNeighborhoodActivityConduit alloc];
    -[TUCallCenter conversationManager](self, "conversationManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[TUNeighborhoodActivityConduit initWithConversationManager:](v4, "initWithConversationManager:", v5);
    v7 = self->_neighborhoodActivityConduit;
    self->_neighborhoodActivityConduit = v6;

    neighborhoodActivityConduit = self->_neighborhoodActivityConduit;
  }
  return neighborhoodActivityConduit;
}

- (TUCallProviderManager)providerManager
{
  TUCallProviderManager *providerManager;
  TUCallProviderManager *v4;
  TUCallProviderManager *v5;

  providerManager = self->_providerManager;
  if (!providerManager)
  {
    v4 = objc_alloc_init(TUCallProviderManager);
    v5 = self->_providerManager;
    self->_providerManager = v4;

    providerManager = self->_providerManager;
  }
  return providerManager;
}

- (TUConversationManager)conversationManager
{
  os_unfair_lock_s *p_accessorLock;
  TUConversationManager *conversationManager;
  TUConversationManager *v5;
  TUConversationManager *v6;
  TUConversationManager *v7;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  conversationManager = self->_conversationManager;
  if (!conversationManager)
  {
    v5 = objc_alloc_init(TUConversationManager);
    v6 = self->_conversationManager;
    self->_conversationManager = v5;

    conversationManager = self->_conversationManager;
  }
  v7 = conversationManager;
  os_unfair_lock_unlock(p_accessorLock);
  return v7;
}

- (id)lastDaemonConnectTime
{
  void *v2;
  void *v3;

  -[TUCallCenter callServicesInterface](self, "callServicesInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastDaemonConnectTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)shouldPullRelayingCalls
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[TUCallCenter currentAudioAndVideoCalls](self, "currentAudioAndVideoCalls", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "isHostedOnCurrentDevice")
          && (objc_msgSend(v8, "isEndpointOnCurrentDevice") & 1) == 0)
        {
          v5 |= (int)objc_msgSend(v8, "status") < 5;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5 & 1;
}

- (BOOL)isRelayCallingSupportedForProvider:(id)a3 isVideo:(BOOL)a4
{
  _BOOL4 v4;
  __CFString *v5;
  _BOOL4 v6;
  NSObject *v7;
  _BOOL4 v8;
  const __CFString *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  _BOOL4 v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  NSObject *v18;
  const __CFString *v19;
  const __CFString *v20;
  int v22;
  const __CFString *v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  const __CFString *v29;
  uint64_t v30;

  v4 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  v5 = (__CFString *)a3;
  if (-[__CFString isTelephonyProvider](v5, "isTelephonyProvider"))
  {
    v6 = +[TUCallCapabilities supportsTelephonyRelayCalling](TUCallCapabilities, "supportsTelephonyRelayCalling");
    TUDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
LABEL_26:

      goto LABEL_27;
    }
    v8 = +[TUCallCapabilities supportsTelephonyRelayCalling](TUCallCapabilities, "supportsTelephonyRelayCalling");
    v9 = CFSTR("NO");
    if (v8)
      v9 = CFSTR("YES");
    v22 = 138412290;
    v23 = v9;
    v10 = "isRelayCallingSupportedForProvider: TUCallCapabilities.supportsTelephonyRelayCalling: %@";
    v11 = v7;
    v12 = 12;
LABEL_25:
    _os_log_impl(&dword_19A50D000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v22, v12);
    goto LABEL_26;
  }
  if ((-[__CFString isFaceTimeProvider](v5, "isFaceTimeProvider") & 1) != 0
    || -[__CFString isTinCanProvider](v5, "isTinCanProvider"))
  {
    if (v4)
      v13 = +[TUCallCapabilities supportsFaceTimeVideoRelayCalling](TUCallCapabilities, "supportsFaceTimeVideoRelayCalling");
    else
      v13 = +[TUCallCapabilities supportsFaceTimeAudioRelayCalling](TUCallCapabilities, "supportsFaceTimeAudioRelayCalling");
    v6 = v13;
    TUDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_26;
    if (-[__CFString isFaceTimeProvider](v5, "isFaceTimeProvider"))
      v14 = CFSTR("YES");
    else
      v14 = CFSTR("NO");
    if (v4)
      v15 = CFSTR("YES");
    else
      v15 = CFSTR("NO");
    if (+[TUCallCapabilities supportsFaceTimeVideoRelayCalling](TUCallCapabilities, "supportsFaceTimeVideoRelayCalling"))
    {
      v16 = CFSTR("YES");
    }
    else
    {
      v16 = CFSTR("NO");
    }
    v22 = 138413058;
    if (+[TUCallCapabilities supportsFaceTimeAudioRelayCalling](TUCallCapabilities, "supportsFaceTimeAudioRelayCalling"))
    {
      v17 = CFSTR("YES");
    }
    else
    {
      v17 = CFSTR("NO");
    }
    v23 = v14;
    v24 = 2112;
    v25 = v15;
    v26 = 2112;
    v27 = v16;
    v28 = 2112;
    v29 = v17;
    v10 = "isFaceTimeProvider: %@, isVideo: %@, supportsFaceTimeVideoRelayCalling: %@, supportsFaceTimeAudioRelayCalling: %@";
    v11 = v7;
    v12 = 42;
    goto LABEL_25;
  }
  v6 = 0;
LABEL_27:
  TUDefaultLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = CFSTR("NO");
    if (v6)
      v20 = CFSTR("YES");
    else
      v20 = CFSTR("NO");
    v22 = 138412802;
    v23 = v20;
    v24 = 2112;
    v25 = v5;
    if (v4)
      v19 = CFSTR("YES");
    v26 = 2112;
    v27 = v19;
    _os_log_impl(&dword_19A50D000, v18, OS_LOG_TYPE_DEFAULT, "isRelayCallingSupported: %@, provider: %@, isVideo: %@", (uint8_t *)&v22, 0x20u);
  }

  return v6;
}

- (BOOL)isDirectCallingCurrentlyAvailableForProvider:(id)a3 isVideo:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  char SuperboxProvider;
  BOOL v7;

  v4 = a4;
  v5 = a3;
  if (objc_msgSend(v5, "isTelephonyProvider"))
  {
    SuperboxProvider = +[TUCallCapabilities isDirectTelephonyCallingCurrentlyAvailable](TUCallCapabilities, "isDirectTelephonyCallingCurrentlyAvailable");
  }
  else if (objc_msgSend(v5, "isFaceTimeProvider"))
  {
    if (v4)
      SuperboxProvider = +[TUCallCapabilities isDirectFaceTimeVideoCallingCurrentlyAvailable](TUCallCapabilities, "isDirectFaceTimeVideoCallingCurrentlyAvailable");
    else
      SuperboxProvider = +[TUCallCapabilities isDirectFaceTimeAudioCallingCurrentlyAvailable](TUCallCapabilities, "isDirectFaceTimeAudioCallingCurrentlyAvailable");
  }
  else
  {
    if (!objc_msgSend(v5, "isSuperboxProvider"))
    {
      v7 = 1;
      goto LABEL_10;
    }
    SuperboxProvider = TUShouldCreateSuperboxProvider();
  }
  v7 = SuperboxProvider;
LABEL_10:

  return v7;
}

- (BOOL)shouldPreferRelayOverDirectSecondaryCallingForProvider:(id)a3 isVideo:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  LOBYTE(v4) = -[TUCallCenter _shouldPreferRelayOverDirectSecondaryCallingForRelayingCallingAvailability:isRelayCallingSupported:isEmergencyCallbackPossible:provider:](self, "_shouldPreferRelayOverDirectSecondaryCallingForRelayingCallingAvailability:isRelayCallingSupported:isEmergencyCallbackPossible:provider:", +[TUCallCapabilities relayCallingAvailability](TUCallCapabilities, "relayCallingAvailability"), -[TUCallCenter isRelayCallingSupportedForProvider:isVideo:](self, "isRelayCallingSupportedForProvider:isVideo:", v6, v4), +[TUCallCapabilities isEmergencyCallbackPossible](TUCallCapabilities, "isEmergencyCallbackPossible"), v6);

  return v4;
}

- (BOOL)_shouldPreferRelayOverDirectSecondaryCallingForRelayingCallingAvailability:(int)a3 isRelayCallingSupported:(BOOL)a4 isEmergencyCallbackPossible:(BOOL)a5 provider:(id)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v9;
  NSObject *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  char v15;
  char v16;
  int v18;
  const __CFString *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  const __CFString *v27;
  uint64_t v28;

  v6 = a5;
  v7 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v9 = -[TUCallCenter anyCallPassesTest:](self, "anyCallPassesTest:", &__block_literal_global_137_0, a4, a5, a6);
  TUDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = CFSTR("NO");
    if (v6)
      v12 = CFSTR("YES");
    else
      v12 = CFSTR("NO");
    v18 = 138413314;
    v19 = v12;
    if (v7)
      v13 = CFSTR("YES");
    else
      v13 = CFSTR("NO");
    v20 = 2112;
    v21 = v13;
    if (v9)
      v14 = CFSTR("YES");
    else
      v14 = CFSTR("NO");
    v22 = 1024;
    v23 = a3;
    if (a3 == 2)
      v11 = CFSTR("YES");
    v24 = 2112;
    v25 = v14;
    v26 = 2112;
    v27 = v11;
    _os_log_impl(&dword_19A50D000, v10, OS_LOG_TYPE_DEFAULT, "isEmergencyCallbackPossible: %@, isRelayCallingSupported: %@, relayCallingAvailability: %d, isAnyCallHostedElsewhere: %@, preferRelay: %@", (uint8_t *)&v18, 0x30u);
  }

  v15 = a3 == 2 || v9;
  v16 = v15 & ~v6;
  if (v7)
    return v16;
  else
    return 0;
}

uint64_t __152__TUCallCenter__shouldPreferRelayOverDirectSecondaryCallingForRelayingCallingAvailability_isRelayCallingSupported_isEmergencyCallbackPossible_provider___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const __CFString *v5;
  int v6;
  int v8;
  const __CFString *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(v2, "isHostedOnCurrentDevice");
    v5 = CFSTR("NO");
    if (v4)
      v5 = CFSTR("YES");
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v2;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "call.isHostedOnCurrentDevice: %@, call: %@", (uint8_t *)&v8, 0x16u);
  }

  v6 = objc_msgSend(v2, "isHostedOnCurrentDevice");
  return v6 ^ 1u;
}

- (id)_allCalls
{
  void *v2;
  void *v3;

  -[TUCallCenter callContainer](self, "callContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_allCalls");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSArray)currentCalls
{
  void *v2;
  void *v3;

  -[TUCallCenter callContainer](self, "callContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentCalls");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)currentVideoCalls
{
  void *v2;
  void *v3;

  -[TUCallCenter callContainer](self, "callContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentVideoCalls");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)currentAudioAndVideoCalls
{
  void *v2;
  void *v3;

  -[TUCallCenter callContainer](self, "callContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentAudioAndVideoCalls");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)incomingCalls
{
  void *v2;
  void *v3;

  -[TUCallCenter callContainer](self, "callContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "incomingCalls");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)displayedAudioAndVideoCalls
{
  void *v2;
  void *v3;

  -[TUCallCenter callContainer](self, "callContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayedAudioAndVideoCalls");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)conferenceParticipantCalls
{
  void *v2;
  void *v3;

  -[TUCallCenter callContainer](self, "callContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "conferenceParticipantCalls");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)callsHostedElsewhere
{
  void *v2;
  void *v3;

  -[TUCallCenter callContainer](self, "callContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callsHostedElsewhere");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)callsWithAnEndpointElsewhere
{
  void *v2;
  void *v3;

  -[TUCallCenter callContainer](self, "callContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callsWithAnEndpointElsewhere");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)callsHostedOrAnEndpointElsewhere
{
  void *v2;
  void *v3;

  -[TUCallCenter callContainer](self, "callContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callsHostedOrAnEndpointElsewhere");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)callsOnDefaultPairedDevice
{
  void *v2;
  void *v3;

  -[TUCallCenter callContainer](self, "callContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callsOnDefaultPairedDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)callsPassingTest:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TUCallCenter callContainer](self, "callContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "callsPassingTest:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)callsWithStatus:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = *(_QWORD *)&a3;
  -[TUCallCenter callContainer](self, "callContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "callsWithStatus:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)audioAndVideoCallsWithStatus:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = *(_QWORD *)&a3;
  -[TUCallCenter callContainer](self, "callContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioAndVideoCallsWithStatus:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)callsWithGroupUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TUCallCenter callContainer](self, "callContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "callsWithGroupUUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (TUCall)incomingCall
{
  void *v2;
  void *v3;

  -[TUCallCenter callContainer](self, "callContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "incomingCall");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TUCall *)v3;
}

- (TUCall)incomingVideoCall
{
  void *v2;
  void *v3;

  -[TUCallCenter callContainer](self, "callContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "incomingVideoCall");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TUCall *)v3;
}

- (TUCall)currentVideoCall
{
  void *v2;
  void *v3;

  -[TUCallCenter callContainer](self, "callContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentVideoCall");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TUCall *)v3;
}

- (id)displayedCall
{
  void *v2;
  void *v3;

  -[TUCallCenter callContainer](self, "callContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayedCall");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)conferenceCall
{
  void *v2;
  void *v3;

  -[TUCallCenter callContainer](self, "callContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "conferenceCall");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)frontmostCall
{
  void *v2;
  void *v3;

  -[TUCallCenter callContainer](self, "callContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frontmostCall");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)frontmostAudioOrVideoCall
{
  void *v2;
  void *v3;

  -[TUCallCenter callContainer](self, "callContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frontmostAudioOrVideoCall");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (TUCall)screeningCall
{
  void *v2;
  void *v3;

  -[TUCallCenter callContainer](self, "callContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "screeningCall");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TUCall *)v3;
}

- (id)callPassingTest:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TUCallCenter callContainer](self, "callContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "callPassingTest:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)callPassingTest:(id)a3 sortedUsingComparator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[TUCallCenter callContainer](self, "callContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "callPassingTest:sortedUsingComparator:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)callWithStatus:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = *(_QWORD *)&a3;
  -[TUCallCenter callContainer](self, "callContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "callWithStatus:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)videoCallWithStatus:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = *(_QWORD *)&a3;
  -[TUCallCenter callContainer](self, "callContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "videoCallWithStatus:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)audioOrVideoCallWithStatus:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = *(_QWORD *)&a3;
  -[TUCallCenter callContainer](self, "callContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioOrVideoCallWithStatus:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)callWithUniqueProxyIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TUCallCenter callContainer](self, "callContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "callWithUniqueProxyIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)callWithCallUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TUCallCenter callContainer](self, "callContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "callWithCallUUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)displayedCallFromCalls:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TUCallCenter callContainer](self, "callContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayedCallFromCalls:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)currentVideoCallCount
{
  void *v2;
  unint64_t v3;

  -[TUCallCenter callContainer](self, "callContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "currentVideoCallCount");

  return v3;
}

- (unint64_t)currentAudioAndVideoCallCount
{
  void *v2;
  unint64_t v3;

  -[TUCallCenter callContainer](self, "callContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "currentAudioAndVideoCallCount");

  return v3;
}

- (unint64_t)callCountOnDefaultPairedDevice
{
  void *v2;
  unint64_t v3;

  -[TUCallCenter callContainer](self, "callContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "callCountOnDefaultPairedDevice");

  return v3;
}

- (unint64_t)countOfCallsPassingTest:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[TUCallCenter callContainer](self, "callContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countOfCallsPassingTest:", v4);

  return v6;
}

- (BOOL)hasCurrentCalls
{
  void *v2;
  char v3;

  -[TUCallCenter callContainer](self, "callContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasCurrentCalls");

  return v3;
}

- (BOOL)hasCurrentAudioCalls
{
  void *v2;
  char v3;

  -[TUCallCenter callContainer](self, "callContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasCurrentAudioCalls");

  return v3;
}

- (BOOL)hasCurrentVideoCalls
{
  void *v2;
  char v3;

  -[TUCallCenter callContainer](self, "callContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasCurrentVideoCalls");

  return v3;
}

- (BOOL)anyCallIsHostedOnCurrentDevice
{
  void *v2;
  char v3;

  -[TUCallCenter callContainer](self, "callContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "anyCallIsHostedOnCurrentDevice");

  return v3;
}

- (BOOL)anyCallIsEndpointOnCurrentDevice
{
  void *v2;
  char v3;

  -[TUCallCenter callContainer](self, "callContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "anyCallIsEndpointOnCurrentDevice");

  return v3;
}

- (BOOL)existingCallsHaveMultipleProviders
{
  void *v2;
  char v3;

  -[TUCallCenter callContainer](self, "callContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "existingCallsHaveMultipleProviders");

  return v3;
}

- (BOOL)anyCallPassesTest:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[TUCallCenter callContainer](self, "callContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "anyCallPassesTest:", v4);

  return v6;
}

- (BOOL)allCallsPassTest:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[TUCallCenter callContainer](self, "callContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "allCallsPassTest:", v4);

  return v6;
}

- (BOOL)allCallsAreOfService:(int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  -[TUCallCenter callContainer](self, "callContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "allCallsAreOfService:", v3);

  return v3;
}

- (NSArray)currentCallGroups
{
  void *v2;
  void *v3;

  -[TUCallCenter callContainer](self, "callContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentCallGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)currentAudioAndVideoCallGroups
{
  void *v2;
  void *v3;

  -[TUCallCenter callContainer](self, "callContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentAudioAndVideoCallGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)callGroupsOnDefaultPairedDevice
{
  void *v2;
  void *v3;

  -[TUCallCenter callContainer](self, "callContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callGroupsOnDefaultPairedDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)_existingCallsAllowDialRequest:(id)a3 allowVoiceWithData:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  _BOOL4 v13;
  _BOOL4 v14;
  _BOOL4 v15;
  _BOOL4 v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  int v22;
  int v23;
  void *v24;
  int v25;
  _BOOL4 v26;
  NSObject *v27;
  uint64_t v29;
  int v30;
  _BOOL4 v31;
  _QWORD v32[4];
  id v33;
  uint8_t buf[4];
  int v35;
  __int16 v36;
  int v37;
  __int16 v38;
  _BOOL4 v39;
  __int16 v40;
  _BOOL4 v41;
  __int16 v42;
  int v43;
  __int16 v44;
  _BOOL4 v45;
  uint64_t v46;

  v4 = a4;
  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[TUCallCenter anyCallPassesTest:](self, "anyCallPassesTest:", &__block_literal_global_138);
  objc_msgSend(v6, "provider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isTelephonyProvider"))
  {
    objc_msgSend(v6, "handle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v29) = objc_msgSend(v10, "destinationIdIsCallControlCode") ^ 1;

  }
  else
  {
    LODWORD(v29) = 1;
  }

  if ((objc_msgSend(v6, "isVideo") & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    -[TUCallCenter currentCallGroups](self, "currentCallGroups");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (unint64_t)objc_msgSend(v12, "count") > 1;

  }
  v13 = -[TUCallCenter anyCallPassesTest:](self, "anyCallPassesTest:", &__block_literal_global_139, v29);
  v31 = v11;
  v14 = v13 && objc_msgSend(v6, "dialType") == 2;
  v15 = -[TUCallCenter anyCallPassesTest:](self, "anyCallPassesTest:", &__block_literal_global_140);
  v16 = -[TUCallCenter anyCallPassesTest:](self, "anyCallPassesTest:", &__block_literal_global_141);
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __66__TUCallCenter__existingCallsAllowDialRequest_allowVoiceWithData___block_invoke_5;
  v32[3] = &unk_1E38A2428;
  v17 = v6;
  v33 = v17;
  v18 = -[TUCallCenter anyCallPassesTest:](self, "anyCallPassesTest:", v32);
  TUDefaultLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v17, "provider");
    v20 = v7;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isTelephonyProvider");
    *(_DWORD *)buf = 67110144;
    v35 = v18;
    v36 = 1024;
    v37 = v4;
    v38 = 1024;
    v39 = v16;
    v40 = 1024;
    v41 = v15;
    v42 = 1024;
    v43 = v22;
    _os_log_impl(&dword_19A50D000, v19, OS_LOG_TYPE_DEFAULT, "isVideoUpgrade: %d, allowVoiceWithData: %d, nonTelephonyCallExists: %d, telephonyBasebandCallExists: %d, dialRequest.provider.isTelephonyProvider: %d", buf, 0x20u);

    v7 = v20;
  }

  if (((v18 | v4) & 1) == 0)
  {
    if (v16)
    {
      objc_msgSend(v17, "provider");
      v18 = objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend((id)v18, "isTelephonyProvider");
      if ((v23 & 1) != 0 || !v15)
      {
LABEL_19:

        goto LABEL_21;
      }
LABEL_18:
      objc_msgSend(v17, "provider");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v24, "isTelephonyProvider") ^ 1;

      if (!v16)
        goto LABEL_21;
      goto LABEL_19;
    }
    if (v15)
      goto LABEL_18;
  }
  v23 = 0;
LABEL_21:
  v25 = objc_msgSend(v17, "isSOS");
  v26 = -[TUCallCenter anyCallPassesTest:](self, "anyCallPassesTest:", &__block_literal_global_143);
  TUDefaultLog();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110400;
    v35 = v25;
    v36 = 1024;
    v37 = v7 & v30;
    v38 = 1024;
    v39 = v31;
    v40 = 1024;
    v41 = v14;
    v42 = 1024;
    v43 = v23;
    v44 = 1024;
    v45 = v26;
    _os_log_impl(&dword_19A50D000, v27, OS_LOG_TYPE_DEFAULT, "isOutgoingCallSOS: %d outgoingCallCreatesMultipleSendingCalls: %d outgoingCallBreaksCallGroupLimit: %d outgoingCallCreatesMultipleVoicemailCalls: %d outgoingCallMixesVoiceWithData: %d emergencyCallExists: %d", buf, 0x26u);
  }

  if (((v25 | v7 & v30 | (v31 || v14)) & 1) == 0)
    LOBYTE(v25) = (v23 | v26) ^ 1;

  return v25;
}

uint64_t __66__TUCallCenter__existingCallsAllowDialRequest_allowVoiceWithData___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "status") == 3)
  {
    if ((objc_msgSend(v2, "isHostedOnCurrentDevice") & 1) != 0)
      v3 = 1;
    else
      v3 = objc_msgSend(v2, "isEndpointOnCurrentDevice");
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t __66__TUCallCenter__existingCallsAllowDialRequest_allowVoiceWithData___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "isVoicemail"))
  {
    if ((objc_msgSend(v2, "isHostedOnCurrentDevice") & 1) != 0)
      v3 = 1;
    else
      v3 = objc_msgSend(v2, "isEndpointOnCurrentDevice");
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

BOOL __66__TUCallCenter__existingCallsAllowDialRequest_allowVoiceWithData___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;

  v2 = a2;
  objc_msgSend(v2, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isTelephonyProvider")
    && objc_msgSend(v2, "isUsingBaseband")
    && objc_msgSend(v2, "status") != 5;

  return v4;
}

BOOL __66__TUCallCenter__existingCallsAllowDialRequest_allowVoiceWithData___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;

  v2 = a2;
  objc_msgSend(v2, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_msgSend(v3, "isTelephonyProvider") & 1) == 0 && objc_msgSend(v2, "status") != 5;

  return v4;
}

uint64_t __66__TUCallCenter__existingCallsAllowDialRequest_allowVoiceWithData___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isDialRequestVideoUpgrade:", *(_QWORD *)(a1 + 32));
}

uint64_t __66__TUCallCenter__existingCallsAllowDialRequest_allowVoiceWithData___block_invoke_142(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEmergency");
}

- (BOOL)_isCallingAvailableOnSecondaryDeviceWithRelayCallingAvailability:(int)a3 isProviderAvailable:(BOOL)a4 isRelayAllowed:(BOOL)a5 isEmergency:(BOOL)a6 supportsBasebandCalling:(BOOL)a7 shouldUseRelay:(BOOL *)a8 isTelephonyProvider:(BOOL)a9
{
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  NSObject *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  int v21;
  const __CFString *v22;
  void *v23;
  uint64_t v24;
  _BOOL4 v25;
  int v26;
  _BOOL4 v27;
  NSObject *v28;
  const __CFString *v30;
  const __CFString *v31;
  _BOOL4 v32;
  BOOL *v33;
  _BOOL4 v34;
  uint8_t buf[4];
  int v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  const __CFString *v42;
  __int16 v43;
  const __CFString *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  const __CFString *v48;
  uint64_t v49;

  v34 = a7;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v49 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v32 = v12;
    v33 = a8;
    if (v12)
      v16 = CFSTR("YES");
    else
      v16 = CFSTR("NO");
    if (v11)
      v17 = CFSTR("YES");
    else
      v17 = CFSTR("NO");
    if (v10)
      v18 = CFSTR("YES");
    else
      v18 = CFSTR("NO");
    if (v34)
      v19 = CFSTR("YES");
    else
      v19 = CFSTR("NO");
    v30 = v19;
    v31 = v18;
    -[TUCallCenter callsHostedElsewhere](self, "callsHostedElsewhere");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");
    *(_DWORD *)buf = 67110658;
    if (a9)
      v22 = CFSTR("YES");
    else
      v22 = CFSTR("NO");
    v36 = a3;
    v37 = 2112;
    v38 = v16;
    a8 = v33;
    v39 = 2112;
    v40 = v17;
    v12 = v32;
    v41 = 2112;
    v42 = v31;
    v43 = 2112;
    v44 = v30;
    v45 = 1024;
    v46 = v21;
    v47 = 2112;
    v48 = v22;
    _os_log_impl(&dword_19A50D000, v15, OS_LOG_TYPE_DEFAULT, "relayCallingAvailability: %d isProviderAvailable: %@ isRelayAllowed: %@ isEmergency: %@ supportsBasebandCalling: %@, callsHostedElsewhere count: %d, isTelephonyProvider: %@", buf, 0x40u);

  }
  -[TUCallCenter callsHostedElsewhere](self, "callsHostedElsewhere");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "count");

  v25 = a3 == 2 && v11;
  v26 = 1;
  if (v25 || v10)
  {
LABEL_29:
    if (!a8)
      goto LABEL_31;
    goto LABEL_30;
  }
  if (v24)
    v27 = v11;
  else
    v27 = 0;
  if (v12 && !v27)
  {
    v25 = 0;
    goto LABEL_29;
  }
  v25 = a3 == 1 && v11;
  v26 = v25 || v34;
  if (!a8)
    goto LABEL_31;
LABEL_30:
  *a8 = v25;
LABEL_31:
  TUDefaultLog();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    v36 = v26;
    v37 = 1024;
    LODWORD(v38) = v25;
    _os_log_impl(&dword_19A50D000, v28, OS_LOG_TYPE_DEFAULT, "performDial: %d useRelay: %d", buf, 0xEu);
  }

  return v26;
}

- (BOOL)_shouldRelayJoinConversationRequest:(id)a3
{
  void *v4;
  void *v5;
  _BOOL8 v6;
  _BOOL8 v7;
  char v8;
  uint64_t v9;
  _BOOL8 v10;
  void *v11;
  uint64_t v13;
  char v14;

  -[TUCallCenter providerManager](self, "providerManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "faceTimeProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  v6 = -[TUCallCenter isDirectCallingCurrentlyAvailableForProvider:isVideo:](self, "isDirectCallingCurrentlyAvailableForProvider:isVideo:", v5, 1);
  v7 = -[TUCallCenter isRelayCallingSupportedForProvider:isVideo:](self, "isRelayCallingSupportedForProvider:isVideo:", v5, 1);
  v8 = 0;
  if (!+[TUCallCapabilities supportsPrimaryCalling](TUCallCapabilities, "supportsPrimaryCalling"))
  {
    v9 = +[TUCallCapabilities relayCallingAvailability](TUCallCapabilities, "relayCallingAvailability");
    v10 = +[TUCallCapabilities supportsBasebandCalling](TUCallCapabilities, "supportsBasebandCalling");
    LOBYTE(v13) = objc_msgSend(v5, "isTelephonyProvider");
    -[TUCallCenter _isCallingAvailableOnSecondaryDeviceWithRelayCallingAvailability:isProviderAvailable:isRelayAllowed:isEmergency:supportsBasebandCalling:shouldUseRelay:isTelephonyProvider:](self, "_isCallingAvailableOnSecondaryDeviceWithRelayCallingAvailability:isProviderAvailable:isRelayAllowed:isEmergency:supportsBasebandCalling:shouldUseRelay:isTelephonyProvider:", v9, v6, v7, 0, v10, &v14, v13);
    if (v14)
    {
      -[TUCallCenter featureFlags](self, "featureFlags");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v11, "gftOnWatch");

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (BOOL)_canDialWithRequest:(id)a3 shouldUseRelay:(BOOL *)a4
{
  id v5;
  _BOOL4 v6;
  _BOOL8 v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  char v13;
  int v14;
  void *v15;
  _BOOL4 v16;
  NSObject *v17;
  uint64_t v19;
  int v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  _BOOL4 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v21 = objc_msgSend(v5, "isValid");
  v6 = -[TUCallCenter _existingCallsAllowDialRequest:allowVoiceWithData:](self, "_existingCallsAllowDialRequest:allowVoiceWithData:", v5, objc_msgSend((id)objc_opt_class(), "isSimultaneousVoiceAndDataSupportedForDialRequest:", v5));
  v7 = -[TUCallCenter _isEmergencyDialRequest:](self, "_isEmergencyDialRequest:", v5);
  objc_msgSend(v5, "provider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[TUCallCenter isDirectCallingCurrentlyAvailableForProvider:isVideo:](self, "isDirectCallingCurrentlyAvailableForProvider:isVideo:", v8, objc_msgSend(v5, "isVideo"));

  objc_msgSend(v5, "provider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[TUCallCenter isRelayCallingSupportedForProvider:isVideo:](self, "isRelayCallingSupportedForProvider:isVideo:", v10, objc_msgSend(v5, "isVideo"));

  objc_msgSend(v5, "provider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isTelephonyProvider");

  if (v7)
  {
    LOBYTE(v14) = 1;
  }
  else
  {
    -[TUCallCenter callFilterController](self, "callFilterController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v15, "shouldRestrictDialRequest:performSynchronously:", v5, 0) ^ 1;

  }
  if (+[TUCallCapabilities supportsPrimaryCalling](TUCallCapabilities, "supportsPrimaryCalling"))
  {
    v16 = 1;
  }
  else
  {
    LOBYTE(v19) = v13;
    v16 = -[TUCallCenter _isCallingAvailableOnSecondaryDeviceWithRelayCallingAvailability:isProviderAvailable:isRelayAllowed:isEmergency:supportsBasebandCalling:shouldUseRelay:isTelephonyProvider:](self, "_isCallingAvailableOnSecondaryDeviceWithRelayCallingAvailability:isProviderAvailable:isRelayAllowed:isEmergency:supportsBasebandCalling:shouldUseRelay:isTelephonyProvider:", +[TUCallCapabilities relayCallingAvailability](TUCallCapabilities, "relayCallingAvailability"), v9, v11, v7, +[TUCallCapabilities supportsBasebandCalling](TUCallCapabilities, "supportsBasebandCalling"), a4, v19);
  }
  TUDefaultLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    v23 = v21;
    v24 = 1024;
    v25 = v6;
    v26 = 1024;
    v27 = v16;
    _os_log_impl(&dword_19A50D000, v17, OS_LOG_TYPE_DEFAULT, "isDialRequestValid: %d existingCallsAllowOutgoingCall: %d isCallingAvailable: %d", buf, 0x14u);
  }

  return v21 & v6 & v16 & v14;
}

- (BOOL)_isEmergencyDialRequest:(id)a3
{
  id v3;
  char v4;
  TUSenderIdentityClient *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  if (objc_msgSend(v3, "dialType") == 1)
  {
    v4 = 1;
  }
  else
  {
    v5 = objc_alloc_init(TUSenderIdentityClient);
    objc_msgSend(v3, "handle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localSenderIdentityUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[TUSenderIdentityClient isEmergencyNumberForDigits:senderIdentityUUID:](v5, "isEmergencyNumberForDigits:senderIdentityUUID:", v7, v8))
    {
      v4 = 1;
    }
    else
    {
      objc_msgSend(v3, "handle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "value");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "localSenderIdentityUUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = -[TUSenderIdentityClient isWhitelistedEmergencyNumberForDigits:senderIdentityUUID:](v5, "isWhitelistedEmergencyNumberForDigits:senderIdentityUUID:", v10, v11);

    }
  }

  return v4;
}

- (BOOL)canDialWithRequest:(id)a3
{
  return -[TUCallCenter _canDialWithRequest:shouldUseRelay:](self, "_canDialWithRequest:shouldUseRelay:", a3, 0);
}

- (id)dialWithRequest:(id)a3
{
  void *v3;
  NSObject *v4;

  -[TUCallCenter _dialWithRequest:completion:](self, "_dialWithRequest:completion:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    TUDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[TUCallCenter dialWithRequest:].cold.1();

  }
  return v3;
}

- (void)dialWithRequest:(id)a3 completion:(id)a4
{
  id v4;

  v4 = -[TUCallCenter _dialWithRequest:completion:](self, "_dialWithRequest:completion:", a3, a4);
}

- (id)_dialWithRequest:(id)a3 completion:(id)a4
{
  TUJoinConversationRequest *v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  void *v9;
  TUJoinConversationRequest *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v21;
  id v22;
  void *v23;
  TUConversationMember *v24;
  void *v25;
  TUConversationMember *v26;
  TUJoinConversationRequest *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  char v37;
  uint8_t buf[4];
  TUJoinConversationRequest *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = (TUJoinConversationRequest *)a3;
  v7 = (void (**)(id, _QWORD))a4;
  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v39 = v6;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "for dial request %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUJoinConversationRequest setDateDialed:](v6, "setDateDialed:", v9);

  TUDialAssistedDialRequest(v6);
  v10 = (TUJoinConversationRequest *)objc_claimAutoreleasedReturnValue();

  if (!-[TUJoinConversationRequest dialType](v10, "dialType"))
  {
    -[TUJoinConversationRequest handle](v10, "handle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = TUIsMMIOrUSSDNumber(v12);

    if (v13)
    {
      TUDefaultLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v39 = v10;
        _os_log_impl(&dword_19A50D000, v14, OS_LOG_TYPE_DEFAULT, "Dial request with normal type appears to contain an MMI/USSD code: %@", buf, 0xCu);
      }

      -[TUCallCenter callServicesInterface](self, "callServicesInterface");
      v15 = objc_claimAutoreleasedReturnValue();
      -[NSObject sendMMIOrUSSDCodeWithRequest:](v15, "sendMMIOrUSSDCodeWithRequest:", v10);
LABEL_18:

      if (v7)
        v7[2](v7, 0);
LABEL_20:
      v19 = 0;
      goto LABEL_21;
    }
  }
  v37 = 0;
  if (!-[TUCallCenter _canDialWithRequest:shouldUseRelay:](self, "_canDialWithRequest:shouldUseRelay:", v10, &v37))
  {
    TUDefaultLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19A50D000, v15, OS_LOG_TYPE_DEFAULT, "[WARN] Cannot satisfy dial request. Returning nil call", buf, 2u);
    }
    goto LABEL_18;
  }
  -[TUJoinConversationRequest setHostOnCurrentDevice:](v10, "setHostOnCurrentDevice:", v37 == 0);
  -[TUJoinConversationRequest provider](v10, "provider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v16, "isFaceTimeProvider")
    || -[TUJoinConversationRequest isVideo](v10, "isVideo")
    || !-[TUJoinConversationRequest endpointOnCurrentDevice](v10, "endpointOnCurrentDevice"))
  {
    goto LABEL_14;
  }
  -[TUJoinConversationRequest endpointIDSDestination](v10, "endpointIDSDestination");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {

LABEL_14:
    goto LABEL_15;
  }
  v21 = +[TUConversationManager supportsConversations](TUConversationManager, "supportsConversations");

  if (v21)
  {
    v22 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[TUJoinConversationRequest handle](v10, "handle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      v24 = [TUConversationMember alloc];
      -[TUJoinConversationRequest handle](v10, "handle");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[TUConversationMember initWithHandle:](v24, "initWithHandle:", v25);

      objc_msgSend(v22, "addObject:", v26);
    }
    v27 = -[TUJoinConversationRequest initWithRemoteMembers:]([TUJoinConversationRequest alloc], "initWithRemoteMembers:", v22);
    v28 = objc_alloc(MEMORY[0x1E0CB3A28]);
    -[TUJoinConversationRequest uniqueProxyIdentifier](v10, "uniqueProxyIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v28, "initWithUUIDString:", v29);

    if (v30)
      -[TUJoinConversationRequest setUUID:](v27, "setUUID:", v30);
    -[TUJoinConversationRequest setVideo:](v27, "setVideo:", 0);
    -[TUJoinConversationRequest setAvMode:](v27, "setAvMode:", 1);
    -[TUJoinConversationRequest setVideoEnabled:](v27, "setVideoEnabled:", 0);
    -[TUJoinConversationRequest localSenderIdentityUUID](v10, "localSenderIdentityUUID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      -[TUJoinConversationRequest localSenderIdentity](v10, "localSenderIdentity");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "handle");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUJoinConversationRequest setCallerID:](v27, "setCallerID:", v33);

    }
    +[TUConversationProvider expanseProvider](TUConversationProvider, "expanseProvider");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUJoinConversationRequest setProvider:](v27, "setProvider:", v34);

    -[TUJoinConversationRequest audioSourceIdentifier](v10, "audioSourceIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUJoinConversationRequest setAudioSourceIdentifier:](v27, "setAudioSourceIdentifier:", v35);

    TUDefaultLog();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v27;
      _os_log_impl(&dword_19A50D000, v36, OS_LOG_TYPE_DEFAULT, "Upgrading dialRequest to joinRequest with expanseProvider since it is a 1:1 FTA %@", buf, 0xCu);
    }

    -[TUCallCenter launchAppForJoinRequest:](self, "launchAppForJoinRequest:", v27);
    goto LABEL_20;
  }
LABEL_15:
  -[TUJoinConversationRequest setHostOnCurrentDevice:](v10, "setHostOnCurrentDevice:", v37 == 0);
  -[TUCallCenter localLandscapeAspectRatio](self, "localLandscapeAspectRatio");
  -[TUJoinConversationRequest setLocalLandscapeAspectRatio:](v10, "setLocalLandscapeAspectRatio:");
  -[TUCallCenter localPortraitAspectRatio](self, "localPortraitAspectRatio");
  -[TUJoinConversationRequest setLocalPortraitAspectRatio:](v10, "setLocalPortraitAspectRatio:");
  -[TUCallCenter callServicesInterface](self, "callServicesInterface");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dialWithRequest:completion:", v10, v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_21:
  return v19;
}

- (void)applicationWillLaunchForStartCallInteraction:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "interaction: %@", (uint8_t *)&v9, 0xCu);
  }

  -[TUCallCenter providerManager](self, "providerManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_intents_bundleIdForLaunching");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "donateUserIntentForProviderWithIdentifier:", v8);

}

- (void)launchAppForDialRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v6;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "dialRequest: %@", buf, 0xCu);
  }

  -[TUCallCenter providerManager](self, "providerManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__TUCallCenter_launchAppForDialRequest_completion___block_invoke;
  v11[3] = &unk_1E38A1FE8;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "launchAppForDialRequest:completion:", v6, v11);

}

void __51__TUCallCenter_launchAppForDialRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "callServicesInterface");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __51__TUCallCenter_launchAppForDialRequest_completion___block_invoke_2;
    v5[3] = &unk_1E38A1FC0;
    v7 = *(id *)(a1 + 40);
    v6 = v3;
    objc_msgSend(v4, "performBlockOnQueue:", v5);

  }
}

uint64_t __51__TUCallCenter_launchAppForDialRequest_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (BOOL)isSimultaneousVoiceAndDataSupportedForDialRequest:(id)a3
{
  void *v3;
  BOOL v4;
  BOOL v5;

  objc_msgSend(a3, "localSenderIdentityUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = +[TUCallCapabilities isSimultaneousVoiceAndDataSupportedForSIMWithUUID:](TUCallCapabilities, "isSimultaneousVoiceAndDataSupportedForSIMWithUUID:", v3);
  else
    v4 = +[TUCallCapabilities supportsSimultaneousVoiceAndData](TUCallCapabilities, "supportsSimultaneousVoiceAndData");
  v5 = v4;

  return v5;
}

- (void)sendFieldModeDigits:(id)a3 forProvider:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  TUDialRequest *v9;
  TUHandle *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "sendFieldModeDigits: %@ for provider: %@", (uint8_t *)&v12, 0x16u);
  }

  v9 = -[TUDialRequest initWithProvider:]([TUDialRequest alloc], "initWithProvider:", v7);
  v10 = -[TUHandle initWithType:value:]([TUHandle alloc], "initWithType:value:", 2, v6);
  -[TUDialRequest setHandle:](v9, "setHandle:", v10);

  -[TUCallCenter callServicesInterface](self, "callServicesInterface");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sendMMIOrUSSDCodeWithRequest:", v9);

}

- (void)answerCall:(id)a3
{
  id v4;
  NSObject *v5;
  TUAnswerRequest *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "answerCall: %@", (uint8_t *)&v7, 0xCu);
  }

  v6 = -[TUAnswerRequest initWithCall:]([TUAnswerRequest alloc], "initWithCall:", v4);
  -[TUCallCenter answerWithRequest:](self, "answerWithRequest:", v6);

}

- (void)holdAndAnswerIfNeeded:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  int isKindOfClass;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  const __CFString *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[TUCallCenter isHoldAndAnswerAllowed](self, "isHoldAndAnswerAllowed");
  TUDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (v5)
      v7 = CFSTR("YES");
    v15 = 138412546;
    v16 = v7;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "holdAndAnswerIfNeeded, isHoldAndAnswerAllowed: %@ for call: %@", (uint8_t *)&v15, 0x16u);
  }

  v8 = (void *)CFPreferencesCopyValue(CFSTR("CleethorpesEnabled"), CFSTR("com.apple.InCallService"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & v5) == 1)
    v10 = objc_msgSend(v8, "BOOLValue");
  else
    v10 = v5 & ~isKindOfClass;
  -[TUCallCenter featureFlags](self, "featureFlags");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "incomingBannerOverSixUpEnabled") & 1) == 0)
  {
    -[TUCallCenter featureFlags](self, "featureFlags");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "embedSwapBannerEnabled") & 1) != 0)
    {

      if ((v10 & 1) != 0)
        goto LABEL_10;
    }
    else
    {
      -[TUCallCenter featureFlags](self, "featureFlags");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "callManagerEnabled");

      if ((v14 & v10 & 1) != 0)
        goto LABEL_10;
    }
LABEL_15:
    -[TUCallCenter answerCall:](self, "answerCall:", v4);
    goto LABEL_16;
  }

  if (!v10)
    goto LABEL_15;
LABEL_10:
  -[TUCallCenter holdActiveAndAnswerCall:](self, "holdActiveAndAnswerCall:", v4);
LABEL_16:

}

- (void)answerOrJoinCall:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  TUJoinConversationRequest *v12;
  void *v13;
  void *v14;
  TUJoinConversationRequest *v15;
  void *v16;
  uint64_t v17;
  id v18;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138412290;
    v20 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "answerOrJoinCall: %@", (uint8_t *)&v19, 0xCu);
  }

  if (objc_msgSend(v4, "status") == 6 || objc_msgSend(v4, "status") == 5)
  {
    TUDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[TUCallCenter answerOrJoinCall:].cold.1();

  }
  else if (objc_msgSend(v4, "isConversation")
         && (-[TUCallCenter activeConversationForCall:](self, "activeConversationForCall:", v4),
             v7 = (void *)objc_claimAutoreleasedReturnValue(),
             v7,
             v7))
  {
    -[TUCallCenter activeConversationForCall:](self, "activeConversationForCall:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "link");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9 && (v10 = (void *)v9, v11 = objc_msgSend(v8, "letMeInRequestState"), v10, v11 == 1))
    {
      v12 = [TUJoinConversationRequest alloc];
      objc_msgSend(v8, "link");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[TUJoinConversationRequest initWithConversationLink:otherInvitedHandles:sendLetMeInRequest:](v12, "initWithConversationLink:otherInvitedHandles:sendLetMeInRequest:", v13, v14, 1);

    }
    else
    {
      v15 = -[TUJoinConversationRequest initWithConversation:]([TUJoinConversationRequest alloc], "initWithConversation:", v8);
    }
    objc_msgSend(v4, "uniqueProxyIdentifierUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUJoinConversationRequest setUUID:](v15, "setUUID:", v16);

    -[TUJoinConversationRequest setVideoEnabled:](v15, "setVideoEnabled:", objc_msgSend(v4, "isSendingVideo"));
    if (objc_msgSend(v8, "avMode"))
    {
      v17 = objc_msgSend(v8, "avMode");
    }
    else if (objc_msgSend(v4, "isSendingVideo"))
    {
      v17 = 2;
    }
    else
    {
      v17 = 1;
    }
    -[TUJoinConversationRequest setAvMode:](v15, "setAvMode:", v17);
    v18 = -[TUCallCenter joinConversationWithConversationRequest:](self, "joinConversationWithConversationRequest:", v15);

  }
  else
  {
    -[TUCallCenter holdAndAnswerIfNeeded:](self, "holdAndAnswerIfNeeded:", v4);
  }

}

- (void)answerCall:(id)a3 withSourceIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "call: %@ sourceIdentifier: %@", (uint8_t *)&v9, 0x16u);
  }

  -[TUCallCenter answerCall:withSourceIdentifier:wantsHoldMusic:](self, "answerCall:withSourceIdentifier:wantsHoldMusic:", v6, v7, 0);
}

- (void)answerCallWithHoldMusic:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "answerCallWithHoldMusic: %@", (uint8_t *)&v6, 0xCu);
  }

  -[TUCallCenter answerCall:withSourceIdentifier:wantsHoldMusic:](self, "answerCall:withSourceIdentifier:wantsHoldMusic:", v4, 0, 1);
}

- (void)answerCall:(id)a3 withSourceIdentifier:(id)a4 wantsHoldMusic:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSObject *v10;
  TUAnswerRequest *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  _BOOL4 v17;
  uint64_t v18;

  v5 = a5;
  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  TUDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412802;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    v16 = 1024;
    v17 = v5;
    _os_log_impl(&dword_19A50D000, v10, OS_LOG_TYPE_DEFAULT, "call: %@ sourceIdentifier: %@ wantsHoldMusic: %d", (uint8_t *)&v12, 0x1Cu);
  }

  v11 = -[TUAnswerRequest initWithCall:]([TUAnswerRequest alloc], "initWithCall:", v8);
  -[TUAnswerRequest setSourceIdentifier:](v11, "setSourceIdentifier:", v9);
  -[TUAnswerRequest setWantsHoldMusic:](v11, "setWantsHoldMusic:", v5);
  -[TUCallCenter answerWithRequest:](self, "answerWithRequest:", v11);

}

- (void)holdActiveAndAnswerCall:(id)a3
{
  id v4;
  NSObject *v5;
  TUAnswerRequest *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "holdActiveAndAnswerCall: %@", (uint8_t *)&v7, 0xCu);
  }

  v6 = -[TUAnswerRequest initWithCall:]([TUAnswerRequest alloc], "initWithCall:", v4);
  -[TUCallCenter holdActiveAndAnswerWithRequest:](self, "holdActiveAndAnswerWithRequest:", v6);

}

- (void)holdActiveAndAnswerWithRequest:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "holdActiveAndAnswerWithRequest: %@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(v4, "setBehavior:", 2);
  -[TUCallCenter answerWithRequest:](self, "answerWithRequest:", v4);

}

- (void)endActiveAndAnswerCall:(id)a3
{
  id v4;
  NSObject *v5;
  TUAnswerRequest *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "endActiveAndAnswerCall: %@", (uint8_t *)&v7, 0xCu);
  }

  v6 = -[TUAnswerRequest initWithCall:]([TUAnswerRequest alloc], "initWithCall:", v4);
  -[TUCallCenter endActiveAndAnswerWithRequest:](self, "endActiveAndAnswerWithRequest:", v6);

}

- (void)endActiveAndAnswerWithRequest:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "endActiveAndAnswerWithRequest: %@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(v4, "setBehavior:", 0);
  -[TUCallCenter answerWithRequest:](self, "answerWithRequest:", v4);

}

- (void)endHeldAndAnswerCall:(id)a3
{
  id v4;
  NSObject *v5;
  TUAnswerRequest *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "endHeldAndAnswerCall: %@", (uint8_t *)&v7, 0xCu);
  }

  v6 = -[TUAnswerRequest initWithCall:]([TUAnswerRequest alloc], "initWithCall:", v4);
  -[TUCallCenter endHeldAndAnswerWithRequest:](self, "endHeldAndAnswerWithRequest:", v6);

}

- (void)endHeldAndAnswerWithRequest:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "endHeldAndAnswerWithRequest: %@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(v4, "setBehavior:", 1);
  -[TUCallCenter answerWithRequest:](self, "answerWithRequest:", v4);

}

- (void)endActiveOrHeldAndAnswerCall:(id)a3
{
  id v4;
  NSObject *v5;
  TUAnswerRequest *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "endActiveOrHeldAndAnswerCall: %@", (uint8_t *)&v7, 0xCu);
  }

  v6 = -[TUAnswerRequest initWithCall:]([TUAnswerRequest alloc], "initWithCall:", v4);
  -[TUCallCenter endActiveOrHeldAndAnswerWithRequest:](self, "endActiveOrHeldAndAnswerWithRequest:", v6);

}

- (void)endActiveOrHeldAndAnswerWithRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "endActiveOrHeldAndAnswerWithRequest: %@", (uint8_t *)&v7, 0xCu);
  }

  -[TUCallCenter audioOrVideoCallWithStatus:](self, "audioOrVideoCallWithStatus:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[TUCallCenter endActiveAndAnswerWithRequest:](self, "endActiveAndAnswerWithRequest:", v4);
  else
    -[TUCallCenter endHeldAndAnswerWithRequest:](self, "endHeldAndAnswerWithRequest:", v4);

}

- (void)reportLocalPreviewStoppedForCall:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "reportLocalPreviewStoppedForCall: %@", (uint8_t *)&v8, 0xCu);
  }

  -[TUCallCenter callServicesInterface](self, "callServicesInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueProxyIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reportLocalPreviewStoppedForCallWithUniqueProxyIdentifier:", v7);

}

- (void)answerWithRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  id v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  NSObject *v42;
  _QWORD v43[5];
  id v44;
  id v45;
  id v46;
  _QWORD v47[5];
  id v48;
  NSObject *v49;
  id v50;
  _QWORD v51[4];
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[4];
  id v58;
  id v59;
  uint8_t v60[128];
  uint8_t buf[4];
  id v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[TUCallCenter _allCalls](self, "_allCalls");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v62 = v4;
    v63 = 2112;
    v64 = v6;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "answerRequest: %@ - Current calls are %@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDateAnswered:", v7);

  objc_msgSend(v4, "uniqueProxyIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallCenter callWithUniqueProxyIdentifier:](self, "callWithUniqueProxyIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "behavior") == 4)
  {
    objc_msgSend(v9, "isVideo");
    v10 = 1;
  }
  else
  {
    v11 = objc_msgSend(v4, "downgradeToAudio");
    v12 = objc_msgSend(v9, "isVideo");
    v10 = v12 | v11;
    if (v12 && (v11 & 1) == 0)
    {
      if ((objc_msgSend(v4, "allowBluetoothAnswerWithoutDowngrade") & 1) == 0)
      {
        objc_msgSend(v4, "sourceIdentifier");
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)v13;
          -[TUCallCenter routeController](self, "routeController");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "sourceIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "routeWithSourceIdentifier:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isBluetooth");

          if (v18)
          {
            TUDefaultLog();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v62 = v9;
              _os_log_impl(&dword_19A50D000, v19, OS_LOG_TYPE_DEFAULT, "We are asked to answer with bluetooth route for a video call - Ignoring to answer %@", buf, 0xCu);
            }

            v20 = (void *)MEMORY[0x1E0C99E98];
            objc_msgSend(v4, "sourceIdentifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "faceTimeAnswerURLWithSourceIdentifier:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            v57[0] = MEMORY[0x1E0C809B0];
            v57[1] = 3221225472;
            v57[2] = __34__TUCallCenter_answerWithRequest___block_invoke;
            v57[3] = &unk_1E38A4640;
            v58 = v22;
            v59 = v9;
            v23 = v22;
            TUOpenURLWithCompletion(v23, v57);

            goto LABEL_42;
          }
        }
      }
      v10 = 0;
    }
  }
  if (v9)
  {
    v40 = v10;
    -[TUCallCenter audioAndVideoCallsWithStatus:](self, "audioAndVideoCallsWithStatus:", 1);
    v42 = objc_claimAutoreleasedReturnValue();
    -[TUCallCenter audioAndVideoCallsWithStatus:](self, "audioAndVideoCallsWithStatus:", 2);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    -[TUCallCenter _allCalls](self, "_allCalls");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v54 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          if (objc_msgSend(v29, "status") == 4 && (objc_msgSend(v29, "isEqualToCall:", v9) & 1) == 0)
          {
            TUDefaultLog();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v62 = v29;
              _os_log_impl(&dword_19A50D000, v30, OS_LOG_TYPE_DEFAULT, "Another ringing call exists while we are trying to answer this call. Declining the other ringing call: %@", buf, 0xCu);
            }

            -[TUCallCenter disconnectCall:withReason:](self, "disconnectCall:withReason:", v29, 2);
          }
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
      }
      while (v26);
    }

    -[TUCallCenter localLandscapeAspectRatio](self, "localLandscapeAspectRatio");
    objc_msgSend(v4, "setLocalLandscapeAspectRatio:");
    -[TUCallCenter localPortraitAspectRatio](self, "localPortraitAspectRatio");
    objc_msgSend(v4, "setLocalPortraitAspectRatio:");
    v31 = MEMORY[0x1E0C809B0];
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __34__TUCallCenter_answerWithRequest___block_invoke_163;
    v51[3] = &unk_1E38A2428;
    v32 = v9;
    v52 = v32;
    if (((!-[TUCallCenter anyCallPassesTest:](self, "anyCallPassesTest:", v51) | v40) & 1) == 0)
    {
      TUDefaultLog();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19A50D000, v33, OS_LOG_TYPE_DEFAULT, "Overriding answer behavior to video upgrade", buf, 2u);
      }

      objc_msgSend(v4, "setBehavior:", 3);
    }
    v34 = objc_msgSend(v4, "behavior");
    if ((unint64_t)(v34 - 2) < 3)
    {
      -[TUCallCenter callServicesInterface](self, "callServicesInterface");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "answerCallWithRequest:", v4);

      objc_msgSend(v4, "endpointIDSDestination");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = v41;
      v23 = v42;
      if (!v36)
        -[TUCallCenter updateCall:withAnswerRequest:](self, "updateCall:withAnswerRequest:", v32, v4);
      goto LABEL_41;
    }
    v37 = v41;
    v23 = v42;
    if (v34 == 1)
    {
      v43[0] = v31;
      v43[1] = 3221225472;
      v43[2] = __34__TUCallCenter_answerWithRequest___block_invoke_2;
      v43[3] = &unk_1E38A4668;
      v43[4] = self;
      v44 = v4;
      v45 = v41;
      v46 = v32;
      -[TUCallCenter _preflightDisconnectForCalls:withCompletion:](self, "_preflightDisconnectForCalls:withCompletion:", v45, v43);

      v39 = v44;
    }
    else
    {
      if (v34)
      {
LABEL_41:

        goto LABEL_42;
      }
      v47[0] = v31;
      v47[1] = 3221225472;
      v47[2] = __34__TUCallCenter_answerWithRequest___block_invoke_164;
      v47[3] = &unk_1E38A4668;
      v47[4] = self;
      v48 = v4;
      v49 = v42;
      v50 = v32;
      -[TUCallCenter _preflightDisconnectForCalls:withCompletion:](self, "_preflightDisconnectForCalls:withCompletion:", v49, v47);

      v39 = v48;
    }

    goto LABEL_41;
  }
  TUDefaultLog();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "uniqueProxyIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v62 = v38;
    _os_log_impl(&dword_19A50D000, v23, OS_LOG_TYPE_DEFAULT, "[WARN] No call found to answer for uniqueProxyIdentifier %@", buf, 0xCu);

  }
LABEL_42:

}

void __34__TUCallCenter_answerWithRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  TUDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_19A50D000, v7, OS_LOG_TYPE_DEFAULT, "TUOpenURLWithCompletion result: %@, error: %@", (uint8_t *)&v9, 0x16u);
  }

  if (v6)
  {
    TUDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __34__TUCallCenter_answerWithRequest___block_invoke_cold_1(a1, v8);

  }
}

uint64_t __34__TUCallCenter_answerWithRequest___block_invoke_163(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isVideoUpgradeFromCall:", a2);
}

void __34__TUCallCenter_answerWithRequest___block_invoke_164(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "callServicesInterface");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "answerCallWithRequest:", *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 40), "endpointIDSDestination");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      v5 = *(id *)(a1 + 48);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v11;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v11 != v8)
              objc_enumerationMutation(v5);
            objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setTransitionStatus:", 5, (_QWORD)v10);
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        }
        while (v7);
      }

      objc_msgSend(*(id *)(a1 + 32), "updateCall:withAnswerRequest:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
    }
  }
}

void __34__TUCallCenter_answerWithRequest___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "callServicesInterface");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "answerCallWithRequest:", *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 40), "endpointIDSDestination");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      v5 = *(id *)(a1 + 48);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v11;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v11 != v8)
              objc_enumerationMutation(v5);
            objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setTransitionStatus:", 5, (_QWORD)v10);
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        }
        while (v7);
      }

      objc_msgSend(*(id *)(a1 + 32), "updateCall:withAnswerRequest:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
    }
  }
}

- (void)updateCall:(id)a3 withAnswerRequest:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "callNotificationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__TUCallCenter_updateCall_withAnswerRequest___block_invoke;
  v10[3] = &unk_1E38A1388;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "deferNotificationsUntilAfterPerformingBlock:", v10);

}

uint64_t __45__TUCallCenter_updateCall_withAnswerRequest___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setTransitionStatus:", 1);
  objc_msgSend(*(id *)(a1 + 40), "sourceIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSourceIdentifier:", v2);

  objc_msgSend(*(id *)(a1 + 32), "setWantsHoldMusic:", objc_msgSend(*(id *)(a1 + 40), "wantsHoldMusic"));
  objc_msgSend(*(id *)(a1 + 32), "setScreening:", objc_msgSend(*(id *)(a1 + 40), "sendToScreening"));
  if (objc_msgSend(*(id *)(a1 + 40), "pauseVideoToStart"))
    objc_msgSend(*(id *)(a1 + 32), "setIsSendingVideo:", 0);
  if (objc_msgSend(*(id *)(a1 + 40), "behavior") == 4
    || (result = objc_msgSend(*(id *)(a1 + 40), "downgradeToAudio"), (_DWORD)result))
  {
    objc_msgSend(*(id *)(a1 + 32), "setIsSendingVideo:", 0);
    result = objc_msgSend(*(id *)(a1 + 32), "isConversation");
    if ((result & 1) == 0)
      return objc_msgSend(*(id *)(a1 + 32), "setVideo:", 0);
  }
  return result;
}

- (void)holdCall:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[TUCallCenter _allCalls](self, "_allCalls");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v4;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "call: %@ - Current calls are %@", (uint8_t *)&v9, 0x16u);

  }
  if (v4 && (objc_msgSend(v4, "isOnHold") & 1) == 0)
  {
    objc_msgSend(v4, "setProvisionalHoldStatus:", 1);
    -[TUCallCenter callServicesInterface](self, "callServicesInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueProxyIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "holdCallWithUniqueProxyIdentifier:", v8);

  }
}

- (void)requestVideoUpgradeForCall:(id)a3 originatingUIType:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  TUDialRequest *v10;
  void *v11;
  void *v12;
  TUDialRequest *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v4 = *(_QWORD *)&a4;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6 && (objc_msgSend(v6, "isVideo") & 1) == 0 && objc_msgSend(v7, "status") == 1)
  {
    if (!objc_msgSend(v7, "isConversation"))
    {
      v10 = [TUDialRequest alloc];
      -[TUCallCenter providerManager](self, "providerManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "faceTimeProvider");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[TUDialRequest initWithProvider:](v10, "initWithProvider:", v12);

      objc_msgSend(v7, "handle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUDialRequest setHandle:](v13, "setHandle:", v14);

      objc_msgSend(v7, "contactIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUDialRequest setContactIdentifier:](v13, "setContactIdentifier:", v15);

      -[TUDialRequest setVideo:](v13, "setVideo:", 1);
      -[TUDialRequest setPerformDialAssist:](v13, "setPerformDialAssist:", 0);
      -[TUDialRequest setOriginatingUIType:](v13, "setOriginatingUIType:", v4);
      -[TUDialRequest URL](v13, "URL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      TUOpenURL(v16);

      goto LABEL_9;
    }
    -[TUCallCenter callServicesInterface](self, "callServicesInterface");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueProxyIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject requestVideoUpgradeForCallWithUniqueProxyIdentifier:](v8, "requestVideoUpgradeForCallWithUniqueProxyIdentifier:", v9);

  }
  else
  {
    TUDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v7;
      _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Failing call: %@ to upgrade", (uint8_t *)&v17, 0xCu);
    }
  }

LABEL_9:
}

- (void)requestVideoUpgradeForCall:(id)a3
{
  -[TUCallCenter requestVideoUpgradeForCall:originatingUIType:](self, "requestVideoUpgradeForCall:originatingUIType:", a3, 0);
}

- (void)unholdCall:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[TUCallCenter _allCalls](self, "_allCalls");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v4;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "call: %@ - Current calls are %@", (uint8_t *)&v9, 0x16u);

  }
  if (v4 && objc_msgSend(v4, "isOnHold"))
  {
    objc_msgSend(v4, "setProvisionalHoldStatus:", 2);
    -[TUCallCenter callServicesInterface](self, "callServicesInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueProxyIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unholdCallWithUniqueProxyIdentifier:", v8);

  }
}

- (void)swapCalls
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[TUCallCenter _allCalls](self, "_allCalls");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "- Current calls are %@", (uint8_t *)&v6, 0xCu);

  }
  -[TUCallCenter callServicesInterface](self, "callServicesInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "swapCalls");

}

- (void)groupCall:(id)a3 withOtherCall:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "call: %@ otherCall: %@", (uint8_t *)&v12, 0x16u);
  }

  -[TUCallCenter callServicesInterface](self, "callServicesInterface");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueProxyIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueProxyIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "groupCallWithUniqueProxyIdentifier:withOtherCallWithUniqueProxyIdentifier:", v10, v11);

}

- (void)ungroupCall:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "call: %@", (uint8_t *)&v8, 0xCu);
  }

  -[TUCallCenter callServicesInterface](self, "callServicesInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueProxyIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ungroupCallWithUniqueProxyIdentifier:", v7);

}

- (void)_preflightDisconnectForCalls:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  -[TUCallCenter disconnectCallPreflight](self, "disconnectCallPreflight");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[TUCallCenter disconnectCallPreflight](self, "disconnectCallPreflight");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __60__TUCallCenter__preflightDisconnectForCalls_withCompletion___block_invoke;
    v10[3] = &unk_1E38A4690;
    v11 = v6;
    v12 = v7;
    ((void (**)(_QWORD, id, _QWORD *))v9)[2](v9, v11, v10);

  }
  else
  {
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
  }

}

uint64_t __60__TUCallCenter__preflightDisconnectForCalls_withCompletion___block_invoke(uint64_t a1, char a2)
{
  NSObject *v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) == 0)
  {
    TUDefaultLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "Calls %@ not allowed to disconnect", (uint8_t *)&v6, 0xCu);
    }

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)disconnectCall:(id)a3
{
  -[TUCallCenter disconnectCall:withReason:](self, "disconnectCall:withReason:", a3, 0);
}

- (void)disconnectCall:(id)a3 withReason:(int)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  NSObject *v12;
  int v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  TUDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[TUCallCenter _allCalls](self, "_allCalls");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v16 = v6;
    v17 = 1024;
    v18 = a4;
    v19 = 2112;
    v20 = v8;
    _os_log_impl(&dword_19A50D000, v7, OS_LOG_TYPE_DEFAULT, "disconnectCall: %@ reason: %d - Current calls are %@", buf, 0x1Cu);

  }
  if (v6)
  {
    v14 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __42__TUCallCenter_disconnectCall_withReason___block_invoke;
    v11[3] = &unk_1E38A46B8;
    v12 = v6;
    v13 = a4;
    -[TUCallCenter _preflightDisconnectForCalls:withCompletion:](self, "_preflightDisconnectForCalls:withCompletion:", v9, v11);

    v10 = v12;
  }
  else
  {
    TUDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19A50D000, v10, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring disconnectCall request because provided call was nil", buf, 2u);
    }
  }

}

uint64_t __42__TUCallCenter_disconnectCall_withReason___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "disconnectWithReason:", *(unsigned int *)(result + 40));
  return result;
}

- (void)disconnectCurrentCallAndActivateHeld
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[TUCallCenter _allCalls](self, "_allCalls");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v4;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "- Current calls are %@", buf, 0xCu);

  }
  -[TUCallCenter audioOrVideoCallWithStatus:](self, "audioOrVideoCallWithStatus:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallCenter audioAndVideoCallsWithStatus:](self, "audioAndVideoCallsWithStatus:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallCenter audioAndVideoCallsWithStatus:](self, "audioAndVideoCallsWithStatus:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v12 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v6, "count"))
  {
    v8 = v6;
  }
  else
  {
    v8 = v7;
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__TUCallCenter_disconnectCurrentCallAndActivateHeld__block_invoke;
  v10[3] = &unk_1E38A46E0;
  v10[4] = self;
  v11 = v8;
  v9 = v8;
  -[TUCallCenter _preflightDisconnectForCalls:withCompletion:](self, "_preflightDisconnectForCalls:withCompletion:", v9, v10);

}

void __52__TUCallCenter_disconnectCurrentCallAndActivateHeld__block_invoke(uint64_t a1, int a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "callServicesInterface");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "disconnectCurrentCallAndActivateHeld");

    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = *(id *)(a1 + 40);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setTransitionStatus:", 5, (_QWORD)v9);
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (void)disconnectAllCalls
{
  NSObject *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[TUCallCenter _allCalls](self, "_allCalls");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "- Current calls are %@", buf, 0xCu);

  }
  -[TUCallCenter currentCalls](self, "currentCalls");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__TUCallCenter_disconnectAllCalls__block_invoke;
  v6[3] = &unk_1E38A4708;
  v6[4] = self;
  -[TUCallCenter _preflightDisconnectForCalls:withCompletion:](self, "_preflightDisconnectForCalls:withCompletion:", v5, v6);

}

uint64_t __34__TUCallCenter_disconnectAllCalls__block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "disconnectAllCallsWithNoPreflight");
  return result;
}

- (void)disconnectAllCallsWithNoPreflight
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[8];
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "Proceeding to disconnect all calls", buf, 2u);
  }

  -[TUCallCenter callServicesInterface](self, "callServicesInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "disconnectAllCalls");

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[TUCallCenter currentCalls](self, "currentCalls", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setTransitionStatus:", 5);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

}

- (void)handleActionForWiredHeadsetMiddleButtonPress
{
  -[TUCallCenter handleActionForWiredHeadsetMiddleButtonPressWithSourceIdentifier:allowBluetoothAnswerWithoutDowngrade:shouldForceDowngradeToAudio:](self, "handleActionForWiredHeadsetMiddleButtonPressWithSourceIdentifier:allowBluetoothAnswerWithoutDowngrade:shouldForceDowngradeToAudio:", 0, 0, 0);
}

- (void)handleActionForWiredHeadsetMiddleButtonPressWithSourceIdentifier:(id)a3 allowBluetoothAnswerWithoutDowngrade:(BOOL)a4 shouldForceDowngradeToAudio:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  __CFString *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  TUAnswerRequest *v16;
  TUAnswerRequest *v17;
  const __CFString *v18;
  TUAnswerRequest *v19;
  const __CFString *v20;
  objc_class *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v5 = a5;
  v6 = a4;
  v35 = *MEMORY[0x1E0C80C00];
  v8 = (__CFString *)a3;
  TUDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[TUCallCenter _allCalls](self, "_allCalls");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v34 = v10;
    _os_log_impl(&dword_19A50D000, v9, OS_LOG_TYPE_DEFAULT, "- Current calls are %@", buf, 0xCu);

  }
  -[TUCallCenter audioOrVideoCallWithStatus:](self, "audioOrVideoCallWithStatus:", 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallCenter screeningCall](self, "screeningCall");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallCenter callWithStatus:](self, "callWithStatus:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallCenter callWithStatus:](self, "callWithStatus:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallCenter audioOrVideoCallWithStatus:](self, "audioOrVideoCallWithStatus:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallCenter activeConversationForCall:](self, "activeConversationForCall:", v15);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v16 = -[TUAnswerRequest initWithCall:]([TUAnswerRequest alloc], "initWithCall:", v11);
    v17 = v16;
    if (v8)
      v18 = v8;
    else
      v18 = CFSTR("TUCallSourceIdentifierMikeyRoute");
    -[TUAnswerRequest setSourceIdentifier:](v16, "setSourceIdentifier:", v18, v28);
    -[TUAnswerRequest setAllowBluetoothAnswerWithoutDowngrade:](v17, "setAllowBluetoothAnswerWithoutDowngrade:", v6);
    if (v13 && v14 && (objc_msgSend(v11, "isVideo") & 1) == 0)
    {
      -[TUAnswerRequest setBehavior:](v17, "setBehavior:", 1);
    }
    else if (-[TUCallCenter isHoldAndAnswerAllowed](self, "isHoldAndAnswerAllowed"))
    {
      -[TUAnswerRequest setBehavior:](v17, "setBehavior:", 2);
    }
    else
    {
      if (!-[TUCallCenter isEndAndAnswerAllowed](self, "isEndAndAnswerAllowed"))
      {

        v17 = 0;
        if (!v5)
        {
LABEL_14:
          if (v17)
          {
LABEL_15:
            -[TUCallCenter answerWithRequest:](self, "answerWithRequest:", v17);
LABEL_25:

            goto LABEL_33;
          }
LABEL_24:
          -[TUCallCenter disconnectAllCalls](self, "disconnectAllCalls");
          goto LABEL_25;
        }
LABEL_13:
        -[TUAnswerRequest setBehavior:](v17, "setBehavior:", 4);
        goto LABEL_14;
      }
      -[TUAnswerRequest setBehavior:](v17, "setBehavior:", 0);
    }
    if (!v5)
      goto LABEL_14;
    goto LABEL_13;
  }
  if (v12)
  {
    v19 = -[TUAnswerRequest initWithCall:]([TUAnswerRequest alloc], "initWithCall:", v12);
    v17 = v19;
    if (v8)
      v20 = v8;
    else
      v20 = CFSTR("TUCallSourceIdentifierMikeyRoute");
    -[TUAnswerRequest setSourceIdentifier:](v19, "setSourceIdentifier:", v20, v28);
    if (v17)
      goto LABEL_15;
    goto LABEL_24;
  }
  if (objc_msgSend(v28, "hasJoinedActivitySession"))
  {
    v21 = (objc_class *)CUTWeakLinkClass();
    v22 = (void *)CUTWeakLinkClass();
    v23 = [v21 alloc];
    objc_msgSend(v22, "localOrigin");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v23, "initWithOrigin:", v24);

    objc_initWeak((id *)buf, self);
    v26 = MEMORY[0x1E0C80D38];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __146__TUCallCenter_handleActionForWiredHeadsetMiddleButtonPressWithSourceIdentifier_allowBluetoothAnswerWithoutDowngrade_shouldForceDowngradeToAudio___block_invoke;
    v29[3] = &unk_1E38A4730;
    objc_copyWeak(&v32, (id *)buf);
    v30 = v28;
    v27 = v25;
    v31 = v27;
    objc_msgSend(v27, "nowPlayingPlayerPathOnQueue:completion:", MEMORY[0x1E0C80D38], v29);

    objc_destroyWeak(&v32);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    -[TUCallCenter handleHeadsetButtonPressForActiveCalls](self, "handleHeadsetButtonPressForActiveCalls");
  }
LABEL_33:

}

void __146__TUCallCenter_handleActionForWiredHeadsetMiddleButtonPressWithSourceIdentifier_allowBluetoothAnswerWithoutDowngrade_shouldForceDowngradeToAudio___block_invoke(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  uint8_t v12[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    objc_msgSend(v3, "client");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "joinedActivitySession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "isEqualToString:", v9);

    if (v10)
    {
      TUDefaultLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_19A50D000, v11, OS_LOG_TYPE_DEFAULT, "Forwarding headset button press to MediaRemote because an activity session is controlling media playback", v12, 2u);
      }

      objc_msgSend(a1[5], "sendCommand:options:queue:completion:", 2, 0, MEMORY[0x1E0C80D38], 0);
    }
    else
    {
      objc_msgSend(WeakRetained, "handleHeadsetButtonPressForActiveCalls");
    }
  }

}

- (void)handleHeadsetButtonPressForActiveCalls
{
  void *v3;
  id v4;

  -[TUCallCenter callWithStatus:](self, "callWithStatus:", 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[TUCallCenter callWithStatus:](self, "callWithStatus:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && v3)
  {
    -[TUCallCenter swapCalls](self, "swapCalls");
  }
  else if (objc_msgSend(v4, "isScreening"))
  {
    -[TUCallCenter answerCall:](self, "answerCall:", v4);
  }
  else
  {
    -[TUCallCenter disconnectCurrentCallAndActivateHeld](self, "disconnectCurrentCallAndActivateHeld");
  }

}

- (void)handleActionForWiredHeadsetMiddleButtonLongPress
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[TUCallCenter _allCalls](self, "_allCalls");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "current calls are %@", (uint8_t *)&v8, 0xCu);

  }
  -[TUCallCenter audioOrVideoCallWithStatus:](self, "audioOrVideoCallWithStatus:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallCenter callWithStatus:](self, "callWithStatus:", 1);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
  {
    -[TUCallCenter disconnectCall:withReason:](self, "disconnectCall:withReason:", v5, 2);
  }
  else if (v6 && -[TUCallCenter currentCallCount](self, "currentCallCount") >= 2)
  {
    -[TUCallCenter disconnectCurrentCallAndActivateHeld](self, "disconnectCurrentCallAndActivateHeld");
  }

}

- (void)activateInCallUIWithActivityContinuationIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TUCallCenter callServicesInterface](self, "callServicesInterface");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activateInCallUIWithActivityContinuationIdentifier:", v4);

}

- (void)setTTYType:(int)a3 forCall:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  -[TUCallCenter callServicesInterface](self, "callServicesInterface");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueProxyIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setTTYType:forCallWithUniqueProxyIdentifier:", v4, v7);
}

- (void)setLiveVoicemailUnavailableReason:(int64_t)a3 forCall:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  -[TUCallCenter callServicesInterface](self, "callServicesInterface");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueProxyIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setLiveVoicemailUnavailableReason:forCallWithUniqueProxyIdentifier:", a3, v7);
}

- (void)pullCallFromClientUsingHandoffActivityUserInfo:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "userInfo: %@", (uint8_t *)&v10, 0xCu);
  }

  -[TUCallCenter callServicesInterface](self, "callServicesInterface");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pullCallFromClientUsingHandoffActivityUserInfo:completion:", v6, v7);

}

- (void)pullPersistedChannel:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TUCallCenter callServicesInterface](self, "callServicesInterface");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pullPersistedChannel:", v4);

}

- (void)startTransmissionForBargeCall:(id)a3 sourceIsHandsfreeAccessory:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  void *v10;
  __int16 v11;
  __int16 v12;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "isPTT"))
  {
    if (objc_msgSend(v6, "transmissionMode") == 2)
    {
      TUDefaultLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
LABEL_10:

        goto LABEL_12;
      }
      v12 = 0;
      v8 = "Could not start transmission because barge call was in simplex mode.";
      v9 = (uint8_t *)&v12;
    }
    else
    {
      if (!objc_msgSend(v6, "isReceivingTransmission") || !objc_msgSend(v6, "transmissionMode"))
      {
        -[TUCallCenter callServicesInterface](self, "callServicesInterface");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "startTransmissionForBargeCall:sourceIsHandsfreeAccessory:", v6, v4);

        goto LABEL_12;
      }
      TUDefaultLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_10;
      v11 = 0;
      v8 = "Could not start transmission because barge call was receiving a transmission and does not support full-duplex mode.";
      v9 = (uint8_t *)&v11;
    }
    _os_log_impl(&dword_19A50D000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    goto LABEL_10;
  }
LABEL_12:

}

- (void)stopTransmissionForBargeCall:(id)a3 sourceIsHandsfreeAccessory:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  if (objc_msgSend(v7, "isPTT"))
  {
    -[TUCallCenter callServicesInterface](self, "callServicesInterface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stopTransmissionForBargeCall:sourceIsHandsfreeAccessory:", v7, v4);

  }
}

- (void)pushRelayingCallsToHost
{
  -[TUCallCenter pushRelayingCallsToHostWithSourceIdentifier:](self, "pushRelayingCallsToHostWithSourceIdentifier:", 0);
}

- (void)pushRelayingCallsToHostWithSourceIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[TUCallCenter _allCalls](self, "_allCalls");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v4;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "sourceIdentifier: %@ - Current calls are %@", (uint8_t *)&v8, 0x16u);

  }
  -[TUCallCenter callServicesInterface](self, "callServicesInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pushRelayingCallsToHostWithSourceIdentifier:", v4);

}

- (void)pullRelayingCallsFromClient
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[TUCallCenter _allCalls](self, "_allCalls");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 136315394;
    v7 = "-[TUCallCenter pullRelayingCallsFromClient]";
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "%s: - Current calls are %@", (uint8_t *)&v6, 0x16u);

  }
  if (-[TUCallCenter shouldPullRelayingCalls](self, "shouldPullRelayingCalls"))
  {
    -[TUCallCenter callServicesInterface](self, "callServicesInterface");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pullRelayingCallsFromClient");

  }
}

- (void)pullRelayingGFTCallsFromClientIfNecessary
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[TUCallCenter _allCalls](self, "_allCalls");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 136315394;
    v7 = "-[TUCallCenter pullRelayingGFTCallsFromClientIfNecessary]";
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "%s: - Current calls are %@", (uint8_t *)&v6, 0x16u);

  }
  if (-[TUCallCenter shouldPullRelayingCalls](self, "shouldPullRelayingCalls"))
  {
    -[TUCallCenter callServicesInterface](self, "callServicesInterface");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pullRelayingGFTCallsFromClientIfNecessary");

  }
}

- (void)pushHostedCallsToDestination:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[TUCallCenter _allCalls](self, "_allCalls");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v4;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "destination: %@ - Current calls are %@", (uint8_t *)&v8, 0x16u);

  }
  -[TUCallCenter callServicesInterface](self, "callServicesInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pushHostedCallsToDestination:", v4);

}

- (void)pullHostedCallsFromPairedHostDevice
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[TUCallCenter _allCalls](self, "_allCalls");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "- Current calls are %@", (uint8_t *)&v6, 0xCu);

  }
  -[TUCallCenter callServicesInterface](self, "callServicesInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pullHostedCallsFromPairedHostDevice");

}

- (void)pickRouteForRapportDeviceWithMediaSystemIdentifier:(id)a3 effectiveIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[TUCallCenter routeController](self, "routeController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "routes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v14);
      objc_msgSend(v15, "uniqueIdentifier", (_QWORD)v24);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "length") && objc_msgSend(v6, "isEqualToString:", v16))
      {
        TUDefaultLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          goto LABEL_18;
        *(_DWORD *)buf = 138412546;
        v29 = v6;
        v30 = 2112;
        v31 = v15;
        v18 = "Found route matching rapportMediaSystemIdentifier=\"%@\", route=%@";
        goto LABEL_17;
      }
      if (objc_msgSend(v7, "length") && objc_msgSend(v7, "isEqualToString:", v16))
        break;

      if (v12 == ++v14)
      {
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
        if (v12)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
    TUDefaultLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
    *(_DWORD *)buf = 138412546;
    v29 = v7;
    v30 = 2112;
    v31 = v15;
    v18 = "Found route matching rapportEffectiveIdentifier=\"%@\", route=%@";
LABEL_17:
    _os_log_impl(&dword_19A50D000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 0x16u);
LABEL_18:

    v19 = v15;
    if (!v19)
      goto LABEL_20;
    -[TUCallCenter routeController](self, "routeController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "pickRoute:", v19);

  }
  else
  {
LABEL_12:

LABEL_20:
    TUDefaultLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v29 = v6;
      v30 = 2112;
      v31 = v7;
      v32 = 2112;
      v33 = v10;
      _os_log_impl(&dword_19A50D000, v21, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find any routes matching rapportMediaSystemIdentifier %@ or rapportEffectiveIdentifier %@ among availableRoutes %@, attempting to pick route when available...", buf, 0x20u);
    }

    -[TUCallCenter routeController](self, "routeController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v22;
    if (v6)
      v23 = v6;
    else
      v23 = v7;
    objc_msgSend(v22, "pickRouteWhenAvailableWithUniqueIdentifier:", v23, (_QWORD)v24);
  }

}

- (void)joinConversationWithRequest:(id)a3
{
  id v4;

  v4 = a3;
  if (+[TUConversationManager supportsConversations](TUConversationManager, "supportsConversations"))
    -[TUCallCenter launchAppForJoinRequest:](self, "launchAppForJoinRequest:", v4);

}

- (BOOL)launchAppForJoinRequest:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t (**v6)(_QWORD, _QWORD);
  char v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v9, 0xCu);
  }

  -[TUCallCenter launchAppForJoinRequestBlock](self, "launchAppForJoinRequestBlock");
  v6 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v7 = ((uint64_t (**)(_QWORD, id))v6)[2](v6, v4);

  return v7;
}

- (BOOL)autoPunchOutBehaviorRequiredForFrontmostCall
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  unint64_t v15;
  char v16;
  void *v17;
  BOOL v18;
  BOOL v19;

  -[TUCallCenter currentAudioAndVideoCalls](self, "currentAudioAndVideoCalls");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[TUCallCenter frontmostAudioOrVideoCall](self, "frontmostAudioOrVideoCall");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  -[TUCallCenter frontmostAudioOrVideoCall](self, "frontmostAudioOrVideoCall");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "provider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[TUCallCenter currentAudioAndVideoCalls](self, "currentAudioAndVideoCalls");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = 0;
    while (1)
    {
      -[TUCallCenter currentAudioAndVideoCalls](self, "currentAudioAndVideoCalls");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "provider");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToCallProvider:", v6);

      if ((v13 & 1) == 0)
        break;
      ++v9;
      -[TUCallCenter currentAudioAndVideoCalls](self, "currentAudioAndVideoCalls");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      if (v15 <= v9)
        goto LABEL_7;
    }
    v19 = 0;
  }
  else
  {
LABEL_7:
    v16 = objc_msgSend(v6, "isSystemProvider");
    -[TUCallCenter audioOrVideoCallWithStatus:](self, "audioOrVideoCallWithStatus:", 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17 == 0;

    v19 = v18 & ~v16;
  }

  return v19;
}

- (void)continueHandoffEligibleConversation
{
  void *v3;
  int v4;

  -[TUCallCenter featureFlags](self, "featureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conversationHandoffEnabled");

  if (v4)
    -[TUCallCenter continueHandoffForConversationWithEligibility:](self, "continueHandoffForConversationWithEligibility:", 0);
}

- (BOOL)continueHandoffForConversationWithEligibility:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  BOOL v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TUCallCenter featureFlags](self, "featureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "conversationHandoffEnabled");

  if (v6)
  {
    -[TUCallCenter conversationManager](self, "conversationManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "joinRequestForApplicableConversationWithHandoffEligibility:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    TUDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        v15 = 138412290;
        v16 = v8;
        _os_log_impl(&dword_19A50D000, v9, OS_LOG_TYPE_DEFAULT, "Handing off conversation to this device using %@", (uint8_t *)&v15, 0xCu);
      }

      v11 = -[TUCallCenter launchAppForJoinRequest:](self, "launchAppForJoinRequest:", v8);
    }
    else
    {
      if (v10)
      {
        -[TUCallCenter conversationManager](self, "conversationManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "activeConversations");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412290;
        v16 = v13;
        _os_log_impl(&dword_19A50D000, v9, OS_LOG_TYPE_DEFAULT, "Cannot continue handoff as could not find conversation with active handoff eligibility, or a conversation was already in non-waiting state. All conversations: %@", (uint8_t *)&v15, 0xCu);

      }
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)supportsJoiningConversationWithRequest:(id)a3
{
  id v3;
  TUFeatureFlags *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  BOOL v8;
  int v9;
  void *v11;

  v3 = a3;
  v4 = objc_alloc_init(TUFeatureFlags);
  if (-[TUFeatureFlags greenTeaLinksEnabled](v4, "greenTeaLinksEnabled"))
  {
    objc_msgSend(v3, "remoteMembers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v5, "count") > 1)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(v3, "conversationLink");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6 != 0;

    }
  }
  else
  {
    v7 = 0;
  }
  if ((objc_msgSend(v3, "isOneToOne") & 1) == 0 && !v7)
  {
    v8 = +[TUConversationManager supportsConversations](TUConversationManager, "supportsConversations");
LABEL_12:
    LOBYTE(v9) = v8;
    goto LABEL_13;
  }
  if (objc_msgSend(v3, "avMode") == 2)
  {
    v8 = +[TUCallCapabilities supportsDisplayingFaceTimeVideoCalls](TUCallCapabilities, "supportsDisplayingFaceTimeVideoCalls");
    goto LABEL_12;
  }
  if (+[TUCallCapabilities supportsDisplayingFaceTimeAudioCalls](TUCallCapabilities, "supportsDisplayingFaceTimeAudioCalls"))
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    objc_msgSend(v3, "provider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v11, "isDefaultProvider") ^ 1;

  }
LABEL_13:

  return v9;
}

- (id)joinConversationWithConversationRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  char v20;
  int v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  char v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t j;
  void *v55;
  void *v56;
  void *v57;
  char v58;
  NSObject *v59;
  char v60;
  id v61;
  NSObject *v62;
  void *v63;
  int v64;
  NSObject *v65;
  NSObject *v66;
  void *v67;
  int v68;
  NSObject *v69;
  TUCallCenter *v72;
  id v73;
  id v74;
  void *v75;
  int v76;
  _QWORD v77[4];
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _QWORD v83[4];
  id v84;
  id v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _BYTE v90[128];
  uint8_t v91[128];
  uint8_t buf[4];
  id v93;
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v93 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "joinConversationWithConversationRequest - request: %@", buf, 0xCu);
  }

  if (+[TUCallCenter supportsJoiningConversationWithRequest:](TUCallCenter, "supportsJoiningConversationWithRequest:", v4))
  {
    objc_msgSend(v4, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "supportsLinks") & 1) != 0)
    {
      objc_msgSend(v4, "conversationLink");
      v7 = objc_claimAutoreleasedReturnValue();
      if (!v7)
      {

LABEL_14:
        -[TUCallCenter conversationManager](self, "conversationManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "remoteMembers");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "conversationLink");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "activeConversationWithRemoteMembers:andLink:", v13, v14);
        v10 = objc_claimAutoreleasedReturnValue();

        goto LABEL_15;
      }
      v8 = (void *)v7;
      v9 = objc_msgSend(v4, "isJoiningConversationWithLink");

      if (v9)
        goto LABEL_14;
    }
    else
    {

    }
    -[TUCallCenter conversationManager](self, "conversationManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "conversationLink");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pendingConversationWithLink:", v13);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_15:

    objc_msgSend(v4, "provider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "supportsLinks");

    -[TUCallCenter callFilterController](self, "callFilterController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v16 && v10)
    {
      v19 = 1;
      v20 = objc_msgSend(v17, "shouldRestrictConversation:performSynchronously:", v10, 1);

      if ((v20 & 1) == 0)
        goto LABEL_23;
    }
    else
    {
      v19 = 1;
      v21 = objc_msgSend(v17, "shouldRestrictJoinConversationRequest:performSynchronously:", v4, 1);

      if (!v21)
        goto LABEL_23;
    }
    TUDefaultLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19A50D000, v22, OS_LOG_TYPE_DEFAULT, "Not joining conversation because Screen Time has restricted this join request", buf, 2u);
    }

    v19 = 0;
LABEL_23:
    v76 = v19;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    objc_msgSend(v4, "remoteMembers");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v86, v91, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v87;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v87 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(*(id *)(*((_QWORD *)&v86 + 1) + 8 * i), "handle");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v29);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v86, v91, 16);
      }
      while (v26);
    }

    v30 = MEMORY[0x1E0C809B0];
    v83[0] = MEMORY[0x1E0C809B0];
    v83[1] = 3221225472;
    v83[2] = __56__TUCallCenter_joinConversationWithConversationRequest___block_invoke;
    v83[3] = &unk_1E38A4758;
    v31 = v4;
    v84 = v31;
    v32 = v23;
    v85 = v32;
    -[TUCallCenter callPassingTest:](self, "callPassingTest:", v83);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      TUDefaultLog();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v93 = v33;
        _os_log_impl(&dword_19A50D000, v34, OS_LOG_TYPE_DEFAULT, "Found a matching call with staging area for join request: %@", buf, 0xCu);
      }

      objc_msgSend(v33, "uniqueProxyIdentifierUUID");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setUUID:", v35);

    }
    objc_msgSend(v31, "provider");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "supportsAVMode:", 2);

    if ((v37 & 1) == 0)
    {
      TUDefaultLog();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19A50D000, v38, OS_LOG_TYPE_DEFAULT, "Conversation provider does not support video, setting wantsStagingArea to NO", buf, 2u);
      }

      objc_msgSend(v31, "setWantsStagingArea:", 0);
    }
    if (objc_msgSend(v31, "sendToScreening"))
    {
      objc_msgSend(v31, "conversationLink");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
      {
        TUDefaultLog();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19A50D000, v40, OS_LOG_TYPE_DEFAULT, "Cannot screen a conversation that contains a link", buf, 2u);
        }

        v76 = 0;
      }
    }
    objc_msgSend(v31, "provider");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v33;
    if ((objc_msgSend(v41, "supportsLinks") & 1) != 0)
    {
      objc_msgSend(v31, "conversationLink");
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      if (v42)
      {
        v73 = v32;
        v74 = v4;
        TUDefaultLog();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v31, "conversationLink");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v93 = v44;
          _os_log_impl(&dword_19A50D000, v43, OS_LOG_TYPE_DEFAULT, "Bypassing checks for remote members, join request has conversation link: %@", buf, 0xCu);

        }
        -[TUCallCenter conversationManager](self, "conversationManager");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "activeConversations");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "count");

        if (!v47)
        {
          if (v76)
            goto LABEL_80;
          goto LABEL_89;
        }
        v48 = v10;
        v81 = 0u;
        v82 = 0u;
        v79 = 0u;
        v80 = 0u;
        v72 = self;
        -[TUCallCenter conversationManager](self, "conversationManager");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "activeConversations");
        v50 = (id)objc_claimAutoreleasedReturnValue();

        v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v79, v90, 16);
        if (v51)
        {
          v52 = v51;
          v53 = *(_QWORD *)v80;
          while (2)
          {
            for (j = 0; j != v52; ++j)
            {
              if (*(_QWORD *)v80 != v53)
                objc_enumerationMutation(v50);
              v55 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * j);
              objc_msgSend(v55, "link");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "conversationLink");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v56, "isEquivalentToConversationLink:", v57)
                && objc_msgSend(v55, "state") == 3)
              {
                v58 = -[NSObject isPendingConversation](v48, "isPendingConversation");

                if ((v58 & 1) == 0)
                {
                  TUDefaultLog();
                  v69 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v93 = v55;
                    _os_log_impl(&dword_19A50D000, v69, OS_LOG_TYPE_DEFAULT, "Join request is asking to join a link that matches the currently-joined conversation, proceeding back to that conversation: %@", buf, 0xCu);
                  }

                  v11 = 0;
                  v10 = v48;
                  v32 = v73;
                  v4 = v74;
                  goto LABEL_93;
                }
              }
              else
              {

              }
            }
            v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v79, v90, 16);
            if (v52)
              continue;
            break;
          }
        }

        v10 = v48;
        v32 = v73;
        v4 = v74;
        self = v72;
LABEL_79:
        if ((v76 & 1) != 0)
        {
LABEL_80:
          if (objc_msgSend(v31, "avMode")
            || (-[TUCallCenter featureFlags](self, "featureFlags"),
                v67 = (void *)objc_claimAutoreleasedReturnValue(),
                v68 = objc_msgSend(v67, "avLessSharePlayEnabled"),
                v67,
                !v68))
          {
            -[TUCallCenter callServicesInterface](self, "callServicesInterface");
            v50 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "joinConversationWithRequest:", v31);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            -[TUCallCenter conversationManager](self, "conversationManager");
            v50 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "joinConversationWithRequest:", v31);
            v11 = 0;
          }
LABEL_93:

          goto LABEL_94;
        }
LABEL_89:
        v11 = 0;
LABEL_94:

        goto LABEL_95;
      }
    }
    else
    {

    }
    objc_msgSend(v31, "remoteMembers");
    v59 = objc_claimAutoreleasedReturnValue();
    if (!-[NSObject count](v59, "count"))
    {
      v60 = objc_msgSend(v31, "prefersAddingRemoteMembersAfterHandoff");

      if ((v60 & 1) != 0)
      {
LABEL_68:
        v77[0] = v30;
        v77[1] = 3221225472;
        v77[2] = __56__TUCallCenter_joinConversationWithConversationRequest___block_invoke_174;
        v77[3] = &unk_1E38A2428;
        v61 = v31;
        v78 = v61;
        if (-[TUCallCenter anyCallPassesTest:](self, "anyCallPassesTest:", v77))
        {
          TUDefaultLog();
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
            -[TUCallCenter joinConversationWithConversationRequest:].cold.2();

          LOBYTE(v76) = 0;
        }
        -[TUCallCenter callMatchingConversationRequest:](self, "callMatchingConversationRequest:", v61);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        if (v63 && objc_msgSend(v61, "avMode"))
        {
          v64 = objc_msgSend(v63, "status");
          TUDefaultLog();
          v65 = objc_claimAutoreleasedReturnValue();
          v66 = v65;
          if (v64 == 4)
          {
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19A50D000, v66, OS_LOG_TYPE_DEFAULT, "Identical call for this request exists and is ringing, answering it", buf, 2u);
            }

            -[TUCallCenter holdAndAnswerIfNeeded:](self, "holdAndAnswerIfNeeded:", v63);
          }
          else
          {
            if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
              -[TUCallCenter joinConversationWithConversationRequest:].cold.1();

          }
          v11 = 0;
          v50 = v78;
          goto LABEL_93;
        }

        goto LABEL_79;
      }
      TUDefaultLog();
      v59 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        -[TUCallCenter joinConversationWithConversationRequest:].cold.3();
      LOBYTE(v76) = 0;
    }

    goto LABEL_68;
  }
  TUDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19A50D000, v10, OS_LOG_TYPE_DEFAULT, "[WARN] Device does not support multiway", buf, 2u);
  }
  v11 = 0;
LABEL_95:

  return v11;
}

uint64_t __56__TUCallCenter_joinConversationWithConversationRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  if (objc_msgSend(v3, "isConversation") && objc_msgSend(v3, "wantsStagingArea"))
  {
    objc_msgSend(v3, "remoteParticipantHandles");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");
    objc_msgSend(*(id *)(a1 + 32), "remoteMembers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == objc_msgSend(v6, "count"))
    {
      objc_msgSend(v3, "remoteParticipantHandles");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isSubsetOfSet:", *(_QWORD *)(a1 + 40));

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __56__TUCallCenter_joinConversationWithConversationRequest___block_invoke_174(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  if (objc_msgSend(v3, "status") == 3)
  {
    objc_msgSend(v3, "uniqueProxyIdentifierUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqual:", v5) & 1) != 0)
    {
      v6 = 0;
    }
    else if ((objc_msgSend(v3, "isHostedOnCurrentDevice") & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      v6 = objc_msgSend(v3, "isEndpointOnCurrentDevice");
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)callMatchingConversationRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v4, "remoteMembers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v10), "handle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __48__TUCallCenter_callMatchingConversationRequest___block_invoke;
  v16[3] = &unk_1E38A4758;
  v17 = v4;
  v18 = v5;
  v12 = v5;
  v13 = v4;
  -[TUCallCenter callPassingTest:](self, "callPassingTest:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

uint64_t __48__TUCallCenter_callMatchingConversationRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  if (objc_msgSend(v3, "status") == 3 || !objc_msgSend(v3, "isConversation"))
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v3, "remoteParticipantHandles");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");
    objc_msgSend(*(id *)(a1 + 32), "remoteMembers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == objc_msgSend(v6, "count"))
    {
      objc_msgSend(v3, "remoteParticipantHandles");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToSet:", *(_QWORD *)(a1 + 40));

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (void)enteredForegroundForCall:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "for call %@", (uint8_t *)&v8, 0xCu);
  }

  -[TUCallCenter callServicesInterface](self, "callServicesInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueProxyIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enteredForegroundForCallWithUniqueProxyIdentifier:", v7);

}

- (void)willEnterBackgroundForAllCalls
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "", v5, 2u);
  }

  -[TUCallCenter callServicesInterface](self, "callServicesInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "willEnterBackgroundForAllCalls");

}

- (void)enteredBackgroundForAllCalls
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "", v5, 2u);
  }

  -[TUCallCenter callServicesInterface](self, "callServicesInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enteredBackgroundForAllCalls");

}

- (id)callForConversationWithGroupUUID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__TUCallCenter_callForConversationWithGroupUUID___block_invoke;
  v9[3] = &unk_1E38A2428;
  v10 = v4;
  v5 = v4;
  -[TUCallCenter callsPassingTest:](self, "callsPassingTest:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __49__TUCallCenter_callForConversationWithGroupUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "callGroupUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)activeConversationForCall:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[TUCallCenter activeConversationForCall:backedByGroupSession:](self, "activeConversationForCall:backedByGroupSession:", v4, objc_msgSend(v4, "isConversation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)activeConversationForCall:(id)a3 backedByGroupSession:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (!v4)
    goto LABEL_4;
  objc_msgSend(v6, "callGroupUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_4;
  -[TUCallCenter conversationManager](self, "conversationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "callGroupUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activeConversationWithGroupUUID:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
LABEL_4:
    -[TUCallCenter conversationManager](self, "conversationManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[TUConversationManager remoteMembersForCall:](TUConversationManager, "remoteMembersForCall:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "activeConversationWithRemoteMembers:andLink:matchingVideo:backedByGroupSession:", v13, 0, objc_msgSend(v7, "isVideo"), v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 && !v11)
    {
      -[TUCallCenter conversationManager](self, "conversationManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "activeConversationWithLinkForCall:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v11;
}

- (void)shouldSuppressInCallStatusBar:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    if (v3)
      v6 = CFSTR("YES");
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "TUCallCenter shouldSuppressInCallStatusBar: %@", (uint8_t *)&v8, 0xCu);
  }

  -[TUCallCenter callServicesInterface](self, "callServicesInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "shouldSuppressInCallStatusBar:", v3);

}

- (void)shouldAllowRingingCallStatusIndicator:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    if (v3)
      v6 = CFSTR("YES");
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "TUCallCenter shouldAllowRingingCallStatusIndicator: %@", (uint8_t *)&v8, 0xCu);
  }

  -[TUCallCenter callServicesInterface](self, "callServicesInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "shouldAllowRingingCallStatusIndicator:", v3);

}

- (void)sendUserScoreToRTCReporting:(id)a3 withScore:(int)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  int v10;
  id v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v4 = *(_QWORD *)&a4;
  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_msgSend(v6, "length");
  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      v10 = 138412546;
      v11 = v6;
      v12 = 1024;
      v13 = v4;
      _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "TUCallCenter: sendUserScoreToRTCReporting: %@ for score: %d", (uint8_t *)&v10, 0x12u);
    }

    -[TUCallCenter callServicesInterface](self, "callServicesInterface");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject sendUserScoreToRTCReporting:withScore:](v8, "sendUserScoreToRTCReporting:withScore:", v6, v4);
  }
  else if (v9)
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "sendUserScoreToRTCReporting: NULL UUID", (uint8_t *)&v10, 2u);
  }

}

- (void)handleMediaRemoteCommand:(unsigned int)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  unsigned int v12;
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  -[TUCallCenter queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__TUCallCenter_handleMediaRemoteCommand_completion___block_invoke;
  v9[3] = &unk_1E38A4780;
  objc_copyWeak(&v11, &location);
  v10 = v6;
  v12 = a3;
  v8 = v6;
  dispatch_async(v7, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __52__TUCallCenter_handleMediaRemoteCommand_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  __int16 v11;
  __int16 v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "callContainer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "screeningCall");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v3, "uiDataSource");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(v3, "uiDataSource");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "shouldHostHandleMRCommand:completion:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 32));

        goto LABEL_11;
      }
      TUDefaultLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 0;
        v9 = "Not handling media remote command because data source is nil";
        v10 = (uint8_t *)&v11;
        goto LABEL_9;
      }
    }
    else
    {
      TUDefaultLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 0;
        v9 = "Not handling media remote command because there is no screening call active";
        v10 = (uint8_t *)&v12;
LABEL_9:
        _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
      }
    }

    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
  }
LABEL_11:

}

- (void)handleMediaRemoteCommand:(unsigned int)a3 sourceIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unsigned int v16;

  v8 = a4;
  v9 = a5;
  -[TUCallCenter queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__TUCallCenter_handleMediaRemoteCommand_sourceIdentifier_completion___block_invoke;
  v13[3] = &unk_1E38A47A8;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v13[4] = self;
  v11 = v8;
  v12 = v9;
  dispatch_async(v10, v13);

}

void __69__TUCallCenter_handleMediaRemoteCommand_sourceIdentifier_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  id v8;
  uint8_t buf[2];
  __int16 v10;

  objc_msgSend(*(id *)(a1 + 32), "callContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "screeningCall");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "uiDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "uiDataSource");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "shouldHostHandleMRCommand:sourceIdentifier:completion:", *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

      return;
    }
    TUDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v6 = "Not handling media remote command because data source is nil";
      v7 = buf;
      goto LABEL_8;
    }
  }
  else
  {
    TUDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 0;
      v6 = "Not handling media remote command because there is no screening call active";
      v7 = (uint8_t *)&v10;
LABEL_8:
      _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)handleRedialCommandWhileScreening:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TUCallCenter queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__TUCallCenter_handleRedialCommandWhileScreening___block_invoke;
  v7[3] = &unk_1E38A1388;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __50__TUCallCenter_handleRedialCommandWhileScreening___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  id v8;
  uint8_t buf[2];
  __int16 v10;

  objc_msgSend(*(id *)(a1 + 32), "callContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "screeningCall");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "uiDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "uiDataSource");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleRedialCommandWhileScreening:", *(_QWORD *)(a1 + 40));

      return;
    }
    TUDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v6 = "No UI data source, dropping dial request for redial";
      v7 = buf;
      goto LABEL_8;
    }
  }
  else
  {
    TUDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 0;
      v6 = "Not handling redial because there is no call in screening";
      v7 = (uint8_t *)&v10;
LABEL_8:
      _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    }
  }

}

- (BOOL)isSwappable
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[TUCallCenter displayedCalls](self, "displayedCalls");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsHolding");

  return v5;
}

- (BOOL)isMergeable
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[TUCallCenter displayedCalls](self, "displayedCalls");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsGrouping");

  return v5;
}

- (BOOL)isHoldAllowed
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[TUCallCenter displayedCalls](self, "displayedCalls");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsHolding");

  return v5;
}

- (BOOL)isTakingCallsPrivateAllowed
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[TUCallCenter displayedCalls](self, "displayedCalls");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsUngrouping");

  return v5;
}

- (BOOL)isHardPauseAvailable
{
  return 1;
}

- (BOOL)isSendToVoicemailAllowed
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[TUCallCenter displayedCalls](self, "displayedCalls");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsSendingToVoicemail");

  return v5;
}

- (BOOL)canMergeCalls
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;

  if (!-[TUCallCenter isMergeable](self, "isMergeable"))
    return 0;
  -[TUCallCenter displayedCalls](self, "displayedCalls");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 2)
  {
    -[TUCallCenter displayedCalls](self, "displayedCalls");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "status") == 2)
    {
      v6 = 1;
    }
    else
    {
      -[TUCallCenter displayedCalls](self, "displayedCalls");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndex:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v8, "status") == 2;

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isAddCallAllowed
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  unint64_t v8;
  void *v9;

  -[TUCallCenter currentCallGroups](self, "currentCallGroups");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calls");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v2, "count") == 1 && objc_msgSend(v5, "status") != 3)
  {
    objc_msgSend(v5, "provider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "maximumCallGroups");
    if (v8 > 1
      || (objc_msgSend(v5, "model"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v4, "supportsHolding")))
    {
      objc_msgSend(v5, "model");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "supportsAddCall"))
      {
        v6 = objc_msgSend(v5, "isEmergency") ^ 1;

        if (v8 >= 2)
          goto LABEL_13;
      }
      else
      {

        LOBYTE(v6) = 0;
        if (v8 > 1)
          goto LABEL_13;
      }
    }
    else
    {
      LOBYTE(v6) = 0;
    }

LABEL_13:
    goto LABEL_14;
  }
  LOBYTE(v6) = 0;
LABEL_14:

  return v6;
}

- (BOOL)isAmbiguous
{
  return -[TUCallCenter countOfCallsPassingTest:](self, "countOfCallsPassingTest:", &__block_literal_global_175) > 1;
}

uint64_t __27__TUCallCenter_isAmbiguous__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = a2;
  if (objc_msgSend(v2, "status") == 4)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "model");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "supportsUnambiguousMultiPartyState") ^ 1;

  }
  return v3;
}

- (BOOL)isEndAndAnswerAllowed
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;

  -[TUCallCenter incomingCall](self, "incomingCall");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallCenter audioOrVideoCallWithStatus:](self, "audioOrVideoCallWithStatus:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[TUCallCenter audioOrVideoCallWithStatus:](self, "audioOrVideoCallWithStatus:", 2);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  objc_msgSend(v3, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "supportsUnambiguousMultiPartyState") & 1) != 0)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    objc_msgSend(v7, "model");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "supportsUnambiguousMultiPartyState") & 1) != 0)
    {
      LOBYTE(v9) = 1;
    }
    else
    {
      objc_msgSend(v3, "provider");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "provider");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v11, "isEqualToCallProvider:", v12) ^ 1;

    }
  }

  return v9;
}

- (BOOL)isHoldAndAnswerAllowed
{
  __CFString *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  int v17;
  int v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  _BOOL4 v24;
  void *v25;
  int v26;
  NSObject *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  BOOL v34;
  int v35;
  char v36;
  void *v38;
  void *v39;
  char v40;
  uint8_t buf[4];
  const __CFString *v42;
  __int16 v43;
  const __CFString *v44;
  __int16 v45;
  const __CFString *v46;
  __int16 v47;
  const __CFString *v48;
  __int16 v49;
  const __CFString *v50;
  __int16 v51;
  const __CFString *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  -[TUCallCenter incomingCall](self, "incomingCall");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[TUCallCenter callWithStatus:](self, "callWithStatus:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[TUCallCenter callWithStatus:](self, "callWithStatus:", 2);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v42 = v3;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "isHoldAndAnswerAllowed: incomingCall: %@", buf, 0xCu);
  }

  TUDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v42 = v7;
    _os_log_impl(&dword_19A50D000, v9, OS_LOG_TYPE_DEFAULT, "isHoldAndAnswerAllowed: currentCall: %@", buf, 0xCu);
  }

  -[__CFString provider](v7, "provider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString provider](v3, "provider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "isEqualToString:", v13);

  if (v14)
  {
    -[__CFString provider](v7, "provider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v15, "maximumCallGroups") <= 1)
      v16 = -[__CFString isHostedOnCurrentDevice](v7, "isHostedOnCurrentDevice") ^ 1;
    else
      v16 = 1;
  }
  else
  {
    -[__CFString model](v7, "model");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "supportsHolding");
  }

  v17 = -[__CFString isHostedOnCurrentDevice](v3, "isHostedOnCurrentDevice");
  v18 = -[__CFString isHostedOnCurrentDevice](v7, "isHostedOnCurrentDevice");
  if ((-[__CFString supportsSimultaneousVoiceAndData](v7, "supportsSimultaneousVoiceAndData") & 1) != 0)
  {
    v19 = 0;
    goto LABEL_24;
  }
  -[__CFString provider](v3, "provider");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "isTelephonyProvider")
    && -[__CFString isUsingBaseband](v3, "isUsingBaseband"))
  {
    -[__CFString provider](v7, "provider");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 1;
    v19 = 1;
    if (!objc_msgSend(v39, "isTelephonyProvider"))
      goto LABEL_22;
  }
  else
  {
    v21 = 0;
  }
  -[__CFString provider](v3, "provider");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v22, "isTelephonyProvider") & 1) == 0)
  {
    v40 = v21;
    -[__CFString provider](v7, "provider");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v38, "isTelephonyProvider"))
    {
      v19 = -[__CFString isUsingBaseband](v7, "isUsingBaseband");

    }
    else
    {

      v19 = 0;
    }
    if ((v40 & 1) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }

  v19 = 0;
  if (v21)
LABEL_22:

LABEL_23:
LABEL_24:
  v23 = v17 ^ v18;
  v24 = -[TUCallCenter anyCallPassesTest:](self, "anyCallPassesTest:", &__block_literal_global_176);
  -[TUCallCenter callWithStatus:](self, "callWithStatus:", 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = -[__CFString isScreening](v7, "isScreening");
  TUDefaultLog();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = CFSTR("NO");
    if (v16)
      v29 = CFSTR("YES");
    else
      v29 = CFSTR("NO");
    if (v19)
      v30 = CFSTR("YES");
    else
      v30 = CFSTR("NO");
    *(_DWORD *)buf = 138413570;
    v42 = v29;
    if (v23)
      v31 = CFSTR("YES");
    else
      v31 = CFSTR("NO");
    v43 = 2112;
    v44 = v30;
    if (v24)
      v32 = CFSTR("YES");
    else
      v32 = CFSTR("NO");
    v45 = 2112;
    v46 = v31;
    if (v25)
      v33 = CFSTR("YES");
    else
      v33 = CFSTR("NO");
    v47 = 2112;
    v48 = v32;
    if (v26)
      v28 = CFSTR("YES");
    v49 = 2112;
    v50 = v33;
    v51 = 2112;
    v52 = v28;
    _os_log_impl(&dword_19A50D000, v27, OS_LOG_TYPE_DEFAULT, "isHoldAndAnswerAllowed: callsSupportHoldAndAnswer: %@, callsMixCDMAAndNonCDMA: %@, callsMixHostedAndNonHosted: %@, anyCallIsRTTOrTTY: %@, anyCallIsSending: %@, callIsScreening: %@", buf, 0x3Eu);
  }

  if (v7)
    v34 = v3 == 0;
  else
    v34 = 1;
  v35 = v16 ^ 1;
  if (v34)
    v35 = 1;
  if (((v35 | v19 | v23 | v24) & 1) != 0)
  {
    v36 = 0;
  }
  else if (v25)
  {
    v36 = 0;
  }
  else
  {
    v36 = v26 ^ 1;
  }

  return v36;
}

uint64_t __38__TUCallCenter_isHoldAndAnswerAllowed__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "isEndpointOnCurrentDevice"))
    v3 = objc_msgSend(v2, "isTTY");
  else
    v3 = 0;

  return v3;
}

- (BOOL)canGroupCall:(id)a3 withCall:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v19;
  void *v20;

  v6 = a3;
  v7 = a4;
  if (v6 == v7)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v6, "callGroupUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "callGroupUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqual:", v9) & 1) != 0)
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend(v6, "model");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "supportsGrouping"))
      {
        objc_msgSend(v7, "model");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "supportsGrouping"))
        {
          objc_msgSend(v6, "provider");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "provider");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "isEqualToString:", v15))
          {
            v16 = -[TUCallCenter _callGroupCountForCall:withCall:](self, "_callGroupCountForCall:withCall:", v6, v7);
            objc_msgSend(v6, "provider");
            v19 = v13;
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = v16 <= objc_msgSend(v17, "maximumCallsPerCallGroup");

            v13 = v19;
          }
          else
          {
            v10 = 0;
          }

        }
        else
        {
          v10 = 0;
        }

      }
      else
      {
        v10 = 0;
      }

    }
  }

  return v10;
}

- (unint64_t)_callGroupCountForCall:(id)a3 withCall:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "callGroupUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "callGroupUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUCallCenter callsWithGroupUUID:](self, "callsWithGroupUUID:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

  }
  else
  {
    v11 = 1;
  }

  objc_msgSend(v7, "callGroupUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v7, "callGroupUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUCallCenter callsWithGroupUUID:](self, "callsWithGroupUUID:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

  }
  else
  {
    v15 = 1;
  }

  return v15 + v11;
}

- (void)createSplitSessionWithDeviceMediaRouteIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  TUNearbyDeviceHandle *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id location;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  v7 = a4;
  -[TUCallCenter featureFlags](self, "featureFlags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "expanseEnabled");

  if ((v9 & 1) != 0)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__14;
    v26 = __Block_byref_object_dispose__14;
    v27 = 0;
    -[TUCallCenter conversationManager](self, "conversationManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activeConversations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __76__TUCallCenter_createSplitSessionWithDeviceMediaRouteIdentifier_completion___block_invoke;
    v21[3] = &unk_1E38A4810;
    v21[4] = &v22;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v21);

    if (v23[5])
    {
      v13 = -[TUNearbyDeviceHandle initWithType:identifier:name:]([TUNearbyDeviceHandle alloc], "initWithType:identifier:name:", 1, v6, 0);
      objc_initWeak(&location, self);
      -[TUCallCenter neighborhoodActivityConduit](self, "neighborhoodActivityConduit");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v23[5], "UUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v12;
      v17[1] = 3221225472;
      v17[2] = __76__TUCallCenter_createSplitSessionWithDeviceMediaRouteIdentifier_completion___block_invoke_2;
      v17[3] = &unk_1E38A4838;
      v18 = v7;
      objc_copyWeak(&v19, &location);
      objc_msgSend(v14, "inviteTVDevice:toConversation:completion:", v13, v15, v17);

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
    else
    {
      -[TUCallCenter _splitSessionErrorWithCode:underlyingError:](self, "_splitSessionErrorWithCode:underlyingError:", -100, 0);
      v13 = (TUNearbyDeviceHandle *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, TUNearbyDeviceHandle *))v7 + 2))(v7, 0, v13);
    }

    _Block_object_dispose(&v22, 8);
  }
  else
  {
    -[TUCallCenter _splitSessionErrorWithCode:underlyingError:](self, "_splitSessionErrorWithCode:underlyingError:", -2, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v16);

  }
}

void __76__TUCallCenter_createSplitSessionWithDeviceMediaRouteIdentifier_completion___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "state") == 3)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

void __76__TUCallCenter_createSplitSessionWithDeviceMediaRouteIdentifier_completion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id WeakRetained;
  void *v6;
  id v7;

  v7 = a3;
  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_splitSessionErrorWithCode:underlyingError:", -200, v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)disconnectDeviceFromSplitSessionUsingMediaRouteIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  TUNearbyDeviceHandle *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = -[TUNearbyDeviceHandle initWithType:identifier:name:]([TUNearbyDeviceHandle alloc], "initWithType:identifier:name:", 1, v6, 0);
  objc_initWeak(&location, self);
  -[TUCallCenter neighborhoodActivityConduit](self, "neighborhoodActivityConduit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __85__TUCallCenter_disconnectDeviceFromSplitSessionUsingMediaRouteIdentifier_completion___block_invoke;
  v11[3] = &unk_1E38A4838;
  v10 = v7;
  v12 = v10;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v9, "disconnectTVDevice:completion:", v8, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __85__TUCallCenter_disconnectDeviceFromSplitSessionUsingMediaRouteIdentifier_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id WeakRetained;
  void *v6;
  id v7;

  v7 = a3;
  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_splitSessionErrorWithCode:underlyingError:", -201, v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (id)_splitSessionErrorWithCode:(int64_t)a3 underlyingError:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = v5;
  if (v5)
  {
    v10 = *MEMORY[0x1E0CB3388];
    v11[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TUSplitSessionErrorDomain"), a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)registerAnonymousXPCEndpoint:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TUCallCenter callServicesInterface](self, "callServicesInterface");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerAnonymousXPCEndpoint:", v4);

}

- (void)fetchAnonymousXPCEndpoint:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TUCallCenter callServicesInterface](self, "callServicesInterface");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchAnonymousXPCEndpoint:", v4);

}

- (void)performRecordingRequest:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[TUCallCenter featureFlags](self, "featureFlags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "callRecordingEnabled");

  if (v9)
  {
    -[TUCallCenter callServicesInterface](self, "callServicesInterface");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "performRecordingRequest:completion:", v6, v7);
  }
  else
  {
    TUDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[TUCallCenter performRecordingRequest:completion:].cold.1();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TUStartRecordingErrorDomain"), 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v10);
  }

}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[TUCallCenter delegateController](self, "delegateController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addDelegate:queue:", v7, v6);

}

- (void)removeDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TUCallCenter delegateController](self, "delegateController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeDelegate:", v4);

}

- (void)_handleReceivedCallDTMFUpdate:(id)a3 forCall:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[TUCallCenter delegateController](self, "delegateController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__TUCallCenter__handleReceivedCallDTMFUpdate_forCall___block_invoke;
  v11[3] = &unk_1E38A4860;
  v11[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "enumerateDelegatesUsingBlock:", v11);

}

void __54__TUCallCenter__handleReceivedCallDTMFUpdate_forCall___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __54__TUCallCenter__handleReceivedCallDTMFUpdate_forCall___block_invoke_2;
    v10[3] = &unk_1E38A1B38;
    v7 = v5;
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(a1 + 40);
    v11 = v7;
    v12 = v8;
    v13 = v9;
    v14 = *(id *)(a1 + 48);
    dispatch_async(v6, v10);

  }
}

uint64_t __54__TUCallCenter__handleReceivedCallDTMFUpdate_forCall___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "callCenter:reportedCall:receivedDTMFUpdate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (void)setProviderManager:(id)a3
{
  objc_storeStrong((id *)&self->_providerManager, a3);
}

- (void)setConversationManager:(id)a3
{
  objc_storeStrong((id *)&self->_conversationManager, a3);
}

- (TUCallCenterDelegate)delegateController
{
  return self->_delegateController;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void)setCallServicesInterface:(id)a3
{
  objc_storeStrong((id *)&self->_callServicesInterface, a3);
}

- (void)setAudioDeviceController:(id)a3
{
  objc_storeStrong((id *)&self->_audioDeviceController, a3);
}

- (void)setVideoDeviceController:(id)a3
{
  objc_storeStrong((id *)&self->_videoDeviceController, a3);
}

- (void)setRouteController:(id)a3
{
  objc_storeStrong((id *)&self->_routeController, a3);
}

- (void)setPairedHostDeviceRouteController:(id)a3
{
  objc_storeStrong((id *)&self->_pairedHostDeviceRouteController, a3);
}

- (void)setCallFilterController:(id)a3
{
  objc_storeStrong((id *)&self->_callFilterController, a3);
}

- (void)setNeighborhoodActivityConduit:(id)a3
{
  objc_storeStrong((id *)&self->_neighborhoodActivityConduit, a3);
}

- (CGSize)localLandscapeAspectRatio
{
  double width;
  double height;
  CGSize result;

  width = self->_localLandscapeAspectRatio.width;
  height = self->_localLandscapeAspectRatio.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLocalLandscapeAspectRatio:(CGSize)a3
{
  self->_localLandscapeAspectRatio = a3;
}

- (CGSize)localPortraitAspectRatio
{
  double width;
  double height;
  CGSize result;

  width = self->_localPortraitAspectRatio.width;
  height = self->_localPortraitAspectRatio.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLocalPortraitAspectRatio:(CGSize)a3
{
  self->_localPortraitAspectRatio = a3;
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (id)disconnectCallPreflight
{
  return self->_disconnectCallPreflight;
}

- (void)setDisconnectCallPreflight:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (FBSDisplayLayoutMonitor)monitor
{
  return self->_monitor;
}

- (id)launchAppForJoinRequestBlock
{
  return self->_launchAppForJoinRequestBlock;
}

- (void)setLaunchAppForJoinRequestBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (id)isOnenessActiveBlock
{
  return self->_isOnenessActiveBlock;
}

- (void)setIsOnenessActiveBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (TUUIDataSource)uiDataSource
{
  return self->_uiDataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiDataSource, 0);
  objc_storeStrong(&self->_isOnenessActiveBlock, 0);
  objc_storeStrong(&self->_launchAppForJoinRequestBlock, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong(&self->_disconnectCallPreflight, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_neighborhoodActivityConduit, 0);
  objc_storeStrong((id *)&self->_callFilterController, 0);
  objc_storeStrong((id *)&self->_pairedHostDeviceRouteController, 0);
  objc_storeStrong((id *)&self->_routeController, 0);
  objc_storeStrong((id *)&self->_videoDeviceController, 0);
  objc_storeStrong((id *)&self->_audioDeviceController, 0);
  objc_storeStrong((id *)&self->_callServicesInterface, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_delegateController, 0);
  objc_storeStrong((id *)&self->_conversationManager, 0);
  objc_storeStrong((id *)&self->_providerManager, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

void __38__TUCallCenter_fetchTUUIXPCDataSource__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_19A50D000, a2, OS_LOG_TYPE_ERROR, "Unable to fetch UIDataSource endpoint due to error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)dialWithRequest:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_19A50D000, v0, v1, "Dial attempt is returning a nil call", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)answerOrJoinCall:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_19A50D000, v0, v1, "Not joining call since call is disconnecting/disconnected", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void __34__TUCallCenter_answerWithRequest___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138412546;
  v5 = v2;
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_19A50D000, a2, OS_LOG_TYPE_ERROR, "Encountered error while opening answer URL: %@ for call: %@", (uint8_t *)&v4, 0x16u);
}

- (void)joinConversationWithConversationRequest:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_19A50D000, v0, v1, "Identical call for this request exists and isn't ringing, not creating a new call", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)joinConversationWithConversationRequest:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_19A50D000, v0, v1, "Cannot launch join request, another sending call already exists", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)joinConversationWithConversationRequest:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_19A50D000, v0, v1, "No remote members found for join request", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)performRecordingRequest:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_19A50D000, v0, v1, "Call Recording feature flag is not enabled, cannot perform recording request", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

@end
