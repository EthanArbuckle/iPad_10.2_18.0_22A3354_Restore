@implementation SBMedusaWindowDragGestureSwitcherModifier

- (SBMedusaWindowDragGestureSwitcherModifier)initWithGestureID:(id)a3 selectedLeafAppLayout:(id)a4 initialMainAppLayout:(id)a5 initialFloatingAppLayout:(id)a6 initialFloatingConfiguration:(int64_t)a7
{
  id v14;
  id v15;
  id v16;
  SBMedusaWindowDragGestureSwitcherModifier *v17;
  uint64_t v18;
  SBDisplayItem *selectedDisplayItem;
  void *v21;
  objc_super v22;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v22.receiver = self;
  v22.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
  v17 = -[SBGestureSwitcherModifier initWithGestureID:](&v22, sel_initWithGestureID_, a3);
  if (v17)
  {
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, v17, CFSTR("SBMedusaWindowDragGestureSwitcherModifier.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("selectedLeafAppLayout"));

    }
    objc_storeStrong((id *)&v17->_selectedLeafAppLayout, a4);
    objc_storeStrong((id *)&v17->_initialMainAppLayout, a5);
    objc_storeStrong((id *)&v17->_initialFloatingAppLayout, a6);
    v17->_currentFloatingConfiguration = a7;
    v17->_initialAnchorPoint = (CGPoint)SBInvalidPoint;
    v17->_anchorPoint = (CGPoint)SBInvalidPoint;
    objc_msgSend(v14, "itemForLayoutRole:", 1);
    v18 = objc_claimAutoreleasedReturnValue();
    selectedDisplayItem = v17->_selectedDisplayItem;
    v17->_selectedDisplayItem = (SBDisplayItem *)v18;

  }
  return v17;
}

- (unint64_t)currentDestination
{
  return -[SBMedusaWindowDragGestureDestinationModifier currentDestination](self->_destinationModifier, "currentDestination");
}

- (void)didMoveToParentModifier:(id)a3
{
  SBSplitDisplayItemSwitcherModifier *v5;
  SBMedusaWindowDragGestureDestinationModifier *v6;
  SBMedusaWindowDragGestureDestinationModifier *destinationModifier;
  SBHomeScreenSwitcherModifier *v8;
  SBHomeScreenSwitcherModifier *v9;
  _QWORD v10[5];
  SBHomeScreenSwitcherModifier *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v12, sel_didMoveToParentModifier_);
  if (a3)
  {
    if (!self->_destinationModifier)
    {
      v5 = -[SBSplitDisplayItemSwitcherModifier initWithDisplayItem:]([SBSplitDisplayItemSwitcherModifier alloc], "initWithDisplayItem:", self->_selectedDisplayItem);
      -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", v5, 0, 0);
      v6 = -[SBMedusaWindowDragGestureDestinationModifier initWithSelectedLeafAppLayout:initialMainAppLayout:initialFloatingAppLayout:initialFloatingConfiguration:delegate:]([SBMedusaWindowDragGestureDestinationModifier alloc], "initWithSelectedLeafAppLayout:initialMainAppLayout:initialFloatingAppLayout:initialFloatingConfiguration:delegate:", self->_selectedLeafAppLayout, self->_initialMainAppLayout, self->_initialFloatingAppLayout, self->_currentFloatingConfiguration, self);
      destinationModifier = self->_destinationModifier;
      self->_destinationModifier = v6;

      -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", self->_destinationModifier, 1, 0);
    }
    v8 = objc_alloc_init(SBHomeScreenSwitcherModifier);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __69__SBMedusaWindowDragGestureSwitcherModifier_didMoveToParentModifier___block_invoke;
    v10[3] = &unk_1E8E9E820;
    v10[4] = self;
    v11 = v8;
    v9 = v8;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", v9, v10);

  }
}

uint64_t __69__SBMedusaWindowDragGestureSwitcherModifier_didMoveToParentModifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 40), "homeScreenAlpha");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200) = v2;
  objc_msgSend(*(id *)(a1 + 40), "homeScreenBackdropBlurProgress");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208) = v3;
  result = objc_msgSend(*(id *)(a1 + 40), "homeScreenDimmingAlpha");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216) = v5;
  return result;
}

- (id)handleGestureEvent:(id)a3
{
  id v4;
  void *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  double y;
  double v11;
  int *v12;
  int *v13;
  int *v14;
  SBInvalidateAdjustedAppLayoutsSwitcherEventResponse *v15;
  void *v16;
  SBUpdateLayoutSwitcherEventResponse *v17;
  void *v18;
  SBUpdateLayoutSwitcherEventResponse *v19;
  void *v20;
  void *v21;
  CGFloat v22;
  CGFloat v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  _BOOL4 v37;
  _BOOL4 v38;
  _BOOL4 v44;
  _QWORD v47[5];
  objc_super v48;

  v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
  -[SBGestureSwitcherModifier handleGestureEvent:](&v48, sel_handleGestureEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInContainerView");
  self->_location.x = v6;
  self->_location.y = v7;
  objc_msgSend(v4, "translationInContainerView");
  self->_translation.x = v8;
  self->_translation.y = v9;
  if (-[SBAppLayout isEqual:](self->_selectedLeafAppLayout, "isEqual:", self->_initialMainAppLayout))
  {
    y = fabs(self->_translation.x);
    if (y < self->_translation.y)
      y = self->_translation.y;
  }
  else
  {
    y = self->_translation.y;
  }
  -[SBMedusaWindowDragGestureSwitcherModifier _gestureProgressToMaxTranslationForTranslation:](self, "_gestureProgressToMaxTranslationForTranslation:", y);
  self->_progressToMaxTranslation = v11;
  v12 = &OBJC_IVAR___SBInteractiveScreenshotGestureRootViewController__flashView;
  v13 = &OBJC_IVAR___SBInteractiveScreenshotGestureRootViewController__flashView;
  v14 = &OBJC_IVAR___SBInteractiveScreenshotGestureRootViewController__flashView;
  if (objc_msgSend(v4, "phase") == 1)
  {
    v15 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
    SBAppendSwitcherModifierResponse(v15, v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 2, 2);
    SBAppendSwitcherModifierResponse(v17, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 8, 4);
    SBAppendSwitcherModifierResponse(v19, v18);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBMedusaWindowDragGestureSwitcherModifier draggingAppLayoutsForWindowDrag](self, "draggingAppLayoutsForWindowDrag");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __64__SBMedusaWindowDragGestureSwitcherModifier_handleGestureEvent___block_invoke;
    v47[3] = &unk_1E8E9DF78;
    v47[4] = self;
    objc_msgSend(v20, "bs_firstObjectPassingTest:", v47);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "sizeOfSelectedDisplayItem");
    self->_sizeOfSelectedDisplayItem.width = v22;
    self->_sizeOfSelectedDisplayItem.height = v23;
    v24 = objc_msgSend(v21, "preferredDisplayOrdinal");
    v25 = -[SBMedusaWindowDragGestureSwitcherModifier displayOrdinal](self, "displayOrdinal");
    self->_dragBeganInOtherSwitcher = v24 != v25;
    self->_dragBeganInOurSwitcher = v24 == v25;
    if (self->_dragBeganInOtherSwitcher)
    {
      objc_msgSend(v4, "locationInSelectedDisplayItem");
      v27 = v26 / self->_sizeOfSelectedDisplayItem.width;
      v29 = v28 / self->_sizeOfSelectedDisplayItem.height;
      self->_initialAnchorPoint.x = v27;
    }
    else
    {
      -[SBMedusaWindowDragGestureSwitcherModifier _initialTransformedFrameForDraggingAppLayout](self, "_initialTransformedFrameForDraggingAppLayout");
      v31 = v30;
      v33 = v32;
      UIRectGetCenter();
      v36 = (self->_location.x - v34) / v31 + 0.5;
      v29 = (self->_location.y - v35) / v33 + 0.5;
      self->_initialAnchorPoint.x = v36;
    }
    v14 = &OBJC_IVAR___SBInteractiveScreenshotGestureRootViewController__flashView;
    self->_initialAnchorPoint.y = v29;
    self->_anchorPoint = self->_initialAnchorPoint;

    v12 = &OBJC_IVAR___SBInteractiveScreenshotGestureRootViewController__flashView;
    v13 = &OBJC_IVAR___SBInteractiveScreenshotGestureRootViewController__flashView;
  }
  v37 = -[SBMedusaWindowDragGestureSwitcherModifier _anyProposedAppLayoutContainsSelectedDisplayItem](self, "_anyProposedAppLayoutContainsSelectedDisplayItem");
  v38 = -[SBMedusaWindowDragGestureSwitcherModifier _ourProposedAppLayoutContainsSelectedDisplayItem](self, "_ourProposedAppLayoutContainsSelectedDisplayItem");
  if (*((_BYTE *)&self->super.super.super.super.isa + v13[149]) && !v38 && v37)
  {
    __asm { FMOV            V0.2D, #0.5 }
    *(_OWORD *)((char *)&self->super.super.super.super.isa + v14[138]) = _Q0;
  }
  else
  {
    if (*((_BYTE *)&self->super.super.super.super.isa + v12[148]))
      v44 = v38;
    else
      v44 = 0;
    if (v44)
      __asm { FMOV            V0.2D, #0.5 }
    else
      _Q0 = self->_initialAnchorPoint;
    *(CGPoint *)((char *)&self->super.super.super.super.isa + v14[138]) = _Q0;
  }

  return v5;
}

uint64_t __64__SBMedusaWindowDragGestureSwitcherModifier_handleGestureEvent___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsItem:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224));
}

- (id)handleSceneReadyEvent:(id)a3
{
  id v4;
  SBUpdateLayoutSwitcherEventResponse *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v5 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 32, 2);
  v9.receiver = self;
  v9.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
  -[SBSwitcherModifier handleSceneReadyEvent:](&v9, sel_handleSceneReadyEvent_, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  SBAppendSwitcherModifierResponse(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
  -[SBGestureSwitcherModifier handleTransitionEvent:](&v7, sel_handleTransitionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isGestureInitiated") && (unint64_t)objc_msgSend(v4, "phase") >= 2)
    -[SBChainableModifier setState:](self, "setState:", 1);

  return v5;
}

- (id)appLayoutContainingAppLayout:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  -[SBMedusaWindowDragGestureDestinationModifier proposedAppLayout](self->_destinationModifier, "proposedAppLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isOrContainsAppLayout:", v4))
  {
    v6 = v5;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
    -[SBMedusaWindowDragGestureSwitcherModifier appLayoutContainingAppLayout:](&v9, sel_appLayoutContainingAppLayout_, v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  void *v4;
  uint64_t v5;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
  -[SBMedusaWindowDragGestureSwitcherModifier adjustedAppLayoutsForAppLayouts:](&v8, sel_adjustedAppLayoutsForAppLayouts_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__SBMedusaWindowDragGestureSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke;
  v7[3] = &unk_1E8E9DF78;
  v7[4] = self;
  if ((objc_msgSend(v4, "bs_containsObjectPassingTest:", v7) & 1) == 0)
  {
    objc_msgSend(v4, "arrayByAddingObject:", self->_selectedLeafAppLayout);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  return v4;
}

uint64_t __77__SBMedusaWindowDragGestureSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsItem:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224));
}

- (CGPoint)anchorPointForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  CGFloat x;
  double v9;
  CGFloat y;
  double v11;
  double v12;
  objc_super v13;
  CGPoint result;

  -[SBMedusaWindowDragGestureSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "containsItem:", self->_selectedDisplayItem) && (BSPointEqualToPoint() & 1) == 0)
  {
    x = self->_anchorPoint.x;
    y = self->_anchorPoint.y;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
    -[SBMedusaWindowDragGestureSwitcherModifier anchorPointForIndex:](&v13, sel_anchorPointForIndex_, a3);
    x = v7;
    y = v9;
  }

  v11 = x;
  v12 = y;
  result.y = v12;
  result.x = v11;
  return result;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
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
  objc_super v20;
  CGRect result;

  -[SBMedusaWindowDragGestureSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "containsItem:", self->_selectedDisplayItem) & 1) == 0
    && objc_msgSend(v6, "isEqual:", self->_initialFloatingAppLayout)
    && -[SBMedusaWindowDragGestureDestinationModifier hasEnteredPlatterZone](self->_destinationModifier, "hasEnteredPlatterZone"))
  {
    if (self->_currentFloatingConfiguration == 1)
      v7 = 3;
    else
      v7 = 4;
    -[SBMedusaWindowDragGestureSwitcherModifier floatingApplicationFrameInInterfaceOrientation:floatingConfiguration:](self, "floatingApplicationFrameInInterfaceOrientation:floatingConfiguration:", -[SBMedusaWindowDragGestureSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation"), v7);
  }
  else if (objc_msgSend(v6, "containsItem:", self->_selectedDisplayItem))
  {
    -[SBMedusaWindowDragGestureSwitcherModifier _boundsForDraggingAppLayout](self, "_boundsForDraggingAppLayout");
    UIRectCenteredAboutPoint();
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
    -[SBMedusaWindowDragGestureSwitcherModifier frameForIndex:](&v20, sel_frameForIndex_, a3);
  }
  v12 = v8;
  v13 = v9;
  v14 = v10;
  v15 = v11;

  v16 = v12;
  v17 = v13;
  v18 = v14;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  BOOL v12;
  SBMedusaWindowDragGestureDestinationModifier *destinationModifier;
  void *v14;
  unint64_t v15;
  BOOL v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  objc_super v34;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4;
  v12 = -[SBMedusaWindowDragGestureDestinationModifier hasEnteredPlatterZone](self->_destinationModifier, "hasEnteredPlatterZone");
  destinationModifier = self->_destinationModifier;
  if (v12)
    -[SBMedusaWindowDragGestureDestinationModifier currentAppLayout](destinationModifier, "currentAppLayout");
  else
    -[SBMedusaWindowDragGestureDestinationModifier proposedAppLayout](destinationModifier, "proposedAppLayout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "containsItem:", self->_selectedDisplayItem) & 1) == 0)
  {
    if (!objc_msgSend(v14, "isOrContainsAppLayout:", v11)
      || !objc_msgSend(v11, "isFullScreen")
      || ((v15 = -[SBMedusaWindowDragGestureDestinationModifier currentDestination](self->_destinationModifier, "currentDestination"), objc_msgSend(v14, "isFullScreen"))? (v16 = (v15 & 0xFFFFFFFFFFFFFFFELL) == 4): (v16 = 0), !v16))
    {
      v34.receiver = self;
      v34.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
      -[SBMedusaWindowDragGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v34, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v11, x, y, width, height);
      x = v17;
      y = v18;
      width = v19;
      height = v20;
      goto LABEL_12;
    }
    -[SBMedusaWindowDragGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
    x = v25;
    y = v26;
    v28 = v27;
    height = v29;
    -[SBMedusaWindowDragGestureSwitcherModifier medusaSettings](self, "medusaSettings");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "draggingPlatterSideActivationGutterPadding");

    -[SBMedusaWindowDragGestureSwitcherModifier _boundsForDraggingAppLayout](self, "_boundsForDraggingAppLayout");
    -[SBMedusaWindowDragGestureSwitcherModifier medusaSettings](self, "medusaSettings");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "iconPlatterScale");

    -[SBMedusaWindowDragGestureSwitcherModifier screenScale](self, "screenScale");
    BSFloatRoundForScale();
    v33 = v32;
    if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
    {
      if (v15 == 4)
        goto LABEL_18;
    }
    else if (v15 != 4)
    {
LABEL_18:
      width = v28 - v33;
      goto LABEL_12;
    }
    x = x + v33;
    goto LABEL_18;
  }
LABEL_12:

  v21 = x;
  v22 = y;
  v23 = width;
  v24 = height;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  void *v8;
  BOOL v9;
  double v10;
  objc_super v12;

  -[SBMedusaWindowDragGestureSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "containsItem:", self->_selectedDisplayItem))
  {
    -[SBMedusaWindowDragGestureSwitcherModifier _scaleForTranslation:](self, "_scaleForTranslation:", self->_translation.x, self->_translation.y);
LABEL_8:
    v10 = v7;
    goto LABEL_9;
  }
  -[SBMedusaWindowDragGestureDestinationModifier currentAppLayout](self->_destinationModifier, "currentAppLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isOrContainsAppLayout:", v6))
  {

    goto LABEL_7;
  }
  v9 = -[SBMedusaWindowDragGestureSwitcherModifier _shouldPushInFullScreenContent](self, "_shouldPushInFullScreenContent");

  if (!v9)
  {
LABEL_7:
    v12.receiver = self;
    v12.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
    -[SBMedusaWindowDragGestureSwitcherModifier scaleForIndex:](&v12, sel_scaleForIndex_, a3);
    goto LABEL_8;
  }
  v10 = 0.98;
LABEL_9:

  return v10;
}

- (double)backgroundOpacityForIndex:(unint64_t)a3
{
  return 0.0;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  double v9;
  double v10;
  objc_super v12;

  v8 = a4;
  v9 = 1.0;
  if (!-[SBAppLayout isOrContainsAppLayout:](self->_initialMainAppLayout, "isOrContainsAppLayout:", v8)
    && (objc_msgSend(v8, "containsItem:", self->_selectedDisplayItem) & 1) == 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
    -[SBMedusaWindowDragGestureSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](&v12, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, v8, a5);
    v9 = v10;
  }

  return v9;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  objc_super v13;

  v7 = 1.0;
  if (-[SBGestureSwitcherModifier gesturePhase](self, "gesturePhase") == 1)
  {
    -[SBMedusaWindowDragGestureSwitcherModifier appLayouts](self, "appLayouts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "itemForLayoutRole:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[SBAppLayout containsItem:](self->_initialMainAppLayout, "containsItem:", v10)
      || -[SBAppLayout layoutRoleForItem:](self->_initialMainAppLayout, "layoutRoleForItem:", v10) != 4)
    {
      v13.receiver = self;
      v13.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
      -[SBMedusaWindowDragGestureSwitcherModifier shadowOpacityForLayoutRole:atIndex:](&v13, sel_shadowOpacityForLayoutRole_atIndex_, a3, a4);
      v7 = v11;
    }

  }
  return v7;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;
  UIRectCornerRadii result;

  -[SBMedusaWindowDragGestureSwitcherModifier appLayouts](self, "appLayouts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "containsItem:", self->_selectedDisplayItem)
    && -[SBMedusaWindowDragGestureDestinationModifier hasEnteredPlatterZone](self->_destinationModifier, "hasEnteredPlatterZone"))
  {
    if (-[SBMedusaWindowDragGestureDestinationModifier currentDestination](self->_destinationModifier, "currentDestination") > 0xE)goto LABEL_11;
    -[SBMedusaWindowDragGestureSwitcherModifier _platterScale](self, "_platterScale");
    goto LABEL_9;
  }
  if (-[SBAppLayout containsAnyItemFromAppLayout:](self->_initialMainAppLayout, "containsAnyItemFromAppLayout:", v10)
    || (-[SBMedusaWindowDragGestureDestinationModifier currentAppLayout](self->_destinationModifier, "currentAppLayout"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "containsAnyItemFromAppLayout:", v10),
        v11,
        v12))
  {
    -[SBMedusaWindowDragGestureSwitcherModifier displayCornerRadius](self, "displayCornerRadius");
LABEL_9:
    SBRectCornerRadiiForRadius();
    goto LABEL_10;
  }
  v21.receiver = self;
  v21.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
  -[SBMedusaWindowDragGestureSwitcherModifier cornerRadiiForIndex:](&v21, sel_cornerRadiiForIndex_, a3);
LABEL_10:
  v3 = v13;
  v4 = v14;
  v5 = v15;
  v6 = v16;
LABEL_11:

  v17 = v3;
  v18 = v4;
  v19 = v5;
  v20 = v6;
  result.topRight = v20;
  result.bottomRight = v19;
  result.bottomLeft = v18;
  result.topLeft = v17;
  return result;
}

- (double)blurViewIconScaleForIndex:(unint64_t)a3
{
  double v3;

  -[SBMedusaWindowDragGestureSwitcherModifier scaleForIndex:](self, "scaleForIndex:", a3);
  return 1.0 / v3;
}

- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  int64_t v7;
  objc_super v9;

  v6 = a4;
  if ((objc_msgSend(v6, "containsItem:", self->_selectedDisplayItem) & 1) != 0)
  {
    v7 = 2;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
    v7 = -[SBMedusaWindowDragGestureSwitcherModifier shadowStyleForLayoutRole:inAppLayout:](&v9, sel_shadowStyleForLayoutRole_inAppLayout_, a3, v6);
  }

  return v7;
}

- (double)homeScreenAlpha
{
  double v3;
  double v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
  -[SBMedusaWindowDragGestureSwitcherModifier homeScreenAlpha](&v6, sel_homeScreenAlpha);
  v4 = v3;
  if (-[SBMedusaWindowDragGestureSwitcherModifier _updateHomeScreenStyleInteractively](self, "_updateHomeScreenStyleInteractively"))
  {
    return v4 + self->_progressToMaxTranslation * (self->_toHomeScreenAlpha - v4);
  }
  return v4;
}

- (double)homeScreenDimmingAlpha
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  objc_super v9;

  -[SBMedusaWindowDragGestureSwitcherModifier proposedAppLayoutForWindowDrag](self, "proposedAppLayoutForWindowDrag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
    return 0.0;
  v6 = 1.0;
  if (-[SBGestureSwitcherModifier gesturePhase](self, "gesturePhase") >= 2)
  {
    if (-[SBMedusaWindowDragGestureSwitcherModifier _shouldPushInFullScreenContent](self, "_shouldPushInFullScreenContent"))
    {
      v9.receiver = self;
      v9.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
      -[SBMedusaWindowDragGestureSwitcherModifier homeScreenDimmingAlpha](&v9, sel_homeScreenDimmingAlpha);
      v6 = v7;
      if (-[SBMedusaWindowDragGestureSwitcherModifier _updateHomeScreenStyleInteractively](self, "_updateHomeScreenStyleInteractively"))
      {
        if (v6 + self->_progressToMaxTranslation * (self->_toHomeScreenDimmingAlpha - v6) >= 0.2)
          return v6 + self->_progressToMaxTranslation * (self->_toHomeScreenDimmingAlpha - v6);
        else
          return 0.2;
      }
    }
  }
  return v6;
}

- (int64_t)homeScreenBackdropBlurType
{
  return 3;
}

- (double)homeScreenBackdropBlurProgress
{
  double v3;
  double v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
  -[SBMedusaWindowDragGestureSwitcherModifier homeScreenBackdropBlurProgress](&v6, sel_homeScreenBackdropBlurProgress);
  v4 = v3;
  if (-[SBMedusaWindowDragGestureSwitcherModifier _updateHomeScreenStyleInteractively](self, "_updateHomeScreenStyleInteractively"))
  {
    if (v4 + self->_progressToMaxTranslation * (self->_toHomeScreenBlurProgress - v4) >= 0.5)
      v4 = v4 + self->_progressToMaxTranslation * (self->_toHomeScreenBlurProgress - v4);
    else
      v4 = 0.5;
  }
  return fmin(fmax(v4, 0.0), 1.0);
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
  return 1;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  double v7;
  double v8;
  unint64_t v9;
  void *v10;
  char v11;
  void *v12;
  double v13;
  void *v14;
  char v15;
  void *v16;
  double v17;
  int64_t v18;
  int64_t v20;
  void *v21;
  double v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
  v6 = a4;
  -[SBMedusaWindowDragGestureSwitcherModifier dimmingAlphaForLayoutRole:inAppLayout:](&v25, sel_dimmingAlphaForLayoutRole_inAppLayout_, a3, v6);
  v8 = v7;
  v9 = -[SBMedusaWindowDragGestureDestinationModifier currentDestination](self->_destinationModifier, "currentDestination", v25.receiver, v25.super_class);
  objc_msgSend(v6, "itemForLayoutRole:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "containsItem:", self->_selectedDisplayItem);

  if ((v11 & 1) != 0)
  {
    if (v9 - 11 <= 1)
    {
      -[SBMedusaWindowDragGestureSwitcherModifier medusaSettings](self, "medusaSettings");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "resizeAnimationDismissItemOpacity");
      goto LABEL_21;
    }
  }
  else
  {
    if (-[SBAppLayout containsItem:](self->_initialMainAppLayout, "containsItem:", v10))
    {
      -[SBMedusaWindowDragGestureDestinationModifier proposedAppLayout](self->_destinationModifier, "proposedAppLayout");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "containsItem:", v10);

      if ((v15 & 1) == 0)
      {
        v18 = -[SBAppLayout layoutRoleForItem:](self->_initialMainAppLayout, "layoutRoleForItem:", v10);
        if (v18 == 3 && (v9 & 0xFFFFFFFFFFFFFFFELL) == 6)
        {
          -[SBMedusaWindowDragGestureSwitcherModifier medusaSettings](self, "medusaSettings");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v21;
        }
        else
        {
          v20 = v18;
          -[SBMedusaWindowDragGestureSwitcherModifier medusaSettings](self, "medusaSettings");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v21;
          if (v20 != 4 || v9 != 10)
          {
            objc_msgSend(v21, "defaultDimmingOpacity");
            v8 = v8 + v23;
LABEL_22:

            goto LABEL_23;
          }
        }
        objc_msgSend(v21, "replacementDimmingAlpha");
LABEL_21:
        v8 = v13;
        goto LABEL_22;
      }
    }
    if (v9 == 10)
    {
      -[SBMedusaWindowDragGestureDestinationModifier currentAppLayout](self->_destinationModifier, "currentAppLayout");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "containsItem:", v10) && objc_msgSend(v12, "layoutRoleForItem:", v10) != 4)
      {
        -[SBMedusaWindowDragGestureSwitcherModifier medusaSettings](self, "medusaSettings");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "defaultDimmingOpacity");
        v8 = v17;

      }
      goto LABEL_22;
    }
  }
LABEL_23:

  return v8;
}

- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  BOOL v9;
  objc_super v11;

  -[SBMedusaWindowDragGestureSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "containsItem:", self->_selectedDisplayItem) & 1) != 0)
    goto LABEL_4;
  -[SBMedusaWindowDragGestureDestinationModifier currentAppLayout](self->_destinationModifier, "currentAppLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isOrContainsAppLayout:", v6))
  {

    goto LABEL_6;
  }
  v8 = -[SBMedusaWindowDragGestureSwitcherModifier _shouldPushInFullScreenContent](self, "_shouldPushInFullScreenContent");

  if (!v8)
  {
LABEL_6:
    v11.receiver = self;
    v11.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
    v9 = -[SBMedusaWindowDragGestureSwitcherModifier isContentStatusBarVisibleForIndex:](&v11, sel_isContentStatusBarVisibleForIndex_, a3);
    goto LABEL_7;
  }
LABEL_4:
  v9 = 0;
LABEL_7:

  return v9;
}

- (id)keyboardSuppressionMode
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[SBMedusaWindowDragGestureSwitcherModifier appLayouts](self, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[SBSwitcherKeyboardSuppressionMode newSuppressionModeForSwitcherScenesFromAppLayouts:](SBSwitcherKeyboardSuppressionMode, "newSuppressionModeForSwitcherScenesFromAppLayouts:", v4);

  objc_msgSend(v5, "setApplyAssertionEvenIfAppIsHostingTheKeyboard:", 1);
  return v5;
}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  void *v7;
  int v8;
  BOOL v9;
  SBMedusaWindowDragGestureDestinationModifier *destinationModifier;
  void *v11;
  unint64_t v12;
  BOOL v13;
  objc_super v15;

  v6 = a4;
  objc_msgSend(v6, "itemForLayoutRole:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqual:", self->_selectedDisplayItem)
    && -[SBMedusaWindowDragGestureDestinationModifier hasEnteredPlatterZone](self->_destinationModifier, "hasEnteredPlatterZone")&& -[SBMedusaWindowDragGestureDestinationModifier currentDestination](self->_destinationModifier, "currentDestination"))
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    v9 = -[SBMedusaWindowDragGestureDestinationModifier hasEnteredPlatterZone](self->_destinationModifier, "hasEnteredPlatterZone");
    destinationModifier = self->_destinationModifier;
    if (v9)
      -[SBMedusaWindowDragGestureDestinationModifier currentAppLayout](destinationModifier, "currentAppLayout");
    else
      -[SBMedusaWindowDragGestureDestinationModifier proposedAppLayout](destinationModifier, "proposedAppLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "containsItem:", self->_selectedDisplayItem) & 1) == 0
      && objc_msgSend(v11, "isOrContainsAppLayout:", v6)
      && ((v12 = -[SBMedusaWindowDragGestureDestinationModifier currentDestination](self->_destinationModifier, "currentDestination"), objc_msgSend(v11, "isFullScreen"))? (v13 = (v12 & 0xFFFFFFFFFFFFFFFELL) == 4): (v13 = 0), v13)|| (v15.receiver = self, v15.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier, -[SBMedusaWindowDragGestureSwitcherModifier isLayoutRoleBlurred:inAppLayout:](&v15, sel_isLayoutRoleBlurred_inAppLayout_, a3, v6)))
    {
      LOBYTE(v8) = 1;
    }
    else
    {
      v8 = -[SBMedusaWindowDragGestureSwitcherModifier isLayoutRoleContentReady:inAppLayout:](self, "isLayoutRoleContentReady:inAppLayout:", a3, v6) ^ 1;
    }

  }
  return v8;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  id v4;
  unsigned __int16 v5;
  SBSwitcherAsyncRenderingAttributes v6;
  objc_super v8;

  v4 = a3;
  if (objc_msgSend(v4, "containsItem:", self->_selectedDisplayItem))
  {
    v8.receiver = self;
    v8.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
    v5 = (unsigned __int16)-[SBMedusaWindowDragGestureSwitcherModifier asyncRenderingAttributesForAppLayout:](&v8, sel_asyncRenderingAttributesForAppLayout_, v4);
  }
  else
  {
    v5 = SBSwitcherAsyncRenderingAttributesMake(1u, 1);
  }
  v6 = (SBSwitcherAsyncRenderingAttributes)v5;

  return v6;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;
  objc_super v20;
  objc_super v21;
  CAFrameRateRange v22;

  v4 = a3;
  if (objc_msgSend(v4, "switcherLayoutElementType")
    && -[SBGestureSwitcherModifier gesturePhase](self, "gesturePhase") == 1)
  {
    v21.receiver = self;
    v21.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
    -[SBGestureSwitcherModifier animationAttributesForLayoutElement:](&v21, sel_animationAttributesForLayoutElement_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    v7 = v6;
    v8 = 2;
LABEL_12:
    objc_msgSend(v7, "setUpdateMode:", v8);
    goto LABEL_13;
  }
  if (objc_msgSend(v4, "switcherLayoutElementType"))
  {
    v19.receiver = self;
    v19.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
    -[SBGestureSwitcherModifier animationAttributesForLayoutElement:](&v19, sel_animationAttributesForLayoutElement_, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
    -[SBGestureSwitcherModifier animationAttributesForLayoutElement:](&v20, sel_animationAttributesForLayoutElement_, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v9, "mutableCopy");

    LODWORD(v9) = objc_msgSend(v4, "containsItem:", self->_selectedDisplayItem);
    -[SBMedusaWindowDragGestureSwitcherModifier medusaSettings](self, "medusaSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!(_DWORD)v9)
    {
      objc_msgSend(v10, "resizeAnimationSettings");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setLayoutSettings:", v17);

      v7 = v6;
      v8 = 3;
      goto LABEL_12;
    }
    objc_msgSend(v10, "windowDragAnimationSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBMedusaWindowDragGestureSwitcherModifier medusaSettings](self, "medusaSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "resizeAnimationSettings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
    objc_msgSend(v14, "dampingRatio");
    objc_msgSend(v15, "setTrackingDampingRatio:");
    objc_msgSend(v14, "response");
    objc_msgSend(v15, "setTrackingResponse:");
    v22 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    objc_msgSend(v15, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v22.minimum, *(double *)&v22.maximum, *(double *)&v22.preferred);
    objc_msgSend(v6, "setLayoutSettings:", v15);
    objc_msgSend(v6, "setCornerRadiusSettings:", v15);
    objc_msgSend(v6, "setPositionSettings:", v12);
    if (-[SBMedusaWindowDragGestureDestinationModifier hasEnteredPlatterZone](self->_destinationModifier, "hasEnteredPlatterZone"))
    {
      v16 = v15;
    }
    else
    {
      v16 = v12;
    }
    objc_msgSend(v6, "setScaleSettings:", v16);

  }
LABEL_13:

  return v6;
}

- (id)visibleAppLayouts
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
  -[SBMedusaWindowDragGestureSwitcherModifier visibleAppLayouts](&v7, sel_visibleAppLayouts);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMedusaWindowDragGestureSwitcherModifier _appLayoutContainingSelectedDisplayItem](self, "_appLayoutContainingSelectedDisplayItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)topMostLayoutElements
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
  -[SBMedusaWindowDragGestureSwitcherModifier topMostLayoutElements](&v7, sel_topMostLayoutElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[SBMedusaWindowDragGestureSwitcherModifier _appLayoutContainingSelectedDisplayItem](self, "_appLayoutContainingSelectedDisplayItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", v5);
  objc_msgSend(v4, "insertObject:atIndex:", v5, 0);
  if (self->_initialFloatingAppLayout && !-[SBAppLayout isEqual:](self->_selectedLeafAppLayout, "isEqual:"))
  {
    objc_msgSend(v4, "removeObject:", self->_initialFloatingAppLayout);
    objc_msgSend(v4, "insertObject:atIndex:", self->_initialFloatingAppLayout, 0);
  }

  return v4;
}

- (id)topMostLayoutRolesForAppLayout:(id)a3
{
  SBDisplayItem *selectedDisplayItem;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  selectedDisplayItem = self->_selectedDisplayItem;
  v5 = a3;
  if (objc_msgSend(v5, "containsItem:", selectedDisplayItem))
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    v7 = objc_msgSend(v5, "layoutRoleForItem:", self->_selectedDisplayItem);

    objc_msgSend(v6, "numberWithInteger:", v7);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v12[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
    -[SBMedusaWindowDragGestureSwitcherModifier topMostLayoutRolesForAppLayout:](&v11, sel_topMostLayoutRolesForAppLayout_, v5);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

- (BOOL)isSwitcherWindowVisible
{
  return 1;
}

- (id)visibleHomeAffordanceLayoutElements
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
  -[SBMedusaWindowDragGestureSwitcherModifier visibleHomeAffordanceLayoutElements](&v7, sel_visibleHomeAffordanceLayoutElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "containsObject:", self->_selectedLeafAppLayout))
  {
    v4 = (void *)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v4, "removeObject:", self->_selectedLeafAppLayout);

    v3 = v4;
  }
  if (objc_msgSend(v3, "containsObject:", self->_initialMainAppLayout)
    && -[SBAppLayout containsItem:](self->_initialMainAppLayout, "containsItem:", self->_selectedDisplayItem))
  {
    v5 = (void *)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v5, "removeObject:", self->_initialMainAppLayout);

    v3 = v5;
  }
  return v3;
}

- (BOOL)isResizeGrabberVisibleForAppLayout:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if (-[SBGestureSwitcherModifier gesturePhase](self, "gesturePhase") == 1)
  {
    v7.receiver = self;
    v7.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
    v5 = -[SBMedusaWindowDragGestureSwitcherModifier isResizeGrabberVisibleForAppLayout:](&v7, sel_isResizeGrabberVisibleForAppLayout_, v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)resizeGrabberLayoutAttributesForAppLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
  -[SBMedusaWindowDragGestureSwitcherModifier resizeGrabberLayoutAttributesForAppLayout:](&v16, sel_resizeGrabberLayoutAttributesForAppLayout_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMedusaWindowDragGestureDestinationModifier proposedAppLayout](self->_destinationModifier, "proposedAppLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemForLayoutRole:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7
    || !objc_msgSend(v6, "isOrContainsAppLayout:", v4)
    || (objc_msgSend(v4, "containsItem:", self->_selectedDisplayItem) & 1) != 0)
  {
LABEL_14:

    goto LABEL_15;
  }
  v8 = objc_msgSend(v6, "containsItem:", self->_selectedDisplayItem);

  if (v8)
  {
    objc_msgSend(v4, "itemForLayoutRole:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "layoutRoleForItem:", v9);

    v11 = -[SBMedusaWindowDragGestureSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
    v12 = v11 ^ 1;
    if (v10 != 1)
      v12 = 0;
    if (v10 == 2)
      v13 = v11;
    else
      v13 = 0;
    if (v12 | v13)
      v14 = 8;
    else
      v14 = 2;
    objc_msgSend(v5, "setEdge:", v14);
    objc_msgSend(v6, "leafAppLayoutForRole:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLeafAppLayout:", v7);
    goto LABEL_14;
  }
LABEL_15:

  return v5;
}

- (CGRect)_boundsForDraggingAppLayout
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  objc_super v39;
  objc_super v40;
  objc_super v41;
  objc_super v42;
  _QWORD v43[5];
  CGRect result;

  v4 = -[SBMedusaWindowDragGestureDestinationModifier currentDestination](self->_destinationModifier, "currentDestination");
  v5 = -[SBMedusaWindowDragGestureSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation");
  -[SBMedusaWindowDragGestureDestinationModifier proposedAppLayout](self->_destinationModifier, "proposedAppLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (self->_dragBeganInOtherSwitcher && (objc_msgSend(v6, "containsItem:", self->_selectedDisplayItem) & 1) == 0)
  {
LABEL_15:
    SBRectWithSize();
    v8 = v21;
    v9 = v22;
    v10 = v23;
    v11 = v24;
  }
  else
  {
    v8 = *MEMORY[0x1E0C9D648];
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    if (-[SBAppLayout isFullScreen](self->_initialMainAppLayout, "isFullScreen")
      && -[SBAppLayout isEqual:](self->_selectedLeafAppLayout, "isEqual:", self->_initialMainAppLayout))
    {
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __72__SBMedusaWindowDragGestureSwitcherModifier__boundsForDraggingAppLayout__block_invoke;
      v43[3] = &unk_1E8EAFFE8;
      v43[4] = self;
      v12 = MEMORY[0x1D17E5550](v43);
      v13 = (void *)v12;
      switch(v4)
      {
        case 0:
        case 1:
        case 14:
          SBAppLayoutGenericAppLayoutWithConfiguration(1);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBMedusaWindowDragGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
          v42.receiver = self;
          v42.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
          -[SBMedusaWindowDragGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v42, sel_frameForLayoutRole_inAppLayout_withBounds_, 1, v29);
          v8 = v30;
          v9 = v31;
          v10 = v32;
          v11 = v33;

          break;
        case 2:
        case 4:
          v34 = &SBLayoutRolePrimary;
          goto LABEL_20;
        case 3:
        case 5:
          v34 = &SBLayoutRoleSide;
LABEL_20:
          (*(void (**)(uint64_t, uint64_t))(v12 + 16))(v12, *v34);
          SBRectWithSize();
          v8 = v35;
          v9 = v36;
          v10 = v37;
          v11 = v38;
          break;
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:
        case 11:
        case 12:
        case 13:
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          SBStringForWindowDragGestureDestination(v4);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMedusaWindowDragGestureSwitcherModifier.m"), 653, CFSTR("Unsupported destination when dragging fullscreen app: %@"), v15);

          break;
        default:
          break;
      }

    }
    else
    {
      switch(v4)
      {
        case 0:
        case 1:
        case 14:
          SBAppLayoutGenericAppLayoutWithConfiguration(1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBMedusaWindowDragGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
          v41.receiver = self;
          v41.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
          -[SBMedusaWindowDragGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v41, sel_frameForLayoutRole_inAppLayout_withBounds_, 1, v16);
          v8 = v17;
          v9 = v18;
          v10 = v19;
          v11 = v20;

          break;
        case 2:
        case 4:
        case 11:
          -[SBMedusaWindowDragGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
          v40.receiver = self;
          v40.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
          -[SBMedusaWindowDragGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v40, sel_frameForLayoutRole_inAppLayout_withBounds_, 1, v7);
          goto LABEL_15;
        case 3:
        case 5:
        case 12:
          -[SBMedusaWindowDragGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
          v39.receiver = self;
          v39.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
          -[SBMedusaWindowDragGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v39, sel_frameForLayoutRole_inAppLayout_withBounds_, 2, v7);
          goto LABEL_15;
        case 6:
        case 7:
        case 8:
        case 9:
          -[SBMedusaWindowDragGestureSwitcherModifier floatingApplicationFrameInInterfaceOrientation:floatingConfiguration:](self, "floatingApplicationFrameInInterfaceOrientation:floatingConfiguration:", -[SBMedusaWindowDragGestureSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation"), 2);
          goto LABEL_15;
        case 10:
        case 13:
          -[SBMedusaWindowDragGestureSwitcherModifier centerWindowFrameInInterfaceOrientation:centerConfiguration:](self, "centerWindowFrameInInterfaceOrientation:centerConfiguration:", v5, 1);
          goto LABEL_15;
        default:
          break;
      }
    }
  }

  v25 = v8;
  v26 = v9;
  v27 = v10;
  v28 = v11;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

double __72__SBMedusaWindowDragGestureSwitcherModifier__boundsForDraggingAppLayout__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  double v6;
  double v7;

  v4 = *(void **)(a1 + 32);
  SBAppLayoutGenericAppLayoutWithConfiguration(3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "containerViewBounds");
  objc_msgSend(v4, "frameForLayoutRole:inAppLayout:withBounds:", a2, v5);
  v7 = v6;

  return v7;
}

- (CGRect)_initialTransformedFrameForDraggingAppLayout
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
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
  CGAffineTransform v35;
  objc_super v36;
  objc_super v37;
  objc_super v38;
  objc_super v39;
  CGRect v40;
  CGRect result;

  -[SBMedusaWindowDragGestureSwitcherModifier _appLayoutContainingSelectedDisplayItem](self, "_appLayoutContainingSelectedDisplayItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMedusaWindowDragGestureSwitcherModifier appLayouts](self, "appLayouts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "indexOfObject:", v3);

  v39.receiver = self;
  v39.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
  -[SBMedusaWindowDragGestureSwitcherModifier frameForIndex:](&v39, sel_frameForIndex_, v5);
  v7 = v6;
  v9 = v8;
  v10 = objc_msgSend(v3, "layoutRoleForItem:", self->_selectedDisplayItem);
  SBRectWithSize();
  v38.receiver = self;
  v38.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
  -[SBMedusaWindowDragGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v38, sel_frameForLayoutRole_inAppLayout_withBounds_, v10, v3);
  v12 = v11;
  v14 = v13;
  v16 = v7 + v15;
  v18 = v9 + v17;
  v37.receiver = self;
  v37.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
  -[SBMedusaWindowDragGestureSwitcherModifier scaleForIndex:](&v37, sel_scaleForIndex_, v5);
  v20 = v19;
  v36.receiver = self;
  v36.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
  -[SBMedusaWindowDragGestureSwitcherModifier scaleForLayoutRole:inAppLayout:](&v36, sel_scaleForLayoutRole_inAppLayout_, v10, v3);
  v22 = v20 * v21;
  UIRectGetCenter();
  CGAffineTransformMakeScale(&v35, v22, v22);
  v40.origin.x = v16;
  v40.origin.y = v18;
  v40.size.width = v12;
  v40.size.height = v14;
  CGRectApplyAffineTransform(v40, &v35);
  UIRectCenteredAboutPoint();
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;

  v31 = v24;
  v32 = v26;
  v33 = v28;
  v34 = v30;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (double)_distanceYToMaxTranslation
{
  double v2;

  -[SBMedusaWindowDragGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
  return v2 + -48.0;
}

- (double)_gestureProgressToMaxTranslationForTranslation:(double)a3
{
  double v4;

  -[SBMedusaWindowDragGestureSwitcherModifier _distanceYToMaxTranslation](self, "_distanceYToMaxTranslation");
  return a3 / v4;
}

- (double)_platterScale
{
  void *v3;
  double v4;
  double v5;
  double v6;

  -[SBMedusaWindowDragGestureSwitcherModifier medusaSettings](self, "medusaSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowPlatterScale");
  v5 = v4;
  if (-[SBMedusaWindowDragGestureDestinationModifier currentDestination](self->_destinationModifier, "currentDestination") == 1)
  {
    objc_msgSend(v3, "windowPlatterScaleForReplacingEntireSpace");
    v5 = v6;
  }

  return v5;
}

- (double)_scaleForTranslation:(CGPoint)a3
{
  double y;
  double result;
  double v6;
  double v7;
  double v8;

  y = a3.y;
  if (-[SBMedusaWindowDragGestureDestinationModifier hasEnteredPlatterZone](self->_destinationModifier, "hasEnteredPlatterZone", a3.x)&& -[SBMedusaWindowDragGestureDestinationModifier currentDestination](self->_destinationModifier, "currentDestination"))
  {
    -[SBMedusaWindowDragGestureSwitcherModifier _platterScale](self, "_platterScale");
  }
  else
  {
    -[SBMedusaWindowDragGestureSwitcherModifier _gestureProgressToMaxTranslationForTranslation:](self, "_gestureProgressToMaxTranslationForTranslation:", y);
    result = 1.0 - v6;
    if (result < 0.0)
      result = 0.0;
    if (result >= 0.2)
    {
      if (result > 1.0)
      {
        BSUIConstrainValueWithRubberBand();
        return v8 + 1.0;
      }
    }
    else
    {
      BSUIConstrainValueWithRubberBand();
      return 0.2 - v7;
    }
  }
  return result;
}

- (BOOL)_updateHomeScreenStyleInteractively
{
  _BOOL4 v3;

  if (!-[SBMedusaWindowDragGestureDestinationModifier hasEnteredPlatterZone](self->_destinationModifier, "hasEnteredPlatterZone")|| (v3 = -[SBAppLayout isEqual:](self->_selectedLeafAppLayout, "isEqual:", self->_initialMainAppLayout)))
  {
    LOBYTE(v3) = -[SBMedusaWindowDragGestureSwitcherModifier _draggingFullScreenAppOrSplitView](self, "_draggingFullScreenAppOrSplitView");
  }
  return v3;
}

- (BOOL)_draggingFullScreenAppOrSplitView
{
  _BOOL4 v3;

  v3 = -[SBAppLayout containsItem:](self->_initialMainAppLayout, "containsItem:", self->_selectedDisplayItem);
  if (v3)
    LOBYTE(v3) = SBLayoutRoleIsValidForSplitView(-[SBAppLayout layoutRoleForItem:](self->_initialMainAppLayout, "layoutRoleForItem:", self->_selectedDisplayItem));
  return v3;
}

- (BOOL)_shouldPushInFullScreenContent
{
  return -[SBMedusaWindowDragGestureDestinationModifier hasEnteredPlatterZone](self->_destinationModifier, "hasEnteredPlatterZone")|| -[SBMedusaWindowDragGestureSwitcherModifier _draggingFullScreenAppOrSplitView](self, "_draggingFullScreenAppOrSplitView");
}

- (BOOL)_anyProposedAppLayoutContainsSelectedDisplayItem
{
  SBMedusaWindowDragGestureSwitcherModifier *v2;
  void *v3;
  _QWORD v5[5];

  v2 = self;
  -[SBMedusaWindowDragGestureSwitcherModifier proposedAppLayoutsForWindowDrag](self, "proposedAppLayoutsForWindowDrag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __93__SBMedusaWindowDragGestureSwitcherModifier__anyProposedAppLayoutContainsSelectedDisplayItem__block_invoke;
  v5[3] = &unk_1E8E9DF78;
  v5[4] = v2;
  LOBYTE(v2) = objc_msgSend(v3, "bs_containsObjectPassingTest:", v5);

  return (char)v2;
}

uint64_t __93__SBMedusaWindowDragGestureSwitcherModifier__anyProposedAppLayoutContainsSelectedDisplayItem__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsItem:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224));
}

- (BOOL)_ourProposedAppLayoutContainsSelectedDisplayItem
{
  SBMedusaWindowDragGestureSwitcherModifier *v2;
  void *v3;

  v2 = self;
  -[SBMedusaWindowDragGestureDestinationModifier proposedAppLayout](self->_destinationModifier, "proposedAppLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "containsItem:", v2->_selectedDisplayItem);

  return (char)v2;
}

- (id)_appLayoutContainingSelectedDisplayItem
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[SBMedusaWindowDragGestureSwitcherModifier appLayouts](self, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __84__SBMedusaWindowDragGestureSwitcherModifier__appLayoutContainingSelectedDisplayItem__block_invoke;
  v6[3] = &unk_1E8E9DF78;
  v6[4] = self;
  objc_msgSend(v3, "bs_firstObjectPassingTest:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __84__SBMedusaWindowDragGestureSwitcherModifier__appLayoutContainingSelectedDisplayItem__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsItem:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224));
}

- (SBAppLayout)selectedLeafAppLayout
{
  return self->_selectedLeafAppLayout;
}

- (SBAppLayout)initialMainAppLayout
{
  return self->_initialMainAppLayout;
}

- (SBAppLayout)initialFloatingAppLayout
{
  return self->_initialFloatingAppLayout;
}

- (int64_t)currentFloatingConfiguration
{
  return self->_currentFloatingConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialFloatingAppLayout, 0);
  objc_storeStrong((id *)&self->_initialMainAppLayout, 0);
  objc_storeStrong((id *)&self->_selectedLeafAppLayout, 0);
  objc_storeStrong((id *)&self->_selectedDisplayItem, 0);
  objc_storeStrong((id *)&self->_destinationModifier, 0);
}

@end
