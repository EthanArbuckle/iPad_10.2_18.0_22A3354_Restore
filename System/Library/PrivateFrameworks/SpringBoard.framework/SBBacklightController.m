@implementation SBBacklightController

+ (id)_sharedInstanceCreateIfNeeded:(BOOL)a3
{
  if (a3 && _sharedInstanceCreateIfNeeded__onceToken_0 != -1)
    dispatch_once(&_sharedInstanceCreateIfNeeded__onceToken_0, &__block_literal_global_386);
  return (id)_sharedInstanceCreateIfNeeded__controller;
}

+ (SBBacklightController)sharedInstance
{
  return (SBBacklightController *)objc_msgSend(a1, "_sharedInstanceCreateIfNeeded:", 1);
}

- (BOOL)screenIsOn
{
  void *v2;
  uint64_t v3;

  -[SBBacklightControllerContextProviding blsBacklight](self->_contextProvider, "blsBacklight");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "backlightState");

  return (v3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (BOOL)screenIsDim
{
  void *v2;
  BOOL v3;

  -[SBBacklightControllerContextProviding blsBacklight](self->_contextProvider, "blsBacklight");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "backlightState") != 2;

  return v3;
}

uint64_t __55__SBBacklightController__sharedInstanceCreateIfNeeded___block_invoke()
{
  SBBacklightController *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  kdebug_trace();
  v0 = [SBBacklightController alloc];
  v1 = (void *)objc_opt_new();
  v2 = -[SBBacklightController initWithContextProvider:](v0, "initWithContextProvider:", v1);
  v3 = (void *)_sharedInstanceCreateIfNeeded__controller;
  _sharedInstanceCreateIfNeeded__controller = v2;

  return kdebug_trace();
}

+ (id)sharedInstanceIfExists
{
  return (id)objc_msgSend(a1, "_sharedInstanceCreateIfNeeded:", 0);
}

- (SBBacklightController)initWithContextProvider:(id)a3
{
  id v5;
  SBBacklightController *v6;
  SBBacklightController *v7;
  uint64_t v8;
  NSHashTable *informers;
  void *v10;
  SBDisplayLinkController *v11;
  void *v12;
  uint64_t v13;
  SBDisplayLinkController *mainDisplayLinkController;
  BrightnessSystemClient *v15;
  BrightnessSystemClient *brightnessSystemClient;
  void *v17;
  void *v18;
  uint64_t v19;
  SBAlwaysOnDefaults *alwaysOnDefaults;
  objc_super v22;

  v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SBBacklightController;
  v6 = -[SBBacklightController init](&v22, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contextProvider, a3);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    informers = v7->_informers;
    v7->_informers = (NSHashTable *)v8;

    -[SBBacklightControllerContextProviding blsBacklight](v7->_contextProvider, "blsBacklight");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:", v7);
    v11 = [SBDisplayLinkController alloc];
    objc_msgSend(MEMORY[0x1E0CD2728], "mainDisplay");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[SBDisplayLinkController initWithCADisplay:backlight:](v11, "initWithCADisplay:backlight:", v12, v10);
    mainDisplayLinkController = v7->_mainDisplayLinkController;
    v7->_mainDisplayLinkController = (SBDisplayLinkController *)v13;

    v7->_lastReportedWillTransitionState = 0;
    v15 = (BrightnessSystemClient *)objc_alloc_init(MEMORY[0x1E0D15710]);
    brightnessSystemClient = v7->_brightnessSystemClient;
    v7->_brightnessSystemClient = v15;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v7, sel__userInterfaceStyleChanged, *MEMORY[0x1E0CEBDD0], 0);

    -[SBBacklightController _userInterfaceStyleChanged](v7, "_userInterfaceStyleChanged");
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "alwaysOnDefaults");
    v19 = objc_claimAutoreleasedReturnValue();
    alwaysOnDefaults = v7->_alwaysOnDefaults;
    v7->_alwaysOnDefaults = (SBAlwaysOnDefaults *)v19;

  }
  return v7;
}

- (void)completeStartup
{
  void *v3;
  id v4;

  -[SBBacklightControllerContextProviding HIDUISensorModeController](self->_contextProvider, "HIDUISensorModeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addStartupHIDLockAssertion");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[SBBacklightController setCurrentHIDUISensorModeAssertion:](self, "setCurrentHIDUISensorModeAssertion:", v4);
  -[SBBacklightController _updateHIDUISensorModeForBacklightState:source:](self, "_updateHIDUISensorModeForBacklightState:source:", -[SBBacklightController backlightState](self, "backlightState"), 15);

}

- (void)_undimFromSource:(int64_t)a3
{
  BOOL v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  BOOL v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = -[SBBacklightController screenIsOn](self, "screenIsOn");
  v6 = v5;
  v7 = 0;
  if (a3 != 13 && !v5)
  {
    _SBLazyMutableSetAddString(0, CFSTR("only prox can use _undimFromSource when the screen is off"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (-[SBBacklightController isPendingScreenUnblankAfterCACommit](self, "isPendingScreenUnblankAfterCACommit"))
  {
    _SBLazyMutableSetAddString(v7, CFSTR("we're pending a screen unblank"));
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  -[SBBacklightControllerContextProviding proximitySensorManager](self->_contextProvider, "proximitySensorManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isObjectInProximity");

  v11 = a3 == 8 && v6;
  if (!v11 && v10)
  {
    _SBLazyMutableSetAddString(v7, CFSTR("an object is in proximity"));
    v12 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v12;
  }
  if (!-[SBBacklightController screenIsOn](self, "screenIsOn"))
  {
    -[SBBacklightControllerContextProviding lockScreenManager](self->_contextProvider, "lockScreenManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isWaitingToLockUI");

    if (v14)
    {
      _SBLazyMutableSetAddString(v7, CFSTR("we're in the middle of locking the UI"));
      v15 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v15;
    }
  }
  -[SBBacklightControllerContextProviding screenWakeAnimationController](self->_contextProvider, "screenWakeAnimationController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isSleepAnimationInProgress");

  if (v17)
  {
    _SBLazyMutableSetAddString(v7, CFSTR("we're in the middle of sleep animation"));
    v18 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v18;
  }
  v19 = objc_msgSend(v7, "count");
  SBLogBacklight();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (v19)
  {
    if (v21)
    {
      SBSBacklightChangeSourceDescription(a3);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", v7);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v22;
      v33 = 2114;
      v34 = v23;
      _os_log_impl(&dword_1D0540000, v20, OS_LOG_TYPE_DEFAULT, "_undimFromSource:(%{public}@): ignoring request because %{public}@", buf, 0x16u);

    }
  }
  else
  {
    if (v21)
    {
      SBSBacklightChangeSourceDescription(a3);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v24;
      _os_log_impl(&dword_1D0540000, v20, OS_LOG_TYPE_DEFAULT, "_undimFromSource:(%{public}@): setting backlight factor to 1.0", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = *MEMORY[0x1E0DAC2E0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3, *MEMORY[0x1E0DAC2E8]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v27;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "postNotificationName:object:", v26, v28);

    -[SBBacklightController setBacklightState:source:](self, "setBacklightState:source:", 1, a3);
  }

}

- (void)_performDeferredBacklightRampWorkWithInfo:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("SBBacklightPreFadeBacklightActivationCompleteNotification"), 0);

  objc_msgSend(v3, "objectForKey:", CFSTR("sendWillTurnOnNotification"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x1E0DAC310];
    v11 = *MEMORY[0x1E0DAC2E8];
    objc_msgSend(v3, "objectForKey:", CFSTR("backlightChangeSource"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:userInfo:", v8, 0, v10);

  }
}

- (void)turnOnScreenFullyWithBacklightSource:(int64_t)a3
{
  void *v5;
  _BOOL4 v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  -[SBBacklightControllerContextProviding lockScreenManager](self->_contextProvider, "lockScreenManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isUILocked") & 1) == 0 && !objc_msgSend(v5, "isLockScreenActive"))
  {
LABEL_8:
    -[SBBacklightController setBacklightState:source:](self, "setBacklightState:source:", 1, a3);
    goto LABEL_9;
  }
  v6 = -[SBBacklightController screenIsOn](self, "screenIsOn");
  -[SBBacklightControllerContextProviding screenWakeAnimationController](self->_contextProvider, "screenWakeAnimationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isWakeAnimationInProgress");

  if (!v8)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *MEMORY[0x1E0DAC310];
      v17 = *MEMORY[0x1E0DAC2E8];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "postNotificationName:object:userInfo:", v14, 0, v16);

    }
    goto LABEL_8;
  }
  if (!-[SBBacklightController screenIsOn](self, "screenIsOn"))
  {
    -[SBBacklightControllerContextProviding wakeLogger](self->_contextProvider, "wakeLogger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "wakeDidBegin:", SBWakeLoggerSourceFromBacklightChangeSource());

    -[SBBacklightController setBacklightState:source:animated:completion:](self, "setBacklightState:source:animated:completion:", 1, a3, 1, 0);
    v19[0] = CFSTR("sendWillTurnOnNotification");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", !v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = CFSTR("backlightChangeSource");
    v20[0] = v10;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBBacklightController _performDeferredBacklightRampWorkWithInfo:](self, "_performDeferredBacklightRampWorkWithInfo:", v12);

  }
LABEL_9:

}

- (BOOL)shouldTurnOnScreenForBacklightSource:(int64_t)a3
{
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  BOOL v11;
  NSObject *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)a3 <= 0x2F && ((1 << a3) & 0x80E7E01122FCLL) != 0
    || !+[SBSpuriousScreenUndimmingAssertion isAnyActive](SBSpuriousScreenUndimmingAssertion, "isAnyActive"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = self->_informers;
    v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if ((objc_msgSend(v10, "shouldTurnOnScreenForBacklightSource:", a3, (_QWORD)v14) & 1) == 0)
          {
            SBLogBacklight();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v19 = v10;
              _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "Should not turn the screen on due to informer: %{public}@", buf, 0xCu);
            }

            goto LABEL_15;
          }
        }
        v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
        if (v7)
          continue;
        break;
      }
    }
    v11 = 1;
  }
  else
  {
    SBLogBacklight();
    v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, &v5->super, OS_LOG_TYPE_DEFAULT, "Should not turn the screen on due to outstanding spurious screen undimming assertions", buf, 2u);
    }
LABEL_15:
    v11 = 0;
  }

  return v11;
}

- (void)_updateHIDUISensorModeForBacklightState:(int64_t)a3 source:(int64_t)a4
{
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  BSInvalidatable *v12;
  BSInvalidatable *v13;
  BSInvalidatable *currentDisplayStateAssertion;
  BSInvalidatable *currentHIDUISensorModeAssertion;
  BSInvalidatable *v16;
  BSInvalidatable *v17;
  uint64_t v18;
  _BOOL8 v19;
  void *v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  BSInvalidatable *v25;
  BSInvalidatable *v26;
  void *v27;
  uint64_t v28;
  int64_t v29;
  const __CFString *v30;
  BSInvalidatable *v31;
  BSInvalidatable *v32;
  BSInvalidatable *v33;
  BSInvalidatable *v34;
  void *v35;
  int v36;
  const __CFString *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  SBLogBacklight();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(a3 - 1) > 3)
      v9 = CFSTR("unknown");
    else
      v9 = off_1E8EC0348[a3 - 1];
    v36 = 138543362;
    v37 = v9;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "_updateHIDUISensorModeForBacklightState: %{public}@", (uint8_t *)&v36, 0xCu);
  }

  -[SBBacklightControllerContextProviding HIDUISensorModeController](self->_contextProvider, "HIDUISensorModeController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sensorModeTransactionForBacklightChangeSource:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = self->_currentHIDUISensorModeAssertion;
  v13 = self->_currentDisplayStateAssertion;
  currentDisplayStateAssertion = self->_currentDisplayStateAssertion;
  self->_currentDisplayStateAssertion = 0;

  if ((unint64_t)(a3 - 1) <= 1)
  {
    currentHIDUISensorModeAssertion = self->_currentHIDUISensorModeAssertion;
    self->_currentHIDUISensorModeAssertion = 0;

    objc_msgSend(v10, "assertDisplayState:source:reason:", 2, a4, CFSTR("backlight-on"));
    v16 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    v17 = self->_currentDisplayStateAssertion;
    self->_currentDisplayStateAssertion = v16;

    v18 = 0;
    v19 = 0;
LABEL_27:
    -[SBBacklightController _noteDigitizerDisabled:tapToWakeEnabled:disabledDigitizerMode:](self, "_noteDigitizerDisabled:tapToWakeEnabled:disabledDigitizerMode:", self->_currentHIDUISensorModeAssertion != 0, v19, v18);
    -[BSInvalidatable invalidate](v13, "invalidate");
    -[BSInvalidatable invalidate](v12, "invalidate");
    objc_msgSend(v11, "invalidate");

    return;
  }
  -[SBBacklightControllerContextProviding idleTimerDefaults](self->_contextProvider, "idleTimerDefaults");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "supportTapToWake");

  if (a4 == 13)
    v22 = 0;
  else
    v22 = v21;
  if (a3 == 3)
  {
    v23 = -[SBAlwaysOnDefaults enableTapToInteract](self->_alwaysOnDefaults, "enableTapToInteract");
    v24 = 2;
    if (v23)
      v24 = 3;
    if (v22)
      v18 = v24;
    else
      v18 = 4;
    objc_msgSend(v10, "suspendProximityDetection:disableDigitizer:source:reason:", a4 != 13, v18, a4, CFSTR("backlight-inactive"));
    v25 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    v26 = self->_currentHIDUISensorModeAssertion;
    self->_currentHIDUISensorModeAssertion = v25;

    v27 = v10;
    v28 = 3;
    v29 = a4;
    v30 = CFSTR("backlight-inactive");
    goto LABEL_25;
  }
  if (a3 == 4)
  {
    if (v22)
      v18 = 1;
    else
      v18 = 4;
    objc_msgSend(v10, "suspendProximityDetection:disableDigitizer:source:reason:", a4 != 13, v18, a4, CFSTR("backlight-off"));
    v31 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    v32 = self->_currentHIDUISensorModeAssertion;
    self->_currentHIDUISensorModeAssertion = v31;

    v27 = v10;
    v28 = 1;
    v29 = a4;
    v30 = CFSTR("backlight-off");
LABEL_25:
    objc_msgSend(v27, "assertDisplayState:source:reason:", v28, v29, v30);
    v33 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    v34 = self->_currentDisplayStateAssertion;
    self->_currentDisplayStateAssertion = v33;

    goto LABEL_26;
  }
  if (a3)
  {
    v18 = 0;
LABEL_26:
    v19 = (unint64_t)(v18 - 1) < 3;
    goto LABEL_27;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("this should be unreachable"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SBBacklightController _updateHIDUISensorModeForBacklightState:source:].cold.1(a2, (uint64_t)self, (uint64_t)v35);
  objc_msgSend(objc_retainAutorelease(v35), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (int64_t)backlightState
{
  void *v2;
  unint64_t v3;
  int64_t v4;

  -[SBBacklightControllerContextProviding blsBacklight](self->_contextProvider, "blsBacklight");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "backlightState");
  if (v3 > 3)
    v4 = 0;
  else
    v4 = qword_1D0E8BE08[v3];

  return v4;
}

- (void)setBacklightState:(int64_t)a3 source:(int64_t)a4
{
  -[SBBacklightController setBacklightState:source:animated:completion:](self, "setBacklightState:source:animated:completion:", a3, a4, 0, 0);
}

- (void)setBacklightState:(int64_t)a3 source:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v6;
  void (**v11)(_QWORD);
  int64_t v12;
  int64_t v13;
  int v14;
  int v15;
  float v16;
  float v17;
  void *v18;
  void *v19;
  NSObject *v20;
  const __CFString *v21;
  void *v22;
  double v23;
  int64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  double v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  BLSAssertion *v45;
  BLSAssertion *disableAODAssertion;
  void *v47;
  void *v48;
  void (**v49)(_QWORD);
  _QWORD v50[5];
  void (**v51)(_QWORD);
  int64_t v52;
  int64_t v53;
  float v54;
  _QWORD v55[3];
  _QWORD v56[3];
  void *v57;
  uint8_t buf[4];
  const __CFString *v59;
  __int16 v60;
  _BOOL4 v61;
  __int16 v62;
  int64_t v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v6 = a5;
  v66 = *MEMORY[0x1E0C80C00];
  v11 = (void (**)(_QWORD))a6;
  self->_lastBacklightChangeSource = a4;
  v12 = -[SBBacklightController backlightState](self, "backlightState");
  if (v12 == a3)
  {
    if ((unint64_t)(a3 - 1) <= 1)
      -[SBBacklightController _updateHIDUISensorModeForBacklightState:source:](self, "_updateHIDUISensorModeForBacklightState:source:", a3, a4);
    if (v11)
      v11[2](v11);
  }
  else
  {
    v13 = v12;
    -[SBBacklightController _factorToPublishForBacklightState:](self, "_factorToPublishForBacklightState:", v12);
    v15 = v14;
    -[SBBacklightController _factorToPublishForBacklightState:](self, "_factorToPublishForBacklightState:", a3);
    v17 = v16;
    self->_backlightState = a3;
    objc_msgSend(MEMORY[0x1E0D22910], "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    SBSDisplayLayoutBacklightTransitionReasonForBacklightChangeSource();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "transitionAssertionWithReason:", v19);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    v48 = v18;
    objc_msgSend(v18, "setBacklightLevel:", (uint64_t)(float)(v17 * 100.0));
    SBLogBacklight();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)(a3 - 1) > 3)
        v21 = CFSTR("unknown");
      else
        v21 = off_1E8EC0348[a3 - 1];
      SBSBacklightChangeSourceDescription(a4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v59 = v21;
      v60 = 1024;
      v61 = v6;
      v62 = 2048;
      v63 = a4;
      v64 = 2114;
      v65 = v22;
      _os_log_impl(&dword_1D0540000, v20, OS_LOG_TYPE_DEFAULT, "Animating backlight to state %{public}@ animated:%{BOOL}u source:%ld (%{public}@)", buf, 0x26u);

    }
    *(float *)&v23 = v17;
    -[SBBacklightController _notifyObserversWillAnimateToFactor:source:](self, "_notifyObserversWillAnimateToFactor:source:", a4, v23);
    -[SBBacklightController _notifyObserversWillTransitionToBacklightState:source:](self, "_notifyObserversWillTransitionToBacklightState:source:", a3, a4);
    v24 = 0;
    switch(a3)
    {
      case 0:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBBacklightController.m"), 464, CFSTR("State transitions to SBBacklightStateUnknown are not allowed"));

        v24 = 1;
        goto LABEL_14;
      case 1:
      case 2:
        v24 = a3;
        goto LABEL_14;
      case 4:
        v40 = (void *)MEMORY[0x1E0CB3940];
        SBSBacklightChangeSourceDescription(a4);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "stringWithFormat:", CFSTR("Disable AOT for backlight state Off from source %@"), v41);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v42 = (void *)MEMORY[0x1E0D00F48];
        objc_msgSend(MEMORY[0x1E0D00F90], "disableAlwaysOn");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v43;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "acquireWithExplanation:observer:attributes:", v26, 0, v44);
        v45 = (BLSAssertion *)objc_claimAutoreleasedReturnValue();

        -[BLSAssertion invalidate](self->_disableAODAssertion, "invalidate");
        disableAODAssertion = self->_disableAODAssertion;
        self->_disableAODAssertion = v45;

        v24 = 0;
        goto LABEL_15;
      default:
LABEL_14:
        -[BLSAssertion invalidate](self->_disableAODAssertion, "invalidate");
        v26 = self->_disableAODAssertion;
        self->_disableAODAssertion = 0;
LABEL_15:

        v27 = objc_alloc(MEMORY[0x1E0D00F60]);
        SBSBacklightChangeSourceDescription(a4);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = mach_continuous_time();
        v30 = (void *)objc_msgSend(v27, "initWithRequestedActivityState:explanation:timestamp:sourceEvent:sourceEventMetadata:", v24, v28, v29, BLSBacklightChangeSourceEventForSBSBacklightChangeSource(a4), 0);

        v50[1] = 3221225472;
        v50[2] = __70__SBBacklightController_setBacklightState_source_animated_completion___block_invoke;
        v50[3] = &unk_1E8EC0328;
        v50[4] = self;
        v52 = a4;
        v53 = v13;
        v54 = v17;
        v49 = v11;
        v50[0] = MEMORY[0x1E0C809B0];
        v51 = v11;
        -[SBBacklightController _performBacklightChangeRequest:completion:](self, "_performBacklightChangeRequest:completion:", v30, v50);
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = *MEMORY[0x1E0DAC2F8];
        v55[0] = *MEMORY[0x1E0DAC2E8];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v56[0] = v33;
        v55[1] = *MEMORY[0x1E0DAC308];
        LODWORD(v34) = v15;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v56[1] = v35;
        v55[2] = *MEMORY[0x1E0DAC300];
        *(float *)&v36 = v17;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v56[2] = v37;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 3);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "postNotificationName:object:userInfo:", v32, 0, v38);

        if (a4 != 13)
        {
          if ((unint64_t)(a3 - 1) >= 2)
          {
            BKSDisplayBrightnessRestoreSystemBrightness();
            LODWORD(v39) = 1.0;
            -[SBBacklightController preventIdleSleepForNumberOfSeconds:](self, "preventIdleSleepForNumberOfSeconds:", v39);
          }
          else
          {
            -[SBBacklightController preventIdleSleep](self, "preventIdleSleep");
          }
        }
        objc_msgSend(v47, "invalidate");

        v11 = v49;
        break;
    }
  }

}

uint64_t __70__SBBacklightController_setBacklightState_source_animated_completion___block_invoke(uint64_t a1, uint64_t a2, double a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a2 - 1) >= 2)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "screenIsOn") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *MEMORY[0x1E0DAC2F0];
      v11 = *MEMORY[0x1E0DAC2E8];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "postNotificationName:object:userInfo:", v6, 0, v8);

      objc_msgSend(MEMORY[0x1E0CEABB0], "_beginSuspendingMotionEffectsForReason:", CFSTR("SBSuspendMotionEffectsBecauseDisplayIsOff"));
    }
  }
  else if ((unint64_t)(*(_QWORD *)(a1 + 56) - 1) >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CEABB0], "_recenterMotionEffects");
    objc_msgSend(MEMORY[0x1E0CEABB0], "_endSuspendingMotionEffectsForReason:", CFSTR("SBSuspendMotionEffectsBecauseDisplayIsOff"));
  }
  LODWORD(a3) = *(_DWORD *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversDidAnimateToFactor:source:", *(_QWORD *)(a1 + 48), a3);
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(void))(v9 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserversDidTransitionToBacklightState:source:", a2, *(_QWORD *)(a1 + 48));
}

- (void)_performBacklightChangeRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void (**v9)(_QWORD, _QWORD);
  id backlightCompletion;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint8_t v15[16];

  v6 = a3;
  v7 = a4;
  if (self->_backlightCompletion)
  {
    SBLogBacklight();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Calling backlight change completion due to new request", v15, 2u);
    }

    v9 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](self->_backlightCompletion);
    backlightCompletion = self->_backlightCompletion;
    self->_backlightCompletion = 0;

    v9[2](v9, self->_backlightState);
  }
  v11 = (void *)objc_msgSend(v7, "copy");
  v12 = self->_backlightCompletion;
  self->_backlightCompletion = v11;

  -[SBBacklightControllerContextProviding blsBacklight](self->_contextProvider, "blsBacklight");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v13, "performChangeRequest:", v6);

}

- (void)_startFadeOutAnimationFromLockSource:(int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  -[SBBacklightControllerContextProviding screenSleepCoordinator](self->_contextProvider, "screenSleepCoordinator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sleepAndLockUIFromSource:completion:", v3, 0);

}

- (void)addObserver:(id)a3
{
  NSHashTable *observers;
  NSHashTable *v5;
  NSHashTable *v6;
  id v7;

  v7 = a3;
  if (!-[NSHashTable containsObject:](self->_observers, "containsObject:"))
  {
    observers = self->_observers;
    if (!observers)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
      v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v6 = self->_observers;
      self->_observers = v5;

      observers = self->_observers;
    }
    -[NSHashTable addObject:](observers, "addObject:", v7);
  }

}

- (void)removeObserver:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NSHashTable containsObject:](self->_observers, "containsObject:"))
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v4);

}

- (float)_factorToPublishForBacklightState:(int64_t)a3
{
  float result;

  result = -1.0;
  if ((unint64_t)(a3 - 1) <= 3)
    return flt_1D0E8BE30[a3 - 1];
  return result;
}

- (void)_notifyObserversWillAnimateToFactor:(float)a3 source:(int64_t)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          *(float *)&v13 = a3;
          objc_msgSend(v12, "backlightController:willAnimateBacklightToFactor:source:", self, a4, v13);
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

- (void)_notifyObserversDidAnimateToFactor:(float)a3 source:(int64_t)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          *(float *)&v13 = a3;
          objc_msgSend(v12, "backlightController:didAnimateBacklightToFactor:source:", self, a4, v13);
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

- (void)_notifyObserversWillTransitionToBacklightState:(int64_t)a3 source:(int64_t)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  self->_lastReportedWillTransitionState = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "backlightController:willTransitionToBacklightState:source:", self, a3, a4);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)_notifyObserversDidTransitionToBacklightState:(int64_t)a3 source:(int64_t)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_lastReportedWillTransitionState != a3)
    -[SBBacklightController _notifyObserversWillTransitionToBacklightState:source:](self, "_notifyObserversWillTransitionToBacklightState:source:", a3, a4);
  self->_lastReportedWillTransitionState = 0;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "backlightController:didTransitionToBacklightState:source:", self, a3, a4);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)_noteDigitizerDisabled:(BOOL)a3 tapToWakeEnabled:(BOOL)a4 disabledDigitizerMode:(int64_t)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v5 = a4;
  v6 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  self->_digitizerDisabled = a3;
  self->_tapToWakeEnabled = a4;
  self->_tapToWakeRequiresHitTestSuppression = a5 == 2;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "backlightController:didUpdateDigitizerDisabled:tapToWakeEnabled:", self, v6, v5);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)registerInformer:(id)a3
{
  -[NSHashTable addObject:](self->_informers, "addObject:", a3);
}

- (void)unregisterInformer:(id)a3
{
  -[NSHashTable removeObject:](self->_informers, "removeObject:", a3);
}

- (void)allowIdleSleep
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_allowIdleSleep, 0);
  SBWorkspaceSetPreventIdleSleepForReason(0, CFSTR("backlight"));
}

- (void)preventIdleSleep
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_allowIdleSleep, 0);
  SBWorkspaceSetPreventIdleSleepForReason(1, CFSTR("backlight"));
}

- (void)preventIdleSleepForNumberOfSeconds:(float)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[SBBacklightControllerContextProviding blsBacklight](self->_contextProvider, "blsBacklight");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "backlightState");

  if (v6 <= 1)
  {
    -[SBBacklightController preventIdleSleep](self, "preventIdleSleep");
    v8[0] = *MEMORY[0x1E0C99860];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBBacklightController performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel_allowIdleSleep, 0, v7, a3);

  }
}

- (double)defaultLockScreenDimInterval
{
  return 6.0;
}

- (double)defaultLockScreenDimIntervalWhenNotificationsPresent
{
  return 10.0;
}

- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvent:(id)a5
{
  NSObject *v7;
  void *v8;
  _BOOL4 v9;
  NSObject *v10;
  void (**v11)(_QWORD, _QWORD);
  id backlightCompletion;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  _BOOL4 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  SBLogBacklight();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromBLSBacklightState();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = self->_backlightCompletion != 0;
    v15 = 138412546;
    v16 = v8;
    v17 = 1024;
    v18 = v9;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Backlight did complete update to state %@ with pending completion: %{BOOL}u", (uint8_t *)&v15, 0x12u);

  }
  if (self->_backlightCompletion)
  {
    SBLogBacklight();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "Calling backlight change completion due to state update", (uint8_t *)&v15, 2u);
    }

    v11 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](self->_backlightCompletion);
    backlightCompletion = self->_backlightCompletion;
    self->_backlightCompletion = 0;

    v13 = 0;
    if ((unint64_t)a4 <= 3)
      v13 = qword_1D0E8BE08[a4];
    v11[2](v11, v13);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "postNotificationName:object:", CFSTR("SBBlankScreenStateChangeNotification"), 0);

}

- (void)backlightHost:(id)a3 willTransitionToState:(int64_t)a4 forEvent:(id)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int64_t lastBacklightChangeSource;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  SBLogBacklight();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromBLSBacklightState();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412290;
    v16 = v9;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "backlight host will transition to state %@", (uint8_t *)&v15, 0xCu);

  }
  if ((unint64_t)a4 > 3)
    v10 = 0;
  else
    v10 = qword_1D0E8BE08[a4];
  v11 = BLSBacklightChangeSourceEventForSBSBacklightChangeSource(self->_lastBacklightChangeSource);
  objc_msgSend(v7, "changeRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "sourceEvent");
  if (v11 == v13)
    lastBacklightChangeSource = self->_lastBacklightChangeSource;
  else
    lastBacklightChangeSource = 0;
  -[SBBacklightController _updateHIDUISensorModeForBacklightState:source:](self, "_updateHIDUISensorModeForBacklightState:source:", v10, lastBacklightChangeSource);
}

- (void)_userInterfaceStyleChanged
{
  void *v3;
  uint64_t v4;
  BrightnessSystemClient *brightnessSystemClient;
  id v6;

  objc_msgSend(MEMORY[0x1E0CEABA0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentStyle");

  brightnessSystemClient = self->_brightnessSystemClient;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[BrightnessSystemClient setProperty:forKey:](brightnessSystemClient, "setProperty:forKey:", v6, CFSTR("CBUIUserStyle"));

}

- (BOOL)isPendingScreenUnblankAfterCACommit
{
  return self->_isPendingScreenUnblankAfterCACommit;
}

- (BOOL)isDigitizerDisabled
{
  return self->_digitizerDisabled;
}

- (BOOL)isTapToWakeEnabled
{
  return self->_tapToWakeEnabled;
}

- (SBDisplayLinkController)mainDisplayLinkController
{
  return self->_mainDisplayLinkController;
}

- (int64_t)lastBacklightChangeSource
{
  return self->_lastBacklightChangeSource;
}

- (BOOL)tapToWakeRequiresHitTestSuppression
{
  return self->_tapToWakeRequiresHitTestSuppression;
}

- (BSInvalidatable)currentHIDUISensorModeAssertion
{
  return self->_currentHIDUISensorModeAssertion;
}

- (void)setCurrentHIDUISensorModeAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_currentHIDUISensorModeAssertion, a3);
}

- (BSInvalidatable)currentDisplayStateAssertion
{
  return self->_currentDisplayStateAssertion;
}

- (void)setCurrentDisplayStateAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_currentDisplayStateAssertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDisplayStateAssertion, 0);
  objc_storeStrong((id *)&self->_currentHIDUISensorModeAssertion, 0);
  objc_storeStrong((id *)&self->_mainDisplayLinkController, 0);
  objc_storeStrong((id *)&self->_alwaysOnDefaults, 0);
  objc_storeStrong((id *)&self->_disableAODAssertion, 0);
  objc_storeStrong((id *)&self->_brightnessSystemClient, 0);
  objc_storeStrong(&self->_backlightCompletion, 0);
  objc_storeStrong((id *)&self->_informers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_contextProvider, 0);
}

- (void)_updateHIDUISensorModeForBacklightState:(uint64_t)a3 source:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("SBBacklightController.m");
  v16 = 1024;
  v17 = 365;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1D0540000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
