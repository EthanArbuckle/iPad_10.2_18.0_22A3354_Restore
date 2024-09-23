@implementation SBThermalAlwaysOnPolicy

- (void)activateAlwaysOnPolicy
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BLSAssertion *v7;
  BLSAssertion *alwaysOnDisabledAssertion;
  void *v9;
  void *v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  if (!self->_alwaysOnPolicyActive)
  {
    self->_alwaysOnPolicyActive = 1;
    v3 = objc_alloc(MEMORY[0x1E0D00F48]);
    objc_msgSend(MEMORY[0x1E0CF78A8], "allowAmbientIdleTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v4;
    objc_msgSend(MEMORY[0x1E0D00F90], "disableAlwaysOn");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (BLSAssertion *)objc_msgSend(v3, "initWithExplanation:attributes:", CFSTR("Thermal Trap"), v6);
    alwaysOnDisabledAssertion = self->_alwaysOnDisabledAssertion;
    self->_alwaysOnDisabledAssertion = v7;

    self->_thermallyBlocked = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__noteDeviceBlockStateDidChange_, *MEMORY[0x1E0DAA050], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__noteBootCompleted_, CFSTR("SBBootCompleteNotification"), 0);

    -[SBThermalAlwaysOnPolicy _updateThermalState](self, "_updateThermalState");
  }
}

- (NSString)analyticsPolicyName
{
  return (NSString *)CFSTR("thermalTrap");
}

- (id)analyticsPolicyValue
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BLSAssertion isAcquired](self->_alwaysOnDisabledAssertion, "isAcquired"));
}

- (void)_updateThermalState
{
  id v3;

  objc_msgSend((id)SBApp, "lockOutController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SBThermalAlwaysOnPolicy _setThermallyBlocked:](self, "_setThermallyBlocked:", objc_msgSend(v3, "isThermallyBlocked"));

}

- (void)_setThermallyBlocked:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 v6;
  uint8_t v7[16];
  uint8_t buf[16];

  if (self->_thermallyBlocked != a3)
  {
    v3 = a3;
    self->_thermallyBlocked = a3;
    SBLogBacklight();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Acquiring thermal-trap always-on-disable assertion", buf, 2u);
      }

      -[BLSAssertion acquireWithObserver:](self->_alwaysOnDisabledAssertion, "acquireWithObserver:", 0);
    }
    else
    {
      if (v6)
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Releasing thermal-trap always-on-disable assertion", v7, 2u);
      }

      -[BLSAssertion cancel](self->_alwaysOnDisabledAssertion, "cancel");
    }
  }
}

- (BOOL)isAlwaysOnPolicyActive
{
  return self->_alwaysOnPolicyActive;
}

- (BOOL)_isThermallyBlocked
{
  return self->_thermallyBlocked;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockOutStatusProvider, 0);
  objc_storeStrong((id *)&self->_alwaysOnDisabledAssertion, 0);
}

@end
