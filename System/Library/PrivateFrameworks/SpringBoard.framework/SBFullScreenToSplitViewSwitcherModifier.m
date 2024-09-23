@implementation SBFullScreenToSplitViewSwitcherModifier

- (SBFullScreenToSplitViewSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5
{
  id v10;
  id v11;
  SBFullScreenToSplitViewSwitcherModifier *v12;
  uint64_t v13;
  SBAppLayout *incomingAppLayout;
  void *v16;
  void *v17;
  objc_super v18;

  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SBFullScreenToSplitViewSwitcherModifier;
  v12 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v18, sel_initWithTransitionID_, a3);
  if (v12)
  {
    if (v10)
    {
      if (v11)
      {
LABEL_4:
        objc_storeStrong((id *)&v12->_existingAppLayout, a4);
        objc_msgSend(v11, "leafAppLayoutForRole:", 2);
        v13 = objc_claimAutoreleasedReturnValue();
        incomingAppLayout = v12->_incomingAppLayout;
        v12->_incomingAppLayout = (SBAppLayout *)v13;

        v12->_blurExistingDisplayItem = 1;
        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("SBFullScreenToSplitViewSwitcherModifier.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromAppLayout"));

      if (v11)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("SBFullScreenToSplitViewSwitcherModifier.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toAppLayout"));

    goto LABEL_4;
  }
LABEL_5:

  return v12;
}

- (id)transitionWillBegin
{
  void *v2;
  SBUpdateLayoutSwitcherEventResponse *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenToSplitViewSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v6, sel_transitionWillBegin);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 10, 4);
  SBAppendSwitcherModifierResponse(v3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)handleSceneReadyEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char blurExistingDisplayItem;
  SBAppLayout *existingAppLayout;
  SBUpdateLayoutSwitcherEventResponse *v9;
  void *v10;
  objc_super v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBFullScreenToSplitViewSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier handleSceneReadyEvent:](&v13, sel_handleSceneReadyEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "containsAllItemsFromAppLayout:", self->_existingAppLayout))
  {
    blurExistingDisplayItem = self->_blurExistingDisplayItem;
    if (blurExistingDisplayItem)
    {
      existingAppLayout = self->_existingAppLayout;
      v12.receiver = self;
      v12.super_class = (Class)SBFullScreenToSplitViewSwitcherModifier;
      blurExistingDisplayItem = -[SBFullScreenToSplitViewSwitcherModifier isLayoutRoleContentReady:inAppLayout:](&v12, sel_isLayoutRoleContentReady_inAppLayout_, 1, existingAppLayout) ^ 1;
    }
    self->_blurExistingDisplayItem = blurExistingDisplayItem;
  }
  v9 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 32, 2);
  SBAppendSwitcherModifierResponse(v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  SBAppLayout *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = (SBAppLayout *)a3;
  v13.receiver = self;
  v13.super_class = (Class)SBFullScreenToSplitViewSwitcherModifier;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v13, sel_animationAttributesForLayoutElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_existingAppLayout == v4)
  {
    -[SBFullScreenToSplitViewSwitcherModifier entityRemovalSettings](self, "entityRemovalSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "medusaDeleteIntentAnimationSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v7, "toBeMadeFullscreenFrameAnimationSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLayoutSettings:", v10);
    goto LABEL_5;
  }
  if (self->_incomingAppLayout == v4)
  {
    -[SBFullScreenToSplitViewSwitcherModifier entityRemovalSettings](self, "entityRemovalSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "medusaDeleteIntentAnimationSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v7, "toBeRemovedScaleAnimationSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setScaleSettings:", v9);

    objc_msgSend(v7, "toBeRemovedAlphaAnimationSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setOpacitySettings:", v10);
LABEL_5:

    v5 = v8;
  }

  return v5;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  objc_super v5;

  if (self->_existingAppLayout == a4)
    return 1;
  v5.receiver = self;
  v5.super_class = (Class)SBFullScreenToSplitViewSwitcherModifier;
  return -[SBFullScreenToSplitViewSwitcherModifier isLayoutRoleMatchMovedToScene:inAppLayout:](&v5, sel_isLayoutRoleMatchMovedToScene_inAppLayout_, a3);
}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  objc_super v5;

  if (self->_existingAppLayout == a4)
    return self->_blurExistingDisplayItem;
  v5.receiver = self;
  v5.super_class = (Class)SBFullScreenToSplitViewSwitcherModifier;
  return -[SBFullScreenToSplitViewSwitcherModifier isLayoutRoleBlurred:inAppLayout:](&v5, sel_isLayoutRoleBlurred_inAppLayout_, a3);
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  void *v7;
  void *v8;
  double v9;
  double v10;
  objc_super v12;

  -[SBFullScreenToSplitViewSwitcherModifier appLayouts](self, "appLayouts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 1.0;
  if ((objc_msgSend(v8, "isEqual:", self->_existingAppLayout) & 1) == 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)SBFullScreenToSplitViewSwitcherModifier;
    -[SBFullScreenToSplitViewSwitcherModifier shadowOpacityForLayoutRole:atIndex:](&v12, sel_shadowOpacityForLayoutRole_atIndex_, a3, a4);
    v9 = v10;
  }

  return v9;
}

- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  SBAppLayout *v6;
  double v7;
  double v8;
  SBAppLayout *existingAppLayout;
  void *v10;
  void *v11;
  double v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SBFullScreenToSplitViewSwitcherModifier;
  v6 = (SBAppLayout *)a4;
  -[SBFullScreenToSplitViewSwitcherModifier blurDelayForLayoutRole:inAppLayout:](&v14, sel_blurDelayForLayoutRole_inAppLayout_, a3, v6);
  v8 = v7;
  existingAppLayout = self->_existingAppLayout;

  if (existingAppLayout == v6)
  {
    -[SBFullScreenToSplitViewSwitcherModifier switcherSettings](self, "switcherSettings", v14.receiver, v14.super_class);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "animationSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resizeBlurDelay");
    v8 = v12;

  }
  return v8;
}

- (double)backgroundOpacityForIndex:(unint64_t)a3
{
  void *v5;
  SBAppLayout *v6;
  double v7;
  double v8;
  objc_super v10;

  -[SBFullScreenToSplitViewSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

  if (v6 == self->_existingAppLayout)
  {
    v8 = 0.0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SBFullScreenToSplitViewSwitcherModifier;
    -[SBFullScreenToSplitViewSwitcherModifier backgroundOpacityForIndex:](&v10, sel_backgroundOpacityForIndex_, a3);
    v8 = v7;
  }

  return v8;
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
  if (self->_incomingAppLayout == v8 && -[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase") == 1)
  {
    -[SBFullScreenToSplitViewSwitcherModifier entityRemovalSettings](self, "entityRemovalSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "medusaDeleteIntentAnimationSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "toBeRemovedFinalAlpha");
    v12 = v11;

  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)SBFullScreenToSplitViewSwitcherModifier;
    -[SBFullScreenToSplitViewSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](&v15, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, v8, a5);
    v12 = v13;
  }

  return v12;
}

- (double)scaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  SBAppLayout *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  v6 = (SBAppLayout *)a4;
  if (self->_incomingAppLayout == v6 && -[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase") == 1)
  {
    -[SBFullScreenToSplitViewSwitcherModifier entityRemovalSettings](self, "entityRemovalSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "medusaDeleteIntentAnimationSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "toBeRemovedFinalScale");
    v10 = v9;

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SBFullScreenToSplitViewSwitcherModifier;
    -[SBFullScreenToSplitViewSwitcherModifier scaleForLayoutRole:inAppLayout:](&v13, sel_scaleForLayoutRole_inAppLayout_, a3, v6);
    v10 = v11;
  }

  return v10;
}

- (id)topMostLayoutElements
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenToSplitViewSwitcherModifier;
  -[SBFullScreenToSplitViewSwitcherModifier topMostLayoutElements](&v6, sel_topMostLayoutElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sb_arrayByInsertingOrMovingObject:toIndex:", self->_existingAppLayout, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)visibleAppLayouts
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenToSplitViewSwitcherModifier;
  -[SBFullScreenToSplitViewSwitcherModifier visibleAppLayouts](&v6, sel_visibleAppLayouts);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObject:", self->_incomingAppLayout);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isWallpaperRequiredForSwitcher
{
  return 1;
}

- (int64_t)wallpaperStyle
{
  return 2;
}

- (double)homeScreenDimmingAlpha
{
  unint64_t v2;
  double result;

  v2 = -[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase");
  result = 1.0;
  if (v2 == 1)
    return 0.0;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incomingAppLayout, 0);
  objc_storeStrong((id *)&self->_existingAppLayout, 0);
}

@end
