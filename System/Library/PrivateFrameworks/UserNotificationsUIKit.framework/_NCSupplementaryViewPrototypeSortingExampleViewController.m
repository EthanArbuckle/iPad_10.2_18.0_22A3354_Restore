@implementation _NCSupplementaryViewPrototypeSortingExampleViewController

- (void)setTitle:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_NCSupplementaryViewPrototypeSortingExampleViewController;
  -[_NCSupplementaryViewPrototypeSortingExampleViewController setTitle:](&v7, sel_setTitle_, a3);
  -[UITableView headerViewForSection:](self->_tableView, "headerViewForSection:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NCSupplementaryViewPrototypeSortingExampleViewController _titleText](self, "_titleText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v6);

}

- (void)setDateModified:(id)a3
{
  UITableView *tableView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_NCSupplementaryViewPrototypeSortingExampleViewController;
  -[NCSupplementaryViewPrototypeRecipeViewController setDateModified:](&v9, sel_setDateModified_, a3);
  tableView = self->_tableView;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView cellForRowAtIndexPath:](tableView, "cellForRowAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NCSupplementaryViewPrototypeSortingExampleViewController _dateModifiedText](self, "_dateModifiedText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v8);

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
  -[_NCSupplementaryViewPrototypeSortingExampleViewController setView:](self, "setView:", self->_tableView);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;

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
  v10 = objc_msgSend(v6, "row");
  if (v10 == 2)
  {
    v11 = CFSTR("Tap to update after 3 seconds");
  }
  else if (v10 == 1)
  {
    v11 = CFSTR("Tap to update");
  }
  else if (v10)
  {
    v11 = 0;
  }
  else
  {
    -[_NCSupplementaryViewPrototypeSortingExampleViewController _dateModifiedText](self, "_dateModifiedText");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v11);

  return v7;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(a3, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("header"), a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D78]), "initWithReuseIdentifier:", CFSTR("header"));
  v8 = v7;

  objc_msgSend(v8, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NCSupplementaryViewPrototypeSortingExampleViewController _titleText](self, "_titleText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v10);

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v5;
  dispatch_time_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  v5 = objc_msgSend(a4, "row", a3);
  if (v5 == 2)
  {
    objc_initWeak(&location, self);
    v6 = dispatch_time(0, 3000000000);
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __95___NCSupplementaryViewPrototypeSortingExampleViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    v11 = &unk_1E8D1B278;
    objc_copyWeak(&v12, &location);
    dispatch_after(v6, MEMORY[0x1E0C80D38], &v8);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else if (v5 == 1)
  {
    -[_NCSupplementaryViewPrototypeSortingExampleViewController _updatedDateModified](self, "_updatedDateModified");
  }
  -[NCSupplementaryViewPrototypeRecipeViewController delegate](self, "delegate", v8, v9, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "notificationListBaseComponentDidSignificantUserInteraction:", self);

}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v4;
  void *v5;
  id v6;

  v4 = a4;
  if (objc_msgSend(v4, "row") == 1 || objc_msgSend(v4, "row") == 2)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (void)_updatedDateModified
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NCSupplementaryViewPrototypeSortingExampleViewController setDateModified:](self, "setDateModified:", v3);

  -[NCSupplementaryViewPrototypeRecipeViewController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestsUpdatePositionIfNeededForPrototypeRecipeViewController:", self);

}

- (id)_dateModifiedText
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v3, "setDateFormat:", CFSTR("HH:mm:ss.SSS"));
  -[NCSupplementaryViewPrototypeRecipeViewController dateModified](self, "dateModified");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Last modified: %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_titleText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NCSupplementaryViewPrototypeRecipeViewController configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupingIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NCSupplementaryViewPrototypeSortingExampleViewController title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
