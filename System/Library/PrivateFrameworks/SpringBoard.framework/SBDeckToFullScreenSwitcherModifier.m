@implementation SBDeckToFullScreenSwitcherModifier

- (SBDeckToFullScreenSwitcherModifier)initWithTransitionID:(id)a3 direction:(int64_t)a4 fullScreenAppLayout:(id)a5 deckModifier:(id)a6
{
  id v11;
  id v12;
  SBDeckToFullScreenSwitcherModifier *v13;
  SBDeckToFullScreenSwitcherModifier *v14;
  objc_super v16;

  v11 = a5;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)SBDeckToFullScreenSwitcherModifier;
  v13 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v16, sel_initWithTransitionID_, a3);
  v14 = v13;
  if (v13)
  {
    v13->_direction = a4;
    objc_storeStrong((id *)&v13->_fullScreenAppLayout, a5);
    objc_storeStrong((id *)&v14->_deckModifier, a6);
    v14->_wantsMinificationFilter = 0;
  }

  return v14;
}

- (BOOL)shouldAsyncRenderUntilDelay:(double *)a3
{
  int64_t direction;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  float v13;

  direction = self->_direction;
  if (!direction)
  {
    -[SBDeckToFullScreenSwitcherModifier switcherSettings](self, "switcherSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "animationSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "disableAsyncRenderingTransitionPercentage");
    v9 = v8;

    -[SBDeckToFullScreenSwitcherModifier _layoutSettings](self, "_layoutSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "settlingDuration");
    v12 = v9 * v11;
    UIAnimationDragCoefficient();
    *a3 = v12 * v13;

  }
  return direction == 0;
}

- (id)transitionWillBegin
{
  void *v3;
  void *v4;
  SBScrollToAppLayoutSwitcherEventResponse *v5;
  uint64_t v6;
  SBUpdateLayoutSwitcherEventResponse *v7;
  uint64_t v8;
  SBUpdateLayoutSwitcherEventResponse *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBDeckToFullScreenSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v12, sel_transitionWillBegin);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDeckToFullScreenSwitcherModifier _appLayoutToScrollToDuringTransition](self, "_appLayoutToScrollToDuringTransition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[SBScrollToAppLayoutSwitcherEventResponse initWithAppLayout:alignment:animated:]([SBScrollToAppLayoutSwitcherEventResponse alloc], "initWithAppLayout:alignment:animated:", v4, 0, 0);
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v5, v3);
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  if (self->_direction == 1 && -[SBAppLayout type](self->_fullScreenAppLayout, "type") == 2)
  {
    v7 = [SBUpdateLayoutSwitcherEventResponse alloc];
    v8 = 30;
  }
  else
  {
    v7 = [SBUpdateLayoutSwitcherEventResponse alloc];
    v8 = 2;
  }
  v9 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:](v7, "initWithOptions:updateMode:", v8, 2);
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v9, v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  objc_msgSend(v4, "transitionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTransitionSwitcherModifier transitionID](self, "transitionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
  {
    objc_msgSend(v4, "fromAppLayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toAppLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self->_wantsMinificationFilter = objc_msgSend(v8, "isEqual:", v9);

  }
  v12.receiver = self;
  v12.super_class = (Class)SBDeckToFullScreenSwitcherModifier;
  -[SBTransitionSwitcherModifier handleTransitionEvent:](&v12, sel_handleTransitionEvent_, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)visibleAppLayouts
{
  SBSwitcherModifier *deckModifier;
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
  v13 = __Block_byref_object_copy__121;
  v14 = __Block_byref_object_dispose__121;
  v15 = 0;
  deckModifier = self->_deckModifier;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__SBDeckToFullScreenSwitcherModifier_visibleAppLayouts__block_invoke;
  v9[3] = &unk_1E8E9DFA0;
  v9[4] = self;
  v9[5] = &v10;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", deckModifier, v9);
  v4 = (void *)v11[5];
  v8.receiver = self;
  v8.super_class = (Class)SBDeckToFullScreenSwitcherModifier;
  -[SBDeckToFullScreenSwitcherModifier visibleAppLayouts](&v8, sel_visibleAppLayouts);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setByAddingObjectsFromSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v10, 8);
  return v6;
}

void __55__SBDeckToFullScreenSwitcherModifier_visibleAppLayouts__block_invoke(uint64_t a1)
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
  v8.super_class = (Class)SBDeckToFullScreenSwitcherModifier;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v8, sel_animationAttributesForLayoutElement_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[SBDeckToFullScreenSwitcherModifier _layoutSettings](self, "_layoutSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayoutSettings:", v6);

  return v5;
}

- (id)_layoutSettings
{
  void *v3;
  void *v4;
  void *v5;

  -[SBDeckToFullScreenSwitcherModifier switcherSettings](self, "switcherSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_direction == 1)
    objc_msgSend(v4, "toggleAppSwitcherSettings");
  else
    objc_msgSend(v4, "launchAppFromSwitcherSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  return 1.0;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  UIRectCornerRadii result;

  if (self->_direction)
  {
    v7.receiver = self;
    v7.super_class = (Class)SBDeckToFullScreenSwitcherModifier;
    -[SBDeckToFullScreenSwitcherModifier cornerRadiiForIndex:](&v7, sel_cornerRadiiForIndex_, a3);
  }
  else
  {
    -[SBDeckToFullScreenSwitcherModifier displayCornerRadius](self, "displayCornerRadius", a3);
    SBRectCornerRadiiForRadius();
  }
  result.topRight = v6;
  result.bottomRight = v5;
  result.bottomLeft = v4;
  result.topLeft = v3;
  return result;
}

- (int64_t)homeScreenBackdropBlurType
{
  return 2;
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

- (id)topMostLayoutElements
{
  SBSwitcherModifier *deckModifier;
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
  v9 = __Block_byref_object_copy__121;
  v10 = __Block_byref_object_dispose__121;
  v11 = 0;
  deckModifier = self->_deckModifier;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__SBDeckToFullScreenSwitcherModifier_topMostLayoutElements__block_invoke;
  v5[3] = &unk_1E8E9DFA0;
  v5[4] = self;
  v5[5] = &v6;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", deckModifier, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __59__SBDeckToFullScreenSwitcherModifier_topMostLayoutElements__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "topMostLayoutElements");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)appLayoutsToCacheSnapshots
{
  SBSwitcherModifier *deckModifier;
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
  v9 = __Block_byref_object_copy__121;
  v10 = __Block_byref_object_dispose__121;
  v11 = 0;
  deckModifier = self->_deckModifier;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__SBDeckToFullScreenSwitcherModifier_appLayoutsToCacheSnapshots__block_invoke;
  v5[3] = &unk_1E8E9DFA0;
  v5[4] = self;
  v5[5] = &v6;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", deckModifier, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __64__SBDeckToFullScreenSwitcherModifier_appLayoutsToCacheSnapshots__block_invoke(uint64_t a1)
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

- (id)appLayoutToScrollToBeforeTransitioning
{
  if (self->_direction)
    return 0;
  else
    return self->_fullScreenAppLayout;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBDeckToFullScreenSwitcherModifier;
  return (SBSwitcherAsyncRenderingAttributes)(-[SBTransitionSwitcherModifier asyncRenderingAttributesForAppLayout:](&v4, sel_asyncRenderingAttributesForAppLayout_, a3) | (self->_wantsMinificationFilter << 8));
}

- (id)_appLayoutToScrollToDuringTransition
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (self->_direction == 1)
  {
    -[SBDeckToFullScreenSwitcherModifier appLayouts](self, "appLayouts");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "indexOfObject:", self->_fullScreenAppLayout);
    v5 = objc_msgSend(v3, "count");
    if (v5 - 1 >= (unint64_t)(v4 + 1))
      v6 = v4 + 1;
    else
      v6 = v5 - 1;
    objc_msgSend(v3, "objectAtIndex:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deckModifier, 0);
  objc_storeStrong((id *)&self->_fullScreenAppLayout, 0);
}

@end
