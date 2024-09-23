@implementation UIInterfaceActionGroup

+ (BOOL)changedProperties:(id)a3 containsAny:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v7);
          if ((objc_msgSend(v5, "containsObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12) & 1) != 0)
          {
            LOBYTE(v8) = 1;
            goto LABEL_12;
          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    LOBYTE(v8) = 1;
  }

  return v8;
}

+ (id)actionGroupWithActions:(id)a3
{
  id v4;
  id v5;
  UIInterfaceActionSection *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v6 = -[UIInterfaceActionSection initWithActions:]([UIInterfaceActionSection alloc], "initWithActions:", v4);

  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithTitle:actionsBySection:", &stru_1E16EDF20, v7);

  return v8;
}

+ (id)actionGroupWithActionsBySection:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:actionsBySection:", &stru_1E16EDF20, v4);

  return v5;
}

- (UIInterfaceActionGroup)initWithTitle:(id)a3 actionsBySection:(id)a4
{
  id v7;
  id v8;
  UIInterfaceActionGroup *v9;
  UIInterfaceActionGroup *v10;
  uint64_t v11;
  NSArray *actions;
  uint64_t v13;
  NSPointerArray *weakDisplayPropertyObservers;
  CGSize v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)UIInterfaceActionGroup;
  v9 = -[UIInterfaceActionGroup init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    +[UIInterfaceActionSection actionsFromSections:](UIInterfaceActionSection, "actionsFromSections:", v8);
    v11 = objc_claimAutoreleasedReturnValue();
    actions = v10->_actions;
    v10->_actions = (NSArray *)v11;

    objc_storeStrong((id *)&v10->_actionsBySection, a4);
    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v13 = objc_claimAutoreleasedReturnValue();
    weakDisplayPropertyObservers = v10->_weakDisplayPropertyObservers;
    v10->_weakDisplayPropertyObservers = (NSPointerArray *)v13;

    v15 = (CGSize)*MEMORY[0x1E0C9D820];
    v10->_leadingImageLayoutSize = (CGSize)*MEMORY[0x1E0C9D820];
    v10->_trailingImageLayoutSize = v15;
    -[UIInterfaceActionGroup _beginObservingActions](v10, "_beginObservingActions");
    -[UIInterfaceActionGroup _reloadImageLayoutSizesUsingExistingActionImages](v10, "_reloadImageLayoutSizesUsingExistingActionImages");
  }

  return v10;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *actions;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSString length](self->_title, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'%@'"), self->_title);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
  v5 = (void *)MEMORY[0x1E0CB3940];
  if (-[NSArray count](self->_actions, "count"))
    actions = self->_actions;
  else
    actions = (NSArray *)CFSTR("()");
  objc_msgSend(v5, "stringWithFormat:", CFSTR("actions = %@"), actions);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)UIInterfaceActionGroup;
  -[UIInterfaceActionGroup description](&v13, sel_description);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ %@"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[UIInterfaceActionGroup title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInterfaceActionGroup _deepCopyOfActionsBySection](self, "_deepCopyOfActionsBySection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "initWithTitle:actionsBySection:", v5, v6);

  *(CGSize *)(v7 + 56) = self->_leadingImageLayoutSize;
  *(CGSize *)(v7 + 72) = self->_trailingImageLayoutSize;
  objc_storeStrong((id *)(v7 + 16), self->_preferredAction);
  return (id)v7;
}

- (void)setLeadingImageLayoutSize:(CGSize)a3
{
  if (self->_leadingImageLayoutSize.width != a3.width || self->_leadingImageLayoutSize.height != a3.height)
  {
    self->_leadingImageLayoutSize = a3;
    -[UIInterfaceActionGroup _updateActionImageLayoutSizes](self, "_updateActionImageLayoutSizes");
  }
}

- (void)setTrailingImageLayoutSize:(CGSize)a3
{
  if (self->_trailingImageLayoutSize.width != a3.width || self->_trailingImageLayoutSize.height != a3.height)
  {
    self->_trailingImageLayoutSize = a3;
    -[UIInterfaceActionGroup _updateActionImageLayoutSizes](self, "_updateActionImageLayoutSizes");
  }
}

- (void)setPreferredAction:(id)a3
{
  id v5;
  _QWORD v6[5];

  v5 = a3;
  if ((-[UIInterfaceAction isEqual:](self->_preferredAction, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_preferredAction, a3);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __45__UIInterfaceActionGroup_setPreferredAction___block_invoke;
    v6[3] = &unk_1E16B1B28;
    v6[4] = self;
    -[UIInterfaceActionGroup _performWithActionObservingDisabled:](self, "_performWithActionObservingDisabled:", v6);
  }

}

uint64_t __45__UIInterfaceActionGroup_setPreferredAction___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "actions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__UIInterfaceActionGroup_setPreferredAction___block_invoke_2;
  v4[3] = &unk_1E16B1F28;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v4);

  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserversDidChangeActionProperty:", CFSTR("preferredAction"));
}

void __45__UIInterfaceActionGroup_setPreferredAction___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v3 = a2;
  objc_msgSend(v3, "_setIsPreferred:", objc_msgSend(v3, "isEqual:", v2));

}

- (void)_setVisualStyle:(id)a3
{
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!-[UIInterfaceActionVisualStyle isEqual:](self->_visualStyle, "isEqual:", v5))
  {
    objc_storeStrong((id *)&self->_visualStyle, a3);
    -[UIInterfaceActionGroup _notifyObserversVisualStyleDidChange](self, "_notifyObserversVisualStyleDidChange");
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_actions;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "_setVisualStyle:", v5, (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)_addActionGroupDisplayPropertyObserver:(id)a3
{
  NSPointerArray *weakDisplayPropertyObservers;
  id v5;

  weakDisplayPropertyObservers = self->_weakDisplayPropertyObservers;
  v5 = a3;
  -[NSPointerArray compact](weakDisplayPropertyObservers, "compact");
  -[NSPointerArray addPointer:](self->_weakDisplayPropertyObservers, "addPointer:", v5);

}

- (void)_removeActionGroupDisplayPropertyObserver:(id)a3
{
  NSPointerArray *weakDisplayPropertyObservers;
  id v5;
  void *v6;
  uint64_t v7;

  weakDisplayPropertyObservers = self->_weakDisplayPropertyObservers;
  v5 = a3;
  -[NSPointerArray compact](weakDisplayPropertyObservers, "compact");
  -[NSPointerArray allObjects](self->_weakDisplayPropertyObservers, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObject:", v5);

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    -[NSPointerArray removePointerAtIndex:](self->_weakDisplayPropertyObservers, "removePointerAtIndex:", v7);
}

- (void)interfaceAction:(id)a3 reloadDisplayedContentActionProperties:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  _BOOL4 v11;
  _QWORD v12[2];
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v13[0] = 0x1E16EFBA0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[UIInterfaceAction changedProperties:containsAny:](UIInterfaceAction, "changedProperties:containsAny:", v7, v8);

  if (v9)
  {
    if (objc_msgSend(v6, "_isPreferred"))
      -[UIInterfaceActionGroup setPreferredAction:](self, "setPreferredAction:", v6);
  }
  else
  {
    v12[0] = 0x1E16EFC40;
    v12[1] = 0x1E16EFC80;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = +[UIInterfaceAction changedProperties:containsAny:](UIInterfaceAction, "changedProperties:containsAny:", v7, v10);

    if (v11)
      -[UIInterfaceActionGroup _reloadImageLayoutSizesUsingExistingActionImages](self, "_reloadImageLayoutSizesUsingExistingActionImages");
  }

}

- (void)_updateActionImageLayoutSizes
{
  NSArray *actions;
  _QWORD v3[5];

  actions = self->_actions;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__UIInterfaceActionGroup__updateActionImageLayoutSizes__block_invoke;
  v3[3] = &unk_1E16B1F28;
  v3[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](actions, "enumerateObjectsUsingBlock:", v3);
}

void __55__UIInterfaceActionGroup__updateActionImageLayoutSizes__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  double v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(double *)(v3 + 56);
  v5 = *(double *)(v3 + 64);
  v6 = a2;
  objc_msgSend(v6, "setLeadingImageLayoutSize:", v4, v5);
  objc_msgSend(v6, "setTrailingImageLayoutSize:", *(double *)(*(_QWORD *)(a1 + 32) + 72), *(double *)(*(_QWORD *)(a1 + 32) + 80));

}

- (void)_reloadImageLayoutSizesUsingExistingActionImages
{
  NSArray *actions;
  double v4;
  double v5;
  double *v6;
  double v7;
  double v8;
  double *v9;
  _QWORD v10[8];
  uint64_t v11;
  double *v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  double *v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__3;
  v31 = __Block_byref_object_dispose__3;
  v32 = 0;
  v22 = 0;
  v23 = (double *)&v22;
  v24 = 0x3010000000;
  v25 = &unk_18685B0AF;
  v26 = *MEMORY[0x1E0C9D820];
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__3;
  v20 = __Block_byref_object_dispose__3;
  v21 = 0;
  v11 = 0;
  v12 = (double *)&v11;
  v13 = 0x3010000000;
  v14 = &unk_18685B0AF;
  v15 = v26;
  actions = self->_actions;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__UIInterfaceActionGroup__reloadImageLayoutSizesUsingExistingActionImages__block_invoke;
  v10[3] = &unk_1E16B1F50;
  v10[4] = &v27;
  v10[5] = &v22;
  v10[6] = &v16;
  v10[7] = &v11;
  -[NSArray enumerateObjectsUsingBlock:](actions, "enumerateObjectsUsingBlock:", v10);
  objc_msgSend((id)v28[5], "size");
  self->_leadingImageLayoutSize.width = v4;
  self->_leadingImageLayoutSize.height = v5;
  v6 = v23;
  self->_leadingImageLayoutSize.width = v4 + v23[4];
  self->_leadingImageLayoutSize.height = v5 + v6[5];
  objc_msgSend((id)v17[5], "size");
  self->_trailingImageLayoutSize.width = v7;
  self->_trailingImageLayoutSize.height = v8;
  v9 = v12;
  self->_trailingImageLayoutSize.width = v7 + v12[4];
  self->_trailingImageLayoutSize.height = v8 + v9[5];
  -[UIInterfaceActionGroup _updateActionImageLayoutSizes](self, "_updateActionImageLayoutSizes");
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v27, 8);

}

void __74__UIInterfaceActionGroup__reloadImageLayoutSizesUsingExistingActionImages__block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  id v34;

  v6 = a2;
  v7 = *(_QWORD *)(a1[4] + 8);
  v8 = *(void **)(v7 + 40);
  v34 = v6;
  if (v8)
  {
    v9 = v8;
    v10 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v9;
  }
  else
  {
    objc_msgSend(v6, "leadingImage");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1[4] + 8);
    v10 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;
  }

  v13 = *(void **)(*(_QWORD *)(a1[4] + 8) + 40);
  if (v13)
  {
    objc_msgSend(v13, "alignmentRectInsets");
    v15 = v14;
    objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "alignmentRectInsets");
    *(double *)(*(_QWORD *)(a1[5] + 8) + 32) = -(v15 + v16);
    objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "alignmentRectInsets");
    v18 = v17;
    objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "alignmentRectInsets");
    *(double *)(*(_QWORD *)(a1[5] + 8) + 40) = -(v18 + v19);
  }
  v20 = *(_QWORD *)(a1[6] + 8);
  v21 = *(void **)(v20 + 40);
  if (v21)
  {
    v22 = v21;
    v23 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v22;
  }
  else
  {
    objc_msgSend(v34, "trailingImage");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = *(_QWORD *)(a1[6] + 8);
    v23 = *(void **)(v25 + 40);
    *(_QWORD *)(v25 + 40) = v24;
  }

  v26 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  if (v26)
  {
    objc_msgSend(v26, "alignmentRectInsets");
    v28 = v27;
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "alignmentRectInsets");
    *(double *)(*(_QWORD *)(a1[7] + 8) + 32) = -(v28 + v29);
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "alignmentRectInsets");
    v31 = v30;
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "alignmentRectInsets");
    *(double *)(*(_QWORD *)(a1[7] + 8) + 40) = -(v31 + v32);
  }
  v33 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40);
  if (v33)
    LOBYTE(v33) = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) != 0;
  *a4 = v33;

}

- (void)_notifyObserversVisualStyleDidChange
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[NSPointerArray compact](self->_weakDisplayPropertyObservers, "compact");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = (void *)-[NSPointerArray copy](self->_weakDisplayPropertyObservers, "copy", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "interfaceActionGroup:reloadDisplayedContentVisualStyle:", self, self->_visualStyle);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_notifyObserversDidChangeActionProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSPointerArray compact](self->_weakDisplayPropertyObservers, "compact");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = (void *)-[NSPointerArray copy](self->_weakDisplayPropertyObservers, "copy", 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "interfaceActionGroup:reloadDisplayedContentActionGroupProperties:", self, v5);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)_performWithActionObservingDisabled:(id)a3
{
  void (**v4)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  -[UIInterfaceActionGroup _endObservingActions](self, "_endObservingActions");
  v4[2](v4);

  -[UIInterfaceActionGroup _beginObservingActions](self, "_beginObservingActions");
}

- (void)_beginObservingActions
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_actions;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "_addActionDisplayPropertyObserver:", self, (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_endObservingActions
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_actions;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "_removeActionDisplayPropertyObserver:", self, (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (id)_deepCopyOfActionsBySection
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_actionsBySection;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "copy", (_QWORD)v11);
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (NSArray)actions
{
  return self->_actions;
}

- (UIInterfaceAction)preferredAction
{
  return self->_preferredAction;
}

- (NSPointerArray)weakDisplayPropertyObservers
{
  return self->_weakDisplayPropertyObservers;
}

- (NSString)title
{
  return self->_title;
}

- (NSArray)actionsBySection
{
  return self->_actionsBySection;
}

- (CGSize)leadingImageLayoutSize
{
  double width;
  double height;
  CGSize result;

  width = self->_leadingImageLayoutSize.width;
  height = self->_leadingImageLayoutSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)trailingImageLayoutSize
{
  double width;
  double height;
  CGSize result;

  width = self->_trailingImageLayoutSize.width;
  height = self->_trailingImageLayoutSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIInterfaceActionVisualStyle)_visualStyle
{
  return self->_visualStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualStyle, 0);
  objc_storeStrong((id *)&self->_actionsBySection, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_weakDisplayPropertyObservers, 0);
  objc_storeStrong((id *)&self->_preferredAction, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

@end
