@implementation SBBacklightIdleTimer

- (SBBacklightIdleTimer)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBBacklightIdleTimer.m"), 70, CFSTR("Use initWithConfigurationIdentifier:"));

  return 0;
}

- (SBBacklightIdleTimer)initWithConfigurationIdentifier:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  SBBacklightIdleTimer *v8;

  v4 = (objc_class *)MEMORY[0x1E0D3A8A0];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = (void *)objc_msgSend(v6, "initWithConfigurationIdentifier:delegate:calloutQueue:", v5, self, MEMORY[0x1E0C80D38]);

  v8 = -[SBBacklightIdleTimer _initWithAttentionAwareTimer:](self, "_initWithAttentionAwareTimer:", v7);
  return v8;
}

- (id)_initWithAttentionAwareTimer:(id)a3
{
  id v5;
  SBBacklightIdleTimer *v6;
  SBBacklightIdleTimer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBBacklightIdleTimer;
  v6 = -[SBBacklightIdleTimer init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_timeMultiplier = 1.0;
    objc_storeStrong((id *)&v6->_attentionAwareTimer, a3);
  }

  return v7;
}

- (NSString)description
{
  return (NSString *)-[SBBacklightIdleTimer descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBBacklightIdleTimer succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBBacklightIdleTimer descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  unint64_t expectation;
  __CFString *v7;
  id v8;

  -[SBBacklightIdleTimer succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_descriptor, CFSTR("descriptor"));
  expectation = self->_expectation;
  if (expectation > 3)
    v7 = 0;
  else
    v7 = off_1E8EADEF8[expectation];
  objc_msgSend(v4, "appendString:withName:", v7, CFSTR("expectation"));
  v8 = (id)objc_msgSend(v4, "appendBool:withName:", self->_requiresManualReset, CFSTR("requiresManualReset"));
  return v4;
}

- (BOOL)isDisabled
{
  return 0;
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBBacklightIdleTimer;
  -[SBIdleTimerBase reset](&v3, sel_reset);
  if ((-[ITAttentionAwareIdleTimer isEnabled](self->_attentionAwareTimer, "isEnabled") & 1) == 0)
    -[ITAttentionAwareIdleTimer setEnabled:](self->_attentionAwareTimer, "setEnabled:", 1);
  -[SBBacklightIdleTimer _resetExpectation](self, "_resetExpectation");
  -[SBBacklightIdleTimer _reconfigureAttentionClientAndReset:](self, "_reconfigureAttentionClientAndReset:", 1);
  -[SBIdleTimerBase _makeObserversPerformSelector:](self, "_makeObserversPerformSelector:", sel_idleTimerDidRefresh_);
}

- (id)stateCaptureDescriptionWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[SBBacklightIdleTimer descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIdleTimerDescriptor auditReasonsForStateCapture](self->_descriptor, "auditReasonsForStateCapture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendArraySection:withName:skipIfEmpty:", v5, CFSTR("auditReasons"), 0);

  objc_msgSend(v4, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)idleTimer:(id)a3 attentionLostTimeoutDidExpire:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  int v16;
  int v17;
  unint64_t expectation;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  unint64_t v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  unint64_t v27;
  NSObject *v28;
  __CFString *v29;
  unint64_t v30;
  __CFString *v31;
  int v32;
  id v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  __CFString *v39;
  __int16 v40;
  __CFString *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogIdleTimer();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v32 = 138543618;
    v33 = v6;
    v34 = 2114;
    v35 = v7;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "attention event with timeout: %{public}@ for descriptor: %{public}@", (uint8_t *)&v32, 0x16u);
  }

  -[SBBacklightIdleTimer _effectiveWarnTimeoutDuration](self, "_effectiveWarnTimeoutDuration");
  v10 = v9;
  -[SBBacklightIdleTimer _effectiveQuickUnwarnTimeoutDurationForWarnTimeout:](self, "_effectiveQuickUnwarnTimeoutDurationForWarnTimeout:");
  v12 = v11;
  -[SBBacklightIdleTimer _effectiveExpireTimeoutDuration](self, "_effectiveExpireTimeoutDuration");
  v14 = v13;
  if ((BSFloatIsZero() & 1) != 0)
  {
    v15 = 3;
  }
  else if (BSFloatEqualToFloat())
  {
    v15 = 3;
  }
  else
  {
    v15 = 1;
  }
  if ((BSFloatIsZero() & 1) != 0)
    v16 = 0;
  else
    v16 = BSFloatEqualToFloat() ^ 1;
  if ((BSFloatIsZero() & 1) != 0)
    v17 = 0;
  else
    v17 = BSFloatEqualToFloat() ^ 1;
  expectation = self->_expectation;
  v19 = objc_msgSend(v6, "identifier");
  switch(v19)
  {
    case 3:
      SBLogIdleTimer();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "duration");
        v32 = 134218240;
        v33 = v24;
        v34 = 2048;
        v35 = v14;
        _os_log_impl(&dword_1D0540000, v23, OS_LOG_TYPE_DEFAULT, "attention event: expire @ %g -- should be %g", (uint8_t *)&v32, 0x16u);
      }

      self->_expectation = v15;
      -[SBIdleTimerBase _makeObserversPerformSelector:](self, "_makeObserversPerformSelector:", sel_idleTimerDidExpire_);
      -[SBBacklightIdleTimer _stopIfManual](self, "_stopIfManual");
      break;
    case 2:
      SBLogIdleTimer();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "duration");
        v32 = 134218240;
        v33 = v26;
        v34 = 2048;
        v35 = v12;
        _os_log_impl(&dword_1D0540000, v25, OS_LOG_TYPE_DEFAULT, "attention event: quickWarn @ %g -- should be %g", (uint8_t *)&v32, 0x16u);
      }

      if (v17)
        v27 = 3;
      else
        v27 = 1;
      self->_expectation = v27;
      break;
    case 1:
      SBLogIdleTimer();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "duration");
        v32 = 134218240;
        v33 = v21;
        v34 = 2048;
        v35 = v10;
        _os_log_impl(&dword_1D0540000, v20, OS_LOG_TYPE_DEFAULT, "attention event: warn @ %g -- should be %g", (uint8_t *)&v32, 0x16u);
      }

      v22 = 3;
      if (!v17)
        v22 = 1;
      if (v16)
        v22 = 2;
      self->_expectation = v22;
      -[SBIdleTimerBase _makeObserversPerformSelector:](self, "_makeObserversPerformSelector:", sel_idleTimerDidWarn_);
      break;
  }
  SBLogIdleTimer();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    if (expectation > 3)
      v29 = 0;
    else
      v29 = off_1E8EADEF8[expectation];
    v30 = self->_expectation;
    if (v30 > 3)
      v31 = 0;
    else
      v31 = off_1E8EADEF8[v30];
    v32 = 134219010;
    v33 = v12;
    v34 = 2048;
    v35 = v10;
    v36 = 2048;
    v37 = v14;
    v38 = 2114;
    v39 = v29;
    v40 = 2114;
    v41 = v31;
    _os_log_impl(&dword_1D0540000, v28, OS_LOG_TYPE_DEFAULT, "attention event: looking for quickWarn:%g warn:%g total:%g expecting:%{public}@ -> %{public}@", (uint8_t *)&v32, 0x34u);
  }

}

- (void)idleTimerDidReset:(id)a3 forUserAttention:(unint64_t)a4 at:(double)a5
{
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  unint64_t v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  SBLogIdleTimer();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 134218240;
    v12 = a4;
    v13 = 2048;
    v14 = a5;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "attention event: user event: %lu reset timer at: %g", (uint8_t *)&v11, 0x16u);
  }

  if (self->_expectation == 2)
  {
    SBLogIdleTimer();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "attention event: reconfigure for extended timeout", (uint8_t *)&v11, 2u);
    }

    self->_expectation = 1;
    self->_timeMultiplier = 2.0;
    -[SBBacklightIdleTimer _reconfigureAttentionClientAndReset:](self, "_reconfigureAttentionClientAndReset:", 0);
  }
  else
  {
    -[SBBacklightIdleTimer _resetExpectation](self, "_resetExpectation");
  }
  SBLogIdleTimer();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "attention event: refresh", (uint8_t *)&v11, 2u);
  }

  -[SBIdleTimerBase _makeObserversPerformSelector:](self, "_makeObserversPerformSelector:", sel_idleTimerDidResetForUserAttention_);
}

- (void)setDescriptor:(id)a3
{
  SBIdleTimerDescriptor *v5;
  uint64_t v6;
  SBIdleTimerDescriptor *v7;

  v5 = (SBIdleTimerDescriptor *)a3;
  if (self->_descriptor != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_descriptor, a3);
    v6 = -[SBIdleTimerDescriptor timerMode](v7, "timerMode");
    v5 = v7;
    self->_requiresManualReset = v6 == 2;
    if (!self->_expectation)
    {
      -[SBBacklightIdleTimer _reconfigureAttentionClientAndReset:](self, "_reconfigureAttentionClientAndReset:", 0);
      -[SBBacklightIdleTimer _resetExpectation](self, "_resetExpectation");
      v5 = v7;
    }
  }

}

- (BOOL)isActivated
{
  return -[ITAttentionAwareIdleTimer isEnabled](self->_attentionAwareTimer, "isEnabled");
}

- (void)setActivated:(BOOL)a3
{
  -[ITAttentionAwareIdleTimer setEnabled:](self->_attentionAwareTimer, "setEnabled:", a3);
}

- (void)_stopIfManual
{
  if (-[SBBacklightIdleTimer requiresManualReset](self, "requiresManualReset"))
    -[ITAttentionAwareIdleTimer setEnabled:](self->_attentionAwareTimer, "setEnabled:", 0);
}

- (double)_effectiveWarnTimeoutDuration
{
  double result;

  -[SBIdleTimerDescriptor warnInterval](self->_descriptor, "warnInterval");
  -[SBBacklightIdleTimer _effectiveTimeoutForBaseTimeout:](self, "_effectiveTimeoutForBaseTimeout:");
  return result;
}

- (double)_effectiveQuickUnwarnTimeoutDurationForWarnTimeout:(double)a3
{
  double v5;
  double v6;
  int v7;
  int v8;

  -[SBIdleTimerDescriptor quickUnwarnInterval](self->_descriptor, "quickUnwarnInterval");
  -[SBBacklightIdleTimer _effectiveTimeoutForBaseTimeout:](self, "_effectiveTimeoutForBaseTimeout:");
  v6 = v5;
  if ((BSFloatIsZero() & 1) == 0)
  {
    v7 = BSFloatEqualToFloat();
    if (v6 - a3 <= 2.0)
      v8 = 1;
    else
      v8 = v7;
    if (!v8)
      return a3 + 2.0;
  }
  return v6;
}

- (double)_effectiveExpireTimeoutDuration
{
  double result;

  -[SBIdleTimerDescriptor totalInterval](self->_descriptor, "totalInterval");
  -[SBBacklightIdleTimer _effectiveTimeoutForBaseTimeout:](self, "_effectiveTimeoutForBaseTimeout:");
  return result;
}

- (double)_effectiveTimeoutForBaseTimeout:(double)a3
{
  if (self->_timeMultiplier != 1.0 && (BSFloatIsZero() & 1) == 0 && (BSFloatEqualToFloat() & 1) == 0)
    return self->_timeMultiplier * a3;
  return a3;
}

- (void)_resetExpectation
{
  unint64_t expectation;
  NSObject *v4;
  unint64_t v5;
  int v6;
  NSObject *v7;
  __CFString *v8;
  unint64_t v9;
  __CFString *v10;
  int v11;
  __CFString *v12;
  __int16 v13;
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  expectation = self->_expectation;
  if (self->_timeMultiplier > 1.0)
  {
    SBLogIdleTimer();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "attention reset expectation: removing extended timeout", (uint8_t *)&v11, 2u);
    }

    self->_timeMultiplier = 1.0;
    -[SBBacklightIdleTimer _reconfigureAttentionClientAndReset:](self, "_reconfigureAttentionClientAndReset:", 0);
  }
  -[SBIdleTimerDescriptor warnInterval](self->_descriptor, "warnInterval");
  if ((BSFloatIsZero() & 1) != 0)
  {
    v5 = 3;
  }
  else
  {
    v6 = BSFloatEqualToFloat();
    v5 = 3;
    if (!v6)
      v5 = 1;
  }
  self->_expectation = v5;
  if (v5 != expectation)
  {
    SBLogIdleTimer();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if (expectation > 3)
        v8 = 0;
      else
        v8 = off_1E8EADEF8[expectation];
      v9 = self->_expectation;
      if (v9 > 3)
        v10 = 0;
      else
        v10 = off_1E8EADEF8[v9];
      v11 = 138543618;
      v12 = v8;
      v13 = 2114;
      v14 = v10;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "attention expectation: %{public}@ -> %{public}@", (uint8_t *)&v11, 0x16u);
    }

  }
}

- (void)_reconfigureAttentionClientAndReset:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  double v6;
  double v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  int v23;
  SBBacklightIdleTimer *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v3 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0D3A8B0]);
  -[SBIdleTimerDescriptor sampleInterval](self->_descriptor, "sampleInterval");
  v7 = v6;
  if ((BSFloatIsZero() & 1) != 0)
    v8 = 0;
  else
    v8 = BSFloatEqualToFloat() ^ 1;
  if (-[SBIdleTimerDescriptor timerMode](self->_descriptor, "timerMode") == 1)
    v9 = 2654;
  else
    v9 = 2134;
  if (v8)
    v10 = v9 | 0x80;
  else
    v10 = v9;
  objc_msgSend(v5, "setAttentionEventMaintenanceMask:recoveryMask:", v10);
  -[SBBacklightIdleTimer _effectiveWarnTimeoutDuration](self, "_effectiveWarnTimeoutDuration");
  v12 = v11;
  -[SBBacklightIdleTimer _effectiveQuickUnwarnTimeoutDurationForWarnTimeout:](self, "_effectiveQuickUnwarnTimeoutDurationForWarnTimeout:");
  v14 = v13;
  -[SBBacklightIdleTimer _effectiveExpireTimeoutDuration](self, "_effectiveExpireTimeoutDuration");
  v16 = v15;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
  if ((BSFloatIsZero() & 1) == 0 && (BSFloatEqualToFloat() & 1) == 0)
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A8A8]), "initWithDuration:identifier:", 1, v12);
    objc_msgSend(v17, "addObject:", v18);
    if ((BSFloatIsZero() & 1) == 0 && (BSFloatEqualToFloat() & 1) == 0)
    {
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A8A8]), "initWithDuration:identifier:", 2, v14);
      objc_msgSend(v17, "addObject:", v19);

    }
  }
  if ((BSFloatIsZero() & 1) == 0 && (BSFloatEqualToFloat() & 1) == 0)
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A8A8]), "initWithDuration:identifier:", 3, v16);
    objc_msgSend(v17, "addObject:", v20);

  }
  SBLogIdleTimer();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    _SBIdleTimeoutsDescriptionForLogging(v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 134218242;
    v24 = self;
    v25 = 2114;
    v26 = v22;
    _os_log_impl(&dword_1D0540000, v21, OS_LOG_TYPE_DEFAULT, "%p reconfigured attention timeouts:%{public}@", (uint8_t *)&v23, 0x16u);

  }
  if (objc_msgSend(v17, "count"))
  {
    objc_msgSend(v5, "setTimeouts:", v17);
    if (v8)
    {
      objc_msgSend(v5, "setAttentionSamplingPeriod:", v7);
      objc_msgSend(v5, "setAttentionSamplingStartBeforeFirstTimeout:", 16.0);
    }
    -[ITAttentionAwareIdleTimer setEnabled:](self->_attentionAwareTimer, "setEnabled:", 1);
    -[ITAttentionAwareIdleTimer setDescriptor:resettingTimer:](self->_attentionAwareTimer, "setDescriptor:resettingTimer:", v5, v3);
    -[SBBacklightIdleTimer _effectiveExpireTimeoutDuration](self, "_effectiveExpireTimeoutDuration");
    -[SBIdleTimerBase _logExpirationTimeout:](self, "_logExpirationTimeout:");
  }
  else
  {
    -[ITAttentionAwareIdleTimer setEnabled:](self->_attentionAwareTimer, "setEnabled:", 0);
  }

}

- (SBIdleTimerDescriptor)descriptor
{
  return self->_descriptor;
}

- (double)timeMultiplier
{
  return self->_timeMultiplier;
}

- (void)setTimeMultiplier:(double)a3
{
  self->_timeMultiplier = a3;
}

- (unint64_t)expectation
{
  return self->_expectation;
}

- (void)setExpectation:(unint64_t)a3
{
  self->_expectation = a3;
}

- (BOOL)requiresManualReset
{
  return self->_requiresManualReset;
}

- (void)setRequiresManualReset:(BOOL)a3
{
  self->_requiresManualReset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_attentionAwareTimer, 0);
}

@end
