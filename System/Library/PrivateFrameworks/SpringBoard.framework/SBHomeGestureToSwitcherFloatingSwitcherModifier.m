@implementation SBHomeGestureToSwitcherFloatingSwitcherModifier

- (SBHomeGestureToSwitcherFloatingSwitcherModifier)initWithTransitionID:(id)a3 multitaskingModifier:(id)a4 selectedAppLayout:(id)a5
{
  id v9;
  id v10;
  SBHomeGestureToSwitcherFloatingSwitcherModifier *v11;
  SBHomeGestureToSwitcherFloatingSwitcherModifier *v12;
  void *v13;
  uint64_t v14;
  SBFluidSwitcherAnimationSettings *animationSettings;
  objc_super v17;

  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SBHomeGestureToSwitcherFloatingSwitcherModifier;
  v11 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v17, sel_initWithTransitionID_, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_multitaskingModifier, a4);
    objc_storeStrong((id *)&v12->_selectedAppLayout, a5);
    +[SBAppSwitcherDomain rootSettings](SBAppSwitcherDomain, "rootSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "animationSettings");
    v14 = objc_claimAutoreleasedReturnValue();
    animationSettings = v12->_animationSettings;
    v12->_animationSettings = (SBFluidSwitcherAnimationSettings *)v14;

  }
  return v12;
}

- (id)transitionWillBegin
{
  void *v3;
  SBSwitcherModifierEventResponse *v4;
  SBScrollToAppLayoutSwitcherEventResponse *v5;
  void *v6;
  SBScrollToAppLayoutSwitcherEventResponse *v7;
  SBUpdateLayoutSwitcherEventResponse *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBHomeGestureToSwitcherFloatingSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v11, sel_transitionWillBegin);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(SBSwitcherModifierEventResponse);
  v5 = [SBScrollToAppLayoutSwitcherEventResponse alloc];
  -[SBHomeGestureToSwitcherFloatingSwitcherModifier selectedAppLayout](self, "selectedAppLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBScrollToAppLayoutSwitcherEventResponse initWithAppLayout:alignment:animated:](v5, "initWithAppLayout:alignment:animated:", v6, 0, 0);
  -[SBChainableModifierEventResponse addChildResponse:](v4, "addChildResponse:", v7);

  v8 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 2, 2);
  -[SBChainableModifierEventResponse addChildResponse:](v4, "addChildResponse:", v8);

  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v4, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)visibleAppLayouts
{
  SBSwitcherModifier *multitaskingModifier;
  id v4;
  objc_super v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  if (-[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout"))
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x3032000000;
    v11 = __Block_byref_object_copy__123;
    v12 = __Block_byref_object_dispose__123;
    v13 = 0;
    multitaskingModifier = self->_multitaskingModifier;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __68__SBHomeGestureToSwitcherFloatingSwitcherModifier_visibleAppLayouts__block_invoke;
    v7[3] = &unk_1E8E9DFA0;
    v7[4] = self;
    v7[5] = &v8;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", multitaskingModifier, v7);
    v4 = (id)v9[5];
    _Block_object_dispose(&v8, 8);

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBHomeGestureToSwitcherFloatingSwitcherModifier;
    -[SBHomeGestureToSwitcherFloatingSwitcherModifier visibleAppLayouts](&v6, sel_visibleAppLayouts);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

void __68__SBHomeGestureToSwitcherFloatingSwitcherModifier_visibleAppLayouts__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "visibleAppLayouts");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)animationAttributesForLayoutElement:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBHomeGestureToSwitcherFloatingSwitcherModifier;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v8, sel_animationAttributesForLayoutElement_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[SBHomeGestureToSwitcherFloatingSwitcherModifier _layoutSettings](self, "_layoutSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayoutSettings:", v6);

  return v5;
}

- (id)_layoutSettings
{
  BOOL v3;
  SBFluidSwitcherAnimationSettings *animationSettings;

  v3 = SBReduceMotion();
  animationSettings = self->_animationSettings;
  if (v3)
    -[SBFluidSwitcherAnimationSettings reduceMotionAppToSwitcherSettings](animationSettings, "reduceMotionAppToSwitcherSettings");
  else
    -[SBFluidSwitcherAnimationSettings gestureInitiatedAppToSwitcherSettings](animationSettings, "gestureInitiatedAppToSwitcherSettings");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(1u, 1);
}

- (SBSwitcherModifier)multitaskingModifier
{
  return self->_multitaskingModifier;
}

- (void)setMultitaskingModifier:(id)a3
{
  objc_storeStrong((id *)&self->_multitaskingModifier, a3);
}

- (SBAppLayout)selectedAppLayout
{
  return self->_selectedAppLayout;
}

- (void)setSelectedAppLayout:(id)a3
{
  objc_storeStrong((id *)&self->_selectedAppLayout, a3);
}

- (SBFluidSwitcherAnimationSettings)animationSettings
{
  return self->_animationSettings;
}

- (void)setAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_animationSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationSettings, 0);
  objc_storeStrong((id *)&self->_selectedAppLayout, 0);
  objc_storeStrong((id *)&self->_multitaskingModifier, 0);
}

@end
