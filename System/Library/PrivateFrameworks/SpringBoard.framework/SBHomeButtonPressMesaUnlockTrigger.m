@implementation SBHomeButtonPressMesaUnlockTrigger

- (id)description
{
  return -[SBMesaUnlockTrigger descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBHomeButtonPressMesaUnlockTrigger;
  -[SBMesaUnlockTrigger succinctDescriptionBuilder](&v7, sel_succinctDescriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", *((unsigned __int8 *)&self->super._authenticated + 2), CFSTR("primed"));
  v5 = (id)objc_msgSend(v3, "appendBool:withName:", *((unsigned __int8 *)&self->super._authenticated + 1), CFSTR("menuButtonDown"));
  return v3;
}

- (BOOL)bioUnlock
{
  NSObject *v3;
  BOOL v4;
  int v5;
  int v6;
  _DWORD v8[2];
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (*(&self->super._authenticated + 1) || *(&self->super._authenticated + 2))
  {
    SBLogLockScreenMesaUnlockBehaviors();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = 1;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v5 = *((unsigned __int8 *)&self->super._authenticated + 1);
      v6 = *((unsigned __int8 *)&self->super._authenticated + 2);
      v8[0] = 67109376;
      v8[1] = v5;
      v9 = 1024;
      v10 = v6;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "[SBHomeButtonPressMesaUnlockTrigger] unlocking because menuButtonDown: %d primed: %d", (uint8_t *)v8, 0xEu);
    }
  }
  else
  {
    SBLogLockScreenMesaUnlockBehaviors();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v8[0]) = 0;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "[SBHomeButtonPressMesaUnlockTrigger] not unlocking because not primed and menu button up", (uint8_t *)v8, 2u);
    }
    v4 = 0;
  }

  return v4;
}

- (void)screenOff
{
  OUTLINED_FUNCTION_0(&dword_1D0540000, a1, a3, "[SBHomeButtonPressMesaUnlockTrigger] screen off - resetting state", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)significantUserInteractionOccurred
{
  OUTLINED_FUNCTION_0(&dword_1D0540000, a1, a3, "[SBHomeButtonPressMesaUnlockTrigger] unpriming due to significant user interaction", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)menuButtonDown
{
  *(&self->super._authenticated + 1) = 1;
}

- (void)menuButtonUp
{
  OUTLINED_FUNCTION_0(&dword_1D0540000, a1, a3, "[SBHomeButtonPressMesaUnlockTrigger] setting menu button up and priming", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

@end
