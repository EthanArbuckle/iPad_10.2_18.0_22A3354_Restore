@implementation SBLowPowerModeAlwaysOnPolicy

- (void)activateAlwaysOnPolicy
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BLSAssertion *v7;
  BLSAssertion *alwaysOnDisabledAssertion;
  void *v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  if (!self->_alwaysOnPolicyActive)
  {
    self->_alwaysOnPolicyActive = 1;
    v3 = objc_alloc(MEMORY[0x1E0D00F48]);
    objc_msgSend(MEMORY[0x1E0CF78A8], "allowAmbientIdleTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v4;
    objc_msgSend(MEMORY[0x1E0D00F90], "disableAlwaysOn");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (BLSAssertion *)objc_msgSend(v3, "initWithExplanation:attributes:", CFSTR("Low Power Mode"), v6);
    alwaysOnDisabledAssertion = self->_alwaysOnDisabledAssertion;
    self->_alwaysOnDisabledAssertion = v7;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__noteLowPowerModeChanged_, *MEMORY[0x1E0CB3048], 0);

    -[SBLowPowerModeAlwaysOnPolicy _updateAssertion](self, "_updateAssertion");
  }
}

- (NSString)analyticsPolicyName
{
  return (NSString *)CFSTR("lowPowerMode");
}

- (id)analyticsPolicyValue
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BLSAssertion isAcquired](self->_alwaysOnDisabledAssertion, "isAcquired"));
}

- (void)_updateAssertion
{
  void *v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  uint8_t v7[16];
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLowPowerModeEnabled");

  SBLogBacklight();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Acquiring low-power-mode always-on-disable assertion", buf, 2u);
    }

    -[BLSAssertion acquireWithObserver:](self->_alwaysOnDisabledAssertion, "acquireWithObserver:", 0);
  }
  else
  {
    if (v6)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Releasing low-power-mode always-on-disable assertion", v7, 2u);
    }

    -[BLSAssertion cancel](self->_alwaysOnDisabledAssertion, "cancel");
  }
}

- (BOOL)isAlwaysOnPolicyActive
{
  return self->_alwaysOnPolicyActive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alwaysOnDisabledAssertion, 0);
}

@end
