@implementation SBWindowDeclineSwitcherModifier

- (SBWindowDeclineSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 layoutRole:(int64_t)a5
{
  id v9;
  SBWindowDeclineSwitcherModifier *v10;
  SBWindowDeclineSwitcherModifier *v11;
  uint64_t v12;
  SBAppLayout *centerWindowAppLayout;
  SBWindowDeclineSwitcherModifier *v14;
  uint64_t v15;
  SBAppLayout *fullScreenAppLayout;
  _QWORD v18[4];
  SBWindowDeclineSwitcherModifier *v19;
  objc_super v20;

  v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SBWindowDeclineSwitcherModifier;
  v10 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v20, sel_initWithTransitionID_, a3);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_fromAppLayout, a4);
    v11->_layoutRole = a5;
    objc_msgSend(v9, "leafAppLayoutForRole:", a5);
    v12 = objc_claimAutoreleasedReturnValue();
    centerWindowAppLayout = v11->_centerWindowAppLayout;
    v11->_centerWindowAppLayout = (SBAppLayout *)v12;

    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __81__SBWindowDeclineSwitcherModifier_initWithTransitionID_fromAppLayout_layoutRole___block_invoke;
    v18[3] = &unk_1E8E9DF50;
    v14 = v11;
    v19 = v14;
    objc_msgSend(v9, "appLayoutWithItemsPassingTest:", v18);
    v15 = objc_claimAutoreleasedReturnValue();
    fullScreenAppLayout = v14->_fullScreenAppLayout;
    v14->_fullScreenAppLayout = (SBAppLayout *)v15;

  }
  return v11;
}

uint64_t __81__SBWindowDeclineSwitcherModifier_initWithTransitionID_fromAppLayout_layoutRole___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  int v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 152);
  v3 = a2;
  objc_msgSend(v2, "itemForLayoutRole:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5 ^ 1u;
}

- (id)transitionWillBegin
{
  void *v3;
  SBInvalidateAdjustedAppLayoutsSwitcherEventResponse *v4;
  void *v5;
  SBUpdateLayoutSwitcherEventResponse *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  SBOverrideAppLayoutsSwitcherModifier *v12;
  _QWORD v14[6];
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SBWindowDeclineSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v15, sel_transitionWillBegin);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
  SBAppendSwitcherModifierResponse(v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 2, 2);
  SBAppendSwitcherModifierResponse(v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBWindowDeclineSwitcherModifier appLayouts](self, "appLayouts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  if (self->_fullScreenAppLayout)
  {
    v10 = objc_msgSend(v9, "indexOfObject:");
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = objc_msgSend(v9, "indexOfObject:", self->_fromAppLayout);
      if (v11 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_9;
    }
    else
    {
      v11 = v10;
      objc_msgSend(v9, "replaceObjectAtIndex:withObject:", v10, self->_fromAppLayout);
    }
  }
  else
  {
    v11 = objc_msgSend(v9, "indexOfObject:", self->_centerWindowAppLayout);
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v9, "insertObject:atIndex:", self->_centerWindowAppLayout, 0);
      v11 = 0;
    }
  }
  v12 = -[SBOverrideAppLayoutsSwitcherModifier initWithAppLayouts:]([SBOverrideAppLayoutsSwitcherModifier alloc], "initWithAppLayouts:", v9);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __54__SBWindowDeclineSwitcherModifier_transitionWillBegin__block_invoke;
  v14[3] = &unk_1E8E9DE88;
  v14[4] = self;
  v14[5] = v11;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", v12, v14);

LABEL_9:
  return v7;
}

id __54__SBWindowDeclineSwitcherModifier_transitionWillBegin__block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  id result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v16;
  objc_super v17;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = (_QWORD *)(*(_QWORD *)(a1 + 32) + 168);
  v17.receiver = *(id *)(a1 + 32);
  v17.super_class = (Class)SBWindowDeclineSwitcherModifier;
  objc_msgSendSuper2(&v17, sel_frameForIndex_, v2);
  *v3 = v4;
  v3[1] = v5;
  v3[2] = v6;
  v3[3] = v7;
  v9 = *(_QWORD **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v10 = v9 + 25;
  v16.receiver = v9;
  v16.super_class = (Class)SBWindowDeclineSwitcherModifier;
  result = objc_msgSendSuper2(&v16, sel_cornerRadiiForIndex_, v8);
  *v10 = v12;
  v10[1] = v13;
  v10[2] = v14;
  v10[3] = v15;
  return result;
}

- (id)appLayoutContainingAppLayout:(id)a3
{
  id v4;
  SBAppLayout **p_fromAppLayout;
  SBAppLayout *v6;
  SBAppLayout *v7;
  objc_super v9;

  v4 = a3;
  if (-[SBWindowDeclineSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled")
    && objc_msgSend(v4, "isEqual:", self->_centerWindowAppLayout))
  {
    if (-[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase") < 2
      || (p_fromAppLayout = &self->_fullScreenAppLayout,
          !-[SBAppLayout containsAnyItemFromAppLayout:](self->_fullScreenAppLayout, "containsAnyItemFromAppLayout:", self->_centerWindowAppLayout)))
    {
      p_fromAppLayout = &self->_fromAppLayout;
    }
    v6 = *p_fromAppLayout;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBWindowDeclineSwitcherModifier;
    -[SBWindowDeclineSwitcherModifier appLayoutContainingAppLayout:](&v9, sel_appLayoutContainingAppLayout_, v4);
    v6 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip:(id)a3
{
  id v4;
  id v5;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  SBOverrideAppLayoutsSwitcherModifier *v11;
  objc_super v12;
  _QWORD v13[4];
  id v14;
  SBWindowDeclineSwitcherModifier *v15;
  uint64_t *v16;
  _QWORD v17[5];
  objc_super v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  if (-[SBWindowDeclineSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled")
    && -[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase") >= 2
    && !self->_fullScreenAppLayout
    && (-[SBWindowDeclineSwitcherModifier appLayoutOnStage](self, "appLayoutOnStage"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__26;
    v23 = __Block_byref_object_dispose__26;
    v24 = 0;
    v18.receiver = self;
    v18.super_class = (Class)SBWindowDeclineSwitcherModifier;
    -[SBWindowDeclineSwitcherModifier appLayouts](&v18, sel_appLayouts);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __108__SBWindowDeclineSwitcherModifier_adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip___block_invoke;
    v17[3] = &unk_1E8E9DF78;
    v17[4] = self;
    objc_msgSend(v8, "bs_filter:", v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[SBOverrideAppLayoutsSwitcherModifier initWithAppLayouts:]([SBOverrideAppLayoutsSwitcherModifier alloc], "initWithAppLayouts:", v10);
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __108__SBWindowDeclineSwitcherModifier_adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip___block_invoke_2;
    v13[3] = &unk_1E8E9FD30;
    v16 = &v19;
    v14 = v4;
    v15 = self;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", v11, v13);
    v5 = (id)v20[5];

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBWindowDeclineSwitcherModifier;
    -[SBWindowDeclineSwitcherModifier adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip:](&v12, sel_adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip_, v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

uint64_t __108__SBWindowDeclineSwitcherModifier_adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if ((objc_msgSend(v3, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152)) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "appLayoutOnStage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqual:", v5) ^ 1;

  }
  return v4;
}

void __108__SBWindowDeclineSwitcherModifier_adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  v2 = *(_QWORD *)(a1 + 32);
  v6.receiver = *(id *)(a1 + 40);
  v6.super_class = (Class)SBWindowDeclineSwitcherModifier;
  objc_msgSendSuper2(&v6, sel_adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip_, v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)appLayoutsToEnsureExistForMainTransitionEvent:(id)a3
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBWindowDeclineSwitcherModifier;
  -[SBWindowDeclineSwitcherModifier appLayoutsToEnsureExistForMainTransitionEvent:](&v7, sel_appLayoutsToEnsureExistForMainTransitionEvent_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sb_arrayByAddingOrMovingObject:", self->_centerWindowAppLayout);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  SBAppLayout *v4;
  void *v5;
  void *v6;
  SBAppLayout *centerWindowAppLayout;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBWindowDeclineSwitcherModifier;
  v4 = (SBAppLayout *)a3;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v12, sel_animationAttributesForLayoutElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy", v12.receiver, v12.super_class);

  centerWindowAppLayout = self->_centerWindowAppLayout;
  if (centerWindowAppLayout == v4)
  {
    -[SBWindowDeclineSwitcherModifier entityRemovalSettings](self, "entityRemovalSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dosidoDeclineIntentAnimationSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fromViewSlideOutAnimationSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLayoutSettings:", v10);

  }
  return v6;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  SBAppLayout *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  objc_super v12;

  v6 = (SBAppLayout *)a4;
  if (self->_fullScreenAppLayout == v6 && -[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout"))
  {
    -[SBWindowDeclineSwitcherModifier medusaSettings](self, "medusaSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "defaultDimmingOpacity");
    v9 = v8;

  }
  else if (self->_centerWindowAppLayout == v6)
  {
    v9 = 0.0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBWindowDeclineSwitcherModifier;
    -[SBWindowDeclineSwitcherModifier dimmingAlphaForLayoutRole:inAppLayout:](&v12, sel_dimmingAlphaForLayoutRole_inAppLayout_, a3, v6);
    v9 = v10;
  }

  return v9;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  void *v5;
  SBAppLayout *v6;
  double v7;
  CGFloat x;
  double v9;
  double y;
  double v11;
  CGFloat width;
  double v13;
  CGFloat height;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  objc_super v26;
  CGRect v27;
  CGRect result;

  -[SBWindowDeclineSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

  if (v6 == self->_centerWindowAppLayout)
  {
    x = self->_initialFrame.origin.x;
    y = self->_initialFrame.origin.y;
    width = self->_initialFrame.size.width;
    height = self->_initialFrame.size.height;
    if (-[SBTransitionSwitcherModifier isUpdatingLayout](self, "isUpdatingLayout"))
    {
      v27.origin.x = x;
      v27.origin.y = y;
      v27.size.width = width;
      v27.size.height = height;
      v15 = CGRectGetHeight(v27);
      -[SBWindowDeclineSwitcherModifier scaleForIndex:](self, "scaleForIndex:", a3);
      v17 = v15 * v16;
      -[SBWindowDeclineSwitcherModifier entityRemovalSettings](self, "entityRemovalSettings");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "dosidoDeclineIntentAnimationSettings");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "fromViewSlideOutHeightOffsetMultiplier");
      v21 = v17 * v20;

      y = y + v21;
    }
  }
  else
  {
    v26.receiver = self;
    v26.super_class = (Class)SBWindowDeclineSwitcherModifier;
    -[SBWindowDeclineSwitcherModifier frameForIndex:](&v26, sel_frameForIndex_, a3);
    x = v7;
    y = v9;
    width = v11;
    height = v13;
  }

  v22 = x;
  v23 = y;
  v24 = width;
  v25 = height;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  SBAppLayout *v11;
  SBAppLayout *v12;
  void *v13;
  void *v14;
  int v15;
  int64_t layoutRole;
  SBAppLayout *fromAppLayout;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  objc_super v34;
  objc_super v35;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = (SBAppLayout *)a4;
  v12 = v11;
  if (self->_centerWindowAppLayout == v11
    && (-[SBAppLayout itemForLayoutRole:](v11, "itemForLayoutRole:", a3),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        -[SBAppLayout itemForLayoutRole:](self->_fromAppLayout, "itemForLayoutRole:", self->_layoutRole),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v13, "isEqual:", v14),
        v14,
        v13,
        v15))
  {
    layoutRole = self->_layoutRole;
    fromAppLayout = self->_fromAppLayout;
    SBRectWithSize();
    -[SBWindowDeclineSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v35, sel_frameForLayoutRole_inAppLayout_withBounds_, layoutRole, fromAppLayout, v18, v19, v20, v21, v34.receiver, v34.super_class, self, SBWindowDeclineSwitcherModifier);
  }
  else
  {
    -[SBWindowDeclineSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v34, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v12, x, y, width, height, self, SBWindowDeclineSwitcherModifier, v35.receiver, v35.super_class);
  }
  v26 = v22;
  v27 = v23;
  v28 = v24;
  v29 = v25;

  v30 = v26;
  v31 = v27;
  v32 = v28;
  v33 = v29;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (CGPoint)anchorPointForIndex:(unint64_t)a3
{
  void *v5;
  SBAppLayout *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGPoint result;

  -[SBWindowDeclineSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

  if (v6 == self->_centerWindowAppLayout)
  {
    v8 = 0.5;
    v10 = 0.5;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SBWindowDeclineSwitcherModifier;
    -[SBWindowDeclineSwitcherModifier anchorPointForIndex:](&v13, sel_anchorPointForIndex_, a3);
    v8 = v7;
    v10 = v9;
  }

  v11 = v8;
  v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  SBAppLayout *v8;
  double v9;
  double v10;
  objc_super v12;

  v8 = (SBAppLayout *)a4;
  if (self->_centerWindowAppLayout != v8
    || (v9 = 1.0, !-[SBTransitionSwitcherModifier isUpdatingLayout](self, "isUpdatingLayout")))
  {
    if (self->_fullScreenAppLayout == v8)
    {
      v9 = 1.0;
    }
    else
    {
      v12.receiver = self;
      v12.super_class = (Class)SBWindowDeclineSwitcherModifier;
      -[SBWindowDeclineSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](&v12, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, v8, a5);
      v9 = v10;
    }
  }

  return v9;
}

- (double)titleAndIconOpacityForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  objc_super v10;

  -[SBWindowDeclineSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0.0;
  if ((objc_msgSend(v6, "isEqual:", self->_centerWindowAppLayout) & 1) == 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)SBWindowDeclineSwitcherModifier;
    -[SBWindowDeclineSwitcherModifier titleAndIconOpacityForIndex:](&v10, sel_titleAndIconOpacityForIndex_, a3);
    v7 = v8;
  }

  return v7;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  double topLeft;
  double bottomLeft;
  double bottomRight;
  double topRight;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;
  UIRectCornerRadii result;

  -[SBWindowDeclineSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isEqual:", self->_centerWindowAppLayout))
  {
    topLeft = self->_initialCornerRadii.topLeft;
    bottomLeft = self->_initialCornerRadii.bottomLeft;
    bottomRight = self->_initialCornerRadii.bottomRight;
    topRight = self->_initialCornerRadii.topRight;
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)SBWindowDeclineSwitcherModifier;
    -[SBWindowDeclineSwitcherModifier cornerRadiiForIndex:](&v19, sel_cornerRadiiForIndex_, a3);
    topLeft = v11;
    bottomLeft = v12;
    bottomRight = v13;
    topRight = v14;
  }

  v15 = topLeft;
  v16 = bottomLeft;
  v17 = bottomRight;
  v18 = topRight;
  result.topRight = v18;
  result.bottomRight = v17;
  result.bottomLeft = v16;
  result.topLeft = v15;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  void *v5;
  SBAppLayout *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  -[SBWindowDeclineSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

  if (v6 == self->_centerWindowAppLayout && -[SBTransitionSwitcherModifier isUpdatingLayout](self, "isUpdatingLayout"))
  {
    -[SBWindowDeclineSwitcherModifier entityRemovalSettings](self, "entityRemovalSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dosidoDeleteIntentAnimationSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fromViewFinalScale");
    v10 = v9;

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SBWindowDeclineSwitcherModifier;
    -[SBWindowDeclineSwitcherModifier scaleForIndex:](&v13, sel_scaleForIndex_, a3);
    v10 = v11;
  }

  return v10;
}

- (id)topMostLayoutElements
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBWindowDeclineSwitcherModifier;
  -[SBWindowDeclineSwitcherModifier topMostLayoutElements](&v9, sel_topMostLayoutElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = v6;

  objc_msgSend(v7, "removeObject:", self->_centerWindowAppLayout);
  objc_msgSend(v7, "insertObject:atIndex:", self->_centerWindowAppLayout, 0);
  return v7;
}

- (id)visibleAppLayouts
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBWindowDeclineSwitcherModifier;
  -[SBWindowDeclineSwitcherModifier visibleAppLayouts](&v6, sel_visibleAppLayouts);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (self->_centerWindowAppLayout)
    objc_msgSend(v4, "addObject:");
  if (self->_fullScreenAppLayout)
    objc_msgSend(v4, "addObject:");
  return v4;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(0, 0);
}

- (double)perspectiveAngleForAppLayout:(id)a3
{
  id v4;
  double v5;
  double v6;
  objc_super v8;

  v4 = a3;
  v5 = 0.0;
  if ((objc_msgSend(v4, "isEqual:", self->_centerWindowAppLayout) & 1) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)SBWindowDeclineSwitcherModifier;
    -[SBWindowDeclineSwitcherModifier perspectiveAngleForAppLayout:](&v8, sel_perspectiveAngleForAppLayout_, v4);
    v5 = v6;
  }

  return v5;
}

- (SBSwitcherWallpaperGradientAttributes)wallpaperGradientAttributesForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  double Empty;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  SBSwitcherWallpaperGradientAttributes result;

  -[SBWindowDeclineSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isEqual:", self->_centerWindowAppLayout))
  {
    Empty = SBSwitcherWallpaperGradientAttributesMakeEmpty();
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SBWindowDeclineSwitcherModifier;
    -[SBWindowDeclineSwitcherModifier wallpaperGradientAttributesForIndex:](&v13, sel_wallpaperGradientAttributesForIndex_, a3);
  }
  v9 = Empty;
  v10 = v8;

  v11 = v9;
  v12 = v10;
  result.trailingAlpha = v12;
  result.leadingAlpha = v11;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullScreenAppLayout, 0);
  objc_storeStrong((id *)&self->_centerWindowAppLayout, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
}

@end
