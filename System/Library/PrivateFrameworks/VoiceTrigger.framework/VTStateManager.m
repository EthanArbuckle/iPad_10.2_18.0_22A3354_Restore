@implementation VTStateManager

- (VTStateManager)initWithProperty:(id)a3 callbackWithMessage:(id)a4
{
  id v6;
  id v7;
  VTStateManager *v8;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __55__VTStateManager_initWithProperty_callbackWithMessage___block_invoke;
  v10[3] = &unk_24C7F4240;
  v11 = v6;
  v7 = v6;
  v8 = -[VTStateManager initWithProperty:callbackWithMessageAndTimestamp:](self, "initWithProperty:callbackWithMessageAndTimestamp:", a3, v10);

  return v8;
}

- (VTStateManager)initWithProperty:(id)a3 callbackWithMessageAndTimestamp:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  VTStateManager *v11;
  VTPhraseSpotter *v13;
  void *v14;
  __int16 v15;
  __int16 v16;
  __int16 v17;

  v6 = a3;
  v7 = a4;
  if (+[VTUtilities VTIsHorseman](VTUtilities, "VTIsHorseman"))
  {
    v8 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 0;
      v9 = "VoiceTrigger framework not available. Returning nil for VTStateManager";
      v10 = (uint8_t *)&v17;
LABEL_10:
      _os_log_impl(&dword_20D965000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
    }
  }
  else if (+[VTUtilities isNonUI](VTUtilities, "isNonUI"))
  {
    v8 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 0;
      v9 = "VoiceTrigger framework not available on Non-UI, Retuning nil for VTStateManager";
      v10 = (uint8_t *)&v16;
      goto LABEL_10;
    }
  }
  else
  {
    if (!os_variant_is_darwinos())
    {
      v13 = -[VTPhraseSpotter initWithHardwareSampleRate:]([VTPhraseSpotter alloc], "initWithHardwareSampleRate:", 16000.0);
      +[VTPolicy defaultVoiceTriggerEnablePolicy](VTPolicy, "defaultVoiceTriggerEnablePolicy");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[VTStateManager initWithProperty:phraseSpotter:enablePolicy:callbackWithMessageAndTimestamp:](self, "initWithProperty:phraseSpotter:enablePolicy:callbackWithMessageAndTimestamp:", v6, v13, v14, v7);

      v11 = self;
      goto LABEL_12;
    }
    v8 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 0;
      v9 = "VoiceTrigger framework not available. Returning nil for VTStateManager";
      v10 = (uint8_t *)&v15;
      goto LABEL_10;
    }
  }
  v11 = 0;
LABEL_12:

  return v11;
}

- (VTStateManager)initWithProperty:(id)a3 phraseSpotter:(id)a4 enablePolicy:(id)a5 callbackWithMessageAndTimestamp:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  const char *v16;
  VTStateManager *v17;
  dispatch_queue_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  VTBuiltInRTModel *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  void *v32;
  VTCoreSpeechKeepAliveHandler *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  VTRemoteDarwinHIDEventNotifier *v39;
  void *v40;
  uint8_t v42[8];
  _QWORD v43[4];
  id v44;
  id buf;
  _QWORD v46[4];
  id v47;
  objc_super v48;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v48.receiver = self;
  v48.super_class = (Class)VTStateManager;
  v14 = -[VTStateManager init](&v48, sel_init);
  if (+[VTUtilities VTIsHorseman](VTUtilities, "VTIsHorseman"))
  {
    v15 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      v16 = "VoiceTrigger framework not available. Returning nil for VTStateManager";
LABEL_10:
      _os_log_impl(&dword_20D965000, v15, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&buf, 2u);
      v17 = 0;
      goto LABEL_29;
    }
    goto LABEL_11;
  }
  if (+[VTUtilities isNonUI](VTUtilities, "isNonUI"))
  {
    v15 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      v16 = "VoiceTrigger framework not available on Non-UI, Retuning nil for VTStateManager";
      goto LABEL_10;
    }
LABEL_11:
    v17 = 0;
    goto LABEL_29;
  }
  if (os_variant_is_darwinos())
  {
    v15 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      v16 = "VoiceTrigger framework not available. Returning nil for VTStateManager";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (v14)
  {
    v18 = dispatch_queue_create("com.apple.voicetrigger.VTStateManager", 0);
    v19 = (void *)*((_QWORD *)v14 + 1);
    *((_QWORD *)v14 + 1) = v18;

    v20 = MEMORY[0x212BACF9C](v13);
    v21 = (void *)*((_QWORD *)v14 + 4);
    *((_QWORD *)v14 + 4) = v20;

    objc_storeStrong((id *)v14 + 2, a4);
    v22 = objc_alloc_init(VTBuiltInRTModel);
    v23 = (void *)*((_QWORD *)v14 + 3);
    *((_QWORD *)v14 + 3) = v22;

    *((_WORD *)v14 + 28) = 0;
    *((_BYTE *)v14 + 58) = 0;
    *((_QWORD *)v14 + 9) = 0;
    v24 = MEMORY[0x24BDAC760];
    if (v10)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("VoiceTriggerAvailable"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v25 && objc_msgSend(v25, "BOOLValue"))
      {
        v27 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_20D965000, v27, OS_LOG_TYPE_DEFAULT, "Obtained VoiceTrigger available from AQME, registering callback", (uint8_t *)&buf, 2u);
        }
        v28 = (void *)*((_QWORD *)v14 + 2);
        v46[0] = v24;
        v46[1] = 3221225472;
        v46[2] = __94__VTStateManager_initWithProperty_phraseSpotter_enablePolicy_callbackWithMessageAndTimestamp___block_invoke;
        v46[3] = &unk_24C7F4C20;
        v47 = v14;
        objc_msgSend(v28, "notifyAssetChangeWithCallback:", v46);

      }
    }
    objc_msgSend(v14, "_initializeXPCService");
    dispatch_async(*((dispatch_queue_t *)v14 + 1), &__block_literal_global_3611);
    +[VTPreferences sharedPreferences](VTPreferences, "sharedPreferences");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "gestureSubscriptionEnabled");

    if (v30)
    {
      +[VTGestureMonitor defaultGestureMonitor](VTGestureMonitor, "defaultGestureMonitor");
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = (void *)*((_QWORD *)v14 + 8);
      *((_QWORD *)v14 + 8) = v31;

      objc_msgSend(*((id *)v14 + 8), "setDelegate:", v14);
      objc_msgSend(*((id *)v14 + 8), "startObserving");
    }
    v33 = objc_alloc_init(VTCoreSpeechKeepAliveHandler);
    v34 = (void *)*((_QWORD *)v14 + 11);
    *((_QWORD *)v14 + 11) = v33;

    objc_msgSend(*((id *)v14 + 11), "start");
    objc_storeStrong((id *)v14 + 5, a5);
    objc_initWeak(&buf, v14);
    v35 = (void *)*((_QWORD *)v14 + 5);
    v43[0] = v24;
    v43[1] = 3221225472;
    v43[2] = __94__VTStateManager_initWithProperty_phraseSpotter_enablePolicy_callbackWithMessageAndTimestamp___block_invoke_14;
    v43[3] = &unk_24C7F4CD8;
    objc_copyWeak(&v44, &buf);
    objc_msgSend(v35, "setCallback:", v43);
    if (objc_msgSend(*((id *)v14 + 5), "isEnabled"))
    {
      v36 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v42 = 0;
        _os_log_impl(&dword_20D965000, v36, OS_LOG_TYPE_DEFAULT, "::: Checking VTStateManager policy: init to be : Start", v42, 2u);
      }
      objc_msgSend(v14, "_stateTransitionDidOccur:fromCallback:", 1, 0);
      objc_msgSend(v14, "coreSpeechKeepAliveHandler");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "voiceTriggerPolicyDidChange:", 1);
    }
    else
    {
      objc_msgSend(v14, "coreSpeechKeepAliveHandler");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "voiceTriggerPolicyDidChange:", 0);
    }

    +[VTFirstUnlockMonitor sharedInstance](VTFirstUnlockMonitor, "sharedInstance");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObserver:", v14);

    v39 = objc_alloc_init(VTRemoteDarwinHIDEventNotifier);
    v40 = (void *)*((_QWORD *)v14 + 10);
    *((_QWORD *)v14 + 10) = v39;

    objc_msgSend(*((id *)v14 + 10), "startObserving");
    objc_destroyWeak(&v44);
    objc_destroyWeak(&buf);
  }
  v17 = (VTStateManager *)v14;
LABEL_29:

  return v17;
}

- (void)_stateTransitionDidOccur:(BOOL)a3 fromCallback:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  int v8;
  NSObject *v9;
  const __CFString *v10;
  NSObject *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  unint64_t v16;
  unint64_t v17;
  NSObject *v18;
  VTStateManager *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t wakeGestureHostTime;
  BOOL v23;
  unint64_t v24;
  _BYTE v25[24];
  uint64_t v26;

  v4 = a4;
  v5 = a3;
  v26 = *MEMORY[0x24BDAC8D0];
  if (self->_voiceTriggerIsEnabledOnCoreSpeechDaemon != a3)
  {
    self->_voiceTriggerIsEnabledOnCoreSpeechDaemon = a3;
    notify_post("com.apple.voicetrigger.enablePolicyChanged");
  }
  if (v5)
  {
    +[VTPreferences sharedPreferences](VTPreferences, "sharedPreferences");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "voiceTriggerInCoreSpeech") ^ 1;

  }
  else
  {
    v8 = 0;
  }
  v9 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v10 = CFSTR("Stop");
    if (v8)
      v10 = CFSTR("Start");
    *(_DWORD *)v25 = 138543362;
    *(_QWORD *)&v25[4] = v10;
    _os_log_impl(&dword_20D965000, v9, OS_LOG_TYPE_DEFAULT, "VoiceTrigger will %{public}@", v25, 0xCu);
  }
  if (v4 && self->_voiceTriggerIsEnabled == v8)
  {
    v11 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v12 = CFSTR("stopped");
      if (v8)
        v12 = CFSTR("running");
      *(_DWORD *)v25 = 138543362;
      *(_QWORD *)&v25[4] = v12;
      _os_log_impl(&dword_20D965000, v11, OS_LOG_TYPE_DEFAULT, "VoiceTrigger is already %{public}@, nothing to change", v25, 0xCu);
    }
  }
  else
  {
    self->_voiceTriggerIsEnabled = v8;
    +[VTAggregator sharedAggregator](VTAggregator, "sharedAggregator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v8)
    {
      objc_msgSend(v13, "logTimeVoiceTriggerTransitionsToState:", 1);

      -[VTStateManager _powerlog:](self, "_powerlog:", &unk_24C8030B0);
      v15 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v25 = 0;
        _os_log_impl(&dword_20D965000, v15, OS_LOG_TYPE_DEFAULT, "::: Voice Trigger started", v25, 2u);
      }
      if (!self->_wakeGestureHostTime)
        self->_wakeGestureHostTime = mach_absolute_time();
      *(_QWORD *)v25 = 0;
      mach_timebase_info((mach_timebase_info_t)v25);
      if (*(_DWORD *)v25)
      {
        LODWORD(v16) = *(_DWORD *)&v25[4];
        v17 = (unint64_t)((double)v16 / (double)*(unsigned int *)v25 * 1000000000.0 * 0.05);
      }
      else
      {
        v17 = 0;
      }
      wakeGestureHostTime = self->_wakeGestureHostTime;
      v23 = wakeGestureHostTime >= v17;
      v24 = wakeGestureHostTime - v17;
      if (v23)
        v21 = v24;
      else
        v21 = 0;
      self->_wakeGestureHostTime = v21;
      v19 = self;
      v20 = 0;
    }
    else
    {
      objc_msgSend(v13, "logTimeVoiceTriggerTransitionsToState:", 0);

      -[VTStateManager _powerlog:](self, "_powerlog:", &unk_24C8030D8);
      v18 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v25 = 0;
        _os_log_impl(&dword_20D965000, v18, OS_LOG_TYPE_DEFAULT, "::: Voice Trigger stopped", v25, 2u);
      }
      self->_wakeGestureHostTime = 0;
      v19 = self;
      v20 = 1;
      v21 = 0;
    }
    -[VTStateManager _notifyStateTransitionToState:withStartTimestamp:](v19, "_notifyStateTransitionToState:withStartTimestamp:", v20, v21);
  }
}

- (void)_notifyStateTransitionToState:(int64_t)a3 withStartTimestamp:(unint64_t)a4
{
  NSObject *v7;
  NSObject *v8;
  int v9;
  int64_t v10;
  __int16 v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (self->_callbackWithMessageAndTimestamp)
  {
    if (a3)
    {
      if (a3 == 2 && !self->_rtModelDownloaded)
        self->_rtModelDownloaded = 1;
    }
    else if (!self->_rtModelDownloaded)
    {
      v7 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_20D965000, v7, OS_LOG_TYPE_DEFAULT, "::: For the first start request, we need to ask update model before start request", (uint8_t *)&v9, 2u);
        v7 = VTLogContextFacilityVoiceTrigger;
      }
      self->_rtModelDownloaded = 1;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 134349056;
        v10 = 2;
        _os_log_impl(&dword_20D965000, v7, OS_LOG_TYPE_DEFAULT, "::: Callback with message and timestamp : %{public}ld, 0", (uint8_t *)&v9, 0xCu);
      }
      (*((void (**)(void))self->_callbackWithMessageAndTimestamp + 2))();
    }
    kdebug_trace();
    v8 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134349312;
      v10 = a3;
      v11 = 2050;
      v12 = a4;
      _os_log_impl(&dword_20D965000, v8, OS_LOG_TYPE_DEFAULT, "::: Callback with message and timestamp : %{public}ld, %{public}llu", (uint8_t *)&v9, 0x16u);
    }
    (*((void (**)(void))self->_callbackWithMessageAndTimestamp + 2))();
  }
}

- (id)getPhraseSpotter
{
  return self->_phraseSpotter;
}

- (id)getModel
{
  return -[VTPhraseSpotter getCorealisRTModel](self->_phraseSpotter, "getCorealisRTModel");
}

- (void)_powerlog:(id)a3
{
  id v3;

  v3 = a3;
  if (PLShouldLogRegisteredEvent())
    PLLogRegisteredEvent();

}

- (void)gestureMonitorDidReceiveWakeGesture:(id)a3
{
  if (+[VTUtilities isNano](VTUtilities, "isNano", a3))
    self->_wakeGestureHostTime = mach_absolute_time();
  else
    -[VTPhraseSpotter didReceiveWakeGesture](self->_phraseSpotter, "didReceiveWakeGesture");
}

- (void)gestureMonitorDidReceiveSleepGesture:(id)a3
{
  if (!+[VTUtilities isNano](VTUtilities, "isNano", a3))
    -[VTPhraseSpotter didReceiveSleepGesture](self->_phraseSpotter, "didReceiveSleepGesture");
}

- (void)VTFirstUnlockMonitor:(id)a3 didReceiveFirstUnlock:(BOOL)a4
{
  if (a4)
    notify_post("com.apple.corespeech.voicetriggerassetchange");
}

- (void)_initializeXPCService
{
  VTXPCServiceServer *v3;
  VTXPCServiceServer *xpcServer;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(VTXPCServiceServer);
  xpcServer = self->_xpcServer;
  self->_xpcServer = v3;

  -[VTXPCServiceServer startService](self->_xpcServer, "startService");
  v5 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446210;
    v7 = "com.apple.voicetrigger.XPCRestarted";
    _os_log_impl(&dword_20D965000, v5, OS_LOG_TYPE_DEFAULT, "Notifying Post : %{public}s", (uint8_t *)&v6, 0xCu);
  }
  notify_post("com.apple.voicetrigger.XPCRestarted");
}

- (VTCoreSpeechKeepAliveHandler)coreSpeechKeepAliveHandler
{
  return self->_coreSpeechKeepAliveHandler;
}

- (void)setCoreSpeechKeepAliveHandler:(id)a3
{
  objc_storeStrong((id *)&self->_coreSpeechKeepAliveHandler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreSpeechKeepAliveHandler, 0);
  objc_storeStrong((id *)&self->_remoteDarwinHIDEventNotifier, 0);
  objc_storeStrong((id *)&self->_gestureMonitor, 0);
  objc_storeStrong((id *)&self->_xpcServer, 0);
  objc_storeStrong((id *)&self->_enablePolicy, 0);
  objc_storeStrong(&self->_callbackWithMessageAndTimestamp, 0);
  objc_storeStrong((id *)&self->_builtInRTModel, 0);
  objc_storeStrong((id *)&self->_phraseSpotter, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __94__VTStateManager_initWithProperty_phraseSpotter_enablePolicy_callbackWithMessageAndTimestamp___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyStateTransitionToState:withStartTimestamp:", 2, 0);
}

void __94__VTStateManager_initWithProperty_phraseSpotter_enablePolicy_callbackWithMessageAndTimestamp___block_invoke_14(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("NO");
    if ((_DWORD)a2)
      v5 = CFSTR("YES");
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_20D965000, v4, OS_LOG_TYPE_DEFAULT, "::: Checking VTStateManager policy: Should be running? %{public}@", (uint8_t *)&v7, 0xCu);
  }
  objc_msgSend(WeakRetained, "_stateTransitionDidOccur:fromCallback:", a2, 1);
  objc_msgSend(WeakRetained, "coreSpeechKeepAliveHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "voiceTriggerPolicyDidChange:", a2);

}

void __94__VTStateManager_initWithProperty_phraseSpotter_enablePolicy_callbackWithMessageAndTimestamp___block_invoke_2()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  Class (*v8)(uint64_t);
  void *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v0 = (void *)getCSActivationEventNotifierClass_softClass;
  v14 = getCSActivationEventNotifierClass_softClass;
  if (!getCSActivationEventNotifierClass_softClass)
  {
    v6 = MEMORY[0x24BDAC760];
    v7 = 3221225472;
    v8 = __getCSActivationEventNotifierClass_block_invoke;
    v9 = &unk_24C7F5000;
    v10 = &v11;
    __getCSActivationEventNotifierClass_block_invoke((uint64_t)&v6);
    v0 = (void *)v12[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v11, 8);
  objc_msgSend(v1, "sharedNotifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v3 = (void *)getCSActivationEventClass_softClass;
  v14 = getCSActivationEventClass_softClass;
  if (!getCSActivationEventClass_softClass)
  {
    v6 = MEMORY[0x24BDAC760];
    v7 = 3221225472;
    v8 = __getCSActivationEventClass_block_invoke;
    v9 = &unk_24C7F5000;
    v10 = &v11;
    __getCSActivationEventClass_block_invoke((uint64_t)&v6);
    v3 = (void *)v12[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v11, 8);
  objc_msgSend(v4, "mediaserverdLaunchedEvent:", mach_absolute_time());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifyActivationEvent:completion:", v5, &__block_literal_global_10_3621);

}

void __94__VTStateManager_initWithProperty_phraseSpotter_enablePolicy_callbackWithMessageAndTimestamp___block_invoke_3()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20D965000, v0, OS_LOG_TYPE_DEFAULT, "finished mediaserverd launch notification", v1, 2u);
  }
}

uint64_t __55__VTStateManager_initWithProperty_callbackWithMessage___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)_serviceClient
{
  if (_serviceClient_onceToken != -1)
    dispatch_once(&_serviceClient_onceToken, &__block_literal_global_47);
  return (id)_serviceClient__serviceClient;
}

+ (void)requestVoiceTriggerEnabled:(BOOL)a3 forReason:(id)a4
{
  _BOOL8 v4;
  id v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  const __CFString *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v4 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("DISABLE");
    if (v4)
      v7 = CFSTR("ENABLE");
    v11 = 138543618;
    v12 = v7;
    v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_20D965000, v6, OS_LOG_TYPE_DEFAULT, "::: Received request to %{public}@ voice trigger - Reason: %{public}@)", (uint8_t *)&v11, 0x16u);
  }
  +[VTPreferences sharedPreferences](VTPreferences, "sharedPreferences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "corespeechDaemonEnabled");

  if (v9)
    objc_msgSend(getCSVoiceTriggerXPCServiceClass(), "sharedService");
  else
    +[VTStateManager _serviceClient](VTStateManager, "_serviceClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "enableVoiceTrigger:withAssertion:", v4, v5);

}

+ (void)requestPhraseSpotterBypassing:(BOOL)a3 timeout:(double)a4
{
  _BOOL8 v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  const __CFString *v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  v5 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  v6 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("DO NOT");
    if (v5)
      v7 = CFSTR("DO");
    v11 = 138543618;
    v12 = v7;
    v13 = 2050;
    v14 = a4;
    _os_log_impl(&dword_20D965000, v6, OS_LOG_TYPE_DEFAULT, "::: Received request to %{public}@ bypass phrase spotter with timeout: %{public}f", (uint8_t *)&v11, 0x16u);
  }
  +[VTPreferences sharedPreferences](VTPreferences, "sharedPreferences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "corespeechDaemonEnabled");

  if (v9)
    objc_msgSend(getCSVoiceTriggerXPCServiceClass(), "sharedService");
  else
    +[VTStateManager _serviceClient](VTStateManager, "_serviceClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPhraseSpotterBypassing:timeout:", v5, a4);

}

+ (void)notifyVoiceTriggeredSiriSessionCancelled
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint8_t v6[16];

  v2 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_20D965000, v2, OS_LOG_TYPE_DEFAULT, "::: Received voice triggered siri session cancellation", v6, 2u);
  }
  +[VTPreferences sharedPreferences](VTPreferences, "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "corespeechDaemonEnabled");

  if (v4)
  {
    objc_msgSend(getCSVoiceTriggerXPCServiceClass(), "sharedService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "notifyVoiceTriggeredSiriSessionCancelled");
  }
  else
  {
    +[VTStateManager _serviceClient](VTStateManager, "_serviceClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "notifyVoiceTriggeredSiriSessionCancelled:", CFSTR("Unknown"));
  }

}

+ (void)notifyVoiceTriggeredSiriSessionCancelled:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_20D965000, v4, OS_LOG_TYPE_DEFAULT, "::: Received voice triggered siri session cancellation with reason: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  +[VTStateManager _serviceClient](VTStateManager, "_serviceClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notifyVoiceTriggeredSiriSessionCancelled:", v3);

}

+ (void)requestForcedSecondChance
{
  id v2;

  +[VTStateManager _serviceClient](VTStateManager, "_serviceClient");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifySecondChanceRequest");

}

+ (void)requestForcedTriggerEvent
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  v2 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20D965000, v2, OS_LOG_TYPE_DEFAULT, "::: Received request to force trigger event", v4, 2u);
  }
  +[VTStateManager _serviceClient](VTStateManager, "_serviceClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notifyTriggerEventRequest");

}

+ (BOOL)isLastTriggerForced
{
  void *v2;
  BOOL v3;

  +[VTStateManager _serviceClient](VTStateManager, "_serviceClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "getLastTriggerType") == 3;

  return v3;
}

+ (BOOL)isLastTriggerSecondChanceTriggered
{
  void *v2;
  BOOL v3;

  +[VTStateManager _serviceClient](VTStateManager, "_serviceClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "getLastTriggerType") == 2;

  return v3;
}

+ (void)clearVoiceTriggerCount
{
  id v2;

  +[VTStateManager _serviceClient](VTStateManager, "_serviceClient");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearVoiceTriggerCount");

}

+ (int64_t)getVoiceTriggerCount
{
  void *v2;
  int64_t v3;

  +[VTStateManager _serviceClient](VTStateManager, "_serviceClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "getVoiceTriggerCount");

  return v3;
}

+ (id)firstChanceAudioBuffer
{
  void *v2;
  void *v3;

  +[VTStateManager _serviceClient](VTStateManager, "_serviceClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getFirstChanceAudioBuffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)firstChanceVTEventInfo
{
  void *v2;
  void *v3;

  +[VTStateManager _serviceClient](VTStateManager, "_serviceClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getFirstChanceVTEventInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)firstChanceTriggeredDate
{
  void *v2;
  void *v3;

  +[VTStateManager _serviceClient](VTStateManager, "_serviceClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getFirstChanceTriggeredDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)requestAudioCapture:(double)a3
{
  id v4;

  +[VTStateManager _serviceClient](VTStateManager, "_serviceClient");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestAudioCapture:", a3);

}

+ (id)requestCurrentVoiceTriggerAssetDictionary
{
  VTXPCServiceClient *v2;
  void *v3;

  v2 = objc_alloc_init(VTXPCServiceClient);
  -[VTXPCServiceClient requestCurrentVoiceTriggerAssetDictionary](v2, "requestCurrentVoiceTriggerAssetDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)requestCurrentVoiceTriggerAssetDictionaryWithReply:(id)a3
{
  id v3;
  dispatch_semaphore_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  dispatch_time_t v8;
  _QWORD v9[4];
  NSObject *v10;
  id v11;

  v3 = a3;
  v4 = dispatch_semaphore_create(0);
  +[VTStateManager _serviceClient](VTStateManager, "_serviceClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __69__VTStateManager_requestCurrentVoiceTriggerAssetDictionaryWithReply___block_invoke;
  v9[3] = &unk_24C7F42C8;
  v6 = v3;
  v11 = v6;
  v7 = v4;
  v10 = v7;
  objc_msgSend(v5, "requestCurrentVoiceTriggerAssetDictionaryWithReply:", v9);

  v8 = dispatch_time(0, 1000000000);
  if (dispatch_semaphore_wait(v7, v8))
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);

}

+ (id)requestCurrentBuiltInRTModelDictionary
{
  NSObject *v2;
  VTXPCServiceClient *v3;
  void *v4;
  uint8_t v6[16];

  v2 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_20D965000, v2, OS_LOG_TYPE_DEFAULT, "", v6, 2u);
  }
  v3 = objc_alloc_init(VTXPCServiceClient);
  -[VTXPCServiceClient requestCurrentBuiltInRTModelDictionary](v3, "requestCurrentBuiltInRTModelDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)setCurrentBuiltInRTModelDictionary:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[VTStateManager _serviceClient](VTStateManager, "_serviceClient");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCurrentBuiltInRTModelDictionary:", v3);

}

+ (void)notifyVoiceTrigger
{
  void *v2;
  int v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint8_t buf[16];

  +[VTPreferences sharedPreferences](VTPreferences, "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "useSiriActivationSPIForiOS");

  if (v3)
  {
    mach_absolute_time();
    +[VTPhraseSpotter currentSpotter](VTPhraseSpotter, "currentSpotter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastVoiceTriggerEventInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    AFSiriActivationBuiltInMicVoiceTrigger();

  }
  else
  {
    notify_post("com.apple.coreaudio.borealisTrigger");
    v5 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D965000, v5, OS_LOG_TYPE_DEFAULT, "Use legacy trigger notificiation", buf, 2u);
    }
  }
}

+ (BOOL)iPhoneShouldStartVoiceTriggerInCoreSpeech
{
  void *v2;
  int v3;
  void *v4;
  char v5;

  +[VTPreferences sharedPreferences](VTPreferences, "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "voiceTriggerInCoreSpeech");

  if (!v3)
    return 0;
  +[VTPolicy defaultVoiceTriggerEnablePolicy](VTPolicy, "defaultVoiceTriggerEnablePolicy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEnabled");

  return v5;
}

void __36__VTStateManager_notifyVoiceTrigger__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = VTLogContextFacilityVoiceTrigger;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_20D965000, v5, OS_LOG_TYPE_DEFAULT, "AFSiriActivationBuiltInMicVoiceTrigger success", (uint8_t *)&v8, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
  {
    v6 = v5;
    objc_msgSend(v4, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_error_impl(&dword_20D965000, v6, OS_LOG_TYPE_ERROR, "AFSiriActivationBuiltInMicVoiceTrigger failed : %{public}@", (uint8_t *)&v8, 0xCu);

  }
}

intptr_t __69__VTStateManager_requestCurrentVoiceTriggerAssetDictionaryWithReply___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __32__VTStateManager__serviceClient__block_invoke()
{
  VTXPCServiceClient *v0;
  void *v1;

  v0 = objc_alloc_init(VTXPCServiceClient);
  v1 = (void *)_serviceClient__serviceClient;
  _serviceClient__serviceClient = (uint64_t)v0;

}

@end
