@implementation SBHomeToDeckSwitcherModifier

- (id)appLayoutToScrollToDuringTransition
{
  void *v3;
  void *v4;

  if (-[SBHomeToSwitcherSwitcherModifier direction](self, "direction") == 1)
  {
    -[SBHomeToDeckSwitcherModifier appLayouts](self, "appLayouts");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
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
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _QWORD v15[4];
  id v16;
  SBHomeToDeckSwitcherModifier *v17;
  uint64_t *v18;
  unint64_t v19;
  uint64_t v20;
  double *v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  CGRect result;

  v20 = 0;
  v21 = (double *)&v20;
  v22 = 0x4010000000;
  v23 = &unk_1D0FA064E;
  v24 = 0u;
  v25 = 0u;
  -[SBHomeToSwitcherSwitcherModifier multitaskingModifier](self, "multitaskingModifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __46__SBHomeToDeckSwitcherModifier_frameForIndex___block_invoke;
  v15[3] = &unk_1E8E9FD80;
  v18 = &v20;
  v6 = v5;
  v19 = a3;
  v16 = v6;
  v17 = self;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", v6, v15);
  v7 = v21[4];
  v8 = v21[5];
  v9 = v21[6];
  v10 = v21[7];

  _Block_object_dispose(&v20, 8);
  v11 = v7;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

void __46__SBHomeToDeckSwitcherModifier_frameForIndex___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CGRect *v7;
  int v8;
  double v9;
  double v10;

  objc_msgSend(*(id *)(a1 + 32), "frameForIndex:", *(_QWORD *)(a1 + 56));
  v2 = *(_QWORD **)(*(_QWORD *)(a1 + 48) + 8);
  v2[4] = v3;
  v2[5] = v4;
  v2[6] = v5;
  v2[7] = v6;
  if (objc_msgSend(*(id *)(a1 + 40), "isEffectivelyHome"))
  {
    v7 = *(CGRect **)(*(_QWORD *)(a1 + 48) + 8);
    v8 = objc_msgSend(*(id *)(a1 + 40), "isRTLEnabled");
    objc_msgSend(*(id *)(a1 + 32), "distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch:", *(_QWORD *)(a1 + 56));
    if (v8)
      v10 = v9;
    else
      v10 = -v9;
    *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = CGRectOffset(v7[1], v10, 0.0);
  }
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
  v9[2] = __46__SBHomeToDeckSwitcherModifier_scaleForIndex___block_invoke;
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

uint64_t __46__SBHomeToDeckSwitcherModifier_scaleForIndex___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "scaleForIndex:", *(_QWORD *)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
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
  v13 = __Block_byref_object_copy__15;
  v14 = __Block_byref_object_dispose__15;
  v15 = 0;
  -[SBHomeToSwitcherSwitcherModifier multitaskingModifier](self, "multitaskingModifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__SBHomeToDeckSwitcherModifier_visibleAppLayouts__block_invoke;
  v7[3] = &unk_1E8E9DFA0;
  v9 = &v10;
  v4 = v3;
  v8 = v4;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", v4, v7);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __49__SBHomeToDeckSwitcherModifier_visibleAppLayouts__block_invoke(uint64_t a1)
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
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBHomeToDeckSwitcherModifier;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v9, sel_animationAttributesForLayoutElement_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[SBHomeToDeckSwitcherModifier _layoutSettings](self, "_layoutSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayoutSettings:", v6);

  -[SBHomeToDeckSwitcherModifier _opacitySettings](self, "_opacitySettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOpacitySettings:", v7);

  return v5;
}

- (id)_layoutSettings
{
  void *v3;
  void *v4;
  void *v5;

  -[SBHomeToDeckSwitcherModifier switcherSettings](self, "switcherSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBHomeToSwitcherSwitcherModifier direction](self, "direction"))
    objc_msgSend(v4, "toggleAppSwitcherSettings");
  else
    objc_msgSend(v4, "switcherToHomeSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_opacitySettings
{
  void *v2;
  void *v3;
  void *v4;

  -[SBHomeToDeckSwitcherModifier switcherSettings](self, "switcherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "animationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "switcherToHomeOpacitySettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
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
  -[SBHomeToDeckSwitcherModifier visibleAppLayouts](self, "visibleAppLayouts");
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
    v14[2] = __73__SBHomeToDeckSwitcherModifier_opacityForLayoutRole_inAppLayout_atIndex___block_invoke;
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

void __73__SBHomeToDeckSwitcherModifier_opacityForLayoutRole_inAppLayout_atIndex___block_invoke(uint64_t a1)
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

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
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
  v20 = 0;
  -[SBHomeToSwitcherSwitcherModifier multitaskingModifier](self, "multitaskingModifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__SBHomeToDeckSwitcherModifier_dimmingAlphaForLayoutRole_inAppLayout___block_invoke;
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

uint64_t __70__SBHomeToDeckSwitcherModifier_dimmingAlphaForLayoutRole_inAppLayout___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "dimmingAlphaForLayoutRole:inAppLayout:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;
  return result;
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
  v16[2] = __52__SBHomeToDeckSwitcherModifier_cornerRadiiForIndex___block_invoke;
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

uint64_t __52__SBHomeToDeckSwitcherModifier_cornerRadiiForIndex___block_invoke(uint64_t a1)
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
  v9[2] = __60__SBHomeToDeckSwitcherModifier_titleAndIconOpacityForIndex___block_invoke;
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

uint64_t __60__SBHomeToDeckSwitcherModifier_titleAndIconOpacityForIndex___block_invoke(uint64_t a1)
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
  v9[2] = __53__SBHomeToDeckSwitcherModifier_titleOpacityForIndex___block_invoke;
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

uint64_t __53__SBHomeToDeckSwitcherModifier_titleOpacityForIndex___block_invoke(uint64_t a1)
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
  v11[2] = __67__SBHomeToDeckSwitcherModifier_shadowOpacityForLayoutRole_atIndex___block_invoke;
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

uint64_t __67__SBHomeToDeckSwitcherModifier_shadowOpacityForLayoutRole_atIndex___block_invoke(uint64_t a1)
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
  v13 = __Block_byref_object_copy__15;
  v14 = __Block_byref_object_dispose__15;
  v15 = 0;
  -[SBHomeToSwitcherSwitcherModifier multitaskingModifier](self, "multitaskingModifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__SBHomeToDeckSwitcherModifier_appLayoutsToCacheSnapshots__block_invoke;
  v7[3] = &unk_1E8E9DFA0;
  v9 = &v10;
  v4 = v3;
  v8 = v4;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", v4, v7);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __58__SBHomeToDeckSwitcherModifier_appLayoutsToCacheSnapshots__block_invoke(uint64_t a1)
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

@end
