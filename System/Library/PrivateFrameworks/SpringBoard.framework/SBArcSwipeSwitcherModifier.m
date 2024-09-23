@implementation SBArcSwipeSwitcherModifier

- (SBArcSwipeSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5 pinSpaceCornerRadiiToDisplayCornerRadii:(BOOL)a6
{
  id v12;
  id v13;
  SBArcSwipeSwitcherModifier *v14;
  void *v16;
  objc_super v17;

  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SBArcSwipeSwitcherModifier;
  v14 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v17, sel_initWithTransitionID_, a3);
  if (v14)
  {
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, CFSTR("SBArcSwipeSwitcherModifier.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toAppLayout"));

    }
    objc_storeStrong((id *)&v14->_fromAppLayout, a4);
    objc_storeStrong((id *)&v14->_toAppLayout, a5);
    v14->_pinSpaceCornerRadiiToDisplayCornerRadii = a6;
  }

  return v14;
}

- (id)transitionWillBegin
{
  void *v3;
  SBUpdateLayoutSwitcherEventResponse *v4;
  void *v5;
  NSUUID *v6;
  NSUUID *systemApertureSuppressionIdentifier;
  SBRequestSystemApertureElementSuppressionEventResponse *v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBArcSwipeSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v11, sel_transitionWillBegin);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 2, 2);
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!self->_systemApertureSuppressionIdentifier && self->_toAppLayout)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    systemApertureSuppressionIdentifier = self->_systemApertureSuppressionIdentifier;
    self->_systemApertureSuppressionIdentifier = v6;

    v8 = -[SBRequestSystemApertureElementSuppressionEventResponse initWithAppLayout:wantsGlobalSuppression:wantsKeyLineEnabled:invalidationIdentifier:]([SBRequestSystemApertureElementSuppressionEventResponse alloc], "initWithAppLayout:wantsGlobalSuppression:wantsKeyLineEnabled:invalidationIdentifier:", self->_toAppLayout, 0, 0, self->_systemApertureSuppressionIdentifier);
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v8, v5);
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v9;
  }

  return v5;
}

- (id)transitionDidEnd
{
  void *v3;
  SBRelinquishSystemApertureElementSuppressionEventResponse *v4;
  uint64_t v5;
  NSUUID *systemApertureSuppressionIdentifier;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBArcSwipeSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionDidEnd](&v8, sel_transitionDidEnd);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_systemApertureSuppressionIdentifier)
  {
    v4 = -[SBRelinquishSystemApertureElementSuppressionEventResponse initWithInvalidationIdentifier:]([SBRelinquishSystemApertureElementSuppressionEventResponse alloc], "initWithInvalidationIdentifier:", self->_systemApertureSuppressionIdentifier);
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v4, v3);
    v5 = objc_claimAutoreleasedReturnValue();

    systemApertureSuppressionIdentifier = self->_systemApertureSuppressionIdentifier;
    self->_systemApertureSuppressionIdentifier = 0;

    v3 = (void *)v5;
  }
  return v3;
}

- (BOOL)shouldAsyncRenderUntilDelay:(double *)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  float v12;

  -[SBArcSwipeSwitcherModifier switcherSettings](self, "switcherSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "animationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "disableAsyncRenderingTransitionPercentage");
  v8 = v7;

  -[SBArcSwipeSwitcherModifier _layoutSettings](self, "_layoutSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "settlingDuration");
  v11 = v8 * v10;
  UIAnimationDragCoefficient();
  *a3 = v11 * v12;

  return 1;
}

- (id)visibleAppLayouts
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBArcSwipeSwitcherModifier;
  -[SBArcSwipeSwitcherModifier visibleAppLayouts](&v6, sel_visibleAppLayouts);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (self->_toAppLayout)
    objc_msgSend(v4, "addObject:");
  if (self->_fromAppLayout)
    objc_msgSend(v4, "addObject:");
  return v4;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBArcSwipeSwitcherModifier;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v8, sel_animationAttributesForLayoutElement_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[SBArcSwipeSwitcherModifier _layoutSettings](self, "_layoutSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayoutSettings:", v6);

  return v5;
}

- (id)_layoutSettings
{
  void *v3;
  void *v4;
  void *v5;

  -[SBArcSwipeSwitcherModifier switcherSettings](self, "switcherSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((-[SBArcSwipeSwitcherModifier isReduceMotionEnabled](self, "isReduceMotionEnabled") & 1) != 0)
    objc_msgSend(v4, "reduceMotionArcSwipeSettings");
  else
    objc_msgSend(v4, "arcSwipeSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  return 1.0;
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

- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3
{
  SBAppLayout *toAppLayout;
  void *v5;
  void *v6;
  BOOL v7;

  toAppLayout = self->_toAppLayout;
  if (!toAppLayout)
    return 0;
  -[SBArcSwipeSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBAppLayout isEqual:](toAppLayout, "isEqual:", v6);

  return v7;
}

- (id)appLayoutsToCacheSnapshots
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;

  -[SBArcSwipeSwitcherModifier appLayouts](self, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    if (self->_toAppLayout)
    {
      -[SBArcSwipeSwitcherModifier appLayouts](self, "appLayouts");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "indexOfObject:", self->_toAppLayout);

    }
    else
    {
      v5 = 0;
    }
    -[SBArcSwipeSwitcherModifier switcherSettings](self, "switcherSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "numberOfSnapshotsToAlwaysKeepAround");
    if (!v8)
      v8 = objc_msgSend(v7, "numberOfSnapshotsToCacheInSwitcher");
    -[SBSwitcherModifier appLayoutsToCacheSnapshotsWithVisibleRange:numberOfSnapshotsToCache:biasForward:](self, "appLayoutsToCacheSnapshotsWithVisibleRange:numberOfSnapshotsToCache:biasForward:", v5, 1, v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

- (id)appLayoutsToCacheFullsizeSnapshots
{
  void *v3;
  void *v4;
  NSUInteger v5;
  NSUInteger v6;
  NSRange v7;
  void *v8;
  NSRange v10;
  NSRange v11;

  -[SBArcSwipeSwitcherModifier appLayouts](self, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_fromAppLayout)
  {
    -[SBArcSwipeSwitcherModifier appLayouts](self, "appLayouts");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "indexOfObject:", self->_toAppLayout);

    if (v5)
    {
      --v5;
      v6 = 3;
    }
    else
    {
      v6 = 2;
    }
  }
  else
  {
    v5 = 0;
    v6 = 1;
  }
  v11.length = objc_msgSend(v3, "count");
  v10.location = v5;
  v10.length = v6;
  v11.location = 0;
  v7 = NSIntersectionRange(v10, v11);
  objc_msgSend(v3, "subarrayWithRange:", v7.location, v7.length);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  UIRectCornerRadii result;

  if (self->_pinSpaceCornerRadiiToDisplayCornerRadii)
  {
    -[SBArcSwipeSwitcherModifier displayCornerRadius](self, "displayCornerRadius", a3);
    SBRectCornerRadiiForRadius();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBArcSwipeSwitcherModifier;
    -[SBArcSwipeSwitcherModifier cornerRadiiForIndex:](&v7, sel_cornerRadiiForIndex_, a3);
  }
  result.topRight = v6;
  result.bottomRight = v5;
  result.bottomLeft = v4;
  result.topLeft = v3;
  return result;
}

- (BOOL)shouldPerformCrossfadeForReduceMotion
{
  return 0;
}

- (id)appLayoutsToResignActive
{
  objc_super v4;

  if (-[SBAppLayout isEqual:](self->_fromAppLayout, "isEqual:", self->_toAppLayout))
    return MEMORY[0x1E0C9AA70];
  v4.receiver = self;
  v4.super_class = (Class)SBArcSwipeSwitcherModifier;
  -[SBTransitionSwitcherModifier appLayoutsToResignActive](&v4, sel_appLayoutsToResignActive);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)keyboardSuppressionMode
{
  void *v3;
  objc_super v5;

  if (-[SBAppLayout isEqual:](self->_fromAppLayout, "isEqual:", self->_toAppLayout))
  {
    +[SBSwitcherKeyboardSuppressionMode suppressionModeNone](SBSwitcherKeyboardSuppressionMode, "suppressionModeNone");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SBArcSwipeSwitcherModifier;
    -[SBTransitionSwitcherModifier keyboardSuppressionMode](&v5, sel_keyboardSuppressionMode);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  unsigned __int16 v4;
  __int16 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBArcSwipeSwitcherModifier;
  v4 = (unsigned __int16)-[SBTransitionSwitcherModifier asyncRenderingAttributesForAppLayout:](&v7, sel_asyncRenderingAttributesForAppLayout_, a3);
  if (self->_fromAppLayout == self->_toAppLayout)
    v5 = 0;
  else
    v5 = v4;
  return (SBSwitcherAsyncRenderingAttributes)(v5 | v4 & 0xFF00);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemApertureSuppressionIdentifier, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
  objc_storeStrong((id *)&self->_toAppLayout, 0);
}

@end
