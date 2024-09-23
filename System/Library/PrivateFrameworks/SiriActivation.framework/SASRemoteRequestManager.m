@implementation SASRemoteRequestManager

+ (id)manager
{
  if (manager_onceToken != -1)
    dispatch_once(&manager_onceToken, &__block_literal_global_15);
  return (id)manager_sharedManager;
}

void __34__SASRemoteRequestManager_manager__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[SASRemoteRequestManager _init]([SASRemoteRequestManager alloc], "_init");
  v1 = (void *)manager_sharedManager;
  manager_sharedManager = (uint64_t)v0;

}

- (id)_init
{
  SASRemoteRequestManager *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, void *, void *);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id location;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)SASRemoteRequestManager;
  v2 = -[SASRemoteRequestManager init](&v28, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CFE988]);
    -[SASRemoteRequestManager setRemoteRequestWatcher:](v2, "setRemoteRequestWatcher:", v3);

    objc_initWeak(&location, v2);
    -[SASRemoteRequestManager remoteRequestWatcher](v2, "remoteRequestWatcher");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __32__SASRemoteRequestManager__init__block_invoke;
    v25[3] = &unk_1E91FC9F0;
    objc_copyWeak(&v26, &location);
    objc_msgSend(v4, "setPrewarmHandler:", v25);

    -[SASRemoteRequestManager remoteRequestWatcher](v2, "remoteRequestWatcher");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v5;
    v23[1] = 3221225472;
    v23[2] = __32__SASRemoteRequestManager__init__block_invoke_2;
    v23[3] = &unk_1E91FC9F0;
    objc_copyWeak(&v24, &location);
    objc_msgSend(v6, "setNewRequestHandler:", v23);

    -[SASRemoteRequestManager remoteRequestWatcher](v2, "remoteRequestWatcher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v5;
    v21[1] = 3221225472;
    v21[2] = __32__SASRemoteRequestManager__init__block_invoke_3;
    v21[3] = &unk_1E91FCA18;
    objc_copyWeak(&v22, &location);
    objc_msgSend(v7, "setDismissalHandler:", v21);

    -[SASRemoteRequestManager remoteRequestWatcher](v2, "remoteRequestWatcher");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNewSpeechRequestHandler:", &__block_literal_global_50);

    -[SASRemoteRequestManager remoteRequestWatcher](v2, "remoteRequestWatcher");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v5;
    v19[1] = 3221225472;
    v19[2] = __32__SASRemoteRequestManager__init__block_invoke_5;
    v19[3] = &unk_1E91FCAA8;
    objc_copyWeak(&v20, &location);
    objc_msgSend(v9, "setIntentHandler:", v19);

    -[SASRemoteRequestManager remoteRequestWatcher](v2, "remoteRequestWatcher");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v5;
    v15 = 3221225472;
    v16 = __32__SASRemoteRequestManager__init__block_invoke_7;
    v17 = &unk_1E91FCAF8;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v10, "setIntentForwardingActionHandler:", &v14);

    -[SASRemoteRequestManager remoteRequestWatcher](v2, "remoteRequestWatcher", v14, v15, v16, v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setButtonEventHandler:", &__block_literal_global_60);

    -[SASRemoteRequestManager remoteRequestWatcher](v2, "remoteRequestWatcher");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setActivationHandler:", &__block_literal_global_63);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __32__SASRemoteRequestManager__init__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleRemotePrewarmWithInfo:", v3);

}

void __32__SASRemoteRequestManager__init__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleNewRemoteRequestWithInfo:", v3);

}

void __32__SASRemoteRequestManager__init__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id *v6;
  id v7;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_handleRemoteRequestDismissalWithReason:options:analyticsContext:", a2, a3, v7);

}

void __32__SASRemoteRequestManager__init__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  SiriContinuityContext *v4;

  v2 = a2;
  if (objc_msgSend(v2, "activationEvent"))
  {
    v4 = -[SiriContinuityContext initWithSpeechRequestOptions:]([SiriContinuityContext alloc], "initWithSpeechRequestOptions:", v2);

    +[SiriActivationService service](SiriActivationService, "service");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "activationRequestFromContinuityWithContext:", v4);
  }
  else
  {
    v4 = -[SiriContext initWithSpeechRequestOptions:]([SiriContext alloc], "initWithSpeechRequestOptions:", v2);

    +[SiriActivationService service](SiriActivationService, "service");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "activationRequestFromButtonIdentifier:context:", 1, v4);
  }

}

void __32__SASRemoteRequestManager__init__block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id *v8;
  id v9;
  id v10;
  _QWORD *WeakRetained;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD *v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v7 = a4;
  v8 = (id *)(a1 + 32);
  v9 = a3;
  v10 = a2;
  WeakRetained = objc_loadWeakRetained(v8);
  v12 = (void *)WeakRetained[3];
  if (v12)
    objc_msgSend(v12, "invalidateIntentDelivery");
  v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CBD740]), "initWithBundleIdentifier:", v9);

  v14 = (void *)WeakRetained[3];
  WeakRetained[3] = v13;

  v15 = (void *)WeakRetained[3];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __32__SASRemoteRequestManager__init__block_invoke_6;
  v18[3] = &unk_1E91FCA80;
  v19 = WeakRetained;
  v20 = v7;
  v16 = v7;
  v17 = WeakRetained;
  objc_msgSend(v15, "deliverIntent:reply:", v10, v18);

}

void __32__SASRemoteRequestManager__init__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = 0;

  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);

}

void __32__SASRemoteRequestManager__init__block_invoke_7(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id *v10;
  _QWORD *WeakRetained;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v12 = WeakRetained;
  if (WeakRetained)
  {
    v13 = (void *)WeakRetained[3];
    if (v13)
      objc_msgSend(v13, "invalidateIntentDelivery");
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CBD740]), "initWithBundleIdentifier:intentForwardingAction:", v8, v7);
    v15 = (void *)v12[3];
    v12[3] = v14;

    v16 = (void *)v12[3];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __32__SASRemoteRequestManager__init__block_invoke_8;
    v17[3] = &unk_1E91FCAD0;
    objc_copyWeak(&v19, v10);
    v18 = v9;
    objc_msgSend(v16, "deliverIntentForwardingActionWithResponseHandler:", v17);

    objc_destroyWeak(&v19);
  }

}

void __32__SASRemoteRequestManager__init__block_invoke_8(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)*((_QWORD *)WeakRetained + 3);
    *((_QWORD *)WeakRetained + 3) = 0;

  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);

}

void __32__SASRemoteRequestManager__init__block_invoke_9(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;

  v2 = a2;
  if (objc_msgSend(v2, "source") == 4)
  {
    objc_msgSend(v2, "deviceID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "timestamp");
    AFMachAbsoluteTimeGetTimeInterval();
    v5 = v4;
    if (objc_msgSend(v2, "event") == 9)
    {
      +[SiriActivationService service](SiriActivationService, "service");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "buttonUpFromButtonIdentifier:deviceIdentifier:timestamp:context:", 8, v3, 0, v5);

    }
  }
  else
  {
    v7 = (void *)*MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
      __32__SASRemoteRequestManager__init__block_invoke_9_cold_1(v7);
  }

}

void __32__SASRemoteRequestManager__init__block_invoke_61(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void (**v5)(id, _QWORD);
  SiriRemotePresentationBringUpContext *v6;
  void *v7;
  void *v8;

  v4 = a2;
  v5 = a3;
  if (objc_msgSend(v4, "source") == 12)
  {
    v6 = objc_alloc_init(SiriRemotePresentationBringUpContext);
    +[SiriActivationService service](SiriActivationService, "service");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activationRequestFromRemotePresentationBringUpWithContext:", v6);

    if (v5)
      v5[2](v5, 0);
  }
  else
  {
    v8 = (void *)*MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
      __32__SASRemoteRequestManager__init__block_invoke_61_cold_1(v8);
    v6 = (SiriRemotePresentationBringUpContext *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.siri.activation"), 5, &unk_1E920EF98);
    ((void (**)(id, SiriRemotePresentationBringUpContext *))v5)[2](v5, v6);
  }

}

- (SASRemoteRequestManager)init
{

  return 0;
}

+ (SASRemoteRequestManager)new
{
  return 0;
}

- (void)_handleRemotePrewarmWithInfo:(id)a3
{
  id v4;
  os_log_t *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v6 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315394;
    v15 = "-[SASRemoteRequestManager _handleRemotePrewarmWithInfo:]";
    v16 = 2112;
    v17 = v4;
    _os_log_impl(&dword_1D132F000, v6, OS_LOG_TYPE_DEFAULT, "%s info=%@", (uint8_t *)&v14, 0x16u);
  }
  if (-[SASRemoteRequestManager _requestWatcherVoiceActivationEnabled](self, "_requestWatcherVoiceActivationEnabled"))
  {
    objc_msgSend(v4, "speechRequestOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "activationEvent");

    if (v8 == 8)
    {
      -[SASRemoteRequestManager _startFetchingPocketStateUpdates](self, "_startFetchingPocketStateUpdates");
      if (AFDeviceSupportsAOP())
      {
        -[SASRemoteRequestManager setCurrentVoiceTriggerRestriction:](self, "setCurrentVoiceTriggerRestriction:", 1);
        -[SASRemoteRequestManager setPendingVoiceTriggerRestrictionCount:](self, "setPendingVoiceTriggerRestrictionCount:", -[SASRemoteRequestManager pendingVoiceTriggerRestrictionCount](self, "pendingVoiceTriggerRestrictionCount")+ 1);
        v9 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
        {
          v14 = 136315138;
          v15 = "-[SASRemoteRequestManager _handleRemotePrewarmWithInfo:]";
          _os_log_impl(&dword_1D132F000, v9, OS_LOG_TYPE_DEFAULT, "%s scheduling pending activation timer to give pocket detect time", (uint8_t *)&v14, 0xCu);
        }
        -[SASRemoteRequestManager _processPendingVoiceTriggerActivationsWithInfo:delay:](self, "_processPendingVoiceTriggerActivationsWithInfo:delay:", v4, 0.35);
      }
      +[SiriActivationService service](SiriActivationService, "service");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "updatePredicatedRecordRoute");

    }
  }
  objc_msgSend(v4, "speechRequestOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "activationEvent");

  if (v12 == 31)
  {
    +[SiriActivationService service](SiriActivationService, "service");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "updatePredicatedRecordRoute");

  }
}

- (void)_handleNewRemoteRequestWithInfo:(id)a3
{
  id v4;
  os_log_t *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  SiriMagusContext *v9;
  SiriHearstLongPressButtonContext *v10;
  void *v11;
  SiriTestingContext *v12;
  SiriTestingContext *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  SiriMagusContext *v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v6 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[SASRemoteRequestManager _handleNewRemoteRequestWithInfo:]";
    v20 = 2112;
    v21 = v4;
    _os_log_impl(&dword_1D132F000, v6, OS_LOG_TYPE_DEFAULT, "%s info=%@", buf, 0x16u);
  }
  objc_msgSend(v4, "speechRequestOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "activationEvent");

  if (v8 != 31 && v8 != 8)
  {
    if (objc_msgSend(v4, "activationEvent") == 8)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v4, "performSelector:", sel_text);
        v9 = (SiriMagusContext *)objc_claimAutoreleasedReturnValue();
        if (!v4)
          goto LABEL_16;
      }
      else
      {
        v9 = 0;
        if (!v4)
          goto LABEL_16;
      }
      if (!-[SiriMagusContext length](v9, "length")
        || (v13 = [SiriTestingContext alloc],
            v17 = v9,
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            v12 = -[SiriTestingContext initWithRequestInfo:recognitionStrings:siriContextOverride:](v13, "initWithRequestInfo:recognitionStrings:siriContextOverride:", v4, v14, 0), v14, !v12))
      {
LABEL_16:
        v16 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
          -[SASRemoteRequestManager _handleNewRemoteRequestWithInfo:].cold.1(v16);
        goto LABEL_23;
      }
      +[SiriActivationService service](SiriActivationService, "service");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "activationRequestFromTestingWithContext:", v12);

    }
    else
    {
      switch(v8)
      {
        case 27:
          v10 = [SiriHearstLongPressButtonContext alloc];
          objc_msgSend(v4, "speechRequestOptions");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = -[SiriHearstLongPressButtonContext initWithSpeechRequestOptions:](v10, "initWithSpeechRequestOptions:", v11);

          +[SiriActivationService service](SiriActivationService, "service");
          v12 = (SiriTestingContext *)objc_claimAutoreleasedReturnValue();
          -[SiriTestingContext buttonLongPressFromButtonIdentifier:context:](v12, "buttonLongPressFromButtonIdentifier:context:", 8, v9);
          break;
        case 30:
          v9 = -[SiriContinuityContext initWithRequestInfo:]([SiriMagusContext alloc], "initWithRequestInfo:", v4);
          +[SiriActivationService service](SiriActivationService, "service");
          v12 = (SiriTestingContext *)objc_claimAutoreleasedReturnValue();
          -[SiriTestingContext activationRequestFromContinuousConversationWithContext:](v12, "activationRequestFromContinuousConversationWithContext:", v9);
          break;
        case 34:
          v9 = -[SiriContinuityContext initWithRequestInfo:]([SiriMagusContext alloc], "initWithRequestInfo:", v4);
          +[SiriActivationService service](SiriActivationService, "service");
          v12 = (SiriTestingContext *)objc_claimAutoreleasedReturnValue();
          -[SiriTestingContext activationRequestFromContinuousConversationHearstWithContext:](v12, "activationRequestFromContinuousConversationHearstWithContext:", v9);
          break;
        case 35:
          v9 = -[SiriContinuityContext initWithRequestInfo:]([SiriMagusContext alloc], "initWithRequestInfo:", v4);
          +[SiriActivationService service](SiriActivationService, "service");
          v12 = (SiriTestingContext *)objc_claimAutoreleasedReturnValue();
          -[SiriTestingContext activationRequestFromContinuousConversationJarvisWithContext:](v12, "activationRequestFromContinuousConversationJarvisWithContext:", v9);
          break;
        default:
          v9 = -[SiriContinuityContext initWithRequestInfo:]([SiriContinuityContext alloc], "initWithRequestInfo:", v4);
          +[SiriActivationService service](SiriActivationService, "service");
          v12 = (SiriTestingContext *)objc_claimAutoreleasedReturnValue();
          -[SiriTestingContext activationRequestFromContinuityWithContext:](v12, "activationRequestFromContinuityWithContext:", v9);
          break;
      }
    }

LABEL_23:
    goto LABEL_24;
  }
  -[SASRemoteRequestManager _handleRequestWatcherVoiceTriggerRequestWithInfo:](self, "_handleRequestWatcherVoiceTriggerRequestWithInfo:", v4);
LABEL_24:

}

- (void)_handleRequestWatcherVoiceTriggerRequestWithInfo:(id)a3
{
  id v4;
  unint64_t currentVoiceTriggerRestriction;
  NSObject *v6;
  NSObject *v7;
  SiriVoiceTriggerContext *v8;
  void *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SASRemoteRequestManager _requestWatcherVoiceActivationEnabled](self, "_requestWatcherVoiceActivationEnabled"))
  {
    currentVoiceTriggerRestriction = self->_currentVoiceTriggerRestriction;
    if (currentVoiceTriggerRestriction)
    {
      if (currentVoiceTriggerRestriction == 2)
      {
        v10 = *MEMORY[0x1E0CFE6A0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
        {
          v11 = 136315138;
          v12 = "-[SASRemoteRequestManager _handleRequestWatcherVoiceTriggerRequestWithInfo:]";
          _os_log_impl(&dword_1D132F000, v10, OS_LOG_TYPE_DEFAULT, "%s Received VoiceTrigger activation request, but currently blocking VoiceTrigger activations", (uint8_t *)&v11, 0xCu);
        }
      }
      else if (currentVoiceTriggerRestriction == 1)
      {
        v6 = *MEMORY[0x1E0CFE6A0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
        {
          v11 = 136315138;
          v12 = "-[SASRemoteRequestManager _handleRequestWatcherVoiceTriggerRequestWithInfo:]";
          _os_log_impl(&dword_1D132F000, v6, OS_LOG_TYPE_DEFAULT, "%s Received VoiceTrigger activation request, already pending for possible future activation", (uint8_t *)&v11, 0xCu);
        }
        -[SASRemoteRequestManager setHasPendingVoiceTriggerActivation:](self, "setHasPendingVoiceTriggerActivation:", 1);
        -[SASRemoteRequestManager setPendingVoiceTriggerActivationInfo:](self, "setPendingVoiceTriggerActivationInfo:", v4);
      }
    }
    else
    {
      v7 = *MEMORY[0x1E0CFE6A0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136315138;
        v12 = "-[SASRemoteRequestManager _handleRequestWatcherVoiceTriggerRequestWithInfo:]";
        _os_log_impl(&dword_1D132F000, v7, OS_LOG_TYPE_DEFAULT, "%s Received VoiceTrigger activation request, no restrictions, activating", (uint8_t *)&v11, 0xCu);
      }
      v8 = -[SiriContinuityContext initWithRequestInfo:]([SiriVoiceTriggerContext alloc], "initWithRequestInfo:", v4);
      +[SiriActivationService service](SiriActivationService, "service");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "activationRequestFromVoiceTriggerWithContext:", v8);

    }
  }

}

- (void)_processPendingVoiceTriggerActivationsWithInfo:(id)a3 delay:(double)a4
{
  id v6;
  dispatch_time_t v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  v7 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__SASRemoteRequestManager__processPendingVoiceTriggerActivationsWithInfo_delay___block_invoke;
  block[3] = &unk_1E91FBF68;
  objc_copyWeak(&v11, &location);
  v10 = v6;
  v8 = v6;
  dispatch_after(v7, MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __80__SASRemoteRequestManager__processPendingVoiceTriggerActivationsWithInfo_delay___block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  id *v4;
  id WeakRetained;
  uint64_t v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __CFString *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = objc_msgSend(WeakRetained, "currentVoiceTriggerRestriction");

  if (v6 != 2)
  {
    v7 = objc_loadWeakRetained(v4);
    objc_msgSend(v7, "setCurrentVoiceTriggerRestriction:", 0);

    v8 = (id)*MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_loadWeakRetained(v4);
      v10 = objc_msgSend(v9, "pendingVoiceTriggerRestrictionCount");
      if (v10)
      {
        v11 = (void *)MEMORY[0x1E0CB3940];
        v12 = (void *)MEMORY[0x1E0CB37E8];
        v1 = objc_loadWeakRetained(v4);
        objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v1, "pendingVoiceTriggerRestrictionCount"));
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("with %@ pending activations"), v2);
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = CFSTR("no pending activations");
      }
      *(_DWORD *)buf = 136315394;
      v16 = "-[SASRemoteRequestManager _processPendingVoiceTriggerActivationsWithInfo:delay:]_block_invoke";
      v17 = 2112;
      v18 = v13;
      _os_log_impl(&dword_1D132F000, v8, OS_LOG_TYPE_DEFAULT, "%s pending voice trigger activation timer fired, %@", buf, 0x16u);
      if (v10)
      {

      }
    }

    v14 = objc_loadWeakRetained(v4);
    objc_msgSend(v14, "_handlePendingVoiceTriggerActivationsWithInfo:", *(_QWORD *)(a1 + 32));

  }
}

- (void)_handleRemoteRequestDismissalWithReason:(int64_t)a3 options:(unint64_t)a4 analyticsContext:(id)a5
{
  id v8;
  os_log_t *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  unint64_t v17;
  os_log_t v18;
  NSObject *v19;
  uint64_t CancellationReason;
  void *v21;
  void *v22;
  SiriDismissalOptions *v23;
  void *v24;
  int v25;
  const char *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v10 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    AFSiriDeactivationReasonGetName();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    AFSiriDeactivationOptionsGetNames();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 136315906;
    v26 = "-[SASRemoteRequestManager _handleRemoteRequestDismissalWithReason:options:analyticsContext:]";
    v27 = 2112;
    v28 = v12;
    v29 = 2112;
    v30 = v13;
    v31 = 2112;
    v32 = v8;
    _os_log_impl(&dword_1D132F000, v11, OS_LOG_TYPE_DEFAULT, "%s Handling remote request dismissal, reason=%@, options=%@, analyticsContext=%@", (uint8_t *)&v25, 0x2Au);

  }
  if (v8)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("inSpokenNotification"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");

    if (a3 == 2)
    {
      if (v15)
      {
        objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "logEventWithType:context:", 6007, 0);

        v17 = -[SASRemoteRequestManager _dismissalReasonForDeactivationReason:](self, "_dismissalReasonForDeactivationReason:", 2);
LABEL_10:
        CancellationReason = SASDismissalReasonGetCancellationReason(v17);
        goto LABEL_12;
      }
    }
  }
  v17 = -[SASRemoteRequestManager _dismissalReasonForDeactivationReason:](self, "_dismissalReasonForDeactivationReason:", a3);
  if (a3 != 3)
    goto LABEL_10;
  v18 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
  {
    v19 = v18;
    CancellationReason = 5;
    AFRequestCancellationReasonGetName();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    AFSiriDeactivationReasonGetName();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 136315650;
    v26 = "-[SASRemoteRequestManager _handleRemoteRequestDismissalWithReason:options:analyticsContext:]";
    v27 = 2112;
    v28 = v21;
    v29 = 2112;
    v30 = v22;
    _os_log_impl(&dword_1D132F000, v19, OS_LOG_TYPE_DEFAULT, "%s #cancellationReason: Setting cancellationReason to %@ because deactivationReason is %@", (uint8_t *)&v25, 0x20u);

  }
  else
  {
    CancellationReason = 5;
  }
LABEL_12:
  v23 = -[SiriDismissalOptions initWithDeactivationOptions:animated:requestCancellationReason:dismissalReason:]([SiriDismissalOptions alloc], "initWithDeactivationOptions:animated:requestCancellationReason:dismissalReason:", a4, 1, CancellationReason, v17);
  +[SiriActivationService service](SiriActivationService, "service");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "dismissSiriWithOptions:", v23);

}

- (void)_handlePendingVoiceTriggerActivationsWithInfo:(id)a3
{
  id v4;
  os_log_t *v5;
  NSObject *v6;
  unint64_t pendingVoiceTriggerRestrictionCount;
  _BOOL4 hasPendingVoiceTriggerActivation;
  id v9;
  void *v10;
  os_log_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v6 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    pendingVoiceTriggerRestrictionCount = self->_pendingVoiceTriggerRestrictionCount;
    hasPendingVoiceTriggerActivation = self->_hasPendingVoiceTriggerActivation;
    *(_DWORD *)buf = 136315650;
    v20 = "-[SASRemoteRequestManager _handlePendingVoiceTriggerActivationsWithInfo:]";
    v21 = 2048;
    v22 = pendingVoiceTriggerRestrictionCount;
    v23 = 1024;
    LODWORD(v24) = hasPendingVoiceTriggerActivation;
    _os_log_impl(&dword_1D132F000, v6, OS_LOG_TYPE_DEFAULT, "%s PendingCount:%tu, hasPendingTrigger:%i", buf, 0x1Cu);
  }
  if (-[SASRemoteRequestManager pendingVoiceTriggerRestrictionCount](self, "pendingVoiceTriggerRestrictionCount"))
    -[SASRemoteRequestManager setPendingVoiceTriggerRestrictionCount:](self, "setPendingVoiceTriggerRestrictionCount:", -[SASRemoteRequestManager pendingVoiceTriggerRestrictionCount](self, "pendingVoiceTriggerRestrictionCount") - 1);
  if (!-[SASRemoteRequestManager pendingVoiceTriggerRestrictionCount](self, "pendingVoiceTriggerRestrictionCount")
    && -[SASRemoteRequestManager hasPendingVoiceTriggerActivation](self, "hasPendingVoiceTriggerActivation"))
  {
    v9 = v4;
    -[SASRemoteRequestManager pendingVoiceTriggerActivationInfo](self, "pendingVoiceTriggerActivationInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        v12 = v11;
        -[SASRemoteRequestManager pendingVoiceTriggerActivationInfo](self, "pendingVoiceTriggerActivationInfo");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v20 = "-[SASRemoteRequestManager _handlePendingVoiceTriggerActivationsWithInfo:]";
        v21 = 2112;
        v22 = (unint64_t)v9;
        v23 = 2112;
        v24 = v13;
        _os_log_impl(&dword_1D132F000, v12, OS_LOG_TYPE_DEFAULT, "%s replacing prewarm AFRequestInfo %@ with newer pending activation AFRequestInfo %@", buf, 0x20u);

      }
      -[SASRemoteRequestManager pendingVoiceTriggerActivationInfo](self, "pendingVoiceTriggerActivationInfo");
      v14 = objc_claimAutoreleasedReturnValue();

      v9 = (id)v14;
    }
    objc_initWeak((id *)buf, self);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __73__SASRemoteRequestManager__handlePendingVoiceTriggerActivationsWithInfo___block_invoke;
    v16[3] = &unk_1E91FCBA0;
    v17 = v9;
    v15 = v9;
    objc_copyWeak(&v18, (id *)buf);
    dispatch_async(MEMORY[0x1E0C80D38], v16);
    objc_destroyWeak(&v18);

    objc_destroyWeak((id *)buf);
  }

}

void __73__SASRemoteRequestManager__handlePendingVoiceTriggerActivationsWithInfo___block_invoke(uint64_t a1)
{
  NSObject *v2;
  SiriVoiceTriggerContext *v3;
  void *v4;
  id *v5;
  id WeakRetained;
  id v7;
  id v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[SASRemoteRequestManager _handlePendingVoiceTriggerActivationsWithInfo:]_block_invoke";
    _os_log_impl(&dword_1D132F000, v2, OS_LOG_TYPE_DEFAULT, "%s count is zero after being decremented, activating from pending", (uint8_t *)&v9, 0xCu);
  }
  v3 = -[SiriContinuityContext initWithRequestInfo:]([SiriVoiceTriggerContext alloc], "initWithRequestInfo:", *(_QWORD *)(a1 + 32));
  +[SiriActivationService service](SiriActivationService, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activationRequestFromVoiceTriggerWithContext:", v3);

  v5 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "setPendingVoiceTriggerRestrictionCount:", 0);

  v7 = objc_loadWeakRetained(v5);
  objc_msgSend(v7, "setHasPendingVoiceTriggerActivation:", 0);

  v8 = objc_loadWeakRetained(v5);
  objc_msgSend(v8, "setPendingVoiceTriggerActivationInfo:", 0);

}

- (void)_startFetchingPocketStateUpdates
{
  id v2;

  +[SASSiriPocketStateManager sharedManager](SASSiriPocketStateManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queryForPocketStateWithCompletion:", 0);

}

- (BOOL)_requestWatcherVoiceActivationEnabled
{
  return 1;
}

- (int64_t)_dismissalReasonForDeactivationReason:(int64_t)a3
{
  void *v4;

  if ((unint64_t)a3 < 0x15)
    return qword_1D13784B8[a3];
  v4 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
    -[SASRemoteRequestManager _dismissalReasonForDeactivationReason:].cold.1(v4);
  return 0;
}

- (AFRemoteRequestWatcher)remoteRequestWatcher
{
  return self->_remoteRequestWatcher;
}

- (void)setRemoteRequestWatcher:(id)a3
{
  objc_storeStrong((id *)&self->_remoteRequestWatcher, a3);
}

- (INAppIntentDeliverer)currentAppIntentDeliverer
{
  return self->_currentAppIntentDeliverer;
}

- (void)setCurrentAppIntentDeliverer:(id)a3
{
  objc_storeStrong((id *)&self->_currentAppIntentDeliverer, a3);
}

- (unint64_t)currentVoiceTriggerRestriction
{
  return self->_currentVoiceTriggerRestriction;
}

- (void)setCurrentVoiceTriggerRestriction:(unint64_t)a3
{
  self->_currentVoiceTriggerRestriction = a3;
}

- (unint64_t)pendingVoiceTriggerRestrictionCount
{
  return self->_pendingVoiceTriggerRestrictionCount;
}

- (void)setPendingVoiceTriggerRestrictionCount:(unint64_t)a3
{
  self->_pendingVoiceTriggerRestrictionCount = a3;
}

- (BOOL)hasPendingVoiceTriggerActivation
{
  return self->_hasPendingVoiceTriggerActivation;
}

- (void)setHasPendingVoiceTriggerActivation:(BOOL)a3
{
  self->_hasPendingVoiceTriggerActivation = a3;
}

- (AFRequestInfo)pendingVoiceTriggerActivationInfo
{
  return self->_pendingVoiceTriggerActivationInfo;
}

- (void)setPendingVoiceTriggerActivationInfo:(id)a3
{
  objc_storeStrong((id *)&self->_pendingVoiceTriggerActivationInfo, a3);
}

- (CMPocketStateManager)pocketStateManager
{
  return self->_pocketStateManager;
}

- (void)setPocketStateManager:(id)a3
{
  objc_storeStrong((id *)&self->_pocketStateManager, a3);
}

- (int64_t)currentPocketState
{
  return self->_currentPocketState;
}

- (void)setCurrentPocketState:(int64_t)a3
{
  self->_currentPocketState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pocketStateManager, 0);
  objc_storeStrong((id *)&self->_pendingVoiceTriggerActivationInfo, 0);
  objc_storeStrong((id *)&self->_currentAppIntentDeliverer, 0);
  objc_storeStrong((id *)&self->_remoteRequestWatcher, 0);
}

void __32__SASRemoteRequestManager__init__block_invoke_9_cold_1(void *a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = a1;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1D132F000, v3, v4, "%s Unsupported button event: %li from source: %li", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_3();
}

void __32__SASRemoteRequestManager__init__block_invoke_61_cold_1(void *a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = a1;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1D132F000, v3, v4, "%s Unsupported button event: %li from source: %li", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)_handleNewRemoteRequestWithInfo:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[SASRemoteRequestManager _handleNewRemoteRequestWithInfo:]";
  _os_log_error_impl(&dword_1D132F000, log, OS_LOG_TYPE_ERROR, "%s TestAutomation activationEvent does not contain recognition text or speech file paths.", (uint8_t *)&v1, 0xCu);
}

- (void)_dismissalReasonForDeactivationReason:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  void *v2;
  int v3;
  const char *v4;
  __int16 v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  AFSiriDeactivationReasonGetName();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 136315394;
  v4 = "-[SASRemoteRequestManager _dismissalReasonForDeactivationReason:]";
  v5 = 2112;
  v6 = v2;
  _os_log_error_impl(&dword_1D132F000, v1, OS_LOG_TYPE_ERROR, "%s Unhandled deactivation reason: %@", (uint8_t *)&v3, 0x16u);

}

@end
