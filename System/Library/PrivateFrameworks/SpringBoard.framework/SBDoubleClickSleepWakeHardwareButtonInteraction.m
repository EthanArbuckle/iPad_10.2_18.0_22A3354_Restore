@implementation SBDoubleClickSleepWakeHardwareButtonInteraction

- (SBDoubleClickSleepWakeHardwareButtonInteraction)initWithProximitySensorManager:(id)a3
{
  id v5;
  SBDoubleClickSleepWakeHardwareButtonInteraction *v6;
  SBDoubleClickSleepWakeHardwareButtonInteraction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBDoubleClickSleepWakeHardwareButtonInteraction;
  v6 = -[SBSleepWakeHardwareButtonInteraction init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_proximitySensorManager, a3);

  return v7;
}

- (BOOL)consumeInitialPressDown
{
  objc_super v4;

  -[SBDoubleClickSleepWakeHardwareButtonInteraction _resumeProxForReason:](self, "_resumeProxForReason:", CFSTR("Initial press down - stuck request?"));
  v4.receiver = self;
  v4.super_class = (Class)SBDoubleClickSleepWakeHardwareButtonInteraction;
  return -[SBSleepWakeHardwareButtonInteraction consumeInitialPressDown](&v4, sel_consumeInitialPressDown);
}

- (BOOL)consumeInitialPressUp
{
  _BOOL4 v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  __int16 v8;
  __int16 v9;

  v3 = -[SBSleepWakeHardwareButtonInteraction inhibitNextSinglePressUp](self, "inhibitNextSinglePressUp");
  if (v3)
  {
    SBLogButtonsInteraction();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 0;
      v5 = "wake/sleep x2 inital press up inhibited";
      v6 = (uint8_t *)&v9;
LABEL_7:
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
    }
  }
  else
  {
    if (!-[SBProximitySensorManager isObjectInProximity](self->_proximitySensorManager, "isObjectInProximity"))
    {
      -[SBDoubleClickSleepWakeHardwareButtonInteraction _suspendProx](self, "_suspendProx");
      -[SBDoubleClickSleepWakeHardwareButtonInteraction _resumeProxAfterMultiplePressIntervalForReason:](self, "_resumeProxAfterMultiplePressIntervalForReason:", CFSTR("Multiple press timeout"));
      return v3;
    }
    SBLogButtonsInteraction();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 0;
      v5 = "wake/sleep x2 not suspending prox because objectInProximity";
      v6 = (uint8_t *)&v8;
      goto LABEL_7;
    }
  }

  return v3;
}

- (BOOL)consumeSecondPressDown
{
  -[SBDoubleClickSleepWakeHardwareButtonInteraction _resumeProxForReason:](self, "_resumeProxForReason:", CFSTR("second press down"));
  return 0;
}

- (void)observeFinalPressUp
{
  -[SBDoubleClickSleepWakeHardwareButtonInteraction _resumeProxForReason:](self, "_resumeProxForReason:", CFSTR("final press up"));
  -[SBSleepWakeHardwareButtonInteraction setInhibitNextSinglePressUp:](self, "setInhibitNextSinglePressUp:", 1);
}

- (void)observeSinglePressDidFail
{
  -[SBDoubleClickSleepWakeHardwareButtonInteraction _resumeProxForReason:](self, "_resumeProxForReason:", CFSTR("single press did fail"));
}

- (void)_performSleep
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBDoubleClickSleepWakeHardwareButtonInteraction;
  -[SBSleepWakeHardwareButtonInteraction _performSleep](&v3, sel__performSleep);
  -[SBDoubleClickSleepWakeHardwareButtonInteraction _resumeProxForReason:](self, "_resumeProxForReason:", CFSTR("sleeping"));
}

- (void)_performWake
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBDoubleClickSleepWakeHardwareButtonInteraction;
  -[SBSleepWakeHardwareButtonInteraction _performWake](&v3, sel__performWake);
  -[SBDoubleClickSleepWakeHardwareButtonInteraction _resumeProxForReason:](self, "_resumeProxForReason:", CFSTR("waking"));
}

- (void)_suspendProx
{
  NSObject *v3;
  void *v4;
  BSInvalidatable *v5;
  BSInvalidatable *proxLockAssertion;
  uint8_t v7[16];

  -[SBDoubleClickSleepWakeHardwareButtonInteraction _cancelPreviousResumeProxRequests](self, "_cancelPreviousResumeProxRequests");
  if (!self->_proxLockAssertion)
  {
    SBLogButtonsInteraction();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "wake/sleep x2 suspend prox", v7, 2u);
    }

    -[SBSleepWakeHardwareButtonInteraction sensorModeController](self, "sensorModeController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suspendProximityDetectionForSource:reason:", 0, CFSTR("double-click interval"));
    v5 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    proxLockAssertion = self->_proxLockAssertion;
    self->_proxLockAssertion = v5;

  }
}

- (void)_resumeProxForReason:(id)a3
{
  id v4;
  NSObject *v5;
  BSInvalidatable *proxLockAssertion;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBDoubleClickSleepWakeHardwareButtonInteraction _cancelPreviousResumeProxRequests](self, "_cancelPreviousResumeProxRequests");
  if (self->_proxLockAssertion)
  {
    SBLogButtonsInteraction();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = v4;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "wake/sleep x2 resume prox: %{public}@", (uint8_t *)&v7, 0xCu);
    }

    -[BSInvalidatable invalidate](self->_proxLockAssertion, "invalidate");
    proxLockAssertion = self->_proxLockAssertion;
    self->_proxLockAssertion = 0;

  }
}

- (void)_resumeProxAfterMultiplePressIntervalForReason:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)MEMORY[0x1E0DE7910];
  v5 = a3;
  objc_msgSend(v4, "cancelPreviousPerformRequestsWithTarget:", self);
  -[SBSleepWakeHardwareButtonInteraction multiplePressTimeInterval](self, "multiplePressTimeInterval");
  -[SBDoubleClickSleepWakeHardwareButtonInteraction performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__resumeProxForReason_, v5);

}

- (void)_cancelPreviousResumeProxRequests
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
}

- (BSInvalidatable)proxLockAssertion
{
  return self->_proxLockAssertion;
}

- (void)setProxLockAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_proxLockAssertion, a3);
}

- (SBProximitySensorManager)proximitySensorManager
{
  return self->_proximitySensorManager;
}

- (void)setProximitySensorManager:(id)a3
{
  objc_storeStrong((id *)&self->_proximitySensorManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proximitySensorManager, 0);
  objc_storeStrong((id *)&self->_proxLockAssertion, 0);
}

@end
