@implementation SBFloatingFluidSwitcherRootSwitcherModifier

- (SBFloatingFluidSwitcherRootSwitcherModifier)init
{
  SBFloatingFluidSwitcherRootSwitcherModifier *v2;
  SBFloatingFluidSwitcherRootSwitcherModifier *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBFloatingFluidSwitcherRootSwitcherModifier;
  v2 = -[SBSwitcherModifier init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = *(void **)&v2->_floatingSwitcherVisible;
    *(_QWORD *)&v2->_floatingSwitcherVisible = 0;

    v3->_activeAppLayout = (SBAppLayout *)1;
    v3->_interfaceOrientation = 4;
    v3->super._hasPerformedInitialSetup = 0;
  }
  return v3;
}

- (void)setDelegate:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBFloatingFluidSwitcherRootSwitcherModifier;
  -[SBFluidSwitcherRootSwitcherModifier setDelegate:](&v5, sel_setDelegate_);
  if (a3)
    -[SBFloatingFluidSwitcherRootSwitcherModifier _updateContainerViewBounds](self, "_updateContainerViewBounds");
}

- (id)handleEvent:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  BOOL *p_hasPerformedInitialSetup;
  SBInvalidateAdjustedAppLayoutsSwitcherEventResponse *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  if (objc_msgSend(v4, "type") == 1)
  {
    v5 = objc_opt_class();
    SBSafeCast(v5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "toFloatingAppLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "toFloatingSwitcherVisible");
    if ((unint64_t)objc_msgSend(v6, "phase") >= 2)
    {
      if ((v8 & 1) == 0 && objc_msgSend(v6, "toEnvironmentMode") != 2)
        self->_interfaceOrientation = objc_msgSend(v6, "toFloatingConfiguration");
      self->_activeAppLayout = (SBAppLayout *)objc_msgSend(v6, "toInterfaceOrientation");
      -[SBFloatingFluidSwitcherRootSwitcherModifier _updateContainerViewBounds](self, "_updateContainerViewBounds");
    }
    if (BSEqualObjects())
    {
      p_hasPerformedInitialSetup = &self->super._hasPerformedInitialSetup;
      if (self->super._hasPerformedInitialSetup == v8)
      {
        v10 = 0;
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      objc_storeStrong((id *)&self->_floatingSwitcherVisible, v7);
      p_hasPerformedInitialSetup = &self->super._hasPerformedInitialSetup;
      if (self->super._hasPerformedInitialSetup == v8)
      {
LABEL_13:
        v10 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
        goto LABEL_14;
      }
    }
    *p_hasPerformedInitialSetup = v8;
    goto LABEL_13;
  }
  v10 = 0;
LABEL_15:
  v14.receiver = self;
  v14.super_class = (Class)SBFloatingFluidSwitcherRootSwitcherModifier;
  -[SBFluidSwitcherRootSwitcherModifier handleEvent:](&v14, sel_handleEvent_, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)handleTapAppLayoutEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  SBPerformTransitionSwitcherEventResponse *v8;
  uint64_t v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBFloatingFluidSwitcherRootSwitcherModifier;
  -[SBSwitcherModifier handleTapAppLayoutEvent:](&v11, sel_handleTapAppLayoutEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isHandled") & 1) == 0
    && objc_msgSend(v6, "isEqual:", *(_QWORD *)&self->_floatingSwitcherVisible)
    && objc_msgSend(v4, "source") == 1)
  {
    +[SBSwitcherTransitionRequest requestForTapAppLayoutEvent:](SBSwitcherTransitionRequest, "requestForTapAppLayoutEvent:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v7, 0);
    SBAppendSwitcherModifierResponse(v8, v5);
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v9;
  }

  return v5;
}

- (CGRect)containerViewBounds
{
  double v2;
  double x;
  double y;
  double width;
  CGRect result;

  v2 = *(double *)&self->_floatingConfiguration;
  x = self->_containerViewBounds.origin.x;
  y = self->_containerViewBounds.origin.y;
  width = self->_containerViewBounds.size.width;
  result.size.height = width;
  result.size.width = y;
  result.origin.y = x;
  result.origin.x = v2;
  return result;
}

- (id)appLayoutsToEnsureExistForMainTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v10;
  id v11;
  char v12;
  _QWORD v13[4];
  id v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBFloatingFluidSwitcherRootSwitcherModifier;
  -[SBFloatingFluidSwitcherRootSwitcherModifier appLayoutsToEnsureExistForMainTransitionEvent:](&v15, sel_appLayoutsToEnsureExistForMainTransitionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fromFloatingAppLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toFloatingAppLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((BSEqualObjects() & 1) != 0
    || (objc_msgSend(v4, "fromFloatingSwitcherVisible") & 1) != 0
    || (objc_msgSend(v4, "isDragAndDropTransition") & 1) != 0)
  {
    v8 = v5;
  }
  else
  {
    v8 = (id)objc_msgSend(v5, "mutableCopy");
    if (!v8)
      v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v4, "fromDisplayItemsPendingTermination");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __93__SBFloatingFluidSwitcherRootSwitcherModifier_appLayoutsToEnsureExistForMainTransitionEvent___block_invoke;
    v13[3] = &unk_1E8E9DF50;
    v11 = v6;
    v14 = v11;
    v12 = objc_msgSend(v10, "bs_containsObjectPassingTest:", v13);

    if (v11 && (v12 & 1) == 0)
      objc_msgSend(v8, "addObject:", v11);
    if (v7)
      objc_msgSend(v8, "addObject:", v7);

  }
  return v8;
}

uint64_t __93__SBFloatingFluidSwitcherRootSwitcherModifier_appLayoutsToEnsureExistForMainTransitionEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsItem:", a2);
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBFloatingFluidSwitcherRootSwitcherModifier;
  -[SBFloatingFluidSwitcherRootSwitcherModifier adjustedAppLayoutsForAppLayouts:](&v13, sel_adjustedAppLayoutsForAppLayouts_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (self->super._hasPerformedInitialSetup)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "indexOfObject:", *(_QWORD *)&self->_floatingSwitcherVisible);
    if (v7 == 0x7FFFFFFFFFFFFFFFLL || v7 == 0)
    {
      objc_msgSend(v6, "addObjectsFromArray:", v5);
    }
    else
    {
      v9 = v7;
      objc_msgSend(v5, "subarrayWithRange:", v9, objc_msgSend(v5, "count") - v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObjectsFromArray:", v10);

      objc_msgSend(v5, "subarrayWithRange:", 0, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObjectsFromArray:", v11);

    }
  }

  return v6;
}

- (id)appExposeAccessoryButtonsBundleIdentifier
{
  return 0;
}

- (id)topMostLayoutElements
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  objc_super v14;
  objc_super v15;
  objc_super v16;
  objc_super v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)SBFloatingFluidSwitcherRootSwitcherModifier;
  -[SBFloatingFluidSwitcherRootSwitcherModifier switcherDimmingViewLayoutElement](&v18, sel_switcherDimmingViewLayoutElement);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)SBFloatingFluidSwitcherRootSwitcherModifier;
  -[SBFloatingFluidSwitcherRootSwitcherModifier switcherBackdropLayoutElement](&v17, sel_switcherBackdropLayoutElement);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)SBFloatingFluidSwitcherRootSwitcherModifier;
  -[SBFloatingFluidSwitcherRootSwitcherModifier slideOverTongueLayoutElement](&v16, sel_slideOverTongueLayoutElement);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v3)
    v7 = 0;
  else
    v7 = v4 == 0;
  if (v7 && v5 == 0)
  {
    v14.receiver = self;
    v14.super_class = (Class)SBFloatingFluidSwitcherRootSwitcherModifier;
    -[SBFloatingFluidSwitcherRootSwitcherModifier topMostLayoutElements](&v14, sel_topMostLayoutElements);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v3)
      objc_msgSend(v9, "addObject:", v3);
    if (v4)
      objc_msgSend(v10, "addObject:", v4);
    if (v6)
      objc_msgSend(v10, "addObject:", v6);
    v15.receiver = self;
    v15.super_class = (Class)SBFloatingFluidSwitcherRootSwitcherModifier;
    -[SBFloatingFluidSwitcherRootSwitcherModifier topMostLayoutElements](&v15, sel_topMostLayoutElements);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v11);
      objc_msgSend(v12, "addObjectsFromArray:", v10);
    }
    else
    {
      v12 = v10;
    }

  }
  return v12;
}

- (id)gestureModifierForGestureEvent:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  SBFloatingDragAndDropGestureSwitcherModifier *v7;
  SBHomeGestureRootFloatingSwitcherModifier *v8;
  id v9;
  SBExternalHomeGestureFloatingSwitcherModifier *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;

  v4 = a3;
  v5 = objc_msgSend(v4, "gestureType");
  objc_msgSend(v4, "gestureID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  switch(v5)
  {
    case 1:
      if ((-[SBFloatingFluidSwitcherRootSwitcherModifier isReduceMotionEnabled](self, "isReduceMotionEnabled") & 1) == 0)
      {
        v10 = -[SBExternalHomeGestureFloatingSwitcherModifier initWithGestureID:initialFloatingConfiguration:interfaceOrientation:]([SBExternalHomeGestureFloatingSwitcherModifier alloc], "initWithGestureID:initialFloatingConfiguration:interfaceOrientation:", v6, self->_interfaceOrientation, self->_activeAppLayout);
        goto LABEL_11;
      }
      v7 = 0;
      break;
    case 3:
      v8 = [SBHomeGestureRootFloatingSwitcherModifier alloc];
      v9 = -[SBFloatingFluidSwitcherRootSwitcherModifier _newMultitaskingModifier](self, "_newMultitaskingModifier");
      v7 = -[SBHomeGestureRootFloatingSwitcherModifier initWithMultitaskingModifier:floatingConfiguration:](v8, "initWithMultitaskingModifier:floatingConfiguration:", v9, self->_interfaceOrientation);

      break;
    case 4:
      v10 = -[SBMoveGestureRootFloatingSwitcherModifier initWithInitialFloatingConfiguration:interfaceOrientation:]([SBMoveGestureRootFloatingSwitcherModifier alloc], "initWithInitialFloatingConfiguration:interfaceOrientation:", self->_interfaceOrientation, self->_activeAppLayout);
      goto LABEL_11;
    case 5:
      v10 = -[SBSwitcherSwipeUpGestureFloatingSwitcherModifier initWithGestureID:]([SBSwitcherSwipeUpGestureFloatingSwitcherModifier alloc], "initWithGestureID:", v6);
LABEL_11:
      v7 = (SBFloatingDragAndDropGestureSwitcherModifier *)v10;
      break;
    case 6:
      v11 = v4;
      objc_msgSend(*(id *)&self->_floatingSwitcherVisible, "itemForLayoutRole:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "uniqueIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13
        && (objc_msgSend(v11, "draggedSceneIdentifier"),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            v15 = objc_msgSend(v14, "isEqualToString:", v13),
            v14,
            (v15 & 1) == 0))
      {
        v7 = -[SBFloatingDragAndDropGestureSwitcherModifier initWithGestureID:floatingSwitcherVisible:floatingConfiguration:interfaceOrientation:]([SBFloatingDragAndDropGestureSwitcherModifier alloc], "initWithGestureID:floatingSwitcherVisible:floatingConfiguration:interfaceOrientation:", v6, self->super._hasPerformedInitialSetup, self->_interfaceOrientation, self->_activeAppLayout);
      }
      else
      {
        v7 = 0;
      }

      break;
    default:
      break;
  }

  return v7;
}

- (id)transitionModifierForMainTransitionEvent:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SBMoveFloatingConfigurationFloatingSwitcherModifier *v16;
  SBSwitcherSwipeUpToSwitcherFloatingSwitcherModifier *v17;
  uint64_t v18;
  SBSwitcherToActiveFloatingSwitcherModifier *v19;
  id v20;
  SBSwitcherToActiveFloatingSwitcherModifier *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  SBSwitcherToActiveFloatingSwitcherModifier *v26;
  uint64_t v27;
  BOOL v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  SBExitSlideOverPeekSwitcherModifier *v34;
  uint64_t v35;
  uint64_t v36;
  SBExitSlideOverPeekSwitcherModifier *v37;
  SBRotationSwitcherModifier *v38;
  uint64_t v39;
  uint64_t v40;
  SBRotationSwitcherModifier *v41;
  uint64_t v42;
  SBPeekToOffscreenSwitcherModifier *v43;
  uint64_t v44;
  SBPeekToOffscreenSwitcherModifier *v45;
  void *v46;
  SBPulseTransitionSwitcherModifier *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  void *v54;
  _BOOL4 v55;
  uint64_t v56;
  int v57;
  _BOOL8 v58;
  SBArcSwipeFloatingSwitcherModifier *v59;
  _BOOL8 v60;
  uint64_t v61;
  uint64_t v62;

  v4 = a3;
  objc_msgSend(v4, "fromFloatingAppLayout");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toFloatingAppLayout");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "fromFloatingSwitcherVisible");
  v8 = objc_msgSend(v4, "toFloatingSwitcherVisible");
  v9 = objc_msgSend(v4, "isDragAndDropTransition");
  v62 = objc_msgSend(v4, "fromFloatingConfiguration");
  v61 = objc_msgSend(v4, "toFloatingConfiguration");
  objc_msgSend(v4, "transitionID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toAppExposeBundleID");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_39;
  v12 = (void *)v11;
  v13 = v6;
  v14 = v5;
  v15 = objc_msgSend(v4, "toEnvironmentMode");

  v29 = v15 == 2;
  v5 = v14;
  v6 = v13;
  if (!v29)
  {
LABEL_39:
    if (v8)
    {
      if (v7)
      {
        v17 = -[SBTransitionSwitcherModifier initWithTransitionID:]([SBSwitcherSwipeUpToSwitcherFloatingSwitcherModifier alloc], "initWithTransitionID:", v10);
LABEL_15:
        v16 = (SBMoveFloatingConfigurationFloatingSwitcherModifier *)v17;
        goto LABEL_16;
      }
      v25 = v5;
      v26 = [SBSwitcherToActiveFloatingSwitcherModifier alloc];
      v20 = -[SBFloatingFluidSwitcherRootSwitcherModifier _newMultitaskingModifier](self, "_newMultitaskingModifier");
      v21 = v26;
      v5 = v25;
      v22 = v10;
      v23 = 1;
      v24 = v25;
      goto LABEL_11;
    }
    if (v7)
    {
      v18 = v5;
      v19 = [SBSwitcherToActiveFloatingSwitcherModifier alloc];
      v20 = -[SBFloatingFluidSwitcherRootSwitcherModifier _newMultitaskingModifier](self, "_newMultitaskingModifier");
      v21 = v19;
      v5 = v18;
      v22 = v10;
      v23 = 0;
      v24 = v6;
LABEL_11:
      v27 = -[SBSwitcherToActiveFloatingSwitcherModifier initWithTransitionID:direction:fullScreenAppLayout:floatingDeckModifier:](v21, "initWithTransitionID:direction:fullScreenAppLayout:floatingDeckModifier:", v22, v23, v24, v20);
LABEL_12:
      v16 = (SBMoveFloatingConfigurationFloatingSwitcherModifier *)v27;

      goto LABEL_16;
    }
    if (v9)
    {
      v17 = -[SBDropApplicationFloatingSwitcherModifier initWithTransitionID:fromAppLayout:toAppLayout:]([SBDropApplicationFloatingSwitcherModifier alloc], "initWithTransitionID:fromAppLayout:toAppLayout:", v10, v5, v6);
      goto LABEL_15;
    }
    -[SBFloatingFluidSwitcherRootSwitcherModifier _entityRemovalModifierForEvent:](self, "_entityRemovalModifierForEvent:", v4);
    v16 = (SBMoveFloatingConfigurationFloatingSwitcherModifier *)objc_claimAutoreleasedReturnValue();
    if (v16)
      goto LABEL_16;
    if (objc_msgSend(v4, "isMoveDisplaysTransition"))
    {
      v17 = -[SBMoveDisplaysTransitionSwitcherModifier initWithTransitionEvent:]([SBMoveDisplaysTransitionSwitcherModifier alloc], "initWithTransitionEvent:", v4);
      goto LABEL_15;
    }
    if ((objc_msgSend(v4, "isAnySplitViewToOrFromSlideOverEvent") & 1) == 0
      && (objc_msgSend(v4, "isSlideOverToFullScreenEvent") & 1) == 0)
    {
      if (v5)
        v29 = v6 == 0;
      else
        v29 = 1;
      v30 = !v29;
      if (!v29)
      {
        if (objc_msgSend((id)v5, "isEqual:", v6))
        {
          v31 = v5;
          v32 = objc_msgSend(v4, "fromInterfaceOrientation");
          v29 = v32 == objc_msgSend(v4, "toInterfaceOrientation");
          v5 = v31;
          if (!v29)
          {
            v38 = [SBRotationSwitcherModifier alloc];
            objc_msgSend(v4, "toFloatingAppLayout");
            v20 = (id)objc_claimAutoreleasedReturnValue();
            v39 = objc_msgSend(v4, "fromInterfaceOrientation");
            v40 = objc_msgSend(v4, "toInterfaceOrientation");
            v41 = v38;
            v5 = v31;
            v27 = -[SBRotationSwitcherModifier initWithTransitionID:appLayout:fromInterfaceOrientation:toInterfaceOrientation:](v41, "initWithTransitionID:appLayout:fromInterfaceOrientation:toInterfaceOrientation:", v10, v20, v39, v40);
            goto LABEL_12;
          }
        }
      }
      if ((objc_msgSend(v4, "isEnteringSplitViewPeekEvent") & 1) == 0
        && (objc_msgSend(v4, "isEnteringSlideOverPeekEvent") & 1) == 0)
      {
        if (objc_msgSend(v4, "isExitingSlideOverPeekToAppEvent"))
        {
          v33 = v5;
          v34 = [SBExitSlideOverPeekSwitcherModifier alloc];
          v35 = *(_QWORD *)&self->_floatingSwitcherVisible;
          v36 = objc_msgSend(v4, "toFloatingConfiguration");
          v37 = v34;
          v5 = v33;
          v17 = -[SBExitSlideOverPeekSwitcherModifier initWithTransitionID:floatingAppLayout:floatingConfiguration:](v37, "initWithTransitionID:floatingAppLayout:floatingConfiguration:", v10, v35, v36);
          goto LABEL_15;
        }
        if (objc_msgSend(v4, "isExitingSlideOverPeekToHomeScreenEvent"))
        {
          v42 = v5;
          v43 = [SBPeekToOffscreenSwitcherModifier alloc];
          objc_msgSend(v4, "fromFloatingAppLayout");
          v20 = (id)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v4, "fromPeekConfiguration");
          v45 = v43;
          v5 = v42;
          v27 = -[SBPeekToOffscreenSwitcherModifier initWithTransitionID:peekingAppLayout:peekConfiguration:spaceConfiguration:](v45, "initWithTransitionID:peekingAppLayout:peekConfiguration:spaceConfiguration:", v10, v20, v44, 1);
          goto LABEL_12;
        }
        if (!SBPeekConfigurationIsValid(objc_msgSend(v4, "toPeekConfiguration"))
          && (objc_msgSend(v4, "isSlideOverToCenterWindowEvent") & 1) == 0)
        {
          v46 = (void *)v5;
          if (objc_msgSend(v4, "isFloatingPulseEvent"))
          {
            v47 = [SBPulseTransitionSwitcherModifier alloc];
            objc_msgSend(v4, "toFloatingAppLayout");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = -[SBPulseTransitionSwitcherModifier initWithTransitionID:appLayout:](v47, "initWithTransitionID:appLayout:", v10, v48);

LABEL_65:
            v5 = (uint64_t)v46;
            goto LABEL_16;
          }
          if (v30)
          {
            if ((objc_msgSend((id)v5, "isEqual:", v6) & 1) == 0 && v62 == v61)
            {
              if (objc_msgSend(v4, "fromWindowPickerRole") == 3)
              {
                v49 = objc_msgSend(v4, "fromWindowPickerRole");
                if (v49 == objc_msgSend(v4, "toWindowPickerRole"))
                {
                  v5 = (uint64_t)v46;
                  v17 = -[SBSplitDisplayItemCrossblurSwitcherModifier initWithTransitionID:fromAppLayout:toAppLayout:layoutRole:]([SBSplitDisplayItemCrossblurSwitcherModifier alloc], "initWithTransitionID:fromAppLayout:toAppLayout:layoutRole:", v10, v46, v6, 1);
                  goto LABEL_15;
                }
              }
              if ((objc_msgSend(v4, "isNewSceneTransition") & 1) != 0
                || objc_msgSend(v4, "isMorphFromInAppView"))
              {
                v5 = (uint64_t)v46;
                v17 = -[SBSlideFloatingAppFromBottomSwitcherModifier initWithTransitionID:fromFloatingAppLayout:toFloatingAppLayout:]([SBSlideFloatingAppFromBottomSwitcherModifier alloc], "initWithTransitionID:fromFloatingAppLayout:toFloatingAppLayout:", v10, v46, v6);
                goto LABEL_15;
              }
              if ((objc_msgSend(v4, "isCenterWindowToSlideOverEvent") & 1) == 0)
              {
                v58 = objc_msgSend(v4, "dosidoTransitionDirection") == 1;
                v59 = [SBArcSwipeFloatingSwitcherModifier alloc];
                v60 = v58;
                v5 = (uint64_t)v46;
                v17 = -[SBArcSwipeFloatingSwitcherModifier initWithTransitionID:fromAppLayout:toAppLayout:floatingConfiguration:direction:needsOvershoot:](v59, "initWithTransitionID:fromAppLayout:toAppLayout:floatingConfiguration:direction:needsOvershoot:", v10, v46, v6, v62, v60, 1);
                goto LABEL_15;
              }
              goto LABEL_64;
            }
          }
          else
          {
            if (!(v5 | v6))
              goto LABEL_64;
            if (!v6)
            {
              if (!v5)
                goto LABEL_59;
              goto LABEL_57;
            }
          }
          objc_msgSend(v4, "fromAppLayout");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v6, "itemForLayoutRole:", 1);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = objc_msgSend(v50, "containsItem:", v51);

          if (!v46 || v52)
          {
LABEL_58:
            if ((v52 & 1) == 0)
            {
LABEL_59:
              v55 = objc_msgSend(v4, "fromWindowPickerRole") == 3;
              v56 = objc_msgSend(v4, "toWindowPickerRole");
              v57 = v56 == 3 || v55;
              if (v57 != 1 || ((v55 ^ (v56 == 3)) & 1) == 0)
              {
                v16 = -[SBMoveFloatingConfigurationFloatingSwitcherModifier initWithTransitionID:fromFloatingConfiguration:toFloatingConfiguration:]([SBMoveFloatingConfigurationFloatingSwitcherModifier alloc], "initWithTransitionID:fromFloatingConfiguration:toFloatingConfiguration:", v10, v62, v61);
                goto LABEL_65;
              }
            }
LABEL_64:
            v16 = 0;
            goto LABEL_65;
          }
LABEL_57:
          objc_msgSend(v4, "toAppLayout");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "itemForLayoutRole:", 1);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v52) = objc_msgSend(v53, "containsItem:", v54);

          goto LABEL_58;
        }
      }
    }
  }
  v16 = 0;
LABEL_16:

  return v16;
}

- (id)floorModifierForTransitionEvent:(id)a3
{
  id v4;
  int v5;
  void *v6;
  uint64_t v7;
  SBSlideOverPeekSwitcherModifier *v8;
  void *v9;
  SBStashedFloatingSwitcherModifier *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "toFloatingSwitcherVisible");
  objc_msgSend(v4, "toFloatingAppLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "toEnvironmentMode");
  if (v5)
  {
    -[SBFluidSwitcherRootSwitcherModifier multitaskingModifier](self, "multitaskingModifier");
    v8 = (SBSlideOverPeekSwitcherModifier *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (SBPeekConfigurationIsValid(objc_msgSend(v4, "toPeekConfiguration")) && v6)
  {
    objc_msgSend(v4, "toAppLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v8 = -[SBSlideOverPeekSwitcherModifier initWithAppLayout:peekConfiguration:environmentMode:fromFloatingConfiguration:]([SBSlideOverPeekSwitcherModifier alloc], "initWithAppLayout:peekConfiguration:environmentMode:fromFloatingConfiguration:", v6, objc_msgSend(v4, "toPeekConfiguration"), v7, objc_msgSend(v4, "fromFloatingConfiguration"));
      goto LABEL_10;
    }
  }
  else if (!v6)
  {
LABEL_11:
    v10 = -[SBStashedFloatingSwitcherModifier initWithFloatingConfiguration:environmentMode:]([SBStashedFloatingSwitcherModifier alloc], "initWithFloatingConfiguration:environmentMode:", self->_interfaceOrientation, v7);
    goto LABEL_12;
  }
  if (SBFloatingConfigurationIsStashed(self->_interfaceOrientation))
    goto LABEL_11;
  v8 = -[SBActiveAppLayoutFloatingSwitcherModifier initWithActiveAppLayout:floatingConfiguration:environmentMode:]([SBActiveAppLayoutFloatingSwitcherModifier alloc], "initWithActiveAppLayout:floatingConfiguration:environmentMode:", v6, self->_interfaceOrientation, v7);
LABEL_10:
  v10 = (SBStashedFloatingSwitcherModifier *)v8;
  if (!v8)
    goto LABEL_11;
LABEL_12:

  return v10;
}

- (id)shelfModifierForTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  void *v10;
  SBSwitcherShelf *v11;
  void *v12;
  void *v13;
  SBShelfSwitcherModifier *v14;
  unint64_t v15;
  SBShelfSwitcherModifier *v16;
  void *v17;
  void *v18;

  v4 = a3;
  objc_msgSend(v4, "toFloatingAppLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "toWindowPickerRole");
  v7 = objc_msgSend(v4, "fromWindowPickerRole");
  v8 = v6 != 3 || v7 == 3;
  if (v8 || objc_msgSend(v4, "toEnvironmentMode") != 3)
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(v5, "itemForLayoutRole:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[SBSwitcherShelf initWithBundleIdentifier:layoutRole:displayMode:]([SBSwitcherShelf alloc], "initWithBundleIdentifier:layoutRole:displayMode:", v10, v6, 1);
    -[SBSwitcherShelf uniqueIdentifier](v11, "uniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBChainableModifier childModifierByKey:](self, "childModifierByKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = 0;
    }
    else
    {
      v15 = +[SBShelfSwitcherModifier contentOptionsForTransitionEvent:context:](SBShelfSwitcherModifier, "contentOptionsForTransitionEvent:context:", v4, self);
      v16 = [SBShelfSwitcherModifier alloc];
      objc_msgSend(v4, "toAppLayout");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "fromAppLayout");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[SBShelfSwitcherModifier initWithShelf:contentOptions:activeFullScreenAppLayout:activeFloatingAppLayout:presentationTargetFrame:presentedFromAppLayout:](v16, "initWithShelf:contentOptions:activeFullScreenAppLayout:activeFloatingAppLayout:presentationTargetFrame:presentedFromAppLayout:", v11, v15, v17, v5, v18, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));

    }
  }

  return v14;
}

- (id)multitaskingModifierForEvent:(id)a3
{
  objc_class *v4;
  void *v5;
  id v6;

  v4 = -[SBFloatingFluidSwitcherRootSwitcherModifier _defaultMultitaskingModifierClass](self, "_defaultMultitaskingModifierClass", a3);
  -[SBFluidSwitcherRootSwitcherModifier multitaskingModifier](self, "multitaskingModifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isMemberOfClass:", v4) & 1) == 0)
  {
    v6 = objc_alloc_init(v4);

    v5 = v6;
  }
  return v5;
}

- (id)_entityRemovalModifierForEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(v4, "fromFloatingAppLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "removalContextForAppLayout:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (objc_class *)objc_opt_class();
      if (!SBReduceMotion() && (unint64_t)(objc_msgSend(v6, "animationStyle") - 1) <= 2)
        v7 = (objc_class *)objc_opt_class();
      v8 = [v7 alloc];
      objc_msgSend(v4, "transitionID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "fromFloatingAppLayout");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "toFloatingAppLayout");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v8, "initWithTransitionID:fromAppLayout:toAppLayout:floatingConfiguration:", v9, v10, v11, self->_interfaceOrientation);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)insertionModifierForInsertionEvent:(id)a3
{
  id v3;
  SBInsertionSwitcherModifier *v4;
  void *v5;
  SBInsertionSwitcherModifier *v6;

  v3 = a3;
  v4 = [SBInsertionSwitcherModifier alloc];
  objc_msgSend(v3, "appLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SBInsertionSwitcherModifier initWithAppLayout:](v4, "initWithAppLayout:", v5);
  return v6;
}

- (id)highlightModifierForHighlightEvent:(id)a3
{
  return 0;
}

- (id)swipeToKillModifierForSwipeToKillEvent:(id)a3
{
  id v3;
  SBSwipeToKillSwitcherModifier *v4;
  uint64_t v5;
  void *v6;
  SBSwipeToKillSwitcherModifier *v7;

  v3 = a3;
  v4 = [SBSwipeToKillSwitcherModifier alloc];
  v5 = objc_msgSend(v3, "layoutRole");
  objc_msgSend(v3, "appLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SBSwipeToKillSwitcherModifier initWithLayoutRole:inAppLayout:fadeOutSwipedItems:](v4, "initWithLayoutRole:inAppLayout:fadeOutSwipedItems:", v5, v6, 0);
  return v7;
}

- (id)removalModifierForRemovalEvent:(id)a3
{
  id v3;
  SBRemovalSwitcherModifier *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  SBRemovalSwitcherModifier *v8;

  v3 = a3;
  v4 = [SBRemovalSwitcherModifier alloc];
  v5 = objc_msgSend(v3, "layoutRole");
  objc_msgSend(v3, "appLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "reason");

  v8 = -[SBRemovalSwitcherModifier initWithLayoutRole:inAppLayout:reason:](v4, "initWithLayoutRole:inAppLayout:reason:", v5, v6, v7);
  return v8;
}

- (id)lowEndHardwareModifier
{
  void *v2;
  _BOOL8 v3;

  +[SBPlatformController sharedInstance](SBPlatformController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "medusaCapabilities") == 1;

  return -[SBFloatingLowEndHardwareModifier initWithOptions:]([SBFloatingLowEndHardwareModifier alloc], "initWithOptions:", v3);
}

- (id)userScrollingModifierForScrollEvent:(id)a3
{
  return objc_alloc_init(SBScrollingSwitcherModifier);
}

- (id)transientlyVisibleSlideOverTongueModifierForEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  SBTransientlyVisibleSlideOverTongueSwitcherModifier *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[SBFloatingFluidSwitcherRootSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = +[SBTransientlyVisibleSlideOverTongueSwitcherModifier slideOverTongueTransientlyVisibleModeForEvent:](SBTransientlyVisibleSlideOverTongueSwitcherModifier, "slideOverTongueTransientlyVisibleModeForEvent:", v4);
    if (v7)
    {
      v8 = objc_opt_class();
      -[SBFluidSwitcherRootSwitcherModifier transientlyVisibleSlideOverTongueModifier](self, "transientlyVisibleSlideOverTongueModifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      SBSafeCast(v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 && (SBTransientlyVisibleSlideOverTongueSwitcherModifier *)objc_msgSend(v10, "mode") == v7)
        v7 = 0;
      else
        v7 = -[SBTransientlyVisibleSlideOverTongueSwitcherModifier initWithMode:]([SBTransientlyVisibleSlideOverTongueSwitcherModifier alloc], "initWithMode:", v7);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (Class)_defaultMultitaskingModifierClass
{
  return (Class)objc_opt_class();
}

- (id)_newMultitaskingModifier
{
  return objc_alloc_init(-[SBFloatingFluidSwitcherRootSwitcherModifier _defaultMultitaskingModifierClass](self, "_defaultMultitaskingModifierClass"));
}

- (void)_updateContainerViewBounds
{
  int64_t *p_floatingConfiguration;
  int64_t v3;
  int64_t v4;
  int64_t v5;
  int64_t v6;

  p_floatingConfiguration = &self->_floatingConfiguration;
  -[SBFloatingFluidSwitcherRootSwitcherModifier floatingApplicationFrameInInterfaceOrientation:floatingConfiguration:](self, "floatingApplicationFrameInInterfaceOrientation:floatingConfiguration:", self->_activeAppLayout, self->_interfaceOrientation);
  *p_floatingConfiguration = v3;
  p_floatingConfiguration[1] = v4;
  p_floatingConfiguration[2] = v5;
  p_floatingConfiguration[3] = v6;
}

- (SBAppLayout)activeAppLayout
{
  return *(SBAppLayout **)&self->_floatingSwitcherVisible;
}

- (void)setActiveAppLayout:(id)a3
{
  objc_storeStrong((id *)&self->_floatingSwitcherVisible, a3);
}

- (int64_t)interfaceOrientation
{
  return (int64_t)self->_activeAppLayout;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  self->_activeAppLayout = (SBAppLayout *)a3;
}

- (int64_t)floatingConfiguration
{
  return self->_interfaceOrientation;
}

- (void)setFloatingConfiguration:(int64_t)a3
{
  self->_interfaceOrientation = a3;
}

- (BOOL)isFloatingSwitcherVisible
{
  return self->super._hasPerformedInitialSetup;
}

- (void)setFloatingSwitcherVisible:(BOOL)a3
{
  self->super._hasPerformedInitialSetup = a3;
}

- (void)setContainerViewBounds:(CGRect)a3
{
  *(CGRect *)&self->_floatingConfiguration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingSwitcherVisible, 0);
}

@end
