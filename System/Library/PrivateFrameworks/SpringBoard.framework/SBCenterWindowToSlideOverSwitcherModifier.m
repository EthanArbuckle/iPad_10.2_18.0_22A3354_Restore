@implementation SBCenterWindowToSlideOverSwitcherModifier

- (SBCenterWindowToSlideOverSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5 fromFloatingAppLayout:(id)a6 toFloatingAppLayout:(id)a7 toFloatingConfiguration:(int64_t)a8 direction:(unint64_t)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  SBCenterWindowToSlideOverSwitcherModifier *v20;
  SBCenterWindowToSlideOverSwitcherModifier *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  SBAppLayout *v25;
  SBCenterWindowToSlideOverSwitcherModifier *v26;
  uint64_t v27;
  SBAppLayout *fullScreenWithoutCenterAppLayout;
  uint64_t v29;
  SBAppLayout *outgoingCenterWindowAppLayout;
  uint64_t v31;
  SBAppLayout *movingAppLayout;
  id *p_movingAppLayout;
  id v34;
  void *v36;
  void *v37;
  id v38;
  _QWORD v39[4];
  SBCenterWindowToSlideOverSwitcherModifier *v40;
  objc_super v41;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v38 = a7;
  if (v17)
  {
    if (v18)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCenterWindowToSlideOverSwitcherModifier.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromAppLayout"));

    if (v18)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCenterWindowToSlideOverSwitcherModifier.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toAppLayout"));

LABEL_3:
  v41.receiver = self;
  v41.super_class = (Class)SBCenterWindowToSlideOverSwitcherModifier;
  v20 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v41, sel_initWithTransitionID_, v16);
  v21 = v20;
  if (v20)
  {
    if (a9 == 1)
      v22 = v18;
    else
      v22 = v17;
    objc_storeStrong((id *)&v20->_fullScreenWithCenterAppLayout, v22);
    v21->_floatingConfiguration = a8;
    if (a9 != 1)
    {
      if (!v19 || a9)
      {
        v21->_kind = 0;
        if (a9)
          goto LABEL_17;
        p_movingAppLayout = (id *)&v21->_movingAppLayout;
        v34 = a7;
      }
      else
      {
        v21->_kind = 2;
        objc_msgSend(v38, "leafAppLayoutForRole:", 1);
        v31 = objc_claimAutoreleasedReturnValue();
        movingAppLayout = v21->_movingAppLayout;
        v21->_movingAppLayout = (SBAppLayout *)v31;

        objc_storeStrong((id *)&v21->_fullScreenWithoutCenterAppLayout, a5);
        p_movingAppLayout = (id *)&v21->_outgoingFloatingAppLayout;
        v34 = a6;
      }
      objc_storeStrong(p_movingAppLayout, v34);
      goto LABEL_17;
    }
    objc_msgSend(v17, "itemForLayoutRole:", 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      v21->_kind = 1;
      objc_msgSend(v18, "leafAppLayoutForRole:", 4);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v21->_movingAppLayout;
      v21->_movingAppLayout = (SBAppLayout *)v24;

      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __168__SBCenterWindowToSlideOverSwitcherModifier_initWithTransitionID_fromAppLayout_toAppLayout_fromFloatingAppLayout_toFloatingAppLayout_toFloatingConfiguration_direction___block_invoke;
      v39[3] = &unk_1E8E9DF50;
      v26 = v21;
      v40 = v26;
      objc_msgSend(v18, "appLayoutWithItemsPassingTest:", v39);
      v27 = objc_claimAutoreleasedReturnValue();
      fullScreenWithoutCenterAppLayout = v26->_fullScreenWithoutCenterAppLayout;
      v26->_fullScreenWithoutCenterAppLayout = (SBAppLayout *)v27;

      objc_msgSend(v17, "leafAppLayoutForRole:", 4);
      v29 = objc_claimAutoreleasedReturnValue();
      outgoingCenterWindowAppLayout = v26->_outgoingCenterWindowAppLayout;
      v26->_outgoingCenterWindowAppLayout = (SBAppLayout *)v29;

    }
    else
    {
      v21->_kind = 0;
    }
  }
LABEL_17:

  return v21;
}

uint64_t __168__SBCenterWindowToSlideOverSwitcherModifier_initWithTransitionID_fromAppLayout_toAppLayout_fromFloatingAppLayout_toFloatingAppLayout_toFloatingConfiguration_direction___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "containsItem:", a2) ^ 1;
}

- (id)handleSceneReadyEvent:(id)a3
{
  void *v3;
  SBUpdateLayoutSwitcherEventResponse *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBCenterWindowToSlideOverSwitcherModifier;
  -[SBSwitcherModifier handleSceneReadyEvent:](&v7, sel_handleSceneReadyEvent_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 32, 3);
  SBAppendSwitcherModifierResponse(v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)transitionWillBegin
{
  void *v3;
  SBInvalidateAdjustedAppLayoutsSwitcherEventResponse *v4;
  void *v5;
  void *v7;
  void *v8;
  double v9;
  double v10;
  float v11;
  float v12;
  SBTimerEventSwitcherEventResponse *v13;
  SBTimerEventSwitcherEventResponse *v14;
  uint64_t v15;
  uint64_t v16;
  BOOL (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SBCenterWindowToSlideOverSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v21, sel_transitionWillBegin);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_kind)
  {
    v4 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
    SBAppendSwitcherModifierResponse(v4, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_kind == 2 && !self->_isInSecondStageOfDosidoAnimation)
    {
      -[SBCenterWindowToSlideOverSwitcherModifier switcherSettings](self, "switcherSettings");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "floatingSwitcherSettings");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "overshootPullbackDelayOnscreen");
      v10 = v9;

      UIAnimationDragCoefficient();
      v12 = v11;
      objc_initWeak(&location, self);
      v13 = [SBTimerEventSwitcherEventResponse alloc];
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __64__SBCenterWindowToSlideOverSwitcherModifier_transitionWillBegin__block_invoke;
      v18 = &unk_1E8EA3468;
      objc_copyWeak(&v19, &location);
      v14 = -[SBTimerEventSwitcherEventResponse initWithDelay:validator:reason:](v13, "initWithDelay:validator:reason:", &v15, CFSTR("kSBCenterWindowToSlideOverSwitcherModifierDosidoReason"), v10 * v12);
      +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v14, v5, v15, v16, v17, v18);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
    else
    {
      v3 = v5;
    }
  }
  return v3;
}

BOOL __64__SBCenterWindowToSlideOverSwitcherModifier_transitionWillBegin__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _BOOL8 v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "parentModifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)handleTimerEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SBUpdateLayoutSwitcherEventResponse *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBCenterWindowToSlideOverSwitcherModifier;
  v4 = a3;
  -[SBTransitionSwitcherModifier handleTimerEvent:](&v10, sel_handleTimerEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reason", v10.receiver, v10.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v6, "isEqualToString:", CFSTR("kSBCenterWindowToSlideOverSwitcherModifierDosidoReason"));
  if ((_DWORD)v4)
  {
    self->_isInSecondStageOfDosidoAnimation = 1;
    v7 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 30, 3);
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v7, v5);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  return v5;
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBCenterWindowToSlideOverSwitcherModifier;
  -[SBTransitionSwitcherModifier adjustedAppLayoutsForAppLayouts:](&v11, sel_adjustedAppLayoutsForAppLayouts_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (self->_kind == 1)
  {
    v6 = objc_msgSend(v4, "indexOfObjectPassingTest:", &__block_literal_global_242);
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
      v6 = objc_msgSend(v5, "count");
    objc_msgSend(v5, "sb_arrayByInsertingOrMovingObject:toIndex:", self->_movingAppLayout, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "sb_arrayByInsertingOrMovingObject:toIndex:", self->_outgoingCenterWindowAppLayout, v6 + 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "sb_arrayByInsertingOrMovingObject:toIndex:", self->_fullScreenWithoutCenterAppLayout, v6 + 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "sb_arrayByRemovingObject:", self->_fullScreenWithCenterAppLayout);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

BOOL __77__SBCenterWindowToSlideOverSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "environment") == 1;
}

- (id)visibleAppLayouts
{
  void *v3;
  void *v4;
  unint64_t kind;
  int *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBCenterWindowToSlideOverSwitcherModifier;
  -[SBCenterWindowToSlideOverSwitcherModifier visibleAppLayouts](&v8, sel_visibleAppLayouts);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  kind = self->_kind;
  if (kind == 2)
  {
    v6 = &OBJC_IVAR___SBCenterWindowToSlideOverSwitcherModifier__outgoingFloatingAppLayout;
    goto LABEL_5;
  }
  if (kind == 1)
  {
    objc_msgSend(v4, "removeObject:", self->_fullScreenWithCenterAppLayout);
    objc_msgSend(v4, "addObject:", self->_movingAppLayout);
    objc_msgSend(v4, "addObject:", self->_outgoingCenterWindowAppLayout);
    v6 = &OBJC_IVAR___SBCenterWindowToSlideOverSwitcherModifier__fullScreenWithoutCenterAppLayout;
LABEL_5:
    objc_msgSend(v4, "addObject:", *(Class *)((char *)&self->super.super.super.super.isa + *v6));
  }
  return v4;
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
  unint64_t kind;
  void *v14;
  SBAppLayout *v15;
  SBAppLayout *fullScreenWithCenterAppLayout;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  int v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  objc_super v36;
  CGRect result;

  v36.receiver = self;
  v36.super_class = (Class)SBCenterWindowToSlideOverSwitcherModifier;
  -[SBCenterWindowToSlideOverSwitcherModifier frameForIndex:](&v36, sel_frameForIndex_);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  kind = self->_kind;
  if (kind == 2)
  {
    -[SBCenterWindowToSlideOverSwitcherModifier appLayouts](self, "appLayouts");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectAtIndex:", a3);
    v15 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

    if (v15 == self->_outgoingFloatingAppLayout && !self->_isInSecondStageOfDosidoAnimation)
    {
      -[SBCenterWindowToSlideOverSwitcherModifier medusaSettings](self, "medusaSettings");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "switcherSlideOverDosidoLayoutOvershootMultiplicationFactor");
      v28 = v27;
      v29 = v10 * v27;

      v30 = -[SBCenterWindowToSlideOverSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
      v31 = -(v10 * v28);
      if (!v30)
        v31 = v29;
      if (self->_floatingConfiguration == 1)
        v31 = -v31;
      v6 = v6 + v31;
    }
    goto LABEL_13;
  }
  if (kind == 1)
  {
    -[SBCenterWindowToSlideOverSwitcherModifier appLayouts](self, "appLayouts");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndex:", a3);
    v15 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

    if (v15 == self->_outgoingCenterWindowAppLayout || v15 == self->_movingAppLayout)
    {
      fullScreenWithCenterAppLayout = self->_fullScreenWithCenterAppLayout;
      -[SBCenterWindowToSlideOverSwitcherModifier containerViewBounds](self, "containerViewBounds");
      -[SBCenterWindowToSlideOverSwitcherModifier preferredFrameForLayoutRole:inAppLayout:bounds:interfaceOrientation:](self, "preferredFrameForLayoutRole:inAppLayout:bounds:interfaceOrientation:", 4, fullScreenWithCenterAppLayout, -[SBCenterWindowToSlideOverSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation"), v17, v18, v19, v20);
      v6 = v21;
      v8 = v22;
      v10 = v23;
      v12 = v24;
    }
LABEL_13:

  }
  v32 = v6;
  v33 = v8;
  v34 = v10;
  v35 = v12;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = v33;
  result.origin.x = v32;
  return result;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  SBAppLayout *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  objc_super v24;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = (SBAppLayout *)a4;
  v24.receiver = self;
  v24.super_class = (Class)SBCenterWindowToSlideOverSwitcherModifier;
  -[SBCenterWindowToSlideOverSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v24, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v11, x, y, width, height);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  if (self->_kind == 1
    && (self->_outgoingCenterWindowAppLayout == v11
     || self->_movingAppLayout == v11
     || self->_fullScreenWithoutCenterAppLayout == v11))
  {
    v19 = height;
    v17 = width;
    v15 = y;
    v13 = x;
  }

  v20 = v13;
  v21 = v15;
  v22 = v17;
  v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (id)topMostLayoutElements
{
  void *v3;
  void *v4;
  unint64_t kind;
  void *v6;
  void *v7;
  SBAppLayout *outgoingFloatingAppLayout;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBCenterWindowToSlideOverSwitcherModifier;
  -[SBCenterWindowToSlideOverSwitcherModifier topMostLayoutElements](&v12, sel_topMostLayoutElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  kind = self->_kind;
  if (kind == 2)
  {
    if (!self->_isInSecondStageOfDosidoAnimation)
    {
      outgoingFloatingAppLayout = self->_outgoingFloatingAppLayout;
      v9 = 0;
      goto LABEL_6;
    }
  }
  else if (kind == 1)
  {
    objc_msgSend(v3, "sb_arrayByRemovingObject:", self->_fullScreenWithCenterAppLayout);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "sb_arrayByInsertingOrMovingObject:toIndex:", self->_movingAppLayout, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "sb_arrayByInsertingOrMovingObject:toIndex:", self->_outgoingCenterWindowAppLayout, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    outgoingFloatingAppLayout = self->_fullScreenWithoutCenterAppLayout;
    v3 = v4;
    v9 = 2;
LABEL_6:
    objc_msgSend(v3, "sb_arrayByInsertingOrMovingObject:toIndex:", outgoingFloatingAppLayout, v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v10;
  }
  return v4;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  SBAppLayout *v6;
  double v7;
  double v8;
  unint64_t kind;
  void *v10;
  double v11;
  objc_super v13;

  v6 = (SBAppLayout *)a4;
  v13.receiver = self;
  v13.super_class = (Class)SBCenterWindowToSlideOverSwitcherModifier;
  -[SBCenterWindowToSlideOverSwitcherModifier dimmingAlphaForLayoutRole:inAppLayout:](&v13, sel_dimmingAlphaForLayoutRole_inAppLayout_, a3, v6);
  v8 = v7;
  kind = self->_kind;
  if (kind == 2)
  {
    if (self->_outgoingFloatingAppLayout == v6 && self->_isInSecondStageOfDosidoAnimation)
      goto LABEL_8;
  }
  else if (kind == 1 && (self->_fullScreenWithoutCenterAppLayout == v6 || self->_outgoingCenterWindowAppLayout == v6))
  {
LABEL_8:
    -[SBCenterWindowToSlideOverSwitcherModifier medusaSettings](self, "medusaSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "defaultDimmingOpacity");
    v8 = v11;

  }
  return v8;
}

- (double)scaleForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  void *v7;
  SBAppLayout *v8;
  void *v9;
  double v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBCenterWindowToSlideOverSwitcherModifier;
  -[SBCenterWindowToSlideOverSwitcherModifier scaleForIndex:](&v12, sel_scaleForIndex_);
  v6 = v5;
  if (self->_kind == 2)
  {
    -[SBCenterWindowToSlideOverSwitcherModifier appLayouts](self, "appLayouts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", a3);
    v8 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

    if (v8 == self->_outgoingFloatingAppLayout)
    {
      v6 = 1.0;
      if ((-[SBCenterWindowToSlideOverSwitcherModifier isReduceMotionEnabled](self, "isReduceMotionEnabled") & 1) == 0)
      {
        -[SBCenterWindowToSlideOverSwitcherModifier medusaSettings](self, "medusaSettings");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "switcherSlideOverContentPushInScale");
        v6 = v10;

      }
    }

  }
  return v6;
}

- (double)scaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  SBAppLayout *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  objc_super v12;

  v6 = (SBAppLayout *)a4;
  v12.receiver = self;
  v12.super_class = (Class)SBCenterWindowToSlideOverSwitcherModifier;
  -[SBCenterWindowToSlideOverSwitcherModifier scaleForLayoutRole:inAppLayout:](&v12, sel_scaleForLayoutRole_inAppLayout_, a3, v6);
  v8 = v7;
  if (self->_kind == 1 && self->_outgoingCenterWindowAppLayout == v6)
  {
    v8 = 1.0;
    if ((-[SBCenterWindowToSlideOverSwitcherModifier isReduceMotionEnabled](self, "isReduceMotionEnabled") & 1) == 0)
    {
      -[SBCenterWindowToSlideOverSwitcherModifier medusaSettings](self, "medusaSettings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "switcherCenterWindowContentPushInScale");
      v8 = v10;

    }
  }

  return v8;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBCenterWindowToSlideOverSwitcherModifier;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v10, sel_animationAttributesForLayoutElement_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[SBCenterWindowToSlideOverSwitcherModifier switcherSettings](self, "switcherSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "animationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "centerToSlideOverAnimationSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayoutSettings:", v8);

  return v5;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  objc_class *v8;
  double v9;
  double v10;
  unint64_t kind;
  int *v12;
  objc_super v14;

  v8 = (objc_class *)a4;
  v14.receiver = self;
  v14.super_class = (Class)SBCenterWindowToSlideOverSwitcherModifier;
  -[SBCenterWindowToSlideOverSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](&v14, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, v8, a5);
  v10 = v9;
  kind = self->_kind;
  if (kind == 1)
  {
    v12 = &OBJC_IVAR___SBCenterWindowToSlideOverSwitcherModifier__outgoingCenterWindowAppLayout;
  }
  else
  {
    if (kind != 2)
      goto LABEL_7;
    v12 = &OBJC_IVAR___SBCenterWindowToSlideOverSwitcherModifier__outgoingFloatingAppLayout;
  }
  if (*(objc_class **)((char *)&self->super.super.super.super.isa + *v12) == v8)
    v10 = 1.0;
LABEL_7:

  return v10;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  double v6;
  double v7;
  void *v8;
  SBAppLayout *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBCenterWindowToSlideOverSwitcherModifier;
  -[SBCenterWindowToSlideOverSwitcherModifier shadowOpacityForLayoutRole:atIndex:](&v11, sel_shadowOpacityForLayoutRole_atIndex_, a3);
  v7 = v6;
  -[SBCenterWindowToSlideOverSwitcherModifier appLayouts](self, "appLayouts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", a4);
  v9 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

  if (v9 == self->_outgoingCenterWindowAppLayout)
    v7 = 0.0;

  return v7;
}

- (UIRectCornerRadii)cornerRadiiForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withCornerRadii:(UIRectCornerRadii)a5
{
  double topRight;
  double bottomRight;
  double bottomLeft;
  double topLeft;
  SBAppLayout *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  SBAppLayout *fullScreenWithCenterAppLayout;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  objc_super v29;
  objc_super v30;
  UIRectCornerRadii result;

  topRight = a5.topRight;
  bottomRight = a5.bottomRight;
  bottomLeft = a5.bottomLeft;
  topLeft = a5.topLeft;
  v11 = (SBAppLayout *)a4;
  v30.receiver = self;
  v30.super_class = (Class)SBCenterWindowToSlideOverSwitcherModifier;
  -[SBCenterWindowToSlideOverSwitcherModifier cornerRadiiForLayoutRole:inAppLayout:withCornerRadii:](&v30, sel_cornerRadiiForLayoutRole_inAppLayout_withCornerRadii_, a3, v11, topLeft, bottomLeft, bottomRight, topRight);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  if (self->_kind == 1 && (self->_movingAppLayout == v11 || self->_outgoingCenterWindowAppLayout == v11))
  {
    fullScreenWithCenterAppLayout = self->_fullScreenWithCenterAppLayout;
    v29.receiver = self;
    v29.super_class = (Class)SBCenterWindowToSlideOverSwitcherModifier;
    -[SBCenterWindowToSlideOverSwitcherModifier cornerRadiiForLayoutRole:inAppLayout:withCornerRadii:](&v29, sel_cornerRadiiForLayoutRole_inAppLayout_withCornerRadii_, 4, fullScreenWithCenterAppLayout, topLeft, bottomLeft, bottomRight, topRight);
    v13 = v21;
    v15 = v22;
    v17 = v23;
    v19 = v24;
  }

  v25 = v13;
  v26 = v15;
  v27 = v17;
  v28 = v19;
  result.topRight = v28;
  result.bottomRight = v27;
  result.bottomLeft = v26;
  result.topLeft = v25;
  return result;
}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  int v7;
  objc_super v9;

  v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)SBCenterWindowToSlideOverSwitcherModifier;
  LOBYTE(v7) = -[SBCenterWindowToSlideOverSwitcherModifier isLayoutRoleBlurred:inAppLayout:](&v9, sel_isLayoutRoleBlurred_inAppLayout_, a3, v6);
  if (-[SBCenterWindowToSlideOverSwitcherModifier _shouldBlurAndStretchLayoutRole:inAppLayout:](self, "_shouldBlurAndStretchLayoutRole:inAppLayout:", a3, v6))
  {
    v7 = -[SBCenterWindowToSlideOverSwitcherModifier isLayoutRoleContentReady:inAppLayout:](self, "isLayoutRoleContentReady:inAppLayout:", a3, v6) ^ 1;
  }

  return v7;
}

- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBCenterWindowToSlideOverSwitcherModifier;
  v6 = a4;
  -[SBCenterWindowToSlideOverSwitcherModifier blurDelayForLayoutRole:inAppLayout:](&v13, sel_blurDelayForLayoutRole_inAppLayout_, a3, v6);
  v8 = v7;
  LODWORD(a3) = -[SBCenterWindowToSlideOverSwitcherModifier _shouldBlurAndStretchLayoutRole:inAppLayout:](self, "_shouldBlurAndStretchLayoutRole:inAppLayout:", a3, v6, v13.receiver, v13.super_class);

  if ((_DWORD)a3)
  {
    -[SBCenterWindowToSlideOverSwitcherModifier switcherSettings](self, "switcherSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "animationSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resizeBlurDelay");
    v8 = v11;

  }
  return v8;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  unsigned __int8 v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBCenterWindowToSlideOverSwitcherModifier;
  v6 = a4;
  v7 = -[SBCenterWindowToSlideOverSwitcherModifier isLayoutRoleMatchMovedToScene:inAppLayout:](&v9, sel_isLayoutRoleMatchMovedToScene_inAppLayout_, a3, v6);
  LOBYTE(a3) = -[SBCenterWindowToSlideOverSwitcherModifier _shouldBlurAndStretchLayoutRole:inAppLayout:](self, "_shouldBlurAndStretchLayoutRole:inAppLayout:", a3, v6, v9.receiver, v9.super_class);

  return a3 | v7;
}

- (BOOL)wantsSlideOverTongue
{
  return 0;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(0, 0);
}

- (SBSwitcherShelfPresentationAttributes)presentationAttributesForShelf:(SEL)a3
{
  SBSwitcherShelfPresentationAttributes *result;
  objc_super v6;

  retstr->var3 = 0;
  *(_OWORD *)&retstr->var1.origin.y = 0u;
  *(_OWORD *)&retstr->var1.size.height = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  v6.receiver = self;
  v6.super_class = (Class)SBCenterWindowToSlideOverSwitcherModifier;
  result = (SBSwitcherShelfPresentationAttributes *)-[SBSwitcherShelfPresentationAttributes presentationAttributesForShelf:](&v6, sel_presentationAttributesForShelf_, a4);
  retstr->var0 = 0;
  return result;
}

- (BOOL)_shouldBlurAndStretchLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  if (self->_movingAppLayout == a4)
    return 1;
  return self->_fullScreenWithCenterAppLayout == a4 && a3 == 4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outgoingFloatingAppLayout, 0);
  objc_storeStrong((id *)&self->_outgoingCenterWindowAppLayout, 0);
  objc_storeStrong((id *)&self->_fullScreenWithoutCenterAppLayout, 0);
  objc_storeStrong((id *)&self->_movingAppLayout, 0);
  objc_storeStrong((id *)&self->_fullScreenWithCenterAppLayout, 0);
}

@end
