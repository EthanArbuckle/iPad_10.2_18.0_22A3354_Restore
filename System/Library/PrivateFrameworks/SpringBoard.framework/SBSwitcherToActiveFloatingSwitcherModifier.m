@implementation SBSwitcherToActiveFloatingSwitcherModifier

- (SBSwitcherToActiveFloatingSwitcherModifier)initWithTransitionID:(id)a3 direction:(int64_t)a4 fullScreenAppLayout:(id)a5 floatingDeckModifier:(id)a6
{
  id v11;
  id v12;
  SBSwitcherToActiveFloatingSwitcherModifier *v13;
  SBSwitcherToActiveFloatingSwitcherModifier *v14;
  objc_super v16;

  v11 = a5;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)SBSwitcherToActiveFloatingSwitcherModifier;
  v13 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v16, sel_initWithTransitionID_, a3);
  v14 = v13;
  if (v13)
  {
    v13->_direction = a4;
    objc_storeStrong((id *)&v13->_fullScreenAppLayout, a5);
    objc_storeStrong((id *)&v14->_floatingDeckModifier, a6);
  }

  return v14;
}

- (id)transitionWillBegin
{
  void *v3;
  SBSwitcherModifierEventResponse *v4;
  SBAppLayout *v5;
  SBScrollToAppLayoutSwitcherEventResponse *v6;
  uint64_t v7;
  SBUpdateLayoutSwitcherEventResponse *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBSwitcherToActiveFloatingSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v11, sel_transitionWillBegin);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(SBSwitcherModifierEventResponse);
  if (self->_direction == 1)
  {
    v5 = self->_fullScreenAppLayout;
    if (v5)
    {
      v6 = -[SBScrollToAppLayoutSwitcherEventResponse initWithAppLayout:alignment:animated:]([SBScrollToAppLayoutSwitcherEventResponse alloc], "initWithAppLayout:alignment:animated:", v5, 0, 0);
      -[SBChainableModifierEventResponse addChildResponse:](v4, "addChildResponse:", v6);

    }
  }
  else
  {
    v5 = 0;
  }
  if (self->_direction == 1 && -[SBAppLayout type](self->_fullScreenAppLayout, "type") == 2)
    v7 = 30;
  else
    v7 = 2;
  v8 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", v7, 2);
  -[SBChainableModifierEventResponse addChildResponse:](v4, "addChildResponse:", v8);

  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v4, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)visibleAppLayouts
{
  SBSwitcherModifier *floatingDeckModifier;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__51;
  v14 = __Block_byref_object_dispose__51;
  v15 = 0;
  floatingDeckModifier = self->_floatingDeckModifier;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__SBSwitcherToActiveFloatingSwitcherModifier_visibleAppLayouts__block_invoke;
  v9[3] = &unk_1E8E9DFA0;
  v9[4] = self;
  v9[5] = &v10;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", floatingDeckModifier, v9);
  v4 = (void *)v11[5];
  v8.receiver = self;
  v8.super_class = (Class)SBSwitcherToActiveFloatingSwitcherModifier;
  -[SBSwitcherToActiveFloatingSwitcherModifier visibleAppLayouts](&v8, sel_visibleAppLayouts);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setByAddingObjectsFromSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v10, 8);
  return v6;
}

void __63__SBSwitcherToActiveFloatingSwitcherModifier_visibleAppLayouts__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "visibleAppLayouts");
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
  v8.super_class = (Class)SBSwitcherToActiveFloatingSwitcherModifier;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v8, sel_animationAttributesForLayoutElement_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[SBSwitcherToActiveFloatingSwitcherModifier _layoutSettings](self, "_layoutSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayoutSettings:", v6);

  return v5;
}

- (id)_layoutSettings
{
  void *v2;
  void *v3;
  void *v4;

  -[SBSwitcherToActiveFloatingSwitcherModifier switcherSettings](self, "switcherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "animationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "launchAppFromSwitcherSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  return 1.0;
}

- (BOOL)wantsSwitcherBackdropBlur
{
  return 1;
}

- (int64_t)switcherBackdropBlurType
{
  return 3;
}

- (BOOL)wantsSwitcherDimmingView
{
  return 1;
}

- (id)appLayoutToScrollToBeforeTransitioning
{
  return 0;
}

- (id)appLayoutsToCacheSnapshots
{
  SBSwitcherModifier *floatingDeckModifier;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__51;
  v10 = __Block_byref_object_dispose__51;
  v11 = 0;
  floatingDeckModifier = self->_floatingDeckModifier;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__SBSwitcherToActiveFloatingSwitcherModifier_appLayoutsToCacheSnapshots__block_invoke;
  v5[3] = &unk_1E8E9DFA0;
  v5[4] = self;
  v5[5] = &v6;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", floatingDeckModifier, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __72__SBSwitcherToActiveFloatingSwitcherModifier_appLayoutsToCacheSnapshots__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "appLayoutsToCacheSnapshots");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBSwitcherToActiveFloatingSwitcherModifier;
  return (SBSwitcherAsyncRenderingAttributes)(-[SBTransitionSwitcherModifier asyncRenderingAttributesForAppLayout:](&v4, sel_asyncRenderingAttributesForAppLayout_, a3) | 0x100);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingDeckModifier, 0);
  objc_storeStrong((id *)&self->_fullScreenAppLayout, 0);
}

@end
