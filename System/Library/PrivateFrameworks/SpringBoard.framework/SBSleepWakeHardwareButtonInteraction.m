@implementation SBSleepWakeHardwareButtonInteraction

- (SBSleepWakeHardwareButtonInteraction)init
{
  SBSleepWakeHardwareButtonInteraction *v2;
  uint64_t v3;
  SBBacklightController *backlightController;
  uint64_t v5;
  SBLockScreenManager *lockScreenManager;
  uint64_t v7;
  SBScreenWakeAnimationController *screenWakeAnimationController;
  uint64_t v9;
  SBSoundController *soundController;
  uint64_t v11;
  SBHIDUISensorModeController *sensorModeController;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SBSleepWakeHardwareButtonInteraction;
  v2 = -[SBSleepWakeHardwareButtonInteraction init](&v14, sel_init);
  if (v2)
  {
    +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    backlightController = v2->_backlightController;
    v2->_backlightController = (SBBacklightController *)v3;

    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v5 = objc_claimAutoreleasedReturnValue();
    lockScreenManager = v2->_lockScreenManager;
    v2->_lockScreenManager = (SBLockScreenManager *)v5;

    +[SBScreenWakeAnimationController sharedInstance](SBScreenWakeAnimationController, "sharedInstance");
    v7 = objc_claimAutoreleasedReturnValue();
    screenWakeAnimationController = v2->_screenWakeAnimationController;
    v2->_screenWakeAnimationController = (SBScreenWakeAnimationController *)v7;

    +[SBSoundController sharedInstance](SBSoundController, "sharedInstance");
    v9 = objc_claimAutoreleasedReturnValue();
    soundController = v2->_soundController;
    v2->_soundController = (SBSoundController *)v9;

    objc_msgSend((id)SBApp, "HIDUISensorController");
    v11 = objc_claimAutoreleasedReturnValue();
    sensorModeController = v2->_sensorModeController;
    v2->_sensorModeController = (SBHIDUISensorModeController *)v11;

    objc_storeStrong((id *)&v2->_SBApp, (id)SBApp);
  }
  return v2;
}

- (BOOL)reverseSleepIfNeededAndPossible
{
  _BOOL4 fadeOutInProgressFromLockButtonWhileUnlocked;
  NSObject *v4;
  SBLockScreenManager *lockScreenManager;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v10[8];
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  fadeOutInProgressFromLockButtonWhileUnlocked = self->_fadeOutInProgressFromLockButtonWhileUnlocked;
  if (self->_fadeOutInProgressFromLockButtonWhileUnlocked)
  {
    self->_undidFadeOutFromLockButton = 1;
    SBLogButtonsInteraction();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "reverse sleep", v10, 2u);
    }

    -[SBLockScreenManager lockUIFromSource:withOptions:](self->_lockScreenManager, "lockUIFromSource:withOptions:", 1, 0);
    lockScreenManager = self->_lockScreenManager;
    v11[0] = CFSTR("SBUIUnlockOptionsTurnOnScreenFirstKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    v11[1] = CFSTR("SBUIUnlockOptionsStartFadeInAnimation");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBLockScreenManager unlockUIFromSource:withOptions:](lockScreenManager, "unlockUIFromSource:withOptions:", 1, v8);

    self->_undidFadeOutFromLockButton = 0;
  }
  return fadeOutInProgressFromLockButtonWhileUnlocked;
}

- (void)performSleepForReason:(id)a3
{
  id v4;
  _BOOL4 inhibitNextSinglePressUp;
  NSObject *v6;
  _BOOL4 v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  inhibitNextSinglePressUp = self->_inhibitNextSinglePressUp;
  SBLogButtonsInteraction();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (inhibitNextSinglePressUp)
  {
    if (v7)
    {
      v8 = 138543362;
      v9 = v4;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "ignoring sleep attempt (%{public}@) because a wake from button press is in progress", (uint8_t *)&v8, 0xCu);
    }

  }
  else
  {
    if (v7)
    {
      v8 = 138543362;
      v9 = v4;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "sleeping (%{public}@)", (uint8_t *)&v8, 0xCu);
    }

    -[SBSleepWakeHardwareButtonInteraction _performSleep](self, "_performSleep");
  }

}

- (BOOL)consumeInitialPressDown
{
  _BOOL4 v3;
  void *v4;
  int64_t v5;

  self->_inhibitNextSinglePressUp = 0;
  v3 = -[SBBacklightController screenIsDim](self->_backlightController, "screenIsDim");
  +[SBAlwaysOnDomain rootSettings](SBAlwaysOnDomain, "rootSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "sideButtonBehavior") == 1)
  {
    v5 = -[SBBacklightController backlightState](self->_backlightController, "backlightState");

    if (v5 == 3 || !v3)
      return 0;
  }
  else
  {

    if (!v3)
      return 0;
  }
  -[SBSleepWakeHardwareButtonInteraction _performWake](self, "_performWake");
  return 1;
}

- (BOOL)consumeSinglePressUp
{
  _BOOL4 inhibitNextSinglePressUp;
  NSObject *v4;
  _BOOL4 v5;
  uint8_t v7[16];
  uint8_t buf[16];

  inhibitNextSinglePressUp = self->_inhibitNextSinglePressUp;
  SBLogButtonsInteraction();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (inhibitNextSinglePressUp)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "wake/sleep consumeSinglePressUp: ignored due to _inhibitNextSinglePressUp (we may be waking the device instead)", buf, 2u);
    }

  }
  else
  {
    if (v5)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "wake/sleep _performSleep", v7, 2u);
    }

    -[SBSleepWakeHardwareButtonInteraction _performSleep](self, "_performSleep");
  }
  return 1;
}

- (void)provider:(id)a3 didUpdateButtonGestureParameters:(id)a4
{
  objc_msgSend(a4, "multiplePressTimeInterval", a3);
  -[SBSleepWakeHardwareButtonInteraction setMultiplePressTimeInterval:](self, "setMultiplePressTimeInterval:");
}

- (void)_performWake
{
  NSObject *v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  SBLockScreenManager *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  _BOOL4 v13;
  _QWORD v14[2];
  _QWORD v15[2];
  uint8_t buf[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (-[SpringBoard shouldNeverLock](self->_SBApp, "shouldNeverLock"))
  {
    SBLogButtonsInteraction();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "performWake: ignoring because -[SBApp shouldNeverLock]", buf, 2u);
    }

    -[SBBacklightController screenIsDim](self->_backlightController, "screenIsDim");
    return;
  }
  if (!-[SBBacklightController screenIsDim](self->_backlightController, "screenIsDim"))
  {
    SBLogButtonsInteraction();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v5 = "performWake: ignoring because the screen is not dimmed";
      goto LABEL_11;
    }
LABEL_12:

    return;
  }
  if (-[SpringBoard caseIsEnabledAndLatched](self->_SBApp, "caseIsEnabledAndLatched"))
  {
    SBLogButtonsInteraction();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v5 = "performWake: ignoring because case is on and closed";
LABEL_11:
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, v5, buf, 2u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (!-[SBSleepWakeHardwareButtonInteraction reverseSleepIfNeededAndPossible](self, "reverseSleepIfNeededAndPossible"))
  {
    -[SBBacklightController setBacklightState:source:](self->_backlightController, "setBacklightState:source:", 3, 3);
    v7 = self->_lockScreenManager;
    if (-[SBLockScreenManager isUILocked](v7, "isUILocked"))
    {
      SBLogButtonsInteraction();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v17 = 1;
        _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "performWake: Unlocking from lock button source with fade-in animation: %d", buf, 8u);
      }

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1, CFSTR("SBUIUnlockOptionsTurnOnScreenFirstKey"));
      v9 = objc_claimAutoreleasedReturnValue();
      v15[0] = v9;
      v14[1] = CFSTR("SBUIUnlockOptionsStartFadeInAnimation");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15[1] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBLockScreenManager unlockUIFromSource:withOptions:](v7, "unlockUIFromSource:withOptions:", 1, v11);

    }
    else
    {
      v12 = -[SBSleepWakeHardwareButtonInteraction isSOSGestureActive](self, "isSOSGestureActive");
      SBLogButtonsInteraction();
      v9 = objc_claimAutoreleasedReturnValue();
      v13 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (!v12)
      {
        if (v13)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "performWake: locking UI from lock button source.", buf, 2u);
        }

        -[SBLockScreenManager lockUIFromSource:withOptions:](self->_lockScreenManager, "lockUIFromSource:withOptions:", 1, 0);
        goto LABEL_29;
      }
      if (v13)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "performWake: aborting locking UI because the SOS gesture is active", buf, 2u);
      }
    }

LABEL_29:
    self->_inhibitNextSinglePressUp = 1;

    return;
  }
  SBLogButtonsInteraction();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "performWake: ended fade-out to lock early, and told the screen to fade-in back in right away.", buf, 2u);
  }

  self->_inhibitNextSinglePressUp = 1;
}

- (void)_performSleep
{
  SBLockScreenManager *v3;
  NSObject *v4;
  const char *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id buf[2];

  v3 = self->_lockScreenManager;
  if (-[SpringBoard shouldNeverLock](self->_SBApp, "shouldNeverLock"))
  {
    SBLogButtonsInteraction();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      v5 = "performSleep: ignored due to [SBApp shouldNeverLock]";
LABEL_10:
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)buf, 2u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (-[SpringBoard caseIsEnabledAndLatched](self->_SBApp, "caseIsEnabledAndLatched"))
  {
    SBLogButtonsInteraction();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      v5 = "performSleep: ignored due to [SBApp caseIsEnabledAndLatched]";
      goto LABEL_10;
    }
LABEL_11:

    goto LABEL_12;
  }
  if (-[SBSleepWakeHardwareButtonInteraction isSOSGestureActive](self, "isSOSGestureActive"))
  {
    SBLogButtonsInteraction();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      v5 = "performSleep: ignored due to isSOSGestureActive";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v6 = !+[SBInCallPresentationManager isSpecializedAPISupported](SBInCallPresentationManager, "isSpecializedAPISupported")&& -[SBLockScreenManager shouldLockUIAfterEndingCall](v3, "shouldLockUIAfterEndingCall");
  -[SBSleepWakeHardwareButtonInteraction _playLockSound](self, "_playLockSound");
  objc_msgSend((id)SBApp, "bannerManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dismissAllBannersInAllWindowScenesAnimated:reason:", 1, CFSTR("performSleep"));

  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "inCallPresentationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "supportsHandlingDeviceLock") & 1) != 0)
  {

LABEL_19:
    SBLogButtonsInteraction();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "performSleep: in call supports handling device lock, passing to lock screen manager", (uint8_t *)buf, 2u);
    }

    -[SBLockScreenManager lockUIFromSource:withOptions:](v3, "lockUIFromSource:withOptions:", 1, 0);
    goto LABEL_12;
  }
  v10 = v6 & ~+[SBInCallPresentationManager isSpecializedAPISupported](SBInCallPresentationManager, "isSpecializedAPISupported");

  if ((v10 & 1) != 0)
    goto LABEL_19;
  v12 = -[SBScreenWakeAnimationController isWakeAnimationInProgressForSource:](self->_screenWakeAnimationController, "isWakeAnimationInProgressForSource:", 20);
  SBLogButtonsInteraction();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "performSleep: swallowing lock button press because we are in the process of fading in for LTW", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    if (v14)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "performSleep: locking the device with lock button source and animating fade-out", (uint8_t *)buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SBLockForScreenFadeOut-%i"), ++_performSleep_lockReasonCount);
    v13 = objc_claimAutoreleasedReturnValue();
    -[SpringBoard authenticationController](self->_SBApp, "authenticationController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    self->_fadeOutInProgressFromLockButtonWhileUnlocked = objc_msgSend(v15, "isAuthenticated");

    -[SpringBoard deviceOrientationUpdateDeferralAssertionWithReason:](self->_SBApp, "deviceOrientationUpdateDeferralAssertionWithReason:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSleepWakeHardwareButtonInteraction setDeferOrientationUpdatesAssertion:](self, "setDeferOrientationUpdatesAssertion:", v16);

    SBLogButtonsInteraction();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "performSleep: start sleep", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    objc_msgSend((id)SBApp, "screenSleepCoordinator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __53__SBSleepWakeHardwareButtonInteraction__performSleep__block_invoke;
    v19[3] = &unk_1E8E9DF28;
    objc_copyWeak(&v20, buf);
    objc_msgSend(v18, "sleepAndLockUIFromSource:completion:", 1, v19);

    objc_destroyWeak(&v20);
    objc_destroyWeak(buf);
  }

LABEL_12:
}

void __53__SBSleepWakeHardwareButtonInteraction__performSleep__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setFadeOutInProgressFromLockButtonWhileUnlocked:", 0);
  objc_msgSend(WeakRetained, "setDeferOrientationUpdatesAssertion:", 0);

}

- (void)setDeferOrientationUpdatesAssertion:(id)a3
{
  BSInvalidatable *v5;
  BSInvalidatable *v6;
  BSInvalidatable **p_deferOrientationUpdatesAssertion;
  BSInvalidatable *deferOrientationUpdatesAssertion;
  BSInvalidatable *v9;

  v5 = (BSInvalidatable *)a3;
  deferOrientationUpdatesAssertion = self->_deferOrientationUpdatesAssertion;
  p_deferOrientationUpdatesAssertion = &self->_deferOrientationUpdatesAssertion;
  v6 = deferOrientationUpdatesAssertion;
  if (deferOrientationUpdatesAssertion != v5)
  {
    v9 = v5;
    if (v6)
      -[BSInvalidatable invalidate](v6, "invalidate");
    objc_storeStrong((id *)p_deferOrientationUpdatesAssertion, a3);
    v5 = v9;
  }

}

- (void)_playLockSound
{
  _BOOL4 v2;
  NSObject *v3;
  _BOOL4 v4;
  const char *v5;
  uint8_t *v6;
  __int16 v7;
  __int16 v8;

  v2 = -[SBLockScreenManager playLockSoundIfPermitted](self->_lockScreenManager, "playLockSoundIfPermitted");
  SBLogButtonsInteraction();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v8 = 0;
      v5 = "_playLockSound is playing the lock sound";
      v6 = (uint8_t *)&v8;
LABEL_6:
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
    }
  }
  else if (v4)
  {
    v7 = 0;
    v5 = "_playLockSound couldn't play the lock sound";
    v6 = (uint8_t *)&v7;
    goto LABEL_6;
  }

}

- (BOOL)inhibitNextSinglePressUp
{
  return self->_inhibitNextSinglePressUp;
}

- (void)setInhibitNextSinglePressUp:(BOOL)a3
{
  self->_inhibitNextSinglePressUp = a3;
}

- (BOOL)isSOSGestureActive
{
  return self->_SOSGestureActive;
}

- (void)setSOSGestureActive:(BOOL)a3
{
  self->_SOSGestureActive = a3;
}

- (SBBacklightController)backlightController
{
  return self->_backlightController;
}

- (void)setBacklightController:(id)a3
{
  objc_storeStrong((id *)&self->_backlightController, a3);
}

- (SBLockScreenManager)lockScreenManager
{
  return self->_lockScreenManager;
}

- (void)setLockScreenManager:(id)a3
{
  objc_storeStrong((id *)&self->_lockScreenManager, a3);
}

- (SBScreenWakeAnimationController)screenWakeAnimationController
{
  return self->_screenWakeAnimationController;
}

- (void)setScreenWakeAnimationController:(id)a3
{
  objc_storeStrong((id *)&self->_screenWakeAnimationController, a3);
}

- (SBSoundController)soundController
{
  return self->_soundController;
}

- (void)setSoundController:(id)a3
{
  objc_storeStrong((id *)&self->_soundController, a3);
}

- (SBHIDUISensorModeController)sensorModeController
{
  return self->_sensorModeController;
}

- (void)setSensorModeController:(id)a3
{
  objc_storeStrong((id *)&self->_sensorModeController, a3);
}

- (SpringBoard)SBApp
{
  return self->_SBApp;
}

- (void)setSBApp:(id)a3
{
  objc_storeStrong((id *)&self->_SBApp, a3);
}

- (double)multiplePressTimeInterval
{
  return self->_multiplePressTimeInterval;
}

- (void)setMultiplePressTimeInterval:(double)a3
{
  self->_multiplePressTimeInterval = a3;
}

- (BOOL)fadeOutInProgressFromLockButtonWhileUnlocked
{
  return self->_fadeOutInProgressFromLockButtonWhileUnlocked;
}

- (void)setFadeOutInProgressFromLockButtonWhileUnlocked:(BOOL)a3
{
  self->_fadeOutInProgressFromLockButtonWhileUnlocked = a3;
}

- (BOOL)undidFadeOutFromLockButton
{
  return self->_undidFadeOutFromLockButton;
}

- (void)setUndidFadeOutFromLockButton:(BOOL)a3
{
  self->_undidFadeOutFromLockButton = a3;
}

- (BSInvalidatable)deferOrientationUpdatesAssertion
{
  return self->_deferOrientationUpdatesAssertion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferOrientationUpdatesAssertion, 0);
  objc_storeStrong((id *)&self->_SBApp, 0);
  objc_storeStrong((id *)&self->_sensorModeController, 0);
  objc_storeStrong((id *)&self->_soundController, 0);
  objc_storeStrong((id *)&self->_screenWakeAnimationController, 0);
  objc_storeStrong((id *)&self->_lockScreenManager, 0);
  objc_storeStrong((id *)&self->_backlightController, 0);
}

@end
