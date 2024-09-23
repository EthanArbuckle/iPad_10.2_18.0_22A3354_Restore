@implementation SBSplitDisplayItemSwitcherModifier

- (SBSplitDisplayItemSwitcherModifier)initWithDisplayItem:(id)a3
{
  return -[SBSplitDisplayItemSwitcherModifier initWithDisplayItem:wrappingModifier:](self, "initWithDisplayItem:wrappingModifier:", a3, 0);
}

- (SBSplitDisplayItemSwitcherModifier)initWithDisplayItem:(id)a3 wrappingModifier:(id)a4
{
  SBDisplayItem *v7;
  id v8;
  SBSplitDisplayItemSwitcherModifier *v9;
  void *v11;
  objc_super v12;

  v7 = (SBDisplayItem *)a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBSplitDisplayItemSwitcherModifier;
  v9 = -[SBSwitcherModifier init](&v12, sel_init);
  if (v9)
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("SBSplitDisplayItemSwitcherModifier.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayItem"));

    }
    v9->_displayItem = v7;
    objc_storeStrong((id *)&v9->_wrappingModifier, a4);
    if (v9->_wrappingModifier)
      -[SBChainableModifier addChildModifier:](v9, "addChildModifier:");
    v9->_completesWhenGesturePossible = 0;
  }

  return v9;
}

- (BOOL)completesWhenChildrenComplete
{
  return self->_wrappingModifier != 0;
}

- (id)handleEvent:(id)a3
{
  id v4;
  void *v5;
  SBInvalidateAdjustedAppLayoutsSwitcherEventResponse *v6;
  void *v7;
  void *v8;
  SBInvalidateAdjustedAppLayoutsSwitcherEventResponse *v9;
  uint64_t v10;
  objc_super v12;

  v4 = a3;
  if (self->_hasInvalidatedAppLayoutsForInsertion || -[SBChainableModifier state](self, "state") == 1)
  {
    v5 = 0;
  }
  else
  {
    self->_hasInvalidatedAppLayoutsForInsertion = 1;
    v6 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
    SBAppendSwitcherModifierResponse(v6, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v12.receiver = self;
  v12.super_class = (Class)SBSplitDisplayItemSwitcherModifier;
  -[SBChainableModifier handleEvent:](&v12, sel_handleEvent_, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SBAppendSwitcherModifierResponse(v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!self->_hasInvalidatedAppLayoutsForRemoval && -[SBChainableModifier state](self, "state") == 1)
  {
    self->_hasInvalidatedAppLayoutsForRemoval = 1;
    v9 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
    SBAppendSwitcherModifierResponse(v9, v8);
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v10;
  }

  return v8;
}

- (id)handleGestureEvent:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBSplitDisplayItemSwitcherModifier;
  -[SBSwitcherModifier handleGestureEvent:](&v7, sel_handleGestureEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBSplitDisplayItemSwitcherModifier completesWhenGesturePossible](self, "completesWhenGesturePossible")
    && !objc_msgSend(v4, "phase"))
  {
    -[SBChainableModifier setState:](self, "setState:", 1);
  }

  return v5;
}

- (id)appLayoutsToEnsureExistForMainTransitionEvent:(id)a3
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBSplitDisplayItemSwitcherModifier;
  -[SBSplitDisplayItemSwitcherModifier appLayoutsToEnsureExistForMainTransitionEvent:](&v7, sel_appLayoutsToEnsureExistForMainTransitionEvent_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSplitDisplayItemSwitcherModifier adjustedAppLayoutsForAppLayouts:](self, "adjustedAppLayoutsForAppLayouts:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)appLayoutContainingAppLayout:(id)a3
{
  SBAppLayout *v4;
  SBAppLayout *v5;
  SBAppLayout *v6;
  SBAppLayout *v7;
  objc_super v9;

  v4 = (SBAppLayout *)a3;
  v5 = v4;
  if (self->_overrideAndPromoteChildAppLayout == v4)
  {
    v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBSplitDisplayItemSwitcherModifier;
    -[SBSplitDisplayItemSwitcherModifier appLayoutContainingAppLayout:](&v9, sel_appLayoutContainingAppLayout_, v4);
    v6 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[5];
  _QWORD v23[5];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)SBSplitDisplayItemSwitcherModifier;
  v19 = a3;
  -[SBSplitDisplayItemSwitcherModifier adjustedAppLayoutsForAppLayouts:](&v28, sel_adjustedAppLayoutsForAppLayouts_);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  v6 = v4;
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v25;
    v6 = v4;
    v20 = *(_QWORD *)v25;
    do
    {
      v9 = 0;
      v21 = v7;
      do
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v9);
        if (objc_msgSend(v10, "containsItem:", self->_displayItem))
        {
          objc_msgSend(v10, "allItems");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "count");

          if (v12 >= 2)
          {
            v13 = (void *)objc_msgSend(v6, "mutableCopy");
            objc_msgSend(v13, "removeObject:", v10);
            v14 = v6;
            v15 = MEMORY[0x1E0C809B0];
            v23[0] = MEMORY[0x1E0C809B0];
            v23[1] = 3221225472;
            v23[2] = __70__SBSplitDisplayItemSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke;
            v23[3] = &unk_1E8E9DF50;
            v23[4] = self;
            objc_msgSend(v10, "appLayoutWithItemsPassingTest:", v23);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObject:", v16);

            v22[0] = v15;
            v22[1] = 3221225472;
            v22[2] = __70__SBSplitDisplayItemSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke_2;
            v22[3] = &unk_1E8E9DF50;
            v22[4] = self;
            objc_msgSend(v10, "appLayoutWithItemsPassingTest:", v22);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObject:", v17);

            v8 = v20;
            v7 = v21;
            v6 = v13;
          }
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v7);
  }

  return v6;
}

uint64_t __70__SBSplitDisplayItemSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke()
{
  return BSEqualObjects();
}

uint64_t __70__SBSplitDisplayItemSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke_2()
{
  return BSEqualObjects() ^ 1;
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
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  objc_super v24;
  _QWORD v25[7];
  uint64_t v26;
  double *v27;
  uint64_t v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  CGRect result;

  if (-[SBSplitDisplayItemSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled"))
  {
    v32.receiver = self;
    v32.super_class = (Class)SBSplitDisplayItemSwitcherModifier;
    -[SBSplitDisplayItemSwitcherModifier frameForIndex:](&v32, sel_frameForIndex_, a3);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
  }
  else
  {
    -[SBSplitDisplayItemSwitcherModifier appLayouts](self, "appLayouts");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndex:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBSplitDisplayItemSwitcherModifier appLayoutContainingAppLayout:](self, "appLayoutContainingAppLayout:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "containsItem:", self->_displayItem) & 1) != 0
      || !objc_msgSend(v15, "containsItem:", self->_displayItem))
    {
      v24.receiver = self;
      v24.super_class = (Class)SBSplitDisplayItemSwitcherModifier;
      -[SBSplitDisplayItemSwitcherModifier frameForIndex:](&v24, sel_frameForIndex_, a3);
      v6 = v16;
      v8 = v17;
      v10 = v18;
      v12 = v19;
    }
    else
    {
      v26 = 0;
      v27 = (double *)&v26;
      v28 = 0x4010000000;
      v29 = &unk_1D0FA064E;
      v30 = 0u;
      v31 = 0u;
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __52__SBSplitDisplayItemSwitcherModifier_frameForIndex___block_invoke;
      v25[3] = &unk_1E8E9FD08;
      v25[5] = &v26;
      v25[6] = a3;
      v25[4] = self;
      -[SBSplitDisplayItemSwitcherModifier _performOverrideAndPromoteChildAppLayoutToParent:withBlock:](self, "_performOverrideAndPromoteChildAppLayoutToParent:withBlock:", v14, v25);
      v6 = v27[4];
      v8 = v27[5];
      v10 = v27[6];
      v12 = v27[7];
      _Block_object_dispose(&v26, 8);
    }

  }
  v20 = v6;
  v21 = v8;
  v22 = v10;
  v23 = v12;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

id __52__SBSplitDisplayItemSwitcherModifier_frameForIndex___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id result;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v2 = *(_QWORD *)(a1 + 48);
  v9.receiver = *(id *)(a1 + 32);
  v9.super_class = (Class)SBSplitDisplayItemSwitcherModifier;
  result = objc_msgSendSuper2(&v9, sel_frameForIndex_, v2);
  v4 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v4[4] = v5;
  v4[5] = v6;
  v4[6] = v7;
  v4[7] = v8;
  return result;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
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
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
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
  objc_super v44;
  objc_super v45;
  objc_super v46;
  objc_super v47;
  objc_super v48;
  objc_super v49;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4;
  if (!-[SBSplitDisplayItemSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled"))
  {
    v47.receiver = self;
    v47.super_class = (Class)SBSplitDisplayItemSwitcherModifier;
    -[SBSplitDisplayItemSwitcherModifier appLayoutContainingAppLayout:](&v47, sel_appLayoutContainingAppLayout_, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "containsItem:", self->_displayItem) & 1) == 0
      && objc_msgSend(v12, "containsItem:", self->_displayItem))
    {
      objc_msgSend(v11, "itemForLayoutRole:", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v46.receiver = self;
      v46.super_class = (Class)SBSplitDisplayItemSwitcherModifier;
      -[SBSplitDisplayItemSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v46, sel_frameForLayoutRole_inAppLayout_withBounds_, objc_msgSend(v12, "layoutRoleForItem:", v13), v12, x, y, width, height);
      v25 = v24;
      v27 = v26;
      v29 = v28;
      v31 = v30;
      if (!objc_msgSend(v11, "isSplitConfiguration"))
      {
        v45.receiver = self;
        v45.super_class = (Class)SBSplitDisplayItemSwitcherModifier;
        -[SBSplitDisplayItemSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v45, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v11, v25, v27, v29, v31);
        v17 = v40;
        v19 = v41;
        v21 = v42;
        v23 = v43;
        goto LABEL_3;
      }

    }
    v44.receiver = self;
    v44.super_class = (Class)SBSplitDisplayItemSwitcherModifier;
    -[SBSplitDisplayItemSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v44, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v11, x, y, width, height);
    v17 = v32;
    v19 = v33;
    v21 = v34;
    v23 = v35;
    goto LABEL_9;
  }
  v49.receiver = self;
  v49.super_class = (Class)SBSplitDisplayItemSwitcherModifier;
  -[SBSplitDisplayItemSwitcherModifier appLayoutContainingAppLayout:](&v49, sel_appLayoutContainingAppLayout_, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSwitcherModifier autoLayoutSpaceForAppLayout:](self, "autoLayoutSpaceForAppLayout:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "itemForLayoutRole:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v12, "layoutRoleForItem:", v14);
  objc_msgSend(v13, "boundingBox");
  SBRectWithSize();
  v48.receiver = self;
  v48.super_class = (Class)SBSplitDisplayItemSwitcherModifier;
  -[SBSplitDisplayItemSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v48, sel_frameForLayoutRole_inAppLayout_withBounds_, v15, v12);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

LABEL_3:
LABEL_9:

  v36 = v17;
  v37 = v19;
  v38 = v21;
  v39 = v23;
  result.size.height = v39;
  result.size.width = v38;
  result.origin.y = v37;
  result.origin.x = v36;
  return result;
}

- (BOOL)isResizeGrabberVisibleForAppLayout:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if ((objc_msgSend(v4, "containsItem:", self->_displayItem) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[SBSplitDisplayItemSwitcherModifier appLayoutContainingAppLayout:](self, "appLayoutContainingAppLayout:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8.receiver = self;
    v8.super_class = (Class)SBSplitDisplayItemSwitcherModifier;
    v5 = -[SBSplitDisplayItemSwitcherModifier isResizeGrabberVisibleForAppLayout:](&v8, sel_isResizeGrabberVisibleForAppLayout_, v6);

  }
  return v5;
}

- (id)resizeGrabberLayoutAttributesForAppLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBSplitDisplayItemSwitcherModifier;
  -[SBSplitDisplayItemSwitcherModifier resizeGrabberLayoutAttributesForAppLayout:](&v18, sel_resizeGrabberLayoutAttributesForAppLayout_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leafAppLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "containsItem:", self->_displayItem))
  {
    -[SBSplitDisplayItemSwitcherModifier appLayoutContainingAppLayout:](self, "appLayoutContainingAppLayout:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 != v4)
    {
      v9 = objc_msgSend(v7, "layoutRoleForItem:", self->_displayItem);
      if (v9 == 1)
      {
        objc_msgSend(v8, "itemForLayoutRole:", 2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v8, "leafAppLayoutForRole:", 2);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setLeafAppLayout:", v11);

          v12 = -[SBSplitDisplayItemSwitcherModifier isRTLEnabled](self, "isRTLEnabled") == 0;
          v13 = 2;
          v14 = 8;
LABEL_8:
          if (v12)
            v16 = v13;
          else
            v16 = v14;
          objc_msgSend(v5, "setEdge:", v16);
          goto LABEL_12;
        }
      }
      if (v9 == 2)
      {
        objc_msgSend(v8, "leafAppLayoutForRole:", 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setLeafAppLayout:", v15);

        v12 = -[SBSplitDisplayItemSwitcherModifier isRTLEnabled](self, "isRTLEnabled") == 0;
        v13 = 8;
        v14 = 2;
        goto LABEL_8;
      }
    }
LABEL_12:

  }
  return v5;
}

- (id)preferredAppLayoutToReuseAccessoryForAppLayout:(id)a3 fromAppLayouts:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;
  _QWORD v12[5];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if ((unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __100__SBSplitDisplayItemSwitcherModifier_preferredAppLayoutToReuseAccessoryForAppLayout_fromAppLayouts___block_invoke;
    v12[3] = &unk_1E8E9DF78;
    v12[4] = self;
    objc_msgSend(v7, "bs_filter:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v11.receiver = self;
  v11.super_class = (Class)SBSplitDisplayItemSwitcherModifier;
  -[SBSplitDisplayItemSwitcherModifier preferredAppLayoutToReuseAccessoryForAppLayout:fromAppLayouts:](&v11, sel_preferredAppLayoutToReuseAccessoryForAppLayout_fromAppLayouts_, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __100__SBSplitDisplayItemSwitcherModifier_preferredAppLayoutToReuseAccessoryForAppLayout_fromAppLayouts___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsItem:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104)) ^ 1;
}

- (void)_performOverrideAndPromoteChildAppLayoutToParent:(id)a3 withBlock:(id)a4
{
  SBAppLayout *v6;
  SBAppLayout *v7;
  SBAppLayout *overrideAndPromoteChildAppLayout;
  void (**v9)(_QWORD);
  SBAppLayout *v10;
  SBAppLayout *v11;

  v6 = (SBAppLayout *)a3;
  v7 = self->_overrideAndPromoteChildAppLayout;
  overrideAndPromoteChildAppLayout = self->_overrideAndPromoteChildAppLayout;
  self->_overrideAndPromoteChildAppLayout = v6;
  v11 = v6;
  v9 = (void (**)(_QWORD))a4;

  v9[2](v9);
  v10 = self->_overrideAndPromoteChildAppLayout;
  self->_overrideAndPromoteChildAppLayout = v7;

}

- (SBDisplayItem)displayItem
{
  return self->_displayItem;
}

- (SBSwitcherModifier)wrappingModifier
{
  return self->_wrappingModifier;
}

- (BOOL)completesWhenGesturePossible
{
  return self->_completesWhenGesturePossible;
}

- (void)setCompletesWhenGesturePossible:(BOOL)a3
{
  self->_completesWhenGesturePossible = a3;
}

- (BOOL)hasInvalidatedAppLayoutsForInsertion
{
  return self->_hasInvalidatedAppLayoutsForInsertion;
}

- (void)setHasInvalidatedAppLayoutsForInsertion:(BOOL)a3
{
  self->_hasInvalidatedAppLayoutsForInsertion = a3;
}

- (BOOL)hasInvalidatedAppLayoutsForRemoval
{
  return self->_hasInvalidatedAppLayoutsForRemoval;
}

- (void)setHasInvalidatedAppLayoutsForRemoval:(BOOL)a3
{
  self->_hasInvalidatedAppLayoutsForRemoval = a3;
}

- (SBAppLayout)overrideAndPromoteChildAppLayout
{
  return self->_overrideAndPromoteChildAppLayout;
}

- (void)setOverrideAndPromoteChildAppLayout:(id)a3
{
  objc_storeStrong((id *)&self->_overrideAndPromoteChildAppLayout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideAndPromoteChildAppLayout, 0);
  objc_storeStrong((id *)&self->_wrappingModifier, 0);
}

@end
