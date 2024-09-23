@implementation UIMoreListController

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_moreViewControllers, "count", a3, a4);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (void)loadView
{
  _UIMoreListTableView *v3;
  UITableView *v4;
  UITableView *table;
  void *v6;
  id v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = [_UIMoreListTableView alloc];
  v4 = -[UITableView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  table = self->_table;
  self->_table = v4;

  -[UITableView setDelegate:](self->_table, "setDelegate:", self);
  -[UITableView setDataSource:](self->_table, "setDataSource:", self);
  -[UITableView setSeparatorStyle:](self->_table, "setSeparatorStyle:", 1);
  -[UITableView set_listController:](self->_table, "set_listController:", self);
  -[UIViewController setView:](self, "setView:", self->_table);
  -[UIMoreListController _layoutCells](self, "_layoutCells");
  -[UIMoreListController _updateEditButton](self, "_updateEditButton");
  v8[0] = 0x1E1A99540;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UIViewController _registerForTraitTokenChanges:withTarget:action:](self, "_registerForTraitTokenChanges:withTarget:action:", v6, self, sel__layoutCells);

}

- (void)setAllowsCustomizing:(BOOL)a3
{
  if (self->_allowsCustomizing != a3)
  {
    self->_allowsCustomizing = a3;
    -[UIMoreListController _updateEditButton](self, "_updateEditButton");
  }
}

- (NSArray)moreViewControllers
{
  return self->_moreViewControllers;
}

- (void)_willChangeToIdiom:(int64_t)a3 onScreen:(id)a4
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIMoreListController;
  -[UIViewController _willChangeToIdiom:onScreen:](&v6, sel__willChangeToIdiom_onScreen_, a3, a4);
  self->_disableCustomizing = a3 == 3;
  self->_hideNavigationBar = a3 == 3;
  -[UIMoreListController _updateEditButton](self, "_updateEditButton");
}

- (void)_updateEditButton
{
  void *moreEditButtonItem;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  UIBarButtonItem *v8;
  void *v9;
  UIBarButtonItem *v10;
  void *v11;
  UIBarButtonItem *v12;
  void *v13;
  UIBarButtonItem *v14;
  UIBarButtonItem *v15;
  void *v16;
  UIBarButtonItem *v17;
  UIBarButtonItem *v18;
  UIBarButtonItem *v19;

  v19 = self->_moreEditButtonItem;
  if (!-[UIMoreListController allowsCustomizing](self, "allowsCustomizing") || self->_disableCustomizing)
  {
    moreEditButtonItem = self->_moreEditButtonItem;
    self->_moreEditButtonItem = 0;
LABEL_4:

    goto LABEL_5;
  }
  if (!self->_moreEditButtonItem)
  {
    v15 = [UIBarButtonItem alloc];
    _UINSLocalizedStringWithDefaultValue(CFSTR("Edit"), CFSTR("Edit"));
    moreEditButtonItem = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController tabBarController](self, "tabBarController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[UIBarButtonItem initWithTitle:style:target:action:](v15, "initWithTitle:style:target:action:", moreEditButtonItem, 1, v16, sel_beginCustomizingTabBar_);
    v18 = self->_moreEditButtonItem;
    self->_moreEditButtonItem = v17;

    goto LABEL_4;
  }
LABEL_5:
  -[UIViewController tabBarController](self, "tabBarController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "showsEditButtonOnLeft");

  -[UIViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "rightBarButtonItem");
    v8 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();

    if (v8 == v19)
    {
      -[UIViewController navigationItem](self, "navigationItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setRightBarButtonItem:", 0);

    }
    v10 = self->_moreEditButtonItem;
    -[UIViewController navigationItem](self, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLeftBarButtonItem:", v10);
  }
  else
  {
    objc_msgSend(v6, "leftBarButtonItem");
    v12 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();

    if (v12 == v19)
    {
      -[UIViewController navigationItem](self, "navigationItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setLeftBarButtonItem:", 0);

    }
    v14 = self->_moreEditButtonItem;
    -[UIViewController navigationItem](self, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRightBarButtonItem:", v14);
  }

}

- (BOOL)allowsCustomizing
{
  return self->_allowsCustomizing;
}

- (UIMoreListController)init
{
  UIMoreListController *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIMoreListController;
  result = -[UIViewController init](&v3, sel_init);
  if (result)
    result->_allowsCustomizing = 1;
  return result;
}

- (void)setMoreViewControllers:(id)a3
{
  NSArray *v5;

  v5 = (NSArray *)a3;
  if (self->_moreViewControllers != v5)
  {
    objc_storeStrong((id *)&self->_moreViewControllers, a3);
    if (-[UIViewController isViewLoaded](self, "isViewLoaded"))
      -[UIMoreListController _layoutCells](self, "_layoutCells");
  }
  if (self->_moreViewControllersChanged)
    -[UIMoreListController _layoutCells](self, "_layoutCells");

}

- (void)_layoutCells
{
  UIMoreListCellLayoutManager *v3;
  UIMoreListCellLayoutManager *layoutManager;
  void *v5;
  double v6;
  double v7;
  void *v8;
  NSString *v9;
  _BOOL4 IsAccessibilityCategory;
  double v11;
  void *v12;

  if (!self->_layoutManager)
  {
    v3 = objc_alloc_init(UIMoreListCellLayoutManager);
    layoutManager = self->_layoutManager;
    self->_layoutManager = v3;

  }
  -[UIView window](self->_table, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIMoreListCellLayoutManager setWidestImageWidthFromViewControllers:](self->_layoutManager, "setWidestImageWidthFromViewControllers:", self->_moreViewControllers);
    v7 = v6;
    -[UIViewController traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferredContentSizeCategory");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v9);

    v11 = -1.0;
    if (!IsAccessibilityCategory)
      v11 = v7 + 15.0 + 15.0;
    -[UITableView setSeparatorInset:](self->_table, "setSeparatorInset:", -1.0, v11, -1.0, -1.0);
  }
  -[UIMoreListController table](self, "table");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "reloadData");

  self->_moreViewControllersChanged = 0;
}

- (id)table
{
  return self->_table;
}

- (id)tabBarItem
{
  UITabBarItem *tabBarItem;
  UITabBarItem *v4;
  UITabBarItem *v5;

  tabBarItem = self->super._tabBarItem;
  if (!tabBarItem)
  {
    v4 = -[UITabBarItem initWithTabBarSystemItem:tag:]([UITabBarItem alloc], "initWithTabBarSystemItem:tag:", 0, 0);
    v5 = self->super._tabBarItem;
    self->super._tabBarItem = v4;

    tabBarItem = self->super._tabBarItem;
  }
  return tabBarItem;
}

- (BOOL)moreViewControllersChanged
{
  return self->_moreViewControllersChanged;
}

- (void)setMoreViewControllersChanged:(BOOL)a3
{
  self->_moreViewControllersChanged = a3;
}

- (BOOL)_isSupportedInterfaceOrientation:(int64_t)a3
{
  return a3 != 2;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  UITableView *table;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIMoreListController;
  -[UIViewController viewWillAppear:](&v8, sel_viewWillAppear_);
  if (self->_hideNavigationBar)
  {
    -[UIMoreListController _targetNavigationController](self, "_targetNavigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNavigationBarHidden:animated:", 1, v3);

  }
  table = self->_table;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0x7FFFFFFFFFFFFFFFLL, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView selectRowAtIndexPath:animated:scrollPosition:](table, "selectRowAtIndexPath:animated:scrollPosition:", v7, v3, 0);

}

- (BOOL)_viewControllerWasSelected
{
  return -[UITableView _highlightFirstVisibleRowIfAppropriate](self->_table, "_highlightFirstVisibleRowIfAppropriate");
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  UITableViewCell *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;

  v6 = a3;
  -[NSArray objectAtIndex:](self->_moreViewControllers, "objectAtIndex:", objc_msgSend(a4, "row"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "moreListTableCell");
  v8 = (UITableViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    -[UIViewController _screen](self, "_screen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@%d"), CFSTR("MORE_CELL_IDENTIFIER"), objc_msgSend(v10, "_userInterfaceIdiom"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v11);
    v8 = (UITableViewCell *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v8 = -[UITableViewCell initWithStyle:reuseIdentifier:]([UITableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, v11);
      -[UIView setAutoresizingMask:](v8, "setAutoresizingMask:", 2);
      -[UITableViewCell setLayoutManager:](v8, "setLayoutManager:", self->_layoutManager);
    }
    objc_msgSend(v7, "tabBarItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_moreListTitle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(v12, "_internalTitle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        objc_msgSend(v7, "title");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    -[UITableViewCell textLabel](v8, "textLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v13);

    if (-[UIView _shouldReverseLayoutDirection](v8, "_shouldReverseLayoutDirection"))
      v15 = 2;
    else
      v15 = 0;
    -[UITableViewCell textLabel](v8, "textLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTextAlignment:", v15);

    __UIMoreListImageForViewController(self, v7, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell imageView](v8, "imageView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setImage:", v17);

    -[UITableViewCell imageView](v8, "imageView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAlpha:", 0.8);

    -[UITableViewCell imageView](v8, "imageView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_setDefaultRenderingMode:", 2);

    -[UITableViewCell setAccessoryType:](v8, "setAccessoryType:", 1);
    objc_msgSend(v12, "badgeValue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell _setBadgeText:](v8, "_setBadgeText:", v21);

    -[UIViewController _screen](self, "_screen");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "_userInterfaceIdiom");

    -[UITableViewCell imageView](v8, "imageView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23 == 3)
      +[UIColor whiteColor](UIColor, "whiteColor");
    else
      +[UITabBar _unselectedTabTintColorForView:](UITabBar, "_unselectedTabTintColorForView:", v6);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTintColor:", v25);

  }
  return v8;
}

- (id)_targetNavigationController
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[UIViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_hideNavigationBar)
  {
    objc_msgSend(v3, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v4, "navigationController");
      v6 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v6;
    }
  }
  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = objc_msgSend(a4, "row", a3);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v5;
    -[UIMoreListController _targetNavigationController](self, "_targetNavigationController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndex:](self->_moreViewControllers, "objectAtIndex:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pushViewController:animated:", v7, 1);

    if (self->_hideNavigationBar)
      objc_msgSend(v8, "setNavigationBarHidden:animated:", 0, 1);

  }
}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIMoreListController;
  -[UIViewController encodeRestorableStateWithCoder:](&v7, sel_encodeRestorableStateWithCoder_, v4);
  -[UITableView indexPathForSelectedRow](self->_table, "indexPathForSelectedRow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend(v5, "row"), CFSTR("kSelectedTableViewCellIndexKey"));

}

- (void)decodeRestorableStateWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIMoreListController;
  -[UIResponder decodeRestorableStateWithCoder:](&v7, sel_decodeRestorableStateWithCoder_, v4);
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("kSelectedTableViewCellIndexKey")))
  {
    v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kSelectedTableViewCellIndexKey"));
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView selectRowAtIndexPath:animated:scrollPosition:](self->_table, "selectRowAtIndexPath:animated:scrollPosition:", v6, 0, 0);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moreEditButtonItem, 0);
  objc_storeStrong((id *)&self->_layoutManager, 0);
  objc_storeStrong((id *)&self->_moreViewControllers, 0);
  objc_storeStrong((id *)&self->_table, 0);
}

@end
