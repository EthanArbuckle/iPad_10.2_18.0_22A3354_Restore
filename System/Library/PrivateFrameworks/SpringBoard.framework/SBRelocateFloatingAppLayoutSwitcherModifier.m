@implementation SBRelocateFloatingAppLayoutSwitcherModifier

- (SBRelocateFloatingAppLayoutSwitcherModifier)initWithTransitionID:(id)a3 floatingAppLayout:(id)a4 floatingConfiguration:(int64_t)a5 direction:(int64_t)a6 mixedGridModifier:(id)a7
{
  id v13;
  id v14;
  SBRelocateFloatingAppLayoutSwitcherModifier *v15;
  SBRelocateFloatingAppLayoutSwitcherModifier *v16;
  objc_super v18;

  v13 = a4;
  v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)SBRelocateFloatingAppLayoutSwitcherModifier;
  v15 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v18, sel_initWithTransitionID_, a3);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_floatingAppLayout, a4);
    v16->_floatingConfiguration = a5;
    v16->_direction = a6;
    objc_storeStrong((id *)&v16->_mixedGridModifier, a7);
    v16->_moveFloatingAppToLeadingSide = 0;
  }

  return v16;
}

- (id)transitionWillBegin
{
  void *v3;
  SBUpdateLayoutSwitcherEventResponse *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBRelocateFloatingAppLayoutSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v7, sel_transitionWillBegin);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBRelocateFloatingAppLayoutSwitcherModifier _goingToSwitcherWithLeadingFloatingApp](self, "_goingToSwitcherWithLeadingFloatingApp"))
  {
    v4 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 4, 2);
    SBAppendSwitcherModifierResponse(v4, v3);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  return v3;
}

- (id)transitionWillUpdate
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  SBTimerEventSwitcherEventResponse *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBRelocateFloatingAppLayoutSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillUpdate](&v10, sel_transitionWillUpdate);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBRelocateFloatingAppLayoutSwitcherModifier _comingFromSwitcherWithLeadingFloatingApp](self, "_comingFromSwitcherWithLeadingFloatingApp"))
  {
    -[SBRelocateFloatingAppLayoutSwitcherModifier medusaSettings](self, "medusaSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leadingSlideOverRelocationDelay");
    v6 = v5;

    v7 = -[SBTimerEventSwitcherEventResponse initWithDelay:validator:reason:]([SBTimerEventSwitcherEventResponse alloc], "initWithDelay:validator:reason:", 0, CFSTR("SBRelocateFloatingAppLayoutSwitcherModifierTimerReason"), v6);
    SBAppendSwitcherModifierResponse(v7, v3);
    v8 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v8;
  }
  return v3;
}

- (id)transitionDidEnd
{
  void *v3;
  SBUpdateLayoutSwitcherEventResponse *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBRelocateFloatingAppLayoutSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionDidEnd](&v7, sel_transitionDidEnd);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBRelocateFloatingAppLayoutSwitcherModifier _comingFromSwitcherWithLeadingFloatingApp](self, "_comingFromSwitcherWithLeadingFloatingApp"))
  {
    v4 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 12, 3);
    SBAppendSwitcherModifierResponse(v4, v3);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  return v3;
}

- (id)handleTimerEvent:(id)a3
{
  id v4;
  void *v5;
  SBUpdateLayoutSwitcherEventResponse *v6;
  _BOOL4 v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBRelocateFloatingAppLayoutSwitcherModifier;
  v4 = a3;
  -[SBTransitionSwitcherModifier handleTimerEvent:](&v10, sel_handleTimerEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reason", v10.receiver, v10.super_class);
  v6 = (SBUpdateLayoutSwitcherEventResponse *)objc_claimAutoreleasedReturnValue();

  if (!-[SBUpdateLayoutSwitcherEventResponse isEqualToString:](v6, "isEqualToString:", CFSTR("SBRelocateFloatingAppLayoutSwitcherModifierTimerReason")))goto LABEL_4;
  v7 = -[SBRelocateFloatingAppLayoutSwitcherModifier _comingFromSwitcherWithLeadingFloatingApp](self, "_comingFromSwitcherWithLeadingFloatingApp");

  if (v7)
  {
    self->_moveFloatingAppToLeadingSide = 1;
    v6 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 4, 2);
    SBAppendSwitcherModifierResponse(v6, v5);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
LABEL_4:

  }
  return v5;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  void *v5;
  SBAppLayout *v6;
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
  uint64_t v19;
  SBSwitcherModifier *mixedGridModifier;
  objc_super v21;
  objc_super v22;
  _QWORD v23[7];
  uint64_t v24;
  double *v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  CGRect result;

  -[SBRelocateFloatingAppLayoutSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

  if (v6 != self->_floatingAppLayout)
    goto LABEL_2;
  if (-[SBRelocateFloatingAppLayoutSwitcherModifier _goingToSwitcherWithLeadingFloatingApp](self, "_goingToSwitcherWithLeadingFloatingApp")&& -[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout"))
  {
    v30.receiver = self;
    v30.super_class = (Class)SBRelocateFloatingAppLayoutSwitcherModifier;
    -[SBRelocateFloatingAppLayoutSwitcherModifier floatingApplicationFrameInInterfaceOrientation:floatingConfiguration:](&v30, sel_floatingApplicationFrameInInterfaceOrientation_floatingConfiguration_, -[SBRelocateFloatingAppLayoutSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation"), 4);
    goto LABEL_3;
  }
  if (-[SBRelocateFloatingAppLayoutSwitcherModifier _comingFromSwitcherWithLeadingFloatingApp](self, "_comingFromSwitcherWithLeadingFloatingApp"))
  {
    v19 = -[SBRelocateFloatingAppLayoutSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation");
    if (!self->_moveFloatingAppToLeadingSide)
    {
      v24 = 0;
      v25 = (double *)&v24;
      v26 = 0x4010000000;
      v27 = &unk_1D0FA064E;
      v28 = 0u;
      v29 = 0u;
      mixedGridModifier = self->_mixedGridModifier;
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __61__SBRelocateFloatingAppLayoutSwitcherModifier_frameForIndex___block_invoke;
      v23[3] = &unk_1E8E9FD08;
      v23[4] = self;
      v23[5] = &v24;
      v23[6] = a3;
      -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", mixedGridModifier, v23);
      v11 = v25[4];
      v12 = v25[5];
      v13 = v25[6];
      v14 = v25[7];
      _Block_object_dispose(&v24, 8);
      goto LABEL_4;
    }
    v22.receiver = self;
    v22.super_class = (Class)SBRelocateFloatingAppLayoutSwitcherModifier;
    -[SBRelocateFloatingAppLayoutSwitcherModifier floatingApplicationFrameInInterfaceOrientation:floatingConfiguration:](&v22, sel_floatingApplicationFrameInInterfaceOrientation_floatingConfiguration_, v19, 3);
  }
  else
  {
LABEL_2:
    v21.receiver = self;
    v21.super_class = (Class)SBRelocateFloatingAppLayoutSwitcherModifier;
    -[SBRelocateFloatingAppLayoutSwitcherModifier frameForIndex:](&v21, sel_frameForIndex_, a3);
  }
LABEL_3:
  v11 = v7;
  v12 = v8;
  v13 = v9;
  v14 = v10;
LABEL_4:

  v15 = v11;
  v16 = v12;
  v17 = v13;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

void __61__SBRelocateFloatingAppLayoutSwitcherModifier_frameForIndex___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double Width;
  CGRect v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "frameForIndex:", *(_QWORD *)(a1 + 48));
  v2 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v2[4] = v3;
  v2[5] = v4;
  v2[6] = v5;
  v2[7] = v6;
  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
  {
    Width = -CGRectGetWidth(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "switcherViewBounds");
    Width = CGRectGetWidth(v8);
  }
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = Width;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  SBAppLayout *v8;
  double v9;
  double v10;
  objc_super v12;

  v8 = (SBAppLayout *)a4;
  if (self->_floatingAppLayout == v8
    && -[SBRelocateFloatingAppLayoutSwitcherModifier _comingFromSwitcherWithLeadingFloatingApp](self, "_comingFromSwitcherWithLeadingFloatingApp")&& !self->_moveFloatingAppToLeadingSide)
  {
    if (-[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout"))
      v10 = 1.0;
    else
      v10 = 0.0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBRelocateFloatingAppLayoutSwitcherModifier;
    -[SBRelocateFloatingAppLayoutSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](&v12, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, v8, a5);
    v10 = v9;
  }

  return v10;
}

- (double)scaleForIndex:(unint64_t)a3
{
  void *v5;
  SBAppLayout *v6;
  double v7;
  double v8;
  SBSwitcherModifier *mixedGridModifier;
  objc_super v11;
  _QWORD v12[7];
  uint64_t v13;
  double *v14;
  uint64_t v15;
  uint64_t v16;

  -[SBRelocateFloatingAppLayoutSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

  if (v6 == self->_floatingAppLayout
    && -[SBRelocateFloatingAppLayoutSwitcherModifier _comingFromSwitcherWithLeadingFloatingApp](self, "_comingFromSwitcherWithLeadingFloatingApp")&& !self->_moveFloatingAppToLeadingSide)
  {
    v13 = 0;
    v14 = (double *)&v13;
    v15 = 0x2020000000;
    v16 = 0;
    mixedGridModifier = self->_mixedGridModifier;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __61__SBRelocateFloatingAppLayoutSwitcherModifier_scaleForIndex___block_invoke;
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
    v11.super_class = (Class)SBRelocateFloatingAppLayoutSwitcherModifier;
    -[SBRelocateFloatingAppLayoutSwitcherModifier scaleForIndex:](&v11, sel_scaleForIndex_, a3);
    v8 = v7;
  }

  return v8;
}

uint64_t __61__SBRelocateFloatingAppLayoutSwitcherModifier_scaleForIndex___block_invoke(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1[4] + 160), "scaleForIndex:", a1[6]);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v3;
  return result;
}

- (BOOL)_goingToSwitcherWithLeadingFloatingApp
{
  return self->_direction == 1 && SBFloatingConfigurationIsLeft(self->_floatingConfiguration);
}

- (BOOL)_comingFromSwitcherWithLeadingFloatingApp
{
  return self->_direction == 2 && SBFloatingConfigurationIsLeft(self->_floatingConfiguration);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mixedGridModifier, 0);
  objc_storeStrong((id *)&self->_floatingAppLayout, 0);
}

@end
