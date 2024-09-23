@implementation SBPIPEnvironmentDependentOverrideAssertion

- (SBPIPEnvironmentDependentOverrideAssertion)initWithReason:(int64_t)a3 identifier:(id)a4 windowScene:(id)a5 invalidationBlock:(id)a6
{
  id v10;
  SBPIPEnvironmentDependentOverrideAssertion *v11;
  SBPIPEnvironmentDependentOverrideAssertion *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSSet *allowedEnvironmentModes;
  objc_super v22;

  v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)SBPIPEnvironmentDependentOverrideAssertion;
  v11 = -[SBPIPBehaviorOverrideAssertion initWithReason:identifier:invalidationBlock:](&v22, sel_initWithReason_identifier_invalidationBlock_, a3, a4, a6);
  v12 = v11;
  if (v11)
  {
    v11->_invalidatesEarly = 0;
    objc_storeWeak((id *)&v11->_windowScene, v10);
    -[SBPIPEnvironmentDependentOverrideAssertion _layoutCoordinator](v12, "_layoutCoordinator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:", v12);

    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v10, "switcherController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "layoutState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "numberWithInteger:", -[SBPIPEnvironmentDependentOverrideAssertion _environmentModeForLayoutState:](v12, "_environmentModeForLayoutState:", v17));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithObject:", v18);
    v19 = objc_claimAutoreleasedReturnValue();
    allowedEnvironmentModes = v12->_allowedEnvironmentModes;
    v12->_allowedEnvironmentModes = (NSSet *)v19;

  }
  return v12;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SBPIPEnvironmentDependentOverrideAssertion _layoutCoordinator](self, "_layoutCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SBPIPEnvironmentDependentOverrideAssertion;
  -[BSSimpleAssertion dealloc](&v4, sel_dealloc);
}

- (id)_layoutCoordinator
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "sceneManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_layoutStateTransitionCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)_environmentModeForLayoutState:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isFloatingSwitcherVisible") & 1) != 0)
    v4 = 2;
  else
    v4 = objc_msgSend(v3, "unlockedEnvironmentMode");

  return v4;
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
  if (self->_invalidatesEarly)
    -[SBPIPEnvironmentDependentOverrideAssertion _updateStateForTransitionWithContext:](self, "_updateStateForTransitionWithContext:", a4);
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4
{
  -[SBPIPEnvironmentDependentOverrideAssertion _updateStateForTransitionWithContext:](self, "_updateStateForTransitionWithContext:", a4);
}

- (void)_updateStateForTransitionWithContext:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSSet *allowedEnvironmentModes;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v4, "toLayoutState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  SBSafeCast(v5, v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  allowedEnvironmentModes = self->_allowedEnvironmentModes;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SBPIPEnvironmentDependentOverrideAssertion _environmentModeForLayoutState:](self, "_environmentModeForLayoutState:", v10));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(allowedEnvironmentModes) = -[NSSet containsObject:](allowedEnvironmentModes, "containsObject:", v8);

  if ((allowedEnvironmentModes & 1) == 0)
  {
    -[BSSimpleAssertion invalidate](self, "invalidate");
    -[SBPIPEnvironmentDependentOverrideAssertion _layoutCoordinator](self, "_layoutCoordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObserver:", self);

  }
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  NSSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id WeakRetained;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)SBPIPEnvironmentDependentOverrideAssertion;
  -[SBPIPBehaviorOverrideAssertion descriptionBuilderWithMultilinePrefix:](&v20, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSSet count](self->_allowedEnvironmentModes, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = self->_allowedEnvironmentModes;
  v7 = -[NSSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        SBStringForUnlockedEnvironmentMode(objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "unsignedIntValue", (_QWORD)v16));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v12, CFSTR("Allowed Environment"));

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "succinctDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v14, CFSTR("Window Scene"));

  return v4;
}

- (BOOL)invalidatesEarly
{
  return self->_invalidatesEarly;
}

- (void)setInvalidatesEarly:(BOOL)a3
{
  self->_invalidatesEarly = a3;
}

- (NSSet)allowedEnvironmentModes
{
  return self->_allowedEnvironmentModes;
}

- (void)setAllowedEnvironmentModes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedEnvironmentModes, 0);
  objc_destroyWeak((id *)&self->_windowScene);
}

@end
