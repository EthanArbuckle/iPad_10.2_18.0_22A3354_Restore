@implementation NCSupplementaryViewPrototypeRecipeContentSortingViewController

+ (id)title
{
  return CFSTR("Sorting");
}

- (NCSupplementaryViewPrototypeRecipeContentSortingViewController)init
{
  NCSupplementaryViewPrototypeRecipeContentSortingViewController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *exampleGroupIdentifiersAndBaseColors;
  void *v14;
  void *v15;
  objc_super v16;
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[7];

  v22[5] = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)NCSupplementaryViewPrototypeRecipeContentSortingViewController;
  v2 = -[NCSupplementaryViewPrototypeRecipeViewController init](&v16, sel_init);
  if (v2)
  {
    v21[0] = CFSTR("com.apple.ClockAngel");
    objc_msgSend(MEMORY[0x1E0DC3658], "systemMintColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v14;
    v20[0] = CFSTR("com.apple.mediaremote");
    objc_msgSend(MEMORY[0x1E0DC3658], "systemCyanColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v4;
    v19[0] = CFSTR("com.example.live-activity-1");
    objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2] = v6;
    v18[0] = CFSTR("com.example.live-activity-2");
    objc_msgSend(MEMORY[0x1E0DC3658], "systemPurpleColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v22[3] = v8;
    v17[0] = CFSTR("com.example.live-activity-3");
    objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22[4] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 5);
    v11 = objc_claimAutoreleasedReturnValue();
    exampleGroupIdentifiersAndBaseColors = v2->_exampleGroupIdentifiersAndBaseColors;
    v2->_exampleGroupIdentifiersAndBaseColors = (NSArray *)v11;

    -[NCSupplementaryViewPrototypeRecipeViewController updateConfiguration:](v2, "updateConfiguration:", &__block_literal_global_378);
  }
  return v2;
}

void __70__NCSupplementaryViewPrototypeRecipeContentSortingViewController_init__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0DC3658];
  v3 = a2;
  objc_msgSend(v2, "greenColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorWithAlphaComponent:", 0.4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTintColor:", v4);

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
  -[UITableView setAllowsSelection:](self->_tableView, "setAllowsSelection:", 1);
  -[NCSupplementaryViewPrototypeRecipeContentSortingViewController setView:](self, "setView:", self->_tableView);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_exampleGroupIdentifiersAndBaseColors, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("cell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v8);

  if (!v7)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("cell"));
    objc_msgSend(v7, "setSelectionStyle:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v9);

  }
  v10 = (void *)MEMORY[0x1E0CB3940];
  -[NCSupplementaryViewPrototypeRecipeContentSortingViewController _groupingIdentifierForSection:](self, "_groupingIdentifierForSection:", objc_msgSend(v6, "row"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("Add %@"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v12);

  return v7;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("header"), a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D78]), "initWithReuseIdentifier:", CFSTR("header"));
  v7 = v6;

  objc_msgSend(v7, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sorting Configuration Menu"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v9);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  _NCSupplementaryViewPrototypeSortingExampleViewController *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  NCSupplementaryViewPrototypeRecipeContentSortingViewController *v18;
  id v19;
  uint64_t v20;

  v5 = a4;
  v6 = objc_alloc_init(_NCSupplementaryViewPrototypeSortingExampleViewController);
  -[NCSupplementaryViewPrototypeRecipeViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCSupplementaryViewPrototypeRecipeContentSortingViewController _groupingIdentifierForSection:](self, "_groupingIdentifierForSection:", objc_msgSend(v5, "row"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "prototypeRecipeViewController:requestsCountForGroupWithIdentifier:", self, v8);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __100__NCSupplementaryViewPrototypeRecipeContentSortingViewController_tableView_didSelectRowAtIndexPath___block_invoke;
  v16 = &unk_1E8D1F378;
  v17 = v8;
  v18 = self;
  v19 = v5;
  v20 = v9;
  v10 = v5;
  v11 = v8;
  -[NCSupplementaryViewPrototypeRecipeViewController updateConfiguration:](v6, "updateConfiguration:", &v13);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Number:%lu\n%@"), v9, v11, v13, v14, v15, v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NCSupplementaryViewPrototypeSortingExampleViewController setTitle:](v6, "setTitle:", v12);
  -[NCSupplementaryViewPrototypeRecipeViewController setDelegate:](v6, "setDelegate:", v7);
  objc_msgSend(v7, "requestsInsertForPrototypeRecipeViewController:", v6);
  objc_msgSend(v7, "notificationListBaseComponentDidSignificantUserInteraction:", self);

}

void __100__NCSupplementaryViewPrototypeRecipeContentSortingViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setGroupingIdentifier:", v3);
  objc_msgSend(v4, "setGroupName:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "_colorForSection:index:", objc_msgSend(*(id *)(a1 + 48), "row"), *(_QWORD *)(a1 + 56));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v5);

}

- (id)_groupingIdentifierForSection:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[NSArray objectAtIndex:](self->_exampleGroupIdentifiersAndBaseColors, "objectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_colorForSection:(unint64_t)a3 index:(unint64_t)a4
{
  void *v5;
  void *v6;
  double v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;

  -[NSArray objectAtIndex:](self->_exampleGroupIdentifiersAndBaseColors, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0.0;
  v13 = 0.0;
  v10 = 0;
  v11 = 0;
  objc_msgSend(v6, "getHue:saturation:brightness:alpha:", &v13, &v12, &v11, &v10);
  v7 = ((double)(arc4random() % 0xA) / 10.0 + 0.1) * (double)(a4 + 1);
  v12 = vabdd_f64(v12, v7);
  v13 = vabdd_f64(v13, v7);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exampleGroupIdentifiersAndBaseColors, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
