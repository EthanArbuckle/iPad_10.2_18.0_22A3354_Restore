@implementation SBGridToActiveAppLayoutsSwitcherModifier

- (SBGridToActiveAppLayoutsSwitcherModifier)initWithTransitionID:(id)a3 direction:(int64_t)a4 activeAppLayouts:(id)a5 gridModifier:(id)a6
{
  id v10;
  id v11;
  SBGridToActiveAppLayoutsSwitcherModifier *v12;
  SBGridToActiveAppLayoutsSwitcherModifier *v13;
  uint64_t v14;
  NSArray *activeAppLayouts;
  objc_super v17;

  v10 = a5;
  v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SBGridToActiveAppLayoutsSwitcherModifier;
  v12 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v17, sel_initWithTransitionID_, a3);
  v13 = v12;
  if (v12)
  {
    v12->_direction = a4;
    v14 = objc_msgSend(v10, "copy");
    activeAppLayouts = v13->_activeAppLayouts;
    v13->_activeAppLayouts = (NSArray *)v14;

    objc_storeStrong((id *)&v13->_gridModifier, a6);
    v13->_wantsMinificationFilter = 0;
  }

  return v13;
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
    -[SBGridToActiveAppLayoutsSwitcherModifier switcherSettings](self, "switcherSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "animationSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "disableAsyncRenderingTransitionPercentage");
    v9 = v8;

    -[SBGridToActiveAppLayoutsSwitcherModifier _layoutSettings](self, "_layoutSettings");
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
  int64_t direction;
  SBUpdateLayoutSwitcherEventResponse *v6;
  BOOL v7;
  uint64_t v8;
  SBUpdateLayoutSwitcherEventResponse *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBGridToActiveAppLayoutsSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v12, sel_transitionWillBegin);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray bs_firstObjectPassingTest:](self->_activeAppLayouts, "bs_firstObjectPassingTest:", &__block_literal_global_201);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  direction = self->_direction;
  v6 = [SBUpdateLayoutSwitcherEventResponse alloc];
  if (v4)
    v7 = direction == 1;
  else
    v7 = 0;
  if (v7)
    v8 = 30;
  else
    v8 = 2;
  v9 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:](v6, "initWithOptions:updateMode:", v8, 2);
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v9, v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

BOOL __63__SBGridToActiveAppLayoutsSwitcherModifier_transitionWillBegin__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 2;
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
  v12.super_class = (Class)SBGridToActiveAppLayoutsSwitcherModifier;
  -[SBTransitionSwitcherModifier handleTransitionEvent:](&v12, sel_handleTransitionEvent_, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  __int128 v13;
  SBSwitcherModifier *gridModifier;
  __int128 v15;
  SBSwitcherModifier *v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGAffineTransform v28;
  _QWORD v29[7];
  objc_super v30;
  _QWORD v31[7];
  uint64_t v32;
  double *v33;
  uint64_t v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  CGRect result;

  if (!-[SBGridToActiveAppLayoutsSwitcherModifier _isEffectivelyFullScreen](self, "_isEffectivelyFullScreen"))
  {
    v32 = 0;
    v33 = (double *)&v32;
    v34 = 0x4010000000;
    v35 = &unk_1D0FA064E;
    v13 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    v36 = *MEMORY[0x1E0C9D648];
    v37 = v13;
    gridModifier = self->_gridModifier;
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __58__SBGridToActiveAppLayoutsSwitcherModifier_frameForIndex___block_invoke;
    v31[3] = &unk_1E8E9FD08;
    v31[4] = self;
    v31[5] = &v32;
    v31[6] = a3;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", gridModifier, v31);
    v6 = v33[4];
    v8 = v33[5];
    v10 = v33[6];
    v12 = v33[7];
LABEL_6:
    _Block_object_dispose(&v32, 8);
    goto LABEL_7;
  }
  if (!-[SBGridToActiveAppLayoutsSwitcherModifier _isIndexActive:](self, "_isIndexActive:", a3))
  {
    v32 = 0;
    v33 = (double *)&v32;
    v34 = 0x4010000000;
    v35 = &unk_1D0FA064E;
    v15 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    v36 = *MEMORY[0x1E0C9D648];
    v37 = v15;
    v16 = self->_gridModifier;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __58__SBGridToActiveAppLayoutsSwitcherModifier_frameForIndex___block_invoke_2;
    v29[3] = &unk_1E8E9FD08;
    v29[4] = self;
    v29[5] = &v32;
    v29[6] = a3;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", v16, v29);
    -[SBGridToActiveAppLayoutsSwitcherModifier _unselectedCardScale](self, "_unselectedCardScale");
    v18 = v17;
    -[SBGridToActiveAppLayoutsSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
    UIRectGetCenter();
    UIRectGetCenter();
    CGAffineTransformMakeScale(&v28, v18, v18);
    SBUnintegralizedRectCenteredAboutPoint();
    v6 = v19;
    v8 = v20;
    v10 = v21;
    v12 = v22;
    v23 = v33;
    v33[4] = v19;
    v23[5] = v20;
    v23[6] = v21;
    v23[7] = v22;
    goto LABEL_6;
  }
  v30.receiver = self;
  v30.super_class = (Class)SBGridToActiveAppLayoutsSwitcherModifier;
  -[SBGridToActiveAppLayoutsSwitcherModifier frameForIndex:](&v30, sel_frameForIndex_, a3);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
LABEL_7:
  v24 = v6;
  v25 = v8;
  v26 = v10;
  v27 = v12;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

uint64_t __58__SBGridToActiveAppLayoutsSwitcherModifier_frameForIndex___block_invoke(_QWORD *a1)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(*(id *)(a1[4] + 152), "frameForIndex:", a1[6]);
  v3 = *(_QWORD **)(a1[5] + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

uint64_t __58__SBGridToActiveAppLayoutsSwitcherModifier_frameForIndex___block_invoke_2(_QWORD *a1)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(*(id *)(a1[4] + 152), "frameForIndex:", a1[6]);
  v3 = *(_QWORD **)(a1[5] + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  SBSwitcherModifier *gridModifier;
  double v21;
  double v22;
  double v23;
  double v24;
  objc_super v25;
  _QWORD v26[5];
  id v27;
  uint64_t *v28;
  int64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  double *v35;
  uint64_t v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4;
  if (-[SBGridToActiveAppLayoutsSwitcherModifier _isEffectivelyFullScreen](self, "_isEffectivelyFullScreen")
    && !-[NSArray containsObject:](self->_activeAppLayouts, "containsObject:", v11))
  {
    v34 = 0;
    v35 = (double *)&v34;
    v36 = 0x4010000000;
    v37 = &unk_1D0FA064E;
    v38 = 0u;
    v39 = 0u;
    gridModifier = self->_gridModifier;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __86__SBGridToActiveAppLayoutsSwitcherModifier_frameForLayoutRole_inAppLayout_withBounds___block_invoke;
    v26[3] = &unk_1E8E9FD58;
    v28 = &v34;
    v29 = a3;
    v26[4] = self;
    v27 = v11;
    v30 = x;
    v31 = y;
    v32 = width;
    v33 = height;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", gridModifier, v26);
    v13 = v35[4];
    v15 = v35[5];
    v17 = v35[6];
    v19 = v35[7];

    _Block_object_dispose(&v34, 8);
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)SBGridToActiveAppLayoutsSwitcherModifier;
    -[SBGridToActiveAppLayoutsSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v25, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v11, x, y, width, height);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
  }

  v21 = v13;
  v22 = v15;
  v23 = v17;
  v24 = v19;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

uint64_t __86__SBGridToActiveAppLayoutsSwitcherModifier_frameForLayoutRole_inAppLayout_withBounds___block_invoke(uint64_t a1)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "frameForLayoutRole:inAppLayout:withBounds:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  v3 = *(_QWORD **)(*(_QWORD *)(a1 + 48) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (id)visibleAppLayouts
{
  SBSwitcherModifier *gridModifier;
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
  v13 = __Block_byref_object_copy__69;
  v14 = __Block_byref_object_dispose__69;
  v15 = 0;
  gridModifier = self->_gridModifier;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__SBGridToActiveAppLayoutsSwitcherModifier_visibleAppLayouts__block_invoke;
  v9[3] = &unk_1E8E9DFA0;
  v9[4] = self;
  v9[5] = &v10;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", gridModifier, v9);
  v4 = (void *)v11[5];
  v8.receiver = self;
  v8.super_class = (Class)SBGridToActiveAppLayoutsSwitcherModifier;
  -[SBGridToActiveAppLayoutsSwitcherModifier visibleAppLayouts](&v8, sel_visibleAppLayouts);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setByAddingObjectsFromSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v10, 8);
  return v6;
}

void __61__SBGridToActiveAppLayoutsSwitcherModifier_visibleAppLayouts__block_invoke(uint64_t a1)
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

- (double)scaleForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  SBSwitcherModifier *gridModifier;
  double v8;
  _QWORD v10[7];
  uint64_t v11;
  double *v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v15;

  if (-[SBGridToActiveAppLayoutsSwitcherModifier _isIndexActive:](self, "_isIndexActive:"))
  {
    v15.receiver = self;
    v15.super_class = (Class)SBGridToActiveAppLayoutsSwitcherModifier;
    -[SBGridToActiveAppLayoutsSwitcherModifier scaleForIndex:](&v15, sel_scaleForIndex_, a3);
    return v5;
  }
  else
  {
    v11 = 0;
    v12 = (double *)&v11;
    v13 = 0x2020000000;
    v14 = 0x3FF0000000000000;
    gridModifier = self->_gridModifier;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __58__SBGridToActiveAppLayoutsSwitcherModifier_scaleForIndex___block_invoke;
    v10[3] = &unk_1E8E9FD08;
    v10[4] = self;
    v10[5] = &v11;
    v10[6] = a3;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", gridModifier, v10);
    -[SBGridToActiveAppLayoutsSwitcherModifier _unselectedCardScale](self, "_unselectedCardScale");
    v6 = v8 * v12[3];
    v12[3] = v6;
    _Block_object_dispose(&v11, 8);
  }
  return v6;
}

uint64_t __58__SBGridToActiveAppLayoutsSwitcherModifier_scaleForIndex___block_invoke(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1[4] + 152), "scaleForIndex:", a1[6]);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v3;
  return result;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBGridToActiveAppLayoutsSwitcherModifier;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v8, sel_animationAttributesForLayoutElement_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[SBGridToActiveAppLayoutsSwitcherModifier _layoutSettings](self, "_layoutSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayoutSettings:", v6);

  return v5;
}

- (id)_layoutSettings
{
  void *v3;
  void *v4;
  void *v5;

  -[SBGridToActiveAppLayoutsSwitcherModifier switcherSettings](self, "switcherSettings");
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
  id v8;
  double v9;
  double v10;
  objc_super v12;

  v8 = a4;
  if (!-[SBGridToActiveAppLayoutsSwitcherModifier _isEffectivelyFullScreen](self, "_isEffectivelyFullScreen")
    || (v9 = 0.0, -[SBGridToActiveAppLayoutsSwitcherModifier _isIndexActive:](self, "_isIndexActive:", a5)))
  {
    v12.receiver = self;
    v12.super_class = (Class)SBGridToActiveAppLayoutsSwitcherModifier;
    -[SBGridToActiveAppLayoutsSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](&v12, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, v8, a5);
    v9 = v10;
  }

  return v9;
}

- (double)homeScreenAlpha
{
  SBSwitcherModifier *gridModifier;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  _QWORD v9[6];
  uint64_t v10;
  double *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = (double *)&v10;
  v12 = 0x2020000000;
  v13 = 0x3FF0000000000000;
  gridModifier = self->_gridModifier;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__SBGridToActiveAppLayoutsSwitcherModifier_homeScreenAlpha__block_invoke;
  v9[3] = &unk_1E8E9DFA0;
  v9[4] = self;
  v9[5] = &v10;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", gridModifier, v9);
  if (!self->_direction
    && ((-[SBGridToActiveAppLayoutsSwitcherModifier homeScreenHasOpenFolder](self, "homeScreenHasOpenFolder") & 1) != 0
     || -[SBGridToActiveAppLayoutsSwitcherModifier isShowingSpotlightOrTodayView](self, "isShowingSpotlightOrTodayView")))
  {
    -[SBGridToActiveAppLayoutsSwitcherModifier switcherSettings](self, "switcherSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "animationSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "homeScreenAlphaForMode:", 1);
    *((_QWORD *)v11 + 3) = v6;

  }
  v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __59__SBGridToActiveAppLayoutsSwitcherModifier_homeScreenAlpha__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "homeScreenAlpha");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (double)homeScreenScale
{
  SBSwitcherModifier *gridModifier;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0x3FF0000000000000;
  gridModifier = self->_gridModifier;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__SBGridToActiveAppLayoutsSwitcherModifier_homeScreenScale__block_invoke;
  v5[3] = &unk_1E8E9DFA0;
  v5[4] = self;
  v5[5] = &v6;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", gridModifier, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __59__SBGridToActiveAppLayoutsSwitcherModifier_homeScreenScale__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "homeScreenScale");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (double)wallpaperScale
{
  SBSwitcherModifier *gridModifier;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0x3FF0000000000000;
  gridModifier = self->_gridModifier;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__SBGridToActiveAppLayoutsSwitcherModifier_wallpaperScale__block_invoke;
  v5[3] = &unk_1E8E9DFA0;
  v5[4] = self;
  v5[5] = &v6;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", gridModifier, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __58__SBGridToActiveAppLayoutsSwitcherModifier_wallpaperScale__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "wallpaperScale");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (int64_t)homeScreenBackdropBlurType
{
  SBSwitcherModifier *gridModifier;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  gridModifier = self->_gridModifier;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__SBGridToActiveAppLayoutsSwitcherModifier_homeScreenBackdropBlurType__block_invoke;
  v5[3] = &unk_1E8E9DFA0;
  v5[4] = self;
  v5[5] = &v6;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", gridModifier, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __70__SBGridToActiveAppLayoutsSwitcherModifier_homeScreenBackdropBlurType__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "homeScreenBackdropBlurType");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (double)homeScreenBackdropBlurProgress
{
  double v3;
  double v4;
  SBSwitcherModifier *gridModifier;
  _QWORD v7[6];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v12;

  if (-[SBGridToActiveAppLayoutsSwitcherModifier _isEffectivelyFullScreen](self, "_isEffectivelyFullScreen"))
  {
    v12.receiver = self;
    v12.super_class = (Class)SBGridToActiveAppLayoutsSwitcherModifier;
    -[SBGridToActiveAppLayoutsSwitcherModifier homeScreenBackdropBlurProgress](&v12, sel_homeScreenBackdropBlurProgress);
    return v3;
  }
  else
  {
    v8 = 0;
    v9 = (double *)&v8;
    v10 = 0x2020000000;
    v11 = 0x3FF0000000000000;
    gridModifier = self->_gridModifier;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __74__SBGridToActiveAppLayoutsSwitcherModifier_homeScreenBackdropBlurProgress__block_invoke;
    v7[3] = &unk_1E8E9DFA0;
    v7[4] = self;
    v7[5] = &v8;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", gridModifier, v7);
    v4 = v9[3];
    _Block_object_dispose(&v8, 8);
  }
  return v4;
}

uint64_t __74__SBGridToActiveAppLayoutsSwitcherModifier_homeScreenBackdropBlurProgress__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "homeScreenBackdropBlurProgress");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (double)titleOpacityForIndex:(unint64_t)a3
{
  return 1.0;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  double v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBGridToActiveAppLayoutsSwitcherModifier;
  v6 = a4;
  -[SBGridToActiveAppLayoutsSwitcherModifier dimmingAlphaForLayoutRole:inAppLayout:](&v13, sel_dimmingAlphaForLayoutRole_inAppLayout_, a3, v6);
  v8 = v7;
  -[SBGridToActiveAppLayoutsSwitcherModifier appLayouts](self, "appLayouts", v13.receiver, v13.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "indexOfObject:", v6);

  if (!-[SBGridToActiveAppLayoutsSwitcherModifier _isIndexActive:](self, "_isIndexActive:", v10)
    && -[SBGridToActiveAppLayoutsSwitcherModifier _isEffectivelyFullScreen](self, "_isEffectivelyFullScreen"))
  {
    -[SBGridToActiveAppLayoutsSwitcherModifier homeScreenDimmingAlpha](self, "homeScreenDimmingAlpha");
    return v11;
  }
  return v8;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  __int128 v5;
  SBSwitcherModifier *gridModifier;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;
  _QWORD v20[7];
  uint64_t v21;
  double *v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  UIRectCornerRadii result;

  v21 = 0;
  v22 = (double *)&v21;
  v23 = 0x4010000000;
  v24 = &unk_1D0FA064E;
  v5 = *(_OWORD *)(MEMORY[0x1E0CEBAC0] + 16);
  v25 = *MEMORY[0x1E0CEBAC0];
  v26 = v5;
  gridModifier = self->_gridModifier;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __64__SBGridToActiveAppLayoutsSwitcherModifier_cornerRadiiForIndex___block_invoke;
  v20[3] = &unk_1E8E9FD08;
  v20[4] = self;
  v20[5] = &v21;
  v20[6] = a3;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", gridModifier, v20);
  if (-[SBGridToActiveAppLayoutsSwitcherModifier _isIndexActive:](self, "_isIndexActive:", a3)
    && -[SBGridToActiveAppLayoutsSwitcherModifier _isEffectivelyFullScreen](self, "_isEffectivelyFullScreen"))
  {
    v19.receiver = self;
    v19.super_class = (Class)SBGridToActiveAppLayoutsSwitcherModifier;
    -[SBGridToActiveAppLayoutsSwitcherModifier cornerRadiiForIndex:](&v19, sel_cornerRadiiForIndex_, a3);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
  }
  else
  {
    v8 = v22[4];
    v10 = v22[5];
    v12 = v22[6];
    v14 = v22[7];
  }
  _Block_object_dispose(&v21, 8);
  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.topRight = v18;
  result.bottomRight = v17;
  result.bottomLeft = v16;
  result.topLeft = v15;
  return result;
}

uint64_t __64__SBGridToActiveAppLayoutsSwitcherModifier_cornerRadiiForIndex___block_invoke(_QWORD *a1)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(*(id *)(a1[4] + 152), "cornerRadiiForIndex:", a1[6]);
  v3 = *(_QWORD **)(a1[5] + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
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

- (id)appLayoutsToCacheSnapshots
{
  SBSwitcherModifier *gridModifier;
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
  v9 = __Block_byref_object_copy__69;
  v10 = __Block_byref_object_dispose__69;
  v11 = 0;
  gridModifier = self->_gridModifier;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__SBGridToActiveAppLayoutsSwitcherModifier_appLayoutsToCacheSnapshots__block_invoke;
  v5[3] = &unk_1E8E9DFA0;
  v5[4] = self;
  v5[5] = &v6;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", gridModifier, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __70__SBGridToActiveAppLayoutsSwitcherModifier_appLayoutsToCacheSnapshots__block_invoke(uint64_t a1)
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

- (id)topMostLayoutElements
{
  void *v3;
  void *v4;
  NSArray *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)SBGridToActiveAppLayoutsSwitcherModifier;
  -[SBGridToActiveAppLayoutsSwitcherModifier topMostLayoutElements](&v18, sel_topMostLayoutElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (NSArray *)objc_msgSend(v3, "mutableCopy");
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[NSArray reverseObjectEnumerator](self->_activeAppLayouts, "reverseObjectEnumerator", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          v12 = -[NSArray indexOfObject:](v5, "indexOfObject:", v11);
          if (v12 != 0x7FFFFFFFFFFFFFFFLL)
            -[NSArray removeObjectAtIndex:](v5, "removeObjectAtIndex:", v12);
          -[NSArray insertObject:atIndex:](v5, "insertObject:atIndex:", v11, 0);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = self->_activeAppLayouts;
  }

  return v5;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBGridToActiveAppLayoutsSwitcherModifier;
  return (SBSwitcherAsyncRenderingAttributes)(-[SBTransitionSwitcherModifier asyncRenderingAttributesForAppLayout:](&v4, sel_asyncRenderingAttributesForAppLayout_, a3) | (self->_wantsMinificationFilter << 8));
}

- (BOOL)_isIndexActive:(unint64_t)a3
{
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[SBGridToActiveAppLayoutsSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = self->_activeAppLayouts;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v7);
        if ((objc_msgSend(v6, "isEqual:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12) & 1) != 0)
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (double)_unselectedCardScale
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  if (!-[SBGridToActiveAppLayoutsSwitcherModifier _isEffectivelyFullScreen](self, "_isEffectivelyFullScreen"))
    return 1.0;
  -[SBGridToActiveAppLayoutsSwitcherModifier switcherSettings](self, "switcherSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appToSwitcherTransitionMinCardScaleFactor");
  v6 = v5;

  return v6;
}

- (BOOL)_isEffectivelyFullScreen
{
  BOOL v3;
  BOOL v4;

  if (-[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout"))
    v3 = self->_direction == 1;
  else
    v3 = 0;
  if (-[SBTransitionSwitcherModifier isUpdatingLayout](self, "isUpdatingLayout"))
    v4 = self->_direction == 0;
  else
    v4 = 0;
  return v3 || v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gridModifier, 0);
  objc_storeStrong((id *)&self->_activeAppLayouts, 0);
}

@end
