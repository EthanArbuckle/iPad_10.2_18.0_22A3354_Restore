@implementation SBGridSwitcherModifier

- (void)didMoveToParentModifier:(id)a3
{
  SBGridLayoutSwitcherModifier *v5;
  SBGridLayoutSwitcherModifier *gridLayoutModifier;
  _SBGridFloorSwitcherModifier *v7;
  _SBGridFloorSwitcherModifier *floorModifier;
  SBDefaultImplementationsSwitcherModifier *v9;
  CGSize v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBGridSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v11, sel_didMoveToParentModifier_);
  if (a3)
  {
    if (!self->_gridLayoutModifier)
    {
      v5 = -[SBGridLayoutSwitcherModifier initWithAlignment:layoutDirection:]([SBGridLayoutSwitcherModifier alloc], "initWithAlignment:layoutDirection:", 0, 0);
      gridLayoutModifier = self->_gridLayoutModifier;
      self->_gridLayoutModifier = v5;

      -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", self->_gridLayoutModifier, 0, 0);
      v7 = objc_alloc_init(_SBGridFloorSwitcherModifier);
      floorModifier = self->_floorModifier;
      self->_floorModifier = v7;

      -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", self->_floorModifier, 1, 0);
      v9 = objc_alloc_init(SBDefaultImplementationsSwitcherModifier);
      -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", v9, 2, 0);

      v10 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
      self->_containerViewBounds_lastBounds.origin = (CGPoint)*MEMORY[0x1E0C9D628];
      self->_containerViewBounds_lastBounds.size = v10;
    }
  }
}

- (id)gridLayoutModifier
{
  SBGridLayoutSwitcherModifier *gridLayoutModifier;
  void *v6;

  gridLayoutModifier = self->_gridLayoutModifier;
  if (!gridLayoutModifier)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBGridSwitcherModifier.m"), 78, CFSTR("Trying to use the grid layout modifier but it doesn't exist yet!"));

    gridLayoutModifier = self->_gridLayoutModifier;
  }
  return gridLayoutModifier;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  SBAppLayout *v5;
  SBAppLayout *activeAppLayoutInSwitcher;
  SBAppLayout *v7;
  SBAppLayout *currentAppLayout;
  void *v9;
  objc_super v11;

  v4 = a3;
  if (objc_msgSend(v4, "toEnvironmentMode") == 2)
  {
    objc_msgSend(v4, "fromAppLayout");
    v5 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
    activeAppLayoutInSwitcher = self->_activeAppLayoutInSwitcher;
    self->_activeAppLayoutInSwitcher = v5;

  }
  objc_msgSend(v4, "toAppLayout");
  v7 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
  currentAppLayout = self->_currentAppLayout;
  self->_currentAppLayout = v7;

  v11.receiver = self;
  v11.super_class = (Class)SBGridSwitcherModifier;
  -[SBSwitcherModifier handleTransitionEvent:](&v11, sel_handleTransitionEvent_, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
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
  void *v11;
  void *v12;
  SBPerformTransitionSwitcherEventResponse *v13;
  uint64_t v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBGridSwitcherModifier;
  -[SBSwitcherModifier handleRemovalEvent:](&v16, sel_handleRemovalEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "phase") == 1)
  {
    ++self->_ongoingAppLayoutRemovals;
    goto LABEL_13;
  }
  if (objc_msgSend(v4, "phase") != 2)
    goto LABEL_13;
  --self->_ongoingAppLayoutRemovals;
  -[SBGridSwitcherModifier appLayouts](self, "appLayouts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {

  }
  else
  {
    ongoingAppLayoutRemovals = self->_ongoingAppLayoutRemovals;

    if (!ongoingAppLayoutRemovals)
    {
      v10 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
      +[SBAppLayout homeScreenAppLayout](SBAppLayout, "homeScreenAppLayout");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSwitcherTransitionRequest setAppLayout:](v10, "setAppLayout:", v12);

      -[SBSwitcherTransitionRequest setAutoPIPDisabled:](v10, "setAutoPIPDisabled:", 1);
      goto LABEL_12;
    }
  }
  objc_msgSend(v4, "appLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!BSEqualObjects())
  {

    goto LABEL_13;
  }
  v9 = self->_ongoingAppLayoutRemovals;

  if (!v9)
  {
    v10 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
    +[SBAppLayout homeScreenAppLayout](SBAppLayout, "homeScreenAppLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSwitcherTransitionRequest setAppLayout:](v10, "setAppLayout:", v11);

    -[SBSwitcherTransitionRequest setUnlockedEnvironmentMode:](v10, "setUnlockedEnvironmentMode:", 2);
LABEL_12:
    v13 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v10, 0);
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v13, v5);
    v14 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v14;
  }
LABEL_13:

  return v5;
}

- (id)handleScrollEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGSize v11;
  objc_super v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SBGridSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier handleScrollEvent:](&v14, sel_handleScrollEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "phase");

  if (v6 == 1)
  {
    v11 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    self->_containerViewBounds_lastBounds.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    self->_containerViewBounds_lastBounds.size = v11;
  }
  else if (!v6)
  {
    v13.receiver = self;
    v13.super_class = (Class)SBGridSwitcherModifier;
    -[SBGridSwitcherModifier containerViewBounds](&v13, sel_containerViewBounds);
    self->_containerViewBounds_lastBounds.origin.x = v7;
    self->_containerViewBounds_lastBounds.origin.y = v8;
    self->_containerViewBounds_lastBounds.size.width = v9;
    self->_containerViewBounds_lastBounds.size.height = v10;
  }
  return v5;
}

- (id)handleSwipeToKillEvent:(id)a3
{
  id v4;
  void *v5;
  CGSize v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  objc_super v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBGridSwitcherModifier;
  -[SBSwitcherModifier handleSwipeToKillEvent:](&v13, sel_handleSwipeToKillEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isDragging") & 1) == 0
    && (objc_msgSend(v4, "progress"), BSFloatIsZero())
    && (objc_msgSend(v4, "decelerationTargetProgress"), (BSFloatIsZero() & 1) != 0))
  {
    v6 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    self->_containerViewBounds_lastBounds.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    self->_containerViewBounds_lastBounds.size = v6;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBGridSwitcherModifier;
    -[SBGridSwitcherModifier containerViewBounds](&v12, sel_containerViewBounds);
    self->_containerViewBounds_lastBounds.origin.x = v7;
    self->_containerViewBounds_lastBounds.origin.y = v8;
    self->_containerViewBounds_lastBounds.size.width = v9;
    self->_containerViewBounds_lastBounds.size.height = v10;
  }

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
  v10.super_class = (Class)SBGridSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier handleTapAppLayoutEvent:](&v10, sel_handleTapAppLayoutEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBSwitcherTransitionRequest requestForTapAppLayoutEvent:](SBMutableSwitcherTransitionRequest, "requestForTapAppLayoutEvent:", v4, v10.receiver, v10.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setRetainsSiri:", -[SBGridSwitcherModifier isSystemAssistantExperiencePersistentSiriEnabled](self, "isSystemAssistantExperiencePersistentSiriEnabled"));
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
  v11.super_class = (Class)SBGridSwitcherModifier;
  v3 = a3;
  -[SBSwitcherModifier handleTapOutsideToDismissEvent:](&v11, sel_handleTapOutsideToDismissEvent_, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isHandled", v11.receiver, v11.super_class);

  if ((v5 & 1) == 0)
  {
    v6 = [SBPerformTransitionSwitcherEventResponse alloc];
    +[SBSwitcherTransitionRequest requestForActivatingHomeScreen](SBSwitcherTransitionRequest, "requestForActivatingHomeScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:](v6, "initWithTransitionRequest:gestureInitiated:", v7, 0);

    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v8, v4);
    v9 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v9;
  }
  return v4;
}

- (CGRect)containerViewBounds
{
  CGRect *p_containerViewBounds_lastBounds;
  double x;
  double y;
  double width;
  double height;
  objc_super v8;
  CGRect result;

  p_containerViewBounds_lastBounds = &self->_containerViewBounds_lastBounds;
  if (CGRectIsNull(self->_containerViewBounds_lastBounds))
  {
    v8.receiver = self;
    v8.super_class = (Class)SBGridSwitcherModifier;
    -[SBGridSwitcherModifier containerViewBounds](&v8, sel_containerViewBounds);
  }
  else
  {
    x = p_containerViewBounds_lastBounds->origin.x;
    y = p_containerViewBounds_lastBounds->origin.y;
    width = p_containerViewBounds_lastBounds->size.width;
    height = p_containerViewBounds_lastBounds->size.height;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)topMostLayoutElements
{
  void *v3;
  SBGridLayoutSwitcherModifier *gridLayoutModifier;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  -[SBGridSwitcherModifier appLayouts](self, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  gridLayoutModifier = self->_gridLayoutModifier;
  -[SBGridSwitcherModifier scrollViewContentOffset](self, "scrollViewContentOffset");
  v5 = -[SBGridLayoutSwitcherModifier visibleAppLayoutRangeForContentOffset:](gridLayoutModifier, "visibleAppLayoutRangeForContentOffset:");
  objc_msgSend(v3, "subarrayWithRange:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)foregroundAppLayouts
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBGridSwitcherModifier;
  -[SBGridSwitcherModifier foregroundAppLayouts](&v3, sel_foregroundAppLayouts);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (char)jetsamModeForAppLayout:(id)a3
{
  objc_super v4;

  if (self->_activeAppLayoutInSwitcher == a3)
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)SBGridSwitcherModifier;
  return -[SBGridSwitcherModifier jetsamModeForAppLayout:](&v4, sel_jetsamModeForAppLayout_);
}

- (char)activityModeForAppLayout:(id)a3
{
  objc_super v4;

  if (self->_activeAppLayoutInSwitcher == a3)
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)SBGridSwitcherModifier;
  return -[SBGridSwitcherModifier activityModeForAppLayout:](&v4, sel_activityModeForAppLayout_);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeAppLayoutInSwitcher, 0);
  objc_storeStrong((id *)&self->_currentAppLayout, 0);
  objc_storeStrong((id *)&self->_floorModifier, 0);
  objc_storeStrong((id *)&self->_gridLayoutModifier, 0);
}

@end
