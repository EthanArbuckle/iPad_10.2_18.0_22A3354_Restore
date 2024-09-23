@implementation SBMixedGridToHomeSwitcherModifier

- (SBMixedGridToHomeSwitcherModifier)initWithTransitionID:(id)a3 direction:(int64_t)a4 mixedGridModifier:(id)a5
{
  id v9;
  id v10;
  SBMixedGridToHomeSwitcherModifier *v11;
  SBRouteToMixedGridSwitcherModifier *v12;
  id v13;
  SBRouteToMixedGridSwitcherModifier *v14;
  SBHomeToGridSwitcherModifier *v15;
  id v16;
  SBHomeToGridSwitcherModifier *v17;
  void *v19;
  objc_super v20;

  v9 = a3;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SBMixedGridToHomeSwitcherModifier;
  v11 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v20, sel_initWithTransitionID_, v9);
  if (v11)
  {
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("SBMixedGridToHomeSwitcherModifier.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mixedGridModifier"));

    }
    v11->_direction = a4;
    objc_storeStrong((id *)&v11->_mixedGridModifier, a5);
    v12 = [SBRouteToMixedGridSwitcherModifier alloc];
    v13 = -[SBMixedGridToHomeSwitcherModifier _newMixedGridModifier](v11, "_newMixedGridModifier");
    v14 = -[SBRouteToMixedGridSwitcherModifier initWithTransitionID:mixedGridModifier:](v12, "initWithTransitionID:mixedGridModifier:", v9, v13);

    -[SBChainableModifier addChildModifier:atLevel:key:](v11, "addChildModifier:atLevel:key:", v14, 0, 0);
    v15 = [SBHomeToGridSwitcherModifier alloc];
    v16 = -[SBMixedGridToHomeSwitcherModifier _newMixedGridModifier](v11, "_newMixedGridModifier");
    v17 = -[SBHomeToSwitcherSwitcherModifier initWithTransitionID:direction:multitaskingModifier:](v15, "initWithTransitionID:direction:multitaskingModifier:", v9, a4 != 0, v16);

    -[SBChainableModifier addChildModifier:atLevel:key:](v11, "addChildModifier:atLevel:key:", v17, 1, 0);
  }

  return v11;
}

- (id)transitionWillBegin
{
  void *v3;
  SBInvalidateAdjustedAppLayoutsSwitcherEventResponse *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  SBScrollToAppLayoutSwitcherEventResponse *v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)SBMixedGridToHomeSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v23, sel_transitionWillBegin);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_direction == 1)
  {
    -[SBMixedGridToHomeSwitcherModifier appLayouts](self, "appLayouts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTransitionSwitcherModifier adjustedAppLayoutsForAppLayouts:](self, "adjustedAppLayoutsForAppLayouts:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "firstObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      while (2)
      {
        v13 = 0;
        v14 = v8;
        do
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v13);
          if (objc_msgSend(v15, "environment", (_QWORD)v19) == 1)
          {
            v8 = v14;
            goto LABEL_12;
          }
          v8 = v15;

          ++v13;
          v14 = v8;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_12:

    if (v8)
    {
      v16 = -[SBScrollToAppLayoutSwitcherEventResponse initWithAppLayout:alignment:animated:]([SBScrollToAppLayoutSwitcherEventResponse alloc], "initWithAppLayout:alignment:animated:", v8, 0, 0);
      +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v16, v5);
      v17 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v17;
    }

  }
  return v5;
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
  v9[2] = __69__SBMixedGridToHomeSwitcherModifier_contentOffsetForIndex_alignment___block_invoke;
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

uint64_t __69__SBMixedGridToHomeSwitcherModifier_contentOffsetForIndex_alignment___block_invoke(uint64_t a1)
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
  int v9;
  double v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SBMixedGridSwitcherProviding *v16;
  CGRect *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  SBMixedGridSwitcherProviding *v27;
  objc_super v28;
  _QWORD v29[8];
  _QWORD v30[7];
  _QWORD v31[8];
  uint64_t v32;
  double *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  CGRect v42;
  CGRect result;

  v36 = 0;
  v37 = &v36;
  v38 = 0x4010000000;
  v39 = &unk_1D0FA064E;
  v5 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v40 = *MEMORY[0x1E0C9D648];
  v41 = v5;
  -[SBMixedGridToHomeSwitcherModifier appLayouts](self, "appLayouts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBSwitcherModifier indexOfFirstMainAppLayoutFromAppLayouts:](self, "indexOfFirstMainAppLayoutFromAppLayouts:", v6);

  if (v7 <= a3)
  {
    v28.receiver = self;
    v28.super_class = (Class)SBMixedGridToHomeSwitcherModifier;
    -[SBMixedGridToHomeSwitcherModifier frameForIndex:](&v28, sel_frameForIndex_, a3);
    v11 = v37;
    v37[4] = v12;
    v11[5] = v13;
    v11[6] = v14;
    v11[7] = v15;
  }
  else
  {
    if (self->_direction)
    {
      v32 = 0;
      v33 = (double *)&v32;
      v34 = 0x2020000000;
      mixedGridModifier = self->_mixedGridModifier;
      v35 = 0;
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __51__SBMixedGridToHomeSwitcherModifier_frameForIndex___block_invoke_3;
      v29[3] = &unk_1E8EABA88;
      v29[4] = self;
      v29[5] = &v36;
      v29[6] = &v32;
      v29[7] = a3;
      -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", mixedGridModifier, v29);
      v9 = -[SBMixedGridToHomeSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
      v10 = v33[3];
      if (v9)
        v10 = -v10;
      *((double *)v37 + 4) = *((double *)v37 + 4) + v10;
    }
    else
    {
      if (-[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase") != 2)
      {
        v27 = self->_mixedGridModifier;
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __51__SBMixedGridToHomeSwitcherModifier_frameForIndex___block_invoke_2;
        v30[3] = &unk_1E8E9FD08;
        v30[4] = self;
        v30[5] = &v36;
        v30[6] = a3;
        -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", v27, v30);
        goto LABEL_13;
      }
      v32 = 0;
      v33 = (double *)&v32;
      v34 = 0x2020000000;
      v16 = self->_mixedGridModifier;
      v35 = 0;
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __51__SBMixedGridToHomeSwitcherModifier_frameForIndex___block_invoke;
      v31[3] = &unk_1E8EABA88;
      v31[4] = self;
      v31[5] = &v36;
      v31[6] = &v32;
      v31[7] = a3;
      -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", v16, v31);
      v17 = (CGRect *)v37;
      if (-[SBMixedGridToHomeSwitcherModifier isRTLEnabled](self, "isRTLEnabled"))
        v18 = -v33[3];
      else
        v18 = v33[3];
      v42 = CGRectOffset(v17[1], v18, 0.0);
      *((CGRect *)v37 + 1) = v42;
    }
    _Block_object_dispose(&v32, 8);
  }
LABEL_13:
  v19 = *((double *)v37 + 4);
  v20 = *((double *)v37 + 5);
  v21 = *((double *)v37 + 6);
  v22 = *((double *)v37 + 7);
  _Block_object_dispose(&v36, 8);
  v23 = v19;
  v24 = v20;
  v25 = v21;
  v26 = v22;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

CGFloat __51__SBMixedGridToHomeSwitcherModifier_frameForIndex___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CGFloat Width;
  uint64_t v10;
  CGFloat result;
  CGRect v12;

  objc_msgSend(*(id *)(a1[4] + 144), "frameForIndex:", a1[7]);
  v2 = *(_QWORD **)(a1[5] + 8);
  v2[4] = v3;
  v2[5] = v4;
  v2[6] = v5;
  v2[7] = v6;
  objc_msgSend(*(id *)(a1[4] + 144), "distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch:", a1[7]);
  v7 = a1[7];
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v8;
  objc_msgSend(*(id *)(a1[4] + 144), "scaledFrameForIndex:", v7);
  Width = CGRectGetWidth(v12);
  v10 = *(_QWORD *)(a1[6] + 8);
  result = Width + *(double *)(v10 + 24);
  *(CGFloat *)(v10 + 24) = result;
  return result;
}

uint64_t __51__SBMixedGridToHomeSwitcherModifier_frameForIndex___block_invoke_2(_QWORD *a1)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(*(id *)(a1[4] + 144), "frameForIndex:", a1[6]);
  v3 = *(_QWORD **)(a1[5] + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

uint64_t __51__SBMixedGridToHomeSwitcherModifier_frameForIndex___block_invoke_3(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "frameForIndex:", *(_QWORD *)(a1 + 56));
  v2 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v2[4] = v3;
  v2[5] = v4;
  v2[6] = v5;
  v2[7] = v6;
  result = objc_msgSend(*(id *)(a1 + 32), "transitionPhase");
  if (result == 1)
  {
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "firstFloatingCardPeekingWidth");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v8;
  }
  return result;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  id v4;
  SBMixedGridSwitcherProviding *mixedGridModifier;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void *v14;
  __int16 v15;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2810000000;
  v14 = &unk_1D0FA064E;
  v15 = 0;
  mixedGridModifier = self->_mixedGridModifier;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__SBMixedGridToHomeSwitcherModifier_asyncRenderingAttributesForAppLayout___block_invoke;
  v8[3] = &unk_1E8E9FD30;
  v10 = &v11;
  v8[4] = self;
  v6 = v4;
  v9 = v6;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", mixedGridModifier, v8);
  LOWORD(self) = *((_WORD *)v12 + 16);

  _Block_object_dispose(&v11, 8);
  return (SBSwitcherAsyncRenderingAttributes)self;
}

uint64_t __74__SBMixedGridToHomeSwitcherModifier_asyncRenderingAttributesForAppLayout___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 144), "asyncRenderingAttributesForAppLayout:", a1[5]);
  *(_WORD *)(*(_QWORD *)(a1[6] + 8) + 32) = result;
  return result;
}

- (id)topMostLayoutElements
{
  SBMixedGridSwitcherProviding *mixedGridModifier;
  uint64_t v3;
  void *v4;
  id v5;
  objc_super v7;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__41;
  v13 = __Block_byref_object_dispose__41;
  v14 = 0;
  if (self->_direction == 1)
  {
    mixedGridModifier = self->_mixedGridModifier;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __58__SBMixedGridToHomeSwitcherModifier_topMostLayoutElements__block_invoke;
    v8[3] = &unk_1E8E9DFA0;
    v8[4] = self;
    v8[5] = &v9;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", mixedGridModifier, v8);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBMixedGridToHomeSwitcherModifier;
    -[SBMixedGridToHomeSwitcherModifier topMostLayoutElements](&v7, sel_topMostLayoutElements);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v10[5];
    v10[5] = v3;

  }
  v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __58__SBMixedGridToHomeSwitcherModifier_topMostLayoutElements__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "topMostLayoutElements");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_newMixedGridModifier
{
  return (id)-[SBMixedGridSwitcherProviding copy](self->_mixedGridModifier, "copy");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mixedGridModifier, 0);
}

@end
