@implementation SBScreenSleepCoordinator

- (SBScreenSleepCoordinator)initWithScreenWakeAnimationController:(id)a3 lockScreenManager:(id)a4 backlightController:(id)a5 coverSheetPresentationManager:(id)a6 authenticationStatusProvider:(id)a7 authenticationAssertionProvider:(id)a8 alertItemsController:(id)a9 windowScene:(id)a10
{
  id v17;
  SBScreenSleepCoordinator *v18;
  SBScreenSleepCoordinator *v19;
  uint64_t v20;
  SBAlwaysOnSettings *alwaysOnSettings;
  SBScreenSleepCoordinatorBacklightEnvironment *v22;
  BLSHBacklightSceneHostEnvironment *backlightSceneHostEnvironment;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  objc_super v32;

  v31 = a3;
  v30 = a4;
  v29 = a5;
  v28 = a6;
  v27 = a7;
  v26 = a8;
  v25 = a9;
  v17 = a10;
  v32.receiver = self;
  v32.super_class = (Class)SBScreenSleepCoordinator;
  v18 = -[SBScreenSleepCoordinator init](&v32, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_screenWakeAnimationController, a3);
    objc_storeStrong((id *)&v19->_lockScreenManager, a4);
    objc_storeStrong((id *)&v19->_backlightController, a5);
    objc_storeStrong((id *)&v19->_coverSheetPresentationManager, a6);
    objc_storeStrong((id *)&v19->_authenticationStatusProvider, a7);
    objc_storeStrong((id *)&v19->_authenticationAssertionProvider, a8);
    objc_storeStrong((id *)&v19->_alertItemsController, a9);
    objc_storeStrong((id *)&v19->_windowScene, a10);
    -[SBScreenWakeAnimationController setDelegate:](v19->_screenWakeAnimationController, "setDelegate:", v19);
    +[SBAlwaysOnDomain rootSettings](SBAlwaysOnDomain, "rootSettings");
    v20 = objc_claimAutoreleasedReturnValue();
    alwaysOnSettings = v19->_alwaysOnSettings;
    v19->_alwaysOnSettings = (SBAlwaysOnSettings *)v20;

    v22 = -[SBScreenSleepCoordinatorBacklightEnvironment initWithCoordinator:]([SBScreenSleepCoordinatorBacklightEnvironment alloc], "initWithCoordinator:", v19);
    backlightSceneHostEnvironment = v19->_backlightSceneHostEnvironment;
    v19->_backlightSceneHostEnvironment = (BLSHBacklightSceneHostEnvironment *)v22;

  }
  return v19;
}

- (void)sleepAndLockUIFromSource:(int)a3 completion:(id)a4
{
  -[SBScreenSleepCoordinator sleepAndLockUIFromSource:lockOptions:completion:](self, "sleepAndLockUIFromSource:lockOptions:completion:", *(_QWORD *)&a3, 0, a4);
}

- (void)sleepAndLockUIFromSource:(int)a3 lockOptions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  NSDictionary *v19;
  NSDictionary *lastLockOptions;
  SBScreenWakeAnimationController *screenWakeAnimationController;
  void *v22;
  void *v23;
  id *v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = -[SBScreenSleepCoordinator _shouldPresentAmbientOnSleepAndLock](self, "_shouldPresentAmbientOnSleepAndLock");
  v11 = MEMORY[0x1E0C809B0];
  if (v10)
  {
    -[SBScreenSleepCoordinator _ambientPresentationController](self, "_ambientPresentationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v11;
    v27[1] = 3221225472;
    v27[2] = __76__SBScreenSleepCoordinator_sleepAndLockUIFromSource_lockOptions_completion___block_invoke;
    v27[3] = &unk_1E8E9F1C0;
    v24 = &v28;
    v28 = v9;
    v13 = objc_msgSend(v12, "presentIfAllowedAndLockWithCompletion:", v27);

    if (v13)
    {
      SBLogBacklight();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromLockSource();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v30 = v15;
        _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "ScreenSleepCoordinator: presented ambient for source %@", buf, 0xCu);

      }
LABEL_9:

      goto LABEL_10;
    }
  }
  v16 = SBUIConvertLockSourceToBacklightChangeSource();
  SBLogBacklight();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromLockSource();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v30 = v18;
    _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "ScreenSleepCoordinator: beginning sleep for source %@", buf, 0xCu);

  }
  self->_didLock = 0;
  self->_lastLockSource = a3;
  v19 = (NSDictionary *)objc_msgSend(v8, "copy");
  lastLockOptions = self->_lastLockOptions;
  self->_lastLockOptions = v19;

  screenWakeAnimationController = self->_screenWakeAnimationController;
  -[SBLockScreenManager lockScreenEnvironment](self->_lockScreenManager, "lockScreenEnvironment");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "screenWakeAnimationTarget");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v11;
  v25[1] = 3221225472;
  v25[2] = __76__SBScreenSleepCoordinator_sleepAndLockUIFromSource_lockOptions_completion___block_invoke_3;
  v25[3] = &unk_1E8EA02D8;
  v25[4] = self;
  v26 = v9;
  -[SBScreenWakeAnimationController sleepForSource:target:completion:](screenWakeAnimationController, "sleepForSource:target:completion:", v16, v23, v25);

  if (v10)
    goto LABEL_9;
LABEL_10:

}

uint64_t __76__SBScreenSleepCoordinator_sleepAndLockUIFromSource_lockOptions_completion___block_invoke(uint64_t result, int a2)
{
  if (a2)
  {
    result = *(_QWORD *)(result + 32);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __76__SBScreenSleepCoordinator_sleepAndLockUIFromSource_lockOptions_completion___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  int v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t result;
  _DWORD v8[2];
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  SBLogBacklight();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8[0]) = 0;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "ScreenSleepCoordinator: sleep completed", (uint8_t *)v8, 2u);
  }

  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "screenIsOn");
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "isWakeAnimationInProgress");
  SBLogBacklight();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if ((v3 & 1) != 0 || (v4 & 1) != 0)
  {
    if (v6)
    {
      v8[0] = 67109376;
      v8[1] = v3;
      v9 = 1024;
      v10 = v4;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "ScreenSleepCoordinator: skipping UI lock (screen on = %{BOOL}u wakeInProgress = %{BOOL}u)", (uint8_t *)v8, 0xEu);
    }

  }
  else
  {
    if (v6)
    {
      LOWORD(v8[0]) = 0;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "ScreenSleepCoordinator: beginning UI lock", (uint8_t *)v8, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_performLock");
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (int64_t)targetBacklightStateForSource:(int64_t)a3 isWake:(BOOL)a4
{
  int64_t v6;

  if (a4)
    return 1;
  if (a3 == 39)
    return 4;
  if (a3 != 3)
    return 3;
  v6 = -[SBAlwaysOnSettings sideButtonBehavior](self->_alwaysOnSettings, "sideButtonBehavior");
  if (v6 == 1)
  {
    if (-[SBBacklightController backlightState](self->_backlightController, "backlightState") == 3)
      return 4;
    else
      return 3;
  }
  else if (v6)
  {
    return 4;
  }
  else
  {
    return 3;
  }
}

- (void)_performLock
{
  -[SBScreenSleepCoordinator _performLockAnimated:](self, "_performLockAnimated:", 0);
}

- (void)_performLockAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  NSDictionary *lastLockOptions;
  id v8;

  if (!self->_didLock)
  {
    v3 = a3;
    v8 = (id)-[NSDictionary mutableCopy](self->_lastLockOptions, "mutableCopy");
    objc_msgSend(v8, "objectForKey:", CFSTR("SBUILockOptionsAnimateLockScreenActivationKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("SBUILockOptionsAnimateLockScreenActivationKey"));

    }
    -[SBLockScreenManager lockUIFromSource:withOptions:](self->_lockScreenManager, "lockUIFromSource:withOptions:", self->_lastLockSource, v8);
    -[SBLockScreenManager setPasscodeVisible:animated:](self->_lockScreenManager, "setPasscodeVisible:animated:", 0, 1);
    self->_didLock = 1;
    lastLockOptions = self->_lastLockOptions;
    self->_lastLockOptions = 0;

  }
}

- (void)_setTransitionWindowVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  SBScreenSleepTransitionWindow *v9;
  void *v10;
  SBScreenSleepTransitionWindow *v11;
  void *v12;
  SBScreenSleepTransitionWindow *transitionWindow;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[5];
  id v20;
  BOOL v21;
  _QWORD v22[5];
  BOOL v23;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  if (v6 && !self->_transitionWindow)
  {
    v9 = [SBScreenSleepTransitionWindow alloc];
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[_UIRootWindow initWithScreen:](v9, "initWithScreen:", v10);

    -[SBScreenSleepTransitionWindow setWindowLevel:](v11, "setWindowLevel:", *MEMORY[0x1E0CEB660] + 801.0);
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBScreenSleepTransitionWindow setBackgroundColor:](v11, "setBackgroundColor:", v12);

    -[SBScreenSleepTransitionWindow setAlpha:](v11, "setAlpha:", 0.0);
    -[_UIRootWindow setHidden:](v11, "setHidden:", 0);
    transitionWindow = self->_transitionWindow;
    self->_transitionWindow = v11;

  }
  v14 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __76__SBScreenSleepCoordinator__setTransitionWindowVisible_animated_completion___block_invoke;
  v22[3] = &unk_1E8E9F508;
  v23 = v6;
  v22[4] = self;
  v15 = MEMORY[0x1D17E5550](v22);
  v16 = (void *)v15;
  if (v5)
  {
    v17 = (void *)MEMORY[0x1E0CEABB0];
    if (v6)
      v18 = 65540;
    else
      v18 = 131076;
    v19[0] = v14;
    v19[1] = 3221225472;
    v19[2] = __76__SBScreenSleepCoordinator__setTransitionWindowVisible_animated_completion___block_invoke_2;
    v19[3] = &unk_1E8EA6868;
    v21 = v6;
    v19[4] = self;
    v20 = v8;
    objc_msgSend(v17, "animateWithDuration:delay:options:animations:completion:", v18, v16, v19, 0.185, 0.0);

  }
  else
  {
    (*(void (**)(uint64_t))(v15 + 16))(v15);
    if (v8)
      (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
  }

}

uint64_t __76__SBScreenSleepCoordinator__setTransitionWindowVisible_animated_completion___block_invoke(uint64_t a1)
{
  double v1;

  v1 = 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 0.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setAlpha:", v1);
}

uint64_t __76__SBScreenSleepCoordinator__setTransitionWindowVisible_animated_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t result;

  if (!*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setHidden:", 1);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 104);
    *(_QWORD *)(v4 + 104) = 0;

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (id)_ambientPresentationController
{
  return -[SBWindowScene ambientPresentationController](self->_windowScene, "ambientPresentationController");
}

- (BOOL)_shouldPresentAmbientOnSleepAndLock
{
  void *v3;
  void *v4;
  int v5;

  -[SBScreenSleepCoordinator _ambientPresentationController](self, "_ambientPresentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isPresentationRequested"))
  {
    -[SBScreenSleepCoordinator _ambientPresentationController](self, "_ambientPresentationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isPresented") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)transitionToVisualState:(id)a3 fromVisualState:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  id v9;
  id v10;
  void (**v11)(_QWORD);
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL4 v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  char v28;
  id v29;
  void (**v30)(_QWORD);
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  uint64_t v37;
  _BOOL4 v38;
  char v39;
  _QWORD v40[4];
  id v41;
  void (**v42)(_QWORD);
  id v43;
  _QWORD v44[5];
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;
  SBScreenSleepCoordinator *v51;
  id v52;
  void (**v53)(_QWORD);
  id v54[2];
  char v55;
  uint8_t buf[4];
  id v57;
  __int16 v58;
  id v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(_QWORD))a6;
  v12 = (void *)(self->_transitionGeneration + 1);
  self->_transitionGeneration = (unint64_t)v12;
  SBLogBacklight();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v57 = v10;
    v58 = 2112;
    v59 = v9;
    v60 = 2048;
    v61 = v12;
    _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "ScreenSleepCoordinator: request to transition from %@ to %@ (generation %lu)", buf, 0x20u);
  }

  v14 = objc_msgSend(v9, "adjustedLuminance");
  v15 = objc_msgSend(v9, "activeAppearance");
  v16 = objc_msgSend(v9, "activeAppearance") == 1 && objc_msgSend(v9, "adjustedLuminance") == 2;
  v17 = (objc_class *)objc_opt_class();
  NSStringFromClass(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[SBScreenSleepCoordinator _setTransitionWindowVisible:animated:completion:](self, "_setTransitionWindowVisible:animated:completion:", 0, 1, 0);
    -[SBAlertItemsController setForceAlertsToPend:forReason:](self->_alertItemsController, "setForceAlertsToPend:forReason:", 0, v18);
  }
  if (!v14)
  {
    if (!v11)
      goto LABEL_24;
    goto LABEL_11;
  }
  if (v16)
  {
    if (v11)
LABEL_11:
      v11[2](v11);
  }
  else if (!v15)
  {
    v38 = -[SBLockScreenManager hasWakeToContentForInactiveDisplay](self->_lockScreenManager, "hasWakeToContentForInactiveDisplay");
    v37 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "activeInterfaceOrientation");
    v39 = -[SBFAuthenticationStatusProvider hasPasscodeSet](self->_authenticationStatusProvider, "hasPasscodeSet");
    -[SBFAuthenticationAssertionProviding createSecureDisplayDeferralAssertionWithReason:](self->_authenticationAssertionProvider, "createSecureDisplayDeferralAssertionWithReason:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBLockScreenManager noteBacklightWillTransitionToInactive](self->_lockScreenManager, "noteBacklightWillTransitionToInactive");
    -[SBAlertItemsController setForceAlertsToPend:forReason:](self->_alertItemsController, "setForceAlertsToPend:forReason:", 1, v18);
    -[SBLockScreenManager lockScreenEnvironment](self->_lockScreenManager, "lockScreenEnvironment");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "lockController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "prepareForUILock");

    objc_initWeak((id *)buf, self);
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __88__SBScreenSleepCoordinator_transitionToVisualState_fromVisualState_animated_completion___block_invoke;
    v49[3] = &unk_1E8EBC5B0;
    v34 = v19;
    v50 = v34;
    objc_copyWeak(v54, (id *)buf);
    v51 = self;
    v54[1] = v12;
    v55 = v39;
    v22 = v18;
    v52 = v22;
    v53 = v11;
    v23 = (void *)MEMORY[0x1D17E5550](v49);
    v24 = (void *)MEMORY[0x1E0D016E8];
    v25 = MEMORY[0x1E0C80D38];
    v26 = MEMORY[0x1E0C80D38];
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __88__SBScreenSleepCoordinator_transitionToVisualState_fromVisualState_animated_completion___block_invoke_13;
    v47[3] = &unk_1E8EBC5D8;
    v36 = v23;
    v48 = v36;
    objc_msgSend(v24, "sentinelWithQueue:signalHandler:", v25, v47);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)(v37 - 3) < 2)
      v28 = 1;
    else
      v28 = v38 & v39;

    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __88__SBScreenSleepCoordinator_transitionToVisualState_fromVisualState_animated_completion___block_invoke_15;
    v45[3] = &unk_1E8E9DED8;
    v29 = v27;
    v46 = v29;
    v30 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v45);
    if ((v28 & 1) != 0)
    {
      if (-[SBLockScreenManager isUILocked](self->_lockScreenManager, "isUILocked", v34) && v38)
      {
        -[SBCoverSheetPresentationManager acquirePreserveSecureAppAssertionForReason:](self->_coverSheetPresentationManager, "acquirePreserveSecureAppAssertionForReason:", CFSTR("Inactive transition"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v30[2](v30);
        objc_msgSend(v31, "invalidate");

      }
      else
      {
        -[SBLockScreenManager acquireLockScreenPresentationPendingAssertionWithReason:](self->_lockScreenManager, "acquireLockScreenPresentationPendingAssertionWithReason:", v22);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __88__SBScreenSleepCoordinator_transitionToVisualState_fromVisualState_animated_completion___block_invoke_3;
        v40[3] = &unk_1E8EBC600;
        objc_copyWeak(&v43, (id *)buf);
        v42 = v30;
        v33 = v32;
        v41 = v33;
        -[SBScreenSleepCoordinator _setTransitionWindowVisible:animated:completion:](self, "_setTransitionWindowVisible:animated:completion:", 1, 1, v40);

        objc_destroyWeak(&v43);
      }
    }
    else
    {
      -[SBCoverSheetPresentationManager setCoverSheetPresented:animated:withCompletion:](self->_coverSheetPresentationManager, "setCoverSheetPresented:animated:withCompletion:", 1, 1, v30, v34);
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __88__SBScreenSleepCoordinator_transitionToVisualState_fromVisualState_animated_completion___block_invoke_2_16;
      v44[3] = &unk_1E8E9DED8;
      v44[4] = self;
      objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v44);
    }

    objc_destroyWeak(v54);
    objc_destroyWeak((id *)buf);

  }
LABEL_24:

}

void __88__SBScreenSleepCoordinator_transitionToVisualState_fromVisualState_animated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id *WeakRetained;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CD28B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __88__SBScreenSleepCoordinator_transitionToVisualState_fromVisualState_animated_completion___block_invoke_2;
  v13[3] = &unk_1E8E9DED8;
  v14 = *(id *)(a1 + 32);
  objc_msgSend(v2, "bs_performAfterSynchronizedCommit:", v13);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88);
    v5 = *(_QWORD *)(a1 + 72);
    SBLogBacklight();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v4 == v5)
    {
      if (v7)
      {
        v8 = *(_QWORD *)(a1 + 72);
        *(_DWORD *)buf = 134217984;
        v16 = v8;
        _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "ScreenSleepCoordinator: Performing lock UI for inactive transition generation %lu", buf, 0xCu);
      }

      objc_msgSend(WeakRetained, "_performLockAnimated:", 0);
      if (!*(_BYTE *)(a1 + 80))
        goto LABEL_10;
      v9 = WeakRetained[2];
      v19[0] = CFSTR("SBUIUnlockOptionsOnlyWakeToActionsKey");
      v19[1] = CFSTR("SBUIUnlockOptionsNoBacklightChangesKey");
      v20[0] = MEMORY[0x1E0C9AAB0];
      v20[1] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
      v6 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "unlockUIFromSource:withOptions:", 32, v6);
    }
    else if (v7)
    {
      v10 = *(_QWORD *)(a1 + 72);
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88);
      *(_DWORD *)buf = 134218240;
      v16 = v10;
      v17 = 2048;
      v18 = v11;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "ScreenSleepCoordinator: Skipping lock UI for inactive transition generation %lu as we are now on generation %lu", buf, 0x16u);
    }

LABEL_10:
    objc_msgSend(WeakRetained[7], "setForceAlertsToPend:forReason:", 0, *(_QWORD *)(a1 + 48));
  }
  v12 = *(_QWORD *)(a1 + 56);
  if (v12)
    (*(void (**)(void))(v12 + 16))();

}

uint64_t __88__SBScreenSleepCoordinator_transitionToVisualState_fromVisualState_animated_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

uint64_t __88__SBScreenSleepCoordinator_transitionToVisualState_fromVisualState_animated_completion___block_invoke_13(uint64_t a1, void *a2)
{
  NSObject *v3;

  if (objc_msgSend(a2, "isFailed"))
  {
    SBLogBacklight();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __88__SBScreenSleepCoordinator_transitionToVisualState_fromVisualState_animated_completion___block_invoke_13_cold_1(v3);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __88__SBScreenSleepCoordinator_transitionToVisualState_fromVisualState_animated_completion___block_invoke_15(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "signal");
}

void __88__SBScreenSleepCoordinator_transitionToVisualState_fromVisualState_animated_completion___block_invoke_2_16(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "lockScreenEnvironment");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backlightController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setInScreenOffMode:preservingCoverSheetPresentationState:", 1, 1);

}

void __88__SBScreenSleepCoordinator_transitionToVisualState_fromVisualState_animated_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  dispatch_time_t v3;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  v3 = dispatch_time(0, 300000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__SBScreenSleepCoordinator_transitionToVisualState_fromVisualState_animated_completion___block_invoke_4;
  block[3] = &unk_1E8E9DED8;
  block[4] = WeakRetained;
  dispatch_after(v3, MEMORY[0x1E0C80D38], block);

}

uint64_t __88__SBScreenSleepCoordinator_transitionToVisualState_fromVisualState_animated_completion___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setTransitionWindowVisible:animated:completion:", 0, 1, 0);
}

- (BLSHBacklightSceneHostEnvironment)backlightSceneHostEnvironment
{
  return self->_backlightSceneHostEnvironment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backlightSceneHostEnvironment, 0);
  objc_storeStrong((id *)&self->_transitionWindow, 0);
  objc_storeStrong((id *)&self->_alwaysOnSettings, 0);
  objc_storeStrong((id *)&self->_lastLockOptions, 0);
  objc_storeStrong((id *)&self->_windowScene, 0);
  objc_storeStrong((id *)&self->_alertItemsController, 0);
  objc_storeStrong((id *)&self->_authenticationAssertionProvider, 0);
  objc_storeStrong((id *)&self->_authenticationStatusProvider, 0);
  objc_storeStrong((id *)&self->_coverSheetPresentationManager, 0);
  objc_storeStrong((id *)&self->_backlightController, 0);
  objc_storeStrong((id *)&self->_lockScreenManager, 0);
  objc_storeStrong((id *)&self->_screenWakeAnimationController, 0);
}

void __88__SBScreenSleepCoordinator_transitionToVisualState_fromVisualState_animated_completion___block_invoke_13_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D0540000, log, OS_LOG_TYPE_FAULT, "screen sleep coordinator lock-and-wake-to block dropped", v1, 2u);
}

@end
