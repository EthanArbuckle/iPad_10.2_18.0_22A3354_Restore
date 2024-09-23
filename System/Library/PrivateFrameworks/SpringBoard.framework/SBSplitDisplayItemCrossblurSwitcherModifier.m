@implementation SBSplitDisplayItemCrossblurSwitcherModifier

- (SBSplitDisplayItemCrossblurSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5 layoutRole:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  SBSplitDisplayItemCrossblurSwitcherModifier *v14;
  void *v15;
  SBSplitDisplayItemSwitcherModifier *v16;
  void *v17;
  void *v18;
  SBCrossblurDosidoSwitcherModifier *v19;
  void *v20;
  SBSplitDisplayItemSwitcherModifier *v21;
  SBSplitDisplayItemSwitcherModifier *toSplitDisplayItemModifier;
  void *v24;
  void *v25;
  objc_super v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v26.receiver = self;
  v26.super_class = (Class)SBSplitDisplayItemCrossblurSwitcherModifier;
  v14 = -[SBSwitcherModifier init](&v26, sel_init);
  if (v14)
  {
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, CFSTR("SBSplitDisplayItemCrossblurSwitcherModifier.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromAppLayout"));

    }
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, CFSTR("SBSplitDisplayItemCrossblurSwitcherModifier.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toAppLayout"));

    }
    objc_storeStrong((id *)&v14->_fromAppLayout, a4);
    objc_storeStrong((id *)&v14->_toAppLayout, a5);
    v14->_layoutRole = a6;
    -[SBAppLayout itemForLayoutRole:](v14->_fromAppLayout, "itemForLayoutRole:", a6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[SBSplitDisplayItemSwitcherModifier initWithDisplayItem:]([SBSplitDisplayItemSwitcherModifier alloc], "initWithDisplayItem:", v15);
    -[SBChainableModifier addChildModifier:](v14, "addChildModifier:", v16);
    -[SBAppLayout leafAppLayoutForRole:](v14->_fromAppLayout, "leafAppLayoutForRole:", v14->_layoutRole);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAppLayout leafAppLayoutForRole:](v14->_toAppLayout, "leafAppLayoutForRole:", v14->_layoutRole);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[SBCrossblurDosidoSwitcherModifier initWithTransitionID:fromAppLayout:toAppLayout:direction:]([SBCrossblurDosidoSwitcherModifier alloc], "initWithTransitionID:fromAppLayout:toAppLayout:direction:", v11, v17, v18, 0);
    -[SBAppLayout itemForLayoutRole:](v14->_toAppLayout, "itemForLayoutRole:", v14->_layoutRole);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[SBSplitDisplayItemSwitcherModifier initWithDisplayItem:wrappingModifier:]([SBSplitDisplayItemSwitcherModifier alloc], "initWithDisplayItem:wrappingModifier:", v20, v19);
    toSplitDisplayItemModifier = v14->_toSplitDisplayItemModifier;
    v14->_toSplitDisplayItemModifier = v21;

    -[SBChainableModifier addChildModifier:](v14, "addChildModifier:", v14->_toSplitDisplayItemModifier);
  }

  return v14;
}

- (id)handleEvent:(id)a3
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBSplitDisplayItemCrossblurSwitcherModifier;
  -[SBChainableModifier handleEvent:](&v6, sel_handleEvent_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBChainableModifier setState:](self, "setState:", -[SBChainableModifier state](self->_toSplitDisplayItemModifier, "state"));
  return v4;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  self->_floatingConfiguration = objc_msgSend(v4, "toFloatingConfiguration");
  v7.receiver = self;
  v7.super_class = (Class)SBSplitDisplayItemCrossblurSwitcherModifier;
  -[SBSwitcherModifier handleTransitionEvent:](&v7, sel_handleTransitionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)visibleHomeAffordanceLayoutElements
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBSplitDisplayItemCrossblurSwitcherModifier;
  -[SBSplitDisplayItemCrossblurSwitcherModifier visibleHomeAffordanceLayoutElements](&v7, sel_visibleHomeAffordanceLayoutElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSplitDisplayItemCrossblurSwitcherModifier _previousHomeAffordanceAppLayout](self, "_previousHomeAffordanceAppLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)homeAffordanceLayoutElementToPortalIntoShelf:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if (objc_msgSend(v4, "layoutRole") == 3)
  {
    -[SBSplitDisplayItemCrossblurSwitcherModifier _previousHomeAffordanceAppLayout](self, "_previousHomeAffordanceAppLayout");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBSplitDisplayItemCrossblurSwitcherModifier;
    -[SBSplitDisplayItemCrossblurSwitcherModifier homeAffordanceLayoutElementToPortalIntoShelf:](&v8, sel_homeAffordanceLayoutElementToPortalIntoShelf_, v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (id)_previousHomeAffordanceAppLayout
{
  SBAppLayout *fromAppLayout;
  SBAppLayout *v4;
  _QWORD v6[5];

  fromAppLayout = self->_fromAppLayout;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __79__SBSplitDisplayItemCrossblurSwitcherModifier__previousHomeAffordanceAppLayout__block_invoke;
  v6[3] = &unk_1E8E9DF50;
  v6[4] = self;
  -[SBAppLayout appLayoutWithItemsPassingTest:](fromAppLayout, "appLayoutWithItemsPassingTest:", v6);
  v4 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    v4 = self->_fromAppLayout;
  return v4;
}

uint64_t __79__SBSplitDisplayItemCrossblurSwitcherModifier__previousHomeAffordanceAppLayout__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 112);
  v4 = *(_QWORD *)(v2 + 128);
  v5 = a2;
  objc_msgSend(v3, "itemForLayoutRole:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v6, "isEqual:", v5);

  return v4 ^ 1;
}

- (id)containerLeafAppLayoutForShelf:(id)a3
{
  SBAppLayout *fromAppLayout;
  _QWORD v6[5];

  if (objc_msgSend(a3, "layoutRole") == 3)
    return 0;
  fromAppLayout = self->_fromAppLayout;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __78__SBSplitDisplayItemCrossblurSwitcherModifier_containerLeafAppLayoutForShelf___block_invoke;
  v6[3] = &unk_1E8E9DF50;
  v6[4] = self;
  -[SBAppLayout appLayoutWithItemsPassingTest:](fromAppLayout, "appLayoutWithItemsPassingTest:", v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __78__SBSplitDisplayItemCrossblurSwitcherModifier_containerLeafAppLayoutForShelf___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 112);
  v4 = *(_QWORD *)(v2 + 128);
  v5 = a2;
  objc_msgSend(v3, "itemForLayoutRole:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v6, "isEqual:", v5);

  return v4 ^ 1;
}

- (CGRect)frameForShelf:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;
  CGRect result;

  v20.receiver = self;
  v20.super_class = (Class)SBSplitDisplayItemCrossblurSwitcherModifier;
  v4 = a3;
  -[SBSplitDisplayItemCrossblurSwitcherModifier frameForShelf:](&v20, sel_frameForShelf_, v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = objc_msgSend(v4, "layoutRole", v20.receiver, v20.super_class);

  if (v13 == 3)
  {
    -[SBSplitDisplayItemCrossblurSwitcherModifier floatingApplicationFrameInInterfaceOrientation:floatingConfiguration:](self, "floatingApplicationFrameInInterfaceOrientation:floatingConfiguration:", -[SBSplitDisplayItemCrossblurSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation"), self->_floatingConfiguration);
    v6 = v6 + v14;
    v8 = v8 + v15;
  }
  v16 = v6;
  v17 = v8;
  v18 = v10;
  v19 = v12;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (id)appLayoutContainingAppLayout:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v5 = 120;
  if (-[SBAppLayout isOrContainsAppLayout:](self->_toAppLayout, "isOrContainsAppLayout:", v4)
    || (v5 = 112, -[SBAppLayout isOrContainsAppLayout:](self->_fromAppLayout, "isOrContainsAppLayout:", v4)))
  {
    v6 = *(id *)((char *)&self->super.super.super.isa + v5);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBSplitDisplayItemCrossblurSwitcherModifier;
    -[SBSplitDisplayItemCrossblurSwitcherModifier appLayoutContainingAppLayout:](&v9, sel_appLayoutContainingAppLayout_, v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)topMostLayoutElements
{
  void *v3;
  SBAppLayout *fromAppLayout;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBSplitDisplayItemCrossblurSwitcherModifier;
  -[SBSplitDisplayItemCrossblurSwitcherModifier topMostLayoutElements](&v10, sel_topMostLayoutElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  fromAppLayout = self->_fromAppLayout;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__SBSplitDisplayItemCrossblurSwitcherModifier_topMostLayoutElements__block_invoke;
  v9[3] = &unk_1E8E9DF50;
  v9[4] = self;
  -[SBAppLayout appLayoutWithItemsPassingTest:](fromAppLayout, "appLayoutWithItemsPassingTest:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SBAppLayout leafAppLayoutForRole:](self->_toAppLayout, "leafAppLayoutForRole:", self->_layoutRole);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sb_arrayByInsertingOrMovingObject:toIndex:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "sb_arrayByInsertingOrMovingObject:toIndex:", v5, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

uint64_t __68__SBSplitDisplayItemCrossblurSwitcherModifier_topMostLayoutElements__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 112);
  v4 = *(_QWORD *)(v2 + 128);
  v5 = a2;
  objc_msgSend(v3, "itemForLayoutRole:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v6, "isEqual:", v5);

  return v4 ^ 1;
}

- (SBAppLayout)fromAppLayout
{
  return self->_fromAppLayout;
}

- (SBAppLayout)toAppLayout
{
  return self->_toAppLayout;
}

- (int64_t)layoutRole
{
  return self->_layoutRole;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toAppLayout, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
  objc_storeStrong((id *)&self->_toSplitDisplayItemModifier, 0);
}

@end
