@implementation SBEntityRemovalCrossblurSwitcherModifier

- (SBEntityRemovalCrossblurSwitcherModifier)initWithTransitionID:(id)a3 appLayout:(id)a4 multitaskingModifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  SBEntityRemovalCrossblurSwitcherModifier *v12;
  SBEntityRemovalCrossblurSwitcherModifier *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SBEntityRemovalCrossblurSwitcherModifier;
  v12 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v15, sel_initWithTransitionID_, v9);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_transitionID, a3);
    objc_storeStrong((id *)&v13->_appLayout, a4);
    objc_storeStrong((id *)&v13->_multitaskingModifier, a5);
  }

  return v13;
}

- (void)didMoveToParentModifier:(id)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  float v9;
  double v10;
  SBEntityRemovalToHomeSwitcherModifier *v11;
  SBEntityRemovalToHomeSwitcherModifier *toHomeRemovalModifier;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBEntityRemovalCrossblurSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v13, sel_didMoveToParentModifier_);
  if (a3)
  {
    if (!self->_toHomeRemovalModifier)
    {
      -[SBEntityRemovalCrossblurSwitcherModifier entityRemovalSettings](self, "entityRemovalSettings");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dosidoDeleteIntentAnimationSettings");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "toViewScaleAndAlphaResetAnimationDelay");
      v8 = v7;
      UIAnimationDragCoefficient();
      v10 = v8 * v9;

      v11 = -[SBEntityRemovalToHomeSwitcherModifier initWithTransitionID:homeAnimationDelay:multitaskingModifier:]([SBEntityRemovalToHomeSwitcherModifier alloc], "initWithTransitionID:homeAnimationDelay:multitaskingModifier:", self->_transitionID, self->_multitaskingModifier, v10);
      toHomeRemovalModifier = self->_toHomeRemovalModifier;
      self->_toHomeRemovalModifier = v11;

      -[SBChainableModifier addChildModifier:](self, "addChildModifier:", self->_toHomeRemovalModifier);
    }
  }
}

- (id)transitionWillUpdate
{
  void *v3;
  SBBlurItemContainerSwitcherEventResponse *v4;
  uint64_t v5;
  SBTimerEventSwitcherEventResponse *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  SBTimerEventSwitcherEventResponse *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  BOOL (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)SBEntityRemovalCrossblurSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillUpdate](&v20, sel_transitionWillUpdate);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!SBReduceMotion())
  {
    v4 = -[SBBlurItemContainerSwitcherEventResponse initWithAppLayout:shouldBlur:animationUpdateMode:]([SBBlurItemContainerSwitcherEventResponse alloc], "initWithAppLayout:shouldBlur:animationUpdateMode:", self->_appLayout, 1, 3);
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v4, v3);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  objc_initWeak(&location, self);
  v6 = [SBTimerEventSwitcherEventResponse alloc];
  -[SBEntityRemovalCrossblurSwitcherModifier entityRemovalSettings](self, "entityRemovalSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dosidoDeleteIntentAnimationSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fromViewAlphaAnimationDelay");
  v10 = v9;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __64__SBEntityRemovalCrossblurSwitcherModifier_transitionWillUpdate__block_invoke;
  v17 = &unk_1E8EA3468;
  objc_copyWeak(&v18, &location);
  v11 = -[SBTimerEventSwitcherEventResponse initWithDelay:validator:reason:](v6, "initWithDelay:validator:reason:", &v14, CFSTR("kSBEntityRemovalCrossblurSwitcherModifierAlphaAnimationDelayReason"), v10);

  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v11, v3, v14, v15, v16, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v12;
}

BOOL __64__SBEntityRemovalCrossblurSwitcherModifier_transitionWillUpdate__block_invoke(uint64_t a1)
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
  v10.super_class = (Class)SBEntityRemovalCrossblurSwitcherModifier;
  v4 = a3;
  -[SBTransitionSwitcherModifier handleTimerEvent:](&v10, sel_handleTimerEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reason", v10.receiver, v10.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v6, "isEqualToString:", CFSTR("kSBEntityRemovalCrossblurSwitcherModifierAlphaAnimationDelayReason"));
  if ((_DWORD)v4)
  {
    self->_animateOpacity = 1;
    v7 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 30, 3);
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v7, v5);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  return v5;
}

- (id)transitionDidEnd
{
  void *v3;
  SBBlurItemContainerSwitcherEventResponse *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBEntityRemovalCrossblurSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionDidEnd](&v7, sel_transitionDidEnd);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBBlurItemContainerSwitcherEventResponse initWithAppLayout:shouldBlur:animationUpdateMode:]([SBBlurItemContainerSwitcherEventResponse alloc], "initWithAppLayout:shouldBlur:animationUpdateMode:", self->_appLayout, 0, 2);
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)visibleAppLayouts
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBEntityRemovalCrossblurSwitcherModifier;
  -[SBEntityRemovalCrossblurSwitcherModifier visibleAppLayouts](&v6, sel_visibleAppLayouts);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObject:", self->_appLayout);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
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
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  objc_super v24;
  CGRect result;

  -[SBEntityRemovalCrossblurSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBAppLayout isEqual:](self->_appLayout, "isEqual:", v6)
    && !-[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout"))
  {
    if (-[SBEntityRemovalCrossblurSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled"))
    {
      -[SBSwitcherModifier autoLayoutSpaceForAppLayout:](self, "autoLayoutSpaceForAppLayout:", self->_appLayout);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "boundingBox");
      v11 = v20;
      v12 = v21;
      v13 = v22;
      v14 = v23;

      goto LABEL_5;
    }
    -[SBEntityRemovalCrossblurSwitcherModifier containerViewBounds](self, "containerViewBounds");
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)SBEntityRemovalCrossblurSwitcherModifier;
    -[SBEntityRemovalCrossblurSwitcherModifier frameForIndex:](&v24, sel_frameForIndex_, a3);
  }
  v11 = v7;
  v12 = v8;
  v13 = v9;
  v14 = v10;
LABEL_5:

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

- (double)scaleForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v10;
  void *v11;
  double v12;
  objc_super v13;

  -[SBEntityRemovalCrossblurSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBAppLayout isEqual:](self->_appLayout, "isEqual:", v6)
    && !-[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout"))
  {
    v8 = 1.0;
    if (!SBReduceMotion())
    {
      -[SBEntityRemovalCrossblurSwitcherModifier entityRemovalSettings](self, "entityRemovalSettings");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dosidoDeleteIntentAnimationSettings");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "fromViewFinalScale");
      v8 = v12;

    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SBEntityRemovalCrossblurSwitcherModifier;
    -[SBEntityRemovalCrossblurSwitcherModifier scaleForIndex:](&v13, sel_scaleForIndex_, a3);
    v8 = v7;
  }

  return v8;
}

- (CGPoint)anchorPointForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGPoint result;

  -[SBEntityRemovalCrossblurSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[SBAppLayout isEqual:](self->_appLayout, "isEqual:", v6)
    || (v7 = 0.5, v8 = 0.5, -[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout")))
  {
    v13.receiver = self;
    v13.super_class = (Class)SBEntityRemovalCrossblurSwitcherModifier;
    -[SBEntityRemovalCrossblurSwitcherModifier anchorPointForIndex:](&v13, sel_anchorPointForIndex_, a3);
    v7 = v9;
    v8 = v10;
  }

  v11 = v7;
  v12 = v8;
  result.y = v12;
  result.x = v11;
  return result;
}

- (BOOL)shouldPinLayoutRolesToSpace:(unint64_t)a3
{
  void *v5;
  void *v6;
  BOOL v7;
  objc_super v9;

  -[SBEntityRemovalCrossblurSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBAppLayout isEqual:](self->_appLayout, "isEqual:", v6)
    && !-[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout"))
  {
    v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBEntityRemovalCrossblurSwitcherModifier;
    v7 = -[SBEntityRemovalCrossblurSwitcherModifier shouldPinLayoutRolesToSpace:](&v9, sel_shouldPinLayoutRolesToSpace_, a3);
  }

  return v7;
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  void *v5;
  void *v6;
  BOOL v7;
  objc_super v9;

  -[SBEntityRemovalCrossblurSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBAppLayout isEqual:](self->_appLayout, "isEqual:", v6)
    && !-[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout"))
  {
    v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBEntityRemovalCrossblurSwitcherModifier;
    v7 = -[SBEntityRemovalCrossblurSwitcherModifier shouldUseAnchorPointToPinLayoutRolesToSpace:](&v9, sel_shouldUseAnchorPointToPinLayoutRolesToSpace_, a3);
  }

  return v7;
}

- (double)perspectiveAngleForAppLayout:(id)a3
{
  id v4;
  double v5;
  double v6;
  objc_super v8;

  v4 = a3;
  if (!-[SBAppLayout isEqual:](self->_appLayout, "isEqual:", v4)
    || (v5 = 0.0, -[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout")))
  {
    v8.receiver = self;
    v8.super_class = (Class)SBEntityRemovalCrossblurSwitcherModifier;
    -[SBEntityRemovalCrossblurSwitcherModifier perspectiveAngleForAppLayout:](&v8, sel_perspectiveAngleForAppLayout_, v4);
    v5 = v6;
  }

  return v5;
}

- (CGRect)adjustedSpaceAccessoryViewFrame:(CGRect)a3 forAppLayout:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  objc_super v27;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  if (-[SBAppLayout isEqual:](self->_appLayout, "isEqual:", v9)
    && !-[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout"))
  {
    -[SBEntityRemovalCrossblurSwitcherModifier appLayouts](self, "appLayouts");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBEntityRemovalCrossblurSwitcherModifier frameForIndex:](self, "frameForIndex:", objc_msgSend(v18, "indexOfObject:", self->_appLayout));
    v11 = v19;
    v13 = v20;
    v15 = v21;
    v17 = v22;

  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)SBEntityRemovalCrossblurSwitcherModifier;
    -[SBEntityRemovalCrossblurSwitcherModifier adjustedSpaceAccessoryViewFrame:forAppLayout:](&v27, sel_adjustedSpaceAccessoryViewFrame_forAppLayout_, v9, x, y, width, height);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
  }

  v23 = v11;
  v24 = v13;
  v25 = v15;
  v26 = v17;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (CGPoint)adjustedSpaceAccessoryViewAnchorPoint:(CGPoint)a3 forAppLayout:(id)a4
{
  double y;
  double x;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (!-[SBAppLayout isEqual:](self->_appLayout, "isEqual:", v7)
    || (v8 = 0.5, v9 = 0.5, -[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout")))
  {
    v14.receiver = self;
    v14.super_class = (Class)SBEntityRemovalCrossblurSwitcherModifier;
    -[SBEntityRemovalCrossblurSwitcherModifier adjustedSpaceAccessoryViewAnchorPoint:forAppLayout:](&v14, sel_adjustedSpaceAccessoryViewAnchorPoint_forAppLayout_, v7, x, y);
    v8 = v10;
    v9 = v11;
  }

  v12 = v8;
  v13 = v9;
  result.y = v13;
  result.x = v12;
  return result;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;
  objc_super v13;

  v4 = a3;
  if (objc_msgSend(v4, "switcherLayoutElementType") || !objc_msgSend(v4, "isEqual:", self->_appLayout))
  {
    v12.receiver = self;
    v12.super_class = (Class)SBEntityRemovalCrossblurSwitcherModifier;
    -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v12, sel_animationAttributesForLayoutElement_, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SBEntityRemovalCrossblurSwitcherModifier entityRemovalSettings](self, "entityRemovalSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dosidoDeleteIntentAnimationSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v13.receiver = self;
    v13.super_class = (Class)SBEntityRemovalCrossblurSwitcherModifier;
    -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v13, sel_animationAttributesForLayoutElement_, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v6, "fromViewScaleAnimationSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLayoutSettings:", v9);

    objc_msgSend(v6, "fromViewAlphaAnimationSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setOpacitySettings:", v10);

  }
  return v8;
}

- (id)topMostLayoutElements
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBEntityRemovalCrossblurSwitcherModifier;
  -[SBEntityRemovalCrossblurSwitcherModifier topMostLayoutElements](&v6, sel_topMostLayoutElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sb_arrayByInsertingOrMovingObject:toIndex:", self->_appLayout, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)appLayoutsToEnsureExistForMainTransitionEvent:(id)a3
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBEntityRemovalCrossblurSwitcherModifier;
  -[SBEntityRemovalCrossblurSwitcherModifier appLayoutsToEnsureExistForMainTransitionEvent:](&v7, sel_appLayoutsToEnsureExistForMainTransitionEvent_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sb_arrayByAddingOrMovingObject:", self->_appLayout);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  double v9;
  double v10;
  void *v12;
  void *v13;
  double v14;
  objc_super v15;

  v8 = a4;
  if (-[SBAppLayout isEqual:](self->_appLayout, "isEqual:", v8)
    && !-[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout"))
  {
    if (self->_animateOpacity)
    {
      -[SBEntityRemovalCrossblurSwitcherModifier entityRemovalSettings](self, "entityRemovalSettings");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dosidoDeleteIntentAnimationSettings");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "fromViewFinalAlpha");
      v10 = v14;

    }
    else
    {
      v10 = 1.0;
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)SBEntityRemovalCrossblurSwitcherModifier;
    -[SBEntityRemovalCrossblurSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](&v15, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, v8, a5);
    v10 = v9;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toHomeRemovalModifier, 0);
  objc_storeStrong((id *)&self->_multitaskingModifier, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
  objc_storeStrong((id *)&self->_transitionID, 0);
}

@end
