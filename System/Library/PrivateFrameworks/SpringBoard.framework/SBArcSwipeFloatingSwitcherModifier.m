@implementation SBArcSwipeFloatingSwitcherModifier

- (SBArcSwipeFloatingSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5 floatingConfiguration:(int64_t)a6 direction:(unint64_t)a7 needsOvershoot:(BOOL)a8
{
  id v15;
  id v16;
  SBArcSwipeFloatingSwitcherModifier *v17;
  SBArcSwipeFloatingSwitcherModifier *v18;
  BOOL v19;
  objc_super v21;

  v15 = a4;
  v16 = a5;
  v21.receiver = self;
  v21.super_class = (Class)SBArcSwipeFloatingSwitcherModifier;
  v17 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v21, sel_initWithTransitionID_, a3);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_fromAppLayout, a4);
    objc_storeStrong((id *)&v18->_toAppLayout, a5);
    v18->_floatingConfiguration = a6;
    v18->_direction = a7;
    v19 = !a8;
    if (v15 == v16)
      v19 = 1;
    v18->_hasReshuffledZOrder = v19;
  }

  return v18;
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

  -[SBArcSwipeFloatingSwitcherModifier switcherSettings](self, "switcherSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "animationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "disableAsyncRenderingTransitionPercentage");
  v8 = v7;

  -[SBArcSwipeFloatingSwitcherModifier _layoutSettings](self, "_layoutSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "settlingDuration");
  v11 = v8 * v10;
  UIAnimationDragCoefficient();
  *a3 = v11 * v12;

  return 1;
}

- (id)transitionWillBegin
{
  void *v2;
  SBUpdateLayoutSwitcherEventResponse *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBArcSwipeFloatingSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v6, sel_transitionWillBegin);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 2, 2);
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)transitionWillUpdate
{
  void *v3;
  uint64_t v4;
  unint64_t direction;
  void *v6;
  void *v7;
  double v8;
  double v9;
  float v10;
  float v11;
  SBTimerEventSwitcherEventResponse *v12;
  SBTimerEventSwitcherEventResponse *v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  BOOL (*v18)(uint64_t);
  void *v19;
  id v20;
  id location;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)SBArcSwipeFloatingSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillUpdate](&v22, sel_transitionWillUpdate);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_hasReshuffledZOrder)
  {
    v4 = self->_floatingConfiguration != 2;
    direction = self->_direction;
    -[SBArcSwipeFloatingSwitcherModifier switcherSettings](self, "switcherSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatingSwitcherSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (direction == v4)
      objc_msgSend(v7, "overshootPullbackDelayOffscreen");
    else
      objc_msgSend(v7, "overshootPullbackDelayOnscreen");
    v9 = v8;
    UIAnimationDragCoefficient();
    v11 = v10;
    objc_initWeak(&location, self);
    v12 = [SBTimerEventSwitcherEventResponse alloc];
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __58__SBArcSwipeFloatingSwitcherModifier_transitionWillUpdate__block_invoke;
    v19 = &unk_1E8EA3468;
    objc_copyWeak(&v20, &location);
    v13 = -[SBTimerEventSwitcherEventResponse initWithDelay:validator:reason:](v12, "initWithDelay:validator:reason:", &v16, CFSTR("kSBArcSwipeFloatingSwitcherModifierReshuffleReason"), v9 * v11);
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v13, v3, v16, v17, v18, v19);
    v14 = objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);

    v3 = (void *)v14;
  }
  return v3;
}

BOOL __58__SBArcSwipeFloatingSwitcherModifier_transitionWillUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _BOOL8 v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "parentModifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

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
  v10.super_class = (Class)SBArcSwipeFloatingSwitcherModifier;
  v4 = a3;
  -[SBTransitionSwitcherModifier handleTimerEvent:](&v10, sel_handleTimerEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reason", v10.receiver, v10.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v6, "isEqualToString:", CFSTR("kSBArcSwipeFloatingSwitcherModifierReshuffleReason"));
  if ((_DWORD)v4)
  {
    self->_hasReshuffledZOrder = 1;
    v7 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 30, 3);
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v7, v5);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  return v5;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  unint64_t direction;
  int v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  objc_super v25;
  CGRect result;

  v25.receiver = self;
  v25.super_class = (Class)SBArcSwipeFloatingSwitcherModifier;
  -[SBArcSwipeFloatingSwitcherModifier frameForIndex:](&v25, sel_frameForIndex_);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SBArcSwipeFloatingSwitcherModifier appLayouts](self, "appLayouts");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndex:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  direction = self->_direction;
  if (direction)
  {
    if (direction != 1 || -[SBAppLayout isEqual:](self->_toAppLayout, "isEqual:", v14))
      goto LABEL_12;
  }
  else if (!-[SBAppLayout isEqual:](self->_fromAppLayout, "isEqual:", v14))
  {
    goto LABEL_12;
  }
  if (!self->_hasReshuffledZOrder)
  {
    v16 = -[SBArcSwipeFloatingSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
    -[SBArcSwipeFloatingSwitcherModifier containerViewBounds](self, "containerViewBounds");
    v18 = 1.2;
    if (v16)
      v18 = -1.2;
    v19 = v17 * v18;
    v20 = -(v17 * v18);
    if (self->_direction != 1)
      v20 = v19;
    v6 = v6 + v20;
  }
LABEL_12:

  v21 = v6;
  v22 = v8;
  v23 = v10;
  v24 = v12;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  void *v7;
  int64_t v8;
  double v9;
  objc_super v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBArcSwipeFloatingSwitcherModifier;
  -[SBArcSwipeFloatingSwitcherModifier scaleForIndex:](&v12, sel_scaleForIndex_);
  v6 = v5;
  if (-[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout"))
  {
    -[SBArcSwipeFloatingSwitcherModifier appLayouts](self, "appLayouts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = a3 - objc_msgSend(v7, "indexOfObject:", self->_fromAppLayout);
    if (v8 < 0)
      v8 += objc_msgSend(v7, "count");
    v11.receiver = self;
    v11.super_class = (Class)SBArcSwipeFloatingSwitcherModifier;
    -[SBArcSwipeFloatingSwitcherModifier scaleForIndex:](&v11, sel_scaleForIndex_, v8);
    v6 = v9;

  }
  return v6;
}

- (id)topMostLayoutElements
{
  void *v3;
  void *v4;
  unint64_t direction;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBArcSwipeFloatingSwitcherModifier;
  -[SBArcSwipeFloatingSwitcherModifier topMostLayoutElements](&v8, sel_topMostLayoutElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!self->_hasReshuffledZOrder)
  {
    direction = self->_direction;
    if (direction == 1)
    {
      v6 = (void *)objc_msgSend(v3, "mutableCopy");
      objc_msgSend(v6, "removeObject:", self->_toAppLayout);
      objc_msgSend(v6, "addObject:", self->_toAppLayout);
      goto LABEL_6;
    }
    if (!direction)
    {
      v6 = (void *)objc_msgSend(v3, "mutableCopy");
      objc_msgSend(v6, "removeObject:", self->_fromAppLayout);
      objc_msgSend(v6, "insertObject:atIndex:", self->_fromAppLayout, 0);
LABEL_6:

      v4 = v6;
    }
  }
  return v4;
}

- (id)visibleAppLayouts
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v4 = v3;
  if (self->_toAppLayout)
    objc_msgSend(v3, "addObject:");
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
  v8.super_class = (Class)SBArcSwipeFloatingSwitcherModifier;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v8, sel_animationAttributesForLayoutElement_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[SBArcSwipeFloatingSwitcherModifier _layoutSettings](self, "_layoutSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayoutSettings:", v6);

  return v5;
}

- (id)_layoutSettings
{
  void *v3;
  void *v4;
  void *v5;

  -[SBArcSwipeFloatingSwitcherModifier switcherSettings](self, "switcherSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((-[SBArcSwipeFloatingSwitcherModifier isReduceMotionEnabled](self, "isReduceMotionEnabled") & 1) != 0)
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

- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3
{
  SBAppLayout *toAppLayout;
  void *v5;
  void *v6;
  BOOL v7;

  toAppLayout = self->_toAppLayout;
  if (!toAppLayout)
    return 0;
  -[SBArcSwipeFloatingSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBAppLayout isEqual:](toAppLayout, "isEqual:", v6);

  return v7;
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
  v4.super_class = (Class)SBArcSwipeFloatingSwitcherModifier;
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
    v5.super_class = (Class)SBArcSwipeFloatingSwitcherModifier;
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
  v7.super_class = (Class)SBArcSwipeFloatingSwitcherModifier;
  v4 = (unsigned __int16)-[SBTransitionSwitcherModifier asyncRenderingAttributesForAppLayout:](&v7, sel_asyncRenderingAttributesForAppLayout_, a3);
  if (self->_fromAppLayout == self->_toAppLayout)
    v5 = 0;
  else
    v5 = v4;
  return (SBSwitcherAsyncRenderingAttributes)(v5 | v4 & 0xFF00);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
  objc_storeStrong((id *)&self->_toAppLayout, 0);
}

@end
