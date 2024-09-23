@implementation NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController

- (NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController)init
{
  NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController *v2;
  NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController;
  v2 = -[NCSupplementaryViewPrototypeRecipeViewController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[NCSupplementaryViewPrototypeRecipeViewController updateConfiguration:](v2, "updateConfiguration:", &__block_literal_global_34);
  return v3;
}

void __79__NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController_init__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x1E0DC3658];
  v3 = a2;
  objc_msgSend(v2, "systemWhiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorWithAlphaComponent:", 0.4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTintColor:", v5);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlackColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v6);

}

+ (id)title
{
  return CFSTR("Auxiliary Options");
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
  -[UITableView setAllowsSelection:](self->_tableView, "setAllowsSelection:", 1);
  -[UITableView setScrollEnabled:](self->_tableView, "setScrollEnabled:", 0);
  -[NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController setView:](self, "setView:", self->_tableView);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("cell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("cell"));
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v8);

    objc_msgSend(v7, "setSelectionStyle:", 0);
  }
  if ((unint64_t)objc_msgSend(v6, "row") > 2)
  {
    v13 = CFSTR("2 Auxiliary Options Without Title");
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = objc_msgSend(v6, "row") + 1;
    v11 = objc_msgSend(v6, "row");
    v12 = CFSTR("s");
    if (!v11)
      v12 = &stru_1E8D21F60;
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%lu Auxiliary Option%@"), v10, v12);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v13);

  objc_msgSend(v7, "textLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCSupplementaryViewPrototypeRecipeViewController configuration](self, "configuration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "textColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTextColor:", v17);

  return v7;
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "cellForRowAtIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSelected:", 0);

  objc_msgSend(v6, "cellForRowAtIndexPath:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setAccessoryType:", 0);
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("header"), a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D78]), "initWithReuseIdentifier:", CFSTR("header"));
  objc_msgSend(v5, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", CFSTR("Select Number of Auxiliary Option Buttons"));

  objc_msgSend(v5, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCSupplementaryViewPrototypeRecipeViewController configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v9);

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

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController *v16;
  id v17;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "cellForRowAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSelected:", 1);

  objc_msgSend(v7, "cellForRowAtIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setAccessoryType:", 3);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __109__NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController_tableView_didSelectRowAtIndexPath___block_invoke;
  v15 = &unk_1E8D1F1F0;
  v16 = self;
  v17 = v6;
  v10 = v6;
  -[NCSupplementaryViewPrototypeRecipeViewController updateConfiguration:](self, "updateConfiguration:", &v12);
  -[NCSupplementaryViewPrototypeRecipeViewController delegate](self, "delegate", v12, v13, v14, v15, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "notificationListBaseComponentDidSignificantUserInteraction:", self);

}

void __109__NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD aBlock[4];
  id v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  id location;
  _QWORD v37[3];
  _QWORD v38[2];
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  switch(objc_msgSend(*(id *)(a1 + 40), "row"))
  {
    case 0:
      objc_msgSend(*(id *)(a1 + 32), "configuration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "materialRecipe");
      MTStringFromMaterialRecipe();
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = (void *)MEMORY[0x1E0DC3428];
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __109__NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
      v32[3] = &unk_1E8D1F260;
      objc_copyWeak(&v35, &location);
      v32[4] = *(_QWORD *)(a1 + 32);
      v11 = v3;
      v33 = v11;
      v12 = v9;
      v34 = v12;
      objc_msgSend(v10, "actionWithTitle:image:identifier:handler:", CFSTR("Change Material"), 0, 0, v32);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAuxiliaryOptionActions:", v14);

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Change Material? Current Material is %@"), v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAuxiliaryOptionsSummaryText:", v15);

      objc_destroyWeak(&v35);
      break;
    case 1:
    case 3:
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __109__NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController_tableView_didSelectRowAtIndexPath___block_invoke_264;
      aBlock[3] = &unk_1E8D1B1C8;
      objc_copyWeak(&v31, &location);
      v4 = _Block_copy(aBlock);
      objc_msgSend(MEMORY[0x1E0DC3428], "actionWithTitle:image:identifier:handler:", CFSTR("Configure Tint Color"), 0, 0, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = v5;
      objc_msgSend(MEMORY[0x1E0DC3428], "actionWithTitle:image:identifier:handler:", CFSTR("Configure Text Color"), 0, 0, v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v38[1] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setAuxiliaryOptionActions:", v7);

      if (objc_msgSend(*(id *)(a1 + 40), "row") == 3)
        objc_msgSend(v3, "setAuxiliaryOptionsSummaryText:", 0);
      else
        objc_msgSend(v3, "setAuxiliaryOptionsSummaryText:", CFSTR("Configure the colors?"));

      objc_destroyWeak(&v31);
      break;
    case 2:
      v16 = (void *)MEMORY[0x1E0DC3428];
      v17 = MEMORY[0x1E0C809B0];
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __109__NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2_274;
      v28[3] = &unk_1E8D1B1C8;
      objc_copyWeak(&v29, &location);
      objc_msgSend(v16, "actionWithTitle:image:identifier:handler:", CFSTR("Keep"), 0, 0, v28);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v18;
      v19 = (void *)MEMORY[0x1E0DC3428];
      v26[0] = v17;
      v26[1] = 3221225472;
      v26[2] = __109__NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController_tableView_didSelectRowAtIndexPath___block_invoke_4;
      v26[3] = &unk_1E8D1DC08;
      objc_copyWeak(&v27, &location);
      v26[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v19, "actionWithTitle:image:identifier:handler:", CFSTR("Remove"), 0, 0, v26);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v37[1] = v20;
      v21 = (void *)MEMORY[0x1E0DC3428];
      v24[0] = v17;
      v24[1] = 3221225472;
      v24[2] = __109__NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController_tableView_didSelectRowAtIndexPath___block_invoke_5;
      v24[3] = &unk_1E8D1B1C8;
      objc_copyWeak(&v25, &location);
      objc_msgSend(v21, "actionWithTitle:image:identifier:handler:", CFSTR("Noop"), 0, 0, v24);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v37[2] = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setAuxiliaryOptionActions:", v23);

      objc_msgSend(v3, "setAuxiliaryOptionsSummaryText:", CFSTR("Keep or remove?"));
      objc_destroyWeak(&v25);
      objc_destroyWeak(&v27);
      objc_destroyWeak(&v29);
      break;
    default:
      break;
  }
  objc_destroyWeak(&location);

}

void __109__NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v15 = WeakRetained;
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Select Material"), 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = objc_msgSend(&unk_1E8D5FE08, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(&unk_1E8D5FE08);
          v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 32), "_alertActionForMaterialRecipe:", objc_msgSend(v9, "integerValue"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addAction:", v10);
          v11 = objc_msgSend(*(id *)(a1 + 40), "materialRecipe");
          if (v11 == objc_msgSend(v9, "integerValue"))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Current Material: %@"), *(_QWORD *)(a1 + 48));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setMessage:", v12);

          }
        }
        v6 = objc_msgSend(&unk_1E8D5FE08, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v6);
    }
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Dismiss"), 1, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addAction:", v13);
    v3 = v15;
    objc_msgSend(v15, "presentViewController:animated:completion:", v4, 1, 0);
    objc_msgSend(v15, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "notificationListBaseComponentDidSignificantUserInteraction:", v15);

  }
}

void __109__NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController_tableView_didSelectRowAtIndexPath___block_invoke_264(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DC3668]);
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTag:", 0);

    objc_msgSend(v13, "title");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:", v6);

    objc_msgSend(v4, "setDelegate:", WeakRetained);
    objc_msgSend(v13, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = objc_msgSend(v7, "isEqualToString:", CFSTR("Configure Tint Color"));
    objc_msgSend(WeakRetained, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if ((v6 & 1) != 0)
      objc_msgSend(v8, "tintColor");
    else
      objc_msgSend(v8, "textColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "setSelectedColor:", v10);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setSelectedColor:", v11);

    }
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v4, 1, 0);
    objc_msgSend(WeakRetained, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "notificationListBaseComponentDidSignificantUserInteraction:", WeakRetained);

  }
}

void __109__NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2_274(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "updateConfiguration:", &__block_literal_global_275);
    objc_msgSend(v3, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "notificationListBaseComponentDidSignificantUserInteraction:", v3);

    WeakRetained = v3;
  }

}

void __109__NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController_tableView_didSelectRowAtIndexPath___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setAuxiliaryOptionActions:", 0);
  objc_msgSend(v2, "setAuxiliaryOptionsSummaryText:", 0);

}

void __109__NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController_tableView_didSelectRowAtIndexPath___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "requestsRemovalForPrototypeRecipeViewController:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "notificationListBaseComponentDidSignificantUserInteraction:", v4);

    WeakRetained = v4;
  }

}

void __109__NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController_tableView_didSelectRowAtIndexPath___block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "notificationListBaseComponentDidSignificantUserInteraction:", v3);

    WeakRetained = v3;
  }

}

- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  _QWORD v11[4];
  id v12;
  NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController *v13;
  char v14;

  v6 = a3;
  -[NCSupplementaryViewPrototypeRecipeViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "notificationListBaseComponentDidSignificantUserInteraction:", self);

  objc_msgSend(v6, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("Configure Tint Color"));

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __129__NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController_colorPickerViewController_didSelectColor_continuously___block_invoke;
  v11[3] = &unk_1E8D1F2A8;
  v14 = v9;
  v12 = v6;
  v13 = self;
  v10 = v6;
  -[NCSupplementaryViewPrototypeRecipeViewController updateConfiguration:](self, "updateConfiguration:", v11);

}

void __129__NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController_colorPickerViewController_didSelectColor_continuously___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "selectedColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NilColorIfTransparent(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(v3, "setTintColor:", v5);
  }
  else
  {
    objc_msgSend(v3, "setTextColor:", v5);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1000), "visibleCells", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "textLabel");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setTextColor:", v5);

          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1000), "headerViewForSection:", 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "textLabel");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setTextColor:", v5);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

  }
}

- (id)_alertActionForMaterialRecipe:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9[2];
  id location;

  objc_initWeak(&location, self);
  v4 = (void *)MEMORY[0x1E0DC3448];
  MTStringFromMaterialRecipe();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __105__NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController__alertActionForMaterialRecipe___block_invoke;
  v8[3] = &unk_1E8D1F2F0;
  objc_copyWeak(v9, &location);
  v9[1] = (id)a3;
  objc_msgSend(v4, "actionWithTitle:style:handler:", v5, 0, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
  return v6;
}

void __105__NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController__alertActionForMaterialRecipe___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __105__NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController__alertActionForMaterialRecipe___block_invoke_2;
    v4[3] = &__block_descriptor_40_e65_v16__0__NCNotificationListMutableSupplementaryViewConfiguration_8l;
    v4[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(WeakRetained, "updateConfiguration:", v4);
  }

}

uint64_t __105__NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController__alertActionForMaterialRecipe___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setMaterialRecipe:", *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
