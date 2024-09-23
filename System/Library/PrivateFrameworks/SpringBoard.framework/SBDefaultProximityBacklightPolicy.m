@implementation SBDefaultProximityBacklightPolicy

- (SBDefaultProximityBacklightPolicy)initWithConfiguration:(id)a3
{
  id v4;
  SBDefaultProximityBacklightPolicy *v5;
  uint64_t v6;
  SBBacklightController *backlightController;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBDefaultProximityBacklightPolicy;
  v5 = -[SBDefaultProximityBacklightPolicy init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "backlightController");
    v6 = objc_claimAutoreleasedReturnValue();
    backlightController = v5->_backlightController;
    v5->_backlightController = (SBBacklightController *)v6;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v5, sel__backlightWillUndim_, *MEMORY[0x1E0DAC2E0], 0);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SBDefaultProximityBacklightPolicy;
  -[SBDefaultProximityBacklightPolicy dealloc](&v4, sel_dealloc);
}

- (void)proximitySensorManager:(id)a3 objectWithinProximityDidChange:(BOOL)a4
{
  if (a4)
    -[SBDefaultProximityBacklightPolicy _scheduleBacklightFactorToZeroAfterDefaultDuration](self, "_scheduleBacklightFactorToZeroAfterDefaultDuration", a3);
  else
    -[SBDefaultProximityBacklightPolicy _restoreBacklightFactor](self, "_restoreBacklightFactor", a3);
}

- (void)_scheduleBacklightFactorToZeroAfterDefaultDuration
{
  -[SBDefaultProximityBacklightPolicy _scheduleBacklightFactorToZeroAfterDebounceDuration:](self, "_scheduleBacklightFactorToZeroAfterDebounceDuration:", 0.5);
}

- (void)_scheduleBacklightFactorToZeroAfterDebounceDuration:(double)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[SBDefaultProximityBacklightPolicy _cancelScheduledBacklightFactorToZero](self, "_cancelScheduledBacklightFactorToZero");
  SBLogProximitySensor();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Scheduling backlight to turn off in %{public}@s.", (uint8_t *)&v8, 0xCu);

  }
  self->_scheduled = 1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *MEMORY[0x1E0C99860]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDefaultProximityBacklightPolicy performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel__turnBacklightOff, 0, v7, a3);

}

- (void)_cancelScheduledBacklightFactorToZero
{
  BSInvalidatable *idleTimerDisableAssertion;
  NSObject *v4;
  uint8_t v5[16];

  -[BSInvalidatable invalidate](self->_idleTimerDisableAssertion, "invalidate");
  idleTimerDisableAssertion = self->_idleTimerDisableAssertion;
  self->_idleTimerDisableAssertion = 0;

  if (self->_scheduled)
  {
    SBLogProximitySensor();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Cancelling scheduled backlight change.", v5, 2u);
    }

    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__turnBacklightOff, 0);
  }
}

- (void)_restoreBacklightFactor
{
  BSInvalidatable *captureButtonSuppressionAssertion;
  int64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  uint8_t v7[16];
  uint8_t buf[16];

  -[BSInvalidatable invalidate](self->_captureButtonSuppressionAssertion, "invalidate");
  captureButtonSuppressionAssertion = self->_captureButtonSuppressionAssertion;
  self->_captureButtonSuppressionAssertion = 0;

  -[SBDefaultProximityBacklightPolicy _cancelScheduledBacklightFactorToZero](self, "_cancelScheduledBacklightFactorToZero");
  v4 = -[SBBacklightController lastBacklightChangeSource](self->_backlightController, "lastBacklightChangeSource");
  SBLogProximitySensor();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4 == 13)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Restoring original backlight factor.", buf, 2u);
    }

    -[SBBacklightController _undimFromSource:](self->_backlightController, "_undimFromSource:", 13);
  }
  else
  {
    if (v6)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Not restoring original backlight factor, because someone else modified the backlight since we last turned it off.", v7, 2u);
    }

  }
}

- (void)_backlightWillUndim:(id)a3
{
  BSInvalidatable *captureButtonSuppressionAssertion;
  NSObject *v5;
  uint8_t v6[16];

  -[BSInvalidatable invalidate](self->_captureButtonSuppressionAssertion, "invalidate", a3);
  captureButtonSuppressionAssertion = self->_captureButtonSuppressionAssertion;
  self->_captureButtonSuppressionAssertion = 0;

  if (self->_scheduled)
  {
    SBLogProximitySensor();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Backlight will undim outside of our control - cancelling any scheduled changes.", v6, 2u);
    }

    -[SBDefaultProximityBacklightPolicy _cancelScheduledBacklightFactorToZero](self, "_cancelScheduledBacklightFactorToZero");
  }
}

- (void)_turnBacklightOff
{
  NSObject *v4;
  SBIdleTimerGlobalCoordinator *idleTimerGlobalCoordinator;
  BSInvalidatable *v6;
  BSInvalidatable *idleTimerDisableAssertion;
  void *v8;
  BSInvalidatable *v9;
  BSInvalidatable *captureButtonSuppressionAssertion;
  void *v11;
  uint8_t v12[16];

  SBLogProximitySensor();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Turning off the backlight.", v12, 2u);
  }

  self->_scheduled = 0;
  idleTimerGlobalCoordinator = self->_idleTimerGlobalCoordinator;
  if (!idleTimerGlobalCoordinator)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDefaultProximityBacklightPolicy.m"), 132, CFSTR("-_turnBacklightOff called without idle timer global coordinator"));

    idleTimerGlobalCoordinator = self->_idleTimerGlobalCoordinator;
  }
  -[SBIdleTimerGlobalCoordinator acquireIdleTimerDisableAssertionForReason:](idleTimerGlobalCoordinator, "acquireIdleTimerDisableAssertionForReason:", CFSTR("ObjectInProximity"));
  v6 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  idleTimerDisableAssertion = self->_idleTimerDisableAssertion;
  self->_idleTimerDisableAssertion = v6;

  if (!self->_captureButtonSuppressionAssertion)
  {
    objc_msgSend((id)SBApp, "captureButtonRestrictionCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "inhibitCaptureButtonActionAssertionWithReason:", CFSTR("Object Within Proximity Turned Off Screen"));
    v9 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    captureButtonSuppressionAssertion = self->_captureButtonSuppressionAssertion;
    self->_captureButtonSuppressionAssertion = v9;

  }
  -[SBBacklightController setBacklightState:source:](self->_backlightController, "setBacklightState:source:", 4, 13);
}

- (SBIdleTimerGlobalCoordinator)idleTimerGlobalCoordinator
{
  return self->_idleTimerGlobalCoordinator;
}

- (void)setIdleTimerGlobalCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_idleTimerGlobalCoordinator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleTimerGlobalCoordinator, 0);
  objc_storeStrong((id *)&self->_captureButtonSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_idleTimerDisableAssertion, 0);
  objc_storeStrong((id *)&self->_backlightController, 0);
}

@end
