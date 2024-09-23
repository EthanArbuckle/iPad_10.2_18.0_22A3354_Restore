@implementation SBContinuousExposePeekTransitionModifier

- (SBContinuousExposePeekTransitionModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5 direction:(unint64_t)a6
{
  id v12;
  id v13;
  SBContinuousExposePeekTransitionModifier *v14;
  SBAppLayout **p_toAppLayout;
  SBFullScreenContinuousExposeSwitcherModifier *v16;
  SBFullScreenContinuousExposeSwitcherModifier *fromFullScreenContinuousExposeModifier;
  SBFullScreenContinuousExposeSwitcherModifier *v18;
  SBFullScreenContinuousExposeSwitcherModifier *toFullScreenContinuousExposeModifier;
  void *v21;
  objc_super v22;

  v12 = a4;
  v13 = a5;
  v22.receiver = self;
  v22.super_class = (Class)SBContinuousExposePeekTransitionModifier;
  v14 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v22, sel_initWithTransitionID_, a3);
  if (v14)
  {
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, CFSTR("SBContinuousExposePeekTransitionModifier.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromAppLayout"));

    }
    objc_storeStrong((id *)&v14->_fromAppLayout, a4);
    p_toAppLayout = &v14->_toAppLayout;
    objc_storeStrong((id *)&v14->_toAppLayout, a5);
    v14->_direction = a6;
    v16 = -[SBFullScreenContinuousExposeSwitcherModifier initWithFullScreenAppLayout:]([SBFullScreenContinuousExposeSwitcherModifier alloc], "initWithFullScreenAppLayout:", v14->_fromAppLayout);
    fromFullScreenContinuousExposeModifier = v14->_fromFullScreenContinuousExposeModifier;
    v14->_fromFullScreenContinuousExposeModifier = v16;

    if (a6 == 1 && *p_toAppLayout)
    {
      v18 = -[SBFullScreenContinuousExposeSwitcherModifier initWithFullScreenAppLayout:]([SBFullScreenContinuousExposeSwitcherModifier alloc], "initWithFullScreenAppLayout:", *p_toAppLayout);
      toFullScreenContinuousExposeModifier = v14->_toFullScreenContinuousExposeModifier;
      v14->_toFullScreenContinuousExposeModifier = v18;

    }
  }

  return v14;
}

- (id)transitionWillBegin
{
  void *v2;
  SBUpdateLayoutSwitcherEventResponse *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBContinuousExposePeekTransitionModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v6, sel_transitionWillBegin);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 4, 4);
  SBAppendSwitcherModifierResponse(v3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)visibleAppLayouts
{
  void *v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBContinuousExposePeekTransitionModifier;
  -[SBContinuousExposePeekTransitionModifier visibleAppLayouts](&v7, sel_visibleAppLayouts);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_direction == 1)
  {
    objc_msgSend(v3, "setByAddingObject:", self->_fromAppLayout);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  return v4;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  SBFullScreenContinuousExposeSwitcherModifier *toFullScreenContinuousExposeModifier;
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
  double v19;
  SBFullScreenContinuousExposeSwitcherModifier *fromFullScreenContinuousExposeModifier;
  objc_super v21;
  _QWORD v22[7];
  _QWORD v23[7];
  uint64_t v24;
  double *v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  CGRect result;

  -[SBContinuousExposePeekTransitionModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_direction == 1)
  {
    if (-[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase") >= 2
      && objc_msgSend(v6, "isEqual:", self->_fromAppLayout)
      && !-[SBAppLayout containsAnyItemFromAppLayout:](self->_toAppLayout, "containsAnyItemFromAppLayout:", self->_fromAppLayout))
    {
      v24 = 0;
      v25 = (double *)&v24;
      v26 = 0x4010000000;
      v27 = &unk_1D0FA064E;
      v28 = 0u;
      v29 = 0u;
      fromFullScreenContinuousExposeModifier = self->_fromFullScreenContinuousExposeModifier;
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __58__SBContinuousExposePeekTransitionModifier_frameForIndex___block_invoke;
      v23[3] = &unk_1E8E9FD08;
      v23[4] = self;
      v23[5] = &v24;
      v23[6] = a3;
      -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", fromFullScreenContinuousExposeModifier, v23);
      goto LABEL_14;
    }
    if (self->_direction == 1
      && -[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase") >= 2
      && self->_toFullScreenContinuousExposeModifier
      && -[SBAppLayout containsAnyItemFromAppLayout:](self->_toAppLayout, "containsAnyItemFromAppLayout:", v6)
      && -[SBAppLayout containsAnyItemFromAppLayout:](self->_fromAppLayout, "containsAnyItemFromAppLayout:", v6))
    {
      v24 = 0;
      v25 = (double *)&v24;
      v26 = 0x4010000000;
      v27 = &unk_1D0FA064E;
      v28 = 0u;
      v29 = 0u;
      toFullScreenContinuousExposeModifier = self->_toFullScreenContinuousExposeModifier;
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __58__SBContinuousExposePeekTransitionModifier_frameForIndex___block_invoke_2;
      v22[3] = &unk_1E8E9FD08;
      v22[4] = self;
      v22[5] = &v24;
      v22[6] = a3;
      -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", toFullScreenContinuousExposeModifier, v22);
LABEL_14:
      v9 = v25[4];
      v11 = v25[5];
      v13 = v25[6];
      v15 = v25[7];
      _Block_object_dispose(&v24, 8);
      goto LABEL_12;
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)SBContinuousExposePeekTransitionModifier;
  -[SBContinuousExposePeekTransitionModifier frameForIndex:](&v21, sel_frameForIndex_, a3);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
LABEL_12:

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

uint64_t __58__SBContinuousExposePeekTransitionModifier_frameForIndex___block_invoke(_QWORD *a1)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(*(id *)(a1[4] + 136), "frameForIndex:", a1[6]);
  v3 = *(_QWORD **)(a1[5] + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

uint64_t __58__SBContinuousExposePeekTransitionModifier_frameForIndex___block_invoke_2(_QWORD *a1)
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

- (double)scaleForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  SBFullScreenContinuousExposeSwitcherModifier *toFullScreenContinuousExposeModifier;
  double v8;
  double v9;
  SBFullScreenContinuousExposeSwitcherModifier *fromFullScreenContinuousExposeModifier;
  objc_super v12;
  _QWORD v13[7];
  _QWORD v14[7];
  uint64_t v15;
  double *v16;
  uint64_t v17;
  uint64_t v18;

  -[SBContinuousExposePeekTransitionModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_direction == 1)
  {
    if (-[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase") >= 2
      && objc_msgSend(v6, "isEqual:", self->_fromAppLayout)
      && !-[SBAppLayout containsAnyItemFromAppLayout:](self->_toAppLayout, "containsAnyItemFromAppLayout:", self->_fromAppLayout))
    {
      v15 = 0;
      v16 = (double *)&v15;
      v17 = 0x2020000000;
      v18 = 0;
      fromFullScreenContinuousExposeModifier = self->_fromFullScreenContinuousExposeModifier;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __58__SBContinuousExposePeekTransitionModifier_scaleForIndex___block_invoke;
      v14[3] = &unk_1E8E9FD08;
      v14[4] = self;
      v14[5] = &v15;
      v14[6] = a3;
      -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", fromFullScreenContinuousExposeModifier, v14);
      goto LABEL_14;
    }
    if (self->_direction == 1
      && -[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase") >= 2
      && self->_toFullScreenContinuousExposeModifier
      && -[SBAppLayout containsAnyItemFromAppLayout:](self->_toAppLayout, "containsAnyItemFromAppLayout:", v6)
      && -[SBAppLayout containsAnyItemFromAppLayout:](self->_fromAppLayout, "containsAnyItemFromAppLayout:", v6))
    {
      v15 = 0;
      v16 = (double *)&v15;
      v17 = 0x2020000000;
      v18 = 0;
      toFullScreenContinuousExposeModifier = self->_toFullScreenContinuousExposeModifier;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __58__SBContinuousExposePeekTransitionModifier_scaleForIndex___block_invoke_2;
      v13[3] = &unk_1E8E9FD08;
      v13[4] = self;
      v13[5] = &v15;
      v13[6] = a3;
      -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", toFullScreenContinuousExposeModifier, v13);
LABEL_14:
      v9 = v16[3];
      _Block_object_dispose(&v15, 8);
      goto LABEL_12;
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)SBContinuousExposePeekTransitionModifier;
  -[SBContinuousExposePeekTransitionModifier scaleForIndex:](&v12, sel_scaleForIndex_, a3);
  v9 = v8;
LABEL_12:

  return v9;
}

uint64_t __58__SBContinuousExposePeekTransitionModifier_scaleForIndex___block_invoke(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1[4] + 136), "scaleForIndex:", a1[6]);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v3;
  return result;
}

uint64_t __58__SBContinuousExposePeekTransitionModifier_scaleForIndex___block_invoke_2(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1[4] + 144), "scaleForIndex:", a1[6]);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v3;
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
  SBFullScreenContinuousExposeSwitcherModifier *toFullScreenContinuousExposeModifier;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  _QWORD v39[5];
  id v40;
  uint64_t *v41;
  int64_t v42;
  double v43;
  double v44;
  double v45;
  double v46;
  uint64_t v47;
  double *v48;
  uint64_t v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  objc_super v53;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4;
  v53.receiver = self;
  v53.super_class = (Class)SBContinuousExposePeekTransitionModifier;
  -[SBContinuousExposePeekTransitionModifier frameForLayoutRole:inAppLayout:withBounds:](&v53, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v11, x, y, width, height);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  if (self->_direction == 1)
  {
    if (-[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase") >= 2
      && objc_msgSend(v11, "isEqual:", self->_fromAppLayout)
      && !-[SBAppLayout containsAnyItemFromAppLayout:](self->_toAppLayout, "containsAnyItemFromAppLayout:", self->_fromAppLayout))
    {
      objc_msgSend(v11, "itemForLayoutRole:", a3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSwitcherModifier frameForContinuousExposePeekingDisplayItem:inAppLayout:bounds:defaultFrameForLayoutRole:](self, "frameForContinuousExposePeekingDisplayItem:inAppLayout:bounds:defaultFrameForLayoutRole:", v21, self->_fromAppLayout, x, y, width, height, v13, v15, v17, v19);
      v23 = v22;
      v15 = v24;
      v17 = v25;
      v19 = v26;
      UIRectGetCenter();
      v28 = v27;
      -[SBContinuousExposePeekTransitionModifier containerViewBounds](self, "containerViewBounds");
      UIRectGetCenter();
      v30 = v29;
      -[SBContinuousExposePeekTransitionModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "screenEdgePadding");
      v33 = v32;

      v34 = -2.0;
      if (v28 >= v30)
        v34 = 2.0;
      v13 = v23 + v33 * v34 * 2.0;

    }
    else if (self->_direction == 1
           && -[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase") >= 2
           && self->_toFullScreenContinuousExposeModifier
           && -[SBAppLayout containsAnyItemFromAppLayout:](self->_toAppLayout, "containsAnyItemFromAppLayout:", v11)
           && -[SBAppLayout containsAnyItemFromAppLayout:](self->_fromAppLayout, "containsAnyItemFromAppLayout:", v11))
    {
      v47 = 0;
      v48 = (double *)&v47;
      v49 = 0x4010000000;
      v50 = &unk_1D0FA064E;
      v51 = 0u;
      v52 = 0u;
      toFullScreenContinuousExposeModifier = self->_toFullScreenContinuousExposeModifier;
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __86__SBContinuousExposePeekTransitionModifier_frameForLayoutRole_inAppLayout_withBounds___block_invoke;
      v39[3] = &unk_1E8E9FD58;
      v41 = &v47;
      v42 = a3;
      v39[4] = self;
      v40 = v11;
      v43 = x;
      v44 = y;
      v45 = width;
      v46 = height;
      -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", toFullScreenContinuousExposeModifier, v39);
      v13 = v48[4];
      v15 = v48[5];
      v17 = v48[6];
      v19 = v48[7];

      _Block_object_dispose(&v47, 8);
    }
  }

  v35 = v13;
  v36 = v15;
  v37 = v17;
  v38 = v19;
  result.size.height = v38;
  result.size.width = v37;
  result.origin.y = v36;
  result.origin.x = v35;
  return result;
}

uint64_t __86__SBContinuousExposePeekTransitionModifier_frameForLayoutRole_inAppLayout_withBounds___block_invoke(uint64_t a1)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "frameForLayoutRole:inAppLayout:withBounds:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  v3 = *(_QWORD **)(*(_QWORD *)(a1 + 48) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (double)scaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  SBFullScreenContinuousExposeSwitcherModifier *toFullScreenContinuousExposeModifier;
  double v8;
  double v9;
  objc_super v11;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  int64_t v15;
  uint64_t v16;
  double *v17;
  uint64_t v18;
  uint64_t v19;

  v6 = a4;
  if (self->_direction == 1
    && -[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase") >= 2
    && self->_toFullScreenContinuousExposeModifier
    && -[SBAppLayout containsAnyItemFromAppLayout:](self->_toAppLayout, "containsAnyItemFromAppLayout:", v6)
    && -[SBAppLayout containsAnyItemFromAppLayout:](self->_fromAppLayout, "containsAnyItemFromAppLayout:", v6))
  {
    v16 = 0;
    v17 = (double *)&v16;
    v18 = 0x2020000000;
    v19 = 0;
    toFullScreenContinuousExposeModifier = self->_toFullScreenContinuousExposeModifier;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __75__SBContinuousExposePeekTransitionModifier_scaleForLayoutRole_inAppLayout___block_invoke;
    v12[3] = &unk_1E8E9FD80;
    v14 = &v16;
    v15 = a3;
    v12[4] = self;
    v13 = v6;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", toFullScreenContinuousExposeModifier, v12);
    v8 = v17[3];

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBContinuousExposePeekTransitionModifier;
    -[SBContinuousExposePeekTransitionModifier scaleForLayoutRole:inAppLayout:](&v11, sel_scaleForLayoutRole_inAppLayout_, a3, v6);
    v8 = v9;
  }

  return v8;
}

uint64_t __75__SBContinuousExposePeekTransitionModifier_scaleForLayoutRole_inAppLayout___block_invoke(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1[4] + 144), "scaleForLayoutRole:inAppLayout:", a1[7], a1[5]);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v3;
  return result;
}

- (id)topMostLayoutElements
{
  void *v3;
  SBAppLayout *toAppLayout;
  void *v5;
  uint64_t v6;
  _QWORD v8[5];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBContinuousExposePeekTransitionModifier;
  -[SBContinuousExposePeekTransitionModifier topMostLayoutElements](&v9, sel_topMostLayoutElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_direction == 1
    && self->_toAppLayout
    && !-[SBAppLayout containsAllItemsFromAppLayout:](self->_fromAppLayout, "containsAllItemsFromAppLayout:"))
  {
    toAppLayout = self->_toAppLayout;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __65__SBContinuousExposePeekTransitionModifier_topMostLayoutElements__block_invoke;
    v8[3] = &unk_1E8E9DF50;
    v8[4] = self;
    -[SBAppLayout appLayoutWithItemsPassingTest:](toAppLayout, "appLayoutWithItemsPassingTest:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "sb_arrayByInsertingOrMovingObject:toIndex:", v5, 0);
      v6 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v6;
    }

  }
  return v3;
}

uint64_t __65__SBContinuousExposePeekTransitionModifier_topMostLayoutElements__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "containsItem:", a2) ^ 1;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  BOOL v7;
  objc_super v9;

  v6 = a4;
  if (-[SBAppLayout containsAnyItemFromAppLayout:](self->_toAppLayout, "containsAnyItemFromAppLayout:", self->_fromAppLayout)&& (-[SBAppLayout containsAnyItemFromAppLayout:](self->_toAppLayout, "containsAnyItemFromAppLayout:", v6)|| -[SBAppLayout containsAnyItemFromAppLayout:](self->_fromAppLayout, "containsAnyItemFromAppLayout:", v6)))
  {
    v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBContinuousExposePeekTransitionModifier;
    v7 = -[SBContinuousExposePeekTransitionModifier isLayoutRoleMatchMovedToScene:inAppLayout:](&v9, sel_isLayoutRoleMatchMovedToScene_inAppLayout_, a3, v6);
  }

  return v7;
}

- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  v6 = a4;
  if (-[SBAppLayout containsAnyItemFromAppLayout:](self->_toAppLayout, "containsAnyItemFromAppLayout:", self->_fromAppLayout)&& (-[SBAppLayout containsAnyItemFromAppLayout:](self->_toAppLayout, "containsAnyItemFromAppLayout:", v6)|| -[SBAppLayout containsAnyItemFromAppLayout:](self->_fromAppLayout, "containsAnyItemFromAppLayout:", v6)))
  {
    -[SBContinuousExposePeekTransitionModifier switcherSettings](self, "switcherSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "animationSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resizeBlurDelay");
    v10 = v9;

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SBContinuousExposePeekTransitionModifier;
    -[SBContinuousExposePeekTransitionModifier blurDelayForLayoutRole:inAppLayout:](&v13, sel_blurDelayForLayoutRole_inAppLayout_, a3, v6);
    v10 = v11;
  }

  return v10;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  SBMutableSwitcherAnimationAttributes *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init(SBMutableSwitcherAnimationAttributes);
  -[SBSwitcherAnimationAttributes setUpdateMode:](v4, "setUpdateMode:", 3);
  -[SBContinuousExposePeekTransitionModifier switcherSettings](self, "switcherSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chamoisSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appToAppLayoutSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSwitcherAnimationAttributes setLayoutSettings:](v4, "setLayoutSettings:", v7);

  return v4;
}

- (SBAppLayout)fromAppLayout
{
  return self->_fromAppLayout;
}

- (SBAppLayout)toAppLayout
{
  return self->_toAppLayout;
}

- (unint64_t)direction
{
  return self->_direction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toAppLayout, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
  objc_storeStrong((id *)&self->_toFullScreenContinuousExposeModifier, 0);
  objc_storeStrong((id *)&self->_fromFullScreenContinuousExposeModifier, 0);
}

@end
