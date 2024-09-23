@implementation SBDeckFloatingSwitcherModifier

- (SBDeckFloatingSwitcherModifier)init
{
  SBDeckFloatingSwitcherModifier *v2;
  SBDeckFloatingSwitcherModifier *v3;
  SBDefaultImplementationsSwitcherModifier *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBDeckFloatingSwitcherModifier;
  v2 = -[SBSwitcherModifier init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_currentFloatingConfiguration = 4;
    v4 = objc_alloc_init(SBDefaultImplementationsSwitcherModifier);
    -[SBChainableModifier addChildModifier:](v3, "addChildModifier:", v4);

  }
  return v3;
}

- (void)didMoveToParentModifier:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBDeckFloatingSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v5, sel_didMoveToParentModifier_);
  if (a3)
    -[SBDeckFloatingSwitcherModifier _applyPrototypeSettings](self, "_applyPrototypeSettings");
}

- (id)handleRemovalEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t ongoingAppLayoutRemovals;
  void *v8;
  unint64_t v9;
  SBMutableSwitcherTransitionRequest *v10;
  SBMutableSwitcherTransitionRequest *v11;
  uint64_t v12;
  SBPerformTransitionSwitcherEventResponse *v13;
  uint64_t v14;
  SBMutableSwitcherTransitionRequest *v15;
  SBPerformTransitionSwitcherEventResponse *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBDeckFloatingSwitcherModifier;
  -[SBSwitcherModifier handleRemovalEvent:](&v18, sel_handleRemovalEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "phase") == 1)
  {
    ++self->_ongoingAppLayoutRemovals;
    goto LABEL_16;
  }
  if (objc_msgSend(v4, "phase") != 2)
    goto LABEL_16;
  --self->_ongoingAppLayoutRemovals;
  -[SBDeckFloatingSwitcherModifier appLayouts](self, "appLayouts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {

  }
  else
  {
    ongoingAppLayoutRemovals = self->_ongoingAppLayoutRemovals;

    if (!ongoingAppLayoutRemovals)
    {
      v15 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
      -[SBSwitcherTransitionRequest setFloatingSwitcherVisible:](v15, "setFloatingSwitcherVisible:", 0);
      -[SBSwitcherTransitionRequest setFloatingConfiguration:](v15, "setFloatingConfiguration:", 4);
      v16 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v15, 0);
      +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v16, v5);
      v14 = objc_claimAutoreleasedReturnValue();

LABEL_15:
      v5 = (void *)v14;
      goto LABEL_16;
    }
  }
  objc_msgSend(v4, "appLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!BSEqualObjects())
  {

    goto LABEL_16;
  }
  v9 = self->_ongoingAppLayoutRemovals;

  if (!v9)
  {
    v10 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
    v11 = v10;
    if (((self->_currentFloatingConfiguration - 1) & 0xFFFFFFFFFFFFFFFDLL) != 0)
      v12 = 4;
    else
      v12 = 3;
    -[SBSwitcherTransitionRequest setFloatingConfiguration:](v10, "setFloatingConfiguration:", v12);
    -[SBSwitcherTransitionRequest setFloatingSwitcherVisible:](v11, "setFloatingSwitcherVisible:", 1);
    v13 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v11, 0);
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v13, v5);
    v14 = objc_claimAutoreleasedReturnValue();

    goto LABEL_15;
  }
LABEL_16:

  return v5;
}

- (id)handleTapAppLayoutEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SBPerformTransitionSwitcherEventResponse *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBDeckFloatingSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier handleTapAppLayoutEvent:](&v10, sel_handleTapAppLayoutEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBSwitcherTransitionRequest requestForTapAppLayoutEvent:](SBMutableSwitcherTransitionRequest, "requestForTapAppLayoutEvent:", v4, v10.receiver, v10.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setRetainsSiri:", -[SBDeckFloatingSwitcherModifier isSystemAssistantExperiencePersistentSiriEnabled](self, "isSystemAssistantExperiencePersistentSiriEnabled"));
  v7 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v6, 0);
  SBAppendSwitcherModifierResponse(v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)handleTapOutsideToDismissEvent:(id)a3
{
  id v3;
  void *v4;
  char v5;
  SBPerformTransitionSwitcherEventResponse *v6;
  void *v7;
  SBPerformTransitionSwitcherEventResponse *v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBDeckFloatingSwitcherModifier;
  v3 = a3;
  -[SBSwitcherModifier handleTapOutsideToDismissEvent:](&v11, sel_handleTapOutsideToDismissEvent_, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isHandled", v11.receiver, v11.super_class);

  if ((v5 & 1) == 0)
  {
    v6 = [SBPerformTransitionSwitcherEventResponse alloc];
    +[SBSwitcherTransitionRequest requestForDeactivatingFloatingSwitcher](SBSwitcherTransitionRequest, "requestForDeactivatingFloatingSwitcher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:](v6, "initWithTransitionRequest:gestureInitiated:", v7, 0);

    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v8, v4);
    v9 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v9;
  }
  return v4;
}

- (id)handleSwitcherSettingsChangedEvent:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  -[SBDeckFloatingSwitcherModifier _applyPrototypeSettings](self, "_applyPrototypeSettings");
  v7.receiver = self;
  v7.super_class = (Class)SBDeckFloatingSwitcherModifier;
  -[SBSwitcherModifier handleSwitcherSettingsChangedEvent:](&v7, sel_handleSwitcherSettingsChangedEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)handleScrollEvent:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double x;
  void *v9;
  objc_super v11;

  v4 = a3;
  objc_msgSend(v4, "contentOffset");
  x = self->_previousContentOffset.x;
  if (x != 1.79769313e308 || self->_previousContentOffset.y != 1.79769313e308)
    self->_isScrollingForward = x > v5;
  self->_previousContentOffset.x = v5;
  self->_previousContentOffset.y = v6;
  v11.receiver = self;
  v11.super_class = (Class)SBDeckFloatingSwitcherModifier;
  -[SBSwitcherModifier handleScrollEvent:](&v11, sel_handleScrollEvent_, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  SBAppLayout *v5;
  SBAppLayout *currentAppLayout;
  void *v7;
  objc_super v9;

  v4 = a3;
  if (objc_msgSend(v4, "toFloatingSwitcherVisible")
    && (objc_msgSend(v4, "fromFloatingSwitcherVisible") & 1) == 0)
  {
    self->_previousContentOffset = (CGPoint)SBInvalidPoint;
    self->_isScrollingForward = 1;
  }
  objc_msgSend(v4, "toFloatingAppLayout");
  v5 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
  currentAppLayout = self->_currentAppLayout;
  self->_currentAppLayout = v5;

  self->_currentFloatingConfiguration = objc_msgSend(v4, "toFloatingConfiguration");
  v9.receiver = self;
  v9.super_class = (Class)SBDeckFloatingSwitcherModifier;
  -[SBSwitcherModifier handleTransitionEvent:](&v9, sel_handleTransitionEvent_, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  return a3;
}

- (id)appExposeAccessoryButtonsBundleIdentifier
{
  return 0;
}

- (double)plusButtonAlpha
{
  return 0.0;
}

- (double)reopenClosedWindowsButtonAlpha
{
  return 0.0;
}

- (double)reopenClosedWindowsButtonScale
{
  return 1.0;
}

- (int64_t)appExposeAccessoryButtonsOverrideUserInterfaceStyle
{
  return 0;
}

- (int64_t)plusButtonStyle
{
  return 0;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  unint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  CGRect result;

  -[SBDeckFloatingSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SBDeckFloatingSwitcherModifier containerViewBounds](self, "containerViewBounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v48 = v17;
  v20 = v19;
  v50 = v19;
  -[SBDeckFloatingSwitcherModifier scrollViewContentOffset](self, "scrollViewContentOffset");
  v46 = v22;
  v47 = v21;
  v23 = -[SBDeckFloatingSwitcherModifier _numberOfItems](self, "_numberOfItems");
  v24 = v16;
  v49 = v6;
  v25 = v8;
  -[SBDeckFloatingSwitcherModifier _contentInsetsWithContainerViewBounds:switcherViewBounds:](self, "_contentInsetsWithContainerViewBounds:switcherViewBounds:", v14, v24, v18, v20, v6, v8, v10, v12);
  v51 = v26;
  v28 = v27;
  v30 = v29;
  v42 = v6;
  v32 = v31;
  v43 = v31;
  -[SBDeckFloatingSwitcherModifier _contentSizeWithWithCardSize:contentInsets:switcherViewBounds:numberOfItems:](self, "_contentSizeWithWithCardSize:contentInsets:switcherViewBounds:numberOfItems:", v23, v48, v50, v26, v27, v31, v29, *(_QWORD *)&v42, *(_QWORD *)&v25, *(_QWORD *)&v10, *(_QWORD *)&v12);
  v44 = v34;
  v45 = v33;
  -[SBDeckFloatingSwitcherModifier _adjustedIndexForScaleForIndex:withCardSize:contentOffset:contentSize:contentInsets:switcherViewBounds:](self, "_adjustedIndexForScaleForIndex:withCardSize:contentOffset:contentSize:contentInsets:switcherViewBounds:", a3, v48, v50, v47, v46, v33, v34, *(_QWORD *)&v51, *(_QWORD *)&v28, *(_QWORD *)&v32, *(_QWORD *)&v30, *(_QWORD *)&v49, *(_QWORD *)&v25, *(_QWORD *)&v10, *(_QWORD *)&v12);
  v36 = v35;
  -[SBDeckFloatingSwitcherModifier _scaleForScaleAdjustedIndex:](self, "_scaleForScaleAdjustedIndex:");
  -[SBDeckFloatingSwitcherModifier _frameForIndex:withCardSize:scale:adjustedIndexForScale:contentOffset:contentSize:contentInsets:switcherViewBounds:](self, "_frameForIndex:withCardSize:scale:adjustedIndexForScale:contentOffset:contentSize:contentInsets:switcherViewBounds:", a3, v48, v50, v37, v36, v47, v46, v45, v44, *(_QWORD *)&v51, *(_QWORD *)&v28, *(_QWORD *)&v43, *(_QWORD *)&v30, *(_QWORD *)&v49, *(_QWORD *)&v25, *(_QWORD *)&v10, *(_QWORD *)&v12);
  result.size.height = v41;
  result.size.width = v40;
  result.origin.y = v39;
  result.origin.x = v38;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  unint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double result;
  double v38;
  double v39;
  double v40;
  double v41;

  -[SBDeckFloatingSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SBDeckFloatingSwitcherModifier containerViewBounds](self, "containerViewBounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v39 = v19;
  -[SBDeckFloatingSwitcherModifier scrollViewContentOffset](self, "scrollViewContentOffset");
  v40 = v22;
  v41 = v21;
  v23 = -[SBDeckFloatingSwitcherModifier _numberOfItems](self, "_numberOfItems");
  v24 = v14;
  v25 = v20;
  v26 = v6;
  v27 = v8;
  -[SBDeckFloatingSwitcherModifier _contentInsetsWithContainerViewBounds:switcherViewBounds:](self, "_contentInsetsWithContainerViewBounds:switcherViewBounds:", v24, v16, v18, v25, v6, v8, v10, v12);
  v38 = v28;
  v30 = v29;
  v32 = v31;
  v34 = v33;
  -[SBDeckFloatingSwitcherModifier _contentSizeWithWithCardSize:contentInsets:switcherViewBounds:numberOfItems:](self, "_contentSizeWithWithCardSize:contentInsets:switcherViewBounds:numberOfItems:", v23, v18, v39, v28, v29, v31, v33, *(_QWORD *)&v26, *(_QWORD *)&v27, *(_QWORD *)&v10, *(_QWORD *)&v12);
  -[SBDeckFloatingSwitcherModifier _adjustedIndexForScaleForIndex:withCardSize:contentOffset:contentSize:contentInsets:switcherViewBounds:](self, "_adjustedIndexForScaleForIndex:withCardSize:contentOffset:contentSize:contentInsets:switcherViewBounds:", a3, v18, v39, v41, v40, v35, v36, *(_QWORD *)&v38, *(_QWORD *)&v30, *(_QWORD *)&v32, *(_QWORD *)&v34, *(_QWORD *)&v26, *(_QWORD *)&v27, *(_QWORD *)&v10, *(_QWORD *)&v12);
  -[SBDeckFloatingSwitcherModifier _scaleForScaleAdjustedIndex:](self, "_scaleForScaleAdjustedIndex:");
  return result;
}

- (double)rotationAngleForIndex:(unint64_t)a3
{
  return 0.0;
}

- (id)visibleAppLayouts
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[SBDeckFloatingSwitcherModifier scrollViewContentOffset](self, "scrollViewContentOffset");
  v3 = -[SBDeckFloatingSwitcherModifier _visibleAppLayoutRangeForContentOffset:](self, "_visibleAppLayoutRangeForContentOffset:");
  v5 = v4;
  v6 = (void *)MEMORY[0x1E0C99E60];
  -[SBDeckFloatingSwitcherModifier appLayouts](self, "appLayouts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subarrayWithRange:", v3, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isHomeAffordanceSupportedForAppLayout:(id)a3
{
  return 1;
}

- (id)visibleHomeAffordanceLayoutElements
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (BOOL)isResizeGrabberVisibleForAppLayout:(id)a3
{
  return 0;
}

- (unint64_t)activeCornersForTouchResizeForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (BOOL)isItemResizingAllowedForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (id)visibleShelves
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (CGRect)frameForShelf:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)containerLeafAppLayoutForShelf:(id)a3
{
  return 0;
}

- (double)shelfBackgroundBlurOpacity
{
  return 0.0;
}

- (CGRect)shelfBackgroundBlurFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)_isIndexVisible:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  unint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  double v50;
  BOOL v51;
  double v53;
  double v54;
  CGFloat v55;
  double v56;
  double v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;

  -[SBDeckFloatingSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SBDeckFloatingSwitcherModifier containerViewBounds](self, "containerViewBounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v53 = v17;
  v20 = v19;
  -[SBDeckFloatingSwitcherModifier scrollViewContentOffset](self, "scrollViewContentOffset");
  v57 = v21;
  v56 = v22;
  v23 = -[SBDeckFloatingSwitcherModifier _numberOfItems](self, "_numberOfItems");
  v24 = v18;
  v54 = v20;
  v25 = v6;
  -[SBDeckFloatingSwitcherModifier _contentInsetsWithContainerViewBounds:switcherViewBounds:](self, "_contentInsetsWithContainerViewBounds:switcherViewBounds:", v14, v16, v24, v20, v6, v8, v10, v12);
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v55 = v25;
  v32 = v20;
  v34 = v33;
  -[SBDeckFloatingSwitcherModifier _contentSizeWithWithCardSize:contentInsets:switcherViewBounds:numberOfItems:](self, "_contentSizeWithWithCardSize:contentInsets:switcherViewBounds:numberOfItems:", v23, v53, v32, v33, v27, v28, v30, *(_QWORD *)&v25, *(_QWORD *)&v8, *(_QWORD *)&v10, *(_QWORD *)&v12);
  -[SBDeckFloatingSwitcherModifier _frameWithScaleAppliedForIndex:withCardSize:contentOffset:contentSize:contentInsets:switcherViewBounds:](self, "_frameWithScaleAppliedForIndex:withCardSize:contentOffset:contentSize:contentInsets:switcherViewBounds:", a3, v53, v54, v57, v56, v35, v36, *(_QWORD *)&v34, *(_QWORD *)&v27, *(_QWORD *)&v29, *(_QWORD *)&v31, *(_QWORD *)&v25, *(_QWORD *)&v8, *(_QWORD *)&v10, *(_QWORD *)&v12);
  v38 = v37;
  v40 = v39;
  v42 = v41;
  v44 = v43;
  -[SBDeckFloatingSwitcherModifier medusaSettings](self, "medusaSettings");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "diffuseShadowRadius");
  v47 = v46;

  v58.origin.x = v55;
  v58.size.height = v12;
  v58.origin.y = v8;
  v58.size.width = v10;
  v59 = CGRectInset(v58, v47 * -2.8, v47 * -2.8);
  v60.origin.x = v38;
  v60.origin.y = v40;
  v60.size.width = v42;
  v60.size.height = v44;
  if (!CGRectIntersectsRect(v59, v60))
    return 0;
  -[SBDeckFloatingSwitcherModifier appLayouts](self, "appLayouts");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "objectAtIndex:", a3);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBDeckFloatingSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](self, "opacityForLayoutRole:inAppLayout:atIndex:", 1, v49, a3);
  v51 = v50 > 0.01;

  return v51;
}

- (double)contentViewScale
{
  return 1.0;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  void *v3;
  void *v4;
  SBMutableSwitcherAnimationAttributes *v5;
  void *v6;
  void *v7;

  -[SBDeckFloatingSwitcherModifier switcherSettings](self, "switcherSettings", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc_init(SBMutableSwitcherAnimationAttributes);
  -[SBSwitcherAnimationAttributes setUpdateMode:](v5, "setUpdateMode:", 1);
  objc_msgSend(v4, "layoutSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSwitcherAnimationAttributes setLayoutSettings:](v5, "setLayoutSettings:", v6);

  objc_msgSend(v4, "opacitySettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSwitcherAnimationAttributes setOpacitySettings:](v5, "setOpacitySettings:", v7);

  return v5;
}

- (BOOL)clipsToUnobscuredMarginAtIndex:(unint64_t)a3
{
  return 0;
}

- (double)visibleMarginForItemContainerAtIndex:(unint64_t)a3
{
  CGRect v4;

  -[SBDeckFloatingSwitcherModifier containerViewBounds](self, "containerViewBounds", a3);
  return CGRectGetWidth(v4);
}

- (BOOL)shouldScaleOverlayToFillBoundsAtIndex:(unint64_t)a3
{
  return 0;
}

- (double)backgroundOpacityForIndex:(unint64_t)a3
{
  return 0.0;
}

- (BOOL)isLayoutRoleOccluded:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (int64_t)tintStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  double v5;

  if (!a5)
    return 1.0;
  -[SBDeckFloatingSwitcherModifier _distanceFromPreviousCardForCardAtIndex:](self, "_distanceFromPreviousCardForCardAtIndex:", a5, a4);
  return fmin(fmax((v5 - *(double *)&kDeckFloatingOpacityMinimumDistanceThreshold)/ *(double *)&kDeckFloatingOpacityFadeDistance, 0.0), 1.0);
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  double v8;

  v5 = a4;
  -[SBDeckFloatingSwitcherModifier appLayouts](self, "appLayouts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObject:", v5);

  if (!v7)
    return 0.0;
  -[SBDeckFloatingSwitcherModifier _distanceFromPreviousCardForCardAtIndex:](self, "_distanceFromPreviousCardForCardAtIndex:", v7);
  return fmin(fmax(*(double *)&kDeckFloatingMaximumDarkening* (1.0- (v8 - *(double *)&kDeckFloatingDarkeningMinimumDistanceThreshold)/ *(double *)&kDeckFloatingDarkeningFadeDistance), 0.0), 1.0);
}

- (double)wallpaperOverlayAlphaForIndex:(unint64_t)a3
{
  return 0.0;
}

- (double)lighteningAlphaForIndex:(unint64_t)a3
{
  return 0.0;
}

- (int64_t)headerStyleForIndex:(unint64_t)a3
{
  return 0;
}

- (double)titleAndIconOpacityForIndex:(unint64_t)a3
{
  double v3;

  if (!a3)
    return 1.0;
  -[SBDeckFloatingSwitcherModifier _distanceFromPreviousCardForCardAtIndex:](self, "_distanceFromPreviousCardForCardAtIndex:");
  return fmin(fmax((v3 - *(double *)&kDeckFloatingTitleAndIconOpacityMinimumDistanceThreshold)/ *(double *)&kDeckFloatingTitleAndIconOpacityFadeDistance, 0.0), 1.0);
}

- (double)titleOpacityForIndex:(unint64_t)a3
{
  double v3;

  if (!a3)
    return 1.0;
  -[SBDeckFloatingSwitcherModifier _distanceFromPreviousCardForCardAtIndex:](self, "_distanceFromPreviousCardForCardAtIndex:");
  return fmin(fmax((v3 - *(double *)&kDeckFloatingTitleOpacityMinimumDistanceThreshold)/ *(double *)&kDeckFloatingTitleOpacityFadeDistance, 0.0), 1.0);
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  return 1.0;
}

- (double)shadowOffsetForIndex:(unint64_t)a3
{
  return 0.0;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIRectCornerRadii result;

  -[SBDeckFloatingSwitcherModifier _cardCornerRadiusInSwitcher](self, "_cardCornerRadiusInSwitcher", a3);
  SBRectCornerRadiiForRadius();
  result.topRight = v6;
  result.bottomRight = v5;
  result.bottomLeft = v4;
  result.topLeft = v3;
  return result;
}

- (double)homeScreenAlpha
{
  return 1.0;
}

- (double)homeScreenScale
{
  return 1.0;
}

- (double)wallpaperScale
{
  return 1.0;
}

- (double)homeScreenDimmingAlpha
{
  return 0.0;
}

- (int64_t)homeScreenBackdropBlurType
{
  return 1;
}

- (double)homeScreenBackdropBlurProgress
{
  return 0.0;
}

- (BOOL)shouldAllowGroupOpacityForAppLayout:(id)a3
{
  return 0;
}

- (BOOL)wantsSwitcherBackdropBlur
{
  return 1;
}

- (int64_t)switcherBackdropBlurType
{
  return 2;
}

- (double)switcherBackdropBlurProgress
{
  return 1.0;
}

- (BOOL)wantsSwitcherDimmingView
{
  return 1;
}

- (double)switcherDimmingAlpha
{
  return *(double *)&kDeckFloatingHomeScreenDimmingAlpha;
}

- (BOOL)switcherDimmingViewBlocksTouches
{
  return 0;
}

- (BOOL)shouldUseBrightMaterialForIndex:(unint64_t)a3
{
  return 1;
}

- (BOOL)isItemContainerPointerInteractionEnabled
{
  return 1;
}

- (BOOL)canSelectLeafWithModifierKeysInAppLayout:(id)a3
{
  return 0;
}

- (BOOL)isFocusEnabledForAppLayout:(id)a3
{
  return 1;
}

- (id)neighboringAppLayoutsForFocusedAppLayout:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[SBDeckFloatingSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v6)
      objc_msgSend(v8, "addIndex:", v6 - 1);
    if (v6 < objc_msgSend(v5, "count") - 1)
      objc_msgSend(v9, "addIndex:", v6 + 1);
    v10 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v5, "objectsAtIndexes:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)activeLeafAppLayoutsReachableByKeyboardShortcut
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)inactiveAppLayoutsReachableByKeyboardShortcut
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)canPerformKeyboardShortcutAction:(int64_t)a3 forBundleIdentifier:(id)a4
{
  return 0;
}

- (BOOL)shouldUseBackgroundWallpaperTreatmentForIndex:(unint64_t)a3
{
  return 0;
}

- (int64_t)touchBehaviorForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (BOOL)shouldAllowContentViewTouchesForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 2;
}

- (BOOL)isScrollEnabled
{
  return 1;
}

- (BOOL)isContainerStatusBarVisible
{
  return 1;
}

- (double)containerStatusBarAnimationDuration
{
  return 0.35;
}

- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3
{
  return 0;
}

- (CGRect)clippingFrameForIndex:(unint64_t)a3 withBounds:(CGRect)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  v4 = *MEMORY[0x1E0C9D628];
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)clippingFrameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5 withBounds:(CGRect)a6
{
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  v6 = *MEMORY[0x1E0C9D628];
  v7 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (BOOL)isWallpaperRequiredForSwitcher
{
  return 1;
}

- (int64_t)wallpaperStyle
{
  return 1;
}

- (BOOL)isHomeScreenContentRequired
{
  return 0;
}

- (BOOL)wantsHomeScreenPointerInteractions
{
  return 0;
}

- (BOOL)isSwitcherWindowVisible
{
  return 1;
}

- (BOOL)shouldAccessoryDrawShadowForAppLayout:(id)a3
{
  return 0;
}

- (id)appLayoutsToCacheSnapshots
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  -[SBDeckFloatingSwitcherModifier scrollViewContentOffset](self, "scrollViewContentOffset");
  v3 = -[SBDeckFloatingSwitcherModifier _visibleAppLayoutRangeForContentOffset:](self, "_visibleAppLayoutRangeForContentOffset:");
  v5 = v4;
  -[SBDeckFloatingSwitcherModifier switcherSettings](self, "switcherSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "numberOfSnapshotsToCacheInSwitcher");

  return -[SBSwitcherModifier appLayoutsToCacheSnapshotsWithVisibleRange:numberOfSnapshotsToCache:biasForward:](self, "appLayoutsToCacheSnapshotsWithVisibleRange:numberOfSnapshotsToCache:biasForward:", v3, v5, v7, self->_isScrollingForward);
}

- (id)appLayoutsToCacheFullsizeSnapshots
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (int64_t)preferredSnapshotOrientationForAppLayout:(id)a3
{
  return 2;
}

- (id)appLayoutToScrollToBeforeTransitioning
{
  return 0;
}

- (id)appLayoutToScrollToBeforeReopeningClosedWindows
{
  return 0;
}

- (BOOL)shouldAcceleratedHomeButtonPressBegin
{
  return 0;
}

- (BOOL)shouldRubberbandFullScreenHomeGrabberView
{
  return 0;
}

- (unint64_t)transactionCompletionOptions
{
  void *v3;
  int v4;

  -[SBDeckFloatingSwitcherModifier appLayouts](self, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = -[SBDeckFloatingSwitcherModifier isReduceMotionEnabled](self, "isReduceMotionEnabled");

    if (v4)
      return 6;
    else
      return 2;
  }
  else
  {

    return 6;
  }
}

- (BOOL)shouldFireTransitionCompletionInDefaultRunLoopMode
{
  return 0;
}

- (BOOL)shouldPerformRotationAnimationForOrientationChange
{
  return 0;
}

- (BOOL)shouldPerformCrossfadeForReduceMotion
{
  return 0;
}

- (id)appLayoutForReceivingHardwareButtonEvents
{
  return 0;
}

- (BOOL)shouldAnimateInsertionOrRemovalOfAppLayout:(id)a3 atIndex:(unint64_t)a4
{
  return -[SBDeckFloatingSwitcherModifier _isIndexVisible:](self, "_isIndexVisible:", a4);
}

- (BOOL)shouldBringCardToFrontDuringInsertionOrRemoval
{
  return 0;
}

- (unint64_t)indexToScrollToAfterInsertingAtIndex:(unint64_t)a3
{
  return 0;
}

- (unint64_t)indexToScrollToAfterRemovingIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v10;

  -[SBDeckFloatingSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 < 2)
    return 0x7FFFFFFFFFFFFFFFLL;
  if ((a3 & 0x8000000000000000) != 0)
  {
LABEL_9:
    v10 = v6 - 1;
    v7 = a3;
    while (++v7 < v10)
    {
      if (-[SBDeckFloatingSwitcherModifier _isIndexVisible:](self, "_isIndexVisible:", v7))
        return v7;
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (!-[SBDeckFloatingSwitcherModifier _isIndexVisible:](self, "_isIndexVisible:", a3))
  {
LABEL_8:
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      return v7;
    goto LABEL_9;
  }
  v8 = a3;
  while (v8-- >= 1)
  {
    if (!-[SBDeckFloatingSwitcherModifier _isIndexVisible:](self, "_isIndexVisible:", v8))
    {
      v7 = v8 + 1;
      goto LABEL_8;
    }
  }
  return 0;
}

- (BOOL)isLayoutRoleSelectable:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (BOOL)isLayoutRoleKillable:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  return objc_msgSend(a4, "type", a3) == 0;
}

- (BOOL)isIndexRubberbandableForSwipeToKill:(unint64_t)a3
{
  return 1;
}

- (BOOL)shouldConfigureInAppDockHiddenAssertion
{
  return 0;
}

- (BOOL)wantsDockBehaviorAssertion
{
  return 1;
}

- (double)dockProgress
{
  return 0.0;
}

- (int64_t)dockUpdateMode
{
  return 3;
}

- (BOOL)wantsDockWindowLevelAssertion
{
  return 0;
}

- (unint64_t)dockWindowLevelPriority
{
  return 0;
}

- (double)dockWindowLevel
{
  return 0.0;
}

- (id)appLayoutsToResignActive
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = (void *)MEMORY[0x1E0C99E60];
  -[SBDeckFloatingSwitcherModifier appLayouts](self, "appLayouts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithObject:forKey:", v5, &unk_1E91D14D8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)keyboardSuppressionMode
{
  return +[SBSwitcherKeyboardSuppressionMode suppressionModeForAllScenes](SBSwitcherKeyboardSuppressionMode, "suppressionModeForAllScenes");
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(1u, 1);
}

- (BOOL)wantsSlideOverTongue
{
  return 1;
}

- (unint64_t)slideOverTongueState
{
  return 0;
}

- (unint64_t)slideOverTongueDirection
{
  return 1;
}

- (id)appLayoutToAttachSlideOverTongue
{
  return 0;
}

- (BOOL)wantsAsynchronousSurfaceRetentionAssertion
{
  return 0;
}

- (BOOL)isLayoutRoleDraggable:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (BOOL)isLayoutRoleEligibleForContentDragSpringLoading:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (double)blurViewIconScaleForIndex:(unint64_t)a3
{
  return 1.0;
}

- (id)foregroundAppLayouts
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (char)jetsamModeForAppLayout:(id)a3
{
  return 0;
}

- (char)activityModeForAppLayout:(id)a3
{
  return 0;
}

- (id)adjustedContinuousExposeIdentifiersInSwitcherFromPreviousIdentifiersInSwitcher:(id)a3 identifiersInStrip:(id)a4
{
  return a3;
}

- (id)adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip:(id)a3
{
  return a3;
}

- (double)snapshotScaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return *(double *)&kDeckFloatingSwitcherCardScale;
}

- (double)contentPageViewScaleForAppLayout:(id)a3 withScale:(double)a4
{
  return *(double *)&kDeckFloatingSwitcherCardScale;
}

- (id)scrollViewAttributes
{
  SBMutableSwitcherScrollViewAttributes *v3;

  v3 = objc_alloc_init(SBMutableSwitcherScrollViewAttributes);
  -[SBSwitcherScrollViewAttributes setDecelerationRate:](v3, "setDecelerationRate:", *MEMORY[0x1E0CEBBA8]);
  -[SBSwitcherScrollViewAttributes setScrollViewPagingEnabled:](v3, "setScrollViewPagingEnabled:", 0);
  -[SBSwitcherScrollViewAttributes setInterpageSpacingForPaging:](v3, "setInterpageSpacingForPaging:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  -[SBSwitcherScrollViewAttributes setPagingOrigin:](v3, "setPagingOrigin:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  -[SBSwitcherScrollViewAttributes setInterpolatesDuringSwipeToKill:](v3, "setInterpolatesDuringSwipeToKill:", 1);
  -[SBDeckFloatingSwitcherModifier _contentSize](self, "_contentSize");
  -[SBSwitcherScrollViewAttributes setContentSize:](v3, "setContentSize:");
  return v3;
}

- (double)_cardCornerRadiusInSwitcher
{
  void *v2;
  double v3;
  double v4;

  -[SBDeckFloatingSwitcherModifier medusaSettings](self, "medusaSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cornerRadiusForFloatingApps");
  v4 = v3;

  return v4;
}

- (double)minimumTranslationToKillIndex:(unint64_t)a3
{
  CGRect v6;

  -[SBDeckFloatingSwitcherModifier frameForIndex:](self, "frameForIndex:");
  -[SBDeckFloatingSwitcherModifier scaleForIndex:](self, "scaleForIndex:", a3);
  SBTransformedRectWithScale();
  return CGRectGetMinY(v6);
}

- (CGSize)_contentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  unint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGSize result;

  -[SBDeckFloatingSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SBDeckFloatingSwitcherModifier containerViewBounds](self, "containerViewBounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v19 = -[SBDeckFloatingSwitcherModifier _numberOfItems](self, "_numberOfItems");
  -[SBDeckFloatingSwitcherModifier _contentInsetsWithContainerViewBounds:switcherViewBounds:](self, "_contentInsetsWithContainerViewBounds:switcherViewBounds:", v12, v14, v16, v18, v4, v6, v8, v10);
  -[SBDeckFloatingSwitcherModifier _contentSizeWithWithCardSize:contentInsets:switcherViewBounds:numberOfItems:](self, "_contentSizeWithWithCardSize:contentInsets:switcherViewBounds:numberOfItems:", v19, v16, v18, v20, v21, v22, v23, *(_QWORD *)&v4, *(_QWORD *)&v6, *(_QWORD *)&v8, *(_QWORD *)&v10);
  result.height = v25;
  result.width = v24;
  return result;
}

- (CGPoint)contentOffsetForIndex:(unint64_t)a3 alignment:(int64_t)a4
{
  double v4;
  double v5;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  unint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGPoint result;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = *MEMORY[0x1E0C9D538];
    v5 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  else
  {
    -[SBDeckFloatingSwitcherModifier switcherViewBounds](self, "switcherViewBounds", a3, a4);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    -[SBDeckFloatingSwitcherModifier containerViewBounds](self, "containerViewBounds");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v35 = *(double *)&kDeckFloatingCardSpacing;
    v24 = -[SBDeckFloatingSwitcherModifier _numberOfItems](self, "_numberOfItems");
    -[SBDeckFloatingSwitcherModifier _contentInsetsWithContainerViewBounds:switcherViewBounds:](self, "_contentInsetsWithContainerViewBounds:switcherViewBounds:", v17, v19, v21, v23, v9, v11, v13, v15);
    v26 = v25;
    v28 = v27;
    -[SBDeckFloatingSwitcherModifier _contentSizeWithWithCardSize:contentInsets:switcherViewBounds:numberOfItems:](self, "_contentSizeWithWithCardSize:contentInsets:switcherViewBounds:numberOfItems:", v24, v21, v23, v29, v25, v30, v27, *(_QWORD *)&v9, *(_QWORD *)&v11, *(_QWORD *)&v13, *(_QWORD *)&v15);
    v32 = v31 - v13;
    v33 = v35 + v21 * *(double *)&kDeckFloatingSwitcherCardScale;
    if (-[SBDeckFloatingSwitcherModifier isRTLEnabled](self, "isRTLEnabled"))
      v34 = v33 * (double)a3;
    else
      v34 = v32 - (double)a3 * v33;
    if (a3 && v28 > v26)
      v34 = fmod(v26 - v28, v33) + v34;
    v5 = 0.0;
    v4 = fmax(v34, 0.0);
    if (v32 <= v4)
      v4 = v32;
  }
  result.y = v5;
  result.x = v4;
  return result;
}

- (unint64_t)_indexForContentOffset:(CGPoint)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  unint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  int v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v36;
  double x;

  x = a3.x;
  -[SBDeckFloatingSwitcherModifier switcherViewBounds](self, "switcherViewBounds", a3.x, a3.y);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SBDeckFloatingSwitcherModifier containerViewBounds](self, "containerViewBounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v36 = *(double *)&kDeckFloatingCardSpacing;
  v20 = -[SBDeckFloatingSwitcherModifier _numberOfItems](self, "_numberOfItems");
  -[SBDeckFloatingSwitcherModifier _contentInsetsWithContainerViewBounds:switcherViewBounds:](self, "_contentInsetsWithContainerViewBounds:switcherViewBounds:", v13, v15, v17, v19, v5, v7, v9, v11);
  -[SBDeckFloatingSwitcherModifier _contentSizeWithWithCardSize:contentInsets:switcherViewBounds:numberOfItems:](self, "_contentSizeWithWithCardSize:contentInsets:switcherViewBounds:numberOfItems:", v20, v17, v19, v21, v22, v23, v24, *(_QWORD *)&v5, *(_QWORD *)&v7, *(_QWORD *)&v9, *(_QWORD *)&v11);
  v26 = v25;
  v27 = v36 + v17 * *(double *)&kDeckFloatingSwitcherCardScale;
  v28 = -[SBDeckFloatingSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
  v29 = v26 - v9 - x;
  if (v28)
    v29 = x;
  v30 = v29 / v27;
  -[SBDeckFloatingSwitcherModifier appLayouts](self, "appLayouts");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (double)(unint64_t)objc_msgSend(v31, "count") + -1.0;
  v33 = fmax(v30, 0.0);

  if (v32 <= v33)
    return (unint64_t)v32;
  else
    return (unint64_t)v33;
}

- (double)distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch:(unint64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  -[SBDeckFloatingSwitcherModifier switcherSettings](self, "switcherSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "switcherCardShadowRadius");
  v7 = v6;
  objc_msgSend(v5, "deckSwitcherPageScale");
  v9 = v7 / v8;
  -[SBDeckFloatingSwitcherModifier scaleForIndex:](self, "scaleForIndex:", a3);
  -[SBSwitcherModifier distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch:numberOfRows:padding:layoutDirection:](self, "distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch:numberOfRows:padding:layoutDirection:", a3, 1, 0, v9 * v10 * 2.8);
  v12 = v11;

  return v12;
}

- (CGSize)_contentSizeWithWithCardSize:(CGSize)a3 contentInsets:(UIEdgeInsets)a4 switcherViewBounds:(CGRect)a5 numberOfItems:(unint64_t)a6
{
  double v7;
  double v8;
  double v9;
  double v10;
  double Width;
  double v12;
  CGSize result;

  CGRectGetHeight(a5);
  -[SBDeckFloatingSwitcherModifier screenScale](self, "screenScale");
  BSSizeRoundForScale();
  v8 = v7;
  v10 = v9;
  Width = CGRectGetWidth(a5);
  if (v8 >= Width)
    Width = v8;
  v12 = v10;
  result.height = v12;
  result.width = Width;
  return result;
}

- (UIEdgeInsets)_contentInsetsWithContainerViewBounds:(CGRect)a3 switcherViewBounds:(CGRect)a4
{
  double width;
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double MinX;
  double MaxX;
  double v14;
  double v15;
  int v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat rect;
  CGRect v22;
  CGRect v23;
  UIEdgeInsets result;

  rect = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  height = a3.size.height;
  v8 = a3.size.width;
  v9 = a3.origin.y;
  v10 = a3.origin.x;
  MinX = CGRectGetMinX(a3);
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = rect;
  MaxX = CGRectGetMaxX(v22);
  v23.origin.x = v10;
  v23.origin.y = v9;
  v23.size.width = v8;
  v23.size.height = height;
  v14 = MaxX - CGRectGetMaxX(v23);
  if (MinX > width * 0.4)
    MinX = width * 0.4;
  if (v14 <= width * 0.4)
    v15 = v14;
  else
    v15 = width * 0.4;
  v16 = -[SBDeckFloatingSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
  if (v16)
    v17 = MinX;
  else
    v17 = v15;
  if (v16)
    v18 = v15;
  else
    v18 = MinX;
  v19 = 0.0;
  v20 = 0.0;
  result.right = v17;
  result.bottom = v20;
  result.left = v18;
  result.top = v19;
  return result;
}

- (uint64_t)_frameForIndex:(double)a3 withCardSize:(double)a4 scale:(double)a5 adjustedIndexForScale:(double)a6 contentOffset:(double)a7 contentSize:(double)a8 contentInsets:(double)a9 switcherViewBounds:(double)a10
{
  int v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v33;

  v26 = objc_msgSend(a1, "isRTLEnabled");
  v27 = a8 - a16 - a6;
  if (!v26)
    v27 = a6;
  v33 = v27;
  v28 = *(double *)&kDeckFloatingSwitcherCardScale;
  SBRectWithSize();
  SBUnintegralizedRectCenteredAboutPoint();
  v30 = a2 * ((v28 - a4) * 0.5) * a5 + v29 - v33;
  if (a11 <= a13)
    v31 = a11;
  else
    v31 = a13;
  if (v31 - a2 * (1.0 - a4) * 0.5 + *(double *)&kDeckFloatingLeadingEdgeRubberbandingRange - v30 > 0.0)
    BSUIConstrainValueWithRubberBand();
  return objc_msgSend(a1, "isRTLEnabled");
}

- (double)_adjustedIndexForScaleForIndex:(double)a3 withCardSize:(double)a4 contentOffset:(double)a5 contentSize:(double)a6 contentInsets:(uint64_t)a7 switcherViewBounds:(unint64_t)a8
{
  int v24;
  double v25;
  double v26;

  v24 = objc_msgSend(a1, "isRTLEnabled");
  if (a13 <= a15)
    v25 = a13;
  else
    v25 = a15;
  v26 = a6 - a18 - a4;
  if (!v24)
    v26 = a4;
  return (double)a8
       - (a6 - a18 - (a13 + a15) - (v26 - (a13 + v25)))
       / (*(double *)&kDeckFloatingCardSpacing + a2 * *(double *)&kDeckFloatingSwitcherCardScale);
}

- (double)_scaleForScaleAdjustedIndex:(double)a3
{
  double v3;
  double result;

  v3 = *(double *)&kDeckFloatingPerCardAdditionalScaleCoefficient * a3;
  if (v3 < 0.0)
    v3 = 0.0;
  result = *(double *)&kDeckFloatingSwitcherCardScale
         * (1.0 - pow(v3, *(long double *)&kDeckFloatingScaleCurveExponent));
  if (result < 0.0)
    return 0.0;
  return result;
}

- (double)_distanceFromPreviousCardForCardAtIndex:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  unint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  double MaxX;
  double MinX;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  CGRect v68;
  double v69;
  double v70;
  CGRect v71;
  CGRect v72;

  if (!a3)
    return 0.0;
  -[SBDeckFloatingSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SBDeckFloatingSwitcherModifier containerViewBounds](self, "containerViewBounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[SBDeckFloatingSwitcherModifier scrollViewContentOffset](self, "scrollViewContentOffset");
  v66 = v22;
  v67 = v21;
  v23 = -[SBDeckFloatingSwitcherModifier _numberOfItems](self, "_numberOfItems");
  v24 = v14;
  v25 = v16;
  v26 = v20;
  v27 = v20;
  v28 = v8;
  v69 = v10;
  v29 = v12;
  -[SBDeckFloatingSwitcherModifier _contentInsetsWithContainerViewBounds:switcherViewBounds:](self, "_contentInsetsWithContainerViewBounds:switcherViewBounds:", v24, v25, v18, v26, v6, v8, v10, v12);
  v31 = v30;
  v70 = v30;
  v33 = v32;
  v35 = v34;
  v60 = v10;
  v61 = v12;
  v36 = v18;
  v65 = v18;
  v37 = v18;
  v38 = v27;
  v39 = v27;
  v40 = v33;
  v42 = v41;
  v62 = v41;
  -[SBDeckFloatingSwitcherModifier _contentSizeWithWithCardSize:contentInsets:switcherViewBounds:numberOfItems:](self, "_contentSizeWithWithCardSize:contentInsets:switcherViewBounds:numberOfItems:", v23, v37, v39, v31, v33, v34, v41, *(_QWORD *)&v6, *(_QWORD *)&v28, *(_QWORD *)&v60, *(_QWORD *)&v61);
  v63 = v44;
  v64 = v43;
  -[SBDeckFloatingSwitcherModifier _frameWithScaleAppliedForIndex:withCardSize:contentOffset:contentSize:contentInsets:switcherViewBounds:](self, "_frameWithScaleAppliedForIndex:withCardSize:contentOffset:contentSize:contentInsets:switcherViewBounds:", a3, v36, v38, v67, v66, v43, v44, *(_QWORD *)&v70, *(_QWORD *)&v40, *(_QWORD *)&v35, *(_QWORD *)&v42, *(_QWORD *)&v6, *(_QWORD *)&v28, *(_QWORD *)&v69, *(_QWORD *)&v29);
  v68.origin.x = v45;
  v68.origin.y = v46;
  v68.size.width = v47;
  v68.size.height = v48;
  -[SBDeckFloatingSwitcherModifier _frameWithScaleAppliedForIndex:withCardSize:contentOffset:contentSize:contentInsets:switcherViewBounds:](self, "_frameWithScaleAppliedForIndex:withCardSize:contentOffset:contentSize:contentInsets:switcherViewBounds:", a3 - 1, v65, v38, v67, v66, v64, v63, *(_QWORD *)&v70, *(_QWORD *)&v40, *(_QWORD *)&v35, *(_QWORD *)&v62, *(_QWORD *)&v6, *(_QWORD *)&v28, *(_QWORD *)&v69, *(_QWORD *)&v29);
  v50 = v49;
  v52 = v51;
  v54 = v53;
  v56 = v55;
  if ((-[SBDeckFloatingSwitcherModifier isRTLEnabled](self, "isRTLEnabled") & 1) != 0)
  {
    MaxX = CGRectGetMaxX(v68);
    v71.origin.x = v50;
    v71.origin.y = v52;
    v71.size.width = v54;
    v71.size.height = v56;
    return MaxX - CGRectGetMaxX(v71);
  }
  else
  {
    v72.origin.x = v50;
    v72.origin.y = v52;
    v72.size.width = v54;
    v72.size.height = v56;
    MinX = CGRectGetMinX(v72);
    return MinX - CGRectGetMinX(v68);
  }
}

- (uint64_t)_frameWithScaleAppliedForIndex:(double)a3 withCardSize:(double)a4 contentOffset:(double)a5 contentSize:(double)a6 contentInsets:(double)a7 switcherViewBounds:(uint64_t)a8
{
  double v24;
  double v25;
  double v26;

  objc_msgSend(a1, "_adjustedIndexForScaleForIndex:withCardSize:contentOffset:contentSize:contentInsets:switcherViewBounds:", a15, a16, a17, a18, a19, a20, a21, a22);
  v25 = v24;
  objc_msgSend(a1, "_scaleForScaleAdjustedIndex:");
  objc_msgSend(a1, "_frameForIndex:withCardSize:scale:adjustedIndexForScale:contentOffset:contentSize:contentInsets:switcherViewBounds:", a9, a2, a3, v26, v25, a4, a5, a6, a7, a15, a16, a17, a18, a19, a20, a21, a22);
  return SBTransformedRectWithScale();
}

- (unint64_t)_numberOfItems
{
  void *v2;
  unint64_t v3;

  -[SBDeckFloatingSwitcherModifier appLayouts](self, "appLayouts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (_NSRange)_visibleAppLayoutRangeForContentOffset:(CGPoint)a3
{
  unint64_t v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  uint64_t v12;
  NSUInteger v14;
  NSUInteger v15;
  _NSRange result;

  -[SBDeckFloatingSwitcherModifier scrollViewContentOffset](self, "scrollViewContentOffset", a3.x, a3.y);
  v4 = -[SBDeckFloatingSwitcherModifier _indexForContentOffset:](self, "_indexForContentOffset:");
  -[SBDeckFloatingSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = v6 - v4;
  if (v6 <= v4)
    goto LABEL_10;
  v8 = 0;
  v9 = 0x7FFFFFFFFFFFFFFFLL;
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    if (-[SBDeckFloatingSwitcherModifier _isIndexVisible:](self, "_isIndexVisible:", v4 + v8))
    {
      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
        v10 = v4 + v8;
      v9 = v4 + v8;
    }
    else if (v8)
    {
      break;
    }
    ++v8;
  }
  while (v7 != v8);
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_10:
    v11 = 0;
    v12 = 0;
  }
  else
  {
    if ((v10 & 0x8000000000000000) == 0
      && -[SBDeckFloatingSwitcherModifier _isIndexVisible:](self, "_isIndexVisible:", v10))
    {
      while (v10-- >= 1)
      {
        if (!-[SBDeckFloatingSwitcherModifier _isIndexVisible:](self, "_isIndexVisible:", v10))
        {
          ++v10;
          goto LABEL_17;
        }
      }
      v10 = 0;
    }
LABEL_17:
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      v11 = 0;
    else
      v11 = v10;
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      v12 = 0;
    else
      v12 = v9 - v10 + 1;
  }

  v14 = v11;
  v15 = v12;
  result.length = v15;
  result.location = v14;
  return result;
}

- (void)_applyPrototypeSettings
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  -[SBDeckFloatingSwitcherModifier switcherSettings](self, "switcherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatingSwitcherSettings");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "switcherCardScale");
  kDeckFloatingSwitcherCardScale = v3;
  objc_msgSend(v18, "cardSpacing");
  kDeckFloatingCardSpacing = v4;
  objc_msgSend(v18, "dimmingAlpha");
  kDeckFloatingHomeScreenDimmingAlpha = v5;
  objc_msgSend(v18, "leadingEdgeRubberbandingRange");
  kDeckFloatingLeadingEdgeRubberbandingRange = v6;
  objc_msgSend(v18, "perCardAdditionalScaleCoefficient");
  kDeckFloatingPerCardAdditionalScaleCoefficient = v7;
  objc_msgSend(v18, "scaleCurveExponent");
  kDeckFloatingScaleCurveExponent = v8;
  objc_msgSend(v18, "opacityMinimumDistanceThreshold");
  kDeckFloatingOpacityMinimumDistanceThreshold = v9;
  objc_msgSend(v18, "opacityFadeDistance");
  kDeckFloatingOpacityFadeDistance = v10;
  objc_msgSend(v18, "darkeningMinimumDistanceThreshold");
  kDeckFloatingDarkeningMinimumDistanceThreshold = v11;
  objc_msgSend(v18, "darkeningFadeDistance");
  kDeckFloatingDarkeningFadeDistance = v12;
  objc_msgSend(v18, "maximumDarkening");
  kDeckFloatingMaximumDarkening = v13;
  objc_msgSend(v18, "titleAndIconOpacityMinimumDistanceThreshold");
  kDeckFloatingTitleAndIconOpacityMinimumDistanceThreshold = v14;
  objc_msgSend(v18, "titleAndIconOpacityFadeDistance");
  kDeckFloatingTitleAndIconOpacityFadeDistance = v15;
  objc_msgSend(v18, "titleOpacityMinimumDistanceThreshold");
  kDeckFloatingTitleOpacityMinimumDistanceThreshold = v16;
  objc_msgSend(v18, "titleOpacityFadeDistance");
  kDeckFloatingTitleOpacityFadeDistance = v17;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAppLayout, 0);
}

@end
