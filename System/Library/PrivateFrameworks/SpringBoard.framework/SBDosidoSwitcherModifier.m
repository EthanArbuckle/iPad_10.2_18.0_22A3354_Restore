@implementation SBDosidoSwitcherModifier

- (SBDosidoSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5 direction:(unint64_t)a6
{
  id v12;
  id v13;
  SBDosidoSwitcherModifier *v14;
  void *v16;
  void *v17;
  objc_super v18;

  v12 = a4;
  v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SBDosidoSwitcherModifier;
  v14 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v18, sel_initWithTransitionID_, a3);
  if (v14)
  {
    if (v12)
    {
      if (v13)
      {
LABEL_4:
        objc_storeStrong((id *)&v14->_fromAppLayout, a4);
        objc_storeStrong((id *)&v14->_toAppLayout, a5);
        v14->_direction = a6;
        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, CFSTR("SBDosidoSwitcherModifier.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromAppLayout"));

      if (v13)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, CFSTR("SBDosidoSwitcherModifier.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toAppLayout"));

    goto LABEL_4;
  }
LABEL_5:

  return v14;
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

  -[SBDosidoSwitcherModifier switcherSettings](self, "switcherSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "animationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "disableAsyncRenderingTransitionPercentage");
  v8 = v7;

  -[SBDosidoSwitcherModifier _layoutSettings](self, "_layoutSettings");
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
  SBInvalidateAdjustedAppLayoutsSwitcherEventResponse *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBDosidoSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v8, sel_transitionWillBegin);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 30, 2);
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)transitionWillUpdate
{
  void *v3;
  SBDosidoScaleAnimationSwitcherEventResponse *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBDosidoSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillUpdate](&v7, sel_transitionWillUpdate);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[SBDosidoSwitcherModifier isReduceMotionEnabled](self, "isReduceMotionEnabled") & 1) == 0
    && !-[SBDosidoSwitcherModifier shouldSuppressScaleAnimation](self, "shouldSuppressScaleAnimation"))
  {
    v4 = -[SBDosidoScaleAnimationSwitcherEventResponse initWithAppLayout:]([SBDosidoScaleAnimationSwitcherEventResponse alloc], "initWithAppLayout:", self->_fromAppLayout);
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v4, v3);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  return v3;
}

- (id)handleSwipeToKillEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBDosidoSwitcherModifier;
  -[SBSwitcherModifier handleSwipeToKillEvent:](&v10, sel_handleSwipeToKillEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBAppLayout isOrContainsAppLayout:](self->_fromAppLayout, "isOrContainsAppLayout:", v6)
    || -[SBAppLayout isOrContainsAppLayout:](self->_toAppLayout, "isOrContainsAppLayout:", v6))
  {
    objc_msgSend(v4, "progress");
    if ((BSFloatIsZero() & 1) == 0)
    {
      -[SBTransitionSwitcherModifier interruptAndEndTransition](self, "interruptAndEndTransition");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v7, v5);
      v8 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v8;
    }
  }

  return v5;
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  void *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t direction;
  BOOL v9;
  BOOL v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBDosidoSwitcherModifier;
  -[SBTransitionSwitcherModifier adjustedAppLayoutsForAppLayouts:](&v13, sel_adjustedAppLayoutsForAppLayouts_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "indexOfObject:", self->_fromAppLayout);
  v6 = objc_msgSend(v4, "indexOfObject:", self->_toAppLayout);
  v7 = v6;
  direction = self->_direction;
  if (direction)
    v9 = 0;
  else
    v9 = v6 > v5;
  if (v9 || (direction == 1 ? (v10 = v6 >= v5) : (v10 = 1), !v10))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v4);
    objc_msgSend(v11, "replaceObjectAtIndex:withObject:", v5, self->_toAppLayout);
    objc_msgSend(v11, "replaceObjectAtIndex:withObject:", v7, self->_fromAppLayout);

    v4 = v11;
  }
  return v4;
}

- (id)visibleAppLayouts
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[SBDosidoSwitcherModifier appLayouts](self, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "indexOfObject:", self->_fromAppLayout);
  v5 = objc_msgSend(v3, "indexOfObject:", self->_toAppLayout);
  if (v4 >= v5)
    v6 = v5;
  else
    v6 = v4;
  if (v4 <= v5)
    v7 = v5;
  else
    v7 = v4;
  v8 = (void *)MEMORY[0x1E0C99E60];
  -[SBDosidoSwitcherModifier appLayouts](self, "appLayouts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "subarrayWithRange:", v6, v7 - v6 + 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBDosidoSwitcherModifier;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v8, sel_animationAttributesForLayoutElement_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[SBDosidoSwitcherModifier _layoutSettings](self, "_layoutSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayoutSettings:", v6);

  return v5;
}

- (id)_layoutSettings
{
  void *v2;
  void *v3;
  void *v4;

  -[SBDosidoSwitcherModifier switcherSettings](self, "switcherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "animationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dosidoSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  void *v9;
  double v10;
  double v11;
  objc_super v13;

  v8 = a4;
  -[SBDosidoSwitcherModifier visibleAppLayouts](self, "visibleAppLayouts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 1.0;
  if ((objc_msgSend(v9, "containsObject:", v8) & 1) == 0)
  {
    v13.receiver = self;
    v13.super_class = (Class)SBDosidoSwitcherModifier;
    -[SBDosidoSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](&v13, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, v8, a5);
    v10 = v11;
  }

  return v10;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIRectCornerRadii result;

  -[SBDosidoSwitcherModifier displayCornerRadius](self, "displayCornerRadius", a3);
  SBRectCornerRadiiForRadius();
  result.topRight = v6;
  result.bottomRight = v5;
  result.bottomLeft = v4;
  result.topLeft = v3;
  return result;
}

- (int64_t)homeScreenBackdropBlurType
{
  return 1;
}

- (BOOL)isWallpaperRequiredForSwitcher
{
  return 1;
}

- (int64_t)wallpaperStyle
{
  return 3;
}

- (BOOL)isHomeScreenContentRequired
{
  return 0;
}

- (BOOL)isSwitcherWindowVisible
{
  return 1;
}

- (BOOL)shouldSuppressScaleAnimation
{
  return self->_shouldSuppressScaleAnimation;
}

- (void)setShouldSuppressScaleAnimation:(BOOL)a3
{
  self->_shouldSuppressScaleAnimation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toAppLayout, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
}

@end
