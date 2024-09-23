@implementation SBSwitcherCoordinatedLayoutStateTransitionContext

+ (id)coordinatedLayoutStateTransitionContextForMovingDisplayItems:(id)a3 toSwitcherController:(id)a4 toAppLayout:(id)a5 withApplicationController:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  int v22;
  id v23;
  void *v24;
  _QWORD v26[4];
  id v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v11, "switcherCoordinator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "coordinatedSwitcherControllers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __173__SBSwitcherCoordinatedLayoutStateTransitionContext_coordinatedLayoutStateTransitionContextForMovingDisplayItems_toSwitcherController_toAppLayout_withApplicationController___block_invoke;
  v26[3] = &unk_1E8EA7530;
  v16 = v10;
  v27 = v16;
  objc_msgSend(v15, "bs_firstObjectPassingTest:", v26);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "_currentMainAppLayout");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_currentFloatingAppLayout");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "containsAllItemsFromSet:", v16);
  v21 = v18;
  if ((v20 & 1) != 0 || (v22 = objc_msgSend(v19, "containsAllItemsFromSet:", v16), v21 = v19, v22))
    v23 = v21;
  else
    v23 = 0;
  objc_msgSend(a1, "coordinatedLayoutStateTransitionContextForMovingDisplayItems:fromSwitcherController:fromAppLayout:toAppLayout:toSwitcherController:withApplicationController:", v16, v17, v23, v12, v11, v13);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

uint64_t __173__SBSwitcherCoordinatedLayoutStateTransitionContext_coordinatedLayoutStateTransitionContextForMovingDisplayItems_toSwitcherController_toAppLayout_withApplicationController___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  objc_msgSend(v3, "_currentMainAppLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "containsAllItemsFromSet:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "_currentFloatingAppLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "containsAllItemsFromSet:", *(_QWORD *)(a1 + 32));

  }
  return v5;
}

+ (id)coordinatedLayoutStateTransitionContextForMovingDisplayItems:(id)a3 fromSwitcherController:(id)a4 fromAppLayout:(id)a5 toAppLayout:(id)a6 toSwitcherController:(id)a7 withApplicationController:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;

  v14 = a6;
  v15 = a8;
  v16 = a7;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = objc_msgSend(v16, "windowManagementStyle");
  switch(v20)
  {
    case 0:
      objc_msgSend(v14, "leafAppLayoutForRole:", 1);
      v22 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 1:
      objc_msgSend(v14, "appLayoutsBySplittingMedusaIncompatibleItemsWithApplicationController:multitaskingSupported:", v15, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "count"))
      {
        objc_msgSend(v23, "firstObject");
        v24 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v24 = v14;
      }
      v22 = (uint64_t)v24;

      goto LABEL_10;
    case 2:
      objc_msgSend(v14, "appLayoutByAdjustingFloatingItemsForChamois");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "appLayoutByAdjustingCenterWindowItemsForChamois");
      v22 = objc_claimAutoreleasedReturnValue();
      v14 = v21;
LABEL_10:

      v14 = (id)v22;
      break;
  }
  objc_msgSend(v16, "layoutState");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appLayoutByModifyingPreferredDisplayOrdinal:", objc_msgSend(v25, "displayOrdinal"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDisplayItems:fromSwitcherController:toSwitcherController:fromAppLayout:toAppLayout:", v19, v18, v16, v17, v26);
  return v27;
}

- (SBSwitcherCoordinatedLayoutStateTransitionContext)initWithDisplayItems:(id)a3 fromSwitcherController:(id)a4 toSwitcherController:(id)a5 fromAppLayout:(id)a6 toAppLayout:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  SBSwitcherCoordinatedLayoutStateTransitionContext *v17;
  SBSwitcherCoordinatedLayoutStateTransitionContext *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  obj = a7;
  v16 = a7;
  if (objc_msgSend(v12, "count"))
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSwitcherCoordinatedLayoutStateTransitionContext.m"), 82, CFSTR("displayItems must not be empty"));

    if (v13)
    {
LABEL_3:
      if (v14)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSwitcherCoordinatedLayoutStateTransitionContext.m"), 83, CFSTR("fromSwitcherController must be non-nil"));

  if (v14)
  {
LABEL_4:
    if (v15)
      goto LABEL_5;
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSwitcherCoordinatedLayoutStateTransitionContext.m"), 85, CFSTR("fromAppLayout must be non-nil"));

    if (v16)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSwitcherCoordinatedLayoutStateTransitionContext.m"), 84, CFSTR("toSwitcherController must be non-nil"));

  if (!v15)
    goto LABEL_12;
LABEL_5:
  if (v16)
    goto LABEL_6;
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSwitcherCoordinatedLayoutStateTransitionContext.m"), 86, CFSTR("toAppLayout must be non-nil"));

LABEL_6:
  v29.receiver = self;
  v29.super_class = (Class)SBSwitcherCoordinatedLayoutStateTransitionContext;
  v17 = -[SBSwitcherCoordinatedLayoutStateTransitionContext init](&v29, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_displayItems, a3);
    objc_storeStrong((id *)&v18->_fromSwitcherController, a4);
    objc_storeStrong((id *)&v18->_toSwitcherController, a5);
    objc_storeStrong((id *)&v18->_fromAppLayout, a6);
    objc_storeStrong((id *)&v18->_toAppLayout, obj);
    objc_msgSend(v13, "layoutState");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v18->_fromFloatingConfiguration = objc_msgSend(v19, "floatingConfiguration");
    v18->_fromCenterConfiguration = objc_msgSend(v19, "centerConfiguration");

  }
  return v18;
}

- (BOOL)hasTransitioningDisplayItemsForAppLayout:(id)a3
{
  return objc_msgSend(a3, "containsAnyItemFromSet:", self->_displayItems);
}

- (BOOL)hasTransitioningDisplayItemsForSwitcherController:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqual:", self->_fromSwitcherController) & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isEqual:", self->_toSwitcherController);

  return v5;
}

- (BOOL)isDisplayItemTransitioning:(id)a3
{
  return -[NSSet containsObject:](self->_displayItems, "containsObject:", a3);
}

- (CGRect)fromFrameInFromSwitcherForDisplayItem:(id)a3
{
  SBAppLayout *fromAppLayout;
  id v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  fromAppLayout = self->_fromAppLayout;
  v5 = a3;
  v6 = -[SBAppLayout environment](fromAppLayout, "environment");
  v7 = -[SBAppLayout layoutRoleForItem:](self->_fromAppLayout, "layoutRoleForItem:", v5);

  v8 = -[SBSwitcherController interfaceOrientation](self->_fromSwitcherController, "interfaceOrientation");
  if (v6 == 3)
    goto LABEL_9;
  if (v6 == 2)
  {
LABEL_7:
    -[SBSwitcherController frameForFloatingAppLayoutInInterfaceOrientation:floatingConfiguration:](self->_fromSwitcherController, "frameForFloatingAppLayoutInInterfaceOrientation:floatingConfiguration:", v8, self->_fromFloatingConfiguration);
    goto LABEL_11;
  }
  if (v6 != 1)
  {
LABEL_10:
    v9 = *MEMORY[0x1E0C9D648];
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    goto LABEL_11;
  }
  if (!SBLayoutRoleIsValidForSplitView(v7))
  {
    if (v7 == 3)
      goto LABEL_7;
    if (v7 == 4)
    {
LABEL_9:
      -[SBSwitcherController frameForCenterItemWithConfiguration:interfaceOrientation:](self->_fromSwitcherController, "frameForCenterItemWithConfiguration:interfaceOrientation:", self->_fromCenterConfiguration, v8);
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  -[SBSwitcherController frameForItemWithRole:inMainAppLayout:interfaceOrientation:](self->_fromSwitcherController, "frameForItemWithRole:inMainAppLayout:interfaceOrientation:", v7, self->_fromAppLayout, v8);
LABEL_11:
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (CGRect)fromFrameInToSwitcherForDisplayItem:(id)a3
{
  SBSwitcherController *fromSwitcherController;
  id v5;
  void *v6;
  void *v7;
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
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect result;

  fromSwitcherController = self->_fromSwitcherController;
  v5 = a3;
  -[SBSwitcherController windowScene](fromSwitcherController, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSwitcherController windowScene](self->_toSwitcherController, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSwitcherCoordinatedLayoutStateTransitionContext fromFrameInFromSwitcherForDisplayItem:](self, "fromFrameInFromSwitcherForDisplayItem:", v5);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  objc_msgSend(v6, "convertRect:toNeighboringDisplayWindowScene:", v7, v9, v11, v13, v15);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v24 = v17;
  v25 = v19;
  v26 = v21;
  v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (CGRect)toFrameInFromSwitcherForDisplayItem:(id)a3
{
  SBSwitcherController *fromSwitcherController;
  id v5;
  void *v6;
  void *v7;
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
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect result;

  fromSwitcherController = self->_fromSwitcherController;
  v5 = a3;
  -[SBSwitcherController windowScene](fromSwitcherController, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSwitcherController windowScene](self->_toSwitcherController, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSwitcherCoordinatedLayoutStateTransitionContext toFrameInToSwitcherForDisplayItem:](self, "toFrameInToSwitcherForDisplayItem:", v5);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  objc_msgSend(v7, "convertRect:toNeighboringDisplayWindowScene:", v6, v9, v11, v13, v15);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v24 = v17;
  v25 = v19;
  v26 = v21;
  v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (CGRect)toFrameInToSwitcherForDisplayItem:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[SBSwitcherController frameForItemWithRole:inMainAppLayout:interfaceOrientation:](self->_toSwitcherController, "frameForItemWithRole:inMainAppLayout:interfaceOrientation:", -[SBAppLayout layoutRoleForItem:](self->_toAppLayout, "layoutRoleForItem:", a3), self->_toAppLayout, -[SBSwitcherController interfaceOrientation](self->_toSwitcherController, "interfaceOrientation"));
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (unint64_t)hash
{
  void *v3;
  NSSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = self->_displayItems;
  v5 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = (id)objc_msgSend(v3, "appendObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v8++), (_QWORD)v16);
      }
      while (v6 != v8);
      v6 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  v10 = (id)objc_msgSend(v3, "appendObject:", self->_fromSwitcherController);
  v11 = (id)objc_msgSend(v3, "appendObject:", self->_toSwitcherController);
  v12 = (id)objc_msgSend(v3, "appendObject:", self->_fromAppLayout);
  v13 = (id)objc_msgSend(v3, "appendObject:", self->_toAppLayout);
  v14 = objc_msgSend(v3, "hash");

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(v4, "hash");
    v6 = v5 == -[SBSwitcherCoordinatedLayoutStateTransitionContext hash](self, "hash");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)description
{
  return (NSString *)-[SBSwitcherCoordinatedLayoutStateTransitionContext descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBSwitcherCoordinatedLayoutStateTransitionContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[SBSwitcherCoordinatedLayoutStateTransitionContext descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  -[SBSwitcherCoordinatedLayoutStateTransitionContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_displayItems, CFSTR("displayItems"));
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", self->_fromSwitcherController, CFSTR("fromSwitcherController"));
  v7 = (id)objc_msgSend(v4, "appendObject:withName:", self->_toSwitcherController, CFSTR("toSwitcherController"));
  v8 = (id)objc_msgSend(v4, "appendObject:withName:", self->_fromAppLayout, CFSTR("fromAppLayout"));
  v9 = (id)objc_msgSend(v4, "appendObject:withName:", self->_toAppLayout, CFSTR("toAppLayout"));
  return v4;
}

- (NSSet)displayItems
{
  return self->_displayItems;
}

- (SBSwitcherController)fromSwitcherController
{
  return self->_fromSwitcherController;
}

- (SBSwitcherController)toSwitcherController
{
  return self->_toSwitcherController;
}

- (SBAppLayout)fromAppLayout
{
  return self->_fromAppLayout;
}

- (SBAppLayout)toAppLayout
{
  return self->_toAppLayout;
}

- (int64_t)fromFloatingConfiguration
{
  return self->_fromFloatingConfiguration;
}

- (int64_t)fromCenterConfiguration
{
  return self->_fromCenterConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toAppLayout, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
  objc_storeStrong((id *)&self->_toSwitcherController, 0);
  objc_storeStrong((id *)&self->_fromSwitcherController, 0);
  objc_storeStrong((id *)&self->_displayItems, 0);
}

@end
