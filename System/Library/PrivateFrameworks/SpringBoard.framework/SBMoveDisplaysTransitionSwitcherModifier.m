@implementation SBMoveDisplaysTransitionSwitcherModifier

- (SBMoveDisplaysTransitionSwitcherModifier)initWithTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  SBMoveDisplaysTransitionSwitcherModifier *v6;
  SBTransitionSwitcherModifierMoveDisplaysContext *v7;
  void *v8;
  void *v9;
  SBAppLayout *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t i;
  SBAppLayout *v17;
  SBTransitionSwitcherModifierMoveDisplaysContext *moveDisplaysContext;
  SBTransitionSwitcherModifierMoveDisplaysContext *v19;
  SBAppLayout *remainingAppLayout;
  SBAppLayout *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "transitionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27.receiver = self;
  v27.super_class = (Class)SBMoveDisplaysTransitionSwitcherModifier;
  v6 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v27, sel_initWithTransitionID_, v5);

  if (v6)
  {
    objc_msgSend(v4, "moveDisplaysContext");
    v7 = (SBTransitionSwitcherModifierMoveDisplaysContext *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fromAppLayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toAppLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "containsAnyItemFromAppLayout:", v8) && (v10 = v9) != 0)
    {
      v22 = v10;
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      -[SBTransitionSwitcherModifierMoveDisplaysContext movingDisplayItems](v7, "movingDisplayItems");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v12)
      {
        v13 = v12;
        v14 = 0;
        v15 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v24 != v15)
              objc_enumerationMutation(v11);
            v14 |= SBLayoutRoleIsValidForSplitView(objc_msgSend(v8, "layoutRoleForItem:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i)));
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        }
        while (v13);
      }
      else
      {
        LOBYTE(v14) = 0;
      }

      v17 = v22;
    }
    else
    {
      v17 = 0;
      LOBYTE(v14) = 0;
    }
    moveDisplaysContext = v6->_moveDisplaysContext;
    v6->_moveDisplaysContext = v7;
    v19 = v7;

    remainingAppLayout = v6->_remainingAppLayout;
    v6->_remainingAppLayout = v17;

    v6->_remainingAppLayoutNeedsLayout = v14 & 1;
  }

  return v6;
}

- (id)transitionWillBegin
{
  void *v2;
  SBInvalidateAdjustedAppLayoutsSwitcherEventResponse *v3;
  void *v4;
  SBUpdateLayoutSwitcherEventResponse *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBMoveDisplaysTransitionSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v8, sel_transitionWillBegin);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
  SBAppendSwitcherModifierResponse(v3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 2, 2);
  SBAppendSwitcherModifierResponse(v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)transitionWillUpdate
{
  void *v2;
  SBUpdateLayoutSwitcherEventResponse *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBMoveDisplaysTransitionSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillUpdate](&v6, sel_transitionWillUpdate);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 4, 3);
  SBAppendSwitcherModifierResponse(v3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)transitionDidEnd
{
  void *v2;
  SBInvalidateAdjustedAppLayoutsSwitcherEventResponse *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBMoveDisplaysTransitionSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionDidEnd](&v6, sel_transitionDidEnd);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
  SBAppendSwitcherModifierResponse(v3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)handleSceneReadyEvent:(id)a3
{
  id v4;
  void *v5;
  SBTransitionSwitcherModifierMoveDisplaysContext *moveDisplaysContext;
  void *v7;
  SBUpdateLayoutSwitcherEventResponse *v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBMoveDisplaysTransitionSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier handleSceneReadyEvent:](&v11, sel_handleSceneReadyEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  moveDisplaysContext = self->_moveDisplaysContext;
  objc_msgSend(v4, "appLayout", v11.receiver, v11.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(moveDisplaysContext) = -[SBTransitionSwitcherModifierMoveDisplaysContext pertainsToAppLayout:](moveDisplaysContext, "pertainsToAppLayout:", v7);
  if ((_DWORD)moveDisplaysContext)
  {
    v8 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 30, 0);
    SBAppendSwitcherModifierResponse(v8, v5);
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v9;
  }
  return v5;
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (-[SBTransitionSwitcherModifierMoveDisplaysContext pertainsToAppLayout:](self->_moveDisplaysContext, "pertainsToAppLayout:", v11, (_QWORD)v15))
        {
          objc_msgSend(v11, "leafAppLayouts");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObjectsFromArray:", v12);

        }
        else
        {
          objc_msgSend(v5, "addObject:", v11);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  SBTransitionSwitcherModifierMoveDisplaysContext *moveDisplaysContext;
  double v10;
  double v11;
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
  double v24;
  double v25;
  objc_super v26;
  CGRect result;

  -[SBMoveDisplaysTransitionSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBTransitionSwitcherModifierMoveDisplaysContext pertainsToAppLayout:](self->_moveDisplaysContext, "pertainsToAppLayout:", v6))
  {
    objc_msgSend(v6, "itemForLayoutRole:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase");
    moveDisplaysContext = self->_moveDisplaysContext;
    if (v8 > 1)
      -[SBTransitionSwitcherModifierMoveDisplaysContext toFrameForDisplayItem:](moveDisplaysContext, "toFrameForDisplayItem:", v7);
    else
      -[SBTransitionSwitcherModifierMoveDisplaysContext fromFrameForDisplayItem:](moveDisplaysContext, "fromFrameForDisplayItem:", v7);
    v15 = v10;
    v17 = v11;
    v19 = v12;
    v21 = v13;

  }
  else
  {
    v26.receiver = self;
    v26.super_class = (Class)SBMoveDisplaysTransitionSwitcherModifier;
    -[SBMoveDisplaysTransitionSwitcherModifier frameForIndex:](&v26, sel_frameForIndex_, a3);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
  }

  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  SBTransitionSwitcherModifierMoveDisplaysContext *moveDisplaysContext;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  objc_super v22;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4;
  moveDisplaysContext = self->_moveDisplaysContext;
  objc_msgSend(v11, "itemForLayoutRole:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(moveDisplaysContext) = -[SBTransitionSwitcherModifierMoveDisplaysContext pertainsToDisplayItem:](moveDisplaysContext, "pertainsToDisplayItem:", v13);

  if (!(_DWORD)moveDisplaysContext)
  {
    v22.receiver = self;
    v22.super_class = (Class)SBMoveDisplaysTransitionSwitcherModifier;
    -[SBMoveDisplaysTransitionSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v22, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v11, x, y, width, height);
    x = v14;
    y = v15;
    width = v16;
    height = v17;
  }

  v18 = x;
  v19 = y;
  v20 = width;
  v21 = height;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  objc_super v10;

  -[SBMoveDisplaysTransitionSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 1.0;
  if (!-[SBTransitionSwitcherModifierMoveDisplaysContext pertainsToAppLayout:](self->_moveDisplaysContext, "pertainsToAppLayout:", v6))
  {
    v10.receiver = self;
    v10.super_class = (Class)SBMoveDisplaysTransitionSwitcherModifier;
    -[SBMoveDisplaysTransitionSwitcherModifier scaleForIndex:](&v10, sel_scaleForIndex_, a3);
    v7 = v8;
  }

  return v7;
}

- (double)scaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  double v7;
  double v8;
  objc_super v10;

  v6 = a4;
  v7 = 1.0;
  if (!-[SBTransitionSwitcherModifierMoveDisplaysContext pertainsToAppLayout:](self->_moveDisplaysContext, "pertainsToAppLayout:", v6))
  {
    v10.receiver = self;
    v10.super_class = (Class)SBMoveDisplaysTransitionSwitcherModifier;
    -[SBMoveDisplaysTransitionSwitcherModifier scaleForLayoutRole:inAppLayout:](&v10, sel_scaleForLayoutRole_inAppLayout_, a3, v6);
    v7 = v8;
  }

  return v7;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  SBTransitionSwitcherModifierMoveDisplaysContext *moveDisplaysContext;
  void *v10;
  double v11;
  double v12;
  objc_super v14;

  v8 = a4;
  moveDisplaysContext = self->_moveDisplaysContext;
  objc_msgSend(v8, "itemForLayoutRole:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(moveDisplaysContext) = -[SBTransitionSwitcherModifierMoveDisplaysContext pertainsToDisplayItem:](moveDisplaysContext, "pertainsToDisplayItem:", v10);

  v11 = 1.0;
  if ((moveDisplaysContext & 1) == 0)
  {
    v14.receiver = self;
    v14.super_class = (Class)SBMoveDisplaysTransitionSwitcherModifier;
    -[SBMoveDisplaysTransitionSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](&v14, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, v8, a5);
    v11 = v12;
  }

  return v11;
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

  -[SBMoveDisplaysTransitionSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0.5;
  v8 = 0.5;
  if (!-[SBTransitionSwitcherModifierMoveDisplaysContext pertainsToAppLayout:](self->_moveDisplaysContext, "pertainsToAppLayout:", v6))
  {
    v13.receiver = self;
    v13.super_class = (Class)SBMoveDisplaysTransitionSwitcherModifier;
    -[SBMoveDisplaysTransitionSwitcherModifier anchorPointForIndex:](&v13, sel_anchorPointForIndex_, a3);
    v7 = v9;
    v8 = v10;
  }

  v11 = v7;
  v12 = v8;
  result.y = v12;
  result.x = v11;
  return result;
}

- (double)perspectiveAngleForAppLayout:(id)a3
{
  id v4;
  double v5;
  double v6;
  objc_super v8;

  v4 = a3;
  v5 = 0.0;
  if (!-[SBTransitionSwitcherModifierMoveDisplaysContext pertainsToAppLayout:](self->_moveDisplaysContext, "pertainsToAppLayout:", v4))
  {
    v8.receiver = self;
    v8.super_class = (Class)SBMoveDisplaysTransitionSwitcherModifier;
    -[SBMoveDisplaysTransitionSwitcherModifier perspectiveAngleForAppLayout:](&v8, sel_perspectiveAngleForAppLayout_, v4);
    v5 = v6;
  }

  return v5;
}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  SBTransitionSwitcherModifierMoveDisplaysContext *moveDisplaysContext;
  void *v8;
  unsigned __int8 remainingAppLayoutNeedsLayout;
  objc_super v11;

  v6 = a4;
  moveDisplaysContext = self->_moveDisplaysContext;
  objc_msgSend(v6, "itemForLayoutRole:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(moveDisplaysContext) = -[SBTransitionSwitcherModifierMoveDisplaysContext pertainsToDisplayItem:](moveDisplaysContext, "pertainsToDisplayItem:", v8);

  if ((moveDisplaysContext & 1) != 0)
  {
    remainingAppLayoutNeedsLayout = 1;
  }
  else if (-[SBAppLayout isOrContainsAppLayout:](self->_remainingAppLayout, "isOrContainsAppLayout:", v6))
  {
    remainingAppLayoutNeedsLayout = self->_remainingAppLayoutNeedsLayout;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBMoveDisplaysTransitionSwitcherModifier;
    remainingAppLayoutNeedsLayout = -[SBMoveDisplaysTransitionSwitcherModifier isLayoutRoleBlurred:inAppLayout:](&v11, sel_isLayoutRoleBlurred_inAppLayout_, a3, v6);
  }

  return remainingAppLayoutNeedsLayout;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  SBTransitionSwitcherModifierMoveDisplaysContext *moveDisplaysContext;
  void *v8;
  unsigned __int8 remainingAppLayoutNeedsLayout;
  objc_super v11;

  v6 = a4;
  moveDisplaysContext = self->_moveDisplaysContext;
  objc_msgSend(v6, "itemForLayoutRole:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(moveDisplaysContext) = -[SBTransitionSwitcherModifierMoveDisplaysContext pertainsToDisplayItem:](moveDisplaysContext, "pertainsToDisplayItem:", v8);

  if ((moveDisplaysContext & 1) != 0)
  {
    remainingAppLayoutNeedsLayout = 1;
  }
  else if (-[SBAppLayout isOrContainsAppLayout:](self->_remainingAppLayout, "isOrContainsAppLayout:", v6))
  {
    remainingAppLayoutNeedsLayout = self->_remainingAppLayoutNeedsLayout;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBMoveDisplaysTransitionSwitcherModifier;
    remainingAppLayoutNeedsLayout = -[SBMoveDisplaysTransitionSwitcherModifier isLayoutRoleMatchMovedToScene:inAppLayout:](&v11, sel_isLayoutRoleMatchMovedToScene_inAppLayout_, a3, v6);
  }

  return remainingAppLayoutNeedsLayout;
}

- (id)visibleAppLayouts
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBMoveDisplaysTransitionSwitcherModifier;
  -[SBMoveDisplaysTransitionSwitcherModifier visibleAppLayouts](&v7, sel_visibleAppLayouts);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMoveDisplaysTransitionSwitcherModifier _appLayoutsContainingMovingDisplayItems](self, "_appLayoutsContainingMovingDisplayItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)topMostLayoutElements
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  -[SBMoveDisplaysTransitionSwitcherModifier _appLayoutsContainingMovingDisplayItems](self, "_appLayoutsContainingMovingDisplayItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)SBMoveDisplaysTransitionSwitcherModifier;
  -[SBMoveDisplaysTransitionSwitcherModifier topMostLayoutElements](&v7, sel_topMostLayoutElements);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isSwitcherWindowVisible
{
  return 1;
}

- (id)_appLayoutsContainingMovingDisplayItems
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[SBMoveDisplaysTransitionSwitcherModifier appLayouts](self, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __83__SBMoveDisplaysTransitionSwitcherModifier__appLayoutsContainingMovingDisplayItems__block_invoke;
  v7[3] = &unk_1E8E9DF78;
  v7[4] = self;
  objc_msgSend(v3, "bs_filter:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_371);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __83__SBMoveDisplaysTransitionSwitcherModifier__appLayoutsContainingMovingDisplayItems__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "pertainsToAppLayout:", a2);
}

BOOL __83__SBMoveDisplaysTransitionSwitcherModifier__appLayoutsContainingMovingDisplayItems__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _BOOL8 v8;

  v4 = a3;
  objc_msgSend(a2, "layoutAttributesForItemInRole:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "lastInteractionTime");
  objc_msgSend(v4, "layoutAttributesForItemInRole:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v6 < objc_msgSend(v7, "lastInteractionTime");
  return v8;
}

- (SBTransitionSwitcherModifierMoveDisplaysContext)moveDisplaysContext
{
  return self->_moveDisplaysContext;
}

- (SBAppLayout)remainingAppLayout
{
  return self->_remainingAppLayout;
}

- (BOOL)remainingAppLayoutNeedsLayout
{
  return self->_remainingAppLayoutNeedsLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remainingAppLayout, 0);
  objc_storeStrong((id *)&self->_moveDisplaysContext, 0);
}

@end
