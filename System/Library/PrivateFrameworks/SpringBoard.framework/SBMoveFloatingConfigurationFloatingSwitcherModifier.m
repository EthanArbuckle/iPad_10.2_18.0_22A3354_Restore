@implementation SBMoveFloatingConfigurationFloatingSwitcherModifier

- (SBMoveFloatingConfigurationFloatingSwitcherModifier)initWithTransitionID:(id)a3 fromFloatingConfiguration:(int64_t)a4 toFloatingConfiguration:(int64_t)a5
{
  SBMoveFloatingConfigurationFloatingSwitcherModifier *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBMoveFloatingConfigurationFloatingSwitcherModifier;
  result = -[SBTransitionSwitcherModifier initWithTransitionID:](&v8, sel_initWithTransitionID_, a3);
  if (result)
  {
    result->_fromFloatingConfiguration = a4;
    result->_toFloatingConfiguration = a5;
  }
  return result;
}

- (id)transitionWillBegin
{
  void *v2;
  SBUpdateLayoutSwitcherEventResponse *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBMoveFloatingConfigurationFloatingSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v6, sel_transitionWillBegin);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 2, 2);
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)visibleAppLayouts
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBMoveFloatingConfigurationFloatingSwitcherModifier;
  -[SBMoveFloatingConfigurationFloatingSwitcherModifier visibleAppLayouts](&v8, sel_visibleAppLayouts);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMoveFloatingConfigurationFloatingSwitcherModifier appLayouts](self, "appLayouts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "setByAddingObject:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }

  return v3;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBMoveFloatingConfigurationFloatingSwitcherModifier;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v8, sel_animationAttributesForLayoutElement_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[SBMoveFloatingConfigurationFloatingSwitcherModifier _layoutSettings](self, "_layoutSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayoutSettings:", v6);

  return v5;
}

- (id)_layoutSettings
{
  void *v2;
  void *v3;

  -[SBMoveFloatingConfigurationFloatingSwitcherModifier medusaSettings](self, "medusaSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "medusaAnimationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  double result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBMoveFloatingConfigurationFloatingSwitcherModifier;
  -[SBMoveFloatingConfigurationFloatingSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](&v7, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, a4);
  if (!a5)
    return 1.0;
  return result;
}

- (BOOL)shouldPerformCrossfadeForReduceMotion
{
  return self->_fromFloatingConfiguration != self->_toFloatingConfiguration;
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
  id v4;
  void *v5;
  int v6;
  unsigned __int16 v7;
  SBSwitcherAsyncRenderingAttributes v8;
  objc_super v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sbf_isLowEndForSlideOverMoveGesture");

  if (v6)
  {
    v7 = SBSwitcherAsyncRenderingAttributesMake(1u, 0);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SBMoveFloatingConfigurationFloatingSwitcherModifier;
    v7 = (unsigned __int16)-[SBTransitionSwitcherModifier asyncRenderingAttributesForAppLayout:](&v10, sel_asyncRenderingAttributesForAppLayout_, v4);
  }
  v8 = (SBSwitcherAsyncRenderingAttributes)v7;

  return v8;
}

@end
