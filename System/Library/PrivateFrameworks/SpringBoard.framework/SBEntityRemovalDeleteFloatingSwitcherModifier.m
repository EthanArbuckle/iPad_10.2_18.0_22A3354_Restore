@implementation SBEntityRemovalDeleteFloatingSwitcherModifier

- (SBEntityRemovalDeleteFloatingSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5 floatingConfiguration:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  SBEntityRemovalDeleteFloatingSwitcherModifier *v14;
  SBEntityRemovalDeleteFloatingSwitcherModifier *v15;
  void *v17;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBEntityRemovalDeleteFloatingSwitcherModifier.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromAppLayout"));

  }
  v18.receiver = self;
  v18.super_class = (Class)SBEntityRemovalDeleteFloatingSwitcherModifier;
  v14 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v18, sel_initWithTransitionID_, v11);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_fromAppLayout, a4);
    objc_storeStrong((id *)&v15->_toAppLayout, a5);
    v15->_floatingConfiguration = a6;
    v15->_blursFromAppLayout = 1;
  }

  return v15;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBEntityRemovalDeleteFloatingSwitcherModifier *v11;

  v4 = a3;
  -[SBChainableModifier succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __87__SBEntityRemovalDeleteFloatingSwitcherModifier_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

id __87__SBEntityRemovalDeleteFloatingSwitcherModifier_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  SBStringForFloatingConfiguration(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 152));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("floatingConfiguration"));

  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 136), CFSTR("fromAppLayout"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 144), CFSTR("toAppLayout"));
}

- (id)transitionWillBegin
{
  void *v2;
  SBUpdateLayoutSwitcherEventResponse *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBEntityRemovalDeleteFloatingSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v6, sel_transitionWillBegin);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 2, 2);
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)transitionWillUpdate
{
  void *v3;
  SBBlurItemContainerSwitcherEventResponse *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBEntityRemovalDeleteFloatingSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillUpdate](&v7, sel_transitionWillUpdate);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_blursFromAppLayout)
  {
    v4 = -[SBBlurItemContainerSwitcherEventResponse initWithAppLayout:shouldBlur:animationUpdateMode:]([SBBlurItemContainerSwitcherEventResponse alloc], "initWithAppLayout:shouldBlur:animationUpdateMode:", self->_fromAppLayout, 1, 3);
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v4, v3);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  return v3;
}

- (id)transitionDidEnd
{
  void *v3;
  SBBlurItemContainerSwitcherEventResponse *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBEntityRemovalDeleteFloatingSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionDidEnd](&v7, sel_transitionDidEnd);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_blursFromAppLayout)
  {
    v4 = -[SBBlurItemContainerSwitcherEventResponse initWithAppLayout:shouldBlur:animationUpdateMode:]([SBBlurItemContainerSwitcherEventResponse alloc], "initWithAppLayout:shouldBlur:animationUpdateMode:", self->_fromAppLayout, 0, 2);
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v4, v3);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  return v3;
}

- (CGRect)containerViewBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[SBEntityRemovalDeleteFloatingSwitcherModifier floatingApplicationFrameInInterfaceOrientation:floatingConfiguration:](self, "floatingApplicationFrameInInterfaceOrientation:floatingConfiguration:", -[SBEntityRemovalDeleteFloatingSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation"), self->_floatingConfiguration);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;
  CGRect result;

  if (-[SBEntityRemovalDeleteFloatingSwitcherModifier _isIndexFromAppLayout:](self, "_isIndexFromAppLayout:"))
  {
    -[SBEntityRemovalDeleteFloatingSwitcherModifier containerViewBounds](self, "containerViewBounds");
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBEntityRemovalDeleteFloatingSwitcherModifier;
    -[SBEntityRemovalDeleteFloatingSwitcherModifier frameForIndex:](&v9, sel_frameForIndex_, a3);
  }
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  objc_super v11;
  objc_super v12;

  if (!-[SBEntityRemovalDeleteFloatingSwitcherModifier _isIndexFromAppLayout:](self, "_isIndexFromAppLayout:"))
  {
    if (-[SBEntityRemovalDeleteFloatingSwitcherModifier _isIndexToAppLayout:](self, "_isIndexToAppLayout:", a3)
      && -[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase") == 1)
    {
      v5 = 1.0;
      if (SBReduceMotion())
        return v5;
      -[SBEntityRemovalDeleteFloatingSwitcherModifier scaleForIndex:](&v12, sel_scaleForIndex_, 1, v11.receiver, v11.super_class, self, SBEntityRemovalDeleteFloatingSwitcherModifier);
    }
    else
    {
      -[SBEntityRemovalDeleteFloatingSwitcherModifier scaleForIndex:](&v11, sel_scaleForIndex_, a3, self, SBEntityRemovalDeleteFloatingSwitcherModifier, v12.receiver, v12.super_class);
    }
    return v9;
  }
  v5 = 1.0;
  if (!SBReduceMotion())
  {
    -[SBEntityRemovalDeleteFloatingSwitcherModifier entityRemovalSettings](self, "entityRemovalSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatingDeleteIntentAnimationSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "toBeRemovedFinalScale");
    v5 = v8;

  }
  return v5;
}

- (id)visibleAppLayouts
{
  void *v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBEntityRemovalDeleteFloatingSwitcherModifier;
  -[SBEntityRemovalDeleteFloatingSwitcherModifier visibleAppLayouts](&v7, sel_visibleAppLayouts);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObject:", self->_fromAppLayout);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_toAppLayout)
  {
    objc_msgSend(v4, "setByAddingObject:");
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  return v4;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBEntityRemovalDeleteFloatingSwitcherModifier;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v9, sel_animationAttributesForLayoutElement_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[SBEntityRemovalDeleteFloatingSwitcherModifier _layoutSettings](self, "_layoutSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayoutSettings:", v6);

  -[SBEntityRemovalDeleteFloatingSwitcherModifier _opacitySettings](self, "_opacitySettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOpacitySettings:", v7);

  return v5;
}

- (id)_layoutSettings
{
  void *v2;
  void *v3;
  void *v4;

  -[SBEntityRemovalDeleteFloatingSwitcherModifier entityRemovalSettings](self, "entityRemovalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatingDeleteIntentAnimationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toBeRemovedScaleAnimationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_opacitySettings
{
  void *v2;
  void *v3;
  void *v4;

  -[SBEntityRemovalDeleteFloatingSwitcherModifier entityRemovalSettings](self, "entityRemovalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatingDeleteIntentAnimationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toBeRemovedAlphaAnimationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)topMostLayoutElements
{
  void *v3;
  void *v4;
  SBAppLayout *toAppLayout;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBEntityRemovalDeleteFloatingSwitcherModifier;
  -[SBEntityRemovalDeleteFloatingSwitcherModifier topMostLayoutElements](&v8, sel_topMostLayoutElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sb_arrayByInsertingOrMovingObject:toIndex:", self->_fromAppLayout, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  toAppLayout = self->_toAppLayout;
  if (toAppLayout)
  {
    objc_msgSend(v4, "sb_arrayByInsertingOrMovingObject:toIndex:", toAppLayout, 1);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  return v4;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  objc_super v15;

  v8 = a4;
  if (-[SBEntityRemovalDeleteFloatingSwitcherModifier _isIndexFromAppLayout:](self, "_isIndexFromAppLayout:", a5))
  {
    -[SBEntityRemovalDeleteFloatingSwitcherModifier entityRemovalSettings](self, "entityRemovalSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "floatingDeleteIntentAnimationSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "toBeRemovedFinalAlpha");
    v12 = v11;

  }
  else
  {
    v12 = 1.0;
    if (!-[SBEntityRemovalDeleteFloatingSwitcherModifier _isIndexToAppLayout:](self, "_isIndexToAppLayout:", a5))
    {
      v15.receiver = self;
      v15.super_class = (Class)SBEntityRemovalDeleteFloatingSwitcherModifier;
      -[SBEntityRemovalDeleteFloatingSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](&v15, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, v8, a5);
      v12 = v13;
    }
  }

  return v12;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  SBAppLayout *v6;
  double v7;
  double v8;
  SBAppLayout *toAppLayout;
  void *v10;
  void *v11;
  double v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SBEntityRemovalDeleteFloatingSwitcherModifier;
  v6 = (SBAppLayout *)a4;
  -[SBEntityRemovalDeleteFloatingSwitcherModifier dimmingAlphaForLayoutRole:inAppLayout:](&v14, sel_dimmingAlphaForLayoutRole_inAppLayout_, a3, v6);
  v8 = v7;
  toAppLayout = self->_toAppLayout;

  if (toAppLayout == v6
    && -[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase", v14.receiver, v14.super_class) == 1)
  {
    -[SBEntityRemovalDeleteFloatingSwitcherModifier switcherSettings](self, "switcherSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "floatingSwitcherSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dimmingAlpha");
    v8 = v12;

  }
  return v8;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  double v7;
  double v8;
  objc_super v10;

  v7 = 0.0;
  if (!-[SBEntityRemovalDeleteFloatingSwitcherModifier _isIndexFromAppLayout:](self, "_isIndexFromAppLayout:", a4)
    && (!-[SBEntityRemovalDeleteFloatingSwitcherModifier _isIndexToAppLayout:](self, "_isIndexToAppLayout:", a4)
     || -[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase") != 1))
  {
    v10.receiver = self;
    v10.super_class = (Class)SBEntityRemovalDeleteFloatingSwitcherModifier;
    -[SBEntityRemovalDeleteFloatingSwitcherModifier shadowOpacityForLayoutRole:atIndex:](&v10, sel_shadowOpacityForLayoutRole_atIndex_, a3, a4);
    return v8;
  }
  return v7;
}

- (BOOL)_isIndexFromAppLayout:(unint64_t)a3
{
  SBEntityRemovalDeleteFloatingSwitcherModifier *v4;
  void *v5;
  void *v6;

  v4 = self;
  -[SBEntityRemovalDeleteFloatingSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isEqual:", v4->_fromAppLayout);
  return (char)v4;
}

- (BOOL)_isIndexToAppLayout:(unint64_t)a3
{
  SBEntityRemovalDeleteFloatingSwitcherModifier *v4;
  void *v5;
  void *v6;

  v4 = self;
  -[SBEntityRemovalDeleteFloatingSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isEqual:", v4->_toAppLayout);
  return (char)v4;
}

- (BOOL)blursFromAppLayout
{
  return self->_blursFromAppLayout;
}

- (void)setBlursFromAppLayout:(BOOL)a3
{
  self->_blursFromAppLayout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toAppLayout, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
}

@end
