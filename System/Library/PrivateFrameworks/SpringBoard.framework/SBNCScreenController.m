@implementation SBNCScreenController

- (SBNCScreenController)init
{
  -[SBNCScreenController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (SBNCScreenController)initWithBackLightController:(id)a3 lockScreenManager:(id)a4 lockStateAggregator:(id)a5
{
  id v9;
  id v10;
  id v11;
  SBNCScreenController *v12;
  CMPocketStateManager *v13;
  CMPocketStateManager *pocketStateManager;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SBNCScreenController;
  v12 = -[SBNCScreenController init](&v16, sel_init);
  if (v12)
  {
    v13 = (CMPocketStateManager *)objc_alloc_init(MEMORY[0x1E0CA56A8]);
    pocketStateManager = v12->_pocketStateManager;
    v12->_pocketStateManager = v13;

    -[CMPocketStateManager setDelegate:](v12->_pocketStateManager, "setDelegate:", v12);
    v12->_powerAssertionID = 0;
    objc_storeStrong((id *)&v12->_backlightController, a3);
    objc_storeStrong((id *)&v12->_lockScreenManager, a4);
    objc_storeStrong((id *)&v12->_lockStateAggregator, a5);
  }

  return v12;
}

- (BOOL)canTurnOnScreenForNotificationRequest:(id)a3
{
  id v4;
  uint64_t v5;
  int v6;
  void *v7;
  int v8;
  _BOOL4 v9;
  _QWORD *v10;
  _QWORD *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  _BOOL4 v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  int v28;
  int v29;
  void *v30;
  NSObject *log;
  void *v32;
  void *v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  _BOOL4 v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  __int16 v44;
  int v45;
  __int16 v46;
  _BOOL4 v47;
  __int16 v48;
  int v49;
  __int16 v50;
  int v51;
  __int16 v52;
  int v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "options");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend((id)v5, "canTurnOnDisplay");

  LODWORD(v5) = objc_msgSend((id)SBApp, "caseIsEnabledAndLatched");
  -[SBNCScreenController lockScreenManager](self, "lockScreenManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 & ((v5 | objc_msgSend(v7, "isInLostMode")) ^ 1);

  v9 = -[SBNCScreenController _isDeviceUILocked](self, "_isDeviceUILocked");
  v10 = (_QWORD *)MEMORY[0x1E0DC60B8];
  v11 = (_QWORD *)MEMORY[0x1E0DC60D0];
  if (v9)
  {
    objc_msgSend(v4, "options");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "alertsWhenLocked");

    objc_msgSend(v4, "requestDestinations");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v13 & objc_msgSend(v14, "containsObject:", *v11);
  }
  else
  {
    objc_msgSend(v4, "requestDestinations");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "containsObject:", *v10);
  }

  v16 = v8 & v15;
  v17 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    log = v17;
    objc_msgSend(v4, "notificationIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "un_logDigest");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "options");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v32, "canTurnOnDisplay");
    v28 = objc_msgSend((id)SBApp, "caseIsEnabledAndLatched");
    -[SBNCScreenController lockScreenManager](self, "lockScreenManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v30, "isInLostMode");
    v20 = -[SBNCScreenController _isDeviceUILocked](self, "_isDeviceUILocked");
    objc_msgSend(v4, "options");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "alertsWhenLocked");
    objc_msgSend(v4, "requestDestinations");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "containsObject:", *v11);
    objc_msgSend(v4, "requestDestinations");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "containsObject:", *MEMORY[0x1E0DC60B8]);
    *(_DWORD *)buf = 138545666;
    v35 = v18;
    v36 = 1024;
    v37 = v16;
    v38 = 1024;
    v39 = v4 != 0;
    v40 = 1024;
    v41 = v29;
    v42 = 1024;
    v43 = v28;
    v44 = 1024;
    v45 = v19;
    v46 = 1024;
    v47 = v20;
    v48 = 1024;
    v49 = v22;
    v50 = 1024;
    v51 = v24;
    v52 = 1024;
    v53 = v26;
    _os_log_impl(&dword_1D0540000, log, OS_LOG_TYPE_DEFAULT, "Screen can be turned on for notification %{public}@: %d [ hasRequest: %d canTurnOnDisplay: %d caseIsEnabledAndLatched: %d isInLostMode: %d isDeviceUILocked: %d alertsWhenLocked: %d sentToLockScreenDestination: %d sentToBannerDestination: %d ]", buf, 0x42u);

  }
  return v16;
}

- (void)turnOnScreenForNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  int v15;
  void *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    objc_msgSend(v4, "notificationIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "un_logDigest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "options");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "overridesPocketMode");
    -[SBNCScreenController backlightController](self, "backlightController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = v8;
    v17 = 1024;
    v18 = v10;
    v19 = 1024;
    v20 = objc_msgSend(v11, "screenIsOn");
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Turn on screen for notification %{public}@ [ overridesPocketMode: %d screenIsOn: %d ]", (uint8_t *)&v15, 0x18u);

  }
  objc_msgSend(v4, "options");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "overridesPocketMode"))
  {

  }
  else
  {
    -[SBNCScreenController backlightController](self, "backlightController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "screenIsOn");

    if ((v14 & 1) == 0)
    {
      -[SBNCScreenController _turnOnScreenForPocketMode](self, "_turnOnScreenForPocketMode");
      goto LABEL_8;
    }
  }
  -[SBNCScreenController _turnOnScreen](self, "_turnOnScreen");
LABEL_8:

}

- (void)turnOnScreenIfPossibleForNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SBNCScreenController canTurnOnScreenForNotificationRequest:](self, "canTurnOnScreenForNotificationRequest:", v4))
  {
    objc_msgSend(v4, "alertOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "shouldSuppress");

    if (v6)
    {
      v7 = (void *)*MEMORY[0x1E0DC5F70];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
      {
        v8 = v7;
        objc_msgSend(v4, "notificationIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "un_logDigest");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138543362;
        v12 = v10;
        _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Screen cannot be turned on for notification %{public}@ because DND suppressed it", (uint8_t *)&v11, 0xCu);

      }
    }
    else
    {
      -[SBNCScreenController turnOnScreenForNotificationRequest:](self, "turnOnScreenForNotificationRequest:", v4);
    }
  }

}

- (void)resetAutomaticLockStateForNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "preventsAutomaticLock");

  if (v6)
  {
    v7 = (void *)*MEMORY[0x1E0DC5F70];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      objc_msgSend(v4, "notificationIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "un_logDigest");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Reset idle timer for notification %{public}@", (uint8_t *)&v12, 0xCu);

    }
    +[SBIdleTimerGlobalCoordinator sharedInstance](SBIdleTimerGlobalCoordinator, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resetIdleTimerIfNonConsecutiveSource:forReason:", self, CFSTR("NCNotificationRequest"));

  }
}

- (void)_turnOnScreen
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[2];
  uint8_t buf[4];
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[SBNCScreenController _isDeviceUILocked](self, "_isDeviceUILocked"))
  {
    -[SBNCScreenController backlightController](self, "backlightController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "screenIsOn") ^ 1;

    SBLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v14 = v4;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Reset idle timer [ doFadeIn: %d ]", buf, 8u);
    }

    -[SBNCScreenController lockScreenManager](self, "lockScreenManager");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1, CFSTR("SBUIUnlockOptionsTurnOnScreenFirstKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v7;
    v11[1] = CFSTR("SBUIUnlockOptionsStartFadeInAnimation");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject unlockUIFromSource:withOptions:](v6, "unlockUIFromSource:withOptions:", 10, v9);

  }
  else
  {
    SBLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Reset idle timer", buf, 2u);
    }
  }

  +[SBIdleTimerGlobalCoordinator sharedInstance](SBIdleTimerGlobalCoordinator, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resetIdleTimerIfNonConsecutiveSource:forReason:", self, CFSTR("NCNotificationTurnOnScreen"));

}

- (void)_turnOnScreenForPocketMode
{
  NSObject *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[16];

  SBLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "PocketStateManager: query state", buf, 2u);
  }

  -[SBNCScreenController pocketStateManager](self, "pocketStateManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBNCScreenController backlightController](self, "backlightController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultLockScreenDimIntervalWhenNotificationsPresent");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__SBNCScreenController__turnOnScreenForPocketMode__block_invoke;
  v6[3] = &unk_1E8EA3440;
  v6[4] = self;
  objc_msgSend(v4, "queryStateOntoQueue:andMonitorFor:withTimeout:andHandler:", MEMORY[0x1E0C80D38], v6);

}

void __50__SBNCScreenController__turnOnScreenForPocketMode__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  SBLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v7 = 134217984;
    v8 = a2;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "PocketStateManager: query responded with state: %ld", (uint8_t *)&v7, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  if ((a2 & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    objc_msgSend(v5, "backlightController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "defaultLockScreenDimIntervalWhenNotificationsPresent");
    objc_msgSend(v5, "_turnOnScreenForOutOfPocketEventBeforeTimeInterval:");

  }
  else
  {
    objc_msgSend(v5, "_turnOnScreen");
  }
}

- (BOOL)_isDeviceUILocked
{
  void *v2;
  char v3;

  -[SBNCScreenController lockStateAggregator](self, "lockStateAggregator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasAnyLockState");

  return v3;
}

- (void)_turnOnScreenForOutOfPocketEventBeforeTimeInterval:(double)a3
{
  NSObject *v5;
  int v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  SBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = a3;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "PocketStateManager: turn on screen for out of pocket event before %lf", (uint8_t *)&v6, 0xCu);
  }

  self->_turnOnScreenForOutOfPocketEvent = 1;
  -[SBNCScreenController _createOrResetPowerAssertionWithTimeout:](self, "_createOrResetPowerAssertionWithTimeout:", a3);
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__cancelTurnOnScreenForOutOfPocketEvents, 0);
  -[SBNCScreenController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__cancelTurnOnScreenForOutOfPocketEvents, 0, a3);
}

- (void)_cancelTurnOnScreenForOutOfPocketEvents
{
  -[SBNCScreenController _releasePowerAssertion](self, "_releasePowerAssertion");
  self->_turnOnScreenForOutOfPocketEvent = 0;
}

- (void)_turnOnScreenForOutOfPocketEventIfNecessary
{
  NSObject *v3;
  uint8_t v4[16];

  if (self->_turnOnScreenForOutOfPocketEvent)
  {
    SBLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "PocketStateManager: turn on screen for out of pocket event", v4, 2u);
    }

    -[SBNCScreenController _turnOnScreen](self, "_turnOnScreen");
    -[SBNCScreenController _cancelTurnOnScreenForOutOfPocketEvents](self, "_cancelTurnOnScreenForOutOfPocketEvents");
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__cancelTurnOnScreenForOutOfPocketEvents, 0);
  }
}

- (void)_createOrResetPowerAssertionWithTimeout:(double)a3
{
  NSObject *v5;
  NSString *powerAssertionName;
  id v7;
  NSString *v8;
  NSObject *v9;
  void *v10;
  const __CFDictionary *v11;
  IOReturn v12;
  uint64_t *p_powerAssertionName;
  NSObject *v14;
  _QWORD v15[4];
  _QWORD v16[4];
  uint8_t buf[4];
  NSString *v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->_powerAssertionID)
  {
    SBLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      powerAssertionName = self->_powerAssertionName;
      *(_DWORD *)buf = 138543618;
      v18 = powerAssertionName;
      v19 = 2048;
      v20 = a3;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Extending an existing power assertion with name %{public}@ and timeout: %f - so we keep the device awake while we wait to see if it is removed from the pocket", buf, 0x16u);
    }

    IOPMAssertionSetProperty(self->_powerAssertionID, CFSTR("TimeoutSeconds"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3));
  }
  else
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3940]);
    v8 = (NSString *)objc_msgSend(v7, "initWithFormat:", CFSTR("com.apple.springboard.pocketNotification.%d"), ++_createOrResetPowerAssertionWithTimeout__count);
    SBLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v18 = v8;
      v19 = 2048;
      v20 = a3;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "About to take out a power assertion with name %{public}@ and timeout: %f - so we keep the device awake while we wait to see if it is removed from the pocket", buf, 0x16u);
    }

    v15[0] = CFSTR("AssertType");
    v15[1] = CFSTR("AssertLevel");
    *(_DWORD *)buf = 0;
    v16[0] = CFSTR("NoIdleSleepAssertion");
    v16[1] = &unk_1E91D0A10;
    v16[2] = v8;
    v15[2] = CFSTR("AssertName");
    v15[3] = CFSTR("TimeoutSeconds");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[3] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
    v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    v12 = IOPMAssertionCreateWithProperties(v11, (IOPMAssertionID *)buf);
    -[SBNCScreenController _releasePowerAssertion](self, "_releasePowerAssertion");
    p_powerAssertionName = (uint64_t *)&self->_powerAssertionName;
    objc_storeStrong((id *)&self->_powerAssertionName, v8);
    self->_powerAssertionID = *(_DWORD *)buf;
    if (v12)
    {
      SBLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[SBNCScreenController _createOrResetPowerAssertionWithTimeout:].cold.1(p_powerAssertionName, v12, v14);

    }
  }
}

- (void)_releasePowerAssertion
{
  NSObject *v3;
  NSString *powerAssertionName;
  NSString *v5;
  int v6;
  NSString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_powerAssertionID)
  {
    SBLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      powerAssertionName = self->_powerAssertionName;
      v6 = 138412290;
      v7 = powerAssertionName;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Releasing power assertion: %@", (uint8_t *)&v6, 0xCu);
    }

    IOPMAssertionRelease(self->_powerAssertionID);
    self->_powerAssertionID = 0;
    v5 = self->_powerAssertionName;
    self->_powerAssertionName = 0;

  }
}

- (void)pocketStateManager:(id)a3 didUpdateState:(int64_t)a4
{
  NSObject *v5;
  uint8_t buf[4];
  int64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  SBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v7 = a4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "pocketStateManager:didUpdateState:%ld", buf, 0xCu);
  }

  if ((objc_msgSend(MEMORY[0x1E0CA56A8], "_sb_isScreenObscuredInPocketState:", a4) & 1) == 0)
    BSDispatchMain();
}

uint64_t __58__SBNCScreenController_pocketStateManager_didUpdateState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_turnOnScreenForOutOfPocketEventIfNecessary");
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

- (SBLockStateAggregator)lockStateAggregator
{
  return self->_lockStateAggregator;
}

- (void)setLockStateAggregator:(id)a3
{
  objc_storeStrong((id *)&self->_lockStateAggregator, a3);
}

- (CMPocketStateManager)pocketStateManager
{
  return self->_pocketStateManager;
}

- (void)setPocketStateManager:(id)a3
{
  objc_storeStrong((id *)&self->_pocketStateManager, a3);
}

- (BOOL)turnOnScreenForOutOfPocketEvent
{
  return self->_turnOnScreenForOutOfPocketEvent;
}

- (void)setTurnOnScreenForOutOfPocketEvent:(BOOL)a3
{
  self->_turnOnScreenForOutOfPocketEvent = a3;
}

- (NSString)powerAssertionName
{
  return self->_powerAssertionName;
}

- (void)setPowerAssertionName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unsigned)powerAssertionID
{
  return self->_powerAssertionID;
}

- (void)setPowerAssertionID:(unsigned int)a3
{
  self->_powerAssertionID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerAssertionName, 0);
  objc_storeStrong((id *)&self->_pocketStateManager, 0);
  objc_storeStrong((id *)&self->_lockStateAggregator, 0);
  objc_storeStrong((id *)&self->_lockScreenManager, 0);
  objc_storeStrong((id *)&self->_backlightController, 0);
}

- (void)_createOrResetPowerAssertionWithTimeout:(os_log_t)log .cold.1(uint64_t *a1, int a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138543618;
  v5 = v3;
  v6 = 1024;
  v7 = a2;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "Unable to take power assertion with name %{public}@ - returned %#x", (uint8_t *)&v4, 0x12u);
}

@end
