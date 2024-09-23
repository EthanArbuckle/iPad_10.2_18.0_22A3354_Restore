@implementation SBSetupAlwaysOnPolicy

- (void)activateAlwaysOnPolicy
{
  id v3;
  void *v4;
  void *v5;
  BLSAssertion *v6;
  BLSAssertion *alwaysOnDisabledAssertion;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (!self->_alwaysOnPolicyActive)
  {
    self->_alwaysOnPolicyActive = 1;
    v3 = objc_alloc(MEMORY[0x1E0D00F48]);
    objc_msgSend(MEMORY[0x1E0D00F90], "disableAlwaysOn");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (BLSAssertion *)objc_msgSend(v3, "initWithExplanation:attributes:", CFSTR("Setup"), v5);
    alwaysOnDisabledAssertion = self->_alwaysOnDisabledAssertion;
    self->_alwaysOnDisabledAssertion = v6;

    self->_inSetupMode = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__setupModeStateDidChange_, CFSTR("SBInBuddyModeDidChangeNotification"), 0);

    -[SBSetupAlwaysOnPolicy _updateSetupModeState](self, "_updateSetupModeState");
  }
}

- (NSString)analyticsPolicyName
{
  return (NSString *)CFSTR("setup");
}

- (id)analyticsPolicyValue
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BLSAssertion isAcquired](self->_alwaysOnDisabledAssertion, "isAcquired"));
}

- (void)_updateSetupModeState
{
  id v3;

  +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSetupAlwaysOnPolicy _setInSetupMode:](self, "_setInSetupMode:", objc_msgSend(v3, "isInSetupMode"));

}

- (void)_setInSetupMode:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 v6;
  uint8_t v7[16];
  uint8_t buf[16];

  if (self->_inSetupMode != a3)
  {
    v3 = a3;
    self->_inSetupMode = a3;
    SBLogBacklight();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Acquiring setup-mode always-on-disable assertion", buf, 2u);
      }

      -[BLSAssertion acquireWithObserver:](self->_alwaysOnDisabledAssertion, "acquireWithObserver:", 0);
    }
    else
    {
      if (v6)
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Releasing setup-mode always-on-disable assertion", v7, 2u);
      }

      -[BLSAssertion cancel](self->_alwaysOnDisabledAssertion, "cancel");
    }
  }
}

- (BOOL)isAlwaysOnPolicyActive
{
  return self->_alwaysOnPolicyActive;
}

- (BOOL)_isInSetupMode
{
  return self->_inSetupMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alwaysOnDisabledAssertion, 0);
}

@end
