@implementation SBEntityRemovalDeclineFloatingSwitcherModifier

- (SBEntityRemovalDeclineFloatingSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5 floatingConfiguration:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  SBEntityRemovalDeclineFloatingSwitcherModifier *v14;
  SBEntityRemovalDeclineFloatingSwitcherModifier *v15;
  void *v17;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBEntityRemovalDeclineFloatingSwitcherModifier.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromAppLayout"));

  }
  v18.receiver = self;
  v18.super_class = (Class)SBEntityRemovalDeclineFloatingSwitcherModifier;
  v14 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v18, sel_initWithTransitionID_, v11);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_fromAppLayout, a4);
    objc_storeStrong((id *)&v15->_toAppLayout, a5);
    v15->_floatingConfiguration = a6;
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
  SBEntityRemovalDeclineFloatingSwitcherModifier *v11;

  v4 = a3;
  -[SBChainableModifier succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __88__SBEntityRemovalDeclineFloatingSwitcherModifier_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

id __88__SBEntityRemovalDeclineFloatingSwitcherModifier_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
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
  v6.super_class = (Class)SBEntityRemovalDeclineFloatingSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v6, sel_transitionWillBegin);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 2, 2);
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CGRect)containerViewBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[SBEntityRemovalDeclineFloatingSwitcherModifier floatingApplicationFrameInInterfaceOrientation:floatingConfiguration:](self, "floatingApplicationFrameInInterfaceOrientation:floatingConfiguration:", -[SBEntityRemovalDeclineFloatingSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation"), self->_floatingConfiguration);
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
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
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

  if (-[SBEntityRemovalDeclineFloatingSwitcherModifier _isIndexFromAppLayout:](self, "_isIndexFromAppLayout:"))
  {
    -[SBEntityRemovalDeclineFloatingSwitcherModifier containerViewBounds](self, "containerViewBounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[SBEntityRemovalDeclineFloatingSwitcherModifier entityRemovalSettings](self, "entityRemovalSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "floatingDeclineIntentAnimationSettings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "toBeRemovedSlideOutHeightOffsetMultiplier");
    v16 = v12 * v15;

    v17 = v8 + v16;
  }
  else
  {
    if (-[SBEntityRemovalDeclineFloatingSwitcherModifier _isIndexToAppLayout:](self, "_isIndexToAppLayout:", a3))
    {
      -[SBEntityRemovalDeclineFloatingSwitcherModifier containerViewBounds](self, "containerViewBounds");
    }
    else
    {
      v24.receiver = self;
      v24.super_class = (Class)SBEntityRemovalDeclineFloatingSwitcherModifier;
      -[SBEntityRemovalDeclineFloatingSwitcherModifier frameForIndex:](&v24, sel_frameForIndex_, a3);
    }
    v6 = v18;
    v10 = v19;
    v12 = v20;
  }
  v21 = v6;
  v22 = v10;
  v23 = v12;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v17;
  result.origin.x = v21;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double result;
  objc_super v11;
  objc_super v12;

  if (-[SBEntityRemovalDeclineFloatingSwitcherModifier _isIndexFromAppLayout:](self, "_isIndexFromAppLayout:"))
  {
    -[SBEntityRemovalDeclineFloatingSwitcherModifier entityRemovalSettings](self, "entityRemovalSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatingDeclineIntentAnimationSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "defaultAnimationSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "toBeRemovedFinalScale");
    v9 = v8;

    return v9;
  }
  else if (-[SBEntityRemovalDeclineFloatingSwitcherModifier _isIndexToAppLayout:](self, "_isIndexToAppLayout:", a3)
         && -[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase") == 1)
  {
    -[SBEntityRemovalDeclineFloatingSwitcherModifier scaleForIndex:](&v12, sel_scaleForIndex_, 1, v11.receiver, v11.super_class, self, SBEntityRemovalDeclineFloatingSwitcherModifier);
  }
  else
  {
    -[SBEntityRemovalDeclineFloatingSwitcherModifier scaleForIndex:](&v11, sel_scaleForIndex_, a3, self, SBEntityRemovalDeclineFloatingSwitcherModifier, v12.receiver, v12.super_class);
  }
  return result;
}

- (id)visibleAppLayouts
{
  void *v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBEntityRemovalDeclineFloatingSwitcherModifier;
  -[SBEntityRemovalDeclineFloatingSwitcherModifier visibleAppLayouts](&v7, sel_visibleAppLayouts);
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
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBEntityRemovalDeclineFloatingSwitcherModifier;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v8, sel_animationAttributesForLayoutElement_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[SBEntityRemovalDeclineFloatingSwitcherModifier _layoutSettings](self, "_layoutSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayoutSettings:", v6);

  return v5;
}

- (id)_layoutSettings
{
  void *v2;
  void *v3;
  void *v4;

  -[SBEntityRemovalDeclineFloatingSwitcherModifier entityRemovalSettings](self, "entityRemovalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatingDeclineIntentAnimationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toBeRemovedSlideOutAnimationSettings");
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
  v8.super_class = (Class)SBEntityRemovalDeclineFloatingSwitcherModifier;
  -[SBEntityRemovalDeclineFloatingSwitcherModifier topMostLayoutElements](&v8, sel_topMostLayoutElements);
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
  double v9;
  double v10;
  objc_super v12;

  v8 = a4;
  v9 = 1.0;
  if (!-[SBEntityRemovalDeclineFloatingSwitcherModifier _isIndexFromAppLayout:](self, "_isIndexFromAppLayout:", a5)
    && !-[SBEntityRemovalDeclineFloatingSwitcherModifier _isIndexToAppLayout:](self, "_isIndexToAppLayout:", a5))
  {
    v12.receiver = self;
    v12.super_class = (Class)SBEntityRemovalDeclineFloatingSwitcherModifier;
    -[SBEntityRemovalDeclineFloatingSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](&v12, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, v8, a5);
    v9 = v10;
  }

  return v9;
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
  v14.super_class = (Class)SBEntityRemovalDeclineFloatingSwitcherModifier;
  v6 = (SBAppLayout *)a4;
  -[SBEntityRemovalDeclineFloatingSwitcherModifier dimmingAlphaForLayoutRole:inAppLayout:](&v14, sel_dimmingAlphaForLayoutRole_inAppLayout_, a3, v6);
  v8 = v7;
  toAppLayout = self->_toAppLayout;

  if (toAppLayout == v6
    && -[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase", v14.receiver, v14.super_class) == 1)
  {
    -[SBEntityRemovalDeclineFloatingSwitcherModifier switcherSettings](self, "switcherSettings");
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
  BOOL v7;
  double result;
  unint64_t v9;
  objc_super v10;

  v7 = -[SBEntityRemovalDeclineFloatingSwitcherModifier _isIndexFromAppLayout:](self, "_isIndexFromAppLayout:", a4);
  result = 1.0;
  if (!v7)
  {
    if (!-[SBEntityRemovalDeclineFloatingSwitcherModifier _isIndexToAppLayout:](self, "_isIndexToAppLayout:", a4, 1.0)
      || (v9 = -[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase"), result = 0.0, v9 != 1))
    {
      v10.receiver = self;
      v10.super_class = (Class)SBEntityRemovalDeclineFloatingSwitcherModifier;
      -[SBEntityRemovalDeclineFloatingSwitcherModifier shadowOpacityForLayoutRole:atIndex:](&v10, sel_shadowOpacityForLayoutRole_atIndex_, a3, a4);
    }
  }
  return result;
}

- (BOOL)_isIndexFromAppLayout:(unint64_t)a3
{
  SBEntityRemovalDeclineFloatingSwitcherModifier *v4;
  void *v5;
  void *v6;

  v4 = self;
  -[SBEntityRemovalDeclineFloatingSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isEqual:", v4->_fromAppLayout);
  return (char)v4;
}

- (BOOL)_isIndexToAppLayout:(unint64_t)a3
{
  SBEntityRemovalDeclineFloatingSwitcherModifier *v4;
  void *v5;
  void *v6;

  v4 = self;
  -[SBEntityRemovalDeclineFloatingSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isEqual:", v4->_toAppLayout);
  return (char)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toAppLayout, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
}

@end
