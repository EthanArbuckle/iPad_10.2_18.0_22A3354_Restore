@implementation SBSwitcherDropRegionContext

- (SBSwitcherDropRegionContext)initWithDraggingLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v7;
  SBSwitcherDropRegionContext *v8;
  SBSwitcherDropRegionContext *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBSwitcherDropRegionContext;
  v8 = -[SBSwitcherDropRegionContext init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_draggingLayoutRole = a3;
    objc_storeStrong((id *)&v8->_draggingAppLayout, a4);
    v9->_currentDropRegion = 0;
    v9->_scaledIntersectingAppLayoutSize = (CGSize)SBInvalidSize;
    v9->_unscaledIntersectingAppLayoutSize = (CGSize)SBInvalidSize;
    v9->_intersectingLayoutRole = 0;
    v9->_intersectingAppLayoutConfiguration = 0;
  }

  return v9;
}

- (SBAppLayout)draggingLeafAppLayout
{
  return (SBAppLayout *)-[SBAppLayout leafAppLayoutForRole:](self->_draggingAppLayout, "leafAppLayoutForRole:", self->_draggingLayoutRole);
}

- (SBAppLayout)intersectingLeafAppLayout
{
  return (SBAppLayout *)-[SBAppLayout leafAppLayoutForRole:](self->_intersectingAppLayout, "leafAppLayoutForRole:", self->_intersectingLayoutRole);
}

- (unint64_t)currentDropAction
{
  int64_t v3;
  unint64_t currentDropRegion;
  unint64_t v6;

  v3 = -[SBAppLayout environment](self->_draggingAppLayout, "environment");
  currentDropRegion = self->_currentDropRegion;
  if (v3 != 2)
  {
    if (currentDropRegion == 6)
      return 1;
    if (-[SBSwitcherDropRegionContext isSwap](self, "isSwap"))
      return 4;
    v6 = self->_currentDropRegion;
    if (v6 == 3)
      return 5;
    if (v6 != 1)
    {
      if (-[SBAppLayout isSplitConfiguration](self->_draggingAppLayout, "isSplitConfiguration")
        && !-[SBAppLayout isSplitConfiguration](self->_intersectingAppLayout, "isSplitConfiguration"))
      {
        return 8;
      }
      if (-[SBAppLayout isSplitConfiguration](self->_draggingAppLayout, "isSplitConfiguration")
        && -[SBAppLayout isSplitConfiguration](self->_intersectingAppLayout, "isSplitConfiguration"))
      {
        return 9;
      }
      if (!-[SBAppLayout isSplitConfiguration](self->_draggingAppLayout, "isSplitConfiguration")
        && -[SBAppLayout isSplitConfiguration](self->_intersectingAppLayout, "isSplitConfiguration"))
      {
        return 7;
      }
      if (!-[SBAppLayout isSplitConfiguration](self->_draggingAppLayout, "isSplitConfiguration")
        && !-[SBAppLayout isSplitConfiguration](self->_intersectingAppLayout, "isSplitConfiguration"))
      {
        return 6;
      }
    }
    return 0;
  }
  if (currentDropRegion == 3)
    return 3;
  else
    return 2;
}

- (id)finalTargetAppLayout
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t currentDropRegion;
  unint64_t v8;
  unint64_t v9;
  SBAppLayout *evictedAppLayout;
  SBAppLayout *v11;
  void *v12;
  void *v13;
  SBAppLayout *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  SBAppLayout *v25;
  int64_t intersectingAppLayoutConfiguration;
  int64_t v27;
  SBAppLayout *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  SBAppLayout *v38;
  void *v40;
  void *v41;
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[2];
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x1E0C80C00];
  -[SBAppLayout itemForLayoutRole:](self->_draggingAppLayout, "itemForLayoutRole:", self->_draggingLayoutRole);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppLayout itemForLayoutRole:](self->_intersectingAppLayout, "itemForLayoutRole:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppLayout itemForLayoutRole:](self->_intersectingAppLayout, "itemForLayoutRole:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  currentDropRegion = self->_currentDropRegion;
  v8 = -[SBSwitcherDropRegionContext currentDropAction](self, "currentDropAction");
  v9 = self->_currentDropRegion;
  switch(v9)
  {
    case 6uLL:
      v11 = [SBAppLayout alloc];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v12;
      v49[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[SBAppLayout initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:](v11, "initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:", v13, 1, 2, -[SBAppLayout preferredDisplayOrdinal](self->_intersectingAppLayout, "preferredDisplayOrdinal"));

      goto LABEL_26;
    case 3uLL:
      if (v8 != 3)
      {
        if (v8 == 5)
        {
          if (!-[SBAppLayout isSplitConfiguration](self->_draggingAppLayout, "isSplitConfiguration"))
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSwitcherDropRegionContext.m"), 91, CFSTR("Expected dragging app layout to be split."));

          }
          if (-[SBAppLayout isSplitConfiguration](self->_evictedAppLayout, "isSplitConfiguration"))
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSwitcherDropRegionContext.m"), 92, CFSTR("Unsplit should result in a new full app layout, not a split one"));

          }
          evictedAppLayout = self->_evictedAppLayout;
          goto LABEL_13;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSwitcherDropRegionContext.m"), 104, CFSTR("Invalid drop region"));

LABEL_28:
        v14 = 0;
        goto LABEL_34;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v31;
      v47 = v4;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = -[SBAppLayout initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:]([SBAppLayout alloc], "initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:", v12, 1, 1, -[SBAppLayout preferredDisplayOrdinal](self->_draggingAppLayout, "preferredDisplayOrdinal"));
LABEL_26:

      goto LABEL_34;
    case 1uLL:
      evictedAppLayout = self->_draggingAppLayout;
LABEL_13:
      v14 = evictedAppLayout;
      goto LABEL_34;
  }
  if (-[SBSwitcherDropRegionContext isSwap](self, "isSwap"))
  {
    -[SBAppLayout flippedAppLayout](self->_draggingAppLayout, "flippedAppLayout");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "appLayoutByModifyingConfiguration:", -[SBSwitcherDropRegionContext effectiveDroppingAppLayoutConfiguration](self, "effectiveDroppingAppLayoutConfiguration"));
    v14 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

    goto LABEL_34;
  }
  if ((currentDropRegion & 0xFFFFFFFFFFFFFFFELL) != 4)
    goto LABEL_28;
  v16 = -[SBAppLayout isSplitConfiguration](self->_intersectingAppLayout, "isSplitConfiguration");
  if (currentDropRegion == 4)
    v17 = v4;
  else
    v17 = v5;
  v18 = (void *)MEMORY[0x1E0CB37E8];
  if (v16)
  {
    if (currentDropRegion == 4)
      v19 = v6;
    else
      v19 = v4;
    v20 = v19;
    v21 = v17;
    objc_msgSend(v18, "numberWithInteger:", 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v22;
    v45[0] = v21;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v44[1] = v23;
    v45[1] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = [SBAppLayout alloc];
    intersectingAppLayoutConfiguration = self->_intersectingAppLayoutConfiguration;
    v27 = -[SBAppLayout preferredDisplayOrdinal](self->_intersectingAppLayout, "preferredDisplayOrdinal");

    v28 = v25;
    v29 = v24;
    v30 = intersectingAppLayoutConfiguration;
  }
  else
  {
    if (currentDropRegion == 4)
      v33 = v5;
    else
      v33 = v4;
    v34 = v33;
    v35 = v17;
    objc_msgSend(v18, "numberWithInteger:", 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v36;
    v43[0] = v35;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 2);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = v37;
    v43[1] = v34;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = [SBAppLayout alloc];
    v27 = -[SBAppLayout preferredDisplayOrdinal](self->_intersectingAppLayout, "preferredDisplayOrdinal");

    v28 = v38;
    v29 = v24;
    v30 = 3;
  }
  v14 = -[SBAppLayout initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:](v28, "initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:", v29, v30, 1, v27);

LABEL_34:
  return v14;
}

- (BOOL)isSwap
{
  uint64_t v3;
  void *v4;
  void *v5;
  BOOL v6;

  if (!-[SBAppLayout isSplitConfiguration](self->_draggingAppLayout, "isSplitConfiguration"))
    return 0;
  if (self->_draggingLayoutRole == 1)
    v3 = 2;
  else
    v3 = 1;
  -[SBAppLayout leafAppLayoutForRole:](self->_draggingAppLayout, "leafAppLayoutForRole:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppLayout leafAppLayoutForRole:](self->_intersectingAppLayout, "leafAppLayoutForRole:", self->_intersectingLayoutRole);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 == v5;

  return v6;
}

- (id)droppedLeafAppLayout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SBSwitcherDropRegionContext draggingLeafAppLayout](self, "draggingLeafAppLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemForLayoutRole:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBSwitcherDropRegionContext finalTargetAppLayout](self, "finalTargetAppLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leafAppLayoutForItem:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)displayItemsToReloadSnapshots
{
  id v3;
  void *v4;
  void *v5;
  SBAppLayout *remainingAppLayout;
  void *v7;
  SBAppLayout *evictedAppLayout;
  void *v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[SBSwitcherDropRegionContext finalTargetAppLayout](self, "finalTargetAppLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  remainingAppLayout = self->_remainingAppLayout;
  if (remainingAppLayout)
  {
    -[SBAppLayout allItems](remainingAppLayout, "allItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v7);

  }
  evictedAppLayout = self->_evictedAppLayout;
  if (evictedAppLayout)
  {
    -[SBAppLayout allItems](evictedAppLayout, "allItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v9);

  }
  objc_msgSend(v3, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (int64_t)effectiveDroppingAppLayoutConfiguration
{
  int64_t intersectingAppLayoutConfiguration;
  _BOOL4 v3;
  int64_t v4;
  uint64_t v5;

  intersectingAppLayoutConfiguration = self->_intersectingAppLayoutConfiguration;
  v3 = -[SBSwitcherDropRegionContext isSwap](self, "isSwap");
  v4 = 2;
  v5 = 4;
  if (intersectingAppLayoutConfiguration != 2)
    v5 = intersectingAppLayoutConfiguration;
  if (intersectingAppLayoutConfiguration != 4)
    v4 = v5;
  if (v3)
    return v4;
  else
    return intersectingAppLayoutConfiguration;
}

- (NSString)description
{
  return (NSString *)-[SBSwitcherDropRegionContext descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBSwitcherDropRegionContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBSwitcherDropRegionContext descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBSwitcherDropRegionContext *v11;

  v4 = a3;
  -[SBSwitcherDropRegionContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__SBSwitcherDropRegionContext_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

void __69__SBSwitcherDropRegionContext_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  const __CFString *v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) - 1;
  if (v3 > 6)
    v4 = CFSTR("SBSwitcherDropRegionNone");
  else
    v4 = off_1E8EB6908[v3];
  objc_msgSend(v2, "appendString:withName:", v4, CFSTR("currentDropRegion"));
  v5 = *(void **)(a1 + 32);
  v6 = objc_msgSend(*(id *)(a1 + 40), "currentDropAction") - 1;
  if (v6 > 8)
    v7 = CFSTR("SBSwitcherDropActionNone");
  else
    v7 = off_1E8EB6940[v6];
  objc_msgSend(v5, "appendString:withName:", v7, CFSTR("currentDropAction"));
  v8 = *(void **)(a1 + 32);
  v9 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __69__SBSwitcherDropRegionContext_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v24[3] = &unk_1E8E9E820;
  v10 = v8;
  v11 = *(_QWORD *)(a1 + 40);
  v25 = v10;
  v26 = v11;
  objc_msgSend(v10, "appendBodySectionWithName:multilinePrefix:block:", 0, 0, v24);
  v12 = *(void **)(a1 + 32);
  v21[0] = v9;
  v21[1] = 3221225472;
  v21[2] = __69__SBSwitcherDropRegionContext_descriptionBuilderWithMultilinePrefix___block_invoke_3;
  v21[3] = &unk_1E8E9E820;
  v13 = v12;
  v14 = *(_QWORD *)(a1 + 40);
  v22 = v13;
  v23 = v14;
  objc_msgSend(v13, "appendBodySectionWithName:multilinePrefix:block:", 0, 0, v21);
  v15 = *(void **)(a1 + 32);
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __69__SBSwitcherDropRegionContext_descriptionBuilderWithMultilinePrefix___block_invoke_4;
  v18[3] = &unk_1E8E9E820;
  v16 = v15;
  v17 = *(_QWORD *)(a1 + 40);
  v19 = v16;
  v20 = v17;
  objc_msgSend(v16, "appendBodySectionWithName:multilinePrefix:block:", 0, 0, v18);

}

id __69__SBSwitcherDropRegionContext_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  SBLayoutRoleDescription(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v3, CFSTR("draggingLayoutRole"));

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("draggingAppLayout"));
}

id __69__SBSwitcherDropRegionContext_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  SBLayoutRoleDescription(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v3, CFSTR("intersectingLayoutRole"));

  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), CFSTR("intersectingAppLayout"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("intersectingAppLayoutIsOnFirstRow"));
}

id __69__SBSwitcherDropRegionContext_descriptionBuilderWithMultilinePrefix___block_invoke_4(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendRect:withName:", CFSTR("originRect"), *(double *)(*(_QWORD *)(a1 + 40) + 120), *(double *)(*(_QWORD *)(a1 + 40) + 128), *(double *)(*(_QWORD *)(a1 + 40) + 136), *(double *)(*(_QWORD *)(a1 + 40) + 144));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendRect:withName:", CFSTR("targetRect"), *(double *)(*(_QWORD *)(a1 + 40) + 152), *(double *)(*(_QWORD *)(a1 + 40) + 160), *(double *)(*(_QWORD *)(a1 + 40) + 168), *(double *)(*(_QWORD *)(a1 + 40) + 176));
}

- (unint64_t)currentDropRegion
{
  return self->_currentDropRegion;
}

- (void)setCurrentDropRegion:(unint64_t)a3
{
  self->_currentDropRegion = a3;
}

- (SBAppLayout)draggingAppLayout
{
  return self->_draggingAppLayout;
}

- (int64_t)draggingLayoutRole
{
  return self->_draggingLayoutRole;
}

- (SBAppLayout)intersectingAppLayout
{
  return self->_intersectingAppLayout;
}

- (void)setIntersectingAppLayout:(id)a3
{
  objc_storeStrong((id *)&self->_intersectingAppLayout, a3);
}

- (int64_t)intersectingLayoutRole
{
  return self->_intersectingLayoutRole;
}

- (void)setIntersectingLayoutRole:(int64_t)a3
{
  self->_intersectingLayoutRole = a3;
}

- (CGSize)scaledIntersectingAppLayoutSize
{
  double width;
  double height;
  CGSize result;

  width = self->_scaledIntersectingAppLayoutSize.width;
  height = self->_scaledIntersectingAppLayoutSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setScaledIntersectingAppLayoutSize:(CGSize)a3
{
  self->_scaledIntersectingAppLayoutSize = a3;
}

- (CGSize)unscaledIntersectingAppLayoutSize
{
  double width;
  double height;
  CGSize result;

  width = self->_unscaledIntersectingAppLayoutSize.width;
  height = self->_unscaledIntersectingAppLayoutSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setUnscaledIntersectingAppLayoutSize:(CGSize)a3
{
  self->_unscaledIntersectingAppLayoutSize = a3;
}

- (int64_t)intersectingAppLayoutConfiguration
{
  return self->_intersectingAppLayoutConfiguration;
}

- (void)setIntersectingAppLayoutConfiguration:(int64_t)a3
{
  self->_intersectingAppLayoutConfiguration = a3;
}

- (BOOL)intersectingAppLayoutIsOnFirstRow
{
  return self->_intersectingAppLayoutIsOnFirstRow;
}

- (void)setIntersectingAppLayoutIsOnFirstRow:(BOOL)a3
{
  self->_intersectingAppLayoutIsOnFirstRow = a3;
}

- (SBAppLayout)closestVisibleAppLayout
{
  return self->_closestVisibleAppLayout;
}

- (void)setClosestVisibleAppLayout:(id)a3
{
  objc_storeStrong((id *)&self->_closestVisibleAppLayout, a3);
}

- (SBAppLayout)remainingAppLayout
{
  return self->_remainingAppLayout;
}

- (void)setRemainingAppLayout:(id)a3
{
  objc_storeStrong((id *)&self->_remainingAppLayout, a3);
}

- (SBAppLayout)evictedAppLayout
{
  return self->_evictedAppLayout;
}

- (void)setEvictedAppLayout:(id)a3
{
  objc_storeStrong((id *)&self->_evictedAppLayout, a3);
}

- (CGRect)originRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_originRect.origin.x;
  y = self->_originRect.origin.y;
  width = self->_originRect.size.width;
  height = self->_originRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setOriginRect:(CGRect)a3
{
  self->_originRect = a3;
}

- (CGRect)targetRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_targetRect.origin.x;
  y = self->_targetRect.origin.y;
  width = self->_targetRect.size.width;
  height = self->_targetRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTargetRect:(CGRect)a3
{
  self->_targetRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evictedAppLayout, 0);
  objc_storeStrong((id *)&self->_remainingAppLayout, 0);
  objc_storeStrong((id *)&self->_closestVisibleAppLayout, 0);
  objc_storeStrong((id *)&self->_intersectingAppLayout, 0);
  objc_storeStrong((id *)&self->_draggingAppLayout, 0);
}

@end
