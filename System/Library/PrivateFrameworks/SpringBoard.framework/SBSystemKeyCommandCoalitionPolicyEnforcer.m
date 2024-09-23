@implementation SBSystemKeyCommandCoalitionPolicyEnforcer

- (SBSystemKeyCommandCoalitionPolicyEnforcer)init
{
  SBSystemKeyCommandCoalitionPolicyEnforcer *v2;
  id v3;
  void *v4;
  _SBKeyboardFocusCoalitionPolicyEnforcer *v5;
  _SBKeyboardFocusCoalitionPolicyEnforcer *enforcer;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBSystemKeyCommandCoalitionPolicyEnforcer;
  v2 = -[SBSystemKeyCommandCoalitionPolicyEnforcer init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0D00D80]);
    objc_msgSend(MEMORY[0x1E0DAAED8], "systemKeyCommandOverlayEnvironment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setEnvironment:", v4);

    v5 = -[_SBKeyboardFocusCoalitionPolicyEnforcer initWithDeferringRulePredicate:deferringRuleReason:debugName:]([_SBKeyboardFocusCoalitionPolicyEnforcer alloc], "initWithDeferringRulePredicate:deferringRuleReason:debugName:", v3, CFSTR("systemKeyCommandOverlayEnvironment to root scene"), CFSTR("SBSystemKeyCommandPolicyEnforcer-Coalition"));
    enforcer = v2->_enforcer;
    v2->_enforcer = v5;

  }
  return v2;
}

- (void)enforce:(id)a3
{
  -[_SBKeyboardFocusCoalitionPolicyEnforcer enforce:](self->_enforcer, "enforce:", a3);
}

- (void)stopEnforcing
{
  -[_SBKeyboardFocusCoalitionPolicyEnforcer stopEnforcing](self->_enforcer, "stopEnforcing");
}

- (void)invalidate
{
  -[_SBKeyboardFocusCoalitionPolicyEnforcer invalidate](self->_enforcer, "invalidate");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enforcer, 0);
}

@end
