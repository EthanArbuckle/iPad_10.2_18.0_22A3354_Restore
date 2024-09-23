@implementation SBContinuousExposeWindowDropSwitcherModifier

- (SBContinuousExposeWindowDropSwitcherModifier)initWithTransitionID:(id)a3 selectedDisplayItem:(id)a4 toAppLayout:(id)a5 initialAppLayout:(id)a6
{
  id v12;
  id v13;
  id v14;
  SBContinuousExposeWindowDropSwitcherModifier *v15;
  SBSplitDisplayItemSwitcherModifier *v16;
  void *v18;
  objc_super v19;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)SBContinuousExposeWindowDropSwitcherModifier;
  v15 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v19, sel_initWithTransitionID_, a3);
  if (v15)
  {
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("SBContinuousExposeWindowDropSwitcherModifier.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("selectedDisplayItem"));

    }
    objc_storeStrong((id *)&v15->_selectedDisplayItem, a4);
    objc_storeStrong((id *)&v15->_toAppLayout, a5);
    if ((objc_msgSend(v14, "containsItem:", v12) & 1) != 0 || objc_msgSend(v13, "containsItem:", v12))
    {
      v16 = -[SBSplitDisplayItemSwitcherModifier initWithDisplayItem:]([SBSplitDisplayItemSwitcherModifier alloc], "initWithDisplayItem:", v15->_selectedDisplayItem);
      -[SBChainableModifier addChildModifier:atLevel:key:](v15, "addChildModifier:atLevel:key:", v16, 0, CFSTR("SBContinuousExposeWindowDropSwitcherModifierKeySplitDisplayItem"));

    }
  }

  return v15;
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  void *v5;
  void *v6;
  BOOL v7;
  objc_super v9;

  -[SBContinuousExposeWindowDropSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "containsItem:", self->_selectedDisplayItem)
    && -[SBAppLayout containsItem:](self->_toAppLayout, "containsItem:", self->_selectedDisplayItem))
  {
    v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBContinuousExposeWindowDropSwitcherModifier;
    v7 = -[SBContinuousExposeWindowDropSwitcherModifier shouldUseAnchorPointToPinLayoutRolesToSpace:](&v9, sel_shouldUseAnchorPointToPinLayoutRolesToSpace_, a3);
  }

  return v7;
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
  v10.super_class = (Class)SBContinuousExposeWindowDropSwitcherModifier;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v10, sel_animationAttributesForLayoutElement_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[SBContinuousExposeWindowDropSwitcherModifier switcherSettings](self, "switcherSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "chamoisSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "windowDragAnimationSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayoutSettings:", v8);

  return v5;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  BOOL v7;
  objc_super v9;

  v6 = a4;
  if (-[SBContinuousExposeWindowDropSwitcherModifier _isLayoutRolePartOfWindowDragInteraction:inAppLayout:](self, "_isLayoutRolePartOfWindowDragInteraction:inAppLayout:", a3, v6))
  {
    v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBContinuousExposeWindowDropSwitcherModifier;
    v7 = -[SBContinuousExposeWindowDropSwitcherModifier isLayoutRoleMatchMovedToScene:inAppLayout:](&v9, sel_isLayoutRoleMatchMovedToScene_inAppLayout_, a3, v6);
  }

  return v7;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  double v15;
  SBFullScreenToHomeCenterZoomDownSwitcherModifier *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBContinuousExposeWindowDropSwitcherModifier;
  -[SBTransitionSwitcherModifier handleTransitionEvent:](&v18, sel_handleTransitionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "toEnvironmentMode") == 1)
  {
    -[SBChainableModifier childModifierByKey:](self, "childModifierByKey:", CFSTR("SBContinuousExposeWindowDropSwitcherModifierKeyFullScreenToHomeIcon"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = -[SBContinuousExposeWindowDropSwitcherModifier isReduceMotionEnabled](self, "isReduceMotionEnabled");
      objc_msgSend(v4, "fromAppLayout");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBTransitionSwitcherModifier transitionID](self, "transitionID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "isIconZoomDisabled"))
      {
        v10 = *MEMORY[0x1E0C9D628];
        v11 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 8);
        v12 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 16);
        v13 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 24);
      }
      else
      {
        -[SBContinuousExposeWindowDropSwitcherModifier homeScreenIconFrameForAppLayout:](self, "homeScreenIconFrameForAppLayout:", v8);
      }
      if (((CGRectIsNull(*(CGRect *)&v10) | v7) & 1) != 0)
      {
        if (!v8)
        {
LABEL_12:

          goto LABEL_13;
        }
        -[SBContinuousExposeWindowDropSwitcherModifier homeGestureSettings](self, "homeGestureSettings");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "homeGestureCenterZoomDownCenterYOffsetFactor");
        v16 = -[SBFullScreenToHomeCenterZoomDownSwitcherModifier initWithTransitionID:appLayout:offsetYPercentOfScreenHeight:]([SBFullScreenToHomeCenterZoomDownSwitcherModifier alloc], "initWithTransitionID:appLayout:offsetYPercentOfScreenHeight:", v9, v8, v15);
        -[SBFullScreenToHomeCenterZoomDownSwitcherModifier setShouldForceDefaultAnchorPointForTransition:](v16, "setShouldForceDefaultAnchorPointForTransition:", 1);

      }
      else
      {
        v16 = -[SBFullScreenToHomeIconZoomSwitcherModifier initWithTransitionID:appLayout:direction:]([SBFullScreenToHomeIconZoomSwitcherModifier alloc], "initWithTransitionID:appLayout:direction:", v9, v8, 1);
        -[SBFullScreenToHomeCenterZoomDownSwitcherModifier setShouldForceDefaultAnchorPointForTransition:](v16, "setShouldForceDefaultAnchorPointForTransition:", -[SBContinuousExposeWindowDropSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled"));
        -[SBFullScreenToHomeCenterZoomDownSwitcherModifier setShouldDockOrderFrontDuringTransition:](v16, "setShouldDockOrderFrontDuringTransition:", -[SBContinuousExposeWindowDropSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled"));
      }
      if (v16)
      {
        -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", v16, 1, CFSTR("SBContinuousExposeWindowDropSwitcherModifierKeyFullScreenToHomeIcon"));

      }
      goto LABEL_12;
    }
  }
LABEL_13:

  return v5;
}

- (id)transitionDidEnd
{
  void *v2;
  SBInvalidateAdjustedAppLayoutsSwitcherEventResponse *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBContinuousExposeWindowDropSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionDidEnd](&v6, sel_transitionDidEnd);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
  SBAppendSwitcherModifierResponse(v3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)asyncRenderingDisabled
{
  return 1;
}

- (id)handleSceneReadyEvent:(id)a3
{
  void *v3;
  SBUpdateLayoutSwitcherEventResponse *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBContinuousExposeWindowDropSwitcherModifier;
  -[SBSwitcherModifier handleSceneReadyEvent:](&v7, sel_handleSceneReadyEvent_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 32, 2);
  SBAppendSwitcherModifierResponse(v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_appLayoutContainingDisplayItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, void *);
  void *v14;
  id v15;

  v4 = a3;
  -[SBContinuousExposeWindowDropSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __80__SBContinuousExposeWindowDropSwitcherModifier__appLayoutContainingDisplayItem___block_invoke;
  v14 = &unk_1E8E9DF78;
  v6 = v4;
  v15 = v6;
  objc_msgSend(v5, "bs_firstObjectPassingTest:", &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    SBLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

    if (v9)
      NSLog(CFSTR("Expected an app layout containing item '%@'"), self->_selectedDisplayItem, v11, v12, v13, v14);
  }

  return v7;
}

uint64_t __80__SBContinuousExposeWindowDropSwitcherModifier__appLayoutContainingDisplayItem___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsItem:", *(_QWORD *)(a1 + 32));
}

- (BOOL)_isLayoutRolePartOfWindowDragInteraction:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  SBAppLayout *toAppLayout;
  void *v8;
  char v9;
  SBDisplayItem *selectedDisplayItem;
  void *v11;

  v6 = a4;
  toAppLayout = self->_toAppLayout;
  objc_msgSend(v6, "itemForLayoutRole:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBAppLayout containsItem:](toAppLayout, "containsItem:", v8))
  {
    v9 = 1;
  }
  else
  {
    selectedDisplayItem = self->_selectedDisplayItem;
    objc_msgSend(v6, "itemForLayoutRole:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SBDisplayItem isEqual:](selectedDisplayItem, "isEqual:", v11);

  }
  return v9;
}

- (SBDisplayItem)selectedDisplayItem
{
  return self->_selectedDisplayItem;
}

- (SBAppLayout)toAppLayout
{
  return self->_toAppLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toAppLayout, 0);
  objc_storeStrong((id *)&self->_selectedDisplayItem, 0);
}

@end
