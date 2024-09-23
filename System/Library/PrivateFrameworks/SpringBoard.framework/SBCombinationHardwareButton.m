@implementation SBCombinationHardwareButton

- (SBCombinationHardwareButton)initWithScreenshotGestureRecognizer:(id)a3 shutdownGestureRecognizer:(id)a4 homeHardwareButton:(id)a5 lockHardwareButton:(id)a6 volumeHardwareButton:(id)a7 proximitySensorManager:(id)a8 backlightController:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  SBCombinationHardwareButton *v22;
  SBCombinationHardwareButton *v23;
  SBCombinationHardwareButtonActions *v24;
  SBCombinationHardwareButtonActions *buttonActions;
  void *v26;
  double v27;
  double v28;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v30;
  id v32;
  objc_super v33;

  v16 = a3;
  v32 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v33.receiver = self;
  v33.super_class = (Class)SBCombinationHardwareButton;
  v22 = -[SBCombinationHardwareButton init](&v33, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_screenshotGestureRecognizer, a3);
    objc_storeStrong((id *)&v23->_shutdownGestureRecognizer, a4);
    objc_storeWeak((id *)&v23->_proximitySensorManager, v20);
    objc_storeWeak((id *)&v23->_backlightController, v21);
    v24 = objc_alloc_init(SBCombinationHardwareButtonActions);
    buttonActions = v23->_buttonActions;
    v23->_buttonActions = v24;

    objc_msgSend(v18, "hardwareButtonGestureParameters");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "longPressTimeInterval");
    v28 = v27;

    objc_msgSend(v16, "setMaximumClickFormationDuration:", v28);
    objc_msgSend(v16, "setMaximumClickDownDuration:", -1.0);
    objc_msgSend(v16, "setAllPressesUpRequired:", 0);
    objc_storeWeak((id *)&v23->_homeHardwareButton, v17);
    objc_storeWeak((id *)&v23->_volumeHardwareButton, v19);
    objc_storeWeak((id *)&v23->_lockHardwareButton, v18);
    objc_msgSend(v18, "addHardwareButtonGestureParametersObserver:", v23);
    -[SBCombinationHardwareButton _configureGestureRecognizers](v23, "_configureGestureRecognizers");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v23, (CFNotificationCallback)_SBSOSTriggerMechanismDidChangeNotification, (CFStringRef)*MEMORY[0x1E0DAA370], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObserver:selector:name:object:", v23, sel__backlightChanged_, *MEMORY[0x1E0DAC2F8], 0);

  }
  return v23;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SBCombinationHardwareButton;
  -[SBCombinationHardwareButton dealloc](&v4, sel_dealloc);
}

- (void)_configureGestureRecognizers
{
  void *v3;
  SBPressGestureRecognizer *v4;
  SBPressGestureRecognizer *sosGestureRecognizer;
  void *v6;
  SBSOSClawGestureObserver *v7;
  SBSOSClawGestureObserver *sosClawGestureObserver;
  SBSOSLockGestureObserver *v9;
  SBSOSLockGestureObserver *sosLockGestureObserver;
  _BOOL4 v11;
  SBLongPressGestureRecognizer *shutdownGestureRecognizer;
  void *v13;

  -[SBClickGestureRecognizer addTarget:action:](self->_screenshotGestureRecognizer, "addTarget:action:", self, sel_screenshotGesture_);
  -[SBClickGestureRecognizer setDelegate:](self->_screenshotGestureRecognizer, "setDelegate:", self);
  +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addGestureRecognizer:withType:", self->_screenshotGestureRecognizer, 91);

  v4 = -[SBPressGestureRecognizer initWithTarget:action:]([SBPressGestureRecognizer alloc], "initWithTarget:action:", self, sel_sosGesture_);
  sosGestureRecognizer = self->_sosGestureRecognizer;
  self->_sosGestureRecognizer = v4;

  -[SBPressGestureRecognizer setName:](self->_sosGestureRecognizer, "setName:", CFSTR("LockVolumeButtons-SOS"));
  -[SBPressGestureRecognizer setAllowedPressTypes:](self->_sosGestureRecognizer, "setAllowedPressTypes:", &unk_1E91CE560);
  -[SBPressGestureRecognizer setDelegate:](self->_sosGestureRecognizer, "setDelegate:", self);
  +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addGestureRecognizer:withType:", self->_sosGestureRecognizer, 86);

  v7 = objc_alloc_init(SBSOSClawGestureObserver);
  sosClawGestureObserver = self->_sosClawGestureObserver;
  self->_sosClawGestureObserver = v7;

  -[SBSOSClawGestureObserver setDelegate:](self->_sosClawGestureObserver, "setDelegate:", self);
  -[SBSOSClawGestureObserver setGestureLoggingEnabled:](self->_sosClawGestureObserver, "setGestureLoggingEnabled:", 1);
  v9 = -[SBSOSLockGestureObserver initWithConfiguration:]([SBSOSLockGestureObserver alloc], "initWithConfiguration:", 1);
  sosLockGestureObserver = self->_sosLockGestureObserver;
  self->_sosLockGestureObserver = v9;

  -[SBSOSLockGestureObserver setDelegate:](self->_sosLockGestureObserver, "setDelegate:", self);
  -[SBSOSLockGestureObserver setGestureLoggingEnabled:](self->_sosLockGestureObserver, "setGestureLoggingEnabled:", 1);
  -[SBCombinationHardwareButton _configureSOSGestureBehaviors](self, "_configureSOSGestureBehaviors");
  if (self->_shutdownGestureRecognizer)
  {
    v11 = -[SBSOSClawGestureObserver isSOSEnabled](self->_sosClawGestureObserver, "isSOSEnabled");
    shutdownGestureRecognizer = self->_shutdownGestureRecognizer;
    if (v11)
    {
      -[SBLongPressGestureRecognizer setEnabled:](shutdownGestureRecognizer, "setEnabled:", 0);
    }
    else
    {
      -[SBLongPressGestureRecognizer addTarget:action:](shutdownGestureRecognizer, "addTarget:action:", self, sel_shutdownGesture_);
      -[SBLongPressGestureRecognizer setName:](self->_shutdownGestureRecognizer, "setName:", CFSTR("LockVolumeButtons-Shutdown"));
      -[SBClickGestureRecognizer setNumberOfClicksRequired:](self->_shutdownGestureRecognizer, "setNumberOfClicksRequired:", 0);
      -[SBClickGestureRecognizer setAllPressesUpRequired:](self->_shutdownGestureRecognizer, "setAllPressesUpRequired:", 0);
      -[SBLongPressGestureRecognizer setMinimumPressDuration:](self->_shutdownGestureRecognizer, "setMinimumPressDuration:", 1.1);
      -[SBPressGestureRecognizer setAllowedPressTypes:](self->_shutdownGestureRecognizer, "setAllowedPressTypes:", &unk_1E91CE578);
      -[SBClickGestureRecognizer addShortcutWithPressTypes:](self->_shutdownGestureRecognizer, "addShortcutWithPressTypes:", &unk_1E91CE590);
      -[SBClickGestureRecognizer addShortcutWithPressTypes:](self->_shutdownGestureRecognizer, "addShortcutWithPressTypes:", &unk_1E91CE5A8);
      -[SBLongPressGestureRecognizer setDelegate:](self->_shutdownGestureRecognizer, "setDelegate:", self);
      +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addGestureRecognizer:withType:", self->_shutdownGestureRecognizer, 87);

      -[SBLongPressGestureRecognizer setEnabled:](self->_shutdownGestureRecognizer, "setEnabled:", 1);
      -[SBClickGestureRecognizer requireGestureRecognizerToFail:](self->_screenshotGestureRecognizer, "requireGestureRecognizerToFail:", self->_shutdownGestureRecognizer);
    }
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  int v3;
  id WeakRetained;

  if (self->_screenshotGestureRecognizer == a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_proximitySensorManager);
    v3 = objc_msgSend(WeakRetained, "isObjectInProximity") ^ 1;

  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  SBClickGestureRecognizer *v6;
  id v7;
  BOOL v8;

  v6 = (SBClickGestureRecognizer *)a3;
  v7 = a4;
  v8 = 0;
  if (self->_screenshotGestureRecognizer == v6)
  {
    NSClassFromString(CFSTR("SBHBLongPressGestureRecognizer"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = 1;
  }

  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  SBLongPressGestureRecognizer *v6;
  SBClickGestureRecognizer *v7;
  SBClickGestureRecognizer *v8;
  SBClickGestureRecognizer *screenshotGestureRecognizer;
  BOOL v10;
  void *v11;
  BOOL v12;

  v6 = (SBLongPressGestureRecognizer *)a3;
  v7 = (SBClickGestureRecognizer *)a4;
  v8 = v7;
  screenshotGestureRecognizer = self->_screenshotGestureRecognizer;
  v10 = screenshotGestureRecognizer == (SBClickGestureRecognizer *)v6 || screenshotGestureRecognizer == v7;
  if (v10
    || (SBLongPressGestureRecognizer *)self->_sosGestureRecognizer == v6
    || self->_shutdownGestureRecognizer == v6)
  {
    v12 = 1;
  }
  else
  {
    -[SBClickGestureRecognizer allowedTouchTypes](v7, "allowedTouchTypes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count") != 0;

  }
  return v12;
}

- (void)_configureSOSGestureBehaviors
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "Configuring SOS Gesture Behaviors - Unsupported Lock Button Trigger Click Count - disabling lock button trigger.", v1, 2u);
}

- (void)provider:(id)a3 didUpdateButtonGestureParameters:(id)a4
{
  SBClickGestureRecognizer *screenshotGestureRecognizer;

  screenshotGestureRecognizer = self->_screenshotGestureRecognizer;
  objc_msgSend(a4, "longPressTimeInterval", a3);
  -[SBClickGestureRecognizer setMaximumClickFormationDuration:](screenshotGestureRecognizer, "setMaximumClickFormationDuration:");
}

- (id)preemptablePressGestureRecognizers
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self->_screenshotGestureRecognizer;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)screenshotGesture:(id)a3
{
  id v4;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogButtonsCombo();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = objc_msgSend(v4, "state");
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Take screenshot: %d", (uint8_t *)v6, 8u);
  }

  if (objc_msgSend(v4, "state") == 3)
    -[SBCombinationHardwareButtonActions performTakeScreenshotAction](self->_buttonActions, "performTakeScreenshotAction");

}

- (void)sosGesture:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  double v9;
  double v10;
  SBSOSLockGestureObserver *v11;
  NSObject *v12;
  SBSOSClawGestureObserver *sosClawGestureObserver;
  SBSOSLockGestureObserver *sosLockGestureObserver;
  SBSOSClawGestureObserver *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  int v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "latestPressType");
  v6 = objc_msgSend(v4, "latestPressPhase");
  v7 = objc_msgSend(v4, "state");
  SBLogButtonsCombo();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 67109632;
    v20 = v5;
    v21 = 1024;
    v22 = v6;
    v23 = 1024;
    v24 = v7;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "SOS button gesture: press type=%d, press phase=%d, recognizer state=%d", (uint8_t *)&v19, 0x14u);
  }

  objc_msgSend(v4, "latestPressTimestamp");
  v10 = v9;
  if ((BSFloatIsZero() & 1) != 0)
    goto LABEL_27;
  if (v5 != 104)
    goto LABEL_9;
  if (v7 == 3)
  {
    sosLockGestureObserver = self->_sosLockGestureObserver;
    if (sosLockGestureObserver)
      -[SBSOSLockGestureObserver registerPressUpWithTimestamp:](sosLockGestureObserver, "registerPressUpWithTimestamp:", v10);
    goto LABEL_17;
  }
  if (v7 != 1)
  {
LABEL_9:
    if ((v7 & 0xFFFFFFFFFFFFFFFELL) == 4)
    {
      SBLogButtonsCombo();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 67109120;
        v20 = v7;
        _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "SOS button gesture reset due to recognizer canceled or failed: %d", (uint8_t *)&v19, 8u);
      }

      if (self)
        sosClawGestureObserver = self->_sosClawGestureObserver;
      else
        sosClawGestureObserver = 0;
      -[SBSOSClawGestureObserver noteGestureReset](sosClawGestureObserver, "noteGestureReset");
      goto LABEL_27;
    }
    goto LABEL_17;
  }
  v11 = self->_sosLockGestureObserver;
  if (v11)
    -[SBSOSLockGestureObserver registerPressDownWithTimestamp:](v11, "registerPressDownWithTimestamp:", v10);
LABEL_17:
  if ((unint64_t)(v6 - 3) < 2)
  {
    if (self)
      v15 = self->_sosClawGestureObserver;
    else
      v15 = 0;
    v16 = v5;
    v17 = 0;
    goto LABEL_26;
  }
  if (v6 == 2 || !v6)
  {
    if (self)
      v15 = self->_sosClawGestureObserver;
    else
      v15 = 0;
    v16 = v5;
    v17 = 1;
LABEL_26:
    -[SBSOSClawGestureObserver noteButtonPress:isDown:](v15, "noteButtonPress:isDown:", v16, v17);
    goto LABEL_27;
  }
  SBLogButtonsCombo();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 67109120;
    v20 = v6;
    _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_DEFAULT, "Unhandled claw gesture button press phase: %d.", (uint8_t *)&v19, 8u);
  }

LABEL_27:
}

- (void)shutdownGesture:(id)a3
{
  id WeakRetained;

  if (objc_msgSend(a3, "state") == 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_lockHardwareButton);
    objc_msgSend(WeakRetained, "cancelLongPress");

    -[SBCombinationHardwareButtonActions performPresentPowerDownTransientOverlayAction](self->_buttonActions, "performPresentPowerDownTransientOverlayAction");
  }
}

- (void)sosLockDidTriggerSOS:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id WeakRetained;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB3A28];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "triggerMechanism");

  SBLogButtonsCombo();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412546;
    v15 = v9;
    v16 = 1024;
    v17 = v10;
    _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "SOS Lock Gesture triggered SOS with UUID: %@ and trigger mechanism: %d", (uint8_t *)&v14, 0x12u);
  }

  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_lockHardwareButton);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "buttonActions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "performSOSActionsWithUUID:triggerMechanism:completion:", v9, v10, v7);

  -[SBSOSLockGestureObserver noteDidBeginSOSWithUUID:](self->_sosLockGestureObserver, "noteDidBeginSOSWithUUID:", v9);
}

- (void)sosLockTriggerDidBecomeActive:(id)a3
{
  void *v3;
  SBCombinationHardwareButton *v4;

  if (self)
    self = (SBCombinationHardwareButton *)objc_loadWeakRetained((id *)&self->_lockHardwareButton);
  v4 = self;
  -[SBCombinationHardwareButton buttonActions](self, "buttonActions", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performSOSGestureBeganActions");

}

- (void)sosLockTriggerDidBecomeInactive:(id)a3
{
  void *v3;
  SBCombinationHardwareButton *v4;

  if (self)
    self = (SBCombinationHardwareButton *)objc_loadWeakRetained((id *)&self->_lockHardwareButton);
  v4 = self;
  -[SBCombinationHardwareButton buttonActions](self, "buttonActions", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performSOSGestureEndedActions");

}

- (void)sosClawDidTriggerSOS:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[SBCombinationHardwareButton _setScreenshotDisabled:forReason:](self, "_setScreenshotDisabled:forReason:", 1, CFSTR("SOSTriggered"));
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogButtonsCombo();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "SOS Claw Gesture triggered SOS with UUID: %@", (uint8_t *)&v9, 0xCu);
  }

  if (self)
    self = (SBCombinationHardwareButton *)objc_loadWeakRetained((id *)&self->_lockHardwareButton);
  -[SBCombinationHardwareButton buttonActions](self, "buttonActions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "performSOSActionsWithUUID:triggerMechanism:completion:", v6, 3, v5);

}

- (void)sosClawDidBecomeActive:(id)a3
{
  void *v3;
  SBCombinationHardwareButton *v4;

  if (self)
    self = (SBCombinationHardwareButton *)objc_loadWeakRetained((id *)&self->_lockHardwareButton);
  v4 = self;
  -[SBCombinationHardwareButton cancelLongPress](self, "cancelLongPress", a3);
  -[SBCombinationHardwareButton buttonActions](v4, "buttonActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performSOSGestureBeganActions");

}

- (void)sosClawDidBecomeInactive:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  -[SBCombinationHardwareButton _setScreenshotDisabled:forReason:](self, "_setScreenshotDisabled:forReason:", 0, CFSTR("SOSTriggered"));
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_lockHardwareButton);
  else
    WeakRetained = 0;
  v6 = WeakRetained;
  objc_msgSend(WeakRetained, "buttonActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performSOSGestureEndedActions");

}

- (void)sosClawAutoCallInteractiveStateChanged:(id)a3 interacting:(BOOL)a4
{
  -[SBCombinationHardwareButton _setScreenshotDisabled:forReason:](self, "_setScreenshotDisabled:forReason:", a4, CFSTR("SOSInteractive"));
}

- (void)cancelHardwareButtonPress
{
  if (-[SBLongPressGestureRecognizer isEnabled](self->_shutdownGestureRecognizer, "isEnabled"))
  {
    -[SBLongPressGestureRecognizer setEnabled:](self->_shutdownGestureRecognizer, "setEnabled:", 0);
    -[SBLongPressGestureRecognizer setEnabled:](self->_shutdownGestureRecognizer, "setEnabled:", 1);
  }
  if (-[SBClickGestureRecognizer isEnabled](self->_screenshotGestureRecognizer, "isEnabled"))
  {
    -[SBClickGestureRecognizer setEnabled:](self->_screenshotGestureRecognizer, "setEnabled:", 0);
    -[SBClickGestureRecognizer setEnabled:](self->_screenshotGestureRecognizer, "setEnabled:", 1);
  }
}

- (id)hardwareButtonIdentifier
{
  return CFSTR("Combination");
}

- (void)_sosTriggerMechanismDidChange
{
  BSDispatchMain();
}

uint64_t __60__SBCombinationHardwareButton__sosTriggerMechanismDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureSOSGestureBehaviors");
}

- (void)_setScreenshotDisabled:(BOOL)a3 forReason:(id)a4
{
  _BOOL4 v4;
  id v7;
  NSMutableDictionary *screenshotDisableAssertions;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id location;

  v4 = a3;
  v7 = a4;
  BSDispatchQueueAssertMain();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCombinationHardwareButton.m"), 396, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  }
  screenshotDisableAssertions = self->_screenshotDisableAssertions;
  if (v4)
  {
    if (!screenshotDisableAssertions)
    {
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v10 = self->_screenshotDisableAssertions;
      self->_screenshotDisableAssertions = v9;

      screenshotDisableAssertions = self->_screenshotDisableAssertions;
    }
    -[NSMutableDictionary objectForKeyedSubscript:](screenshotDisableAssertions, "objectForKeyedSubscript:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      objc_initWeak(&location, self);
      v12 = objc_alloc(MEMORY[0x1E0D01868]);
      v13 = MEMORY[0x1E0C80D38];
      v14 = MEMORY[0x1E0C80D38];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __64__SBCombinationHardwareButton__setScreenshotDisabled_forReason___block_invoke;
      v18[3] = &unk_1E8E9E468;
      objc_copyWeak(&v19, &location);
      v15 = (void *)objc_msgSend(v12, "initWithIdentifier:forReason:queue:invalidationBlock:", CFSTR("ScreenshotDisable"), v7, v13, v18);

      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_screenshotDisableAssertions, "setObject:forKeyedSubscript:", v15, v7);
      -[SBClickGestureRecognizer setEnabled:](self->_screenshotGestureRecognizer, "setEnabled:", 0);

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    -[NSMutableDictionary objectForKeyedSubscript:](screenshotDisableAssertions, "objectForKeyedSubscript:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "invalidate");

  }
}

void __64__SBCombinationHardwareButton__setScreenshotDisabled_forReason___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  v8 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained[1];
    objc_msgSend(v8, "reason");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v6);

    if (!objc_msgSend(v4[1], "count"))
    {
      objc_msgSend(v4[4], "setEnabled:", 1);
      v7 = v4[1];
      v4[1] = 0;

    }
  }

}

- (void)_backlightChanged:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  BSDispatchMain();

}

void __49__SBCombinationHardwareButton__backlightChanged___block_invoke(uint64_t a1)
{
  void *v2;
  float v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0DAC300]);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "floatValue");
  objc_msgSend(*(id *)(a1 + 40), "_setScreenshotDisabled:forReason:", v3 <= 0.0, CFSTR("Backlight"));

}

- (SBHardwareButtonCoordinator)hardwareButtonCoordinator
{
  return self->_hardwareButtonCoordinator;
}

- (void)setHardwareButtonCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_hardwareButtonCoordinator, a3);
}

- (id)homeHardwareButton
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 5);
  return WeakRetained;
}

- (id)setHomeHardwareButton:(id *)result
{
  if (result)
    return (id *)objc_storeWeak(result + 5, a2);
  return result;
}

- (id)volumeHardwareButton
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 7);
  return WeakRetained;
}

- (id)setVolumeHardwareButton:(id *)result
{
  if (result)
    return (id *)objc_storeWeak(result + 7, a2);
  return result;
}

- (id)proximitySensorManager
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 8);
  return WeakRetained;
}

- (id)setProximitySensorManager:(id *)result
{
  if (result)
    return (id *)objc_storeWeak(result + 8, a2);
  return result;
}

- (id)backlightController
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 9);
  return WeakRetained;
}

- (id)setBacklightController:(id *)result
{
  if (result)
    return (id *)objc_storeWeak(result + 9, a2);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shutdownGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_sosLockGestureObserver, 0);
  objc_storeStrong((id *)&self->_sosClawGestureObserver, 0);
  objc_storeStrong((id *)&self->_sosGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_backlightController);
  objc_destroyWeak((id *)&self->_proximitySensorManager);
  objc_destroyWeak((id *)&self->_volumeHardwareButton);
  objc_destroyWeak((id *)&self->_lockHardwareButton);
  objc_destroyWeak((id *)&self->_homeHardwareButton);
  objc_storeStrong((id *)&self->_screenshotGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_buttonActions, 0);
  objc_storeStrong((id *)&self->_hardwareButtonCoordinator, 0);
  objc_storeStrong((id *)&self->_screenshotDisableAssertions, 0);
}

@end
