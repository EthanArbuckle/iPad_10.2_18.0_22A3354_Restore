@implementation SBCaptureHardwareButtonAppActivator

- (SBCaptureHardwareButtonAppActivator)initWithSettingsSnapshot:(id)a3 windowScene:(id)a4 scanModeResource:(id)a5 activationManager:(id)a6 suppressionManager:(id)a7 setupManager:(id)a8 authenticationController:(id)a9 HUDController:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  SBCaptureHardwareButtonAppActivator *v20;
  void *v21;
  SBDeviceStationaryMotionDetector *v22;
  SBDeviceStationaryMotionDetector *stationaryDeviceMotionDetector;
  uint64_t v24;
  BSAbsoluteMachTimer *stationaryStateDebounceTimer;
  void *v26;
  uint64_t v27;
  SBCaptureButtonDefaults *captureButtonDefaults;
  uint64_t v29;
  BSDefaultObserver *captureButtonDefaultsObserver;
  double v31;
  double v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v41;
  id v42;
  id v43;
  objc_super v44;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v43 = a6;
  v19 = a7;
  v42 = a8;
  v41 = a9;
  v44.receiver = self;
  v44.super_class = (Class)SBCaptureHardwareButtonAppActivator;
  v20 = -[SBCaptureHardwareButtonAppActivator init](&v44, sel_init);
  if (v20)
  {
    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, v20, CFSTR("SBCaptureHardwareButtonAppActivator.m"), 119, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("settings != nil"));

    }
    if (!v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, v20, CFSTR("SBCaptureHardwareButtonAppActivator.m"), 120, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scanModeResource != nil"));

    }
    if (!v43)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, v20, CFSTR("SBCaptureHardwareButtonAppActivator.m"), 121, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("activationManager != nil"));

    }
    if (v19)
    {
      if (v17)
      {
LABEL_10:
        objc_storeStrong((id *)&v20->_windowScene, a4);
        objc_storeWeak((id *)&v20->_scanningModeAssertionProvider, v18);
        objc_storeStrong((id *)&v20->_activationManager, a6);
        objc_storeStrong((id *)&v20->_suppressionManager, a7);
        objc_storeStrong((id *)&v20->_setupManager, a8);
        objc_storeStrong((id *)&v20->_authenticationController, a9);
        v20->_valid = 1;
        v20->_consoleModeNotifyToken = -1;
        -[SBCaptureHardwareButtonAppActivator _beginObservingConsoleMode](v20, "_beginObservingConsoleMode");
        objc_msgSend(v17, "layoutStateTransitionCoordinator");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObserver:", v20);
        objc_storeStrong((id *)&v20->_settings, a3);
        v22 = objc_alloc_init(SBDeviceStationaryMotionDetector);
        stationaryDeviceMotionDetector = v20->_stationaryDeviceMotionDetector;
        v20->_stationaryDeviceMotionDetector = v22;

        v20->_stationaryState = 0;
        v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0D01690]), "initWithIdentifier:", CFSTR("SBCaptureHardwareButtonAppActivator.stationaryStateDisablingTimer"));
        stationaryStateDebounceTimer = v20->_stationaryStateDebounceTimer;
        v20->_stationaryStateDebounceTimer = (BSAbsoluteMachTimer *)v24;

        +[SBDefaults localDefaults](SBDefaults, "localDefaults");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "captureButtonDefaults");
        v27 = objc_claimAutoreleasedReturnValue();
        captureButtonDefaults = v20->_captureButtonDefaults;
        v20->_captureButtonDefaults = (SBCaptureButtonDefaults *)v27;

        -[SBCaptureHardwareButtonAppActivator _createCaptureButtonDefaultsObserver](v20, "_createCaptureButtonDefaultsObserver");
        v29 = objc_claimAutoreleasedReturnValue();
        captureButtonDefaultsObserver = v20->_captureButtonDefaultsObserver;
        v20->_captureButtonDefaultsObserver = (BSDefaultObserver *)v29;

        -[SBCaptureHardwareButtonAppActivator _updateCaptureButtonDefaults](v20, "_updateCaptureButtonDefaults");
        v20->_machAbsoluteButtonPressDownTimeForDeferredLaunches = 0;
        objc_msgSend(v16, "launchAfterButtonUpGracePeriod");
        v20->_gracePeriodForVOUnobstructionAfterRelease = v31;
        objc_msgSend(v16, "ignoreFaceDownAfterDuration");
        v20->_honorFaceDownDuration = v32;
        -[SBSystemActionControl addSystemActionValidator:]((uint64_t)v19, v20);

        goto LABEL_11;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, v20, CFSTR("SBCaptureHardwareButtonAppActivator.m"), 122, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("suppressionManager != nil"));

      if (v17)
        goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, v20, CFSTR("SBCaptureHardwareButtonAppActivator.m"), 123, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("windowScene != nil"));

    goto LABEL_10;
  }
LABEL_11:

  return v20;
}

- (void)dealloc
{
  NSTimer *coachingBreatherTimer;
  void *v5;
  objc_super v6;

  if (self->_valid)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCaptureHardwareButtonAppActivator.m"), 159, CFSTR("Must invalidate %@ before deallocating."), self);

  }
  -[NSTimer invalidate](self->_coachingBreatherTimer, "invalidate");
  coachingBreatherTimer = self->_coachingBreatherTimer;
  self->_coachingBreatherTimer = 0;

  -[BSDefaultObserver invalidate](self->_captureButtonDefaultsObserver, "invalidate");
  v6.receiver = self;
  v6.super_class = (Class)SBCaptureHardwareButtonAppActivator;
  -[SBCaptureHardwareButtonAppActivator dealloc](&v6, sel_dealloc);
}

- (void)buttonPressDownAtTimestamp:(unint64_t)a3 requestingActivationOfAppWithBundleIdentifier:(id)a4 clickCountToActivate:(int64_t)a5
{
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  unint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  const __CFString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  if (!self->_valid)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCaptureHardwareButtonAppActivator.m"), 170, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_valid == YES"));

  }
  if (self->_launchPendedDueToButtonDownWhileSuppressed)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCaptureHardwareButtonAppActivator.m"), 171, CFSTR("Received multiple button presses down without cancel or press up"));

  }
  v11 = -[SBCaptureButtonSuppressionManager suppressionState](self->_suppressionManager, "suppressionState");
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "captureButtonDefaults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "disablePreLaunchCaptureButtonSuppression");

  -[SBCaptureHardwareButtonAppActivator _invalidateDeferredLaunchTimer](self, "_invalidateDeferredLaunchTimer");
  self->_isWaitingForButtonUpToPerformLaunch = 0;
  -[SBCaptureButtonCoachingController setExtraCoachingUIButtonOffset:](self->_coachingController, "setExtraCoachingUIButtonOffset:", 6.0);
  if (self->_prewarmLockoutTimer)
  {
    SBLogCameraCaptureSuppression();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v28 = a3;
      _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "Button press at timestamp %lld ignored; confirmed launch prewarm already in progress.",
        buf,
        0xCu);
    }
LABEL_8:

    goto LABEL_30;
  }
  if (a5 == 1)
    -[SBCaptureHardwareButtonAppActivator _updateStationaryState](self, "_updateStationaryState");
  if (v11 == 1)
    v16 = v14;
  else
    v16 = 1;
  if (v16 == 1)
  {
    objc_storeStrong((id *)&self->_bundleIDForCurrentActivation, a4);
    SBLogCameraCaptureSuppression();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSBCaptureButtonSuppressionState(v11);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v18;
      v20 = &stru_1E8EC7EC0;
      *(_DWORD *)buf = 134218498;
      v28 = a3;
      v29 = 2114;
      if (v14)
        v20 = CFSTR(" Pre-Launch Suppression DISABLED via user defaults");
      v30 = v18;
      v31 = 2114;
      v32 = v20;
      _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "Button press at timestamp %lld NOT suppressed; VO=%{public}@; will launch on button up %{public}@",
        buf,
        0x20u);

    }
    -[SBCaptureHardwareButtonAppActivator _prepareConfirmedLaunchSequenceForButtonDown:](self, "_prepareConfirmedLaunchSequenceForButtonDown:", 1);
  }
  else
  {
    if (!self->_allowLaunchIfUnobstructedWhileButtonDown)
    {
      SBLogCameraCaptureSuppression();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSBCaptureButtonSuppressionState(1uLL);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v28 = a3;
        v29 = 2114;
        v30 = (uint64_t)v23;
        _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "Button press at timestamp %lld suppressed (VO=%{public}@); prohibiting launch",
          buf,
          0x16u);

      }
      goto LABEL_8;
    }
    if (v10)
    {
      objc_storeStrong((id *)&self->_bundleIDForCurrentActivation, a4);
      SBLogCameraCaptureSuppression();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSBCaptureButtonSuppressionState(1uLL);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v28 = a3;
        v29 = 2114;
        v30 = (uint64_t)v22;
        _os_log_impl(&dword_1D0540000, v21, OS_LOG_TYPE_DEFAULT, "Button press at timestamp %lld pended (VO=%{public}@); pending launch",
          buf,
          0x16u);

      }
      self->_launchPendedDueToButtonDownWhileSuppressed = 1;
      self->_machAbsoluteButtonPressDownTimeForDeferredLaunches = a3;
    }
    else
    {
      SBLogCameraCaptureLaunch();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v24, OS_LOG_TYPE_DEFAULT, "Ignoring request to launch capture app with nil bundleID", buf, 2u);
      }

    }
  }
LABEL_30:

}

- (void)buttonPressUpAtTimestamp:(unint64_t)a3 clickCountToActivate:(int64_t)a4
{
  void *v7;
  int v8;
  _BOOL4 v9;
  char v10;
  int v11;
  void *v12;
  char v13;
  _BOOL4 v14;
  int v15;
  uint64_t v16;
  _BOOL4 v17;
  char v18;
  _BOOL4 allowLaunchIfUnobstructedPromptlyAfterButtonUp;
  NSObject *v20;
  _BOOL4 v21;
  unint64_t machAbsoluteButtonPressDownTimeForDeferredLaunches;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  unint64_t v26;
  BSInvalidatable *hintDropletAssertion;
  BSInvalidatable *v28;
  uint64_t v29;
  void *v30;
  void *v32;
  _OWORD v33[4];
  uint64_t v34;
  uint8_t buf[16];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (!self->_valid)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCaptureHardwareButtonAppActivator.m"), 210, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_valid == YES"));

  }
  -[BSInvalidatable invalidate](self->_buttonDownActiveAssertion, "invalidate");
  -[SBCaptureButtonCoachingController setExtraCoachingUIButtonOffset:](self->_coachingController, "setExtraCoachingUIButtonOffset:", 0.0);
  +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "screenIsDim");

  v9 = -[SBCaptureHardwareButtonAppActivator _isWithinDirectLaunchGracePeriod](self, "_isWithinDirectLaunchGracePeriod");
  v10 = v9;
  if (v8 && !self->_disableWakeWhenDim)
    v11 = a4 == 1 && !v9;
  else
    v11 = 0;
  -[SBWindowScene lockScreenManager](self->_windowScene, "lockScreenManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isUILocked");

  v14 = -[SBCaptureHardwareButtonAppActivator _shouldSuppressStationary](self, "_shouldSuppressStationary");
  if (a4 == 1 && self->_enableCameraPose)
  {
    -[SBCaptureHardwareButtonAppActivator _cancel](self, "_cancel");
    v15 = 0;
    v16 = 0;
  }
  else
  {
    v17 = a4 == 1 && v14;
    if (self->_isConsoleModeActive || v17)
    {
      if ((v14 & v8) == 1)
        -[SBCaptureHardwareButtonAppActivator _wakeScreen](self, "_wakeScreen");
      SBLogCameraCaptureLaunch();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v23, OS_LOG_TYPE_DEFAULT, "Button press up; aborting launch.", buf, 2u);
      }

      -[SBCaptureHardwareButtonAppActivator _cancel](self, "_cancel");
      v15 = 0;
      v16 = 1;
    }
    else
    {
      if (self->_isWaitingForButtonUpToPerformLaunch)
        v18 = v11;
      else
        v18 = 1;
      if ((v18 & 1) != 0)
      {
        if (self->_launchPendedDueToButtonDownWhileSuppressed)
        {
          allowLaunchIfUnobstructedPromptlyAfterButtonUp = self->_allowLaunchIfUnobstructedPromptlyAfterButtonUp;
          SBLogCameraCaptureLaunch();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
          if (allowLaunchIfUnobstructedPromptlyAfterButtonUp)
          {
            if (v21)
            {
              machAbsoluteButtonPressDownTimeForDeferredLaunches = self->_machAbsoluteButtonPressDownTimeForDeferredLaunches;
              *(_DWORD *)buf = 134217984;
              *(_QWORD *)&buf[4] = machAbsoluteButtonPressDownTimeForDeferredLaunches;
              _os_log_impl(&dword_1D0540000, v20, OS_LOG_TYPE_DEFAULT, "Button press up corresponding to press down at timestamp %lld; further pending launch",
                buf,
                0xCu);
            }

            -[SBCaptureHardwareButtonAppActivator _startDeferredLaunchTimerWithTimeout:](self, "_startDeferredLaunchTimerWithTimeout:", self->_gracePeriodForVOUnobstructionAfterRelease);
            v15 = 0;
          }
          else
          {
            if (v21)
            {
              v26 = self->_machAbsoluteButtonPressDownTimeForDeferredLaunches;
              *(_DWORD *)buf = 134217984;
              *(_QWORD *)&buf[4] = v26;
              _os_log_impl(&dword_1D0540000, v20, OS_LOG_TYPE_DEFAULT, "Button press up corresponding to press down at timestamp %lld without VO change; abandoning pended reque"
                "st; prohibiting launch",
                buf,
                0xCu);
            }

            v15 = 0;
            self->_machAbsoluteButtonPressDownTimeForDeferredLaunches = 0;
          }
          v16 = 4;
        }
        else
        {
          v16 = 0;
          v15 = 0;
          if (self->_isWaitingForButtonUpToPerformLaunch && ((v11 ^ 1) & 1) == 0)
          {
            SBLogCameraCaptureLaunch();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D0540000, v25, OS_LOG_TYPE_DEFAULT, "Aborting launch, undimming screen.", buf, 2u);
            }

            self->_isWaitingForButtonUpToPerformLaunch = 0;
            -[SBCaptureHardwareButtonAppActivator _cancel](self, "_cancel");
            -[SBCaptureHardwareButtonAppActivator _wakeScreen](self, "_wakeScreen");
            v15 = 0;
            v16 = 2;
          }
        }
      }
      else
      {
        SBLogCameraCaptureLaunch();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0540000, v24, OS_LOG_TYPE_DEFAULT, "Button press up; launching", buf, 2u);
        }

        -[SBCaptureHardwareButtonAppActivator _initiateLaunchAnimationExpansion](self, "_initiateLaunchAnimationExpansion");
        self->_isWaitingForButtonUpToPerformLaunch = 0;
        -[SBCaptureHardwareButtonAppActivator _attemptCameraAppLaunchSequence](self, "_attemptCameraAppLaunchSequence");
        v15 = 1;
        v16 = 3;
      }
    }
  }
  self->_launchPendedDueToButtonDownWhileSuppressed = 0;
  hintDropletAssertion = self->_hintDropletAssertion;
  if (hintDropletAssertion)
  {
    -[BSInvalidatable invalidate](hintDropletAssertion, "invalidate");
    v28 = self->_hintDropletAssertion;
    self->_hintDropletAssertion = 0;

  }
  if (v15)
    -[SBCaptureButtonCoachingController dismissCoachingUI](self->_coachingController, "dismissCoachingUI");
  v29 = SBCaptureButtonMitigationConfigurationMake(self->_disableStationaryDetection, self->_disableWakeWhenDim, self->_disableDirectLaunchAfterUnsuppress, self->_allowLaunchIfUnobstructedWhileButtonDown, self->_allowLaunchIfUnobstructedPromptlyAfterButtonUp, self->_enableCameraPose);
  v39 = 0;
  v37 = 0u;
  v38 = 0u;
  *(_OWORD *)buf = 0u;
  v36 = 0u;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  SBCaptureButtonUpLogMake(a3, a4, v29 & 0xFFFFFFFFFFFFLL, v8, v13, v10, objc_msgSend(v30, "orientation"), self->_isConsoleModeActive, (uint64_t)buf, 0.0, v16, self->_stationaryState);

  v33[2] = v37;
  v33[3] = v38;
  v34 = v39;
  v33[0] = *(_OWORD *)buf;
  v33[1] = v36;
  SBCaptureButtonUpLogReadableString((uint64_t *)v33);
}

- (BOOL)isActivationInProgress
{
  return self->_isWaitingForButtonUpToPerformLaunch
      || -[BSAbsoluteMachTimer isScheduled](self->_prewarmLockoutTimer, "isScheduled")
      || -[BSAbsoluteMachTimer isScheduled](self->_expansionAnimationYComponentLockoutTimer, "isScheduled")
      || -[BSAbsoluteMachTimer isScheduled](self->_expansionAnimationScaleComponentLockoutTimer, "isScheduled")
      || self->_waitingForActivationCompletion;
}

- (void)outOfBandCancel
{
  void *v4;

  if (!self->_valid)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCaptureHardwareButtonAppActivator.m"), 321, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_valid == YES"));

  }
  -[SBCaptureHardwareButtonAppActivator _cancel](self, "_cancel");
}

- (void)_wakeScreen
{
  void *v2;
  void *v3;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = CFSTR("SBUIUnlockOptionsTurnOnScreenFirstKey");
  v4[1] = CFSTR("SBUIUnlockOptionsStartFadeInAnimation");
  v5[0] = MEMORY[0x1E0C9AAB0];
  v5[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unlockUIFromSource:withOptions:", 40, v3);

}

- (void)_suppressionManagerDidUnsuppress:(id)a3
{
  id v4;
  double v5;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  unint64_t machAbsoluteButtonPressDownTimeForDeferredLaunches;
  BSAbsoluteMachTimer *deferredLaunchAfterButtonUpGracePeriodTimer;
  NSObject *v11;
  void *v12;
  double gracePeriodForVOUnobstructionAfterRelease;
  unint64_t v14;
  double v15;
  int v16;
  void *v17;
  __int16 v18;
  double v19;
  __int16 v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSAbsoluteMachTimeNow();
  self->_lastUnsuppressEventTimestamp = v5;
  v6 = objc_msgSend(v4, "suppressionState");

  if (self->_allowLaunchIfUnobstructedWhileButtonDown && self->_launchPendedDueToButtonDownWhileSuppressed)
  {
    SBLogCameraCaptureSuppression();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSBCaptureButtonSuppressionState(v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      machAbsoluteButtonPressDownTimeForDeferredLaunches = self->_machAbsoluteButtonPressDownTimeForDeferredLaunches;
      v16 = 138543618;
      v17 = v8;
      v18 = 2048;
      v19 = *(double *)&machAbsoluteButtonPressDownTimeForDeferredLaunches;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "VO->%{public}@, deferred launch while button down for press down at timestamp %lld; allowing launch",
        (uint8_t *)&v16,
        0x16u);

    }
    self->_launchPendedDueToButtonDownWhileSuppressed = 0;
    self->_machAbsoluteButtonPressDownTimeForDeferredLaunches = 0;
    -[SBCaptureHardwareButtonAppActivator _prepareConfirmedLaunchSequenceForButtonDown:](self, "_prepareConfirmedLaunchSequenceForButtonDown:", 1);
  }
  else if (self->_allowLaunchIfUnobstructedPromptlyAfterButtonUp)
  {
    deferredLaunchAfterButtonUpGracePeriodTimer = self->_deferredLaunchAfterButtonUpGracePeriodTimer;
    if (deferredLaunchAfterButtonUpGracePeriodTimer)
    {
      if (-[BSAbsoluteMachTimer isScheduled](deferredLaunchAfterButtonUpGracePeriodTimer, "isScheduled"))
      {
        SBLogCameraCaptureSuppression();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromSBCaptureButtonSuppressionState(v6);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          gracePeriodForVOUnobstructionAfterRelease = self->_gracePeriodForVOUnobstructionAfterRelease;
          -[BSAbsoluteMachTimer timeRemaining](self->_deferredLaunchAfterButtonUpGracePeriodTimer, "timeRemaining");
          v14 = self->_machAbsoluteButtonPressDownTimeForDeferredLaunches;
          v16 = 138543874;
          v17 = v12;
          v18 = 2048;
          v19 = gracePeriodForVOUnobstructionAfterRelease - v15;
          v20 = 2048;
          v21 = v14;
          _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "VO->%{public}@, deferred launch (%.3f sec) after button released for press down at timestamp %lld; allowing launch",
            (uint8_t *)&v16,
            0x20u);

        }
        self->_machAbsoluteButtonPressDownTimeForDeferredLaunches = 0;
        -[SBCaptureHardwareButtonAppActivator _prepareConfirmedLaunchSequenceForButtonDown:](self, "_prepareConfirmedLaunchSequenceForButtonDown:", 0);
        -[SBCaptureHardwareButtonAppActivator _invalidateDeferredLaunchTimer](self, "_invalidateDeferredLaunchTimer");
      }
    }
  }
}

- (void)captureButtonSuppressionManager:(id)a3 event:(id)a4
{
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  double honorFaceDownDuration;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  unint64_t v13;
  double v14;
  void *v15;
  unint64_t machAbsoluteButtonPressDownTimeForDeferredLaunches;
  double v17;
  int v18;
  void *v19;
  __int16 v20;
  unint64_t v21;
  __int16 v22;
  double v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_msgSend(v5, "suppressionState");
  if (v6 != 3)
  {
    if (v6 != 2)
      goto LABEL_12;
    goto LABEL_11;
  }
  objc_msgSend(v5, "secondsAfterFaceDownAtUnsuppressionTime");
  v8 = v7;
  honorFaceDownDuration = self->_honorFaceDownDuration;
  SBLogCameraCaptureSuppression();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v8 >= honorFaceDownDuration)
  {
    if (v11)
    {
      NSStringFromSBCaptureButtonSuppressionState(3uLL);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      machAbsoluteButtonPressDownTimeForDeferredLaunches = self->_machAbsoluteButtonPressDownTimeForDeferredLaunches;
      v17 = self->_honorFaceDownDuration;
      v18 = 138544130;
      v19 = v15;
      v20 = 2048;
      v21 = machAbsoluteButtonPressDownTimeForDeferredLaunches;
      v22 = 2048;
      v23 = v17;
      v24 = 2048;
      v25 = v8;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "VO->%{public}@, deferred launch for button press down at timestamp %lld;  face down limit of %g exceeded (%g)",
        (uint8_t *)&v18,
        0x2Au);

    }
LABEL_11:
    -[SBCaptureHardwareButtonAppActivator _suppressionManagerDidUnsuppress:](self, "_suppressionManagerDidUnsuppress:", v5);
    goto LABEL_12;
  }
  if (v11)
  {
    NSStringFromSBCaptureButtonSuppressionState(3uLL);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = self->_machAbsoluteButtonPressDownTimeForDeferredLaunches;
    v14 = self->_honorFaceDownDuration;
    v18 = 138544130;
    v19 = v12;
    v20 = 2048;
    v21 = v13;
    v22 = 2048;
    v23 = v14;
    v24 = 2048;
    v25 = v8;
    _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "VO->%{public}@, deferred launch for button press down at timestamp %lld;  device is face down within %g seconds (%"
      "g); prohibiting launch",
      (uint8_t *)&v18,
      0x2Au);

  }
LABEL_12:

}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
  id v5;

  objc_msgSend(a4, "toLayoutState", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  self->_unlockedEnvironmentMode = objc_msgSend(v5, "unlockedEnvironmentMode");

}

- (void)invalidate
{
  int consoleModeNotifyToken;
  void *v5;
  id v6;

  if (!self->_valid)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCaptureHardwareButtonAppActivator.m"), 385, CFSTR("May only invalidate %@ once."), self);

  }
  -[SBCaptureHardwareButtonAppActivator _cancel](self, "_cancel");
  -[SBCaptureButtonSuppressionManager removeObserver:]((uint64_t)self->_suppressionManager, (uint64_t)self);
  -[SBWindowScene layoutStateTransitionCoordinator](self->_windowScene, "layoutStateTransitionCoordinator");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);
  self->_valid = 0;
  consoleModeNotifyToken = self->_consoleModeNotifyToken;
  if ((consoleModeNotifyToken & 0x80000000) == 0)
  {
    notify_cancel(consoleModeNotifyToken);
    self->_consoleModeNotifyToken = -1;
  }

}

- (void)_invalidatePrewarmLockoutTimer
{
  BSAbsoluteMachTimer *prewarmLockoutTimer;

  -[BSAbsoluteMachTimer invalidate](self->_prewarmLockoutTimer, "invalidate");
  prewarmLockoutTimer = self->_prewarmLockoutTimer;
  self->_prewarmLockoutTimer = 0;

}

- (void)_startPrewarmLockoutTimerWithTimeout:(double)a3
{
  NSObject *v5;
  BSAbsoluteMachTimer *v6;
  BSAbsoluteMachTimer *prewarmLockoutTimer;
  BSAbsoluteMachTimer *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id buf[2];

  if (a3 > 0.0)
  {
    -[SBCaptureHardwareButtonAppActivator _invalidatePrewarmLockoutTimer](self, "_invalidatePrewarmLockoutTimer");
    SBLogCameraCaptureLaunch();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Starting Prewarm Lockout Timer.", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    v6 = (BSAbsoluteMachTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01690]), "initWithIdentifier:", CFSTR("SBCaptureHardwareButtonAppActivator.prewarmLockoutTimer"));
    prewarmLockoutTimer = self->_prewarmLockoutTimer;
    self->_prewarmLockoutTimer = v6;

    v8 = self->_prewarmLockoutTimer;
    v9 = MEMORY[0x1E0C80D38];
    v10 = MEMORY[0x1E0C80D38];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __76__SBCaptureHardwareButtonAppActivator__startPrewarmLockoutTimerWithTimeout___block_invoke;
    v11[3] = &unk_1E8E9EEC8;
    objc_copyWeak(&v12, buf);
    -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v8, "scheduleWithFireInterval:leewayInterval:queue:handler:", v9, v11, a3, 0.0);

    objc_destroyWeak(&v12);
    objc_destroyWeak(buf);
  }
}

void __76__SBCaptureHardwareButtonAppActivator__startPrewarmLockoutTimerWithTimeout___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_prewarmLockoutTimeoutDidOccur");

}

- (void)_prewarmLockoutTimeoutDidOccur
{
  NSObject *v3;
  void *v5;
  uint8_t buf[16];

  if (!self->_valid)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCaptureHardwareButtonAppActivator.m"), 420, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_valid == YES"));

  }
  if (self->_prewarmLockoutTimer)
  {
    -[SBCaptureHardwareButtonAppActivator _invalidatePrewarmLockoutTimer](self, "_invalidatePrewarmLockoutTimer");
    SBLogCameraCaptureLaunch();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Prewarm Lockout Timer expired.", buf, 2u);
    }

    -[SBCaptureHardwareButtonAppActivator _attemptCameraAppLaunchSequence](self, "_attemptCameraAppLaunchSequence");
  }
}

- (void)_invalidateExpansionAnimationYComponentLockoutTimer
{
  BSAbsoluteMachTimer *expansionAnimationYComponentLockoutTimer;

  -[BSAbsoluteMachTimer invalidate](self->_expansionAnimationYComponentLockoutTimer, "invalidate");
  expansionAnimationYComponentLockoutTimer = self->_expansionAnimationYComponentLockoutTimer;
  self->_expansionAnimationYComponentLockoutTimer = 0;

}

- (void)_invalidateExpansionAnimationScaleComponentLockoutTimer
{
  BSAbsoluteMachTimer *expansionAnimationScaleComponentLockoutTimer;

  -[BSAbsoluteMachTimer invalidate](self->_expansionAnimationScaleComponentLockoutTimer, "invalidate");
  expansionAnimationScaleComponentLockoutTimer = self->_expansionAnimationScaleComponentLockoutTimer;
  self->_expansionAnimationScaleComponentLockoutTimer = 0;

}

- (void)_attemptCameraAppLaunchSequence
{
  _BOOL4 isWaitingForButtonUpToPerformLaunch;
  BSAbsoluteMachTimer *prewarmLockoutTimer;
  BSAbsoluteMachTimer *expansionAnimationYComponentLockoutTimer;
  BSAbsoluteMachTimer *expansionAnimationScaleComponentLockoutTimer;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  _DWORD v11[2];
  __int16 v12;
  _BOOL4 v13;
  __int16 v14;
  _BOOL4 v15;
  __int16 v16;
  _BOOL4 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  isWaitingForButtonUpToPerformLaunch = self->_isWaitingForButtonUpToPerformLaunch;
  prewarmLockoutTimer = self->_prewarmLockoutTimer;
  if (self->_isWaitingForButtonUpToPerformLaunch || prewarmLockoutTimer != 0)
  {
LABEL_9:
    expansionAnimationYComponentLockoutTimer = self->_expansionAnimationYComponentLockoutTimer;
    expansionAnimationScaleComponentLockoutTimer = self->_expansionAnimationScaleComponentLockoutTimer;
    SBLogCameraCaptureLaunch();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67240960;
      v11[1] = isWaitingForButtonUpToPerformLaunch;
      v12 = 1026;
      v13 = prewarmLockoutTimer != 0;
      v14 = 1026;
      v15 = expansionAnimationYComponentLockoutTimer != 0;
      v16 = 1026;
      v17 = expansionAnimationScaleComponentLockoutTimer != 0;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Not performing camera app launch sequence because waitingForButtonUp:%{public}d waitingForPrewarm:%{public}d waitingForYComponent:%{public}d waitingForScaleComponent:%{public}d", (uint8_t *)v11, 0x1Au);
    }

    return;
  }
  if (self->_expansionAnimationYComponentLockoutTimer || self->_expansionAnimationScaleComponentLockoutTimer)
  {
    prewarmLockoutTimer = 0;
    goto LABEL_9;
  }
  SBLogCameraCaptureLaunch();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11[0]) = 0;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Performing camera app launch sequence.", (uint8_t *)v11, 2u);
  }

  -[SBCaptureHardwareButtonAppActivator _takeLaunchGracePeriodPowerAssertion](self, "_takeLaunchGracePeriodPowerAssertion");
  +[SBCaptureApplicationCenter captureApplicationSettings](SBCaptureApplicationCenter, "captureApplicationSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "launchMonitorDurationInSeconds");
  -[SBCaptureHardwareButtonAppActivator _startLaunchGracePeriodTimerWithTimeout:](self, "_startLaunchGracePeriodTimerWithTimeout:");

  -[SBCaptureHardwareButtonAppActivator _launchCaptureApp](self, "_launchCaptureApp");
}

- (void)_invalidateLaunchGracePeriodTimer
{
  BSAbsoluteMachTimer *launchGracePeriodActiveTimer;

  -[BSAbsoluteMachTimer invalidate](self->_launchGracePeriodActiveTimer, "invalidate");
  launchGracePeriodActiveTimer = self->_launchGracePeriodActiveTimer;
  self->_launchGracePeriodActiveTimer = 0;

}

- (void)_startLaunchGracePeriodTimerWithTimeout:(double)a3
{
  NSObject *v5;
  BSAbsoluteMachTimer *v6;
  BSAbsoluteMachTimer *launchGracePeriodActiveTimer;
  BSAbsoluteMachTimer *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id buf[2];

  if (a3 > 0.0)
  {
    -[SBCaptureHardwareButtonAppActivator _invalidateLaunchGracePeriodTimer](self, "_invalidateLaunchGracePeriodTimer");
    SBLogCameraCaptureLaunch();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Starting Sensor Active Grace Period Timer.", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    v6 = (BSAbsoluteMachTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01690]), "initWithIdentifier:", CFSTR("SBCaptureHardwareButtonAppActivator.launchGracePeriodTimer"));
    launchGracePeriodActiveTimer = self->_launchGracePeriodActiveTimer;
    self->_launchGracePeriodActiveTimer = v6;

    v8 = self->_launchGracePeriodActiveTimer;
    v9 = MEMORY[0x1E0C80D38];
    v10 = MEMORY[0x1E0C80D38];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __79__SBCaptureHardwareButtonAppActivator__startLaunchGracePeriodTimerWithTimeout___block_invoke;
    v11[3] = &unk_1E8E9EEC8;
    objc_copyWeak(&v12, buf);
    -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v8, "scheduleWithFireInterval:leewayInterval:queue:handler:", v9, v11, a3, 0.0);

    objc_destroyWeak(&v12);
    objc_destroyWeak(buf);
  }
}

void __79__SBCaptureHardwareButtonAppActivator__startLaunchGracePeriodTimerWithTimeout___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_launchGracePeriodTimeoutDidOccur");

}

- (void)_launchGracePeriodTimeoutDidOccur
{
  NSObject *v3;
  _BOOL4 v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (self->_launchGracePeriodActiveTimer)
  {
    SBLogCameraCaptureLaunch();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = self->_launchGracePeriodActiveAssertion != 0;
      v5[0] = 67109120;
      v5[1] = v4;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Launch Sensor Active Grace Period Timer expired. Was power assertion active? (%{BOOL}d)", (uint8_t *)v5, 8u);
    }

    -[BSInvalidatable invalidate](self->_launchGracePeriodActiveAssertion, "invalidate");
    -[BSAbsoluteMachTimer invalidate](self->_launchGracePeriodActiveTimer, "invalidate");
  }
}

- (void)_invalidateDeferredLaunchTimer
{
  BSAbsoluteMachTimer *deferredLaunchAfterButtonUpGracePeriodTimer;

  self->_machAbsoluteButtonPressDownTimeForDeferredLaunches = 0;
  -[BSAbsoluteMachTimer invalidate](self->_deferredLaunchAfterButtonUpGracePeriodTimer, "invalidate");
  deferredLaunchAfterButtonUpGracePeriodTimer = self->_deferredLaunchAfterButtonUpGracePeriodTimer;
  self->_deferredLaunchAfterButtonUpGracePeriodTimer = 0;

}

- (void)_startDeferredLaunchTimerWithTimeout:(double)a3
{
  NSObject *v5;
  BSAbsoluteMachTimer *v6;
  BSAbsoluteMachTimer *deferredLaunchAfterButtonUpGracePeriodTimer;
  BSAbsoluteMachTimer *v8;
  uint64_t v9;
  id v10;
  void *v12;
  _QWORD v13[4];
  id v14;
  id buf[2];

  if (a3 > 0.0)
  {
    if (self->_deferredLaunchAfterButtonUpGracePeriodTimer)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCaptureHardwareButtonAppActivator.m"), 494, CFSTR("Can't start second deferred launch timer"));

    }
    SBLogCameraCaptureLaunch();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Starting Deferred Launch Grace Period Timer.", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    v6 = (BSAbsoluteMachTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01690]), "initWithIdentifier:", CFSTR("SBCaptureHardwareButtonAppActivator.deferredLaunchAfterButtonUpGracePeriodTimer"));
    deferredLaunchAfterButtonUpGracePeriodTimer = self->_deferredLaunchAfterButtonUpGracePeriodTimer;
    self->_deferredLaunchAfterButtonUpGracePeriodTimer = v6;

    v8 = self->_deferredLaunchAfterButtonUpGracePeriodTimer;
    v9 = MEMORY[0x1E0C80D38];
    v10 = MEMORY[0x1E0C80D38];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __76__SBCaptureHardwareButtonAppActivator__startDeferredLaunchTimerWithTimeout___block_invoke;
    v13[3] = &unk_1E8E9EEC8;
    objc_copyWeak(&v14, buf);
    -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v8, "scheduleWithFireInterval:leewayInterval:queue:handler:", v9, v13, a3, 0.0);

    objc_destroyWeak(&v14);
    objc_destroyWeak(buf);
  }
}

void __76__SBCaptureHardwareButtonAppActivator__startDeferredLaunchTimerWithTimeout___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_deferredLaunchTimeoutDidOccur");

}

- (void)_deferredLaunchTimeoutDidOccur
{
  NSObject *v3;
  unint64_t machAbsoluteButtonPressDownTimeForDeferredLaunches;
  int v5;
  unint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_deferredLaunchAfterButtonUpGracePeriodTimer)
  {
    SBLogCameraCaptureLaunch();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      machAbsoluteButtonPressDownTimeForDeferredLaunches = self->_machAbsoluteButtonPressDownTimeForDeferredLaunches;
      v5 = 134217984;
      v6 = machAbsoluteButtonPressDownTimeForDeferredLaunches;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Deferred Launch Grace Period Timer expired for press at timestamp %lld without VO change; abandoning pended requ"
        "est; prohibiting launch",
        (uint8_t *)&v5,
        0xCu);
    }

    -[SBCaptureHardwareButtonAppActivator _invalidateDeferredLaunchTimer](self, "_invalidateDeferredLaunchTimer");
  }
}

- (void)_initiateLaunchAnimationPrelude
{
  SBHardwareButtonLaunchPreludeAnimationToken *v3;
  SBHardwareButtonLaunchPreludeAnimationToken *activeLaunchAnimationPreludeToken;
  id v5;

  if (_os_feature_enabled_impl())
  {
    -[SBWindowScene hardwareButtonBezelEffectsCoordinator](self->_windowScene, "hardwareButtonBezelEffectsCoordinator");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "animateLaunchZoomUpPreludeFromButton:", 9);
    v3 = (SBHardwareButtonLaunchPreludeAnimationToken *)objc_claimAutoreleasedReturnValue();
    activeLaunchAnimationPreludeToken = self->_activeLaunchAnimationPreludeToken;
    self->_activeLaunchAnimationPreludeToken = v3;

  }
}

- (void)_initiateLaunchAnimationExpansion
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  BSAbsoluteMachTimer *v8;
  BSAbsoluteMachTimer *expansionAnimationYComponentLockoutTimer;
  BSAbsoluteMachTimer *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  BSAbsoluteMachTimer *v14;
  BSAbsoluteMachTimer *expansionAnimationScaleComponentLockoutTimer;
  BSAbsoluteMachTimer *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  char v20;
  _QWORD v21[4];
  id v22;
  id v23;
  char v24;
  id from;
  id location;

  if (self->_activeLaunchAnimationPreludeToken)
  {
    v3 = -[SBCaptureHardwareButtonAppActivator _isOverUnlockedApplication](self, "_isOverUnlockedApplication") ^ 1;
    -[SBHardwareButtonLaunchPreludeAnimationToken expandHintingDropletByAddingComponents:shockwave:](self->_activeLaunchAnimationPreludeToken, "expandHintingDropletByAddingComponents:shockwave:", 1, v3);
    -[SBCaptureButtonSettings zoomUpYDelay](self->_settings, "zoomUpYDelay");
    v5 = v4;
    -[SBCaptureButtonSettings zoomUpScaleDelay](self->_settings, "zoomUpScaleDelay");
    v7 = v6;
    if (v5 > 0.0 || v6 > 0.0)
    {
      -[SBCaptureHardwareButtonAppActivator _invalidateExpansionAnimationYComponentLockoutTimer](self, "_invalidateExpansionAnimationYComponentLockoutTimer");
      -[SBCaptureHardwareButtonAppActivator _invalidateExpansionAnimationScaleComponentLockoutTimer](self, "_invalidateExpansionAnimationScaleComponentLockoutTimer");
      objc_initWeak(&location, self);
      objc_initWeak(&from, self->_activeLaunchAnimationPreludeToken);
      v8 = (BSAbsoluteMachTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01690]), "initWithIdentifier:", CFSTR("SBCaptureHardwareButtonAppActivator.expansionAnimationYComponentLockoutTimer"));
      expansionAnimationYComponentLockoutTimer = self->_expansionAnimationYComponentLockoutTimer;
      self->_expansionAnimationYComponentLockoutTimer = v8;

      v10 = self->_expansionAnimationYComponentLockoutTimer;
      v11 = MEMORY[0x1E0C80D38];
      v12 = MEMORY[0x1E0C80D38];
      v13 = MEMORY[0x1E0C809B0];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __72__SBCaptureHardwareButtonAppActivator__initiateLaunchAnimationExpansion__block_invoke;
      v21[3] = &unk_1E8EB5D68;
      objc_copyWeak(&v22, &location);
      objc_copyWeak(&v23, &from);
      v24 = v3;
      -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v10, "scheduleWithFireInterval:leewayInterval:queue:handler:", v11, v21, v5, 0.0);

      v14 = (BSAbsoluteMachTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01690]), "initWithIdentifier:", CFSTR("SBCaptureHardwareButtonAppActivator.expansionAnimationScaleComponentLockoutTimer"));
      expansionAnimationScaleComponentLockoutTimer = self->_expansionAnimationScaleComponentLockoutTimer;
      self->_expansionAnimationScaleComponentLockoutTimer = v14;

      v16 = self->_expansionAnimationScaleComponentLockoutTimer;
      v17[0] = v13;
      v17[1] = 3221225472;
      v17[2] = __72__SBCaptureHardwareButtonAppActivator__initiateLaunchAnimationExpansion__block_invoke_2;
      v17[3] = &unk_1E8EB5D68;
      objc_copyWeak(&v18, &location);
      objc_copyWeak(&v19, &from);
      v20 = v3;
      -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v16, "scheduleWithFireInterval:leewayInterval:queue:handler:", MEMORY[0x1E0C80D38], v17, v7, 0.0);

      objc_destroyWeak(&v19);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&v23);
      objc_destroyWeak(&v22);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
    else
    {
      -[SBHardwareButtonLaunchPreludeAnimationToken expandHintingDropletByAddingComponents:shockwave:](self->_activeLaunchAnimationPreludeToken, "expandHintingDropletByAddingComponents:shockwave:", 6, v3);
      -[SBCaptureHardwareButtonAppActivator _attemptCameraAppLaunchSequence](self, "_attemptCameraAppLaunchSequence");
    }
  }
}

void __72__SBCaptureHardwareButtonAppActivator__initiateLaunchAnimationExpansion__block_invoke(uint64_t a1)
{
  id v2;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2 && v2 == WeakRetained[9])
  {
    objc_msgSend(WeakRetained, "_invalidateExpansionAnimationYComponentLockoutTimer");
    objc_msgSend(WeakRetained[9], "expandHintingDropletByAddingComponents:shockwave:", 2, *(unsigned __int8 *)(a1 + 48));
    objc_msgSend(WeakRetained, "_attemptCameraAppLaunchSequence");
  }

}

void __72__SBCaptureHardwareButtonAppActivator__initiateLaunchAnimationExpansion__block_invoke_2(uint64_t a1)
{
  id v2;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2 && v2 == WeakRetained[9])
  {
    objc_msgSend(WeakRetained, "_invalidateExpansionAnimationScaleComponentLockoutTimer");
    objc_msgSend(WeakRetained[9], "expandHintingDropletByAddingComponents:shockwave:", 4, *(unsigned __int8 *)(a1 + 48));
    objc_msgSend(WeakRetained, "_attemptCameraAppLaunchSequence");
  }

}

- (void)_prepareConfirmedLaunchSequenceForButtonDown:(BOOL)a3
{
  _BOOL4 v3;
  BOOL v5;
  NSString *bundleIDForCurrentActivation;
  BSInvalidatable *v7;
  BSInvalidatable *v8;
  _BOOL4 v9;
  _BOOL4 v10;
  NSObject *v11;
  BSInvalidatable *v12;
  BSInvalidatable *hintDropletAssertion;
  _BOOL4 isConsoleModeActive;
  id v15;
  uint8_t buf[4];
  SBCaptureHardwareButtonAppActivator *v17;
  __int16 v18;
  _BOOL4 v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  v5 = -[SBSetupManager isInSetupMode](self->_setupManager, "isInSetupMode");
  bundleIDForCurrentActivation = self->_bundleIDForCurrentActivation;
  if (!v5 && bundleIDForCurrentActivation)
  {
    if (v3)
    {
      self->_isWaitingForButtonUpToPerformLaunch = 1;
      -[SBCaptureHardwareButtonAppActivator _takeButtonDownPowerAssertion](self, "_takeButtonDownPowerAssertion");
    }
    else
    {
      self->_isWaitingForButtonUpToPerformLaunch = 0;
      -[BSInvalidatable invalidate](self->_buttonDownActiveAssertion, "invalidate");
    }
    if ((-[SBFUserAuthenticationController hasAuthenticatedAtLeastOnceSinceBoot](self->_authenticationController, "hasAuthenticatedAtLeastOnceSinceBoot") & 1) != 0)
    {
      if (-[SBCaptureHardwareButtonAppActivator _isInSwitcher](self, "_isInSwitcher"))
      {
LABEL_18:
        -[SBCaptureHardwareButtonAppActivator _attemptCameraAppLaunchSequence](self, "_attemptCameraAppLaunchSequence");
        return;
      }
      -[SBCaptureHardwareButtonAppActivator _initiateLaunchAnimationPrelude](self, "_initiateLaunchAnimationPrelude");
      v9 = -[SBCaptureHardwareButtonAppActivator _isOverUnlockedApplication](self, "_isOverUnlockedApplication");
      v10 = v9;
      if (!self->_isConsoleModeActive && !v9)
      {
        -[SBCaptureHardwareButtonAppActivator _prewarmCameraForBundleIdentifier:](self, "_prewarmCameraForBundleIdentifier:", self->_bundleIDForCurrentActivation);
        -[SBCaptureHardwareButtonAppActivator _startPrewarmLockoutTimerWithTimeout:](self, "_startPrewarmLockoutTimerWithTimeout:", 0.125);
        goto LABEL_18;
      }
      SBLogCameraCaptureLaunch();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        isConsoleModeActive = self->_isConsoleModeActive;
        *(_DWORD *)buf = 138543874;
        v17 = self;
        v18 = 1024;
        v19 = isConsoleModeActive;
        v20 = 1024;
        v21 = v10;
        _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "(%{public}@) skipping lockout timer and camera prewarm because isConsoleModeActive:%{BOOL}u isOverUnlockedApplication:%{BOOL}u", buf, 0x18u);
      }
    }
    else
    {
      if (self->_hintDropletAssertion)
        goto LABEL_18;
      -[SBWindowScene hardwareButtonBezelEffectsCoordinator](self->_windowScene, "hardwareButtonBezelEffectsCoordinator");
      v11 = objc_claimAutoreleasedReturnValue();
      -[NSObject activateHintDropletForButton:](v11, "activateHintDropletForButton:", 9);
      v12 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      hintDropletAssertion = self->_hintDropletAssertion;
      self->_hintDropletAssertion = v12;

    }
    goto LABEL_18;
  }
  self->_bundleIDForCurrentActivation = 0;

  if (!self->_hintDropletAssertion)
  {
    -[SBWindowScene hardwareButtonBezelEffectsCoordinator](self->_windowScene, "hardwareButtonBezelEffectsCoordinator");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "activateHintDropletForButton:", 9);
    v7 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    v8 = self->_hintDropletAssertion;
    self->_hintDropletAssertion = v7;

  }
}

- (void)_cancel
{
  NSObject *v3;
  NSString *prewarmedBundleIdentifier;
  NSString *bundleIDForCurrentActivation;
  SBHardwareButtonLaunchPreludeAnimationToken *activeLaunchAnimationPreludeToken;
  uint8_t v7[16];

  SBLogCameraCaptureLaunch();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Canceling Camera Capture Button Activation.", v7, 2u);
  }

  -[SBCaptureHardwareButtonAppActivator _invalidateDeferredLaunchTimer](self, "_invalidateDeferredLaunchTimer");
  if (self->_prewarmedBundleIdentifier)
  {
    -[SBCaptureHardwareButtonAppActivator _cancelCameraPrewarmForBundleIdentifier:](self, "_cancelCameraPrewarmForBundleIdentifier:");
    prewarmedBundleIdentifier = self->_prewarmedBundleIdentifier;
    self->_prewarmedBundleIdentifier = 0;

    bundleIDForCurrentActivation = self->_bundleIDForCurrentActivation;
    self->_bundleIDForCurrentActivation = 0;

  }
  -[SBCaptureHardwareButtonAppActivator _invalidatePrewarmLockoutTimer](self, "_invalidatePrewarmLockoutTimer");
  -[SBCaptureHardwareButtonAppActivator _invalidateExpansionAnimationYComponentLockoutTimer](self, "_invalidateExpansionAnimationYComponentLockoutTimer");
  -[SBCaptureHardwareButtonAppActivator _invalidateExpansionAnimationScaleComponentLockoutTimer](self, "_invalidateExpansionAnimationScaleComponentLockoutTimer");
  -[SBCaptureHardwareButtonAppActivator _invalidateLaunchGracePeriodTimer](self, "_invalidateLaunchGracePeriodTimer");
  -[SBHardwareButtonLaunchPreludeAnimationToken cancel](self->_activeLaunchAnimationPreludeToken, "cancel");
  activeLaunchAnimationPreludeToken = self->_activeLaunchAnimationPreludeToken;
  self->_activeLaunchAnimationPreludeToken = 0;

  -[BSInvalidatable invalidate](self->_launchGracePeriodActiveAssertion, "invalidate");
  -[BSInvalidatable invalidate](self->_buttonDownActiveAssertion, "invalidate");
  self->_launchPendedDueToButtonDownWhileSuppressed = 0;
  self->_isWaitingForButtonUpToPerformLaunch = 0;
}

- (void)_launchCaptureApp
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  SBCameraActivationManager *activationManager;
  NSString *bundleIDForCurrentActivation;
  SBHardwareButtonLaunchPreludeAnimationToken *activeLaunchAnimationPreludeToken;
  id v15;
  SBHardwareButtonLaunchPreludeAnimationToken *v16;
  NSString *v17;
  NSString *prewarmedBundleIdentifier;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id buf;
  __int16 v24;
  int v25;
  const __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "_performBlockAfterCATransactionCommits:", &__block_literal_global_243);
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isUILocked") & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isLockScreenActive");
  +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "screenIsDim");

  if ((v4 & v6) == 1)
  {
    v26 = CFSTR("SBUIUnlockOptionsTurnOnScreenFirstKey");
    v27[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unlockUIFromSource:withOptions:", 40, v7);

  }
  SBLogCameraCaptureLaunch();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109376;
    HIDWORD(buf) = v4;
    v24 = 1024;
    v25 = v6;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Camera Capture App Activation Requested. Was UI-locked: %{BOOL}u, Was Dimmed: %{BOOL}u", (uint8_t *)&buf, 0xEu);
  }

  self->_waitingForActivationCompletion = 1;
  objc_initWeak(&buf, self);
  v9 = (void *)MEMORY[0x1E0D016E8];
  v10 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __56__SBCaptureHardwareButtonAppActivator__launchCaptureApp__block_invoke_54;
  v21[3] = &unk_1E8EB5DB0;
  objc_copyWeak(&v22, &buf);
  objc_msgSend(v9, "sentinelWithCompletion:", v21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  activationManager = self->_activationManager;
  bundleIDForCurrentActivation = self->_bundleIDForCurrentActivation;
  activeLaunchAnimationPreludeToken = self->_activeLaunchAnimationPreludeToken;
  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __56__SBCaptureHardwareButtonAppActivator__launchCaptureApp__block_invoke_57;
  v19[3] = &unk_1E8EA46E8;
  v15 = v11;
  v20 = v15;
  -[SBCameraActivationManager activateCaptureApplicationWithBundleID:URL:fromSource:withPreludeAnimationToken:completion:]((uint64_t)activationManager, bundleIDForCurrentActivation, 0, 0x46uLL, activeLaunchAnimationPreludeToken, v19);
  v16 = self->_activeLaunchAnimationPreludeToken;
  self->_activeLaunchAnimationPreludeToken = 0;

  v17 = self->_bundleIDForCurrentActivation;
  self->_bundleIDForCurrentActivation = 0;

  prewarmedBundleIdentifier = self->_prewarmedBundleIdentifier;
  self->_prewarmedBundleIdentifier = 0;

  objc_destroyWeak(&v22);
  objc_destroyWeak(&buf);

}

uint64_t __56__SBCaptureHardwareButtonAppActivator__launchCaptureApp__block_invoke()
{
  return kdebug_trace();
}

void __56__SBCaptureHardwareButtonAppActivator__launchCaptureApp__block_invoke_54(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v3, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      SBLogCameraCaptureLaunch();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __56__SBCaptureHardwareButtonAppActivator__launchCaptureApp__block_invoke_54_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);

    }
    v14 = objc_opt_class();
    v15 = v5;
    if (v14)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v16 = v15;
      else
        v16 = 0;
    }
    else
    {
      v16 = 0;
    }
    v17 = v16;

    v18 = objc_msgSend(v17, "BOOLValue");
    *((_BYTE *)WeakRetained + 262) = 0;
    v19 = objc_loadWeakRetained((id *)WeakRetained + 8);
    objc_msgSend(v19, "captureButtonAppActivatorLaunchDidComplete:", v18);

    if ((_DWORD)v18)
    {
      v20 = *((id *)WeakRetained + 30);
      if (objc_msgSend(v20, "enableCameraPose")
        && (unint64_t)objc_msgSend(v20, "cameraLaunchCounter") <= 0x13)
      {
        objc_msgSend(v20, "setCameraLaunchCounter:", objc_msgSend(v20, "cameraLaunchCounter") + 1);
      }

    }
  }

}

void __56__SBCaptureHardwareButtonAppActivator__launchCaptureApp__block_invoke_57(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  void *v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  SBLogCameraCaptureLaunch();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = a3;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Camera Capture App Activation Completed. success: %{BOOL}u", (uint8_t *)v8, 8u);
  }

  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "signalWithContext:", v7);

}

- (void)_takeButtonDownPowerAssertion
{
  id WeakRetained;
  BSInvalidatable *v4;
  BSInvalidatable *buttonDownActiveAssertion;
  _QWORD v6[4];
  id v7;
  id location;

  -[BSInvalidatable invalidate](self->_buttonDownActiveAssertion, "invalidate");
  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_scanningModeAssertionProvider);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__SBCaptureHardwareButtonAppActivator__takeButtonDownPowerAssertion__block_invoke;
  v6[3] = &unk_1E8EB5DD8;
  objc_copyWeak(&v7, &location);
  objc_msgSend(WeakRetained, "activeScanningModeAssertionForReason:exclusiveWithReasons:invalidationBlock:", CFSTR("kSBButtonScanningModeReasonButtonPressedDown"), 0, v6);
  v4 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  buttonDownActiveAssertion = self->_buttonDownActiveAssertion;
  self->_buttonDownActiveAssertion = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __68__SBCaptureHardwareButtonAppActivator__takeButtonDownPowerAssertion__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)WeakRetained[10];
  WeakRetained[10] = 0;

}

- (void)_takeLaunchGracePeriodPowerAssertion
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  BSInvalidatable *v7;
  BSInvalidatable *launchGracePeriodActiveAssertion;
  _QWORD v9[4];
  id v10;
  id location;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[BSInvalidatable invalidate](self->_launchGracePeriodActiveAssertion, "invalidate");
  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_scanningModeAssertionProvider);
  v4 = (void *)MEMORY[0x1E0C99E60];
  v12[0] = CFSTR("kSBButtonScanningModeReasonSceneRequestingEvents");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__SBCaptureHardwareButtonAppActivator__takeLaunchGracePeriodPowerAssertion__block_invoke;
  v9[3] = &unk_1E8EB5DD8;
  objc_copyWeak(&v10, &location);
  objc_msgSend(WeakRetained, "activeScanningModeAssertionForReason:exclusiveWithReasons:invalidationBlock:", CFSTR("kSBButtonScanningModeReasonButtonLaunchGracePeriod"), v6, v9);
  v7 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  launchGracePeriodActiveAssertion = self->_launchGracePeriodActiveAssertion;
  self->_launchGracePeriodActiveAssertion = v7;

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __75__SBCaptureHardwareButtonAppActivator__takeLaunchGracePeriodPowerAssertion__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)WeakRetained[11];
  WeakRetained[11] = 0;

}

- (void)_prewarmCameraForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *prewarmedBundleIdentifier;
  NSObject *v9;
  NSString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[3];
  _QWORD v17[3];
  uint8_t buf[4];
  SBCaptureHardwareButtonAppActivator *v19;
  __int16 v20;
  NSString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[SBCaptureApplicationCenter sharedInstance](SBCaptureApplicationCenter, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predictedPrewarmBundleIdentifierForApplicationBundleIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (NSString *)objc_msgSend(v6, "copy");
  prewarmedBundleIdentifier = self->_prewarmedBundleIdentifier;
  self->_prewarmedBundleIdentifier = v7;

  if (self->_prewarmedBundleIdentifier)
  {
    SBLogCameraCaptureLaunch();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = self->_prewarmedBundleIdentifier;
      *(_DWORD *)buf = 138543618;
      v19 = self;
      v20 = 2114;
      v21 = v10;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "(%{public}@) prewarming camera for bundleID: '%{public}@' ", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", mach_absolute_time());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", mach_continuous_time());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0C8A060];
    v14 = *MEMORY[0x1E0C8A0B8];
    v16[0] = *MEMORY[0x1E0C8A0A0];
    v16[1] = v14;
    v17[0] = v13;
    v17[1] = v11;
    v16[2] = *MEMORY[0x1E0C8A0C8];
    v17[2] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    AVCapturePrewarmWithOptions();

  }
}

- (void)_cancelCameraPrewarmForBundleIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t buf[4];
  SBCaptureHardwareButtonAppActivator *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogCameraCaptureLaunch();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v10 = self;
    v11 = 2114;
    v12 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "(%{public}@) cancelling prewarming camera for bundleID: '%{public}@' ", buf, 0x16u);
  }

  v7 = *MEMORY[0x1E0C8A0A0];
  v8 = *MEMORY[0x1E0C8A058];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1D17E1D28](v4, v6);

}

- (void)_updateStationaryState
{
  void *v3;
  BOOL v4;
  SBDeviceStationaryMotionDetector *stationaryDeviceMotionDetector;
  double v6;
  double v7;
  double v8;
  double v9;
  _QWORD v10[4];
  id v11;
  id location;

  self->_stationaryState = 0;
  if (!self->_disableStationaryDetection)
  {
    -[SBWindowScene lockScreenManager](self->_windowScene, "lockScreenManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isUILocked") & 1) != 0)
    {

    }
    else
    {
      v4 = -[SBCaptureButtonSettings enablesStationaryDetectionForUnlocked](self->_settings, "enablesStationaryDetectionForUnlocked");

      if (!v4)
        return;
    }
    objc_initWeak(&location, self);
    stationaryDeviceMotionDetector = self->_stationaryDeviceMotionDetector;
    -[SBCaptureButtonSettings accidentalPreventionStationaryThreshold](self->_settings, "accidentalPreventionStationaryThreshold");
    v7 = v6;
    -[SBCaptureButtonSettings accidentalPreventionPickUpBuffer](self->_settings, "accidentalPreventionPickUpBuffer");
    v9 = v8;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __61__SBCaptureHardwareButtonAppActivator__updateStationaryState__block_invoke;
    v10[3] = &unk_1E8EB5528;
    objc_copyWeak(&v11, &location);
    -[SBDeviceStationaryMotionDetector queryWithStationaryThresholdTime:pickUpBufferTime:callbackOnMainQueue:](stationaryDeviceMotionDetector, "queryWithStationaryThresholdTime:pickUpBufferTime:callbackOnMainQueue:", v10, v7, v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __61__SBCaptureHardwareButtonAppActivator__updateStationaryState__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setStationaryState:", a2);

}

- (void)_setStationaryState:(int64_t)a3
{
  self->_stationaryState = a3;
}

- (BOOL)_shouldSuppressStationary
{
  int64_t stationaryState;
  _BOOL4 v4;
  _BOOL4 v5;
  double v6;
  double v7;
  NSObject *v8;
  BOOL v9;
  NSObject *v10;
  int v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  stationaryState = self->_stationaryState;
  v4 = -[BSAbsoluteMachTimer isScheduled](self->_stationaryStateDebounceTimer, "isScheduled");
  v5 = v4;
  if (stationaryState == 1 && !v4)
  {
    -[SBCaptureButtonSettings stationaryDetectionDebounceInterval](self->_settings, "stationaryDetectionDebounceInterval");
    v7 = v6;
    SBLogCameraCaptureLaunch();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134217984;
      v13 = v7;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Setting up _stationaryStateDebounceTimer to disengage stationary check for the next %f seconds.", (uint8_t *)&v12, 0xCu);
    }

    -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](self->_stationaryStateDebounceTimer, "scheduleWithFireInterval:leewayInterval:queue:handler:", MEMORY[0x1E0C80D38], &__block_literal_global_63_2, v7, 0.0);
  }
  v9 = !v5;
  if (stationaryState == 1 && v5)
  {
    SBLogCameraCaptureLaunch();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "Stationary state ignored since _stationaryStateDebounceTimer is ongoing.", (uint8_t *)&v12, 2u);
    }

  }
  return stationaryState == 1 && v9;
}

void __64__SBCaptureHardwareButtonAppActivator__shouldSuppressStationary__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  SBLogCameraCaptureLaunch();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1D0540000, v0, OS_LOG_TYPE_DEFAULT, "_stationaryStateDebounceTimer expired, device stationary check engaged back.", v1, 2u);
  }

}

- (void)_beginObservingConsoleMode
{
  OUTLINED_FUNCTION_0_5(&dword_1D0540000, a2, a3, "failed to begin observing console mode. status: %{public}d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

uint64_t __65__SBCaptureHardwareButtonAppActivator__beginObservingConsoleMode__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_consoleModeDidChange");
}

- (void)_consoleModeDidChange
{
  OUTLINED_FUNCTION_0_5(&dword_1D0540000, a2, a3, "failed to read console mode. status: %{public}d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (id)_createCaptureButtonDefaultsObserver
{
  SBCaptureButtonDefaults *captureButtonDefaults;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id location;
  _QWORD v17[7];

  v17[6] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  captureButtonDefaults = self->_captureButtonDefaults;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "disableStationaryDetection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "disableWakeWhenDim");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "disableDirectLaunchAfterUnsuppress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v6;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "allowLaunchIfUnobstructionOccursWhileButtonDown");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v7;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "allowLaunchIfUnobstructionOccursPromptlyAfterButtonUp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v8;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "enableCameraPose");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C80D38];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __75__SBCaptureHardwareButtonAppActivator__createCaptureButtonDefaultsObserver__block_invoke;
  v14[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v15, &location);
  -[SBCaptureButtonDefaults observeDefaults:onQueue:withBlock:](captureButtonDefaults, "observeDefaults:onQueue:withBlock:", v10, MEMORY[0x1E0C80D38], v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  return v12;
}

void __75__SBCaptureHardwareButtonAppActivator__createCaptureButtonDefaultsObserver__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateCaptureButtonDefaults");

}

- (void)_updateCaptureButtonDefaults
{
  NSObject *v4;
  _BOOL4 disableStationaryDetection;
  NSObject *v6;
  _BOOL4 disableWakeWhenDim;
  NSObject *v8;
  _BOOL4 disableDirectLaunchAfterUnsuppress;
  NSObject *v10;
  _BOOL4 allowLaunchIfUnobstructedWhileButtonDown;
  BOOL v12;
  NSObject *v13;
  _BOOL4 allowLaunchIfUnobstructedPromptlyAfterButtonUp;
  NSObject *v15;
  _BOOL4 enableCameraPose;
  void *v17;
  int v18;
  _BOOL4 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  self->_disableStationaryDetection = -[SBCaptureButtonDefaults disableStationaryDetection](self->_captureButtonDefaults, "disableStationaryDetection");
  SBLogCameraCaptureLaunch();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    disableStationaryDetection = self->_disableStationaryDetection;
    v18 = 67109120;
    v19 = disableStationaryDetection;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "_disableStationaryDetection is %{BOOL}u", (uint8_t *)&v18, 8u);
  }

  self->_disableWakeWhenDim = -[SBCaptureButtonDefaults disableWakeWhenDim](self->_captureButtonDefaults, "disableWakeWhenDim");
  SBLogCameraCaptureLaunch();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    disableWakeWhenDim = self->_disableWakeWhenDim;
    v18 = 67109120;
    v19 = disableWakeWhenDim;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "_disableWakeWhenDim is %{BOOL}u", (uint8_t *)&v18, 8u);
  }

  self->_disableDirectLaunchAfterUnsuppress = -[SBCaptureButtonDefaults disableDirectLaunchAfterUnsuppress](self->_captureButtonDefaults, "disableDirectLaunchAfterUnsuppress");
  SBLogCameraCaptureLaunch();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    disableDirectLaunchAfterUnsuppress = self->_disableDirectLaunchAfterUnsuppress;
    v18 = 67109120;
    v19 = disableDirectLaunchAfterUnsuppress;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "_disableDirectLaunchAfterUnsuppress is %{BOOL}u", (uint8_t *)&v18, 8u);
  }

  self->_allowLaunchIfUnobstructedWhileButtonDown = -[SBCaptureButtonDefaults allowLaunchIfUnobstructionOccursWhileButtonDown](self->_captureButtonDefaults, "allowLaunchIfUnobstructionOccursWhileButtonDown");
  SBLogCameraCaptureLaunch();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    allowLaunchIfUnobstructedWhileButtonDown = self->_allowLaunchIfUnobstructedWhileButtonDown;
    v18 = 67109120;
    v19 = allowLaunchIfUnobstructedWhileButtonDown;
    _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "_allowLaunchIfUnobstructedWhileButtonDown is %{BOOL}u", (uint8_t *)&v18, 8u);
  }

  v12 = (-[SBCaptureButtonDefaults allowLaunchIfUnobstructionOccursPromptlyAfterButtonUp](self->_captureButtonDefaults, "allowLaunchIfUnobstructionOccursPromptlyAfterButtonUp") & 1) != 0|| self->_allowLaunchIfUnobstructedWhileButtonDown;
  self->_allowLaunchIfUnobstructedPromptlyAfterButtonUp = v12;
  SBLogCameraCaptureLaunch();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    allowLaunchIfUnobstructedPromptlyAfterButtonUp = self->_allowLaunchIfUnobstructedPromptlyAfterButtonUp;
    v18 = 67109120;
    v19 = allowLaunchIfUnobstructedPromptlyAfterButtonUp;
    _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "_allowLaunchIfUnobstructedPromptlyAfterButtonUp is %{BOOL}u", (uint8_t *)&v18, 8u);
  }

  if (!self->_allowLaunchIfUnobstructedWhileButtonDown && self->_allowLaunchIfUnobstructedPromptlyAfterButtonUp)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCaptureHardwareButtonAppActivator.m"), 815, CFSTR("Can't allow launch after button up if we don't allow launch during button down"));

  }
  self->_enableCameraPose = -[SBCaptureButtonDefaults enableCameraPose](self->_captureButtonDefaults, "enableCameraPose");
  SBLogCameraCaptureLaunch();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    enableCameraPose = self->_enableCameraPose;
    v18 = 67109120;
    v19 = enableCameraPose;
    _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "_enableCameraPose is %{BOOL}u", (uint8_t *)&v18, 8u);
  }

}

- (id)_poseCoachingText
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("CAPTURE_HARDWARE_BUTTON_COACHING_RAISE_TO_CLICK"), &stru_1E8EC7EC0, CFSTR("SpringBoard_Fall_2024_iOS"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_stationaryCoachingText
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("CAPTURE_HARDWARE_BUTTON_COACHING_SIGNLE_CLICK_STATIONARY"), &stru_1E8EC7EC0, CFSTR("SpringBoard_Fall_2024_iOS"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_isCoachingAllowed:(BOOL *)a3
{
  BOOL result;

  if ((unint64_t)-[SBCaptureButtonDefaults cameraLaunchCounter](self->_captureButtonDefaults, "cameraLaunchCounter") > 1)return self->_coachingBreatherTimer != 0;
  result = 1;
  *a3 = 1;
  return result;
}

- (void)_startCoachingAllowedTimer
{
  NSTimer *coachingBreatherTimer;
  void *v4;
  double v5;
  double v6;
  NSTimer *v7;
  NSTimer *v8;
  _QWORD v9[4];
  id v10;
  id location;

  -[NSTimer invalidate](self->_coachingBreatherTimer, "invalidate");
  coachingBreatherTimer = self->_coachingBreatherTimer;
  self->_coachingBreatherTimer = 0;

  objc_initWeak(&location, self);
  v4 = (void *)MEMORY[0x1E0C99E88];
  -[SBCaptureButtonSettings coachingUIPresentationAllowedTimeframe](self->_settings, "coachingUIPresentationAllowedTimeframe");
  v6 = v5;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__SBCaptureHardwareButtonAppActivator__startCoachingAllowedTimer__block_invoke;
  v9[3] = &unk_1E8E9FA90;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v4, "scheduledTimerWithTimeInterval:repeats:block:", 0, v9, v6);
  v7 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  v8 = self->_coachingBreatherTimer;
  self->_coachingBreatherTimer = v7;

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __65__SBCaptureHardwareButtonAppActivator__startCoachingAllowedTimer__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[29], "invalidate");
    v2 = v3[29];
    v3[29] = 0;

    WeakRetained = v3;
  }

}

- (BOOL)_isInSwitcher
{
  return self->_unlockedEnvironmentMode == 2;
}

- (BOOL)_isOverUnlockedApplication
{
  void *v2;
  int v3;

  if (self->_unlockedEnvironmentMode == 3)
  {
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isLockScreenActive") ^ 1;

  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)_isWithinDirectLaunchGracePeriod
{
  double v4;
  double v5;
  double v6;

  if (self->_disableDirectLaunchAfterUnsuppress || self->_lastUnsuppressEventTimestamp == 0.0)
    return 0;
  BSAbsoluteMachTimeNow();
  v5 = v4 - self->_lastUnsuppressEventTimestamp;
  -[SBCaptureButtonSettings directLaunchAfterUnsuppressGracePeriod](self->_settings, "directLaunchAfterUnsuppressGracePeriod");
  return v5 <= v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureButtonDefaultsObserver, 0);
  objc_storeStrong((id *)&self->_captureButtonDefaults, 0);
  objc_storeStrong((id *)&self->_coachingBreatherTimer, 0);
  objc_storeStrong((id *)&self->_coachingController, 0);
  objc_storeStrong((id *)&self->_stationaryStateDebounceTimer, 0);
  objc_storeStrong((id *)&self->_stationaryDeviceMotionDetector, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_hintDropletAssertion, 0);
  objc_storeStrong((id *)&self->_deferredLaunchAfterButtonUpGracePeriodTimer, 0);
  objc_storeStrong((id *)&self->_launchGracePeriodActiveTimer, 0);
  objc_storeStrong((id *)&self->_expansionAnimationScaleComponentLockoutTimer, 0);
  objc_storeStrong((id *)&self->_expansionAnimationYComponentLockoutTimer, 0);
  objc_storeStrong((id *)&self->_prewarmLockoutTimer, 0);
  objc_storeStrong((id *)&self->_launchGracePeriodActiveAssertion, 0);
  objc_storeStrong((id *)&self->_buttonDownActiveAssertion, 0);
  objc_storeStrong((id *)&self->_activeLaunchAnimationPreludeToken, 0);
  objc_destroyWeak((id *)&self->_scanningModeAssertionProvider);
  objc_storeStrong((id *)&self->_prewarmedBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIDForCurrentActivation, 0);
  objc_storeStrong((id *)&self->_authenticationController, 0);
  objc_storeStrong((id *)&self->_setupManager, 0);
  objc_storeStrong((id *)&self->_suppressionManager, 0);
  objc_storeStrong((id *)&self->_activationManager, 0);
  objc_storeStrong((id *)&self->_windowScene, 0);
}

void __56__SBCaptureHardwareButtonAppActivator__launchCaptureApp__block_invoke_54_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1D0540000, a1, a3, "Camera Capture App Activation Completed but SOMEONE FORGOT TO TELL US", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

@end
