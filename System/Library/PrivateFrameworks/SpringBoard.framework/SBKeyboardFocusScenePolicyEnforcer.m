@implementation SBKeyboardFocusScenePolicyEnforcer

- (SBKeyboardFocusScenePolicyEnforcer)initWithDeliveryManager:(id)a3 debugName:(id)a4 systemShellDelegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  SBKeyboardFocusScenePolicyEnforcer *v12;
  SBKeyboardFocusScenePolicyEnforcer *v13;
  uint64_t v14;
  NSString *debugName;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SBKeyboardFocusScenePolicyEnforcer;
  v12 = -[SBKeyboardFocusScenePolicyEnforcer init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_deliveryManager, a3);
    v14 = objc_msgSend(v10, "copy");
    debugName = v13->_debugName;
    v13->_debugName = (NSString *)v14;

    objc_storeStrong((id *)&v13->_systemShellBehaviorDelegate, a5);
  }

  return v13;
}

- (void)enforce:(id)a3
{
  SBKeyboardFocusPolicy *v4;
  void *v5;
  void *v6;
  SBKeyboardFocusTarget *v7;
  NSObject *v8;
  SBKeyboardFocusTarget *sentKeyboardFocusOutboundTarget;
  BSInvalidatable *localToRemoteKeyboardFocusRule;
  NSObject *v11;
  SBKeyboardFocusTarget *v12;
  void *v13;
  void *v14;
  BSInvalidatable *v15;
  BKSHIDEventDeliveryManager *deliveryManager;
  SBKeyboardFocusTarget *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BSInvalidatable *v23;
  BSInvalidatable *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  SBKeyboardFocusPolicy *enforcedPolicy;
  SBKeyboardFocusPolicy *v31;
  uint8_t buf[4];
  SBKeyboardFocusTarget *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = (SBKeyboardFocusPolicy *)a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[SBKeyboardFocusPolicy keyboardFocusTarget](v4, "keyboardFocusTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBKeyboardFocusPolicy sbWindowSceneAncestor](v4, "sbWindowSceneAncestor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBKeyboardFocusTarget targetForSBWindowScene:](SBKeyboardFocusTarget, "targetForSBWindowScene:", v6);
  v7 = (SBKeyboardFocusTarget *)objc_claimAutoreleasedReturnValue();
  if (BSEqualObjects())
  {
    SBLogKeyboardFocus();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "rules: (keyboardFocus) removing outbound rule -- deferring to SpringBoard", buf, 2u);
    }

    sentKeyboardFocusOutboundTarget = self->_sentKeyboardFocusOutboundTarget;
    self->_sentKeyboardFocusOutboundTarget = 0;

    -[BSInvalidatable invalidate](self->_localToRemoteKeyboardFocusRule, "invalidate");
    localToRemoteKeyboardFocusRule = self->_localToRemoteKeyboardFocusRule;
    self->_localToRemoteKeyboardFocusRule = 0;
  }
  else
  {
    if ((BSEqualObjects() & 1) == 0)
    {
      SBLogKeyboardFocus();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = self->_sentKeyboardFocusOutboundTarget;
        *(_DWORD *)buf = 138543618;
        v33 = v12;
        v34 = 2114;
        v35 = v5;
        _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "rules: (keyboardFocus) outbound target changed from:%{public}@ to %{public}@", buf, 0x16u);
      }

    }
    v31 = v4;
    localToRemoteKeyboardFocusRule = (BSInvalidatable *)objc_msgSend(MEMORY[0x1E0D00D80], "new");
    objc_msgSend(MEMORY[0x1E0D00CA8], "keyboardFocusEnvironment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSInvalidatable setEnvironment:](localToRemoteKeyboardFocusRule, "setEnvironment:", v13);

    -[SBKeyboardFocusTarget deferringToken]((uint64_t)v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSInvalidatable setToken:](localToRemoteKeyboardFocusRule, "setToken:", v14);

    -[BSInvalidatable invalidate](self->_localToRemoteKeyboardFocusRule, "invalidate");
    v15 = self->_localToRemoteKeyboardFocusRule;
    self->_localToRemoteKeyboardFocusRule = 0;

    deliveryManager = self->_deliveryManager;
    -[SBKeyboardFocusTarget deferringTarget]((uint64_t)v5);
    v17 = v7;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "_FBSScene");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("SpringBoard<%@>: enforcing outbound"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKSHIDEventDeliveryManager deferEventsMatchingPredicate:toTarget:withReason:](deliveryManager, "deferEventsMatchingPredicate:toTarget:withReason:", localToRemoteKeyboardFocusRule, v18, v22);
    v23 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    v24 = self->_localToRemoteKeyboardFocusRule;
    self->_localToRemoteKeyboardFocusRule = v23;

    v7 = v17;
    SBLogKeyboardFocus();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v33 = v17;
      v34 = 2114;
      v35 = v5;
      _os_log_impl(&dword_1D0540000, v25, OS_LOG_TYPE_DEFAULT, "rules: (keyboardFocus) defer (%{public}@) -> %{public}@", buf, 0x16u);
    }

    objc_storeStrong((id *)&self->_sentKeyboardFocusOutboundTarget, v5);
    v4 = v31;
  }

  objc_msgSend(v6, "_eventDeferringManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0D00CA8], "keyboardFocusEnvironment");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setWithObject:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setNeedsRemoteEventDeferringRuleComparisonInEnvironments:forBehaviorDelegate:withReason:", v29, self->_systemShellBehaviorDelegate, CFSTR("SB rule update"));

  enforcedPolicy = self->_enforcedPolicy;
  self->_enforcedPolicy = v4;

}

- (void)stopEnforcing
{
  BSInvalidatable *localToRemoteKeyboardFocusRule;
  SBKeyboardFocusPolicy *enforcedPolicy;

  -[BSInvalidatable invalidate](self->_localToRemoteKeyboardFocusRule, "invalidate");
  localToRemoteKeyboardFocusRule = self->_localToRemoteKeyboardFocusRule;
  self->_localToRemoteKeyboardFocusRule = 0;

  enforcedPolicy = self->_enforcedPolicy;
  self->_enforcedPolicy = 0;

}

- (SBKeyboardFocusTarget)sentKeyboardFocusOutboundTarget
{
  return self->_sentKeyboardFocusOutboundTarget;
}

- (void)setSentKeyboardFocusOutboundTarget:(id)a3
{
  objc_storeStrong((id *)&self->_sentKeyboardFocusOutboundTarget, a3);
}

- (_UIEventDeferringSystemShellBehaviorDelegate)systemShellBehaviorDelegate
{
  return self->_systemShellBehaviorDelegate;
}

- (void)setSystemShellBehaviorDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_systemShellBehaviorDelegate, a3);
}

- (BSInvalidatable)localToRemoteKeyboardFocusRule
{
  return self->_localToRemoteKeyboardFocusRule;
}

- (void)setLocalToRemoteKeyboardFocusRule:(id)a3
{
  objc_storeStrong((id *)&self->_localToRemoteKeyboardFocusRule, a3);
}

- (SBKeyboardFocusPolicy)enforcedPolicy
{
  return self->_enforcedPolicy;
}

- (void)setEnforcedPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_enforcedPolicy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enforcedPolicy, 0);
  objc_storeStrong((id *)&self->_localToRemoteKeyboardFocusRule, 0);
  objc_storeStrong((id *)&self->_systemShellBehaviorDelegate, 0);
  objc_storeStrong((id *)&self->_sentKeyboardFocusOutboundTarget, 0);
  objc_storeStrong((id *)&self->_debugName, 0);
  objc_storeStrong((id *)&self->_deliveryManager, 0);
}

@end
