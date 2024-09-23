@implementation NCSupplementaryViewPrototypeRecipeMenuViewController

- (NCSupplementaryViewPrototypeRecipeMenuViewController)init
{
  NCSupplementaryViewPrototypeRecipeMenuViewController *v2;
  NCSupplementaryViewPrototypeRecipeMenuViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NCSupplementaryViewPrototypeRecipeMenuViewController;
  v2 = -[NCSupplementaryViewPrototypeRecipeViewController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[NCSupplementaryViewPrototypeRecipeViewController updateConfiguration:](v2, "updateConfiguration:", &__block_literal_global_28);
  return v3;
}

void __60__NCSupplementaryViewPrototypeRecipeMenuViewController_init__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0DC3658];
  v3 = a2;
  objc_msgSend(v2, "blackColor");
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
  -[UITableView setAllowsSelection:](self->_tableView, "setAllowsSelection:", 1);
  -[UITableView setScrollEnabled:](self->_tableView, "setScrollEnabled:", 0);
  -[NCSupplementaryViewPrototypeRecipeMenuViewController setView:](self, "setView:", self->_tableView);
}

- (void)viewDidLoad
{
  NSArray *v3;
  NSArray *viewControllers;
  objc_super v5;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)NCSupplementaryViewPrototypeRecipeMenuViewController;
  -[NCSupplementaryViewPrototypeRecipeViewController viewDidLoad](&v5, sel_viewDidLoad);
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v6[2] = objc_opt_class();
  v6[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 4);
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  viewControllers = self->_viewControllers;
  self->_viewControllers = v3;

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
  if (!v7)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("cell"));
    objc_msgSend(v7, "setSelectionStyle:", 0);
  }
  objc_msgSend(-[NSArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", objc_msgSend(v6, "row")), "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v9);

  objc_msgSend(v7, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v8);

  objc_msgSend(v7, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCSupplementaryViewPrototypeRecipeViewController configuration](self, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "textColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTextColor:", v13);

  return v7;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[UITableView dequeueReusableHeaderFooterViewWithIdentifier:](self->_tableView, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("header"), a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D78]), "initWithReuseIdentifier:", CFSTR("header"));
  objc_msgSend(v5, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", CFSTR("Supplementary Prototype Options"));

  objc_msgSend(v5, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCSupplementaryViewPrototypeRecipeViewController configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v9);

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  NSArray *viewControllers;
  uint64_t v7;
  id v8;
  id v9;

  v5 = a4;
  -[NCSupplementaryViewPrototypeRecipeViewController delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  viewControllers = self->_viewControllers;
  v7 = objc_msgSend(v5, "row");

  v8 = objc_alloc_init((Class)-[NSArray objectAtIndex:](viewControllers, "objectAtIndex:", v7));
  objc_msgSend(v8, "setDelegate:", v9);
  objc_msgSend(v9, "requestsInsertForPrototypeRecipeViewController:", v8);
  objc_msgSend(v9, "notificationListBaseComponentDidSignificantUserInteraction:", self);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_viewControllers, "count", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
