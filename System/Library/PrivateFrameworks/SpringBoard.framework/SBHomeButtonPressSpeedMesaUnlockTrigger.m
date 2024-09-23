@implementation SBHomeButtonPressSpeedMesaUnlockTrigger

- (SBHomeButtonPressSpeedMesaUnlockTrigger)init
{
  SBHomeButtonPressSpeedMesaUnlockTrigger *v2;
  void *v3;
  void *v4;
  double v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBHomeButtonPressSpeedMesaUnlockTrigger;
  v2 = -[SBHomeButtonPressSpeedMesaUnlockTrigger init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D1BBD8], "rootSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mesaSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "slowPressDuration");
    v2->_slowPressDuration = v5;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[BSAbsoluteMachTimer invalidate](self->_slowPressTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBHomeButtonPressSpeedMesaUnlockTrigger;
  -[SBHomeButtonPressSpeedMesaUnlockTrigger dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return -[SBMesaUnlockTrigger descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBHomeButtonPressSpeedMesaUnlockTrigger;
  -[SBMesaUnlockTrigger succinctDescriptionBuilder](&v11, sel_succinctDescriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendTimeInterval:withName:decomposeUnits:", CFSTR("slowPressDuration"), 0, self->_slowPressDuration);
  v5 = (id)objc_msgSend(v3, "appendBool:withName:", self->_buttonIsDown, CFSTR("buttonIsDown"));
  v6 = (id)objc_msgSend(v3, "appendBool:withName:", self->_fingerIsOn, CFSTR("fingerIsOn"));
  v7 = (id)objc_msgSend(v3, "appendBool:withName:", self->_bioUnlockOccurred, CFSTR("bioUnlockOccurred"));
  v8 = (id)objc_msgSend(v3, "appendBool:withName:", self->_timerFired, CFSTR("timerFired"));
  v9 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBHomeButtonPressSpeedMesaUnlockTrigger _isTimerRunning](self, "_isTimerRunning"), CFSTR("isTimerRunning"));
  return v3;
}

- (BOOL)bioUnlock
{
  NSObject *v3;
  _BOOL4 v4;
  _BOOL4 buttonIsDown;
  _BOOL4 fingerIsOn;
  _DWORD v8[2];
  __int16 v9;
  _BOOL4 v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  self->_bioUnlockOccurred = 1;
  if (-[SBHomeButtonPressSpeedMesaUnlockTrigger _isTimerRunning](self, "_isTimerRunning"))
  {
    SBLogLockScreenMesaUnlockBehaviors();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v8[0]) = 0;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "[SBHomeButtonPressSpeedMesaUnlockTrigger] not unlocking because the timer is running", (uint8_t *)v8, 2u);
    }
    LOBYTE(v4) = 0;
  }
  else
  {
    v4 = -[SBHomeButtonPressSpeedMesaUnlockTrigger _isPrimed](self, "_isPrimed");
    SBLogLockScreenMesaUnlockBehaviors();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      buttonIsDown = self->_buttonIsDown;
      fingerIsOn = self->_fingerIsOn;
      v8[0] = 67109632;
      v8[1] = v4;
      v9 = 1024;
      v10 = buttonIsDown;
      v11 = 1024;
      v12 = fingerIsOn;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "[SBHomeButtonPressSpeedMesaUnlockTrigger] timer isn't running, unlocking: %d (button is down: %d finger is on: %d)", (uint8_t *)v8, 0x14u);
    }
  }

  return v4;
}

- (void)screenOff
{
  NSObject *v3;
  uint8_t v4[16];

  SBLogLockScreenMesaUnlockBehaviors();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "[SBHomeButtonPressSpeedMesaUnlockTrigger] screen off - resetting state", v4, 2u);
  }

  self->_bioUnlockOccurred = 0;
  self->_buttonIsDown = 0;
  self->_fingerIsOn = 0;
  self->_timerFired = 0;
  -[SBHomeButtonPressSpeedMesaUnlockTrigger _invalidateTimer](self, "_invalidateTimer");
}

- (void)menuButtonDown
{
  NSObject *v3;
  uint8_t v4[16];

  SBLogLockScreenMesaUnlockBehaviors();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "[SBHomeButtonPressSpeedMesaUnlockTrigger] menu button down - starting timer for unlock and priming", v4, 2u);
  }

  -[SBHomeButtonPressSpeedMesaUnlockTrigger _startTimer](self, "_startTimer");
  self->_buttonIsDown = 1;
  self->_fingerIsOn = 1;
}

- (void)menuButtonUp
{
  NSObject *v3;
  uint8_t v4[16];

  SBLogLockScreenMesaUnlockBehaviors();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "[SBHomeButtonPressSpeedMesaUnlockTrigger] menu button up - priming", v4, 2u);
  }

  self->_buttonIsDown = 0;
  -[SBHomeButtonPressSpeedMesaUnlockTrigger _evaluateUnlock](self, "_evaluateUnlock");
}

- (void)fingerOff
{
  NSObject *v3;
  uint8_t v4[16];

  SBLogLockScreenMesaUnlockBehaviors();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "[SBHomeButtonPressSpeedMesaUnlockTrigger] finger off - no longer primed", v4, 2u);
  }

  self->_fingerIsOn = 0;
}

- (void)_startTimer
{
  BSAbsoluteMachTimer *v3;
  BSAbsoluteMachTimer *slowPressTimer;
  BSAbsoluteMachTimer *v5;
  double v6;
  double v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  -[SBHomeButtonPressSpeedMesaUnlockTrigger _invalidateTimer](self, "_invalidateTimer");
  objc_initWeak(&location, self);
  v3 = (BSAbsoluteMachTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01690]), "initWithIdentifier:", CFSTR("SBHomeButtonPressSpeedMesaUnlockTrigger.slowPressTimer"));
  slowPressTimer = self->_slowPressTimer;
  self->_slowPressTimer = v3;

  v5 = self->_slowPressTimer;
  -[SBHomeButtonPressSpeedMesaUnlockTrigger slowPressDuration](self, "slowPressDuration");
  v7 = v6;
  v8 = MEMORY[0x1E0C80D38];
  v9 = MEMORY[0x1E0C80D38];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__SBHomeButtonPressSpeedMesaUnlockTrigger__startTimer__block_invoke;
  v10[3] = &unk_1E8E9EEC8;
  objc_copyWeak(&v11, &location);
  -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v5, "scheduleWithFireInterval:leewayInterval:queue:handler:", v8, v10, v7, 0.0);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __54__SBHomeButtonPressSpeedMesaUnlockTrigger__startTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_timerFired");

}

- (void)_invalidateTimer
{
  BSAbsoluteMachTimer *slowPressTimer;

  -[BSAbsoluteMachTimer invalidate](self->_slowPressTimer, "invalidate");
  slowPressTimer = self->_slowPressTimer;
  self->_slowPressTimer = 0;

}

- (void)_timerFired
{
  self->_timerFired = 1;
  -[SBHomeButtonPressSpeedMesaUnlockTrigger _evaluateUnlock](self, "_evaluateUnlock");
  -[SBHomeButtonPressSpeedMesaUnlockTrigger _invalidateTimer](self, "_invalidateTimer");
}

- (BOOL)_isTimerRunning
{
  return self->_slowPressTimer != 0;
}

- (void)_evaluateUnlock
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 bioUnlockOccurred;
  _BOOL4 timerFired;
  _BOOL4 buttonIsDown;
  _BOOL4 fingerIsOn;
  _DWORD v10[2];
  __int16 v11;
  _BOOL4 v12;
  __int16 v13;
  _BOOL4 v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_bioUnlockOccurred
    && self->_timerFired
    && -[SBHomeButtonPressSpeedMesaUnlockTrigger _isPrimed](self, "_isPrimed"))
  {
    SBLogLockScreenMesaUnlockBehaviors();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "[SBHomeButtonPressSpeedMesaUnlockTrigger] unlocking | match occurred, timer fired, button is up, and finger is still on", (uint8_t *)v10, 2u);
    }

    -[SBMesaUnlockTrigger delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mesaUnlockTriggerFired:", self);

    -[SBHomeButtonPressSpeedMesaUnlockTrigger _invalidateTimer](self, "_invalidateTimer");
  }
  else
  {
    SBLogLockScreenMesaUnlockBehaviors();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      bioUnlockOccurred = self->_bioUnlockOccurred;
      timerFired = self->_timerFired;
      buttonIsDown = self->_buttonIsDown;
      fingerIsOn = self->_fingerIsOn;
      v10[0] = 67109888;
      v10[1] = bioUnlockOccurred;
      v11 = 1024;
      v12 = timerFired;
      v13 = 1024;
      v14 = buttonIsDown;
      v15 = 1024;
      v16 = fingerIsOn;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "[SBHomeButtonPressSpeedMesaUnlockTrigger] not unlocking | match occurred: %d timer fired: %d button is still down: %d finger is still on: %d", (uint8_t *)v10, 0x1Au);
    }

  }
}

- (BOOL)_isPrimed
{
  return !self->_buttonIsDown && self->_fingerIsOn;
}

- (double)slowPressDuration
{
  return self->_slowPressDuration;
}

- (void)setSlowPressDuration:(double)a3
{
  self->_slowPressDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slowPressTimer, 0);
}

@end
