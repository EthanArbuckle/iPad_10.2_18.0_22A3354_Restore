@implementation SBHomeToGridSwitcherModifier

- (id)appLayoutToScrollToDuringTransition
{
  void *v3;
  void *v4;

  -[SBHomeToGridSwitcherModifier appLayouts](self, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBHomeToSwitcherSwitcherModifier direction](self, "direction") == 1)
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  __int128 v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _QWORD v16[4];
  id v17;
  SBHomeToGridSwitcherModifier *v18;
  uint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  double *v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  CGRect result;

  v21 = 0;
  v22 = (double *)&v21;
  v23 = 0x4010000000;
  v24 = &unk_1D0FA064E;
  v5 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v25 = *MEMORY[0x1E0C9D648];
  v26 = v5;
  -[SBHomeToSwitcherSwitcherModifier multitaskingModifier](self, "multitaskingModifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __46__SBHomeToGridSwitcherModifier_frameForIndex___block_invoke;
  v16[3] = &unk_1E8E9FD80;
  v19 = &v21;
  v7 = v6;
  v20 = a3;
  v17 = v7;
  v18 = self;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", v7, v16);
  v8 = v22[4];
  v9 = v22[5];
  v10 = v22[6];
  v11 = v22[7];

  _Block_object_dispose(&v21, 8);
  v12 = v8;
  v13 = v9;
  v14 = v10;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

void __46__SBHomeToGridSwitcherModifier_frameForIndex___block_invoke(uint64_t a1)
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
  if (objc_msgSend(*(id *)(a1 + 40), "isEffectivelyHome"))
  {
    v7 = objc_msgSend(*(id *)(a1 + 40), "isRTLEnabled");
    objc_msgSend(*(id *)(a1 + 32), "distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch:", *(_QWORD *)(a1 + 56));
    if (v7)
      v9 = v8;
    else
      v9 = -v8;
    *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = CGRectOffset(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)+ 32), v9, 0.0);
  }
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  __int128 v12;
  void *v13;
  id v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint64_t *v27;
  int64_t v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  uint64_t v33;
  double *v34;
  uint64_t v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4;
  v33 = 0;
  v34 = (double *)&v33;
  v35 = 0x4010000000;
  v36 = &unk_1D0FA064E;
  v12 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v37 = *MEMORY[0x1E0C9D648];
  v38 = v12;
  -[SBHomeToSwitcherSwitcherModifier multitaskingModifier](self, "multitaskingModifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __74__SBHomeToGridSwitcherModifier_frameForLayoutRole_inAppLayout_withBounds___block_invoke;
  v24[3] = &unk_1E8E9FD58;
  v27 = &v33;
  v14 = v13;
  v25 = v14;
  v28 = a3;
  v15 = v11;
  v26 = v15;
  v29 = x;
  v30 = y;
  v31 = width;
  v32 = height;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", v14, v24);
  v16 = v34[4];
  v17 = v34[5];
  v18 = v34[6];
  v19 = v34[7];

  _Block_object_dispose(&v33, 8);
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

uint64_t __74__SBHomeToGridSwitcherModifier_frameForLayoutRole_inAppLayout_withBounds___block_invoke(uint64_t a1)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(*(id *)(a1 + 32), "frameForLayoutRole:inAppLayout:withBounds:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  v3 = *(_QWORD **)(*(_QWORD *)(a1 + 48) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  void *v5;
  id v6;
  double v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  double *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = (double *)&v13;
  v15 = 0x2020000000;
  v16 = 0;
  -[SBHomeToSwitcherSwitcherModifier multitaskingModifier](self, "multitaskingModifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__SBHomeToGridSwitcherModifier_scaleForIndex___block_invoke;
  v9[3] = &unk_1E8E9FD08;
  v11 = &v13;
  v6 = v5;
  v10 = v6;
  v12 = a3;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", v6, v9);
  v7 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v7;
}

uint64_t __46__SBHomeToGridSwitcherModifier_scaleForIndex___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "scaleForIndex:", *(_QWORD *)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (double)scaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  double v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  int64_t v16;
  uint64_t v17;
  double *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a4;
  v17 = 0;
  v18 = (double *)&v17;
  v19 = 0x2020000000;
  v20 = 0x3FF0000000000000;
  -[SBHomeToSwitcherSwitcherModifier multitaskingModifier](self, "multitaskingModifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__SBHomeToGridSwitcherModifier_scaleForLayoutRole_inAppLayout___block_invoke;
  v12[3] = &unk_1E8E9FD80;
  v15 = &v17;
  v8 = v7;
  v13 = v8;
  v16 = a3;
  v9 = v6;
  v14 = v9;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", v8, v12);
  v10 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v10;
}

uint64_t __63__SBHomeToGridSwitcherModifier_scaleForLayoutRole_inAppLayout___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "scaleForLayoutRole:inAppLayout:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;
  return result;
}

- (id)visibleAppLayouts
{
  void *v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__5;
  v14 = __Block_byref_object_dispose__5;
  v15 = 0;
  -[SBHomeToSwitcherSwitcherModifier multitaskingModifier](self, "multitaskingModifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__SBHomeToGridSwitcherModifier_visibleAppLayouts__block_invoke;
  v7[3] = &unk_1E8E9DFA0;
  v9 = &v10;
  v4 = v3;
  v8 = v4;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", v4, v7);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __49__SBHomeToGridSwitcherModifier_visibleAppLayouts__block_invoke(uint64_t a1)
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

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  -[SBHomeToGridSwitcherModifier switcherSettings](self, "switcherSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "animationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBHomeToSwitcherSwitcherModifier direction](self, "direction"))
    objc_msgSend(v6, "toggleAppSwitcherSettings");
  else
    objc_msgSend(v6, "switcherToHomeSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)SBHomeToGridSwitcherModifier;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v12, sel_animationAttributesForLayoutElement_, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v9, "setLayoutSettings:", v7);
  objc_msgSend(v6, "switcherToHomeOpacitySettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setOpacitySettings:", v10);

  return v9;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  void *v9;
  double v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  double *v20;
  uint64_t v21;
  uint64_t v22;

  v8 = a4;
  -[SBHomeToGridSwitcherModifier visibleAppLayouts](self, "visibleAppLayouts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0.0;
  if (objc_msgSend(v9, "containsObject:", v8))
  {
    v19 = 0;
    v20 = (double *)&v19;
    v21 = 0x2020000000;
    v22 = 0;
    -[SBHomeToSwitcherSwitcherModifier multitaskingModifier](self, "multitaskingModifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __73__SBHomeToGridSwitcherModifier_opacityForLayoutRole_inAppLayout_atIndex___block_invoke;
    v14[3] = &unk_1E8EA2580;
    v12 = v11;
    v15 = v12;
    v16 = &v19;
    v17 = a5;
    v18 = a3;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", v12, v14);
    v10 = v20[3];

    _Block_object_dispose(&v19, 8);
  }

  return v10;
}

void __73__SBHomeToGridSwitcherModifier_opacityForLayoutRole_inAppLayout_atIndex___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "appLayouts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndex:", *(_QWORD *)(a1 + 48));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "opacityForLayoutRole:inAppLayout:atIndex:", *(_QWORD *)(a1 + 56), v4, *(_QWORD *)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;

}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  __int128 v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  unint64_t v19;
  uint64_t v20;
  double *v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  UIRectCornerRadii result;

  v20 = 0;
  v21 = (double *)&v20;
  v22 = 0x4010000000;
  v23 = &unk_1D0FA064E;
  v5 = *(_OWORD *)(MEMORY[0x1E0CEBAC0] + 16);
  v24 = *MEMORY[0x1E0CEBAC0];
  v25 = v5;
  -[SBHomeToSwitcherSwitcherModifier multitaskingModifier](self, "multitaskingModifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __52__SBHomeToGridSwitcherModifier_cornerRadiiForIndex___block_invoke;
  v16[3] = &unk_1E8E9FD08;
  v18 = &v20;
  v7 = v6;
  v17 = v7;
  v19 = a3;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", v7, v16);
  v8 = v21[4];
  v9 = v21[5];
  v10 = v21[6];
  v11 = v21[7];

  _Block_object_dispose(&v20, 8);
  v12 = v8;
  v13 = v9;
  v14 = v10;
  v15 = v11;
  result.topRight = v15;
  result.bottomRight = v14;
  result.bottomLeft = v13;
  result.topLeft = v12;
  return result;
}

uint64_t __52__SBHomeToGridSwitcherModifier_cornerRadiiForIndex___block_invoke(uint64_t a1)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(*(id *)(a1 + 32), "cornerRadiiForIndex:", *(_QWORD *)(a1 + 48));
  v3 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (int64_t)headerStyleForIndex:(unint64_t)a3
{
  return 0;
}

- (double)titleAndIconOpacityForIndex:(unint64_t)a3
{
  void *v5;
  id v6;
  double v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  double *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = (double *)&v13;
  v15 = 0x2020000000;
  v16 = 0;
  -[SBHomeToSwitcherSwitcherModifier multitaskingModifier](self, "multitaskingModifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__SBHomeToGridSwitcherModifier_titleAndIconOpacityForIndex___block_invoke;
  v9[3] = &unk_1E8E9FD08;
  v11 = &v13;
  v6 = v5;
  v10 = v6;
  v12 = a3;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", v6, v9);
  v7 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v7;
}

uint64_t __60__SBHomeToGridSwitcherModifier_titleAndIconOpacityForIndex___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "titleAndIconOpacityForIndex:", *(_QWORD *)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (double)titleOpacityForIndex:(unint64_t)a3
{
  void *v5;
  id v6;
  double v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  double *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = (double *)&v13;
  v15 = 0x2020000000;
  v16 = 0;
  -[SBHomeToSwitcherSwitcherModifier multitaskingModifier](self, "multitaskingModifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__SBHomeToGridSwitcherModifier_titleOpacityForIndex___block_invoke;
  v9[3] = &unk_1E8E9FD08;
  v11 = &v13;
  v6 = v5;
  v10 = v6;
  v12 = a3;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", v6, v9);
  v7 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v7;
}

uint64_t __53__SBHomeToGridSwitcherModifier_titleOpacityForIndex___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "titleOpacityForIndex:", *(_QWORD *)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  void *v7;
  id v8;
  double v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  int64_t v14;
  unint64_t v15;
  uint64_t v16;
  double *v17;
  uint64_t v18;
  uint64_t v19;

  v16 = 0;
  v17 = (double *)&v16;
  v18 = 0x2020000000;
  v19 = 0;
  -[SBHomeToSwitcherSwitcherModifier multitaskingModifier](self, "multitaskingModifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__SBHomeToGridSwitcherModifier_shadowOpacityForLayoutRole_atIndex___block_invoke;
  v11[3] = &unk_1E8E9FDD0;
  v13 = &v16;
  v8 = v7;
  v12 = v8;
  v14 = a3;
  v15 = a4;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", v8, v11);
  v9 = v17[3];

  _Block_object_dispose(&v16, 8);
  return v9;
}

uint64_t __67__SBHomeToGridSwitcherModifier_shadowOpacityForLayoutRole_atIndex___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "shadowOpacityForLayoutRole:atIndex:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (int64_t)homeScreenBackdropBlurType
{
  return 3;
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

- (BOOL)isSwitcherWindowUserInteractionEnabled
{
  return -[SBHomeToSwitcherSwitcherModifier direction](self, "direction") != 0;
}

- (id)appLayoutsToCacheSnapshots
{
  void *v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__5;
  v14 = __Block_byref_object_dispose__5;
  v15 = 0;
  -[SBHomeToSwitcherSwitcherModifier multitaskingModifier](self, "multitaskingModifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__SBHomeToGridSwitcherModifier_appLayoutsToCacheSnapshots__block_invoke;
  v7[3] = &unk_1E8E9DFA0;
  v9 = &v10;
  v4 = v3;
  v8 = v4;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", v4, v7);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __58__SBHomeToGridSwitcherModifier_appLayoutsToCacheSnapshots__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "appLayoutsToCacheSnapshots");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)topMostLayoutElements
{
  return (id)MEMORY[0x1E0C9AA60];
}

@end
