@implementation SBKeyboardFocusCoalitionPolicyEnforcer

- (SBKeyboardFocusCoalitionPolicyEnforcer)init
{
  SBKeyboardFocusCoalitionPolicyEnforcer *v2;
  id v3;
  void *v4;
  void *v5;
  _SBKeyboardFocusCoalitionPolicyEnforcer *v6;
  id v7;
  void *v8;
  _SBKeyboardFocusCoalitionPolicyEnforcer *v9;
  SBKeyboardFocusPolicyEnforcerPipeline *v10;
  void *v11;
  uint64_t v12;
  SBKeyboardFocusPolicyEnforcer *enforcer;
  objc_super v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)SBKeyboardFocusCoalitionPolicyEnforcer;
  v2 = -[SBKeyboardFocusCoalitionPolicyEnforcer init](&v15, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0D00D80]);
    objc_msgSend(MEMORY[0x1E0D00CA8], "keyboardFocusEnvironment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setEnvironment:", v4);

    +[SBHIDEventDispatchController symbolicDeferringTokenForKeyboardFocus](SBHIDEventDispatchController, "symbolicDeferringTokenForKeyboardFocus");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setToken:", v5);

    v6 = -[_SBKeyboardFocusCoalitionPolicyEnforcer initWithDeferringRulePredicate:deferringRuleReason:debugName:]([_SBKeyboardFocusCoalitionPolicyEnforcer alloc], "initWithDeferringRulePredicate:deferringRuleReason:debugName:", v3, CFSTR("SB incoming to root scene (symbol)"), CFSTR("SBKeyboardFocusPolicyEnforcer-Coalition-Symbolic"));
    v7 = objc_alloc_init(MEMORY[0x1E0D00D80]);
    objc_msgSend(MEMORY[0x1E0D00CA8], "keyboardFocusEnvironment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEnvironment:", v8);

    v9 = -[_SBKeyboardFocusCoalitionPolicyEnforcer initWithDeferringRulePredicate:deferringRuleReason:debugName:]([_SBKeyboardFocusCoalitionPolicyEnforcer alloc], "initWithDeferringRulePredicate:deferringRuleReason:debugName:", v7, CFSTR("SB incoming to root scene"), CFSTR("SBKeyboardFocusPolicyEnforcer-Coalition"));
    v10 = [SBKeyboardFocusPolicyEnforcerPipeline alloc];
    v16[0] = v9;
    v16[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SBKeyboardFocusPolicyEnforcerPipeline initWithEnforcers:](v10, "initWithEnforcers:", v11);

    enforcer = v2->_enforcer;
    v2->_enforcer = (SBKeyboardFocusPolicyEnforcer *)v12;

  }
  return v2;
}

- (void)enforce:(id)a3
{
  id v5;
  SBKeyboardFocusPolicyEnforcer *enforcer;
  void *v7;
  id v8;

  v5 = a3;
  enforcer = self->_enforcer;
  if (enforcer)
  {
    v8 = v5;
    -[SBKeyboardFocusPolicyEnforcer enforce:](enforcer, "enforce:", v5);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("can't enforce an invalidated enforcer"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBKeyboardFocusCoalitionPolicyEnforcer enforce:].cold.1(a2, (uint64_t)self, (uint64_t)v7);
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)stopEnforcing
{
  -[SBKeyboardFocusPolicyEnforcer stopEnforcing](self->_enforcer, "stopEnforcing");
}

- (void)invalidate
{
  SBKeyboardFocusPolicyEnforcer *enforcer;

  -[SBKeyboardFocusPolicyEnforcer invalidate](self->_enforcer, "invalidate");
  enforcer = self->_enforcer;
  self->_enforcer = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enforcer, 0);
}

- (void)enforce:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("SBKeyboardFocusCoalitionPolicyEnforcer.m");
  v16 = 1024;
  v17 = 55;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1D0540000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
