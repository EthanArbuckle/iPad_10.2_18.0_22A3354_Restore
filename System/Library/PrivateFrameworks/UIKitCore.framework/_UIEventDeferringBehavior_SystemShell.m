@implementation _UIEventDeferringBehavior_SystemShell

- (BOOL)wantsLocalCompatibilityRules
{
  char v3;
  char v4;
  void *v5;
  char v6;
  char v7;
  char v8;
  objc_super v10;

  if (!-[_UIEventDeferringBehavior_Default wantsLocalIdealRules](self, "wantsLocalIdealRules"))
    return 1;
  v3 = _UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_ShouldWriteCompatibilityEventDeferringRulesForSystemShell, (uint64_t)CFSTR("ShouldWriteCompatibilityEventDeferringRulesForSystemShell"));
  if (byte_1EDDA7DCC)
    v4 = 1;
  else
    v4 = v3;
  if ((~*(_BYTE *)&self->_behaviorDelegateFlags & 3) != 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)_UIEventDeferringBehavior_SystemShell;
    return v4 & -[_UIEventDeferringBehavior_Default wantsLocalCompatibilityRules](&v10, sel_wantsLocalCompatibilityRules);
  }
  else
  {
    -[_UIEventDeferringBehavior_SystemShell systemShellBehaviorDelegate](self, "systemShellBehaviorDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "eventDeferringManagerSystemShellBehaviorWantsLocalCompatibilityRules");

    v7 = _UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_ShouldWriteCompatibilityEventDeferringRulesForAllProcesses, (uint64_t)CFSTR("ShouldWriteCompatibilityEventDeferringRulesForAllProcesses"));
    if (byte_1ECD75E94)
      v8 = 1;
    else
      v8 = v7;
    return v8 & v4 & v6;
  }
}

- (id)systemShellBehaviorDelegate
{
  return objc_loadWeakRetained((id *)&self->_systemShellBehaviorDelegate);
}

- (_UIEventDeferringBehavior_SystemShell)initWithEventDeferringManager:(id)a3
{
  uint64_t v6;
  _UIEventDeferringBehavior_SystemShell *v7;
  void *v8;
  void *v10;
  objc_super v11;

  v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIEventDeferringBehavior_SystemShell.m"), 39, CFSTR("%s: This is an abstract class that can not be initialized directly."), "-[_UIEventDeferringBehavior_SystemShell initWithEventDeferringManager:]");

  }
  v11.receiver = self;
  v11.super_class = (Class)_UIEventDeferringBehavior_SystemShell;
  v7 = -[_UIEventDeferringBehavior_Default initWithEventDeferringManager:](&v11, sel_initWithEventDeferringManager_, a3);
  if (v7)
  {
    +[_UIEventDeferringManager systemShellBehaviorDelegate](_UIEventDeferringManager, "systemShellBehaviorDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIEventDeferringBehavior_SystemShell setSystemShellBehaviorDelegate:](v7, "setSystemShellBehaviorDelegate:", v8);

  }
  return v7;
}

- (void)setSystemShellBehaviorDelegate:(id)a3
{
  _UIEventDeferringSystemShellBehaviorDelegate **p_systemShellBehaviorDelegate;
  id v6;
  id WeakRetained;
  id v8;
  char v9;
  id v10;
  char v11;
  char v12;
  id v13;

  *(_BYTE *)&self->_behaviorDelegateFlags &= 0xF1u;
  p_systemShellBehaviorDelegate = &self->_systemShellBehaviorDelegate;
  v6 = objc_storeWeak((id *)&self->_systemShellBehaviorDelegate, a3);
  *(_BYTE *)&self->_behaviorDelegateFlags = *(_BYTE *)&self->_behaviorDelegateFlags & 0xFE | (a3 != 0);

  WeakRetained = objc_loadWeakRetained((id *)p_systemShellBehaviorDelegate);
  if (WeakRetained)
  {
    v8 = objc_loadWeakRetained((id *)p_systemShellBehaviorDelegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 2;
    else
      v9 = 0;
    *(_BYTE *)&self->_behaviorDelegateFlags = *(_BYTE *)&self->_behaviorDelegateFlags & 0xFD | v9;

    v10 = objc_loadWeakRetained((id *)p_systemShellBehaviorDelegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = 4;
    else
      v11 = 0;
    *(_BYTE *)&self->_behaviorDelegateFlags = *(_BYTE *)&self->_behaviorDelegateFlags & 0xFB | v11;

    v13 = objc_loadWeakRetained((id *)p_systemShellBehaviorDelegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = 8;
    else
      v12 = 0;
    *(_BYTE *)&self->_behaviorDelegateFlags = *(_BYTE *)&self->_behaviorDelegateFlags & 0xF7 | v12;

  }
}

- (BOOL)shouldDisableRemoteViewControllerEventDeferringForKeyboardKeyWindowChanges
{
  return +[_UIRemoteKeyboards enabled](_UIRemoteKeyboards, "enabled");
}

- (BOOL)shouldSuppressRemoteRuleForOwningElement:(id)a3 inEnvironment:(id)a4
{
  void *v7;
  char v8;
  objc_super v10;

  if ((~*(_BYTE *)&self->_behaviorDelegateFlags & 5) != 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)_UIEventDeferringBehavior_SystemShell;
    return -[_UIEventDeferringBehavior_Default shouldSuppressRemoteRuleForOwningElement:inEnvironment:](&v10, sel_shouldSuppressRemoteRuleForOwningElement_inEnvironment_, a3, a4);
  }
  else
  {
    -[_UIEventDeferringBehavior_SystemShell systemShellBehaviorDelegate](self, "systemShellBehaviorDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "eventDeferringManagerSystemShellBehavior:shouldSuppressRemoteRuleForOwningElement:inEnvironment:", self, a3, a4);

    return v8;
  }
}

- (int64_t)compareRemoteRuleOwningElement:(id)a3 toElement:(id)a4 inEnvironment:(id)a5
{
  void *v9;
  int64_t v10;
  objc_super *v11;
  _UIEventDeferringBehavior_SystemShell *v13;
  objc_super v14;

  if ((~*(_BYTE *)&self->_behaviorDelegateFlags & 9) != 0)
  {
    v14.receiver = self;
    v11 = &v14;
    goto LABEL_5;
  }
  -[_UIEventDeferringBehavior_SystemShell systemShellBehaviorDelegate](self, "systemShellBehaviorDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "eventDeferringManagerSystemShellBehavior:compareRemoteRuleOwningElement:toElement:inEnvironment:", self, a3, a4, a5);

  if (!v10)
  {
    v13 = self;
    v11 = (objc_super *)&v13;
LABEL_5:
    v11->super_class = (Class)_UIEventDeferringBehavior_SystemShell;
    return (int64_t)-[objc_super compareRemoteRuleOwningElement:toElement:inEnvironment:](v11, sel_compareRemoteRuleOwningElement_toElement_inEnvironment_, a3, a4, a5, v13);
  }
  return v10;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  _UIEventDeferringBehavior_SystemShell *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_UIEventDeferringBehavior_SystemShell;
  -[_UIEventDeferringBehavior_Default descriptionBuilderWithMultilinePrefix:](&v13, sel_descriptionBuilderWithMultilinePrefix_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveMultilinePrefix:", a3);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79___UIEventDeferringBehavior_SystemShell_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E16B1B50;
  v6 = v5;
  v11 = v6;
  v12 = self;
  v7 = (id)objc_msgSend(v6, "modifyBody:", v10);
  v8 = v6;

  return v8;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_systemShellBehaviorDelegate);
}

@end
