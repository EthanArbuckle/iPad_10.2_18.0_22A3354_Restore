@implementation SBFocusModeAlwaysOnPolicy

- (void)activateAlwaysOnPolicy
{
  void *v3;
  SBAlwaysOnPolicySettings *v4;
  SBAlwaysOnPolicySettings *policySettings;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BLSAssertion *v11;
  BLSAssertion *alwaysOnDisabledAssertion;
  SBDoNotDisturbStateMonitor *v13;
  SBDoNotDisturbStateMonitor *dndStateMonitor;
  void *v15;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  if (!self->_alwaysOnPolicyActive)
  {
    self->_alwaysOnPolicyActive = 1;
    +[SBAlwaysOnDomain rootSettings](SBAlwaysOnDomain, "rootSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "policySettings");
    v4 = (SBAlwaysOnPolicySettings *)objc_claimAutoreleasedReturnValue();
    policySettings = self->_policySettings;
    self->_policySettings = v4;

    -[PTSettings addKeyObserver:](self->_policySettings, "addKeyObserver:", self);
    v6 = objc_alloc(MEMORY[0x1E0D00F48]);
    objc_msgSend(MEMORY[0x1E0CF78A8], "allowAmbientIdleTimerForSleepFocus");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CF78C0], "enableMotionDetectionWake", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v8;
    objc_msgSend(MEMORY[0x1E0D00F90], "disableAlwaysOn");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (BLSAssertion *)objc_msgSend(v6, "initWithExplanation:attributes:", CFSTR("Focus Mode"), v10);
    alwaysOnDisabledAssertion = self->_alwaysOnDisabledAssertion;
    self->_alwaysOnDisabledAssertion = v11;

    self->_disableAlwaysOn = 0;
    +[SBDoNotDisturbStateMonitor sharedInstance](SBDoNotDisturbStateMonitor, "sharedInstance");
    v13 = (SBDoNotDisturbStateMonitor *)objc_claimAutoreleasedReturnValue();
    dndStateMonitor = self->_dndStateMonitor;
    self->_dndStateMonitor = v13;

    -[SBDoNotDisturbStateMonitor addObserver:](self->_dndStateMonitor, "addObserver:", self);
    -[SBDoNotDisturbStateMonitor state](self->_dndStateMonitor, "state");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      -[SBFocusModeAlwaysOnPolicy _updateFromDNDState:](self, "_updateFromDNDState:", v15);

  }
}

- (NSString)analyticsPolicyName
{
  return (NSString *)CFSTR("focusMode");
}

- (id)analyticsPolicyValue
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  if (-[BLSAssertion isAcquired](self->_alwaysOnDisabledAssertion, "isAcquired"))
  {
    -[SBDoNotDisturbStateMonitor state](self->_dndStateMonitor, "state");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "activeModeConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v5, "semanticType");
      DNDModeSemanticTypeToString();
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = CFSTR("unkown");
    }

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)doNotDisturbStateMonitor:(id)a3 didUpdateToState:(id)a4
{
  -[SBFocusModeAlwaysOnPolicy _updateFromDNDState:](self, "_updateFromDNDState:", a4);
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  void *v5;
  void *v6;

  if (self->_policySettings == a3)
  {
    -[SBDoNotDisturbStateMonitor state](self->_dndStateMonitor, "state");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = v5;
      -[SBFocusModeAlwaysOnPolicy _updateFromDNDState:](self, "_updateFromDNDState:", v5);
      v5 = v6;
    }

  }
}

- (void)_updateFromDNDState:(id)a3
{
  id v4;

  v4 = a3;
  -[SBFocusModeAlwaysOnPolicy _setDisableAlwaysOn:dndState:](self, "_setDisableAlwaysOn:dndState:", -[SBFocusModeAlwaysOnPolicy _shouldDisableAlwaysOnForDNDState:](self, "_shouldDisableAlwaysOnForDNDState:", v4), v4);

}

- (void)_setDisableAlwaysOn:(BOOL)a3 dndState:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  int v9;
  id v10;
  uint64_t v11;

  v4 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (self->_disableAlwaysOn != v4)
  {
    self->_disableAlwaysOn = v4;
    SBLogBacklight();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v8)
      {
        v9 = 138412290;
        v10 = v6;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Acquiring focus-mode always-on-disable assertion for state %@", (uint8_t *)&v9, 0xCu);
      }

      -[BLSAssertion acquireWithObserver:](self->_alwaysOnDisabledAssertion, "acquireWithObserver:", 0);
    }
    else
    {
      if (v8)
      {
        v9 = 138412290;
        v10 = v6;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Releasing focus-mode always-on-disable assertion for state %@", (uint8_t *)&v9, 0xCu);
      }

      -[BLSAssertion cancel](self->_alwaysOnDisabledAssertion, "cancel");
    }
  }

}

- (BOOL)_shouldDisableAlwaysOnForDNDState:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;

  v4 = a3;
  v5 = -[SBAlwaysOnPolicySettings focusStrategy](self->_policySettings, "focusStrategy");
  if (v5 == 1)
  {
    objc_msgSend(v4, "activeModeConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "dimsLockScreen");

    v11 = v13 != 0;
  }
  else if (v5)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v4, "activeModeConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "semanticType");

    -[SBAlwaysOnPolicySettings alwaysOnDisablingFocusSemanticTypes](self->_policySettings, "alwaysOnDisablingFocusSemanticTypes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "containsObject:", v10);

  }
  return v11;
}

- (BOOL)isAlwaysOnPolicyActive
{
  return self->_alwaysOnPolicyActive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policySettings, 0);
  objc_storeStrong((id *)&self->_dndStateMonitor, 0);
  objc_storeStrong((id *)&self->_alwaysOnDisabledAssertion, 0);
}

@end
