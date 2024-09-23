@implementation SBAppSwitcherContinuousExposeSwitcherModifier

- (SBAppSwitcherContinuousExposeSwitcherModifier)init
{
  SBAppSwitcherContinuousExposeSwitcherModifier *v2;
  SBAppSwitcherContinuousExposeSwitcherModifier *v3;
  SBDefaultImplementationsSwitcherModifier *v4;
  SBSwitcherLayoutCalculationsCache *v5;
  SBSwitcherLayoutCalculationsCache *appLayoutLayoutCalculationsCache;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBAppSwitcherContinuousExposeSwitcherModifier;
  v2 = -[SBSwitcherModifier init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_handlesTapAppLayoutEvents = 1;
    v2->_handlesTapAppLayoutHeaderEvents = 1;
    v2->_scaleFactor = 1.0;
    v2->_horizontalEdgeSpacingScaleFactor = 1.0;
    v2->_showsActiveAppLayoutInSwitcher = 1;
    v4 = objc_alloc_init(SBDefaultImplementationsSwitcherModifier);
    -[SBChainableModifier addChildModifier:atLevel:key:](v3, "addChildModifier:atLevel:key:", v4, 1, 0);

    v5 = objc_alloc_init(SBSwitcherLayoutCalculationsCache);
    appLayoutLayoutCalculationsCache = v3->_appLayoutLayoutCalculationsCache;
    v3->_appLayoutLayoutCalculationsCache = v5;

    -[SBSwitcherLayoutCalculationsCache setDelegate:](v3->_appLayoutLayoutCalculationsCache, "setDelegate:", v3);
  }
  return v3;
}

- (id)handleEvent:(id)a3
{
  objc_super v4;

  ++self->_modifierEventGenCount;
  v4.receiver = self;
  v4.super_class = (Class)SBAppSwitcherContinuousExposeSwitcherModifier;
  -[SBChainableModifier handleEvent:](&v4, sel_handleEvent_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)handleScrollEvent:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  CGPoint *p_previousContentOffset;
  BOOL v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  objc_msgSend(v4, "contentOffset");
  v6 = v5;
  v8 = v7;
  p_previousContentOffset = &self->_previousContentOffset;
  v10 = self->_previousContentOffset.x == 1.79769313e308 && self->_previousContentOffset.y == 1.79769313e308;
  if (!v10 && (BSFloatEqualToFloat() & 1) == 0)
    self->_isScrollingForward = p_previousContentOffset->x > v6;
  p_previousContentOffset->x = v6;
  self->_previousContentOffset.y = v8;
  v13.receiver = self;
  v13.super_class = (Class)SBAppSwitcherContinuousExposeSwitcherModifier;
  -[SBSwitcherModifier handleScrollEvent:](&v13, sel_handleScrollEvent_, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
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
  v9.super_class = (Class)SBAppSwitcherContinuousExposeSwitcherModifier;
  -[SBSwitcherModifier handleTransitionEvent:](&v9, sel_handleTransitionEvent_, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
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
  v11.super_class = (Class)SBAppSwitcherContinuousExposeSwitcherModifier;
  -[SBSwitcherModifier handleTapAppLayoutEvent:](&v11, sel_handleTapAppLayoutEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_handlesTapAppLayoutEvents && (objc_msgSend(v4, "isHandled") & 1) == 0)
  {
    objc_msgSend(v4, "appLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBSwitcherTransitionRequest requestForActivatingAppLayout:](SBSwitcherTransitionRequest, "requestForActivatingAppLayout:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v7, 0);
    SBAppendSwitcherModifierResponse(v8, v5);
    v9 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "handleWithReason:", CFSTR("App Switcher Continuous Expose"));
    v5 = (void *)v9;
  }

  return v5;
}

- (id)handleTapAppLayoutHeaderEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  SBMutableSwitcherTransitionRequest *v8;
  void *v9;
  SBPerformTransitionSwitcherEventResponse *v10;
  SBPerformTransitionSwitcherEventResponse *v11;
  uint64_t v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBAppSwitcherContinuousExposeSwitcherModifier;
  -[SBSwitcherModifier handleTapAppLayoutHeaderEvent:](&v14, sel_handleTapAppLayoutHeaderEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_handlesTapAppLayoutHeaderEvents && (objc_msgSend(v4, "isHandled") & 1) == 0)
  {
    objc_msgSend(v4, "appLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "itemForLayoutRole:", objc_msgSend(v4, "layoutRole"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[SBAppSwitcherContinuousExposeSwitcherModifier displayItemSupportsMultipleWindowsIndicator:](self, "displayItemSupportsMultipleWindowsIndicator:", v7))
    {
      v8 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
      -[SBSwitcherTransitionRequest setSource:](v8, "setSource:", 3);
      objc_msgSend(v7, "bundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSwitcherTransitionRequest setBundleIdentifierForAppExpose:](v8, "setBundleIdentifierForAppExpose:", v9);

      v10 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v8, 0);
    }
    else
    {
      v8 = -[SBPulseDisplayItemSwitcherModifier initWithDisplayItem:]([SBPulseDisplayItemSwitcherModifier alloc], "initWithDisplayItem:", v7);
      v10 = -[SBAddModifierSwitcherEventResponse initWithModifier:level:]([SBAddModifierSwitcherEventResponse alloc], "initWithModifier:level:", v8, 3);
    }
    v11 = v10;
    SBAppendSwitcherModifierResponse(v10, v5);
    v12 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v12;
  }

  return v5;
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
  v11.super_class = (Class)SBAppSwitcherContinuousExposeSwitcherModifier;
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
  v16.super_class = (Class)SBAppSwitcherContinuousExposeSwitcherModifier;
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
  -[SBAppSwitcherContinuousExposeSwitcherModifier appLayouts](self, "appLayouts");
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

- (CGRect)_scaledSwitcherViewBounds
{
  double v3;
  CGFloat x;
  double v5;
  CGFloat y;
  double v7;
  CGFloat width;
  double v9;
  CGFloat height;
  double v11;
  double v12;
  double v13;
  double v14;
  CGAffineTransform v15;
  objc_super v16;
  CGRect v17;
  CGRect v18;
  CGRect result;

  v16.receiver = self;
  v16.super_class = (Class)SBAppSwitcherContinuousExposeSwitcherModifier;
  -[SBAppSwitcherContinuousExposeSwitcherModifier switcherViewBounds](&v16, sel_switcherViewBounds);
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  if ((BSFloatIsOne() & 1) == 0)
  {
    CGAffineTransformMakeScale(&v15, self->_scaleFactor, self->_scaleFactor);
    v17.origin.x = x;
    v17.origin.y = y;
    v17.size.width = width;
    v17.size.height = height;
    v18 = CGRectApplyAffineTransform(v17, &v15);
    x = v18.origin.x;
    y = v18.origin.y;
    width = v18.size.width;
    height = v18.size.height;
  }
  v11 = x;
  v12 = y;
  v13 = width;
  v14 = height;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[SBAppSwitcherContinuousExposeSwitcherModifier _frameForIndex:withScaleApplied:scrollOffsetApplied:](self, "_frameForIndex:withScaleApplied:scrollOffsetApplied:", a3, 0, 1);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
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
  CGRect result;

  v7 = a4;
  objc_msgSend(v7, "itemForLayoutRole:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSwitcherModifier autoLayoutSpaceForAppLayout:](self, "autoLayoutSpaceForAppLayout:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "autoLayoutItemForDisplayItem:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "compactedPosition");
  objc_msgSend(v9, "compactedBoundingBox");
  objc_msgSend(v10, "size");
  -[SBAppSwitcherContinuousExposeSwitcherModifier screenScale](self, "screenScale");
  SBRectWithSize();
  UIRectCenteredAboutPointScale();
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = v12;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  SBSwitcherLayoutCalculationsCache *appLayoutLayoutCalculationsCache;
  void *v8;
  double v9;
  double v10;

  -[SBAppSwitcherContinuousExposeSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  appLayoutLayoutCalculationsCache = self->_appLayoutLayoutCalculationsCache;
  -[SBAppSwitcherContinuousExposeSwitcherModifier _currentLayoutCalculationsValidityToken](self, "_currentLayoutCalculationsValidityToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSwitcherLayoutCalculationsCache scaleForKey:validityToken:fallback:](appLayoutLayoutCalculationsCache, "scaleForKey:validityToken:fallback:", v6, v8, &__block_literal_global_290);
  v10 = v9;

  return v10;
}

double __63__SBAppSwitcherContinuousExposeSwitcherModifier_scaleForIndex___block_invoke()
{
  return 1.0;
}

- (double)titleAndIconOpacityForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;

  -[SBAppSwitcherContinuousExposeSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBAppSwitcherContinuousExposeSwitcherModifier _indexOfAppLayoutInItsPile:](self, "_indexOfAppLayoutInItsPile:", v6))
  {
    v7 = 0.0;
  }
  else
  {
    v7 = 1.0;
  }

  return v7;
}

- (double)rotationAngleForIndex:(unint64_t)a3
{
  return 0.0;
}

- (id)visibleHomeAffordanceLayoutElements
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (BOOL)isHomeAffordanceSupportedForAppLayout:(id)a3
{
  void *v3;
  char v4;

  -[SBAppSwitcherContinuousExposeSwitcherModifier homeGrabberSettings](self, "homeGrabberSettings", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEnabled");

  return v4;
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  return (id)objc_msgSend(a3, "bs_filter:", &__block_literal_global_28_3);
}

BOOL __81__SBAppSwitcherContinuousExposeSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "environment") != 3;
}

- (id)visibleAppLayouts
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id obj;
  SBAppSwitcherContinuousExposeSwitcherModifier *v20;
  unint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[SBAppSwitcherContinuousExposeSwitcherModifier switcherSettings](self, "switcherSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chamoisSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v5, "numberOfVisibleItemsPerGroup");

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v20 = self;
  -[SBAppSwitcherContinuousExposeSwitcherModifier _visiblePileIdentifiers](self, "_visiblePileIdentifiers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v9);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        -[SBAppSwitcherContinuousExposeSwitcherModifier appLayoutsForContinuousExposeIdentifier:](v20, "appLayoutsForContinuousExposeIdentifier:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v12)
        {
          v13 = v12;
          v14 = 0;
          v15 = *(_QWORD *)v23;
LABEL_8:
          v16 = 0;
          if (v21 >= v14)
            v17 = v21 - v14;
          else
            v17 = 0;
          while (1)
          {
            if (*(_QWORD *)v23 != v15)
              objc_enumerationMutation(v11);
            if (v17 == v16)
              break;
            objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v16++));
            if (v13 == v16)
            {
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
              v14 += v16;
              if (v13)
                goto LABEL_8;
              break;
            }
          }
        }

        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v7);
  }

  return v3;
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

  -[SBAppSwitcherContinuousExposeSwitcherModifier switcherSettings](self, "switcherSettings", a3);
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

  -[SBAppSwitcherContinuousExposeSwitcherModifier frameForIndex:](self, "frameForIndex:", a3);
  return CGRectGetWidth(v4);
}

- (id)topMostLayoutElements
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id obj;
  uint64_t v20;
  SBAppSwitcherContinuousExposeSwitcherModifier *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[SBAppSwitcherContinuousExposeSwitcherModifier switcherSettings](self, "switcherSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chamoisSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfVisibleItemsPerGroup");

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v21 = self;
  -[SBAppSwitcherContinuousExposeSwitcherModifier _visiblePileIdentifiers](self, "_visiblePileIdentifiers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v7)
  {
    v8 = v7;
    v20 = *(_QWORD *)v27;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v9);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        -[SBAppSwitcherContinuousExposeSwitcherModifier appLayoutsForContinuousExposeIdentifier:](v21, "appLayoutsForContinuousExposeIdentifier:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v12)
        {
          v13 = v12;
          v14 = 0;
          v15 = *(_QWORD *)v23;
LABEL_8:
          v16 = 0;
          v17 = v14 + v13;
          while (1)
          {
            if (*(_QWORD *)v23 != v15)
              objc_enumerationMutation(v11);
            if (v14 + v16 > v6)
              break;
            objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v16++));
            if (v13 == v16)
            {
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
              v14 = v17;
              if (v13)
                goto LABEL_8;
              break;
            }
          }
        }

        ++v9;
      }
      while (v9 != v8);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v8);
  }

  return v3;
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

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  unint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  double result;

  v6 = -[SBAppSwitcherContinuousExposeSwitcherModifier _indexOfAppLayoutInItsPile:](self, "_indexOfAppLayoutInItsPile:", a4);
  -[SBAppSwitcherContinuousExposeSwitcherModifier switcherSettings](self, "switcherSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "chamoisSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "numberOfVisibleItemsPerGroup");

  result = 0.0;
  if (v6 < v9)
    return 1.0;
  return result;
}

- (double)titleOpacityForIndex:(unint64_t)a3
{
  return 1.0;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  return 1.0;
}

- (double)shadowOffsetForIndex:(unint64_t)a3
{
  return 0.0;
}

- (BOOL)shouldAccessoryDrawShadowForAppLayout:(id)a3
{
  return 0;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIRectCornerRadii result;

  -[SBAppSwitcherContinuousExposeSwitcherModifier switcherSettings](self, "switcherSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chamoisSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "switcherCornerRadius");

  -[SBAppSwitcherContinuousExposeSwitcherModifier scaleForIndex:](self, "scaleForIndex:", a3);
  SBRectCornerRadiiForRadius();
  result.topRight = v10;
  result.bottomRight = v9;
  result.bottomLeft = v8;
  result.topLeft = v7;
  return result;
}

- (int64_t)tintStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
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
  return 1;
}

- (double)homeScreenAlpha
{
  return 0.0;
}

- (double)homeScreenScale
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[SBAppSwitcherContinuousExposeSwitcherModifier switcherSettings](self, "switcherSettings");
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

  -[SBAppSwitcherContinuousExposeSwitcherModifier switcherSettings](self, "switcherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "animationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wallpaperScaleForMode:", 2);
  v5 = v4;

  return v5;
}

- (double)homeScreenDimmingAlpha
{
  return 0.0;
}

- (int64_t)homeScreenBackdropBlurType
{
  return 2;
}

- (double)homeScreenBackdropBlurProgress
{
  return 1.0;
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
  return 1;
}

- (BOOL)canSelectLeafWithModifierKeysInAppLayout:(id)a3
{
  return 0;
}

- (BOOL)isFocusEnabledForAppLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "continuousExposeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppSwitcherContinuousExposeSwitcherModifier appLayoutsForContinuousExposeIdentifier:](self, "appLayoutsForContinuousExposeIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  return v7 == v4;
}

- (id)neighboringAppLayoutsForFocusedAppLayout:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void *v19;
  SBAppSwitcherContinuousExposeSwitcherModifier *v20;
  id v21;

  v4 = (void *)MEMORY[0x1E0C99E20];
  v5 = a3;
  objc_msgSend(v4, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppSwitcherContinuousExposeSwitcherModifier continuousExposeIdentifiersInSwitcher](self, "continuousExposeIdentifiersInSwitcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "continuousExposeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "indexOfObject:", v8);
  if (v9 != 0x7FFFFFFFFFFFFFFFLL && (unint64_t)objc_msgSend(v7, "count") >= 3)
  {
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __90__SBAppSwitcherContinuousExposeSwitcherModifier_neighboringAppLayoutsForFocusedAppLayout___block_invoke;
    v19 = &unk_1E8EB86D0;
    v20 = self;
    v21 = v6;
    v10 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](&v16);
    if (v9)
    {
      objc_msgSend(v7, "objectAtIndex:", v9 - 1, v16, v17, v18, v19, v20);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v10)[2](v10, v11);

      if (v9 != 1)
      {
        objc_msgSend(v7, "objectAtIndex:", v9 - 2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v10)[2](v10, v12);

      }
    }
    if (v9 < objc_msgSend(v7, "count", v16, v17, v18, v19, v20) - 1)
    {
      objc_msgSend(v7, "objectAtIndex:", v9 + 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v10)[2](v10, v13);

    }
    if (v9 < objc_msgSend(v7, "count") - 2)
    {
      objc_msgSend(v7, "objectAtIndex:", v9 + 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v10)[2](v10, v14);

    }
  }

  return v6;
}

void __90__SBAppSwitcherContinuousExposeSwitcherModifier_neighboringAppLayoutsForFocusedAppLayout___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "appLayoutsForContinuousExposeIdentifier:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
    v4 = v5;
  }

}

- (BOOL)canPerformKeyboardShortcutAction:(int64_t)a3 forBundleIdentifier:(id)a4
{
  return a3 == 0;
}

- (id)activeLeafAppLayoutsReachableByKeyboardShortcut
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)inactiveAppLayoutsReachableByKeyboardShortcut
{
  return (id)MEMORY[0x1E0C9AA60];
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
  return 5;
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

- (id)appLayoutsToCacheSnapshots
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[SBAppSwitcherContinuousExposeSwitcherModifier switcherSettings](self, "switcherSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSnapshotsToCacheInSwitcher");

  v5 = -[SBAppSwitcherContinuousExposeSwitcherModifier _visiblePileRange](self, "_visiblePileRange");
  return -[SBAppSwitcherContinuousExposeSwitcherModifier _appLayoutsToCacheSnapshotsWithVisiblePileRange:numberOfSnapshotsToCache:biasForward:](self, "_appLayoutsToCacheSnapshotsWithVisiblePileRange:numberOfSnapshotsToCache:biasForward:", v5, v6, v4, self->_isScrollingForward);
}

- (_NSRange)_visiblePileRange
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  NSUInteger v33;
  NSUInteger v34;
  NSUInteger v35;
  _NSRange result;
  CGRect v37;
  CGRect v38;

  -[SBAppSwitcherContinuousExposeSwitcherModifier continuousExposeIdentifiersInSwitcher](self, "continuousExposeIdentifiersInSwitcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppSwitcherContinuousExposeSwitcherModifier _visibleSwitcherBoundsIncludingShadow](self, "_visibleSwitcherBoundsIncludingShadow");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = objc_msgSend(v3, "count");
  if (v12)
  {
    v13 = 0;
    v14 = 0x7FFFFFFFFFFFFFFFLL;
    v15 = 0x7FFFFFFFFFFFFFFFLL;
    v16 = 0x7FFFFFFFFFFFFFFFLL;
    v17 = 0x7FFFFFFFFFFFFFFFLL;
    while (v16 == 0x7FFFFFFFFFFFFFFFLL || v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[SBAppSwitcherContinuousExposeSwitcherModifier _boundingFrameForPileAtIndex:withScrollOffsetApplied:](self, "_boundingFrameForPileAtIndex:withScrollOffsetApplied:", v13, 1);
      v38.origin.x = v19;
      v38.origin.y = v20;
      v38.size.width = v21;
      v38.size.height = v22;
      v37.origin.x = v5;
      v37.origin.y = v7;
      v37.size.width = v9;
      v37.size.height = v11;
      v23 = CGRectIntersectsRect(v37, v38);
      if (v23)
        v24 = v13;
      else
        v24 = 0x7FFFFFFFFFFFFFFFLL;
      if (v23)
        v25 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v25 = v13;
      if ((v13 & 1) == 0 && v14 == 0x7FFFFFFFFFFFFFFFLL)
        v14 = v24;
      if (v17 == 0x7FFFFFFFFFFFFFFFLL && (v13 & 1) != 0)
        v17 = v24;
      v27 = v14 != 0x7FFFFFFFFFFFFFFFLL && (v13 & 1) == 0;
      if (v27 && v16 == 0x7FFFFFFFFFFFFFFFLL)
        v16 = v25;
      if ((v13 & (v17 != 0x7FFFFFFFFFFFFFFFLL) & (v15 == 0x7FFFFFFFFFFFFFFFLL)) != 0)
        v15 = v25;
      if (v12 == ++v13)
      {
        if (v16 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_32;
        break;
      }
    }
  }
  else
  {
    v14 = 0x7FFFFFFFFFFFFFFFLL;
    v15 = 0x7FFFFFFFFFFFFFFFLL;
    v17 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_32:
    v16 = v12;
  }
  if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    v28 = v12;
  else
    v28 = v15;
  v29 = v28 - 2;
  if (v14 >= v17)
    v30 = v17;
  else
    v30 = v14;
  if (v16 - 2 > v29)
    v29 = v16 - 2;
  v31 = v30 == 0x7FFFFFFFFFFFFFFFLL || v29 == 0x7FFFFFFFFFFFFFFFLL;
  if (v31)
    v32 = 0;
  else
    v32 = v29 - v30 + 1;
  if (v31)
    v33 = 0;
  else
    v33 = v30;

  v34 = v33;
  v35 = v32;
  result.length = v35;
  result.location = v34;
  return result;
}

- (id)_appLayoutsToCacheSnapshotsWithVisiblePileRange:(_NSRange)a3 numberOfSnapshotsToCache:(unint64_t)a4 biasForward:(BOOL)a5
{
  _BOOL4 v5;
  NSUInteger length;
  NSUInteger location;
  unint64_t v8;
  id v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger v13;
  void *v14;
  id v15;
  NSUInteger v16;
  void *v17;
  uint64_t v18;
  id v19;
  void (**v20)(_QWORD);
  uint64_t v21;
  void (**v22)(_QWORD);
  void (**v23)(_QWORD);
  void *v24;
  void *v25;
  unint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  unint64_t v32;
  unint64_t v33;
  void *v34;
  void *v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  void *v39;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[4];
  id v49;
  uint64_t *v50;
  uint64_t v51;
  _QWORD v52[4];
  id v53;
  uint64_t *v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  NSUInteger v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  NSUInteger v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  if (a3.length)
  {
    v5 = a5;
    length = a3.length;
    location = a3.location;
    -[SBAppSwitcherContinuousExposeSwitcherModifier continuousExposeIdentifiersInSwitcher](self, "continuousExposeIdentifiersInSwitcher");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v43, "count");
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10 = location + length;
    if (v5)
    {
      v11 = 2;
      v12 = 1;
      if (location < v10)
      {
        v13 = location;
        do
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v14);

          ++v13;
          --length;
        }
        while (length);
      }
    }
    else if (v10 <= location)
    {
      v11 = 1;
      v12 = 2;
    }
    else
    {
      v11 = 1;
      v12 = 2;
      v16 = location + length;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", --v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v17);

      }
      while (v16 > location);
    }
    v61 = 0;
    v62 = &v61;
    v63 = 0x2020000000;
    v64 = location - 1;
    v57 = 0;
    v58 = &v57;
    v59 = 0x2020000000;
    v60 = v10;
    v18 = MEMORY[0x1E0C809B0];
    while (v10 < v8 || (v62[3] & 0x8000000000000000) == 0)
    {
      v52[0] = v18;
      v52[1] = 3221225472;
      v52[2] = __134__SBAppSwitcherContinuousExposeSwitcherModifier__appLayoutsToCacheSnapshotsWithVisiblePileRange_numberOfSnapshotsToCache_biasForward___block_invoke;
      v52[3] = &unk_1E8E9FDD0;
      v54 = &v57;
      v55 = v8;
      v56 = v11;
      v19 = v9;
      v53 = v19;
      v20 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v52);
      v48[0] = v18;
      v48[1] = 3221225472;
      v48[2] = __134__SBAppSwitcherContinuousExposeSwitcherModifier__appLayoutsToCacheSnapshotsWithVisiblePileRange_numberOfSnapshotsToCache_biasForward___block_invoke_2;
      v48[3] = &unk_1E8E9FD08;
      v50 = &v61;
      v51 = v12;
      v49 = v19;
      v21 = MEMORY[0x1D17E5550](v48);
      v22 = (void (**)(_QWORD))v21;
      if (v5)
      {
        v20[2](v20);
        v23 = v22;
      }
      else
      {
        (*(void (**)(uint64_t))(v21 + 16))(v21);
        v23 = v20;
      }
      ((void (*)(void))v23[2])();

      v10 = v58[3];
    }
    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[SBAppSwitcherContinuousExposeSwitcherModifier switcherSettings](self, "switcherSettings");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "chamoisSettings");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "numberOfVisibleItemsPerGroup");

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v27 = v9;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v44, v65, 16);
    if (v28)
    {
      v29 = *(_QWORD *)v45;
LABEL_22:
      v30 = 0;
      while (1)
      {
        if (*(_QWORD *)v45 != v29)
          objc_enumerationMutation(v27);
        v31 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v30);
        v32 = objc_msgSend(v15, "count");
        v33 = a4 >= v32 ? a4 - v32 : 0;
        if (v32 >= a4)
          break;
        objc_msgSend(v43, "objectAtIndex:", objc_msgSend(v31, "unsignedIntegerValue"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBAppSwitcherContinuousExposeSwitcherModifier appLayoutsForContinuousExposeIdentifier:](self, "appLayoutsForContinuousExposeIdentifier:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "count");
        if (v36 >= v26)
          v37 = v26;
        else
          v37 = v36;
        if (v37 >= v33)
          v38 = v33;
        else
          v38 = v37;
        objc_msgSend(v35, "subarrayWithRange:", 0, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObjectsFromArray:", v39);

        if (v28 == ++v30)
        {
          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v44, v65, 16);
          if (v28)
            goto LABEL_22;
          break;
        }
      }
    }

    _Block_object_dispose(&v57, 8);
    _Block_object_dispose(&v61, 8);

  }
  else
  {
    v15 = (id)MEMORY[0x1E0C9AA60];
  }
  return v15;
}

void __134__SBAppSwitcherContinuousExposeSwitcherModifier__appLayoutsToCacheSnapshotsWithVisiblePileRange_numberOfSnapshotsToCache_biasForward___block_invoke(_QWORD *a1)
{
  unint64_t v1;
  unint64_t v2;
  BOOL v3;
  unint64_t v4;
  unint64_t v5;
  void *v7;
  void *v8;

  v1 = a1[6];
  v2 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  v3 = v1 >= v2;
  v4 = v1 - v2;
  if (!v3)
    v4 = 0;
  if (v4 >= a1[7])
    v5 = a1[7];
  else
    v5 = v4;
  for (; v5; --v5)
  {
    v7 = (void *)a1[4];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

    ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  }
}

void __134__SBAppSwitcherContinuousExposeSwitcherModifier__appLayoutsToCacheSnapshotsWithVisiblePileRange_numberOfSnapshotsToCache_biasForward___block_invoke_2(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  void *v5;

  v1 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  if (v1 + 1 < a1[6])
    v2 = v1 + 1;
  else
    v2 = a1[6];
  for (; v2; --v2)
  {
    v4 = (void *)a1[4];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

    --*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  }
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

  -[SBAppSwitcherContinuousExposeSwitcherModifier appLayouts](self, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = -[SBAppSwitcherContinuousExposeSwitcherModifier isReduceMotionEnabled](self, "isReduceMotionEnabled");

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

- (BOOL)shouldAnimateInsertionOrRemovalOfAppLayout:(id)a3 atIndex:(unint64_t)a4
{
  return 1;
}

- (BOOL)shouldBringCardToFrontDuringInsertionOrRemoval
{
  return 1;
}

- (unint64_t)indexToScrollToAfterInsertingAtIndex:(unint64_t)a3
{
  unint64_t result;

  result = -[SBAppSwitcherContinuousExposeSwitcherModifier _indexOfLeadingAppLayout](self, "_indexOfLeadingAppLayout", a3);
  if (result == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  return result;
}

- (unint64_t)indexToScrollToAfterRemovingIndex:(unint64_t)a3
{
  void *v4;
  unint64_t v5;

  -[SBAppSwitcherContinuousExposeSwitcherModifier appLayouts](self, "appLayouts", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 >= 2)
    return -[SBAppSwitcherContinuousExposeSwitcherModifier _indexOfLeadingAppLayout](self, "_indexOfLeadingAppLayout");
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)_indexOfLeadingAppLayout
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;
  CGRect v32;
  CGRect v33;

  v31 = *MEMORY[0x1E0C80C00];
  -[SBAppSwitcherContinuousExposeSwitcherModifier _visibleSwitcherBoundsIncludingShadow](self, "_visibleSwitcherBoundsIncludingShadow");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[SBAppSwitcherContinuousExposeSwitcherModifier continuousExposeIdentifiersInSwitcher](self, "continuousExposeIdentifiersInSwitcher", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        -[SBAppSwitcherContinuousExposeSwitcherModifier _boundingFrameForPileWithIdentifier:withScrollOffsetApplied:](self, "_boundingFrameForPileWithIdentifier:withScrollOffsetApplied:", v16, 1);
        v33.origin.x = v17;
        v33.origin.y = v18;
        v33.size.width = v19;
        v33.size.height = v20;
        v32.origin.x = v4;
        v32.origin.y = v6;
        v32.size.width = v8;
        v32.size.height = v10;
        if (CGRectIntersectsRect(v32, v33))
        {
          -[SBAppSwitcherContinuousExposeSwitcherModifier appLayoutsForContinuousExposeIdentifier:](self, "appLayoutsForContinuousExposeIdentifier:", v16);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "firstObject");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            -[SBAppSwitcherContinuousExposeSwitcherModifier appLayouts](self, "appLayouts");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v24, "indexOfObject:", v22);

            goto LABEL_12;
          }
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v13)
        continue;
      break;
    }
  }
  v23 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_12:

  return v23;
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

- (id)appLayoutsToResignActive
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = (void *)MEMORY[0x1E0C99E60];
  -[SBAppSwitcherContinuousExposeSwitcherModifier appLayouts](self, "appLayouts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithObject:forKey:", v5, &unk_1E91D17A8);
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

- (id)appLayoutForReceivingHardwareButtonEvents
{
  return 0;
}

- (id)adjustedContinuousExposeIdentifiersInSwitcherFromPreviousIdentifiersInSwitcher:(id)a3 identifiersInStrip:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  char v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  unint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t k;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t m;
  void *v60;
  void *v61;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  char v67;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  if (-[SBAppSwitcherContinuousExposeSwitcherModifier prefersStripHiddenAndDisabled](self, "prefersStripHiddenAndDisabled"))
  {
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    -[SBAppSwitcherContinuousExposeSwitcherModifier appLayouts](self, "appLayouts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v77, v83, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v78;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v78 != v12)
            objc_enumerationMutation(v9);
          -[SBAppSwitcherContinuousExposeSwitcherModifier appLayoutContainingAppLayout:](self, "appLayoutContainingAppLayout:", *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * i));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "continuousExposeIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v15);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v77, v83, 16);
      }
      while (v11);
    }

    objc_msgSend(v8, "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_69;
  }
  -[SBAppSwitcherContinuousExposeSwitcherModifier appLayoutOnStage](self, "appLayoutOnStage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "continuousExposeIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[SBAppSwitcherContinuousExposeSwitcherModifier appLayoutsForContinuousExposeIdentifier:](self, "appLayoutsForContinuousExposeIdentifier:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");

    if (v20 < 2)
    {
      if (self->_showsActiveAppLayoutInSwitcher)
        objc_msgSend(v8, "addObject:", v18);
      v22 = 0;
      v21 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_18;
    }
    v21 = objc_msgSend(v7, "indexOfObject:", v18);
  }
  else
  {
    v21 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v22 = 1;
LABEL_18:
  v66 = v6;
  v23 = objc_msgSend(v7, "count");
  if (v23)
  {
    v24 = v23;
    v25 = v23 >> 1;
    if (v21 == 0x7FFFFFFFFFFFFFFFLL)
      v26 = v23 >> 1;
    else
      v26 = v21;
    if (v23 >= 6)
      -[SBAppSwitcherContinuousExposeSwitcherModifier adjustedContinuousExposeIdentifiersInSwitcherFromPreviousIdentifiersInSwitcher:identifiersInStrip:].cold.1();
    v67 = v22;
    if (__SBStripOrderingMapsByStripSize__onceToken != -1)
      dispatch_once(&__SBStripOrderingMapsByStripSize__onceToken, &__block_literal_global_327);
    v27 = (void *)MEMORY[0x1E0CB37E8];
    v28 = (id)__SBStripOrderingMapsByStripSize__map;
    objc_msgSend(v27, "numberWithUnsignedInteger:", v24);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKey:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25 > v26 || v24 == 5)
      v32 = v26;
    else
      v32 = v24 + ~v26;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKey:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v24);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if ((v67 & 1) != 0 || !self->_showsActiveAppLayoutInSwitcher)
    {
      v65 = v34;
      objc_msgSend(v35, "addObjectsFromArray:", v34);
      v75 = 0u;
      v76 = 0u;
      v73 = 0u;
      v74 = 0u;
      v48 = v36;
      v49 = v36;
      v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
      if (v50)
      {
        v51 = v50;
        v52 = *(_QWORD *)v74;
        do
        {
          for (j = 0; j != v51; ++j)
          {
            if (*(_QWORD *)v74 != v52)
              objc_enumerationMutation(v49);
            objc_msgSend(v7, "objectAtIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * j), "integerValue"));
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v54);

          }
          v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
        }
        while (v51);
      }

      v34 = v65;
      v36 = v48;
    }
    else if (objc_msgSend(v8, "containsObject:", v18))
    {
      v63 = v36;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v24);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v24);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 0;
      v39 = v24;
      do
      {
        if ((v38 & 1) != 0)
          v40 = v68;
        else
          v40 = v37;
        objc_msgSend(v34, "objectAtIndex:", v38);
        v41 = v37;
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "addObject:", v42);

        v37 = v41;
        ++v38;
      }
      while (v39 != v38);
      v64 = v34;
      if (v39 != -1)
      {
        for (k = 0; k != v39; ++k)
        {
          if ((((_DWORD)k + 1) & 1) != 0)
          {
            if (objc_msgSend(v68, "count"))
              v44 = v68;
            else
              v44 = v37;
          }
          else if (objc_msgSend(v37, "count"))
          {
            v44 = v37;
          }
          else
          {
            v44 = v68;
          }
          v45 = v44;
          objc_msgSend(v45, "firstObject");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v46, "integerValue"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v47);

          objc_msgSend(v45, "removeObject:", v46);
          v37 = v41;
        }
      }

      v36 = v63;
      v34 = v64;
    }

  }
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  -[SBAppSwitcherContinuousExposeSwitcherModifier appLayouts](self, "appLayouts");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
  if (v56)
  {
    v57 = v56;
    v58 = *(_QWORD *)v70;
    do
    {
      for (m = 0; m != v57; ++m)
      {
        if (*(_QWORD *)v70 != v58)
          objc_enumerationMutation(v55);
        -[SBAppSwitcherContinuousExposeSwitcherModifier appLayoutContainingAppLayout:](self, "appLayoutContainingAppLayout:", *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * m));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "continuousExposeIdentifier");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        if ((BSEqualStrings() & 1) == 0)
          objc_msgSend(v8, "addObject:", v61);

      }
      v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
    }
    while (v57);
  }

  objc_msgSend(v8, "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v66;
LABEL_69:

  return v16;
}

- (id)adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  void *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t j;
  void *v54;
  unint64_t v55;
  unint64_t v56;
  id v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  id v70;
  void *v72;
  void *v73;
  id v74;
  id v75;
  void *v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t v80;
  id obj;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  void *v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _QWORD v106[4];
  id v107;
  _QWORD v108[4];
  id v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  _BYTE v119[128];
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((-[SBAppSwitcherContinuousExposeSwitcherModifier prefersStripHiddenAndDisabled](self, "prefersStripHiddenAndDisabled") & 1) == 0)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E10]);
    -[SBAppSwitcherContinuousExposeSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "numberOfRowsWhileInApp");

    -[SBAppSwitcherContinuousExposeSwitcherModifier appLayoutOnStage](self, "appLayoutOnStage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "continuousExposeIdentifier");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = 0u;
    v111 = 0u;
    v112 = 0u;
    v113 = 0u;
    -[SBAppSwitcherContinuousExposeSwitcherModifier appLayouts](self, "appLayouts");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v110, v119, 16);
    v78 = v8;
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v111;
LABEL_5:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v111 != v13)
          objc_enumerationMutation(v10);
        -[SBAppSwitcherContinuousExposeSwitcherModifier appLayoutContainingAppLayout:](self, "appLayoutContainingAppLayout:", *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * v14));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9 || (objc_msgSend(v9, "containsAnyItemFromAppLayout:", v15) & 1) == 0)
        {
          objc_msgSend(v15, "continuousExposeIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v16);

        }
        v17 = objc_msgSend(v6, "count");

        v8 = v78;
        if (v17 == v78)
          break;
        if (v12 == ++v14)
        {
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v110, v119, 16);
          if (v12)
            goto LABEL_5;
          break;
        }
      }
    }

    if (!v85)
    {
LABEL_27:
      if (objc_msgSend(v4, "count") <= v8)
      {
        v84 = (void *)objc_msgSend(v4, "mutableCopy");
      }
      else
      {
        objc_msgSend(v4, "subarrayWithRange:", 0, v8);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = (void *)objc_msgSend(v21, "mutableCopy");

      }
      v22 = MEMORY[0x1E0C809B0];
      v108[0] = MEMORY[0x1E0C809B0];
      v108[1] = 3221225472;
      v108[2] = __122__SBAppSwitcherContinuousExposeSwitcherModifier_adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip___block_invoke;
      v108[3] = &unk_1E8E9DE38;
      v23 = v4;
      v109 = v23;
      objc_msgSend(v6, "bs_filter:", v108);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "array");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(v25, "mutableCopy");

      v106[0] = v22;
      v106[1] = 3221225472;
      v106[2] = __122__SBAppSwitcherContinuousExposeSwitcherModifier_adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip___block_invoke_2;
      v106[3] = &unk_1E8E9DE38;
      v27 = v6;
      v28 = v26;
      v75 = v27;
      v107 = v27;
      objc_msgSend(v23, "bs_filter:", v106);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(v29, "mutableCopy");

      v5 = v84;
      if (objc_msgSend(v26, "count") || objc_msgSend(v30, "count"))
      {
        while (objc_msgSend(v26, "count") && objc_msgSend(v30, "count"))
        {
          objc_msgSend(v26, "firstObject");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "firstObject");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "replaceObjectAtIndex:withObject:", objc_msgSend(v84, "indexOfObject:", v32), v31);
          objc_msgSend(v30, "removeObject:", v32);
          objc_msgSend(v26, "removeObject:", v31);

        }
        if (objc_msgSend(v26, "count") || objc_msgSend(v30, "count"))
        {
          v76 = v30;
          v73 = v9;
          v74 = v4;
          v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v102 = 0u;
          v103 = 0u;
          v104 = 0u;
          v105 = 0u;
          -[SBAppSwitcherContinuousExposeSwitcherModifier appLayouts](self, "appLayouts");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v102, v118, 16);
          if (v35)
          {
            v36 = v35;
            v37 = *(_QWORD *)v103;
            do
            {
              for (i = 0; i != v36; ++i)
              {
                if (*(_QWORD *)v103 != v37)
                  objc_enumerationMutation(v34);
                -[SBAppSwitcherContinuousExposeSwitcherModifier appLayoutContainingAppLayout:](self, "appLayoutContainingAppLayout:", *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * i));
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "continuousExposeIdentifier");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "addObject:", v40);

              }
              v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v102, v118, 16);
            }
            while (v36);
          }

          v100 = 0u;
          v101 = 0u;
          v98 = 0u;
          v99 = 0u;
          v72 = v28;
          obj = v28;
          v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v117, 16);
          v5 = v84;
          v42 = v78;
          if (v41)
          {
            v43 = v41;
            v44 = *(_QWORD *)v99;
            v77 = *(_QWORD *)v99;
            do
            {
              v45 = 0;
              v80 = v43;
              do
              {
                if (*(_QWORD *)v99 != v44)
                  objc_enumerationMutation(obj);
                v46 = *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * v45);
                if (objc_msgSend(v5, "count") < v42)
                {
                  objc_msgSend(v5, "addObject:", v46);
                  goto LABEL_66;
                }
                v82 = v45;
                v96 = 0u;
                v97 = 0u;
                v94 = 0u;
                v95 = 0u;
                v47 = v5;
                v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v94, v116, 16);
                if (!v48)
                {
                  v50 = v47;
                  v43 = v80;
                  goto LABEL_65;
                }
                v49 = v48;
                v79 = v46;
                v50 = 0;
                v51 = *(_QWORD *)v95;
                v52 = 0x7FFFFFFFFFFFFFFFLL;
                do
                {
                  for (j = 0; j != v49; ++j)
                  {
                    if (*(_QWORD *)v95 != v51)
                      objc_enumerationMutation(v47);
                    v54 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * j);
                    v55 = objc_msgSend(v33, "indexOfObject:", v54);
                    if (v55 != 0x7FFFFFFFFFFFFFFFLL)
                    {
                      v56 = v55;
                      if (v52 == 0x7FFFFFFFFFFFFFFFLL || v55 > v52)
                      {
                        v57 = v54;

                        v52 = v56;
                        v50 = v57;
                      }
                    }
                  }
                  v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v94, v116, 16);
                }
                while (v49);

                v45 = v82;
                v5 = v84;
                v44 = v77;
                v42 = v78;
                v43 = v80;
                if (v50)
                {
                  objc_msgSend(v47, "replaceObjectAtIndex:withObject:", objc_msgSend(v47, "indexOfObject:", v50), v79);
LABEL_65:

                }
LABEL_66:
                ++v45;
              }
              while (v45 != v43);
              v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v117, 16);
            }
            while (v43);
          }

          objc_msgSend(obj, "removeAllObjects");
          v92 = 0u;
          v93 = 0u;
          v90 = 0u;
          v91 = 0u;
          v58 = v76;
          v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v90, v115, 16);
          if (v59)
          {
            v60 = v59;
            v61 = *(_QWORD *)v91;
            do
            {
              v62 = 0;
              v83 = v60;
              do
              {
                if (*(_QWORD *)v91 != v61)
                  objc_enumerationMutation(v58);
                v63 = *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * v62);
                if (objc_msgSend(v5, "containsObject:", v63))
                {
                  v88 = 0u;
                  v89 = 0u;
                  v86 = 0u;
                  v87 = 0u;
                  v64 = v33;
                  v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v86, v114, 16);
                  if (v65)
                  {
                    v66 = v65;
                    v67 = *(_QWORD *)v87;
LABEL_76:
                    v68 = 0;
                    while (1)
                    {
                      if (*(_QWORD *)v87 != v67)
                        objc_enumerationMutation(v64);
                      v69 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v68);
                      if ((BSEqualStrings() & 1) == 0
                        && (objc_msgSend(v84, "containsObject:", v69) & 1) == 0
                        && !objc_msgSend(v58, "containsObject:", v69))
                      {
                        break;
                      }
                      if (v66 == ++v68)
                      {
                        v66 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v86, v114, 16);
                        if (v66)
                          goto LABEL_76;
                        goto LABEL_84;
                      }
                    }
                    v70 = v69;

                    if (!v70)
                      goto LABEL_87;
                    v5 = v84;
                    objc_msgSend(v84, "replaceObjectAtIndex:withObject:", objc_msgSend(v84, "indexOfObject:", v63), v70);

                  }
                  else
                  {
LABEL_84:

LABEL_87:
                    v5 = v84;
                    objc_msgSend(v84, "removeObject:", v63);
                  }
                  v60 = v83;
                }
                ++v62;
              }
              while (v62 != v60);
              v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v90, v115, 16);
            }
            while (v60);
          }

          objc_msgSend(v58, "removeAllObjects");
          v9 = v73;
          v4 = v74;
          v28 = v72;
          v30 = v76;
        }
      }

      goto LABEL_93;
    }
    -[SBAppSwitcherContinuousExposeSwitcherModifier appLayoutsForContinuousExposeIdentifier:](self, "appLayoutsForContinuousExposeIdentifier:", v85);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "containsObject:", v85) & 1) == 0 && objc_msgSend(v18, "count"))
    {
      if (objc_msgSend(v18, "count") == 1)
      {
        objc_msgSend(v18, "firstObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9
          && ((objc_msgSend(v9, "isOrContainsAppLayout:", v19) & 1) != 0
           || objc_msgSend(v19, "isOrContainsAppLayout:", v9)))
        {

          goto LABEL_26;
        }

      }
      if (objc_msgSend(v6, "count") == v8)
      {
        objc_msgSend(v6, "lastObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "removeObject:", v20);

      }
      objc_msgSend(v6, "insertObject:atIndex:", v85, 0);
    }
LABEL_26:

    goto LABEL_27;
  }
  v5 = (void *)MEMORY[0x1E0C9AA60];
LABEL_93:

  return v5;
}

uint64_t __122__SBAppSwitcherContinuousExposeSwitcherModifier_adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

uint64_t __122__SBAppSwitcherContinuousExposeSwitcherModifier_adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

- (double)snapshotScaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int IsZero;
  double result;

  v6 = a4;
  -[SBAppSwitcherContinuousExposeSwitcherModifier _frameForAppLayout:withScaledApplied:scrollOffsetApplied:](self, "_frameForAppLayout:withScaledApplied:scrollOffsetApplied:", v6, 1, 0);
  v8 = v7;
  if (BSFloatIsZero())
  {
    -[SBAppSwitcherContinuousExposeSwitcherModifier _heightForCardInSwitcherWithScaleFactor:](self, "_heightForCardInSwitcherWithScaleFactor:", 0);
    v8 = v9;
  }
  -[SBAppSwitcherContinuousExposeSwitcherModifier containerViewBounds](self, "containerViewBounds");
  -[SBAppSwitcherContinuousExposeSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](self, "frameForLayoutRole:inAppLayout:withBounds:", a3, v6);
  v11 = v10;

  IsZero = BSFloatIsZero();
  result = v8 / v11;
  if (IsZero)
    return 1.0;
  return result;
}

- (id)scrollViewAttributes
{
  SBMutableSwitcherScrollViewAttributes *v3;

  v3 = objc_alloc_init(SBMutableSwitcherScrollViewAttributes);
  -[SBAppSwitcherContinuousExposeSwitcherModifier _contentSize](self, "_contentSize");
  -[SBSwitcherScrollViewAttributes setContentSize:](v3, "setContentSize:");
  -[SBSwitcherScrollViewAttributes setDecelerationRate:](v3, "setDecelerationRate:", *MEMORY[0x1E0CEBBA8]);
  -[SBSwitcherScrollViewAttributes setScrollViewPagingEnabled:](v3, "setScrollViewPagingEnabled:", 0);
  -[SBSwitcherScrollViewAttributes setInterpageSpacingForPaging:](v3, "setInterpageSpacingForPaging:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  -[SBSwitcherScrollViewAttributes setPagingOrigin:](v3, "setPagingOrigin:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  -[SBSwitcherScrollViewAttributes setInterpolatesDuringSwipeToKill:](v3, "setInterpolatesDuringSwipeToKill:", 0);
  return v3;
}

- (double)minimumTranslationToKillIndex:(unint64_t)a3
{
  CGRect v6;

  -[SBAppSwitcherContinuousExposeSwitcherModifier frameForIndex:](self, "frameForIndex:");
  -[SBAppSwitcherContinuousExposeSwitcherModifier scaleForIndex:](self, "scaleForIndex:", a3);
  SBTransformedRectWithScale();
  return CGRectGetMinY(v6);
}

- (CGSize)_contentSize
{
  double v3;
  double v4;
  double v5;
  double width;
  CGSize result;

  -[SBAppSwitcherContinuousExposeSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
  v5 = v4;
  width = self->_cachedFittedContentSize.width;
  if (width < v3)
    width = v3;
  result.height = v5;
  result.width = width;
  return result;
}

- (CGSize)_fittedContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_cachedFittedContentSize.width;
  height = self->_cachedFittedContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGPoint)contentOffsetForIndex:(unint64_t)a3 alignment:(int64_t)a4
{
  int v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double v15;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGPoint result;

  v7 = -[SBAppSwitcherContinuousExposeSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
  -[SBAppSwitcherContinuousExposeSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppSwitcherContinuousExposeSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
  v10 = v9;
  objc_msgSend(v8, "switcherHorizontalEdgeSpacing");
  v12 = v11;
  -[SBAppSwitcherContinuousExposeSwitcherModifier _frameForIndex:withScaleApplied:scrollOffsetApplied:](self, "_frameForIndex:withScaleApplied:scrollOffsetApplied:", a3, 1, 0);
  v17 = 0.0;
  switch(a4)
  {
    case 0:
    case 3:
      if (v7)
        v17 = v12;
      else
        v17 = v10 - v15 - v12;
      break;
    case 1:
      if (v7)
        v17 = v10 - v15 - v12;
      else
        v17 = v12;
      break;
    case 2:
      v17 = (v10 - v15) * 0.5;
      break;
    default:
      break;
  }
  v18 = CGRectGetMinX(*(CGRect *)&v13) - v17;
  -[SBAppSwitcherContinuousExposeSwitcherModifier _contentSize](self, "_contentSize");
  v20 = v19 - v10;
  v21 = fmax(v18, 0.0);
  if (v20 <= v21)
    v22 = v20;
  else
    v22 = v21;

  v23 = 0.0;
  v24 = v22;
  result.y = v23;
  result.x = v24;
  return result;
}

- (double)distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch:(unint64_t)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double MaxX;
  double result;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v4 = -[SBAppSwitcherContinuousExposeSwitcherModifier _visiblePileRange](self, "_visiblePileRange", a3);
  v6 = v5;
  -[SBAppSwitcherContinuousExposeSwitcherModifier _boundingFrameForPileAtIndex:withScrollOffsetApplied:](self, "_boundingFrameForPileAtIndex:withScrollOffsetApplied:", v4, 0);
  if (v6 >= 2)
  {
    v11 = v7;
    v12 = v8;
    v13 = v9;
    v14 = v10;
    -[SBAppSwitcherContinuousExposeSwitcherModifier _boundingFrameForPileAtIndex:withScrollOffsetApplied:](self, "_boundingFrameForPileAtIndex:withScrollOffsetApplied:", v4 + 1, 0);
    MaxX = CGRectGetMaxX(v30);
    v31.origin.x = v11;
    v31.origin.y = v12;
    v31.size.width = v13;
    v31.size.height = v14;
    if (MaxX > CGRectGetMaxX(v31))
      ++v4;
  }
  result = 0.0;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[SBAppSwitcherContinuousExposeSwitcherModifier _boundingFrameForPileAtIndex:withScrollOffsetApplied:](self, "_boundingFrameForPileAtIndex:withScrollOffsetApplied:", v4, 1, 0.0);
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    if (-[SBAppSwitcherContinuousExposeSwitcherModifier isRTLEnabled](self, "isRTLEnabled"))
    {
      -[SBAppSwitcherContinuousExposeSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
      v26 = v25 - v18;
    }
    else
    {
      v32.origin.x = v18;
      v32.origin.y = v20;
      v32.size.width = v22;
      v32.size.height = v24;
      v26 = CGRectGetMaxX(v32);
    }
    -[SBAppSwitcherContinuousExposeSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "switcherHorizontalInterItemSpacing");
    v29 = v28;

    return v26 + v29;
  }
  return result;
}

- (BOOL)shouldConfigureInAppDockHiddenAssertion
{
  return 0;
}

- (BOOL)shouldConfigureInAppDockVisibleAssertion
{
  return 0;
}

- (BOOL)wantsDockBehaviorAssertion
{
  return 1;
}

- (double)dockProgress
{
  return 1.0;
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

- (BOOL)wantsSpaceAccessoryViewPointerInteractionsForAppLayout:(id)a3
{
  return 1;
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

- (id)_currentLayoutCalculationsValidityToken
{
  SBSwitcherLayoutCalculationsCacheValidityToken *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = [SBSwitcherLayoutCalculationsCacheValidityToken alloc];
  v4 = -[SBAppSwitcherContinuousExposeSwitcherModifier appLayoutsGenerationCount](self, "appLayoutsGenerationCount");
  v5 = -[SBAppSwitcherContinuousExposeSwitcherModifier continuousExposeIdentifiersGenerationCount](self, "continuousExposeIdentifiersGenerationCount");
  v6 = -[SBAppSwitcherContinuousExposeSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation");
  -[SBAppSwitcherContinuousExposeSwitcherModifier _scaledSwitcherViewBounds](self, "_scaledSwitcherViewBounds");
  return -[SBSwitcherLayoutCalculationsCacheValidityToken initWithAppLayoutsGenCount:continuousExposeIdentifiersGenCount:switcherInterfaceOrientation:containerViewBounds:modifierEventGenCount:](v3, "initWithAppLayoutsGenCount:continuousExposeIdentifiersGenCount:switcherInterfaceOrientation:containerViewBounds:modifierEventGenCount:", v4, v5, v6, self->_modifierEventGenCount);
}

- (id)_compactedBoundingBoxSizesByAppLayout
{
  NSDictionary *cached_compactedBoundingBoxSizesByAppLayout;
  void *v4;
  NSDictionary *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  NSDictionary *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  cached_compactedBoundingBoxSizesByAppLayout = self->_cached_compactedBoundingBoxSizesByAppLayout;
  if (!cached_compactedBoundingBoxSizesByAppLayout)
  {
    -[SBAppSwitcherContinuousExposeSwitcherModifier appLayouts](self, "appLayouts");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          -[SBSwitcherModifier autoLayoutSpaceForAppLayout:](self, "autoLayoutSpaceForAppLayout:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "compactedBoundingBox");
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", v13, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKey:](v5, "setObject:forKey:", v15, v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }

    v16 = self->_cached_compactedBoundingBoxSizesByAppLayout;
    self->_cached_compactedBoundingBoxSizesByAppLayout = v5;

    cached_compactedBoundingBoxSizesByAppLayout = self->_cached_compactedBoundingBoxSizesByAppLayout;
  }
  return cached_compactedBoundingBoxSizesByAppLayout;
}

- (id)buildLayoutCalculationsForCache:(id)a3
{
  SBAppSwitcherContinuousExposeSwitcherModifier *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double horizontalEdgeSpacingScaleFactor;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  int v16;
  unint64_t v17;
  void *v18;
  double v19;
  double v20;
  NSDictionary *cached_compactedBoundingBoxSizesByAppLayout;
  void *v22;
  void *v23;
  double v24;
  double v25;
  unint64_t v26;
  double v27;
  double v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  unint64_t v34;
  double y;
  double x;
  double height;
  double width;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  SBSwitcherLayoutCalculations *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double MaxX;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  _BOOL4 IsNull;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  double v72;
  double v73;
  double *p_width;
  double v75;
  double v76;
  SBAppSwitcherContinuousExposeSwitcherModifier *v77;
  double v78;
  double v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t i;
  void *v85;
  double v86;
  NSDictionary *v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t j;
  uint64_t v93;
  void *v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  void *v103;
  NSDictionary *cachedPileBoundingFrameByPileIdentifier;
  double v106;
  double scaleFactor;
  double v108;
  void *v109;
  void *v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  SBAppSwitcherContinuousExposeSwitcherModifier *v120;
  void *v121;
  void *v122;
  double v123;
  void *v124;
  double v125;
  double v126;
  double v127;
  double v128;
  id v129;
  CGFloat v130;
  CGFloat v131;
  double v132;
  double v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  _BYTE v142[128];
  _BYTE v143[128];
  uint64_t v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;

  v3 = self;
  v144 = *MEMORY[0x1E0C80C00];
  -[SBAppSwitcherContinuousExposeSwitcherModifier switcherSettings](self, "switcherSettings", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chamoisSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBAppSwitcherContinuousExposeSwitcherModifier chamoisLayoutAttributes](v3, "chamoisLayoutAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppSwitcherContinuousExposeSwitcherModifier containerViewBounds](v3, "containerViewBounds");
  scaleFactor = v3->_scaleFactor;
  v108 = v7;
  objc_msgSend(v6, "screenEdgePadding");
  objc_msgSend(v6, "switcherHorizontalEdgeSpacing");
  v9 = v8;
  horizontalEdgeSpacingScaleFactor = v3->_horizontalEdgeSpacingScaleFactor;
  v11 = v8 * horizontalEdgeSpacingScaleFactor;
  objc_msgSend(v6, "switcherHorizontalInterItemSpacing");
  v123 = v12 * v3->_scaleFactor;
  objc_msgSend(v6, "switcherVerticalEdgeSpacing");
  objc_msgSend(v6, "switcherVerticalInterItemSpacing");
  v109 = v6;
  objc_msgSend(v6, "switcherPileCardMinimumPeekAmount");
  v14 = v13;
  v15 = v3->_scaleFactor;
  v16 = -[SBAppSwitcherContinuousExposeSwitcherModifier isRTLEnabled](v3, "isRTLEnabled");
  v110 = v5;
  v17 = objc_msgSend(v5, "numberOfVisibleItemsPerGroup");
  -[SBAppSwitcherContinuousExposeSwitcherModifier continuousExposeIdentifiersInSwitcher](v3, "continuousExposeIdentifiersInSwitcher");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppSwitcherContinuousExposeSwitcherModifier _heightForCardInSwitcherWithScaleFactor:](v3, "_heightForCardInSwitcherWithScaleFactor:", 1);
  v20 = v19;
  cached_compactedBoundingBoxSizesByAppLayout = v3->_cached_compactedBoundingBoxSizesByAppLayout;
  v3->_cached_compactedBoundingBoxSizesByAppLayout = 0;

  -[SBAppSwitcherContinuousExposeSwitcherModifier _compactedBoundingBoxSizesByAppLayout](v3, "_compactedBoundingBoxSizesByAppLayout");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v18, "count"));
  v129 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v24 = -(v9 * horizontalEdgeSpacingScaleFactor);
  if (v16)
    v24 = v11;
  v25 = v24 + 0.0;
  v121 = v23;
  v122 = v18;
  if (objc_msgSend(v18, "count", *(_QWORD *)&v11))
  {
    v26 = 0;
    v127 = v14 * v15;
    v119 = *MEMORY[0x1E0C9D628];
    v117 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v118 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v116 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    v114 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v115 = *MEMORY[0x1E0C9D648];
    v112 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v113 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v27 = 1.0;
    if (v16)
      v27 = -1.0;
    v111 = -v27;
    v28 = v25;
    v128 = v20;
    v120 = v3;
    do
    {
      objc_msgSend(v18, "objectAtIndex:", v26);
      v29 = objc_claimAutoreleasedReturnValue();
      -[SBAppSwitcherContinuousExposeSwitcherModifier appLayoutsForContinuousExposeIdentifier:](v3, "appLayoutsForContinuousExposeIdentifier:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "count");
      v125 = v28;
      v126 = v25;
      if ((v26 & 1) != 0)
        v32 = v28;
      else
        v32 = v25;
      v124 = (void *)v29;
      if (v31)
      {
        v33 = v31;
        v34 = 0;
        y = v118;
        x = v119;
        v133 = v32;
        height = v116;
        width = v117;
        v39 = v32;
        do
        {
          objc_msgSend(v30, "objectAtIndex:", v34);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKey:", v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v41;
          if (v41)
          {
            objc_msgSend(v41, "CGSizeValue");
            v44 = v20 / v43 + (double)v34 * -0.01;
            v46 = v45 * v44;
            v132 = v32;
            v130 = y;
            v131 = width;
            if (v34)
            {
              if ((v16 & 1) != 0)
              {
                v47 = v133;
                if (v133 < v127 + v39 - v46)
                  v47 = v127 + v39 - v46;
              }
              else
              {
                v47 = v133;
                if (v133 >= v39 - v127 + v46)
                  v47 = v39 - v127 + v46;
              }
            }
            else
            {
              v47 = v133;
            }
            v133 = v47;
            SBRectWithSize();
            SBUnintegralizedRectCenteredAboutPoint();
            v49 = v48;
            v51 = v50;
            v53 = v52;
            v55 = v54;
            v56 = objc_alloc_init(SBSwitcherLayoutCalculations);
            -[SBSwitcherLayoutCalculations setFrame:](v56, "setFrame:", v49, v51, v53, v55);
            -[SBSwitcherLayoutCalculations setScale:](v56, "setScale:", v44);
            objc_msgSend(v129, "setObject:forKey:", v56, v40);
            v57 = v49;
            v58 = v51;
            v59 = v53;
            v60 = v55;
            if (v16)
              MaxX = CGRectGetMaxX(*(CGRect *)&v57);
            else
              MaxX = CGRectGetMinX(*(CGRect *)&v57);
            v39 = MaxX;
            v32 = v132;
            if (v34 < v17)
              v32 = MaxX;
            SBRectWithSize();
            SBUnintegralizedRectCenteredAboutPoint();
            v148.origin.x = v62;
            v148.origin.y = v63;
            v148.size.width = v64;
            v148.size.height = v65;
            v145.origin.x = x;
            v145.origin.y = v130;
            v145.size.width = v131;
            v145.size.height = height;
            v146 = CGRectUnion(v145, v148);
            x = v146.origin.x;
            y = v146.origin.y;
            width = v146.size.width;
            height = v146.size.height;

            v20 = v128;
          }

          ++v34;
        }
        while (v33 != v34);
      }
      else
      {
        height = v116;
        width = v117;
        y = v118;
        x = v119;
      }
      v147.origin.x = x;
      v147.origin.y = y;
      v147.size.width = width;
      v147.size.height = height;
      IsNull = CGRectIsNull(v147);
      v68 = v114;
      v67 = v115;
      if (!IsNull)
      {
        v67 = x;
        v68 = y;
      }
      v70 = v112;
      v69 = v113;
      if (!IsNull)
      {
        v69 = width;
        v70 = height;
      }
      v28 = v125;
      v25 = v126;
      if ((v26 & 1) != 0)
        v28 = v32 + v111 * v123;
      else
        v25 = v32 + v111 * v123;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v67, v68, v69, v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v121;
      objc_msgSend(v121, "setObject:forKey:", v71, v124);

      ++v26;
      v18 = v122;
      v3 = v120;
    }
    while (v26 < objc_msgSend(v122, "count"));
  }
  else
  {
    v28 = v25;
  }
  v72 = v108 * scaleFactor;
  v73 = v106 - v123;
  p_width = &v3->_cachedFittedContentSize.width;
  if ((v16 & 1) != 0)
  {
    if (v25 >= v28)
      v75 = v25;
    else
      v75 = v28;
    *p_width = v73 + v75;
    v3->_cachedFittedContentSize.height = v72;
    objc_storeStrong((id *)&v3->_cachedPileBoundingFrameByPileIdentifier, v23);
  }
  else
  {
    if (v25 >= v28)
      v76 = v28;
    else
      v76 = v25;
    *p_width = v73 - v76;
    v3->_cachedFittedContentSize.height = v72;
    v77 = v3;
    -[SBAppSwitcherContinuousExposeSwitcherModifier _contentSize](v3, "_contentSize");
    v79 = v78;
    v138 = 0u;
    v139 = 0u;
    v140 = 0u;
    v141 = 0u;
    v80 = v129;
    v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v138, v143, 16);
    if (v81)
    {
      v82 = v81;
      v83 = *(_QWORD *)v139;
      do
      {
        for (i = 0; i != v82; ++i)
        {
          if (*(_QWORD *)v139 != v83)
            objc_enumerationMutation(v80);
          objc_msgSend(v80, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v138 + 1) + 8 * i));
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "frame");
          objc_msgSend(v85, "setFrame:", v79 + v86);

        }
        v82 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v138, v143, 16);
      }
      while (v82);
    }

    v87 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v23, "count"));
    v134 = 0u;
    v135 = 0u;
    v136 = 0u;
    v137 = 0u;
    v88 = v23;
    v89 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v134, v142, 16);
    if (v89)
    {
      v90 = v89;
      v91 = *(_QWORD *)v135;
      do
      {
        for (j = 0; j != v90; ++j)
        {
          if (*(_QWORD *)v135 != v91)
            objc_enumerationMutation(v88);
          v93 = *(_QWORD *)(*((_QWORD *)&v134 + 1) + 8 * j);
          objc_msgSend(v88, "objectForKey:", v93);
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "CGRectValue");
          v96 = v95;
          v98 = v97;
          v100 = v99;
          v102 = v101;

          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v79 + v96, v98, v100, v102);
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKey:](v87, "setObject:forKey:", v103, v93);

        }
        v90 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v134, v142, 16);
      }
      while (v90);
    }

    cachedPileBoundingFrameByPileIdentifier = v77->_cachedPileBoundingFrameByPileIdentifier;
    v77->_cachedPileBoundingFrameByPileIdentifier = v87;

    v23 = v121;
    v18 = v122;
  }

  return v129;
}

- (CGRect)_visibleSwitcherBoundsIncludingShadow
{
  void *v3;
  double v4;
  double v5;
  CGRect v6;

  -[SBAppSwitcherContinuousExposeSwitcherModifier switcherSettings](self, "switcherSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "switcherCardShadowRadius");
  v5 = v4;

  -[SBAppSwitcherContinuousExposeSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
  return CGRectInset(v6, v5 * -2.8, v5 * -2.8);
}

- (id)_visiblePileIdentifiers
{
  id v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  unint64_t v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  void *v18;
  CGRect v20;
  CGRect v21;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[SBAppSwitcherContinuousExposeSwitcherModifier _visibleSwitcherBoundsIncludingShadow](self, "_visibleSwitcherBoundsIncludingShadow");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SBAppSwitcherContinuousExposeSwitcherModifier continuousExposeIdentifiersInSwitcher](self, "continuousExposeIdentifiersInSwitcher");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    v13 = 0;
    do
    {
      -[SBAppSwitcherContinuousExposeSwitcherModifier _boundingFrameForPileAtIndex:withScrollOffsetApplied:](self, "_boundingFrameForPileAtIndex:withScrollOffsetApplied:", v13, 1);
      v21.origin.x = v14;
      v21.origin.y = v15;
      v21.size.width = v16;
      v21.size.height = v17;
      v20.origin.x = v5;
      v20.origin.y = v7;
      v20.size.width = v9;
      v20.size.height = v11;
      if (CGRectIntersectsRect(v20, v21))
      {
        objc_msgSend(v12, "objectAtIndex:", v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v18);

      }
      ++v13;
    }
    while (v13 < objc_msgSend(v12, "count"));
  }

  return v3;
}

- (unint64_t)_indexOfAppLayoutInItsPile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  objc_msgSend(v4, "continuousExposeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppSwitcherContinuousExposeSwitcherModifier appLayoutsForContinuousExposeIdentifier:](self, "appLayoutsForContinuousExposeIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObject:", v4);

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  else
    return v7;
}

- (CGRect)_frameForIndex:(unint64_t)a3 withScaleApplied:(BOOL)a4 scrollOffsetApplied:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v9;
  void *v10;
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
  CGRect result;

  v5 = a5;
  v6 = a4;
  -[SBAppSwitcherContinuousExposeSwitcherModifier appLayouts](self, "appLayouts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBAppSwitcherContinuousExposeSwitcherModifier _frameForAppLayout:withScaledApplied:scrollOffsetApplied:](self, "_frameForAppLayout:withScaledApplied:scrollOffsetApplied:", v10, v6, v5);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = v12;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGRect)_frameForAppLayout:(id)a3 withScaledApplied:(BOOL)a4 scrollOffsetApplied:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  SBSwitcherLayoutCalculationsCache *appLayoutLayoutCalculationsCache;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect result;

  v5 = a5;
  v8 = a3;
  appLayoutLayoutCalculationsCache = self->_appLayoutLayoutCalculationsCache;
  -[SBAppSwitcherContinuousExposeSwitcherModifier _currentLayoutCalculationsValidityToken](self, "_currentLayoutCalculationsValidityToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSwitcherLayoutCalculationsCache frameForKey:validityToken:fallback:](appLayoutLayoutCalculationsCache, "frameForKey:validityToken:fallback:", v8, v10, &__block_literal_global_46_0);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  if (!a4)
  {
    -[SBAppSwitcherContinuousExposeSwitcherModifier _compactedBoundingBoxSizesByAppLayout](self, "_compactedBoundingBoxSizesByAppLayout");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "CGSizeValue");

    SBRectWithSize();
    UIRectGetCenter();
    SBUnintegralizedRectCenteredAboutPoint();
    v12 = v21;
    v14 = v22;
    v16 = v23;
    v18 = v24;
  }
  if (v5)
  {
    -[SBAppSwitcherContinuousExposeSwitcherModifier scrollViewContentOffset](self, "scrollViewContentOffset");
    v12 = v12 - v25;
  }

  v26 = v12;
  v27 = v14;
  v28 = v16;
  v29 = v18;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

double __106__SBAppSwitcherContinuousExposeSwitcherModifier__frameForAppLayout_withScaledApplied_scrollOffsetApplied___block_invoke()
{
  return *MEMORY[0x1E0C9D648];
}

- (CGRect)_boundingFrameForPileAtIndex:(unint64_t)a3 withScrollOffsetApplied:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
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
  CGRect result;

  v4 = a4;
  -[SBAppSwitcherContinuousExposeSwitcherModifier continuousExposeIdentifiersInSwitcher](self, "continuousExposeIdentifiersInSwitcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBAppSwitcherContinuousExposeSwitcherModifier _boundingFrameForPileWithIdentifier:withScrollOffsetApplied:](self, "_boundingFrameForPileWithIdentifier:withScrollOffsetApplied:", v8, v4);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGRect)_boundingFrameForPileWithIdentifier:(id)a3 withScrollOffsetApplied:(BOOL)a4
{
  _BOOL4 v4;
  SBSwitcherLayoutCalculationsCache *appLayoutLayoutCalculationsCache;
  id v7;
  void *v8;
  void *v9;
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
  CGRect result;

  v4 = a4;
  appLayoutLayoutCalculationsCache = self->_appLayoutLayoutCalculationsCache;
  v7 = a3;
  -[SBAppSwitcherContinuousExposeSwitcherModifier _currentLayoutCalculationsValidityToken](self, "_currentLayoutCalculationsValidityToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSwitcherLayoutCalculationsCache rebuildIfNecessaryForValidityToken:](appLayoutLayoutCalculationsCache, "rebuildIfNecessaryForValidityToken:", v8);

  -[NSDictionary objectForKey:](self->_cachedPileBoundingFrameByPileIdentifier, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "CGRectValue");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  if (v4)
  {
    -[SBAppSwitcherContinuousExposeSwitcherModifier scrollViewContentOffset](self, "scrollViewContentOffset");
    v11 = v11 - v18;
  }
  v19 = v11;
  v20 = v13;
  v21 = v15;
  v22 = v17;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (double)_heightForCardInSwitcherWithScaleFactor:(BOOL)a3
{
  void *v4;
  double v5;
  double v6;

  -[SBAppSwitcherContinuousExposeSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "screenEdgePadding");
  objc_msgSend(v4, "switcherVerticalEdgeSpacing");
  objc_msgSend(v4, "switcherVerticalInterItemSpacing");
  -[SBAppSwitcherContinuousExposeSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
  -[SBAppSwitcherContinuousExposeSwitcherModifier numberOfRowsInGridSwitcher](self, "numberOfRowsInGridSwitcher");
  -[SBAppSwitcherContinuousExposeSwitcherModifier screenScale](self, "screenScale");
  -[SBAppSwitcherContinuousExposeSwitcherModifier floatingDockHeight](self, "floatingDockHeight");
  -[SBAppSwitcherContinuousExposeSwitcherModifier statusBarHeight](self, "statusBarHeight");
  BSFloatRoundForScale();
  v6 = v5;

  return v6;
}

- (BOOL)handlesTapAppLayoutEvents
{
  return self->_handlesTapAppLayoutEvents;
}

- (void)setHandlesTapAppLayoutEvents:(BOOL)a3
{
  self->_handlesTapAppLayoutEvents = a3;
}

- (BOOL)handlesTapAppLayoutHeaderEvents
{
  return self->_handlesTapAppLayoutHeaderEvents;
}

- (void)setHandlesTapAppLayoutHeaderEvents:(BOOL)a3
{
  self->_handlesTapAppLayoutHeaderEvents = a3;
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (void)setScaleFactor:(double)a3
{
  self->_scaleFactor = a3;
}

- (double)horizontalEdgeSpacingScaleFactor
{
  return self->_horizontalEdgeSpacingScaleFactor;
}

- (void)setHorizontalEdgeSpacingScaleFactor:(double)a3
{
  self->_horizontalEdgeSpacingScaleFactor = a3;
}

- (BOOL)showsActiveAppLayoutInSwitcher
{
  return self->_showsActiveAppLayoutInSwitcher;
}

- (void)setShowsActiveAppLayoutInSwitcher:(BOOL)a3
{
  self->_showsActiveAppLayoutInSwitcher = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAppLayout, 0);
  objc_storeStrong((id *)&self->_cached_compactedBoundingBoxSizesByAppLayout, 0);
  objc_storeStrong((id *)&self->_cachedPileBoundingFrameByPileIdentifier, 0);
  objc_storeStrong((id *)&self->_appLayoutLayoutCalculationsCache, 0);
}

- (void)adjustedContinuousExposeIdentifiersInSwitcherFromPreviousIdentifiersInSwitcher:identifiersInStrip:.cold.1()
{
  __assert_rtn("_SBSwitcherStripItemsOrder", "SBAppSwitcherContinuousExposeSwitcherModifier.m", 68, "stripSize > 0 && stripSize < 6");
}

@end
