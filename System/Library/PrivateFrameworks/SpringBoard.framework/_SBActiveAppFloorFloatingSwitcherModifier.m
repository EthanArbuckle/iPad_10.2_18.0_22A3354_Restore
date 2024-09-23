@implementation _SBActiveAppFloorFloatingSwitcherModifier

- (_SBActiveAppFloorFloatingSwitcherModifier)initWithActiveAppLayout:(id)a3 floatingConfiguration:(int64_t)a4 environmentMode:(int64_t)a5
{
  id v9;
  _SBActiveAppFloorFloatingSwitcherModifier *v10;
  _SBActiveAppFloorFloatingSwitcherModifier *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_SBActiveAppFloorFloatingSwitcherModifier;
  v10 = -[SBSwitcherModifier init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_activeAppLayout, a3);
    v11->_floatingConfiguration = a4;
    v11->_environmentMode = a5;
  }

  return v11;
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

- (double)scaleForIndex:(unint64_t)a3
{
  return 1.0;
}

- (double)rotationAngleForIndex:(unint64_t)a3
{
  return 0.0;
}

- (id)visibleAppLayouts
{
  if (self->_activeAppLayout)
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:");
  else
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isHomeAffordanceSupportedForAppLayout:(id)a3
{
  return 1;
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

  -[_SBActiveAppFloorFloatingSwitcherModifier switcherSettings](self, "switcherSettings", a3);
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

  -[_SBActiveAppFloorFloatingSwitcherModifier frameForIndex:](self, "frameForIndex:", a3);
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
  _BOOL4 v5;
  double result;

  v5 = -[_SBActiveAppFloorFloatingSwitcherModifier _isActiveAppLayoutAtIndex:](self, "_isActiveAppLayoutAtIndex:", a5, a4);
  result = 0.0;
  if (v5)
    return 1.0;
  return result;
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
  return 0.0;
}

- (double)titleOpacityForIndex:(unint64_t)a3
{
  return 0.0;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  return 1.0;
}

- (double)shadowOffsetForIndex:(unint64_t)a3
{
  double result;

  result = 1.0;
  if (self->_floatingConfiguration == 1)
    return -1.0;
  return result;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  void *v3;
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
  UIRectCornerRadii result;

  -[_SBActiveAppFloorFloatingSwitcherModifier medusaSettings](self, "medusaSettings", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cornerRadiusForFloatingApps");
  SBRectCornerRadiiForRadius();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.topRight = v15;
  result.bottomRight = v14;
  result.bottomLeft = v13;
  result.topLeft = v12;
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
  return 0;
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

- (int64_t)touchBehaviorForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  if (objc_msgSend(a4, "isEqual:", self->_activeAppLayout))
    return 2;
  else
    return 1;
}

- (BOOL)shouldAllowContentViewTouchesForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 2;
}

- (BOOL)isScrollEnabled
{
  return 0;
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
  return 1;
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
  return 0;
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
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)appLayoutsToCacheFullsizeSnapshots
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (int64_t)preferredSnapshotOrientationForAppLayout:(id)a3
{
  if (-[_SBActiveAppFloorFloatingSwitcherModifier displayOrdinal](self, "displayOrdinal", a3))
    return 2;
  else
    return 1;
}

- (id)topMostLayoutElements
{
  void *v3;
  SBAppLayout *activeAppLayout;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;

  -[_SBActiveAppFloorFloatingSwitcherModifier slideOverTongueLayoutElement](self, "slideOverTongueLayoutElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  activeAppLayout = self->_activeAppLayout;
  -[_SBActiveAppFloorFloatingSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (activeAppLayout)
    v7 = 1;
  else
    v7 = v3 == 0;
  if (!v7)
  {
    v8 = (void *)objc_msgSend(v5, "mutableCopy");

    objc_msgSend(v8, "insertObject:atIndex:", v3, 0);
    v6 = v8;
  }

  return v6;
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

  -[_SBActiveAppFloorFloatingSwitcherModifier appLayouts](self, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = -[_SBActiveAppFloorFloatingSwitcherModifier isReduceMotionEnabled](self, "isReduceMotionEnabled");

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

- (BOOL)isLayoutRoleSelectable:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (BOOL)isLayoutRoleKillable:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  return 0;
}

- (BOOL)isIndexRubberbandableForSwipeToKill:(unint64_t)a3
{
  return 0;
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
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)keyboardSuppressionMode
{
  return +[SBSwitcherKeyboardSuppressionMode suppressionModeNone](SBSwitcherKeyboardSuppressionMode, "suppressionModeNone");
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(0, 0);
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
  return 0;
}

- (double)blurViewIconScaleForIndex:(unint64_t)a3
{
  return 1.0;
}

- (BOOL)wantsSlideOverTongue
{
  BOOL v2;
  void *v3;

  if (self->_activeAppLayout)
    return 1;
  -[_SBActiveAppFloorFloatingSwitcherModifier appLayouts](self, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "count") != 0;

  return v2;
}

- (unint64_t)slideOverTongueState
{
  return self->_floatingConfiguration == 3 && self->_environmentMode == 3;
}

- (unint64_t)slideOverTongueDirection
{
  if (SBFloatingConfigurationIsLeft(self->_floatingConfiguration))
    return 2;
  else
    return 1;
}

- (id)appLayoutToAttachSlideOverTongue
{
  if (self->_environmentMode == 3)
    return self->_activeAppLayout;
  else
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
  v4.super_class = (Class)_SBActiveAppFloorFloatingSwitcherModifier;
  return -[_SBActiveAppFloorFloatingSwitcherModifier jetsamModeForAppLayout:](&v4, sel_jetsamModeForAppLayout_);
}

- (char)activityModeForAppLayout:(id)a3
{
  objc_super v4;

  if (self->_activeAppLayout == a3)
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)_SBActiveAppFloorFloatingSwitcherModifier;
  return -[_SBActiveAppFloorFloatingSwitcherModifier activityModeForAppLayout:](&v4, sel_activityModeForAppLayout_);
}

- (BOOL)_isActiveAppLayoutAtIndex:(unint64_t)a3
{
  _SBActiveAppFloorFloatingSwitcherModifier *v4;
  void *v5;
  void *v6;

  v4 = self;
  -[_SBActiveAppFloorFloatingSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isEqual:", v4->_activeAppLayout);
  return (char)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeAppLayout, 0);
}

@end
