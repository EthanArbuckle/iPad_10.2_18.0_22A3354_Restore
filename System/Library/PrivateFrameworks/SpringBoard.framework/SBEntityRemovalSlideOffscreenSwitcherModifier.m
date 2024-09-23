@implementation SBEntityRemovalSlideOffscreenSwitcherModifier

- (SBEntityRemovalSlideOffscreenSwitcherModifier)initWithTransitionID:(id)a3 appLayout:(id)a4 direction:(unint64_t)a5 animationSettings:(id)a6 multitaskingModifier:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  SBEntityRemovalSlideOffscreenSwitcherModifier *v17;
  SBEntityRemovalSlideOffscreenSwitcherModifier *v18;
  double v19;
  objc_super v21;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)SBEntityRemovalSlideOffscreenSwitcherModifier;
  v17 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v21, sel_initWithTransitionID_, v13);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_transitionID, a3);
    objc_storeStrong((id *)&v18->_appLayout, a4);
    v18->_direction = a5;
    objc_storeStrong((id *)&v18->_multitaskingModifier, a7);
    objc_storeStrong((id *)&v18->_animationSettings, a6);
    objc_msgSend(v15, "fromViewSlideOutAnimationDelay");
    v18->_isSecondStage = v19 == 0.0;
  }

  return v18;
}

- (void)didMoveToParentModifier:(id)a3
{
  void *v5;
  double v6;
  double v7;
  float v8;
  double v9;
  SBEntityRemovalToHomeSwitcherModifier *v10;
  SBEntityRemovalToHomeSwitcherModifier *toHomeRemovalModifier;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBEntityRemovalSlideOffscreenSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v12, sel_didMoveToParentModifier_);
  if (a3)
  {
    if (!self->_toHomeRemovalModifier)
    {
      -[SBEntityRemovalDosidoSlideOutAnimationSettings defaultAnimationSettings](self->_animationSettings, "defaultAnimationSettings");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "toViewScaleAndAlphaResetAnimationDelay");
      v7 = v6;
      UIAnimationDragCoefficient();
      v9 = v7 * v8;

      v10 = -[SBEntityRemovalToHomeSwitcherModifier initWithTransitionID:homeAnimationDelay:multitaskingModifier:]([SBEntityRemovalToHomeSwitcherModifier alloc], "initWithTransitionID:homeAnimationDelay:multitaskingModifier:", self->_transitionID, self->_multitaskingModifier, v9);
      toHomeRemovalModifier = self->_toHomeRemovalModifier;
      self->_toHomeRemovalModifier = v10;

      -[SBChainableModifier addChildModifier:](self, "addChildModifier:", self->_toHomeRemovalModifier);
    }
  }
}

- (id)transitionWillUpdate
{
  void *v3;
  double v4;
  double v5;
  float v6;
  float v7;
  SBTimerEventSwitcherEventResponse *v8;
  SBTimerEventSwitcherEventResponse *v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  BOOL (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)SBEntityRemovalSlideOffscreenSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillUpdate](&v18, sel_transitionWillUpdate);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_isSecondStage)
  {
    objc_initWeak(&location, self);
    -[SBEntityRemovalDosidoSlideOutAnimationSettings fromViewSlideOutAnimationDelay](self->_animationSettings, "fromViewSlideOutAnimationDelay");
    v5 = v4;
    UIAnimationDragCoefficient();
    v7 = v6;
    v8 = [SBTimerEventSwitcherEventResponse alloc];
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __69__SBEntityRemovalSlideOffscreenSwitcherModifier_transitionWillUpdate__block_invoke;
    v15 = &unk_1E8EA3468;
    objc_copyWeak(&v16, &location);
    v9 = -[SBTimerEventSwitcherEventResponse initWithDelay:validator:reason:](v8, "initWithDelay:validator:reason:", &v12, CFSTR("kSBEntityRemovalSlideOffsrceenSwitcherModifierSlideDelayReson"), v5 * v7);
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v9, v3, v12, v13, v14, v15);
    v10 = objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    v3 = (void *)v10;
  }
  return v3;
}

BOOL __69__SBEntityRemovalSlideOffscreenSwitcherModifier_transitionWillUpdate__block_invoke(uint64_t a1)
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
  v10.super_class = (Class)SBEntityRemovalSlideOffscreenSwitcherModifier;
  v4 = a3;
  -[SBTransitionSwitcherModifier handleTimerEvent:](&v10, sel_handleTimerEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reason", v10.receiver, v10.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v6, "isEqualToString:", CFSTR("kSBEntityRemovalSlideOffsrceenSwitcherModifierSlideDelayReson"));
  if ((_DWORD)v4)
  {
    self->_isSecondStage = 1;
    v7 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 30, 3);
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v7, v5);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  return v5;
}

- (id)visibleAppLayouts
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBEntityRemovalSlideOffscreenSwitcherModifier;
  -[SBEntityRemovalSlideOffscreenSwitcherModifier visibleAppLayouts](&v6, sel_visibleAppLayouts);
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
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  objc_super v33;
  CGRect result;

  -[SBEntityRemovalSlideOffscreenSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBAppLayout isEqual:](self->_appLayout, "isEqual:", v6)
    && !-[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout"))
  {
    if (-[SBEntityRemovalSlideOffscreenSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled"))
    {
      -[SBSwitcherModifier autoLayoutSpaceForAppLayout:](self, "autoLayoutSpaceForAppLayout:", self->_appLayout);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "boundingBox");
      v8 = v20;
      v10 = v21;
      v12 = v22;
      v14 = v23;

    }
    else
    {
      -[SBEntityRemovalSlideOffscreenSwitcherModifier containerViewBounds](self, "containerViewBounds");
      v8 = v24;
      v10 = v25;
      v12 = v26;
      v14 = v27;
    }
    if (self->_isSecondStage)
    {
      -[SBEntityRemovalSlideOffscreenSwitcherModifier containerViewBounds](self, "containerViewBounds");
      v29 = v28;
      -[SBEntityRemovalDosidoSlideOutAnimationSettings fromViewSlideOutHeightOffsetMultiplier](self->_animationSettings, "fromViewSlideOutHeightOffsetMultiplier");
      v31 = v29 * v30;
      v32 = -(v29 * v30);
      if (self->_direction == 1)
        v32 = v31;
      v10 = v10 + v32;
    }
  }
  else
  {
    v33.receiver = self;
    v33.super_class = (Class)SBEntityRemovalSlideOffscreenSwitcherModifier;
    -[SBEntityRemovalSlideOffscreenSwitcherModifier frameForIndex:](&v33, sel_frameForIndex_, a3);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
  }

  v15 = v8;
  v16 = v10;
  v17 = v12;
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
  void *v9;
  double v10;
  objc_super v12;

  -[SBEntityRemovalSlideOffscreenSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBAppLayout isEqual:](self->_appLayout, "isEqual:", v6)
    && !-[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout"))
  {
    -[SBEntityRemovalDosidoSlideOutAnimationSettings defaultAnimationSettings](self->_animationSettings, "defaultAnimationSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fromViewFinalScale");
    v8 = v10;

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBEntityRemovalSlideOffscreenSwitcherModifier;
    -[SBEntityRemovalSlideOffscreenSwitcherModifier scaleForIndex:](&v12, sel_scaleForIndex_, a3);
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

  -[SBEntityRemovalSlideOffscreenSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[SBAppLayout isEqual:](self->_appLayout, "isEqual:", v6)
    || (v7 = 0.5, v8 = 0.5, -[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout")))
  {
    v13.receiver = self;
    v13.super_class = (Class)SBEntityRemovalSlideOffscreenSwitcherModifier;
    -[SBEntityRemovalSlideOffscreenSwitcherModifier anchorPointForIndex:](&v13, sel_anchorPointForIndex_, a3);
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

  -[SBEntityRemovalSlideOffscreenSwitcherModifier appLayouts](self, "appLayouts");
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
    v9.super_class = (Class)SBEntityRemovalSlideOffscreenSwitcherModifier;
    v7 = -[SBEntityRemovalSlideOffscreenSwitcherModifier shouldPinLayoutRolesToSpace:](&v9, sel_shouldPinLayoutRolesToSpace_, a3);
  }

  return v7;
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  void *v5;
  void *v6;
  BOOL v7;
  objc_super v9;

  -[SBEntityRemovalSlideOffscreenSwitcherModifier appLayouts](self, "appLayouts");
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
    v9.super_class = (Class)SBEntityRemovalSlideOffscreenSwitcherModifier;
    v7 = -[SBEntityRemovalSlideOffscreenSwitcherModifier shouldUseAnchorPointToPinLayoutRolesToSpace:](&v9, sel_shouldUseAnchorPointToPinLayoutRolesToSpace_, a3);
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
    v8.super_class = (Class)SBEntityRemovalSlideOffscreenSwitcherModifier;
    -[SBEntityRemovalSlideOffscreenSwitcherModifier perspectiveAngleForAppLayout:](&v8, sel_perspectiveAngleForAppLayout_, v4);
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
    -[SBEntityRemovalSlideOffscreenSwitcherModifier appLayouts](self, "appLayouts");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBEntityRemovalSlideOffscreenSwitcherModifier frameForIndex:](self, "frameForIndex:", objc_msgSend(v18, "indexOfObject:", self->_appLayout));
    v11 = v19;
    v13 = v20;
    v15 = v21;
    v17 = v22;

  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)SBEntityRemovalSlideOffscreenSwitcherModifier;
    -[SBEntityRemovalSlideOffscreenSwitcherModifier adjustedSpaceAccessoryViewFrame:forAppLayout:](&v27, sel_adjustedSpaceAccessoryViewFrame_forAppLayout_, v9, x, y, width, height);
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
    v14.super_class = (Class)SBEntityRemovalSlideOffscreenSwitcherModifier;
    -[SBEntityRemovalSlideOffscreenSwitcherModifier adjustedSpaceAccessoryViewAnchorPoint:forAppLayout:](&v14, sel_adjustedSpaceAccessoryViewAnchorPoint_forAppLayout_, v7, x, y);
    v8 = v10;
    v9 = v11;
  }

  v12 = v8;
  v13 = v9;
  result.y = v13;
  result.x = v12;
  return result;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  double v9;
  double v10;
  objc_super v12;

  v8 = a4;
  if (!-[SBAppLayout isEqual:](self->_appLayout, "isEqual:", v8)
    || (v9 = 1.0, -[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout")))
  {
    v12.receiver = self;
    v12.super_class = (Class)SBEntityRemovalSlideOffscreenSwitcherModifier;
    -[SBEntityRemovalSlideOffscreenSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](&v12, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, v8, a5);
    v9 = v10;
  }

  return v9;
}

- (id)topMostLayoutElements
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBEntityRemovalSlideOffscreenSwitcherModifier;
  -[SBEntityRemovalSlideOffscreenSwitcherModifier topMostLayoutElements](&v6, sel_topMostLayoutElements);
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
  v7.super_class = (Class)SBEntityRemovalSlideOffscreenSwitcherModifier;
  -[SBEntityRemovalSlideOffscreenSwitcherModifier appLayoutsToEnsureExistForMainTransitionEvent:](&v7, sel_appLayoutsToEnsureExistForMainTransitionEvent_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sb_arrayByAddingOrMovingObject:", self->_appLayout);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  objc_super v10;

  v4 = a3;
  if (objc_msgSend(v4, "switcherLayoutElementType") || !objc_msgSend(v4, "isEqual:", self->_appLayout))
  {
    v9.receiver = self;
    v9.super_class = (Class)SBEntityRemovalSlideOffscreenSwitcherModifier;
    -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v9, sel_animationAttributesForLayoutElement_, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SBEntityRemovalSlideOffscreenSwitcherModifier;
    -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v10, sel_animationAttributesForLayoutElement_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    -[SBEntityRemovalSlideOffscreenSwitcherModifier _layoutSettings](self, "_layoutSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLayoutSettings:", v7);

  }
  return v6;
}

- (id)_layoutSettings
{
  _BOOL4 isSecondStage;
  SBEntityRemovalDosidoSlideOutAnimationSettings *animationSettings;
  void *v4;
  void *v5;

  isSecondStage = self->_isSecondStage;
  animationSettings = self->_animationSettings;
  if (isSecondStage)
  {
    -[SBEntityRemovalDosidoSlideOutAnimationSettings fromViewSlideOutAnimationSettings](animationSettings, "fromViewSlideOutAnimationSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SBEntityRemovalDosidoSlideOutAnimationSettings defaultAnimationSettings](animationSettings, "defaultAnimationSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fromViewScaleAnimationSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationSettings, 0);
  objc_storeStrong((id *)&self->_toHomeRemovalModifier, 0);
  objc_storeStrong((id *)&self->_multitaskingModifier, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
  objc_storeStrong((id *)&self->_transitionID, 0);
}

@end
