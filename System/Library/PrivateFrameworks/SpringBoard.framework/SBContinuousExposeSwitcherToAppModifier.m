@implementation SBContinuousExposeSwitcherToAppModifier

- (SBContinuousExposeSwitcherToAppModifier)initWithTransitionID:(id)a3 direction:(int64_t)a4 multitaskingModifier:(id)a5
{
  id v9;
  SBContinuousExposeSwitcherToAppModifier *v10;
  SBContinuousExposeSwitcherToAppModifier *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SBContinuousExposeSwitcherToAppModifier;
  v10 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v13, sel_initWithTransitionID_, a3);
  v11 = v10;
  if (v10)
  {
    v10->_direction = a4;
    objc_storeStrong((id *)&v10->_multitaskingModifier, a5);
  }

  return v11;
}

- (id)transitionWillBegin
{
  void *v3;
  SBScrollToAppLayoutSwitcherEventResponse *v4;
  void *v5;
  void *v6;
  SBScrollToAppLayoutSwitcherEventResponse *v7;
  void *v8;
  SBUpdateLayoutSwitcherEventResponse *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBContinuousExposeSwitcherToAppModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v11, sel_transitionWillBegin);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_direction == 1)
  {
    v4 = [SBScrollToAppLayoutSwitcherEventResponse alloc];
    -[SBContinuousExposeSwitcherToAppModifier appLayouts](self, "appLayouts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SBScrollToAppLayoutSwitcherEventResponse initWithAppLayout:alignment:animated:](v4, "initWithAppLayout:alignment:animated:", v6, 0, 0);

    SBAppendSwitcherModifierResponse(v7, v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 2, 2);
    SBAppendSwitcherModifierResponse(v9, v8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)appLayoutsForContinuousExposeIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  int v10;
  id v11;
  _QWORD v13[4];
  id v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBContinuousExposeSwitcherToAppModifier;
  -[SBContinuousExposeSwitcherToAppModifier appLayoutsForContinuousExposeIdentifier:](&v15, sel_appLayoutsForContinuousExposeIdentifier_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBContinuousExposeSwitcherToAppModifier appLayoutOnStage](self, "appLayoutOnStage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (self->_direction)
    v8 = 1;
  else
    v8 = v6 == 0;
  if (v8
    || (objc_msgSend(v6, "continuousExposeIdentifier"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = BSEqualStrings(),
        v9,
        !v10))
  {
    v11 = v5;
  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __83__SBContinuousExposeSwitcherToAppModifier_appLayoutsForContinuousExposeIdentifier___block_invoke;
    v13[3] = &unk_1E8E9DF78;
    v14 = v7;
    objc_msgSend(v5, "bs_filter:", v13);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

uint64_t __83__SBContinuousExposeSwitcherToAppModifier_appLayoutsForContinuousExposeIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isOrContainsAppLayout:", v3) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isOrContainsAppLayout:", *(_QWORD *)(a1 + 32)) ^ 1;

  return v4;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  __int128 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  int64_t direction;
  int v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double *v24;
  void *v25;
  id v26;
  double v27;
  double v28;
  double v29;
  double v30;
  objc_super v31;
  _QWORD v32[4];
  id v33;
  SBContinuousExposeSwitcherToAppModifier *v34;
  uint64_t *v35;
  unint64_t v36;
  objc_super v37;
  uint64_t v38;
  double *v39;
  uint64_t v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  CGRect result;

  v38 = 0;
  v39 = (double *)&v38;
  v40 = 0x4010000000;
  v41 = &unk_1D0FA064E;
  v5 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v42 = *MEMORY[0x1E0C9D648];
  v43 = v5;
  -[SBContinuousExposeSwitcherToAppModifier appLayouts](self, "appLayouts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v37.receiver = self;
  v37.super_class = (Class)SBContinuousExposeSwitcherToAppModifier;
  -[SBContinuousExposeSwitcherToAppModifier continuousExposeIdentifiersInStrip](&v37, sel_continuousExposeIdentifiersInStrip);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "continuousExposeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "containsObject:", v9);

  -[SBContinuousExposeSwitcherToAppModifier appLayoutOnStage](self, "appLayoutOnStage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v7, "isOrContainsAppLayout:", v11);

  direction = self->_direction;
  if (-[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase") == 1 && direction == 1)
    v15 = v12;
  else
    v15 = 1;
  if (((v15 | v10) & 1) != 0)
  {
    v31.receiver = self;
    v31.super_class = (Class)SBContinuousExposeSwitcherToAppModifier;
    -[SBContinuousExposeSwitcherToAppModifier frameForIndex:](&v31, sel_frameForIndex_, a3);
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v24 = v39;
    v39[4] = v16;
    v24[5] = v18;
    v24[6] = v20;
    v24[7] = v22;
  }
  else
  {
    -[SBContinuousExposeSwitcherToAppModifier multitaskingModifier](self, "multitaskingModifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __57__SBContinuousExposeSwitcherToAppModifier_frameForIndex___block_invoke;
    v32[3] = &unk_1E8E9FD80;
    v35 = &v38;
    v26 = v25;
    v36 = a3;
    v33 = v26;
    v34 = self;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", v26, v32);

    v17 = v39[4];
    v19 = v39[5];
    v21 = v39[6];
    v23 = v39[7];
  }

  _Block_object_dispose(&v38, 8);
  v27 = v17;
  v28 = v19;
  v29 = v21;
  v30 = v23;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

void __57__SBContinuousExposeSwitcherToAppModifier_frameForIndex___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  double v8;
  double v9;

  objc_msgSend(*(id *)(a1 + 32), "frameForIndex:", *(_QWORD *)(a1 + 56));
  v2 = *(_QWORD **)(*(_QWORD *)(a1 + 48) + 8);
  v2[4] = v3;
  v2[5] = v4;
  v2[6] = v5;
  v2[7] = v6;
  v7 = objc_msgSend(*(id *)(a1 + 40), "isRTLEnabled");
  objc_msgSend(*(id *)(a1 + 32), "distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch:", *(_QWORD *)(a1 + 56));
  if (v7)
    v9 = v8;
  else
    v9 = -v8;
  *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = CGRectOffset(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)+ 32), v9, 0.0);
}

- (id)visibleAppLayouts
{
  void *v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  objc_super v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__72;
  v15 = __Block_byref_object_dispose__72;
  v10.receiver = self;
  v10.super_class = (Class)SBContinuousExposeSwitcherToAppModifier;
  -[SBContinuousExposeSwitcherToAppModifier visibleAppLayouts](&v10, sel_visibleAppLayouts);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[SBContinuousExposeSwitcherToAppModifier multitaskingModifier](self, "multitaskingModifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__SBContinuousExposeSwitcherToAppModifier_visibleAppLayouts__block_invoke;
  v7[3] = &unk_1E8E9DFA0;
  v9 = &v11;
  v4 = v3;
  v8 = v4;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", v4, v7);
  v5 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v5;
}

void __60__SBContinuousExposeSwitcherToAppModifier_visibleAppLayouts__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "visibleAppLayouts");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (CGPoint)contentOffsetForIndex:(unint64_t)a3 alignment:(int64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  unint64_t v18;
  int64_t v19;
  objc_super v20;
  uint64_t v21;
  double *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  CGPoint result;

  v21 = 0;
  v22 = (double *)&v21;
  v23 = 0x3010000000;
  v25 = 0;
  v26 = 0;
  v24 = &unk_1D0FA064E;
  v20.receiver = self;
  v20.super_class = (Class)SBContinuousExposeSwitcherToAppModifier;
  -[SBContinuousExposeSwitcherToAppModifier contentOffsetForIndex:alignment:](&v20, sel_contentOffsetForIndex_alignment_);
  v25 = v7;
  v26 = v8;
  -[SBContinuousExposeSwitcherToAppModifier multitaskingModifier](self, "multitaskingModifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __75__SBContinuousExposeSwitcherToAppModifier_contentOffsetForIndex_alignment___block_invoke;
  v15[3] = &unk_1E8EB2640;
  v18 = a3;
  v19 = a4;
  v15[4] = self;
  v17 = &v21;
  v10 = v9;
  v16 = v10;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", v10, v15);
  v11 = v22[4];
  v12 = v22[5];

  _Block_object_dispose(&v21, 8);
  v13 = v11;
  v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

uint64_t __75__SBContinuousExposeSwitcherToAppModifier_contentOffsetForIndex_alignment___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexOfFirstFloatingAppFromAppLayouts:", v3);

  result = objc_msgSend(*(id *)(a1 + 40), "contentOffsetForIndex:alignment:");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  *(_QWORD *)(v5 + 32) = v6;
  *(_QWORD *)(v5 + 40) = v7;
  return result;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBContinuousExposeSwitcherToAppModifier;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v8, sel_animationAttributesForLayoutElement_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "setLayoutUpdateMode:", 3);
  -[SBContinuousExposeSwitcherToAppModifier _layoutSettings](self, "_layoutSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayoutSettings:", v6);

  return v5;
}

- (id)_layoutSettings
{
  void *v2;
  void *v3;
  void *v4;

  -[SBContinuousExposeSwitcherToAppModifier switcherSettings](self, "switcherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "animationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)direction
{
  return self->_direction;
}

- (SBSwitcherModifier)multitaskingModifier
{
  return self->_multitaskingModifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multitaskingModifier, 0);
}

@end
