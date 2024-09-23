@implementation _SBGridFloorSwitcherModifier

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  return (id)objc_msgSend(a3, "bs_filter:", &__block_literal_global_342);
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
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  double v16;
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
  objc_super v30;
  CGRect v31;
  CGRect result;

  v5 = *MEMORY[0x1E0C9D628];
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  -[_SBGridFloorSwitcherModifier appLayouts](self, "appLayouts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[_SBGridFloorSwitcherModifier appLayoutContainingAppLayout:](self, "appLayoutContainingAppLayout:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13 == 1 && v10 != v11)
  {
    objc_msgSend(v10, "itemForLayoutRole:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v11, "layoutRoleForItem:", v14);
    -[_SBGridFloorSwitcherModifier containerViewBounds](self, "containerViewBounds");
    v30.receiver = self;
    v30.super_class = (Class)_SBGridFloorSwitcherModifier;
    -[_SBGridFloorSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v30, sel_frameForLayoutRole_inAppLayout_withBounds_, v15, v11);
    v5 = v16;
    v6 = v17;
    v7 = v18;
    v8 = v19;

  }
  v31.origin.x = v5;
  v31.origin.y = v6;
  v31.size.width = v7;
  v31.size.height = v8;
  if (CGRectIsNull(v31))
  {
    if (objc_msgSend(v10, "environment") == 3)
    {
      -[_SBGridFloorSwitcherModifier centerWindowFrameInInterfaceOrientation:centerConfiguration:](self, "centerWindowFrameInInterfaceOrientation:centerConfiguration:", -[_SBGridFloorSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation"), 1);
      v7 = v20;
      v8 = v21;
      v5 = *MEMORY[0x1E0C9D538];
      v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    }
    else
    {
      -[_SBGridFloorSwitcherModifier containerViewBounds](self, "containerViewBounds");
      v5 = v22;
      v6 = v23;
      v7 = v24;
      v8 = v25;
    }
  }

  v26 = v5;
  v27 = v6;
  v28 = v7;
  v29 = v8;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBGridSwitcherModifier.m"), 293, CFSTR("%@ shouldn't be asked %@."), v7, v8);

  return 1.0;
}

- (double)rotationAngleForIndex:(unint64_t)a3
{
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBGridSwitcherModifier.m"), 298, CFSTR("%@ shouldn't be asked %@."), v7, v8);

  return 0.0;
}

- (id)visibleAppLayouts
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (BOOL)isHomeAffordanceSupportedForAppLayout:(id)a3
{
  void *v3;
  char v4;

  -[_SBGridFloorSwitcherModifier homeGrabberSettings](self, "homeGrabberSettings", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEnabled");

  return v4;
}

- (id)visibleHomeAffordanceLayoutElements
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBGridSwitcherModifier.m"), 311, CFSTR("%@ shouldn't be asked %@."), v6, v7);

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

- (double)contentViewScale
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBGridSwitcherModifier.m"), 348, CFSTR("%@ shouldn't be asked %@."), v6, v7);

  return 1.0;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  id result;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBGridSwitcherModifier.m"), 353, CFSTR("%@ shouldn't be asked %@."), v8, v9);

  __break(1u);
  return result;
}

- (BOOL)clipsToUnobscuredMarginAtIndex:(unint64_t)a3
{
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBGridSwitcherModifier.m"), 358, CFSTR("%@ shouldn't be asked %@."), v7, v8);

  return 0;
}

- (double)visibleMarginForItemContainerAtIndex:(unint64_t)a3
{
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  CGRect v11;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBGridSwitcherModifier.m"), 363, CFSTR("%@ shouldn't be asked %@."), v8, v9);

  -[_SBGridFloorSwitcherModifier frameForIndex:](self, "frameForIndex:", a3);
  return CGRectGetWidth(v11);
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
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBGridSwitcherModifier.m"), 386, CFSTR("%@ shouldn't be asked %@."), v9, v10);

  return 1.0;
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
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBGridSwitcherModifier.m"), 403, CFSTR("%@ shouldn't be asked %@."), v7, v8);

  return 1.0;
}

- (double)titleOpacityForIndex:(unint64_t)a3
{
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBGridSwitcherModifier.m"), 408, CFSTR("%@ shouldn't be asked %@."), v7, v8);

  return 1.0;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBGridSwitcherModifier.m"), 413, CFSTR("%@ shouldn't be asked %@."), v8, v9);

  return 1.0;
}

- (double)shadowOffsetForIndex:(unint64_t)a3
{
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBGridSwitcherModifier.m"), 418, CFSTR("%@ shouldn't be asked %@."), v7, v8);

  return 0.0;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIRectCornerRadii result;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBGridSwitcherModifier.m"), 423, CFSTR("%@ shouldn't be asked %@."), v7, v8);

  v9 = *MEMORY[0x1E0CEBAC0];
  v10 = *(double *)(MEMORY[0x1E0CEBAC0] + 8);
  v11 = *(double *)(MEMORY[0x1E0CEBAC0] + 16);
  v12 = *(double *)(MEMORY[0x1E0CEBAC0] + 24);
  result.topRight = v12;
  result.bottomRight = v11;
  result.bottomLeft = v10;
  result.topLeft = v9;
  return result;
}

- (double)homeScreenAlpha
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[_SBGridFloorSwitcherModifier switcherSettings](self, "switcherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "animationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeScreenOpacityInSwitcher");
  v5 = v4;

  return v5;
}

- (double)homeScreenScale
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[_SBGridFloorSwitcherModifier switcherSettings](self, "switcherSettings");
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

  -[_SBGridFloorSwitcherModifier switcherSettings](self, "switcherSettings");
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

  -[_SBGridFloorSwitcherModifier switcherSettings](self, "switcherSettings");
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

  -[_SBGridFloorSwitcherModifier switcherSettings](self, "switcherSettings");
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
  return a3 == 0;
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
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "itemForLayoutRole:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)appLayoutsToCacheSnapshots
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBGridSwitcherModifier.m"), 586, CFSTR("%@ shouldn't be asked %@."), v6, v7);

  return (id)MEMORY[0x1E0C9AA60];
}

- (id)appLayoutsToCacheFullsizeSnapshots
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBGridSwitcherModifier.m"), 591, CFSTR("%@ shouldn't be asked %@."), v6, v7);

  return (id)MEMORY[0x1E0C9AA60];
}

- (int64_t)preferredSnapshotOrientationForAppLayout:(id)a3
{
  return 2;
}

- (id)topMostLayoutElements
{
  return (id)MEMORY[0x1E0C9AA60];
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

  -[_SBGridFloorSwitcherModifier appLayouts](self, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = -[_SBGridFloorSwitcherModifier isReduceMotionEnabled](self, "isReduceMotionEnabled");

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
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBGridSwitcherModifier.m"), 650, CFSTR("%@ shouldn't be asked %@."), v8, v9);

  return 1;
}

- (BOOL)shouldBringCardToFrontDuringInsertionOrRemoval
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBGridSwitcherModifier.m"), 655, CFSTR("%@ shouldn't be asked %@."), v6, v7);

  return 1;
}

- (unint64_t)indexToScrollToAfterInsertingAtIndex:(unint64_t)a3
{
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBGridSwitcherModifier.m"), 660, CFSTR("%@ shouldn't be asked %@."), v8, v9);

  return a3;
}

- (unint64_t)indexToScrollToAfterRemovingIndex:(unint64_t)a3
{
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBGridSwitcherModifier.m"), 665, CFSTR("%@ shouldn't be asked %@."), v8, v9);

  return a3;
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

- (id)appLayoutsToResignActive
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = (void *)MEMORY[0x1E0C99E60];
  -[_SBGridFloorSwitcherModifier appLayouts](self, "appLayouts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithObject:forKey:", v5, &unk_1E91D1EB0);
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

- (id)scrollViewAttributes
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBGridSwitcherModifier.m"), 744, CFSTR("%@ shouldn't be asked %@."), v6, v7);

  return 0;
}

- (double)contentPageViewScaleForAppLayout:(id)a3 withScale:(double)a4
{
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBGridSwitcherModifier.m"), 749, CFSTR("%@ shouldn't be asked %@."), v8, v9);

  return 0.0;
}

- (CGPoint)contentOffsetForIndex:(unint64_t)a3 alignment:(int64_t)a4
{
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  CGPoint result;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBGridSwitcherModifier.m"), 754, CFSTR("%@ shouldn't be asked %@."), v8, v9);

  v10 = *MEMORY[0x1E0C9D538];
  v11 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v11;
  result.x = v10;
  return result;
}

- (CGPoint)restingOffsetForScrollOffset:(CGPoint)a3 velocity:(CGPoint)a4
{
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  CGPoint result;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3.x, a3.y, a4.x, a4.y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBGridSwitcherModifier.m"), 759, CFSTR("%@ shouldn't be asked %@."), v8, v9);

  v10 = *MEMORY[0x1E0C9D538];
  v11 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v11;
  result.x = v10;
  return result;
}

- (double)minimumTranslationToKillIndex:(unint64_t)a3
{
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBGridSwitcherModifier.m"), 764, CFSTR("%@ shouldn't be asked %@."), v7, v8);

  return 0.0;
}

- (id)adjustedContinuousExposeIdentifiersInSwitcherFromPreviousIdentifiersInSwitcher:(id)a3 identifiersInStrip:(id)a4
{
  id v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBGridSwitcherModifier.m"), 771, CFSTR("%@ shouldn't be asked %@."), v9, v10);

  return v6;
}

- (id)adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBGridSwitcherModifier.m"), 776, CFSTR("%@ shouldn't be asked %@."), v8, v9);

  return v5;
}

- (double)snapshotScaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBGridSwitcherModifier.m"), 781, CFSTR("%@ shouldn't be asked %@."), v8, v9);

  return 0.0;
}

- (double)distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch:(unint64_t)a3
{
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBGridSwitcherModifier.m"), 786, CFSTR("%@ shouldn't be asked %@."), v7, v8);

  return 0.0;
}

- (CGPoint)adjustedOffsetForOffset:(CGPoint)a3 translation:(CGPoint)a4 startPoint:(CGPoint)a5 locationInView:(CGPoint)a6 horizontalVelocity:(double *)a7 verticalVelocity:(double *)a8
{
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  CGPoint result;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a7, a8, a3.x, a3.y, a4.x, a4.y, a5.x, a5.y, a6.x, a6.y);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBGridSwitcherModifier.m"), 791, CFSTR("%@ shouldn't be asked %@."), v12, v13);

  v14 = *MEMORY[0x1E0C9D538];
  v15 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v15;
  result.x = v14;
  return result;
}

- (void)resetAdjustedScrollingState
{
  objc_class *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBGridSwitcherModifier.m"), 796, CFSTR("%@ shouldn't be asked %@."), v5, v6);

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

@end
