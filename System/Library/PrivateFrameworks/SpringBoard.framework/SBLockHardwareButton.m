@implementation SBLockHardwareButton

- (SBLockHardwareButton)initWithScreenshotGestureRecognizer:(id)a3 shutdownGestureRecognizer:(id)a4 proximitySensorManager:(id)a5 homeHardwareButton:(id)a6 volumeHardwareButton:(id)a7 homeButtonType:(int64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  SBLockHardwareButtonActions *v19;
  SBLockHardwareButton *v20;
  uint64_t v22;

  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = -[SBLockHardwareButtonActions initWithHomeButtonType:proximitySensorManager:]([SBLockHardwareButtonActions alloc], "initWithHomeButtonType:proximitySensorManager:", a8, v16);
  LOBYTE(v22) = 1;
  v20 = -[SBLockHardwareButton initWithScreenshotGestureRecognizer:shutdownGestureRecognizer:proximitySensorManager:homeHardwareButton:volumeHardwareButton:buttonActions:homeButtonType:createGestures:](self, "initWithScreenshotGestureRecognizer:shutdownGestureRecognizer:proximitySensorManager:homeHardwareButton:volumeHardwareButton:buttonActions:homeButtonType:createGestures:", v18, v17, v16, v15, v14, v19, a8, v22);

  return v20;
}

- (SBLockHardwareButton)initWithScreenshotGestureRecognizer:(id)a3 shutdownGestureRecognizer:(id)a4 proximitySensorManager:(id)a5 homeHardwareButton:(id)a6 volumeHardwareButton:(id)a7 buttonActions:(id)a8 homeButtonType:(int64_t)a9 createGestures:(BOOL)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  SBLockHardwareButton *v20;
  SBLockHardwareButton *v21;
  uint64_t v22;
  SBHardwareButtonGestureParameters *buttonGestureParameters;
  objc_super v25;

  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v25.receiver = self;
  v25.super_class = (Class)SBLockHardwareButton;
  v20 = -[SBLockHardwareButton init](&v25, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_lastPressDownTime = -1.79769313e308;
    objc_storeWeak((id *)&v20->_screenshotGestureRecognizer, v15);
    objc_storeWeak((id *)&v21->_shutdownGestureRecognizer, v16);
    objc_storeWeak((id *)&v21->_homeHardwareButton, v17);
    objc_storeWeak((id *)&v21->_volumeHardwareButton, v18);
    v21->_homeButtonType = a9;
    objc_storeStrong((id *)&v21->_buttonActions, a8);
    -[SBHardwareButtonGestureParametersProviderBase addHardwareButtonGestureParametersObserver:](v21->_buttonActions, "addHardwareButtonGestureParametersObserver:", v21);
    -[SBLockHardwareButtonActions hardwareButtonGestureParameters](v21->_buttonActions, "hardwareButtonGestureParameters");
    v22 = objc_claimAutoreleasedReturnValue();
    buttonGestureParameters = v21->_buttonGestureParameters;
    v21->_buttonGestureParameters = (SBHardwareButtonGestureParameters *)v22;

    if (a10)
      -[SBLockHardwareButton _createGestureRecognizers](v21, "_createGestureRecognizers");
  }

  return v21;
}

- (void)_createGestureRecognizers
{
  SBPressGestureRecognizer *v3;
  SBPressGestureRecognizer *buttonDownGestureRecognizer;
  void *v5;
  SBClickGestureRecognizer *v6;
  SBClickGestureRecognizer *singlePressGestureRecognizer;
  void *v8;
  SBLongPressGestureRecognizer *v9;
  SBLongPressGestureRecognizer *terminalLockLongPressGestureRecognizer;
  void *v11;
  SBLongPressGestureRecognizer *v12;
  SBLongPressGestureRecognizer *longPressGestureRecognizer;
  SBLongPressGestureRecognizer *v14;
  SBLongPressGestureRecognizer *v15;
  void *v16;
  id v17;
  SBClickGestureRecognizer *v18;
  SBClickGestureRecognizer *doublePressGestureRecognizer;
  void *v20;
  SBClickGestureRecognizer *v21;
  SBClickGestureRecognizer *triplePressGestureRecognizer;
  void *v23;
  SBClickGestureRecognizer *v24;
  SBClickGestureRecognizer *quadruplePressGestureRecognizer;
  void *v26;
  id WeakRetained;

  v3 = -[SBPressGestureRecognizer initWithTarget:action:]([SBPressGestureRecognizer alloc], "initWithTarget:action:", self, sel_buttonDown_);
  buttonDownGestureRecognizer = self->_buttonDownGestureRecognizer;
  self->_buttonDownGestureRecognizer = v3;

  -[SBPressGestureRecognizer setName:](self->_buttonDownGestureRecognizer, "setName:", CFSTR("LockButton-buttonDown"));
  -[SBPressGestureRecognizer setAllowedPressTypes:](self->_buttonDownGestureRecognizer, "setAllowedPressTypes:", &unk_1E91CEE78);
  -[SBPressGestureRecognizer setDelegate:](self->_buttonDownGestureRecognizer, "setDelegate:", self);
  +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addGestureRecognizer:withType:", self->_buttonDownGestureRecognizer, 79);

  v6 = -[SBClickGestureRecognizer initWithTarget:action:]([SBClickGestureRecognizer alloc], "initWithTarget:action:", self, sel_singlePress_);
  singlePressGestureRecognizer = self->_singlePressGestureRecognizer;
  self->_singlePressGestureRecognizer = v6;

  -[SBClickGestureRecognizer setName:](self->_singlePressGestureRecognizer, "setName:", CFSTR("LockButton-singlePress"));
  -[SBPressGestureRecognizer setAllowedPressTypes:](self->_singlePressGestureRecognizer, "setAllowedPressTypes:", &unk_1E91CEE90);
  -[SBClickGestureRecognizer addShortcutWithPressTypes:](self->_singlePressGestureRecognizer, "addShortcutWithPressTypes:", &unk_1E91CEEA8);
  -[SBClickGestureRecognizer addShortcutWithPressTypes:](self->_singlePressGestureRecognizer, "addShortcutWithPressTypes:", &unk_1E91CEEC0);
  -[SBClickGestureRecognizer setDelegate:](self->_singlePressGestureRecognizer, "setDelegate:", self);
  +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addGestureRecognizer:withType:", self->_singlePressGestureRecognizer, 80);

  WeakRetained = objc_loadWeakRetained((id *)&self->_screenshotGestureRecognizer);
  -[SBClickGestureRecognizer requireGestureRecognizerToFail:](self->_singlePressGestureRecognizer, "requireGestureRecognizerToFail:", WeakRetained);
  objc_msgSend(WeakRetained, "addTarget:action:", self, sel_screenshotRecognizerDidRecognize_);
  v9 = -[SBLongPressGestureRecognizer initWithTarget:action:]([SBLongPressGestureRecognizer alloc], "initWithTarget:action:", self, sel_terminalLockLongPress_);
  terminalLockLongPressGestureRecognizer = self->_terminalLockLongPressGestureRecognizer;
  self->_terminalLockLongPressGestureRecognizer = v9;

  -[SBLongPressGestureRecognizer setName:](self->_terminalLockLongPressGestureRecognizer, "setName:", CFSTR("LockButton-terminalLockLongPress"));
  -[SBPressGestureRecognizer setAllowedPressTypes:](self->_terminalLockLongPressGestureRecognizer, "setAllowedPressTypes:", &unk_1E91CEED8);
  -[SBLongPressGestureRecognizer setDelegate:](self->_terminalLockLongPressGestureRecognizer, "setDelegate:", self);
  -[SBLongPressGestureRecognizer setMinimumPressDuration:](self->_terminalLockLongPressGestureRecognizer, "setMinimumPressDuration:", 0.75);
  -[SBClickGestureRecognizer setMaximumClickFormationDuration:](self->_terminalLockLongPressGestureRecognizer, "setMaximumClickFormationDuration:", 0.75);
  +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addGestureRecognizer:withType:", self->_terminalLockLongPressGestureRecognizer, 85);

  v12 = -[SBLongPressGestureRecognizer initWithTarget:action:]([SBLongPressGestureRecognizer alloc], "initWithTarget:action:", self, sel_longPress_);
  longPressGestureRecognizer = self->_longPressGestureRecognizer;
  self->_longPressGestureRecognizer = v12;

  -[SBLongPressGestureRecognizer setName:](self->_longPressGestureRecognizer, "setName:", CFSTR("LockButton-longPress"));
  -[SBPressGestureRecognizer setAllowedPressTypes:](self->_longPressGestureRecognizer, "setAllowedPressTypes:", &unk_1E91CEEF0);
  -[SBLongPressGestureRecognizer setDelegate:](self->_longPressGestureRecognizer, "setDelegate:", self);
  v14 = self->_longPressGestureRecognizer;
  -[SBHardwareButtonGestureParameters longPressTimeInterval](self->_buttonGestureParameters, "longPressTimeInterval");
  -[SBLongPressGestureRecognizer setMinimumPressDuration:](v14, "setMinimumPressDuration:");
  v15 = self->_longPressGestureRecognizer;
  -[SBHardwareButtonGestureParameters longPressTimeInterval](self->_buttonGestureParameters, "longPressTimeInterval");
  -[SBClickGestureRecognizer setMaximumClickFormationDuration:](v15, "setMaximumClickFormationDuration:");
  +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addGestureRecognizer:withType:", self->_longPressGestureRecognizer, 81);

  v17 = objc_loadWeakRetained((id *)&self->_shutdownGestureRecognizer);
  if (v17)
  {
    -[SBHardwareButtonGestureParameters longPressTimeInterval](self->_buttonGestureParameters, "longPressTimeInterval");
    objc_msgSend(v17, "setMaximumClickFormationDuration:");
    -[SBLongPressGestureRecognizer requireGestureRecognizerToFail:](self->_longPressGestureRecognizer, "requireGestureRecognizerToFail:", v17);
  }
  v18 = -[SBClickGestureRecognizer initWithTarget:action:]([SBClickGestureRecognizer alloc], "initWithTarget:action:", self, sel_doublePress_);
  doublePressGestureRecognizer = self->_doublePressGestureRecognizer;
  self->_doublePressGestureRecognizer = v18;

  -[SBClickGestureRecognizer setName:](self->_doublePressGestureRecognizer, "setName:", CFSTR("LockButton-doublePress"));
  -[SBPressGestureRecognizer setAllowedPressTypes:](self->_doublePressGestureRecognizer, "setAllowedPressTypes:", &unk_1E91CEF08);
  -[SBClickGestureRecognizer setNumberOfClicksRequired:](self->_doublePressGestureRecognizer, "setNumberOfClicksRequired:", 2);
  -[SBClickGestureRecognizer setDelegate:](self->_doublePressGestureRecognizer, "setDelegate:", self);
  +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addGestureRecognizer:withType:", self->_doublePressGestureRecognizer, 82);

  if (self->_homeButtonType == 2)
  {
    v21 = -[SBClickGestureRecognizer initWithTarget:action:]([SBClickGestureRecognizer alloc], "initWithTarget:action:", self, sel_triplePress_);
    triplePressGestureRecognizer = self->_triplePressGestureRecognizer;
    self->_triplePressGestureRecognizer = v21;

    -[SBClickGestureRecognizer setName:](self->_triplePressGestureRecognizer, "setName:", CFSTR("LockButton-triplePress"));
    -[SBPressGestureRecognizer setAllowedPressTypes:](self->_triplePressGestureRecognizer, "setAllowedPressTypes:", &unk_1E91CEF20);
    -[SBClickGestureRecognizer setNumberOfClicksRequired:](self->_triplePressGestureRecognizer, "setNumberOfClicksRequired:", 3);
    -[SBClickGestureRecognizer setDelegate:](self->_triplePressGestureRecognizer, "setDelegate:", self);
    +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addGestureRecognizer:withType:", self->_triplePressGestureRecognizer, 83);

    v24 = -[SBClickGestureRecognizer initWithTarget:action:]([SBClickGestureRecognizer alloc], "initWithTarget:action:", self, sel_quadruplePress_);
    quadruplePressGestureRecognizer = self->_quadruplePressGestureRecognizer;
    self->_quadruplePressGestureRecognizer = v24;

    -[SBClickGestureRecognizer setName:](self->_quadruplePressGestureRecognizer, "setName:", CFSTR("LockButton-quadruplePress"));
    -[SBPressGestureRecognizer setAllowedPressTypes:](self->_quadruplePressGestureRecognizer, "setAllowedPressTypes:", &unk_1E91CEF38);
    -[SBClickGestureRecognizer setNumberOfClicksRequired:](self->_quadruplePressGestureRecognizer, "setNumberOfClicksRequired:", 4);
    -[SBClickGestureRecognizer setDelegate:](self->_quadruplePressGestureRecognizer, "setDelegate:", self);
    +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addGestureRecognizer:withType:", self->_quadruplePressGestureRecognizer, 84);

  }
  -[SBClickGestureRecognizer requireGestureRecognizerToFail:](self->_singlePressGestureRecognizer, "requireGestureRecognizerToFail:", self->_longPressGestureRecognizer);
  -[SBClickGestureRecognizer requireGestureRecognizerToFail:](self->_singlePressGestureRecognizer, "requireGestureRecognizerToFail:", self->_terminalLockLongPressGestureRecognizer);
  -[SBClickGestureRecognizer requireGestureRecognizerToFail:](self->_singlePressGestureRecognizer, "requireGestureRecognizerToFail:", WeakRetained);
  -[SBLockHardwareButton _reconfigureButtonGestureRecognizers](self, "_reconfigureButtonGestureRecognizers");

}

- (void)screenshotRecognizerDidRecognize:(id)a3
{
  if (objc_msgSend(a3, "state") == 3)
  {
    -[SBLockHardwareButton cancelLongPress](self, "cancelLongPress");
    -[SBLockHardwareButtonActions performButtonUpPreActions](self->_buttonActions, "performButtonUpPreActions");
    -[SBLockHardwareButtonActions performFinalButtonUpActions](self->_buttonActions, "performFinalButtonUpActions");
  }
}

- (void)_reconfigureButtonGestureRecognizers
{
  NSObject *v3;
  SBHardwareButtonGestureParameters *buttonGestureParameters;
  SBLongPressGestureRecognizer *longPressGestureRecognizer;
  id WeakRetained;
  int64_t v7;
  uint64_t v8;
  _BOOL8 v9;
  NSObject *v10;
  float v11;
  double v12;
  int v13;
  SBHardwareButtonGestureParameters *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  SBLogButtonsLock();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    buttonGestureParameters = self->_buttonGestureParameters;
    v13 = 138543362;
    v14 = buttonGestureParameters;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "reconfigured lock button: %{public}@", (uint8_t *)&v13, 0xCu);
  }

  longPressGestureRecognizer = self->_longPressGestureRecognizer;
  -[SBHardwareButtonGestureParameters longPressTimeInterval](self->_buttonGestureParameters, "longPressTimeInterval");
  -[SBLongPressGestureRecognizer setMinimumPressDuration:](longPressGestureRecognizer, "setMinimumPressDuration:");
  WeakRetained = objc_loadWeakRetained((id *)&self->_shutdownGestureRecognizer);
  -[SBHardwareButtonGestureParameters longPressTimeInterval](self->_buttonGestureParameters, "longPressTimeInterval");
  objc_msgSend(WeakRetained, "setMaximumClickFormationDuration:");

  v7 = -[SBHardwareButtonGestureParameters maximumPressCount](self->_buttonGestureParameters, "maximumPressCount");
  if (self->_configuredMaximumPressCount != v7)
  {
    v8 = v7;
    self->_configuredMaximumPressCount = v7;
    v9 = v7 > 2;
    -[SBClickGestureRecognizer setEnabled:](self->_doublePressGestureRecognizer, "setEnabled:", v7 > 1);
    -[SBClickGestureRecognizer setEnabled:](self->_triplePressGestureRecognizer, "setEnabled:", v9);
    -[SBClickGestureRecognizer setEnabled:](self->_quadruplePressGestureRecognizer, "setEnabled:", v9);
    if (v8 < 3)
    {
      -[SBClickGestureRecognizer removeFailureRequirement:](self->_doublePressGestureRecognizer, "removeFailureRequirement:", self->_triplePressGestureRecognizer);
    }
    else
    {
      SBLogButtonsLock();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "triple-click enabled", (uint8_t *)&v13, 2u);
      }

      -[SBClickGestureRecognizer requireGestureRecognizerToFail:](self->_doublePressGestureRecognizer, "requireGestureRecognizerToFail:", self->_triplePressGestureRecognizer);
    }
  }
  if (self->_homeButtonType == 2)
  {
    _AXSSideButtonClickSpeed();
    v12 = v11;
    -[SBClickGestureRecognizer setMaximumBetweenClicksDelay:](self->_singlePressGestureRecognizer, "setMaximumBetweenClicksDelay:", v11);
    -[SBClickGestureRecognizer setMaximumBetweenClicksDelay:](self->_doublePressGestureRecognizer, "setMaximumBetweenClicksDelay:", v12);
    -[SBClickGestureRecognizer setMaximumBetweenClicksDelay:](self->_triplePressGestureRecognizer, "setMaximumBetweenClicksDelay:", v12);
    -[SBClickGestureRecognizer setMaximumBetweenClicksDelay:](self->_quadruplePressGestureRecognizer, "setMaximumBetweenClicksDelay:", v12);
  }
}

- (BOOL)isButtonDown
{
  return -[SBLockHardwareButtonActions isButtonDown](self->_buttonActions, "isButtonDown");
}

- (BOOL)reverseFadeOutIfNeeded
{
  return -[SBLockHardwareButtonActions reverseFadeOutIfNeeded](self->_buttonActions, "reverseFadeOutIfNeeded");
}

- (void)forceResetSequenceDidBegin
{
  NSObject *v3;
  uint8_t v4[16];

  SBLogButtonsLock();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Failing long press due to pending force reset sequence", v4, 2u);
  }

  -[SBLockHardwareButton cancelLongPress](self, "cancelLongPress");
  -[SBLockHardwareButtonActions performForceResetSequenceBeganActions](self->_buttonActions, "performForceResetSequenceBeganActions");
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  SBLongPressGestureRecognizer *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  BOOL v12;
  SBLockHardwareButtonActions *buttonActions;
  _BOOL4 v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  SBLockHardwareButtonActions *v19;
  _BOOL4 v20;
  NSObject *v21;
  SBLockHardwareButtonActions *v22;
  _BOOL4 v23;
  NSObject *v24;
  SBLockHardwareButtonActions *v25;
  _BOOL4 v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  NSObject *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = (SBLongPressGestureRecognizer *)a3;
  objc_msgSend((id)SBApp, "restartManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "startupTransition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      if (objc_msgSend(v6, "isPendingExit"))
      {
        SBLogButtonsLock();
        v8 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          goto LABEL_7;
        -[UIGestureRecognizer sb_briefDescription](v4, "sb_briefDescription");
        v9 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "pendingRestartTransitionRequest");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v9;
        v33 = 2114;
        v34 = v10;
        v11 = "Preventing lock recognizer (%{public}@) because we are pending a restart: %{public}@";
        goto LABEL_5;
      }
      if ((SBLongPressGestureRecognizer *)self->_buttonDownGestureRecognizer != v4)
      {
        if (!-[SBLockHardwareButton _shouldRunActions](self, "_shouldRunActions"))
        {
          SBLogButtonsLock();
          v8 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
            goto LABEL_7;
          -[UIGestureRecognizer sb_briefDescription](v4, "sb_briefDescription");
          v9 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v32 = v9;
          v17 = "Preventing lock recognizer (%{public}@) because hardware button coordinator says nope";
          v18 = v8;
          goto LABEL_40;
        }
        if ((SBLongPressGestureRecognizer *)self->_singlePressGestureRecognizer == v4)
        {
          buttonActions = self->_buttonActions;
          v30 = 0;
          v15 = -[SBLockHardwareButtonActions disallowsSinglePressForReason:](buttonActions, "disallowsSinglePressForReason:", &v30);
          v16 = v30;
          v8 = v16;
          if (v15)
          {
            SBLogButtonsLock();
            v9 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
              goto LABEL_6;
            *(_DWORD *)buf = 138543362;
            v32 = v8;
            v17 = "Single press recognizer disallowed for reason: %{public}@";
            goto LABEL_39;
          }

        }
        if ((SBLongPressGestureRecognizer *)self->_doublePressGestureRecognizer == v4)
        {
          v19 = self->_buttonActions;
          v29 = 0;
          v20 = -[SBLockHardwareButtonActions disallowsDoublePressForReason:](v19, "disallowsDoublePressForReason:", &v29);
          v21 = v29;
          v8 = v21;
          if (v20)
          {
            SBLogButtonsLock();
            v9 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
              goto LABEL_6;
            *(_DWORD *)buf = 138543362;
            v32 = v8;
            v17 = "Double press recognizer disallowed for reason: %{public}@";
            goto LABEL_39;
          }

        }
        if ((SBLongPressGestureRecognizer *)self->_triplePressGestureRecognizer == v4
          || (SBLongPressGestureRecognizer *)self->_quadruplePressGestureRecognizer == v4)
        {
          v22 = self->_buttonActions;
          v28 = 0;
          v23 = -[SBLockHardwareButtonActions disallowsTriplePressForReason:](v22, "disallowsTriplePressForReason:", &v28);
          v24 = v28;
          v8 = v24;
          if (v23)
          {
            SBLogButtonsLock();
            v9 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
              goto LABEL_6;
            *(_DWORD *)buf = 138543362;
            v32 = v8;
            v17 = ">= Triple press recognizer disallowed for reason: %{public}@";
            goto LABEL_39;
          }

        }
        if (self->_longPressGestureRecognizer == v4 || self->_terminalLockLongPressGestureRecognizer == v4)
        {
          v25 = self->_buttonActions;
          v27 = 0;
          v26 = -[SBLockHardwareButtonActions disallowsLongPressForReason:](v25, "disallowsLongPressForReason:", &v27);
          v8 = v27;
          if (!v26)
          {
            v12 = 1;
            goto LABEL_8;
          }
          SBLogButtonsLock();
          v9 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
            goto LABEL_6;
          *(_DWORD *)buf = 138543362;
          v32 = v8;
          v17 = "Long press recognizer disallowed for reason: %{public}@";
LABEL_39:
          v18 = v9;
LABEL_40:
          _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, 0xCu);
          goto LABEL_6;
        }
      }
      v12 = 1;
      goto LABEL_9;
    }
  }
  SBLogButtonsLock();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[UIGestureRecognizer sb_briefDescription](v4, "sb_briefDescription");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startupTransition");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = v9;
    v33 = 2114;
    v34 = v10;
    v11 = "Preventing lock recognizer (%{public}@) because we're in a startup transition: %{public}@";
LABEL_5:
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, v11, buf, 0x16u);

LABEL_6:
  }
LABEL_7:
  v12 = 0;
LABEL_8:

LABEL_9:
  return v12;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  SBClickGestureRecognizer *v6;
  SBClickGestureRecognizer *v7;
  SBClickGestureRecognizer *v8;
  BOOL v9;
  SBLockHardwareButtonActions *buttonActions;
  BOOL v12;
  NSObject *v13;
  __int16 v14;
  uint64_t v15;

  v6 = (SBClickGestureRecognizer *)a3;
  v7 = (SBClickGestureRecognizer *)a4;
  v8 = v7;
  if (self->_singlePressGestureRecognizer == v6 && self->_doublePressGestureRecognizer == v7)
  {
    buttonActions = self->_buttonActions;
    v15 = 0;
    v12 = -[SBLockHardwareButtonActions disallowsDoublePressForReason:](buttonActions, "disallowsDoublePressForReason:", &v15);
    v9 = !v12;
    if (!v12)
    {
      SBLogButtonsLock();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 0;
        _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "Requiring double-press failure for single-press", (uint8_t *)&v14, 2u);
      }

    }
  }
  else
  {
    v9 = self->_triplePressGestureRecognizer == v6
      && self->_quadruplePressGestureRecognizer == v7
      && objc_msgSend(MEMORY[0x1E0D89868], "SOSTriggerClickCount") > 3;
  }

  return v9;
}

- (void)_gestureRecognizerFailed:(id)a3
{
  if (self->_singlePressGestureRecognizer == a3)
    -[SBLockHardwareButtonActions performSinglePressDidFailActions](self->_buttonActions, "performSinglePressDidFailActions");
}

- (id)preemptablePressGestureRecognizers
{
  SBClickGestureRecognizer *doublePressGestureRecognizer;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  doublePressGestureRecognizer = self->_doublePressGestureRecognizer;
  v4[0] = self->_singlePressGestureRecognizer;
  v4[1] = doublePressGestureRecognizer;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_updatePressCountForDownEvent
{
  double v3;
  double v4;
  double v5;
  unint64_t v6;
  double v7;

  BSContinuousMachTimeNow();
  v4 = v3 - self->_lastPressDownTime;
  -[SBClickGestureRecognizer maximumBetweenClicksDelay](self->_singlePressGestureRecognizer, "maximumBetweenClicksDelay");
  if (v4 <= v5)
  {
    v6 = self->_currentPressCount + 1;
  }
  else
  {
    self->_currentPressCount = 0;
    v6 = 1;
  }
  self->_currentPressCount = v6;
  if (v6 > self->_configuredMaximumPressCount)
    v6 = 1;
  self->_currentPressCount = v6;
  BSContinuousMachTimeNow();
  self->_lastPressDownTime = v7;
}

- (BOOL)_shouldRunActions
{
  SBHardwareButtonCoordinator *hardwareButtonCoordinator;
  void *v3;

  hardwareButtonCoordinator = self->_hardwareButtonCoordinator;
  -[SBLockHardwareButton hardwareButtonIdentifier](self, "hardwareButtonIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(hardwareButtonCoordinator) = -[SBHardwareButtonCoordinator buttonShouldStart:](hardwareButtonCoordinator, "buttonShouldStart:", v3);

  return (char)hardwareButtonCoordinator;
}

- (void)buttonDown:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  BSInvalidatable *v8;
  NSObject *v9;
  unint64_t currentPressCount;
  SBHardwareButtonCoordinator *hardwareButtonCoordinator;
  void *v12;
  BSInvalidatable *v13;
  BSInvalidatable *buttonActiveAssertion;
  unint64_t v15;
  id WeakRetained;
  int v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogButtonsLock();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 67109120;
    v18 = objc_msgSend(v4, "state");
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Lock button down: state=%d", (uint8_t *)&v17, 8u);
  }

  v6 = -[SBLockHardwareButton _shouldRunActions](self, "_shouldRunActions");
  v7 = objc_msgSend(v4, "state");
  if ((unint64_t)(v7 - 3) >= 3)
  {
    if (v7 == 1)
    {
      -[SBLockHardwareButton _updatePressCountForDownEvent](self, "_updatePressCountForDownEvent");
      -[SBLockHardwareButton _reportAggdLoggingForButtonEventIsDownEvent:](self, "_reportAggdLoggingForButtonEventIsDownEvent:", 1);
      SBLogButtonsLock();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        currentPressCount = self->_currentPressCount;
        v17 = 67109120;
        v18 = currentPressCount;
        _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "press count:%d", (uint8_t *)&v17, 8u);
      }

      if (!self->_buttonActiveAssertion)
      {
        hardwareButtonCoordinator = self->_hardwareButtonCoordinator;
        -[SBLockHardwareButton hardwareButtonIdentifier](self, "hardwareButtonIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHardwareButtonCoordinator assertButtonIsActive:dropletHintIdentifier:](hardwareButtonCoordinator, "assertButtonIsActive:dropletHintIdentifier:", v12, 2);
        v13 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
        buttonActiveAssertion = self->_buttonActiveAssertion;
        self->_buttonActiveAssertion = v13;

      }
      if (v6)
      {
        v15 = self->_currentPressCount;
        if (v15 == 1)
        {
          -[SBLockHardwareButtonActions performInitialButtonDownActions](self->_buttonActions, "performInitialButtonDownActions");
          v15 = self->_currentPressCount;
        }
        if (v15 == 2)
          -[SBLockHardwareButtonActions performSecondButtonDownActions](self->_buttonActions, "performSecondButtonDownActions");
        WeakRetained = objc_loadWeakRetained((id *)&self->_homeHardwareButton);
        objc_msgSend(WeakRetained, "cancelLongPress");

      }
    }
  }
  else
  {
    -[BSInvalidatable invalidate](self->_buttonActiveAssertion, "invalidate");
    v8 = self->_buttonActiveAssertion;
    self->_buttonActiveAssertion = 0;

    -[SBLockHardwareButton _reportAggdLoggingForButtonEventIsDownEvent:](self, "_reportAggdLoggingForButtonEventIsDownEvent:", 0);
    if (v6)
    {
      if (self->_currentPressCount == 1)
        -[SBLockHardwareButtonActions performInitialButtonUpActions](self->_buttonActions, "performInitialButtonUpActions");
      -[SBLockHardwareButtonActions performButtonUpPreActions](self->_buttonActions, "performButtonUpPreActions");
    }
  }

}

- (void)singlePress:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogButtonsLock();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = objc_msgSend(v4, "state");
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Lock button single press: state=%d", (uint8_t *)v8, 8u);
  }

  if (objc_msgSend(v4, "state") == 3 && -[SBLockHardwareButton _shouldRunActions](self, "_shouldRunActions"))
  {
    SBLogButtonsLock();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8[0]) = 0;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Lock button single press recognized.", (uint8_t *)v8, 2u);
    }

    if (-[SBLockHardwareButtonActions performButtonUpPreActions](self->_buttonActions, "performButtonUpPreActions"))
    {
      -[SBLockHardwareButtonActions performSinglePressAction](self->_buttonActions, "performSinglePressAction");
    }
    else
    {
      SBLogButtonsLock();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v8[0]) = 0;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Lock button single tap action handled with result: single tap pre-actions handled it.", (uint8_t *)v8, 2u);
      }

    }
  }

}

- (void)terminalLockLongPress:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  _DWORD v9[2];
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogButtonsLock();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(v4, "state");
    objc_msgSend(v4, "minimumPressDuration");
    v9[0] = 67109376;
    v9[1] = v6;
    v10 = 2048;
    v11 = v7;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "TerminalLock button long press: state=%d, duration: %f", (uint8_t *)v9, 0x12u);
  }

  if (objc_msgSend(v4, "state") == 1)
  {
    SBLogButtonsLock();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9[0]) = 0;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "TerminalLock button long press recognized.", (uint8_t *)v9, 2u);
    }

    -[SBLockHardwareButtonActions performTerminalLockLongPressActions](self->_buttonActions, "performTerminalLockLongPressActions");
  }
  if (objc_msgSend(v4, "state") == 3)
    -[SBLockHardwareButtonActions performFinalButtonUpActions](self->_buttonActions, "performFinalButtonUpActions");

}

- (void)longPress:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  id WeakRetained;
  _DWORD v10[2];
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogButtonsLock();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(v4, "state");
    objc_msgSend(v4, "minimumPressDuration");
    v10[0] = 67109376;
    v10[1] = v6;
    v11 = 2048;
    v12 = v7;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Lock button long press: state=%d, duration: %f", (uint8_t *)v10, 0x12u);
  }

  if (-[SBLockHardwareButton _shouldRunActions](self, "_shouldRunActions"))
  {
    if (objc_msgSend(v4, "state") == 1)
    {
      SBLogButtonsLock();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10[0]) = 0;
        _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Lock button long press recognized.", (uint8_t *)v10, 2u);
      }

      -[SBLockHardwareButtonActions performLongPressActions](self->_buttonActions, "performLongPressActions");
      WeakRetained = objc_loadWeakRetained((id *)&self->_homeHardwareButton);
      objc_msgSend(WeakRetained, "cancelLongPress");

    }
    if (objc_msgSend(v4, "state") == 3)
      -[SBLockHardwareButtonActions performFinalButtonUpActions](self->_buttonActions, "performFinalButtonUpActions");
  }

}

- (void)doublePress:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogButtonsLock();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = objc_msgSend(v4, "state");
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "double press: state:%d", (uint8_t *)v7, 8u);
  }

  if (-[SBLockHardwareButton _shouldRunActions](self, "_shouldRunActions") && objc_msgSend(v4, "state") == 3)
  {
    SBLogButtonsLock();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7[0]) = 0;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "double press recognized", (uint8_t *)v7, 2u);
    }

    -[SBLockHardwareButtonActions performDoublePressActions](self->_buttonActions, "performDoublePressActions");
  }

}

- (void)triplePress:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogButtonsLock();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = objc_msgSend(v4, "state");
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "triple press: state:%d", (uint8_t *)v7, 8u);
  }

  if (-[SBLockHardwareButton _shouldRunActions](self, "_shouldRunActions") && objc_msgSend(v4, "state") == 3)
  {
    SBLogButtonsLock();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7[0]) = 0;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "triple press recognized", (uint8_t *)v7, 2u);
    }

    -[SBLockHardwareButtonActions performTriplePressActions](self->_buttonActions, "performTriplePressActions");
  }

}

- (void)quadruplePress:(id)a3
{
  id v3;
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  SBLogButtonsLock();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = objc_msgSend(v3, "state");
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "quadruple press: state:%d", (uint8_t *)v5, 8u);
  }

}

- (void)_cancelLongPressRecognizer:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "state") <= 2)
  {
    SBLogButtonsLock();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "name");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ canceled", (uint8_t *)&v6, 0xCu);

    }
    objc_msgSend(v3, "setEnabled:", 0);
    objc_msgSend(v3, "setEnabled:", 1);
  }

}

- (void)cancelLongPress
{
  -[SBLockHardwareButton _cancelLongPressRecognizer:](self, "_cancelLongPressRecognizer:", self->_longPressGestureRecognizer);
  -[SBLockHardwareButton _cancelLongPressRecognizer:](self, "_cancelLongPressRecognizer:", self->_terminalLockLongPressGestureRecognizer);
  -[SBLockHardwareButtonActions performLongPressCancelledActions](self->_buttonActions, "performLongPressCancelledActions");
}

- (void)_reportAggdLoggingForButtonEventIsDownEvent:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v3 = a3;
  -[SBLongPressGestureRecognizer minimumPressDuration](self->_longPressGestureRecognizer, "minimumPressDuration");
  if (v3)
  {
    self->_aggdStartTime = mach_absolute_time();
  }
  else if (self->_aggdStartTime)
  {
    v6 = v5;
    mach_absolute_time();
    BSAbsoluteTimeFromMachTime();
    v8 = v7;
    BSAbsoluteTimeFromMachTime();
    if (v8 - v9 > v6)
      ADPushTimeIntervalForDistributionKeySinceStartTime();
    self->_aggdStartTime = 0;
  }
}

- (void)provider:(id)a3 didUpdateButtonGestureParameters:(id)a4
{
  id v7;
  id v8;

  v7 = a4;
  if (self->_buttonActions == a3)
  {
    v8 = v7;
    objc_storeStrong((id *)&self->_buttonGestureParameters, a4);
    -[SBHardwareButtonGestureParametersProviderBase publishUpdatedParameters:](self, "publishUpdatedParameters:", self->_buttonGestureParameters);
    -[SBLockHardwareButton _reconfigureButtonGestureRecognizers](self, "_reconfigureButtonGestureRecognizers");
    v7 = v8;
  }

}

- (id)hardwareButtonGestureParameters
{
  return self->_buttonGestureParameters;
}

- (void)_cancelGestureRecognizer:(id)a3
{
  id v3;

  v3 = a3;
  if (objc_msgSend(v3, "isEnabled"))
  {
    objc_msgSend(v3, "setEnabled:", 0);
    objc_msgSend(v3, "setEnabled:", 1);
  }

}

- (void)cancelHardwareButtonPress
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_screenshotGestureRecognizer);
  -[SBLockHardwareButton _cancelGestureRecognizer:](self, "_cancelGestureRecognizer:", WeakRetained);

  -[SBLockHardwareButton _cancelGestureRecognizer:](self, "_cancelGestureRecognizer:", self->_singlePressGestureRecognizer);
  -[SBLockHardwareButton _cancelGestureRecognizer:](self, "_cancelGestureRecognizer:", self->_doublePressGestureRecognizer);
  -[SBLockHardwareButton _cancelGestureRecognizer:](self, "_cancelGestureRecognizer:", self->_triplePressGestureRecognizer);
  -[SBLockHardwareButton _cancelGestureRecognizer:](self, "_cancelGestureRecognizer:", self->_quadruplePressGestureRecognizer);
  -[SBLockHardwareButton cancelLongPress](self, "cancelLongPress");
}

- (id)hardwareButtonIdentifier
{
  return CFSTR("Lock");
}

- (SBHardwareButtonCoordinator)hardwareButtonCoordinator
{
  return self->_hardwareButtonCoordinator;
}

- (void)setHardwareButtonCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_hardwareButtonCoordinator, a3);
}

- (SBLockHardwareButtonActions)buttonActions
{
  return self->_buttonActions;
}

- (void)setButtonActions:(id)a3
{
  objc_storeStrong((id *)&self->_buttonActions, a3);
}

- (SBHardwareButtonGestureParameters)buttonGestureParameters
{
  return self->_buttonGestureParameters;
}

- (void)setButtonGestureParameters:(id)a3
{
  objc_storeStrong((id *)&self->_buttonGestureParameters, a3);
}

- (SBPressGestureRecognizer)buttonDownGestureRecognizer
{
  return self->_buttonDownGestureRecognizer;
}

- (void)setButtonDownGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_buttonDownGestureRecognizer, a3);
}

- (SBClickGestureRecognizer)singlePressGestureRecognizer
{
  return self->_singlePressGestureRecognizer;
}

- (void)setSinglePressGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_singlePressGestureRecognizer, a3);
}

- (SBLongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (void)setLongPressGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, a3);
}

- (SBClickGestureRecognizer)doublePressGestureRecognizer
{
  return self->_doublePressGestureRecognizer;
}

- (void)setDoublePressGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_doublePressGestureRecognizer, a3);
}

- (SBClickGestureRecognizer)triplePressGestureRecognizer
{
  return self->_triplePressGestureRecognizer;
}

- (void)setTriplePressGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_triplePressGestureRecognizer, a3);
}

- (SBClickGestureRecognizer)quadruplePressGestureRecognizer
{
  return self->_quadruplePressGestureRecognizer;
}

- (void)setQuadruplePressGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_quadruplePressGestureRecognizer, a3);
}

- (SBLongPressGestureRecognizer)terminalLockLongPressGestureRecognizer
{
  return self->_terminalLockLongPressGestureRecognizer;
}

- (void)setTerminalLockLongPressGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_terminalLockLongPressGestureRecognizer, a3);
}

- (UIGestureRecognizer)screenshotGestureRecognizer
{
  return (UIGestureRecognizer *)objc_loadWeakRetained((id *)&self->_screenshotGestureRecognizer);
}

- (void)setScreenshotGestureRecognizer:(id)a3
{
  objc_storeWeak((id *)&self->_screenshotGestureRecognizer, a3);
}

- (SBLongPressGestureRecognizer)shutdownGestureRecognizer
{
  return (SBLongPressGestureRecognizer *)objc_loadWeakRetained((id *)&self->_shutdownGestureRecognizer);
}

- (void)setShutdownGestureRecognizer:(id)a3
{
  objc_storeWeak((id *)&self->_shutdownGestureRecognizer, a3);
}

- (SBHomeHardwareButton)homeHardwareButton
{
  return (SBHomeHardwareButton *)objc_loadWeakRetained((id *)&self->_homeHardwareButton);
}

- (void)setHomeHardwareButton:(id)a3
{
  objc_storeWeak((id *)&self->_homeHardwareButton, a3);
}

- (SBVolumeHardwareButton)volumeHardwareButton
{
  return (SBVolumeHardwareButton *)objc_loadWeakRetained((id *)&self->_volumeHardwareButton);
}

- (void)setVolumeHardwareButton:(id)a3
{
  objc_storeWeak((id *)&self->_volumeHardwareButton, a3);
}

- (BSInvalidatable)buttonActiveAssertion
{
  return self->_buttonActiveAssertion;
}

- (void)setButtonActiveAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_buttonActiveAssertion, a3);
}

- (int64_t)homeButtonType
{
  return self->_homeButtonType;
}

- (void)setHomeButtonType:(int64_t)a3
{
  self->_homeButtonType = a3;
}

- (unint64_t)configuredMaximumPressCount
{
  return self->_configuredMaximumPressCount;
}

- (void)setConfiguredMaximumPressCount:(unint64_t)a3
{
  self->_configuredMaximumPressCount = a3;
}

- (unint64_t)currentPressCount
{
  return self->_currentPressCount;
}

- (void)setCurrentPressCount:(unint64_t)a3
{
  self->_currentPressCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonActiveAssertion, 0);
  objc_destroyWeak((id *)&self->_volumeHardwareButton);
  objc_destroyWeak((id *)&self->_homeHardwareButton);
  objc_destroyWeak((id *)&self->_shutdownGestureRecognizer);
  objc_destroyWeak((id *)&self->_screenshotGestureRecognizer);
  objc_storeStrong((id *)&self->_terminalLockLongPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_quadruplePressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_triplePressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_doublePressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_singlePressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_buttonDownGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_buttonGestureParameters, 0);
  objc_storeStrong((id *)&self->_buttonActions, 0);
  objc_storeStrong((id *)&self->_hardwareButtonCoordinator, 0);
}

@end
