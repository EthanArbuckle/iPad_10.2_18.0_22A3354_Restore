@implementation _SBFullScreenAppFloorSwitcherModifier

- (id)animationAttributesForLayoutElement:(id)a3
{
  void *v3;
  void *v4;
  SBMutableSwitcherAnimationAttributes *v5;
  void *v6;
  void *v7;

  -[_SBFullScreenAppFloorSwitcherModifier switcherSettings](self, "switcherSettings", a3);
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

- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  if (a3 == 4)
    return 2;
  if (objc_msgSend(a4, "environment") == 3)
    return 2;
  return 1;
}

- (BOOL)shouldUseBrightMaterialForIndex:(unint64_t)a3
{
  return 0;
}

- (double)wallpaperOverlayAlphaForIndex:(unint64_t)a3
{
  return 0.0;
}

- (double)titleOpacityForIndex:(unint64_t)a3
{
  return 0.0;
}

- (double)titleAndIconOpacityForIndex:(unint64_t)a3
{
  return 0.0;
}

- (int64_t)tintStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (BOOL)shouldAccessoryDrawShadowForAppLayout:(id)a3
{
  return 0;
}

- (double)shadowOffsetForIndex:(unint64_t)a3
{
  return 0.0;
}

- (double)lighteningAlphaForIndex:(unint64_t)a3
{
  return 0.0;
}

- (BOOL)isResizeGrabberVisibleForAppLayout:(id)a3
{
  void *v4;
  int v5;

  objc_msgSend(a3, "itemForLayoutRole:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = -[_SBFullScreenAppFloorSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled") ^ 1;
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (BOOL)isLayoutRoleKillable:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  return 0;
}

- (BOOL)isLayoutRoleEligibleForContentDragSpringLoading:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (BOOL)isItemResizingAllowedForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (BOOL)isItemContainerPointerInteractionEnabled
{
  return 0;
}

- (BOOL)isIndexRubberbandableForSwipeToKill:(unint64_t)a3
{
  return 0;
}

- (int64_t)headerStyleForIndex:(unint64_t)a3
{
  return 0;
}

- (double)backgroundOpacityForIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  double v6;

  -[_SBFullScreenAppFloorSwitcherModifier appLayouts](self, "appLayouts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 0.0;
  if (objc_msgSend(v5, "environment") != 3)
  {
    if (objc_msgSend(v5, "isSplitConfiguration"))
      v6 = 1.0;
    else
      v6 = 0.0;
  }

  return v6;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  double v8;

  -[_SBFullScreenAppFloorSwitcherModifier appLayouts](self, "appLayouts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 1.0;
  if (a3 != 4)
  {
    if (objc_msgSend(v7, "environment") == 3)
      v8 = 1.0;
    else
      v8 = 0.0;
  }

  return v8;
}

- (id)keyboardSuppressionMode
{
  return +[SBSwitcherKeyboardSuppressionMode suppressionModeNone](SBSwitcherKeyboardSuppressionMode, "suppressionModeNone");
}

- (id)appLayoutsToResignActive
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (BOOL)shouldAllowContentViewTouchesForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  void *v6;

  -[_SBFullScreenAppFloorSwitcherModifier appLayoutContainingAppLayout:](self, "appLayoutContainingAppLayout:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = !-[_SBFullScreenAppFloorSwitcherModifier _isLayoutRoleBehindCenterWindow:appLayout:](self, "_isLayoutRoleBehindCenterWindow:appLayout:", a3, v6);

  return a3;
}

- (BOOL)isLayoutRoleSelectable:(int64_t)a3 inAppLayout:(id)a4
{
  void *v6;

  -[_SBFullScreenAppFloorSwitcherModifier appLayoutContainingAppLayout:](self, "appLayoutContainingAppLayout:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = -[_SBFullScreenAppFloorSwitcherModifier _isLayoutRoleBehindCenterWindow:appLayout:](self, "_isLayoutRoleBehindCenterWindow:appLayout:", a3, v6);

  return a3;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  return 1.0;
}

- (BOOL)clipsToUnobscuredMarginAtIndex:(unint64_t)a3
{
  return 0;
}

- (id)topMostLayoutElements
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  SBAppLayout *v8;
  SBAppLayout *activeAppLayout;
  void *v10;
  uint64_t v11;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[_SBFullScreenAppFloorSwitcherModifier appLayoutsContainedWithinAppLayout:](self, "appLayoutsContainedWithinAppLayout:", self->_activeAppLayout);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(obj);
        v8 = *(SBAppLayout **)(*((_QWORD *)&v14 + 1) + 8 * i);
        activeAppLayout = self->_activeAppLayout;
        if (v8 == activeAppLayout
          || (objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "itemForLayoutRole:", 1),
              v10 = (void *)objc_claimAutoreleasedReturnValue(),
              v11 = -[SBAppLayout layoutRoleForItem:](activeAppLayout, "layoutRoleForItem:", v10),
              v10,
              v11 != 4))
        {
          objc_msgSend(v3, "addObject:", v8);
        }
        else
        {
          objc_msgSend(v3, "insertObject:atIndex:", v8, 0);
        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  return v3;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  char v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  UIRectCornerRadii result;

  -[_SBFullScreenAppFloorSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_SBFullScreenAppFloorSwitcherModifier displayCornerRadius](self, "displayCornerRadius");
  if (objc_msgSend(v6, "environment") == 3 && BSFloatIsZero())
  {
    -[_SBFullScreenAppFloorSwitcherModifier switcherSettings](self, "switcherSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "gridSwitcherHomeButtonDeviceCardCornerRadius");

  }
  SBRectCornerRadiiForRadius();
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v6, "allItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "count") != 1)
    goto LABEL_8;
  v17 = -[_SBFullScreenAppFloorSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled");

  if ((v17 & 1) == 0)
  {
    -[_SBFullScreenAppFloorSwitcherModifier appLayoutContainingAppLayout:](self, "appLayoutContainingAppLayout:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 != v16)
    {
      objc_msgSend(v6, "itemForLayoutRole:", 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SBFullScreenAppFloorSwitcherModifier cornerRadiiForLayoutRole:inAppLayout:withCornerRadii:](self, "cornerRadiiForLayoutRole:inAppLayout:withCornerRadii:", objc_msgSend(v16, "layoutRoleForItem:", v18), v16, v9, v11, v13, v15);
      v9 = v19;
      v11 = v20;
      v13 = v21;
      v15 = v22;

    }
LABEL_8:

  }
  v23 = v9;
  v24 = v11;
  v25 = v13;
  v26 = v15;
  result.topRight = v26;
  result.bottomRight = v25;
  result.bottomLeft = v24;
  result.topLeft = v23;
  return result;
}

- (BOOL)shouldScaleOverlayToFillBoundsAtIndex:(unint64_t)a3
{
  return 0;
}

- (unint64_t)activeCornersForTouchResizeForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  id v7;
  objc_super v9;

  v6 = a4;
  if (-[_SBFullScreenAppFloorSwitcherModifier displayOrdinal](self, "displayOrdinal"))
  {
    v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_SBFullScreenAppFloorSwitcherModifier;
    v7 = -[_SBFullScreenAppFloorSwitcherModifier activeCornersForTouchResizeForLayoutRole:inAppLayout:](&v9, sel_activeCornersForTouchResizeForLayoutRole_inAppLayout_, a3, v6);
  }

  return (unint64_t)v7;
}

- (BOOL)wantsSwitcherDimmingView
{
  return 0;
}

- (BOOL)isScrollEnabled
{
  return 0;
}

- (BOOL)wantsHomeScreenPointerInteractions
{
  return 0;
}

- (int64_t)switcherBackdropBlurType
{
  return 1;
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

- (BOOL)isSwitcherWindowVisible
{
  return 1;
}

- (BOOL)isHomeScreenContentRequired
{
  return 0;
}

- (int64_t)homeScreenBackdropBlurType
{
  return 1;
}

- (int64_t)wallpaperStyle
{
  if (-[SBAppLayout type](self->_activeAppLayout, "type"))
    return 1;
  else
    return 4;
}

- (BOOL)isWallpaperRequiredForSwitcher
{
  return 0;
}

- (double)contentViewScale
{
  return 1.0;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(0, 0);
}

- (BOOL)wantsSwitcherBackdropBlur
{
  return 0;
}

- (BOOL)isContainerStatusBarVisible
{
  return 0;
}

- (double)containerStatusBarAnimationDuration
{
  return 0.35;
}

- (BOOL)wantsDockWindowLevelAssertion
{
  return 0;
}

- (BOOL)wantsAsynchronousSurfaceRetentionAssertion
{
  return 0;
}

- (id)appExposeAccessoryButtonsBundleIdentifier
{
  return 0;
}

- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3
{
  return 1;
}

- (BOOL)shouldPerformRotationAnimationForOrientationChange
{
  return 0;
}

- (BOOL)shouldAllowGroupOpacityForAppLayout:(id)a3
{
  return 0;
}

- (double)rotationAngleForIndex:(unint64_t)a3
{
  return 0.0;
}

- (BOOL)isLayoutRoleDraggable:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (double)blurViewIconScaleForIndex:(unint64_t)a3
{
  return 1.0;
}

- (unint64_t)maskedCornersForIndex:(unint64_t)a3
{
  return 0;
}

- (BOOL)shouldSuppressHighlightEffectForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  void *v6;

  -[_SBFullScreenAppFloorSwitcherModifier appLayoutContainingAppLayout:](self, "appLayoutContainingAppLayout:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = -[_SBFullScreenAppFloorSwitcherModifier _isLayoutRoleBehindCenterWindow:appLayout:](self, "_isLayoutRoleBehindCenterWindow:appLayout:", a3, v6);

  return a3;
}

- (BOOL)_isLayoutRoleBehindCenterWindow:(int64_t)a3 appLayout:(id)a4
{
  void *v5;
  BOOL IsValidForSplitView;

  objc_msgSend(a4, "itemForLayoutRole:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    IsValidForSplitView = SBLayoutRoleIsValidForSplitView(a3);
  else
    IsValidForSplitView = 0;

  return IsValidForSplitView;
}

- (double)wallpaperScale
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[_SBFullScreenAppFloorSwitcherModifier switcherSettings](self, "switcherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "animationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wallpaperScaleInApplication");
  v5 = v4;

  return v5;
}

- (double)homeScreenDimmingAlpha
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[_SBFullScreenAppFloorSwitcherModifier switcherSettings](self, "switcherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "animationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dimmingAlphaInApplication");
  v5 = v4;

  return v5;
}

- (id)visibleAppLayouts
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", self->_activeAppLayout);
}

- (BOOL)wantsSlideOverTongue
{
  return 0;
}

- (int64_t)touchBehaviorForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  if (objc_msgSend(a4, "isEqual:", self->_activeAppLayout))
    return 2;
  else
    return 1;
}

- (unint64_t)transactionCompletionOptions
{
  void *v3;
  int v4;

  -[_SBFullScreenAppFloorSwitcherModifier appLayouts](self, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = -[_SBFullScreenAppFloorSwitcherModifier isReduceMotionEnabled](self, "isReduceMotionEnabled");

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

- (_SBFullScreenAppFloorSwitcherModifier)initWithActiveAppLayout:(id)a3 homeAffordanceReuseIdentifier:(id)a4
{
  id v8;
  id v9;
  _SBFullScreenAppFloorSwitcherModifier *v10;
  _SBFullScreenAppFloorSwitcherModifier *v11;
  void *v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFullScreenAppLayoutSwitcherModifier.m"), 165, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appLayout != nil"));

  }
  v14.receiver = self;
  v14.super_class = (Class)_SBFullScreenAppFloorSwitcherModifier;
  v10 = -[SBSwitcherModifier init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_activeAppLayout, a3);
    objc_storeStrong((id *)&v11->_homeAffordanceReuseIdentifier, a4);
  }

  return v11;
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  id v4;
  char v5;
  void *v6;
  _QWORD v8[4];
  char v9;

  v4 = a3;
  v5 = -[_SBFullScreenAppFloorSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73___SBFullScreenAppFloorSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke;
  v8[3] = &__block_descriptor_33_e21_B16__0__SBAppLayout_8l;
  v9 = v5;
  objc_msgSend(v4, "bs_filter:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)shouldFireTransitionCompletionInDefaultRunLoopMode
{
  return 0;
}

- (unint64_t)hiddenContentStatusBarPartsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v11;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_SBFullScreenAppFloorSwitcherModifier;
  v7 = -[_SBFullScreenAppFloorSwitcherModifier hiddenContentStatusBarPartsForLayoutRole:inAppLayout:](&v13, sel_hiddenContentStatusBarPartsForLayoutRole_inAppLayout_, a3, v6);
  -[SBAppLayout itemForLayoutRole:](self->_activeAppLayout, "itemForLayoutRole:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a3 == 4 || v8 == 0)
  {

  }
  else
  {
    v11 = objc_msgSend(v6, "environment");

    if (v11 != 3)
      v7 |= 4uLL;
  }

  return v7;
}

- (double)homeScreenScale
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[_SBFullScreenAppFloorSwitcherModifier switcherSettings](self, "switcherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "animationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeScreenScaleInApplication");
  v5 = v4;

  return v5;
}

- (double)homeScreenAlpha
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[_SBFullScreenAppFloorSwitcherModifier switcherSettings](self, "switcherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "animationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeScreenOpacityInApplication");
  v5 = v4;

  return v5;
}

- (BOOL)isHomeAffordanceSupportedForAppLayout:(id)a3
{
  void *v3;
  char v4;

  -[_SBFullScreenAppFloorSwitcherModifier homeGrabberSettings](self, "homeGrabberSettings", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEnabled");

  return v4;
}

- (double)homeScreenBackdropBlurProgress
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[_SBFullScreenAppFloorSwitcherModifier switcherSettings](self, "switcherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "animationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeScreenBlurInApplication");
  v5 = v4;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeAffordanceReuseIdentifier, 0);
  objc_storeStrong((id *)&self->_activeAppLayout, 0);
}

- (double)visibleMarginForItemContainerAtIndex:(unint64_t)a3
{
  CGRect v4;

  -[_SBFullScreenAppFloorSwitcherModifier frameForIndex:](self, "frameForIndex:", a3);
  return CGRectGetWidth(v4);
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
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
  CGRect result;

  -[_SBFullScreenAppFloorSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_SBFullScreenAppFloorSwitcherModifier frameForAppLayout:](self, "frameForAppLayout:", v6);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)frameForAppLayout:(id)a3
{
  id v4;
  id v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
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
  double v31;
  double v32;
  double v33;
  objc_super v34;
  _QWORD v35[4];
  id v36;
  CGRect v37;
  CGRect result;

  v4 = a3;
  if (-[_SBFullScreenAppFloorSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled"))
  {
    -[SBSwitcherModifier autoLayoutSpaceForAppLayout:](self, "autoLayoutSpaceForAppLayout:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "boundingBox");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
  }
  else
  {
    v7 = *MEMORY[0x1E0C9D628];
    v9 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v11 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v13 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    -[_SBFullScreenAppFloorSwitcherModifier appLayoutContainingAppLayout:](self, "appLayoutContainingAppLayout:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __59___SBFullScreenAppFloorSwitcherModifier_frameForAppLayout___block_invoke;
    v35[3] = &unk_1E8E9DF50;
    v5 = v14;
    v36 = v5;
    objc_msgSend(v5, "appLayoutWithItemsPassingTest:", v35);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allItems");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (v17 == 1 && v15 != v4)
    {
      objc_msgSend(v4, "itemForLayoutRole:", 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v5, "layoutRoleForItem:", v18);
      -[_SBFullScreenAppFloorSwitcherModifier containerViewBounds](self, "containerViewBounds");
      v34.receiver = self;
      v34.super_class = (Class)_SBFullScreenAppFloorSwitcherModifier;
      -[_SBFullScreenAppFloorSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v34, sel_frameForLayoutRole_inAppLayout_withBounds_, v19, v5);
      v7 = v20;
      v9 = v21;
      v11 = v22;
      v13 = v23;

    }
    v37.origin.x = v7;
    v37.origin.y = v9;
    v37.size.width = v11;
    v37.size.height = v13;
    if (CGRectIsNull(v37))
    {
      if (objc_msgSend(v4, "environment") == 3)
      {
        -[_SBFullScreenAppFloorSwitcherModifier centerWindowFrameInInterfaceOrientation:centerConfiguration:](self, "centerWindowFrameInInterfaceOrientation:centerConfiguration:", -[_SBFullScreenAppFloorSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation"), 1);
        v11 = v24;
        v13 = v25;
        v7 = *MEMORY[0x1E0C9D538];
        v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      }
      else
      {
        -[_SBFullScreenAppFloorSwitcherModifier containerViewBounds](self, "containerViewBounds");
        v7 = v26;
        v9 = v27;
        v11 = v28;
        v13 = v29;
      }
    }

  }
  v30 = v7;
  v31 = v9;
  v32 = v11;
  v33 = v13;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (BOOL)isLayoutRoleOccluded:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (id)handleTapAppLayoutEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  SBPerformTransitionSwitcherEventResponse *v10;
  uint64_t v11;
  SBPerformTransitionSwitcherEventResponse *v12;
  void *v13;
  void *v14;
  void *v15;
  SBPerformTransitionSwitcherEventResponse *v16;
  _QWORD v18[4];
  SBPerformTransitionSwitcherEventResponse *v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_SBFullScreenAppFloorSwitcherModifier;
  -[SBSwitcherModifier handleTapAppLayoutEvent:](&v20, sel_handleTapAppLayoutEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_SBFullScreenAppFloorSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled");
  if ((objc_msgSend(v4, "isHandled") & 1) == 0 && objc_msgSend(v6, "isEqual:", self->_activeAppLayout))
  {
    objc_msgSend(v6, "leafAppLayoutForRole:", 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && objc_msgSend(v4, "layoutRole") != 4)
    {
      +[SBSwitcherTransitionRequest requestForTapAppLayoutEvent:](SBMutableSwitcherTransitionRequest, "requestForTapAppLayoutEvent:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __65___SBFullScreenAppFloorSwitcherModifier_handleTapAppLayoutEvent___block_invoke;
      v18[3] = &unk_1E8E9DF50;
      v12 = v8;
      v19 = v12;
      objc_msgSend(v6, "appLayoutWithItemsPassingTest:", v18);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAppLayout:", v13);

      if ((v7 & 1) == 0)
      {
        -[SBPerformTransitionSwitcherEventResponse itemForLayoutRole:](v12, "itemForLayoutRole:", 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "bundleIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setBundleIdentifierForAppExpose:", v15);

      }
      v16 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v9, 0);
      SBAppendSwitcherModifierResponse(v16, v5);
      v11 = objc_claimAutoreleasedReturnValue();

      v10 = v19;
    }
    else
    {
      if ((v7 & 1) != 0 || objc_msgSend(v4, "source") != 1)
        goto LABEL_12;
      +[SBSwitcherTransitionRequest requestForTapAppLayoutEvent:](SBSwitcherTransitionRequest, "requestForTapAppLayoutEvent:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v9, 0);
      SBAppendSwitcherModifierResponse(v10, v5);
      v11 = objc_claimAutoreleasedReturnValue();

    }
    v5 = (void *)v11;
LABEL_12:

  }
  return v5;
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

- (double)scaleForIndex:(unint64_t)a3
{
  return 1.0;
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

- (double)switcherBackdropBlurProgress
{
  return 0.0;
}

- (double)switcherDimmingAlpha
{
  return 0.0;
}

- (BOOL)switcherDimmingViewBlocksTouches
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
  return -[SBAppLayout leafAppLayouts](self->_activeAppLayout, "leafAppLayouts");
}

- (id)inactiveAppLayoutsReachableByKeyboardShortcut
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)canPerformKeyboardShortcutAction:(int64_t)a3 forBundleIdentifier:(id)a4
{
  return 1;
}

- (BOOL)shouldUseBackgroundWallpaperTreatmentForIndex:(unint64_t)a3
{
  return 0;
}

- (id)appLayoutsToCacheFullsizeSnapshots
{
  void *v3;
  NSUInteger v4;
  NSRange v5;
  void *v6;
  NSRange v8;
  NSRange v9;

  -[_SBFullScreenAppFloorSwitcherModifier appLayouts](self, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "indexOfObject:", self->_activeAppLayout);
  v9.length = objc_msgSend(v3, "count");
  v8.location = v4;
  v8.length = 2;
  v9.location = 0;
  v5 = NSIntersectionRange(v8, v9);
  objc_msgSend(v3, "subarrayWithRange:", v5.location, v5.length);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)preferredSnapshotOrientationForAppLayout:(id)a3
{
  if (-[_SBFullScreenAppFloorSwitcherModifier displayOrdinal](self, "displayOrdinal", a3))
    return 2;
  else
    return 1;
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

- (BOOL)shouldPerformCrossfadeForReduceMotion
{
  return 0;
}

- (id)preferredAppLayoutToReuseAccessoryForAppLayout:(id)a3 fromAppLayouts:(id)a4
{
  id v6;
  id v7;
  SBAppLayout *v8;
  SBAppLayout *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "containsObject:", self->_activeAppLayout))
  {
    v8 = self->_activeAppLayout;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)_SBFullScreenAppFloorSwitcherModifier;
    -[_SBFullScreenAppFloorSwitcherModifier preferredAppLayoutToReuseAccessoryForAppLayout:fromAppLayouts:](&v11, sel_preferredAppLayoutToReuseAccessoryForAppLayout_fromAppLayouts_, v6, v7);
    v8 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (id)appLayoutForReceivingHardwareButtonEvents
{
  return self->_activeAppLayout;
}

- (BOOL)shouldAnimateInsertionOrRemovalOfAppLayout:(id)a3 atIndex:(unint64_t)a4
{
  return 0;
}

- (BOOL)shouldBringCardToFrontDuringInsertionOrRemoval
{
  return 0;
}

- (unint64_t)indexToScrollToAfterInsertingAtIndex:(unint64_t)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)indexToScrollToAfterRemovingIndex:(unint64_t)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)shouldConfigureInAppDockHiddenAssertion
{
  return 1;
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

- (unint64_t)dockWindowLevelPriority
{
  return 0;
}

- (double)dockWindowLevel
{
  return 0.0;
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
  objc_super v4;

  if (self->_activeAppLayout == a3)
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)_SBFullScreenAppFloorSwitcherModifier;
  return -[_SBFullScreenAppFloorSwitcherModifier jetsamModeForAppLayout:](&v4, sel_jetsamModeForAppLayout_);
}

- (char)activityModeForAppLayout:(id)a3
{
  objc_super v4;

  if (self->_activeAppLayout == a3)
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)_SBFullScreenAppFloorSwitcherModifier;
  return -[_SBFullScreenAppFloorSwitcherModifier activityModeForAppLayout:](&v4, sel_activityModeForAppLayout_);
}

@end
