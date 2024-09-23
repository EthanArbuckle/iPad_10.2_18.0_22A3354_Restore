@implementation SBSwapFullScreenAppSidesSwitcherModifier

- (SBSwapFullScreenAppSidesSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5 layoutRoleToKeepOnTop:(int64_t)a6
{
  id v11;
  id v12;
  SBSwapFullScreenAppSidesSwitcherModifier *v13;
  SBSwapFullScreenAppSidesSwitcherModifier *v14;
  objc_super v16;

  v11 = a4;
  v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SBSwapFullScreenAppSidesSwitcherModifier;
  v13 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v16, sel_initWithTransitionID_, a3);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_fromAppLayout, a4);
    objc_storeStrong((id *)&v14->_toAppLayout, a5);
    v14->_layoutRoleToKeepOnTop = a6;
    v14->_animationPhase = 0;
  }

  return v14;
}

- (id)transitionWillBegin
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  SBTimerEventSwitcherEventResponse *v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBSwapFullScreenAppSidesSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v11, sel_transitionWillBegin);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_animationPhase)
  {
    -[SBSwapFullScreenAppSidesSwitcherModifier switcherSettings](self, "switcherSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "animationSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "swapAppSidesShadowFadeOutDelay");
    v7 = v6;

    v8 = -[SBTimerEventSwitcherEventResponse initWithDelay:validator:reason:]([SBTimerEventSwitcherEventResponse alloc], "initWithDelay:validator:reason:", 0, CFSTR("SBSwapFullScreenAppSidesSwitcherModifierTimerEventReason"), v7);
    SBAppendSwitcherModifierResponse(v8, v3);
    v9 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v9;
  }
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
  v10.super_class = (Class)SBSwapFullScreenAppSidesSwitcherModifier;
  v4 = a3;
  -[SBTransitionSwitcherModifier handleTimerEvent:](&v10, sel_handleTimerEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reason", v10.receiver, v10.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v6, "isEqualToString:", CFSTR("SBSwapFullScreenAppSidesSwitcherModifierTimerEventReason"));
  if ((_DWORD)v4)
  {
    self->_animationPhase = 1;
    v7 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 30, 3);
    SBAppendSwitcherModifierResponse(v7, v5);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  return v5;
}

- (id)topMostLayoutRolesForAppLayout:(id)a3
{
  SBAppLayout *v4;
  void *v5;
  SBAppLayout *toAppLayout;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  objc_super v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)SBSwapFullScreenAppSidesSwitcherModifier;
  v4 = (SBAppLayout *)a3;
  -[SBSwapFullScreenAppSidesSwitcherModifier topMostLayoutRolesForAppLayout:](&v12, sel_topMostLayoutRolesForAppLayout_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  toAppLayout = self->_toAppLayout;

  if (toAppLayout == v4)
  {
    if (self->_layoutRoleToKeepOnTop == 1)
      v7 = 2;
    else
      v7 = 1;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7, v12.receiver, v12.super_class);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v5);
    v10 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v10;
  }
  return v5;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  double result;
  objc_super v5;

  result = 1.0;
  if (self->_animationPhase == 1)
  {
    v5.receiver = self;
    v5.super_class = (Class)SBSwapFullScreenAppSidesSwitcherModifier;
    -[SBSwapFullScreenAppSidesSwitcherModifier shadowOpacityForLayoutRole:atIndex:](&v5, sel_shadowOpacityForLayoutRole_atIndex_, a3, a4, 1.0);
  }
  return result;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIRectCornerRadii result;

  -[SBSwapFullScreenAppSidesSwitcherModifier displayCornerRadius](self, "displayCornerRadius", a3);
  v4 = v3;
  v5 = v3;
  v6 = v3;
  result.topRight = v6;
  result.bottomRight = v5;
  result.bottomLeft = v4;
  result.topLeft = v3;
  return result;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBSwapFullScreenAppSidesSwitcherModifier;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v13, sel_animationAttributesForLayoutElement_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[SBSwapFullScreenAppSidesSwitcherModifier switcherSettings](self, "switcherSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "animationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "swapAppSidesLayoutAnimationSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayoutSettings:", v8);

  -[SBSwapFullScreenAppSidesSwitcherModifier switcherSettings](self, "switcherSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "animationSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "swapAppSidesOpacityAnimationSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOpacitySettings:", v11);

  objc_msgSend(v5, "setUpdateMode:", 3);
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toAppLayout, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
}

@end
