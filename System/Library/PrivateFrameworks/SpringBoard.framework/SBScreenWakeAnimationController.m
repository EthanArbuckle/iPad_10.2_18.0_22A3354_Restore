@implementation SBScreenWakeAnimationController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_27 != -1)
    dispatch_once(&sharedInstance_onceToken_27, &__block_literal_global_189);
  return (id)sharedInstance___sharedInstance_14;
}

uint64_t __49__SBScreenWakeAnimationController_sharedInstance__block_invoke()
{
  SBScreenWakeAnimationController *v0;
  void *v1;

  kdebug_trace();
  v0 = objc_alloc_init(SBScreenWakeAnimationController);
  v1 = (void *)sharedInstance___sharedInstance_14;
  sharedInstance___sharedInstance_14 = (uint64_t)v0;

  return kdebug_trace();
}

+ (double)backlightFadeDurationForSource:(int64_t)a3 isWake:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0DA9F60], "rootSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_animationSpeedForBacklightChangeSource:isWake:", a3, v4);
  v8 = v7;
  objc_msgSend(v6, "backlightFadeDuration");
  v10 = v9 / v8;

  return v10;
}

+ (double)_animationSpeedForBacklightChangeSource:(int64_t)a3 isWake:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0DA9F60], "rootSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a3 == 47)
  {
    objc_msgSend(v6, "speedMultiplierForMagicKeyboardExtended");
  }
  else
  {
    v8 = 1.0;
    if (a3 != 20)
      goto LABEL_6;
    objc_msgSend(v6, "speedMultiplierForLiftToWake");
  }
  v8 = v9;
LABEL_6:
  if (v4)
  {
    objc_msgSend(v7, "speedMultiplierForWake");
    v8 = v8 * v10;
  }

  return v8;
}

- (SBScreenWakeAnimationController)init
{
  SBScreenWakeAnimationController *v2;
  NSMutableSet *v3;
  NSMutableSet *temporaryDisabledReasons;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBScreenWakeAnimationController;
  v2 = -[SBScreenWakeAnimationController init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    temporaryDisabledReasons = v2->_temporaryDisabledReasons;
    v2->_temporaryDisabledReasons = v3;

    +[SBWindowSceneStatusBarManager windowSceneStatusBarManagerForEmbeddedDisplay](SBWindowSceneStatusBarManager, "windowSceneStatusBarManagerForEmbeddedDisplay");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v2->_statusBarManager, v5);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SBScreenWakeAnimationController;
  -[SBScreenWakeAnimationController dealloc](&v4, sel_dealloc);
}

- (BOOL)isWakeAnimationInProgress
{
  return self->_preparingToAnimateWake || self->_animatingForWake;
}

- (BOOL)isWakeAnimationInProgressForSource:(int64_t)a3
{
  _BOOL4 v5;

  v5 = -[SBScreenWakeAnimationController isWakeAnimationInProgress](self, "isWakeAnimationInProgress");
  if (v5)
    LOBYTE(v5) = self->_lastBacklightChangeSource == a3;
  return v5;
}

- (BOOL)isSleepAnimationInProgress
{
  return self->_animatingForSleep;
}

- (id)_animationSettingsForBacklightChangeSource:(int64_t)a3 isWake:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0DA9F60], "rootSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_animationSpeedForBacklightChangeSource:isWake:", a3, v4);
  v8 = v7;
  objc_msgSend(v6, "contentWakeSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSpeed:", v8);

  objc_msgSend(v6, "awakeWallpaperFilterSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSpeed:", v8);

  objc_msgSend(v6, "sleepWallpaperFilterSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSpeed:", v8);

  return v6;
}

- (BOOL)interruptSleepAnimationIfNeeded
{
  _BOOL4 v3;

  v3 = -[SBScreenWakeAnimationController isSleepAnimationInProgress](self, "isSleepAnimationInProgress");
  if (v3)
    -[SBScreenWakeAnimationController _cleanupAnimationWhenInterruptingWaking:](self, "_cleanupAnimationWhenInterruptingWaking:", 0);
  return v3;
}

- (void)_setInteractionEventsIgnored:(BOOL)a3
{
  if (self->_ignoringInteractionEvents != a3)
  {
    self->_ignoringInteractionEvents = a3;
    if (a3)
      objc_msgSend((id)SBApp, "beginIgnoringInteractionEventsForReason:", CFSTR("lift-to-wake"));
    else
      objc_msgSend((id)SBApp, "endIgnoringInteractionEventsForReason:", CFSTR("lift-to-wake"));
  }
}

- (void)prepareToWakeForSource:(int64_t)a3 timeAlpha:(double)a4 statusBarAlpha:(double)a5 target:(id)a6 dateView:(id)a7 completion:(id)a8
{
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  BOOL v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id wakeCompletionBlock;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  id WeakRetained;
  void *v30;
  SBWindowSceneStatusBarSettingsAssertion *v31;
  SBWindowSceneStatusBarSettingsAssertion *statusBarAssertion;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t);
  void *v40;
  id v41;
  _QWORD v42[5];
  id v43;
  SEL v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  double v48;
  __int16 v49;
  double v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v15 = a6;
  v16 = a8;
  SBLogScreenWake();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    SBSBacklightChangeSourceDescription(a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v46 = v18;
    v47 = 2048;
    v48 = a4;
    v49 = 2048;
    v50 = a5;
    _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "prepareToWakeForSource: %{public}@ timeAlpha: %.2f statusBarAlpha: %.2f", buf, 0x20u);

  }
  objc_storeStrong((id *)&self->_target, a6);
  self->_preparingToAnimateWake = 1;
  v19 = -[SBScreenWakeAnimationController interruptSleepAnimationIfNeeded](self, "interruptSleepAnimationIfNeeded");
  -[SBScreenWakeAnimationController _runCompletionHandlerForWake:reason:](self, "_runCompletionHandlerForWake:reason:", 1, CFSTR("prepareToWake cleanup previous handler"));
  v20 = MEMORY[0x1E0C809B0];
  v21 = (void *)MEMORY[0x1E0D016E8];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __110__SBScreenWakeAnimationController_prepareToWakeForSource_timeAlpha_statusBarAlpha_target_dateView_completion___block_invoke;
  v42[3] = &unk_1E8EB1940;
  v42[4] = self;
  v22 = v16;
  v43 = v22;
  v44 = a2;
  objc_msgSend(v21, "sentinelWithQueue:signalHandler:", MEMORY[0x1E0C80D38], v42);
  v37 = v20;
  v38 = 3221225472;
  v39 = __110__SBScreenWakeAnimationController_prepareToWakeForSource_timeAlpha_statusBarAlpha_target_dateView_completion___block_invoke_2;
  v40 = &unk_1E8E9DED8;
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v41 = v23;
  v24 = (void *)objc_msgSend(&v37, "copy");
  wakeCompletionBlock = self->_wakeCompletionBlock;
  self->_wakeCompletionBlock = v24;

  -[SBScreenWakeAnimationController _setLastBacklightChangeSource:](self, "_setLastBacklightChangeSource:", a3, v37, v38, v39, v40);
  self->_finalTimeAlpha = a4;
  self->_finalStatusBarAlpha = a5;
  if (!v19)
  {
    -[SBScreenWakeAnimationController _setRelevantLockScreenViewsHidden:](self, "_setRelevantLockScreenViewsHidden:", 1);
    SBLogStatusBarish();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      -[SBScreenWakeAnimationController prepareToWakeForSource:timeAlpha:statusBarAlpha:target:dateView:completion:].cold.1(v26, v27, v28);

    WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarManager);
    objc_msgSend(WeakRetained, "assertionManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = (SBWindowSceneStatusBarSettingsAssertion *)objc_msgSend(v30, "newSettingsAssertionWithStatusBarHidden:atLevel:reason:", 1, 8, CFSTR("screenFadeAnimationController"));
    statusBarAssertion = self->_statusBarAssertion;
    self->_statusBarAssertion = v31;

    -[SBWindowSceneStatusBarSettingsAssertion acquire](self->_statusBarAssertion, "acquire");
  }
  +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (!v19)
    -[SBScreenWakeAnimationController _updateWakeEffectsForWake:animated:completion:](self, "_updateWakeEffectsForWake:animated:completion:", objc_msgSend(v33, "backlightState") == 3, 0, 0);
  *(_WORD *)&self->_animatingForWake = 0;
  -[SBScreenWakeAnimationController _setInteractionEventsIgnored:](self, "_setInteractionEventsIgnored:", a3 == 20);
  if ((objc_msgSend(v34, "screenIsOn") & 1) != 0)
  {
    -[SBScreenWakeAnimationController _startWakeIfNecessary](self, "_startWakeIfNecessary");
  }
  else
  {
    SBLogScreenWake();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v35, OS_LOG_TYPE_DEFAULT, "now waiting for screen unblank", buf, 2u);
    }

    self->_waitingForScreenUnblank = 1;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addObserver:selector:name:object:", self, sel__startWakeFromUnblankNotification, CFSTR("SBBacklightPreFadeBacklightActivationCompleteNotification"), 0);

  }
}

void __110__SBScreenWakeAnimationController_prepareToWakeForSource_timeAlpha_statusBarAlpha_target_dateView_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_setInteractionEventsIgnored:", 0);
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(void))(v3 + 16))();
  +[SBPlatformController sharedInstance](SBPlatformController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isInternalInstall");

  if (v5 && objc_msgSend(v7, "isFailed"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("SBScreenWakeAnimationController.m"), 188, CFSTR("Wake animation completion block failed to fire organically"));

  }
}

uint64_t __110__SBScreenWakeAnimationController_prepareToWakeForSource_timeAlpha_statusBarAlpha_target_dateView_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v5[16];

  SBLogScreenWake();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, " inside _wakeCompletionBlock", v5, 2u);
  }

  objc_msgSend(MEMORY[0x1E0DA9FC8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wakeDidEnd");

  return objc_msgSend(*(id *)(a1 + 32), "signal");
}

- (void)_updateWakeEffectsForWake:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v8;
  int v9;
  SBFScreenWakeAnimationTarget *target;
  id v11;

  v5 = a4;
  v6 = a3;
  v11 = a5;
  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "posterHandlesWakeAnimation");

  target = self->_target;
  if (v9)
    -[SBFScreenWakeAnimationTarget removeAllWakeEffects](target, "removeAllWakeEffects");
  else
    -[SBFScreenWakeAnimationTarget updateWakeEffectsForWake:animated:completion:](target, "updateWakeEffectsForWake:animated:completion:", v6, v5, v11);

}

- (void)_startWakeFromUnblankNotification
{
  NSObject *v3;
  uint8_t v4[16];

  SBLogScreenWake();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "_startWakeFromUnblankNotification", v4, 2u);
  }

  -[SBScreenWakeAnimationController _startWakeIfNecessary](self, "_startWakeIfNecessary");
}

- (void)_startWakeIfNecessary
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  if (self->_waitingForScreenUnblank)
  {
    SBLogScreenWake();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "no longer waiting for screen unblank", v6, 2u);
    }

    self->_waitingForScreenUnblank = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("SBBacklightPreFadeBacklightActivationCompleteNotification"), 0);

  }
  if (self->_preparingToAnimateWake)
  {
    *(_WORD *)&self->_preparingToAnimateWake = 256;
    -[SBScreenWakeAnimationController _animationSettingsForBacklightChangeSource:isWake:](self, "_animationSettingsForBacklightChangeSource:isWake:", self->_lastBacklightChangeSource, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBScreenWakeAnimationController _startWakeAnimationsForWaking:animationSettings:](self, "_startWakeAnimationsForWaking:animationSettings:", 1, v5);

  }
  else
  {
    -[SBScreenWakeAnimationController _runCompletionHandlerForWake:reason:](self, "_runCompletionHandlerForWake:reason:", 1, CFSTR("_startWakeIfNecessary not preparing to animate wake"));
  }
}

- (void)_cleanupAnimationWhenInterruptingWaking:(BOOL)a3
{
  -[SBScreenWakeAnimationController _cleanupAnimationWhenInterruptingWaking:force:](self, "_cleanupAnimationWhenInterruptingWaking:force:", a3, 0);
}

- (void)_cleanupAnimationWhenInterruptingWaking:(BOOL)a3 force:(BOOL)a4
{
  *(_WORD *)&self->_animatingWallpaper = 0;
  self->_animatingBacklight = 0;
  -[SBScreenWakeAnimationController _handleAnimationCompletionIfNecessaryForWaking:force:](self, "_handleAnimationCompletionIfNecessaryForWaking:force:", a3, a4);
}

- (void)_setLastBacklightChangeSource:(int64_t)a3
{
  if (self->_lastBacklightChangeSource != a3)
    self->_lastBacklightChangeSource = a3;
}

- (void)_startWakeAnimationsForWaking:(BOOL)a3 animationSettings:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int64_t lastBacklightChangeSource;
  id v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  int v23;
  char v24;
  _QWORD v25[5];
  int v26;
  char v27;
  _QWORD v28[5];
  _QWORD v29[4];
  id v30;
  SBScreenWakeAnimationController *v31;
  BOOL v32;
  uint8_t buf[4];
  _BOOL4 v34;
  uint64_t v35;

  v4 = a3;
  v35 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  SBLogScreenWake();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v34 = v4;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "_startWakeAnimationsForWaking: %{BOOL}d", buf, 8u);
  }

  v8 = self->_animationToken + 1;
  self->_animationToken = v8;
  +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v10 = 1;
  else
    v10 = 3;
  -[SBScreenWakeAnimationController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    v10 = objc_msgSend(v11, "targetBacklightStateForSource:isWake:", self->_lastBacklightChangeSource, v4);
  v13 = MEMORY[0x1E0C809B0];
  lastBacklightChangeSource = self->_lastBacklightChangeSource;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __83__SBScreenWakeAnimationController__startWakeAnimationsForWaking_animationSettings___block_invoke;
  v29[3] = &unk_1E8E9EE00;
  v32 = v4;
  v15 = v9;
  v30 = v15;
  v31 = self;
  objc_msgSend(v15, "setBacklightState:source:animated:completion:", v10, lastBacklightChangeSource, 1, v29);
  if (!v4)
  {
    if (objc_msgSend(v15, "backlightState") != 3)
    {
      v17 = 0;
      *(_WORD *)&self->_animatingContent = 256;
      goto LABEL_15;
    }
    self->_finalTimeAlpha = 1.0;
  }
  self->_animatingBacklight = 0;
  SBLogTelemetrySignposts();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0540000, v16, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_LOCKSCREEN_HANDLE_WAKE", " enableTelemetry=YES  isAnimation=YES ", buf, 2u);
  }

  kdebug_trace();
  v17 = 1;
  self->_animatingContent = 1;
  v18 = (void *)MEMORY[0x1E0D01908];
  objc_msgSend(v6, "contentWakeSettings");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "BSAnimationSettings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "factoryWithSettings:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __83__SBScreenWakeAnimationController__startWakeAnimationsForWaking_animationSettings___block_invoke_36;
  v28[3] = &unk_1E8E9DED8;
  v28[4] = self;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __83__SBScreenWakeAnimationController__startWakeAnimationsForWaking_animationSettings___block_invoke_2;
  v25[3] = &unk_1E8EB1968;
  v26 = v8;
  v25[4] = self;
  v27 = 1;
  objc_msgSend(MEMORY[0x1E0D01908], "animateWithFactory:options:actions:completion:", v21, 6, v28, v25);

LABEL_15:
  self->_animatingWallpaper = 1;
  v22[0] = v13;
  v22[1] = 3221225472;
  v22[2] = __83__SBScreenWakeAnimationController__startWakeAnimationsForWaking_animationSettings___block_invoke_43;
  v22[3] = &unk_1E8EB1968;
  v23 = v8;
  v22[4] = self;
  v24 = v17;
  -[SBScreenWakeAnimationController _updateWakeEffectsForWake:animated:completion:](self, "_updateWakeEffectsForWake:animated:completion:", v17, 1, v22);

}

uint64_t __83__SBScreenWakeAnimationController__startWakeAnimationsForWaking_animationSettings___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (!*(_BYTE *)(result + 48))
  {
    v1 = result;
    result = objc_msgSend(*(id *)(result + 32), "screenIsOn");
    if ((result & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(v1 + 40) + 82) = 0;
      return objc_msgSend(*(id *)(v1 + 40), "_cleanupAnimationWhenInterruptingWaking:force:", 0, 1);
    }
  }
  return result;
}

void __83__SBScreenWakeAnimationController__startWakeAnimationsForWaking_animationSettings___block_invoke_36(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  int v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;

  v1 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "_setRelevantLockScreenViewsHidden:", 0);
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLockScreenDisabledForAssertion");

  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)v1 + 104));
    objc_msgSend(WeakRetained, "statusBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    SBLogStatusBarish();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __83__SBScreenWakeAnimationController__startWakeAnimationsForWaking_animationSettings___block_invoke_36_cold_1(v5, v6);

    v7 = *(void **)(*(_QWORD *)v1 + 96);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __83__SBScreenWakeAnimationController__startWakeAnimationsForWaking_animationSettings___block_invoke_38;
    v14[3] = &unk_1E8E9EEA0;
    v15 = v5;
    v8 = v5;
    objc_msgSend(v7, "modifySettingsWithBlock:", v14);

  }
  else
  {
    SBLogStatusBarish();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __83__SBScreenWakeAnimationController__startWakeAnimationsForWaking_animationSettings___block_invoke_36_cold_2(v1, v9, v10);

    v11 = *(_QWORD *)v1;
    v12 = *(void **)(*(_QWORD *)v1 + 96);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __83__SBScreenWakeAnimationController__startWakeAnimationsForWaking_animationSettings___block_invoke_41;
    v13[3] = &unk_1E8E9EEA0;
    v13[4] = v11;
    objc_msgSend(v12, "modifySettingsWithBlock:", v13);
  }
}

void __83__SBScreenWakeAnimationController__startWakeAnimationsForWaking_animationSettings___block_invoke_38(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "alpha");
  objc_msgSend(v2, "numberWithDouble:");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", v5);

}

void __83__SBScreenWakeAnimationController__startWakeAnimationsForWaking_animationSettings___block_invoke_41(uint64_t a1, void *a2)
{
  void *v2;
  double v3;
  id v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = *(double *)(*(_QWORD *)(a1 + 32) + 32);
  v4 = a2;
  objc_msgSend(v2, "numberWithDouble:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", v5);

}

void __83__SBScreenWakeAnimationController__startWakeAnimationsForWaking_animationSettings___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint8_t v6[16];

  SBLogTelemetrySignposts();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0540000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_LOCKSCREEN_HANDLE_WAKE", " enableTelemetry=YES  isAnimation=YES ", v6, 2u);
  }

  kdebug_trace();
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(a1 + 40) == *(_DWORD *)(v3 + 56))
  {
    *(_BYTE *)(v3 + 81) = 0;
    objc_msgSend(*(id *)(a1 + 32), "_setInteractionEventsIgnored:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_handleAnimationCompletionIfNecessaryForWaking:", *(unsigned __int8 *)(a1 + 44));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "invalidate");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 96);
    *(_QWORD *)(v4 + 96) = 0;

  }
}

uint64_t __83__SBScreenWakeAnimationController__startWakeAnimationsForWaking_animationSettings___block_invoke_43(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (*(_DWORD *)(result + 40) == *(_DWORD *)(v1 + 56))
  {
    *(_BYTE *)(v1 + 80) = 0;
    return objc_msgSend(*(id *)(result + 32), "_handleAnimationCompletionIfNecessaryForWaking:", *(unsigned __int8 *)(result + 44));
  }
  return result;
}

- (void)setScreenWakeTemporarilyDisabled:(BOOL)a3 forReason:(id)a4
{
  NSMutableSet *temporaryDisabledReasons;

  temporaryDisabledReasons = self->_temporaryDisabledReasons;
  if (a3)
    -[NSMutableSet addObject:](temporaryDisabledReasons, "addObject:", a4);
  else
    -[NSMutableSet removeObject:](temporaryDisabledReasons, "removeObject:", a4);
}

- (void)sleepForSource:(int64_t)a3 target:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  NSMutableSet *temporaryDisabledReasons;
  int v13;
  NSMutableSet *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  objc_storeStrong((id *)&self->_target, a4);
  if (-[NSMutableSet count](self->_temporaryDisabledReasons, "count"))
  {
    SBLogBacklight();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      temporaryDisabledReasons = self->_temporaryDisabledReasons;
      v13 = 138543362;
      v14 = temporaryDisabledReasons;
      _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "Should not turn the screen off due to outstanding reasons: %{public}@", (uint8_t *)&v13, 0xCu);
    }

  }
  else
  {
    -[SBScreenWakeAnimationController sleepForSource:completion:](self, "sleepForSource:completion:", a3, v10);
  }

}

- (void)sleepForSource:(int64_t)a3 completion:(id)a4
{
  id v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id sleepCompletionBlock;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  _BOOL4 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = -[SBScreenWakeAnimationController isWakeAnimationInProgress](self, "isWakeAnimationInProgress");
  SBLogScreenWake();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    SBSBacklightChangeSourceDescription(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v9;
    v19 = 1024;
    v20 = v7;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "sleepForSource:%{public}@ reversingWake:%{BOOL}u", buf, 0x12u);

  }
  if (v7)
  {
    self->_waitingForScreenUnblank = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObserver:name:object:", self, CFSTR("SBBacklightPreFadeBacklightActivationCompleteNotification"), 0);

    -[SBScreenWakeAnimationController _cleanupAnimationWhenInterruptingWaking:](self, "_cleanupAnimationWhenInterruptingWaking:", 1);
  }
  -[SBScreenWakeAnimationController _runCompletionHandlerForWake:reason:](self, "_runCompletionHandlerForWake:reason:", 0, CFSTR("sleepForSource cleanup previous handler"));
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __61__SBScreenWakeAnimationController_sleepForSource_completion___block_invoke;
  v15[3] = &unk_1E8E9E8D0;
  v16 = v6;
  v11 = v6;
  v12 = (void *)objc_msgSend(v15, "copy");
  sleepCompletionBlock = self->_sleepCompletionBlock;
  self->_sleepCompletionBlock = v12;

  self->_finalTimeAlpha = 0.0;
  *(_WORD *)&self->_preparingToAnimateWake = 0;
  self->_animatingForSleep = 1;
  -[SBScreenWakeAnimationController _setLastBacklightChangeSource:](self, "_setLastBacklightChangeSource:", a3);
  -[SBScreenWakeAnimationController _animationSettingsForBacklightChangeSource:isWake:](self, "_animationSettingsForBacklightChangeSource:isWake:", self->_lastBacklightChangeSource, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBScreenWakeAnimationController _startWakeAnimationsForWaking:animationSettings:](self, "_startWakeAnimationsForWaking:animationSettings:", 0, v14);

}

uint64_t __61__SBScreenWakeAnimationController_sleepForSource_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint8_t v4[16];

  SBLogScreenWake();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, " inside _sleepCompletionBlock", v4, 2u);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_handleAnimationCompletionIfNecessaryForWaking:(BOOL)a3
{
  -[SBScreenWakeAnimationController _handleAnimationCompletionIfNecessaryForWaking:force:](self, "_handleAnimationCompletionIfNecessaryForWaking:force:", a3, 0);
}

- (void)_handleAnimationCompletionIfNecessaryForWaking:(BOOL)a3 force:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v6;
  _BOOL4 v7;
  NSObject *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  SBFScreenWakeAnimationTarget *target;
  int v14;
  _BOOL4 v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  _BOOL4 v19;
  uint64_t v20;

  v4 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  if (self->_animatingBacklight || self->_animatingWallpaper || self->_animatingContent)
    v6 = 0;
  else
    v6 = !self->_waitingForScreenUnblank || a4;
  v7 = !self->_preparingToAnimateWake
    && !self->_animatingForWake
    && !self->_animatingForSleep
    && !self->_waitingForScreenUnblank;
  *(_WORD *)&self->_animatingForWake = 0;
  if (v6)
  {
    SBLogScreenWake();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 67109376;
      v15 = v4;
      v16 = 1024;
      LODWORD(v17) = v7;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "_handleAnimationCompletionIfNecessaryForWaking:%{BOOL}u invoking callback (cleanupTarget:%{BOOL}u)", (uint8_t *)&v14, 0xEu);
    }

    -[SBScreenWakeAnimationController _runCompletionHandlerForWake:reason:](self, "_runCompletionHandlerForWake:reason:", v4, CFSTR("animation complete"));
    -[SBScreenWakeAnimationController _setRelevantLockScreenViewsHidden:](self, "_setRelevantLockScreenViewsHidden:", 0);
    if (!v7)
      return;
LABEL_25:
    target = self->_target;
    self->_target = 0;

    return;
  }
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = v9;
  if (self->_animatingBacklight)
    objc_msgSend(v9, "addObject:", CFSTR("animatingBacklight"));
  if (self->_animatingWallpaper)
    objc_msgSend(v10, "addObject:", CFSTR("animatingWallpaper"));
  if (self->_animatingContent)
    objc_msgSend(v10, "addObject:", CFSTR("animatingContent"));
  if (self->_waitingForScreenUnblank)
    objc_msgSend(v10, "addObject:", CFSTR("waitingForScreenUnblank"));
  SBLogScreenWake();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR(","));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 67109634;
    v15 = v4;
    v16 = 2114;
    v17 = v12;
    v18 = 1024;
    v19 = v7;
    _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "_handleAnimationCompletionIfNecessaryForWaking:%{BOOL}u skipping callback because:(%{public}@) (cleanupTarget:%{BOOL}u)", (uint8_t *)&v14, 0x18u);

  }
  if (v7)
    goto LABEL_25;
}

- (void)_runCompletionHandlerForWake:(BOOL)a3 reason:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  id wakeCompletionBlock;
  void **p_statusBarAssertion;
  SBWindowSceneStatusBarSettingsAssertion *statusBarAssertion;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  uint64_t v19;

  v4 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v4)
  {
    if (self->_wakeCompletionBlock)
    {
      if (self->_insideWakeCompletionBlock)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBScreenWakeAnimationController _runCompletionHandlerForWake:reason:]");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("SBScreenWakeAnimationController.m"), 465, CFSTR("really shouldn't invoke the wake block from inside the wake block"));

      }
      SBLogScreenWake();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138543362;
        v18 = v6;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, " invoking _wakeCompletionBlock reason:%{public}@", (uint8_t *)&v17, 0xCu);
      }

      self->_insideWakeCompletionBlock = 1;
      (*((void (**)(void))self->_wakeCompletionBlock + 2))();
      self->_insideWakeCompletionBlock = 0;
      wakeCompletionBlock = self->_wakeCompletionBlock;
      self->_wakeCompletionBlock = 0;

      statusBarAssertion = self->_statusBarAssertion;
      p_statusBarAssertion = (void **)&self->_statusBarAssertion;
      -[SBWindowSceneStatusBarSettingsAssertion invalidate](statusBarAssertion, "invalidate");
LABEL_14:
      v12 = *p_statusBarAssertion;
      *p_statusBarAssertion = 0;

    }
  }
  else if (self->_sleepCompletionBlock)
  {
    if (self->_insideSleepCompletionBlock)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBScreenWakeAnimationController _runCompletionHandlerForWake:reason:]");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("SBScreenWakeAnimationController.m"), 477, CFSTR("really shouldn't invoke the sleep block from inside the sleep block"));

    }
    SBLogScreenWake();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138543362;
      v18 = v6;
      _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, " invoking _sleepCompletionBlock reason:%{public}@", (uint8_t *)&v17, 0xCu);
    }

    self->_insideSleepCompletionBlock = 1;
    (*((void (**)(void))self->_sleepCompletionBlock + 2))();
    self->_insideSleepCompletionBlock = 0;
    p_statusBarAssertion = &self->_sleepCompletionBlock;
    goto LABEL_14;
  }

}

- (NSString)description
{
  return (NSString *)-[SBScreenWakeAnimationController descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", CFSTR("[ScreenWake]"));
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBScreenWakeAnimationController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBScreenWakeAnimationController descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBScreenWakeAnimationController *v11;

  -[SBScreenWakeAnimationController succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__SBScreenWakeAnimationController_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v5 = v4;
  v10 = v5;
  v11 = self;
  v6 = (id)objc_msgSend(v5, "modifyBody:", v9);
  v7 = v5;

  return v7;
}

id __73__SBScreenWakeAnimationController_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 48), CFSTR("isPreparingToAnimateWake"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 49), CFSTR("isAnimatingForWake"));
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 50), CFSTR("isAnimatingForSleep"));
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 51), CFSTR("insideWakeCompletionBlock"));
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 52), CFSTR("insideSleepCompletionBlock"));
  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInt:withName:", *(unsigned int *)(*(_QWORD *)(a1 + 40) + 56), CFSTR("animationToken"));
  v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 80), CFSTR("isAnimatingWallpaper"));
  v9 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 82), CFSTR("isAnimatingBacklight"));
  v10 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 81), CFSTR("isAnimatingContent"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), CFSTR("wakeEffectTarget"));
}

- (SBScreenWakeAnimationControllerDelegate)delegate
{
  return (SBScreenWakeAnimationControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_temporaryDisabledReasons, 0);
  objc_destroyWeak((id *)&self->_statusBarManager);
  objc_storeStrong((id *)&self->_statusBarAssertion, 0);
  objc_storeStrong(&self->_sleepCompletionBlock, 0);
  objc_storeStrong(&self->_wakeCompletionBlock, 0);
  objc_storeStrong((id *)&self->_target, 0);
}

- (void)prepareToWakeForSource:(uint64_t)a3 timeAlpha:statusBarAlpha:target:dateView:completion:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "-[SBScreenWakeAnimationController prepareToWakeForSource:timeAlpha:statusBarAlpha:target:dateView:completion:]";
  OUTLINED_FUNCTION_0_1(&dword_1D0540000, a1, a3, "%s: setting status bar alpha: 0", (uint8_t *)&v3);
}

void __83__SBScreenWakeAnimationController__startWakeAnimationsForWaking_animationSettings___block_invoke_36_cold_1(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "alpha");
  v5 = 134217984;
  v6 = v3;
  OUTLINED_FUNCTION_0_1(&dword_1D0540000, a2, v4, "[SBScreenWakeAnimationController] _startFadeAnimationsForFadeIn: setting status bar alpha: %f", (uint8_t *)&v5);
}

void __83__SBScreenWakeAnimationController__startWakeAnimationsForWaking_animationSettings___block_invoke_36_cold_2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 32);
  v4 = 134217984;
  v5 = v3;
  OUTLINED_FUNCTION_0_1(&dword_1D0540000, a2, a3, "[SBScreenWakeAnimationController] _startFadeAnimationsForFadeIn: setting status bar alpha: %f", (uint8_t *)&v4);
}

@end
