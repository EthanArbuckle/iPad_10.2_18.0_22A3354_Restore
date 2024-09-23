@implementation SBHomeGestureToHomeSwitcherModifier

- (SBHomeGestureToHomeSwitcherModifier)initWithTransitionID:(id)a3 showingOrAnimatingCardsForFlyIn:(BOOL)a4
{
  SBHomeGestureToHomeSwitcherModifier *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBHomeGestureToHomeSwitcherModifier;
  result = -[SBTransitionSwitcherModifier initWithTransitionID:](&v6, sel_initWithTransitionID_, a3);
  if (result)
    result->_showingOrAnimatingCardsForFlyIn = a4;
  return result;
}

- (id)visibleAppLayouts
{
  void *v2;
  void *v3;
  void *v4;

  -[SBHomeGestureToHomeSwitcherModifier appLayouts](self, "appLayouts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v3);
  else
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;
  CGRect result;

  v8.receiver = self;
  v8.super_class = (Class)SBHomeGestureToHomeSwitcherModifier;
  -[SBHomeGestureToHomeSwitcherModifier frameForIndex:](&v8, sel_frameForIndex_, a3);
  if (self->_showingOrAnimatingCardsForFlyIn)
    v4 = v4 + -1.0;
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  void *v3;
  double v4;
  double v5;
  double result;
  objc_super v7;

  if (self->_showingOrAnimatingCardsForFlyIn)
  {
    -[SBHomeGestureToHomeSwitcherModifier switcherSettings](self, "switcherSettings", a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "offscreenCardScaleForFlyIn");
    v5 = v4;

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBHomeGestureToHomeSwitcherModifier;
    -[SBHomeGestureToHomeSwitcherModifier scaleForIndex:](&v7, sel_scaleForIndex_, a3);
  }
  return result;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  double result;

  result = 0.0;
  if (!a5)
    return 1.0;
  return result;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIRectCornerRadii result;

  -[SBHomeGestureToHomeSwitcherModifier displayCornerRadius](self, "displayCornerRadius", a3);
  SBRectCornerRadiiForRadius();
  result.topRight = v6;
  result.bottomRight = v5;
  result.bottomLeft = v4;
  result.topLeft = v3;
  return result;
}

- (int64_t)homeScreenBackdropBlurType
{
  return 3;
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

- (BOOL)isSwitcherWindowVisible
{
  return 1;
}

- (BOOL)isSwitcherWindowUserInteractionEnabled
{
  return 0;
}

- (id)appLayoutsToCacheSnapshots
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  -[SBHomeGestureToHomeSwitcherModifier appLayouts](self, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    -[SBHomeGestureToHomeSwitcherModifier switcherSettings](self, "switcherSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "numberOfSnapshotsToAlwaysKeepAround");
    if (!v5)
      v5 = objc_msgSend(v4, "numberOfSnapshotsToCacheInSwitcher");
    -[SBSwitcherModifier appLayoutsToCacheSnapshotsWithVisibleRange:numberOfSnapshotsToCache:biasForward:](self, "appLayoutsToCacheSnapshotsWithVisibleRange:numberOfSnapshotsToCache:biasForward:", 0, 1, v5, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

- (unint64_t)transactionCompletionOptions
{
  objc_super v3;

  if (!self->_showingOrAnimatingCardsForFlyIn)
    return 0;
  v3.receiver = self;
  v3.super_class = (Class)SBHomeGestureToHomeSwitcherModifier;
  return -[SBHomeGestureToHomeSwitcherModifier transactionCompletionOptions](&v3, sel_transactionCompletionOptions);
}

@end
