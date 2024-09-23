@implementation SBMotionDetectionWakeController

- (void)dealloc
{
  objc_super v3;

  -[SBBacklightController removeObserver:](self->_backlightController, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)SBMotionDetectionWakeController;
  -[SBMotionDetectionWakeController dealloc](&v3, sel_dealloc);
}

- (id)acquireMotionDetectionWakeAssertionForReason:(id)a3
{
  id v4;
  BSCompoundAssertion *enablementAssertions;
  void *v6;
  BSCompoundAssertion *v7;
  BSCompoundAssertion *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id location;

  v4 = a3;
  enablementAssertions = self->_enablementAssertions;
  if (!enablementAssertions)
  {
    objc_initWeak(&location, self);
    v6 = (void *)MEMORY[0x1E0D01718];
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __80__SBMotionDetectionWakeController_acquireMotionDetectionWakeAssertionForReason___block_invoke;
    v14 = &unk_1E8EA3688;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v6, "assertionWithIdentifier:stateDidChangeHandler:", CFSTR("Motion Detection Wake Enablement"), &v11);
    v7 = (BSCompoundAssertion *)objc_claimAutoreleasedReturnValue();
    v8 = self->_enablementAssertions;
    self->_enablementAssertions = v7;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
    enablementAssertions = self->_enablementAssertions;
  }
  -[BSCompoundAssertion acquireForReason:](enablementAssertions, "acquireForReason:", v4, v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __80__SBMotionDetectionWakeController_acquireMotionDetectionWakeAssertionForReason___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  uint64_t v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v4 = objc_msgSend(v3, "isActive");

  objc_msgSend(WeakRetained, "_setRequested:", v4);
}

- (void)setRequireScreenOff:(BOOL)a3
{
  if (self->_requireScreenOff != a3)
  {
    self->_requireScreenOff = a3;
    -[SBMotionDetectionWakeController _evaluateEnablement](self, "_evaluateEnablement");
  }
}

- (void)_setRequested:(BOOL)a3
{
  SBBacklightController *backlightController;
  SBBacklightController *v5;
  SBBacklightController *v6;

  if (self->_requested != a3)
  {
    self->_requested = a3;
    backlightController = self->_backlightController;
    if (a3)
    {
      if (!backlightController)
      {
        +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
        v5 = (SBBacklightController *)objc_claimAutoreleasedReturnValue();
        v6 = self->_backlightController;
        self->_backlightController = v5;

        backlightController = self->_backlightController;
      }
      -[SBBacklightController addObserver:](backlightController, "addObserver:", self);
    }
    else
    {
      -[SBBacklightController removeObserver:](backlightController, "removeObserver:", self);
    }
    -[SBMotionDetectionWakeController _evaluateEnablement](self, "_evaluateEnablement");
  }
}

- (void)_evaluateEnablement
{
  _BOOL4 v3;
  _BOOL4 v4;
  uint64_t v5;

  v3 = -[SBMotionDetectionWakeController _isRequested](self, "_isRequested");
  v4 = -[SBBacklightController screenIsOn](self->_backlightController, "screenIsOn");
  if (v3)
    v5 = !self->_requireScreenOff || !v4;
  else
    v5 = 0;
  -[SBMotionDetectionWakeController _setEnabled:](self, "_setEnabled:", v5);
}

- (void)_setEnabled:(BOOL)a3
{
  AMMotionDetectionTriggerManager *v4;
  AMMotionDetectionTriggerManager *triggerManager;
  NSObject *v6;
  _BOOL4 enabled;
  _BOOL8 v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    if (a3 && !self->_triggerManager)
    {
      v4 = (AMMotionDetectionTriggerManager *)objc_alloc_init(MEMORY[0x1E0CF78C8]);
      triggerManager = self->_triggerManager;
      self->_triggerManager = v4;

      -[AMMotionDetectionTriggerManager addObserver:queue:](self->_triggerManager, "addObserver:queue:", self, MEMORY[0x1E0C80D38]);
    }
    SBLogBacklight();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      enabled = self->_enabled;
      v9[0] = 67109120;
      v9[1] = enabled;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "setting motion detection trigger enabled = %{BOOL}u", (uint8_t *)v9, 8u);
    }

    -[AMMotionDetectionTriggerManager setMotionDetectionEnabled:](self->_triggerManager, "setMotionDetectionEnabled:", self->_enabled);
    if (self->_enabled)
    {
      v8 = 1;
    }
    else
    {
      -[SBMotionDetectionWakeController _setMotionDetected:](self, "_setMotionDetected:", 0);
      v8 = self->_enabled;
    }
    SBWorkspaceSetPreventIdleSleepForReason(v8, CFSTR("motion-to-wake"));
  }
}

- (void)_setMotionDetected:(BOOL)a3
{
  id v4;

  if (self->_motionDetected != a3)
  {
    self->_motionDetected = a3;
    -[SBMotionDetectionWakeController delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "motionDetectionWakeController:motionDetectStateChanged:", self, self->_motionDetected);

  }
}

- (void)motionDetectionManager:(id)a3 didUpdateMotionDetectionTriggerState:(unint64_t)a4
{
  NSObject *v6;
  NSObject *v7;
  int v8;
  unint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  SBLogBacklight();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = a4;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "didUpdateMotionDetectionTriggerState: 0x%llx", (uint8_t *)&v8, 0xCu);
  }

  if (-[SBMotionDetectionWakeController _isEnabled](self, "_isEnabled"))
  {
    if ((a4 & 0xFFFFFFFFFFFFFE31) != 0)
    {
      SBLogBacklight();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[SBMotionDetectionWakeController motionDetectionManager:didUpdateMotionDetectionTriggerState:].cold.1(a4, v7);

    }
    else
    {
      -[SBMotionDetectionWakeController _setMotionDetected:](self, "_setMotionDetected:", a4 != 0);
    }
  }
}

- (BOOL)isMotionDetected
{
  return self->_motionDetected;
}

- (BOOL)requireScreenOff
{
  return self->_requireScreenOff;
}

- (BOOL)_isRequested
{
  return self->_requested;
}

- (BOOL)_isEnabled
{
  return self->_enabled;
}

- (SBMotionDetectionWakeControllerDelegate)delegate
{
  return (SBMotionDetectionWakeControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backlightController, 0);
  objc_storeStrong((id *)&self->_triggerManager, 0);
  objc_storeStrong((id *)&self->_enablementAssertions, 0);
}

- (void)motionDetectionManager:(uint64_t)a1 didUpdateMotionDetectionTriggerState:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "received invalid motion detection trigger state 0x%llx", (uint8_t *)&v2, 0xCu);
}

@end
