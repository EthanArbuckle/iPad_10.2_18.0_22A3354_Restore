@implementation _UIEventDeferringBehavior_Default

- (BOOL)shouldAllowFallbackWindowForEnvironment:(id)a3
{
  return 0;
}

- (BOOL)wantsLocalIdealRules
{
  id WeakRetained;
  void *v3;
  void *v4;
  BOOL v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_eventDeferringManager);
  objc_msgSend(WeakRetained, "windowHostingScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_FBSScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (BOOL)wantsLocalCompatibilityRules
{
  if (!-[_UIEventDeferringBehavior_Default wantsLocalIdealRules](self, "wantsLocalIdealRules"))
    return 1;
  if (wantsLocalCompatibilityRules_onceToken != -1)
    dispatch_once(&wantsLocalCompatibilityRules_onceToken, &__block_literal_global_696);
  if (wantsLocalCompatibilityRules_defaultWantsCompatRules)
    return !-[_UIEventDeferringBehavior_Default systemShellManagesKeyboardFocus](self, "systemShellManagesKeyboardFocus");
  else
    return 0;
}

- (BOOL)systemShellManagesKeyboardFocus
{
  return *(_BYTE *)&self->_behaviorFlags & 1;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_UIEventDeferringBehavior_Default succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIEventDeferringBehavior_Default descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", *(_BYTE *)&self->_behaviorFlags & 1, CFSTR("systemShellManagesKeyboardFocus"));
  return v3;
}

- (_UIEventDeferringBehavior_Default)initWithEventDeferringManager:(id)a3
{
  _UIEventDeferringBehavior_Default *v4;
  _UIEventDeferringBehavior_Default *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIEventDeferringBehavior_Default;
  v4 = -[_UIEventDeferringBehavior_Default init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = objc_storeWeak((id *)&v4->_eventDeferringManager, a3);
    objc_msgSend(a3, "windowHostingScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)&v5->_behaviorFlags = *(_BYTE *)&v5->_behaviorFlags & 0xFE | _UISceneSystemShellManagesKeyboardFocusForScene(v7);

  }
  return v5;
}

- (_UIEventDeferringBehavior_Default)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIEventDeferringBehavior_Default.m"), 32, CFSTR("init is not allowed on %@"), objc_opt_class());

  return 0;
}

- (_UIEventDeferringSystemShellBehaviorDelegate)systemShellBehaviorDelegate
{
  return 0;
}

- (void)setSystemShellBehaviorDelegate:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIEventDeferringBehavior_Default.m"), 52, CFSTR("%s: Invalid to set a system shell behavior delegate for this class: %@"), "-[_UIEventDeferringBehavior_Default setSystemShellBehaviorDelegate:]", self);

}

- (void)setSystemShellManagesKeyboardFocus:(BOOL)a3
{
  char behaviorFlags;
  void *v7;

  behaviorFlags = (char)self->_behaviorFlags;
  if ((behaviorFlags & 1) != 0 || !a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIEventDeferringBehavior_Default.m"), 61, CFSTR("%s: This method should never be called again after it is set"), "-[_UIEventDeferringBehavior_Default setSystemShellManagesKeyboardFocus:]");

    behaviorFlags = (char)self->_behaviorFlags;
  }
  *(_BYTE *)&self->_behaviorFlags = behaviorFlags & 0xFE | a3;
}

- (BOOL)shouldEvaluateEventDeferringForAnyRemoteViewControllerWindowMovement
{
  return 0;
}

- (BOOL)shouldConsiderKeyWindowChangesForRemoteViewControllerAutomaticEventDeferring
{
  return 0;
}

- (BOOL)shouldDisableRemoteViewControllerEventDeferringForKeyboardSettingsSceneChanges
{
  return 1;
}

- (BOOL)shouldDisableRemoteViewControllerEventDeferringForKeyboardKeyWindowChanges
{
  return 0;
}

- (BOOL)shouldSuppressRemoteRuleForOwningElement:(id)a3 inEnvironment:(id)a4
{
  return 0;
}

- (int64_t)compareRemoteRuleOwningElement:(id)a3 toElement:(id)a4 inEnvironment:(id)a5
{
  return _UIEventDeferringBehaviorCompareRuleOwningElementToElement(a3, a4);
}

- (BOOL)wantsSystemKeyCommandOverlayRules
{
  return 0;
}

- (NSString)debugDescription
{
  return (NSString *)-[_UIEventDeferringBehavior_Default debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", 0);
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIEventDeferringBehavior_Default descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (_UIEventDeferringManager)eventDeferringManager
{
  return (_UIEventDeferringManager *)objc_loadWeakRetained((id *)&self->_eventDeferringManager);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_systemShellBehaviorDelegate);
  objc_destroyWeak((id *)&self->_eventDeferringManager);
}

@end
