@implementation SBScreenLongevityController

+ (id)sharedInstanceIfExists
{
  return (id)objc_msgSend(a1, "_sharedInstanceCreateIfNeeded:", 0);
}

+ (id)_sharedInstanceCreateIfNeeded:(BOOL)a3
{
  if (a3 && _sharedInstanceCreateIfNeeded__onceToken_2 != -1)
    dispatch_once(&_sharedInstanceCreateIfNeeded__onceToken_2, &__block_literal_global_406);
  return (id)_sharedInstanceCreateIfNeeded__controller_0;
}

void __61__SBScreenLongevityController__sharedInstanceCreateIfNeeded___block_invoke()
{
  SBScreenLongevityController *v0;
  void *v1;

  v0 = objc_alloc_init(SBScreenLongevityController);
  v1 = (void *)_sharedInstanceCreateIfNeeded__controller_0;
  _sharedInstanceCreateIfNeeded__controller_0 = (uint64_t)v0;

}

+ (id)sharedInstance
{
  return (id)objc_msgSend(a1, "_sharedInstanceCreateIfNeeded:", 1);
}

- (SBScreenLongevityController)init
{
  SBScreenLongevityController *v2;
  void *v3;
  uint64_t v4;
  SBScreenLongevitySettings *settings;
  void *v6;
  void *v7;
  AWAttentionAwarenessConfiguration *v8;
  AWAttentionAwarenessConfiguration *idleTouchAwarenessConfiguration;
  AWAttentionAwarenessConfiguration *v10;
  SBAttentionAwarenessClient *v11;
  SBAttentionAwarenessClient *idleTouchAwarenessClient;
  BrightnessSystemClient *v13;
  BrightnessSystemClient *brightnessSystemClient;
  BrightnessSystemClient *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id location;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)SBScreenLongevityController;
  v2 = -[SBScreenLongevityController init](&v23, sel_init);
  if (v2)
  {
    objc_msgSend((id)SBApp, "sensorActivityDataProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:", v2);

    +[SBScreenLongevityDomain rootSettings](SBScreenLongevityDomain, "rootSettings");
    v4 = objc_claimAutoreleasedReturnValue();
    settings = v2->_settings;
    v2->_settings = (SBScreenLongevitySettings *)v4;

    -[PTSettings addKeyObserver:](v2->_settings, "addKeyObserver:", v2);
    -[SBScreenLongevityController _observeDefaults](v2, "_observeDefaults");
    v2->_attentionAwarenessFeatureMonitoringToken = 0;
    -[SBScreenLongevityController _beginMonitoringAttentionAwarenessFeaturesEnablement](v2, "_beginMonitoringAttentionAwarenessFeaturesEnablement");
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "registerObserver:", v2);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel__mediaNowPlayingChanged, CFSTR("SBMediaNowPlayingChangedNotification"), 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel__screenBacklightStateChanged, CFSTR("SBBlankScreenStateChangeNotification"), 0);
    v8 = (AWAttentionAwarenessConfiguration *)objc_alloc_init(MEMORY[0x1E0CFEC08]);
    idleTouchAwarenessConfiguration = v2->_idleTouchAwarenessConfiguration;
    v2->_idleTouchAwarenessConfiguration = v8;

    -[AWAttentionAwarenessConfiguration setIdentifier:](v2->_idleTouchAwarenessConfiguration, "setIdentifier:", CFSTR("screen-longevity-idle-touch"));
    -[AWAttentionAwarenessConfiguration setEventMask:](v2->_idleTouchAwarenessConfiguration, "setEventMask:", 94);
    v10 = v2->_idleTouchAwarenessConfiguration;
    -[SBScreenLongevitySettings touchAttentionLostTimeout](v2->_settings, "touchAttentionLostTimeout");
    -[AWAttentionAwarenessConfiguration setAttentionLostTimeout:](v10, "setAttentionLostTimeout:");
    v11 = objc_alloc_init(SBAttentionAwarenessClient);
    idleTouchAwarenessClient = v2->_idleTouchAwarenessClient;
    v2->_idleTouchAwarenessClient = v11;

    -[SBAttentionAwarenessClient setDelegate:](v2->_idleTouchAwarenessClient, "setDelegate:", v2);
    -[SBAttentionAwarenessClient setConfiguration:](v2->_idleTouchAwarenessClient, "setConfiguration:", v2->_idleTouchAwarenessConfiguration);
    -[SBAttentionAwarenessClient setEnabled:](v2->_idleTouchAwarenessClient, "setEnabled:", 0);
    v13 = (BrightnessSystemClient *)objc_alloc_init(MEMORY[0x1E0D15710]);
    brightnessSystemClient = v2->_brightnessSystemClient;
    v2->_brightnessSystemClient = v13;

    objc_initWeak(&location, v2);
    v15 = v2->_brightnessSystemClient;
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __35__SBScreenLongevityController_init__block_invoke;
    v20 = &unk_1E8EC1540;
    objc_copyWeak(&v21, &location);
    -[BrightnessSystemClient registerNotificationBlock:forProperties:](v15, "registerNotificationBlock:forProperties:", &v17, &unk_1E91CF580);
    v2->_enabled = 0;
    -[SBScreenLongevityController evaluateEnablement](v2, "evaluateEnablement", v17, v18, v19, v20);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);

  }
  return v2;
}

void __35__SBScreenLongevityController_init__block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__SBScreenLongevityController_init__block_invoke_2;
  block[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __35__SBScreenLongevityController_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "evaluateEnablement");

}

- (void)dealloc
{
  SBAttentionAwarenessClient *idleTouchAwarenessClient;
  SBAttentionAwarenessClient *v4;
  SBAttentionAwarenessStreamerClient *faceStreamAwarenessClient;
  SBAttentionAwarenessStreamerClient *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  -[SBScreenLongevityController setEnabled:](self, "setEnabled:", 0);
  idleTouchAwarenessClient = self->_idleTouchAwarenessClient;
  if (idleTouchAwarenessClient)
  {
    -[SBAttentionAwarenessClient invalidate](idleTouchAwarenessClient, "invalidate");
    v4 = self->_idleTouchAwarenessClient;
    self->_idleTouchAwarenessClient = 0;

  }
  faceStreamAwarenessClient = self->_faceStreamAwarenessClient;
  if (faceStreamAwarenessClient)
  {
    -[SBAttentionAwarenessStreamerClient invalidate](faceStreamAwarenessClient, "invalidate");
    v6 = self->_faceStreamAwarenessClient;
    self->_faceStreamAwarenessClient = 0;

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", self);

  objc_msgSend((id)SBApp, "sensorActivityDataProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:", self);

  -[PTSettings removeKeyObserver:](self->_settings, "removeKeyObserver:", self);
  -[BSDefaultObserver invalidate](self->_defaultsObserver, "invalidate");
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unregisterObserver:", self);

  -[SBScreenLongevityController _endMonitoringAttentionAwarenessFeaturesEnablement](self, "_endMonitoringAttentionAwarenessFeaturesEnablement");
  v10.receiver = self;
  v10.super_class = (Class)SBScreenLongevityController;
  -[SBScreenLongevityController dealloc](&v10, sel_dealloc);
}

- (void)evaluateEnablement
{
  -[SBScreenLongevityController setEnabled:](self, "setEnabled:", -[SBScreenLongevityController _shouldEnable](self, "_shouldEnable"));
}

- (void)setEnabled:(BOOL)a3
{
  NSObject *v4;
  _BOOL4 enabled;
  SBAttentionAwarenessStreamerClient *faceStreamAwarenessClient;
  SBAttentionAwarenessStreamerClient *v7;
  _QWORD block[5];
  uint8_t buf[4];
  _BOOL4 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    SBLogScreenLongevityController();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      enabled = self->_enabled;
      *(_DWORD *)buf = 67109120;
      v10 = enabled;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "set enabled -> %{BOOL}u", buf, 8u);
    }

    if (!-[SBScreenLongevitySettings noOpButLogOnEnablementUpdate](self->_settings, "noOpButLogOnEnablementUpdate"))
    {
      -[SBAttentionAwarenessClient setEnabled:](self->_idleTouchAwarenessClient, "setEnabled:", self->_enabled);
      faceStreamAwarenessClient = self->_faceStreamAwarenessClient;
      if (faceStreamAwarenessClient)
      {
        -[SBAttentionAwarenessStreamerClient invalidate](faceStreamAwarenessClient, "invalidate");
        v7 = self->_faceStreamAwarenessClient;
        self->_faceStreamAwarenessClient = 0;

      }
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __42__SBScreenLongevityController_setEnabled___block_invoke;
      block[3] = &unk_1E8E9DED8;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
}

void __42__SBScreenLongevityController_setEnabled___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 28))
  {
    if (!objc_msgSend(*(id *)(v2 + 64), "isValid"))
    {
      v8 = objc_opt_new();
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 64);
      *(_QWORD *)(v9 + 64) = v8;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setDelegate:");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "start");
      return;
    }
    SBLogScreenLongevityController();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __42__SBScreenLongevityController_setEnabled___block_invoke_cold_4();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "invalidate");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 64);
    *(_QWORD *)(v4 + 64) = 0;
    goto LABEL_23;
  }
  v6 = objc_msgSend((id)v2, "_isDimmed");
  v7 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    if (objc_msgSend(*(id *)(v7 + 72), "isValid"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "invalidate");
    }
    else
    {
      SBLogScreenLongevityController();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __42__SBScreenLongevityController_setEnabled___block_invoke_cold_1();

    }
    objc_msgSend(*(id *)(a1 + 32), "_undim");
  }
  else
  {
    if (objc_msgSend(*(id *)(v7 + 64), "isValid"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "invalidate");
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(void **)(v11 + 64);
      *(_QWORD *)(v11 + 64) = 0;

    }
    else
    {
      SBLogScreenLongevityController();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __42__SBScreenLongevityController_setEnabled___block_invoke_cold_3();

    }
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "isValid"))
    {
      SBLogScreenLongevityController();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        __42__SBScreenLongevityController_setEnabled___block_invoke_cold_2();

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "invalidate");
      v16 = *(_QWORD *)(a1 + 32);
      v5 = *(void **)(v16 + 72);
      *(_QWORD *)(v16 + 72) = 0;
LABEL_23:

    }
  }
}

- (void)resetTimerForReason:(id)a3
{
  if (self->_enabled)
    -[SBScreenLongevityController _clientDidResetForUserAttention:](self, "_clientDidResetForUserAttention:", a3);
}

- (BOOL)_shouldEnable
{
  int v3;
  NSObject *v4;
  void *v5;
  int v6;
  int v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  _BOOL4 v16;
  int v17;
  NSObject *v18;
  int v20;
  int v21;
  int v22;
  int v23;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  _BOOL4 v31;
  __int16 v32;
  _BOOL4 v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  __int16 v42;
  _BOOL4 v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (!-[SBScreenLongevitySettings overrideEnablement](self->_settings, "overrideEnablement"))
  {
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isAutoDimAllowed");

    v7 = _AXSAttentionAwarenessFeaturesEnabled();
    v8 = -[SBScreenLongevityController _hasCameraAttributions](self, "_hasCameraAttributions");
    v9 = -[SBScreenLongevityController _isAutoLockSetToNever](self, "_isAutoLockSetToNever");
    v10 = -[SBScreenLongevitySettings ignoreAutoLockSetToNever](self->_settings, "ignoreAutoLockSetToNever");
    +[SBMediaController sharedInstance](SBMediaController, "sharedInstance");
    v4 = objc_claimAutoreleasedReturnValue();
    v23 = -[NSObject isPlaying](v4, "isPlaying");
    -[NSObject playingMediaType](v4, "playingMediaType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
      v22 = objc_msgSend(v11, "isEqual:", *MEMORY[0x1E0D4CB78]) ^ 1;
    else
      v22 = 0;
    +[SBIdleTimerService sharedInstance](SBIdleTimerService, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v13, "isDisabledByMediaPlayback");

    +[SBIdleTimerGlobalCoordinator sharedInstance](SBIdleTimerGlobalCoordinator, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v14, "isIdleTimerDisabled");

    v15 = -[SBScreenLongevityController isUnderAutoDimThreshold](self, "isUnderAutoDimThreshold");
    v16 = v15;
    v3 = 0;
    v17 = v6 ^ 1;
    if (!v7)
      v17 = 1;
    if (((v17 | v8) & 1) == 0 && (!v9 || !v10))
    {
      if (((v23 & (v22 ^ 1) | v21) & 1) != 0)
        v3 = 0;
      else
        v3 = v20 & !v15;
    }
    if (self->_enabled != v3 || -[SBScreenLongevitySettings noisyLogging](self->_settings, "noisyLogging"))
    {
      SBLogScreenLongevityController();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67111424;
        v25 = v3;
        v26 = 1024;
        v27 = v6;
        v28 = 1024;
        v29 = v8;
        v30 = 1024;
        v31 = v9;
        v32 = 1024;
        v33 = v10;
        v34 = 1024;
        v35 = v23;
        v36 = 1024;
        v37 = v22;
        v38 = 1024;
        v39 = v21;
        v40 = 1024;
        v41 = v20;
        v42 = 1024;
        v43 = v16;
        _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_DEFAULT, "shouldEnable=%{BOOL}u, isDeviceAllowedByManagedConfiguration=%{BOOL}u, isCameraInUse=%{BOOL}u, isAutoLockDisabled=%{BOOL}u, shouldIgnoreAutoLockDisable=%{BOOL}u, isMediaNowPlaying=%{BOOL}u, isProbablyAudioOnly=%{BOOL}u, isIdleTimerDisabledByMediaPlayback=%{BOOL}u, isIdleTimerOffForAnyReason=%{BOOL}u isAutoDimThresholdPassed=%{BOOL}u", buf, 0x3Eu);
      }

    }
    goto LABEL_22;
  }
  v3 = -[SBScreenLongevitySettings enablement](self->_settings, "enablement");
  if (self->_enabled != v3 || -[SBScreenLongevitySettings noisyLogging](self->_settings, "noisyLogging"))
  {
    SBLogScreenLongevityController();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v25 = v3;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "shouldEnable=%{BOOL}u from override", buf, 8u);
    }
LABEL_22:

  }
  return v3;
}

- (void)_mediaNowPlayingChanged
{
  NSObject *v3;
  uint8_t v4[16];

  SBLogScreenLongevityController();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Media now playing state changed", v4, 2u);
  }

  -[SBScreenLongevityController evaluateEnablement](self, "evaluateEnablement");
}

- (void)_screenBacklightStateChanged
{
  NSObject *v3;
  uint8_t v4[16];

  SBLogScreenLongevityController();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Screen backlight state changed", v4, 2u);
  }

  -[SBScreenLongevityController evaluateEnablement](self, "evaluateEnablement");
}

- (void)_beginMonitoringAttentionAwarenessFeaturesEnablement
{
  int *p_attentionAwarenessFeatureMonitoringToken;
  const char *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  p_attentionAwarenessFeatureMonitoringToken = &self->_attentionAwarenessFeatureMonitoringToken;
  if (!self->_attentionAwarenessFeatureMonitoringToken)
  {
    objc_initWeak(&location, self);
    v3 = (const char *)objc_msgSend(objc_retainAutorelease((id)*MEMORY[0x1E0DDE018]), "UTF8String");
    v4 = MEMORY[0x1E0C80D38];
    v5 = MEMORY[0x1E0C80D38];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __83__SBScreenLongevityController__beginMonitoringAttentionAwarenessFeaturesEnablement__block_invoke;
    v6[3] = &unk_1E8EC1568;
    objc_copyWeak(&v7, &location);
    notify_register_dispatch(v3, p_attentionAwarenessFeatureMonitoringToken, v4, v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __83__SBScreenLongevityController__beginMonitoringAttentionAwarenessFeaturesEnablement__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  SBLogScreenLongevityController();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "Attention awarenesss feature enablement changed", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "evaluateEnablement");

}

- (void)_endMonitoringAttentionAwarenessFeaturesEnablement
{
  int attentionAwarenessFeatureMonitoringToken;

  attentionAwarenessFeatureMonitoringToken = self->_attentionAwarenessFeatureMonitoringToken;
  if (attentionAwarenessFeatureMonitoringToken)
  {
    notify_cancel(attentionAwarenessFeatureMonitoringToken);
    self->_attentionAwarenessFeatureMonitoringToken = 0;
  }
}

- (BOOL)_hasCameraAttributions
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend((id)SBApp, "sensorActivityDataProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeCameraAndMicrophoneActivityAttributions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_filter:", &__block_literal_global_23_11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v4, "count") != 0;
  return (char)v2;
}

BOOL __53__SBScreenLongevityController__hasCameraAttributions__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sensor") == 0;
}

- (BOOL)_isAutoLockSetToNever
{
  void *v2;
  void *v3;

  +[SBIdleTimerGlobalStateMonitor sharedInstance](SBIdleTimerGlobalStateMonitor, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "autoLockTimeout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "intValue") == 0x7FFFFFFF;
  return (char)v2;
}

- (void)_dim
{
  _QWORD block[5];

  if (self->_enabled)
    -[SBScreenLongevityController _toggleBacklightAdaptiveDimming:](self, "_toggleBacklightAdaptiveDimming:", 1);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__SBScreenLongevityController__dim__block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __35__SBScreenLongevityController__dim__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "isValid"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "invalidate");
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 64);
    *(_QWORD *)(v2 + 64) = 0;

  }
}

- (void)_undim
{
  _QWORD block[5];

  -[SBScreenLongevityController _toggleBacklightAdaptiveDimming:](self, "_toggleBacklightAdaptiveDimming:", 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__SBScreenLongevityController__undim__block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __37__SBScreenLongevityController__undim__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "isValid"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "invalidate");
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 72);
    *(_QWORD *)(v2 + 72) = 0;

  }
}

- (void)_toggleBacklightAdaptiveDimming:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v3 = a3;
  v7 = *MEMORY[0x1E0C80C00];
  SBLogScreenLongevityController();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Back light adaptive dimming enable -> %u", (uint8_t *)v6, 8u);
  }

  -[SBScreenLongevityController setAdaptiveDimmingEnabled:](self, "setAdaptiveDimmingEnabled:", v3);
}

- (void)_checkFaceAttentionAwareness
{
  SBAttentionAwarenessStreamerClient *faceStreamAwarenessClient;
  SBAttentionAwarenessStreamerClient *v4;
  SBAttentionAwarenessStreamerClient *v5;
  SBAttentionAwarenessStreamerClient *v6;
  SBAttentionAwarenessStreamerClient *v7;
  void *v8;

  faceStreamAwarenessClient = self->_faceStreamAwarenessClient;
  if (faceStreamAwarenessClient)
  {
    -[SBAttentionAwarenessStreamerClient invalidate](faceStreamAwarenessClient, "invalidate");
    v4 = self->_faceStreamAwarenessClient;
    self->_faceStreamAwarenessClient = 0;

  }
  v5 = objc_alloc_init(SBAttentionAwarenessStreamerClient);
  v6 = self->_faceStreamAwarenessClient;
  self->_faceStreamAwarenessClient = v5;

  -[SBAttentionAwarenessStreamerClient setDelegate:](self->_faceStreamAwarenessClient, "setDelegate:", self);
  v7 = self->_faceStreamAwarenessClient;
  -[SBScreenLongevityController faceStreamAwarenessConfiguration](self, "faceStreamAwarenessConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAttentionAwarenessStreamerClient setConfiguration:](v7, "setConfiguration:", v8);

  -[SBAttentionAwarenessStreamerClient resume](self->_faceStreamAwarenessClient, "resume");
}

- (id)faceStreamAwarenessConfiguration
{
  AWAttentionAwarenessConfiguration *faceStreamAwarenessConfiguration;
  AWAttentionAwarenessConfiguration *v4;
  AWAttentionAwarenessConfiguration *v5;

  faceStreamAwarenessConfiguration = self->_faceStreamAwarenessConfiguration;
  if (!faceStreamAwarenessConfiguration)
  {
    v4 = (AWAttentionAwarenessConfiguration *)objc_alloc_init(MEMORY[0x1E0CFEC08]);
    v5 = self->_faceStreamAwarenessConfiguration;
    self->_faceStreamAwarenessConfiguration = v4;

    -[AWAttentionAwarenessConfiguration setContinuousFaceDetectMode:](self->_faceStreamAwarenessConfiguration, "setContinuousFaceDetectMode:", 1);
    -[AWAttentionAwarenessConfiguration setUnityStream:](self->_faceStreamAwarenessConfiguration, "setUnityStream:", 1);
    -[AWAttentionAwarenessConfiguration setIdentifier:](self->_faceStreamAwarenessConfiguration, "setIdentifier:", CFSTR("screen-longevity-face-stream"));
    faceStreamAwarenessConfiguration = self->_faceStreamAwarenessConfiguration;
  }
  return faceStreamAwarenessConfiguration;
}

- (void)_observeDefaults
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  BSDefaultObserver *v8;
  BSDefaultObserver *defaultsObserver;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screenLongevityDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "dimInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C80D38];
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __47__SBScreenLongevityController__observeDefaults__block_invoke;
  v13 = &unk_1E8E9DF28;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v4, "observeDefaults:onQueue:withBlock:", v6, MEMORY[0x1E0C80D38], &v10);
  v8 = (BSDefaultObserver *)objc_claimAutoreleasedReturnValue();
  defaultsObserver = self->_defaultsObserver;
  self->_defaultsObserver = v8;

  -[SBScreenLongevityController _updateCachedDefaults](self, "_updateCachedDefaults", v10, v11, v12, v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __47__SBScreenLongevityController__observeDefaults__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateCachedDefaults");

}

- (void)_updateCachedDefaults
{
  void *v3;
  SBScreenLongevitySettings *settings;
  id v5;

  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screenLongevityDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  settings = self->_settings;
  objc_msgSend(v5, "dimInterval");
  -[SBScreenLongevitySettings setDimInterval:](settings, "setDimInterval:");

}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v6;
  void *v7;
  int v8;
  AWAttentionAwarenessConfiguration *idleTouchAwarenessConfiguration;
  void *v10;

  v6 = a4;
  v7 = v6;
  if (self->_settings == a3)
  {
    v10 = v6;
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("ignoreAutoLockSetToNever")) & 1) != 0
      || (objc_msgSend(v10, "isEqualToString:", CFSTR("overrideEnablement")) & 1) != 0
      || objc_msgSend(v10, "isEqualToString:", CFSTR("enablement")))
    {
      -[SBScreenLongevityController evaluateEnablement](self, "evaluateEnablement");
    }
    else
    {
      v8 = objc_msgSend(v10, "isEqualToString:", CFSTR("touchAttentionLostTimeout"));
      v7 = v10;
      if (!v8)
        goto LABEL_7;
      -[SBAttentionAwarenessClient setEnabled:](self->_idleTouchAwarenessClient, "setEnabled:", 0);
      idleTouchAwarenessConfiguration = self->_idleTouchAwarenessConfiguration;
      -[SBScreenLongevitySettings touchAttentionLostTimeout](self->_settings, "touchAttentionLostTimeout");
      -[AWAttentionAwarenessConfiguration setAttentionLostTimeout:](idleTouchAwarenessConfiguration, "setAttentionLostTimeout:");
      -[SBAttentionAwarenessClient setConfiguration:](self->_idleTouchAwarenessClient, "setConfiguration:", self->_idleTouchAwarenessConfiguration);
      -[SBAttentionAwarenessClient setEnabled:](self->_idleTouchAwarenessClient, "setEnabled:", 1);
    }
    v7 = v10;
  }
LABEL_7:

}

- (void)activityDidChangeForSensorActivityDataProvider:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  SBLogScreenLongevityController();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Sensor activity updated", v5, 2u);
  }

  -[SBScreenLongevityController evaluateEnablement](self, "evaluateEnablement");
}

- (void)_startDimTimer
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__SBScreenLongevityController__startDimTimer__block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __45__SBScreenLongevityController__startDimTimer__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "isValid");
  if ((result & 1) == 0)
  {
    v3 = objc_opt_new();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 64);
    *(_QWORD *)(v4 + 64) = v3;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setDelegate:");
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "start");
  }
  return result;
}

- (void)client:(id)a3 attentionLostTimeoutDidExpire:(double)a4 forConfigurationGeneration:(unint64_t)a5 withAssociatedObject:(id)a6
{
  id v8;
  SBAttentionAwarenessClient *v9;

  v9 = (SBAttentionAwarenessClient *)a3;
  v8 = a6;
  if (self->_enabled && self->_idleTouchAwarenessClient == v9)
    -[SBScreenLongevityController _startDimTimer](self, "_startDimTimer");

}

- (void)_clientDidResetForUserAttention:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogScreenLongevityController();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Reset for user attention: %@", buf, 0xCu);
  }

  if (-[SBScreenLongevityController _isDimmed](self, "_isDimmed"))
    -[SBScreenLongevityController _undim](self, "_undim");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__SBScreenLongevityController__clientDidResetForUserAttention___block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __63__SBScreenLongevityController__clientDidResetForUserAttention___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  if (v2)
  {
    if (!objc_msgSend(v2, "isValid"))
      goto LABEL_7;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "elapsedTime");
    if (v3 <= 1.0)
      goto LABEL_7;
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  }
  if (objc_msgSend(v2, "isValid"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "invalidate");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 64);
    *(_QWORD *)(v4 + 64) = 0;

  }
LABEL_7:
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "isValid"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "invalidate");
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 72);
    *(_QWORD *)(v6 + 72) = 0;

  }
}

- (void)clientDidResetForUserAttention:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  SBAttentionAwarenessClient *v9;

  v9 = (SBAttentionAwarenessClient *)a3;
  v6 = a4;
  if (self->_enabled && self->_idleTouchAwarenessClient == v9)
  {
    -[SBAttentionAwarenessClient configuration](v9, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBScreenLongevityController _clientDidResetForUserAttention:](self, "_clientDidResetForUserAttention:", v8);

  }
}

- (void)streamerClientDidResetForUserAttention:(id)a3
{
  SBAttentionAwarenessStreamerClient *v4;
  void *v5;
  void *v6;
  SBAttentionAwarenessStreamerClient *v7;

  v4 = (SBAttentionAwarenessStreamerClient *)a3;
  if (self->_enabled && self->_faceStreamAwarenessClient == v4)
  {
    v7 = v4;
    -[SBAttentionAwarenessStreamerClient configuration](v4, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBScreenLongevityController _clientDidResetForUserAttention:](self, "_clientDidResetForUserAttention:", v6);

    -[SBScreenLongevityController _startDimTimer](self, "_startDimTimer");
    v4 = v7;
  }

}

- (void)dimTimerDidExpireForTimer:(id)a3
{
  _QWORD block[5];

  if (!-[SBScreenLongevityController _isDimmed](self, "_isDimmed", a3))
    -[SBScreenLongevityController _dim](self, "_dim");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__SBScreenLongevityController_dimTimerDidExpireForTimer___block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __57__SBScreenLongevityController_dimTimerDidExpireForTimer___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id buf[2];

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "isValid"))
  {
    SBLogScreenLongevityController();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "Dim timer remains valid after expire", (uint8_t *)buf, 2u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "invalidate");
  }
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 64);
  *(_QWORD *)(v3 + 64) = 0;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "isValid"))
  {
    SBLogScreenLongevityController();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __57__SBScreenLongevityController_dimTimerDidExpireForTimer___block_invoke_cold_1();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "invalidate");
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 72);
    *(_QWORD *)(v6 + 72) = 0;

  }
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72))
  {
    SBLogScreenLongevityController();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Start undim timer", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, *(id *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "invalidate");
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 72);
    *(_QWORD *)(v9 + 72) = 0;

    v11 = (void *)MEMORY[0x1E0C99E88];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "undimFaceDetectionInterval");
    v13 = v12;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __57__SBScreenLongevityController_dimTimerDidExpireForTimer___block_invoke_41;
    v17[3] = &unk_1E8E9FA90;
    objc_copyWeak(&v18, buf);
    objc_msgSend(v11, "scheduledTimerWithTimeInterval:repeats:block:", 1, v17, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(void **)(v15 + 72);
    *(_QWORD *)(v15 + 72) = v14;

    objc_destroyWeak(&v18);
    objc_destroyWeak(buf);
  }
}

void __57__SBScreenLongevityController_dimTimerDidExpireForTimer___block_invoke_41(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  LODWORD(v2) = objc_msgSend(WeakRetained, "_isValidCurrentTimer:", v3);

  if ((_DWORD)v2)
    objc_msgSend(WeakRetained, "_checkFaceAttentionAwareness");

}

- (BOOL)_isValidCurrentTimer:(id)a3
{
  if (self->_undimTimer == a3)
    return objc_msgSend(a3, "isValid");
  else
    return 0;
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  NSObject *v5;
  uint8_t v6[16];

  SBLogScreenLongevityController();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Management configuration profile settings updated", v6, 2u);
  }

  -[SBScreenLongevityController evaluateEnablement](self, "evaluateEnablement");
}

- (void)setAdaptiveDimmingEnabled:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  SBScreenLongevitySettings *settings;
  double v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", a3);
  v5 = objc_alloc(MEMORY[0x1E0CB37E8]);
  settings = self->_settings;
  if (v3)
    -[SBScreenLongevitySettings dimmingAnimationLength](settings, "dimmingAnimationLength");
  else
    -[SBScreenLongevitySettings undimmingAnimationLength](settings, "undimmingAnimationLength");
  *(float *)&v7 = v7;
  v8 = (void *)objc_msgSend(v5, "initWithFloat:", v7);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v10, CFSTR("AmbientAdaptiveDimmingEnable"), v8, CFSTR("AmbientAdaptiveDimmingPeriod"), 0);
  -[BrightnessSystemClient setProperty:forKey:](self->_brightnessSystemClient, "setProperty:forKey:", v9, CFSTR("AmbientAdaptiveDimming"));

}

- (BOOL)isAdaptiveDimmingEnabled
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  v2 = (void *)-[BrightnessSystemClient copyPropertyForKey:](self->_brightnessSystemClient, "copyPropertyForKey:", CFSTR("AmbientAdaptiveDimming"));
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("AmbientAdaptiveDimmingEnable"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isUnderAutoDimThreshold
{
  void *v2;
  char v3;

  v2 = (void *)-[BrightnessSystemClient copyPropertyForKey:](self->_brightnessSystemClient, "copyPropertyForKey:", CFSTR("CBBrightnessIsUnderAutoDimThreshold"));
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brightnessSystemClient, 0);
  objc_storeStrong((id *)&self->_undimTimer, 0);
  objc_storeStrong((id *)&self->_dimTimer, 0);
  objc_storeStrong((id *)&self->_idleTouchAwarenessClient, 0);
  objc_storeStrong((id *)&self->_idleTouchAwarenessConfiguration, 0);
  objc_storeStrong((id *)&self->_faceStreamAwarenessClient, 0);
  objc_storeStrong((id *)&self->_faceStreamAwarenessConfiguration, 0);
  objc_storeStrong((id *)&self->_defaultsObserver, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

void __42__SBScreenLongevityController_setEnabled___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_1D0540000, v0, v1, "In dimmed state without a valid undim timer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __42__SBScreenLongevityController_setEnabled___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_1D0540000, v0, v1, "In undimmed state with a valid undim timer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __42__SBScreenLongevityController_setEnabled___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_1D0540000, v0, v1, "In undimmed state without a valid dim timer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __42__SBScreenLongevityController_setEnabled___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_1D0540000, v0, v1, "Enable, old dim timer still valid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __57__SBScreenLongevityController_dimTimerDidExpireForTimer___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_1D0540000, v0, v1, "Dim timer expire with a valid undim timer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
