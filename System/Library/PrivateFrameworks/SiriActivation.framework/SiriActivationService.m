@implementation SiriActivationService

+ (id)service
{
  if (service_onceToken != -1)
    dispatch_once(&service_onceToken, &__block_literal_global_5);
  return (id)service_sharedService;
}

void __32__SiriActivationService_service__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[SiriActivationService _init]([SiriActivationService alloc], "_init");
  v1 = (void *)service_sharedService;
  service_sharedService = (uint64_t)v0;

}

- (id)_init
{
  SiriActivationService *v2;
  id v3;
  id v4;
  SASHeater *v5;
  void *v6;
  id v7;
  void *v8;
  SASTestingInputController *v9;
  SASTestingInputController *testingInputController;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  SASLockStateMonitor *v15;
  void *v16;
  void *v17;
  SASBulletinManager *v18;
  void *v19;
  id v20;
  SASMyriadController *v21;
  SASMyriadController *myriadController;
  SASPresentationManager *v23;
  SASPresentationManager *presentationManager;
  id v25;
  SASBluetoothEndpointUtility *v26;
  SASBluetoothEndpointUtility *bluetoothEndpointUtil;
  SASActivePresentationInstrumentationSender *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  SASActivePresentationInstrumentationSender *activationEventInstrumentationSender;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t, char);
  void *v37;
  id v38;
  id location;
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)SiriActivationService;
  v2 = -[SiriActivationService init](&v40, sel_init);
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[SiriActivationService setSources:](v2, "setSources:", v3);

    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[SiriActivationService setActivationAssertions:](v2, "setActivationAssertions:", v4);

    -[SiriActivationService setXcTestingActive:](v2, "setXcTestingActive:", 0);
    v5 = objc_alloc_init(SASHeater);
    -[SiriActivationService setHeater:](v2, "setHeater:", v5);

    -[SiriActivationService heater](v2, "heater");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", v2);

    -[SiriActivationService setSiriTetherIsAttached:](v2, "setSiriTetherIsAttached:", 0);
    v7 = objc_alloc_init(MEMORY[0x1E0CFEA00]);
    -[SiriActivationService setSiriTether:](v2, "setSiriTether:", v7);

    -[SiriActivationService siriTether](v2, "siriTether");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = MEMORY[0x1E0C809B0];
    v35 = 3221225472;
    v36 = __30__SiriActivationService__init__block_invoke;
    v37 = &unk_1E91FC258;
    objc_copyWeak(&v38, &location);
    objc_msgSend(v8, "setAttachmentStatusChangedHandler:", &v34);

    v9 = objc_alloc_init(SASTestingInputController);
    testingInputController = v2->_testingInputController;
    v2->_testingInputController = v9;

    +[SASRemoteRequestManager manager](SASRemoteRequestManager, "manager", v34, v35, v36, v37);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriActivationService setRemoteRequestManager:](v2, "setRemoteRequestManager:", v11);

    +[SASSystemState sharedSystemState](SASSystemState, "sharedSystemState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriActivationService setSystemState:](v2, "setSystemState:", v12);

    -[SiriActivationService systemState](v2, "systemState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addStateChangeListener:", v2);

    v14 = objc_alloc_init(MEMORY[0x1E0DC5E00]);
    objc_msgSend(v14, "startObserversWithOptions:", 1);
    -[SiriActivationService setAssetUtilities:](v2, "setAssetUtilities:", v14);
    v15 = objc_alloc_init(SASLockStateMonitor);
    -[SiriActivationService setLockStateMonitor:](v2, "setLockStateMonitor:", v15);

    -[SiriActivationService lockStateMonitor](v2, "lockStateMonitor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDelegate:", v2);

    +[SASSystemState sharedSystemState](SASSystemState, "sharedSystemState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "monitorLockState");

    v18 = objc_alloc_init(SASBulletinManager);
    -[SiriActivationService setBulletinManager:](v2, "setBulletinManager:", v18);

    -[SiriActivationService bulletinManager](v2, "bulletinManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDelegate:", v2);

    v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[SiriActivationService setAvExternalButtonEvents:](v2, "setAvExternalButtonEvents:", v20);

    -[SiriActivationService setButtonDownHasOccurredSinceActivation:](v2, "setButtonDownHasOccurredSinceActivation:", 0);
    v21 = -[SASMyriadController initWithDelegate:]([SASMyriadController alloc], "initWithDelegate:", v2);
    myriadController = v2->_myriadController;
    v2->_myriadController = v21;

    v23 = objc_alloc_init(SASPresentationManager);
    presentationManager = v2->_presentationManager;
    v2->_presentationManager = v23;

    -[SASPresentationManager setPresentationManagerDelegate:](v2->_presentationManager, "setPresentationManagerDelegate:", v2);
    v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[SiriActivationService setButtonEventListeners:](v2, "setButtonEventListeners:", v25);

    v26 = objc_alloc_init(SASBluetoothEndpointUtility);
    bluetoothEndpointUtil = v2->_bluetoothEndpointUtil;
    v2->_bluetoothEndpointUtil = v26;

    v28 = [SASActivePresentationInstrumentationSender alloc];
    objc_msgSend(MEMORY[0x1E0D978A0], "sharedAnalytics");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "defaultMessageStream");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[SASActivePresentationInstrumentationSender initWithAnalyticsStream:](v28, "initWithAnalyticsStream:", v30);
    activationEventInstrumentationSender = v2->_activationEventInstrumentationSender;
    v2->_activationEventInstrumentationSender = (SASActivePresentationInstrumentationSender *)v31;

    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __30__SiriActivationService__init__block_invoke(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __30__SiriActivationService__init__block_invoke_2;
  v3[3] = &unk_1E91FC230;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  v5 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(&v4);
}

void __30__SiriActivationService__init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setSiriTetherIsAttached:", *(unsigned __int8 *)(a1 + 40));

}

- (SiriActivationService)init
{

  return 0;
}

+ (id)new
{
  return 0;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SiriActivationService systemState](self, "systemState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeStateChangeListener:", self);

  v4.receiver = self;
  v4.super_class = (Class)SiriActivationService;
  -[SiriActivationService dealloc](&v4, sel_dealloc);
}

- (BOOL)_shouldRejectNewActivations:(int64_t)a3
{
  return -[SASPresentationManager shouldRejectNewActivationsForRequestState:](self->_presentationManager, "shouldRejectNewActivationsForRequestState:", a3);
}

- (int64_t)_requestState
{
  return -[SASPresentationManager requestState](self->_presentationManager, "requestState");
}

- (void)_notifySourcesOfPresentationStateChange:(id)a3
{
  id v4;
  os_log_t *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SASActivePresentationInstrumentationSender aggregatePresentationRequestStateDidChange:](self->_activationEventInstrumentationSender, "aggregatePresentationRequestStateDidChange:", objc_msgSend(v4, "requestState"));
  if (objc_msgSend(v4, "didNewActivationAcceptanceChange"))
  {
    v5 = (os_log_t *)MEMORY[0x1E0CFE6A0];
    v6 = (void *)*MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)MEMORY[0x1E0CB3978];
      v8 = v6;
      objc_msgSend(v7, "currentThread");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v29 = "-[SiriActivationService _notifySourcesOfPresentationStateChange:]";
      v30 = 2048;
      v31 = objc_msgSend(v9, "qualityOfService");
      _os_log_impl(&dword_1D132F000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy sourcesLock about to lock with qos: %zd", buf, 0x16u);

    }
    os_unfair_lock_lock((os_unfair_lock_t)&sourcesLock);
    v10 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v29 = "-[SiriActivationService _notifySourcesOfPresentationStateChange:]";
      _os_log_impl(&dword_1D132F000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy sourcesLock successfully locked", buf, 0xCu);
    }
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[SiriActivationService sources](self, "sources", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allValues");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v16);
          v18 = objc_msgSend(v4, "canAcceptNewActivations") ^ 1;
          objc_msgSend(v17, "connection");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "remoteTarget");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v18);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "activeChangedTo:", v21);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v14);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&sourcesLock);
    v22 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v29 = "-[SiriActivationService _notifySourcesOfPresentationStateChange:]";
      _os_log_impl(&dword_1D132F000, v22, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy sourcesLock unlocked", buf, 0xCu);
    }
  }

}

- (void)_notifyListenersOfButtonDownWithButtonIdentifier:(int64_t)a3 atTimestamp:(double)a4
{
  os_log_t *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[6];
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v8 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)MEMORY[0x1E0CB3978];
    v10 = v8;
    objc_msgSend(v9, "currentThread");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v17 = "-[SiriActivationService _notifyListenersOfButtonDownWithButtonIdentifier:atTimestamp:]";
    v18 = 2048;
    v19 = objc_msgSend(v11, "qualityOfService");
    _os_log_impl(&dword_1D132F000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy buttonEventListenerLock about to lock with qos: %zd", buf, 0x16u);

  }
  os_unfair_lock_lock(&buttonEventListenerLock);
  v12 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[SiriActivationService _notifyListenersOfButtonDownWithButtonIdentifier:atTimestamp:]";
    _os_log_impl(&dword_1D132F000, v12, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy buttonEventListenerLock successfully locked", buf, 0xCu);
  }
  -[SiriActivationService buttonEventListeners](self, "buttonEventListeners");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __86__SiriActivationService__notifyListenersOfButtonDownWithButtonIdentifier_atTimestamp___block_invoke;
  v15[3] = &__block_descriptor_48_e42_v32__0__NSString_8__SASSignalServer_16_B24l;
  *(double *)&v15[4] = a4;
  v15[5] = a3;
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v15);

  os_unfair_lock_unlock(&buttonEventListenerLock);
  v14 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[SiriActivationService _notifyListenersOfButtonDownWithButtonIdentifier:atTimestamp:]";
    _os_log_impl(&dword_1D132F000, v14, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy buttonEventListenerLock unlocked", buf, 0xCu);
  }
}

void __86__SiriActivationService__notifyListenersOfButtonDownWithButtonIdentifier_atTimestamp___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  SASTimeIntervalTransport *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  objc_msgSend(v5, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteTarget");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = -[SASTimeIntervalTransport initWithTimeInterval:]([SASTimeIntervalTransport alloc], "initWithTimeInterval:", *(double *)(a1 + 32));
    objc_msgSend(v5, "connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "remoteTarget");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "buttonDownWithButtonIdentifier:forListenerIdentifier:atTimestamp:", v12, v13, v9);

  }
}

- (void)_notifyListenersOfButtonUpWithButtonIdentifier:(int64_t)a3 atTimestamp:(double)a4
{
  os_log_t *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[6];
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v8 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)MEMORY[0x1E0CB3978];
    v10 = v8;
    objc_msgSend(v9, "currentThread");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v17 = "-[SiriActivationService _notifyListenersOfButtonUpWithButtonIdentifier:atTimestamp:]";
    v18 = 2048;
    v19 = objc_msgSend(v11, "qualityOfService");
    _os_log_impl(&dword_1D132F000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy buttonEventListenerLock about to lock with qos: %zd", buf, 0x16u);

  }
  os_unfair_lock_lock(&buttonEventListenerLock);
  v12 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[SiriActivationService _notifyListenersOfButtonUpWithButtonIdentifier:atTimestamp:]";
    _os_log_impl(&dword_1D132F000, v12, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy buttonEventListenerLock successfully locked", buf, 0xCu);
  }
  -[SiriActivationService buttonEventListeners](self, "buttonEventListeners");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __84__SiriActivationService__notifyListenersOfButtonUpWithButtonIdentifier_atTimestamp___block_invoke;
  v15[3] = &__block_descriptor_48_e42_v32__0__NSString_8__SASSignalServer_16_B24l;
  *(double *)&v15[4] = a4;
  v15[5] = a3;
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v15);

  os_unfair_lock_unlock(&buttonEventListenerLock);
  v14 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[SiriActivationService _notifyListenersOfButtonUpWithButtonIdentifier:atTimestamp:]";
    _os_log_impl(&dword_1D132F000, v14, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy buttonEventListenerLock unlocked", buf, 0xCu);
  }
}

void __84__SiriActivationService__notifyListenersOfButtonUpWithButtonIdentifier_atTimestamp___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  SASTimeIntervalTransport *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  objc_msgSend(v5, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteTarget");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = -[SASTimeIntervalTransport initWithTimeInterval:]([SASTimeIntervalTransport alloc], "initWithTimeInterval:", *(double *)(a1 + 32));
    objc_msgSend(v5, "connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "remoteTarget");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "buttonUpWithButtonIdentifier:forListenerIdentifier:atTimestamp:", v12, v13, v9);

  }
}

- (void)_notifyListenersOfButtonLongPressWithButtonIdentifier:(int64_t)a3 atTimestamp:(double)a4
{
  os_log_t *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[6];
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v8 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)MEMORY[0x1E0CB3978];
    v10 = v8;
    objc_msgSend(v9, "currentThread");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v17 = "-[SiriActivationService _notifyListenersOfButtonLongPressWithButtonIdentifier:atTimestamp:]";
    v18 = 2048;
    v19 = objc_msgSend(v11, "qualityOfService");
    _os_log_impl(&dword_1D132F000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy buttonEventListenerLock about to lock with qos: %zd", buf, 0x16u);

  }
  os_unfair_lock_lock(&buttonEventListenerLock);
  v12 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[SiriActivationService _notifyListenersOfButtonLongPressWithButtonIdentifier:atTimestamp:]";
    _os_log_impl(&dword_1D132F000, v12, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy buttonEventListenerLock successfully locked", buf, 0xCu);
  }
  -[SiriActivationService buttonEventListeners](self, "buttonEventListeners");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __91__SiriActivationService__notifyListenersOfButtonLongPressWithButtonIdentifier_atTimestamp___block_invoke;
  v15[3] = &__block_descriptor_48_e42_v32__0__NSString_8__SASSignalServer_16_B24l;
  *(double *)&v15[4] = a4;
  v15[5] = a3;
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v15);

  os_unfair_lock_unlock(&buttonEventListenerLock);
  v14 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[SiriActivationService _notifyListenersOfButtonLongPressWithButtonIdentifier:atTimestamp:]";
    _os_log_impl(&dword_1D132F000, v14, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy buttonEventListenerLock unlocked", buf, 0xCu);
  }
}

void __91__SiriActivationService__notifyListenersOfButtonLongPressWithButtonIdentifier_atTimestamp___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  SASTimeIntervalTransport *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  objc_msgSend(v5, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteTarget");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = -[SASTimeIntervalTransport initWithTimeInterval:]([SASTimeIntervalTransport alloc], "initWithTimeInterval:", *(double *)(a1 + 32));
    objc_msgSend(v5, "connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "remoteTarget");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "buttonLongPressWithButtonIdentifier:forListenerIdentifier:atTimestamp:", v12, v13, v9);

  }
}

- (void)_updateCanActivateFromDirectActionSource
{
  NSObject *v3;
  void *v4;
  SASActivationRequest *v5;
  SiriDirectActionContext *v6;
  SiriDirectActionContext *v7;
  SASActivationRequest *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315138;
    v14 = "-[SiriActivationService _updateCanActivateFromDirectActionSource]";
    _os_log_impl(&dword_1D132F000, v3, OS_LOG_TYPE_DEFAULT, "%s #activation _updateCanActivateFromDirectActionSource", (uint8_t *)&v13, 0xCu);
  }
  v4 = (void *)objc_opt_new();
  v5 = [SASActivationRequest alloc];
  v6 = [SiriDirectActionContext alloc];
  v7 = -[SiriDirectActionContext initWithPayload:](v6, "initWithPayload:", MEMORY[0x1E0C9AA70]);
  v8 = -[SASActivationRequest initWithDirectActionContext:](v5, "initWithDirectActionContext:", v7);
  objc_msgSend(v4, "setRequest:", v8);

  objc_msgSend(v4, "setButtonTriggerStateActive:", 0);
  -[SiriActivationService systemState](self, "systemState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSystemState:", v9);

  +[SASSiriPocketStateManager sharedManager](SASSiriPocketStateManager, "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPocketStateManager:", v10);

  -[SiriActivationService afPreferences](self, "afPreferences");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPreferences:", v11);

  objc_msgSend(v4, "setRequestState:", -[SiriActivationService _requestState](self, "_requestState"));
  -[SiriActivationService assetUtilities](self, "assetUtilities");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAssetUtilities:", v12);

  objc_msgSend(v4, "setPresentationIdentifier:", -[SASPresentationManager nextPresentationToActivate](self->_presentationManager, "nextPresentationToActivate"));
  -[SiriActivationService setCanActivateFromDirectActionSource:](self, "setCanActivateFromDirectActionSource:", +[SASActivationDecision canActivateForCondition:](SASActivationDecision, "canActivateForCondition:", v4));

}

- (void)setCanActivateFromDirectActionSource:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  v5 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    v7 = v5;
    objc_msgSend(v6, "numberWithBool:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315394;
    v10 = "-[SiriActivationService setCanActivateFromDirectActionSource:]";
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_1D132F000, v7, OS_LOG_TYPE_DEFAULT, "%s #activation setCanActivateFromDirectActionSource: %@", (uint8_t *)&v9, 0x16u);

  }
  if (self->_canActivateFromDirectActionSource != v3)
  {
    self->_canActivateFromDirectActionSource = v3;
    -[SiriActivationService _notifySourcesOfCanActivateFromDirectActionSourceChange:](self, "_notifySourcesOfCanActivateFromDirectActionSourceChange:", v3);
  }
}

- (void)_notifySourcesOfCanActivateFromDirectActionSourceChange:(BOOL)a3
{
  os_log_t *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  _BOOL4 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v24 = a3;
  v34 = *MEMORY[0x1E0C80C00];
  v4 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v5 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x1E0CB3978];
    v7 = v5;
    objc_msgSend(v6, "currentThread");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v31 = "-[SiriActivationService _notifySourcesOfCanActivateFromDirectActionSourceChange:]";
    v32 = 2048;
    v33 = objc_msgSend(v8, "qualityOfService");
    _os_log_impl(&dword_1D132F000, v7, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy sourcesLock about to lock with qos: %zd", buf, 0x16u);

  }
  os_unfair_lock_lock((os_unfair_lock_t)&sourcesLock);
  v9 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v31 = "-[SiriActivationService _notifySourcesOfCanActivateFromDirectActionSourceChange:]";
    _os_log_impl(&dword_1D132F000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy sourcesLock successfully locked", buf, 0xCu);
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[SiriActivationService sources](self, "sources");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v16, "connection");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "remoteTarget");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_opt_respondsToSelector();

        if ((v19 & 1) != 0)
        {
          objc_msgSend(v16, "connection");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "remoteTarget");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v24);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "canActivateChangedTo:", v22);

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v13);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&sourcesLock);
  v23 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v31 = "-[SiriActivationService _notifySourcesOfCanActivateFromDirectActionSourceChange:]";
    _os_log_impl(&dword_1D132F000, v23, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy sourcesLock unlocked", buf, 0xCu);
  }
}

- (void)registerSiriPresentation:(id)a3 withIdentifier:(int64_t)a4
{
  -[SASPresentationManager registerSiriPresentation:withIdentifier:](self->_presentationManager, "registerSiriPresentation:withIdentifier:", a3, a4);
}

- (void)unregisterSiriPresentationIdentifier:(int64_t)a3
{
  -[SASPresentationManager unregisterSiriPresentationWithIdentifier:](self->_presentationManager, "unregisterSiriPresentationWithIdentifier:", a3);
}

- (void)siriPresentationDisplayedWithIdentifier:(int64_t)a3
{
  -[SASPresentationManager presentationWithPresentationIdentifierBecameActive:](self->_presentationManager, "presentationWithPresentationIdentifierBecameActive:", a3);
}

- (void)siriPresentationWillDismissWithIdentifier:(int64_t)a3
{
  -[SASPresentationManager presentationWithPresentationIdentifierBeganStopping:](self->_presentationManager, "presentationWithPresentationIdentifierBeganStopping:", a3);
}

- (void)siriPresentationDismissedWithIdentifier:(int64_t)a3
{
  void (**didDismissForAssesmentModeStartedCompeltion)(id, uint64_t);
  id v6;

  didDismissForAssesmentModeStartedCompeltion = (void (**)(id, uint64_t))self->_didDismissForAssesmentModeStartedCompeltion;
  if (didDismissForAssesmentModeStartedCompeltion)
  {
    didDismissForAssesmentModeStartedCompeltion[2](didDismissForAssesmentModeStartedCompeltion, 1);
    v6 = self->_didDismissForAssesmentModeStartedCompeltion;
    self->_didDismissForAssesmentModeStartedCompeltion = 0;

  }
  -[SASPresentationManager presentationWithPresentationIdentifierBecameOff:](self->_presentationManager, "presentationWithPresentationIdentifierBecameOff:", a3);
}

- (void)siriPresentationFailureWithIdentifier:(int64_t)a3 error:(id)a4
{
  -[SASPresentationManager presentationWithPresentationIdentifierBecameOff:](self->_presentationManager, "presentationWithPresentationIdentifierBecameOff:", a3, a4);
}

- (void)siriPresentationDidUpdateState:(id)a3
{
  -[SASPresentationManager presentationDidUpdateState:](self->_presentationManager, "presentationDidUpdateState:", a3);
}

- (void)registerActivationSource:(id)a3 withIdentifier:(id)a4
{
  id v6;
  id v7;
  os_log_t *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  int v24;
  const char *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v9 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)MEMORY[0x1E0CB3978];
    v11 = v9;
    objc_msgSend(v10, "currentThread");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 136315394;
    v25 = "-[SiriActivationService registerActivationSource:withIdentifier:]";
    v26 = 2048;
    v27 = objc_msgSend(v12, "qualityOfService");
    _os_log_impl(&dword_1D132F000, v11, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy sourcesLock about to lock with qos: %zd", (uint8_t *)&v24, 0x16u);

  }
  os_unfair_lock_lock((os_unfair_lock_t)&sourcesLock);
  v13 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 136315138;
    v25 = "-[SiriActivationService registerActivationSource:withIdentifier:]";
    _os_log_impl(&dword_1D132F000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy sourcesLock successfully locked", (uint8_t *)&v24, 0xCu);
  }
  -[SiriActivationService sources](self, "sources");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "containsObject:", v7);

  if (v16)
  {
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
      -[SiriActivationService registerActivationSource:withIdentifier:].cold.1();
    -[SiriActivationService sources](self, "sources");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeObjectForKey:", v7);

  }
  v18 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 136315394;
    v25 = "-[SiriActivationService registerActivationSource:withIdentifier:]";
    v26 = 2112;
    v27 = (uint64_t)v7;
    _os_log_impl(&dword_1D132F000, v18, OS_LOG_TYPE_DEFAULT, "%s #activation Registering '%@'", (uint8_t *)&v24, 0x16u);
  }
  -[SiriActivationService sources](self, "sources");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKey:", v6, v7);

  objc_msgSend(v6, "connection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "remoteTarget");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SiriActivationService _shouldRejectNewActivations:](self, "_shouldRejectNewActivations:", -[SiriActivationService _requestState](self, "_requestState")));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "activeChangedTo:", v22);

  objc_msgSend(v6, "specifySenderForInstrumentation:", self->_activationEventInstrumentationSender);
  os_unfair_lock_unlock((os_unfair_lock_t)&sourcesLock);
  v23 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 136315138;
    v25 = "-[SiriActivationService registerActivationSource:withIdentifier:]";
    _os_log_impl(&dword_1D132F000, v23, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy sourcesLock unlocked", (uint8_t *)&v24, 0xCu);
  }
  -[SiriActivationService _updateCanActivateFromDirectActionSource](self, "_updateCanActivateFromDirectActionSource");

}

- (void)unregisterActivationSourceIdentifier:(id)a3
{
  id v4;
  os_log_t *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  int v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v6 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)MEMORY[0x1E0CB3978];
    v8 = v6;
    objc_msgSend(v7, "currentThread");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 136315394;
    v19 = "-[SiriActivationService unregisterActivationSourceIdentifier:]";
    v20 = 2048;
    v21 = objc_msgSend(v9, "qualityOfService");
    _os_log_impl(&dword_1D132F000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy sourcesLock about to lock with qos: %zd", (uint8_t *)&v18, 0x16u);

  }
  os_unfair_lock_lock((os_unfair_lock_t)&sourcesLock);
  v10 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 136315138;
    v19 = "-[SiriActivationService unregisterActivationSourceIdentifier:]";
    _os_log_impl(&dword_1D132F000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy sourcesLock successfully locked", (uint8_t *)&v18, 0xCu);
  }
  -[SiriActivationService sources](self, "sources");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "containsObject:", v4);

  v14 = *v5;
  v15 = *v5;
  if ((v13 & 1) != 0)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 136315394;
      v19 = "-[SiriActivationService unregisterActivationSourceIdentifier:]";
      v20 = 2112;
      v21 = (uint64_t)v4;
      _os_log_impl(&dword_1D132F000, v14, OS_LOG_TYPE_DEFAULT, "%s #activation Unregistering '%@'", (uint8_t *)&v18, 0x16u);
    }
    -[SiriActivationService sources](self, "sources");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObjectForKey:", v4);

  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    -[SiriActivationService unregisterActivationSourceIdentifier:].cold.1();
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sourcesLock);
  v17 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 136315138;
    v19 = "-[SiriActivationService unregisterActivationSourceIdentifier:]";
    _os_log_impl(&dword_1D132F000, v17, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy sourcesLock unlocked", (uint8_t *)&v18, 0xCu);
  }

}

- (void)registerActivationAssertion:(id)a3 withIdentifier:(id)a4
{
  id v6;
  id v7;
  os_log_t *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  int v21;
  const char *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v9 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)MEMORY[0x1E0CB3978];
    v11 = v9;
    objc_msgSend(v10, "currentThread");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 136315394;
    v22 = "-[SiriActivationService registerActivationAssertion:withIdentifier:]";
    v23 = 2048;
    v24 = objc_msgSend(v12, "qualityOfService");
    _os_log_impl(&dword_1D132F000, v11, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy assertionLock about to lock with qos: %zd", (uint8_t *)&v21, 0x16u);

  }
  os_unfair_lock_lock(&assertionLock);
  v13 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 136315138;
    v22 = "-[SiriActivationService registerActivationAssertion:withIdentifier:]";
    _os_log_impl(&dword_1D132F000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy assertionLock successfully locked", (uint8_t *)&v21, 0xCu);
  }
  -[SiriActivationService activationAssertions](self, "activationAssertions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "containsObject:", v7);

  if (v16)
  {
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
      -[SiriActivationService registerActivationAssertion:withIdentifier:].cold.1();
    -[SiriActivationService activationAssertions](self, "activationAssertions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeObjectForKey:", v7);

  }
  v18 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 136315394;
    v22 = "-[SiriActivationService registerActivationAssertion:withIdentifier:]";
    v23 = 2112;
    v24 = (uint64_t)v7;
    _os_log_impl(&dword_1D132F000, v18, OS_LOG_TYPE_DEFAULT, "%s #activation Registering assertion with Id -  '%@'", (uint8_t *)&v21, 0x16u);
  }
  -[SiriActivationService activationAssertions](self, "activationAssertions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKey:", v6, v7);

  os_unfair_lock_unlock(&assertionLock);
  v20 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 136315138;
    v22 = "-[SiriActivationService registerActivationAssertion:withIdentifier:]";
    _os_log_impl(&dword_1D132F000, v20, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy assertionLock unlocked", (uint8_t *)&v21, 0xCu);
  }

}

- (void)unregisterActivationAssertionWithIdentifier:(id)a3
{
  id v4;
  os_log_t *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  int v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v6 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)MEMORY[0x1E0CB3978];
    v8 = v6;
    objc_msgSend(v7, "currentThread");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 136315394;
    v19 = "-[SiriActivationService unregisterActivationAssertionWithIdentifier:]";
    v20 = 2048;
    v21 = objc_msgSend(v9, "qualityOfService");
    _os_log_impl(&dword_1D132F000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy assertionLock about to lock with qos: %zd", (uint8_t *)&v18, 0x16u);

  }
  os_unfair_lock_lock(&assertionLock);
  v10 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 136315138;
    v19 = "-[SiriActivationService unregisterActivationAssertionWithIdentifier:]";
    _os_log_impl(&dword_1D132F000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy assertionLock successfully locked", (uint8_t *)&v18, 0xCu);
  }
  -[SiriActivationService activationAssertions](self, "activationAssertions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "containsObject:", v4);

  v14 = *v5;
  v15 = *v5;
  if ((v13 & 1) != 0)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 136315394;
      v19 = "-[SiriActivationService unregisterActivationAssertionWithIdentifier:]";
      v20 = 2112;
      v21 = (uint64_t)v4;
      _os_log_impl(&dword_1D132F000, v14, OS_LOG_TYPE_DEFAULT, "%s #activation Unregistering assertion %@'", (uint8_t *)&v18, 0x16u);
    }
    -[SiriActivationService activationAssertions](self, "activationAssertions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObjectForKey:", v4);

  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    -[SiriActivationService unregisterActivationAssertionWithIdentifier:].cold.1();
  }
  os_unfair_lock_unlock(&assertionLock);
  v17 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 136315138;
    v19 = "-[SiriActivationService unregisterActivationAssertionWithIdentifier:]";
    _os_log_impl(&dword_1D132F000, v17, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy assertionLock unlocked", (uint8_t *)&v18, 0xCu);
  }

}

- (void)registerButtonEventListenerServer:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  os_log_t *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  int v21;
  const char *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v9 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)MEMORY[0x1E0CB3978];
    v11 = v9;
    objc_msgSend(v10, "currentThread");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 136315394;
    v22 = "-[SiriActivationService registerButtonEventListenerServer:identifier:]";
    v23 = 2048;
    v24 = objc_msgSend(v12, "qualityOfService");
    _os_log_impl(&dword_1D132F000, v11, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy buttonEventListenerLock about to lock with qos: %zd", (uint8_t *)&v21, 0x16u);

  }
  os_unfair_lock_lock(&buttonEventListenerLock);
  v13 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 136315138;
    v22 = "-[SiriActivationService registerButtonEventListenerServer:identifier:]";
    _os_log_impl(&dword_1D132F000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy buttonEventListenerLock successfully locked", (uint8_t *)&v21, 0xCu);
  }
  -[SiriActivationService buttonEventListeners](self, "buttonEventListeners");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "containsObject:", v7);

  if (v16)
  {
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
      -[SiriActivationService registerButtonEventListenerServer:identifier:].cold.1();
    -[SiriActivationService buttonEventListeners](self, "buttonEventListeners");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeObjectForKey:", v7);

  }
  v18 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 136315394;
    v22 = "-[SiriActivationService registerButtonEventListenerServer:identifier:]";
    v23 = 2112;
    v24 = (uint64_t)v7;
    _os_log_impl(&dword_1D132F000, v18, OS_LOG_TYPE_DEFAULT, "%s #activation Registering listener with Id -  '%@'", (uint8_t *)&v21, 0x16u);
  }
  -[SiriActivationService buttonEventListeners](self, "buttonEventListeners");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKey:", v6, v7);

  os_unfair_lock_unlock(&buttonEventListenerLock);
  v20 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 136315138;
    v22 = "-[SiriActivationService registerButtonEventListenerServer:identifier:]";
    _os_log_impl(&dword_1D132F000, v20, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy buttonEventListenerLock unlocked", (uint8_t *)&v21, 0xCu);
  }

}

- (void)unregisterButtonEventListenerWithIdentifier:(id)a3
{
  id v4;
  os_log_t *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  int v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v6 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)MEMORY[0x1E0CB3978];
    v8 = v6;
    objc_msgSend(v7, "currentThread");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 136315394;
    v19 = "-[SiriActivationService unregisterButtonEventListenerWithIdentifier:]";
    v20 = 2048;
    v21 = objc_msgSend(v9, "qualityOfService");
    _os_log_impl(&dword_1D132F000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy buttonEventListenerLock about to lock with qos: %zd", (uint8_t *)&v18, 0x16u);

  }
  os_unfair_lock_lock(&buttonEventListenerLock);
  v10 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 136315138;
    v19 = "-[SiriActivationService unregisterButtonEventListenerWithIdentifier:]";
    _os_log_impl(&dword_1D132F000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy buttonEventListenerLock successfully locked", (uint8_t *)&v18, 0xCu);
  }
  -[SiriActivationService buttonEventListeners](self, "buttonEventListeners");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "containsObject:", v4);

  v14 = *v5;
  v15 = *v5;
  if ((v13 & 1) != 0)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 136315394;
      v19 = "-[SiriActivationService unregisterButtonEventListenerWithIdentifier:]";
      v20 = 2112;
      v21 = (uint64_t)v4;
      _os_log_impl(&dword_1D132F000, v14, OS_LOG_TYPE_DEFAULT, "%s #activation Unregistering listener %@'", (uint8_t *)&v18, 0x16u);
    }
    -[SiriActivationService buttonEventListeners](self, "buttonEventListeners");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObjectForKey:", v4);

  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    -[SiriActivationService unregisterButtonEventListenerWithIdentifier:].cold.1();
  }
  os_unfair_lock_unlock(&buttonEventListenerLock);
  v17 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 136315138;
    v19 = "-[SiriActivationService unregisterButtonEventListenerWithIdentifier:]";
    _os_log_impl(&dword_1D132F000, v17, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy buttonEventListenerLock unlocked", (uint8_t *)&v18, 0xCu);
  }

}

- (BOOL)presentationsAreIdleAndQuiet
{
  return -[SASPresentationManager activePresentationsAreIdleAndQuiet](self->_presentationManager, "activePresentationsAreIdleAndQuiet");
}

- (BOOL)isConnectedTo188
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connectedDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v7, "productId") == 8194 && objc_msgSend(v7, "vendorId") == 76)
        {
          LOBYTE(v4) = 1;
          goto LABEL_12;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_12:

  return v4;
}

- (void)_B188ActivationEvent:(int64_t)a3 context:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  SiriActivationService *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a4;
  v9 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__SiriActivationService__B188ActivationEvent_context_options___block_invoke;
  v13[3] = &unk_1E91FC2C8;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v10 = v9;
  v11 = v8;
  v12 = self;
  dispatch_async(MEMORY[0x1E0C80D38], v13);

}

void __62__SiriActivationService__B188ActivationEvent_context_options___block_invoke(uint64_t a1)
{
  id *v2;
  id v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14[2];
  id location;

  v2 = *(id **)(a1 + 32);
  v3 = v2[5];
  if (v3)
  {
    v4 = objc_msgSend(v3, "isValid");
    v2 = *(id **)(a1 + 32);
    if (v4)
    {
      objc_msgSend(v2[5], "invalidate");
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = 0;

      v2 = *(id **)(a1 + 32);
    }
  }
  objc_initWeak(&location, v2);
  v7 = (void *)MEMORY[0x1E0C99E88];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__SiriActivationService__B188ActivationEvent_context_options___block_invoke_2;
  v11[3] = &unk_1E91FC2A0;
  objc_copyWeak(v14, &location);
  v14[1] = *(id *)(a1 + 56);
  v12 = *(id *)(a1 + 40);
  v13 = *(id *)(a1 + 48);
  objc_msgSend(v7, "scheduledTimerWithTimeInterval:repeats:block:", 0, v11, 0.1);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

void __62__SiriActivationService__B188ActivationEvent_context_options___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  int v4;
  void *v5;
  _BOOL4 v6;
  NSObject *v7;
  id v8;
  void *v9;
  SASActivationRequest *v10;
  SiriDismissalOptions *v11;
  NSObject *v12;
  id v13;
  void *v14;
  SASActivationRequest *v15;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = objc_msgSend(WeakRetained, "presentationsAreIdleAndQuiet");

  v5 = (void *)*MEMORY[0x1E0CFE6A0];
  v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      v7 = v5;
      v8 = objc_loadWeakRetained(v2);
      SASRequestStateGetName(objc_msgSend(v8, "_requestState"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 136315394;
      v17 = "-[SiriActivationService _B188ActivationEvent:context:options:]_block_invoke_2";
      v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_1D132F000, v7, OS_LOG_TYPE_DEFAULT, "%s #activation B188ActivationEvent with Siri state %@. Activating.", (uint8_t *)&v16, 0x16u);

    }
    v10 = -[SASActivationRequest initWithButtonIdentifier:context:]([SASActivationRequest alloc], "initWithButtonIdentifier:context:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32));
    v11 = (SiriDismissalOptions *)objc_loadWeakRetained(v2);
    -[SiriDismissalOptions handleActivationRequest:](v11, "handleActivationRequest:", v10);
    goto LABEL_10;
  }
  if (v6)
  {
    v12 = v5;
    v13 = objc_loadWeakRetained(v2);
    SASRequestStateGetName(objc_msgSend(v13, "_requestState"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 136315394;
    v17 = "-[SiriActivationService _B188ActivationEvent:context:options:]_block_invoke";
    v18 = 2112;
    v19 = v14;
    _os_log_impl(&dword_1D132F000, v12, OS_LOG_TYPE_DEFAULT, "%s #activation B188ActivationEvent with Siri state %@. Deactivating.", (uint8_t *)&v16, 0x16u);

  }
  v15 = (SASActivationRequest *)objc_loadWeakRetained(v2);
  v10 = v15;
  if (!*(_QWORD *)(a1 + 40))
  {
    v11 = -[SiriDismissalOptions initWithDeactivationOptions:]([SiriDismissalOptions alloc], "initWithDeactivationOptions:", 0);
    -[SASActivationRequest dismissSiriWithOptions:](v10, "dismissSiriWithOptions:", v11);
LABEL_10:

    goto LABEL_11;
  }
  -[SASActivationRequest dismissSiriWithOptions:](v15, "dismissSiriWithOptions:");
LABEL_11:

}

- (void)activationRequestFromButtonIdentifier:(int64_t)a3 context:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  SASActivationRequest *v10;
  int64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  SiriLongPressButtonContext *v17;
  void *v18;
  SiriLongPressButtonContext *v19;
  void *v20;
  int v21;
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (a3 == 3)
  {
    if (-[SiriActivationService isConnectedTo188](self, "isConnectedTo188"))
    {
      -[SiriActivationService _B188ActivationEvent:context:options:](self, "_B188ActivationEvent:context:options:", 3, v6, 0);
      goto LABEL_18;
    }
    if (-[SiriActivationService _requestState](self, "_requestState") == 3)
    {
      v7 = (void *)*MEMORY[0x1E0CFE6A0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
      {
        v8 = v7;
        SASRequestStateGetName(-[SiriActivationService _requestState](self, "_requestState"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 136315650;
        v22 = "-[SiriActivationService activationRequestFromButtonIdentifier:context:]";
        v23 = 2112;
        v24 = v6;
        v25 = 2112;
        v26 = v9;
        _os_log_impl(&dword_1D132F000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation SiriButtonIdentifierLongPressBTHeadset, context %@, but Siri state is %@. Treating as button long press.", (uint8_t *)&v21, 0x20u);

      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "address");
        v10 = (SASActivationRequest *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }
      v17 = [SiriLongPressButtonContext alloc];
      objc_msgSend(v6, "contextOverride");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[SiriContext initWithContextOverride:](v17, "initWithContextOverride:", v18);

      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "systemUptime");
      -[SiriLongPressButtonContext setButtonDownTimestamp:](v19, "setButtonDownTimestamp:");

      -[SiriActivationService buttonLongPressFromButtonIdentifier:deviceIdentifier:context:](self, "buttonLongPressFromButtonIdentifier:deviceIdentifier:context:", 3, v10, v19);
LABEL_17:

      goto LABEL_18;
    }
  }
  v11 = -[SiriActivationService _requestState](self, "_requestState");
  v12 = (void *)*MEMORY[0x1E0CFE6A0];
  if (v11 != 3)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      v14 = v12;
      objc_msgSend(v13, "stringWithSiriButtonIdentifier:", a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      SASRequestStateGetName(-[SiriActivationService _requestState](self, "_requestState"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 136315650;
      v22 = "-[SiriActivationService activationRequestFromButtonIdentifier:context:]";
      v23 = 2112;
      v24 = v15;
      v25 = 2112;
      v26 = v16;
      _os_log_impl(&dword_1D132F000, v14, OS_LOG_TYPE_DEFAULT, "%s activationRequestFromButtonIdentifier:%@, with Siri state %@. Activating.", (uint8_t *)&v21, 0x20u);

    }
    -[SiriActivationService setButtonDownHasOccurredSinceActivation:](self, "setButtonDownHasOccurredSinceActivation:", 0);
    v10 = -[SASActivationRequest initWithButtonIdentifier:context:]([SASActivationRequest alloc], "initWithButtonIdentifier:context:", a3, v6);
    -[SiriActivationService handleActivationRequest:](self, "handleActivationRequest:", v10);
    goto LABEL_17;
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
    -[SiriActivationService activationRequestFromButtonIdentifier:context:].cold.1(v12, a3, self);
LABEL_18:

}

- (void)deactivationRequestFromButtonIdentifier:(int64_t)a3 context:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (a3 == 3 && -[SiriActivationService isConnectedTo188](self, "isConnectedTo188"))
  {
    -[SiriActivationService _B188ActivationEvent:context:options:](self, "_B188ActivationEvent:context:options:", 3, v8, v9);
  }
  else
  {
    v10 = (void *)*MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      v12 = v10;
      objc_msgSend(v11, "stringWithSiriButtonIdentifier:", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      SASRequestStateGetName(-[SiriActivationService _requestState](self, "_requestState"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 136315650;
      v16 = "-[SiriActivationService deactivationRequestFromButtonIdentifier:context:options:]";
      v17 = 2112;
      v18 = v13;
      v19 = 2112;
      v20 = v14;
      _os_log_impl(&dword_1D132F000, v12, OS_LOG_TYPE_DEFAULT, "%s deactivationRequestFromButtonIdentifier:%@, with Siri state %@. Deactivating.", (uint8_t *)&v15, 0x20u);

    }
    -[SiriActivationService dismissSiriWithOptions:](self, "dismissSiriWithOptions:", v9);
  }

}

- (BOOL)_shouldRejectActivationWithButtonIdentifier:(int64_t)a3 activationAssertions:(id)a4
{
  unint64_t v4;
  uint64_t v5;
  NSObject *v6;
  int v9;
  const char *v10;
  __int16 v11;
  _BOOL4 v12;
  __int16 v13;
  _BOOL4 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3 - 1;
  v5 = objc_msgSend(a4, "count");
  v6 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315650;
    v10 = "-[SiriActivationService _shouldRejectActivationWithButtonIdentifier:activationAssertions:]";
    v11 = 1024;
    v12 = v4 < 2;
    v13 = 1024;
    v14 = v5 != 0;
    _os_log_impl(&dword_1D132F000, v6, OS_LOG_TYPE_DEFAULT, "%s  #activation _shouldRejectActivationWithButtonIdentifier - isBlockableButton:%d assertionsAvailable :%d", (uint8_t *)&v9, 0x18u);
  }
  return v4 < 2 && v5 != 0;
}

- (void)prewarmFromButtonIdentifier:(int64_t)a3 longPressInterval:(double)a4
{
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[3];
  _QWORD v21[3];
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  double v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = v7;
    objc_msgSend(v8, "stringWithSiriButtonIdentifier:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    SASRequestStateGetName(-[SiriActivationService _requestState](self, "_requestState"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v23 = "-[SiriActivationService prewarmFromButtonIdentifier:longPressInterval:]";
    v24 = 2112;
    v25 = v10;
    v26 = 2112;
    v27 = v11;
    v28 = 2048;
    v29 = a4;
    _os_log_impl(&dword_1D132F000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation %@ button prewarm request, current request state: %@, longPressInterval: %f", buf, 0x2Au);

  }
  objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "assistantIsEnabled");

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithSiriActivationEventType:", 0, CFSTR("activationEvent"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v14;
    v20[1] = CFSTR("eventSource");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithSiriButtonIdentifier:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v15;
    v20[2] = CFSTR("interval");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    +[SASAnalytics analytics](SASAnalytics, "analytics");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "enqueueCurrentAnalyticsEventWithType:context:", 1402, v17);

    -[SiriActivationService _defrost](self, "_defrost");
    -[SiriActivationService heater](self, "heater");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "prepareForUseAfterTimeInterval:", a4);

  }
}

- (void)setHintGlowAssertionFromButtonIdentifier:(int64_t)a3 context:(id)a4
{
  id v6;
  SASActivationRequest *v7;
  int64_t v8;
  _QWORD v9[4];
  id v10;
  id location;

  v6 = a4;
  v7 = -[SASActivationRequest initWithButtonIdentifier:context:]([SASActivationRequest alloc], "initWithButtonIdentifier:context:", a3, v6);
  if (-[SiriActivationService _shouldShowHintGlowWithRequest:](self, "_shouldShowHintGlowWithRequest:", v7))
  {
    v8 = -[SASPresentationManager nextPresentationToActivate](self->_presentationManager, "nextPresentationToActivate");
    if (a3 == 2 && v8 == 1)
    {
      objc_initWeak(&location, self);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __74__SiriActivationService_setHintGlowAssertionFromButtonIdentifier_context___block_invoke;
      v9[3] = &unk_1E91FBE70;
      objc_copyWeak(&v10, &location);
      SiriInvokeOnMainQueue(v9);
      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }

}

void __74__SiriActivationService_setHintGlowAssertionFromButtonIdentifier_context___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v2;
  id v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      v3 = WeakRetained[24];
      v4 = 136315394;
      v5 = "-[SiriActivationService setHintGlowAssertionFromButtonIdentifier:context:]_block_invoke";
      v6 = 2112;
      v7 = v3;
      _os_log_impl(&dword_1D132F000, v2, OS_LOG_TYPE_DEFAULT, "%s SiriActivationService request hint glow for next presentation, presentationManager: %@", (uint8_t *)&v4, 0x16u);
    }
    objc_msgSend(WeakRetained[24], "requestHintGlowForNextPresentation");
  }

}

- (BOOL)_shouldShowHintGlowWithRequest:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (AFDeviceSupportsSystemAssistantExperience())
    v5 = -[SiriActivationService _canActivateForRequest:](self, "_canActivateForRequest:", v4);
  else
    v5 = 0;

  return v5;
}

- (BOOL)_canActivateForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setRequest:", v4);

  objc_msgSend(v5, "setButtonTriggerStateActive:", 0);
  -[SiriActivationService systemState](self, "systemState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSystemState:", v6);

  +[SASSiriPocketStateManager sharedManager](SASSiriPocketStateManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPocketStateManager:", v7);

  -[SiriActivationService afPreferences](self, "afPreferences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreferences:", v8);

  objc_msgSend(v5, "setRequestState:", -[SiriActivationService _requestState](self, "_requestState"));
  -[SiriActivationService assetUtilities](self, "assetUtilities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAssetUtilities:", v9);

  objc_msgSend(v5, "setPresentationIdentifier:", -[SASPresentationManager nextPresentationToActivate](self->_presentationManager, "nextPresentationToActivate"));
  LOBYTE(self) = +[SASActivationDecision canActivateForCondition:](SASActivationDecision, "canActivateForCondition:", v5);

  return (char)self;
}

- (BOOL)_eyesFreeRedesignOnlySteeringWheelEnabled
{
  return _os_feature_enabled_impl();
}

- (void)_defrost
{
  kdebug_trace();
  -[SiriActivationService _attachToTether](self, "_attachToTether");
}

- (void)cancelPrewarmFromButtonIdentifier:(int64_t)a3
{
  -[SASHeater cancelPreparationForButtonIdentifier:](self->_heater, "cancelPreparationForButtonIdentifier:", a3);
  -[SASPresentationManager cancelAllPreheatedPresentations](self->_presentationManager, "cancelAllPreheatedPresentations");
}

- (void)buttonDownFromButtonIdentifier:(int64_t)a3 timestamp:(double)a4 context:(id)a5
{
  id v8;
  os_log_t *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  os_log_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  _BOOL4 v21;
  NSObject *v22;
  os_log_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSMutableDictionary *activationAssertions;
  void *v28;
  _QWORD aBlock[4];
  id v30;
  int64_t v31;
  double v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  NSMutableDictionary *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v10 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = v10;
    objc_msgSend(v11, "stringWithSiriButtonIdentifier:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v34 = "-[SiriActivationService buttonDownFromButtonIdentifier:timestamp:context:]";
    v35 = 2112;
    v36 = (uint64_t)v13;
    _os_log_impl(&dword_1D132F000, v12, OS_LOG_TYPE_DEFAULT, "%s #activation buttonDownFromButtonIdentifier:%@", buf, 0x16u);

  }
  if (-[SiriActivationService _requestState](self, "_requestState") == 4)
  {
    v14 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v34 = "-[SiriActivationService buttonDownFromButtonIdentifier:timestamp:context:]";
      _os_log_impl(&dword_1D132F000, v14, OS_LOG_TYPE_DEFAULT, "%s #activation button down used while stopping. Ignoring.", buf, 0xCu);
    }
  }
  else
  {
    -[SiriActivationService _notifyListenersOfButtonDownWithButtonIdentifier:atTimestamp:](self, "_notifyListenersOfButtonDownWithButtonIdentifier:atTimestamp:", a3, a4);
    v15 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)MEMORY[0x1E0CB3978];
      v17 = v15;
      objc_msgSend(v16, "currentThread");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "qualityOfService");
      *(_DWORD *)buf = 136315394;
      v34 = "-[SiriActivationService buttonDownFromButtonIdentifier:timestamp:context:]";
      v35 = 2048;
      v36 = v19;
      _os_log_impl(&dword_1D132F000, v17, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy assertionLock about to lock with qos: %zd", buf, 0x16u);

    }
    os_unfair_lock_lock(&assertionLock);
    v20 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v34 = "-[SiriActivationService buttonDownFromButtonIdentifier:timestamp:context:]";
      _os_log_impl(&dword_1D132F000, v20, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy assertionLock successfully locked", buf, 0xCu);
    }
    v21 = -[SiriActivationService _shouldRejectActivationWithButtonIdentifier:activationAssertions:](self, "_shouldRejectActivationWithButtonIdentifier:activationAssertions:", a3, self->_activationAssertions);
    os_unfair_lock_unlock(&assertionLock);
    v22 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v34 = "-[SiriActivationService buttonDownFromButtonIdentifier:timestamp:context:]";
      _os_log_impl(&dword_1D132F000, v22, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy assertionLock unlocked", buf, 0xCu);
    }
    if (v21)
    {
      v23 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      {
        v24 = (void *)MEMORY[0x1E0CB3940];
        v25 = v23;
        objc_msgSend(v24, "stringWithSiriButtonIdentifier:", a3);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        activationAssertions = self->_activationAssertions;
        *(_DWORD *)buf = 136315650;
        v34 = "-[SiriActivationService buttonDownFromButtonIdentifier:timestamp:context:]";
        v35 = 2112;
        v36 = (uint64_t)v26;
        v37 = 2112;
        v38 = activationAssertions;
        _os_log_impl(&dword_1D132F000, v25, OS_LOG_TYPE_DEFAULT, "%s #activation Rejecting Button Down as we have valid activation assertions. ButtonIdentifier - %@ Activation assertions - %@", buf, 0x20u);

      }
    }
    else
    {
      -[SiriActivationService setButtonDownHasOccurredSinceActivation:](self, "setButtonDownHasOccurredSinceActivation:", 1);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __74__SiriActivationService_buttonDownFromButtonIdentifier_timestamp_context___block_invoke;
      aBlock[3] = &unk_1E91FC2F0;
      v31 = a3;
      v32 = a4;
      v30 = v8;
      v28 = _Block_copy(aBlock);
      -[SASPresentationManager sendButtonEventCompletionToPresentations:forButtonEventType:](self->_presentationManager, "sendButtonEventCompletionToPresentations:forButtonEventType:", v28, 1);
      -[SiriActivationService _recordTimeIfNeededForButtonIdentifier:buttonDownTimestamp:](self, "_recordTimeIfNeededForButtonIdentifier:buttonDownTimestamp:", a3, a4);

    }
  }

}

void __74__SiriActivationService_buttonDownFromButtonIdentifier_timestamp_context___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  SASButtonIdentifierTransport *v4;
  SASTimeIntervalTransport *v5;
  id v6;

  objc_msgSend(a2, "connection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteTarget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SASButtonIdentifierTransport initWithSiriButtonIdentifier:]([SASButtonIdentifierTransport alloc], "initWithSiriButtonIdentifier:", *(_QWORD *)(a1 + 40));
  v5 = -[SASTimeIntervalTransport initWithTimeInterval:]([SASTimeIntervalTransport alloc], "initWithTimeInterval:", *(double *)(a1 + 48));
  objc_msgSend(v3, "handleButtonDownFromButtonIdentifier:timestamp:context:", v4, v5, *(_QWORD *)(a1 + 32));

}

- (void)buttonUpFromButtonIdentifier:(int64_t)a3 deviceIdentifier:(id)a4 timestamp:(double)a5 context:(id)a6
{
  id v10;
  id v11;
  os_log_t *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  os_log_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  _BOOL4 v23;
  NSObject *v24;
  os_log_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSMutableDictionary *activationAssertions;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, void *);
  void *v34;
  id v35;
  id v36;
  int64_t v37;
  double v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  NSMutableDictionary *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  v12 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v13 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    v15 = v13;
    objc_msgSend(v14, "stringWithSiriButtonIdentifier:", a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v40 = "-[SiriActivationService buttonUpFromButtonIdentifier:deviceIdentifier:timestamp:context:]";
    v41 = 2112;
    v42 = (uint64_t)v16;
    _os_log_impl(&dword_1D132F000, v15, OS_LOG_TYPE_DEFAULT, "%s #activation buttonUpFromButtonIdentifier:%@", buf, 0x16u);

  }
  -[SiriActivationService _notifyListenersOfButtonUpWithButtonIdentifier:atTimestamp:](self, "_notifyListenersOfButtonUpWithButtonIdentifier:atTimestamp:", a3, a5);
  v17 = *v12;
  if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (void *)MEMORY[0x1E0CB3978];
    v19 = v17;
    objc_msgSend(v18, "currentThread");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "qualityOfService");
    *(_DWORD *)buf = 136315394;
    v40 = "-[SiriActivationService buttonUpFromButtonIdentifier:deviceIdentifier:timestamp:context:]";
    v41 = 2048;
    v42 = v21;
    _os_log_impl(&dword_1D132F000, v19, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy assertionLock about to lock with qos: %zd", buf, 0x16u);

  }
  os_unfair_lock_lock(&assertionLock);
  v22 = *v12;
  if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v40 = "-[SiriActivationService buttonUpFromButtonIdentifier:deviceIdentifier:timestamp:context:]";
    _os_log_impl(&dword_1D132F000, v22, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy assertionLock successfully locked", buf, 0xCu);
  }
  v23 = -[SiriActivationService _shouldRejectActivationWithButtonIdentifier:activationAssertions:](self, "_shouldRejectActivationWithButtonIdentifier:activationAssertions:", a3, self->_activationAssertions);
  os_unfair_lock_unlock(&assertionLock);
  v24 = *v12;
  if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v40 = "-[SiriActivationService buttonUpFromButtonIdentifier:deviceIdentifier:timestamp:context:]";
    _os_log_impl(&dword_1D132F000, v24, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy assertionLock unlocked", buf, 0xCu);
  }
  if (v23)
  {
    v25 = *v12;
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
    {
      v26 = (void *)MEMORY[0x1E0CB3940];
      v27 = v25;
      objc_msgSend(v26, "stringWithSiriButtonIdentifier:", a3);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      activationAssertions = self->_activationAssertions;
      *(_DWORD *)buf = 136315650;
      v40 = "-[SiriActivationService buttonUpFromButtonIdentifier:deviceIdentifier:timestamp:context:]";
      v41 = 2112;
      v42 = (uint64_t)v28;
      v43 = 2112;
      v44 = activationAssertions;
      _os_log_impl(&dword_1D132F000, v27, OS_LOG_TYPE_DEFAULT, "%s #activation Rejecting Button Up as we have valid activation assertions. ButtonIdentifier - %@ Activation assertions - %@", buf, 0x20u);

    }
  }
  else
  {
    v31 = MEMORY[0x1E0C809B0];
    v32 = 3221225472;
    v33 = __89__SiriActivationService_buttonUpFromButtonIdentifier_deviceIdentifier_timestamp_context___block_invoke;
    v34 = &unk_1E91FC318;
    v37 = a3;
    v35 = v10;
    v38 = a5;
    v36 = v11;
    v30 = _Block_copy(&v31);
    -[SASPresentationManager sendButtonEventCompletionToPresentations:forButtonEventType:](self->_presentationManager, "sendButtonEventCompletionToPresentations:forButtonEventType:", v30, 2, v31, v32, v33, v34);
    -[SiriActivationService _handleTapSynthesisIfNeededForButtonIdentifier:buttonUpTimestamp:](self, "_handleTapSynthesisIfNeededForButtonIdentifier:buttonUpTimestamp:", a3, a5);

  }
}

void __89__SiriActivationService_buttonUpFromButtonIdentifier_deviceIdentifier_timestamp_context___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  SASButtonIdentifierTransport *v4;
  uint64_t v5;
  SASTimeIntervalTransport *v6;
  id v7;

  objc_msgSend(a2, "connection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteTarget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SASButtonIdentifierTransport initWithSiriButtonIdentifier:]([SASButtonIdentifierTransport alloc], "initWithSiriButtonIdentifier:", *(_QWORD *)(a1 + 48));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = -[SASTimeIntervalTransport initWithTimeInterval:]([SASTimeIntervalTransport alloc], "initWithTimeInterval:", *(double *)(a1 + 56));
  objc_msgSend(v3, "handleButtonUpFromButtonIdentifier:deviceIdentifier:timestamp:context:", v4, v5, v6, *(_QWORD *)(a1 + 40));

}

- (void)buttonTapFromButtonIdentifier:(int64_t)a3 timestamp:(double)a4 context:(id)a5
{
  id v8;
  os_log_t *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  os_log_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  os_log_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSMutableDictionary *activationAssertions;
  void *v27;
  _BOOL4 v28;
  os_log_t v29;
  _BOOL4 v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  NSMutableDictionary *v36;
  SiriShortPressButtonContext *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t, void *);
  void *v43;
  id v44;
  int64_t v45;
  double v46;
  _QWORD aBlock[4];
  id v48;
  int64_t v49;
  double v50;
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  NSMutableDictionary *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v10 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = v10;
    objc_msgSend(v11, "stringWithSiriButtonIdentifier:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v52 = "-[SiriActivationService buttonTapFromButtonIdentifier:timestamp:context:]";
    v53 = 2112;
    v54 = (uint64_t)v13;
    _os_log_impl(&dword_1D132F000, v12, OS_LOG_TYPE_DEFAULT, "%s #activation buttonTapFromButtonIdentifier:%@", buf, 0x16u);

  }
  v14 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)MEMORY[0x1E0CB3978];
    v16 = v14;
    objc_msgSend(v15, "currentThread");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "qualityOfService");
    *(_DWORD *)buf = 136315394;
    v52 = "-[SiriActivationService buttonTapFromButtonIdentifier:timestamp:context:]";
    v53 = 2048;
    v54 = v18;
    _os_log_impl(&dword_1D132F000, v16, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy assertionLock about to lock with qos: %zd", buf, 0x16u);

  }
  os_unfair_lock_lock(&assertionLock);
  v19 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v52 = "-[SiriActivationService buttonTapFromButtonIdentifier:timestamp:context:]";
    _os_log_impl(&dword_1D132F000, v19, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy assertionLock successfully locked", buf, 0xCu);
  }
  v20 = -[SiriActivationService _shouldRejectActivationWithButtonIdentifier:activationAssertions:](self, "_shouldRejectActivationWithButtonIdentifier:activationAssertions:", a3, self->_activationAssertions);
  os_unfair_lock_unlock(&assertionLock);
  v21 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v52 = "-[SiriActivationService buttonTapFromButtonIdentifier:timestamp:context:]";
    _os_log_impl(&dword_1D132F000, v21, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy assertionLock unlocked", buf, 0xCu);
  }
  if (!v20)
  {
    if (-[SiriActivationService _requestState](self, "_requestState") == 3)
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __73__SiriActivationService_buttonTapFromButtonIdentifier_timestamp_context___block_invoke;
      aBlock[3] = &unk_1E91FC2F0;
      v49 = a3;
      v50 = a4;
      v48 = v8;
      v27 = _Block_copy(aBlock);
      -[SASPresentationManager sendButtonEventCompletionToPresentations:forButtonEventType:](self->_presentationManager, "sendButtonEventCompletionToPresentations:forButtonEventType:", v27, 3);

LABEL_31:
      -[SiriActivationService _cancelPendingActivationEventWithReason:](self, "_cancelPendingActivationEventWithReason:", 3);
      goto LABEL_32;
    }
    v28 = -[SiriActivationService _buttonIsTVMicrophoneButton:](self, "_buttonIsTVMicrophoneButton:", a3);
    v29 = *v9;
    v30 = os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT);
    if (v28)
    {
      if (v30)
      {
        v31 = v29;
        SASRequestStateGetName(-[SiriActivationService _requestState](self, "_requestState"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v52 = "-[SiriActivationService buttonTapFromButtonIdentifier:timestamp:context:]";
        v53 = 2112;
        v54 = (uint64_t)v32;
        _os_log_impl(&dword_1D132F000, v31, OS_LOG_TYPE_DEFAULT, "%s #activation activating due to TV remote microphone button short tap with Siri state %@", buf, 0x16u);

      }
      if (objc_msgSend(MEMORY[0x1E0CFE8B8], "isTVPushToTalkEnabled")
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v33 = v8;
      }
      else
      {
        v33 = 0;
      }
      if (-[NSObject isPTTEligible](v33, "isPTTEligible"))
      {
        -[SiriActivationService activationRequestFromButtonIdentifier:context:](self, "activationRequestFromButtonIdentifier:context:", a3, v33);
      }
      else
      {
        v37 = objc_alloc_init(SiriShortPressButtonContext);
        -[SiriActivationService activationRequestFromButtonIdentifier:context:](self, "activationRequestFromButtonIdentifier:context:", a3, v37);

      }
      if (-[NSObject isPTTEligible](v33, "isPTTEligible"))
      {
        v38 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v52 = "-[SiriActivationService buttonTapFromButtonIdentifier:timestamp:context:]";
          _os_log_impl(&dword_1D132F000, v38, OS_LOG_TYPE_DEFAULT, "%s #activation PTT Eligible Remote, Sending handleButtonTap", buf, 0xCu);
        }
        v40 = MEMORY[0x1E0C809B0];
        v41 = 3221225472;
        v42 = __73__SiriActivationService_buttonTapFromButtonIdentifier_timestamp_context___block_invoke_106;
        v43 = &unk_1E91FC2F0;
        v45 = a3;
        v46 = a4;
        v44 = v8;
        v39 = _Block_copy(&v40);
        -[SASPresentationManager sendButtonEventCompletionToPresentations:forButtonEventType:](self->_presentationManager, "sendButtonEventCompletionToPresentations:forButtonEventType:", v39, 3, v40, v41, v42, v43);

      }
    }
    else
    {
      if (!v30)
        goto LABEL_31;
      v34 = (void *)MEMORY[0x1E0CB3940];
      v33 = v29;
      objc_msgSend(v34, "stringWithSiriButtonIdentifier:", a3);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      SASRequestStateGetName(-[SiriActivationService _requestState](self, "_requestState"));
      v36 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v52 = "-[SiriActivationService buttonTapFromButtonIdentifier:timestamp:context:]";
      v53 = 2112;
      v54 = (uint64_t)v35;
      v55 = 2112;
      v56 = v36;
      _os_log_impl(&dword_1D132F000, v33, OS_LOG_TYPE_DEFAULT, "%s buttonTapFromButtonIdentifier:%@, with Siri state %@. Ignoring.", buf, 0x20u);

    }
    goto LABEL_31;
  }
  v22 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
  {
    v23 = (void *)MEMORY[0x1E0CB3940];
    v24 = v22;
    objc_msgSend(v23, "stringWithSiriButtonIdentifier:", a3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    activationAssertions = self->_activationAssertions;
    *(_DWORD *)buf = 136315650;
    v52 = "-[SiriActivationService buttonTapFromButtonIdentifier:timestamp:context:]";
    v53 = 2112;
    v54 = (uint64_t)v25;
    v55 = 2112;
    v56 = activationAssertions;
    _os_log_impl(&dword_1D132F000, v24, OS_LOG_TYPE_DEFAULT, "%s #activation Rejecting Button Tap as we have valid activation assertions. ButtonIdentifier - %@ Activation assertions - %@", buf, 0x20u);

  }
LABEL_32:

}

void __73__SiriActivationService_buttonTapFromButtonIdentifier_timestamp_context___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  SASButtonIdentifierTransport *v4;
  SASTimeIntervalTransport *v5;
  id v6;

  objc_msgSend(a2, "connection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteTarget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SASButtonIdentifierTransport initWithSiriButtonIdentifier:]([SASButtonIdentifierTransport alloc], "initWithSiriButtonIdentifier:", *(_QWORD *)(a1 + 40));
  v5 = -[SASTimeIntervalTransport initWithTimeInterval:]([SASTimeIntervalTransport alloc], "initWithTimeInterval:", *(double *)(a1 + 48));
  objc_msgSend(v3, "handleButtonTapFromButtonIdentifier:timestamp:context:", v4, v5, *(_QWORD *)(a1 + 32));

}

void __73__SiriActivationService_buttonTapFromButtonIdentifier_timestamp_context___block_invoke_106(uint64_t a1, void *a2)
{
  void *v3;
  SASButtonIdentifierTransport *v4;
  SASTimeIntervalTransport *v5;
  id v6;

  objc_msgSend(a2, "connection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteTarget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SASButtonIdentifierTransport initWithSiriButtonIdentifier:]([SASButtonIdentifierTransport alloc], "initWithSiriButtonIdentifier:", *(_QWORD *)(a1 + 40));
  v5 = -[SASTimeIntervalTransport initWithTimeInterval:]([SASTimeIntervalTransport alloc], "initWithTimeInterval:", *(double *)(a1 + 48));
  objc_msgSend(v3, "handleButtonTapFromButtonIdentifier:timestamp:context:", v4, v5, *(_QWORD *)(a1 + 32));

}

- (void)buttonLongPressFromButtonIdentifier:(int64_t)a3 context:(id)a4
{
  -[SiriActivationService buttonLongPressFromButtonIdentifier:deviceIdentifier:context:](self, "buttonLongPressFromButtonIdentifier:deviceIdentifier:context:", a3, 0, a4);
}

- (void)buttonLongPressFromButtonIdentifier:(int64_t)a3 deviceIdentifier:(id)a4 context:(id)a5
{
  id v8;
  NSMutableDictionary *v9;
  os_log_t *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  os_log_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  _BOOL4 v21;
  NSObject *v22;
  os_log_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSMutableDictionary *activationAssertions;
  os_log_t v28;
  void *v29;
  NSMutableDictionary *v30;
  os_log_t v31;
  void *v32;
  NSObject *v33;
  void *v34;
  NSMutableDictionary *v35;
  _BOOL4 v36;
  os_log_t v37;
  _BOOL4 v38;
  void *v39;
  const char *v40;
  os_log_t v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  NSMutableDictionary *v46;
  NSMutableDictionary *v47;
  void *v48;
  void *v49;
  int v50;
  SASActivationRequest *v51;
  _QWORD aBlock[4];
  NSMutableDictionary *v53;
  id v54;
  int64_t v55;
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  NSMutableDictionary *v61;
  __int16 v62;
  NSMutableDictionary *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (NSMutableDictionary *)a5;
  v10 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v11 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = v11;
    objc_msgSend(v12, "stringWithSiriButtonIdentifier:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v57 = "-[SiriActivationService buttonLongPressFromButtonIdentifier:deviceIdentifier:context:]";
    v58 = 2112;
    v59 = (uint64_t)v14;
    _os_log_impl(&dword_1D132F000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation buttonLongPressFromButtonIdentifier:%@", buf, 0x16u);

  }
  -[NSMutableDictionary buttonDownTimestamp](v9, "buttonDownTimestamp");
  -[SiriActivationService _notifyListenersOfButtonLongPressWithButtonIdentifier:atTimestamp:](self, "_notifyListenersOfButtonLongPressWithButtonIdentifier:atTimestamp:", a3);
  v15 = *v10;
  if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (void *)MEMORY[0x1E0CB3978];
    v17 = v15;
    objc_msgSend(v16, "currentThread");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "qualityOfService");
    *(_DWORD *)buf = 136315394;
    v57 = "-[SiriActivationService buttonLongPressFromButtonIdentifier:deviceIdentifier:context:]";
    v58 = 2048;
    v59 = v19;
    _os_log_impl(&dword_1D132F000, v17, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy assertionLock about to lock with qos: %zd", buf, 0x16u);

  }
  os_unfair_lock_lock(&assertionLock);
  v20 = *v10;
  if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v57 = "-[SiriActivationService buttonLongPressFromButtonIdentifier:deviceIdentifier:context:]";
    _os_log_impl(&dword_1D132F000, v20, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy assertionLock successfully locked", buf, 0xCu);
  }
  v21 = -[SiriActivationService _shouldRejectActivationWithButtonIdentifier:activationAssertions:](self, "_shouldRejectActivationWithButtonIdentifier:activationAssertions:", a3, self->_activationAssertions);
  os_unfair_lock_unlock(&assertionLock);
  v22 = *v10;
  if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v57 = "-[SiriActivationService buttonLongPressFromButtonIdentifier:deviceIdentifier:context:]";
    _os_log_impl(&dword_1D132F000, v22, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy assertionLock unlocked", buf, 0xCu);
  }
  if (v21)
  {
    v23 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      v24 = (void *)MEMORY[0x1E0CB3940];
      v25 = v23;
      objc_msgSend(v24, "stringWithSiriButtonIdentifier:", a3);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      activationAssertions = self->_activationAssertions;
      *(_DWORD *)buf = 136315650;
      v57 = "-[SiriActivationService buttonLongPressFromButtonIdentifier:deviceIdentifier:context:]";
      v58 = 2112;
      v59 = (uint64_t)v26;
      v60 = 2112;
      v61 = activationAssertions;
      _os_log_impl(&dword_1D132F000, v25, OS_LOG_TYPE_DEFAULT, "%s #activation Rejecting Button Long Press as we have valid activation assertions. ButtonIdentifier - %@ Activation assertions - %@", buf, 0x20u);
LABEL_12:

    }
  }
  else
  {
    if (-[SiriActivationService _shouldRejectNewActivations:](self, "_shouldRejectNewActivations:", -[SiriActivationService _requestState](self, "_requestState")))
    {
      if (-[SiriActivationService _requestState](self, "_requestState") == 2
        || -[SiriActivationService _requestState](self, "_requestState") == 4)
      {
        v28 = *v10;
        if (!os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
          goto LABEL_21;
        v29 = (void *)MEMORY[0x1E0CB3940];
        v25 = v28;
        objc_msgSend(v29, "stringWithSiriButtonIdentifier:", a3);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        SASRequestStateGetName(-[SiriActivationService _requestState](self, "_requestState"));
        v30 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315906;
        v57 = "-[SiriActivationService buttonLongPressFromButtonIdentifier:deviceIdentifier:context:]";
        v58 = 2112;
        v59 = (uint64_t)v26;
        v60 = 2112;
        v61 = v9;
        v62 = 2112;
        v63 = v30;
        _os_log_error_impl(&dword_1D132F000, v25, OS_LOG_TYPE_ERROR, "%s #activation buttonLongPressFromButtonIdentifier:%@, context %@, but Siri state is %@. Ignoring.", buf, 0x2Au);
      }
      else
      {
        if (-[SiriActivationService _requestState](self, "_requestState") == 3)
        {
          v36 = -[SiriActivationService _buttonIsAVExternalButton:](self, "_buttonIsAVExternalButton:", a3);
          v37 = *v10;
          v38 = os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT);
          if (!v36)
          {
            if (v38)
            {
              v43 = (void *)MEMORY[0x1E0CB3940];
              v44 = v37;
              objc_msgSend(v43, "stringWithSiriButtonIdentifier:", a3);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              SASRequestStateGetName(-[SiriActivationService _requestState](self, "_requestState"));
              v46 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315906;
              v57 = "-[SiriActivationService buttonLongPressFromButtonIdentifier:deviceIdentifier:context:]";
              v58 = 2112;
              v59 = (uint64_t)v45;
              v60 = 2112;
              v61 = v9;
              v62 = 2112;
              v63 = v46;
              _os_log_impl(&dword_1D132F000, v44, OS_LOG_TYPE_DEFAULT, "%s #activation buttonLongPressFromButtonIdentifier:%@, context %@, but Siri state is %@. Passing to the Presentation Shell.", buf, 0x2Au);

            }
            aBlock[0] = MEMORY[0x1E0C809B0];
            aBlock[1] = 3221225472;
            aBlock[2] = __86__SiriActivationService_buttonLongPressFromButtonIdentifier_deviceIdentifier_context___block_invoke;
            aBlock[3] = &unk_1E91FC340;
            v47 = v9;
            v53 = v47;
            v54 = v8;
            v55 = a3;
            v48 = _Block_copy(aBlock);
            +[SASSystemState sharedSystemState](SASSystemState, "sharedSystemState");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = objc_msgSend(v49, "isATV");

            if (v50)
            {
              v51 = -[SASActivationRequest initWithButtonIdentifier:context:]([SASActivationRequest alloc], "initWithButtonIdentifier:context:", a3, v47);
              -[SASMyriadController activateForRequest:visible:](self->_myriadController, "activateForRequest:visible:", v51, -[SiriActivationService _requestState](self, "_requestState") == 3);

            }
            -[SASPresentationManager sendButtonEventCompletionToPresentations:forButtonEventType:](self->_presentationManager, "sendButtonEventCompletionToPresentations:forButtonEventType:", v48, 4);

            goto LABEL_21;
          }
          if (!v38)
            goto LABEL_21;
          v39 = (void *)MEMORY[0x1E0CB3940];
          v25 = v37;
          objc_msgSend(v39, "stringWithSiriButtonIdentifier:", a3);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          SASRequestStateGetName(-[SiriActivationService _requestState](self, "_requestState"));
          v30 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315906;
          v57 = "-[SiriActivationService buttonLongPressFromButtonIdentifier:deviceIdentifier:context:]";
          v58 = 2112;
          v59 = (uint64_t)v26;
          v60 = 2112;
          v61 = v9;
          v62 = 2112;
          v63 = v30;
          v40 = "%s #activation buttonLongPressFromButtonIdentifier:%@, context %@, but Siri state is %@ and we are in Ca"
                "rPlay. Ignoring because we should also be getting a button down/up.";
        }
        else
        {
          v41 = *v10;
          if (!os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
            goto LABEL_21;
          v42 = (void *)MEMORY[0x1E0CB3940];
          v25 = v41;
          objc_msgSend(v42, "stringWithSiriButtonIdentifier:", a3);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          SASRequestStateGetName(-[SiriActivationService _requestState](self, "_requestState"));
          v30 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315906;
          v57 = "-[SiriActivationService buttonLongPressFromButtonIdentifier:deviceIdentifier:context:]";
          v58 = 2112;
          v59 = (uint64_t)v26;
          v60 = 2112;
          v61 = v30;
          v62 = 2112;
          v63 = v9;
          v40 = "%s #activation buttonLongPressFromButtonIdentifier:%@, with Siri state %@, context: %@. Ignoring";
        }
        _os_log_impl(&dword_1D132F000, v25, OS_LOG_TYPE_DEFAULT, v40, buf, 0x2Au);
      }

      goto LABEL_12;
    }
    v31 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      v32 = (void *)MEMORY[0x1E0CB3940];
      v33 = v31;
      objc_msgSend(v32, "stringWithSiriButtonIdentifier:", a3);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      SASRequestStateGetName(-[SiriActivationService _requestState](self, "_requestState"));
      v35 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v57 = "-[SiriActivationService buttonLongPressFromButtonIdentifier:deviceIdentifier:context:]";
      v58 = 2112;
      v59 = (uint64_t)v34;
      v60 = 2112;
      v61 = v35;
      v62 = 2112;
      v63 = v9;
      _os_log_impl(&dword_1D132F000, v33, OS_LOG_TYPE_DEFAULT, "%s #activation buttonLongPressFromButtonIdentifier:%@, with Siri state %@, context %@. Activating.", buf, 0x2Au);

    }
    -[SiriActivationService activationRequestFromButtonIdentifier:context:](self, "activationRequestFromButtonIdentifier:context:", a3, v9);
  }
LABEL_21:

}

void __86__SiriActivationService_buttonLongPressFromButtonIdentifier_deviceIdentifier_context___block_invoke(uint64_t a1, void *a2)
{
  SASTimeIntervalTransport *v3;
  SASTimeIntervalTransport *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  SASButtonIdentifierTransport *v9;
  id v10;

  v10 = a2;
  v3 = [SASTimeIntervalTransport alloc];
  objc_msgSend(*(id *)(a1 + 32), "buttonDownTimestamp");
  v4 = -[SASTimeIntervalTransport initWithTimeInterval:](v3, "initWithTimeInterval:");
  v5 = *(id *)(a1 + 40);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "activeDeviceBluetoothIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v6;
  }
  objc_msgSend(v10, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SASButtonIdentifierTransport initWithSiriButtonIdentifier:]([SASButtonIdentifierTransport alloc], "initWithSiriButtonIdentifier:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v8, "handleButtonLongPressFromButtonIdentifier:deviceIdentifier:timestamp:context:", v9, v5, v4, *(_QWORD *)(a1 + 32));

}

- (BOOL)_buttonIsTVMicrophoneButton:(int64_t)a3
{
  return a3 == 201;
}

- (void)_handleTapSynthesisIfNeededForButtonIdentifier:(int64_t)a3 buttonUpTimestamp:(double)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  os_log_t *v14;
  NSObject *v15;
  double v16;
  int64_t v18;
  NSObject *v19;
  _BOOL4 v20;
  int v21;
  const char *v22;
  __int16 v23;
  double v24;
  __int16 v25;
  double v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (-[SiriActivationService _buttonIsAVExternalButton:](self, "_buttonIsAVExternalButton:")
    && -[SiriActivationService buttonDownHasOccurredSinceActivation](self, "buttonDownHasOccurredSinceActivation"))
  {
    -[SiriActivationService avExternalButtonEvents](self, "avExternalButtonEvents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithSiriButtonIdentifier:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[SiriActivationService avExternalButtonEvents](self, "avExternalButtonEvents");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithSiriButtonIdentifier:", a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObjectForKey:", v11);

      objc_msgSend(v9, "doubleValue");
      v13 = v12;
      v14 = (os_log_t *)MEMORY[0x1E0CFE6A0];
      v15 = *MEMORY[0x1E0CFE6A0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
      {
        v21 = 136315650;
        v22 = "-[SiriActivationService _handleTapSynthesisIfNeededForButtonIdentifier:buttonUpTimestamp:]";
        v23 = 2048;
        v24 = a4;
        v25 = 2048;
        v26 = v13;
        _os_log_impl(&dword_1D132F000, v15, OS_LOG_TYPE_DEFAULT, "%s buttonUpTimestamp: %f, buttonDownTimestamp: %f", (uint8_t *)&v21, 0x20u);
      }
      -[SiriActivationService activationTimestamp](self, "activationTimestamp");
      if (a4 - v13 < 0.4 && v16 != v13)
      {
        v18 = -[SiriActivationService _requestState](self, "_requestState");
        v19 = *v14;
        v20 = os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT);
        if (v18 == 3)
        {
          if (v20)
          {
            v21 = 136315138;
            v22 = "-[SiriActivationService _handleTapSynthesisIfNeededForButtonIdentifier:buttonUpTimestamp:]";
            _os_log_impl(&dword_1D132F000, v19, OS_LOG_TYPE_DEFAULT, "%s #activation synthesizing button tap", (uint8_t *)&v21, 0xCu);
          }
          -[SiriActivationService buttonTapFromButtonIdentifier:timestamp:context:](self, "buttonTapFromButtonIdentifier:timestamp:context:", a3, 0, a4);
        }
        else if (v20)
        {
          v21 = 136315138;
          v22 = "-[SiriActivationService _handleTapSynthesisIfNeededForButtonIdentifier:buttonUpTimestamp:]";
          _os_log_impl(&dword_1D132F000, v19, OS_LOG_TYPE_DEFAULT, "%s #activation button tap occurred, but Siri is not yet up. Not synthesizing tap event.", (uint8_t *)&v21, 0xCu);
        }
      }
    }

  }
}

- (void)_recordTimeIfNeededForButtonIdentifier:(int64_t)a3 buttonDownTimestamp:(double)a4
{
  void *v7;
  void *v8;
  id v9;

  if (-[SiriActivationService _buttonIsAVExternalButton:](self, "_buttonIsAVExternalButton:"))
  {
    -[SiriActivationService avExternalButtonEvents](self, "avExternalButtonEvents");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithSiriButtonIdentifier:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v7, v8);

  }
}

- (BOOL)_buttonIsAVExternalButton:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 6;
}

- (void)activationRequestFromDirectActionEventWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  NSObject *v9;
  void *v10;
  SASActivationRequest *v11;
  _BOOL8 v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  v8 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    objc_msgSend(v6, "directActionEvent");
    AFDirectActionEventGetName();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 136315394;
    v15 = "-[SiriActivationService activationRequestFromDirectActionEventWithContext:completion:]";
    v16 = 2112;
    v17 = v10;
    _os_log_impl(&dword_1D132F000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequestFromDirectActionEventWithContext:%@", (uint8_t *)&v14, 0x16u);

  }
  v11 = -[SASActivationRequest initWithDirectActionContext:]([SASActivationRequest alloc], "initWithDirectActionContext:", v6);
  v12 = -[SiriActivationService handleActivationRequest:](self, "handleActivationRequest:", v11);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v13, 0);

  }
}

- (void)activationRequestFromContinuityWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  SASActivationRequest *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[SiriActivationService activationRequestFromContinuityWithContext:]";
    _os_log_impl(&dword_1D132F000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequestFromContinuityWithContext", (uint8_t *)&v11, 0xCu);
  }
  if (!AFIsInternalInstall())
    goto LABEL_7;
  objc_msgSend(v4, "speechRequestOptions");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_7;
  v7 = (void *)v6;
  objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "designModeIsEnabled");

  if (v9)
  {
    -[SiriActivationService _handleDesignModeRequest](self, "_handleDesignModeRequest");
  }
  else
  {
LABEL_7:
    v10 = -[SASActivationRequest initWithContinuityContext:]([SASActivationRequest alloc], "initWithContinuityContext:", v4);
    -[SiriActivationService handleActivationRequest:](self, "handleActivationRequest:", v10);

  }
}

- (void)activationRequestFromVoiceTriggerWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  SASActivationRequest *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[SiriActivationService activationRequestFromVoiceTriggerWithContext:]";
    _os_log_impl(&dword_1D132F000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequestFromVoiceTriggerWithContext", (uint8_t *)&v9, 0xCu);
  }
  if (AFIsInternalInstall()
    && (objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "designModeIsEnabled"),
        v6,
        v7))
  {
    -[SiriActivationService _handleDesignModeRequest](self, "_handleDesignModeRequest");
  }
  else
  {
    v8 = -[SASActivationRequest initWithVoiceTriggerContext:]([SASActivationRequest alloc], "initWithVoiceTriggerContext:", v4);
    -[SiriActivationService handleActivationRequest:](self, "handleActivationRequest:", v8);

  }
}

- (void)activationRequestFromContinuousConversationWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  SASActivationRequest *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[SiriActivationService activationRequestFromContinuousConversationWithContext:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1D132F000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequestFromContinuousConversationWithContext with context: %@", (uint8_t *)&v7, 0x16u);
  }
  v6 = -[SASActivationRequest initWithContinuousConversationContext:]([SASActivationRequest alloc], "initWithContinuousConversationContext:", v4);
  -[SiriActivationService handleActivationRequest:](self, "handleActivationRequest:", v6);

}

- (void)activationRequestFromContinuousConversationHearstWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  SASActivationRequest *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[SiriActivationService activationRequestFromContinuousConversationHearstWithContext:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1D132F000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequestFromContinuousConversationHearstWithContext with context: %@", (uint8_t *)&v7, 0x16u);
  }
  v6 = -[SASActivationRequest initWithContinuousConversationHearstContext:]([SASActivationRequest alloc], "initWithContinuousConversationHearstContext:", v4);
  -[SiriActivationService handleActivationRequest:](self, "handleActivationRequest:", v6);

}

- (void)activationRequestFromContinuousConversationJarvisWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  SASActivationRequest *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[SiriActivationService activationRequestFromContinuousConversationJarvisWithContext:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1D132F000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequestFromContinuousConversationJarvisWithContext with context: %@", (uint8_t *)&v7, 0x16u);
  }
  v6 = -[SASActivationRequest initWithContinuousConversationJarvisContext:]([SASActivationRequest alloc], "initWithContinuousConversationJarvisContext:", v4);
  -[SiriActivationService handleActivationRequest:](self, "handleActivationRequest:", v6);

}

- (void)activationRequestFromBreadcrumb
{
  NSObject *v3;
  SASActivationRequest *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[SiriActivationService activationRequestFromBreadcrumb]";
    _os_log_impl(&dword_1D132F000, v3, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequestFromBreadcrumb", (uint8_t *)&v5, 0xCu);
  }
  v4 = -[SASActivationRequest initWithBreadcrumbRequest]([SASActivationRequest alloc], "initWithBreadcrumbRequest");
  -[SiriActivationService handleActivationRequest:](self, "handleActivationRequest:", v4);

}

- (void)activationRequestFromBluetoothKeyboardActivation:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  SASActivationRequest *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    SASRequestSourceGetName(a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315394;
    v10 = "-[SiriActivationService activationRequestFromBluetoothKeyboardActivation:]";
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_1D132F000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequestFromSimpleActivation:%@", (uint8_t *)&v9, 0x16u);

  }
  v8 = -[SASActivationRequest initWithBluetoothKeyboardShortcutActivation:]([SASActivationRequest alloc], "initWithBluetoothKeyboardShortcutActivation:", a3);
  -[SiriActivationService handleActivationRequest:](self, "handleActivationRequest:", v8);

}

- (void)activationRequestFromRemotePresentationBringUpWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  SASActivationRequest *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[SiriActivationService activationRequestFromRemotePresentationBringUpWithContext:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1D132F000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequestFromRemotePresentationBringUpWithContext:%@", (uint8_t *)&v7, 0x16u);
  }
  v6 = -[SASActivationRequest initWithRemotePresentationBringUpContext:]([SASActivationRequest alloc], "initWithRemotePresentationBringUpContext:", v4);
  -[SiriActivationService handleActivationRequest:](self, "handleActivationRequest:", v6);

}

- (void)activationRequestFromSimpleActivation:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  SASActivationRequest *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    SASRequestSourceGetName(a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315394;
    v10 = "-[SiriActivationService activationRequestFromSimpleActivation:]";
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_1D132F000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequestFromSimpleActivation:%@", (uint8_t *)&v9, 0x16u);

  }
  v8 = -[SASActivationRequest initWithSimpleActivation:]([SASActivationRequest alloc], "initWithSimpleActivation:", a3);
  -[SiriActivationService handleActivationRequest:](self, "handleActivationRequest:", v8);

}

- (void)activationRequestFromSpotlightWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  SASActivationRequest *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[SiriActivationService activationRequestFromSpotlightWithContext:]";
    _os_log_impl(&dword_1D132F000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequestFromSpotlightWithContext", (uint8_t *)&v7, 0xCu);
  }
  v6 = -[SASActivationRequest initWithSpotlightContext:]([SASActivationRequest alloc], "initWithSpotlightContext:", v4);
  -[SiriActivationService handleActivationRequest:](self, "handleActivationRequest:", v6);

}

- (void)activationRequestFromVoiceTrigger
{
  NSObject *v3;
  SASActivationRequest *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[SiriActivationService activationRequestFromVoiceTrigger]";
    _os_log_impl(&dword_1D132F000, v3, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequestFromVoiceTrigger", (uint8_t *)&v5, 0xCu);
  }
  v4 = -[SASActivationRequest initWithVoiceTriggerRequest]([SASActivationRequest alloc], "initWithVoiceTriggerRequest");
  -[SiriActivationService handleActivationRequest:](self, "handleActivationRequest:", v4);

}

- (void)activationRequestFromTestingWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  SASActivationRequest *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[SiriActivationService activationRequestFromTestingWithContext:]";
    _os_log_impl(&dword_1D132F000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequestFromTestingWithContext", (uint8_t *)&v7, 0xCu);
  }
  v6 = -[SASActivationRequest initWithTestingContext:]([SASActivationRequest alloc], "initWithTestingContext:", v4);
  -[SiriActivationService handleActivationRequest:](self, "handleActivationRequest:", v6);

}

- (void)activationRequestFromVocalShortcutWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  SASActivationRequest *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[SiriActivationService activationRequestFromVocalShortcutWithContext:]";
    _os_log_impl(&dword_1D132F000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequestFromVocalShortcutWithContext", (uint8_t *)&v7, 0xCu);
  }
  v6 = -[SASActivationRequest initWithVocalShortcutContext:]([SASActivationRequest alloc], "initWithVocalShortcutContext:", v4);
  -[SiriActivationService handleActivationRequest:](self, "handleActivationRequest:", v6);

}

- (void)speechRequestStateDidChange:(int64_t)a3
{
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[SiriActivationService speechRequestStateDidChange:]";
    v8 = 2048;
    v9 = a3;
    _os_log_impl(&dword_1D132F000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation speech request state did change (state = %ld)", (uint8_t *)&v6, 0x16u);
  }
  if (a3 == 1)
    -[SASMyriadController activateForInTaskRequest:isVisible:](self->_myriadController, "activateForInTaskRequest:isVisible:", 0, -[SiriActivationService _requestState](self, "_requestState") == 3);
}

- (BOOL)handleActivationRequest:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[SiriActivationService systemState](self, "systemState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[SiriActivationService handleActivationRequest:systemState:](self, "handleActivationRequest:systemState:", v4, v5);

  return (char)self;
}

- (BOOL)handleActivationRequest:(id)a3 systemState:(id)a4
{
  id v6;
  id v7;
  os_log_t *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  SASOverriddenSystemState *v14;
  void *v15;
  void *v16;
  SASOverriddenSystemState *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL8 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  os_log_t *v36;
  NSObject *v37;
  int64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  double v45;
  void *v46;
  NSObject *v47;
  NSObject *v48;
  float v49;
  BOOL v50;
  NSObject *v51;
  BOOL v52;
  SASOverriddenSystemState *v53;
  void *v54;
  SASRequestOptionsBuilder *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject **v66;
  NSObject *v67;
  void *v69;
  SASOverriddenSystemState *v70;
  _QWORD v71[4];
  _QWORD v72[4];
  uint8_t buf[4];
  const char *v74;
  __int16 v75;
  double v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v9 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)MEMORY[0x1E0CB3978];
    v11 = v9;
    objc_msgSend(v10, "currentThread");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v74 = "-[SiriActivationService handleActivationRequest:systemState:]";
    v75 = 2048;
    v76 = COERCE_DOUBLE(objc_msgSend(v12, "qualityOfService"));
    _os_log_impl(&dword_1D132F000, v11, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy handleActivationLock about to lock with qos: %zd", buf, 0x16u);

  }
  os_unfair_lock_lock(&handleActivationLock);
  v13 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v74 = "-[SiriActivationService handleActivationRequest:systemState:]";
    _os_log_impl(&dword_1D132F000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy handleActivationLock successfully locked", buf, 0xCu);
  }
  v14 = (SASOverriddenSystemState *)v7;
  objc_msgSend(v6, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "contextOverride");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v14;
  if (v16)
  {
    objc_msgSend(v6, "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "contextOverride");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = -[SASOverriddenSystemState initWithSystemState:contextOverride:]([SASOverriddenSystemState alloc], "initWithSystemState:contextOverride:", v14, v19);
  }
  -[SiriActivationService systemState](self, "systemState");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "lockStateMonitor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v69 = v21;
  v70 = v14;
  if (v21)
    v22 = objc_msgSend(v21, "lockState") == 0;
  else
    v22 = 1;
  v71[0] = CFSTR("activationEvent");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithSiriActivationEventType:", objc_msgSend(v6, "activationType"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v72[0] = v23;
  v71[1] = CFSTR("eventSource");
  objc_msgSend(v6, "eventSource");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v72[1] = v24;
  v71[2] = CFSTR("isDeviceUnlocked");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v72[2] = v25;
  v71[3] = CFSTR("clockTime");
  v26 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "timeIntervalSince1970");
  objc_msgSend(v26, "numberWithDouble:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v72[3] = v28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, v71, 4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v29, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SASOverriddenSystemState carDNDActive](v17, "carDNDActive"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKeyedSubscript:", v31, CFSTR("carDNDActive"));

  -[SASSystemState vehicleName](v17, "vehicleName");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKeyedSubscript:", v32, CFSTR("carVehicleName"));

  -[SASSystemState vehicleModel](v17, "vehicleModel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKeyedSubscript:", v33, CFSTR("carVehicleModelName"));

  -[SASSystemState vehicleManufacturer](v17, "vehicleManufacturer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKeyedSubscript:", v34, CFSTR("carVehicleManufacturer"));

  +[SASAnalytics analytics](SASAnalytics, "analytics");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "enqueueCurrentAnalyticsEventWithType:context:", 1404, v30);

  kdebug_trace();
  v36 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v37 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v74 = "-[SiriActivationService handleActivationRequest:systemState:]";
    v75 = 2112;
    v76 = *(double *)&v6;
    _os_log_impl(&dword_1D132F000, v37, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequest = %@", buf, 0x16u);
  }
  v38 = -[SASPresentationManager nextPresentationToActivate](self->_presentationManager, "nextPresentationToActivate");
  v39 = (void *)objc_opt_new();
  objc_msgSend(v39, "setRequest:", v6);
  objc_msgSend(v39, "setButtonTriggerStateActive:", self->_buttonTrigger != 0);
  objc_msgSend(v39, "setSystemState:", v17);
  +[SASSiriPocketStateManager sharedManager](SASSiriPocketStateManager, "sharedManager");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setPocketStateManager:", v40);

  -[SiriActivationService afPreferences](self, "afPreferences");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setPreferences:", v41);

  objc_msgSend(v39, "setRequestState:", -[SiriActivationService _requestState](self, "_requestState"));
  -[SiriActivationService assetUtilities](self, "assetUtilities");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setAssetUtilities:", v42);

  objc_msgSend(v39, "setPresentationIdentifier:", v38);
  -[SiriActivationService _uiPresentationIdentifierWithActivation:activationPresentation:](self, "_uiPresentationIdentifierWithActivation:activationPresentation:", v6, v38);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setUiPresentationIdentifier:", v43);

  if (+[SASActivationDecision canActivateForCondition:](SASActivationDecision, "canActivateForCondition:", v39))
  {
    if (!-[SiriActivationService _siriIsEnabled](self, "_siriIsEnabled"))
      -[SiriActivationService _cancelActivationPreparationForSetup](self, "_cancelActivationPreparationForSetup");
    if ((objc_msgSend(v6, "isUIFreeRequestSource") & 1) == 0
      && (objc_msgSend(v6, "isContinuousConversationRequest") & 1) == 0)
    {
      if (objc_msgSend(v6, "isVoiceRequest")
        && -[SASOverriddenSystemState isConnectedToCarPlay](v17, "isConnectedToCarPlay"))
      {
        v44 = objc_alloc(MEMORY[0x1E0CB37E8]);
        LODWORD(v45) = 0;
        v46 = (void *)objc_msgSend(v44, "initWithFloat:", v45);
        v47 = *v36;
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          v48 = v47;
          objc_msgSend(v46, "floatValue");
          *(_DWORD *)buf = 136315394;
          v74 = "-[SiriActivationService handleActivationRequest:systemState:]";
          v75 = 2048;
          v76 = v49;
          _os_log_impl(&dword_1D132F000, v48, OS_LOG_TYPE_DEFAULT, "%s #activation Voice request on CarPlay, delaying Myriad decision by %f ms", buf, 0x16u);

        }
        v50 = -[SASMyriadController activateForRequest:withTimeout:visible:](self->_myriadController, "activateForRequest:withTimeout:visible:", v6, v46, -[SiriActivationService _requestState](self, "_requestState") == 3);

        v36 = (os_log_t *)MEMORY[0x1E0CFE6A0];
        if (!v50)
        {
LABEL_22:
          -[SiriActivationService _cancelPendingActivationEventWithReason:](self, "_cancelPendingActivationEventWithReason:", 4);
          os_unfair_lock_unlock(&handleActivationLock);
          v51 = *v36;
          v52 = 0;
          v53 = v70;
          if (os_log_type_enabled(*v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v74 = "-[SiriActivationService handleActivationRequest:systemState:]";
LABEL_26:
            _os_log_impl(&dword_1D132F000, v51, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy handleActivationLock unlocked", buf, 0xCu);
            v52 = 0;
            goto LABEL_40;
          }
          goto LABEL_40;
        }
      }
      else if (!-[SASMyriadController activateForRequest:withTimeout:visible:](self->_myriadController, "activateForRequest:withTimeout:visible:", v6, 0, -[SiriActivationService _requestState](self, "_requestState") == 3))
      {
        goto LABEL_22;
      }
    }
    +[SASAnalytics analytics](SASAnalytics, "analytics");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "flushPendingAnalyticsEventQueue");

    v55 = objc_alloc_init(SASRequestOptionsBuilder);
    -[SASRequestOptionsBuilder buildOptionsWithRequest:presentationIdentifier:dataSource:](v55, "buildOptionsWithRequest:presentationIdentifier:dataSource:", v6, v38, self);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38 == 2)
    {
      v57 = objc_alloc_init(MEMORY[0x1E0D9A3F8]);
      -[SASSystemState vehicleManufacturer](v17, "vehicleManufacturer");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setVehicleManufacturer:", v58);

      -[SASSystemState vehicleModel](v17, "vehicleModel");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setVehicleModel:", v59);

      -[SASSystemState vehicleName](v17, "vehicleName");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setVehicleName:", v60);

      objc_msgSend(v56, "instrumentationEvents");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "addObject:", v57);

    }
    -[SiriActivationService testingInputController](self, "testingInputController");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "dequeuePreloadedTestingContext");
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    if (v63
      && (objc_msgSend(v56, "testingContext"), v64 = (void *)objc_claimAutoreleasedReturnValue(),
                                               v64,
                                               !v64))
    {
      objc_msgSend(v63, "testingContext");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "setTestingContext:", v65);
    }
    else
    {
      -[SiriActivationService _updateRequestOptionsWithTestingContextFromActivationRequest:requestOptions:](self, "_updateRequestOptionsWithTestingContextFromActivationRequest:requestOptions:", v6, v56);
      v65 = v56;
      v56 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v53 = v70;
    if (-[SiriActivationService _requestState](self, "_requestState") == 3)
    {
      -[SASPresentationManager activePresentations_handleRequestWithOptions:](self->_presentationManager, "activePresentations_handleRequestWithOptions:", v56);
    }
    else
    {
      -[SiriActivationService _activatePresentationWithIdentifier:requestOptions:analyticsContext:](self, "_activatePresentationWithIdentifier:requestOptions:analyticsContext:", v38, v56, v30);
      -[SiriActivationService _logActivationToPowerLogWithReason:](self, "_logActivationToPowerLogWithReason:", objc_msgSend(v6, "activationType"));
    }
    v66 = (NSObject **)MEMORY[0x1E0CFE6A0];
    os_unfair_lock_unlock(&handleActivationLock);
    v67 = *v66;
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v74 = "-[SiriActivationService handleActivationRequest:systemState:]";
      _os_log_impl(&dword_1D132F000, v67, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy handleActivationLock unlocked", buf, 0xCu);
    }

    v52 = 1;
    goto LABEL_40;
  }
  -[SiriActivationService _cancelPendingActivationEventWithReason:](self, "_cancelPendingActivationEventWithReason:", 4);
  os_unfair_lock_unlock(&handleActivationLock);
  v51 = *v36;
  v52 = 0;
  v53 = v70;
  if (os_log_type_enabled(*v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v74 = "-[SiriActivationService handleActivationRequest:systemState:]";
    goto LABEL_26;
  }
LABEL_40:

  return v52;
}

- (void)_logActivationToPowerLogWithReason:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("ReasonStart");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogRegisteredEvent();
}

- (void)_activatePresentationWithIdentifier:(int64_t)a3 requestOptions:(id)a4 analyticsContext:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17[2];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = v10;
    objc_msgSend(v11, "stringWithSiriPresentationIdentifier:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v19 = "-[SiriActivationService _activatePresentationWithIdentifier:requestOptions:analyticsContext:]";
    v20 = 2112;
    v21 = v13;
    _os_log_impl(&dword_1D132F000, v12, OS_LOG_TYPE_DEFAULT, "%s #activation _activatePresentation %@", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __93__SiriActivationService__activatePresentationWithIdentifier_requestOptions_analyticsContext___block_invoke;
  v15[3] = &unk_1E91FBF40;
  objc_copyWeak(v17, (id *)buf);
  v14 = v8;
  v16 = v14;
  v17[1] = (id)a3;
  SiriInvokeOnMainQueue(v15);

  objc_destroyWeak(v17);
  objc_destroyWeak((id *)buf);

}

void __93__SiriActivationService__activatePresentationWithIdentifier_requestOptions_analyticsContext___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  SiriPresentationOptions *v3;
  uint64_t v4;
  os_log_t *v5;
  NSObject *v6;
  void *v7;
  int v8;
  int v9;
  unint64_t v10;
  char v11;
  os_log_t v12;
  char v13;
  char v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  unint64_t v18;
  char v19;
  char v20;
  char v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = -[SiriPresentationOptions initWithBuilder:]([SiriPresentationOptions alloc], "initWithBuilder:", 0);
    v4 = objc_msgSend(WeakRetained, "_shouldHandlePocketStateFetchForRequestOptions:", *(_QWORD *)(a1 + 32));
    v5 = (os_log_t *)MEMORY[0x1E0CFE6A0];
    v6 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[SiriActivationService _activatePresentationWithIdentifier:requestOptions:analyticsContext:]_block_invoke";
      v24 = 1024;
      v25 = v4;
      _os_log_impl(&dword_1D132F000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation Deferring wake, shouldHandlePocketStateFetch: (%{BOOL}d)", buf, 0x12u);
    }
    objc_msgSend(WeakRetained[24], "presentationWithPresentationIdentifier:activationDeterminedShouldDeferWake:", *(_QWORD *)(a1 + 48), v4);
    if ((_DWORD)v4)
      objc_msgSend(WeakRetained, "_handlePocketStateFetchForScreenWakeForPresentationIdentifier:", *(_QWORD *)(a1 + 48));
    if (objc_msgSend(*(id *)(a1 + 32), "isHTTRequestSource"))
    {
      objc_msgSend(*(id *)(a1 + 32), "buttonDownTimestamp");
      objc_msgSend(WeakRetained, "setActivationTimestamp:");
    }
    objc_msgSend(WeakRetained[24], "presentationWithPresentationIdentifierBeganStarting:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "uiPresentationIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.siri.UIFree"));
    v9 = objc_msgSend(WeakRetained, "_isVoiceActivationMaskNecessaryWithRequestOptions:", *(_QWORD *)(a1 + 32)) | v4 | v8;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.siri.Compact")) & 1) != 0)
    {
      v10 = 2;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.siri.SystemAssistantExperience")))
    {
      v10 = 2;
    }
    else
    {
      v10 = 1;
    }
    v11 = v9 ^ 1;
    v12 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG))
      __93__SiriActivationService__activatePresentationWithIdentifier_requestOptions_analyticsContext___block_invoke_cold_1(v12, v10, (uint64_t)v7);
    if (_SiriActivationDeviceSupportsPearlID_onceToken != -1)
      dispatch_once(&_SiriActivationDeviceSupportsPearlID_onceToken, &__block_literal_global_510);
    v13 = _SiriActivationDeviceSupportsPearlID_deviceSupportsPearlID;
    v14 = AFDeviceSupportsSystemAssistantExperience();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __93__SiriActivationService__activatePresentationWithIdentifier_requestOptions_analyticsContext___block_invoke_128;
    v16[3] = &unk_1E91FC368;
    v19 = v13;
    v20 = v14 ^ 1;
    v21 = v11;
    v18 = v10;
    v17 = *(id *)(a1 + 32);
    -[SiriPresentationOptions mutatedCopyWithMutator:](v3, "mutatedCopyWithMutator:", v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained[24], "presentationRequestedWithPresentationIdentifier:presentationOptions:requestOptions:", *(_QWORD *)(a1 + 48), v15, *(_QWORD *)(a1 + 32));
  }

}

void __93__SiriActivationService__activatePresentationWithIdentifier_requestOptions_analyticsContext___block_invoke_128(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned __int8 *)(a1 + 48);
  v4 = a2;
  objc_msgSend(v4, "setShouldAllowBiometricAutoUnlock:", v3);
  objc_msgSend(v4, "setShouldDeactivateScenesBelow:", *(unsigned __int8 *)(a1 + 49));
  objc_msgSend(v4, "setWakeScreen:", *(unsigned __int8 *)(a1 + 50));
  objc_msgSend(v4, "setRotationStyle:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setRequestSource:", objc_msgSend(*(id *)(a1 + 32), "requestSource"));
  objc_msgSend(v4, "setInputType:", objc_msgSend(*(id *)(a1 + 32), "inputType"));

}

- (BOOL)_shouldHandlePocketStateFetchForRequestOptions:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  NSObject *v12;
  int v13;
  _BOOL4 v14;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "isWiredMicOrBTHeadsetOrWx"))
    goto LABEL_10;
  soft_SBUIGetUserAgent();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isScreenOn");

  if (_SiriActivationDeviceSupportsProxSensor_onceToken != -1)
    dispatch_once(&_SiriActivationDeviceSupportsProxSensor_onceToken, &__block_literal_global_507);
  v7 = _SiriActivationDeviceSupportsProxSensor_deviceSupportsProxSensor;
  objc_msgSend(v4, "uiPresentationIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.siri.EyesFree"));

  objc_msgSend(v4, "uiPresentationIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.siri.BluetoothCar"));

  v12 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136316162;
    v17 = "-[SiriActivationService _shouldHandlePocketStateFetchForRequestOptions:]";
    v18 = 1024;
    v19 = v6 ^ 1;
    v20 = 1024;
    v21 = v7;
    v22 = 1024;
    v23 = v9;
    v24 = 1024;
    v25 = v11;
    _os_log_impl(&dword_1D132F000, v12, OS_LOG_TYPE_DEFAULT, "%s #activation should handle pocket state fetch via isScreenOff (%{BOOL}d) && siriActivationDeviceSupportsProxSensor (%{BOOL}d) && !(requestIsEyesFree (%{BOOL}d) || requestIsBluetoothCar (%{BOOL}d))", (uint8_t *)&v16, 0x24u);
  }
  v13 = v7 ? v6 : 1;
  if (((v13 | v9 | v11) & 1) == 0)
    v14 = !-[SiriActivationService _pocketStateFetchingInProgressForHeadsetActivation](self, "_pocketStateFetchingInProgressForHeadsetActivation");
  else
LABEL_10:
    LOBYTE(v14) = 0;

  return v14;
}

- (void)_handlePocketStateFetchForScreenWakeForPresentationIdentifier:(int64_t)a3
{
  void *v5;
  _QWORD v6[4];
  id v7[2];
  id location;

  -[SiriActivationService _setPocketStateFetchingInProgressForHeadsetActivation:](self, "_setPocketStateFetchingInProgressForHeadsetActivation:", 1);
  objc_initWeak(&location, self);
  +[SASSiriPocketStateManager sharedManager](SASSiriPocketStateManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __87__SiriActivationService__handlePocketStateFetchForScreenWakeForPresentationIdentifier___block_invoke;
  v6[3] = &unk_1E91FC390;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  objc_msgSend(v5, "queryForPocketStateWithCompletion:", v6);

  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __87__SiriActivationService__handlePocketStateFetchForScreenWakeForPresentationIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id *WeakRetained;
  id *v7;
  int v8;
  char v9;
  unint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_8;
  objc_msgSend(WeakRetained, "_setPocketStateFetchingInProgressForHeadsetActivation:", 0);
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
      __87__SiriActivationService__handlePocketStateFetchForScreenWakeForPresentationIdentifier___block_invoke_cold_1();
  }
  else
  {
    v10 = a2 & 0xFFFFFFFFFFFFFFFDLL;
    v11 = *MEMORY[0x1E0CFE6A0];
    v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT);
    if (v10 == 1)
    {
      if (v12)
      {
        v13 = 136315138;
        v14 = "-[SiriActivationService _handlePocketStateFetchForScreenWakeForPresentationIdentifier:]_block_invoke";
        _os_log_impl(&dword_1D132F000, v11, OS_LOG_TYPE_DEFAULT, "%s #activation #SiriPocketStateManager: Device is face down on table or in pocket. Leaving screen off.", (uint8_t *)&v13, 0xCu);
      }
      v8 = 0;
      goto LABEL_6;
    }
    if (v12)
    {
      v13 = 136315138;
      v14 = "-[SiriActivationService _handlePocketStateFetchForScreenWakeForPresentationIdentifier:]_block_invoke";
      _os_log_impl(&dword_1D132F000, v11, OS_LOG_TYPE_DEFAULT, "%s #activation #SiriPocketStateManager: Turning on the screen...", (uint8_t *)&v13, 0xCu);
    }
  }
  v8 = 1;
LABEL_6:
  v9 = v8 ^ 1;
  objc_msgSend(v7[24], "presentationWithPresentationIdentifier:activationDeterminedShouldDeferWake:", *(_QWORD *)(a1 + 40), v8 ^ 1u);
  if ((v9 & 1) == 0)
    objc_msgSend(v7[24], "presentationWithPresentationIdentifierWakeScreenAfterActivation:reason:", *(_QWORD *)(a1 + 40), CFSTR("PocketStateFetch"));
LABEL_8:

}

- (void)_dismissSiri:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[SiriActivationService _dismissSiri:]";
    _os_log_impl(&dword_1D132F000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation", (uint8_t *)&v6, 0xCu);
  }
  -[SASPresentationManager startingAndActiveAndStoppingPresentations_presentationDismissalRequestedWithOptions:](self->_presentationManager, "startingAndActiveAndStoppingPresentations_presentationDismissalRequestedWithOptions:", v4);

}

- (void)_preheatPresentation
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[SiriActivationService _preheatPresentation]";
    _os_log_impl(&dword_1D132F000, v3, OS_LOG_TYPE_DEFAULT, "%s #activation", (uint8_t *)&v4, 0xCu);
  }
  -[SASPresentationManager preheatNextPresentationToActivate](self->_presentationManager, "preheatNextPresentationToActivate");
}

- (void)_attachToTether
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[SiriActivationService _attachToTether]";
    _os_log_impl(&dword_1D132F000, v3, OS_LOG_TYPE_DEFAULT, "%s #activation _attachToTether", (uint8_t *)&v5, 0xCu);
  }
  -[SiriActivationService siriTether](self, "siriTether");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attach:", 0);

}

- (void)_cancelActivationPreparationForSetup
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[SiriActivationService _cancelActivationPreparationForSetup]";
    _os_log_impl(&dword_1D132F000, v3, OS_LOG_TYPE_DEFAULT, "%s #activation _cancelActivationPreparationForSetup", (uint8_t *)&v4, 0xCu);
  }
  -[SiriActivationService _cancelPendingActivationEventWithReason:](self, "_cancelPendingActivationEventWithReason:", 1);
}

- (void)_cancelPendingActivationEventWithReason:(unint64_t)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = v5;
    objc_msgSend(v6, "stringWithSiriPresentationActivationCancelReason:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315394;
    v10 = "-[SiriActivationService _cancelPendingActivationEventWithReason:]";
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_1D132F000, v7, OS_LOG_TYPE_DEFAULT, "%s #activation _cancelPendingActivationEventWithReason:%@", (uint8_t *)&v9, 0x16u);

  }
  -[SASPresentationManager startingPresentations_cancelPendingActivationWithReason:](self->_presentationManager, "startingPresentations_cancelPendingActivationWithReason:", a3);
}

- (void)_handleDesignModeRequest
{
  NSObject *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[SiriActivationService _handleDesignModeRequest]";
    _os_log_impl(&dword_1D132F000, v2, OS_LOG_TYPE_DEFAULT, "%s #activation activating in design mode", (uint8_t *)&v4, 0xCu);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.siri.internal.activation"), 0, 0, 1u);
}

- (BOOL)_siriIsEnabled
{
  void *v3;
  void *v4;
  int v5;

  -[SiriActivationService systemState](self, "systemState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "siriIsEnabled"))
  {
    -[SiriActivationService systemState](self, "systemState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "siriIsRestricted") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)_isVoiceActivationMaskNecessaryWithRequestOptions:(id)a3
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;

  v3 = a3;
  soft_SBUIGetUserAgent();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isScreenOn") ^ 1;

  v6 = objc_msgSend(v3, "requestSource");
  if (v6 == 8)
    return v5;
  else
    return 0;
}

- (AFPreferences)afPreferences
{
  AFPreferences *afPreferences;
  AFPreferences *v4;
  AFPreferences *v5;

  afPreferences = self->_afPreferences;
  if (!afPreferences)
  {
    objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
    v4 = (AFPreferences *)objc_claimAutoreleasedReturnValue();
    v5 = self->_afPreferences;
    self->_afPreferences = v4;

    afPreferences = self->_afPreferences;
  }
  return afPreferences;
}

- (BOOL)requestOptionsBuilder:(id)a3 shouldRequestUseAutomaticEndpointingWithActiviation:(id)a4
{
  return 1;
}

- (BOOL)requestOptionsBuilder:(id)a3 isPredictedRecordRouteIsZLLWithActiviation:(id)a4
{
  void *v4;
  char v5;

  -[SiriActivationService heater](self, "heater", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "predictedRecordRouteIsZLL");

  return v5;
}

- (BOOL)requestOptionsBuilder:(id)a3 isAcousticIdAllowedWithActiviation:(id)a4
{
  id v5;
  int v6;

  v5 = a4;
  if (-[SiriActivationService _isInitialRequest](self, "_isInitialRequest"))
    v6 = objc_msgSend(v5, "isVoiceRequest") ^ 1;
  else
    LOBYTE(v6) = 0;

  return v6;
}

- (id)requestOptionsBuilder:(id)a3 uiPresentationIdentifierWithActivation:(id)a4 activationPresentation:(int64_t)a5
{
  return -[SiriActivationService _uiPresentationIdentifierWithActivation:activationPresentation:](self, "_uiPresentationIdentifierWithActivation:activationPresentation:", a4, a5);
}

- (id)_uiPresentationIdentifierWithActivation:(id)a3 activationPresentation:(int64_t)a4
{
  id v6;
  int v7;
  _BOOL4 v8;
  int v9;
  void *v10;
  _BOOL4 v11;
  __CFString *v12;
  __CFString *v14;
  const __CFString *v15;

  v6 = a3;
  v7 = objc_msgSend(v6, "isUIFreeRequestSource");
  v8 = -[SiriActivationService _isEyesFreeEligibleWithRequest:](self, "_isEyesFreeEligibleWithRequest:", v6);

  if (-[SiriActivationService _eyesFreeRedesignOnlySteeringWheelEnabled](self, "_eyesFreeRedesignOnlySteeringWheelEnabled"))
  {
    v9 = 0;
  }
  else
  {
    -[SiriActivationService bluetoothEndpointUtil](self, "bluetoothEndpointUtil");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "isConnectedToBluetoothVehicle");

  }
  v11 = -[SiriActivationService _isSAEEnabled](self, "_isSAEEnabled");
  if (a4 == 2)
  {
    v12 = CFSTR("com.apple.siri.CarDisplay");
    if (v7)
      v12 = CFSTR("com.apple.siri.CarDisplay.UIFree");
    return v12;
  }
  else
  {
    v14 = CFSTR("com.apple.siri.Compact");
    v15 = CFSTR("com.apple.siri.SystemAssistantExperience");
    if (!v11)
      v15 = CFSTR("com.apple.siri.Compact");
    if (v9)
      v15 = CFSTR("com.apple.siri.BluetoothCar");
    if (v8)
      v15 = CFSTR("com.apple.siri.EyesFree");
    if (a4 == 1)
      v14 = (__CFString *)v15;
    if (a4 == 4)
      v14 = CFSTR("com.apple.siri.SiriTVPresentation");
    if ((v7 & 1) != 0)
      return CFSTR("com.apple.siri.UIFree");
    else
      return v14;
  }
}

- (BOOL)_isEyesFreeEligibleWithRequest:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  int v9;
  _BOOL4 v10;
  char v11;
  char v12;
  NSObject *v13;
  char v14;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SiriActivationService systemState](self, "systemState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isConnectedToEyesFreeDevice");

  -[SiriActivationService systemState](self, "systemState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "carDNDActive");

  v9 = AFPreferencesAlwaysEyesFreeEnabled();
  v10 = objc_msgSend(v4, "requestSource") == 5 || objc_msgSend(v4, "requestSource") == 43;
  v11 = _os_feature_enabled_impl();
  v12 = _os_feature_enabled_impl();
  v13 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136316162;
    v17 = "-[SiriActivationService _isEyesFreeEligibleWithRequest:]";
    v18 = 1024;
    v19 = v8;
    v20 = 1024;
    v21 = v9;
    v22 = 1024;
    v23 = v6;
    v24 = 1024;
    v25 = v10;
    _os_log_impl(&dword_1D132F000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation checking if EyesFree is eligible: isCarDND = %d, isDebugSettingOn = %d, isEyesFreeDevice = %d, isRequestSourceEyesFreeEligible = %d", (uint8_t *)&v16, 0x24u);
  }
  v14 = v8 | v9;
  if ((v14 & 1) == 0 && ((v6 ^ 1) & 1) == 0)
    v14 = (v10 | ~v11) & (v12 ^ 1);

  return v14;
}

- (id)requestOptionsBuilder:(id)a3 optionsForOverriding:(id)a4 withActiviation:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a5;
  if (objc_msgSend(v7, "isTestingRequest"))
  {
    objc_msgSend(v7, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "testingContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTestingContext:", v9);

  }
  return v6;
}

- (unint64_t)requestOptionsBuilder:(id)a3 currentLockStateForActivation:(id)a4
{
  void *v4;
  void *v5;
  unint64_t v6;

  -[SiriActivationService systemState](self, "systemState", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lockStateMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "lockState");

  return v6;
}

- (BOOL)requestOptionsBuilder:(id)a3 isSiriCarBluetoothRequest:(id)a4
{
  return -[SASBluetoothEndpointUtility isConnectedToBluetoothVehicle](self->_bluetoothEndpointUtil, "isConnectedToBluetoothVehicle", a3, a4);
}

- (void)updatePredicatedRecordRoute
{
  -[SASHeater updatePredictedRouteIsZLL](self->_heater, "updatePredictedRouteIsZLL");
}

- (BOOL)_isInitialRequest
{
  return -[SiriActivationService _requestState](self, "_requestState") != 3;
}

- (void)heaterSuggestsPreheating:(id)a3
{
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = -[SiriActivationService _requestState](self, "_requestState", a3);
  v5 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    SASRequestStateGetName(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315394;
    v9 = "-[SiriActivationService heaterSuggestsPreheating:]";
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_1D132F000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation preheat; request state = %@",
      (uint8_t *)&v8,
      0x16u);

  }
  kdebug_trace();
  -[SiriActivationService _preheatPresentation](self, "_preheatPresentation");
}

- (void)heater:(id)a3 cancelledPreparationWithButtonIdentifier:(int64_t)a4 duration:(double)a5 targetDuration:(double)a6
{
  -[SiriActivationService _logCancelledActivationWithButtonIdentifier:duration:targetDuration:](self, "_logCancelledActivationWithButtonIdentifier:duration:targetDuration:", a4, a5, a6);
}

- (BOOL)_logCancelledActivationWithButtonIdentifier:(int64_t)a3 duration:(double)a4 targetDuration:(double)a5
{
  void *v8;
  void *v9;
  int v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  double v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (fabs(a5 + -0.4) < 2.22044605e-16 || fabs(a5 + -0.65) >= 2.22044605e-16 || _AXSHomeButtonAssistant())
    return 0;
  +[SASSystemState sharedSystemState](SASSystemState, "sharedSystemState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "siriIsSupported") & 1) == 0)
  {

    return 0;
  }
  +[SASSystemState sharedSystemState](SASSystemState, "sharedSystemState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "siriIsEnabled");

  if (!v10)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithSiriButtonIdentifier:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = a4 > 0.2;
  v13 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v17 = "-[SiriActivationService _logCancelledActivationWithButtonIdentifier:duration:targetDuration:]";
    v18 = 2112;
    v19 = v11;
    v20 = 2048;
    v21 = a4;
    v22 = 1024;
    v23 = a4 > 0.2;
    v24 = 2048;
    v25 = a5;
    _os_log_impl(&dword_1D132F000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation cancelledPreparationWithButtonIdentifier: %@ duration: %f, willSendEvent: %d, targetDuration: %f, ", buf, 0x30u);
  }
  if (a4 > 0.2)
  {
    v15 = v11;
    AnalyticsSendEventLazy();

  }
  return v12;
}

id __93__SiriActivationService__logCancelledActivationWithButtonIdentifier_duration_targetDuration___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("duration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v9[0] = v2;
  v9[1] = v3;
  v8[1] = CFSTR("buttonIdentifier");
  v8[2] = CFSTR("targetDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v4;
  v8[3] = CFSTR("targetDurationEnum");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)activationRequestFromTestRunnerWithContext:(id)a3
{
  id v4;
  void *v5;
  SASActivationRequest *v6;

  v4 = a3;
  v6 = -[SASActivationRequest initWithTestingContext:]([SASActivationRequest alloc], "initWithTestingContext:", v4);

  -[SiriActivationService systemState](self, "systemState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriActivationService handleActivationRequest:systemState:](self, "handleActivationRequest:systemState:", v6, v5);

}

- (void)_unregisterForVoiceTrigger
{
  if (self->_voiceTriggerNotifyTokenIsValid)
  {
    notify_cancel(self->_voiceTriggerNotifyToken);
    self->_voiceTriggerNotifyTokenIsValid = 0;
  }
}

- (void)shouldAbort:(id)a3
{
  NSObject *v4;
  SiriDismissalOptions *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[SiriActivationService shouldAbort:]";
    _os_log_impl(&dword_1D132F000, v4, OS_LOG_TYPE_DEFAULT, "%s #myriad BTLE Device should abort session", (uint8_t *)&v6, 0xCu);
  }
  v5 = -[SiriDismissalOptions initWithDeactivationOptions:animated:requestCancellationReason:dismissalReason:shouldTurnScreenOff:]([SiriDismissalOptions alloc], "initWithDeactivationOptions:animated:requestCancellationReason:dismissalReason:shouldTurnScreenOff:", 0, 1, 1, 8, 0);
  -[SiriActivationService dismissSiriWithOptions:](self, "dismissSiriWithOptions:", v5);

}

- (void)shouldContinue:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[SiriActivationService shouldContinue:]";
    _os_log_impl(&dword_1D132F000, v4, OS_LOG_TYPE_DEFAULT, "%s #myriad BTLE Device continues to interact, device won election", (uint8_t *)&v5, 0xCu);
  }
  -[SASPresentationManager activePresentations_deviceWonMyriadElection](self->_presentationManager, "activePresentations_deviceWonMyriadElection");
}

- (void)scdaShouldAbort:(id)a3
{
  NSObject *v4;
  SiriDismissalOptions *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[SiriActivationService scdaShouldAbort:]";
    _os_log_impl(&dword_1D132F000, v4, OS_LOG_TYPE_DEFAULT, "%s #myriad SCDA should abort session", (uint8_t *)&v6, 0xCu);
  }
  v5 = -[SiriDismissalOptions initWithDeactivationOptions:animated:requestCancellationReason:dismissalReason:shouldTurnScreenOff:]([SiriDismissalOptions alloc], "initWithDeactivationOptions:animated:requestCancellationReason:dismissalReason:shouldTurnScreenOff:", 0, 1, 1, 8, 0);
  -[SiriActivationService dismissSiriWithOptions:](self, "dismissSiriWithOptions:", v5);

}

- (void)scdaShouldContinue:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[SiriActivationService scdaShouldContinue:]";
    _os_log_impl(&dword_1D132F000, v4, OS_LOG_TYPE_DEFAULT, "%s #myriad SCDA continues to interact, device won election", (uint8_t *)&v5, 0xCu);
  }
  -[SASPresentationManager activePresentations_deviceWonMyriadElection](self->_presentationManager, "activePresentations_deviceWonMyriadElection");
}

- (void)didChangeLockState:(unint64_t)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    v7 = v5;
    objc_msgSend(v6, "numberWithUnsignedInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315394;
    v10 = "-[SiriActivationService didChangeLockState:]";
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_1D132F000, v7, OS_LOG_TYPE_DEFAULT, "%s #activation lockState: %@", (uint8_t *)&v9, 0x16u);

  }
  -[SASPresentationManager activeAndStartingPresentations_updateCurrentLockState:](self->_presentationManager, "activeAndStartingPresentations_updateCurrentLockState:", a3);
}

- (id)allBulletins
{
  void *v2;
  void *v3;

  -[SiriActivationService bulletinManager](self, "bulletinManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allBulletins");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)bulletinsOnLockScreen
{
  void *v2;
  void *v3;

  -[SiriActivationService bulletinManager](self, "bulletinManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bulletinsOnLockScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)bulletinForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SiriActivationService bulletinManager](self, "bulletinManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bulletinForIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)bulletinManagerDidChangeBulletins:(id)a3
{
  -[SASPresentationManager activePresentations_bulletinManagerDidChangeBulletins](self->_presentationManager, "activePresentations_bulletinManagerDidChangeBulletins", a3);
}

- (void)callStateChangedToIsActive:(BOOL)a3 isOutgoing:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v4 = a4;
  v5 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  v7 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    v9 = v7;
    objc_msgSend(v8, "numberWithBool:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315650;
    v13 = "-[SiriActivationService callStateChangedToIsActive:isOutgoing:]";
    v14 = 2112;
    v15 = v10;
    v16 = 2112;
    v17 = v11;
    _os_log_impl(&dword_1D132F000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation callStateChangedToIsActive: %@ isOutgoing: %@", (uint8_t *)&v12, 0x20u);

  }
  -[SiriActivationService _updateCanActivateFromDirectActionSource](self, "_updateCanActivateFromDirectActionSource");
}

- (void)assessmentModeChangedToIsActive:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int64_t v11;
  void *v12;
  id didDismissForAssesmentModeStartedCompeltion;
  SiriDismissalOptions *v14;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v4 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    v9 = v7;
    objc_msgSend(v8, "numberWithBool:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 136315394;
    v16 = "-[SiriActivationService assessmentModeChangedToIsActive:completion:]";
    v17 = 2112;
    v18 = v10;
    _os_log_impl(&dword_1D132F000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation assessmentModeChangedToIsActive: %@", (uint8_t *)&v15, 0x16u);

  }
  -[SiriActivationService _updateCanActivateFromDirectActionSource](self, "_updateCanActivateFromDirectActionSource");
  v11 = -[SiriActivationService _requestState](self, "_requestState");
  if (v4 && v11 == 3)
  {
    v12 = _Block_copy(v6);
    didDismissForAssesmentModeStartedCompeltion = self->_didDismissForAssesmentModeStartedCompeltion;
    self->_didDismissForAssesmentModeStartedCompeltion = v12;

    v14 = -[SiriDismissalOptions initWithDeactivationOptions:animated:dismissalReason:]([SiriDismissalOptions alloc], "initWithDeactivationOptions:animated:dismissalReason:", 0, 0, 60);
    -[SiriActivationService _dismissSiri:](self, "_dismissSiri:", v14);

  }
  else if (v6)
  {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
  }

}

- (void)presentationManager:(id)a3 didChangeAggregateState:(id)a4
{
  -[SiriActivationService _notifySourcesOfPresentationStateChange:](self, "_notifySourcesOfPresentationStateChange:", a4);
  -[SiriActivationService _updateCanActivateFromDirectActionSource](self, "_updateCanActivateFromDirectActionSource");
}

- (void)presentationManager:(id)a3 didEncounterError:(int64_t)a4
{
  void *v6;
  SiriDismissalOptions *v7;

  v6 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
    -[SiriActivationService presentationManager:didEncounterError:].cold.1(v6, a4);
  v7 = -[SiriDismissalOptions initWithDeactivationOptions:animated:dismissalReason:]([SiriDismissalOptions alloc], "initWithDeactivationOptions:animated:dismissalReason:", 0, 0, 28);
  -[SiriActivationService _dismissSiri:](self, "_dismissSiri:", v7);

}

- (void)pongWithPresentationIdentifier:(int64_t)a3
{
  -[SASPresentationManager pongWithPresentationIdentifier:](self->_presentationManager, "pongWithPresentationIdentifier:", a3);
}

- (id)_updateRequestOptionsWithTestingContextFromActivationRequest:(id)a3 requestOptions:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  __CFString *v30;
  void *v31;
  _QWORD v32[2];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "activationType") == 7)
  {
    objc_msgSend(v5, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v5, "context");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "testingContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "containsRecognitionStrings") & 1) != 0
        || objc_msgSend(v9, "containsAudioInput"))
      {
        objc_msgSend(v9, "testingContext");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("SiriTestingContextAudioInputKey"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("SiriTestingContextAudioInputKey"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v13 = 0;
        }
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("SiriTestingContextRecognitionStringKey"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("SiriTestingContextRecognitionStringKey"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "firstObject");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v16 = 0;
        }

        v17 = 0;
      }
      else
      {
        objc_msgSend(v10, "objectForKey:", CFSTR("testOptions"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          objc_msgSend(v10, "objectForKey:", CFSTR("testOptions"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKey:", CFSTR("speechFile"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = 0;
        }
        else
        {
          v16 = 0;
          v13 = 0;
        }
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = v13;
        if (objc_msgSend(v18, "length"))
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v18, 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v19, "checkResourceIsReachableAndReturnError:", 0))
          {
            objc_msgSend(v6, "setSpeechFileURL:", v19);
          }
          else
          {
            v31 = v10;
            objc_msgSend(v17, "objectForKey:", CFSTR("testName"));
            v20 = objc_claimAutoreleasedReturnValue();
            v21 = (void *)v20;
            v22 = &stru_1E91FDE50;
            if (v20)
              v22 = (__CFString *)v20;
            v30 = v22;

            objc_msgSend(v6, "testingContext");
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            v24 = (void *)MEMORY[0x1E0C99E08];
            if (v23)
            {
              objc_msgSend(v6, "testingContext");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "dictionaryWithDictionary:", v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v32[0] = CFSTR("SiriTestingContextFailedTestNameKey");
            v32[1] = CFSTR("SiriTestingContextFailedTestMessageKey");
            v33[0] = v30;
            v33[1] = CFSTR("Speech file not found");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2, v19);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setObject:forKeyedSubscript:", v27, CFSTR("SiriTestingContextFailedTestIdentifierKey"));

            objc_msgSend(v6, "setTestingContext:", v26);
            v10 = v31;
            v19 = v29;
          }

        }
      }
      if (objc_msgSend(v16, "length"))
        objc_msgSend(v6, "setText:", v16);

    }
  }

  return v6;
}

- (SASSystemState)systemState
{
  return self->_systemState;
}

- (void)setSystemState:(id)a3
{
  objc_storeStrong((id *)&self->_systemState, a3);
}

- (void)setAfPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_afPreferences, a3);
}

- (SASLockStateMonitor)lockStateMonitor
{
  return self->_lockStateMonitor;
}

- (void)setLockStateMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_lockStateMonitor, a3);
}

- (UAFAssetUtilities)assetUtilities
{
  return self->_assetUtilities;
}

- (void)setAssetUtilities:(id)a3
{
  objc_storeStrong((id *)&self->_assetUtilities, a3);
}

- (BOOL)xcTestingActive
{
  return self->_xcTestingActive;
}

- (void)setXcTestingActive:(BOOL)a3
{
  self->_xcTestingActive = a3;
}

- (NSMutableDictionary)sources
{
  return self->_sources;
}

- (void)setSources:(id)a3
{
  objc_storeStrong((id *)&self->_sources, a3);
}

- (NSMutableDictionary)activationAssertions
{
  return self->_activationAssertions;
}

- (void)setActivationAssertions:(id)a3
{
  objc_storeStrong((id *)&self->_activationAssertions, a3);
}

- (NSMutableDictionary)buttonEventListeners
{
  return self->_buttonEventListeners;
}

- (void)setButtonEventListeners:(id)a3
{
  objc_storeStrong((id *)&self->_buttonEventListeners, a3);
}

- (SASHeater)heater
{
  return self->_heater;
}

- (void)setHeater:(id)a3
{
  objc_storeStrong((id *)&self->_heater, a3);
}

- (AFSiriTether)siriTether
{
  return self->_siriTether;
}

- (void)setSiriTether:(id)a3
{
  objc_storeStrong((id *)&self->_siriTether, a3);
}

- (BOOL)siriTetherIsAttached
{
  return self->_siriTetherIsAttached;
}

- (void)setSiriTetherIsAttached:(BOOL)a3
{
  self->_siriTetherIsAttached = a3;
}

- (double)activationTimestamp
{
  return self->_activationTimestamp;
}

- (void)setActivationTimestamp:(double)a3
{
  self->_activationTimestamp = a3;
}

- (BOOL)voiceTriggerNotifyTokenIsValid
{
  return self->_voiceTriggerNotifyTokenIsValid;
}

- (void)setVoiceTriggerNotifyTokenIsValid:(BOOL)a3
{
  self->_voiceTriggerNotifyTokenIsValid = a3;
}

- (SASBulletinManager)bulletinManager
{
  return self->_bulletinManager;
}

- (void)setBulletinManager:(id)a3
{
  objc_storeStrong((id *)&self->_bulletinManager, a3);
}

- (SASRemoteRequestManager)remoteRequestManager
{
  return self->_remoteRequestManager;
}

- (void)setRemoteRequestManager:(id)a3
{
  objc_storeStrong((id *)&self->_remoteRequestManager, a3);
}

- (SASTestingInputController)testingInputController
{
  return self->_testingInputController;
}

- (void)setTestingInputController:(id)a3
{
  objc_storeStrong((id *)&self->_testingInputController, a3);
}

- (NSMutableDictionary)avExternalButtonEvents
{
  return self->_avExternalButtonEvents;
}

- (void)setAvExternalButtonEvents:(id)a3
{
  objc_storeStrong((id *)&self->_avExternalButtonEvents, a3);
}

- (BOOL)buttonDownHasOccurredSinceActivation
{
  return self->_buttonDownHasOccurredSinceActivation;
}

- (void)setButtonDownHasOccurredSinceActivation:(BOOL)a3
{
  self->_buttonDownHasOccurredSinceActivation = a3;
}

- (BOOL)canActivateFromDirectActionSource
{
  return self->_canActivateFromDirectActionSource;
}

- (BOOL)_pocketStateFetchingInProgressForHeadsetActivation
{
  return self->_pocketStateFetchingInProgressForHeadsetActivation;
}

- (void)_setPocketStateFetchingInProgressForHeadsetActivation:(BOOL)a3
{
  self->_pocketStateFetchingInProgressForHeadsetActivation = a3;
}

- (SASBluetoothEndpointUtility)bluetoothEndpointUtil
{
  return self->_bluetoothEndpointUtil;
}

- (void)setBluetoothEndpointUtil:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothEndpointUtil, a3);
}

- (SASPresentationManager)presentationManager
{
  return self->_presentationManager;
}

- (void)setPresentationManager:(id)a3
{
  objc_storeStrong((id *)&self->_presentationManager, a3);
}

- (id)didDismissForAssesmentModeStartedCompeltion
{
  return self->_didDismissForAssesmentModeStartedCompeltion;
}

- (void)setDidDismissForAssesmentModeStartedCompeltion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didDismissForAssesmentModeStartedCompeltion, 0);
  objc_storeStrong((id *)&self->_presentationManager, 0);
  objc_storeStrong((id *)&self->_bluetoothEndpointUtil, 0);
  objc_storeStrong((id *)&self->_avExternalButtonEvents, 0);
  objc_storeStrong((id *)&self->_testingInputController, 0);
  objc_storeStrong((id *)&self->_remoteRequestManager, 0);
  objc_storeStrong((id *)&self->_bulletinManager, 0);
  objc_storeStrong((id *)&self->_siriTether, 0);
  objc_storeStrong((id *)&self->_heater, 0);
  objc_storeStrong((id *)&self->_buttonEventListeners, 0);
  objc_storeStrong((id *)&self->_activationAssertions, 0);
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_assetUtilities, 0);
  objc_storeStrong((id *)&self->_lockStateMonitor, 0);
  objc_storeStrong((id *)&self->_afPreferences, 0);
  objc_storeStrong((id *)&self->_systemState, 0);
  objc_storeStrong((id *)&self->_activationEventInstrumentationSender, 0);
  objc_storeStrong((id *)&self->_myriadController, 0);
  objc_storeStrong((id *)&self->_B188ActivationTimer, 0);
  objc_storeStrong((id *)&self->_voiceTriggerDispatchQueue, 0);
  objc_storeStrong((id *)&self->_preheatedPresentation, 0);
  objc_storeStrong(&self->_buttonTrigger, 0);
}

- (void)registerActivationSource:withIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D132F000, v0, v1, "%s #activation Registration of '%@' when it is already registered. Removing", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)unregisterActivationSourceIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D132F000, v0, v1, "%s #activation Unregister request of '%@' when it is not registered.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)registerActivationAssertion:withIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D132F000, v0, v1, "%s #activation Registration of '%@' assertion when it is already present. Removing", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)unregisterActivationAssertionWithIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D132F000, v0, v1, "%s #activation Unregister assertion for '%@' when it is not registered.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)registerButtonEventListenerServer:identifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D132F000, v0, v1, "%s #activation Registration of '%@' listner when it is already present. Removing", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)unregisterButtonEventListenerWithIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D132F000, v0, v1, "%s #activation Unregister lisener for '%@' when it is not registered.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)activationRequestFromButtonIdentifier:(void *)a3 context:.cold.1(void *a1, uint64_t a2, void *a3)
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a1;
  objc_msgSend(v5, "stringWithSiriButtonIdentifier:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SASRequestStateGetName(objc_msgSend(a3, "_requestState"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 136315650;
  v10 = "-[SiriActivationService activationRequestFromButtonIdentifier:context:]";
  v11 = 2112;
  v12 = v7;
  v13 = 2112;
  v14 = v8;
  _os_log_error_impl(&dword_1D132F000, v6, OS_LOG_TYPE_ERROR, "%s activationRequestFromButtonIdentifier:%@, with Siri state %@. Ignoring.", (uint8_t *)&v9, 0x20u);

  OUTLINED_FUNCTION_3();
}

void __93__SiriActivationService__activatePresentationWithIdentifier_requestOptions_analyticsContext___block_invoke_cold_1(void *a1, unint64_t a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  __int16 v7;
  int v8[5];
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  SiriPresentationRotationStyleGetName(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = 136315650;
  OUTLINED_FUNCTION_1();
  v9 = v7;
  v10 = a3;
  _os_log_debug_impl(&dword_1D132F000, v5, OS_LOG_TYPE_DEBUG, "%s #activation Setting rotation style for presentation { rotationStyle: %@, presentation: %@ }", (uint8_t *)v8, 0x20u);

  OUTLINED_FUNCTION_3();
}

void __87__SiriActivationService__handlePocketStateFetchForScreenWakeForPresentationIdentifier___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D132F000, v0, v1, "%s #activation #SiriPocketStateManager: error querying the pocket state for screen wake: %@ Turning on the screen...", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)presentationManager:(void *)a1 didEncounterError:(uint64_t)a2 .cold.1(void *a1, uint64_t a2)
{
  NSObject *v3;
  void *v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  SASPresentationManagerErrorGetName(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1D132F000, v3, OS_LOG_TYPE_ERROR, "%s #activation error: %@", (uint8_t *)v5, 0x16u);

}

@end
