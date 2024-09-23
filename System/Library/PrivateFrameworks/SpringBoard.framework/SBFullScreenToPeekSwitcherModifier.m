@implementation SBFullScreenToPeekSwitcherModifier

- (SBFullScreenToPeekSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5 fromFloatingAppLayout:(id)a6 toFloatingAppLayout:(id)a7 peekConfiguration:(int64_t)a8
{
  id v13;
  id v14;
  unint64_t v15;
  id v16;
  unint64_t v17;
  SBFullScreenToPeekSwitcherModifier *v18;
  SBFullScreenToPeekSwitcherModifier *v19;
  void *v21;
  void *v22;
  objc_super v25;

  v13 = a3;
  v14 = a4;
  v15 = (unint64_t)a5;
  v16 = a6;
  v17 = (unint64_t)a7;
  if (v15 | v17)
  {
    if (!v14)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFullScreenToPeekSwitcherModifier.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toAppLayout || toFloatingAppLayout"));

    if (!v14)
      goto LABEL_5;
  }
  if (objc_msgSend(v14, "configuration") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFullScreenToPeekSwitcherModifier.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[fromAppLayout configuration] == SBAppLayoutConfigurationFull"));

  }
LABEL_5:
  v25.receiver = self;
  v25.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
  v18 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v25, sel_initWithTransitionID_, v13);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_fromAppLayout, a4);
    objc_storeStrong((id *)&v19->_toAppLayout, a5);
    objc_storeStrong((id *)&v19->_fromFloatingAppLayout, a6);
    objc_storeStrong((id *)&v19->_toFloatingAppLayout, a7);
    v19->_peekConfiguration = a8;
    v19->_animationPhase = 0;
  }

  return v19;
}

- (void)didMoveToParentModifier:(id)a3
{
  void *v5;
  void *v6;
  char v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v8, sel_didMoveToParentModifier_);
  if (a3)
  {
    -[SBFullScreenToPeekSwitcherModifier switcherSettings](self, "switcherSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "animationSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "performTwoPhaseFullScreenToPeekTransition");

    if ((v7 & 1) == 0)
      self->_animationPhase = 1;
  }
}

- (id)transitionWillBegin
{
  void *v2;
  SBUpdateLayoutSwitcherEventResponse *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v6, sel_transitionWillBegin);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 4, 4);
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)transitionWillUpdate
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  float v8;
  double v9;
  SBTimerEventSwitcherEventResponse *v10;
  uint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillUpdate](&v13, sel_transitionWillUpdate);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_animationPhase)
  {
    -[SBFullScreenToPeekSwitcherModifier switcherSettings](self, "switcherSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "animationSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fullScreenToPeekSecondPhaseAnimationDelay");
    v7 = v6;
    UIAnimationDragCoefficient();
    v9 = v7 * v8;

    v10 = -[SBTimerEventSwitcherEventResponse initWithDelay:validator:reason:]([SBTimerEventSwitcherEventResponse alloc], "initWithDelay:validator:reason:", 0, CFSTR("SBFullScreenToPeekSwitcherModifierTimerEventReason"), v9);
    SBAppendSwitcherModifierResponse(v10, v3);
    v11 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v11;
  }
  return v3;
}

- (id)transitionDidEnd
{
  void *v3;
  SBAddModifierSwitcherEventResponse *v4;
  SBSlideOverAppsInFullScreenSwitcherSwitcherModifier *v5;
  SBAddModifierSwitcherEventResponse *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionDidEnd](&v9, sel_transitionDidEnd);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_toFloatingAppLayout)
  {
    v4 = [SBAddModifierSwitcherEventResponse alloc];
    v5 = objc_alloc_init(SBSlideOverAppsInFullScreenSwitcherSwitcherModifier);
    v6 = -[SBAddModifierSwitcherEventResponse initWithModifier:level:](v4, "initWithModifier:level:", v5, 3);

    SBAppendSwitcherModifierResponse(v6, v3);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  return v3;
}

- (id)handleTimerEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SBUpdateLayoutSwitcherEventResponse *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
  v4 = a3;
  -[SBTransitionSwitcherModifier handleTimerEvent:](&v10, sel_handleTimerEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reason", v10.receiver, v10.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v6, "isEqualToString:", CFSTR("SBFullScreenToPeekSwitcherModifierTimerEventReason"));
  if ((_DWORD)v4)
  {
    self->_animationPhase = 1;
    v7 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 30, 3);
    SBAppendSwitcherModifierResponse(v7, v5);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  return v5;
}

- (id)handleSceneReadyEvent:(id)a3
{
  SBFullScreenToPeekSwitcherModifier *v3;
  id v4;
  void *v5;
  void *v6;
  SBUpdateLayoutSwitcherEventResponse *v7;
  uint64_t v8;
  objc_super v10;

  v3 = self;
  v10.receiver = self;
  v10.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier handleSceneReadyEvent:](&v10, sel_handleSceneReadyEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appLayout", v10.receiver, v10.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v3) = -[SBFullScreenToPeekSwitcherModifier _isPeekingAppLayout:](v3, "_isPeekingAppLayout:", v6);
  if ((_DWORD)v3)
  {
    v7 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 32, 2);
    SBAppendSwitcherModifierResponse(v7, v5);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  return v5;
}

- (id)handleResizeProgressEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  SBUpdateLayoutSwitcherEventResponse *v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier handleResizeProgressEvent:](&v11, sel_handleResizeProgressEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "progress", v11.receiver, v11.super_class);

  -[SBFullScreenToPeekSwitcherModifier medusaSettings](self, "medusaSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dropAnimationUnblurThresholdPercentage");
  v7 = BSFloatGreaterThanOrEqualToFloat();

  if (v7)
  {
    self->_resizedEnoughToUnblur = 1;
    v8 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 32, 2);
    SBAppendSwitcherModifierResponse(v8, v5);
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v9;
  }
  return v5;
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
  objc_super v19;
  objc_super v20;
  CGRect result;

  -[SBFullScreenToPeekSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBTransitionSwitcherModifier isUpdatingLayout](self, "isUpdatingLayout")
    && -[SBFullScreenToPeekSwitcherModifier _isPeekingAppLayout:](self, "_isPeekingAppLayout:", v6)
    && objc_msgSend(v6, "environment") == 2
    && !self->_animationPhase)
  {
    v20.receiver = self;
    v20.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
    -[SBFullScreenToPeekSwitcherModifier frameForIndex:](&v20, sel_frameForIndex_, a3);
    -[SBFullScreenToPeekSwitcherModifier _firstStageFrameForPeekingAppLayoutWithInitialFrame:](self, "_firstStageFrameForPeekingAppLayoutWithInitialFrame:");
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
    -[SBFullScreenToPeekSwitcherModifier frameForIndex:](&v19, sel_frameForIndex_, a3);
  }
  v11 = v7;
  v12 = v8;
  v13 = v9;
  v14 = v10;

  v15 = v11;
  v16 = v12;
  v17 = v13;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
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
  double v23;
  objc_super v24;
  objc_super v25;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4;
  if (-[SBTransitionSwitcherModifier isUpdatingLayout](self, "isUpdatingLayout")
    && -[SBFullScreenToPeekSwitcherModifier _isPeekingAppLayout:](self, "_isPeekingAppLayout:", v11)
    && objc_msgSend(v11, "environment") != 2
    && !self->_animationPhase)
  {
    v25.receiver = self;
    v25.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
    -[SBFullScreenToPeekSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v25, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v11, x, y, width, height);
    -[SBFullScreenToPeekSwitcherModifier _firstStageFrameForPeekingAppLayoutWithInitialFrame:](self, "_firstStageFrameForPeekingAppLayoutWithInitialFrame:");
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
    -[SBFullScreenToPeekSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v24, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v11, x, y, width, height);
  }
  v16 = v12;
  v17 = v13;
  v18 = v14;
  v19 = v15;

  v20 = v16;
  v21 = v17;
  v22 = v18;
  v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (CGRect)_firstStageFrameForPeekingAppLayoutWithInitialFrame:(CGRect)a3
{
  CGFloat height;
  double width;
  CGFloat y;
  int64_t peekConfiguration;
  int v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  peekConfiguration = self->_peekConfiguration;
  v8 = -[SBFullScreenToPeekSwitcherModifier isRTLEnabled](self, "isRTLEnabled", a3.origin.x);
  v9 = 2;
  if (v8)
    v9 = 3;
  if (peekConfiguration == v9)
  {
    v10 = 0.0;
    v11 = -1.0;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
    -[SBFullScreenToPeekSwitcherModifier switcherViewBounds](&v18, sel_switcherViewBounds);
    v10 = v12 - width;
    v11 = 1.0;
  }
  -[SBFullScreenToPeekSwitcherModifier _firstPhaseScale](self, "_firstPhaseScale");
  v14 = v10 + (width * (1.0 - v13) * 0.5 + -12.0) * v11;
  v15 = y;
  v16 = width;
  v17 = height;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (double)scaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  double v7;
  double v8;
  objc_super v10;

  v6 = a4;
  if (-[SBTransitionSwitcherModifier isUpdatingLayout](self, "isUpdatingLayout")
    && -[SBFullScreenToPeekSwitcherModifier _isPeekingAppLayout:](self, "_isPeekingAppLayout:", v6)
    && !self->_animationPhase)
  {
    -[SBFullScreenToPeekSwitcherModifier _firstPhaseScale](self, "_firstPhaseScale");
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
    -[SBFullScreenToPeekSwitcherModifier scaleForLayoutRole:inAppLayout:](&v10, sel_scaleForLayoutRole_inAppLayout_, a3, v6);
  }
  v8 = v7;

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

  if (self->_animationPhase)
  {
    v7.receiver = self;
    v7.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
    -[SBFullScreenToPeekSwitcherModifier cornerRadiiForIndex:](&v7, sel_cornerRadiiForIndex_, a3);
  }
  else
  {
    -[SBFullScreenToPeekSwitcherModifier displayCornerRadius](self, "displayCornerRadius", a3);
    SBRectCornerRadiiForRadius();
  }
  result.topRight = v6;
  result.bottomRight = v5;
  result.bottomLeft = v4;
  result.topLeft = v3;
  return result;
}

- (double)homeScreenAlpha
{
  double result;
  void *v3;
  void *v4;
  double v5;
  double v6;
  objc_super v7;

  if (self->_animationPhase)
  {
    v7.receiver = self;
    v7.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
    -[SBFullScreenToPeekSwitcherModifier homeScreenAlpha](&v7, sel_homeScreenAlpha);
  }
  else
  {
    -[SBFullScreenToPeekSwitcherModifier switcherSettings](self, "switcherSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "animationSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeScreenOpacityInApplication");
    v6 = v5;

    return v6;
  }
  return result;
}

- (double)homeScreenScale
{
  double result;
  void *v3;
  void *v4;
  double v5;
  double v6;
  objc_super v7;

  if (self->_animationPhase)
  {
    v7.receiver = self;
    v7.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
    -[SBFullScreenToPeekSwitcherModifier homeScreenScale](&v7, sel_homeScreenScale);
  }
  else
  {
    -[SBFullScreenToPeekSwitcherModifier switcherSettings](self, "switcherSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "animationSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeScreenScaleInApplication");
    v6 = v5;

    return v6;
  }
  return result;
}

- (double)homeScreenDimmingAlpha
{
  double v2;
  double v3;
  void *v4;
  void *v5;
  double v6;
  objc_super v8;

  if (self->_animationPhase)
  {
    v8.receiver = self;
    v8.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
    -[SBFullScreenToPeekSwitcherModifier homeScreenDimmingAlpha](&v8, sel_homeScreenDimmingAlpha);
    return v2;
  }
  else
  {
    -[SBFullScreenToPeekSwitcherModifier switcherSettings](self, "switcherSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "animationSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dimmingAlphaInApplication");
    v3 = v6 * 0.5;

  }
  return v3;
}

- (int64_t)homeScreenBackdropBlurType
{
  return 3;
}

- (double)homeScreenBackdropBlurProgress
{
  double result;
  void *v3;
  void *v4;
  double v5;
  double v6;
  objc_super v7;

  if (self->_animationPhase)
  {
    v7.receiver = self;
    v7.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
    -[SBFullScreenToPeekSwitcherModifier homeScreenBackdropBlurProgress](&v7, sel_homeScreenBackdropBlurProgress);
  }
  else
  {
    -[SBFullScreenToPeekSwitcherModifier switcherSettings](self, "switcherSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "animationSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeScreenBlurInApplication");
    v6 = v5;

    return v6;
  }
  return result;
}

- (double)wallpaperScale
{
  double result;
  void *v3;
  void *v4;
  double v5;
  double v6;
  objc_super v7;

  if (self->_animationPhase)
  {
    v7.receiver = self;
    v7.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
    -[SBFullScreenToPeekSwitcherModifier wallpaperScale](&v7, sel_wallpaperScale);
  }
  else
  {
    -[SBFullScreenToPeekSwitcherModifier switcherSettings](self, "switcherSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "animationSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "wallpaperScaleInApplication");
    v6 = v5;

    return v6;
  }
  return result;
}

- (BOOL)isContainerStatusBarVisible
{
  objc_super v3;

  if (!self->_animationPhase)
    return 0;
  v3.receiver = self;
  v3.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
  return -[SBFullScreenToPeekSwitcherModifier isContainerStatusBarVisible](&v3, sel_isContainerStatusBarVisible);
}

- (BOOL)wantsDockBehaviorAssertion
{
  return 1;
}

- (id)keyboardSuppressionMode
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[SBFullScreenToPeekSwitcherModifier appLayouts](self, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[SBSwitcherKeyboardSuppressionMode newSuppressionModeForSwitcherScenesFromAppLayouts:](SBSwitcherKeyboardSuppressionMode, "newSuppressionModeForSwitcherScenesFromAppLayouts:", v4);

  objc_msgSend(v5, "setApplyAssertionEvenIfAppIsHostingTheKeyboard:", 1);
  return v5;
}

- (double)dockProgress
{
  return 1.0;
}

- (BOOL)wantsDockWindowLevelAssertion
{
  return 1;
}

- (unint64_t)dockWindowLevelPriority
{
  return 0;
}

- (double)dockWindowLevel
{
  double v2;

  -[SBFullScreenToPeekSwitcherModifier homeScreenWindowLevel](self, "homeScreenWindowLevel");
  return v2 + -0.5;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(0, 0);
}

- (id)resizeProgressNotificationsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  objc_super v16;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
  v6 = a4;
  -[SBFullScreenToPeekSwitcherModifier resizeProgressNotificationsForLayoutRole:inAppLayout:](&v16, sel_resizeProgressNotificationsForLayoutRole_inAppLayout_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SBFullScreenToPeekSwitcherModifier _isPeekingAppLayout:](self, "_isPeekingAppLayout:", v6, v16.receiver, v16.super_class);

  if (v8)
  {
    -[SBFullScreenToPeekSwitcherModifier medusaSettings](self, "medusaSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dropAnimationUnblurThresholdPercentage");
    v11 = v10;

    v17[0] = &unk_1E91CF908;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v12;
    v17[2] = &unk_1E91CF918;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setByAddingObjectsFromArray:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v14;
  }
  return v7;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  SBFullScreenToPeekSwitcherModifier *v5;
  id v6;
  objc_super v8;

  v5 = self;
  v8.receiver = self;
  v8.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
  v6 = a4;
  LOBYTE(a3) = -[SBFullScreenToPeekSwitcherModifier isLayoutRoleMatchMovedToScene:inAppLayout:](&v8, sel_isLayoutRoleMatchMovedToScene_inAppLayout_, a3, v6);
  LOBYTE(v5) = -[SBFullScreenToPeekSwitcherModifier _isPeekingAppLayout:](v5, "_isPeekingAppLayout:", v6, v8.receiver, v8.super_class);

  return v5 | a3;
}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  unsigned __int8 v7;
  objc_super v9;

  v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
  v7 = -[SBFullScreenToPeekSwitcherModifier isLayoutRoleBlurred:inAppLayout:](&v9, sel_isLayoutRoleBlurred_inAppLayout_, a3, v6);
  if (-[SBFullScreenToPeekSwitcherModifier _isPeekingAppLayout:](self, "_isPeekingAppLayout:", v6))
  {
    if (-[SBFullScreenToPeekSwitcherModifier isLayoutRoleContentReady:inAppLayout:](self, "isLayoutRoleContentReady:inAppLayout:", a3, v6))v7 = !self->_resizedEnoughToUnblur;
    else
      v7 = 1;
  }

  return v7;
}

- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
  v6 = a4;
  -[SBFullScreenToPeekSwitcherModifier blurDelayForLayoutRole:inAppLayout:](&v13, sel_blurDelayForLayoutRole_inAppLayout_, a3, v6);
  v8 = v7;
  LODWORD(a3) = -[SBFullScreenToPeekSwitcherModifier _isPeekingAppLayout:](self, "_isPeekingAppLayout:", v6, v13.receiver, v13.super_class);

  if ((_DWORD)a3)
  {
    -[SBFullScreenToPeekSwitcherModifier switcherSettings](self, "switcherSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "animationSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resizeBlurDelay");
    v8 = v11;

  }
  return v8;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v11, sel_animationAttributesForLayoutElement_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[SBFullScreenToPeekSwitcherModifier switcherSettings](self, "switcherSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "animationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "performTwoPhaseFullScreenToPeekTransition"))
  {
    if (self->_animationPhase)
      objc_msgSend(v7, "fullScreenToPeekSecondPhaseAnimationSettings");
    else
      objc_msgSend(v7, "fullScreenToPeekFirstPhaseAnimationSettings");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v7, "zoomUpSettings");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
  objc_msgSend(v5, "setLayoutSettings:", v8);

  return v5;
}

- (double)_firstPhaseScale
{
  double v2;

  -[SBFullScreenToPeekSwitcherModifier containerViewBounds](self, "containerViewBounds");
  return (v2 + -24.0) / v2;
}

- (BOOL)_isPeekingAppLayout:(id)a3
{
  SBAppLayout *v4;
  SBAppLayout *toAppLayout;
  BOOL v6;
  BOOL v7;

  v4 = (SBAppLayout *)a3;
  toAppLayout = self->_toAppLayout;
  if (toAppLayout && self->_toFloatingAppLayout)
  {
    v6 = toAppLayout == v4;
  }
  else
  {
    if (toAppLayout == v4)
    {
      v7 = 1;
      goto LABEL_10;
    }
    v6 = self->_toFloatingAppLayout == v4;
  }
  v7 = v6;
LABEL_10:

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toFloatingAppLayout, 0);
  objc_storeStrong((id *)&self->_fromFloatingAppLayout, 0);
  objc_storeStrong((id *)&self->_toAppLayout, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
}

@end
