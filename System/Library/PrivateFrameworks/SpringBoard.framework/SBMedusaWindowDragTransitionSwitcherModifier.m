@implementation SBMedusaWindowDragTransitionSwitcherModifier

- (SBMedusaWindowDragTransitionSwitcherModifier)initWithTransitionID:(id)a3 selectedAppLayout:(id)a4 fromAppLayout:(id)a5 toAppLayout:(id)a6 toFloatingAppLayout:(id)a7 toHomeScreenPeek:(BOOL)a8 toAppExposeBundleIdentifier:(id)a9 initiallyBlurredDisplayItems:(id)a10 windowDragDestination:(unint64_t)a11
{
  id v17;
  id v18;
  id v19;
  SBMedusaWindowDragTransitionSwitcherModifier *v20;
  SBMedusaWindowDragTransitionSwitcherModifier *v21;
  id *p_fromAppLayout;
  void *v23;
  SBSwitcherShelf *v24;
  SBShelfZoomTransitionModifier *v25;
  uint64_t v26;
  NSMutableSet *waitingForSceneUpdateForDisplayItems;
  id v28;
  SBMedusaWindowDragTransitionSwitcherModifier *v29;
  uint64_t v30;
  SBAppLayout *discardedAppLayout;
  SBAppLayout *v32;
  id v33;
  void *v34;
  id v36;
  id v37;
  id v38;
  id v39;
  _QWORD v40[4];
  SBMedusaWindowDragTransitionSwitcherModifier *v41;
  objc_super v42;

  v17 = a3;
  v37 = a4;
  v39 = a5;
  v38 = a6;
  v36 = a7;
  v18 = a9;
  v19 = a10;
  v42.receiver = self;
  v42.super_class = (Class)SBMedusaWindowDragTransitionSwitcherModifier;
  v20 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v42, sel_initWithTransitionID_, v17);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_selectedAppLayout, a4);
    p_fromAppLayout = (id *)&v21->_fromAppLayout;
    objc_storeStrong((id *)&v21->_fromAppLayout, a5);
    objc_storeStrong((id *)&v21->_toAppLayout, a6);
    objc_storeStrong((id *)&v21->_toFloatingAppLayout, a7);
    v21->_isGoingToHomeScreenPeek = a8;
    v21->_finalWindowDragDestination = a11;
    if (v18)
    {
      objc_msgSend(*p_fromAppLayout, "itemForLayoutRole:", 4);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        v24 = -[SBSwitcherShelf initWithBundleIdentifier:layoutRole:displayMode:]([SBSwitcherShelf alloc], "initWithBundleIdentifier:layoutRole:displayMode:", v18, 0, 0);
        v25 = -[SBShelfZoomTransitionModifier initWithTransitionID:direction:fromAppLayout:toAppLayout:shelf:]([SBShelfZoomTransitionModifier alloc], "initWithTransitionID:direction:fromAppLayout:toAppLayout:shelf:", v17, 0, v39, v38, v24);
        -[SBChainableModifier addChildModifier:](v21, "addChildModifier:", v25);

      }
    }
    objc_storeStrong((id *)&v21->_initiallyBlurredDisplayItems, a10);
    v26 = objc_msgSend(v19, "mutableCopy");
    waitingForSceneUpdateForDisplayItems = v21->_waitingForSceneUpdateForDisplayItems;
    v21->_waitingForSceneUpdateForDisplayItems = (NSMutableSet *)v26;

    v28 = *p_fromAppLayout;
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __229__SBMedusaWindowDragTransitionSwitcherModifier_initWithTransitionID_selectedAppLayout_fromAppLayout_toAppLayout_toFloatingAppLayout_toHomeScreenPeek_toAppExposeBundleIdentifier_initiallyBlurredDisplayItems_windowDragDestination___block_invoke;
    v40[3] = &unk_1E8E9DF50;
    v29 = v21;
    v41 = v29;
    objc_msgSend(v28, "appLayoutWithItemsPassingTest:", v40);
    v30 = objc_claimAutoreleasedReturnValue();
    discardedAppLayout = v29->_discardedAppLayout;
    v29->_discardedAppLayout = (SBAppLayout *)v30;

    v32 = v29->_discardedAppLayout;
    if (v32)
    {
      v33 = *p_fromAppLayout;
      -[SBAppLayout itemForLayoutRole:](v32, "itemForLayoutRole:", 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v29->_discardedLayoutRole = objc_msgSend(v33, "layoutRoleForItem:", v34);

    }
    else
    {
      v29->_discardedLayoutRole = 0;
    }

  }
  return v21;
}

uint64_t __229__SBMedusaWindowDragTransitionSwitcherModifier_initWithTransitionID_selectedAppLayout_fromAppLayout_toAppLayout_toFloatingAppLayout_toHomeScreenPeek_toAppExposeBundleIdentifier_initiallyBlurredDisplayItems_windowDragDestination___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "containsItem:", a2) ^ 1;
}

- (void)didMoveToParentModifier:(id)a3
{
  void *v5;
  SBSplitDisplayItemSwitcherModifier *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBMedusaWindowDragTransitionSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v7, sel_didMoveToParentModifier_);
  if (a3)
  {
    if (!self->_hasAddedChildTransitionModifiers)
    {
      self->_hasAddedChildTransitionModifiers = 1;
      -[SBAppLayout itemForLayoutRole:](self->_selectedAppLayout, "itemForLayoutRole:", 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[SBSplitDisplayItemSwitcherModifier initWithDisplayItem:]([SBSplitDisplayItemSwitcherModifier alloc], "initWithDisplayItem:", v5);
      -[SBChainableModifier addChildModifier:](self, "addChildModifier:", v6);

    }
  }
}

- (id)appLayoutContainingAppLayout:(id)a3
{
  id v4;
  void *v5;
  SBAppLayout *v6;
  SBAppLayout *v7;
  objc_super v9;

  v4 = a3;
  v5 = v4;
  if (self->_isGoingToHomeScreenPeek && objc_msgSend(v4, "isEqual:", self->_selectedAppLayout))
  {
    v6 = self->_fromAppLayout;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBMedusaWindowDragTransitionSwitcherModifier;
    -[SBMedusaWindowDragTransitionSwitcherModifier appLayoutContainingAppLayout:](&v9, sel_appLayoutContainingAppLayout_, v5);
    v6 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
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
  int64_t discardedLayoutRole;
  double v23;
  double v24;
  double v25;
  double v26;
  objc_super v27;
  CGRect result;

  v27.receiver = self;
  v27.super_class = (Class)SBMedusaWindowDragTransitionSwitcherModifier;
  -[SBMedusaWindowDragTransitionSwitcherModifier frameForIndex:](&v27, sel_frameForIndex_);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  if (self->_finalWindowDragDestination - 11 <= 1)
  {
    -[SBMedusaWindowDragTransitionSwitcherModifier appLayouts](self, "appLayouts");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndex:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v14, "isOrContainsAppLayout:", self->_discardedAppLayout))
    {
      v20 = v10;
LABEL_12:

      v10 = v20;
      goto LABEL_13;
    }
    -[SBMedusaWindowDragTransitionSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
    v16 = v15;
    -[SBMedusaWindowDragTransitionSwitcherModifier separatorViewWidth](self, "separatorViewWidth");
    v18 = v17 * 0.5;
    SBRectWithSize();
    v20 = v19;
    v12 = v21;
    discardedLayoutRole = self->_discardedLayoutRole;
    if (discardedLayoutRole == 1)
    {
      if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") != 1)
        goto LABEL_8;
      discardedLayoutRole = self->_discardedLayoutRole;
    }
    if (discardedLayoutRole != 2 || objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") != 1)
    {
      v6 = v16 + v18;
      goto LABEL_11;
    }
LABEL_8:
    v6 = -(v10 + v18);
LABEL_11:
    v8 = 0.0;
    goto LABEL_12;
  }
LABEL_13:
  v23 = v6;
  v24 = v8;
  v25 = v10;
  v26 = v12;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (id)topMostLayoutElements
{
  void *v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBMedusaWindowDragTransitionSwitcherModifier;
  -[SBMedusaWindowDragTransitionSwitcherModifier topMostLayoutElements](&v6, sel_topMostLayoutElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBAppLayout containsAnyItemFromAppLayout:](self->_fromAppLayout, "containsAnyItemFromAppLayout:", self->_selectedAppLayout)&& !-[SBAppLayout containsAnyItemFromAppLayout:](self->_toAppLayout, "containsAnyItemFromAppLayout:", self->_selectedAppLayout)&& !self->_isGoingToHomeScreenPeek)
  {
    objc_msgSend(v3, "sb_arrayByInsertingOrMovingObject:toIndex:", self->_selectedAppLayout, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return v3;
}

- (id)transitionDidEnd
{
  void *v3;
  SBAddModifierSwitcherEventResponse *v4;
  SBSlideOverAppsInFullScreenSwitcherSwitcherModifier *v5;
  SBAddModifierSwitcherEventResponse *v6;
  uint64_t v7;
  SBInvalidateAdjustedAppLayoutsSwitcherEventResponse *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBMedusaWindowDragTransitionSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionDidEnd](&v11, sel_transitionDidEnd);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_isGoingToHomeScreenPeek && !self->_toFloatingAppLayout)
  {
    v4 = [SBAddModifierSwitcherEventResponse alloc];
    v5 = objc_alloc_init(SBSlideOverAppsInFullScreenSwitcherSwitcherModifier);
    v6 = -[SBAddModifierSwitcherEventResponse initWithModifier:level:](v4, "initWithModifier:level:", v5, 3);

    SBAppendSwitcherModifierResponse(v6, v3);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  v8 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
  SBAppendSwitcherModifierResponse(v8, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)handleSceneReadyEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  SBUpdateLayoutSwitcherEventResponse *v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBMedusaWindowDragTransitionSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier handleSceneReadyEvent:](&v11, sel_handleSceneReadyEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appLayout", v11.receiver, v11.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "itemForLayoutRole:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableSet containsObject:](self->_waitingForSceneUpdateForDisplayItems, "containsObject:", v7))
  {
    if (-[SBMedusaWindowDragTransitionSwitcherModifier isLayoutRoleContentReady:inAppLayout:](self, "isLayoutRoleContentReady:inAppLayout:", 1, v6))
    {
      -[NSMutableSet removeObject:](self->_waitingForSceneUpdateForDisplayItems, "removeObject:", v7);
      if (!-[NSMutableSet count](self->_waitingForSceneUpdateForDisplayItems, "count"))
      {
        v8 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 32, 2);
        SBAppendSwitcherModifierResponse(v8, v5);
        v9 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v9;
      }
    }
  }

  return v5;
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  return 0;
}

- (double)backgroundOpacityForIndex:(unint64_t)a3
{
  return 0.0;
}

- (double)homeScreenDimmingAlpha
{
  void *v3;
  uint64_t v4;
  double result;
  objc_super v6;

  if (self->_isGoingToHomeScreenPeek
    || (-[SBAppLayout allItems](self->_toAppLayout, "allItems"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "count"),
        v3,
        result = 1.0,
        !v4))
  {
    v6.receiver = self;
    v6.super_class = (Class)SBMedusaWindowDragTransitionSwitcherModifier;
    -[SBMedusaWindowDragTransitionSwitcherModifier homeScreenDimmingAlpha](&v6, sel_homeScreenDimmingAlpha);
  }
  return result;
}

- (int64_t)homeScreenBackdropBlurType
{
  return 3;
}

- (BOOL)isWallpaperRequiredForSwitcher
{
  return 1;
}

- (int64_t)wallpaperStyle
{
  return 1;
}

- (BOOL)isHomeScreenContentRequired
{
  return 1;
}

- (BOOL)isSwitcherWindowVisible
{
  return 1;
}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  void *v5;
  BOOL v6;

  objc_msgSend(a4, "itemForLayoutRole:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NSMutableSet count](self->_waitingForSceneUpdateForDisplayItems, "count")
    && -[NSSet containsObject:](self->_initiallyBlurredDisplayItems, "containsObject:", v5);

  return v6;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  void *v7;
  void *v8;
  double v9;
  double v10;
  objc_super v12;

  -[SBMedusaWindowDragTransitionSwitcherModifier appLayouts](self, "appLayouts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 1.0;
  if (!-[SBAppLayout isOrContainsAppLayout:](self->_fromAppLayout, "isOrContainsAppLayout:", v8)
    && !-[SBAppLayout isOrContainsAppLayout:](self->_toAppLayout, "isOrContainsAppLayout:", v8))
  {
    v12.receiver = self;
    v12.super_class = (Class)SBMedusaWindowDragTransitionSwitcherModifier;
    -[SBMedusaWindowDragTransitionSwitcherModifier shadowOpacityForLayoutRole:atIndex:](&v12, sel_shadowOpacityForLayoutRole_atIndex_, a3, a4);
    v9 = v10;
  }

  return v9;
}

- (id)appLayoutToAttachSlideOverTongue
{
  return 0;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBMedusaWindowDragTransitionSwitcherModifier;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v9, sel_animationAttributesForLayoutElement_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[SBMedusaWindowDragTransitionSwitcherModifier _goingToHomeScreenPeekFromSplitView](self, "_goingToHomeScreenPeekFromSplitView")&& !-[SBMedusaWindowDragTransitionSwitcherModifier _minimizingCenterWindow](self, "_minimizingCenterWindow"))
  {
    v5 = (void *)objc_msgSend(v4, "mutableCopy");
    -[SBMedusaWindowDragTransitionSwitcherModifier medusaSettings](self, "medusaSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dropAnimationSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLayoutSettings:", v7);

    v4 = v5;
  }
  return v4;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  id v4;
  unsigned __int16 v5;
  SBSwitcherAsyncRenderingAttributes v6;
  objc_super v8;

  v4 = a3;
  if (-[SBMedusaWindowDragTransitionSwitcherModifier _minimizingCenterWindow](self, "_minimizingCenterWindow")
    && objc_msgSend(v4, "isEqual:", self->_toAppLayout))
  {
    v5 = SBSwitcherAsyncRenderingAttributesMake(0, 0);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBMedusaWindowDragTransitionSwitcherModifier;
    v5 = (unsigned __int16)-[SBTransitionSwitcherModifier asyncRenderingAttributesForAppLayout:](&v8, sel_asyncRenderingAttributesForAppLayout_, v4);
  }
  v6 = (SBSwitcherAsyncRenderingAttributes)v5;

  return v6;
}

- (BOOL)_goingToHomeScreenPeekFromSplitView
{
  return self->_isGoingToHomeScreenPeek
      && -[SBAppLayout isSplitConfiguration](self->_fromAppLayout, "isSplitConfiguration");
}

- (BOOL)_minimizingCenterWindow
{
  void *v3;
  void *v4;
  int v5;
  _BOOL4 v6;

  -[SBAppLayout itemForLayoutRole:](self->_selectedAppLayout, "itemForLayoutRole:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppLayout itemForLayoutRole:](self->_fromAppLayout, "itemForLayoutRole:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  if (v5 && !-[SBAppLayout containsItem:](self->_toAppLayout, "containsItem:", v3))
    v6 = !-[SBAppLayout containsItem:](self->_toFloatingAppLayout, "containsItem:", v3);
  else
    LOBYTE(v6) = 0;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitingForSceneUpdateForDisplayItems, 0);
  objc_storeStrong((id *)&self->_initiallyBlurredDisplayItems, 0);
  objc_storeStrong((id *)&self->_discardedAppLayout, 0);
  objc_storeStrong((id *)&self->_toFloatingAppLayout, 0);
  objc_storeStrong((id *)&self->_toAppLayout, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
  objc_storeStrong((id *)&self->_selectedAppLayout, 0);
}

@end
