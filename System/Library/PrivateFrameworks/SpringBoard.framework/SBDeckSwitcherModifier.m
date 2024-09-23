@implementation SBDeckSwitcherModifier

- (double)minimumTranslationToKillIndex:(unint64_t)a3
{
  CGRect v6;

  -[SBDeckSwitcherModifier frameForIndex:](self, "frameForIndex:");
  -[SBDeckSwitcherModifier scaleForIndex:](self, "scaleForIndex:", a3);
  SBTransformedRectWithScale();
  return CGRectGetMinY(v6);
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  double v17;
  CGFloat v18;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect result;

  -[SBDeckSwitcherModifier _scrollProgress](self, "_scrollProgress");
  v7 = v6;
  -[SBDeckSwitcherModifier _frameForIndex:displayItemsCount:scrollProgress:ignoringScrollOffset:](self, "_frameForIndex:displayItemsCount:scrollProgress:ignoringScrollOffset:", a3, -[SBDeckSwitcherModifier numberOfItems](self, "numberOfItems"), 1, v6);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[SBDeckSwitcherModifier switcherSettings](self, "switcherSettings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "switcherCenterYOffsetPercentOfScreenHeight");

  -[SBDeckSwitcherModifier containerViewBounds](self, "containerViewBounds");
  -[SBDeckSwitcherModifier screenScale](self, "screenScale");
  BSFloatRoundForScale();
  v18 = v17;
  v37.origin.x = v9;
  v37.origin.y = v11;
  v37.size.width = v13;
  v37.size.height = v15;
  v38 = CGRectOffset(v37, 0.0, v18);
  x = v38.origin.x;
  y = v38.origin.y;
  width = v38.size.width;
  height = v38.size.height;
  if ((UIRectIsDiscrete() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v39.origin.x = x;
    v39.origin.y = y;
    v39.size.width = width;
    v39.size.height = height;
    NSStringFromCGRect(v39);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDeckSwitcherModifier containerViewBounds](self, "containerViewBounds");
    NSStringFromCGRect(v40);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[SBDeckSwitcherModifier numberOfItems](self, "numberOfItems");
    -[SBDeckSwitcherModifier scrollViewContentOffset](self, "scrollViewContentOffset");
    v35 = v34;
    -[SBDeckSwitcherModifier scrollRange](self, "scrollRange");
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDeckSwitcherModifier.m"), 230, CFSTR("Deck switcher computed an invalid frame:%@ based on containerFrame:%@ scrollProgress:%.2f index:%lu numItems:%lu scrollViewXoffset: %.2f scrollRange :%.2f"), v31, v32, *(_QWORD *)&v7, a3, v33, v35, v36);

  }
  -[SBDeckSwitcherModifier screenScale](self, "screenScale");
  BSFloatRoundForScale();
  v24 = v23;
  BSFloatRoundForScale();
  v26 = v25;
  v27 = v24;
  v28 = width;
  v29 = height;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v26;
  result.origin.x = v27;
  return result;
}

- (CGRect)_frameForIndex:(unint64_t)a3 displayItemsCount:(unint64_t)a4 scrollProgress:(double)a5 ignoringScrollOffset:(BOOL)a6
{
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  -[SBDeckSwitcherModifier containerViewBounds](self, "containerViewBounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = -[SBDeckSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
  -[SBDeckSwitcherModifier leadingOffsetForIndex:displayItemsCount:scrollProgress:](self, "leadingOffsetForIndex:displayItemsCount:scrollProgress:", a3, a4, a5);
  if (v17)
    v18 = -v18;
  if (!a6)
    -[SBDeckSwitcherModifier _counteractScrollingForOffset:scrollProgress:](self, "_counteractScrollingForOffset:scrollProgress:", v18, a5);
  v19 = v12;
  v20 = v14;
  v21 = v16;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (double)leadingOffsetForIndex:(unint64_t)a3 displayItemsCount:(unint64_t)a4 scrollProgress:(double)a5
{
  double Width;
  double v10;
  double v11;
  long double v12;
  double v13;
  long double v14;
  double v15;
  double v16;
  int v17;
  double v18;
  double v19;
  CGRect v21;

  -[SBDeckSwitcherModifier containerViewBounds](self, "containerViewBounds");
  Width = CGRectGetWidth(v21);
  -[SBDeckSwitcherModifier depthForIndex:displayItemsCount:scrollProgress:](self, "depthForIndex:displayItemsCount:scrollProgress:", a3, a4, a5);
  v10 = *(double *)&kExponentialLayoutTranslation;
  v12 = v10 + Width * exp(v11 * *(double *)&kExponentialLayoutCurveExponent);
  -[SBDeckSwitcherModifier _switcherCardScale](self, "_switcherCardScale");
  v14 = v12 + Width * ((1.0 - v13) * -0.5);
  -[SBDeckSwitcherModifier _switcherCardScale](self, "_switcherCardScale");
  v16 = v14 / v15;
  -[SBDeckSwitcherModifier scrollRange](self, "scrollRange");
  if (BSFloatIsZero())
  {
    -[SBDeckSwitcherModifier _scrollProgress](self, "_scrollProgress");
    if (BSFloatEqualToFloat())
    {
      v17 = -[SBDeckSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
      -[SBDeckSwitcherModifier scrollViewContentOffset](self, "scrollViewContentOffset");
      if (v17)
        v18 = -v18;
      v16 = v16 - v18;
    }
  }
  -[SBDeckSwitcherModifier scaleForIndex:](self, "scaleForIndex:", a3);
  return v16 * v19;
}

- (double)_scrollProgress
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  int v8;
  double result;

  -[SBDeckSwitcherModifier scrollRange](self, "scrollRange");
  v4 = v3;
  -[SBDeckSwitcherModifier scrollViewContentOffset](self, "scrollViewContentOffset");
  v6 = v5;
  if (BSFloatIsZero())
    v7 = 0.0;
  else
    v7 = v6 / v4;
  v8 = -[SBDeckSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
  result = 1.0 - v7;
  if (v8)
    return v7;
  return result;
}

- (double)depthForIndex:(unint64_t)a3 displayItemsCount:(unint64_t)a4 scrollProgress:(double)a5
{
  double v7;
  double v8;

  v7 = -(*(double *)&kDepthPadding - (double)a4 * *(double *)&kDepthPadding);
  -[SBDeckSwitcherModifier _scrollMin](self, "_scrollMin");
  return v8 + v7 * a5 - *(double *)&kDepthPadding * (double)a3;
}

- (double)_scrollMin
{
  double Width;
  double v4;
  CGRect v6;

  -[SBDeckSwitcherModifier containerViewBounds](self, "containerViewBounds");
  Width = CGRectGetWidth(v6);
  -[SBDeckSwitcherModifier _switcherCardScale](self, "_switcherCardScale");
  return log(-(*(double *)&kExponentialLayoutTranslation - Width * ((1.0 - v4) * 0.5)) / Width)
       / *(double *)&kExponentialLayoutCurveExponent;
}

- (double)scaleForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;

  -[SBDeckSwitcherModifier _scrollProgress](self, "_scrollProgress");
  -[SBDeckSwitcherModifier _scaleForTransformForIndex:scrollProgress:](self, "_scaleForTransformForIndex:scrollProgress:", a3);
  v6 = v5;
  -[SBDeckSwitcherModifier _switcherCardScale](self, "_switcherCardScale");
  return v6 * v7;
}

- (double)_scaleForTransformForIndex:(unint64_t)a3 scrollProgress:(double)a4
{
  double v4;

  -[SBDeckSwitcherModifier depthForIndex:displayItemsCount:scrollProgress:](self, "depthForIndex:displayItemsCount:scrollProgress:", a3, -[SBDeckSwitcherModifier numberOfItems](self, "numberOfItems"), a4);
  return v4 * 0.12 + 1.0;
}

- (double)_switcherCardScale
{
  void *v2;
  double v3;
  double v4;

  -[SBDeckSwitcherModifier switcherSettings](self, "switcherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deckSwitcherPageScale");
  v4 = v3;

  return v4;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  SBAppLayout *v5;
  SBAppLayout *currentAppLayout;
  void *v7;
  objc_super v9;

  v4 = a3;
  if (objc_msgSend(v4, "toEnvironmentMode") == 2 && objc_msgSend(v4, "fromEnvironmentMode") != 2)
  {
    self->_previousContentOffset = (CGPoint)SBInvalidPoint;
    self->_isScrollingForward = 1;
  }
  objc_msgSend(v4, "toAppLayout");
  v5 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
  currentAppLayout = self->_currentAppLayout;
  self->_currentAppLayout = v5;

  v9.receiver = self;
  v9.super_class = (Class)SBDeckSwitcherModifier;
  -[SBSwitcherModifier handleTransitionEvent:](&v9, sel_handleTransitionEvent_, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (double)scrollRange
{
  double v3;
  double v4;
  double v5;

  -[SBDeckSwitcherModifier _contentSize](self, "_contentSize");
  v4 = v3;
  -[SBDeckSwitcherModifier containerViewBounds](self, "containerViewBounds");
  return v4 - v5;
}

- (CGSize)_contentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[SBDeckSwitcherModifier containerViewBounds](self, "containerViewBounds");
  v4 = v3;
  v6 = v5 * (double)-[SBDeckSwitcherModifier numberOfItems](self, "numberOfItems");
  v7 = v4;
  result.height = v7;
  result.width = v6;
  return result;
}

- (unint64_t)numberOfItems
{
  void *v2;
  unint64_t v3;

  -[SBDeckSwitcherModifier appLayouts](self, "appLayouts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (unint64_t)activeCornersForTouchResizeForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (id)scrollViewAttributes
{
  SBMutableSwitcherScrollViewAttributes *v3;

  v3 = objc_alloc_init(SBMutableSwitcherScrollViewAttributes);
  -[SBSwitcherScrollViewAttributes setDecelerationRate:](v3, "setDecelerationRate:", *(double *)&kDecelerationFactor);
  -[SBSwitcherScrollViewAttributes setScrollViewPagingEnabled:](v3, "setScrollViewPagingEnabled:", 0);
  -[SBSwitcherScrollViewAttributes setInterpageSpacingForPaging:](v3, "setInterpageSpacingForPaging:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  -[SBSwitcherScrollViewAttributes setPagingOrigin:](v3, "setPagingOrigin:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  -[SBSwitcherScrollViewAttributes setInterpolatesDuringSwipeToKill:](v3, "setInterpolatesDuringSwipeToKill:", 1);
  -[SBDeckSwitcherModifier _contentSize](self, "_contentSize");
  -[SBSwitcherScrollViewAttributes setContentSize:](v3, "setContentSize:");
  return v3;
}

- (SBDeckSwitcherModifier)init
{
  SBDeckSwitcherModifier *v2;
  SBDeckSwitcherModifier *v3;
  SBDefaultImplementationsSwitcherModifier *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBDeckSwitcherModifier;
  v2 = -[SBSwitcherModifier init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_grabbedDraggingIndex = 0x7FFFFFFFFFFFFFFFLL;
    v4 = objc_alloc_init(SBDefaultImplementationsSwitcherModifier);
    -[SBChainableModifier addChildModifier:](v3, "addChildModifier:", v4);

  }
  return v3;
}

- (void)didMoveToParentModifier:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBDeckSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v5, sel_didMoveToParentModifier_);
  if (a3)
    -[SBDeckSwitcherModifier _applyPrototypeSettings](self, "_applyPrototypeSettings");
}

- (id)handleSwitcherSettingsChangedEvent:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  -[SBDeckSwitcherModifier _applyPrototypeSettings](self, "_applyPrototypeSettings");
  v7.receiver = self;
  v7.super_class = (Class)SBDeckSwitcherModifier;
  -[SBSwitcherModifier handleSwitcherSettingsChangedEvent:](&v7, sel_handleSwitcherSettingsChangedEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
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
  v16.super_class = (Class)SBDeckSwitcherModifier;
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
  -[SBDeckSwitcherModifier appLayouts](self, "appLayouts");
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

- (id)handleTapAppLayoutEvent:(id)a3
{
  id v4;
  void *v5;
  SBPerformTransitionSwitcherEventResponse *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  +[SBSwitcherTransitionRequest requestForTapAppLayoutEvent:](SBMutableSwitcherTransitionRequest, "requestForTapAppLayoutEvent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRetainsSiri:", -[SBDeckSwitcherModifier isSystemAssistantExperiencePersistentSiriEnabled](self, "isSystemAssistantExperiencePersistentSiriEnabled"));
  v6 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v5, 0);
  v10.receiver = self;
  v10.super_class = (Class)SBDeckSwitcherModifier;
  -[SBSwitcherModifier handleTapAppLayoutEvent:](&v10, sel_handleTapAppLayoutEvent_, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v6, v7);
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
  v11.super_class = (Class)SBDeckSwitcherModifier;
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
  v11.super_class = (Class)SBDeckSwitcherModifier;
  -[SBSwitcherModifier handleScrollEvent:](&v11, sel_handleScrollEvent_, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
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

  -[SBDeckSwitcherModifier scrollViewContentOffset](self, "scrollViewContentOffset");
  v3 = -[SBDeckSwitcherModifier _visibleAppLayoutRangeForContentOffset:](self, "_visibleAppLayoutRangeForContentOffset:");
  v5 = v4;
  v6 = (void *)MEMORY[0x1E0C99E60];
  -[SBDeckSwitcherModifier appLayouts](self, "appLayouts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subarrayWithRange:", v3, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isHomeAffordanceSupportedForAppLayout:(id)a3
{
  void *v3;
  char v4;

  -[SBDeckSwitcherModifier homeGrabberSettings](self, "homeGrabberSettings", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEnabled");

  return v4;
}

- (id)visibleHomeAffordanceLayoutElements
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (BOOL)isResizeGrabberVisibleForAppLayout:(id)a3
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
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  BOOL v23;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  -[SBDeckSwitcherModifier switcherSettings](self, "switcherSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "switcherCardShadowRadius");
  v7 = v6;
  objc_msgSend(v5, "deckSwitcherPageScale");
  v9 = v7 / v8;
  -[SBDeckSwitcherModifier scaleForIndex:](self, "scaleForIndex:", a3);
  v11 = v9 * v10;
  -[SBDeckSwitcherModifier containerViewBounds](self, "containerViewBounds");
  v26 = CGRectInset(v25, v11 * -2.8, v11 * -2.8);
  x = v26.origin.x;
  y = v26.origin.y;
  width = v26.size.width;
  height = v26.size.height;
  -[SBDeckSwitcherModifier _scrollProgress](self, "_scrollProgress");
  v17 = v16;
  -[SBDeckSwitcherModifier frameForIndex:](self, "frameForIndex:", a3);
  -[SBDeckSwitcherModifier _scaleTransformedFrameForIndex:withUntransformedFrame:scrollProgress:](self, "_scaleTransformedFrameForIndex:withUntransformedFrame:scrollProgress:", a3);
  v28.origin.x = v18;
  v28.origin.y = v19;
  v28.size.width = v20;
  v28.size.height = v21;
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  if (CGRectIntersectsRect(v27, v28))
  {
    -[SBDeckSwitcherModifier opacityForIndex:scrollProgress:](self, "opacityForIndex:scrollProgress:", a3, v17);
    v23 = v22 > 0.01;
  }
  else
  {
    v23 = 0;
  }

  return v23;
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

  -[SBDeckSwitcherModifier switcherSettings](self, "switcherSettings", a3);
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

- (BOOL)clipsToUnobscuredMarginAtIndex:(unint64_t)a3
{
  return a3 != 0;
}

- (double)visibleMarginForItemContainerAtIndex:(unint64_t)a3
{
  double x;
  CGFloat y;
  double width;
  CGFloat height;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  int v19;
  double v20;
  double v21;
  CGRect v23;
  CGRect v24;

  -[SBDeckSwitcherModifier frameForIndex:](self, "frameForIndex:");
  x = v23.origin.x;
  y = v23.origin.y;
  width = v23.size.width;
  height = v23.size.height;
  v9 = CGRectGetWidth(v23);
  if (-[SBDeckSwitcherModifier clipsToUnobscuredMarginAtIndex:](self, "clipsToUnobscuredMarginAtIndex:", a3))
  {
    v10 = 1;
    while (!-[SBDeckSwitcherModifier _priorIndex:fullyObscuresCardForIndex:](self, "_priorIndex:fullyObscuresCardForIndex:", v10, a3))
    {
      if (++v10 == 5)
        goto LABEL_9;
    }
    -[SBDeckSwitcherModifier _cardCornerRadiusInSwitcher](self, "_cardCornerRadiusInSwitcher");
    v12 = v11;
    -[SBDeckSwitcherModifier scaleForIndex:](self, "scaleForIndex:", a3);
    v14 = v13;
    -[SBDeckSwitcherModifier frameForIndex:](self, "frameForIndex:", a3 - v10);
    v16 = v15;
    v18 = v17;
    v19 = -[SBDeckSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
    v20 = x + width - (v16 + v18);
    if (!v19)
      v20 = v16 - x;
    v9 = (v12 + v20) / v14;
LABEL_9:
    v24.origin.x = x;
    v24.origin.y = y;
    v24.size.width = width;
    v24.size.height = height;
    v21 = CGRectGetWidth(v24);
    if (v9 >= v21)
      return v21;
  }
  return v9;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  double result;

  -[SBDeckSwitcherModifier _scrollProgress](self, "_scrollProgress", a3, a4);
  -[SBDeckSwitcherModifier opacityForIndex:scrollProgress:](self, "opacityForIndex:scrollProgress:", a5);
  return result;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  double result;

  v5 = a4;
  -[SBDeckSwitcherModifier appLayouts](self, "appLayouts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObject:", v5);

  if (!v7)
    return 0.0;
  -[SBDeckSwitcherModifier _scrollProgress](self, "_scrollProgress");
  -[SBDeckSwitcherModifier _valueAlongDepthCurveForIndex:scrollProgress:aCoefficient:bCoefficient:](self, "_valueAlongDepthCurveForIndex:scrollProgress:aCoefficient:bCoefficient:", v7);
  return result;
}

- (double)wallpaperOverlayAlphaForIndex:(unint64_t)a3
{
  double result;

  if (!a3)
    return 0.0;
  -[SBDeckSwitcherModifier _scrollProgress](self, "_scrollProgress");
  -[SBDeckSwitcherModifier _valueAlongDepthCurveForIndex:scrollProgress:aCoefficient:bCoefficient:](self, "_valueAlongDepthCurveForIndex:scrollProgress:aCoefficient:bCoefficient:", a3);
  return result;
}

- (double)lighteningAlphaForIndex:(unint64_t)a3
{
  unint64_t v5;
  double v6;

  v5 = -[SBDeckSwitcherModifier numberOfItems](self, "numberOfItems");
  -[SBDeckSwitcherModifier _scrollProgress](self, "_scrollProgress");
  -[SBDeckSwitcherModifier depthForIndex:displayItemsCount:scrollProgress:](self, "depthForIndex:displayItemsCount:scrollProgress:", a3, v5);
  return fmin(fmax((v6 + 0.144) * 0.75, 0.0), 1.0);
}

- (int64_t)headerStyleForIndex:(unint64_t)a3
{
  return 0;
}

- (double)titleAndIconOpacityForIndex:(unint64_t)a3
{
  double v5;

  -[SBDeckSwitcherModifier _scrollProgress](self, "_scrollProgress");
  -[SBDeckSwitcherModifier _valueAlongDepthCurveForIndex:scrollProgress:aCoefficient:bCoefficient:](self, "_valueAlongDepthCurveForIndex:scrollProgress:aCoefficient:bCoefficient:", a3);
  return 1.0 - v5;
}

- (double)titleOpacityForIndex:(unint64_t)a3
{
  double result;

  -[SBDeckSwitcherModifier _scrollProgress](self, "_scrollProgress");
  -[SBDeckSwitcherModifier titleOpacityForIndex:scrollProgress:](self, "titleOpacityForIndex:scrollProgress:", a3);
  return result;
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

  -[SBDeckSwitcherModifier _unscaledCardCornerRadius](self, "_unscaledCardCornerRadius", a3);
  SBRectCornerRadiiForRadius();
  result.topRight = v6;
  result.bottomRight = v5;
  result.bottomLeft = v4;
  result.topLeft = v3;
  return result;
}

- (double)homeScreenAlpha
{
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  if (-[SBDeckSwitcherModifier isShowingSpotlightOrTodayView](self, "isShowingSpotlightOrTodayView"))
    v3 = 1;
  else
    v3 = 2;
  -[SBDeckSwitcherModifier switcherSettings](self, "switcherSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "animationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homeScreenAlphaForMode:", v3);
  v7 = v6;

  return v7;
}

- (double)homeScreenScale
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[SBDeckSwitcherModifier switcherSettings](self, "switcherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "animationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeScreenScaleForMode:", 2);
  v5 = v4;

  return v5;
}

- (double)wallpaperScale
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[SBDeckSwitcherModifier switcherSettings](self, "switcherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "animationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wallpaperScaleForMode:", 2);
  v5 = v4;

  return v5;
}

- (double)homeScreenDimmingAlpha
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[SBDeckSwitcherModifier switcherSettings](self, "switcherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "animationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeScreenDimmingAlphaForMode:", 2);
  v5 = v4;

  return v5;
}

- (int64_t)homeScreenBackdropBlurType
{
  return 2;
}

- (double)homeScreenBackdropBlurProgress
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[SBDeckSwitcherModifier switcherSettings](self, "switcherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "animationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeScreenBlurProgressForMode:", 2);
  v5 = v4;

  return v5;
}

- (BOOL)shouldAllowGroupOpacityForAppLayout:(id)a3
{
  return 0;
}

- (BOOL)wantsSwitcherBackdropBlur
{
  return 0;
}

- (int64_t)switcherBackdropBlurType
{
  return 1;
}

- (double)switcherBackdropBlurProgress
{
  return 0.0;
}

- (BOOL)wantsSwitcherDimmingView
{
  return 0;
}

- (double)switcherDimmingAlpha
{
  return 0.0;
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
  return 0;
}

- (BOOL)canSelectLeafWithModifierKeysInAppLayout:(id)a3
{
  return 0;
}

- (BOOL)isFocusEnabledForAppLayout:(id)a3
{
  return 0;
}

- (id)neighboringAppLayoutsForFocusedAppLayout:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set", a3);
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
  return 1;
}

- (BOOL)isScrollEnabled
{
  return 1;
}

- (BOOL)isContainerStatusBarVisible
{
  return 0;
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
  return 1;
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

  -[SBDeckSwitcherModifier scrollViewContentOffset](self, "scrollViewContentOffset");
  v3 = -[SBDeckSwitcherModifier _visibleAppLayoutRangeForContentOffset:](self, "_visibleAppLayoutRangeForContentOffset:");
  v5 = v4;
  -[SBDeckSwitcherModifier switcherSettings](self, "switcherSettings");
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

  -[SBDeckSwitcherModifier appLayouts](self, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = -[SBDeckSwitcherModifier isReduceMotionEnabled](self, "isReduceMotionEnabled");

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
  return -[SBDeckSwitcherModifier _isIndexVisible:](self, "_isIndexVisible:", a4);
}

- (BOOL)shouldBringCardToFrontDuringInsertionOrRemoval
{
  return 0;
}

- (unint64_t)indexToScrollToAfterInsertingAtIndex:(unint64_t)a3
{
  unint64_t result;
  unint64_t v5;

  result = -[SBDeckSwitcherModifier _indexOfCurrentCenteredCard](self, "_indexOfCurrentCenteredCard");
  if (result < a3)
    v5 = result;
  else
    v5 = result + 1;
  if (result != 0x7FFFFFFFFFFFFFFFLL)
    return v5;
  return result;
}

- (unint64_t)indexToScrollToAfterRemovingIndex:(unint64_t)a3
{
  unint64_t v5;
  void *v6;
  unint64_t v7;

  v5 = -[SBDeckSwitcherModifier _indexOfCurrentCenteredCard](self, "_indexOfCurrentCenteredCard");
  if (!-[SBDeckSwitcherModifier _isIndexVisible:](self, "_isIndexVisible:", a3))
    return 0x7FFFFFFFFFFFFFFFLL;
  -[SBDeckSwitcherModifier appLayouts](self, "appLayouts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!-[SBDeckSwitcherModifier _directionForRemovingIndex:centeredIndex:](self, "_directionForRemovingIndex:centeredIndex:", a3, v5))
  {
    if (!a3)
    {
      if (v5 <= 1)
        v5 = 1;
      if (v7 <= 1)
        return 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_13;
    }
    if (v5 != a3)
      goto LABEL_13;
    goto LABEL_8;
  }
  if (v7 - 1 != a3)
  {
LABEL_8:
    v5 = a3 + 1;
    if (a3 + 1 >= v7)
      return 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_13;
  }
  if (v7 < 2)
    return 0x7FFFFFFFFFFFFFFFLL;
  v5 -= v5 == a3;
LABEL_13:
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    return 0x7FFFFFFFFFFFFFFFLL;
  return -[SBDeckSwitcherModifier _newIndexOfItemAtIndex:afterRemovingItemAtIndex:](self, "_newIndexOfItemAtIndex:afterRemovingItemAtIndex:", v5, a3);
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
  return 0;
}

- (double)dockProgress
{
  return 1.0;
}

- (int64_t)dockUpdateMode
{
  return 2;
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
  -[SBDeckSwitcherModifier appLayouts](self, "appLayouts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithObject:forKey:", v5, &unk_1E91D1F88);
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

- (BOOL)wantsSlideOverTongue
{
  return 0;
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
  void *v4;
  void *v5;
  double v7;
  double v8;
  int v9;
  double result;
  uint64_t v11;
  uint64_t v12;
  int v13;
  char v14;
  int v15;
  char v16;
  double v17;
  BOOL v18;

  -[SBDeckSwitcherModifier _switcherCardScale](self, "_switcherCardScale", a3, a4);
  v8 = v7;
  if (__sb__runningInSpringBoard())
  {
    v9 = SBFEffectiveDeviceClass();
    result = 0.5;
    if (v9 == 2)
      return result;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v4, "userInterfaceIdiom");

    result = 0.5;
    if (v11 == 1)
      return result;
  }
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1
      || SBFEffectiveHomeButtonType() != 2)
    {
      goto LABEL_14;
    }
LABEL_13:
    -[SBDeckSwitcherModifier _switcherCardScale](self, "_switcherCardScale");
    return result;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "userInterfaceIdiom"))
  {

    goto LABEL_14;
  }
  v12 = SBFEffectiveHomeButtonType();

  if (v12 == 2)
    goto LABEL_13;
LABEL_14:
  v13 = __sb__runningInSpringBoard();
  v14 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "userInterfaceIdiom"))
      goto LABEL_21;

    return v8;
  }
  if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    return v8;
LABEL_21:
  v15 = __sb__runningInSpringBoard();
  v16 = v15;
  if (v15)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v18 = v17 >= *(double *)(MEMORY[0x1E0DAB260] + 56);
  if ((v16 & 1) == 0)

  if ((v14 & 1) == 0)
  result = v8;
  if (v18)
    return 0.5;
  return result;
}

- (double)_cardCornerRadiusInSwitcher
{
  double v3;
  double v4;
  double v5;

  -[SBDeckSwitcherModifier _unscaledCardCornerRadius](self, "_unscaledCardCornerRadius");
  v4 = v3;
  -[SBDeckSwitcherModifier _switcherCardScale](self, "_switcherCardScale");
  return v4 * v5;
}

- (CGPoint)contentOffsetForIndex:(unint64_t)a3 alignment:(int64_t)a4
{
  double v5;
  double v6;
  CGPoint result;

  -[SBDeckSwitcherModifier scrollProgressForIndex:](self, "scrollProgressForIndex:", a3, a4);
  -[SBDeckSwitcherModifier _contentOffsetForScrollProgress:](self, "_contentOffsetForScrollProgress:");
  result.y = v6;
  result.x = v5;
  return result;
}

- (CGPoint)restingOffsetForScrollOffset:(CGPoint)a3 velocity:(CGPoint)a4
{
  double v5;
  double v6;
  CGPoint result;

  -[SBDeckSwitcherModifier _scrollProgressForContentOffset:](self, "_scrollProgressForContentOffset:", a3.x, a3.y);
  -[SBDeckSwitcherModifier _restingScrollProgressForProgress:velocity:](self, "_restingScrollProgressForProgress:velocity:");
  -[SBDeckSwitcherModifier _contentOffsetForScrollProgress:](self, "_contentOffsetForScrollProgress:");
  result.y = v6;
  result.x = v5;
  return result;
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

  -[SBDeckSwitcherModifier switcherSettings](self, "switcherSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "switcherCardShadowRadius");
  v7 = v6;
  objc_msgSend(v5, "deckSwitcherPageScale");
  v9 = v7 / v8;
  -[SBDeckSwitcherModifier scaleForIndex:](self, "scaleForIndex:", a3);
  -[SBSwitcherModifier distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch:numberOfRows:padding:layoutDirection:](self, "distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch:numberOfRows:padding:layoutDirection:", a3, 1, 0, v9 * v10 * 2.8);
  v12 = v11;

  return v12;
}

- (CGPoint)adjustedOffsetForOffset:(CGPoint)a3 translation:(CGPoint)a4 startPoint:(CGPoint)a5 locationInView:(CGPoint)a6 horizontalVelocity:(double *)a7 verticalVelocity:(double *)a8
{
  double y;
  double x;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v20;
  double v21;
  double v22;
  double v23;
  int64_t v24;
  int64_t grabbedDraggingIndex;
  CGPoint *p_start;
  CGPoint *p_originalLocationInView;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  CGFloat v32;
  double v33;
  double v34;
  double outputContentOffsetAdjustmentForIndexChange;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  CGPoint result;

  y = a6.y;
  x = a6.x;
  v12 = a5.y;
  v13 = a5.x;
  v14 = a4.y;
  v15 = a4.x;
  v16 = a3.y;
  v17 = a3.x;
  if (a7)
  {
    if (a8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDeckSwitcherModifier.m"), 908, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("hv != nil"));

    if (a8)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDeckSwitcherModifier.m"), 909, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("vv != nil"));

LABEL_3:
  if (-[SBDeckSwitcherModifier numberOfItems](self, "numberOfItems") >= 2)
  {
    -[SBDeckSwitcherModifier scrollableQueryModifier:convertScrollViewPointToContainerViewCoordinateSpace:](self, "scrollableQueryModifier:convertScrollViewPointToContainerViewCoordinateSpace:", self, x, y);
    v22 = v20;
    v23 = v21;
    if (self->_grabbedDraggingIndex == 0x7FFFFFFFFFFFFFFFLL)
    {
      self->_grabbedDraggingIndex = -[SBDeckSwitcherModifier _topIndexForLocationInContainerCoordinateSpace:](self, "_topIndexForLocationInContainerCoordinateSpace:", v20, v21);
      self->_outputContentOffsetAdjustmentForIndexChange = 0.0;
      self->_inputContentOffsetAdjustmentForIndexChange = 0.0;
      self->_start.x = v13;
      self->_start.y = v12;
      self->_originalLocationInView.x = v22 - v15;
      self->_originalLocationInView.y = v23 - v14;
      self->_initialTranslationAdjustment = v13 - v17;
    }
    v24 = -[SBDeckSwitcherModifier _topIndexForLocationInContainerCoordinateSpace:](self, "_topIndexForLocationInContainerCoordinateSpace:", v22, v23);
    if (self->_grabbedDraggingIndex == 0x7FFFFFFFFFFFFFFFLL)
      grabbedDraggingIndex = 0;
    else
      grabbedDraggingIndex = self->_grabbedDraggingIndex;
    p_start = &self->_start;
    p_originalLocationInView = &self->_originalLocationInView;
    -[SBDeckSwitcherModifier _adjustedOffsetForIndex:offset:start:originalLocationInView:locationInView:](self, "_adjustedOffsetForIndex:offset:start:originalLocationInView:locationInView:", grabbedDraggingIndex, v17, v16, self->_start.x, self->_start.y, self->_originalLocationInView.x, self->_originalLocationInView.y, v22, v23);
    v30 = v29;
    if (v24 >= grabbedDraggingIndex)
    {
      outputContentOffsetAdjustmentForIndexChange = self->_outputContentOffsetAdjustmentForIndexChange;
      v16 = v28;
    }
    else
    {
      self->_grabbedDraggingIndex = v24;
      -[SBDeckSwitcherModifier scrollViewContentOffset](self, "scrollViewContentOffset");
      p_start->x = v31;
      self->_start.y = v32;
      p_originalLocationInView->x = v22;
      self->_originalLocationInView.y = v23;
      self->_inputContentOffsetAdjustmentForIndexChange = p_start->x - v17;
      -[SBDeckSwitcherModifier _adjustedOffsetForIndex:offset:start:originalLocationInView:locationInView:](self, "_adjustedOffsetForIndex:offset:start:originalLocationInView:locationInView:", v24, v17, v16, p_start->x, self->_start.y, p_originalLocationInView->x, self->_originalLocationInView.y, v22, v23);
      v16 = v33;
      outputContentOffsetAdjustmentForIndexChange = self->_outputContentOffsetAdjustmentForIndexChange + v34 - v30;
      self->_outputContentOffsetAdjustmentForIndexChange = outputContentOffsetAdjustmentForIndexChange;
      v30 = v34;
    }
    v17 = v30 - outputContentOffsetAdjustmentForIndexChange;
    -[SBDeckSwitcherModifier scrollableQueryModifier:contentOffsetVelocityConsideringNextContentOffset:](self, "scrollableQueryModifier:contentOffsetVelocityConsideringNextContentOffset:", self, v30 - outputContentOffsetAdjustmentForIndexChange, v16);
    if (a7 && v36 * *a7 > 0.0)
      *a7 = v36;
    if (a8 && v37 * *a8 > 0.0)
      *a8 = v37;
  }
  v38 = v17;
  v39 = v16;
  result.y = v39;
  result.x = v38;
  return result;
}

- (void)resetAdjustedScrollingState
{
  self->_grabbedDraggingIndex = 0x7FFFFFFFFFFFFFFFLL;
}

- (_NSRange)_visibleAppLayoutRangeForContentOffset:(CGPoint)a3
{
  unint64_t v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _BOOL4 v12;
  _BOOL4 v13;
  NSUInteger v14;
  uint64_t v15;
  NSUInteger v16;
  NSUInteger v17;
  _NSRange result;

  -[SBDeckSwitcherModifier scrollViewContentOffset](self, "scrollViewContentOffset", a3.x, a3.y);
  v4 = -[SBDeckSwitcherModifier _indexForContentOffset:](self, "_indexForContentOffset:");
  -[SBDeckSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = 0x7FFFFFFFFFFFFFFFLL;
  v8 = 0x7FFFFFFFFFFFFFFFLL;
  v9 = v6 - v4;
  if (v6 <= v4)
    goto LABEL_26;
  v10 = 0;
  do
  {
    if (-[SBDeckSwitcherModifier _isIndexVisible:](self, "_isIndexVisible:", v4 + v10))
    {
      if (v8 == 0x7FFFFFFFFFFFFFFFLL)
        v8 = v4 + v10;
      v7 = v4 + v10;
    }
    else if (v10)
    {
      break;
    }
    ++v10;
  }
  while (v9 != v10);
  if ((v8 & 0x8000000000000000) == 0)
  {
LABEL_26:
    if (-[SBDeckSwitcherModifier _isIndexVisible:](self, "_isIndexVisible:", v8))
    {
      while (v8-- >= 1)
      {
        if (!-[SBDeckSwitcherModifier _isIndexVisible:](self, "_isIndexVisible:", v8))
        {
          ++v8;
          goto LABEL_15;
        }
      }
      v8 = 0;
    }
  }
LABEL_15:
  v12 = v8 != 0x7FFFFFFFFFFFFFFFLL;
  v13 = v7 != 0x7FFFFFFFFFFFFFFFLL;
  if (v12 && v13)
    v14 = v8;
  else
    v14 = 0;
  if (v12 && v13)
    v15 = v7 - v8 + 1;
  else
    v15 = 0;

  v16 = v14;
  v17 = v15;
  result.length = v17;
  result.location = v16;
  return result;
}

- (unint64_t)_indexForContentOffset:(CGPoint)a3
{
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  double v8;
  unint64_t v9;

  -[SBDeckSwitcherModifier _scrollProgressForContentOffset:](self, "_scrollProgressForContentOffset:", a3.x, a3.y);
  v5 = v4;
  -[SBDeckSwitcherModifier appLayouts](self, "appLayouts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  -[SBDeckSwitcherModifier desiredXOriginForQuantizedTopPage](self, "desiredXOriginForQuantizedTopPage");
  v9 = -[SBDeckSwitcherModifier indexForScrollProgress:displayItemsCount:frameOrigin:](self, "indexForScrollProgress:displayItemsCount:frameOrigin:", v7, v5, v8);

  return v9;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  void *v19;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("grabbedIndex %ld"), self->_grabbedDraggingIndex);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[SBDeckSwitcherModifier _scrollProgress](self, "_scrollProgress");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("scrollProgress: %0.2f"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3940];
  -[SBDeckSwitcherModifier scrollRange](self, "scrollRange");
  objc_msgSend(v7, "stringWithFormat:", CFSTR("scrollRange: %0.2f"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v3;
  v20[1] = v6;
  v20[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", &stru_1E8EC7EC0);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __42__SBDeckSwitcherModifier_debugDescription__block_invoke;
  v17[3] = &unk_1E8EBD0E0;
  v12 = v11;
  v18 = v12;
  v19 = v10;
  v13 = v10;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v17);
  v14 = v19;
  v15 = v12;

  return v15;
}

void __42__SBDeckSwitcherModifier_debugDescription__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  const __CFString *v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = *(void **)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = a2;
  if (objc_msgSend(v6, "count") - 1 == a3)
    v8 = &stru_1E8EC7EC0;
  else
    v8 = CFSTR("\n");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@%@"), v7, v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendString:", v9);
}

- (unint64_t)_indexOfCurrentCenteredCard
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  void *v24;
  unint64_t v25;
  CGAffineTransform v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  -[SBDeckSwitcherModifier appLayouts](self, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0x7FFFFFFFFFFFFFFFLL;
  v5 = 0;
  while (1)
  {
    if (-[SBDeckSwitcherModifier _isIndexVisible:](self, "_isIndexVisible:", v5))
    {
      -[SBDeckSwitcherModifier frameForIndex:](self, "frameForIndex:", v5);
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v13 = v12;
      -[SBDeckSwitcherModifier scaleForIndex:](self, "scaleForIndex:", v5);
      v15 = v14;
      UIRectGetCenter();
      CGAffineTransformMakeScale(&v27, v15, v15);
      v28.origin.x = v7;
      v28.origin.y = v9;
      v28.size.width = v11;
      v28.size.height = v13;
      CGRectApplyAffineTransform(v28, &v27);
      SBUnintegralizedRectCenteredAboutPoint();
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v23 = v22;
      -[SBDeckSwitcherModifier containerViewBounds](self, "containerViewBounds");
      v30.origin.x = v17;
      v30.origin.y = v19;
      v30.size.width = v21;
      v30.size.height = v23;
      if (CGRectContainsRect(v29, v30))
        break;
    }
    ++v5;
    -[SBDeckSwitcherModifier appLayouts](self, "appLayouts");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");

    if (v5 >= v25)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v5;
}

- (unint64_t)_directionForRemovingIndex:(unint64_t)a3 centeredIndex:(unint64_t)a4
{
  void *v6;
  uint64_t v7;

  if (!a3)
    return 0;
  -[SBDeckSwitcherModifier appLayouts](self, "appLayouts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count") - 1;

  return v7 == a3 || a3 < a4;
}

- (unint64_t)_newIndexOfItemAtIndex:(unint64_t)a3 afterRemovingItemAtIndex:(unint64_t)a4
{
  unint64_t v5;
  void *v6;

  if (a4 < a3)
    return a3 - 1;
  v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (a4 > a3)
  {
    -[SBDeckSwitcherModifier appLayouts](self, "appLayouts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count") > a3)
      v5 = a3;

  }
  return v5;
}

- (CGPoint)_contentOffsetForScrollProgress:(double)a3
{
  double v4;
  double v5;
  CGPoint result;

  -[SBDeckSwitcherModifier scrollRange](self, "scrollRange");
  -[SBDeckSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
  -[SBDeckSwitcherModifier screenScale](self, "screenScale");
  BSPointRoundForScale();
  result.y = v5;
  result.x = v4;
  return result;
}

- (double)_scrollProgressForContentOffset:(CGPoint)a3
{
  double x;
  double v5;
  double v6;
  double v7;
  int v8;
  double result;

  x = a3.x;
  -[SBDeckSwitcherModifier scrollRange](self, "scrollRange", a3.x, a3.y);
  v6 = v5;
  if (BSFloatIsZero())
    v7 = 0.0;
  else
    v7 = x / v6;
  v8 = -[SBDeckSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
  result = 1.0 - v7;
  if (v8)
    return v7;
  return result;
}

- (double)_restingScrollProgressForProgress:(double)a3 velocity:(CGPoint)a4
{
  double x;
  unint64_t v7;
  unint64_t v8;
  double v10;
  double v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  int v19;
  double v20;
  double result;
  double v22;

  x = a4.x;
  v7 = -[SBDeckSwitcherModifier numberOfItems](self, "numberOfItems", a3, a4.x, a4.y);
  if (a3 > 1.0)
    return a3;
  v8 = v7;
  if (a3 < 0.0 || v7 < 2)
    return a3;
  -[SBDeckSwitcherModifier desiredXOriginForQuantizedTopPage](self, "desiredXOriginForQuantizedTopPage");
  v11 = v10;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  v15 = 1.0;
  do
  {
    -[SBDeckSwitcherModifier scrollProgressForIndex:displayItemsCount:frameOrigin:](self, "scrollProgressForIndex:displayItemsCount:frameOrigin:", v12, v8, v11);
    v17 = v16;
    v18 = vabdd_f64(a3, v16);
    v19 = -[SBDeckSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
    if (v18 < v15)
    {
      if (v19)
        v20 = -x;
      else
        v20 = x;
      if ((a3 - v17) * v20 >= 0.0)
      {
        v13 = 1;
        v14 = v12;
        v15 = v18;
      }
    }
    ++v12;
  }
  while (v8 != v12);
  if ((fabs(a3) >= v15) | v13 & 1)
  {
    -[SBDeckSwitcherModifier scrollProgressForIndex:displayItemsCount:frameOrigin:](self, "scrollProgressForIndex:displayItemsCount:frameOrigin:", v14, v8, v11);
    return result;
  }
  if (v14)
    return a3;
  -[SBDeckSwitcherModifier scrollProgressForIndex:displayItemsCount:frameOrigin:](self, "scrollProgressForIndex:displayItemsCount:frameOrigin:", 0, v8, v11);
  if (a3 <= 0.0 || v22 <= a3)
    return a3;
  -[SBDeckSwitcherModifier scrollProgressForIndex:](self, "scrollProgressForIndex:", 0);
  return result;
}

- (double)_scrollProgressForIndex:(unint64_t)a3 displayItemsCount:(unint64_t)a4 depth:(double)a5
{
  double result;
  double v7;
  double v8;

  if (a4 == 1)
  {
    -[SBDeckSwitcherModifier _scrollMin](self, "_scrollMin", a3, a5);
  }
  else
  {
    v7 = a5 + *(double *)&kDepthPadding * (double)a3;
    -[SBDeckSwitcherModifier _scrollMin](self, "_scrollMin");
    return (v7 - v8) / -(*(double *)&kDepthPadding - (double)a4 * *(double *)&kDepthPadding);
  }
  return result;
}

- (unint64_t)_indexForScrollProgress:(double)a3 displayItemsCount:(unint64_t)a4 depth:(double)a5
{
  double v5;
  double v6;
  double v7;
  int v8;
  unint64_t v9;

  if (a4 < 2)
    return 0;
  v5 = -(a5 - *(double *)&kDepthPadding * (double)(a4 - 1) * a3);
  -[SBDeckSwitcherModifier _scrollMin](self, "_scrollMin");
  v7 = (v6 + v5) / *(double *)&kDepthPadding;
  v8 = BSFloatLessThanOrEqualToFloat();
  v9 = vcvtmd_u64_f64(v7);
  if (v8)
    return 0;
  else
    return v9;
}

- (double)scrollProgressForIndex:(unint64_t)a3
{
  unint64_t v5;
  unint64_t v6;
  double result;

  v5 = -[SBDeckSwitcherModifier numberOfItems](self, "numberOfItems");
  if (!a3)
    return 0.0;
  v6 = v5;
  if (v5 > 2 || (result = 1.0, v5 - 1 != a3))
  {
    -[SBDeckSwitcherModifier desiredXOriginForQuantizedTopPage](self, "desiredXOriginForQuantizedTopPage");
    -[SBDeckSwitcherModifier scrollProgressForIndex:displayItemsCount:frameOrigin:](self, "scrollProgressForIndex:displayItemsCount:frameOrigin:", a3 - 1, v6);
  }
  return result;
}

- (double)scrollProgressForIndex:(unint64_t)a3 displayItemsCount:(unint64_t)a4 frameOrigin:(double)a5
{
  double result;

  -[SBDeckSwitcherModifier _depthForFrameOrigin:](self, "_depthForFrameOrigin:", a5);
  -[SBDeckSwitcherModifier _scrollProgressForIndex:displayItemsCount:depth:](self, "_scrollProgressForIndex:displayItemsCount:depth:", a3, a4);
  return result;
}

- (unint64_t)indexForScrollProgress:(double)a3 displayItemsCount:(unint64_t)a4 frameOrigin:(double)a5
{
  double v8;

  -[SBDeckSwitcherModifier _depthForFrameOrigin:](self, "_depthForFrameOrigin:", a5);
  return -[SBDeckSwitcherModifier _indexForScrollProgress:displayItemsCount:depth:](self, "_indexForScrollProgress:displayItemsCount:depth:", a4, a3, v8);
}

- (double)_depthForFrameOrigin:(double)a3
{
  double Width;
  double v6;
  double v7;
  double result;
  double v9;
  double v10;
  double v11;
  CGRect v12;

  -[SBDeckSwitcherModifier containerViewBounds](self, "containerViewBounds");
  Width = CGRectGetWidth(v12);
  if (-[SBDeckSwitcherModifier isRTLEnabled](self, "isRTLEnabled"))
    a3 = Width - a3;
  -[SBDeckSwitcherModifier _switcherCardScale](self, "_switcherCardScale");
  v7 = v6;
  result = 0.0;
  if (Width > 0.0)
  {
    v9 = a3 + Width * ((1.0 - v7) * 0.5);
    v11 = *(double *)&kExponentialLayoutCurveExponent;
    if (v9 - (*(double *)&kExponentialLayoutTranslation + 1.0) <= 0.0)
    {
      v10 = *(double *)&kExponentialLayoutTranslation + 1.0;
      return v9 / Width + log((v10 - *(double *)&kExponentialLayoutTranslation) / Width) / v11 - v10 / Width;
    }
    else
    {
      return log((v9 - *(double *)&kExponentialLayoutTranslation) / Width) / v11;
    }
  }
  return result;
}

- (double)_counteractScrollingForOffset:(double)a3 scrollProgress:(double)a4
{
  double v7;

  if (!-[SBDeckSwitcherModifier isRTLEnabled](self, "isRTLEnabled"))
    a4 = 1.0 - a4;
  -[SBDeckSwitcherModifier scrollRange](self, "scrollRange");
  return a3 + a4 * v7;
}

- (double)desiredXOriginForQuantizedTopPage
{
  double Width;
  double v4;
  double v5;
  double v6;
  double v7;
  int v8;
  double result;
  CGRect v10;

  -[SBDeckSwitcherModifier containerViewBounds](self, "containerViewBounds");
  Width = CGRectGetWidth(v10);
  -[SBDeckSwitcherModifier _switcherCardScale](self, "_switcherCardScale");
  v5 = (Width - Width * v4) * 0.5;
  -[SBDeckSwitcherModifier _preferredVisibleMarginForTopPage](self, "_preferredVisibleMarginForTopPage");
  v7 = v6;
  v8 = -[SBDeckSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
  result = Width - v5 - v7;
  if (v8)
    return v7 + v5;
  return result;
}

- (double)_preferredVisibleMarginForTopPage
{
  double result;

  -[SBDeckSwitcherModifier containerViewBounds](self, "containerViewBounds");
  +[SBFluidSwitcherItemContainer preferredRestingVisibleMarginForBounds:](SBFluidSwitcherItemContainer, "preferredRestingVisibleMarginForBounds:");
  return result;
}

- (int64_t)_topIndexForLocationInContainerCoordinateSpace:(CGPoint)a3
{
  double x;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  int64_t v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGAffineTransform v21;
  CGRect v22;

  x = a3.x;
  v5 = -[SBDeckSwitcherModifier numberOfItems](self, "numberOfItems", a3.x, a3.y);
  if (v5 <= 0)
    v6 = 0;
  else
    v6 = v5 - 1;
  if (v5)
  {
    v7 = v5;
    v8 = 0;
    while (1)
    {
      if (-[SBDeckSwitcherModifier _isIndexVisible:](self, "_isIndexVisible:", v8))
      {
        -[SBDeckSwitcherModifier frameForIndex:](self, "frameForIndex:", v8);
        v10 = v9;
        v12 = v11;
        v14 = v13;
        v16 = v15;
        -[SBDeckSwitcherModifier scaleForIndex:](self, "scaleForIndex:", v8);
        v18 = v17;
        UIRectGetCenter();
        CGAffineTransformMakeScale(&v21, v18, v18);
        v22.origin.x = v10;
        v22.origin.y = v12;
        v22.size.width = v14;
        v22.size.height = v16;
        CGRectApplyAffineTransform(v22, &v21);
        SBUnintegralizedRectCenteredAboutPoint();
        if (v19 < x)
          break;
      }
      if (v7 == ++v8)
        return v6;
    }
    return v8;
  }
  return v6;
}

- (CGPoint)_adjustedOffsetForIndex:(int64_t)a3 offset:(CGPoint)a4 start:(CGPoint)a5 originalLocationInView:(CGPoint)a6 locationInView:(CGPoint)a7
{
  double v7;
  double Width;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double initialTranslationAdjustment;
  double inputContentOffsetAdjustmentForIndexChange;
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
  double v30;
  int v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double x;
  CGFloat y;
  double v38;
  CGPoint result;
  CGRect v40;

  x = a6.x;
  y = a4.y;
  v7 = a5.x;
  v35 = a4.x;
  -[SBDeckSwitcherModifier containerViewBounds](self, "containerViewBounds", a4.x, a4.y, a5.x, a5.y, a6.x, a6.y, a7.x, a7.y);
  Width = CGRectGetWidth(v40);
  -[SBDeckSwitcherModifier _contentSize](self, "_contentSize");
  v12 = v11;
  -[SBDeckSwitcherModifier scrollRange](self, "scrollRange");
  v38 = v13;
  v14 = 0.0;
  v15 = 0.0;
  if (v12 > Width)
  {
    if (-[SBDeckSwitcherModifier isRTLEnabled](self, "isRTLEnabled"))
      v15 = v7 / v38;
    else
      v15 = 1.0 - v7 / v38;
  }
  -[SBDeckSwitcherModifier _scaleTransformedXOrigin:scrollProgress:](self, "_scaleTransformedXOrigin:scrollProgress:", (double)a3, v15);
  v17 = v16;
  initialTranslationAdjustment = self->_initialTranslationAdjustment;
  inputContentOffsetAdjustmentForIndexChange = self->_inputContentOffsetAdjustmentForIndexChange;
  if (v12 > Width)
  {
    if (-[SBDeckSwitcherModifier isRTLEnabled](self, "isRTLEnabled"))
      v14 = v35 / v38;
    else
      v14 = 1.0 - v35 / v38;
  }
  v20 = x + v7 - v35 - initialTranslationAdjustment - inputContentOffsetAdjustmentForIndexChange;
  v21 = v7 + x - v17;
  -[SBDeckSwitcherModifier _scaleInSwitcherViewForIndex:scrollProgress:](self, "_scaleInSwitcherViewForIndex:scrollProgress:", a3, v15);
  v23 = v22;
  -[SBDeckSwitcherModifier _scaleInSwitcherViewForIndex:scrollProgress:](self, "_scaleInSwitcherViewForIndex:scrollProgress:", a3, v14);
  v25 = v24;
  v26 = v21 / v23 * v24;
  v27 = Width * 0.5 * (v24 + -1.0);
  if (-[SBDeckSwitcherModifier isRTLEnabled](self, "isRTLEnabled"))
    v28 = v20 - (v26 - Width * v25) - v27;
  else
    v28 = v20 - v26 + v27;
  -[SBDeckSwitcherModifier scrollProgressForIndex:displayItemsCount:frameOrigin:](self, "scrollProgressForIndex:displayItemsCount:frameOrigin:", a3, -[SBDeckSwitcherModifier numberOfItems](self, "numberOfItems"), v28);
  v30 = v29;
  v31 = -[SBDeckSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
  v32 = 1.0 - v30;
  if (v31)
    v32 = v30;
  v33 = v38 * v32;
  v34 = y;
  result.y = v34;
  result.x = v33;
  return result;
}

- (double)_scaleTransformedXOrigin:(double)a3 scrollProgress:(double)a4
{
  unint64_t v5;
  CGRect v7;

  v5 = (unint64_t)a3;
  -[SBDeckSwitcherModifier _frameForIndex:displayItemsCount:scrollProgress:ignoringScrollOffset:](self, "_frameForIndex:displayItemsCount:scrollProgress:ignoringScrollOffset:", (unint64_t)a3, -[SBDeckSwitcherModifier numberOfItems](self, "numberOfItems"), 0, a4);
  -[SBDeckSwitcherModifier _scaleTransformedFrameForIndex:withUntransformedFrame:scrollProgress:](self, "_scaleTransformedFrameForIndex:withUntransformedFrame:scrollProgress:", v5);
  return CGRectGetMinX(v7);
}

- (CGRect)_scaleTransformedFrameForIndex:(unint64_t)a3 withUntransformedFrame:(CGRect)a4 scrollProgress:(double)a5
{
  double height;
  double width;
  double y;
  double x;
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
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[SBDeckSwitcherModifier _scaleForTransformForIndex:scrollProgress:](self, "_scaleForTransformForIndex:scrollProgress:", a3, a5);
  v11 = v10 + -1.0;
  -[SBDeckSwitcherModifier _switcherCardScale](self, "_switcherCardScale");
  v13 = v11 + v12;
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  v14 = CGRectGetWidth(v22);
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  v15 = v14 - CGRectGetWidth(v23) * v13;
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  v16 = CGRectGetHeight(v24);
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  v17 = v16 - CGRectGetHeight(v25) * v13;
  v18 = x + v15 * 0.5;
  v19 = y + v17 * 0.5;
  v20 = width * v13;
  v21 = height * v13;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (double)_scaleInSwitcherViewForIndex:(unint64_t)a3 scrollProgress:(double)a4
{
  double v5;
  double v6;
  double v7;

  -[SBDeckSwitcherModifier _scaleForTransformForIndex:scrollProgress:](self, "_scaleForTransformForIndex:scrollProgress:", a3, a4);
  v6 = v5 + -1.0;
  -[SBDeckSwitcherModifier _switcherCardScale](self, "_switcherCardScale");
  return v6 + v7;
}

- (double)opacityForIndex:(unint64_t)a3 scrollProgress:(double)a4
{
  double v4;

  if (!a3)
    return 1.0;
  -[SBDeckSwitcherModifier _valueAlongDepthCurveForIndex:scrollProgress:aCoefficient:bCoefficient:](self, "_valueAlongDepthCurveForIndex:scrollProgress:aCoefficient:bCoefficient:", a4, 0.41, 8.0);
  return 1.0 - v4;
}

- (double)_valueAlongDepthCurveForIndex:(unint64_t)a3 scrollProgress:(double)a4 aCoefficient:(double)a5 bCoefficient:(double)a6
{
  double v8;

  -[SBDeckSwitcherModifier depthForIndex:displayItemsCount:scrollProgress:](self, "depthForIndex:displayItemsCount:scrollProgress:", a3, -[SBDeckSwitcherModifier numberOfItems](self, "numberOfItems"), a4);
  return fmin(fmax((-v8 - a5) * a6, 0.0), 1.0);
}

- (BOOL)_priorIndex:(unint64_t)a3 fullyObscuresCardForIndex:(unint64_t)a4
{
  unint64_t v7;
  BOOL v8;
  unint64_t v9;
  void *v10;
  void *v11;
  double v12;

  v7 = -[SBDeckSwitcherModifier numberOfItems](self, "numberOfItems");
  v8 = 0;
  v9 = a4 - a3;
  if (a4 >= a3 && a4 != 0x7FFFFFFFFFFFFFFFLL && v7 > a3)
  {
    -[SBDeckSwitcherModifier appLayouts](self, "appLayouts");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndex:", a4 - a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBDeckSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](self, "opacityForLayoutRole:inAppLayout:atIndex:", 1, v11, v9);
    v8 = v12 >= 1.0;

  }
  return v8;
}

- (double)_unscaledCardCornerRadius
{
  double result;
  double v4;

  -[SBDeckSwitcherModifier displayCornerRadius](self, "displayCornerRadius");
  if (result <= 0.0)
  {
    -[SBDeckSwitcherModifier _switcherCardScale](self, "_switcherCardScale");
    return 5.0 / v4;
  }
  return result;
}

- (double)titleOpacityForIndex:(unint64_t)a3 scrollProgress:(double)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;

  -[SBDeckSwitcherModifier depthForIndex:displayItemsCount:scrollProgress:](self, "depthForIndex:displayItemsCount:scrollProgress:", a3, -[SBDeckSwitcherModifier numberOfItems](self, "numberOfItems"), a4);
  v7 = -v6;
  if (a3)
  {
    v8 = fmax((v7 - *(double *)&kATitleOpacityCoefficient) * *(double *)&kBTitleOpacityCoefficient, 0.0);
    if (v8 >= 1.0)
      v9 = 0.0;
    else
      v9 = 1.0 - v8;
  }
  else
  {
    v9 = 1.0;
  }
  if (self->_useTitleOpacityPrototypeSettings)
  {
    v10 = *(double *)&kCTitleOpacityCoefficient;
    v11 = *(double *)&kDTitleOpacityCoefficient;
  }
  else
  {
    v12 = -[SBDeckSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation");
    v10 = dbl_1D0E8B890[(unint64_t)(v12 - 1) < 2];
    v11 = 75.0;
    if ((unint64_t)(v12 - 1) < 2)
      v11 = 40.0;
  }
  return v9 * fmin(fmax((v7 - v10) * v11, 0.0), 1.0);
}

- (void)_applyPrototypeSettings
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  -[SBDeckSwitcherModifier switcherSettings](self, "switcherSettings");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "aExpLayoutCoeff");
  kExponentialLayoutTranslation = v3;
  objc_msgSend(v11, "bExpLayoutCoeff");
  kExponentialLayoutCurveExponent = v4;
  objc_msgSend(v11, "depthPadding");
  kDepthPadding = v5;
  objc_msgSend(v11, "deckSwitcherDecelerationRate");
  kDecelerationFactor = v6;
  if (objc_msgSend(v11, "useTitleOpacityPrototypeSettings"))
  {
    self->_useTitleOpacityPrototypeSettings = 1;
    objc_msgSend(v11, "titleOpacityACoeff");
    kATitleOpacityCoefficient = v7;
    objc_msgSend(v11, "titleOpacityBCoeff");
    kBTitleOpacityCoefficient = v8;
    objc_msgSend(v11, "titleOpacityCCoeff");
    kCTitleOpacityCoefficient = v9;
    objc_msgSend(v11, "titleOpacityDCoeff");
    kDTitleOpacityCoefficient = v10;
  }
  else
  {
    self->_useTitleOpacityPrototypeSettings = 0;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAppLayout, 0);
}

@end
