@implementation SBHomeGestureToMixedGridSwitcherSwitcherModifier

- (SBHomeGestureToMixedGridSwitcherSwitcherModifier)initWithTransitionID:(id)a3 mixedGridModifier:(id)a4 selectedAppLayout:(id)a5 startingEnvironmentMode:(int64_t)a6 liftOfVelocity:(CGPoint)a7 liftOffTranslation:(CGPoint)a8 floatingAppLayout:(id)a9 floatingConfiguration:(int64_t)a10
{
  double y;
  double x;
  double v14;
  double v15;
  id v20;
  id v21;
  id v22;
  id v23;
  SBHomeGestureToMixedGridSwitcherSwitcherModifier *v24;
  SBHomeGestureToMixedGridSwitcherSwitcherModifier *v25;
  SBHomeGestureToSwitcherSwitcherModifier *v26;
  SBHomeGestureToSwitcherSwitcherModifier *homeGestureModifier;
  SBRouteToMixedGridSwitcherModifier *v28;
  id v29;
  SBRouteToMixedGridSwitcherModifier *v30;
  SBRelocateFloatingAppLayoutSwitcherModifier *v31;
  objc_super v33;

  y = a8.y;
  x = a8.x;
  v14 = a7.y;
  v15 = a7.x;
  v20 = a3;
  v21 = a4;
  v22 = a5;
  v23 = a9;
  v33.receiver = self;
  v33.super_class = (Class)SBHomeGestureToMixedGridSwitcherSwitcherModifier;
  v24 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v33, sel_initWithTransitionID_, v20);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_mixedGridModifier, a4);
    objc_storeStrong((id *)&v25->_appLayout, a5);
    v25->_startingEnvironmentMode = a6;
    v25->_liftOffVelocity.x = v15;
    v25->_liftOffVelocity.y = v14;
    v25->_liftOffTranslation.x = x;
    v25->_liftOffTranslation.y = y;
    v25->_hidEventSenderID = 0;
    v26 = -[SBHomeGestureToSwitcherSwitcherModifier initWithTransitionID:multitaskingModifier:selectedAppLayout:startingEnvironmentMode:liftOffVelocity:liftOffTranslation:adjustAppLayoutsBeforeTransition:keepSelectedAppLayoutAsTopMostElement:]([SBHomeGestureToSwitcherSwitcherModifier alloc], "initWithTransitionID:multitaskingModifier:selectedAppLayout:startingEnvironmentMode:liftOffVelocity:liftOffTranslation:adjustAppLayoutsBeforeTransition:keepSelectedAppLayoutAsTopMostElement:", v20, v21, v22, a6, 1, 0, v15, v14, x, y);
    homeGestureModifier = v25->_homeGestureModifier;
    v25->_homeGestureModifier = v26;

    -[SBChainableModifier addChildModifier:](v25, "addChildModifier:", v25->_homeGestureModifier);
    v28 = [SBRouteToMixedGridSwitcherModifier alloc];
    v29 = -[SBHomeGestureToMixedGridSwitcherSwitcherModifier _newMixedGridModifier](v25, "_newMixedGridModifier");
    v30 = -[SBRouteToMixedGridSwitcherModifier initWithTransitionID:mixedGridModifier:](v28, "initWithTransitionID:mixedGridModifier:", v20, v29);

    -[SBChainableModifier addChildModifier:](v25, "addChildModifier:", v30);
    if (v23)
    {
      v31 = -[SBRelocateFloatingAppLayoutSwitcherModifier initWithTransitionID:floatingAppLayout:floatingConfiguration:direction:mixedGridModifier:]([SBRelocateFloatingAppLayoutSwitcherModifier alloc], "initWithTransitionID:floatingAppLayout:floatingConfiguration:direction:mixedGridModifier:", v20, v23, a10, 1, v21);
      -[SBChainableModifier addChildModifier:](v25, "addChildModifier:", v31);

    }
  }

  return v25;
}

- (void)setHidEventSenderID:(unint64_t)a3
{
  self->_hidEventSenderID = a3;
  -[SBHomeGestureToSwitcherSwitcherModifier setHidEventSenderID:](self->_homeGestureModifier, "setHidEventSenderID:");
}

- (id)responseForProposedChildResponse:(id)a3 childModifier:(id)a4 event:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBHomeGestureToMixedGridSwitcherSwitcherModifier;
  -[SBChainableModifier responseForProposedChildResponse:childModifier:event:](&v11, sel_responseForProposedChildResponse_childModifier_event_, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    return 0;
  v7 = v6;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __105__SBHomeGestureToMixedGridSwitcherSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke;
  v10[3] = &unk_1E8EABCC0;
  v10[4] = self;
  objc_msgSend(v6, "responseByTransformingResponseWithTransformer:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __105__SBHomeGestureToMixedGridSwitcherSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  SBScrollToAppLayoutSwitcherEventResponse *v5;
  uint64_t v6;

  v3 = a2;
  if (objc_msgSend(v3, "type") == 11)
  {
    objc_msgSend(*(id *)(a1 + 32), "_appLayoutToScrollTo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = -[SBScrollToAppLayoutSwitcherEventResponse initWithAppLayout:alignment:animated:]([SBScrollToAppLayoutSwitcherEventResponse alloc], "initWithAppLayout:alignment:animated:", v4, 0, 0);
      SBAppendSwitcherModifierResponse(v5, v3);
      v6 = objc_claimAutoreleasedReturnValue();

      v3 = v5;
    }
    else
    {
      v6 = 0;
    }

    v3 = (id)v6;
  }
  return v3;
}

- (CGPoint)contentOffsetForIndex:(unint64_t)a3 alignment:(int64_t)a4
{
  SBMixedGridSwitcherProviding *mixedGridModifier;
  double v5;
  double v6;
  double v7;
  double v8;
  _QWORD v9[8];
  uint64_t v10;
  double *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  CGPoint result;

  v10 = 0;
  v11 = (double *)&v10;
  v12 = 0x3010000000;
  v13 = &unk_1D0FA064E;
  v14 = *MEMORY[0x1E0C9D538];
  mixedGridModifier = self->_mixedGridModifier;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __84__SBHomeGestureToMixedGridSwitcherSwitcherModifier_contentOffsetForIndex_alignment___block_invoke;
  v9[3] = &unk_1E8EA2580;
  v9[6] = a3;
  v9[7] = a4;
  v9[4] = self;
  v9[5] = &v10;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", mixedGridModifier, v9);
  v5 = v11[4];
  v6 = v11[5];
  _Block_object_dispose(&v10, 8);
  v7 = v5;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

uint64_t __84__SBHomeGestureToMixedGridSwitcherSwitcherModifier_contentOffsetForIndex_alignment___block_invoke(uint64_t a1)
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

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "contentOffsetForIndex:alignment:");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v5 + 32) = v6;
  *(_QWORD *)(v5 + 40) = v7;
  return result;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  __int128 v5;
  void *v6;
  unint64_t v7;
  SBMixedGridSwitcherProviding *mixedGridModifier;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  objc_super v24;
  _QWORD v25[8];
  uint64_t v26;
  double *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double *v31;
  uint64_t v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  CGRect result;

  v30 = 0;
  v31 = (double *)&v30;
  v32 = 0x4010000000;
  v33 = &unk_1D0FA064E;
  v5 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v34 = *MEMORY[0x1E0C9D648];
  v35 = v5;
  -[SBHomeGestureToMixedGridSwitcherSwitcherModifier appLayouts](self, "appLayouts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBSwitcherModifier indexOfFirstMainAppLayoutFromAppLayouts:](self, "indexOfFirstMainAppLayoutFromAppLayouts:", v6);

  if (-[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase") == 1 && v7 > a3)
  {
    v26 = 0;
    v27 = (double *)&v26;
    v28 = 0x2020000000;
    mixedGridModifier = self->_mixedGridModifier;
    v29 = 0;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __66__SBHomeGestureToMixedGridSwitcherSwitcherModifier_frameForIndex___block_invoke;
    v25[3] = &unk_1E8EABA88;
    v25[4] = self;
    v25[5] = &v30;
    v25[6] = &v26;
    v25[7] = a3;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", mixedGridModifier, v25);
    v9 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
    v10 = v27[3];
    if (v9 == 1)
      v10 = -v10;
    v31[4] = v31[4] + v10;
    _Block_object_dispose(&v26, 8);
    v11 = v31[4];
    v12 = v31[5];
    v13 = v31[6];
    v14 = v31[7];
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)SBHomeGestureToMixedGridSwitcherSwitcherModifier;
    -[SBHomeGestureToMixedGridSwitcherSwitcherModifier frameForIndex:](&v24, sel_frameForIndex_, a3);
    v11 = v15;
    v12 = v16;
    v13 = v17;
    v14 = v18;
    v19 = v31;
    v31[4] = v15;
    v19[5] = v16;
    v19[6] = v17;
    v19[7] = v18;
  }
  _Block_object_dispose(&v30, 8);
  v20 = v11;
  v21 = v12;
  v22 = v13;
  v23 = v14;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

uint64_t __66__SBHomeGestureToMixedGridSwitcherSwitcherModifier_frameForIndex___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;

  objc_msgSend(*(id *)(a1[4] + 144), "frameForIndex:", a1[7]);
  v2 = *(_QWORD **)(a1[5] + 8);
  v2[4] = v3;
  v2[5] = v4;
  v2[6] = v5;
  v2[7] = v6;
  result = objc_msgSend(*(id *)(a1[4] + 144), "firstFloatingCardPeekingWidth");
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v8;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  SBMixedGridSwitcherProviding *mixedGridModifier;
  double v8;
  double v9;
  objc_super v11;
  _QWORD v12[7];
  uint64_t v13;
  double *v14;
  uint64_t v15;
  uint64_t v16;

  -[SBHomeGestureToMixedGridSwitcherSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "environment") == 2)
  {
    v13 = 0;
    v14 = (double *)&v13;
    v15 = 0x2020000000;
    v16 = 0;
    mixedGridModifier = self->_mixedGridModifier;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __66__SBHomeGestureToMixedGridSwitcherSwitcherModifier_scaleForIndex___block_invoke;
    v12[3] = &unk_1E8E9FD08;
    v12[4] = self;
    v12[5] = &v13;
    v12[6] = a3;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", mixedGridModifier, v12);
    v8 = v14[3];
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBHomeGestureToMixedGridSwitcherSwitcherModifier;
    -[SBHomeGestureToMixedGridSwitcherSwitcherModifier scaleForIndex:](&v11, sel_scaleForIndex_, a3);
    v8 = v9;
  }

  return v8;
}

uint64_t __66__SBHomeGestureToMixedGridSwitcherSwitcherModifier_scaleForIndex___block_invoke(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1[4] + 144), "scaleForIndex:", a1[6]);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v3;
  return result;
}

- (id)visibleAppLayouts
{
  SBMixedGridSwitcherProviding *mixedGridModifier;
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
    v11 = __Block_byref_object_copy__43;
    v12 = __Block_byref_object_dispose__43;
    v13 = 0;
    mixedGridModifier = self->_mixedGridModifier;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __69__SBHomeGestureToMixedGridSwitcherSwitcherModifier_visibleAppLayouts__block_invoke;
    v7[3] = &unk_1E8E9DFA0;
    v7[4] = self;
    v7[5] = &v8;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", mixedGridModifier, v7);
    v4 = (id)v9[5];
    _Block_object_dispose(&v8, 8);

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBHomeGestureToMixedGridSwitcherSwitcherModifier;
    -[SBHomeGestureToMixedGridSwitcherSwitcherModifier visibleAppLayouts](&v6, sel_visibleAppLayouts);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

void __69__SBHomeGestureToMixedGridSwitcherSwitcherModifier_visibleAppLayouts__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "visibleAppLayouts");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_dismissForEmptySwitcherResponseName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DismissForEmptySwitcher-%p"), self);
}

- (id)_appLayoutToScrollTo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  SBAppLayout *v7;
  SBAppLayout *v8;
  SBMixedGridSwitcherProviding *mixedGridModifier;
  SBAppLayout *appLayout;
  SBAppLayout *v11;
  SBAppLayout *v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  -[SBHomeGestureToMixedGridSwitcherSwitcherModifier appLayouts](self, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTransitionSwitcherModifier adjustedAppLayoutsForAppLayouts:](self, "adjustedAppLayoutsForAppLayouts:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeGestureToMixedGridSwitcherSwitcherModifier _firstFloatingAppLayout:](self, "_firstFloatingAppLayout:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(v4, "firstObject");
    v7 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  if (self->_appLayout)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    mixedGridModifier = self->_mixedGridModifier;
    v20 = 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __72__SBHomeGestureToMixedGridSwitcherSwitcherModifier__appLayoutToScrollTo__block_invoke;
    v14[3] = &unk_1E8EA4CE8;
    v14[4] = self;
    v15 = v4;
    v16 = &v17;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", mixedGridModifier, v14);
    appLayout = v8;
    if (!*((_BYTE *)v18 + 24))
      appLayout = self->_appLayout;
    v11 = appLayout;

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    v11 = v7;
  }
  v12 = v11;

  return v12;
}

void __72__SBHomeGestureToMixedGridSwitcherSwitcherModifier__appLayoutToScrollTo__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  uint64_t v8;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__SBHomeGestureToMixedGridSwitcherSwitcherModifier__appLayoutToScrollTo__block_invoke_2;
  v5[3] = &unk_1E8EA4CE8;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "_performBlockWhileSimulatingPostPresentationScrollViewContentOffset:", v5);

}

uint64_t __72__SBHomeGestureToMixedGridSwitcherSwitcherModifier__appLayoutToScrollTo__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 144), "isIndexFullyVisible:", objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 136)));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (id)_firstFloatingAppLayout:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      v8 = 0;
      v9 = v6;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        if (objc_msgSend(v10, "environment", (_QWORD)v12) == 1)
        {
          v6 = v9;
          goto LABEL_12;
        }
        v6 = v10;

        ++v8;
        v9 = v6;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v6 = 0;
  }
LABEL_12:

  return v6;
}

- (void)_performBlockWhileSimulatingPostPresentationScrollViewContentOffset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  SBOverrideScrollViewContentOffsetSwitcherModifier *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  -[SBHomeGestureToMixedGridSwitcherSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTransitionSwitcherModifier adjustedAppLayoutsForAppLayouts:](self, "adjustedAppLayoutsForAppLayouts:", v5);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[SBHomeGestureToMixedGridSwitcherSwitcherModifier _firstFloatingAppLayout:](self, "_firstFloatingAppLayout:", v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(v14, "firstObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  -[SBHomeGestureToMixedGridSwitcherSwitcherModifier contentOffsetForIndex:alignment:](self, "contentOffsetForIndex:alignment:", objc_msgSend(v14, "indexOfObject:", v8, v14), 3);
  v12 = -[SBOverrideScrollViewContentOffsetSwitcherModifier initWithScrollViewContentOffset:]([SBOverrideScrollViewContentOffsetSwitcherModifier alloc], "initWithScrollViewContentOffset:", v10, v11);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __120__SBHomeGestureToMixedGridSwitcherSwitcherModifier__performBlockWhileSimulatingPostPresentationScrollViewContentOffset___block_invoke;
  v16[3] = &unk_1E8E9E8D0;
  v17 = v4;
  v13 = v4;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", v12, v16);

}

uint64_t __120__SBHomeGestureToMixedGridSwitcherSwitcherModifier__performBlockWhileSimulatingPostPresentationScrollViewContentOffset___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_newMixedGridModifier
{
  return (id)-[SBMixedGridSwitcherProviding copy](self->_mixedGridModifier, "copy");
}

- (unint64_t)hidEventSenderID
{
  return self->_hidEventSenderID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeGestureModifier, 0);
  objc_storeStrong((id *)&self->_mixedGridModifier, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end
