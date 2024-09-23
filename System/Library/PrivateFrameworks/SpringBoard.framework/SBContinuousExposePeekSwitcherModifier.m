@implementation SBContinuousExposePeekSwitcherModifier

- (SBContinuousExposePeekSwitcherModifier)initWithAppLayout:(id)a3 configuration:(int64_t)a4
{
  id v8;
  SBContinuousExposePeekSwitcherModifier *v9;
  _SBContinuousExposePeekContentSwitcherModifier *v10;
  SBSwitcherModifier *contentModifier;
  SBFilteringSwitcherModifier *v12;
  void *v13;
  SBFilteringSwitcherModifier *v14;
  void *v16;
  objc_super v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SBContinuousExposePeekSwitcherModifier;
  v9 = -[SBSwitcherModifier init](&v17, sel_init);
  if (v9)
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("SBContinuousExposePeekSwitcherModifier.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appLayout"));

    }
    objc_storeStrong((id *)&v9->_appLayout, a3);
    v9->_configuration = a4;
    v10 = -[_SBContinuousExposePeekContentSwitcherModifier initWithAppLayout:configuration:]([_SBContinuousExposePeekContentSwitcherModifier alloc], "initWithAppLayout:configuration:", v9->_appLayout, v9->_configuration);
    contentModifier = v9->_contentModifier;
    v9->_contentModifier = &v10->super;

    v12 = [SBFilteringSwitcherModifier alloc];
    v18[0] = v9->_appLayout;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SBFilteringSwitcherModifier initWithAppLayouts:modifier:](v12, "initWithAppLayouts:modifier:", v13, v9->_contentModifier);

    -[SBChainableModifier addChildModifier:](v9, "addChildModifier:", v14);
  }

  return v9;
}

- (id)debugPotentialChildModifiers
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self->_contentModifier;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)appLayoutsToEnsureExistForMainTransitionEvent:(id)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void)setState:(int64_t)a3
{
  int64_t v5;
  objc_super v6;

  v5 = -[SBChainableModifier state](self, "state");
  if (a3 == 1 && v5 != 1)
    -[SBContinuousExposePeekSwitcherModifier newAppLayoutsGenCount](self, "newAppLayoutsGenCount");
  v6.receiver = self;
  v6.super_class = (Class)SBContinuousExposePeekSwitcherModifier;
  -[SBChainableModifier setState:](&v6, sel_setState_, a3);
}

- (id)handleEvent:(id)a3
{
  id v4;
  void *v5;
  SBContinuousExposePeekTransitionModifier *dismissalTransitionModifier;
  SBInvalidateAdjustedAppLayoutsSwitcherEventResponse *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[5];
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBContinuousExposePeekSwitcherModifier;
  -[SBChainableModifier handleEvent:](&v16, sel_handleEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  dismissalTransitionModifier = self->_dismissalTransitionModifier;
  if (dismissalTransitionModifier && -[SBChainableModifier state](dismissalTransitionModifier, "state") == 1)
  {
    v7 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
    SBAppendSwitcherModifierResponse(v7, v5);
    v8 = objc_claimAutoreleasedReturnValue();

    -[SBContinuousExposePeekSwitcherModifier setState:](self, "setState:", 1);
    v5 = (void *)v8;
  }
  if (objc_msgSend(v4, "isTransitionEvent"))
  {
    v9 = v4;
    objc_msgSend(v9, "toAppLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "fromPeekConfiguration");
    v12 = objc_msgSend(v9, "toPeekConfiguration");
    if (SBPeekConfigurationIsValid(v11)
      && !SBPeekConfigurationIsValid(v12)
      && v10
      && (objc_msgSend(v10, "isEqual:", self->_appLayout) & 1) == 0)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __54__SBContinuousExposePeekSwitcherModifier_handleEvent___block_invoke;
      v15[3] = &unk_1E8E9DF50;
      v15[4] = self;
      objc_msgSend(v10, "appLayoutWithItemsPassingTest:", v15);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setToAppLayout:", v13);

    }
  }

  return v5;
}

uint64_t __54__SBContinuousExposePeekSwitcherModifier_handleEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "containsItem:", a2) ^ 1;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  _BOOL4 IsValid;
  _BOOL4 v9;
  void *v10;
  int v11;
  int v12;
  SBContinuousExposePeekTransitionModifier *v13;
  void *v14;
  SBContinuousExposePeekTransitionModifier *v15;
  SBContinuousExposePeekTransitionModifier *v16;
  void *v17;
  SBContinuousExposePeekTransitionModifier *v18;
  SBContinuousExposePeekTransitionModifier *dismissalTransitionModifier;
  int v20;
  SBInvalidateAdjustedAppLayoutsSwitcherEventResponse *v21;
  uint64_t v22;
  int v23;
  SBInvalidateAdjustedAppLayoutsSwitcherEventResponse *v24;
  uint64_t v25;
  void *v27;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)SBContinuousExposePeekSwitcherModifier;
  -[SBSwitcherModifier handleTransitionEvent:](&v28, sel_handleTransitionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "phase");
  v7 = objc_msgSend(v4, "isAnimated");
  IsValid = SBPeekConfigurationIsValid(objc_msgSend(v4, "toPeekConfiguration"));
  v9 = SBPeekConfigurationIsValid(objc_msgSend(v4, "fromPeekConfiguration"));
  objc_msgSend(v4, "fromAppLayout");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toAppLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == 2)
    v11 = v7 ^ 1;
  else
    v11 = 1;
  v12 = !IsValid;
  if ((v11 & 1) != 0 || (v12 & 1) != 0 || v9)
  {
    if (((v11 | IsValid) & 1) != 0 || !v9)
    {
      if (v6 == 3)
        v20 = v7;
      else
        v20 = 1;
      if (((v20 | IsValid) & 1) == 0)
      {
        v21 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
        SBAppendSwitcherModifierResponse(v21, v5);
        v22 = objc_claimAutoreleasedReturnValue();

        -[SBContinuousExposePeekSwitcherModifier setState:](self, "setState:", 1);
        v5 = (void *)v22;
      }
    }
    else
    {
      v16 = [SBContinuousExposePeekTransitionModifier alloc];
      objc_msgSend(v4, "transitionID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[SBContinuousExposePeekTransitionModifier initWithTransitionID:fromAppLayout:toAppLayout:direction:](v16, "initWithTransitionID:fromAppLayout:toAppLayout:direction:", v17, v27, v10, 1);
      dismissalTransitionModifier = self->_dismissalTransitionModifier;
      self->_dismissalTransitionModifier = v18;

      -[SBChainableModifier addChildModifier:](self, "addChildModifier:", self->_dismissalTransitionModifier);
    }
  }
  else
  {
    v13 = [SBContinuousExposePeekTransitionModifier alloc];
    objc_msgSend(v4, "transitionID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[SBContinuousExposePeekTransitionModifier initWithTransitionID:fromAppLayout:toAppLayout:direction:](v13, "initWithTransitionID:fromAppLayout:toAppLayout:direction:", v14, v27, v10, 0);

    -[SBChainableModifier addChildModifier:](self, "addChildModifier:", v15);
  }
  if (v6 == 2)
    v23 = 0;
  else
    v23 = v7;
  if (((v23 | v12 | v9) & 1) == 0)
  {
    v24 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
    SBAppendSwitcherModifierResponse(v24, v5);
    v25 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v25;
  }

  return v5;
}

- (id)handleScrollEvent:(id)a3
{
  id v4;
  void *v5;
  SBScrollingSwitcherModifier *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBContinuousExposePeekSwitcherModifier;
  -[SBSwitcherModifier handleScrollEvent:](&v12, sel_handleScrollEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "phase") && objc_msgSend(v4, "isUserInitiated"))
  {
    -[SBChainableModifier childModifierByKey:](self, "childModifierByKey:", CFSTR("UserScrollingModifier"));
    v6 = (SBScrollingSwitcherModifier *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v6 = objc_alloc_init(SBScrollingSwitcherModifier);
      -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", v6, 0, CFSTR("UserScrollingModifier"));
      SBLogAppSwitcher();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBChainableModifier succinctDescription](v6, "succinctDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v14 = v9;
        v15 = 2112;
        v16 = v10;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "[%@] Adding child modifier for scroll %@.", buf, 0x16u);

      }
    }

  }
  return v5;
}

- (id)appLayoutsForContinuousExposeIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBContinuousExposePeekSwitcherModifier;
  v4 = a3;
  -[SBContinuousExposePeekSwitcherModifier appLayoutsForContinuousExposeIdentifier:](&v12, sel_appLayoutsForContinuousExposeIdentifier_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppLayout continuousExposeIdentifier](self->_appLayout, "continuousExposeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = BSEqualStrings();

  if (v7)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __82__SBContinuousExposePeekSwitcherModifier_appLayoutsForContinuousExposeIdentifier___block_invoke;
    v11[3] = &unk_1E8E9DF78;
    v11[4] = self;
    objc_msgSend(v5, "bs_filter:", v11);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v5;
  }
  v9 = v8;

  return v9;
}

uint64_t __82__SBContinuousExposePeekSwitcherModifier_appLayoutsForContinuousExposeIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsAnyItemFromAppLayout:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112)) ^ 1;
}

- (unint64_t)maskedCornersForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  objc_super v9;

  -[SBContinuousExposePeekSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isEqual:", self->_appLayout) & 1) != 0)
  {
    v7 = 15;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBContinuousExposePeekSwitcherModifier;
    v7 = -[SBContinuousExposePeekSwitcherModifier maskedCornersForIndex:](&v9, sel_maskedCornersForIndex_, a3);
  }

  return v7;
}

- (BOOL)isSwitcherWindowVisible
{
  return 1;
}

- (unint64_t)transactionCompletionOptions
{
  if (-[SBContinuousExposePeekSwitcherModifier isReduceMotionEnabled](self, "isReduceMotionEnabled"))
    return 6;
  else
    return 2;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (int64_t)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLayout, 0);
  objc_storeStrong((id *)&self->_dismissalTransitionModifier, 0);
  objc_storeStrong((id *)&self->_contentModifier, 0);
}

@end
