@implementation SBFluidSwitcherLayoutContext

- (BOOL)_shouldUpdateSwitcherModelBasedOnTimeOrUserInteraction
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v8;
  double v9;
  double v10;
  double v11;

  -[SBFluidSwitcherLayoutContext layoutState](self, "layoutState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "unlockedEnvironmentMode") == 3 && (objc_msgSend(v3, "isFloatingSwitcherVisible") & 1) == 0)
  {
    -[SBFluidSwitcherLayoutContext activeTransitionContext](self, "activeTransitionContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {

    }
    else
    {
      -[SBFluidSwitcherLayoutContext activeGesture](self, "activeGesture");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
      {
        -[SBFluidSwitcherLayoutContext lastTransitionCompletionDate](self, "lastTransitionCompletionDate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "timeIntervalSinceNow");
        v10 = -v9;

        -[SBHomeGestureSettings secondsToResetSwitcherListAfterTransition](self->_homeGestureSettings, "secondsToResetSwitcherListAfterTransition");
        if (v11 < v10
          || self->_hasUserInteractedWithActiveApplication
          && -[SBHomeGestureSettings resetSwitcherListAfterAppInteraction](self->_homeGestureSettings, "resetSwitcherListAfterAppInteraction"))
        {
          v6 = 1;
          goto LABEL_7;
        }
      }
    }
  }
  v6 = 0;
LABEL_7:

  return v6;
}

- (void)willBeginTransitioningToLayoutStateWithContext:(id)a3
{
  void *v5;
  uint64_t v6;
  SBFluidSwitcherGesture *activeGesture;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_storeStrong((id *)&self->_activeTransitionContext, a3);
  objc_msgSend(v10, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "source");

  if (v6 != 27 && v6 != 68)
  {
    activeGesture = self->_activeGesture;
    self->_activeGesture = 0;

  }
  objc_msgSend(v10, "layoutState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "previousLayoutState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_currentLayoutState, v8);
  if ((objc_msgSend(v8, "isEqual:", v9) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_previousLayoutState, v9);
    self->_previousInterfaceOrientation = objc_msgSend(v9, "interfaceOrientation");
  }
  if (!-[SBMainDisplayLayoutState isEqual:](self->_currentLayoutState, "isEqual:", self->_previousLayoutState))
    self->_hasUserInteractedWithActiveApplication = 0;

}

- (void)didEndTransitioningToLayoutStateWithContext:(id)a3
{
  void *v4;
  id v5;
  NSDate *v6;
  NSDate *lastTransitionCompletionDate;
  void *v8;
  SBWorkspaceApplicationSceneTransitionContext *activeTransitionContext;
  id obj;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastTransitionCompletionDate = self->_lastTransitionCompletionDate;
  self->_lastTransitionCompletionDate = v6;

  objc_msgSend(v5, "layoutState");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previousLayoutState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)&self->_currentLayoutState, obj);
  if ((objc_msgSend(obj, "isEqual:", v8) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_previousLayoutState, v8);
    self->_previousInterfaceOrientation = objc_msgSend(v8, "interfaceOrientation");
  }
  if (!-[SBMainDisplayLayoutState isEqual:](self->_currentLayoutState, "isEqual:", self->_previousLayoutState))
    self->_hasUserInteractedWithActiveApplication = 0;
  activeTransitionContext = self->_activeTransitionContext;
  self->_activeTransitionContext = 0;

}

- (SBWorkspaceApplicationSceneTransitionContext)activeTransitionContext
{
  return self->_activeTransitionContext;
}

- (SBFluidSwitcherGesture)activeGesture
{
  return self->_activeGesture;
}

- (SBMainDisplayLayoutState)layoutState
{
  return self->_currentLayoutState;
}

- (SBMainDisplayLayoutState)transitioningFromLayoutState
{
  return (SBMainDisplayLayoutState *)-[SBWorkspaceApplicationSceneTransitionContext previousLayoutState](self->_activeTransitionContext, "previousLayoutState");
}

- (SBMainDisplayLayoutState)transitioningToLayoutState
{
  return (SBMainDisplayLayoutState *)-[SBWorkspaceApplicationSceneTransitionContext layoutState](self->_activeTransitionContext, "layoutState");
}

- (double)secondsSinceLastTransitionCompletion
{
  void *v2;
  double v3;
  double v4;

  -[SBFluidSwitcherLayoutContext lastTransitionCompletionDate](self, "lastTransitionCompletionDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceNow");
  v4 = -v3;

  return v4;
}

- (NSDate)lastTransitionCompletionDate
{
  return self->_lastTransitionCompletionDate;
}

- (BOOL)shouldAddAppLayoutToFront:(id)a3 forTransitionWithContext:(id)a4 recentAppLayouts:(id)a5 transitionCompleted:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  int v24;
  int v25;
  BOOL v26;
  void *v27;
  BOOL v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v38;
  _BOOL4 v39;
  SBFluidSwitcherLayoutContext *v40;
  void *v41;
  void *v42;
  void *v43;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v43 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFluidSwitcherLayoutContext.m"), 245, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("newAppLayout"));

  }
  v40 = self;
  objc_msgSend(v12, "request");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layoutState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "previousLayoutState");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v14;
  v17 = objc_msgSend(v14, "source");
  if (v17 == 14)
  {
    v18 = objc_msgSend(v16, "interfaceOrientation");
    v39 = v18 == objc_msgSend(v15, "interfaceOrientation");
  }
  else
  {
    v39 = 0;
  }
  objc_msgSend(v16, "elements");
  v19 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "elements");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v13;
  objc_msgSend(v13, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)v19;
  if (BSEqualObjects())
  {
    v23 = BSEqualSets();

    if ((v23 & 1) != 0)
    {
LABEL_8:
      LOBYTE(v24) = 0;
LABEL_25:
      v27 = v21;
      goto LABEL_47;
    }
  }
  else
  {

  }
  v25 = objc_msgSend(v12, "preventSwitcherRecencyModelUpdates");
  LOBYTE(v24) = 0;
  v26 = !a6;
  if (v17 != 15)
    v26 = 0;
  if (v26)
    goto LABEL_25;
  v27 = v21;
  if (!v25)
  {
    v28 = a6;
    if (objc_msgSend(v16, "unlockedEnvironmentMode") == 2)
    {
      v29 = objc_msgSend(v15, "unlockedEnvironmentMode");
      if (v17 == 27 && v29 == 2)
        goto LABEL_42;
    }
    if (v17 == 63)
      goto LABEL_42;
    if (v17 == 56)
      goto LABEL_46;
    v30 = v17 - 11;
    if (v17 == 52)
    {
      objc_msgSend(v15, "appLayout");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "itemForLayoutRole:", 4);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v32)
        goto LABEL_8;
    }
    else if (v30 < 2)
    {
LABEL_26:
      v27 = v21;
      v24 = objc_msgSend(v21, "containsObject:", v43) ^ 1;
      if (((v24 | v39) & 1) != 0)
        goto LABEL_47;
      if (v28)
      {
        if (v30 <= 1)
        {
          objc_msgSend(v16, "elements");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v33, "count"))
          {
            objc_msgSend(v15, "elements");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v24) = objc_msgSend(v34, "count") == 0;

            v27 = v21;
            goto LABEL_47;
          }

        }
LABEL_46:
        LOBYTE(v24) = 1;
        goto LABEL_47;
      }
      if (objc_msgSend(v43, "environment") == 2)
      {
        if ((objc_msgSend(v16, "isFloatingSwitcherVisible") & 1) == 0
          && (objc_msgSend(v15, "isFloatingSwitcherVisible") & 1) != 0)
        {
          goto LABEL_46;
        }
        objc_msgSend(v16, "floatingAppLayout");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v35)
          goto LABEL_46;
      }
      if (objc_msgSend(v16, "unlockedEnvironmentMode") == 1 && objc_msgSend(v15, "unlockedEnvironmentMode") == 3)
        goto LABEL_46;
      if (objc_msgSend(v16, "unlockedEnvironmentMode") == 3)
        v36 = objc_msgSend(v16, "isFloatingSwitcherVisible");
      else
        v36 = 1;
      if (objc_msgSend(v15, "unlockedEnvironmentMode") == 3
        && ((v36 | objc_msgSend(v15, "isFloatingSwitcherVisible")) & 1) == 0)
      {
        if (v17 < 0x10)
        {
          v24 = (0x67FFu >> v17) & 1;
          goto LABEL_47;
        }
        goto LABEL_46;
      }
LABEL_42:
      LOBYTE(v24) = 0;
      goto LABEL_47;
    }
    if (-[SBFluidSwitcherLayoutContext _shouldUpdateSwitcherModelBasedOnTimeOrUserInteraction](v40, "_shouldUpdateSwitcherModelBasedOnTimeOrUserInteraction"))
    {
      LOBYTE(v24) = 1;
      goto LABEL_25;
    }
    goto LABEL_26;
  }
LABEL_47:

  return v24;
}

- (SBFluidSwitcherLayoutContext)initWithLayoutState:(id)a3
{
  id v5;
  SBFluidSwitcherLayoutContext *v6;
  SBFluidSwitcherLayoutContext *v7;
  uint64_t v8;
  SBHomeGestureSettings *homeGestureSettings;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBFluidSwitcherLayoutContext;
  v6 = -[SBFluidSwitcherLayoutContext init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_currentLayoutState, a3);
    objc_storeStrong((id *)&v7->_previousLayoutState, a3);
    v7->_previousInterfaceOrientation = objc_msgSend(v5, "interfaceOrientation");
    +[SBHomeGestureDomain rootSettings](SBHomeGestureDomain, "rootSettings");
    v8 = objc_claimAutoreleasedReturnValue();
    homeGestureSettings = v7->_homeGestureSettings;
    v7->_homeGestureSettings = (SBHomeGestureSettings *)v8;

    +[SBAppInteractionEventSourceManager sharedInstance](SBAppInteractionEventSourceManager, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:", v7);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[SBAppInteractionEventSourceManager sharedInstance](SBAppInteractionEventSourceManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SBFluidSwitcherLayoutContext;
  -[SBFluidSwitcherLayoutContext dealloc](&v4, sel_dealloc);
}

- (void)setActiveGesture:(id)a3
{
  SBFluidSwitcherGesture *v5;
  SBWorkspaceApplicationSceneTransitionContext *activeTransitionContext;
  SBFluidSwitcherGesture *v7;

  v5 = (SBFluidSwitcherGesture *)a3;
  if (self->_activeGesture != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_activeGesture, a3);
    activeTransitionContext = self->_activeTransitionContext;
    self->_activeTransitionContext = 0;

    v5 = v7;
  }

}

- (unint64_t)supportedOrientationsForGesture
{
  void *v2;
  void *v4;
  unint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  SBMainDisplayLayoutState *v10;
  SBMainDisplayLayoutState *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  void *v22;
  _BOOL4 v23;
  uint64_t v25;
  uint64_t v26;

  -[SBFluidSwitcherLayoutContext layoutState](self, "layoutState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 1 << objc_msgSend(v4, "interfaceOrientation");

  -[SBFluidSwitcherLayoutContext activeTransitionContext](self, "activeTransitionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidSwitcherLayoutContext secondsSinceLastTransitionCompletion](self, "secondsSinceLastTransitionCompletion");
  if (!v6)
  {
    v8 = v7;
    -[SBHomeGestureSettings secondsToAllowMultipleEdges](self->_homeGestureSettings, "secondsToAllowMultipleEdges");
    if (v8 >= v9)
      goto LABEL_31;
  }
  if (self->_hasUserInteractedWithActiveApplication
    && -[SBHomeGestureSettings preventMultipleEdgesAfterAppInteraction](self->_homeGestureSettings, "preventMultipleEdgesAfterAppInteraction"))
  {
    goto LABEL_31;
  }
  if (v6)
  {
    objc_msgSend(v6, "previousLayoutState");
    v10 = (SBMainDisplayLayoutState *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layoutState");
    v11 = (SBMainDisplayLayoutState *)objc_claimAutoreleasedReturnValue();
    v12 = -[SBLayoutState interfaceOrientation](v11, "interfaceOrientation", -[SBLayoutState interfaceOrientation](v10, "interfaceOrientation"));
  }
  else
  {
    v10 = self->_previousLayoutState;
    v11 = self->_currentLayoutState;
    v12 = -[SBLayoutState interfaceOrientation](self->_currentLayoutState, "interfaceOrientation", self->_previousInterfaceOrientation);
  }
  v26 = v12;
  -[SBLayoutState elements](v10, "elements");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    -[SBLayoutState elements](v11, "elements");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v2, "count"))
    {
      v16 = 1;
LABEL_13:

      goto LABEL_14;
    }
  }
  -[SBLayoutState elements](v10, "elements");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLayoutState elements](v11, "elements");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isEqual:", v15);

  if (!v13)
    goto LABEL_13;
LABEL_14:

  v17 = -[SBMainDisplayLayoutState unlockedEnvironmentMode](v10, "unlockedEnvironmentMode");
  v18 = -[SBMainDisplayLayoutState unlockedEnvironmentMode](v11, "unlockedEnvironmentMode");
  if (v25 == v26)
  {
    v19 = 0;
  }
  else if (v17 == 3 && v18 == 3 || v18 == 1)
  {
    v19 = v16;
  }
  else
  {
    v19 = 0;
  }
  -[SBFluidSwitcherLayoutContext layoutState](self, "layoutState");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "unlockedEnvironmentMode") == 1 && objc_msgSend((id)SBApp, "homeScreenRotationStyle") != 0;

  if (((v19 | v23) & 1) == 0)
    v5 = (int)((1 << v25) | (1 << v26) | v5);

LABEL_31:
  return v5;
}

- (BOOL)shouldAddAppLayoutToFront:(id)a3 whenBeginningGestureOfType:(int64_t)a4 layoutContext:(id)a5
{
  id v9;
  id v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v17;

  v9 = a3;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFluidSwitcherLayoutContext.m"), 193, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("newAppLayout"));

  }
  -[SBFluidSwitcherLayoutContext layoutState](self, "layoutState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 == 4)
    goto LABEL_8;
  if (a4 == 8)
  {
    v12 = 0;
    goto LABEL_17;
  }
  v13 = objc_msgSend(v9, "environment");
  if (a4 == 6 && v13 == 2)
  {
LABEL_8:
    v12 = 1;
    goto LABEL_17;
  }
  v14 = objc_msgSend(v11, "windowPickerRole");
  objc_msgSend(v11, "bundleIDShowingAppExpose");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "environment") == 2 && v14 == 3
     || objc_msgSend(v9, "environment") == 1 && SBLayoutRoleIsValidForSplitView(v14)
     || objc_msgSend(v9, "environment") == 1 && v15
     || -[SBFluidSwitcherLayoutContext _shouldUpdateSwitcherModelBasedOnTimeOrUserInteraction](self, "_shouldUpdateSwitcherModelBasedOnTimeOrUserInteraction");

LABEL_17:
  return v12;
}

- (BOOL)shouldAddAppLayoutToFront:(id)a3 whenEndingGestureOfType:(int64_t)a4 layoutContext:(id)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  BOOL IsStashed;
  void *v11;
  BOOL v12;
  BOOL v13;
  char v14;

  v7 = a5;
  v8 = objc_msgSend(a3, "environment");
  objc_msgSend(v7, "previousLayoutState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  IsStashed = SBFloatingConfigurationIsStashed(objc_msgSend(v9, "floatingConfiguration"));

  objc_msgSend(v7, "layoutState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = SBFloatingConfigurationIsStashed(objc_msgSend(v11, "floatingConfiguration"));
  v13 = a4 == 3 && v8 == 2;
  v14 = !v12;
  if (!v13)
    v14 = 1;
  return (v14 | IsStashed) ^ 1;
}

- (void)eventSource:(id)a3 userTouchedApplication:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  SBFluidSwitcherLayoutContext *v11;

  v5 = a4;
  -[SBFluidSwitcherLayoutContext currentLayoutState](self, "currentLayoutState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "elements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__SBFluidSwitcherLayoutContext_eventSource_userTouchedApplication___block_invoke;
  v9[3] = &unk_1E8EA5F00;
  v10 = v5;
  v11 = self;
  v8 = v5;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);

}

void __67__SBFluidSwitcherLayoutContext_eventSource_userTouchedApplication___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;

  objc_msgSend(a2, "workspaceEntity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationSceneEntity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "application");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v9)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 8) = 1;
    *a3 = 1;
  }
}

- (NSString)description
{
  return (NSString *)-[SBFluidSwitcherLayoutContext descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBFluidSwitcherLayoutContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBFluidSwitcherLayoutContext descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBFluidSwitcherLayoutContext *v11;

  v4 = a3;
  -[SBFluidSwitcherLayoutContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__SBFluidSwitcherLayoutContext_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

void __70__SBFluidSwitcherLayoutContext_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  int8x16_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  void *v28;
  int8x16_t v29;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("currentLayoutState"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), CFSTR("previousLayoutState"));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48);
  v5 = CFSTR("UIInterfaceOrientationLandscapeRight");
  v6 = CFSTR("UIInterfaceOrientationLandscapeLeft");
  v7 = CFSTR("UIInterfaceOrientationPortraitUpsideDown");
  if (v4 != 2)
    v7 = 0;
  if (v4 != 4)
    v6 = v7;
  if (v4 != 3)
    v5 = v6;
  if (v4 == 1)
    v8 = CFSTR("UIInterfaceOrientationPortrait");
  else
    v8 = v5;
  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", v8, CFSTR("previousInterfaceOrientation"));
  v9 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 80), CFSTR("lastTransitionCompletionDate"));
  v10 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("hasUserInteractedWithActiveApplication"));
  v11 = *(void **)(a1 + 32);
  objc_msgSend(v11, "activeMultilinePrefix");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = MEMORY[0x1E0C809B0];
  v26 = 3221225472;
  v27 = __70__SBFluidSwitcherLayoutContext_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v28 = &unk_1E8E9E820;
  v24 = *(int8x16_t *)(a1 + 32);
  v13 = (id)v24.i64[0];
  v29 = vextq_s8(v24, v24, 8uLL);
  objc_msgSend(v11, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("supportedOrientationsForGesture"), v12, &v25);

  v14 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24) != 0, CFSTR("isTransitioning"));
  v15 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("activeTransitionContext"), 1);
  v16 = *(_QWORD **)(a1 + 40);
  if (v16[3])
  {
    v17 = *(void **)(a1 + 32);
    objc_msgSend(v16, "transitioningFromLayoutState");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (id)objc_msgSend(v17, "appendObject:withName:", v18, CFSTR("transitioningFromLayoutState"));

    v20 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "transitioningToLayoutState");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (id)objc_msgSend(v20, "appendObject:withName:", v21, CFSTR("transitioningToLayoutState"));

    v16 = *(_QWORD **)(a1 + 40);
  }
  v23 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", v16[2], CFSTR("activeGesture"), *(_OWORD *)&v24, v25, v26, v27, v28);

}

void __70__SBFluidSwitcherLayoutContext_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  int8x8_t v2;
  _QWORD *v3;
  uint8x8_t v4;
  int v5;
  unint64_t v6;
  _QWORD v7[2];
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  char v11;

  v2 = (int8x8_t)objc_msgSend(*(id *)(a1 + 32), "supportedOrientationsForGesture");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v8 = __70__SBFluidSwitcherLayoutContext_descriptionBuilderWithMultilinePrefix___block_invoke_3;
  v9 = &unk_1E8E9EB40;
  v10 = *(id *)(a1 + 40);
  v3 = v7;
  if (v2)
  {
    v11 = 0;
    v4 = (uint8x8_t)vcnt_s8(v2);
    v4.i16[0] = vaddlv_u8(v4);
    v5 = v4.i32[0];
    if (v4.i32[0])
    {
      v6 = 0;
      do
      {
        if (((1 << v6) & *(_QWORD *)&v2) != 0)
        {
          v8((uint64_t)v3);
          if (v11)
            break;
          --v5;
        }
        if (v6 > 0x3E)
          break;
        ++v6;
      }
      while (v5 > 0);
    }
  }

}

void __70__SBFluidSwitcherLayoutContext_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  BSInterfaceOrientationDescription();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v1, "appendObject:withName:", v3, 0);

}

- (SBMainDisplayLayoutState)currentLayoutState
{
  return self->_currentLayoutState;
}

- (void)setCurrentLayoutState:(id)a3
{
  objc_storeStrong((id *)&self->_currentLayoutState, a3);
}

- (SBMainDisplayLayoutState)previousLayoutState
{
  return self->_previousLayoutState;
}

- (void)setPreviousLayoutState:(id)a3
{
  objc_storeStrong((id *)&self->_previousLayoutState, a3);
}

- (int64_t)previousInterfaceOrientation
{
  return self->_previousInterfaceOrientation;
}

- (void)setPreviousInterfaceOrientation:(int64_t)a3
{
  self->_previousInterfaceOrientation = a3;
}

- (SBAppLayout)currentAppLayout
{
  return self->_currentAppLayout;
}

- (void)setCurrentAppLayout:(id)a3
{
  objc_storeStrong((id *)&self->_currentAppLayout, a3);
}

- (SBAppLayout)transitioningFromAppLayout
{
  return self->_transitioningFromAppLayout;
}

- (void)setTransitioningFromAppLayout:(id)a3
{
  objc_storeStrong((id *)&self->_transitioningFromAppLayout, a3);
}

- (SBAppLayout)transitioningToAppLayout
{
  return self->_transitioningToAppLayout;
}

- (void)setTransitioningToAppLayout:(id)a3
{
  objc_storeStrong((id *)&self->_transitioningToAppLayout, a3);
}

- (void)setLastTransitionCompletionDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastTransitionCompletionDate, a3);
}

- (BOOL)hasUserInteractedWithActiveApplication
{
  return self->_hasUserInteractedWithActiveApplication;
}

- (void)setHasUserInteractedWithActiveApplication:(BOOL)a3
{
  self->_hasUserInteractedWithActiveApplication = a3;
}

- (SBHomeGestureSettings)homeGestureSettings
{
  return self->_homeGestureSettings;
}

- (void)setHomeGestureSettings:(id)a3
{
  objc_storeStrong((id *)&self->_homeGestureSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeGestureSettings, 0);
  objc_storeStrong((id *)&self->_lastTransitionCompletionDate, 0);
  objc_storeStrong((id *)&self->_transitioningToAppLayout, 0);
  objc_storeStrong((id *)&self->_transitioningFromAppLayout, 0);
  objc_storeStrong((id *)&self->_currentAppLayout, 0);
  objc_storeStrong((id *)&self->_previousLayoutState, 0);
  objc_storeStrong((id *)&self->_currentLayoutState, 0);
  objc_storeStrong((id *)&self->_activeTransitionContext, 0);
  objc_storeStrong((id *)&self->_activeGesture, 0);
}

@end
