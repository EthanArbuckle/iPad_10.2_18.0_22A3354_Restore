@implementation SBAccessibilityMesaUnlockTrigger

- (SBAccessibilityMesaUnlockTrigger)initWithUnlockBehaviorConfigurationDelegate:(id)a3 baseTrigger:(id)a4
{
  id v6;
  id v7;
  SBAccessibilityMesaUnlockTrigger *v8;
  SBAccessibilityMesaUnlockTrigger *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBAccessibilityMesaUnlockTrigger;
  v8 = -[SBAccessibilityMesaUnlockTrigger init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_behaviorConfigurationDelegate, v6);
    objc_storeStrong((id *)&v9->_baseTrigger, a4);
    -[SBMesaUnlockTrigger setDelegate:](v9->_baseTrigger, "setDelegate:", v9);
  }

  return v9;
}

- (BOOL)bioUnlock
{
  NSObject *WeakRetained;
  BOOL v4;
  NSObject *v5;
  uint8_t v7[16];
  uint8_t v8[16];
  uint8_t buf[16];

  if (-[SBMesaUnlockTrigger bioUnlock](self->_baseTrigger, "bioUnlock"))
  {
    SBLogLockScreenMesaUnlockBehaviors();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    v4 = 1;
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, WeakRetained, OS_LOG_TYPE_INFO, "[SBAccessibilityMesaUnlockTrigger] unlocking base unlock trigger says we should", buf, 2u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_behaviorConfigurationDelegate);
    if ((objc_opt_respondsToSelector() & 1) != 0
      && !-[NSObject isLockScreenShowingDefaultContent](WeakRetained, "isLockScreenShowingDefaultContent"))
    {
      SBLogLockScreenMesaUnlockBehaviors();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "[SBAccessibilityMesaUnlockTrigger] NOT unlocking because main page is not visible or content is above dashboard", v7, 2u);
      }
      v4 = 0;
    }
    else
    {
      SBLogLockScreenMesaUnlockBehaviors();
      v5 = objc_claimAutoreleasedReturnValue();
      v4 = 1;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "[SBAccessibilityMesaUnlockTrigger] unlocking because main page visible & no content above dashboard", v8, 2u);
      }
    }

  }
  return v4;
}

- (void)screenOff
{
  -[SBMesaUnlockTrigger screenOff](self->_baseTrigger, "screenOff");
}

- (void)significantUserInteractionOccurred
{
  -[SBMesaUnlockTrigger significantUserInteractionOccurred](self->_baseTrigger, "significantUserInteractionOccurred");
}

- (void)menuButtonDown
{
  -[SBMesaUnlockTrigger menuButtonDown](self->_baseTrigger, "menuButtonDown");
}

- (void)menuButtonUp
{
  -[SBMesaUnlockTrigger menuButtonUp](self->_baseTrigger, "menuButtonUp");
}

- (void)fingerOn
{
  id v3;

  -[SBMesaUnlockTrigger fingerOn](self->_baseTrigger, "fingerOn");
  if (-[SBMesaUnlockTrigger authenticated](self, "authenticated"))
  {
    if (-[SBAccessibilityMesaUnlockTrigger bioUnlock](self, "bioUnlock"))
    {
      -[SBMesaUnlockTrigger delegate](self, "delegate");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "mesaUnlockTriggerFired:", self);

    }
  }
}

- (void)fingerOff
{
  -[SBMesaUnlockTrigger fingerOff](self->_baseTrigger, "fingerOff");
}

- (void)mesaUnlockTriggerFired:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogLockScreenMesaUnlockBehaviors();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "[SBAccessibilityMesaUnlockTrigger] triggering because base unlock trigger fired: %@", (uint8_t *)&v7, 0xCu);
  }

  -[SBMesaUnlockTrigger delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mesaUnlockTriggerFired:", self);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseTrigger, 0);
  objc_destroyWeak((id *)&self->_behaviorConfigurationDelegate);
}

@end
