@implementation NCSupplementaryViewPrototypeRecipeContentTintingViewController

+ (id)title
{
  return CFSTR("Color Configuration");
}

- (NCSupplementaryViewPrototypeRecipeContentTintingViewController)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NCSupplementaryViewPrototypeRecipeContentTintingViewController *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("color-config-%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[NCSupplementaryViewPrototypeRecipeContentTintingViewController _initWithGroupingIdentifier:stackSubordinate:](self, "_initWithGroupingIdentifier:stackSubordinate:", v6, 0);
  return v7;
}

- (id)_initWithGroupingIdentifier:(id)a3 stackSubordinate:(BOOL)a4
{
  id v6;
  NCSupplementaryViewPrototypeRecipeContentTintingViewController *v7;
  NCSupplementaryViewPrototypeRecipeContentTintingViewController *v8;
  _QWORD v10[4];
  id v11;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NCSupplementaryViewPrototypeRecipeContentTintingViewController;
  v7 = -[NCSupplementaryViewPrototypeRecipeViewController init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_stackSubordinate = a4;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __111__NCSupplementaryViewPrototypeRecipeContentTintingViewController__initWithGroupingIdentifier_stackSubordinate___block_invoke;
    v10[3] = &unk_1E8D1F1C8;
    v11 = v6;
    -[NCSupplementaryViewPrototypeRecipeViewController updateConfiguration:](v8, "updateConfiguration:", v10);

  }
  return v8;
}

void __111__NCSupplementaryViewPrototypeRecipeContentTintingViewController__initWithGroupingIdentifier_stackSubordinate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0DC3658];
  v7 = a2;
  objc_msgSend(v3, "blackColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorWithAlphaComponent:", 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTintColor:", v5);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v6);

  objc_msgSend(v7, "setGroupingIdentifier:", *(_QWORD *)(a1 + 32));
}

- (void)loadView
{
  UITableView *v3;
  UITableView *tableView;

  v3 = (UITableView *)objc_alloc_init(MEMORY[0x1E0DC3D48]);
  tableView = self->_tableView;
  self->_tableView = v3;

  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  -[UITableView setScrollEnabled:](self->_tableView, "setScrollEnabled:", 0);
  -[NCSupplementaryViewPrototypeRecipeContentTintingViewController setView:](self, "setView:", self->_tableView);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return self->_stackSubordinate ^ 3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  BOOL v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t);
  void *v39;
  id v40;
  id v41;
  BOOL v42;
  id location;
  CGRect v44;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "row") && objc_msgSend(v7, "row") != 1)
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("add-stack"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
      v15 = v13;
    else
      v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("add-stack"));
    v9 = v15;

    objc_msgSend(v9, "textLabel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setText:", CFSTR("Add stack"));

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v28);
  }
  else
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("color-well"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = v8;
      objc_msgSend(v8, "contentView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "subviews");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "removeTarget:action:forControlEvents:", 0, 0, 0xFFFFFFFFLL);
    }
    else
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("color-well"));
      v16 = objc_alloc(MEMORY[0x1E0DC3670]);
      objc_msgSend(v9, "contentView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "frame");
      v12 = (void *)objc_msgSend(v16, "initWithFrame:", CGRectGetMaxX(v44) + -50.0, 0.0, 50.0, 50.0);

      objc_msgSend(v9, "contentView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addSubview:", v12);

    }
    v19 = objc_msgSend(v7, "row");
    v20 = v19 == 0;
    v21 = CFSTR("Text Color");
    if (!v19)
      v21 = CFSTR("Tint Color");
    v22 = v21;
    objc_msgSend(v9, "textLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setText:", v22);

    objc_msgSend(v12, "setTitle:", v22);
    -[NCSupplementaryViewPrototypeRecipeViewController configuration](self, "configuration");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v19)
      objc_msgSend(v24, "textColor");
    else
      objc_msgSend(v24, "tintColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSelectedColor:", v26);

    objc_initWeak(&location, self);
    v27 = (void *)MEMORY[0x1E0DC3428];
    v36 = MEMORY[0x1E0C809B0];
    v37 = 3221225472;
    v38 = __98__NCSupplementaryViewPrototypeRecipeContentTintingViewController_tableView_cellForRowAtIndexPath___block_invoke;
    v39 = &unk_1E8D1C588;
    objc_copyWeak(&v41, &location);
    v28 = v12;
    v40 = v28;
    v42 = v20;
    objc_msgSend(v27, "actionWithTitle:image:identifier:handler:", v22, 0, 0, &v36);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addAction:forControlEvents:", v29, 4096, v36, v37, v38, v39);

    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);

  }
  objc_msgSend(v9, "setSelectionStyle:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v31);

  objc_msgSend(v9, "textLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCSupplementaryViewPrototypeRecipeViewController configuration](self, "configuration");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "textColor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setTextColor:", v34);

  return v9;
}

void __98__NCSupplementaryViewPrototypeRecipeContentTintingViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "selectedColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    NilColorIfTransparent(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (*(_BYTE *)(a1 + 48))
      objc_msgSend(v6, "_setTintColor:", v4);
    else
      objc_msgSend(v6, "_setTextColor:", v4);
    objc_msgSend(v6, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "notificationListBaseComponentDidSignificantUserInteraction:", v6);

    WeakRetained = v6;
  }

}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(a3, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("header"), a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D78]), "initWithReuseIdentifier:", CFSTR("header"));
  -[NSPointerArray unui_compact](self->_weakStackViewControllers, "unui_compact");
  objc_msgSend(v5, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = &stru_1E8D21F60;
  if (!self->_stackSubordinate && -[NSPointerArray count](self->_weakStackViewControllers, "count"))
    v8 = CFSTR(": Controls All Stack");
  objc_msgSend(v7, "stringWithFormat:", CFSTR("Color Configuration%@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v9);

  objc_msgSend(v5, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCSupplementaryViewPrototypeRecipeViewController configuration](self, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextColor:", v12);

  return v5;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0DC3658];
  v6 = a3;
  objc_msgSend(v5, "clearColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v7);

}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v4;
  void *v5;
  id v6;

  v4 = a4;
  if (objc_msgSend(v4, "row") == 2)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v5;
  NCSupplementaryViewPrototypeRecipeContentTintingViewController *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSPointerArray *weakStackViewControllers;
  NSPointerArray *v15;
  NSPointerArray *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  NCSupplementaryViewPrototypeRecipeContentTintingViewController *v20;

  if (objc_msgSend(a4, "row", a3) == 2)
  {
    v5 = 3;
    do
    {
      v6 = [NCSupplementaryViewPrototypeRecipeContentTintingViewController alloc];
      -[NCSupplementaryViewPrototypeRecipeViewController configuration](self, "configuration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "groupingIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[NCSupplementaryViewPrototypeRecipeContentTintingViewController _initWithGroupingIdentifier:stackSubordinate:](v6, "_initWithGroupingIdentifier:stackSubordinate:", v8, 1);

      -[NCSupplementaryViewPrototypeRecipeViewController delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCSupplementaryViewPrototypeRecipeViewController configuration](self, "configuration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "groupingIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __100__NCSupplementaryViewPrototypeRecipeContentTintingViewController_tableView_didSelectRowAtIndexPath___block_invoke;
      v18[3] = &unk_1E8D1F1F0;
      v13 = v12;
      v19 = v13;
      v20 = self;
      objc_msgSend(v9, "updateConfiguration:", v18);
      objc_msgSend(v9, "setDelegate:", v10);
      objc_msgSend(v10, "requestsInsertForPrototypeRecipeViewController:", v9);
      objc_msgSend(v10, "notificationListBaseComponentDidSignificantUserInteraction:", self);
      weakStackViewControllers = self->_weakStackViewControllers;
      if (weakStackViewControllers)
      {
        v15 = weakStackViewControllers;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
        v15 = (NSPointerArray *)objc_claimAutoreleasedReturnValue();
      }
      v16 = self->_weakStackViewControllers;
      self->_weakStackViewControllers = v15;

      -[NSPointerArray addPointer:](self->_weakStackViewControllers, "addPointer:", v9);
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCSupplementaryViewPrototypeRecipeViewController setDateModified:](self, "setDateModified:", v17);

      -[UITableView reloadData](self->_tableView, "reloadData");
      objc_msgSend(v10, "requestsUpdatePositionIfNeededForPrototypeRecipeViewController:", self);

      --v5;
    }
    while (v5);
  }
}

void __100__NCSupplementaryViewPrototypeRecipeContentTintingViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setGroupingIdentifier:", v3);
  objc_msgSend(v4, "setGroupName:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v6);

  objc_msgSend(*(id *)(a1 + 40), "configuration");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v7);

}

- (void)_setTextColor:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[UITableView visibleCells](self->_tableView, "visibleCells");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v9), "textLabel");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCSupplementaryViewPrototypeRecipeViewController configuration](self, "configuration");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "textColor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setTextColor:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v7);
  }

  -[UITableView headerViewForSection:](self->_tableView, "headerViewForSection:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCSupplementaryViewPrototypeRecipeViewController configuration](self, "configuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "textColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTextColor:", v16);

  v17 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __80__NCSupplementaryViewPrototypeRecipeContentTintingViewController__setTextColor___block_invoke;
  v22[3] = &unk_1E8D1F1C8;
  v18 = v4;
  v23 = v18;
  -[NCSupplementaryViewPrototypeRecipeViewController updateConfiguration:](self, "updateConfiguration:", v22);
  v20[0] = v17;
  v20[1] = 3221225472;
  v20[2] = __80__NCSupplementaryViewPrototypeRecipeContentTintingViewController__setTextColor___block_invoke_2;
  v20[3] = &unk_1E8D1F218;
  v21 = v18;
  v19 = v18;
  -[NCSupplementaryViewPrototypeRecipeContentTintingViewController _enumerateStack:](self, "_enumerateStack:", v20);

}

uint64_t __80__NCSupplementaryViewPrototypeRecipeContentTintingViewController__setTextColor___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setTextColor:", *(_QWORD *)(a1 + 32));
}

uint64_t __80__NCSupplementaryViewPrototypeRecipeContentTintingViewController__setTextColor___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setTextColor:", *(_QWORD *)(a1 + 32));
}

- (void)_setTintColor:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__NCSupplementaryViewPrototypeRecipeContentTintingViewController__setTintColor___block_invoke;
  v10[3] = &unk_1E8D1F1C8;
  v6 = v4;
  v11 = v6;
  -[NCSupplementaryViewPrototypeRecipeViewController updateConfiguration:](self, "updateConfiguration:", v10);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __80__NCSupplementaryViewPrototypeRecipeContentTintingViewController__setTintColor___block_invoke_2;
  v8[3] = &unk_1E8D1F218;
  v9 = v6;
  v7 = v6;
  -[NCSupplementaryViewPrototypeRecipeContentTintingViewController _enumerateStack:](self, "_enumerateStack:", v8);

}

uint64_t __80__NCSupplementaryViewPrototypeRecipeContentTintingViewController__setTintColor___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setTintColor:", *(_QWORD *)(a1 + 32));
}

uint64_t __80__NCSupplementaryViewPrototypeRecipeContentTintingViewController__setTintColor___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setTintColor:", *(_QWORD *)(a1 + 32));
}

- (void)_enumerateStack:(id)a3
{
  unint64_t v4;
  void *v5;
  void (**v6)(id, void *);

  v6 = (void (**)(id, void *))a3;
  -[NSPointerArray unui_compact](self->_weakStackViewControllers, "unui_compact");
  if (-[NSPointerArray count](self->_weakStackViewControllers, "count"))
  {
    v4 = 0;
    do
    {
      -[NSPointerArray pointerAtIndex:](self->_weakStackViewControllers, "pointerAtIndex:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
        v6[2](v6, v5);

      ++v4;
    }
    while (v4 < -[NSPointerArray count](self->_weakStackViewControllers, "count"));
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weakStackViewControllers, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
