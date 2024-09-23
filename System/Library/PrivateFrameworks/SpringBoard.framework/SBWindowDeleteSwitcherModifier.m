@implementation SBWindowDeleteSwitcherModifier

- (SBWindowDeleteSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 layoutRole:(int64_t)a5
{
  id v9;
  SBWindowDeleteSwitcherModifier *v10;
  SBWindowDeleteSwitcherModifier *v11;
  uint64_t v12;
  SBAppLayout *centerWindowAppLayout;
  SBWindowDeleteSwitcherModifier *v14;
  uint64_t v15;
  SBAppLayout *fullScreenAppLayout;
  void *v17;
  _QWORD v19[4];
  SBWindowDeleteSwitcherModifier *v20;
  objc_super v21;

  v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)SBWindowDeleteSwitcherModifier;
  v10 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v21, sel_initWithTransitionID_, a3);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_fromAppLayout, a4);
    v11->_layoutRole = a5;
    objc_msgSend(v9, "leafAppLayoutForRole:", a5);
    v12 = objc_claimAutoreleasedReturnValue();
    centerWindowAppLayout = v11->_centerWindowAppLayout;
    v11->_centerWindowAppLayout = (SBAppLayout *)v12;

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __80__SBWindowDeleteSwitcherModifier_initWithTransitionID_fromAppLayout_layoutRole___block_invoke;
    v19[3] = &unk_1E8E9DF50;
    v14 = v11;
    v20 = v14;
    objc_msgSend(v9, "appLayoutWithItemsPassingTest:", v19);
    v15 = objc_claimAutoreleasedReturnValue();
    fullScreenAppLayout = v14->_fullScreenAppLayout;
    v14->_fullScreenAppLayout = (SBAppLayout *)v15;

    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14->_supportsGroupOpacity = objc_msgSend(v17, "sbf_animatedBlurRadiusGraphicsQuality") == 100;

  }
  return v11;
}

uint64_t __80__SBWindowDeleteSwitcherModifier_initWithTransitionID_fromAppLayout_layoutRole___block_invoke(uint64_t a1, void *a2)
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
  v15.super_class = (Class)SBWindowDeleteSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v15, sel_transitionWillBegin);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
  SBAppendSwitcherModifierResponse(v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 2, 2);
  SBAppendSwitcherModifierResponse(v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBWindowDeleteSwitcherModifier appLayouts](self, "appLayouts");
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
  v14[2] = __53__SBWindowDeleteSwitcherModifier_transitionWillBegin__block_invoke;
  v14[3] = &unk_1E8E9DE88;
  v14[4] = self;
  v14[5] = v11;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", v12, v14);

LABEL_9:
  return v7;
}

id __53__SBWindowDeleteSwitcherModifier_transitionWillBegin__block_invoke(uint64_t a1)
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
  v17.super_class = (Class)SBWindowDeleteSwitcherModifier;
  objc_msgSendSuper2(&v17, sel_frameForIndex_, v2);
  *v3 = v4;
  v3[1] = v5;
  v3[2] = v6;
  v3[3] = v7;
  v9 = *(_QWORD **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v10 = v9 + 25;
  v16.receiver = v9;
  v16.super_class = (Class)SBWindowDeleteSwitcherModifier;
  result = objc_msgSendSuper2(&v16, sel_cornerRadiiForIndex_, v8);
  *v10 = v12;
  v10[1] = v13;
  v10[2] = v14;
  v10[3] = v15;
  return result;
}

- (id)transitionWillUpdate
{
  void *v3;
  SBBlurItemContainerSwitcherEventResponse *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBWindowDeleteSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillUpdate](&v7, sel_transitionWillUpdate);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBBlurItemContainerSwitcherEventResponse initWithAppLayout:shouldBlur:animationUpdateMode:]([SBBlurItemContainerSwitcherEventResponse alloc], "initWithAppLayout:shouldBlur:animationUpdateMode:", self->_centerWindowAppLayout, 1, 3);
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)transitionDidEnd
{
  void *v3;
  SBBlurItemContainerSwitcherEventResponse *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBWindowDeleteSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionDidEnd](&v7, sel_transitionDidEnd);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBBlurItemContainerSwitcherEventResponse initWithAppLayout:shouldBlur:animationUpdateMode:]([SBBlurItemContainerSwitcherEventResponse alloc], "initWithAppLayout:shouldBlur:animationUpdateMode:", self->_centerWindowAppLayout, 0, 2);
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)appLayoutContainingAppLayout:(id)a3
{
  id v4;
  SBAppLayout **p_fromAppLayout;
  SBAppLayout *v6;
  SBAppLayout *v7;
  objc_super v9;

  v4 = a3;
  if (-[SBWindowDeleteSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled")
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
    v9.super_class = (Class)SBWindowDeleteSwitcherModifier;
    -[SBWindowDeleteSwitcherModifier appLayoutContainingAppLayout:](&v9, sel_appLayoutContainingAppLayout_, v4);
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
  SBWindowDeleteSwitcherModifier *v15;
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
  if (-[SBWindowDeleteSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled")
    && -[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase") >= 2
    && !self->_fullScreenAppLayout
    && (-[SBWindowDeleteSwitcherModifier appLayoutOnStage](self, "appLayoutOnStage"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__108;
    v23 = __Block_byref_object_dispose__108;
    v24 = 0;
    v18.receiver = self;
    v18.super_class = (Class)SBWindowDeleteSwitcherModifier;
    -[SBWindowDeleteSwitcherModifier appLayouts](&v18, sel_appLayouts);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __107__SBWindowDeleteSwitcherModifier_adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip___block_invoke;
    v17[3] = &unk_1E8E9DF78;
    v17[4] = self;
    objc_msgSend(v8, "bs_filter:", v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[SBOverrideAppLayoutsSwitcherModifier initWithAppLayouts:]([SBOverrideAppLayoutsSwitcherModifier alloc], "initWithAppLayouts:", v10);
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __107__SBWindowDeleteSwitcherModifier_adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip___block_invoke_2;
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
    v12.super_class = (Class)SBWindowDeleteSwitcherModifier;
    -[SBWindowDeleteSwitcherModifier adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip:](&v12, sel_adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip_, v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

uint64_t __107__SBWindowDeleteSwitcherModifier_adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip___block_invoke(uint64_t a1, void *a2)
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

void __107__SBWindowDeleteSwitcherModifier_adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  v2 = *(_QWORD *)(a1 + 32);
  v6.receiver = *(id *)(a1 + 40);
  v6.super_class = (Class)SBWindowDeleteSwitcherModifier;
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
  v7.super_class = (Class)SBWindowDeleteSwitcherModifier;
  -[SBWindowDeleteSwitcherModifier appLayoutsToEnsureExistForMainTransitionEvent:](&v7, sel_appLayoutsToEnsureExistForMainTransitionEvent_, a3);
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
  v12.super_class = (Class)SBWindowDeleteSwitcherModifier;
  v4 = (SBAppLayout *)a3;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v12, sel_animationAttributesForLayoutElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy", v12.receiver, v12.super_class);

  centerWindowAppLayout = self->_centerWindowAppLayout;
  if (centerWindowAppLayout == v4)
  {
    -[SBWindowDeleteSwitcherModifier entityRemovalSettings](self, "entityRemovalSettings");
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
    -[SBWindowDeleteSwitcherModifier medusaSettings](self, "medusaSettings");
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
    v12.super_class = (Class)SBWindowDeleteSwitcherModifier;
    -[SBWindowDeleteSwitcherModifier dimmingAlphaForLayoutRole:inAppLayout:](&v12, sel_dimmingAlphaForLayoutRole_inAppLayout_, a3, v6);
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
  CGFloat y;
  double v11;
  CGFloat width;
  double v13;
  CGFloat height;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  objc_super v28;
  CGRect result;

  -[SBWindowDeleteSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

  if (v6 == self->_centerWindowAppLayout)
  {
    if (self->_usePageFullScreenCenterWindowDeletion)
    {
      -[SBAppLayout centerItem](self->_fromAppLayout, "centerItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        -[SBWindowDeleteSwitcherModifier sourceLeafAppLayoutForCenterItem:](self, "sourceLeafAppLayoutForCenterItem:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "allItems");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "firstObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        -[SBWindowDeleteSwitcherModifier appLayoutContainingAppLayout:](self, "appLayoutContainingAppLayout:", v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v18)
          v21 = v19 == 0;
        else
          v21 = 1;
        if (!v21)
        {
          -[SBWindowDeleteSwitcherModifier _centerOfCenterPageFullScreenAssociatedSourceDisplayItem:appLayout:](self, "_centerOfCenterPageFullScreenAssociatedSourceDisplayItem:appLayout:", v18, v19);
          x = v22;
          y = v23;
          width = self->_initialFrame.size.width;
          height = self->_initialFrame.size.height;

          goto LABEL_13;
        }

      }
    }
    x = self->_initialFrame.origin.x;
    y = self->_initialFrame.origin.y;
    width = self->_initialFrame.size.width;
    height = self->_initialFrame.size.height;
    goto LABEL_13;
  }
  v28.receiver = self;
  v28.super_class = (Class)SBWindowDeleteSwitcherModifier;
  -[SBWindowDeleteSwitcherModifier frameForIndex:](&v28, sel_frameForIndex_, a3);
  x = v7;
  y = v9;
  width = v11;
  height = v13;
LABEL_13:

  v24 = x;
  v25 = y;
  v26 = width;
  v27 = height;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (CGPoint)_centerOfCenterPageFullScreenAssociatedSourceDisplayItem:(id)a3 appLayout:(id)a4
{
  CGRect *p_initialFrame;
  double y;
  double height;
  double v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  p_initialFrame = &self->_initialFrame;
  y = self->_initialFrame.origin.y;
  height = self->_initialFrame.size.height;
  v8 = (self->_initialFrame.origin.x + self->_initialFrame.size.width * 0.5) / self->_initialFrame.size.width;
  v9 = a4;
  v10 = a3;
  v11 = objc_msgSend(v9, "configuration");
  v12 = objc_msgSend(v9, "layoutRoleForItem:", v10);

  switch(v11)
  {
    case 2:
      if (v12 == 1)
        v13 = -0.33;
      else
        v13 = 0.17;
      goto LABEL_13;
    case 4:
      if (v12 == 1)
        v13 = -0.17;
      else
        v13 = 0.33;
      goto LABEL_13;
    case 3:
      if (v12 == 1)
        v13 = -0.25;
      else
        v13 = 0.25;
LABEL_13:
      v8 = v8 + p_initialFrame->size.width * v13;
      break;
  }
  v14 = (y + height * 0.5) / height;
  v15 = v8;
  result.y = v14;
  result.x = v15;
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
    -[SBWindowDeleteSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v35, sel_frameForLayoutRole_inAppLayout_withBounds_, layoutRole, fromAppLayout, v18, v19, v20, v21, v34.receiver, v34.super_class, self, SBWindowDeleteSwitcherModifier);
  }
  else
  {
    -[SBWindowDeleteSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v34, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v12, x, y, width, height, self, SBWindowDeleteSwitcherModifier, v35.receiver, v35.super_class);
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

  -[SBWindowDeleteSwitcherModifier appLayouts](self, "appLayouts");
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
    v13.super_class = (Class)SBWindowDeleteSwitcherModifier;
    -[SBWindowDeleteSwitcherModifier anchorPointForIndex:](&v13, sel_anchorPointForIndex_, a3);
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
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  objc_super v15;

  v8 = (SBAppLayout *)a4;
  if (self->_centerWindowAppLayout == v8 && -[SBTransitionSwitcherModifier isUpdatingLayout](self, "isUpdatingLayout"))
  {
    -[SBWindowDeleteSwitcherModifier entityRemovalSettings](self, "entityRemovalSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dosidoDeleteIntentAnimationSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fromViewFinalAlpha");
    v12 = v11;

  }
  else if (self->_fullScreenAppLayout == v8)
  {
    v12 = 1.0;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)SBWindowDeleteSwitcherModifier;
    -[SBWindowDeleteSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](&v15, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, v8, a5);
    v12 = v13;
  }

  return v12;
}

- (BOOL)shouldAllowGroupOpacityForAppLayout:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if (objc_msgSend(v4, "isEqual:", self->_centerWindowAppLayout) && self->_supportsGroupOpacity)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBWindowDeleteSwitcherModifier;
    v5 = -[SBWindowDeleteSwitcherModifier shouldAllowGroupOpacityForAppLayout:](&v7, sel_shouldAllowGroupOpacityForAppLayout_, v4);
  }

  return v5;
}

- (double)titleAndIconOpacityForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  objc_super v10;

  -[SBWindowDeleteSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0.0;
  if ((objc_msgSend(v6, "isEqual:", self->_centerWindowAppLayout) & 1) == 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)SBWindowDeleteSwitcherModifier;
    -[SBWindowDeleteSwitcherModifier titleAndIconOpacityForIndex:](&v10, sel_titleAndIconOpacityForIndex_, a3);
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

  -[SBWindowDeleteSwitcherModifier appLayouts](self, "appLayouts");
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
    v19.super_class = (Class)SBWindowDeleteSwitcherModifier;
    -[SBWindowDeleteSwitcherModifier cornerRadiiForIndex:](&v19, sel_cornerRadiiForIndex_, a3);
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
  double v7;
  double v8;
  void *v10;
  void *v11;
  double v12;
  objc_super v13;

  -[SBWindowDeleteSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

  if (v6 == self->_centerWindowAppLayout && -[SBTransitionSwitcherModifier isUpdatingLayout](self, "isUpdatingLayout"))
  {
    if ((-[SBWindowDeleteSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled") & 1) != 0)
    {
      v7 = 0.8;
    }
    else
    {
      v7 = 0.0;
      if (-[SBAppLayout centerConfiguration](v6, "centerConfiguration") != 2)
      {
        -[SBWindowDeleteSwitcherModifier entityRemovalSettings](self, "entityRemovalSettings");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "dosidoDeleteIntentAnimationSettings");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "fromViewFinalScale");
        v7 = v12;

      }
    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SBWindowDeleteSwitcherModifier;
    -[SBWindowDeleteSwitcherModifier scaleForIndex:](&v13, sel_scaleForIndex_, a3);
    v7 = v8;
  }

  return v7;
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
  v9.super_class = (Class)SBWindowDeleteSwitcherModifier;
  -[SBWindowDeleteSwitcherModifier topMostLayoutElements](&v9, sel_topMostLayoutElements);
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
  v6.super_class = (Class)SBWindowDeleteSwitcherModifier;
  -[SBWindowDeleteSwitcherModifier visibleAppLayouts](&v6, sel_visibleAppLayouts);
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
    v8.super_class = (Class)SBWindowDeleteSwitcherModifier;
    -[SBWindowDeleteSwitcherModifier perspectiveAngleForAppLayout:](&v8, sel_perspectiveAngleForAppLayout_, v4);
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

  -[SBWindowDeleteSwitcherModifier appLayouts](self, "appLayouts");
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
    v13.super_class = (Class)SBWindowDeleteSwitcherModifier;
    -[SBWindowDeleteSwitcherModifier wallpaperGradientAttributesForIndex:](&v13, sel_wallpaperGradientAttributesForIndex_, a3);
  }
  v9 = Empty;
  v10 = v8;

  v11 = v9;
  v12 = v10;
  result.trailingAlpha = v12;
  result.leadingAlpha = v11;
  return result;
}

- (BOOL)isSwitcherWindowVisible
{
  return 1;
}

- (BOOL)usePageFullScreenCenterWindowDeletion
{
  return self->_usePageFullScreenCenterWindowDeletion;
}

- (void)setUsePageFullScreenCenterWindowDeletion:(BOOL)a3
{
  self->_usePageFullScreenCenterWindowDeletion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullScreenAppLayout, 0);
  objc_storeStrong((id *)&self->_centerWindowAppLayout, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
}

@end
