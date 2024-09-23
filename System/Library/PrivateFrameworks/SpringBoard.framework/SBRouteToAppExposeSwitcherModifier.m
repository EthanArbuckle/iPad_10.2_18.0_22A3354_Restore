@implementation SBRouteToAppExposeSwitcherModifier

- (SBRouteToAppExposeSwitcherModifier)initWithTransitionID:(id)a3 appExposeModifier:(id)a4
{
  id v7;
  SBRouteToAppExposeSwitcherModifier *v8;
  SBRouteToAppExposeSwitcherModifier *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBRouteToAppExposeSwitcherModifier;
  v8 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v11, sel_initWithTransitionID_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_appExposeModifier, a4);
    v9->_isTransitioningOutOfAppExpose = 0;
  }

  return v9;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "fromAppExposeBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "toAppExposeBundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self->_isTransitioningOutOfAppExpose = v6 == 0;

  }
  else
  {
    self->_isTransitioningOutOfAppExpose = 0;
  }

  v9.receiver = self;
  v9.super_class = (Class)SBRouteToAppExposeSwitcherModifier;
  -[SBTransitionSwitcherModifier handleTransitionEvent:](&v9, sel_handleTransitionEvent_, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setReversesFloatingCardDirection:(BOOL)a3
{
  -[SBAppExposeGridSwitcherModifier setReversesFloatingCardDirection:](self->_appExposeModifier, "setReversesFloatingCardDirection:", a3);
}

- (BOOL)reversesFloatingCardDirection
{
  return -[SBAppExposeGridSwitcherModifier reversesFloatingCardDirection](self->_appExposeModifier, "reversesFloatingCardDirection");
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  id v4;
  void *v5;
  id v6;
  SBAppExposeGridSwitcherModifier *appExposeModifier;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  objc_super v20;

  v4 = a3;
  v5 = v4;
  if (self->_isTransitioningOutOfAppExpose)
  {
    v20.receiver = self;
    v20.super_class = (Class)SBRouteToAppExposeSwitcherModifier;
    -[SBTransitionSwitcherModifier adjustedAppLayoutsForAppLayouts:](&v20, sel_adjustedAppLayoutsForAppLayouts_, v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v4;
  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__117;
  v18 = __Block_byref_object_dispose__117;
  v19 = 0;
  appExposeModifier = self->_appExposeModifier;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__SBRouteToAppExposeSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke;
  v11[3] = &unk_1E8E9FD30;
  v13 = &v14;
  v11[4] = self;
  v8 = v6;
  v12 = v8;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", appExposeModifier, v11);
  v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __70__SBRouteToAppExposeSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 136), "adjustedAppLayoutsForAppLayouts:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)appExposeAccessoryButtonsBundleIdentifier
{
  SBAppExposeGridSwitcherModifier *appExposeModifier;
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
  v9 = __Block_byref_object_copy__117;
  v10 = __Block_byref_object_dispose__117;
  v11 = 0;
  appExposeModifier = self->_appExposeModifier;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __79__SBRouteToAppExposeSwitcherModifier_appExposeAccessoryButtonsBundleIdentifier__block_invoke;
  v5[3] = &unk_1E8E9DFA0;
  v5[4] = self;
  v5[5] = &v6;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", appExposeModifier, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __79__SBRouteToAppExposeSwitcherModifier_appExposeAccessoryButtonsBundleIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "appExposeAccessoryButtonsBundleIdentifier");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (int64_t)appExposeAccessoryButtonsOverrideUserInterfaceStyle
{
  SBAppExposeGridSwitcherModifier *appExposeModifier;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  appExposeModifier = self->_appExposeModifier;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __89__SBRouteToAppExposeSwitcherModifier_appExposeAccessoryButtonsOverrideUserInterfaceStyle__block_invoke;
  v5[3] = &unk_1E8E9DFA0;
  v5[4] = self;
  v5[5] = &v6;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", appExposeModifier, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __89__SBRouteToAppExposeSwitcherModifier_appExposeAccessoryButtonsOverrideUserInterfaceStyle__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "appExposeAccessoryButtonsOverrideUserInterfaceStyle");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)plusButtonStyle
{
  SBAppExposeGridSwitcherModifier *appExposeModifier;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  appExposeModifier = self->_appExposeModifier;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__SBRouteToAppExposeSwitcherModifier_plusButtonStyle__block_invoke;
  v5[3] = &unk_1E8E9DFA0;
  v5[4] = self;
  v5[5] = &v6;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", appExposeModifier, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __53__SBRouteToAppExposeSwitcherModifier_plusButtonStyle__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "plusButtonStyle");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (double)snapshotScaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  SBAppExposeGridSwitcherModifier *appExposeModifier;
  id v8;
  double v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  int64_t v14;
  uint64_t v15;
  double *v16;
  uint64_t v17;
  uint64_t v18;

  v6 = a4;
  v15 = 0;
  v16 = (double *)&v15;
  v17 = 0x2020000000;
  v18 = 0;
  appExposeModifier = self->_appExposeModifier;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__SBRouteToAppExposeSwitcherModifier_snapshotScaleForLayoutRole_inAppLayout___block_invoke;
  v11[3] = &unk_1E8E9FD80;
  v13 = &v15;
  v14 = a3;
  v11[4] = self;
  v8 = v6;
  v12 = v8;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", appExposeModifier, v11);
  v9 = v16[3];

  _Block_object_dispose(&v15, 8);
  return v9;
}

uint64_t __77__SBRouteToAppExposeSwitcherModifier_snapshotScaleForLayoutRole_inAppLayout___block_invoke(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1[4] + 136), "snapshotScaleForLayoutRole:inAppLayout:", a1[7], a1[5]);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v3;
  return result;
}

- (double)contentPageViewScaleForAppLayout:(id)a3 withScale:(double)a4
{
  id v6;
  SBAppExposeGridSwitcherModifier *appExposeModifier;
  id v8;
  double v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  double v14;
  uint64_t v15;
  double *v16;
  uint64_t v17;
  uint64_t v18;

  v6 = a3;
  v15 = 0;
  v16 = (double *)&v15;
  v17 = 0x2020000000;
  v18 = 0;
  appExposeModifier = self->_appExposeModifier;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81__SBRouteToAppExposeSwitcherModifier_contentPageViewScaleForAppLayout_withScale___block_invoke;
  v11[3] = &unk_1E8E9FD80;
  v13 = &v15;
  v11[4] = self;
  v8 = v6;
  v12 = v8;
  v14 = a4;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", appExposeModifier, v11);
  v9 = v16[3];

  _Block_object_dispose(&v15, 8);
  return v9;
}

uint64_t __81__SBRouteToAppExposeSwitcherModifier_contentPageViewScaleForAppLayout_withScale___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "contentPageViewScaleForAppLayout:withScale:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;
  return result;
}

- (id)scrollViewAttributes
{
  SBAppExposeGridSwitcherModifier *appExposeModifier;
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
  v9 = __Block_byref_object_copy__117;
  v10 = __Block_byref_object_dispose__117;
  v11 = 0;
  appExposeModifier = self->_appExposeModifier;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__SBRouteToAppExposeSwitcherModifier_scrollViewAttributes__block_invoke;
  v5[3] = &unk_1E8E9DFA0;
  v5[4] = self;
  v5[5] = &v6;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", appExposeModifier, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __58__SBRouteToAppExposeSwitcherModifier_scrollViewAttributes__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "scrollViewAttributes");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (CGPoint)contentOffsetForIndex:(unint64_t)a3 alignment:(int64_t)a4
{
  SBAppExposeGridSwitcherModifier *appExposeModifier;
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
  appExposeModifier = self->_appExposeModifier;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__SBRouteToAppExposeSwitcherModifier_contentOffsetForIndex_alignment___block_invoke;
  v9[3] = &unk_1E8E9FDD0;
  v9[4] = self;
  v9[5] = &v10;
  v9[6] = a3;
  v9[7] = a4;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", appExposeModifier, v9);
  v5 = v11[4];
  v6 = v11[5];
  _Block_object_dispose(&v10, 8);
  v7 = v5;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

uint64_t __70__SBRouteToAppExposeSwitcherModifier_contentOffsetForIndex_alignment___block_invoke(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  result = objc_msgSend(*(id *)(a1[4] + 136), "contentOffsetForIndex:alignment:", a1[6], a1[7]);
  v3 = *(_QWORD *)(a1[5] + 8);
  *(_QWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 40) = v5;
  return result;
}

- (CGPoint)restingOffsetForScrollOffset:(CGPoint)a3 velocity:(CGPoint)a4
{
  SBAppExposeGridSwitcherModifier *appExposeModifier;
  double v5;
  double v6;
  double v7;
  double v8;
  _QWORD v9[6];
  CGPoint v10;
  CGPoint v11;
  uint64_t v12;
  double *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  CGPoint result;

  v12 = 0;
  v13 = (double *)&v12;
  v14 = 0x3010000000;
  v15 = &unk_1D0FA064E;
  v16 = *MEMORY[0x1E0C9D538];
  appExposeModifier = self->_appExposeModifier;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__SBRouteToAppExposeSwitcherModifier_restingOffsetForScrollOffset_velocity___block_invoke;
  v9[3] = &unk_1E8EA4FC0;
  v9[4] = self;
  v9[5] = &v12;
  v10 = a3;
  v11 = a4;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", appExposeModifier, v9);
  v5 = v13[4];
  v6 = v13[5];
  _Block_object_dispose(&v12, 8);
  v7 = v5;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

uint64_t __76__SBRouteToAppExposeSwitcherModifier_restingOffsetForScrollOffset_velocity___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "restingOffsetForScrollOffset:velocity:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 40) = v5;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appExposeModifier, 0);
}

@end
