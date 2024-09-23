@implementation SBSlideFloatingAppFromBottomSwitcherModifier

- (SBSlideFloatingAppFromBottomSwitcherModifier)initWithTransitionID:(id)a3 fromFloatingAppLayout:(id)a4 toFloatingAppLayout:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  SBSlideFloatingAppFromBottomSwitcherModifier *v13;
  SBSlideFloatingAppFromBottomSwitcherModifier *v14;
  void *v16;
  void *v17;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSlideFloatingAppFromBottomSwitcherModifier.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromFloatingAppLayout"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSlideFloatingAppFromBottomSwitcherModifier.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toFloatingAppLayout"));

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)SBSlideFloatingAppFromBottomSwitcherModifier;
  v13 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v18, sel_initWithTransitionID_, v9);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_fromFloatingAppLayout, a4);
    objc_storeStrong((id *)&v14->_toFloatingAppLayout, a5);
  }

  return v14;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_fromFloatingAppLayout, CFSTR("fromFloatingAppLayout"));
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", self->_toFloatingAppLayout, CFSTR("toFloatingAppLayout"));
  return v4;
}

- (id)transitionWillBegin
{
  void *v2;
  SBUpdateLayoutSwitcherEventResponse *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBSlideFloatingAppFromBottomSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v6, sel_transitionWillBegin);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 2, 2);
  SBAppendSwitcherModifierResponse(v3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)visibleAppLayouts
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBSlideFloatingAppFromBottomSwitcherModifier;
  -[SBSlideFloatingAppFromBottomSwitcherModifier visibleAppLayouts](&v6, sel_visibleAppLayouts);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObject:", self->_toFloatingAppLayout);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

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
  void *v13;
  SBAppLayout *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  objc_super v23;
  CGRect result;

  v23.receiver = self;
  v23.super_class = (Class)SBSlideFloatingAppFromBottomSwitcherModifier;
  -[SBSlideFloatingAppFromBottomSwitcherModifier frameForIndex:](&v23, sel_frameForIndex_);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SBSlideFloatingAppFromBottomSwitcherModifier appLayouts](self, "appLayouts");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndex:", a3);
  v14 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

  if (v14 == self->_toFloatingAppLayout
    && -[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase") == 1)
  {
    -[SBSlideFloatingAppFromBottomSwitcherModifier entityRemovalSettings](self, "entityRemovalSettings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "floatingDeclineIntentAnimationSettings");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "toBeRemovedSlideOutHeightOffsetMultiplier");
    v18 = v12 * v17;

    v8 = v8 + v18;
  }

  v19 = v6;
  v20 = v8;
  v21 = v10;
  v22 = v12;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  SBAppLayout *v8;
  double v9;
  double v10;
  objc_super v12;

  v8 = (SBAppLayout *)a4;
  v12.receiver = self;
  v12.super_class = (Class)SBSlideFloatingAppFromBottomSwitcherModifier;
  -[SBSlideFloatingAppFromBottomSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](&v12, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, v8, a5);
  if (self->_fromFloatingAppLayout == v8 || (v10 = v9, self->_toFloatingAppLayout == v8))
    v10 = 1.0;

  return v10;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  SBAppLayout *v6;
  double v7;
  double v8;
  SBAppLayout *fromFloatingAppLayout;
  void *v10;
  void *v11;
  double v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SBSlideFloatingAppFromBottomSwitcherModifier;
  v6 = (SBAppLayout *)a4;
  -[SBSlideFloatingAppFromBottomSwitcherModifier dimmingAlphaForLayoutRole:inAppLayout:](&v14, sel_dimmingAlphaForLayoutRole_inAppLayout_, a3, v6);
  v8 = v7;
  fromFloatingAppLayout = self->_fromFloatingAppLayout;

  if (fromFloatingAppLayout == v6)
  {
    -[SBSlideFloatingAppFromBottomSwitcherModifier switcherSettings](self, "switcherSettings", v14.receiver, v14.super_class);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "floatingSwitcherSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dimmingAlpha");
    v8 = v12;

  }
  return v8;
}

- (double)scaleForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  void *v7;
  SBAppLayout *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBSlideFloatingAppFromBottomSwitcherModifier;
  -[SBSlideFloatingAppFromBottomSwitcherModifier scaleForIndex:](&v10, sel_scaleForIndex_);
  v6 = v5;
  -[SBSlideFloatingAppFromBottomSwitcherModifier appLayouts](self, "appLayouts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a3);
  v8 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

  if (v8 == self->_fromFloatingAppLayout)
    v6 = 0.98;

  return v6;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  SBAppLayout *v4;
  void *v5;
  SBAppLayout *toFloatingAppLayout;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBSlideFloatingAppFromBottomSwitcherModifier;
  v4 = (SBAppLayout *)a3;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v12, sel_animationAttributesForLayoutElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  toFloatingAppLayout = self->_toFloatingAppLayout;

  if (toFloatingAppLayout == v4)
  {
    v7 = (void *)objc_msgSend(v5, "mutableCopy", v12.receiver, v12.super_class);
    -[SBSlideFloatingAppFromBottomSwitcherModifier switcherSettings](self, "switcherSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "animationSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "slideUpSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLayoutSettings:", v10);

    v5 = v7;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toFloatingAppLayout, 0);
  objc_storeStrong((id *)&self->_fromFloatingAppLayout, 0);
}

@end
