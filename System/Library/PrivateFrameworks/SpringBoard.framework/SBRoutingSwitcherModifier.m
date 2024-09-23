@implementation SBRoutingSwitcherModifier

- (SBRoutingSwitcherModifier)initWithModifiers:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  SBRoutingSwitcherModifier *v8;
  uint64_t v9;
  NSArray *modifiers;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBRoutingSwitcherModifier;
  v8 = -[SBSwitcherModifier init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    modifiers = v8->_modifiers;
    v8->_modifiers = (NSArray *)v9;

    objc_storeWeak((id *)&v8->_routingDelegate, v7);
  }

  return v8;
}

- (void)didMoveToParentModifier:(id)a3
{
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)SBRoutingSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v14, sel_didMoveToParentModifier_);
  if (a3)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = self->_modifiers;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setDelegate:", self, (_QWORD)v10);
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
      }
      while (v7);
    }

  }
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  id v7;
  __CFString *v8;
  __CFString *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  __CFString *v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v4, "stringByAppendingString:", CFSTR("\t"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("\t");
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__SBRoutingSwitcherModifier_descriptionBuilderWithMultilinePrefix___block_invoke;
  v12[3] = &unk_1E8E9E270;
  v12[4] = self;
  v7 = v5;
  v13 = v7;
  v14 = v6;
  v8 = v6;
  objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("modifiers"), v4, v12);
  v9 = v14;
  v10 = v7;

  return v10;
}

void __67__SBRoutingSwitcherModifier_descriptionBuilderWithMultilinePrefix___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = *(id *)(a1[4] + 136);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v7, "delegate", (_QWORD)v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)a1[4];

        if (v8 == v9)
        {
          v10 = (void *)a1[5];
          objc_msgSend(v7, "descriptionWithMultilinePrefix:", a1[6]);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (id)objc_msgSend(v10, "appendObject:withName:", v11, 0);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

}

- (id)stackDescriptionWithPrefix:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  SBRoutingSwitcherModifier *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)MEMORY[0x1E0CB3940];
  -[SBSwitcherModifier displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@%@"), v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v8);

  objc_msgSend(v4, "stringByAppendingString:", CFSTR("    "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = self->_modifiers;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v15, "delegate");
        v16 = (SBRoutingSwitcherModifier *)objc_claimAutoreleasedReturnValue();

        if (v16 == self)
        {
          objc_msgSend(v15, "stackDescriptionWithPrefix:", v9);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v17);

        }
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }

  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("\n"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  NSArray *modifiers;
  id WeakRetained;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  modifiers = self->_modifiers;
  WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  v7 = (void *)objc_msgSend(v4, "initWithModifiers:delegate:", modifiers, WeakRetained);

  return v7;
}

- (id)handleEvent:(id)a3
{
  id v4;
  id WeakRetained;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v17;
  _QWORD v18[5];
  id v19;
  SBRoutingSwitcherModifier *v20;
  uint64_t *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__28;
  v30 = __Block_byref_object_dispose__28;
  v31 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = self->_modifiers;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
  if (v7)
  {
    v17 = 0;
    v8 = *(_QWORD *)v23;
    v9 = v4;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(WeakRetained, "routingModifier:event:forModifier:", self, v4, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          if (objc_msgSend(v12, "isHandled"))
          {
            objc_msgSend(v12, "unhandledCopy");
            v13 = objc_claimAutoreleasedReturnValue();

            v12 = (void *)v13;
          }
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __41__SBRoutingSwitcherModifier_handleEvent___block_invoke;
          v18[3] = &unk_1E8EA4E50;
          v18[4] = v11;
          v9 = v12;
          v19 = v9;
          v20 = self;
          v21 = &v26;
          _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v11, v18);
          if (objc_msgSend(v9, "isHandled"))
          {
            objc_msgSend(v9, "handledReason");
            v14 = objc_claimAutoreleasedReturnValue();

            v17 = (void *)v14;
          }

        }
        else
        {
          v9 = 0;
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
    }
    while (v7);

    if (v17)
    {
      if ((objc_msgSend(v4, "isHandled") & 1) == 0)
        objc_msgSend(v4, "handleWithReason:", v17);
    }
    else
    {
      v17 = 0;
    }
  }
  else
  {

    v17 = 0;
    v9 = v4;
  }
  v15 = (id)v27[5];

  _Block_object_dispose(&v26, 8);
  return v15;
}

void __41__SBRoutingSwitcherModifier_handleEvent___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "handleEvent:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "responseForProposedChildResponse:childModifier:event:", v2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v6, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)appLayouts
{
  id WeakRetained;
  id v4;
  void *v5;
  NSMapTable *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  NSMapTable *appLayouts_appLayoutsForModifiers;
  NSMapTable *v15;
  void *v16;
  void *v17;
  unint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  v25.receiver = self;
  v25.super_class = (Class)SBRoutingSwitcherModifier;
  v4 = -[SBRoutingSwitcherModifier appLayoutsGenerationCount](&v25, sel_appLayoutsGenerationCount);
  if ((id)self->_appLayouts_lastAppLayoutsGenCount != v4)
  {
    v19 = (unint64_t)v4;
    v24.receiver = self;
    v24.super_class = (Class)SBRoutingSwitcherModifier;
    -[SBRoutingSwitcherModifier appLayouts](&v24, sel_appLayouts);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v6 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v7 = self->_modifiers;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(WeakRetained, "routingModifier:filteredAppLayouts:forModifier:", self, v5, v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMapTable setObject:forKey:](v6, "setObject:forKey:", v13, v12);

        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      }
      while (v9);
    }

    appLayouts_appLayoutsForModifiers = self->_appLayouts_appLayoutsForModifiers;
    self->_appLayouts_appLayoutsForModifiers = v6;

    self->_appLayouts_lastAppLayoutsGenCount = v19;
  }
  v15 = self->_appLayouts_appLayoutsForModifiers;
  -[SBRoutingSwitcherModifier _currentModifierOrFallback](self, "_currentModifierOrFallback");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](v15, "objectForKey:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (CGRect)containerViewBounds
{
  id WeakRetained;
  void *v4;
  double v5;
  double v6;
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
  CGRect result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  -[SBRoutingSwitcherModifier _currentModifierOrFallback](self, "_currentModifierOrFallback");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "routingModifier:containerViewBoundsForModifier:", self, v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)switcherViewBounds
{
  id WeakRetained;
  void *v4;
  double v5;
  double v6;
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
  CGRect result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  -[SBRoutingSwitcherModifier _currentModifierOrFallback](self, "_currentModifierOrFallback");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "routingModifier:switcherViewBoundsForModifier:", self, v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)_currentModifierOrFallback
{
  SBSwitcherModifier *currentModifier;
  SBSwitcherModifier *v3;
  id WeakRetained;

  currentModifier = self->_currentModifier;
  if (currentModifier)
  {
    v3 = currentModifier;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
    objc_msgSend(WeakRetained, "fallbackModifierForRoutingModifier:", self);
    v3 = (SBSwitcherModifier *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  int64_t v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  uint64_t v29;
  double *v30;
  uint64_t v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4;
  v29 = 0;
  v30 = (double *)&v29;
  v31 = 0x4010000000;
  v32 = &unk_1D0FA064E;
  v33 = 0u;
  v34 = 0u;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __71__SBRoutingSwitcherModifier_frameForLayoutRole_inAppLayout_withBounds___block_invoke;
  v21[3] = &unk_1E8EA8EF8;
  v23 = &v29;
  v24 = a3;
  v12 = v11;
  v22 = v12;
  v25 = x;
  v26 = y;
  v27 = width;
  v28 = height;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v12, v21);
  v13 = v30[4];
  v14 = v30[5];
  v15 = v30[6];
  v16 = v30[7];

  _Block_object_dispose(&v29, 8);
  v17 = v13;
  v18 = v14;
  v19 = v15;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

uint64_t __71__SBRoutingSwitcherModifier_frameForLayoutRole_inAppLayout_withBounds___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = objc_msgSend(a2, "frameForLayoutRole:inAppLayout:withBounds:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v4 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v4[4] = v5;
  v4[5] = v6;
  v4[6] = v7;
  v4[7] = v8;
  return result;
}

- (double)scaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  id v7;
  double v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  int64_t v13;
  uint64_t v14;
  double *v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a4;
  v14 = 0;
  v15 = (double *)&v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__SBRoutingSwitcherModifier_scaleForLayoutRole_inAppLayout___block_invoke;
  v10[3] = &unk_1E8EA8F20;
  v12 = &v14;
  v13 = a3;
  v7 = v6;
  v11 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v10);
  v8 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

uint64_t __60__SBRoutingSwitcherModifier_scaleForLayoutRole_inAppLayout___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t result;
  uint64_t v4;

  result = objc_msgSend(a2, "scaleForLayoutRole:inAppLayout:", a1[6], a1[4]);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v4;
  return result;
}

- (UIRectCornerRadii)cornerRadiiForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withCornerRadii:(UIRectCornerRadii)a5
{
  double topRight;
  double bottomRight;
  double bottomLeft;
  double topLeft;
  id v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  int64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  double *v30;
  uint64_t v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  UIRectCornerRadii result;

  topRight = a5.topRight;
  bottomRight = a5.bottomRight;
  bottomLeft = a5.bottomLeft;
  topLeft = a5.topLeft;
  v11 = a4;
  v29 = 0;
  v30 = (double *)&v29;
  v31 = 0x4010000000;
  v32 = &unk_1D0FA064E;
  v33 = 0u;
  v34 = 0u;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __82__SBRoutingSwitcherModifier_cornerRadiiForLayoutRole_inAppLayout_withCornerRadii___block_invoke;
  v21[3] = &unk_1E8EA8EF8;
  v23 = &v29;
  v24 = a3;
  v12 = v11;
  v22 = v12;
  v25 = topLeft;
  v26 = bottomLeft;
  v27 = bottomRight;
  v28 = topRight;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v12, v21);
  v13 = v30[4];
  v14 = v30[5];
  v15 = v30[6];
  v16 = v30[7];

  _Block_object_dispose(&v29, 8);
  v17 = v13;
  v18 = v14;
  v19 = v15;
  v20 = v16;
  result.topRight = v20;
  result.bottomRight = v19;
  result.bottomLeft = v18;
  result.topLeft = v17;
  return result;
}

uint64_t __82__SBRoutingSwitcherModifier_cornerRadiiForLayoutRole_inAppLayout_withCornerRadii___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = objc_msgSend(a2, "cornerRadiiForLayoutRole:inAppLayout:withCornerRadii:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v4 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v4[4] = v5;
  v4[5] = v6;
  v4[6] = v7;
  v4[7] = v8;
  return result;
}

- (int64_t)tintStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  int64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__SBRoutingSwitcherModifier_tintStyleForLayoutRole_inAppLayout___block_invoke;
  v10[3] = &unk_1E8EA8F20;
  v12 = &v14;
  v13 = a3;
  v7 = v6;
  v11 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v10);
  v8 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

uint64_t __64__SBRoutingSwitcherModifier_tintStyleForLayoutRole_inAppLayout___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "tintStyleForLayoutRole:inAppLayout:", a1[6], a1[4]);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  int64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__SBRoutingSwitcherModifier_shadowStyleForLayoutRole_inAppLayout___block_invoke;
  v10[3] = &unk_1E8EA8F20;
  v12 = &v14;
  v13 = a3;
  v7 = v6;
  v11 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v10);
  v8 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

uint64_t __66__SBRoutingSwitcherModifier_shadowStyleForLayoutRole_inAppLayout___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "shadowStyleForLayoutRole:inAppLayout:", a1[6], a1[4]);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

- (id)topMostLayoutRolesForAppLayout:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__28;
  v15 = __Block_byref_object_dispose__28;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__SBRoutingSwitcherModifier_topMostLayoutRolesForAppLayout___block_invoke;
  v8[3] = &unk_1E8EA8F48;
  v10 = &v11;
  v5 = v4;
  v9 = v5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v5, v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __60__SBRoutingSwitcherModifier_topMostLayoutRolesForAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "topMostLayoutRolesForAppLayout:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  int64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__SBRoutingSwitcherModifier_isLayoutRoleMatchMovedToScene_inAppLayout___block_invoke;
  v9[3] = &unk_1E8EA8F20;
  v11 = &v13;
  v12 = a3;
  v7 = v6;
  v10 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v9);
  LOBYTE(self) = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)self;
}

uint64_t __71__SBRoutingSwitcherModifier_isLayoutRoleMatchMovedToScene_inAppLayout___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isLayoutRoleMatchMovedToScene:inAppLayout:", a1[6], a1[4]);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  void *v11;
  id v12;
  NSArray *obj;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = self->_modifiers;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v25;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v8);
        WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
        objc_msgSend(WeakRetained, "routingModifier:filteredAppLayouts:forModifier:", self, v4, v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = 0;
        v19 = &v18;
        v20 = 0x3032000000;
        v21 = __Block_byref_object_copy__28;
        v22 = __Block_byref_object_dispose__28;
        v23 = 0;
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __61__SBRoutingSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke;
        v15[3] = &unk_1E8E9FD30;
        v17 = &v18;
        v15[4] = v9;
        v12 = v11;
        v16 = v12;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v9, v15);
        objc_msgSend(v5, "addObjectsFromArray:", v19[5]);

        _Block_object_dispose(&v18, 8);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v6);
  }

  return v5;
}

void __61__SBRoutingSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "adjustedAppLayoutsForAppLayouts:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  objc_msgSend(WeakRetained, "routingModifier:animationAttributesModifierForLayoutElement:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__28;
  v19 = __Block_byref_object_dispose__28;
  v20 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__SBRoutingSwitcherModifier_animationAttributesForLayoutElement___block_invoke;
  v11[3] = &unk_1E8E9FD30;
  v14 = &v15;
  v7 = v6;
  v12 = v7;
  v8 = v4;
  v13 = v8;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v7, v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __65__SBRoutingSwitcherModifier_animationAttributesForLayoutElement___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "animationAttributesForLayoutElement:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)switcherDropRegionContextForDraggingLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atLocation:(CGPoint)a5
{
  CGFloat y;
  CGFloat x;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  int64_t v16;
  CGFloat v17;
  CGFloat v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  y = a5.y;
  x = a5.x;
  v9 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__28;
  v23 = __Block_byref_object_dispose__28;
  v24 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __99__SBRoutingSwitcherModifier_switcherDropRegionContextForDraggingLayoutRole_inAppLayout_atLocation___block_invoke;
  v13[3] = &unk_1E8EA8F70;
  v15 = &v19;
  v16 = a3;
  v10 = v9;
  v14 = v10;
  v17 = x;
  v18 = y;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v10, v13);
  v11 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v11;
}

void __99__SBRoutingSwitcherModifier_switcherDropRegionContextForDraggingLayoutRole_inAppLayout_atLocation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "switcherDropRegionContextForDraggingLayoutRole:inAppLayout:atLocation:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (BOOL)isLayoutRoleDraggable:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  int64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__SBRoutingSwitcherModifier_isLayoutRoleDraggable_inAppLayout___block_invoke;
  v9[3] = &unk_1E8EA8F20;
  v11 = &v13;
  v12 = a3;
  v7 = v6;
  v10 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v9);
  LOBYTE(self) = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)self;
}

uint64_t __63__SBRoutingSwitcherModifier_isLayoutRoleDraggable_inAppLayout___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isLayoutRoleDraggable:inAppLayout:", a1[6], a1[4]);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

- (BOOL)isLayoutRoleEligibleForContentDragSpringLoading:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  int64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __89__SBRoutingSwitcherModifier_isLayoutRoleEligibleForContentDragSpringLoading_inAppLayout___block_invoke;
  v9[3] = &unk_1E8EA8F20;
  v11 = &v13;
  v12 = a3;
  v7 = v6;
  v10 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v9);
  LOBYTE(self) = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)self;
}

uint64_t __89__SBRoutingSwitcherModifier_isLayoutRoleEligibleForContentDragSpringLoading_inAppLayout___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isLayoutRoleEligibleForContentDragSpringLoading:inAppLayout:", a1[6], a1[4]);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

- (BOOL)canLayoutRoleParticipateInSwitcherDragAndDrop:(int64_t)a3 appLayout:(id)a4
{
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  int64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __85__SBRoutingSwitcherModifier_canLayoutRoleParticipateInSwitcherDragAndDrop_appLayout___block_invoke;
  v9[3] = &unk_1E8EA8F20;
  v11 = &v13;
  v12 = a3;
  v7 = v6;
  v10 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v9);
  LOBYTE(self) = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)self;
}

uint64_t __85__SBRoutingSwitcherModifier_canLayoutRoleParticipateInSwitcherDragAndDrop_appLayout___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "canLayoutRoleParticipateInSwitcherDragAndDrop:appLayout:", a1[6], a1[4]);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

- (double)backgroundOpacityForIndex:(unint64_t)a3
{
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__SBRoutingSwitcherModifier_backgroundOpacityForIndex___block_invoke;
  v5[3] = &unk_1E8EA8F98;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __55__SBRoutingSwitcherModifier_backgroundOpacityForIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;

  result = objc_msgSend(a2, "backgroundOpacityForIndex:");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
  return result;
}

- (unint64_t)maskedCornersForIndex:(unint64_t)a3
{
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__SBRoutingSwitcherModifier_maskedCornersForIndex___block_invoke;
  v5[3] = &unk_1E8EA8F98;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __51__SBRoutingSwitcherModifier_maskedCornersForIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "maskedCornersForIndex:");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (unint64_t)maskedCornersForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withMaskedCorners:(unint64_t)a5
{
  id v8;
  id v9;
  unint64_t v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  int64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v8 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __86__SBRoutingSwitcherModifier_maskedCornersForLayoutRole_inAppLayout_withMaskedCorners___block_invoke;
  v12[3] = &unk_1E8EA8FC0;
  v14 = &v17;
  v15 = a3;
  v9 = v8;
  v13 = v9;
  v16 = a5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v9, v12);
  v10 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v10;
}

uint64_t __86__SBRoutingSwitcherModifier_maskedCornersForLayoutRole_inAppLayout_withMaskedCorners___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "maskedCornersForLayoutRole:inAppLayout:withMaskedCorners:", a1[6], a1[4], a1[7]);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  int64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__SBRoutingSwitcherModifier_isLayoutRoleBlurred_inAppLayout___block_invoke;
  v9[3] = &unk_1E8EA8F20;
  v11 = &v13;
  v12 = a3;
  v7 = v6;
  v10 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v9);
  LOBYTE(self) = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)self;
}

uint64_t __61__SBRoutingSwitcherModifier_isLayoutRoleBlurred_inAppLayout___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isLayoutRoleBlurred:inAppLayout:", a1[6], a1[4]);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

- (unint64_t)blurTargetPreferenceForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  int64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__SBRoutingSwitcherModifier_blurTargetPreferenceForLayoutRole_inAppLayout___block_invoke;
  v10[3] = &unk_1E8EA8F20;
  v12 = &v14;
  v13 = a3;
  v7 = v6;
  v11 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v10);
  v8 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

uint64_t __75__SBRoutingSwitcherModifier_blurTargetPreferenceForLayoutRole_inAppLayout___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "blurTargetPreferenceForLayoutRole:inAppLayout:", a1[6], a1[4]);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  id v7;
  double v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  int64_t v13;
  uint64_t v14;
  double *v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a4;
  v14 = 0;
  v15 = (double *)&v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__SBRoutingSwitcherModifier_blurDelayForLayoutRole_inAppLayout___block_invoke;
  v10[3] = &unk_1E8EA8F20;
  v12 = &v14;
  v13 = a3;
  v7 = v6;
  v11 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v10);
  v8 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

uint64_t __64__SBRoutingSwitcherModifier_blurDelayForLayoutRole_inAppLayout___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t result;
  uint64_t v4;

  result = objc_msgSend(a2, "blurDelayForLayoutRole:inAppLayout:", a1[6], a1[4]);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v4;
  return result;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  id v9;
  double v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  int64_t v15;
  uint64_t v16;
  double *v17;
  uint64_t v18;
  uint64_t v19;

  v8 = a4;
  v16 = 0;
  v17 = (double *)&v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__SBRoutingSwitcherModifier_opacityForLayoutRole_inAppLayout_atIndex___block_invoke;
  v12[3] = &unk_1E8EA8FE8;
  v14 = &v16;
  v15 = a3;
  v9 = v8;
  v13 = v9;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a5, v12);
  v10 = v17[3];

  _Block_object_dispose(&v16, 8);
  return v10;
}

uint64_t __70__SBRoutingSwitcherModifier_opacityForLayoutRole_inAppLayout_atIndex___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v5;

  result = objc_msgSend(a2, "opacityForLayoutRole:inAppLayout:atIndex:", a1[6], a1[4], a3);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v5;
  return result;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  double v4;
  _QWORD v6[6];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__SBRoutingSwitcherModifier_shadowOpacityForLayoutRole_atIndex___block_invoke;
  v6[3] = &unk_1E8EA9010;
  v6[4] = &v7;
  v6[5] = a3;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a4, v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __64__SBRoutingSwitcherModifier_shadowOpacityForLayoutRole_atIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v5;

  result = objc_msgSend(a2, "shadowOpacityForLayoutRole:atIndex:", *(_QWORD *)(a1 + 40), a3);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
  return result;
}

- (BOOL)shouldAllowContentViewTouchesForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  int64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __84__SBRoutingSwitcherModifier_shouldAllowContentViewTouchesForLayoutRole_inAppLayout___block_invoke;
  v9[3] = &unk_1E8EA8F20;
  v11 = &v13;
  v12 = a3;
  v7 = v6;
  v10 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v9);
  LOBYTE(self) = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)self;
}

uint64_t __84__SBRoutingSwitcherModifier_shouldAllowContentViewTouchesForLayoutRole_inAppLayout___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "shouldAllowContentViewTouchesForLayoutRole:inAppLayout:", a1[6], a1[4]);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

- (BOOL)isLayoutRoleSelectable:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  int64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__SBRoutingSwitcherModifier_isLayoutRoleSelectable_inAppLayout___block_invoke;
  v9[3] = &unk_1E8EA8F20;
  v11 = &v13;
  v12 = a3;
  v7 = v6;
  v10 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v9);
  LOBYTE(self) = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)self;
}

uint64_t __64__SBRoutingSwitcherModifier_isLayoutRoleSelectable_inAppLayout___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isLayoutRoleSelectable:inAppLayout:", a1[6], a1[4]);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

- (BOOL)shouldSuppressHighlightEffectForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  int64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __84__SBRoutingSwitcherModifier_shouldSuppressHighlightEffectForLayoutRole_inAppLayout___block_invoke;
  v9[3] = &unk_1E8EA8F20;
  v11 = &v13;
  v12 = a3;
  v7 = v6;
  v10 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v9);
  LOBYTE(self) = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)self;
}

uint64_t __84__SBRoutingSwitcherModifier_shouldSuppressHighlightEffectForLayoutRole_inAppLayout___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "shouldSuppressHighlightEffectForLayoutRole:inAppLayout:", a1[6], a1[4]);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

- (BOOL)shouldUseNonuniformSnapshotScalingForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  int64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __89__SBRoutingSwitcherModifier_shouldUseNonuniformSnapshotScalingForLayoutRole_inAppLayout___block_invoke;
  v9[3] = &unk_1E8EA8F20;
  v11 = &v13;
  v12 = a3;
  v7 = v6;
  v10 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v9);
  LOBYTE(self) = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)self;
}

uint64_t __89__SBRoutingSwitcherModifier_shouldUseNonuniformSnapshotScalingForLayoutRole_inAppLayout___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "shouldUseNonuniformSnapshotScalingForLayoutRole:inAppLayout:", a1[6], a1[4]);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

- (int64_t)touchBehaviorForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  int64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__SBRoutingSwitcherModifier_touchBehaviorForLayoutRole_inAppLayout___block_invoke;
  v10[3] = &unk_1E8EA8F20;
  v12 = &v14;
  v13 = a3;
  v7 = v6;
  v11 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v10);
  v8 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

uint64_t __68__SBRoutingSwitcherModifier_touchBehaviorForLayoutRole_inAppLayout___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "touchBehaviorForLayoutRole:inAppLayout:", a1[6], a1[4]);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

- (double)blurViewIconScaleForIndex:(unint64_t)a3
{
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__SBRoutingSwitcherModifier_blurViewIconScaleForIndex___block_invoke;
  v5[3] = &unk_1E8EA8F98;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __55__SBRoutingSwitcherModifier_blurViewIconScaleForIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;

  result = objc_msgSend(a2, "blurViewIconScaleForIndex:");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
  return result;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  id v7;
  double v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  int64_t v13;
  uint64_t v14;
  double *v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a4;
  v14 = 0;
  v15 = (double *)&v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__SBRoutingSwitcherModifier_dimmingAlphaForLayoutRole_inAppLayout___block_invoke;
  v10[3] = &unk_1E8EA8F20;
  v12 = &v14;
  v13 = a3;
  v7 = v6;
  v11 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v10);
  v8 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

uint64_t __67__SBRoutingSwitcherModifier_dimmingAlphaForLayoutRole_inAppLayout___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t result;
  uint64_t v4;

  result = objc_msgSend(a2, "dimmingAlphaForLayoutRole:inAppLayout:", a1[6], a1[4]);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v4;
  return result;
}

- (double)shelfBackgroundBlurOpacity
{
  id WeakRetained;
  void *v4;
  double v5;
  _QWORD v7[6];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x2020000000;
  v11 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  objc_msgSend(WeakRetained, "homeScreenModifierForRoutingModifier:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__SBRoutingSwitcherModifier_shelfBackgroundBlurOpacity__block_invoke;
  v7[3] = &unk_1E8E9DFA0;
  v7[4] = self;
  v7[5] = &v8;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v4, v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __55__SBRoutingSwitcherModifier_shelfBackgroundBlurOpacity__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
  objc_msgSend(WeakRetained, "homeScreenModifierForRoutingModifier:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shelfBackgroundBlurOpacity");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;

}

- (CGRect)shelfBackgroundBlurFrame
{
  id WeakRetained;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _QWORD v13[6];
  uint64_t v14;
  double *v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  CGRect result;

  v14 = 0;
  v15 = (double *)&v14;
  v16 = 0x4010000000;
  v17 = &unk_1D0FA064E;
  v18 = 0u;
  v19 = 0u;
  WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  objc_msgSend(WeakRetained, "homeScreenModifierForRoutingModifier:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53__SBRoutingSwitcherModifier_shelfBackgroundBlurFrame__block_invoke;
  v13[3] = &unk_1E8E9DFA0;
  v13[4] = self;
  v13[5] = &v14;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v4, v13);

  v5 = v15[4];
  v6 = v15[5];
  v7 = v15[6];
  v8 = v15[7];
  _Block_object_dispose(&v14, 8);
  v9 = v5;
  v10 = v6;
  v11 = v7;
  v12 = v8;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

void __53__SBRoutingSwitcherModifier_shelfBackgroundBlurFrame__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
  objc_msgSend(WeakRetained, "homeScreenModifierForRoutingModifier:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shelfBackgroundBlurFrame");
  v3 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;

}

- (BOOL)switcherHitTestsAsOpaque
{
  char v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  unsigned int v9;
  NSArray *obj;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = self->_modifiers;
  v3 = 0;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v13 = 0;
        v14 = &v13;
        v15 = 0x2020000000;
        v16 = 0;
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __53__SBRoutingSwitcherModifier_switcherHitTestsAsOpaque__block_invoke;
        v12[3] = &unk_1E8E9DFA0;
        v12[4] = v8;
        v12[5] = &v13;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v12);
        v9 = *((unsigned __int8 *)v14 + 24);
        _Block_object_dispose(&v13, 8);
        if ((v5 & 1) != 0)
          v3 |= v9 > (v3 & 1u);
        else
          v3 = v9 != 0;
        v5 = 1;
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }

  return v3 & 1;
}

uint64_t __53__SBRoutingSwitcherModifier_switcherHitTestsAsOpaque__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "switcherHitTestsAsOpaque");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)resizeProgressNotificationsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  int64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__28;
  v18 = __Block_byref_object_dispose__28;
  v19 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __82__SBRoutingSwitcherModifier_resizeProgressNotificationsForLayoutRole_inAppLayout___block_invoke;
  v10[3] = &unk_1E8EA8F20;
  v12 = &v14;
  v13 = a3;
  v7 = v6;
  v11 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v10);
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __82__SBRoutingSwitcherModifier_resizeProgressNotificationsForLayoutRole_inAppLayout___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "resizeProgressNotificationsForLayoutRole:inAppLayout:", a1[6], a1[4]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)repositionProgressNotificationsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  int64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__28;
  v18 = __Block_byref_object_dispose__28;
  v19 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __86__SBRoutingSwitcherModifier_repositionProgressNotificationsForLayoutRole_inAppLayout___block_invoke;
  v10[3] = &unk_1E8EA8F20;
  v12 = &v14;
  v13 = a3;
  v7 = v6;
  v11 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v10);
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __86__SBRoutingSwitcherModifier_repositionProgressNotificationsForLayoutRole_inAppLayout___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "repositionProgressNotificationsForLayoutRole:inAppLayout:", a1[6], a1[4]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (CGRect)fullyPresentedFrameForIndex:(unint64_t)a3 frame:(CGRect)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _QWORD v12[5];
  CGRect v13;
  uint64_t v14;
  double *v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  CGRect result;

  v14 = 0;
  v15 = (double *)&v14;
  v16 = 0x4010000000;
  v17 = &unk_1D0FA064E;
  v18 = 0u;
  v19 = 0u;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__SBRoutingSwitcherModifier_fullyPresentedFrameForIndex_frame___block_invoke;
  v12[3] = &unk_1E8EA9038;
  v12[4] = &v14;
  v13 = a4;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v12);
  v4 = v15[4];
  v5 = v15[5];
  v6 = v15[6];
  v7 = v15[7];
  _Block_object_dispose(&v14, 8);
  v8 = v4;
  v9 = v5;
  v10 = v6;
  v11 = v7;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

uint64_t __63__SBRoutingSwitcherModifier_fullyPresentedFrameForIndex_frame___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = objc_msgSend(a2, "fullyPresentedFrameForIndex:frame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v4 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
  v4[4] = v5;
  v4[5] = v6;
  v4[6] = v7;
  v4[7] = v8;
  return result;
}

- (id)animatablePropertyIdentifiers
{
  void *v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSArray *obj;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = self->_modifiers;
  v3 = 0;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      v8 = v3;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v7);
        v15 = 0;
        v16 = &v15;
        v17 = 0x3032000000;
        v18 = __Block_byref_object_copy__28;
        v19 = __Block_byref_object_dispose__28;
        v20 = 0;
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __58__SBRoutingSwitcherModifier_animatablePropertyIdentifiers__block_invoke;
        v14[3] = &unk_1E8E9DFA0;
        v14[4] = v9;
        v14[5] = &v15;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v9, v14);
        v10 = (id)v16[5];
        _Block_object_dispose(&v15, 8);

        if ((v5 & 1) != 0)
        {
          _setByCombiningSets(v8, v10);
          v11 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = v10;
        }
        v3 = v11;

        ++v7;
        v5 = 1;
        v8 = v3;
      }
      while (v4 != v7);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v4);
  }

  return v3;
}

void __58__SBRoutingSwitcherModifier_animatablePropertyIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "animatablePropertyIdentifiers");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (double)modelValueForAnimatableProperty:(id)a3 currentValue:(double)a4 creating:(BOOL)a5
{
  id v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = self->_modifiers;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v23;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v10)
        objc_enumerationMutation(v8);
      v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v11);
      v16 = 0;
      v17 = &v16;
      v18 = 0x3032000000;
      v19 = __Block_byref_object_copy__28;
      v20 = __Block_byref_object_dispose__28;
      v21 = 0;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __83__SBRoutingSwitcherModifier_modelValueForAnimatableProperty_currentValue_creating___block_invoke;
      v15[3] = &unk_1E8E9DFA0;
      v15[4] = v12;
      v15[5] = &v16;
      _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v12, v15);
      v13 = objc_msgSend((id)v17[5], "containsObject:", v7);
      _Block_object_dispose(&v16, 8);

      if ((v13 & 1) != 0)
        break;
      if (v9 == ++v11)
      {
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }

  return a4;
}

void __83__SBRoutingSwitcherModifier_modelValueForAnimatableProperty_currentValue_creating___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "animatablePropertyIdentifiers");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (int64_t)updateModeForAnimatableProperty:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = self->_modifiers;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v20;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v7)
        objc_enumerationMutation(v5);
      v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v8);
      v13 = 0;
      v14 = &v13;
      v15 = 0x3032000000;
      v16 = __Block_byref_object_copy__28;
      v17 = __Block_byref_object_dispose__28;
      v18 = 0;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __61__SBRoutingSwitcherModifier_updateModeForAnimatableProperty___block_invoke;
      v12[3] = &unk_1E8E9DFA0;
      v12[4] = v9;
      v12[5] = &v13;
      _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v9, v12);
      v10 = objc_msgSend((id)v14[5], "containsObject:", v4);
      _Block_object_dispose(&v13, 8);

      if ((v10 & 1) != 0)
        break;
      if (v6 == ++v8)
      {
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

  return 1;
}

void __61__SBRoutingSwitcherModifier_updateModeForAnimatableProperty___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "animatablePropertyIdentifiers");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)settingsForAnimatableProperty:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = self->_modifiers;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v21;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v7)
        objc_enumerationMutation(v5);
      v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v8);
      v14 = 0;
      v15 = &v14;
      v16 = 0x3032000000;
      v17 = __Block_byref_object_copy__28;
      v18 = __Block_byref_object_dispose__28;
      v19 = 0;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __59__SBRoutingSwitcherModifier_settingsForAnimatableProperty___block_invoke;
      v13[3] = &unk_1E8E9DFA0;
      v13[4] = v9;
      v13[5] = &v14;
      _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v9, v13);
      v10 = objc_msgSend((id)v15[5], "containsObject:", v4);
      _Block_object_dispose(&v14, 8);

      if ((v10 & 1) != 0)
        break;
      if (v6 == ++v8)
      {
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
  return v11;
}

void __59__SBRoutingSwitcherModifier_settingsForAnimatableProperty___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "animatablePropertyIdentifiers");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)shouldUpdateAnimatableProperty:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = self->_modifiers;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v20;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v7)
        objc_enumerationMutation(v5);
      v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v8);
      v13 = 0;
      v14 = &v13;
      v15 = 0x3032000000;
      v16 = __Block_byref_object_copy__28;
      v17 = __Block_byref_object_dispose__28;
      v18 = 0;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __60__SBRoutingSwitcherModifier_shouldUpdateAnimatableProperty___block_invoke;
      v12[3] = &unk_1E8E9DFA0;
      v12[4] = v9;
      v12[5] = &v13;
      _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v9, v12);
      v10 = objc_msgSend((id)v14[5], "containsObject:", v4);
      _Block_object_dispose(&v13, 8);

      if ((v10 & 1) != 0)
        break;
      if (v6 == ++v8)
      {
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

  return 1;
}

void __60__SBRoutingSwitcherModifier_shouldUpdateAnimatableProperty___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "animatablePropertyIdentifiers");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (CGRect)frameForIconOverlayInAppLayout:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  double *v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  CGRect result;

  v4 = a3;
  v17 = 0;
  v18 = (double *)&v17;
  v19 = 0x4010000000;
  v20 = &unk_1D0FA064E;
  v21 = 0u;
  v22 = 0u;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60__SBRoutingSwitcherModifier_frameForIconOverlayInAppLayout___block_invoke;
  v14[3] = &unk_1E8EA8F48;
  v16 = &v17;
  v5 = v4;
  v15 = v5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v5, v14);
  v6 = v18[4];
  v7 = v18[5];
  v8 = v18[6];
  v9 = v18[7];

  _Block_object_dispose(&v17, 8);
  v10 = v6;
  v11 = v7;
  v12 = v8;
  v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

uint64_t __60__SBRoutingSwitcherModifier_frameForIconOverlayInAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = objc_msgSend(a2, "frameForIconOverlayInAppLayout:", *(_QWORD *)(a1 + 32));
  v4 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v4[4] = v5;
  v4[5] = v6;
  v4[6] = v7;
  v4[7] = v8;
  return result;
}

- (BOOL)canFocusableAppLayoutBeEffectivelyObscured:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__SBRoutingSwitcherModifier_canFocusableAppLayoutBeEffectivelyObscured___block_invoke;
  v7[3] = &unk_1E8EA8F48;
  v9 = &v10;
  v5 = v4;
  v8 = v5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v5, v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __72__SBRoutingSwitcherModifier_canFocusableAppLayoutBeEffectivelyObscured___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "canFocusableAppLayoutBeEffectivelyObscured:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (CGPoint)anchorPointForIndex:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  _QWORD v7[5];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  CGPoint result;

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x3010000000;
  v13 = 0;
  v11 = &unk_1D0FA064E;
  v12 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__SBRoutingSwitcherModifier_anchorPointForIndex___block_invoke;
  v7[3] = &unk_1E8EA8F98;
  v7[4] = &v8;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v7);
  v3 = v9[4];
  v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  v5 = v3;
  v6 = v4;
  result.y = v6;
  result.x = v5;
  return result;
}

uint64_t __49__SBRoutingSwitcherModifier_anchorPointForIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  result = objc_msgSend(a2, "anchorPointForIndex:");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_QWORD *)(v4 + 32) = v5;
  *(_QWORD *)(v4 + 40) = v6;
  return result;
}

- (BOOL)shouldPinLayoutRolesToSpace:(unint64_t)a3
{
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__SBRoutingSwitcherModifier_shouldPinLayoutRolesToSpace___block_invoke;
  v5[3] = &unk_1E8EA8F98;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __57__SBRoutingSwitcherModifier_shouldPinLayoutRolesToSpace___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "shouldPinLayoutRolesToSpace:");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __73__SBRoutingSwitcherModifier_shouldUseAnchorPointToPinLayoutRolesToSpace___block_invoke;
  v5[3] = &unk_1E8EA8F98;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __73__SBRoutingSwitcherModifier_shouldUseAnchorPointToPinLayoutRolesToSpace___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "shouldUseAnchorPointToPinLayoutRolesToSpace:");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)isHitTestBlockingViewVisible
{
  char v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  unsigned int v9;
  NSArray *obj;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = self->_modifiers;
  v3 = 0;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v13 = 0;
        v14 = &v13;
        v15 = 0x2020000000;
        v16 = 0;
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __57__SBRoutingSwitcherModifier_isHitTestBlockingViewVisible__block_invoke;
        v12[3] = &unk_1E8E9DFA0;
        v12[4] = v8;
        v12[5] = &v13;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v12);
        v9 = *((unsigned __int8 *)v14 + 24);
        _Block_object_dispose(&v13, 8);
        if ((v5 & 1) != 0)
          v3 |= v9 > (v3 & 1u);
        else
          v3 = v9 != 0;
        v5 = 1;
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }

  return v3 & 1;
}

uint64_t __57__SBRoutingSwitcherModifier_isHitTestBlockingViewVisible__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isHitTestBlockingViewVisible");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _QWORD v11[5];
  uint64_t v12;
  double *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  CGRect result;

  v12 = 0;
  v13 = (double *)&v12;
  v14 = 0x4010000000;
  v15 = &unk_1D0FA064E;
  v16 = 0u;
  v17 = 0u;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __43__SBRoutingSwitcherModifier_frameForIndex___block_invoke;
  v11[3] = &unk_1E8EA8F98;
  v11[4] = &v12;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v11);
  v3 = v13[4];
  v4 = v13[5];
  v5 = v13[6];
  v6 = v13[7];
  _Block_object_dispose(&v12, 8);
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

uint64_t __43__SBRoutingSwitcherModifier_frameForIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = objc_msgSend(a2, "frameForIndex:");
  v4 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
  v4[4] = v5;
  v4[5] = v6;
  v4[6] = v7;
  v4[7] = v8;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__SBRoutingSwitcherModifier_scaleForIndex___block_invoke;
  v5[3] = &unk_1E8EA8F98;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__SBRoutingSwitcherModifier_scaleForIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;

  result = objc_msgSend(a2, "scaleForIndex:");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
  return result;
}

- (double)rotationAngleForIndex:(unint64_t)a3
{
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__SBRoutingSwitcherModifier_rotationAngleForIndex___block_invoke;
  v5[3] = &unk_1E8EA8F98;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __51__SBRoutingSwitcherModifier_rotationAngleForIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;

  result = objc_msgSend(a2, "rotationAngleForIndex:");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
  return result;
}

- (BOOL)isLayoutRoleOccluded:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  unsigned int v13;
  NSArray *obj;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  int64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = self->_modifiers;
  v7 = 0;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v8)
  {
    v9 = 0;
    v10 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v20 = 0;
        v21 = &v20;
        v22 = 0x2020000000;
        v23 = 0;
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __62__SBRoutingSwitcherModifier_isLayoutRoleOccluded_inAppLayout___block_invoke;
        v16[3] = &unk_1E8E9FD80;
        v18 = &v20;
        v19 = a3;
        v16[4] = v12;
        v17 = v6;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v12, v16);
        v13 = *((unsigned __int8 *)v21 + 24);

        _Block_object_dispose(&v20, 8);
        if ((v9 & 1) != 0)
          v7 |= v13 > (v7 & 1u);
        else
          v7 = v13 != 0;
        v9 = 1;
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v8);
  }

  return v7 & 1;
}

uint64_t __62__SBRoutingSwitcherModifier_isLayoutRoleOccluded_inAppLayout___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isLayoutRoleOccluded:inAppLayout:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (CGRect)clippingFrameForIndex:(unint64_t)a3 withBounds:(CGRect)a4
{
  __int128 v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _QWORD v13[5];
  CGRect v14;
  uint64_t v15;
  double *v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  CGRect result;

  v15 = 0;
  v16 = (double *)&v15;
  v17 = 0x4010000000;
  v18 = &unk_1D0FA064E;
  v4 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v19 = *MEMORY[0x1E0C9D648];
  v20 = v4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__SBRoutingSwitcherModifier_clippingFrameForIndex_withBounds___block_invoke;
  v13[3] = &unk_1E8EA9038;
  v13[4] = &v15;
  v14 = a4;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v13);
  v5 = v16[4];
  v6 = v16[5];
  v7 = v16[6];
  v8 = v16[7];
  _Block_object_dispose(&v15, 8);
  v9 = v5;
  v10 = v6;
  v11 = v7;
  v12 = v8;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

uint64_t __62__SBRoutingSwitcherModifier_clippingFrameForIndex_withBounds___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = objc_msgSend(a2, "clippingFrameForIndex:withBounds:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v4 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
  v4[4] = v5;
  v4[5] = v6;
  v4[6] = v7;
  v4[7] = v8;
  return result;
}

- (CGRect)clippingFrameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5 withBounds:(CGRect)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v13;
  __int128 v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  int64_t v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  uint64_t v32;
  double *v33;
  uint64_t v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  CGRect result;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v13 = a4;
  v32 = 0;
  v33 = (double *)&v32;
  v34 = 0x4010000000;
  v35 = &unk_1D0FA064E;
  v14 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v36 = *MEMORY[0x1E0C9D648];
  v37 = v14;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __87__SBRoutingSwitcherModifier_clippingFrameForLayoutRole_inAppLayout_atIndex_withBounds___block_invoke;
  v24[3] = &unk_1E8EA9060;
  v26 = &v32;
  v27 = a3;
  v15 = v13;
  v25 = v15;
  v28 = x;
  v29 = y;
  v30 = width;
  v31 = height;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a5, v24);
  v16 = v33[4];
  v17 = v33[5];
  v18 = v33[6];
  v19 = v33[7];

  _Block_object_dispose(&v32, 8);
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

uint64_t __87__SBRoutingSwitcherModifier_clippingFrameForLayoutRole_inAppLayout_atIndex_withBounds___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  result = objc_msgSend(a2, "clippingFrameForLayoutRole:inAppLayout:atIndex:withBounds:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), a3, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v5 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v5[4] = v6;
  v5[5] = v7;
  v5[6] = v8;
  v5[7] = v9;
  return result;
}

- (BOOL)clipsToBoundsAtIndex:(unint64_t)a3
{
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__SBRoutingSwitcherModifier_clipsToBoundsAtIndex___block_invoke;
  v5[3] = &unk_1E8EA8F98;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__SBRoutingSwitcherModifier_clipsToBoundsAtIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "clipsToBoundsAtIndex:");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (id)preferredAppLayoutToReuseAccessoryForAppLayout:(id)a3 fromAppLayouts:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__28;
  v20 = __Block_byref_object_dispose__28;
  v21 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __91__SBRoutingSwitcherModifier_preferredAppLayoutToReuseAccessoryForAppLayout_fromAppLayouts___block_invoke;
  v12[3] = &unk_1E8EA9088;
  v15 = &v16;
  v8 = v6;
  v13 = v8;
  v9 = v7;
  v14 = v9;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v8, v12);
  v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __91__SBRoutingSwitcherModifier_preferredAppLayoutToReuseAccessoryForAppLayout_fromAppLayouts___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "preferredAppLayoutToReuseAccessoryForAppLayout:fromAppLayouts:", a1[4], a1[5]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)systemApertureTransitioningAppLayouts
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (BOOL)systemApertureRequiresHeavyShadowForTransition
{
  return 0;
}

- (CGPoint)expandedSourcePositionForSystemApertureTransition
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGRect)rootContentViewMaskRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D628];
  v3 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (double)rootContentViewBlurRadius
{
  return 0.0;
}

- (id)meshTransformForIndex:(unint64_t)a3
{
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__28;
  v10 = __Block_byref_object_dispose__28;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__SBRoutingSwitcherModifier_meshTransformForIndex___block_invoke;
  v5[3] = &unk_1E8EA8F98;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __51__SBRoutingSwitcherModifier_meshTransformForIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "meshTransformForIndex:");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)identityMeshTransformForIndex:(unint64_t)a3
{
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__28;
  v10 = __Block_byref_object_dispose__28;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__SBRoutingSwitcherModifier_identityMeshTransformForIndex___block_invoke;
  v5[3] = &unk_1E8EA8F98;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __59__SBRoutingSwitcherModifier_identityMeshTransformForIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "identityMeshTransformForIndex:");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (BOOL)isDropletEffectRequiredBehindAppLayout:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__SBRoutingSwitcherModifier_isDropletEffectRequiredBehindAppLayout___block_invoke;
  v7[3] = &unk_1E8EA8F48;
  v9 = &v10;
  v5 = v4;
  v8 = v5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v5, v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __68__SBRoutingSwitcherModifier_isDropletEffectRequiredBehindAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isDropletEffectRequiredBehindAppLayout:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)resizeGrabberLayoutAttributesForAppLayout:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__28;
  v15 = __Block_byref_object_dispose__28;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__SBRoutingSwitcherModifier_resizeGrabberLayoutAttributesForAppLayout___block_invoke;
  v8[3] = &unk_1E8EA8F48;
  v10 = &v11;
  v5 = v4;
  v9 = v5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v5, v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __71__SBRoutingSwitcherModifier_resizeGrabberLayoutAttributesForAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "resizeGrabberLayoutAttributesForAppLayout:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (CGRect)adjustedSpaceAccessoryViewFrame:(CGRect)a3 forAppLayout:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  uint64_t v26;
  double *v27;
  uint64_t v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v26 = 0;
  v27 = (double *)&v26;
  v28 = 0x4010000000;
  v29 = &unk_1D0FA064E;
  v30 = 0u;
  v31 = 0u;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __74__SBRoutingSwitcherModifier_adjustedSpaceAccessoryViewFrame_forAppLayout___block_invoke;
  v19[3] = &unk_1E8EA90B0;
  v21 = &v26;
  v22 = x;
  v23 = y;
  v24 = width;
  v25 = height;
  v10 = v9;
  v20 = v10;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v10, v19);
  v11 = v27[4];
  v12 = v27[5];
  v13 = v27[6];
  v14 = v27[7];

  _Block_object_dispose(&v26, 8);
  v15 = v11;
  v16 = v12;
  v17 = v13;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

uint64_t __74__SBRoutingSwitcherModifier_adjustedSpaceAccessoryViewFrame_forAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = objc_msgSend(a2, "adjustedSpaceAccessoryViewFrame:forAppLayout:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  v4 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v4[4] = v5;
  v4[5] = v6;
  v4[6] = v7;
  v4[7] = v8;
  return result;
}

- (CGPoint)adjustedSpaceAccessoryViewAnchorPoint:(CGPoint)a3 forAppLayout:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  CGFloat v16;
  CGFloat v17;
  uint64_t v18;
  double *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v18 = 0;
  v19 = (double *)&v18;
  v20 = 0x3010000000;
  v22 = 0;
  v23 = 0;
  v21 = &unk_1D0FA064E;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __80__SBRoutingSwitcherModifier_adjustedSpaceAccessoryViewAnchorPoint_forAppLayout___block_invoke;
  v13[3] = &unk_1E8EA8FC0;
  v15 = &v18;
  v16 = x;
  v17 = y;
  v8 = v7;
  v14 = v8;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v8, v13);
  v9 = v19[4];
  v10 = v19[5];

  _Block_object_dispose(&v18, 8);
  v11 = v9;
  v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

uint64_t __80__SBRoutingSwitcherModifier_adjustedSpaceAccessoryViewAnchorPoint_forAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  result = objc_msgSend(a2, "adjustedSpaceAccessoryViewAnchorPoint:forAppLayout:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v4 + 32) = v5;
  *(_QWORD *)(v4 + 40) = v6;
  return result;
}

- (double)adjustedSpaceAccessoryViewScale:(double)a3 forAppLayout:(id)a4
{
  id v6;
  id v7;
  double v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  double v13;
  uint64_t v14;
  double *v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a4;
  v14 = 0;
  v15 = (double *)&v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__SBRoutingSwitcherModifier_adjustedSpaceAccessoryViewScale_forAppLayout___block_invoke;
  v10[3] = &unk_1E8EA8F20;
  v12 = &v14;
  v13 = a3;
  v7 = v6;
  v11 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v10);
  v8 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

uint64_t __74__SBRoutingSwitcherModifier_adjustedSpaceAccessoryViewScale_forAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;

  result = objc_msgSend(a2, "adjustedSpaceAccessoryViewScale:forAppLayout:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;
  return result;
}

- (id)visibleAppLayouts
{
  void *v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSArray *obj;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = self->_modifiers;
  v3 = 0;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      v8 = v3;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v7);
        v15 = 0;
        v16 = &v15;
        v17 = 0x3032000000;
        v18 = __Block_byref_object_copy__28;
        v19 = __Block_byref_object_dispose__28;
        v20 = 0;
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __46__SBRoutingSwitcherModifier_visibleAppLayouts__block_invoke;
        v14[3] = &unk_1E8E9DFA0;
        v14[4] = v9;
        v14[5] = &v15;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v9, v14);
        v10 = (id)v16[5];
        _Block_object_dispose(&v15, 8);

        if ((v5 & 1) != 0)
        {
          _setByCombiningSets(v8, v10);
          v11 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = v10;
        }
        v3 = v11;

        ++v7;
        v5 = 1;
        v8 = v3;
      }
      while (v4 != v7);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v4);
  }

  return v3;
}

void __46__SBRoutingSwitcherModifier_visibleAppLayouts__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "visibleAppLayouts");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)isHomeAffordanceSupportedForAppLayout:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__SBRoutingSwitcherModifier_isHomeAffordanceSupportedForAppLayout___block_invoke;
  v7[3] = &unk_1E8EA8F48;
  v9 = &v10;
  v5 = v4;
  v8 = v5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v5, v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __67__SBRoutingSwitcherModifier_isHomeAffordanceSupportedForAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isHomeAffordanceSupportedForAppLayout:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)visibleHomeAffordanceLayoutElements
{
  void *v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSArray *obj;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = self->_modifiers;
  v3 = 0;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      v8 = v3;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v7);
        v15 = 0;
        v16 = &v15;
        v17 = 0x3032000000;
        v18 = __Block_byref_object_copy__28;
        v19 = __Block_byref_object_dispose__28;
        v20 = 0;
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __64__SBRoutingSwitcherModifier_visibleHomeAffordanceLayoutElements__block_invoke;
        v14[3] = &unk_1E8E9DFA0;
        v14[4] = v9;
        v14[5] = &v15;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v9, v14);
        v10 = (id)v16[5];
        _Block_object_dispose(&v15, 8);

        if ((v5 & 1) != 0)
        {
          _setByCombiningSets(v8, v10);
          v11 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = v10;
        }
        v3 = v11;

        ++v7;
        v5 = 1;
        v8 = v3;
      }
      while (v4 != v7);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v4);
  }

  return v3;
}

void __64__SBRoutingSwitcherModifier_visibleHomeAffordanceLayoutElements__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "visibleHomeAffordanceLayoutElements");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)isResizeGrabberVisibleForAppLayout:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__SBRoutingSwitcherModifier_isResizeGrabberVisibleForAppLayout___block_invoke;
  v7[3] = &unk_1E8EA8F48;
  v9 = &v10;
  v5 = v4;
  v8 = v5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v5, v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __64__SBRoutingSwitcherModifier_isResizeGrabberVisibleForAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isResizeGrabberVisibleForAppLayout:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)activeCornersForTouchResizeForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  int64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __82__SBRoutingSwitcherModifier_activeCornersForTouchResizeForLayoutRole_inAppLayout___block_invoke;
  v10[3] = &unk_1E8EA8F20;
  v12 = &v14;
  v13 = a3;
  v7 = v6;
  v11 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v10);
  v8 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

uint64_t __82__SBRoutingSwitcherModifier_activeCornersForTouchResizeForLayoutRole_inAppLayout___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "activeCornersForTouchResizeForLayoutRole:inAppLayout:", a1[6], a1[4]);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

- (BOOL)isItemResizingAllowedForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  int64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__SBRoutingSwitcherModifier_isItemResizingAllowedForLayoutRole_inAppLayout___block_invoke;
  v9[3] = &unk_1E8EA8F20;
  v11 = &v13;
  v12 = a3;
  v7 = v6;
  v10 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v9);
  LOBYTE(self) = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)self;
}

uint64_t __76__SBRoutingSwitcherModifier_isItemResizingAllowedForLayoutRole_inAppLayout___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isItemResizingAllowedForLayoutRole:inAppLayout:", a1[6], a1[4]);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

- (id)visibleShelves
{
  void *v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  NSArray *obj;
  uint64_t v15;
  _QWORD v16[6];
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = self->_modifiers;
  v3 = 0;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v4)
  {
    v5 = 0;
    v15 = *(_QWORD *)v25;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      v7 = 0;
      v8 = v3;
      do
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v7);
        v18 = 0;
        v19 = &v18;
        v20 = 0x3032000000;
        v21 = __Block_byref_object_copy__28;
        v22 = __Block_byref_object_dispose__28;
        v23 = 0;
        v17[0] = v6;
        v17[1] = 3221225472;
        v17[2] = __43__SBRoutingSwitcherModifier_visibleShelves__block_invoke;
        v17[3] = &unk_1E8E9DFA0;
        v17[4] = v9;
        v17[5] = &v18;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v9, v17);
        v10 = (id)v19[5];
        _Block_object_dispose(&v18, 8);

        v16[0] = v6;
        v16[1] = 3221225472;
        v16[2] = __43__SBRoutingSwitcherModifier_visibleShelves__block_invoke_2;
        v16[3] = &unk_1E8EA90D8;
        v16[4] = self;
        v16[5] = v9;
        objc_msgSend(v10, "bs_map:", v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if ((v5 & 1) != 0)
        {
          _setByCombiningSets(v8, v11);
          v12 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v12 = v11;
        }
        v3 = v12;

        ++v7;
        v5 = 1;
        v8 = v3;
      }
      while (v4 != v7);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v4);
  }

  return v3;
}

void __43__SBRoutingSwitcherModifier_visibleShelves__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "visibleShelves");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __43__SBRoutingSwitcherModifier_visibleShelves__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_adjustedShelfForShelf:fromModifier:", a2, *(_QWORD *)(a1 + 40));
}

- (SBSwitcherShelfPresentationAttributes)presentationAttributesForShelf:(SEL)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t *v11;
  __int128 v12;
  SBSwitcherShelfPresentationAttributes *result;
  NSArray *obj;
  _QWORD v16[6];
  id v17;
  uint64_t *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void *v26;
  _OWORD v27[3];
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x5810000000;
  v26 = &unk_1D0FA064E;
  memset(v27, 0, sizeof(v27));
  v28 = 0;
  SBSwitcherShelfPresentationAttributesMake(0, 0, 0, (uint64_t)v27, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = self->_modifiers;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v20;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v9);
        v16[0] = v8;
        v16[1] = 3221225472;
        v16[2] = __60__SBRoutingSwitcherModifier_presentationAttributesForShelf___block_invoke;
        v16[3] = &unk_1E8EA4E50;
        v16[4] = v10;
        v16[5] = self;
        v17 = v5;
        v18 = &v23;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v10, v16);

        ++v9;
      }
      while (v6 != v9);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
    }
    while (v6);
  }

  v11 = v24;
  v12 = *((_OWORD *)v24 + 3);
  *(_OWORD *)&retstr->var0 = *((_OWORD *)v24 + 2);
  *(_OWORD *)&retstr->var1.origin.y = v12;
  *(_OWORD *)&retstr->var1.size.height = *((_OWORD *)v11 + 4);
  retstr->var3 = v11[10];
  _Block_object_dispose(&v23, 8);

  return result;
}

void __60__SBRoutingSwitcherModifier_presentationAttributesForShelf___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  _QWORD v14[4];
  int8x16_t v15;

  objc_msgSend(*(id *)(a1 + 32), "visibleShelves");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60__SBRoutingSwitcherModifier_presentationAttributesForShelf___block_invoke_2;
  v14[3] = &unk_1E8EA9100;
  v15 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  objc_msgSend(v2, "bs_map:", v14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 48)))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_adjustedShelfForShelf:forModifier:", *(_QWORD *)(a1 + 48), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentationAttributesForShelf:", v5);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v7 = v13;
    v8 = v12;
    v9 = v11;
    *(_OWORD *)(v6 + 32) = v10;
    *(_OWORD *)(v6 + 48) = v9;
    *(_OWORD *)(v6 + 64) = v8;
    *(_QWORD *)(v6 + 80) = v7;

  }
}

uint64_t __60__SBRoutingSwitcherModifier_presentationAttributesForShelf___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_adjustedShelfForShelf:fromModifier:", a2, *(_QWORD *)(a1 + 40));
}

- (CGRect)frameForShelf:(id)a3
{
  id v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  NSArray *obj;
  _QWORD v20[6];
  id v21;
  uint64_t *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  double *v28;
  uint64_t v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;
  CGRect result;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27 = 0;
  v28 = (double *)&v27;
  v29 = 0x4010000000;
  v30 = &unk_1D0FA064E;
  v5 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v31 = *MEMORY[0x1E0C9D648];
  v32 = v5;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = self->_modifiers;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v24;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v9);
        v20[0] = v8;
        v20[1] = 3221225472;
        v20[2] = __43__SBRoutingSwitcherModifier_frameForShelf___block_invoke;
        v20[3] = &unk_1E8EA4E50;
        v20[4] = v10;
        v20[5] = self;
        v21 = v4;
        v22 = &v27;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v10, v20);

        ++v9;
      }
      while (v6 != v9);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    }
    while (v6);
  }

  v11 = v28[4];
  v12 = v28[5];
  v13 = v28[6];
  v14 = v28[7];
  _Block_object_dispose(&v27, 8);

  v15 = v11;
  v16 = v12;
  v17 = v13;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

void __43__SBRoutingSwitcherModifier_frameForShelf___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  int8x16_t v12;

  objc_msgSend(*(id *)(a1 + 32), "visibleShelves");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __43__SBRoutingSwitcherModifier_frameForShelf___block_invoke_2;
  v11[3] = &unk_1E8EA9100;
  v12 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  objc_msgSend(v2, "bs_map:", v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 48)))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_adjustedShelfForShelf:forModifier:", *(_QWORD *)(a1 + 48), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frameForShelf:", v5);
    v6 = *(_QWORD **)(*(_QWORD *)(a1 + 56) + 8);
    v6[4] = v7;
    v6[5] = v8;
    v6[6] = v9;
    v6[7] = v10;

  }
}

uint64_t __43__SBRoutingSwitcherModifier_frameForShelf___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_adjustedShelfForShelf:fromModifier:", a2, *(_QWORD *)(a1 + 40));
}

- (id)focusedAppLayoutForShelf:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSArray *obj;
  _QWORD v13[6];
  id v14;
  uint64_t *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__28;
  v24 = __Block_byref_object_dispose__28;
  v25 = 0;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = self->_modifiers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v17;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v8);
        v13[0] = v7;
        v13[1] = 3221225472;
        v13[2] = __54__SBRoutingSwitcherModifier_focusedAppLayoutForShelf___block_invoke;
        v13[3] = &unk_1E8EA4E50;
        v13[4] = v9;
        v13[5] = self;
        v14 = v4;
        v15 = &v20;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v9, v13);

        ++v8;
      }
      while (v5 != v8);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    }
    while (v5);
  }

  v10 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v10;
}

void __54__SBRoutingSwitcherModifier_focusedAppLayoutForShelf___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  int8x16_t v10;

  objc_msgSend(*(id *)(a1 + 32), "visibleShelves");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__SBRoutingSwitcherModifier_focusedAppLayoutForShelf___block_invoke_2;
  v9[3] = &unk_1E8EA9100;
  v10 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  objc_msgSend(v2, "bs_map:", v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 48)))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_adjustedShelfForShelf:forModifier:", *(_QWORD *)(a1 + 48), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "focusedAppLayoutForShelf:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

uint64_t __54__SBRoutingSwitcherModifier_focusedAppLayoutForShelf___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_adjustedShelfForShelf:fromModifier:", a2, *(_QWORD *)(a1 + 40));
}

- (id)ignoredDisplayItemsForShelf:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSArray *obj;
  _QWORD v13[6];
  id v14;
  uint64_t *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__28;
  v24 = __Block_byref_object_dispose__28;
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = self->_modifiers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v17;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v8);
        v13[0] = v7;
        v13[1] = 3221225472;
        v13[2] = __57__SBRoutingSwitcherModifier_ignoredDisplayItemsForShelf___block_invoke;
        v13[3] = &unk_1E8EA4E50;
        v13[4] = v9;
        v13[5] = self;
        v14 = v4;
        v15 = &v20;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v9, v13);

        ++v8;
      }
      while (v5 != v8);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    }
    while (v5);
  }

  v10 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v10;
}

void __57__SBRoutingSwitcherModifier_ignoredDisplayItemsForShelf___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  int8x16_t v10;

  objc_msgSend(*(id *)(a1 + 32), "visibleShelves");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__SBRoutingSwitcherModifier_ignoredDisplayItemsForShelf___block_invoke_2;
  v9[3] = &unk_1E8EA9100;
  v10 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  objc_msgSend(v2, "bs_map:", v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 48)))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_adjustedShelfForShelf:forModifier:", *(_QWORD *)(a1 + 48), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ignoredDisplayItemsForShelf:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

uint64_t __57__SBRoutingSwitcherModifier_ignoredDisplayItemsForShelf___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_adjustedShelfForShelf:fromModifier:", a2, *(_QWORD *)(a1 + 40));
}

- (id)containerLeafAppLayoutForShelf:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSArray *obj;
  _QWORD v13[6];
  id v14;
  uint64_t *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__28;
  v24 = __Block_byref_object_dispose__28;
  v25 = 0;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = self->_modifiers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v17;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v8);
        v13[0] = v7;
        v13[1] = 3221225472;
        v13[2] = __60__SBRoutingSwitcherModifier_containerLeafAppLayoutForShelf___block_invoke;
        v13[3] = &unk_1E8EA4E50;
        v13[4] = v9;
        v13[5] = self;
        v14 = v4;
        v15 = &v20;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v9, v13);

        ++v8;
      }
      while (v5 != v8);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    }
    while (v5);
  }

  v10 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v10;
}

void __60__SBRoutingSwitcherModifier_containerLeafAppLayoutForShelf___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  int8x16_t v10;

  objc_msgSend(*(id *)(a1 + 32), "visibleShelves");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__SBRoutingSwitcherModifier_containerLeafAppLayoutForShelf___block_invoke_2;
  v9[3] = &unk_1E8EA9100;
  v10 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  objc_msgSend(v2, "bs_map:", v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 48)))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_adjustedShelfForShelf:forModifier:", *(_QWORD *)(a1 + 48), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "containerLeafAppLayoutForShelf:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

uint64_t __60__SBRoutingSwitcherModifier_containerLeafAppLayoutForShelf___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_adjustedShelfForShelf:fromModifier:", a2, *(_QWORD *)(a1 + 40));
}

- (id)hiddenAppLayoutsInShelf:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSArray *obj;
  _QWORD v13[6];
  id v14;
  uint64_t *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__28;
  v24 = __Block_byref_object_dispose__28;
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = self->_modifiers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v17;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v8);
        v13[0] = v7;
        v13[1] = 3221225472;
        v13[2] = __53__SBRoutingSwitcherModifier_hiddenAppLayoutsInShelf___block_invoke;
        v13[3] = &unk_1E8EA4E50;
        v13[4] = v9;
        v13[5] = self;
        v14 = v4;
        v15 = &v20;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v9, v13);

        ++v8;
      }
      while (v5 != v8);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    }
    while (v5);
  }

  v10 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v10;
}

void __53__SBRoutingSwitcherModifier_hiddenAppLayoutsInShelf___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  int8x16_t v10;

  objc_msgSend(*(id *)(a1 + 32), "visibleShelves");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__SBRoutingSwitcherModifier_hiddenAppLayoutsInShelf___block_invoke_2;
  v9[3] = &unk_1E8EA9100;
  v10 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  objc_msgSend(v2, "bs_map:", v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 48)))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_adjustedShelfForShelf:forModifier:", *(_QWORD *)(a1 + 48), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hiddenAppLayoutsInShelf:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

uint64_t __53__SBRoutingSwitcherModifier_hiddenAppLayoutsInShelf___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_adjustedShelfForShelf:fromModifier:", a2, *(_QWORD *)(a1 + 40));
}

- (id)homeAffordanceLayoutElementToPortalIntoShelf:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSArray *obj;
  _QWORD v13[6];
  id v14;
  uint64_t *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__28;
  v24 = __Block_byref_object_dispose__28;
  v25 = 0;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = self->_modifiers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v17;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v8);
        v13[0] = v7;
        v13[1] = 3221225472;
        v13[2] = __74__SBRoutingSwitcherModifier_homeAffordanceLayoutElementToPortalIntoShelf___block_invoke;
        v13[3] = &unk_1E8EA4E50;
        v13[4] = v9;
        v13[5] = self;
        v14 = v4;
        v15 = &v20;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v9, v13);

        ++v8;
      }
      while (v5 != v8);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    }
    while (v5);
  }

  v10 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v10;
}

void __74__SBRoutingSwitcherModifier_homeAffordanceLayoutElementToPortalIntoShelf___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  int8x16_t v10;

  objc_msgSend(*(id *)(a1 + 32), "visibleShelves");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__SBRoutingSwitcherModifier_homeAffordanceLayoutElementToPortalIntoShelf___block_invoke_2;
  v9[3] = &unk_1E8EA9100;
  v10 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  objc_msgSend(v2, "bs_map:", v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 48)))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_adjustedShelfForShelf:forModifier:", *(_QWORD *)(a1 + 48), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeAffordanceLayoutElementToPortalIntoShelf:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

uint64_t __74__SBRoutingSwitcherModifier_homeAffordanceLayoutElementToPortalIntoShelf___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_adjustedShelfForShelf:fromModifier:", a2, *(_QWORD *)(a1 + 40));
}

- (unint64_t)hiddenContainerStatusBarParts
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  _QWORD v11[6];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_modifiers;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v13;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
        v11[0] = v6;
        v11[1] = 3221225472;
        v11[2] = __58__SBRoutingSwitcherModifier_hiddenContainerStatusBarParts__block_invoke;
        v11[3] = &unk_1E8E9DFA0;
        v11[4] = v8;
        v11[5] = &v16;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v11);
        ++v7;
      }
      while (v4 != v7);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
    }
    while (v4);
  }

  v9 = v17[3];
  _Block_object_dispose(&v16, 8);
  return v9;
}

uint64_t __58__SBRoutingSwitcherModifier_hiddenContainerStatusBarParts__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "hiddenContainerStatusBarParts");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= result;
  return result;
}

- (unint64_t)hiddenContentStatusBarPartsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  int64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __82__SBRoutingSwitcherModifier_hiddenContentStatusBarPartsForLayoutRole_inAppLayout___block_invoke;
  v10[3] = &unk_1E8EA8F20;
  v12 = &v14;
  v13 = a3;
  v7 = v6;
  v11 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v10);
  v8 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

uint64_t __82__SBRoutingSwitcherModifier_hiddenContentStatusBarPartsForLayoutRole_inAppLayout___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "hiddenContentStatusBarPartsForLayoutRole:inAppLayout:", a1[6], a1[4]);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

- (id)_adjustedShelfForShelf:(id)a3 forModifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id WeakRetained;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  v10 = v8;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "adjustedShelfForShelf:forModifier:", v8, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)_adjustedShelfForShelf:(id)a3 fromModifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id WeakRetained;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  v10 = v8;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "adjustedShelfForShelf:fromModifier:", v8, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (double)contentViewScale
{
  id WeakRetained;
  void *v4;
  double v5;
  _QWORD v7[6];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x2020000000;
  v11 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  objc_msgSend(WeakRetained, "homeScreenModifierForRoutingModifier:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__SBRoutingSwitcherModifier_contentViewScale__block_invoke;
  v7[3] = &unk_1E8E9DFA0;
  v7[4] = self;
  v7[5] = &v8;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v4, v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __45__SBRoutingSwitcherModifier_contentViewScale__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
  objc_msgSend(WeakRetained, "homeScreenModifierForRoutingModifier:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentViewScale");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;

}

- (BOOL)clipsToUnobscuredMarginAtIndex:(unint64_t)a3
{
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__SBRoutingSwitcherModifier_clipsToUnobscuredMarginAtIndex___block_invoke;
  v5[3] = &unk_1E8EA8F98;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __60__SBRoutingSwitcherModifier_clipsToUnobscuredMarginAtIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "clipsToUnobscuredMarginAtIndex:");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (double)visibleMarginForItemContainerAtIndex:(unint64_t)a3
{
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__SBRoutingSwitcherModifier_visibleMarginForItemContainerAtIndex___block_invoke;
  v5[3] = &unk_1E8EA8F98;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __66__SBRoutingSwitcherModifier_visibleMarginForItemContainerAtIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;

  result = objc_msgSend(a2, "visibleMarginForItemContainerAtIndex:");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
  return result;
}

- (double)wallpaperOverlayAlphaForIndex:(unint64_t)a3
{
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__SBRoutingSwitcherModifier_wallpaperOverlayAlphaForIndex___block_invoke;
  v5[3] = &unk_1E8EA8F98;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __59__SBRoutingSwitcherModifier_wallpaperOverlayAlphaForIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;

  result = objc_msgSend(a2, "wallpaperOverlayAlphaForIndex:");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
  return result;
}

- (double)lighteningAlphaForIndex:(unint64_t)a3
{
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__SBRoutingSwitcherModifier_lighteningAlphaForIndex___block_invoke;
  v5[3] = &unk_1E8EA8F98;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __53__SBRoutingSwitcherModifier_lighteningAlphaForIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;

  result = objc_msgSend(a2, "lighteningAlphaForIndex:");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
  return result;
}

- (int64_t)headerStyleForIndex:(unint64_t)a3
{
  int64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__SBRoutingSwitcherModifier_headerStyleForIndex___block_invoke;
  v5[3] = &unk_1E8EA8F98;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __49__SBRoutingSwitcherModifier_headerStyleForIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "headerStyleForIndex:");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (double)titleOpacityForIndex:(unint64_t)a3
{
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__SBRoutingSwitcherModifier_titleOpacityForIndex___block_invoke;
  v5[3] = &unk_1E8EA8F98;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__SBRoutingSwitcherModifier_titleOpacityForIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;

  result = objc_msgSend(a2, "titleOpacityForIndex:");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
  return result;
}

- (double)titleAndIconOpacityForIndex:(unint64_t)a3
{
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__SBRoutingSwitcherModifier_titleAndIconOpacityForIndex___block_invoke;
  v5[3] = &unk_1E8EA8F98;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __57__SBRoutingSwitcherModifier_titleAndIconOpacityForIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;

  result = objc_msgSend(a2, "titleAndIconOpacityForIndex:");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
  return result;
}

- (double)shadowOffsetForIndex:(unint64_t)a3
{
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__SBRoutingSwitcherModifier_shadowOffsetForIndex___block_invoke;
  v5[3] = &unk_1E8EA8F98;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__SBRoutingSwitcherModifier_shadowOffsetForIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;

  result = objc_msgSend(a2, "shadowOffsetForIndex:");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
  return result;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _QWORD v11[5];
  uint64_t v12;
  double *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  UIRectCornerRadii result;

  v12 = 0;
  v13 = (double *)&v12;
  v14 = 0x4010000000;
  v15 = &unk_1D0FA064E;
  v16 = 0u;
  v17 = 0u;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__SBRoutingSwitcherModifier_cornerRadiiForIndex___block_invoke;
  v11[3] = &unk_1E8EA8F98;
  v11[4] = &v12;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v11);
  v3 = v13[4];
  v4 = v13[5];
  v5 = v13[6];
  v6 = v13[7];
  _Block_object_dispose(&v12, 8);
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  result.topRight = v10;
  result.bottomRight = v9;
  result.bottomLeft = v8;
  result.topLeft = v7;
  return result;
}

uint64_t __49__SBRoutingSwitcherModifier_cornerRadiiForIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = objc_msgSend(a2, "cornerRadiiForIndex:");
  v4 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
  v4[4] = v5;
  v4[5] = v6;
  v4[6] = v7;
  v4[7] = v8;
  return result;
}

- (BOOL)shouldScaleOverlayToFillBoundsAtIndex:(unint64_t)a3
{
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__SBRoutingSwitcherModifier_shouldScaleOverlayToFillBoundsAtIndex___block_invoke;
  v5[3] = &unk_1E8EA8F98;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __67__SBRoutingSwitcherModifier_shouldScaleOverlayToFillBoundsAtIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "shouldScaleOverlayToFillBoundsAtIndex:");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)shouldScaleContentToFillBoundsAtIndex:(unint64_t)a3
{
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__SBRoutingSwitcherModifier_shouldScaleContentToFillBoundsAtIndex___block_invoke;
  v5[3] = &unk_1E8EA8F98;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __67__SBRoutingSwitcherModifier_shouldScaleContentToFillBoundsAtIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "shouldScaleContentToFillBoundsAtIndex:");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)shouldUseBrightMaterialForIndex:(unint64_t)a3
{
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__SBRoutingSwitcherModifier_shouldUseBrightMaterialForIndex___block_invoke;
  v5[3] = &unk_1E8EA8F98;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __61__SBRoutingSwitcherModifier_shouldUseBrightMaterialForIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "shouldUseBrightMaterialForIndex:");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)shouldUseBackgroundWallpaperTreatmentForIndex:(unint64_t)a3
{
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__SBRoutingSwitcherModifier_shouldUseBackgroundWallpaperTreatmentForIndex___block_invoke;
  v5[3] = &unk_1E8EA8F98;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __75__SBRoutingSwitcherModifier_shouldUseBackgroundWallpaperTreatmentForIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "shouldUseBackgroundWallpaperTreatmentForIndex:");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)shouldShowBackdropViewAtIndex:(unint64_t)a3
{
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__SBRoutingSwitcherModifier_shouldShowBackdropViewAtIndex___block_invoke;
  v5[3] = &unk_1E8EA8F98;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __59__SBRoutingSwitcherModifier_shouldShowBackdropViewAtIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "shouldShowBackdropViewAtIndex:");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)shouldUseWallpaperGradientTreatment
{
  char v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  unsigned int v9;
  NSArray *obj;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = self->_modifiers;
  v3 = 0;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v13 = 0;
        v14 = &v13;
        v15 = 0x2020000000;
        v16 = 0;
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __64__SBRoutingSwitcherModifier_shouldUseWallpaperGradientTreatment__block_invoke;
        v12[3] = &unk_1E8E9DFA0;
        v12[4] = v8;
        v12[5] = &v13;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v12);
        v9 = *((unsigned __int8 *)v14 + 24);
        _Block_object_dispose(&v13, 8);
        if ((v5 & 1) != 0)
          v3 |= v9 > (v3 & 1u);
        else
          v3 = v9 != 0;
        v5 = 1;
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }

  return v3 & 1;
}

uint64_t __64__SBRoutingSwitcherModifier_shouldUseWallpaperGradientTreatment__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "shouldUseWallpaperGradientTreatment");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (SBSwitcherWallpaperGradientAttributes)wallpaperGradientAttributesForIndex:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  _QWORD v7[5];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  SBSwitcherWallpaperGradientAttributes result;

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x3010000000;
  v13 = 0;
  v11 = &unk_1D0FA064E;
  v12 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__SBRoutingSwitcherModifier_wallpaperGradientAttributesForIndex___block_invoke;
  v7[3] = &unk_1E8EA8F98;
  v7[4] = &v8;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v7);
  v3 = v9[4];
  v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  v5 = v3;
  v6 = v4;
  result.trailingAlpha = v6;
  result.leadingAlpha = v5;
  return result;
}

uint64_t __65__SBRoutingSwitcherModifier_wallpaperGradientAttributesForIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  result = objc_msgSend(a2, "wallpaperGradientAttributesForIndex:");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_QWORD *)(v4 + 32) = v5;
  *(_QWORD *)(v4 + 40) = v6;
  return result;
}

- (double)homeScreenAlpha
{
  id WeakRetained;
  void *v4;
  double v5;
  _QWORD v7[6];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x2020000000;
  v11 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  objc_msgSend(WeakRetained, "homeScreenModifierForRoutingModifier:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__SBRoutingSwitcherModifier_homeScreenAlpha__block_invoke;
  v7[3] = &unk_1E8E9DFA0;
  v7[4] = self;
  v7[5] = &v8;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v4, v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __44__SBRoutingSwitcherModifier_homeScreenAlpha__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
  objc_msgSend(WeakRetained, "homeScreenModifierForRoutingModifier:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeScreenAlpha");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;

}

- (double)homeScreenScale
{
  id WeakRetained;
  void *v4;
  double v5;
  _QWORD v7[6];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x2020000000;
  v11 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  objc_msgSend(WeakRetained, "homeScreenModifierForRoutingModifier:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__SBRoutingSwitcherModifier_homeScreenScale__block_invoke;
  v7[3] = &unk_1E8E9DFA0;
  v7[4] = self;
  v7[5] = &v8;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v4, v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __44__SBRoutingSwitcherModifier_homeScreenScale__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
  objc_msgSend(WeakRetained, "homeScreenModifierForRoutingModifier:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeScreenScale");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;

}

- (double)wallpaperScale
{
  id WeakRetained;
  void *v4;
  double v5;
  _QWORD v7[6];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x2020000000;
  v11 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  objc_msgSend(WeakRetained, "homeScreenModifierForRoutingModifier:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__SBRoutingSwitcherModifier_wallpaperScale__block_invoke;
  v7[3] = &unk_1E8E9DFA0;
  v7[4] = self;
  v7[5] = &v8;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v4, v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __43__SBRoutingSwitcherModifier_wallpaperScale__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
  objc_msgSend(WeakRetained, "homeScreenModifierForRoutingModifier:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wallpaperScale");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;

}

- (double)homeScreenDimmingAlpha
{
  id WeakRetained;
  void *v4;
  double v5;
  _QWORD v7[6];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x2020000000;
  v11 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  objc_msgSend(WeakRetained, "homeScreenModifierForRoutingModifier:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__SBRoutingSwitcherModifier_homeScreenDimmingAlpha__block_invoke;
  v7[3] = &unk_1E8E9DFA0;
  v7[4] = self;
  v7[5] = &v8;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v4, v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __51__SBRoutingSwitcherModifier_homeScreenDimmingAlpha__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
  objc_msgSend(WeakRetained, "homeScreenModifierForRoutingModifier:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeScreenDimmingAlpha");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;

}

- (int64_t)homeScreenBackdropBlurType
{
  id WeakRetained;
  void *v4;
  int64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  objc_msgSend(WeakRetained, "homeScreenModifierForRoutingModifier:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__SBRoutingSwitcherModifier_homeScreenBackdropBlurType__block_invoke;
  v7[3] = &unk_1E8E9DFA0;
  v7[4] = self;
  v7[5] = &v8;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v4, v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __55__SBRoutingSwitcherModifier_homeScreenBackdropBlurType__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
  objc_msgSend(WeakRetained, "homeScreenModifierForRoutingModifier:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "homeScreenBackdropBlurType");

}

- (double)homeScreenBackdropBlurProgress
{
  id WeakRetained;
  void *v4;
  double v5;
  _QWORD v7[6];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x2020000000;
  v11 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  objc_msgSend(WeakRetained, "homeScreenModifierForRoutingModifier:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__SBRoutingSwitcherModifier_homeScreenBackdropBlurProgress__block_invoke;
  v7[3] = &unk_1E8E9DFA0;
  v7[4] = self;
  v7[5] = &v8;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v4, v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __59__SBRoutingSwitcherModifier_homeScreenBackdropBlurProgress__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
  objc_msgSend(WeakRetained, "homeScreenModifierForRoutingModifier:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeScreenBackdropBlurProgress");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;

}

- (BOOL)wantsSwitcherDimmingView
{
  NSArray *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  int v9;
  id v10;
  id v11;
  BOOL v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v3 = self->_modifiers;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v4)
  {

LABEL_13:
    -[NSArray lastObject](self->_modifiers, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v5 = 0;
  v6 = *(_QWORD *)v23;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v23 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
      v18 = 0;
      v19 = &v18;
      v20 = 0x2020000000;
      v21 = 0;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __53__SBRoutingSwitcherModifier_wantsSwitcherDimmingView__block_invoke;
      v17[3] = &unk_1E8E9DFA0;
      v17[4] = v8;
      v17[5] = &v18;
      _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v17);
      v9 = *((unsigned __int8 *)v19 + 24);
      _Block_object_dispose(&v18, 8);
      if (v9)
      {
        v10 = v8;

        v5 = v10;
      }
    }
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  }
  while (v4);

  if (!v5)
    goto LABEL_13;
LABEL_14:
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __53__SBRoutingSwitcherModifier_wantsSwitcherDimmingView__block_invoke_2;
  v14[3] = &unk_1E8E9DFA0;
  v16 = &v18;
  v11 = v5;
  v15 = v11;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v11, v14);
  v12 = *((_BYTE *)v19 + 24) != 0;

  _Block_object_dispose(&v18, 8);
  return v12;
}

uint64_t __53__SBRoutingSwitcherModifier_wantsSwitcherDimmingView__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "wantsSwitcherDimmingView");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __53__SBRoutingSwitcherModifier_wantsSwitcherDimmingView__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "wantsSwitcherDimmingView");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (double)switcherDimmingAlpha
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  id v11;
  id v12;
  double v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  _QWORD v18[6];
  uint64_t v19;
  double *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v3 = self->_modifiers;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  v5 = MEMORY[0x1E0C809B0];
  if (!v4)
  {

LABEL_13:
    -[NSArray lastObject](self->_modifiers, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v6 = 0;
  v7 = *(_QWORD *)v24;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v24 != v7)
        objc_enumerationMutation(v3);
      v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
      v19 = 0;
      v20 = (double *)&v19;
      v21 = 0x2020000000;
      v22 = 0;
      v18[0] = v5;
      v18[1] = 3221225472;
      v18[2] = __49__SBRoutingSwitcherModifier_switcherDimmingAlpha__block_invoke;
      v18[3] = &unk_1E8E9DFA0;
      v18[4] = v9;
      v18[5] = &v19;
      _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v9, v18);
      v10 = v20[3];
      _Block_object_dispose(&v19, 8);
      if (v10 != 0.0)
      {
        v11 = v9;

        v6 = v11;
      }
    }
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  }
  while (v4);

  if (!v6)
    goto LABEL_13;
LABEL_14:
  v19 = 0;
  v20 = (double *)&v19;
  v21 = 0x2020000000;
  v22 = 0;
  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __49__SBRoutingSwitcherModifier_switcherDimmingAlpha__block_invoke_2;
  v15[3] = &unk_1E8E9DFA0;
  v17 = &v19;
  v12 = v6;
  v16 = v12;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v12, v15);
  v13 = v20[3];

  _Block_object_dispose(&v19, 8);
  return v13;
}

double __49__SBRoutingSwitcherModifier_switcherDimmingAlpha__block_invoke(uint64_t a1)
{
  double result;

  result = (double)objc_msgSend(*(id *)(a1 + 32), "wantsSwitcherDimmingView");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __49__SBRoutingSwitcherModifier_switcherDimmingAlpha__block_invoke_2(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "switcherDimmingAlpha");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (BOOL)switcherDimmingViewBlocksTouches
{
  NSArray *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  int v9;
  id v10;
  id v11;
  BOOL v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v3 = self->_modifiers;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v4)
  {

LABEL_13:
    -[NSArray lastObject](self->_modifiers, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v5 = 0;
  v6 = *(_QWORD *)v23;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v23 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
      v18 = 0;
      v19 = &v18;
      v20 = 0x2020000000;
      v21 = 0;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __61__SBRoutingSwitcherModifier_switcherDimmingViewBlocksTouches__block_invoke;
      v17[3] = &unk_1E8E9DFA0;
      v17[4] = v8;
      v17[5] = &v18;
      _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v17);
      v9 = *((unsigned __int8 *)v19 + 24);
      _Block_object_dispose(&v18, 8);
      if (v9)
      {
        v10 = v8;

        v5 = v10;
      }
    }
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  }
  while (v4);

  if (!v5)
    goto LABEL_13;
LABEL_14:
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__SBRoutingSwitcherModifier_switcherDimmingViewBlocksTouches__block_invoke_2;
  v14[3] = &unk_1E8E9DFA0;
  v16 = &v18;
  v11 = v5;
  v15 = v11;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v11, v14);
  v12 = *((_BYTE *)v19 + 24) != 0;

  _Block_object_dispose(&v18, 8);
  return v12;
}

uint64_t __61__SBRoutingSwitcherModifier_switcherDimmingViewBlocksTouches__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "wantsSwitcherDimmingView");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __61__SBRoutingSwitcherModifier_switcherDimmingViewBlocksTouches__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "switcherDimmingViewBlocksTouches");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)wantsSwitcherBackdropBlur
{
  NSArray *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  int v9;
  id v10;
  id v11;
  BOOL v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v3 = self->_modifiers;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v4)
  {

LABEL_13:
    -[NSArray lastObject](self->_modifiers, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v5 = 0;
  v6 = *(_QWORD *)v23;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v23 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
      v18 = 0;
      v19 = &v18;
      v20 = 0x2020000000;
      v21 = 0;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __54__SBRoutingSwitcherModifier_wantsSwitcherBackdropBlur__block_invoke;
      v17[3] = &unk_1E8E9DFA0;
      v17[4] = v8;
      v17[5] = &v18;
      _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v17);
      v9 = *((unsigned __int8 *)v19 + 24);
      _Block_object_dispose(&v18, 8);
      if (v9)
      {
        v10 = v8;

        v5 = v10;
      }
    }
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  }
  while (v4);

  if (!v5)
    goto LABEL_13;
LABEL_14:
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __54__SBRoutingSwitcherModifier_wantsSwitcherBackdropBlur__block_invoke_2;
  v14[3] = &unk_1E8E9DFA0;
  v16 = &v18;
  v11 = v5;
  v15 = v11;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v11, v14);
  v12 = *((_BYTE *)v19 + 24) != 0;

  _Block_object_dispose(&v18, 8);
  return v12;
}

uint64_t __54__SBRoutingSwitcherModifier_wantsSwitcherBackdropBlur__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "wantsSwitcherBackdropBlur");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __54__SBRoutingSwitcherModifier_wantsSwitcherBackdropBlur__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "wantsSwitcherBackdropBlur");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)switcherBackdropBlurType
{
  NSArray *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  int64_t v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v3 = self->_modifiers;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v4)
  {

LABEL_13:
    -[NSArray lastObject](self->_modifiers, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v5 = 0;
  v6 = *(_QWORD *)v23;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v23 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
      v18 = 0;
      v19 = &v18;
      v20 = 0x2020000000;
      v21 = 0;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __53__SBRoutingSwitcherModifier_switcherBackdropBlurType__block_invoke;
      v17[3] = &unk_1E8E9DFA0;
      v17[4] = v8;
      v17[5] = &v18;
      _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v17);
      v9 = v19[3];
      _Block_object_dispose(&v18, 8);
      if (v9)
      {
        v10 = v8;

        v5 = v10;
      }
    }
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  }
  while (v4);

  if (!v5)
    goto LABEL_13;
LABEL_14:
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __53__SBRoutingSwitcherModifier_switcherBackdropBlurType__block_invoke_2;
  v14[3] = &unk_1E8E9DFA0;
  v16 = &v18;
  v11 = v5;
  v15 = v11;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v11, v14);
  v12 = v19[3];

  _Block_object_dispose(&v18, 8);
  return v12;
}

uint64_t __53__SBRoutingSwitcherModifier_switcherBackdropBlurType__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "wantsSwitcherBackdropBlur");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __53__SBRoutingSwitcherModifier_switcherBackdropBlurType__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "switcherBackdropBlurType");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (double)switcherBackdropBlurProgress
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  id v11;
  id v12;
  double v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  _QWORD v18[6];
  uint64_t v19;
  double *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v3 = self->_modifiers;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  v5 = MEMORY[0x1E0C809B0];
  if (!v4)
  {

LABEL_13:
    -[NSArray lastObject](self->_modifiers, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v6 = 0;
  v7 = *(_QWORD *)v24;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v24 != v7)
        objc_enumerationMutation(v3);
      v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
      v19 = 0;
      v20 = (double *)&v19;
      v21 = 0x2020000000;
      v22 = 0;
      v18[0] = v5;
      v18[1] = 3221225472;
      v18[2] = __57__SBRoutingSwitcherModifier_switcherBackdropBlurProgress__block_invoke;
      v18[3] = &unk_1E8E9DFA0;
      v18[4] = v9;
      v18[5] = &v19;
      _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v9, v18);
      v10 = v20[3];
      _Block_object_dispose(&v19, 8);
      if (v10 != 0.0)
      {
        v11 = v9;

        v6 = v11;
      }
    }
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  }
  while (v4);

  if (!v6)
    goto LABEL_13;
LABEL_14:
  v19 = 0;
  v20 = (double *)&v19;
  v21 = 0x2020000000;
  v22 = 0;
  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __57__SBRoutingSwitcherModifier_switcherBackdropBlurProgress__block_invoke_2;
  v15[3] = &unk_1E8E9DFA0;
  v17 = &v19;
  v12 = v6;
  v16 = v12;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v12, v15);
  v13 = v20[3];

  _Block_object_dispose(&v19, 8);
  return v13;
}

double __57__SBRoutingSwitcherModifier_switcherBackdropBlurProgress__block_invoke(uint64_t a1)
{
  double result;

  result = (double)objc_msgSend(*(id *)(a1 + 32), "wantsSwitcherBackdropBlur");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __57__SBRoutingSwitcherModifier_switcherBackdropBlurProgress__block_invoke_2(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "switcherBackdropBlurProgress");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (unint64_t)multipleWindowsIndicatorLayoutRoleMaskForAppLayout:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __80__SBRoutingSwitcherModifier_multipleWindowsIndicatorLayoutRoleMaskForAppLayout___block_invoke;
  v8[3] = &unk_1E8EA8F48;
  v10 = &v11;
  v5 = v4;
  v9 = v5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v5, v8);
  v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __80__SBRoutingSwitcherModifier_multipleWindowsIndicatorLayoutRoleMaskForAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "multipleWindowsIndicatorLayoutRoleMaskForAppLayout:", *(_QWORD *)(a1 + 32));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)wantsSpaceAccessoryViewPointerInteractionsForAppLayout:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __84__SBRoutingSwitcherModifier_wantsSpaceAccessoryViewPointerInteractionsForAppLayout___block_invoke;
  v7[3] = &unk_1E8EA8F48;
  v9 = &v10;
  v5 = v4;
  v8 = v5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v5, v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __84__SBRoutingSwitcherModifier_wantsSpaceAccessoryViewPointerInteractionsForAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "wantsSpaceAccessoryViewPointerInteractionsForAppLayout:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (double)spaceAccessoryViewIconHitTestOutsetForAppLayout:(id)a3
{
  id v4;
  id v5;
  double v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  double *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v11 = 0;
  v12 = (double *)&v11;
  v13 = 0x2020000000;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__SBRoutingSwitcherModifier_spaceAccessoryViewIconHitTestOutsetForAppLayout___block_invoke;
  v8[3] = &unk_1E8EA8F48;
  v10 = &v11;
  v5 = v4;
  v9 = v5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v5, v8);
  v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __77__SBRoutingSwitcherModifier_spaceAccessoryViewIconHitTestOutsetForAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;

  result = objc_msgSend(a2, "spaceAccessoryViewIconHitTestOutsetForAppLayout:", *(_QWORD *)(a1 + 32));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;
  return result;
}

- (BOOL)canSelectLeafWithModifierKeysInAppLayout:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__SBRoutingSwitcherModifier_canSelectLeafWithModifierKeysInAppLayout___block_invoke;
  v7[3] = &unk_1E8EA8F48;
  v9 = &v10;
  v5 = v4;
  v8 = v5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v5, v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __70__SBRoutingSwitcherModifier_canSelectLeafWithModifierKeysInAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "canSelectLeafWithModifierKeysInAppLayout:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)shouldAllowGroupOpacityForAppLayout:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__SBRoutingSwitcherModifier_shouldAllowGroupOpacityForAppLayout___block_invoke;
  v7[3] = &unk_1E8EA8F48;
  v9 = &v10;
  v5 = v4;
  v8 = v5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v5, v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __65__SBRoutingSwitcherModifier_shouldAllowGroupOpacityForAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "shouldAllowGroupOpacityForAppLayout:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (double)perspectiveAngleForAppLayout:(id)a3
{
  id v4;
  id v5;
  double v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  double *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v11 = 0;
  v12 = (double *)&v11;
  v13 = 0x2020000000;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__SBRoutingSwitcherModifier_perspectiveAngleForAppLayout___block_invoke;
  v8[3] = &unk_1E8EA8F48;
  v10 = &v11;
  v5 = v4;
  v9 = v5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v5, v8);
  v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __58__SBRoutingSwitcherModifier_perspectiveAngleForAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;

  result = objc_msgSend(a2, "perspectiveAngleForAppLayout:", *(_QWORD *)(a1 + 32));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;
  return result;
}

- (unint64_t)footerViewIconAlignmentForAppLayout:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__SBRoutingSwitcherModifier_footerViewIconAlignmentForAppLayout___block_invoke;
  v8[3] = &unk_1E8EA8F48;
  v10 = &v11;
  v5 = v4;
  v9 = v5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v5, v8);
  v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __65__SBRoutingSwitcherModifier_footerViewIconAlignmentForAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "footerViewIconAlignmentForAppLayout:", *(_QWORD *)(a1 + 32));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isScrollEnabled
{
  SBRoutingSwitcherModifier *v2;
  id WeakRetained;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v2 = self;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  objc_msgSend(WeakRetained, "scrollModifierForRoutingModifier:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__SBRoutingSwitcherModifier_isScrollEnabled__block_invoke;
  v6[3] = &unk_1E8E9DFA0;
  v6[4] = v2;
  v6[5] = &v7;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&v2->super.super.super.isa, v4, v6);

  LOBYTE(v2) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

void __44__SBRoutingSwitcherModifier_isScrollEnabled__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
  objc_msgSend(WeakRetained, "scrollModifierForRoutingModifier:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "isScrollEnabled");

}

- (BOOL)shouldScrollViewBlockTouches
{
  SBRoutingSwitcherModifier *v2;
  id WeakRetained;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v2 = self;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  objc_msgSend(WeakRetained, "scrollModifierForRoutingModifier:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__SBRoutingSwitcherModifier_shouldScrollViewBlockTouches__block_invoke;
  v6[3] = &unk_1E8E9DFA0;
  v6[4] = v2;
  v6[5] = &v7;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&v2->super.super.super.isa, v4, v6);

  LOBYTE(v2) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

void __57__SBRoutingSwitcherModifier_shouldScrollViewBlockTouches__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
  objc_msgSend(WeakRetained, "scrollModifierForRoutingModifier:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "shouldScrollViewBlockTouches");

}

- (BOOL)shouldRubberbandFullScreenHomeGrabberView
{
  char v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  unsigned int v9;
  NSArray *obj;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = self->_modifiers;
  v3 = 0;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v13 = 0;
        v14 = &v13;
        v15 = 0x2020000000;
        v16 = 0;
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __70__SBRoutingSwitcherModifier_shouldRubberbandFullScreenHomeGrabberView__block_invoke;
        v12[3] = &unk_1E8E9DFA0;
        v12[4] = v8;
        v12[5] = &v13;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v12);
        v9 = *((unsigned __int8 *)v14 + 24);
        _Block_object_dispose(&v13, 8);
        if ((v5 & 1) != 0)
          v3 |= v9 > (v3 & 1u);
        else
          v3 = v9 != 0;
        v5 = 1;
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }

  return v3 & 1;
}

uint64_t __70__SBRoutingSwitcherModifier_shouldRubberbandFullScreenHomeGrabberView__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "shouldRubberbandFullScreenHomeGrabberView");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isContainerStatusBarVisible
{
  NSArray *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  int v9;
  id v10;
  id v11;
  BOOL v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v3 = self->_modifiers;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v4)
  {

LABEL_13:
    -[NSArray lastObject](self->_modifiers, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v5 = 0;
  v6 = *(_QWORD *)v23;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v23 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
      v18 = 0;
      v19 = &v18;
      v20 = 0x2020000000;
      v21 = 0;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __56__SBRoutingSwitcherModifier_isContainerStatusBarVisible__block_invoke;
      v17[3] = &unk_1E8E9DFA0;
      v17[4] = v8;
      v17[5] = &v18;
      _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v17);
      v9 = *((unsigned __int8 *)v19 + 24);
      _Block_object_dispose(&v18, 8);
      if (!v9)
      {
        v10 = v8;

        v5 = v10;
      }
    }
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  }
  while (v4);

  if (!v5)
    goto LABEL_13;
LABEL_14:
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56__SBRoutingSwitcherModifier_isContainerStatusBarVisible__block_invoke_2;
  v14[3] = &unk_1E8E9DFA0;
  v16 = &v18;
  v11 = v5;
  v15 = v11;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v11, v14);
  v12 = *((_BYTE *)v19 + 24) != 0;

  _Block_object_dispose(&v18, 8);
  return v12;
}

uint64_t __56__SBRoutingSwitcherModifier_isContainerStatusBarVisible__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isContainerStatusBarVisible");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __56__SBRoutingSwitcherModifier_isContainerStatusBarVisible__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isContainerStatusBarVisible");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (double)containerStatusBarAnimationDuration
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  id v11;
  id v12;
  double v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  _QWORD v18[6];
  uint64_t v19;
  double *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v3 = self->_modifiers;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  v5 = MEMORY[0x1E0C809B0];
  if (!v4)
  {

LABEL_13:
    -[NSArray lastObject](self->_modifiers, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v6 = 0;
  v7 = *(_QWORD *)v24;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v24 != v7)
        objc_enumerationMutation(v3);
      v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
      v19 = 0;
      v20 = (double *)&v19;
      v21 = 0x2020000000;
      v22 = 0;
      v18[0] = v5;
      v18[1] = 3221225472;
      v18[2] = __64__SBRoutingSwitcherModifier_containerStatusBarAnimationDuration__block_invoke;
      v18[3] = &unk_1E8E9DFA0;
      v18[4] = v9;
      v18[5] = &v19;
      _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v9, v18);
      v10 = v20[3];
      _Block_object_dispose(&v19, 8);
      if (v10 == 0.0)
      {
        v11 = v9;

        v6 = v11;
      }
    }
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  }
  while (v4);

  if (!v6)
    goto LABEL_13;
LABEL_14:
  v19 = 0;
  v20 = (double *)&v19;
  v21 = 0x2020000000;
  v22 = 0;
  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __64__SBRoutingSwitcherModifier_containerStatusBarAnimationDuration__block_invoke_2;
  v15[3] = &unk_1E8E9DFA0;
  v17 = &v19;
  v12 = v6;
  v16 = v12;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v12, v15);
  v13 = v20[3];

  _Block_object_dispose(&v19, 8);
  return v13;
}

double __64__SBRoutingSwitcherModifier_containerStatusBarAnimationDuration__block_invoke(uint64_t a1)
{
  double result;

  result = (double)objc_msgSend(*(id *)(a1 + 32), "isContainerStatusBarVisible");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __64__SBRoutingSwitcherModifier_containerStatusBarAnimationDuration__block_invoke_2(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "containerStatusBarAnimationDuration");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3
{
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__SBRoutingSwitcherModifier_isContentStatusBarVisibleForIndex___block_invoke;
  v5[3] = &unk_1E8EA8F98;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __63__SBRoutingSwitcherModifier_isContentStatusBarVisibleForIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isContentStatusBarVisibleForIndex:");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)isWallpaperRequiredForSwitcher
{
  NSArray *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  int v9;
  id v10;
  id v11;
  BOOL v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v3 = self->_modifiers;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v4)
  {

LABEL_13:
    -[NSArray lastObject](self->_modifiers, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v5 = 0;
  v6 = *(_QWORD *)v23;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v23 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
      v18 = 0;
      v19 = &v18;
      v20 = 0x2020000000;
      v21 = 0;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __59__SBRoutingSwitcherModifier_isWallpaperRequiredForSwitcher__block_invoke;
      v17[3] = &unk_1E8E9DFA0;
      v17[4] = v8;
      v17[5] = &v18;
      _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v17);
      v9 = *((unsigned __int8 *)v19 + 24);
      _Block_object_dispose(&v18, 8);
      if (v9)
      {
        v10 = v8;

        v5 = v10;
      }
    }
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  }
  while (v4);

  if (!v5)
    goto LABEL_13;
LABEL_14:
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __59__SBRoutingSwitcherModifier_isWallpaperRequiredForSwitcher__block_invoke_2;
  v14[3] = &unk_1E8E9DFA0;
  v16 = &v18;
  v11 = v5;
  v15 = v11;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v11, v14);
  v12 = *((_BYTE *)v19 + 24) != 0;

  _Block_object_dispose(&v18, 8);
  return v12;
}

uint64_t __59__SBRoutingSwitcherModifier_isWallpaperRequiredForSwitcher__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isWallpaperRequiredForSwitcher");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __59__SBRoutingSwitcherModifier_isWallpaperRequiredForSwitcher__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isWallpaperRequiredForSwitcher");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)wallpaperStyle
{
  NSArray *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  int64_t v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v3 = self->_modifiers;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v4)
  {

LABEL_13:
    -[NSArray lastObject](self->_modifiers, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v5 = 0;
  v6 = *(_QWORD *)v23;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v23 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
      v18 = 0;
      v19 = &v18;
      v20 = 0x2020000000;
      v21 = 0;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __43__SBRoutingSwitcherModifier_wallpaperStyle__block_invoke;
      v17[3] = &unk_1E8E9DFA0;
      v17[4] = v8;
      v17[5] = &v18;
      _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v17);
      v9 = v19[3];
      _Block_object_dispose(&v18, 8);
      if (v9)
      {
        v10 = v8;

        v5 = v10;
      }
    }
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  }
  while (v4);

  if (!v5)
    goto LABEL_13;
LABEL_14:
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __43__SBRoutingSwitcherModifier_wallpaperStyle__block_invoke_2;
  v14[3] = &unk_1E8E9DFA0;
  v16 = &v18;
  v11 = v5;
  v15 = v11;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v11, v14);
  v12 = v19[3];

  _Block_object_dispose(&v18, 8);
  return v12;
}

uint64_t __43__SBRoutingSwitcherModifier_wallpaperStyle__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isWallpaperRequiredForSwitcher");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __43__SBRoutingSwitcherModifier_wallpaperStyle__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "wallpaperStyle");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isHomeScreenContentRequired
{
  char v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  unsigned int v9;
  NSArray *obj;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = self->_modifiers;
  v3 = 0;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v13 = 0;
        v14 = &v13;
        v15 = 0x2020000000;
        v16 = 0;
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __56__SBRoutingSwitcherModifier_isHomeScreenContentRequired__block_invoke;
        v12[3] = &unk_1E8E9DFA0;
        v12[4] = v8;
        v12[5] = &v13;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v12);
        v9 = *((unsigned __int8 *)v14 + 24);
        _Block_object_dispose(&v13, 8);
        if ((v5 & 1) != 0)
          v3 |= v9 > (v3 & 1u);
        else
          v3 = v9 != 0;
        v5 = 1;
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }

  return v3 & 1;
}

uint64_t __56__SBRoutingSwitcherModifier_isHomeScreenContentRequired__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isHomeScreenContentRequired");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)wantsHomeScreenPointerInteractions
{
  char v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  unsigned int v9;
  NSArray *obj;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = self->_modifiers;
  v3 = 0;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v13 = 0;
        v14 = &v13;
        v15 = 0x2020000000;
        v16 = 0;
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __63__SBRoutingSwitcherModifier_wantsHomeScreenPointerInteractions__block_invoke;
        v12[3] = &unk_1E8E9DFA0;
        v12[4] = v8;
        v12[5] = &v13;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v12);
        v9 = *((unsigned __int8 *)v14 + 24);
        _Block_object_dispose(&v13, 8);
        if ((v5 & 1) != 0)
          v3 |= v9 > (v3 & 1u);
        else
          v3 = v9 != 0;
        v5 = 1;
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }

  return v3 & 1;
}

uint64_t __63__SBRoutingSwitcherModifier_wantsHomeScreenPointerInteractions__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "wantsHomeScreenPointerInteractions");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)appExposeAccessoryButtonsBundleIdentifier
{
  id WeakRetained;
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__28;
  v12 = __Block_byref_object_dispose__28;
  v13 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  objc_msgSend(WeakRetained, "scrollModifierForRoutingModifier:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__SBRoutingSwitcherModifier_appExposeAccessoryButtonsBundleIdentifier__block_invoke;
  v7[3] = &unk_1E8E9DFA0;
  v7[4] = self;
  v7[5] = &v8;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __70__SBRoutingSwitcherModifier_appExposeAccessoryButtonsBundleIdentifier__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
  objc_msgSend(WeakRetained, "scrollModifierForRoutingModifier:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appExposeAccessoryButtonsBundleIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (double)plusButtonAlpha
{
  id WeakRetained;
  void *v4;
  double v5;
  _QWORD v7[6];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x2020000000;
  v11 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  objc_msgSend(WeakRetained, "scrollModifierForRoutingModifier:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__SBRoutingSwitcherModifier_plusButtonAlpha__block_invoke;
  v7[3] = &unk_1E8E9DFA0;
  v7[4] = self;
  v7[5] = &v8;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v4, v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __44__SBRoutingSwitcherModifier_plusButtonAlpha__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
  objc_msgSend(WeakRetained, "scrollModifierForRoutingModifier:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "plusButtonAlpha");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;

}

- (double)reopenClosedWindowsButtonAlpha
{
  id WeakRetained;
  void *v4;
  double v5;
  _QWORD v7[6];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x2020000000;
  v11 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  objc_msgSend(WeakRetained, "scrollModifierForRoutingModifier:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__SBRoutingSwitcherModifier_reopenClosedWindowsButtonAlpha__block_invoke;
  v7[3] = &unk_1E8E9DFA0;
  v7[4] = self;
  v7[5] = &v8;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v4, v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __59__SBRoutingSwitcherModifier_reopenClosedWindowsButtonAlpha__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
  objc_msgSend(WeakRetained, "scrollModifierForRoutingModifier:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reopenClosedWindowsButtonAlpha");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;

}

- (double)reopenClosedWindowsButtonScale
{
  id WeakRetained;
  void *v4;
  double v5;
  _QWORD v7[6];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x2020000000;
  v11 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  objc_msgSend(WeakRetained, "scrollModifierForRoutingModifier:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__SBRoutingSwitcherModifier_reopenClosedWindowsButtonScale__block_invoke;
  v7[3] = &unk_1E8E9DFA0;
  v7[4] = self;
  v7[5] = &v8;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v4, v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __59__SBRoutingSwitcherModifier_reopenClosedWindowsButtonScale__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
  objc_msgSend(WeakRetained, "scrollModifierForRoutingModifier:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reopenClosedWindowsButtonScale");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;

}

- (int64_t)appExposeAccessoryButtonsOverrideUserInterfaceStyle
{
  id WeakRetained;
  void *v4;
  int64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  objc_msgSend(WeakRetained, "scrollModifierForRoutingModifier:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__SBRoutingSwitcherModifier_appExposeAccessoryButtonsOverrideUserInterfaceStyle__block_invoke;
  v7[3] = &unk_1E8E9DFA0;
  v7[4] = self;
  v7[5] = &v8;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v4, v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __80__SBRoutingSwitcherModifier_appExposeAccessoryButtonsOverrideUserInterfaceStyle__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
  objc_msgSend(WeakRetained, "scrollModifierForRoutingModifier:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "appExposeAccessoryButtonsOverrideUserInterfaceStyle");

}

- (int64_t)plusButtonStyle
{
  id WeakRetained;
  void *v4;
  int64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  objc_msgSend(WeakRetained, "scrollModifierForRoutingModifier:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__SBRoutingSwitcherModifier_plusButtonStyle__block_invoke;
  v7[3] = &unk_1E8E9DFA0;
  v7[4] = self;
  v7[5] = &v8;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v4, v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __44__SBRoutingSwitcherModifier_plusButtonStyle__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
  objc_msgSend(WeakRetained, "scrollModifierForRoutingModifier:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "plusButtonStyle");

}

- (BOOL)isSwitcherWindowVisible
{
  char v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  unsigned int v9;
  NSArray *obj;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = self->_modifiers;
  v3 = 0;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v13 = 0;
        v14 = &v13;
        v15 = 0x2020000000;
        v16 = 0;
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __52__SBRoutingSwitcherModifier_isSwitcherWindowVisible__block_invoke;
        v12[3] = &unk_1E8E9DFA0;
        v12[4] = v8;
        v12[5] = &v13;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v12);
        v9 = *((unsigned __int8 *)v14 + 24);
        _Block_object_dispose(&v13, 8);
        if ((v5 & 1) != 0)
          v3 |= v9 > (v3 & 1u);
        else
          v3 = v9 != 0;
        v5 = 1;
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }

  return v3 & 1;
}

uint64_t __52__SBRoutingSwitcherModifier_isSwitcherWindowVisible__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isSwitcherWindowVisible");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isSwitcherWindowUserInteractionEnabled
{
  char v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  unsigned int v9;
  NSArray *obj;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = self->_modifiers;
  v3 = 0;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v13 = 0;
        v14 = &v13;
        v15 = 0x2020000000;
        v16 = 0;
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __67__SBRoutingSwitcherModifier_isSwitcherWindowUserInteractionEnabled__block_invoke;
        v12[3] = &unk_1E8E9DFA0;
        v12[4] = v8;
        v12[5] = &v13;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v12);
        v9 = *((unsigned __int8 *)v14 + 24);
        _Block_object_dispose(&v13, 8);
        if ((v5 & 1) != 0)
          v3 |= v9 > (v3 & 1u);
        else
          v3 = v9 != 0;
        v5 = 1;
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }

  return v3 & 1;
}

uint64_t __67__SBRoutingSwitcherModifier_isSwitcherWindowUserInteractionEnabled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isSwitcherWindowUserInteractionEnabled");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isItemContainerPointerInteractionEnabled
{
  char v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  unsigned int v9;
  NSArray *obj;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = self->_modifiers;
  v3 = 0;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v13 = 0;
        v14 = &v13;
        v15 = 0x2020000000;
        v16 = 0;
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __69__SBRoutingSwitcherModifier_isItemContainerPointerInteractionEnabled__block_invoke;
        v12[3] = &unk_1E8E9DFA0;
        v12[4] = v8;
        v12[5] = &v13;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v12);
        v9 = *((unsigned __int8 *)v14 + 24);
        _Block_object_dispose(&v13, 8);
        if ((v5 & 1) != 0)
          v3 |= v9 > (v3 & 1u);
        else
          v3 = v9 != 0;
        v5 = 1;
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }

  return v3 & 1;
}

uint64_t __69__SBRoutingSwitcherModifier_isItemContainerPointerInteractionEnabled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isItemContainerPointerInteractionEnabled");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)appLayoutsToCacheSnapshots
{
  void *v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSArray *obj;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = self->_modifiers;
  v3 = 0;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      v8 = v3;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v7);
        v15 = 0;
        v16 = &v15;
        v17 = 0x3032000000;
        v18 = __Block_byref_object_copy__28;
        v19 = __Block_byref_object_dispose__28;
        v20 = 0;
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __55__SBRoutingSwitcherModifier_appLayoutsToCacheSnapshots__block_invoke;
        v14[3] = &unk_1E8E9DFA0;
        v14[4] = v9;
        v14[5] = &v15;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v9, v14);
        v10 = (id)v16[5];
        _Block_object_dispose(&v15, 8);

        if ((v5 & 1) != 0)
        {
          _arrayByCombiningArrays(v8, v10);
          v11 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = v10;
        }
        v3 = v11;

        ++v7;
        v5 = 1;
        v8 = v3;
      }
      while (v4 != v7);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v4);
  }

  return v3;
}

void __55__SBRoutingSwitcherModifier_appLayoutsToCacheSnapshots__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "appLayoutsToCacheSnapshots");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)appLayoutsToCacheFullsizeSnapshots
{
  void *v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSArray *obj;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = self->_modifiers;
  v3 = 0;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      v8 = v3;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v7);
        v15 = 0;
        v16 = &v15;
        v17 = 0x3032000000;
        v18 = __Block_byref_object_copy__28;
        v19 = __Block_byref_object_dispose__28;
        v20 = 0;
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __63__SBRoutingSwitcherModifier_appLayoutsToCacheFullsizeSnapshots__block_invoke;
        v14[3] = &unk_1E8E9DFA0;
        v14[4] = v9;
        v14[5] = &v15;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v9, v14);
        v10 = (id)v16[5];
        _Block_object_dispose(&v15, 8);

        if ((v5 & 1) != 0)
        {
          _arrayByCombiningArrays(v8, v10);
          v11 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = v10;
        }
        v3 = v11;

        ++v7;
        v5 = 1;
        v8 = v3;
      }
      while (v4 != v7);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v4);
  }

  return v3;
}

void __63__SBRoutingSwitcherModifier_appLayoutsToCacheFullsizeSnapshots__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "appLayoutsToCacheFullsizeSnapshots");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (int64_t)preferredSnapshotOrientationForAppLayout:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__SBRoutingSwitcherModifier_preferredSnapshotOrientationForAppLayout___block_invoke;
  v8[3] = &unk_1E8EA8F48;
  v10 = &v11;
  v5 = v4;
  v9 = v5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v5, v8);
  v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __70__SBRoutingSwitcherModifier_preferredSnapshotOrientationForAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "preferredSnapshotOrientationForAppLayout:", *(_QWORD *)(a1 + 32));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)topMostLayoutElements
{
  id WeakRetained;
  NSArray *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  id v16;
  NSArray *obj;
  _QWORD v19[6];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  v4 = self->_modifiers;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = (NSArray *)objc_alloc_init(MEMORY[0x1E0CB3748]);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = v4;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v32 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          v25 = 0;
          v26 = &v25;
          v27 = 0x3032000000;
          v28 = __Block_byref_object_copy__28;
          v29 = __Block_byref_object_dispose__28;
          v30 = 0;
          v24[0] = MEMORY[0x1E0C809B0];
          v24[1] = 3221225472;
          v24[2] = __50__SBRoutingSwitcherModifier_topMostLayoutElements__block_invoke;
          v24[3] = &unk_1E8E9DFA0;
          v24[4] = v9;
          v24[5] = &v25;
          _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v9, v24);
          v10 = (id)v26[5];
          _Block_object_dispose(&v25, 8);

          -[NSArray setObject:forKey:](v5, "setObject:forKey:", v10, v9);
        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v6);
    }

    objc_msgSend(WeakRetained, "routingModifier:topMostLayoutElementsByModifier:", self, v5);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v5 = v4;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v35, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v21;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v5);
          v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
          v25 = 0;
          v26 = &v25;
          v27 = 0x3032000000;
          v28 = __Block_byref_object_copy__28;
          v29 = __Block_byref_object_dispose__28;
          v30 = 0;
          v19[0] = MEMORY[0x1E0C809B0];
          v19[1] = 3221225472;
          v19[2] = __50__SBRoutingSwitcherModifier_topMostLayoutElements__block_invoke_2;
          v19[3] = &unk_1E8E9DFA0;
          v19[4] = v15;
          v19[5] = &v25;
          _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v15, v19);
          v16 = (id)v26[5];
          _Block_object_dispose(&v25, 8);

          objc_msgSend(v11, "addObjectsFromArray:", v16);
        }
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v35, 16);
      }
      while (v12);
    }
  }

  return v11;
}

void __50__SBRoutingSwitcherModifier_topMostLayoutElements__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "topMostLayoutElements");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __50__SBRoutingSwitcherModifier_topMostLayoutElements__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "topMostLayoutElements");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)appLayoutToScrollToBeforeTransitioning
{
  id v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSArray *obj;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = self->_modifiers;
  v3 = 0;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      v8 = v3;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v7);
        v15 = 0;
        v16 = &v15;
        v17 = 0x3032000000;
        v18 = __Block_byref_object_copy__28;
        v19 = __Block_byref_object_dispose__28;
        v20 = 0;
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __67__SBRoutingSwitcherModifier_appLayoutToScrollToBeforeTransitioning__block_invoke;
        v14[3] = &unk_1E8E9DFA0;
        v14[4] = v9;
        v14[5] = &v15;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v9, v14);
        v10 = (id)v16[5];
        _Block_object_dispose(&v15, 8);

        if (v8)
          v11 = v8;
        else
          v11 = v10;
        if ((v5 & 1) == 0)
          v11 = v10;
        v3 = v11;

        ++v7;
        v5 = 1;
        v8 = v3;
      }
      while (v4 != v7);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v4);
  }

  return v3;
}

void __67__SBRoutingSwitcherModifier_appLayoutToScrollToBeforeTransitioning__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "appLayoutToScrollToBeforeTransitioning");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)appLayoutToScrollToBeforeReopeningClosedWindows
{
  id v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSArray *obj;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = self->_modifiers;
  v3 = 0;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      v8 = v3;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v7);
        v15 = 0;
        v16 = &v15;
        v17 = 0x3032000000;
        v18 = __Block_byref_object_copy__28;
        v19 = __Block_byref_object_dispose__28;
        v20 = 0;
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __76__SBRoutingSwitcherModifier_appLayoutToScrollToBeforeReopeningClosedWindows__block_invoke;
        v14[3] = &unk_1E8E9DFA0;
        v14[4] = v9;
        v14[5] = &v15;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v9, v14);
        v10 = (id)v16[5];
        _Block_object_dispose(&v15, 8);

        if (v8)
          v11 = v8;
        else
          v11 = v10;
        if ((v5 & 1) == 0)
          v11 = v10;
        v3 = v11;

        ++v7;
        v5 = 1;
        v8 = v3;
      }
      while (v4 != v7);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v4);
  }

  return v3;
}

void __76__SBRoutingSwitcherModifier_appLayoutToScrollToBeforeReopeningClosedWindows__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "appLayoutToScrollToBeforeReopeningClosedWindows");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (unint64_t)transactionCompletionOptions
{
  id WeakRetained;
  void *v4;
  unint64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  objc_msgSend(WeakRetained, "transactionCompletionOptionsModifierForRoutingModifier:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__SBRoutingSwitcherModifier_transactionCompletionOptions__block_invoke;
  v7[3] = &unk_1E8E9DFA0;
  v7[4] = self;
  v7[5] = &v8;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v4, v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __57__SBRoutingSwitcherModifier_transactionCompletionOptions__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
  objc_msgSend(WeakRetained, "transactionCompletionOptionsModifierForRoutingModifier:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "transactionCompletionOptions");

}

- (BOOL)shouldAcceleratedHomeButtonPressBegin
{
  char v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  unsigned int v9;
  NSArray *obj;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = self->_modifiers;
  v3 = 0;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v13 = 0;
        v14 = &v13;
        v15 = 0x2020000000;
        v16 = 0;
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __66__SBRoutingSwitcherModifier_shouldAcceleratedHomeButtonPressBegin__block_invoke;
        v12[3] = &unk_1E8E9DFA0;
        v12[4] = v8;
        v12[5] = &v13;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v12);
        v9 = *((unsigned __int8 *)v14 + 24);
        _Block_object_dispose(&v13, 8);
        if ((v5 & 1) != 0)
          v3 |= v9 > (v3 & 1u);
        else
          v3 = v9 != 0;
        v5 = 1;
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }

  return v3 & 1;
}

uint64_t __66__SBRoutingSwitcherModifier_shouldAcceleratedHomeButtonPressBegin__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "shouldAcceleratedHomeButtonPressBegin");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)shouldFireTransitionCompletionInDefaultRunLoopMode
{
  char v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  unsigned int v9;
  NSArray *obj;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = self->_modifiers;
  v3 = 0;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v13 = 0;
        v14 = &v13;
        v15 = 0x2020000000;
        v16 = 0;
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __79__SBRoutingSwitcherModifier_shouldFireTransitionCompletionInDefaultRunLoopMode__block_invoke;
        v12[3] = &unk_1E8E9DFA0;
        v12[4] = v8;
        v12[5] = &v13;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v12);
        v9 = *((unsigned __int8 *)v14 + 24);
        _Block_object_dispose(&v13, 8);
        if ((v5 & 1) != 0)
          v3 |= v9 > (v3 & 1u);
        else
          v3 = v9 != 0;
        v5 = 1;
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }

  return v3 & 1;
}

uint64_t __79__SBRoutingSwitcherModifier_shouldFireTransitionCompletionInDefaultRunLoopMode__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "shouldFireTransitionCompletionInDefaultRunLoopMode");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)shouldPerformRotationAnimationForOrientationChange
{
  char v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  unsigned int v9;
  NSArray *obj;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = self->_modifiers;
  v3 = 0;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v13 = 0;
        v14 = &v13;
        v15 = 0x2020000000;
        v16 = 0;
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __79__SBRoutingSwitcherModifier_shouldPerformRotationAnimationForOrientationChange__block_invoke;
        v12[3] = &unk_1E8E9DFA0;
        v12[4] = v8;
        v12[5] = &v13;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v12);
        v9 = *((unsigned __int8 *)v14 + 24);
        _Block_object_dispose(&v13, 8);
        if ((v5 & 1) != 0)
          v3 |= v9 > (v3 & 1u);
        else
          v3 = v9 != 0;
        v5 = 1;
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }

  return v3 & 1;
}

uint64_t __79__SBRoutingSwitcherModifier_shouldPerformRotationAnimationForOrientationChange__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "shouldPerformRotationAnimationForOrientationChange");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)shouldPerformCrossfadeForReduceMotion
{
  char v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  unsigned int v9;
  NSArray *obj;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = self->_modifiers;
  v3 = 0;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v13 = 0;
        v14 = &v13;
        v15 = 0x2020000000;
        v16 = 0;
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __66__SBRoutingSwitcherModifier_shouldPerformCrossfadeForReduceMotion__block_invoke;
        v12[3] = &unk_1E8E9DFA0;
        v12[4] = v8;
        v12[5] = &v13;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v12);
        v9 = *((unsigned __int8 *)v14 + 24);
        _Block_object_dispose(&v13, 8);
        if ((v5 & 1) != 0)
          v3 |= v9 > (v3 & 1u);
        else
          v3 = v9 != 0;
        v5 = 1;
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }

  return v3 & 1;
}

uint64_t __66__SBRoutingSwitcherModifier_shouldPerformCrossfadeForReduceMotion__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "shouldPerformCrossfadeForReduceMotion");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isLayoutRoleKillable:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  int64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v8 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__SBRoutingSwitcherModifier_isLayoutRoleKillable_inAppLayout_atIndex___block_invoke;
  v11[3] = &unk_1E8EA8FE8;
  v13 = &v15;
  v14 = a3;
  v9 = v8;
  v12 = v9;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a5, v11);
  LOBYTE(a5) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return a5;
}

uint64_t __70__SBRoutingSwitcherModifier_isLayoutRoleKillable_inAppLayout_atIndex___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "isLayoutRoleKillable:inAppLayout:atIndex:", a1[6], a1[4], a3);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

- (BOOL)isIndexRubberbandableForSwipeToKill:(unint64_t)a3
{
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__SBRoutingSwitcherModifier_isIndexRubberbandableForSwipeToKill___block_invoke;
  v5[3] = &unk_1E8EA8F98;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __65__SBRoutingSwitcherModifier_isIndexRubberbandableForSwipeToKill___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isIndexRubberbandableForSwipeToKill:");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)shouldAnimateInsertionOrRemovalOfAppLayout:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v6 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __80__SBRoutingSwitcherModifier_shouldAnimateInsertionOrRemovalOfAppLayout_atIndex___block_invoke;
  v9[3] = &unk_1E8EA9128;
  v11 = &v13;
  v12 = a4;
  v9[4] = self;
  v7 = v6;
  v10 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v9);
  LOBYTE(self) = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)self;
}

void __80__SBRoutingSwitcherModifier_shouldAnimateInsertionOrRemovalOfAppLayout_atIndex___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  unint64_t v4;
  id v5;

  v3 = (void *)a1[4];
  v4 = a1[7];
  v5 = a2;
  LOBYTE(v3) = objc_msgSend(v5, "shouldAnimateInsertionOrRemovalOfAppLayout:atIndex:", a1[5], _SBRoutingSwitcherModifierSubIndexFromIndexForModifier(v3, v4, v5));

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = (_BYTE)v3;
}

- (unint64_t)indexToScrollToAfterRemovingIndex:(unint64_t)a3
{
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__SBRoutingSwitcherModifier_indexToScrollToAfterRemovingIndex___block_invoke;
  v5[3] = &unk_1E8EA8F98;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __63__SBRoutingSwitcherModifier_indexToScrollToAfterRemovingIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "indexToScrollToAfterRemovingIndex:");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (unint64_t)indexToScrollToAfterInsertingAtIndex:(unint64_t)a3
{
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__SBRoutingSwitcherModifier_indexToScrollToAfterInsertingAtIndex___block_invoke;
  v5[3] = &unk_1E8EA8F98;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __66__SBRoutingSwitcherModifier_indexToScrollToAfterInsertingAtIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "indexToScrollToAfterInsertingAtIndex:");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)shouldBringCardToFrontDuringInsertionOrRemoval
{
  char v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  unsigned int v9;
  NSArray *obj;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = self->_modifiers;
  v3 = 0;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v13 = 0;
        v14 = &v13;
        v15 = 0x2020000000;
        v16 = 0;
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __75__SBRoutingSwitcherModifier_shouldBringCardToFrontDuringInsertionOrRemoval__block_invoke;
        v12[3] = &unk_1E8E9DFA0;
        v12[4] = v8;
        v12[5] = &v13;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v12);
        v9 = *((unsigned __int8 *)v14 + 24);
        _Block_object_dispose(&v13, 8);
        if ((v5 & 1) != 0)
          v3 |= v9 > (v3 & 1u);
        else
          v3 = v9 != 0;
        v5 = 1;
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }

  return v3 & 1;
}

uint64_t __75__SBRoutingSwitcherModifier_shouldBringCardToFrontDuringInsertionOrRemoval__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "shouldBringCardToFrontDuringInsertionOrRemoval");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)shouldConfigureInAppDockHiddenAssertion
{
  char v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  unsigned int v9;
  NSArray *obj;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = self->_modifiers;
  v3 = 0;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v13 = 0;
        v14 = &v13;
        v15 = 0x2020000000;
        v16 = 0;
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __68__SBRoutingSwitcherModifier_shouldConfigureInAppDockHiddenAssertion__block_invoke;
        v12[3] = &unk_1E8E9DFA0;
        v12[4] = v8;
        v12[5] = &v13;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v12);
        v9 = *((unsigned __int8 *)v14 + 24);
        _Block_object_dispose(&v13, 8);
        if ((v5 & 1) != 0)
          v3 |= v9 > (v3 & 1u);
        else
          v3 = v9 != 0;
        v5 = 1;
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }

  return v3 & 1;
}

uint64_t __68__SBRoutingSwitcherModifier_shouldConfigureInAppDockHiddenAssertion__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "shouldConfigureInAppDockHiddenAssertion");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)wantsDockBehaviorAssertion
{
  NSArray *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  int v9;
  id v10;
  id v11;
  BOOL v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v3 = self->_modifiers;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v4)
  {

LABEL_13:
    -[NSArray lastObject](self->_modifiers, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v5 = 0;
  v6 = *(_QWORD *)v23;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v23 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
      v18 = 0;
      v19 = &v18;
      v20 = 0x2020000000;
      v21 = 0;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __55__SBRoutingSwitcherModifier_wantsDockBehaviorAssertion__block_invoke;
      v17[3] = &unk_1E8E9DFA0;
      v17[4] = v8;
      v17[5] = &v18;
      _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v17);
      v9 = *((unsigned __int8 *)v19 + 24);
      _Block_object_dispose(&v18, 8);
      if (v9)
      {
        v10 = v8;

        v5 = v10;
      }
    }
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  }
  while (v4);

  if (!v5)
    goto LABEL_13;
LABEL_14:
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __55__SBRoutingSwitcherModifier_wantsDockBehaviorAssertion__block_invoke_2;
  v14[3] = &unk_1E8E9DFA0;
  v16 = &v18;
  v11 = v5;
  v15 = v11;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v11, v14);
  v12 = *((_BYTE *)v19 + 24) != 0;

  _Block_object_dispose(&v18, 8);
  return v12;
}

uint64_t __55__SBRoutingSwitcherModifier_wantsDockBehaviorAssertion__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "wantsDockBehaviorAssertion");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __55__SBRoutingSwitcherModifier_wantsDockBehaviorAssertion__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "wantsDockBehaviorAssertion");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (double)dockProgress
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  id v11;
  id v12;
  double v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  _QWORD v18[6];
  uint64_t v19;
  double *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v3 = self->_modifiers;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  v5 = MEMORY[0x1E0C809B0];
  if (!v4)
  {

LABEL_13:
    -[NSArray lastObject](self->_modifiers, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v6 = 0;
  v7 = *(_QWORD *)v24;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v24 != v7)
        objc_enumerationMutation(v3);
      v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
      v19 = 0;
      v20 = (double *)&v19;
      v21 = 0x2020000000;
      v22 = 0;
      v18[0] = v5;
      v18[1] = 3221225472;
      v18[2] = __41__SBRoutingSwitcherModifier_dockProgress__block_invoke;
      v18[3] = &unk_1E8E9DFA0;
      v18[4] = v9;
      v18[5] = &v19;
      _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v9, v18);
      v10 = v20[3];
      _Block_object_dispose(&v19, 8);
      if (v10 != 0.0)
      {
        v11 = v9;

        v6 = v11;
      }
    }
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  }
  while (v4);

  if (!v6)
    goto LABEL_13;
LABEL_14:
  v19 = 0;
  v20 = (double *)&v19;
  v21 = 0x2020000000;
  v22 = 0;
  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __41__SBRoutingSwitcherModifier_dockProgress__block_invoke_2;
  v15[3] = &unk_1E8E9DFA0;
  v17 = &v19;
  v12 = v6;
  v16 = v12;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v12, v15);
  v13 = v20[3];

  _Block_object_dispose(&v19, 8);
  return v13;
}

double __41__SBRoutingSwitcherModifier_dockProgress__block_invoke(uint64_t a1)
{
  double result;

  result = (double)objc_msgSend(*(id *)(a1 + 32), "wantsDockBehaviorAssertion");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __41__SBRoutingSwitcherModifier_dockProgress__block_invoke_2(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "dockProgress");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (int64_t)dockUpdateMode
{
  NSArray *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  int64_t v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v3 = self->_modifiers;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v4)
  {

LABEL_13:
    -[NSArray lastObject](self->_modifiers, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v5 = 0;
  v6 = *(_QWORD *)v23;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v23 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
      v18 = 0;
      v19 = &v18;
      v20 = 0x2020000000;
      v21 = 0;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __43__SBRoutingSwitcherModifier_dockUpdateMode__block_invoke;
      v17[3] = &unk_1E8E9DFA0;
      v17[4] = v8;
      v17[5] = &v18;
      _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v17);
      v9 = v19[3];
      _Block_object_dispose(&v18, 8);
      if (v9)
      {
        v10 = v8;

        v5 = v10;
      }
    }
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  }
  while (v4);

  if (!v5)
    goto LABEL_13;
LABEL_14:
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __43__SBRoutingSwitcherModifier_dockUpdateMode__block_invoke_2;
  v14[3] = &unk_1E8E9DFA0;
  v16 = &v18;
  v11 = v5;
  v15 = v11;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v11, v14);
  v12 = v19[3];

  _Block_object_dispose(&v18, 8);
  return v12;
}

uint64_t __43__SBRoutingSwitcherModifier_dockUpdateMode__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "wantsDockBehaviorAssertion");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __43__SBRoutingSwitcherModifier_dockUpdateMode__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "dockUpdateMode");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)wantsDockWindowLevelAssertion
{
  NSArray *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  int v9;
  id v10;
  id v11;
  BOOL v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v3 = self->_modifiers;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v4)
  {

LABEL_13:
    -[NSArray lastObject](self->_modifiers, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v5 = 0;
  v6 = *(_QWORD *)v23;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v23 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
      v18 = 0;
      v19 = &v18;
      v20 = 0x2020000000;
      v21 = 0;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __58__SBRoutingSwitcherModifier_wantsDockWindowLevelAssertion__block_invoke;
      v17[3] = &unk_1E8E9DFA0;
      v17[4] = v8;
      v17[5] = &v18;
      _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v17);
      v9 = *((unsigned __int8 *)v19 + 24);
      _Block_object_dispose(&v18, 8);
      if (v9)
      {
        v10 = v8;

        v5 = v10;
      }
    }
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  }
  while (v4);

  if (!v5)
    goto LABEL_13;
LABEL_14:
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __58__SBRoutingSwitcherModifier_wantsDockWindowLevelAssertion__block_invoke_2;
  v14[3] = &unk_1E8E9DFA0;
  v16 = &v18;
  v11 = v5;
  v15 = v11;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v11, v14);
  v12 = *((_BYTE *)v19 + 24) != 0;

  _Block_object_dispose(&v18, 8);
  return v12;
}

uint64_t __58__SBRoutingSwitcherModifier_wantsDockWindowLevelAssertion__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "wantsDockWindowLevelAssertion");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __58__SBRoutingSwitcherModifier_wantsDockWindowLevelAssertion__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "wantsDockWindowLevelAssertion");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)dockWindowLevelPriority
{
  NSArray *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  unint64_t v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v3 = self->_modifiers;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v4)
  {

LABEL_13:
    -[NSArray lastObject](self->_modifiers, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v5 = 0;
  v6 = *(_QWORD *)v23;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v23 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
      v18 = 0;
      v19 = &v18;
      v20 = 0x2020000000;
      v21 = 0;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __52__SBRoutingSwitcherModifier_dockWindowLevelPriority__block_invoke;
      v17[3] = &unk_1E8E9DFA0;
      v17[4] = v8;
      v17[5] = &v18;
      _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v17);
      v9 = v19[3];
      _Block_object_dispose(&v18, 8);
      if (v9)
      {
        v10 = v8;

        v5 = v10;
      }
    }
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  }
  while (v4);

  if (!v5)
    goto LABEL_13;
LABEL_14:
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __52__SBRoutingSwitcherModifier_dockWindowLevelPriority__block_invoke_2;
  v14[3] = &unk_1E8E9DFA0;
  v16 = &v18;
  v11 = v5;
  v15 = v11;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v11, v14);
  v12 = v19[3];

  _Block_object_dispose(&v18, 8);
  return v12;
}

uint64_t __52__SBRoutingSwitcherModifier_dockWindowLevelPriority__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "wantsDockWindowLevelAssertion");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __52__SBRoutingSwitcherModifier_dockWindowLevelPriority__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "dockWindowLevelPriority");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (double)dockWindowLevel
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  id v11;
  id v12;
  double v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  _QWORD v18[6];
  uint64_t v19;
  double *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v3 = self->_modifiers;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  v5 = MEMORY[0x1E0C809B0];
  if (!v4)
  {

LABEL_13:
    -[NSArray lastObject](self->_modifiers, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v6 = 0;
  v7 = *(_QWORD *)v24;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v24 != v7)
        objc_enumerationMutation(v3);
      v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
      v19 = 0;
      v20 = (double *)&v19;
      v21 = 0x2020000000;
      v22 = 0;
      v18[0] = v5;
      v18[1] = 3221225472;
      v18[2] = __44__SBRoutingSwitcherModifier_dockWindowLevel__block_invoke;
      v18[3] = &unk_1E8E9DFA0;
      v18[4] = v9;
      v18[5] = &v19;
      _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v9, v18);
      v10 = v20[3];
      _Block_object_dispose(&v19, 8);
      if (v10 != 0.0)
      {
        v11 = v9;

        v6 = v11;
      }
    }
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  }
  while (v4);

  if (!v6)
    goto LABEL_13;
LABEL_14:
  v19 = 0;
  v20 = (double *)&v19;
  v21 = 0x2020000000;
  v22 = 0;
  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __44__SBRoutingSwitcherModifier_dockWindowLevel__block_invoke_2;
  v15[3] = &unk_1E8E9DFA0;
  v17 = &v19;
  v12 = v6;
  v16 = v12;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v12, v15);
  v13 = v20[3];

  _Block_object_dispose(&v19, 8);
  return v13;
}

double __44__SBRoutingSwitcherModifier_dockWindowLevel__block_invoke(uint64_t a1)
{
  double result;

  result = (double)objc_msgSend(*(id *)(a1 + 32), "wantsDockWindowLevelAssertion");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __44__SBRoutingSwitcherModifier_dockWindowLevel__block_invoke_2(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "dockWindowLevel");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (id)appLayoutsToResignActive
{
  void *v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSArray *obj;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = self->_modifiers;
  v3 = 0;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      v8 = v3;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v7);
        v15 = 0;
        v16 = &v15;
        v17 = 0x3032000000;
        v18 = __Block_byref_object_copy__28;
        v19 = __Block_byref_object_dispose__28;
        v20 = 0;
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __53__SBRoutingSwitcherModifier_appLayoutsToResignActive__block_invoke;
        v14[3] = &unk_1E8E9DFA0;
        v14[4] = v9;
        v14[5] = &v15;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v9, v14);
        v10 = (id)v16[5];
        _Block_object_dispose(&v15, 8);

        if ((v5 & 1) != 0)
        {
          _dictionaryByCombingDictionaryOfSetOfAppLayouts(v8, v10);
          v11 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = v10;
        }
        v3 = v11;

        ++v7;
        v5 = 1;
        v8 = v3;
      }
      while (v4 != v7);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v4);
  }

  return v3;
}

void __53__SBRoutingSwitcherModifier_appLayoutsToResignActive__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "appLayoutsToResignActive");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)keyboardSuppressionMode
{
  void *v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSArray *obj;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = self->_modifiers;
  v3 = 0;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      v8 = v3;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v7);
        v15 = 0;
        v16 = &v15;
        v17 = 0x3032000000;
        v18 = __Block_byref_object_copy__28;
        v19 = __Block_byref_object_dispose__28;
        v20 = 0;
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __52__SBRoutingSwitcherModifier_keyboardSuppressionMode__block_invoke;
        v14[3] = &unk_1E8E9DFA0;
        v14[4] = v9;
        v14[5] = &v15;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v9, v14);
        v10 = (id)v16[5];
        _Block_object_dispose(&v15, 8);

        if ((v5 & 1) != 0)
        {
          _switcherKeyboardSuppressionModeByCombiningSuppressionModes(v8, v10);
          v11 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = v10;
        }
        v3 = v11;

        ++v7;
        v5 = 1;
        v8 = v3;
      }
      while (v4 != v7);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v4);
  }

  return v3;
}

void __52__SBRoutingSwitcherModifier_keyboardSuppressionMode__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "keyboardSuppressionMode");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;
  __int16 v14;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2810000000;
  v13 = &unk_1D0FA064E;
  v14 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__SBRoutingSwitcherModifier_asyncRenderingAttributesForAppLayout___block_invoke;
  v7[3] = &unk_1E8EA8F48;
  v9 = &v10;
  v5 = v4;
  v8 = v5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v5, v7);
  LOWORD(self) = *((_WORD *)v11 + 16);

  _Block_object_dispose(&v10, 8);
  return (SBSwitcherAsyncRenderingAttributes)self;
}

uint64_t __66__SBRoutingSwitcherModifier_asyncRenderingAttributesForAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "asyncRenderingAttributesForAppLayout:", *(_QWORD *)(a1 + 32));
  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = result;
  return result;
}

- (BOOL)wantsAsynchronousSurfaceRetentionAssertion
{
  char v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  unsigned int v9;
  NSArray *obj;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = self->_modifiers;
  v3 = 0;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v13 = 0;
        v14 = &v13;
        v15 = 0x2020000000;
        v16 = 0;
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __71__SBRoutingSwitcherModifier_wantsAsynchronousSurfaceRetentionAssertion__block_invoke;
        v12[3] = &unk_1E8E9DFA0;
        v12[4] = v8;
        v12[5] = &v13;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v12);
        v9 = *((unsigned __int8 *)v14 + 24);
        _Block_object_dispose(&v13, 8);
        if ((v5 & 1) != 0)
          v3 |= v9 > (v3 & 1u);
        else
          v3 = v9 != 0;
        v5 = 1;
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }

  return v3 & 1;
}

uint64_t __71__SBRoutingSwitcherModifier_wantsAsynchronousSurfaceRetentionAssertion__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "wantsAsynchronousSurfaceRetentionAssertion");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)wantsSceneResizesHostedContextForAppLayout:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__SBRoutingSwitcherModifier_wantsSceneResizesHostedContextForAppLayout___block_invoke;
  v7[3] = &unk_1E8EA8F48;
  v9 = &v10;
  v5 = v4;
  v8 = v5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v5, v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __72__SBRoutingSwitcherModifier_wantsSceneResizesHostedContextForAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "wantsSceneResizesHostedContextForAppLayout:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)appLayoutForReceivingHardwareButtonEvents
{
  id v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSArray *obj;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = self->_modifiers;
  v3 = 0;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      v8 = v3;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v7);
        v15 = 0;
        v16 = &v15;
        v17 = 0x3032000000;
        v18 = __Block_byref_object_copy__28;
        v19 = __Block_byref_object_dispose__28;
        v20 = 0;
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __70__SBRoutingSwitcherModifier_appLayoutForReceivingHardwareButtonEvents__block_invoke;
        v14[3] = &unk_1E8E9DFA0;
        v14[4] = v9;
        v14[5] = &v15;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v9, v14);
        v10 = (id)v16[5];
        _Block_object_dispose(&v15, 8);

        if (v8)
          v11 = v8;
        else
          v11 = v10;
        if ((v5 & 1) == 0)
          v11 = v10;
        v3 = v11;

        ++v7;
        v5 = 1;
        v8 = v3;
      }
      while (v4 != v7);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v4);
  }

  return v3;
}

void __70__SBRoutingSwitcherModifier_appLayoutForReceivingHardwareButtonEvents__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "appLayoutForReceivingHardwareButtonEvents");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)canPerformKeyboardShortcutAction:(int64_t)a3 forBundleIdentifier:(id)a4
{
  id v6;
  BOOL v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSArray *obj;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  int64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = self->_modifiers;
  v7 = 0;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = 0;
    v10 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v19 = 0;
        v20 = &v19;
        v21 = 0x2020000000;
        v22 = 0;
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __82__SBRoutingSwitcherModifier_canPerformKeyboardShortcutAction_forBundleIdentifier___block_invoke;
        v15[3] = &unk_1E8E9FD80;
        v17 = &v19;
        v18 = a3;
        v15[4] = v12;
        v16 = v6;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v12, v15);
        LODWORD(v12) = *((unsigned __int8 *)v20 + 24);

        _Block_object_dispose(&v19, 8);
        v7 = ((_DWORD)v12 != 0) & (v9 ^ 1 | v7);
        v9 = 1;
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v8);
  }

  return v7;
}

uint64_t __82__SBRoutingSwitcherModifier_canPerformKeyboardShortcutAction_forBundleIdentifier___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "canPerformKeyboardShortcutAction:forBundleIdentifier:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (id)activeLeafAppLayoutsReachableByKeyboardShortcut
{
  void *v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSArray *obj;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = self->_modifiers;
  v3 = 0;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      v8 = v3;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v7);
        v15 = 0;
        v16 = &v15;
        v17 = 0x3032000000;
        v18 = __Block_byref_object_copy__28;
        v19 = __Block_byref_object_dispose__28;
        v20 = 0;
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __76__SBRoutingSwitcherModifier_activeLeafAppLayoutsReachableByKeyboardShortcut__block_invoke;
        v14[3] = &unk_1E8E9DFA0;
        v14[4] = v9;
        v14[5] = &v15;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v9, v14);
        v10 = (id)v16[5];
        _Block_object_dispose(&v15, 8);

        if ((v5 & 1) != 0)
        {
          _arrayByCombiningArrays(v8, v10);
          v11 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = v10;
        }
        v3 = v11;

        ++v7;
        v5 = 1;
        v8 = v3;
      }
      while (v4 != v7);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v4);
  }

  return v3;
}

void __76__SBRoutingSwitcherModifier_activeLeafAppLayoutsReachableByKeyboardShortcut__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "activeLeafAppLayoutsReachableByKeyboardShortcut");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)inactiveAppLayoutsReachableByKeyboardShortcut
{
  void *v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSArray *obj;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = self->_modifiers;
  v3 = 0;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      v8 = v3;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v7);
        v15 = 0;
        v16 = &v15;
        v17 = 0x3032000000;
        v18 = __Block_byref_object_copy__28;
        v19 = __Block_byref_object_dispose__28;
        v20 = 0;
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __74__SBRoutingSwitcherModifier_inactiveAppLayoutsReachableByKeyboardShortcut__block_invoke;
        v14[3] = &unk_1E8E9DFA0;
        v14[4] = v9;
        v14[5] = &v15;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v9, v14);
        v10 = (id)v16[5];
        _Block_object_dispose(&v15, 8);

        if ((v5 & 1) != 0)
        {
          _arrayByCombiningArrays(v8, v10);
          v11 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = v10;
        }
        v3 = v11;

        ++v7;
        v5 = 1;
        v8 = v3;
      }
      while (v4 != v7);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v4);
  }

  return v3;
}

void __74__SBRoutingSwitcherModifier_inactiveAppLayoutsReachableByKeyboardShortcut__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "inactiveAppLayoutsReachableByKeyboardShortcut");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)adjustedContinuousExposeIdentifiersInSwitcherFromPreviousIdentifiersInSwitcher:(id)a3 identifiersInStrip:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v7 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__28;
  v24 = __Block_byref_object_dispose__28;
  v25 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  objc_msgSend(WeakRetained, "scrollModifierForRoutingModifier:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __127__SBRoutingSwitcherModifier_adjustedContinuousExposeIdentifiersInSwitcherFromPreviousIdentifiersInSwitcher_identifiersInStrip___block_invoke;
  v15[3] = &unk_1E8EA9150;
  v19 = &v20;
  v10 = v9;
  v16 = v10;
  v11 = v6;
  v17 = v11;
  v12 = v7;
  v18 = v12;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v10, v15);
  v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v13;
}

void __127__SBRoutingSwitcherModifier_adjustedContinuousExposeIdentifiersInSwitcherFromPreviousIdentifiersInSwitcher_identifiersInStrip___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "adjustedContinuousExposeIdentifiersInSwitcherFromPreviousIdentifiersInSwitcher:identifiersInStrip:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__28;
  v19 = __Block_byref_object_dispose__28;
  v20 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  objc_msgSend(WeakRetained, "scrollModifierForRoutingModifier:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __102__SBRoutingSwitcherModifier_adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip___block_invoke;
  v11[3] = &unk_1E8E9FD30;
  v14 = &v15;
  v7 = v6;
  v12 = v7;
  v8 = v4;
  v13 = v8;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v7, v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __102__SBRoutingSwitcherModifier_adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (double)snapshotScaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  id v7;
  double v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  int64_t v13;
  uint64_t v14;
  double *v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a4;
  v14 = 0;
  v15 = (double *)&v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__SBRoutingSwitcherModifier_snapshotScaleForLayoutRole_inAppLayout___block_invoke;
  v10[3] = &unk_1E8EA8F20;
  v12 = &v14;
  v13 = a3;
  v7 = v6;
  v11 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v10);
  v8 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

uint64_t __68__SBRoutingSwitcherModifier_snapshotScaleForLayoutRole_inAppLayout___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t result;
  uint64_t v4;

  result = objc_msgSend(a2, "snapshotScaleForLayoutRole:inAppLayout:", a1[6], a1[4]);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v4;
  return result;
}

- (double)contentPageViewScaleForAppLayout:(id)a3 withScale:(double)a4
{
  id v6;
  id v7;
  double v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  double v13;
  uint64_t v14;
  double *v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a3;
  v14 = 0;
  v15 = (double *)&v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__SBRoutingSwitcherModifier_contentPageViewScaleForAppLayout_withScale___block_invoke;
  v10[3] = &unk_1E8EA8F20;
  v12 = &v14;
  v7 = v6;
  v11 = v7;
  v13 = a4;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v10);
  v8 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

uint64_t __72__SBRoutingSwitcherModifier_contentPageViewScaleForAppLayout_withScale___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;

  result = objc_msgSend(a2, "contentPageViewScaleForAppLayout:withScale:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;
  return result;
}

- (id)scrollViewAttributes
{
  id WeakRetained;
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__28;
  v12 = __Block_byref_object_dispose__28;
  v13 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  objc_msgSend(WeakRetained, "scrollModifierForRoutingModifier:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__SBRoutingSwitcherModifier_scrollViewAttributes__block_invoke;
  v7[3] = &unk_1E8E9DFA0;
  v7[4] = self;
  v7[5] = &v8;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __49__SBRoutingSwitcherModifier_scrollViewAttributes__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
  objc_msgSend(WeakRetained, "scrollModifierForRoutingModifier:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scrollViewAttributes");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (double)minimumTranslationToKillIndex:(unint64_t)a3
{
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__SBRoutingSwitcherModifier_minimumTranslationToKillIndex___block_invoke;
  v5[3] = &unk_1E8EA8F98;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __59__SBRoutingSwitcherModifier_minimumTranslationToKillIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;

  result = objc_msgSend(a2, "minimumTranslationToKillIndex:");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
  return result;
}

- (BOOL)isFocusEnabledForAppLayout:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__SBRoutingSwitcherModifier_isFocusEnabledForAppLayout___block_invoke;
  v7[3] = &unk_1E8EA8F48;
  v9 = &v10;
  v5 = v4;
  v8 = v5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v5, v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __56__SBRoutingSwitcherModifier_isFocusEnabledForAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isFocusEnabledForAppLayout:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)neighboringAppLayoutsForFocusedAppLayout:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__28;
  v15 = __Block_byref_object_dispose__28;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__SBRoutingSwitcherModifier_neighboringAppLayoutsForFocusedAppLayout___block_invoke;
  v8[3] = &unk_1E8EA8F48;
  v10 = &v11;
  v5 = v4;
  v9 = v5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v5, v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __70__SBRoutingSwitcherModifier_neighboringAppLayoutsForFocusedAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "neighboringAppLayoutsForFocusedAppLayout:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (CGPoint)contentOffsetForIndex:(unint64_t)a3 alignment:(int64_t)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  _QWORD v8[6];
  uint64_t v9;
  double *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  CGPoint result;

  v9 = 0;
  v10 = (double *)&v9;
  v11 = 0x3010000000;
  v13 = 0;
  v14 = 0;
  v12 = &unk_1D0FA064E;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__SBRoutingSwitcherModifier_contentOffsetForIndex_alignment___block_invoke;
  v8[3] = &unk_1E8EA9010;
  v8[4] = &v9;
  v8[5] = a4;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v8);
  v4 = v10[4];
  v5 = v10[5];
  _Block_object_dispose(&v9, 8);
  v6 = v4;
  v7 = v5;
  result.y = v7;
  result.x = v6;
  return result;
}

uint64_t __61__SBRoutingSwitcherModifier_contentOffsetForIndex_alignment___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(a2, "contentOffsetForIndex:alignment:", a3, *(_QWORD *)(a1 + 40));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_QWORD *)(v5 + 32) = v6;
  *(_QWORD *)(v5 + 40) = v7;
  return result;
}

- (CGPoint)restingOffsetForScrollOffset:(CGPoint)a3 velocity:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  CGFloat v6;
  CGFloat v7;
  id WeakRetained;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  uint64_t v23;
  double *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  v23 = 0;
  v24 = (double *)&v23;
  v25 = 0x3010000000;
  v27 = 0;
  v28 = 0;
  v26 = &unk_1D0FA064E;
  WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  objc_msgSend(WeakRetained, "scrollModifierForRoutingModifier:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __67__SBRoutingSwitcherModifier_restingOffsetForScrollOffset_velocity___block_invoke;
  v16[3] = &unk_1E8EA4FC0;
  v18 = &v23;
  v11 = v10;
  v17 = v11;
  v19 = v7;
  v20 = v6;
  v21 = x;
  v22 = y;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v11, v16);
  v12 = v24[4];
  v13 = v24[5];

  _Block_object_dispose(&v23, 8);
  v14 = v12;
  v15 = v13;
  result.y = v15;
  result.x = v14;
  return result;
}

uint64_t __67__SBRoutingSwitcherModifier_restingOffsetForScrollOffset_velocity___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  result = objc_msgSend(*(id *)(a1 + 32), "restingOffsetForScrollOffset:velocity:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 40) = v5;
  return result;
}

- (double)distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch:(unint64_t)a3
{
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __117__SBRoutingSwitcherModifier_distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch___block_invoke;
  v5[3] = &unk_1E8EA8F98;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __117__SBRoutingSwitcherModifier_distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;

  result = objc_msgSend(a2, "distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch:");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
  return result;
}

- (CGPoint)adjustedOffsetForOffset:(CGPoint)a3 translation:(CGPoint)a4 startPoint:(CGPoint)a5 locationInView:(CGPoint)a6 horizontalVelocity:(double *)a7 verticalVelocity:(double *)a8
{
  CGFloat y;
  CGFloat x;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  id WeakRetained;
  void *v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  _QWORD v26[4];
  id v27;
  uint64_t *v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  double *v37;
  double *v38;
  uint64_t v39;
  double *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  CGPoint result;

  y = a6.y;
  x = a6.x;
  v12 = a5.y;
  v13 = a5.x;
  v14 = a4.y;
  v15 = a4.x;
  v16 = a3.y;
  v17 = a3.x;
  v39 = 0;
  v40 = (double *)&v39;
  v41 = 0x3010000000;
  v43 = 0;
  v44 = 0;
  v42 = &unk_1D0FA064E;
  WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  objc_msgSend(WeakRetained, "scrollModifierForRoutingModifier:", self);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __127__SBRoutingSwitcherModifier_adjustedOffsetForOffset_translation_startPoint_locationInView_horizontalVelocity_verticalVelocity___block_invoke;
  v26[3] = &unk_1E8EA9178;
  v28 = &v39;
  v21 = v20;
  v27 = v21;
  v29 = v17;
  v30 = v16;
  v31 = v15;
  v32 = v14;
  v33 = v13;
  v34 = v12;
  v35 = x;
  v36 = y;
  v37 = a7;
  v38 = a8;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v21, v26);
  v22 = v40[4];
  v23 = v40[5];

  _Block_object_dispose(&v39, 8);
  v24 = v22;
  v25 = v23;
  result.y = v25;
  result.x = v24;
  return result;
}

uint64_t __127__SBRoutingSwitcherModifier_adjustedOffsetForOffset_translation_startPoint_locationInView_horizontalVelocity_verticalVelocity___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  result = objc_msgSend(*(id *)(a1 + 32), "adjustedOffsetForOffset:translation:startPoint:locationInView:horizontalVelocity:verticalVelocity:", *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 40) = v5;
  return result;
}

- (void)resetAdjustedScrollingState
{
  id WeakRetained;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  objc_msgSend(WeakRetained, "scrollModifierForRoutingModifier:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__SBRoutingSwitcherModifier_resetAdjustedScrollingState__block_invoke;
  v6[3] = &unk_1E8E9DED8;
  v7 = v4;
  v5 = v4;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v5, v6);

}

uint64_t __56__SBRoutingSwitcherModifier_resetAdjustedScrollingState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resetAdjustedScrollingState");
}

- (BOOL)wantsSlideOverTongue
{
  char v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  unsigned int v9;
  NSArray *obj;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = self->_modifiers;
  v3 = 0;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v13 = 0;
        v14 = &v13;
        v15 = 0x2020000000;
        v16 = 0;
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __49__SBRoutingSwitcherModifier_wantsSlideOverTongue__block_invoke;
        v12[3] = &unk_1E8E9DFA0;
        v12[4] = v8;
        v12[5] = &v13;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v12);
        v9 = *((unsigned __int8 *)v14 + 24);
        _Block_object_dispose(&v13, 8);
        if ((v5 & 1) != 0)
          v3 |= v9 > (v3 & 1u);
        else
          v3 = v9 != 0;
        v5 = 1;
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }

  return v3 & 1;
}

uint64_t __49__SBRoutingSwitcherModifier_wantsSlideOverTongue__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "wantsSlideOverTongue");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)slideOverTongueState
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  _QWORD v11[6];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_modifiers;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v13;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
        v11[0] = v6;
        v11[1] = 3221225472;
        v11[2] = __49__SBRoutingSwitcherModifier_slideOverTongueState__block_invoke;
        v11[3] = &unk_1E8E9DFA0;
        v11[4] = v8;
        v11[5] = &v16;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v11);
        ++v7;
      }
      while (v4 != v7);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
    }
    while (v4);
  }

  v9 = v17[3];
  _Block_object_dispose(&v16, 8);
  return v9;
}

unint64_t __49__SBRoutingSwitcherModifier_slideOverTongueState__block_invoke(uint64_t a1)
{
  unint64_t v2;
  unint64_t result;
  unint64_t v4;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  result = objc_msgSend(*(id *)(a1 + 32), "slideOverTongueState");
  if (v2 <= result)
    v4 = result;
  else
    v4 = v2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;
  return result;
}

- (unint64_t)slideOverTongueDirection
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  _QWORD v11[6];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_modifiers;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v13;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
        v11[0] = v6;
        v11[1] = 3221225472;
        v11[2] = __53__SBRoutingSwitcherModifier_slideOverTongueDirection__block_invoke;
        v11[3] = &unk_1E8E9DFA0;
        v11[4] = v8;
        v11[5] = &v16;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v11);
        ++v7;
      }
      while (v4 != v7);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
    }
    while (v4);
  }

  v9 = v17[3];
  _Block_object_dispose(&v16, 8);
  return v9;
}

unint64_t __53__SBRoutingSwitcherModifier_slideOverTongueDirection__block_invoke(uint64_t a1)
{
  unint64_t v2;
  unint64_t result;
  unint64_t v4;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  result = objc_msgSend(*(id *)(a1 + 32), "slideOverTongueDirection");
  if (v2 <= result)
    v4 = result;
  else
    v4 = v2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;
  return result;
}

- (id)appLayoutToAttachSlideOverTongue
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[6];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__28;
  v20 = __Block_byref_object_dispose__28;
  v21 = 0;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_modifiers;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v22, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v13;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
        v11[0] = v6;
        v11[1] = 3221225472;
        v11[2] = __61__SBRoutingSwitcherModifier_appLayoutToAttachSlideOverTongue__block_invoke;
        v11[3] = &unk_1E8E9DFA0;
        v11[4] = v8;
        v11[5] = &v16;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v11);
        ++v7;
      }
      while (v4 != v7);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v22, 16);
    }
    while (v4);
  }

  v9 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v9;
}

void __61__SBRoutingSwitcherModifier_appLayoutToAttachSlideOverTongue__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "appLayoutToAttachSlideOverTongue");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (BOOL)wantsBezelEffectsLayoutElement
{
  char v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  unsigned int v9;
  NSArray *obj;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = self->_modifiers;
  v3 = 0;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v13 = 0;
        v14 = &v13;
        v15 = 0x2020000000;
        v16 = 0;
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __59__SBRoutingSwitcherModifier_wantsBezelEffectsLayoutElement__block_invoke;
        v12[3] = &unk_1E8E9DFA0;
        v12[4] = v8;
        v12[5] = &v13;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v12);
        v9 = *((unsigned __int8 *)v14 + 24);
        _Block_object_dispose(&v13, 8);
        if ((v5 & 1) != 0)
          v3 |= v9 > (v3 & 1u);
        else
          v3 = v9 != 0;
        v5 = 1;
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }

  return v3 & 1;
}

uint64_t __59__SBRoutingSwitcherModifier_wantsBezelEffectsLayoutElement__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "wantsBezelEffectsLayoutElement");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)foregroundAppLayouts
{
  void *v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSArray *obj;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = self->_modifiers;
  v3 = 0;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      v8 = v3;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v7);
        v15 = 0;
        v16 = &v15;
        v17 = 0x3032000000;
        v18 = __Block_byref_object_copy__28;
        v19 = __Block_byref_object_dispose__28;
        v20 = 0;
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __49__SBRoutingSwitcherModifier_foregroundAppLayouts__block_invoke;
        v14[3] = &unk_1E8E9DFA0;
        v14[4] = v9;
        v14[5] = &v15;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v9, v14);
        v10 = (id)v16[5];
        _Block_object_dispose(&v15, 8);

        if ((v5 & 1) != 0)
        {
          _setByCombiningSets(v8, v10);
          v11 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = v10;
        }
        v3 = v11;

        ++v7;
        v5 = 1;
        v8 = v3;
      }
      while (v4 != v7);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v4);
  }

  return v3;
}

void __49__SBRoutingSwitcherModifier_foregroundAppLayouts__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "foregroundAppLayouts");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (char)jetsamModeForAppLayout:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__SBRoutingSwitcherModifier_jetsamModeForAppLayout___block_invoke;
  v7[3] = &unk_1E8EA8F48;
  v9 = &v10;
  v5 = v4;
  v8 = v5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v5, v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __52__SBRoutingSwitcherModifier_jetsamModeForAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "jetsamModeForAppLayout:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (char)activityModeForAppLayout:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__SBRoutingSwitcherModifier_activityModeForAppLayout___block_invoke;
  v7[3] = &unk_1E8EA8F48;
  v9 = &v10;
  v5 = v4;
  v8 = v5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v5, v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __54__SBRoutingSwitcherModifier_activityModeForAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "activityModeForAppLayout:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)bounceIconGenerationCountForCurrentCount:(unint64_t)a3
{
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  _QWORD v13[7];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  unint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_modifiers;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v13[0] = v8;
        v13[1] = 3221225472;
        v13[2] = __70__SBRoutingSwitcherModifier_bounceIconGenerationCountForCurrentCount___block_invoke;
        v13[3] = &unk_1E8E9FD08;
        v13[4] = v10;
        v13[5] = &v18;
        v13[6] = a3;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v10, v13);
        ++v9;
      }
      while (v6 != v9);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v6);
  }

  v11 = v19[3];
  _Block_object_dispose(&v18, 8);
  return v11;
}

unint64_t __70__SBRoutingSwitcherModifier_bounceIconGenerationCountForCurrentCount___block_invoke(uint64_t a1)
{
  unint64_t v2;
  unint64_t result;
  unint64_t v4;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  result = objc_msgSend(*(id *)(a1 + 32), "bounceIconGenerationCountForCurrentCount:", *(_QWORD *)(a1 + 48));
  if (v2 <= result)
    v4 = result;
  else
    v4 = v2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;
  return result;
}

- (id)bounceIconBundleIdentifier
{
  id v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSArray *obj;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = self->_modifiers;
  v3 = 0;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      v8 = v3;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v7);
        v15 = 0;
        v16 = &v15;
        v17 = 0x3032000000;
        v18 = __Block_byref_object_copy__28;
        v19 = __Block_byref_object_dispose__28;
        v20 = 0;
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __55__SBRoutingSwitcherModifier_bounceIconBundleIdentifier__block_invoke;
        v14[3] = &unk_1E8E9DFA0;
        v14[4] = v9;
        v14[5] = &v15;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v9, v14);
        v10 = (id)v16[5];
        _Block_object_dispose(&v15, 8);

        if (v8)
          v11 = v8;
        else
          v11 = v10;
        if ((v5 & 1) == 0)
          v11 = v10;
        v3 = v11;

        ++v7;
        v5 = 1;
        v8 = v3;
      }
      while (v4 != v7);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v4);
  }

  return v3;
}

void __55__SBRoutingSwitcherModifier_bounceIconBundleIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "bounceIconBundleIdentifier");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (CGRect)bounceIconInitialFrame
{
  NSArray *v3;
  uint64_t v4;
  double x;
  double y;
  double width;
  double height;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BOOL4 IsNull;
  double v13;
  double v14;
  double v15;
  double v16;
  _QWORD v17[6];
  uint64_t v18;
  CGRect *v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;
  CGRect result;

  v29 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v3 = self->_modifiers;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  if (v4)
  {
    v9 = *(_QWORD *)v25;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v9)
        objc_enumerationMutation(v3);
      v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v10);
      v18 = 0;
      v19 = (CGRect *)&v18;
      v20 = 0x4010000000;
      v21 = &unk_1D0FA064E;
      v22 = 0u;
      v23 = 0u;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __51__SBRoutingSwitcherModifier_bounceIconInitialFrame__block_invoke;
      v17[3] = &unk_1E8E9DFA0;
      v17[4] = v11;
      v17[5] = &v18;
      _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v11, v17);
      IsNull = CGRectIsNull(v19[1]);
      if (!IsNull)
      {
        x = v19[1].origin.x;
        y = v19[1].origin.y;
        width = v19[1].size.width;
        height = v19[1].size.height;
      }
      _Block_object_dispose(&v18, 8);
      if (!IsNull)
        break;
      if (v4 == ++v10)
      {
        v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v4)
          goto LABEL_3;
        break;
      }
    }
  }

  v13 = x;
  v14 = y;
  v15 = width;
  v16 = height;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

uint64_t __51__SBRoutingSwitcherModifier_bounceIconInitialFrame__block_invoke(uint64_t a1)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(*(id *)(a1 + 32), "bounceIconInitialFrame");
  v3 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (BOOL)shouldAccessoryDrawShadowForAppLayout:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__SBRoutingSwitcherModifier_shouldAccessoryDrawShadowForAppLayout___block_invoke;
  v7[3] = &unk_1E8EA8F48;
  v9 = &v10;
  v5 = v4;
  v8 = v5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v5, v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __67__SBRoutingSwitcherModifier_shouldAccessoryDrawShadowForAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "shouldAccessoryDrawShadowForAppLayout:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)shouldTetherItemsAndAccessoriesInAppLayout:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__SBRoutingSwitcherModifier_shouldTetherItemsAndAccessoriesInAppLayout___block_invoke;
  v7[3] = &unk_1E8EA8F48;
  v9 = &v10;
  v5 = v4;
  v8 = v5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v5, v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __72__SBRoutingSwitcherModifier_shouldTetherItemsAndAccessoriesInAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "shouldTetherItemsAndAccessoriesInAppLayout:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (CGPoint)contentViewOffsetForAccessoriesOfAppLayout:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  double *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  CGPoint result;

  v4 = a3;
  v13 = 0;
  v14 = (double *)&v13;
  v15 = 0x3010000000;
  v18 = 0;
  v16 = &unk_1D0FA064E;
  v17 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__SBRoutingSwitcherModifier_contentViewOffsetForAccessoriesOfAppLayout___block_invoke;
  v10[3] = &unk_1E8EA8F48;
  v12 = &v13;
  v5 = v4;
  v11 = v5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v5, v10);
  v6 = v14[4];
  v7 = v14[5];

  _Block_object_dispose(&v13, 8);
  v8 = v6;
  v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

uint64_t __72__SBRoutingSwitcherModifier_contentViewOffsetForAccessoriesOfAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  result = objc_msgSend(a2, "contentViewOffsetForAccessoriesOfAppLayout:", *(_QWORD *)(a1 + 32));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v4 + 32) = v5;
  *(_QWORD *)(v4 + 40) = v6;
  return result;
}

- (CGPoint)contentViewOffsetForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  int64_t v15;
  uint64_t v16;
  double *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  CGPoint result;

  v6 = a4;
  v16 = 0;
  v17 = (double *)&v16;
  v18 = 0x3010000000;
  v20 = 0;
  v21 = 0;
  v19 = &unk_1D0FA064E;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72__SBRoutingSwitcherModifier_contentViewOffsetForLayoutRole_inAppLayout___block_invoke;
  v12[3] = &unk_1E8EA8F20;
  v14 = &v16;
  v15 = a3;
  v7 = v6;
  v13 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v12);
  v8 = v17[4];
  v9 = v17[5];

  _Block_object_dispose(&v16, 8);
  v10 = v8;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

uint64_t __72__SBRoutingSwitcherModifier_contentViewOffsetForLayoutRole_inAppLayout___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  result = objc_msgSend(a2, "contentViewOffsetForLayoutRole:inAppLayout:", a1[6], a1[4]);
  v4 = *(_QWORD *)(a1[5] + 8);
  *(_QWORD *)(v4 + 32) = v5;
  *(_QWORD *)(v4 + 40) = v6;
  return result;
}

- (SBSwitcherContinuousExposeStripTongueAttributes)continuousExposeStripTongueAttributes
{
  id WeakRetained;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  SBSwitcherContinuousExposeStripTongueAttributes result;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3010000000;
  v14 = 0;
  v15 = 0;
  v13 = &unk_1D0FA064E;
  WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  objc_msgSend(WeakRetained, "homeScreenModifierForRoutingModifier:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__SBRoutingSwitcherModifier_continuousExposeStripTongueAttributes__block_invoke;
  v9[3] = &unk_1E8E9DFA0;
  v9[4] = self;
  v9[5] = &v10;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v4, v9);

  v5 = v11[4];
  v6 = v11[5];
  _Block_object_dispose(&v10, 8);
  v7 = v5;
  v8 = v6;
  result.direction = v8;
  result.state = v7;
  return result;
}

void __66__SBRoutingSwitcherModifier_continuousExposeStripTongueAttributes__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
  objc_msgSend(WeakRetained, "homeScreenModifierForRoutingModifier:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "continuousExposeStripTongueAttributes");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v4 + 32) = v3;
  *(_QWORD *)(v4 + 40) = v5;

}

- (BOOL)wantsContinuousExposeHoverGesture
{
  char v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  unsigned int v9;
  NSArray *obj;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = self->_modifiers;
  v3 = 0;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v13 = 0;
        v14 = &v13;
        v15 = 0x2020000000;
        v16 = 0;
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __62__SBRoutingSwitcherModifier_wantsContinuousExposeHoverGesture__block_invoke;
        v12[3] = &unk_1E8E9DFA0;
        v12[4] = v8;
        v12[5] = &v13;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v12);
        v9 = *((unsigned __int8 *)v14 + 24);
        _Block_object_dispose(&v13, 8);
        if ((v5 & 1) != 0)
          v3 |= v9 > (v3 & 1u);
        else
          v3 = v9 != 0;
        v5 = 1;
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }

  return v3 & 1;
}

uint64_t __62__SBRoutingSwitcherModifier_wantsContinuousExposeHoverGesture__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "wantsContinuousExposeHoverGesture");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isContinuousExposeStripVisible
{
  char v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  unsigned int v9;
  NSArray *obj;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = self->_modifiers;
  v3 = 0;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v13 = 0;
        v14 = &v13;
        v15 = 0x2020000000;
        v16 = 0;
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __59__SBRoutingSwitcherModifier_isContinuousExposeStripVisible__block_invoke;
        v12[3] = &unk_1E8E9DFA0;
        v12[4] = v8;
        v12[5] = &v13;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v12);
        v9 = *((unsigned __int8 *)v14 + 24);
        _Block_object_dispose(&v13, 8);
        if ((v5 & 1) != 0)
          v3 |= v9 > (v3 & 1u);
        else
          v3 = v9 != 0;
        v5 = 1;
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }

  return v3 & 1;
}

uint64_t __59__SBRoutingSwitcherModifier_isContinuousExposeStripVisible__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isContinuousExposeStripVisible");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)proposedAppLayoutForWindowDrag
{
  id v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSArray *obj;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = self->_modifiers;
  v3 = 0;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      v8 = v3;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v7);
        v15 = 0;
        v16 = &v15;
        v17 = 0x3032000000;
        v18 = __Block_byref_object_copy__28;
        v19 = __Block_byref_object_dispose__28;
        v20 = 0;
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __59__SBRoutingSwitcherModifier_proposedAppLayoutForWindowDrag__block_invoke;
        v14[3] = &unk_1E8E9DFA0;
        v14[4] = v9;
        v14[5] = &v15;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v9, v14);
        v10 = (id)v16[5];
        _Block_object_dispose(&v15, 8);

        if (v8)
          v11 = v8;
        else
          v11 = v10;
        if ((v5 & 1) == 0)
          v11 = v10;
        v3 = v11;

        ++v7;
        v5 = 1;
        v8 = v3;
      }
      while (v4 != v7);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v4);
  }

  return v3;
}

void __59__SBRoutingSwitcherModifier_proposedAppLayoutForWindowDrag__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "proposedAppLayoutForWindowDrag");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (unint64_t)_lastIndexForModifier:(id)a3
{
  NSMapTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSMapTable *lastIndexForModifier_indexCapsForModifiers;
  void *v13;
  unint64_t v14;
  id v16;
  id v17;
  NSArray *obj;
  void *v19;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v32.receiver = self;
  v32.super_class = (Class)SBRoutingSwitcherModifier;
  v16 = -[SBRoutingSwitcherModifier appLayoutsGenerationCount](&v32, sel_appLayoutsGenerationCount);
  if (v16 != (id)self->_lastIndexForModifier_GenCount)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v4 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v31.receiver = self;
    v31.super_class = (Class)SBRoutingSwitcherModifier;
    -[SBRoutingSwitcherModifier appLayouts](&v31, sel_appLayouts);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = self->_modifiers;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v28 != v6)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          v21 = 0;
          v22 = &v21;
          v23 = 0x3032000000;
          v24 = __Block_byref_object_copy__28;
          v25 = __Block_byref_object_dispose__28;
          v26 = 0;
          v20[0] = MEMORY[0x1E0C809B0];
          v20[1] = 3221225472;
          v20[2] = __51__SBRoutingSwitcherModifier__lastIndexForModifier___block_invoke;
          v20[3] = &unk_1E8E9DFA0;
          v20[4] = v8;
          v20[5] = &v21;
          _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v20);
          objc_msgSend((id)v22[5], "lastObject");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
            v10 = objc_msgSend(v19, "indexOfObject:", v9);
          else
            v10 = 0x7FFFFFFFFFFFFFFFLL;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMapTable setObject:forKey:](v4, "setObject:forKey:", v11, v8);

          _Block_object_dispose(&v21, 8);
        }
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
      }
      while (v5);
    }

    lastIndexForModifier_indexCapsForModifiers = self->_lastIndexForModifier_indexCapsForModifiers;
    self->_lastIndexForModifier_indexCapsForModifiers = v4;

    self->_lastIndexForModifier_GenCount = (unint64_t)v16;
  }
  -[NSMapTable objectForKey:](self->_lastIndexForModifier_indexCapsForModifiers, "objectForKey:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "unsignedIntegerValue");

  return v14;
}

void __51__SBRoutingSwitcherModifier__lastIndexForModifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "appLayouts");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSArray)modifiers
{
  return self->_modifiers;
}

- (SBRoutingSwitcherModifierDelegate)routingDelegate
{
  return (SBRoutingSwitcherModifierDelegate *)objc_loadWeakRetained((id *)&self->_routingDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_routingDelegate);
  objc_storeStrong((id *)&self->_modifiers, 0);
  objc_storeStrong((id *)&self->_lastIndexForModifier_indexCapsForModifiers, 0);
  objc_storeStrong((id *)&self->_appLayouts_appLayoutsForModifiers, 0);
  objc_storeStrong((id *)&self->_currentModifier, 0);
}

@end
