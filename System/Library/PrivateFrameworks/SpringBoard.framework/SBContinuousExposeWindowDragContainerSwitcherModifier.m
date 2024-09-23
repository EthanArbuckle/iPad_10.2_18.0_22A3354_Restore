@implementation SBContinuousExposeWindowDragContainerSwitcherModifier

- (SBContinuousExposeWindowDragContainerSwitcherModifier)initWithAppLayouts:(id)a3 initialAppLayout:(id)a4 selectedDisplayItem:(id)a5 windowDragContentSwitcherModifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  SBContinuousExposeWindowDragContainerSwitcherModifier *v14;
  SBContinuousExposeWindowDragContainerSwitcherModifier *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SBContinuousExposeWindowDragContainerSwitcherModifier;
  v14 = -[SBFilteringSwitcherModifier initWithAppLayouts:modifier:](&v17, sel_initWithAppLayouts_modifier_, a3, v13);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_initialAppLayout, a4);
    objc_storeStrong((id *)&v15->_selectedDisplayItem, a5);
    objc_storeStrong((id *)&v15->_windowDragContentSwitcherModifier, a6);
    v15->_windowDragSpringLoadState = 0;
  }

  return v15;
}

- (void)didMoveToParentModifier:(id)a3
{
  void *v5;
  SBAppLayout *v6;
  SBAppLayout *appLayoutContainingAppLayout;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBContinuousExposeWindowDragContainerSwitcherModifier;
  -[SBFilteringSwitcherModifier didMoveToParentModifier:](&v8, sel_didMoveToParentModifier_);
  if (a3)
  {
    -[SBContinuousExposeWindowDragContainerSwitcherModifier _appLayoutContainingDisplayItem:](self, "_appLayoutContainingDisplayItem:", self->_selectedDisplayItem);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBContinuousExposeWindowDragContainerSwitcherModifier appLayoutContainingAppLayout:](self, "appLayoutContainingAppLayout:", v5);
    v6 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
    appLayoutContainingAppLayout = self->_appLayoutContainingAppLayout;
    self->_appLayoutContainingAppLayout = v6;

  }
}

- (id)handleTimerEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t windowDragSpringLoadState;
  SBTimerEventSwitcherEventResponse *v8;
  void *v9;
  SBTimerEventSwitcherEventResponse *v10;
  SBPerformTransitionSwitcherEventResponse *v11;
  uint64_t v12;
  SBTimerEventSwitcherEventResponse *v13;
  void *v14;
  SBUpdateLayoutSwitcherEventResponse *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SBContinuousExposeWindowDragContainerSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier handleTimerEvent:](&v17, sel_handleTimerEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reason", v17.receiver, v17.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isEqualToString:", self->_continuousExposeSpringLoadReasonWithAppLayout))
  {
    windowDragSpringLoadState = self->_windowDragSpringLoadState;
    switch(windowDragSpringLoadState)
    {
      case 3:
        self->_windowDragSpringLoadState = 0;
        break;
      case 2:
        -[SBContinuousExposeWindowDragContainerSwitcherModifier _createInterceptableTransitionRequestForActivatingAppLayout:withSelectedDisplayItem:](self, "_createInterceptableTransitionRequestForActivatingAppLayout:withSelectedDisplayItem:", self->_springLoadTargetAppLayout, self->_selectedDisplayItem);
        v8 = (SBTimerEventSwitcherEventResponse *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          self->_windowDragSpringLoadState = 3;
          v11 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v8, 0);
          SBAppendSwitcherModifierResponse(v11, v5);
          v12 = objc_claimAutoreleasedReturnValue();

          v5 = (void *)v12;
        }
        else
        {
          self->_windowDragSpringLoadState = 0;
        }
        goto LABEL_10;
      case 1:
        self->_windowDragSpringLoadState = 2;
        v8 = -[SBTimerEventSwitcherEventResponse initWithDelay:validator:reason:]([SBTimerEventSwitcherEventResponse alloc], "initWithDelay:validator:reason:", 0, self->_continuousExposeSpringLoadReasonWithAppLayout, 0.4);
        SBAppendSwitcherModifierResponse(v8, v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = -[SBTimerEventSwitcherEventResponse initWithDelay:validator:reason:]([SBTimerEventSwitcherEventResponse alloc], "initWithDelay:validator:reason:", 0, CFSTR("kContinuousExposeSpringLoadBlinkingReason"), 0.0);
        SBAppendSwitcherModifierResponse(v10, v9);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
        break;
    }
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("kContinuousExposeSpringLoadBlinkingReason"))
    && self->_blinkCount <= 3)
  {
    v13 = -[SBTimerEventSwitcherEventResponse initWithDelay:validator:reason:]([SBTimerEventSwitcherEventResponse alloc], "initWithDelay:validator:reason:", 0, CFSTR("kContinuousExposeSpringLoadBlinkingReason"), 0.1);
    SBAppendSwitcherModifierResponse(v13, v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 8, 3);
    SBAppendSwitcherModifierResponse(v15, v14);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    ++self->_blinkCount;
  }

  return v5;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  SBContinuousExposeWindowDragContentSwitcherModifier *windowDragContentSwitcherModifier;
  void *v9;
  SBAppLayout *initialAppLayout;
  void *v11;
  SBInvalidateContinuousExposeIdentifiersEventResponse *v12;
  void *v13;
  void *v14;
  SBInvalidateContinuousExposeIdentifiersEventResponse *v15;
  uint64_t v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBContinuousExposeWindowDragContainerSwitcherModifier;
  -[SBSwitcherModifier handleTransitionEvent:](&v18, sel_handleTransitionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isAppLaunchDuringWindowDragGestureTransition") && objc_msgSend(v4, "phase") == 1)
  {
    -[SBContinuousExposeWindowDragContentSwitcherModifier gestureModifier](self->_windowDragContentSwitcherModifier, "gestureModifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toAppLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateProposedAppLayoutWithAppLayout:andInitialAppLayout:", v7, self->_initialAppLayout);

    windowDragContentSwitcherModifier = self->_windowDragContentSwitcherModifier;
    objc_msgSend(v4, "toAppLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBContinuousExposeWindowDragContentSwitcherModifier updateFloorModifiersWithAppLayout:](windowDragContentSwitcherModifier, "updateFloorModifiersWithAppLayout:", v9);

  }
  if (objc_msgSend(v4, "phase") == 3)
    self->_blinkCount = 0;
  if (objc_msgSend(v4, "phase") == 1)
  {
    initialAppLayout = self->_initialAppLayout;
    objc_msgSend(v4, "toAppLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(initialAppLayout) = -[SBAppLayout isEqual:](initialAppLayout, "isEqual:", v11);

    if ((initialAppLayout & 1) == 0)
    {
      v12 = [SBInvalidateContinuousExposeIdentifiersEventResponse alloc];
      objc_msgSend(v4, "fromAppLayout");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "toAppLayout");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[SBInvalidateContinuousExposeIdentifiersEventResponse initWithTransitioningFromAppLayout:transitioningToAppLayout:animated:](v12, "initWithTransitioningFromAppLayout:transitioningToAppLayout:animated:", v13, v14, 1);

      SBAppendSwitcherModifierResponse(v15, v5);
      v16 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v16;
    }
  }

  return v5;
}

- (id)handleGestureEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  SBAppLayout *v14;
  SBAppLayout *v15;
  void *v16;
  void *v17;
  NSString *v18;
  NSString *v19;
  SBTimerEventSwitcherEventResponse *v20;
  uint64_t v21;
  NSString *continuousExposeSpringLoadReasonWithAppLayout;
  SBAppLayout *springLoadTargetAppLayout;
  void *v25;
  void *v26;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SBContinuousExposeWindowDragContainerSwitcherModifier;
  -[SBSwitcherModifier handleGestureEvent:](&v27, sel_handleGestureEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBContinuousExposeWindowDragContainerSwitcherModifier appLayoutOnStage](self, "appLayoutOnStage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "containsItem:", self->_selectedDisplayItem) & 1) != 0)
  {
    self->_windowDragSpringLoadState = 0;
LABEL_12:
    self->_blinkCount = 0;
    continuousExposeSpringLoadReasonWithAppLayout = self->_continuousExposeSpringLoadReasonWithAppLayout;
    self->_continuousExposeSpringLoadReasonWithAppLayout = 0;

    springLoadTargetAppLayout = self->_springLoadTargetAppLayout;
    self->_springLoadTargetAppLayout = 0;

    goto LABEL_13;
  }
  objc_msgSend(v4, "locationInContainerView");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v4, "selectedAppLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "itemForLayoutRole:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBContinuousExposeWindowDragContainerSwitcherModifier appLayoutAtLocation:withDraggedItem:environment:](self, "appLayoutAtLocation:withDraggedItem:environment:", v12, 1, v8, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 && (objc_msgSend(v6, "isOrContainsAppLayout:", v13) & 1) == 0)
  {
    v15 = v13;
    v14 = self->_springLoadTargetAppLayout;
    self->_springLoadTargetAppLayout = v15;
  }
  else
  {
    v14 = self->_springLoadTargetAppLayout;
    self->_springLoadTargetAppLayout = 0;
  }

  if (self->_springLoadTargetAppLayout)
  {
    if (!self->_windowDragSpringLoadState)
    {
      self->_windowDragSpringLoadState = 1;
      v25 = (void *)MEMORY[0x1E0CB3940];
      -[SBAppLayout continuousExposeIdentifier](self->_springLoadTargetAppLayout, "continuousExposeIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "UUIDString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stringWithFormat:", CFSTR("kSpringLoading-%@-%@"), v26, v17);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      v19 = self->_continuousExposeSpringLoadReasonWithAppLayout;
      self->_continuousExposeSpringLoadReasonWithAppLayout = v18;

      v20 = -[SBTimerEventSwitcherEventResponse initWithDelay:validator:reason:]([SBTimerEventSwitcherEventResponse alloc], "initWithDelay:validator:reason:", 0, self->_continuousExposeSpringLoadReasonWithAppLayout, 0.8);
      SBAppendSwitcherModifierResponse(v20, v5);
      v21 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v21;
    }
  }
  else
  {
    self->_windowDragSpringLoadState = 0;
  }

  if (!self->_windowDragSpringLoadState)
    goto LABEL_12;
LABEL_13:

  return v5;
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
  v11.super_class = (Class)SBContinuousExposeWindowDragContainerSwitcherModifier;
  -[SBSwitcherModifier handleTapAppLayoutEvent:](&v11, sel_handleTapAppLayoutEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBContinuousExposeWindowDragContainerSwitcherModifier _createInterceptableTransitionRequestForActivatingAppLayout:withSelectedDisplayItem:](self, "_createInterceptableTransitionRequestForActivatingAppLayout:withSelectedDisplayItem:", v6, self->_selectedDisplayItem);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v7, 0);
    SBAppendSwitcherModifierResponse(v8, v5);
    v9 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "handleWithReason:", CFSTR("SpringLoading"));
    v5 = (void *)v9;
  }

  return v5;
}

- (id)handleTapOutsideToDismissEvent:(id)a3
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBContinuousExposeWindowDragContainerSwitcherModifier;
  v3 = a3;
  -[SBSwitcherModifier handleTapOutsideToDismissEvent:](&v6, sel_handleTapOutsideToDismissEvent_, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleWithReason:", CFSTR("In window drag"), v6.receiver, v6.super_class);

  return v4;
}

- (id)appLayoutOnStage
{
  void *v2;
  void *v3;

  -[SBContinuousExposeWindowDragContentSwitcherModifier gestureModifier](self->_windowDragContentSwitcherModifier, "gestureModifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "proposedAppLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  if (-[SBAppLayout containsItem:](self->_initialAppLayout, "containsItem:", self->_selectedDisplayItem)
    || (-[SBDisplayItem bundleIdentifier](self->_selectedDisplayItem, "bundleIdentifier"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v4, "containsObject:", v5),
        v5,
        !v6))
  {
    v10.receiver = self;
    v10.super_class = (Class)SBContinuousExposeWindowDragContainerSwitcherModifier;
    -[SBContinuousExposeWindowDragContainerSwitcherModifier adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip:](&v10, sel_adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip_, v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v4;
  }
  v8 = v7;

  return v8;
}

- (id)appLayoutsForContinuousExposeIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_super v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBContinuousExposeWindowDragContainerSwitcherModifier;
  -[SBContinuousExposeWindowDragContainerSwitcherModifier appLayoutsForContinuousExposeIdentifier:](&v13, sel_appLayoutsForContinuousExposeIdentifier_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[SBAppLayout containsItem:](self->_initialAppLayout, "containsItem:", self->_selectedDisplayItem))
  {
    -[SBContinuousExposeWindowDragContainerSwitcherModifier appLayoutOnStage](self, "appLayoutOnStage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsItem:", self->_selectedDisplayItem);

    if (v7)
    {
      -[SBContinuousExposeWindowDragContainerSwitcherModifier appLayoutOnStage](self, "appLayoutOnStage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "leafAppLayoutForItem:", self->_selectedDisplayItem);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "continuousExposeIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (BSEqualStrings())
      {
        v11 = objc_msgSend(v5, "count");

        if (v11)
        {
LABEL_7:

          goto LABEL_8;
        }
        v14[0] = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
        v10 = v5;
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_7;
    }
  }
LABEL_8:

  return v5;
}

- (double)continuousExposeStripProgress
{
  double v3;
  double v4;
  void *v5;
  _BOOL4 v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBContinuousExposeWindowDragContainerSwitcherModifier;
  -[SBContinuousExposeWindowDragContainerSwitcherModifier continuousExposeStripProgress](&v8, sel_continuousExposeStripProgress);
  v4 = v3;
  if (BSFloatIsZero())
  {
    -[SBContinuousExposeWindowDragContainerSwitcherModifier appLayoutOnStage](self, "appLayoutOnStage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "containsItem:", self->_selectedDisplayItem))
    {

    }
    else
    {
      v6 = -[SBAppLayout containsItem:](self->_initialAppLayout, "containsItem:", self->_selectedDisplayItem);

      if (v6)
        return 1.0;
    }
  }
  return v4;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBContinuousExposeWindowDragContainerSwitcherModifier;
  -[SBContinuousExposeWindowDragContainerSwitcherModifier animationAttributesForLayoutElement:](&v10, sel_animationAttributesForLayoutElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "switcherLayoutElementType")
    && (objc_msgSend(v4, "containsItem:", self->_selectedDisplayItem) & 1) == 0)
  {
    v6 = (void *)objc_msgSend(v5, "mutableCopy");
    -[SBContinuousExposeWindowDragContainerSwitcherModifier medusaSettings](self, "medusaSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resizeAnimationSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLayoutSettings:", v8);

    objc_msgSend(v6, "setUpdateMode:", 3);
    v5 = v6;
  }

  return v5;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  SBAppLayout *initialAppLayout;
  void *v8;
  BOOL v9;
  objc_super v11;

  v6 = a4;
  initialAppLayout = self->_initialAppLayout;
  objc_msgSend(v6, "itemForLayoutRole:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(initialAppLayout) = -[SBAppLayout containsItem:](initialAppLayout, "containsItem:", v8);

  if ((initialAppLayout & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBContinuousExposeWindowDragContainerSwitcherModifier;
    v9 = -[SBContinuousExposeWindowDragContainerSwitcherModifier isLayoutRoleMatchMovedToScene:inAppLayout:](&v11, sel_isLayoutRoleMatchMovedToScene_inAppLayout_, a3, v6);
  }

  return v9;
}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  SBAppLayout *initialAppLayout;
  id v7;
  void *v8;
  unsigned __int8 v9;
  BOOL v10;
  objc_super v12;
  objc_super v13;

  initialAppLayout = self->_initialAppLayout;
  v7 = a4;
  objc_msgSend(v7, "itemForLayoutRole:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(initialAppLayout) = -[SBAppLayout containsItem:](initialAppLayout, "containsItem:", v8);

  if ((_DWORD)initialAppLayout)
  {
    v13.receiver = self;
    v13.super_class = (Class)SBContinuousExposeWindowDragContainerSwitcherModifier;
    v9 = -[SBContinuousExposeWindowDragContainerSwitcherModifier isLayoutRoleContentReady:inAppLayout:](&v13, sel_isLayoutRoleContentReady_inAppLayout_, a3, v7);

    return v9 ^ 1;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBContinuousExposeWindowDragContainerSwitcherModifier;
    v10 = -[SBContinuousExposeWindowDragContainerSwitcherModifier isLayoutRoleBlurred:inAppLayout:](&v12, sel_isLayoutRoleBlurred_inAppLayout_, a3, v7);

  }
  return v10;
}

- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  double v7;
  double v8;
  SBAppLayout *initialAppLayout;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SBContinuousExposeWindowDragContainerSwitcherModifier;
  v6 = a4;
  -[SBContinuousExposeWindowDragContainerSwitcherModifier blurDelayForLayoutRole:inAppLayout:](&v15, sel_blurDelayForLayoutRole_inAppLayout_, a3, v6);
  v8 = v7;
  initialAppLayout = self->_initialAppLayout;
  objc_msgSend(v6, "itemForLayoutRole:", a3, v15.receiver, v15.super_class);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(initialAppLayout) = -[SBAppLayout containsItem:](initialAppLayout, "containsItem:", v10);
  if ((_DWORD)initialAppLayout)
  {
    -[SBContinuousExposeWindowDragContainerSwitcherModifier switcherSettings](self, "switcherSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "animationSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "resizeBlurDelay");
    v8 = v13;

  }
  return v8;
}

- (BOOL)wantsSceneResizesHostedContextForAppLayout:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if (-[SBAppLayout containsAnyItemFromAppLayout:](self->_initialAppLayout, "containsAnyItemFromAppLayout:", v4))
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBContinuousExposeWindowDragContainerSwitcherModifier;
    v5 = -[SBContinuousExposeWindowDragContainerSwitcherModifier wantsSceneResizesHostedContextForAppLayout:](&v7, sel_wantsSceneResizesHostedContextForAppLayout_, v4);
  }

  return v5;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  double v7;
  double v8;
  objc_super v10;

  v6 = a4;
  if (-[SBAppLayout isOrContainsAppLayout:](self->_springLoadTargetAppLayout, "isOrContainsAppLayout:", v6))
  {
    if ((self->_blinkCount & 1) != 0)
      v7 = 0.5;
    else
      v7 = 0.2;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SBContinuousExposeWindowDragContainerSwitcherModifier;
    -[SBContinuousExposeWindowDragContainerSwitcherModifier dimmingAlphaForLayoutRole:inAppLayout:](&v10, sel_dimmingAlphaForLayoutRole_inAppLayout_, a3, v6);
    v7 = v8;
  }

  return v7;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  void *v9;
  int v10;
  double v11;
  double v12;
  objc_super v14;

  v8 = a4;
  if (!objc_msgSend(v8, "containsItem:", self->_selectedDisplayItem)
    || self->_windowDragSpringLoadState != 1
    || (-[SBContinuousExposeWindowDragContainerSwitcherModifier appLayoutOnStage](self, "appLayoutOnStage"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "containsItem:", self->_selectedDisplayItem),
        v9,
        v11 = 0.5,
        v10))
  {
    v14.receiver = self;
    v14.super_class = (Class)SBContinuousExposeWindowDragContainerSwitcherModifier;
    -[SBContinuousExposeWindowDragContainerSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](&v14, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, v8, a5);
    v11 = v12;
  }

  return v11;
}

- (BOOL)wantsDockBehaviorAssertion
{
  -[SBContinuousExposeWindowDragContainerSwitcherModifier _dockProgressForDraggedWindow](self, "_dockProgressForDraggedWindow");
  return BSFloatLessThanFloat();
}

- (double)dockProgress
{
  double v3;
  double v4;
  double result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBContinuousExposeWindowDragContainerSwitcherModifier;
  -[SBContinuousExposeWindowDragContainerSwitcherModifier dockProgress](&v6, sel_dockProgress);
  v4 = v3;
  -[SBContinuousExposeWindowDragContainerSwitcherModifier _dockProgressForDraggedWindow](self, "_dockProgressForDraggedWindow");
  if (result >= v4)
    return v4;
  return result;
}

- (double)_dockProgressForDraggedWindow
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  CGRect v13;

  v3 = 1.0;
  if ((-[SBContinuousExposeWindowDragContainerSwitcherModifier prefersDockHidden](self, "prefersDockHidden") & 1) == 0)
  {
    if (-[SBAppLayout containsItem:](self->_initialAppLayout, "containsItem:", self->_selectedDisplayItem))
    {
      -[SBContinuousExposeWindowDragContainerSwitcherModifier containerViewBounds](self, "containerViewBounds");
      v5 = v4;
      -[SBContinuousExposeWindowDragContainerSwitcherModifier floatingDockHeight](self, "floatingDockHeight");
      v7 = v6;
      -[SBContinuousExposeWindowDragContainerSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "screenEdgePadding");
      v10 = v9;

      -[SBContinuousExposeWindowDragContainerSwitcherModifier _boundingBoxForCurrentStage](self, "_boundingBoxForCurrentStage");
      v11 = v10 + CGRectGetMaxY(v13);
      if (v11 > v5 - v7)
        return (v7 - (v5 - v7 + (v11 - (v5 - v7)) * 0.75 - (v5 - v7))) / v7;
    }
  }
  return v3;
}

- (id)topMostLayoutElements
{
  void *v3;
  void *v4;
  SBAppLayout *appLayoutContainingAppLayout;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBContinuousExposeWindowDragContainerSwitcherModifier;
  -[SBContinuousExposeWindowDragContainerSwitcherModifier topMostLayoutElements](&v8, sel_topMostLayoutElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppLayout allItems](self->_appLayoutContainingAppLayout, "allItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "count") < 2)
    goto LABEL_4;
  appLayoutContainingAppLayout = self->_appLayoutContainingAppLayout;
  -[SBContinuousExposeWindowDragContainerSwitcherModifier appLayoutOnStage](self, "appLayoutOnStage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(appLayoutContainingAppLayout) = -[SBAppLayout isOrContainsAppLayout:](appLayoutContainingAppLayout, "isOrContainsAppLayout:", v6);

  if ((appLayoutContainingAppLayout & 1) == 0)
  {
    objc_msgSend(v3, "sb_arrayByRemovingObject:", self->_appLayoutContainingAppLayout);
    v4 = v3;
    v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_4:

  }
  return v3;
}

- (id)routingModifier:(id)a3 topMostLayoutElementsByModifier:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v5, "modifiers", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v6, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObjectsFromArray:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithArray:", v7);
  objc_msgSend(v14, "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_createInterceptableTransitionRequestForActivatingAppLayout:(id)a3 withSelectedDisplayItem:(id)a4
{
  SBAppLayout *v6;
  id v7;
  void *v8;
  SBAppLayout *v9;
  void *v10;
  void *v11;
  SBAppLayout *v12;
  BOOL v13;
  SBAppLayout *v14;
  SBAppLayout *v15;
  SBAppLayout *initialAppLayout;
  SBAppLayout *v17;
  void *v18;

  v6 = (SBAppLayout *)a3;
  v7 = a4;
  -[SBContinuousExposeWindowDragContainerSwitcherModifier appLayoutOnStage](self, "appLayoutOnStage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = self->_initialAppLayout;
  -[SBContinuousExposeWindowDragContainerSwitcherModifier _appLayoutContainingDisplayItem:](self, "_appLayoutContainingDisplayItem:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[SBContinuousExposeWindowDragContentSwitcherModifier gestureModifier](self->_windowDragContentSwitcherModifier, "gestureModifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appLayoutByAddingAppLayout:toAppLayout:", v10, v6);
    v12 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v8, "containsItem:", v7)
      || (v13 = -[SBAppLayout containsItem:](v9, "containsItem:", v7), v14 = v12, !v13))
    {
      v14 = v6;
    }
    v15 = v14;
    initialAppLayout = self->_initialAppLayout;
    self->_initialAppLayout = v12;
    v17 = v12;

    +[SBSwitcherTransitionRequest requestForActivatingAppLayout:](SBMutableSwitcherTransitionRequest, "requestForActivatingAppLayout:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAppLaunchDuringWindowDragGesture:", 1);

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)_appLayoutContainingDisplayItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, void *);
  void *v14;
  id v15;

  v4 = a3;
  -[SBContinuousExposeWindowDragContainerSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __89__SBContinuousExposeWindowDragContainerSwitcherModifier__appLayoutContainingDisplayItem___block_invoke;
  v14 = &unk_1E8E9DF78;
  v6 = v4;
  v15 = v6;
  objc_msgSend(v5, "bs_firstObjectPassingTest:", &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    SBLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

    if (v9)
      NSLog(CFSTR("Expected an app layout containing item '%@'"), v6, v11, v12, v13, v14);
  }

  return v7;
}

uint64_t __89__SBContinuousExposeWindowDragContainerSwitcherModifier__appLayoutContainingDisplayItem___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsItem:", *(_QWORD *)(a1 + 32));
}

- (CGRect)_boundingBoxForCurrentStage
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  uint64_t v25;
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
  void *v40;
  _QWORD v41[5];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;
  CGRect result;

  v47 = *MEMORY[0x1E0C80C00];
  -[SBContinuousExposeWindowDragContainerSwitcherModifier appLayoutOnStage](self, "appLayoutOnStage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SBSwitcherModifier autoLayoutSpaceForAppLayout:](self, "autoLayoutSpaceForAppLayout:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v40 = v3;
    objc_msgSend(v3, "allItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v43;
      v9 = 1.79769313e308;
      v10 = -1.79769313e308;
      v11 = -1.79769313e308;
      v12 = 1.79769313e308;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v43 != v8)
            objc_enumerationMutation(v5);
          v14 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
          objc_msgSend(v4, "autoLayoutItemForDisplayItem:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "size");
          v17 = v16;
          v19 = v18;
          objc_msgSend(v15, "position");
          v21 = v20;
          v23 = v22;
          if (-[SBDisplayItem isEqual:](self->_selectedDisplayItem, "isEqual:", v14))
          {
            -[SBContinuousExposeWindowDragContainerSwitcherModifier appLayouts](self, "appLayouts");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v41[0] = MEMORY[0x1E0C809B0];
            v41[1] = 3221225472;
            v41[2] = __84__SBContinuousExposeWindowDragContainerSwitcherModifier__boundingBoxForCurrentStage__block_invoke;
            v41[3] = &unk_1E8EA4510;
            v41[4] = self;
            v25 = objc_msgSend(v24, "indexOfObjectPassingTest:", v41);

            if (v25 != 0x7FFFFFFFFFFFFFFFLL)
            {
              -[SBContinuousExposeWindowDragContainerSwitcherModifier frameForIndex:](self, "frameForIndex:", v25);
              v27 = v26;
              v29 = v28;
              v17 = v30;
              v19 = v31;
              -[SBContinuousExposeWindowDragContainerSwitcherModifier anchorPointForIndex:](self, "anchorPointForIndex:", v25);
              v34 = v29 + (0.5 - v33) * v19;
              v21 = v17 * 0.5 + v27 + (0.5 - v32) * v17;
              v23 = v19 * 0.5 + v34;
            }
          }
          if (v12 >= v21 - v17 * 0.5)
            v12 = v21 - v17 * 0.5;
          v35 = v19 * 0.5;
          if (v9 >= v23 - v19 * 0.5)
            v9 = v23 - v19 * 0.5;
          if (v11 < v21 + v17 * 0.5)
            v11 = v21 + v17 * 0.5;
          if (v10 < v23 + v35)
            v10 = v23 + v35;

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      }
      while (v7);
    }
    else
    {
      v9 = 1.79769313e308;
      v10 = -1.79769313e308;
      v11 = -1.79769313e308;
      v12 = 1.79769313e308;
    }

    v3 = v40;
  }
  else
  {
    v9 = 1.79769313e308;
    v10 = -1.79769313e308;
    v11 = -1.79769313e308;
    v12 = 1.79769313e308;
  }

  v36 = v11 - v12;
  v37 = v10 - v9;
  v38 = v12;
  v39 = v9;
  result.size.height = v37;
  result.size.width = v36;
  result.origin.y = v39;
  result.origin.x = v38;
  return result;
}

uint64_t __84__SBContinuousExposeWindowDragContainerSwitcherModifier__boundingBoxForCurrentStage__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsItem:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184));
}

- (SBAppLayout)initialAppLayout
{
  return self->_initialAppLayout;
}

- (SBDisplayItem)selectedDisplayItem
{
  return self->_selectedDisplayItem;
}

- (SBContinuousExposeWindowDragContentSwitcherModifier)windowDragContentSwitcherModifier
{
  return self->_windowDragContentSwitcherModifier;
}

- (SBContinuousExposeWindowDragSwitcherModifier)windowDragModifier
{
  return self->_windowDragModifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowDragModifier, 0);
  objc_storeStrong((id *)&self->_windowDragContentSwitcherModifier, 0);
  objc_storeStrong((id *)&self->_selectedDisplayItem, 0);
  objc_storeStrong((id *)&self->_initialAppLayout, 0);
  objc_storeStrong((id *)&self->_continuousExposeSpringLoadReasonWithAppLayout, 0);
  objc_storeStrong((id *)&self->_springLoadTargetAppLayout, 0);
  objc_storeStrong((id *)&self->_appLayoutContainingAppLayout, 0);
}

@end
