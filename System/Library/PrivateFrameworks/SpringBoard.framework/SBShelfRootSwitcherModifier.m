@implementation SBShelfRootSwitcherModifier

- (void)didMoveToParentModifier:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBShelfRootSwitcherModifier;
  -[SBFluidSwitcherRootSwitcherModifier didMoveToParentModifier:](&v5, sel_didMoveToParentModifier_);
  if (a3)
    -[SBShelfRootSwitcherModifier _rebuildContainerBounds](self, "_rebuildContainerBounds");
}

- (void)setDelegate:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBShelfRootSwitcherModifier;
  -[SBFluidSwitcherRootSwitcherModifier setDelegate:](&v5, sel_setDelegate_);
  if (a3)
    -[SBShelfRootSwitcherModifier _rebuildContainerBounds](self, "_rebuildContainerBounds");
}

- (void)setDisplayMode:(unint64_t)a3
{
  void *v4;
  void *v5;

  if (*(_QWORD *)&self->_isRoutingFrameForIndexToFloating != a3)
  {
    *(_QWORD *)&self->_isRoutingFrameForIndexToFloating = a3;
    -[SBChainableModifier parentModifier](self, "parentModifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {

    }
    else
    {
      -[SBChainableModifier delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
        return;
    }
    -[SBShelfRootSwitcherModifier _rebuildContainerBounds](self, "_rebuildContainerBounds");
  }
}

- (void)_rebuildContainerBounds
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  __int128 v15;
  id v16;

  v3 = *(_QWORD *)&self->_isRoutingFrameForIndexToFloating;
  if (v3 == 1)
  {
    SBAppLayoutGenericAppLayoutWithConfiguration(3);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    -[SBShelfRootSwitcherModifier preferredFrameForLayoutRole:inAppLayout:bounds:interfaceOrientation:](self, "preferredFrameForLayoutRole:inAppLayout:bounds:interfaceOrientation:", 1, v16, 4, 0.0, 0.0, self->_portraitContainerBounds.size.width, self->_portraitContainerBounds.origin.y);
    *(_QWORD *)&self->super._hasPerformedInitialSetup = v11;
    self->_portraitContainerBounds.origin.x = v12;
    self->_portraitContainerBounds.origin.y = v13;
    self->_portraitContainerBounds.size.width = v14;
    v15 = *(_OWORD *)&self->_portraitContainerBounds.origin.y;
    *(_OWORD *)&self->_portraitContainerBounds.size.height = *(_OWORD *)&self->super._hasPerformedInitialSetup;
    *(_OWORD *)&self->_landscapeContainerBounds.origin.y = v15;

  }
  else if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;

    if (v6 >= v8)
      v9 = v8;
    else
      v9 = v6;
    if (v6 >= v8)
      v10 = v6;
    else
      v10 = v8;
    *(_QWORD *)&self->super._hasPerformedInitialSetup = 0;
    self->_portraitContainerBounds.origin.x = 0.0;
    self->_portraitContainerBounds.origin.y = v9;
    self->_portraitContainerBounds.size.width = v10;
    self->_portraitContainerBounds.size.height = 0.0;
    self->_landscapeContainerBounds.origin.x = 0.0;
    self->_landscapeContainerBounds.origin.y = v10;
    self->_landscapeContainerBounds.size.width = v9;
  }
}

- (CGRect)containerViewBounds
{
  int *v3;
  double *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  if ((unint64_t)(-[SBShelfRootSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation")- 1) >= 2)v3 = &OBJC_IVAR___SBShelfRootSwitcherModifier__landscapeContainerBounds;
  else
    v3 = &OBJC_IVAR___SBShelfRootSwitcherModifier__portraitContainerBounds;
  v4 = (double *)((char *)self + *v3);
  v5 = v4[2];
  v6 = v4[3];
  v7 = *v4;
  v8 = v4[1];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (double)floatingDockHeight
{
  return 0.0;
}

- (int64_t)tintStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v5;
  void *v6;
  int64_t v7;

  v5 = a4;
  if (objc_msgSend(v5, "type") == 5)
    goto LABEL_11;
  if (-[SBShelfRootSwitcherModifier userInterfaceStyle](self, "userInterfaceStyle") != 2)
  {
    if (-[SBShelfRootSwitcherModifier userInterfaceStyle](self, "userInterfaceStyle") == 1)
    {
      -[SBShelfRootSwitcherModifier shelfFocusedDisplayItems](self, "shelfFocusedDisplayItems");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "containsAnyItemFromSet:", v6))
        v7 = 1;
      else
        v7 = 3;
      goto LABEL_10;
    }
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  -[SBShelfRootSwitcherModifier shelfFocusedDisplayItems](self, "shelfFocusedDisplayItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "containsAnyItemFromSet:", v6))
    v7 = 2;
  else
    v7 = 4;
LABEL_10:

LABEL_12:
  return v7;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  char height_low;
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
  objc_super v24;
  objc_super v25;
  CGRect result;

  -[SBShelfRootSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "environment") == 2)
  {
    height_low = LOBYTE(self->_landscapeContainerBounds.size.height);
    LOBYTE(self->_landscapeContainerBounds.size.height) = 1;
    v25.receiver = self;
    v25.super_class = (Class)SBShelfRootSwitcherModifier;
    -[SBShelfRootSwitcherModifier frameForIndex:](&v25, sel_frameForIndex_, a3);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    LOBYTE(self->_landscapeContainerBounds.size.height) = height_low;
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)SBShelfRootSwitcherModifier;
    -[SBShelfRootSwitcherModifier frameForIndex:](&v24, sel_frameForIndex_, a3);
    v9 = v16;
    v11 = v17;
    v13 = v18;
    v15 = v19;
  }

  v20 = v9;
  v21 = v11;
  v22 = v13;
  v23 = v15;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (int64_t)headerStyleForIndex:(unint64_t)a3
{
  return 1;
}

- (id)keyboardSuppressionMode
{
  return +[SBSwitcherKeyboardSuppressionMode suppressionModeNone](SBSwitcherKeyboardSuppressionMode, "suppressionModeNone");
}

- (id)appLayoutsToResignActive
{
  return 0;
}

- (id)floorModifierForTransitionEvent:(id)a3
{
  SBShelfCarouselSwitcherModifier *v3;

  -[SBFluidSwitcherRootSwitcherModifier floorModifier](self, "floorModifier", a3);
  v3 = (SBShelfCarouselSwitcherModifier *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    v3 = objc_alloc_init(SBShelfCarouselSwitcherModifier);
  return v3;
}

- (id)multitaskingModifierForEvent:(id)a3
{
  return 0;
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

  v7 = -[SBSwipeToKillSwitcherModifier initWithLayoutRole:inAppLayout:fadeOutSwipedItems:](v4, "initWithLayoutRole:inAppLayout:fadeOutSwipedItems:", v5, v6, 1);
  return v7;
}

- (id)userScrollingModifierForScrollEvent:(id)a3
{
  return objc_alloc_init(SBScrollingSwitcherModifier);
}

- (id)focusedAppModifierForUpdateFocusedAppLayoutEvent:(id)a3
{
  id v3;
  SBFocusedAppLayoutSwitcherModifier *v4;
  void *v5;
  SBFocusedAppLayoutSwitcherModifier *v6;

  v3 = a3;
  v4 = [SBFocusedAppLayoutSwitcherModifier alloc];
  objc_msgSend(v3, "appLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SBFocusedAppLayoutSwitcherModifier initWithFocusedAppLayout:](v4, "initWithFocusedAppLayout:", v5);
  return v6;
}

- (id)transitionModifierForMainTransitionEvent:(id)a3
{
  unint64_t animationStyle;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  id v8;
  double v9;
  double v10;
  SBShelfExpansionSwitcherModifier *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  SBShelfExpansionSwitcherModifier *v17;
  void *v18;
  CGRect v20;

  if (self->_displayMode - 1 > 1)
  {
    v11 = 0;
  }
  else
  {
    animationStyle = self->_animationStyle;
    x = self->_targetFrame.origin.x;
    y = self->_targetFrame.origin.y;
    width = self->_targetFrame.size.width;
    v8 = a3;
    *(_QWORD *)&v20.origin.x = animationStyle;
    v20.origin.y = x;
    v20.size.width = y;
    v20.size.height = width;
    if (CGRectIsNull(v20))
    {
      v9 = *MEMORY[0x1E0C9D538];
      v10 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    }
    else
    {
      UIRectGetCenter();
      v9 = v12;
      -[SBShelfRootSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
      v14 = v13;
      -[SBShelfRootSwitcherModifier medusaSettings](self, "medusaSettings");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "switcherShelfGenieInitialYIncrementBelowScreen");
      v10 = v14 + v16;

    }
    v17 = [SBShelfExpansionSwitcherModifier alloc];
    objc_msgSend(v8, "transitionID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[SBShelfExpansionSwitcherModifier initWithTransitionID:expand:style:target:animationDelegate:](v17, "initWithTransitionID:expand:style:target:animationDelegate:", v18, self->_displayMode == 1, self->_appearanceState, self, v9, v10);
  }
  return v11;
}

- (id)orderedVisibleAppLayoutsForShelfExpansionModifier:(id)a3
{
  void *v3;
  void *v4;

  -[SBFluidSwitcherRootSwitcherModifier floorModifier](self, "floorModifier", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orderedVisibleAppLayouts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)displayMode
{
  return *(_QWORD *)&self->_isRoutingFrameForIndexToFloating;
}

- (unint64_t)appearanceState
{
  return self->_displayMode;
}

- (void)setAppearanceState:(unint64_t)a3
{
  self->_displayMode = a3;
}

- (CGRect)targetFrame
{
  double v2;
  double x;
  double y;
  double width;
  CGRect result;

  v2 = *(double *)&self->_animationStyle;
  x = self->_targetFrame.origin.x;
  y = self->_targetFrame.origin.y;
  width = self->_targetFrame.size.width;
  result.size.height = width;
  result.size.width = y;
  result.origin.y = x;
  result.origin.x = v2;
  return result;
}

- (void)setTargetFrame:(CGRect)a3
{
  *(CGRect *)&self->_animationStyle = a3;
}

- (unint64_t)animationStyle
{
  return self->_appearanceState;
}

- (void)setAnimationStyle:(unint64_t)a3
{
  self->_appearanceState = a3;
}

@end
