@implementation SBFilteringSwitcherModifier

- (SBFilteringSwitcherModifier)initWithAppLayouts:(id)a3 modifier:(id)a4
{
  id v7;
  id v8;
  SBFilteringSwitcherModifier *v9;
  uint64_t v10;
  NSArray *appLayoutsToFilter;
  _SBFilteringPassthroughTargetSwitcherModifier *v12;
  _SBFilteringPassthroughTargetSwitcherModifier *passthroughModifier;
  SBRoutingSwitcherModifier *v14;
  void *v15;
  SBRoutingSwitcherModifier *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSSet *displayItemsToFilter;
  void *v23;
  void *v24;
  objc_super v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)SBFilteringSwitcherModifier;
  v9 = -[SBSwitcherModifier init](&v25, sel_init);
  if (v9)
  {
    if (v7)
    {
      if (v8)
      {
LABEL_4:
        v10 = objc_msgSend(v7, "copy");
        appLayoutsToFilter = v9->_appLayoutsToFilter;
        v9->_appLayoutsToFilter = (NSArray *)v10;

        objc_storeStrong((id *)&v9->_modifier, a4);
        v12 = objc_alloc_init(_SBFilteringPassthroughTargetSwitcherModifier);
        passthroughModifier = v9->_passthroughModifier;
        v9->_passthroughModifier = v12;

        v14 = [SBRoutingSwitcherModifier alloc];
        v26[0] = v9->_modifier;
        v26[1] = v9->_passthroughModifier;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[SBRoutingSwitcherModifier initWithModifiers:delegate:](v14, "initWithModifiers:delegate:", v15, v9);

        -[SBChainableModifier addChildModifier:atLevel:key:](v9, "addChildModifier:atLevel:key:", v16, 0, 0);
        v17 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(v7, "bs_compactMap:", &__block_literal_global_278);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "bs_flatten");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setWithArray:", v19);
        v20 = objc_claimAutoreleasedReturnValue();
        displayItemsToFilter = v9->_displayItemsToFilter;
        v9->_displayItemsToFilter = (NSSet *)v20;

        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("SBFilteringSwitcherModifier.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appLayoutsToFilter"));

      if (v8)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("SBFilteringSwitcherModifier.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("modifier"));

    goto LABEL_4;
  }
LABEL_5:

  return v9;
}

uint64_t __59__SBFilteringSwitcherModifier_initWithAppLayouts_modifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "allItems");
}

- (void)didMoveToParentModifier:(id)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBFilteringSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v6, sel_didMoveToParentModifier_);
  if (a3)
  {
    -[SBChainableModifier delegate](self->_passthroughModifier, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[SBChainableModifier setDelegate:](self->_passthroughModifier, "setDelegate:", 0);
      -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", self->_passthroughModifier, 1, 0);
      -[SBFilteringSwitcherModifier newAppLayoutsGenCount](self, "newAppLayoutsGenCount");
    }
  }
}

- (void)setState:(int64_t)a3
{
  int64_t v5;
  objc_super v6;

  v5 = -[SBChainableModifier state](self, "state");
  if (a3 == 1 && v5 != 1)
    -[SBFilteringSwitcherModifier newAppLayoutsGenCount](self, "newAppLayoutsGenCount");
  v6.receiver = self;
  v6.super_class = (Class)SBFilteringSwitcherModifier;
  -[SBChainableModifier setState:](&v6, sel_setState_, a3);
}

- (id)routingModifier:(id)a3 event:(id)a4 forModifier:(id)a5
{
  id v7;
  _SBFilteringPassthroughTargetSwitcherModifier *v8;
  NSArray *appLayoutsToFilter;
  void *v10;
  NSArray *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  SBRoutingSwitcherModifier *routingModifier;
  void *v17;
  void *v18;
  void *v19;
  SBRoutingSwitcherModifier *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (_SBFilteringPassthroughTargetSwitcherModifier *)a5;
  if (objc_msgSend(v7, "type") != 17)
  {
    if (objc_msgSend(v7, "type") != 1)
    {
LABEL_17:
      v13 = v7;
      goto LABEL_28;
    }
    v13 = (id)objc_msgSend(v7, "copy");
    objc_msgSend(v13, "fromAppLayout");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "toAppLayout");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      routingModifier = self->_routingModifier;
      v32[0] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFilteringSwitcherModifier routingModifier:filteredAppLayouts:forModifier:](self, "routingModifier:filteredAppLayouts:forModifier:", routingModifier, v17, v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setFromAppLayout:", v19);

    }
    if (v15)
    {
      v20 = self->_routingModifier;
      v31 = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFilteringSwitcherModifier routingModifier:filteredAppLayouts:forModifier:](self, "routingModifier:filteredAppLayouts:forModifier:", v20, v21, v8);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "firstObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setToAppLayout:", v23);

    }
    if (objc_msgSend(v13, "fromEnvironmentMode") == 3
      && (objc_msgSend(v13, "fromAppLayout"), v24 = (void *)objc_claimAutoreleasedReturnValue(), v24, !v24))
    {
      v26 = 1;
    }
    else
    {
      if (objc_msgSend(v13, "fromEnvironmentMode") != 1
        || (objc_msgSend(v13, "fromAppLayout"),
            v25 = (void *)objc_claimAutoreleasedReturnValue(),
            v25,
            !v25))
      {
LABEL_20:
        if (objc_msgSend(v13, "toEnvironmentMode") == 3
          && (objc_msgSend(v13, "toAppLayout"),
              v27 = (void *)objc_claimAutoreleasedReturnValue(),
              v27,
              !v27))
        {
          v29 = 1;
        }
        else
        {
          if (objc_msgSend(v13, "toEnvironmentMode") != 1)
            goto LABEL_27;
          objc_msgSend(v13, "toAppLayout");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v28)
            goto LABEL_27;
          v29 = 3;
        }
        objc_msgSend(v13, "setToEnvironmentMode:", v29);
LABEL_27:

        goto LABEL_28;
      }
      v26 = 3;
    }
    objc_msgSend(v13, "setFromEnvironmentMode:", v26);
    goto LABEL_20;
  }
  if ((_SBFilteringPassthroughTargetSwitcherModifier *)self->_modifier == v8)
  {
    appLayoutsToFilter = self->_appLayoutsToFilter;
    objc_msgSend(v7, "appLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(appLayoutsToFilter) = -[NSArray containsObject:](appLayoutsToFilter, "containsObject:", v10);

    if ((_DWORD)appLayoutsToFilter)
      goto LABEL_17;
  }
  if (self->_passthroughModifier == v8)
  {
    v11 = self->_appLayoutsToFilter;
    objc_msgSend(v7, "appLayout");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v11) = -[NSArray containsObject:](v11, "containsObject:", v12);

    if ((v11 & 1) == 0)
      goto LABEL_17;
  }
  v13 = 0;
LABEL_28:

  return v13;
}

- (id)routingModifier:(id)a3 filteredAppLayouts:(id)a4 forModifier:(id)a5
{
  id (*v5)(uint64_t, void *);
  uint64_t *v6;
  uint64_t v8;
  uint64_t v9;

  if (self->_modifier == a5)
  {
    v9 = MEMORY[0x1E0C809B0];
    v5 = __78__SBFilteringSwitcherModifier_routingModifier_filteredAppLayouts_forModifier___block_invoke;
    v6 = &v9;
  }
  else
  {
    v8 = MEMORY[0x1E0C809B0];
    v5 = __78__SBFilteringSwitcherModifier_routingModifier_filteredAppLayouts_forModifier___block_invoke_3;
    v6 = &v8;
  }
  v6[1] = 3221225472;
  v6[2] = (uint64_t)v5;
  v6[3] = (uint64_t)&unk_1E8EA43E8;
  v6[4] = (uint64_t)self;
  objc_msgSend(a4, "bs_compactMap:", v8);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __78__SBFilteringSwitcherModifier_routingModifier_filteredAppLayouts_forModifier___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __78__SBFilteringSwitcherModifier_routingModifier_filteredAppLayouts_forModifier___block_invoke_2;
  v3[3] = &unk_1E8E9DF50;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "appLayoutWithItemsPassingTest:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __78__SBFilteringSwitcherModifier_routingModifier_filteredAppLayouts_forModifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "containsObject:", a2);
}

id __78__SBFilteringSwitcherModifier_routingModifier_filteredAppLayouts_forModifier___block_invoke_3(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __78__SBFilteringSwitcherModifier_routingModifier_filteredAppLayouts_forModifier___block_invoke_4;
  v3[3] = &unk_1E8E9DF50;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "appLayoutWithItemsPassingTest:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __78__SBFilteringSwitcherModifier_routingModifier_filteredAppLayouts_forModifier___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "containsObject:", a2) ^ 1;
}

- (id)routingModifier:(id)a3 modifierForAppLayout:(id)a4
{
  int v5;
  int *v6;

  v5 = objc_msgSend(a4, "containsAnyItemFromSet:", self->_displayItemsToFilter);
  v6 = &OBJC_IVAR___SBFilteringSwitcherModifier__passthroughModifier;
  if (v5)
    v6 = &OBJC_IVAR___SBFilteringSwitcherModifier__modifier;
  return *(id *)((char *)&self->super.super.super.isa + *v6);
}

- (id)routingModifier:(id)a3 filteredContinuousExposeIdentifiers:(id)a4 forModifier:(id)a5
{
  return a4;
}

- (CGRect)routingModifier:(id)a3 containerViewBoundsForModifier:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;
  CGRect result;

  v8.receiver = self;
  v8.super_class = (Class)SBFilteringSwitcherModifier;
  -[SBFilteringSwitcherModifier containerViewBounds](&v8, sel_containerViewBounds, a3, a4);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)routingModifier:(id)a3 switcherViewBoundsForModifier:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;
  CGRect result;

  v8.receiver = self;
  v8.super_class = (Class)SBFilteringSwitcherModifier;
  -[SBFilteringSwitcherModifier switcherViewBounds](&v8, sel_switcherViewBounds, a3, a4);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (id)scrollModifierForRoutingModifier:(id)a3
{
  return self->_passthroughModifier;
}

- (id)homeScreenModifierForRoutingModifier:(id)a3
{
  return self->_passthroughModifier;
}

- (id)transactionCompletionOptionsModifierForRoutingModifier:(id)a3
{
  return self->_passthroughModifier;
}

- (id)routingModifier:(id)a3 animationAttributesModifierForLayoutElement:(id)a4
{
  id v5;
  int *v6;
  id v7;

  v5 = a4;
  if (objc_msgSend(v5, "switcherLayoutElementType")
    || !-[NSArray containsObject:](self->_appLayoutsToFilter, "containsObject:", v5))
  {
    v6 = &OBJC_IVAR___SBFilteringSwitcherModifier__passthroughModifier;
  }
  else
  {
    v6 = &OBJC_IVAR___SBFilteringSwitcherModifier__modifier;
  }
  v7 = *(id *)((char *)&self->super.super.super.isa + *v6);

  return v7;
}

- (id)fallbackModifierForRoutingModifier:(id)a3
{
  return self->_passthroughModifier;
}

- (NSArray)appLayoutsToFilter
{
  return self->_appLayoutsToFilter;
}

- (SBSwitcherModifier)modifier
{
  return self->_modifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifier, 0);
  objc_storeStrong((id *)&self->_appLayoutsToFilter, 0);
  objc_storeStrong((id *)&self->_displayItemsToFilter, 0);
  objc_storeStrong((id *)&self->_passthroughModifier, 0);
  objc_storeStrong((id *)&self->_routingModifier, 0);
}

@end
