@implementation SBShelfZoomTransitionModifier

- (SBShelfZoomTransitionModifier)initWithTransitionID:(id)a3 direction:(unint64_t)a4 fromAppLayout:(id)a5 toAppLayout:(id)a6 shelf:(id)a7
{
  id v13;
  id v14;
  id v15;
  SBShelfZoomTransitionModifier *v16;
  SBShelfZoomTransitionModifier *v17;
  id *p_fromAppLayout;
  id *p_toAppLayout;
  uint64_t v20;
  SBAppLayout *centerWindowAppLayout;
  id v22;
  id *v23;
  SBShelfZoomTransitionModifier *v24;
  uint64_t v25;
  SBAppLayout *fullScreenSpaceAppLayout;
  uint64_t v27;
  SBAppLayout *centerWindowBeingReplacedAppLayout;
  uint64_t v29;
  SBAppLayout *v30;
  id v31;
  SBShelfZoomTransitionModifier *v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, void *);
  void *v38;
  SBShelfZoomTransitionModifier *v39;
  _QWORD v40[4];
  SBShelfZoomTransitionModifier *v41;
  objc_super v42;

  v13 = a5;
  v14 = a6;
  v15 = a7;
  v42.receiver = self;
  v42.super_class = (Class)SBShelfZoomTransitionModifier;
  v16 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v42, sel_initWithTransitionID_, a3);
  v17 = v16;
  if (v16)
  {
    v16->_direction = a4;
    p_fromAppLayout = (id *)&v16->_fromAppLayout;
    objc_storeStrong((id *)&v16->_fromAppLayout, a5);
    p_toAppLayout = (id *)&v17->_toAppLayout;
    objc_storeStrong((id *)&v17->_toAppLayout, a6);
    objc_storeStrong((id *)&v17->_shelf, a7);
    if (v17->_direction)
    {
      objc_msgSend(*p_toAppLayout, "leafAppLayoutForRole:", 4);
      v20 = objc_claimAutoreleasedReturnValue();
      centerWindowAppLayout = v17->_centerWindowAppLayout;
      v17->_centerWindowAppLayout = (SBAppLayout *)v20;

      v22 = *p_toAppLayout;
      v35 = MEMORY[0x1E0C809B0];
      v36 = 3221225472;
      v37 = __96__SBShelfZoomTransitionModifier_initWithTransitionID_direction_fromAppLayout_toAppLayout_shelf___block_invoke_2;
      v38 = &unk_1E8E9DF50;
      v23 = (id *)&v39;
      v24 = v17;
      v39 = v24;
      objc_msgSend(v22, "appLayoutWithItemsPassingTest:", &v35);
      v25 = objc_claimAutoreleasedReturnValue();
      fullScreenSpaceAppLayout = v24->_fullScreenSpaceAppLayout;
      v24->_fullScreenSpaceAppLayout = (SBAppLayout *)v25;

      objc_msgSend(*p_fromAppLayout, "leafAppLayoutForRole:", 4, v35, v36, v37, v38);
      v27 = objc_claimAutoreleasedReturnValue();
      centerWindowBeingReplacedAppLayout = v24->_centerWindowBeingReplacedAppLayout;
      v24->_centerWindowBeingReplacedAppLayout = (SBAppLayout *)v27;
    }
    else
    {
      objc_msgSend(*p_fromAppLayout, "leafAppLayoutForRole:", 4);
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = v17->_centerWindowAppLayout;
      v17->_centerWindowAppLayout = (SBAppLayout *)v29;

      v31 = *p_fromAppLayout;
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __96__SBShelfZoomTransitionModifier_initWithTransitionID_direction_fromAppLayout_toAppLayout_shelf___block_invoke;
      v40[3] = &unk_1E8E9DF50;
      v23 = (id *)&v41;
      v32 = v17;
      v41 = v32;
      objc_msgSend(v31, "appLayoutWithItemsPassingTest:", v40);
      v33 = objc_claimAutoreleasedReturnValue();
      centerWindowBeingReplacedAppLayout = v32->_fullScreenSpaceAppLayout;
      v32->_fullScreenSpaceAppLayout = (SBAppLayout *)v33;
    }

  }
  return v17;
}

uint64_t __96__SBShelfZoomTransitionModifier_initWithTransitionID_direction_fromAppLayout_toAppLayout_shelf___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  int v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 168);
  v3 = a2;
  objc_msgSend(v2, "itemForLayoutRole:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5 ^ 1u;
}

uint64_t __96__SBShelfZoomTransitionModifier_initWithTransitionID_direction_fromAppLayout_toAppLayout_shelf___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  int v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 168);
  v3 = a2;
  objc_msgSend(v2, "itemForLayoutRole:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5 ^ 1u;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  -[SBChainableModifier succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (self->_direction)
    v6 = CFSTR("ToSpace");
  else
    v6 = CFSTR("ToShelf");
  v7 = (id)objc_msgSend(v4, "appendObject:withName:", v6, CFSTR("direction"));
  v8 = (id)objc_msgSend(v5, "appendObject:withName:", self->_fromAppLayout, CFSTR("fromAppLayout"));
  v9 = (id)objc_msgSend(v5, "appendObject:withName:", self->_toAppLayout, CFSTR("toAppLayout"));
  v10 = (id)objc_msgSend(v5, "appendObject:withName:", self->_shelf, CFSTR("shelf"));
  v11 = (id)objc_msgSend(v5, "appendObject:withName:", self->_centerWindowAppLayout, CFSTR("centerWindowAppLayout"));
  v12 = (id)objc_msgSend(v5, "appendObject:withName:", self->_fullScreenSpaceAppLayout, CFSTR("fullScreenSpaceAppLayout"));
  v13 = (id)objc_msgSend(v5, "appendObject:withName:", self->_centerWindowBeingReplacedAppLayout, CFSTR("centerWindowBeingReplacedAppLayout"));
  return v5;
}

- (id)handleGestureEvent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBShelfZoomTransitionModifier;
  -[SBTransitionSwitcherModifier handleGestureEvent:](&v8, sel_handleGestureEvent_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTransitionSwitcherModifier interruptAndEndTransition](self, "interruptAndEndTransition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SBAppendSwitcherModifierResponse(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)transitionWillBegin
{
  void *v3;
  unint64_t direction;
  SBInvalidateAdjustedAppLayoutsSwitcherEventResponse *v5;
  void *v6;
  SBUpdateLayoutSwitcherEventResponse *v7;
  uint64_t v8;
  SBUpdateLayoutSwitcherEventResponse *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBShelfZoomTransitionModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v12, sel_transitionWillBegin);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  direction = self->_direction;
  v5 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
  SBAppendSwitcherModifierResponse(v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [SBUpdateLayoutSwitcherEventResponse alloc];
  if (direction == 1)
    v8 = 3;
  else
    v8 = 2;
  v9 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:](v7, "initWithOptions:updateMode:", 10, v8);
  SBAppendSwitcherModifierResponse(v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)transitionDidEnd
{
  void *v3;
  SBInvalidateAdjustedAppLayoutsSwitcherEventResponse *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBShelfZoomTransitionModifier;
  -[SBTransitionSwitcherModifier transitionDidEnd](&v7, sel_transitionDidEnd);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_direction == 1)
  {
    v4 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
    SBAppendSwitcherModifierResponse(v4, v3);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  return v3;
}

- (id)appLayoutsToEnsureExistForMainTransitionEvent:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  SBAppLayout *centerWindowBeingReplacedAppLayout;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBShelfZoomTransitionModifier;
  -[SBShelfZoomTransitionModifier appLayoutsToEnsureExistForMainTransitionEvent:](&v12, sel_appLayoutsToEnsureExistForMainTransitionEvent_, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = (void *)MEMORY[0x1E0C9AA60];
  if (v4)
    v6 = (void *)v4;
  v7 = v6;

  objc_msgSend(v7, "sb_arrayByInsertingOrMovingObject:toIndex:", self->_centerWindowAppLayout, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  centerWindowBeingReplacedAppLayout = self->_centerWindowBeingReplacedAppLayout;
  if (centerWindowBeingReplacedAppLayout)
  {
    objc_msgSend(v8, "sb_arrayByInsertingOrMovingObject:toIndex:", centerWindowBeingReplacedAppLayout, 1);
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v10;
  }
  return v8;
}

- (id)visibleAppLayouts
{
  void *v3;
  void *v4;
  unint64_t direction;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBShelfZoomTransitionModifier;
  -[SBShelfZoomTransitionModifier visibleAppLayouts](&v8, sel_visibleAppLayouts);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "addObject:", self->_centerWindowAppLayout);
  if (self->_fullScreenSpaceAppLayout)
    objc_msgSend(v4, "addObject:");
  direction = self->_direction;
  if (!direction)
  {
    objc_msgSend(v4, "removeObject:", self->_fromAppLayout);
    direction = self->_direction;
  }
  if (direction == 1)
  {
    objc_msgSend(v4, "removeObject:", self->_toAppLayout);
    if (self->_centerWindowBeingReplacedAppLayout)
      objc_msgSend(v4, "addObject:");
  }
  v6 = (void *)objc_msgSend(v4, "copy");

  return v6;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  void *v5;
  SBAppLayout *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  SBAppLayout *fromAppLayout;
  double v12;
  double v13;
  double v14;
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

  -[SBShelfZoomTransitionModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

  if (v6 == self->_centerWindowAppLayout
    && -[SBShelfZoomTransitionModifier _isEffectivelyInShelf](self, "_isEffectivelyInShelf"))
  {
    -[SBShelfZoomTransitionModifier _frameForCenterWindowInShelf](self, "_frameForCenterWindowInShelf");
  }
  else if (v6 == self->_centerWindowBeingReplacedAppLayout)
  {
    fromAppLayout = self->_fromAppLayout;
    -[SBShelfZoomTransitionModifier containerViewBounds](self, "containerViewBounds");
    -[SBShelfZoomTransitionModifier preferredFrameForLayoutRole:inAppLayout:bounds:interfaceOrientation:](self, "preferredFrameForLayoutRole:inAppLayout:bounds:interfaceOrientation:", 4, fromAppLayout, -[SBShelfZoomTransitionModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation"), v12, v13, v14, v15);
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)SBShelfZoomTransitionModifier;
    -[SBShelfZoomTransitionModifier frameForIndex:](&v24, sel_frameForIndex_, a3);
  }
  v16 = v7;
  v17 = v8;
  v18 = v9;
  v19 = v10;

  v20 = v16;
  v21 = v17;
  v22 = v18;
  v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (CGRect)_frameForCenterWindowInShelf
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[SBShelfZoomTransitionModifier shelfItemFrameForAppLayout:inShelf:](self, "shelfItemFrameForAppLayout:inShelf:", self->_centerWindowAppLayout, self->_shelf);
  UIRectGetCenter();
  -[SBShelfZoomTransitionModifier centerWindowFrameInInterfaceOrientation:centerConfiguration:](self, "centerWindowFrameInInterfaceOrientation:centerConfiguration:", -[SBShelfZoomTransitionModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation"), 1);
  SBRectWithSize();
  UIRectCenteredAboutPoint();
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  void *v5;
  SBAppLayout *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  objc_super v17;

  -[SBShelfZoomTransitionModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

  if (v6 == self->_centerWindowAppLayout
    && -[SBShelfZoomTransitionModifier _isEffectivelyInShelf](self, "_isEffectivelyInShelf"))
  {
    -[SBShelfZoomTransitionModifier shelfItemScaleForAppLayout:inShelf:](self, "shelfItemScaleForAppLayout:inShelf:", self->_centerWindowAppLayout, self->_shelf);
    v8 = v7;
    -[SBShelfZoomTransitionModifier shelfItemFrameForAppLayout:inShelf:](self, "shelfItemFrameForAppLayout:inShelf:", self->_centerWindowAppLayout, self->_shelf);
    v10 = v9;
    -[SBShelfZoomTransitionModifier centerWindowFrameInInterfaceOrientation:centerConfiguration:](self, "centerWindowFrameInInterfaceOrientation:centerConfiguration:", -[SBShelfZoomTransitionModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation"), 1);
    SBRectWithSize();
    v12 = v8 * (v10 / v11);
  }
  else if (v6 == self->_centerWindowBeingReplacedAppLayout)
  {
    -[SBShelfZoomTransitionModifier medusaSettings](self, "medusaSettings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "switcherCenterWindowContentPushInScale");
    v12 = v15;

  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)SBShelfZoomTransitionModifier;
    -[SBShelfZoomTransitionModifier scaleForIndex:](&v17, sel_scaleForIndex_, a3);
    v12 = v13;
  }

  return v12;
}

- (double)scaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  double result;
  objc_super v5;
  objc_super v6;

  if (self->_fullScreenSpaceAppLayout == a4)
    -[SBShelfZoomTransitionModifier scaleForLayoutRole:inAppLayout:](&v6, sel_scaleForLayoutRole_inAppLayout_, a3, self->_toAppLayout, v5.receiver, v5.super_class, self, SBShelfZoomTransitionModifier);
  else
    -[SBShelfZoomTransitionModifier scaleForLayoutRole:inAppLayout:](&v5, sel_scaleForLayoutRole_inAppLayout_, a3, a4, self, SBShelfZoomTransitionModifier, v6.receiver, v6.super_class);
  return result;
}

- (double)contentPageViewScaleForAppLayout:(id)a3 withScale:(double)a4
{
  SBAppLayout *v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  objc_super v12;

  v6 = (SBAppLayout *)a3;
  if (self->_centerWindowAppLayout == v6
    && -[SBShelfZoomTransitionModifier _isEffectivelyInShelf](self, "_isEffectivelyInShelf"))
  {
    -[SBShelfZoomTransitionModifier appLayouts](self, "appLayouts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "indexOfObject:", v6);

    -[SBShelfZoomTransitionModifier scaleForIndex:](self, "scaleForIndex:", v8);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBShelfZoomTransitionModifier;
    -[SBShelfZoomTransitionModifier contentPageViewScaleForAppLayout:withScale:](&v12, sel_contentPageViewScaleForAppLayout_withScale_, v6, a4);
  }
  v10 = v9;

  return v10;
}

- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  objc_super v5;

  if (self->_centerWindowAppLayout == a4)
  {
    if (-[SBShelfZoomTransitionModifier _isEffectivelyInShelf](self, "_isEffectivelyInShelf", a3))
      return 3;
    else
      return 2;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SBShelfZoomTransitionModifier;
    return -[SBShelfZoomTransitionModifier shadowStyleForLayoutRole:inAppLayout:](&v5, sel_shadowStyleForLayoutRole_inAppLayout_, a3);
  }
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  void *v5;
  SBAppLayout *v6;
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

  -[SBShelfZoomTransitionModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

  if (v6 == self->_centerWindowAppLayout
    && -[SBShelfZoomTransitionModifier _isEffectivelyInShelf](self, "_isEffectivelyInShelf"))
  {
    -[SBShelfZoomTransitionModifier shelfItemCornerRadiusForAppLayout:inShelf:](self, "shelfItemCornerRadiusForAppLayout:inShelf:", self->_centerWindowAppLayout, self->_shelf);
    SBRectCornerRadiiForRadius();
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)SBShelfZoomTransitionModifier;
    -[SBShelfZoomTransitionModifier cornerRadiiForIndex:](&v19, sel_cornerRadiiForIndex_, a3);
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

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  SBAppLayout *v8;
  SBAppLayout *v9;
  double v10;
  double v12;
  objc_super v14;

  v8 = (SBAppLayout *)a4;
  v9 = v8;
  v10 = 1.0;
  if (self->_centerWindowAppLayout != v8
    && self->_fullScreenSpaceAppLayout != v8
    && (self->_centerWindowBeingReplacedAppLayout != v8 || a3 != 4))
  {
    v14.receiver = self;
    v14.super_class = (Class)SBShelfZoomTransitionModifier;
    -[SBShelfZoomTransitionModifier opacityForLayoutRole:inAppLayout:atIndex:](&v14, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, v8, a5);
    v10 = v12;
  }

  return v10;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  void *v7;
  SBAppLayout *v8;
  double v9;
  double v10;
  objc_super v12;

  -[SBShelfZoomTransitionModifier appLayouts](self, "appLayouts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a4);
  v8 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

  if (v8 == self->_centerWindowAppLayout)
  {
    v10 = 1.0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBShelfZoomTransitionModifier;
    -[SBShelfZoomTransitionModifier shadowOpacityForLayoutRole:atIndex:](&v12, sel_shadowOpacityForLayoutRole_atIndex_, a3, a4);
    v10 = v9;
  }

  return v10;
}

- (id)hiddenAppLayoutsInShelf:(id)a3
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBShelfZoomTransitionModifier;
  -[SBShelfZoomTransitionModifier hiddenAppLayoutsInShelf:](&v7, sel_hiddenAppLayoutsInShelf_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setByAddingObject:", self->_centerWindowAppLayout);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (double)titleOpacityForIndex:(unint64_t)a3
{
  void *v5;
  SBAppLayout *v6;
  double v7;
  double v8;
  objc_super v10;

  -[SBShelfZoomTransitionModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

  if (v6 != self->_centerWindowAppLayout
    || (v7 = 1.0, !-[SBShelfZoomTransitionModifier _isEffectivelyInShelf](self, "_isEffectivelyInShelf")))
  {
    v10.receiver = self;
    v10.super_class = (Class)SBShelfZoomTransitionModifier;
    -[SBShelfZoomTransitionModifier titleOpacityForIndex:](&v10, sel_titleOpacityForIndex_, a3);
    v7 = v8;
  }

  return v7;
}

- (double)titleAndIconOpacityForIndex:(unint64_t)a3
{
  void *v5;
  SBAppLayout *v6;
  double v7;
  double v8;
  objc_super v10;

  -[SBShelfZoomTransitionModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

  if (v6 != self->_centerWindowAppLayout
    || (v7 = 1.0, !-[SBShelfZoomTransitionModifier _isEffectivelyInShelf](self, "_isEffectivelyInShelf")))
  {
    v10.receiver = self;
    v10.super_class = (Class)SBShelfZoomTransitionModifier;
    -[SBShelfZoomTransitionModifier titleAndIconOpacityForIndex:](&v10, sel_titleAndIconOpacityForIndex_, a3);
    v7 = v8;
  }

  return v7;
}

- (int64_t)headerStyleForIndex:(unint64_t)a3
{
  void *v5;
  SBAppLayout *v6;
  int64_t v7;
  objc_super v9;

  -[SBShelfZoomTransitionModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

  if (v6 == self->_centerWindowAppLayout)
  {
    v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBShelfZoomTransitionModifier;
    v7 = -[SBShelfZoomTransitionModifier headerStyleForIndex:](&v9, sel_headerStyleForIndex_, a3);
  }

  return v7;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  SBAppLayout *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  objc_super v12;

  v6 = (SBAppLayout *)a4;
  v12.receiver = self;
  v12.super_class = (Class)SBShelfZoomTransitionModifier;
  -[SBShelfZoomTransitionModifier dimmingAlphaForLayoutRole:inAppLayout:](&v12, sel_dimmingAlphaForLayoutRole_inAppLayout_, a3, v6);
  v8 = v7;
  if (-[SBShelfZoomTransitionModifier _shouldDimLayoutRole:inAppLayout:forZoomDirection:](self, "_shouldDimLayoutRole:inAppLayout:forZoomDirection:", a3, v6, self->_direction)|| self->_centerWindowBeingReplacedAppLayout == v6)
  {
    -[SBShelfZoomTransitionModifier medusaSettings](self, "medusaSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "defaultDimmingOpacity");
    v8 = v10;

  }
  return v8;
}

- (BOOL)_shouldDimLayoutRole:(int64_t)a3 inAppLayout:(id)a4 forZoomDirection:(unint64_t)a5
{
  _BOOL4 v6;

  if (self->_centerWindowAppLayout == a4)
    return 0;
  v6 = !-[SBShelfZoomTransitionModifier _isEffectivelyInShelf](self, "_isEffectivelyInShelf", a3);
  return a5 == 1 && v6;
}

- (id)topMostLayoutElements
{
  void *v3;
  void *v4;
  SBAppLayout *centerWindowBeingReplacedAppLayout;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBShelfZoomTransitionModifier;
  -[SBShelfZoomTransitionModifier topMostLayoutElements](&v8, sel_topMostLayoutElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sb_arrayByInsertingOrMovingObject:toIndex:", self->_centerWindowAppLayout, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  centerWindowBeingReplacedAppLayout = self->_centerWindowBeingReplacedAppLayout;
  if (centerWindowBeingReplacedAppLayout)
  {
    objc_msgSend(v4, "sb_arrayByInsertingOrMovingObject:toIndex:", centerWindowBeingReplacedAppLayout, 1);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  return v4;
}

- (double)perspectiveAngleForAppLayout:(id)a3
{
  id v4;
  double v5;
  double v6;
  objc_super v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isEqual:", self->_centerWindowAppLayout)
    || (v5 = 0.0, !-[SBShelfZoomTransitionModifier _isEffectivelyInShelf](self, "_isEffectivelyInShelf")))
  {
    v8.receiver = self;
    v8.super_class = (Class)SBShelfZoomTransitionModifier;
    -[SBShelfZoomTransitionModifier perspectiveAngleForAppLayout:](&v8, sel_perspectiveAngleForAppLayout_, v4);
    v5 = v6;
  }

  return v5;
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBShelfZoomTransitionModifier;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v12, sel_animationAttributesForLayoutElement_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[SBShelfZoomTransitionModifier switcherSettings](self, "switcherSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "animationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_direction == 1)
  {
    objc_msgSend(v7, "homeGestureEdgeRowZoomUpSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLayoutSettings:", v8);
  }
  else
  {
    objc_msgSend(v7, "homeGestureTopRowZoomDownLayoutSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLayoutSettings:", v9);

    objc_msgSend(v7, "homeGestureTopRowZoomDownPositionSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPositionSettings:", v10);

    objc_msgSend(v7, "homeGestureTopRowZoomDownScaleSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setScaleSettings:", v8);
  }

  return v5;
}

- (SBSwitcherShelfPresentationAttributes)presentationAttributesForShelf:(SEL)a3
{
  SBSwitcherShelfPresentationAttributes *result;
  objc_super v6;

  retstr->var3 = 0;
  *(_OWORD *)&retstr->var1.origin.y = 0u;
  *(_OWORD *)&retstr->var1.size.height = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  v6.receiver = self;
  v6.super_class = (Class)SBShelfZoomTransitionModifier;
  result = (SBSwitcherShelfPresentationAttributes *)-[SBSwitcherShelfPresentationAttributes presentationAttributesForShelf:](&v6, sel_presentationAttributesForShelf_, a4);
  retstr->var2 = 0;
  return result;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(0, 0);
}

- (BOOL)_isEffectivelyInShelf
{
  unint64_t direction;
  BOOL v4;
  BOOL v5;

  direction = self->_direction;
  if (direction != 1)
  {
    v4 = 0;
    if (direction)
      goto LABEL_3;
LABEL_5:
    v5 = -[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase") > 1;
    return v4 || v5;
  }
  v4 = -[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase") == 1;
  if (!self->_direction)
    goto LABEL_5;
LABEL_3:
  v5 = 0;
  return v4 || v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centerWindowBeingReplacedAppLayout, 0);
  objc_storeStrong((id *)&self->_fullScreenSpaceAppLayout, 0);
  objc_storeStrong((id *)&self->_centerWindowAppLayout, 0);
  objc_storeStrong((id *)&self->_shelf, 0);
  objc_storeStrong((id *)&self->_toAppLayout, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
}

@end
