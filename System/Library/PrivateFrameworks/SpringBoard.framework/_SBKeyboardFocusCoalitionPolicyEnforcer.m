@implementation _SBKeyboardFocusCoalitionPolicyEnforcer

- (_SBKeyboardFocusCoalitionPolicyEnforcer)initWithDeferringRulePredicate:(id)a3 deferringRuleReason:(id)a4 debugName:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _SBKeyboardFocusCoalitionPolicyEnforcer *v13;

  v8 = (void *)MEMORY[0x1E0D00CC8];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[_SBKeyboardFocusCoalitionPolicyEnforcer initWithDeferringRulePredicate:deferringRuleReason:debugName:deliveryManager:](self, "initWithDeferringRulePredicate:deferringRuleReason:debugName:deliveryManager:", v11, v10, v9, v12);

  return v13;
}

- (_SBKeyboardFocusCoalitionPolicyEnforcer)initWithDeferringRulePredicate:(id)a3 deferringRuleReason:(id)a4 debugName:(id)a5 deliveryManager:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  _SBKeyboardFocusCoalitionPolicyEnforcer *v15;
  _SBKeyboardFocusCoalitionPolicyEnforcer *v16;
  uint64_t v17;
  NSString *deferringRuleReason;
  uint64_t v19;
  NSString *debugName;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)_SBKeyboardFocusCoalitionPolicyEnforcer;
  v15 = -[_SBKeyboardFocusCoalitionPolicyEnforcer init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_predicate, a3);
    v17 = objc_msgSend(v12, "copy");
    deferringRuleReason = v16->_deferringRuleReason;
    v16->_deferringRuleReason = (NSString *)v17;

    objc_storeStrong((id *)&v16->_deliveryManager, a6);
    v19 = objc_msgSend(v13, "copy");
    debugName = v16->_debugName;
    v16->_debugName = (NSString *)v19;

  }
  return v16;
}

- (void)enforce:(id)a3
{
  void *v4;
  void *v5;
  BKSHIDEventDeliveryManager *deliveryManager;
  BKSHIDEventDeferringPredicate *predicate;
  void *v8;
  BSInvalidatable *v9;
  BSInvalidatable *focusRule;
  NSObject *v11;
  void *v12;
  BKSHIDEventDeferringPredicate *v13;
  SBKeyboardFocusTarget *enforcedTarget;
  int v15;
  void *v16;
  __int16 v17;
  BKSHIDEventDeferringPredicate *v18;
  __int16 v19;
  SBKeyboardFocusTarget *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "sbWindowSceneAncestor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBKeyboardFocusTarget targetForSBWindowScene:](SBKeyboardFocusTarget, "targetForSBWindowScene:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!self->_enforcedTarget || !self->_focusRule || (BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_enforcedTarget, v5);
    -[BSInvalidatable invalidate](self->_focusRule, "invalidate");
    deliveryManager = self->_deliveryManager;
    predicate = self->_predicate;
    -[SBKeyboardFocusTarget deferringTarget]((uint64_t)self->_enforcedTarget);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKSHIDEventDeliveryManager deferEventsMatchingPredicate:toTarget:withReason:](deliveryManager, "deferEventsMatchingPredicate:toTarget:withReason:", predicate, v8, self->_deferringRuleReason);
    v9 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    focusRule = self->_focusRule;
    self->_focusRule = v9;

    SBLogKeyboardFocus();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[BKSHIDEventDeferringPredicate environment](self->_predicate, "environment");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = self->_predicate;
      enforcedTarget = self->_enforcedTarget;
      v15 = 138543874;
      v16 = v12;
      v17 = 2114;
      v18 = v13;
      v19 = 2114;
      v20 = enforcedTarget;
      _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "rules: (%{public}@) deferring (%{public}@) -> %{public}@", (uint8_t *)&v15, 0x20u);

    }
  }

}

- (void)stopEnforcing
{
  SBKeyboardFocusTarget *enforcedTarget;
  BSInvalidatable *focusRule;

  enforcedTarget = self->_enforcedTarget;
  self->_enforcedTarget = 0;

  -[BSInvalidatable invalidate](self->_focusRule, "invalidate");
  focusRule = self->_focusRule;
  self->_focusRule = 0;

}

- (BKSHIDEventDeferringPredicate)predicate
{
  return self->_predicate;
}

- (NSString)deferringRuleReason
{
  return self->_deferringRuleReason;
}

- (SBKeyboardFocusTarget)enforcedTarget
{
  return self->_enforcedTarget;
}

- (void)setEnforcedTarget:(id)a3
{
  objc_storeStrong((id *)&self->_enforcedTarget, a3);
}

- (BSInvalidatable)focusRule
{
  return self->_focusRule;
}

- (void)setFocusRule:(id)a3
{
  objc_storeStrong((id *)&self->_focusRule, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusRule, 0);
  objc_storeStrong((id *)&self->_enforcedTarget, 0);
  objc_storeStrong((id *)&self->_debugName, 0);
  objc_storeStrong((id *)&self->_deliveryManager, 0);
  objc_storeStrong((id *)&self->_deferringRuleReason, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

@end
