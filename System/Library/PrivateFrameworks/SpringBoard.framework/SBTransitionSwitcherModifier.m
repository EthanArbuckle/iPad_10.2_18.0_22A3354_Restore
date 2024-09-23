@implementation SBTransitionSwitcherModifier

- (id)keyboardSuppressionMode
{
  void *v2;
  objc_super v4;

  if (self->_wantsResignActiveAndAsyncRenderingAssertions)
  {
    +[SBSwitcherKeyboardSuppressionMode suppressionModeForAllScenes](SBSwitcherKeyboardSuppressionMode, "suppressionModeForAllScenes");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SBTransitionSwitcherModifier;
    -[SBTransitionSwitcherModifier keyboardSuppressionMode](&v4, sel_keyboardSuppressionMode);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)appLayoutsToResignActive
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (self->_wantsResignActiveAndAsyncRenderingAssertions)
  {
    v2 = (void *)MEMORY[0x1E0C99D80];
    v3 = (void *)MEMORY[0x1E0C99E60];
    -[SBTransitionSwitcherModifier appLayouts](self, "appLayouts");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWithArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "dictionaryWithObject:forKey:", v5, &unk_1E91D04B8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)SBTransitionSwitcherModifier;
    -[SBTransitionSwitcherModifier appLayoutsToResignActive](&v21, sel_appLayoutsToResignActive);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_opt_new();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v8, "allValues", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "allObjects");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObjectsFromArray:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v12);
    }

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v9, &unk_1E91D04D0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    return v16;
  }
}

- (BOOL)isUpdatingLayout
{
  return (self->_transitionPhase & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (BOOL)isPreparingLayout
{
  return self->_transitionPhase == 1;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBTransitionSwitcherModifier;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v6, sel_animationAttributesForLayoutElement_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setUpdateMode:", 3);
  return v4;
}

- (double)visibleMarginForItemContainerAtIndex:(unint64_t)a3
{
  CGRect v4;

  -[SBTransitionSwitcherModifier frameForIndex:](self, "frameForIndex:", a3);
  return CGRectGetWidth(v4);
}

- (BOOL)clipsToUnobscuredMarginAtIndex:(unint64_t)a3
{
  return 0;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBTransitionSwitcherModifier;
  return (SBSwitcherAsyncRenderingAttributes)((unsigned __int16)-[SBTransitionSwitcherModifier asyncRenderingAttributesForAppLayout:](&v4, sel_asyncRenderingAttributesForAppLayout_, a3) & 0xFF01 | self->_wantsResignActiveAndAsyncRenderingAssertions);
}

- (BOOL)wantsAsynchronousSurfaceRetentionAssertion
{
  return 1;
}

- (unint64_t)maskedCornersForIndex:(unint64_t)a3
{
  return 15;
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSArray *obj;
  uint64_t v24;
  _QWORD v25[5];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v34.receiver = self;
  v34.super_class = (Class)SBTransitionSwitcherModifier;
  -[SBTransitionSwitcherModifier adjustedAppLayoutsForAppLayouts:](&v34, sel_adjustedAppLayoutsForAppLayouts_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_appLayoutsToEnsureExist, "count"))
  {
    v20 = v4;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v4);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    obj = self->_appLayoutsToEnsureExist;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v31;
      v21 = *(_QWORD *)v31;
      do
      {
        v8 = 0;
        v22 = v6;
        do
        {
          if (*(_QWORD *)v31 != v7)
            objc_enumerationMutation(obj);
          v9 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v8);
          if ((objc_msgSend(v4, "containsObject:", v9) & 1) == 0)
          {
            v24 = v8;
            v28 = 0u;
            v29 = 0u;
            v26 = 0u;
            v27 = 0u;
            v10 = (void *)objc_msgSend(v4, "copy");
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
            if (v11)
            {
              v12 = v11;
              v13 = *(_QWORD *)v27;
              do
              {
                for (i = 0; i != v12; ++i)
                {
                  if (*(_QWORD *)v27 != v13)
                    objc_enumerationMutation(v10);
                  v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
                  if (objc_msgSend(v15, "containsAnyItemFromAppLayout:", v9))
                  {
                    v16 = objc_msgSend(v4, "indexOfObject:", v15);
                    if (v16 != 0x7FFFFFFFFFFFFFFFLL)
                    {
                      v17 = v16;
                      objc_msgSend(v4, "removeObjectAtIndex:", v16);
                      v25[0] = MEMORY[0x1E0C809B0];
                      v25[1] = 3221225472;
                      v25[2] = __64__SBTransitionSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke;
                      v25[3] = &unk_1E8E9DF50;
                      v25[4] = v9;
                      objc_msgSend(v15, "appLayoutWithItemsPassingTest:", v25);
                      v18 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v18)
                        objc_msgSend(v4, "insertObject:atIndex:", v18, v17);

                    }
                  }
                }
                v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
              }
              while (v12);
            }

            objc_msgSend(v4, "insertObject:atIndex:", v9, 0);
            v7 = v21;
            v6 = v22;
            v8 = v24;
          }
          ++v8;
        }
        while (v8 != v6);
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v6);
    }

  }
  return v4;
}

- (id)transitionWillBegin
{
  BOOL v3;
  void *v4;
  BOOL v5;
  SBTimerEventSwitcherEventResponse *v6;
  double v7;
  SBTimerEventSwitcherEventResponse *v8;
  SBInvalidateAdjustedAppLayoutsSwitcherEventResponse *v9;
  uint64_t v10;
  _QWORD v12[4];
  id v13;
  id location;
  double v15;

  v3 = -[SBTransitionSwitcherModifier asyncRenderingDisabled](self, "asyncRenderingDisabled");
  v4 = 0;
  v5 = !v3;
  if (!self->_wantsResignActiveAndAsyncRenderingAssertions)
    v5 = 0;
  self->_wantsResignActiveAndAsyncRenderingAssertions = v5;
  v15 = 0.0;
  if (!v3)
  {
    if (-[SBTransitionSwitcherModifier shouldAsyncRenderUntilDelay:](self, "shouldAsyncRenderUntilDelay:", &v15))
    {
      objc_initWeak(&location, self);
      v6 = [SBTimerEventSwitcherEventResponse alloc];
      v7 = v15;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __51__SBTransitionSwitcherModifier_transitionWillBegin__block_invoke;
      v12[3] = &unk_1E8EA3468;
      objc_copyWeak(&v13, &location);
      v8 = -[SBTimerEventSwitcherEventResponse initWithDelay:validator:reason:](v6, "initWithDelay:validator:reason:", v12, CFSTR("kSBTransitionModifierInvalidateAsyncRenderingReason"), v7);
      SBAppendSwitcherModifierResponse(v8, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
    else
    {
      v4 = 0;
    }
  }
  if (-[NSArray count](self->_appLayoutsToEnsureExist, "count"))
  {
    v9 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v9, v4);
    v10 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v10;
  }
  return v4;
}

- (id)handleTransitionEvent:(id)a3
{
  id v5;
  void *v6;
  char v7;
  NSArray *v8;
  NSArray *appLayoutsToEnsureExist;
  unint64_t v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unint64_t transitionPhase;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v24;
  SBPreemptAnimationSwitcherEventResponse *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;

  v5 = a3;
  v30.receiver = self;
  v30.super_class = (Class)SBTransitionSwitcherModifier;
  -[SBSwitcherModifier handleTransitionEvent:](&v30, sel_handleTransitionEvent_, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "toEnvironmentMode") == 2)
    v7 = 1;
  else
    v7 = objc_msgSend(v5, "toFloatingSwitcherVisible");
  self->_isTransitioningToSwitcher = v7;
  -[SBTransitionSwitcherModifier appLayoutsToEnsureExistForMainTransitionEvent:](self, "appLayoutsToEnsureExistForMainTransitionEvent:", v5);
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  appLayoutsToEnsureExist = self->_appLayoutsToEnsureExist;
  self->_appLayoutsToEnsureExist = v8;

  v10 = objc_msgSend(v5, "phase");
  objc_msgSend(v5, "transitionID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", self->_transitionID);

  if (v12)
  {
    if (v10 <= self->_transitionPhase)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      SBStringFromTransitionPhase(v10);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      SBStringFromTransitionPhase(self->_transitionPhase);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTransitionSwitcherModifier.m"), 272, CFSTR("Expected a more advanced phase. Got %@, currently %@."), v28, v29);

    }
    self->_transitionPhase = v10;
    if (v10 == 3 && objc_msgSend(v5, "isAnimated"))
    {
      objc_msgSend(v5, "fromAppLayout");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "toAppLayout");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = objc_msgSend(v5, "fromEnvironmentMode");
      v16 = objc_msgSend(v5, "toEnvironmentMode");
      objc_msgSend(v5, "toAppLayout");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (!v17 || v13 == v14 && v15 == v16)
      {

      }
      else
      {
        v24 = objc_msgSend(v5, "toEnvironmentMode");

        if (v24 == 3)
        {
          v25 = -[SBPreemptAnimationSwitcherEventResponse initWithOptions:]([SBPreemptAnimationSwitcherEventResponse alloc], "initWithOptions:", 2);
          SBAppendSwitcherModifierResponse(v25, v6);
          v26 = objc_claimAutoreleasedReturnValue();

          v6 = (void *)v26;
        }
      }
    }
  }
  else
  {
    self->_isInterrupted = 1;
    self->_transitionPhase = 3;
  }
  transitionPhase = self->_transitionPhase;
  if (transitionPhase == 3)
  {
    -[SBChainableModifier setState:](self, "setState:", 1);
    transitionPhase = self->_transitionPhase;
  }
  switch(transitionPhase)
  {
    case 3uLL:
      -[SBTransitionSwitcherModifier transitionDidEnd](self, "transitionDidEnd");
      v20 = objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    case 2uLL:
      -[SBTransitionSwitcherModifier transitionWillUpdate](self, "transitionWillUpdate");
      v20 = objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    case 1uLL:
      -[SBTransitionSwitcherModifier transitionWillBegin](self, "transitionWillBegin");
      v20 = objc_claimAutoreleasedReturnValue();
LABEL_22:
      v21 = (void *)v20;
      SBAppendSwitcherModifierResponse(v20, v6);
      v22 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v22;
      break;
  }

  return v6;
}

- (id)transitionWillUpdate
{
  return 0;
}

- (id)transitionDidEnd
{
  SBInvalidateAdjustedAppLayoutsSwitcherEventResponse *v2;
  void *v3;

  if (-[NSArray count](self->_appLayoutsToEnsureExist, "count"))
  {
    v2 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v2, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)asyncRenderingDisabled
{
  return self->_asyncRenderingDisabled;
}

- (unint64_t)transitionPhase
{
  return self->_transitionPhase;
}

BOOL __51__SBTransitionSwitcherModifier_transitionWillBegin__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _BOOL8 v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "parentModifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)handleTimerEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBTransitionSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier handleTimerEvent:](&v8, sel_handleTimerEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reason", v8.receiver, v8.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v6, "isEqualToString:", CFSTR("kSBTransitionModifierInvalidateAsyncRenderingReason"));
  if ((_DWORD)v4)
    self->_wantsResignActiveAndAsyncRenderingAssertions = 0;
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionID, 0);
  objc_storeStrong((id *)&self->_appLayoutsToEnsureExist, 0);
}

- (SBTransitionSwitcherModifier)initWithTransitionID:(id)a3
{
  id v6;
  SBTransitionSwitcherModifier *v7;
  void *v9;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBTransitionSwitcherModifier;
  v7 = -[SBSwitcherModifier init](&v10, sel_init);
  if (v7)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("SBTransitionSwitcherModifier.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transitionID"));

    }
    objc_storeStrong((id *)&v7->_transitionID, a3);
    v7->_transitionPhase = 0;
    v7->_wantsResignActiveAndAsyncRenderingAssertions = 1;
  }

  return v7;
}

- (BOOL)isInterrupted
{
  return self->_isInterrupted;
}

- (BOOL)shouldAsyncRenderUntilDelay:(double *)a3
{
  return 0;
}

- (BOOL)shouldInterruptForRemovalEvent:(id)a3
{
  return 1;
}

- (id)interruptAndEndTransition
{
  void *v2;

  if (self->_transitionPhase == 3)
  {
    v2 = 0;
  }
  else
  {
    self->_isInterrupted = 1;
    self->_transitionPhase = 3;
    -[SBChainableModifier setState:](self, "setState:", 1);
    -[SBTransitionSwitcherModifier transitionDidEnd](self, "transitionDidEnd");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (BOOL)requireStripContentsInViewHierarchy
{
  return 1;
}

uint64_t __64__SBTransitionSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  int v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "allItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5 ^ 1u;
}

- (BOOL)shouldPerformCrossfadeForReduceMotion
{
  return 1;
}

- (void)_setTransitionPhase:(unint64_t)a3
{
  self->_transitionPhase = a3;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBTransitionSwitcherModifier;
  -[SBChainableModifier descriptionBuilderWithMultilinePrefix:](&v7, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SBStringFromTransitionPhase(self->_transitionPhase);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v5, CFSTR("phase"));

  return v4;
}

- (id)handleGestureEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBTransitionSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier handleGestureEvent:](&v10, sel_handleGestureEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "phase", v10.receiver, v10.super_class);

  if (v6)
  {
    self->_isInterrupted = 1;
    self->_transitionPhase = 3;
    -[SBChainableModifier setState:](self, "setState:", 1);
    -[SBTransitionSwitcherModifier transitionDidEnd](self, "transitionDidEnd");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    SBAppendSwitcherModifierResponse(v7, v5);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  return v5;
}

- (id)handleScrollEvent:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  SBPreemptAnimationSwitcherEventResponse *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBTransitionSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier handleScrollEvent:](&v11, sel_handleScrollEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isUserInitiated", v11.receiver, v11.super_class);

  if (v6 && self->_isTransitioningToSwitcher)
  {
    -[SBTransitionSwitcherModifier interruptAndEndTransition](self, "interruptAndEndTransition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = -[SBPreemptAnimationSwitcherEventResponse initWithOptions:]([SBPreemptAnimationSwitcherEventResponse alloc], "initWithOptions:", 1);
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v9, v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)handleRemovalEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBTransitionSwitcherModifier;
  -[SBSwitcherModifier handleRemovalEvent:](&v9, sel_handleRemovalEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "phase") == 1
    && -[SBTransitionSwitcherModifier shouldInterruptForRemovalEvent:](self, "shouldInterruptForRemovalEvent:", v4))
  {
    -[SBTransitionSwitcherModifier interruptAndEndTransition](self, "interruptAndEndTransition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v6, v5);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }

  return v5;
}

- (NSUUID)transitionID
{
  return self->_transitionID;
}

@end
