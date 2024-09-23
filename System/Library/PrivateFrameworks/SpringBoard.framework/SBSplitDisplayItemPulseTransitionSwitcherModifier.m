@implementation SBSplitDisplayItemPulseTransitionSwitcherModifier

- (SBSplitDisplayItemPulseTransitionSwitcherModifier)initWithTransitionID:(id)a3 appLayout:(id)a4 layoutRole:(int64_t)a5 chamoisWindowingUIEnabled:(BOOL)a6
{
  id v11;
  id v12;
  SBSplitDisplayItemPulseTransitionSwitcherModifier *v13;
  void *v14;
  void *v15;
  SBPulseTransitionSwitcherModifier *v16;
  SBSplitDisplayItemSwitcherModifier *v17;
  void *v19;
  void *v20;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v21.receiver = self;
  v21.super_class = (Class)SBSplitDisplayItemPulseTransitionSwitcherModifier;
  v13 = -[SBSwitcherModifier init](&v21, sel_init);
  if (v13)
  {
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("SBSplitDisplayItemPulseTransitionSwitcherModifier.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appLayout"));

    }
    if (!a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("SBSplitDisplayItemPulseTransitionSwitcherModifier.m"), 26, CFSTR("layoutRole must not be undefined"));

    }
    objc_storeStrong((id *)&v13->_appLayout, a4);
    v13->_layoutRole = a5;
    v13->_isChamoisWindowingUIEnabled = a6;
    objc_msgSend(v12, "leafAppLayoutForRole:", a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "itemForLayoutRole:", a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[SBPulseTransitionSwitcherModifier initWithTransitionID:appLayout:]([SBPulseTransitionSwitcherModifier alloc], "initWithTransitionID:appLayout:", v11, v14);
    v17 = -[SBSplitDisplayItemSwitcherModifier initWithDisplayItem:wrappingModifier:]([SBSplitDisplayItemSwitcherModifier alloc], "initWithDisplayItem:wrappingModifier:", v15, v16);
    -[SBSplitDisplayItemSwitcherModifier setCompletesWhenGesturePossible:](v17, "setCompletesWhenGesturePossible:", 1);
    -[SBChainableModifier addChildModifier:](v13, "addChildModifier:", v17);

  }
  return v13;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  SBUpdateLayoutSwitcherEventResponse *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBSplitDisplayItemPulseTransitionSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier handleTransitionEvent:](&v10, sel_handleTransitionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_floatingConfiguration = objc_msgSend(v4, "toFloatingConfiguration", v10.receiver, v10.super_class);
  v6 = objc_msgSend(v4, "phase");

  if (v6 == 1)
  {
    v7 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 8, 2);
    SBAppendSwitcherModifierResponse(v7, v5);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  return v5;
}

- (BOOL)completesWhenChildrenComplete
{
  return 1;
}

- (id)visibleHomeAffordanceLayoutElements
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBSplitDisplayItemPulseTransitionSwitcherModifier;
  -[SBSplitDisplayItemPulseTransitionSwitcherModifier visibleHomeAffordanceLayoutElements](&v7, sel_visibleHomeAffordanceLayoutElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSplitDisplayItemPulseTransitionSwitcherModifier _previousHomeAffordanceAppLayout](self, "_previousHomeAffordanceAppLayout");
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
    -[SBSplitDisplayItemPulseTransitionSwitcherModifier _previousHomeAffordanceAppLayout](self, "_previousHomeAffordanceAppLayout");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBSplitDisplayItemPulseTransitionSwitcherModifier;
    -[SBSplitDisplayItemPulseTransitionSwitcherModifier homeAffordanceLayoutElementToPortalIntoShelf:](&v8, sel_homeAffordanceLayoutElementToPortalIntoShelf_, v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (id)_previousHomeAffordanceAppLayout
{
  SBAppLayout *appLayout;
  SBAppLayout *v4;
  _QWORD v6[5];

  appLayout = self->_appLayout;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __85__SBSplitDisplayItemPulseTransitionSwitcherModifier__previousHomeAffordanceAppLayout__block_invoke;
  v6[3] = &unk_1E8E9DF50;
  v6[4] = self;
  -[SBAppLayout appLayoutWithItemsPassingTest:](appLayout, "appLayoutWithItemsPassingTest:", v6);
  v4 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    v4 = self->_appLayout;
  return v4;
}

uint64_t __85__SBSplitDisplayItemPulseTransitionSwitcherModifier__previousHomeAffordanceAppLayout__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 112);
  v4 = *(_QWORD *)(v2 + 120);
  v5 = a2;
  objc_msgSend(v3, "itemForLayoutRole:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v6, "isEqual:", v5);

  return v4 ^ 1;
}

- (id)containerLeafAppLayoutForShelf:(id)a3
{
  SBAppLayout *appLayout;
  _QWORD v6[5];

  if (objc_msgSend(a3, "layoutRole") == 3)
    return 0;
  appLayout = self->_appLayout;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __84__SBSplitDisplayItemPulseTransitionSwitcherModifier_containerLeafAppLayoutForShelf___block_invoke;
  v6[3] = &unk_1E8E9DF50;
  v6[4] = self;
  -[SBAppLayout appLayoutWithItemsPassingTest:](appLayout, "appLayoutWithItemsPassingTest:", v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __84__SBSplitDisplayItemPulseTransitionSwitcherModifier_containerLeafAppLayoutForShelf___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 112);
  v4 = *(_QWORD *)(v2 + 120);
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
  v20.super_class = (Class)SBSplitDisplayItemPulseTransitionSwitcherModifier;
  v4 = a3;
  -[SBSplitDisplayItemPulseTransitionSwitcherModifier frameForShelf:](&v20, sel_frameForShelf_, v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = objc_msgSend(v4, "layoutRole", v20.receiver, v20.super_class);

  if (v13 == 3)
  {
    -[SBSplitDisplayItemPulseTransitionSwitcherModifier floatingApplicationFrameInInterfaceOrientation:floatingConfiguration:](self, "floatingApplicationFrameInInterfaceOrientation:floatingConfiguration:", -[SBSplitDisplayItemPulseTransitionSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation"), self->_floatingConfiguration);
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

- (id)topMostLayoutElements
{
  void *v3;
  SBAppLayout *appLayout;
  void *v5;
  void *v6;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SBSplitDisplayItemPulseTransitionSwitcherModifier;
  -[SBSplitDisplayItemPulseTransitionSwitcherModifier topMostLayoutElements](&v14, sel_topMostLayoutElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  appLayout = self->_appLayout;
  if (self->_layoutRole == 4)
  {
    -[SBAppLayout leafAppLayoutForRole:](appLayout, "leafAppLayoutForRole:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sb_arrayByInsertingOrMovingObject:toIndex:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __74__SBSplitDisplayItemPulseTransitionSwitcherModifier_topMostLayoutElements__block_invoke;
    v13[3] = &unk_1E8E9DF50;
    v13[4] = self;
    -[SBAppLayout appLayoutWithItemsPassingTest:](appLayout, "appLayoutWithItemsPassingTest:", v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = objc_msgSend(v3, "indexOfObjectPassingTest:", &__block_literal_global_267);
      if (v9 == 0x7FFFFFFFFFFFFFFFLL)
        v10 = 0;
      else
        v10 = v9 + 1;
      objc_msgSend(v3, "sb_arrayByInsertingOrMovingObject:toIndex:", v8, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[SBAppLayout leafAppLayoutForRole:](self->_appLayout, "leafAppLayoutForRole:", self->_layoutRole);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sb_arrayByInsertingOrMovingObject:toIndex:", v12, v10);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    return v3;
  }
}

uint64_t __74__SBSplitDisplayItemPulseTransitionSwitcherModifier_topMostLayoutElements__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 112);
  v4 = *(_QWORD *)(v2 + 120);
  v5 = a2;
  objc_msgSend(v3, "itemForLayoutRole:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v6, "isEqual:", v5);

  return v4 ^ 1;
}

BOOL __74__SBSplitDisplayItemPulseTransitionSwitcherModifier_topMostLayoutElements__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "switcherLayoutElementType") == 7;
}

- (double)backgroundOpacityForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  objc_super v10;

  -[SBSplitDisplayItemPulseTransitionSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0.0;
  if (!-[SBAppLayout isOrContainsAppLayout:](self->_appLayout, "isOrContainsAppLayout:", v6))
  {
    v10.receiver = self;
    v10.super_class = (Class)SBSplitDisplayItemPulseTransitionSwitcherModifier;
    -[SBSplitDisplayItemPulseTransitionSwitcherModifier backgroundOpacityForIndex:](&v10, sel_backgroundOpacityForIndex_, a3);
    v7 = v8;
  }

  return v7;
}

- (id)appLayoutsToResignActive
{
  objc_super v3;

  if (self->_isChamoisWindowingUIEnabled)
    return MEMORY[0x1E0C9AA70];
  v3.receiver = self;
  v3.super_class = (Class)SBSplitDisplayItemPulseTransitionSwitcherModifier;
  -[SBSplitDisplayItemPulseTransitionSwitcherModifier appLayoutsToResignActive](&v3, sel_appLayoutsToResignActive);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (int64_t)layoutRole
{
  return self->_layoutRole;
}

- (BOOL)isChamoisWindowingUIEnabled
{
  return self->_isChamoisWindowingUIEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end
