@implementation SBSplitRemovalSwitcherModifier

- (SBSplitRemovalSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5 layoutRoleToRemove:(int64_t)a6 animationStyle:(int64_t)a7
{
  id v13;
  id v14;
  SBSplitRemovalSwitcherModifier *v15;
  SBSplitRemovalSwitcherModifier *v16;
  uint64_t v17;
  uint64_t v18;
  SBAppLayout *remainingAppLayout;
  uint64_t v20;
  SBAppLayout *removedAppLayout;
  objc_super v23;

  v13 = a4;
  v14 = a5;
  v23.receiver = self;
  v23.super_class = (Class)SBSplitRemovalSwitcherModifier;
  v15 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v23, sel_initWithTransitionID_, a3);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_fromAppLayout, a4);
    objc_storeStrong((id *)&v16->_toAppLayout, a5);
    v17 = 1;
    if (a6 == 1)
      v17 = 2;
    v16->_layoutRoleToKeep = v17;
    v16->_layoutRoleToRemove = a6;
    v16->_animationStyle = a7;
    objc_msgSend(v13, "leafAppLayoutForRole:", v16->_layoutRoleToKeep);
    v18 = objc_claimAutoreleasedReturnValue();
    remainingAppLayout = v16->_remainingAppLayout;
    v16->_remainingAppLayout = (SBAppLayout *)v18;

    objc_msgSend(v13, "leafAppLayoutForRole:", v16->_layoutRoleToRemove);
    v20 = objc_claimAutoreleasedReturnValue();
    removedAppLayout = v16->_removedAppLayout;
    v16->_removedAppLayout = (SBAppLayout *)v20;

    v16->_animationPhase = 1;
  }

  return v16;
}

- (id)handleSceneReadyEvent:(id)a3
{
  void *v3;
  SBUpdateLayoutSwitcherEventResponse *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBSplitRemovalSwitcherModifier;
  -[SBSwitcherModifier handleSceneReadyEvent:](&v7, sel_handleSceneReadyEvent_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 30, 3);
  SBAppendSwitcherModifierResponse(v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
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
  v10.super_class = (Class)SBSplitRemovalSwitcherModifier;
  v4 = a3;
  -[SBTransitionSwitcherModifier handleTimerEvent:](&v10, sel_handleTimerEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reason", v10.receiver, v10.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v6, "isEqualToString:", CFSTR("SBSplitRemovalSwitcherModifierTimerEventReason"));
  if ((_DWORD)v4)
  {
    self->_animationPhase = 2;
    v7 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 30, 3);
    SBAppendSwitcherModifierResponse(v7, v5);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  return v5;
}

- (id)transitionWillBegin
{
  void *v2;
  SBInvalidateAdjustedAppLayoutsSwitcherEventResponse *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBSplitRemovalSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v6, sel_transitionWillBegin);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
  SBAppendSwitcherModifierResponse(v3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)transitionWillUpdate
{
  void *v3;
  int64_t animationStyle;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  float v10;
  float v11;
  SBTimerEventSwitcherEventResponse *v12;
  SBTimerEventSwitcherEventResponse *v13;
  uint64_t v14;
  _QWORD v16[4];
  id v17;
  id location;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)SBSplitRemovalSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillUpdate](&v19, sel_transitionWillUpdate);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_animationPhase == 1)
  {
    animationStyle = self->_animationStyle;
    -[SBSplitRemovalSwitcherModifier entityRemovalSettings](self, "entityRemovalSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (animationStyle == 2)
    {
      objc_msgSend(v5, "medusaCommitIntentAnimationSettings");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "toBeRemovedSlideOutAnimationDelay");
    }
    else
    {
      objc_msgSend(v5, "medusaDeleteIntentAnimationSettings");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "toBeMadeFullscreenFrameAnimationDelay");
    }
    v9 = v8;
    UIAnimationDragCoefficient();
    v11 = v10;

    objc_initWeak(&location, self);
    v12 = [SBTimerEventSwitcherEventResponse alloc];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __54__SBSplitRemovalSwitcherModifier_transitionWillUpdate__block_invoke;
    v16[3] = &unk_1E8EA3468;
    objc_copyWeak(&v17, &location);
    v13 = -[SBTimerEventSwitcherEventResponse initWithDelay:validator:reason:](v12, "initWithDelay:validator:reason:", v16, CFSTR("SBSplitRemovalSwitcherModifierTimerEventReason"), v9 * v11);
    SBAppendSwitcherModifierResponse(v13, v3);
    v14 = objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
    v3 = (void *)v14;
  }
  return v3;
}

BOOL __54__SBSplitRemovalSwitcherModifier_transitionWillUpdate__block_invoke(uint64_t a1)
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

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBSplitRemovalSwitcherModifier;
  -[SBTransitionSwitcherModifier adjustedAppLayoutsForAppLayouts:](&v7, sel_adjustedAppLayoutsForAppLayouts_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if ((objc_msgSend(v5, "containsObject:", self->_remainingAppLayout) & 1) == 0)
    objc_msgSend(v5, "addObject:", self->_remainingAppLayout);
  if ((objc_msgSend(v5, "containsObject:", self->_removedAppLayout) & 1) == 0)
    objc_msgSend(v5, "addObject:", self->_removedAppLayout);
  return v5;
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
  int64_t animationStyle;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBSplitRemovalSwitcherModifier;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v18, sel_animationAttributesForLayoutElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", self->_remainingAppLayout))
  {
    v6 = (void *)objc_msgSend(v5, "mutableCopy");
    if (self->_animationStyle != 2)
    {
      -[SBSplitRemovalSwitcherModifier entityRemovalSettings](self, "entityRemovalSettings");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "medusaDeleteIntentAnimationSettings");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "toBeMadeFullscreenFrameAnimationSettings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setLayoutSettings:", v9);

    }
  }
  if (objc_msgSend(v4, "isEqual:", self->_removedAppLayout))
  {
    v10 = (void *)objc_msgSend(v5, "mutableCopy");
    animationStyle = self->_animationStyle;
    -[SBSplitRemovalSwitcherModifier entityRemovalSettings](self, "entityRemovalSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (animationStyle == 2)
    {
      objc_msgSend(v12, "medusaCommitIntentAnimationSettings");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (self->_animationPhase != 2)
      {
LABEL_11:

        goto LABEL_12;
      }
      objc_msgSend(v14, "toBeRemovedSlideOutAnimationSettings");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setLayoutSettings:", v15);
    }
    else
    {
      objc_msgSend(v12, "medusaDeleteIntentAnimationSettings");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "toBeRemovedScaleAnimationSettings");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setScaleSettings:", v16);

      objc_msgSend(v14, "toBeRemovedAlphaAnimationSettings");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setOpacitySettings:", v15);
    }

    goto LABEL_11;
  }
LABEL_12:

  return v5;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
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
  objc_super v19;
  UIRectCornerRadii result;

  -[SBSplitRemovalSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (((objc_msgSend(v6, "isEqual:", self->_remainingAppLayout) & 1) != 0
     || objc_msgSend(v6, "isEqual:", self->_removedAppLayout))
    && -[SBTransitionSwitcherModifier isUpdatingLayout](self, "isUpdatingLayout"))
  {
    -[SBSplitRemovalSwitcherModifier displayCornerRadius](self, "displayCornerRadius");
    SBRectCornerRadiiForRadius();
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)SBSplitRemovalSwitcherModifier;
    -[SBSplitRemovalSwitcherModifier cornerRadiiForIndex:](&v19, sel_cornerRadiiForIndex_, a3);
  }
  v11 = v7;
  v12 = v8;
  v13 = v9;
  v14 = v10;

  v15 = v11;
  v16 = v12;
  v17 = v13;
  v18 = v14;
  result.topRight = v18;
  result.bottomRight = v17;
  result.bottomLeft = v16;
  result.topLeft = v15;
  return result;
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
  objc_super v19;
  CGRect result;

  -[SBSplitRemovalSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isEqual:", self->_remainingAppLayout) & 1) != 0
    || objc_msgSend(v6, "isEqual:", self->_removedAppLayout))
  {
    -[SBSplitRemovalSwitcherModifier containerViewBounds](self, "containerViewBounds");
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)SBSplitRemovalSwitcherModifier;
    -[SBSplitRemovalSwitcherModifier frameForIndex:](&v19, sel_frameForIndex_, a3);
  }
  v11 = v7;
  v12 = v8;
  v13 = v9;
  v14 = v10;

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

- (CGRect)frameForLayoutRole:(int64_t)layoutRoleToKeep inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  uint64_t v12;
  int64_t layoutRoleToRemove;
  SBAppLayout *fromAppLayout;
  double v15;
  double v16;
  double v17;
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
  void *v28;
  void *v29;
  double v30;
  double v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  objc_super v45;
  CGRect v46;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4;
  if (objc_msgSend(v11, "isEqual:", self->_remainingAppLayout))
  {
    if (self->_animationPhase == 2)
    {
      v12 = 144;
    }
    else
    {
      layoutRoleToKeep = self->_layoutRoleToKeep;
      v12 = 136;
    }
    v32 = *(uint64_t *)((char *)&self->super.super.super.super.isa + v12);
    -[SBSplitRemovalSwitcherModifier containerViewBounds](self, "containerViewBounds");
    -[SBSplitRemovalSwitcherModifier preferredFrameForLayoutRole:inAppLayout:bounds:interfaceOrientation:](self, "preferredFrameForLayoutRole:inAppLayout:bounds:interfaceOrientation:", layoutRoleToKeep, v32, -[SBSplitRemovalSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation"), v33, v34, v35, v36);
    goto LABEL_11;
  }
  if (!objc_msgSend(v11, "isEqual:", self->_removedAppLayout))
  {
    v45.receiver = self;
    v45.super_class = (Class)SBSplitRemovalSwitcherModifier;
    -[SBSplitRemovalSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v45, sel_frameForLayoutRole_inAppLayout_withBounds_, layoutRoleToKeep, v11, x, y, width, height);
LABEL_11:
    v20 = v37;
    v22 = v38;
    v24 = v39;
    v26 = v40;
    goto LABEL_12;
  }
  layoutRoleToRemove = self->_layoutRoleToRemove;
  fromAppLayout = self->_fromAppLayout;
  -[SBSplitRemovalSwitcherModifier containerViewBounds](self, "containerViewBounds");
  -[SBSplitRemovalSwitcherModifier preferredFrameForLayoutRole:inAppLayout:bounds:interfaceOrientation:](self, "preferredFrameForLayoutRole:inAppLayout:bounds:interfaceOrientation:", layoutRoleToRemove, fromAppLayout, -[SBSplitRemovalSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation"), v15, v16, v17, v18);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  if (self->_animationPhase == 2 && self->_animationStyle == 2)
  {
    -[SBSplitRemovalSwitcherModifier containerViewBounds](self, "containerViewBounds");
    v27 = CGRectGetHeight(v46);
    -[SBSplitRemovalSwitcherModifier entityRemovalSettings](self, "entityRemovalSettings");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "medusaCommitIntentAnimationSettings");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "toBeRemovedSlideOutHeightOffsetMultiplier");
    v31 = v27 * v30;

    v22 = v22 - v31;
  }
LABEL_12:

  v41 = v20;
  v42 = v22;
  v43 = v24;
  v44 = v26;
  result.size.height = v44;
  result.size.width = v43;
  result.origin.y = v42;
  result.origin.x = v41;
  return result;
}

- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  unsigned __int8 v7;
  BOOL v8;
  objc_super v10;

  -[SBSplitRemovalSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isEqual:", self->_remainingAppLayout) & 1) != 0
    || objc_msgSend(v6, "isEqual:", self->_removedAppLayout))
  {
    v7 = -[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout");
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SBSplitRemovalSwitcherModifier;
    v7 = -[SBSplitRemovalSwitcherModifier isContentStatusBarVisibleForIndex:](&v10, sel_isContentStatusBarVisibleForIndex_, a3);
  }
  v8 = v7;

  return v8;
}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  BOOL v7;
  objc_super v9;

  v6 = a4;
  if ((objc_msgSend(v6, "isEqual:", self->_remainingAppLayout) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBSplitRemovalSwitcherModifier;
    v7 = -[SBSplitRemovalSwitcherModifier isLayoutRoleBlurred:inAppLayout:](&v9, sel_isLayoutRoleBlurred_inAppLayout_, a3, v6);
  }

  return v7;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  BOOL v7;
  objc_super v9;

  v6 = a4;
  if ((objc_msgSend(v6, "isEqual:", self->_remainingAppLayout) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBSplitRemovalSwitcherModifier;
    v7 = -[SBSplitRemovalSwitcherModifier isLayoutRoleMatchMovedToScene:inAppLayout:](&v9, sel_isLayoutRoleMatchMovedToScene_inAppLayout_, a3, v6);
  }

  return v7;
}

- (BOOL)isWallpaperRequiredForSwitcher
{
  return 1;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  objc_super v15;

  v8 = a4;
  v9 = 1.0;
  if ((objc_msgSend(v8, "isEqual:", self->_remainingAppLayout) & 1) == 0)
  {
    if (objc_msgSend(v8, "isEqual:", self->_removedAppLayout))
    {
      if (self->_animationStyle != 2 && !-[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout"))
      {
        -[SBSplitRemovalSwitcherModifier entityRemovalSettings](self, "entityRemovalSettings");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "medusaDeleteIntentAnimationSettings");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "toBeRemovedFinalAlpha");
        v9 = v12;

      }
    }
    else
    {
      v15.receiver = self;
      v15.super_class = (Class)SBSplitRemovalSwitcherModifier;
      -[SBSplitRemovalSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](&v15, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, v8, a5);
      v9 = v13;
    }
  }

  return v9;
}

- (double)scaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  v6 = a4;
  if (objc_msgSend(v6, "isEqual:", self->_removedAppLayout)
    && -[SBTransitionSwitcherModifier isUpdatingLayout](self, "isUpdatingLayout"))
  {
    -[SBSplitRemovalSwitcherModifier entityRemovalSettings](self, "entityRemovalSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "medusaDeleteIntentAnimationSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "toBeRemovedFinalScale");
    v10 = v9;

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SBSplitRemovalSwitcherModifier;
    -[SBSplitRemovalSwitcherModifier scaleForLayoutRole:inAppLayout:](&v13, sel_scaleForLayoutRole_inAppLayout_, a3, v6);
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
  v9.super_class = (Class)SBSplitRemovalSwitcherModifier;
  -[SBSplitRemovalSwitcherModifier topMostLayoutElements](&v9, sel_topMostLayoutElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = v6;

  objc_msgSend(v7, "removeObject:", self->_remainingAppLayout);
  objc_msgSend(v7, "removeObject:", self->_removedAppLayout);
  objc_msgSend(v7, "insertObject:atIndex:", self->_removedAppLayout, 0);
  objc_msgSend(v7, "insertObject:atIndex:", self->_remainingAppLayout, 0);
  return v7;
}

- (id)visibleAppLayouts
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBSplitRemovalSwitcherModifier;
  -[SBSplitRemovalSwitcherModifier visibleAppLayouts](&v6, sel_visibleAppLayouts);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "removeObject:", self->_toAppLayout);
  objc_msgSend(v4, "addObject:", self->_remainingAppLayout);
  objc_msgSend(v4, "addObject:", self->_removedAppLayout);
  return v4;
}

- (int64_t)wallpaperStyle
{
  return 3;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(0, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedAppLayout, 0);
  objc_storeStrong((id *)&self->_remainingAppLayout, 0);
  objc_storeStrong((id *)&self->_toAppLayout, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
}

@end
