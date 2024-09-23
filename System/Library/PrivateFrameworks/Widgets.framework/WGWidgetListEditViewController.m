@implementation WGWidgetListEditViewController

- (WGWidgetListEditViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  WGWidgetListEditViewController *v4;
  UINavigationController *v5;
  UINavigationController *navigationController;
  uint64_t v7;
  UITableViewController *tableViewController;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)WGWidgetListEditViewController;
  v4 = -[WGWidgetListEditViewController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, 0, 0);
  if (v4)
  {
    v5 = (UINavigationController *)objc_alloc_init(MEMORY[0x24BDF6BF8]);
    navigationController = v4->_navigationController;
    v4->_navigationController = v5;

    -[WGWidgetListEditViewController addChildViewController:](v4, "addChildViewController:", v4->_navigationController);
    -[UINavigationController didMoveToParentViewController:](v4->_navigationController, "didMoveToParentViewController:", v4);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6E68]), "initWithStyle:", 2);
    tableViewController = v4->_tableViewController;
    v4->_tableViewController = (UITableViewController *)v7;

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 1, v4, sel__cancelWidgetListEditView);
    -[UITableViewController navigationItem](v4->_tableViewController, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLeftBarButtonItem:", v9);

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 0, v4, sel__dismissWidgetListEditView);
    -[UITableViewController navigationItem](v4->_tableViewController, "navigationItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setRightBarButtonItem:", v11);

    -[UITableViewController setEditing:animated:](v4->_tableViewController, "setEditing:animated:", 1, 0);
    -[UINavigationController pushViewController:animated:](v4->_navigationController, "pushViewController:animated:", v4->_tableViewController, 0);

  }
  return v4;
}

- (void)setDataSource:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  char v9;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(obj, "groupsForWidgetListEditViewController:", self);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", CFSTR("TodayGroup"), 0);
    }
    v7 = v6;
    objc_storeStrong((id *)&self->_groupIDs, v6);

    self->_showsFavorites = objc_msgSend(obj, "widgetListEditViewControllerShouldShowFavorites:", self);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v8 = objc_msgSend(obj, "shouldShowWidgetsPinButtonForWidgetListEditViewController:", self);
      self->_showsPinSection = v8;
      if (v8)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v9 = objc_msgSend(obj, "areWidgetsPinnedForWidgetListEditViewController:", self);
          self->_widgetsPinnedOriginally = v9;
          self->_widgetsPinned = v9;
        }
      }
    }
    -[WGWidgetListEditViewController _loadItems](self, "_loadItems");
    v5 = obj;
  }

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  WGWidgetListEditViewTableHeaderView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)WGWidgetListEditViewController;
  -[WGWidgetListEditViewController viewDidLoad](&v17, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDF6950], "_systemGroupBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WGWidgetListEditViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = -[WGWidgetListEditViewController _layoutMode](self, "_layoutMode");
  -[UITableViewController tableView](self->_tableViewController, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDataSource:", self);
  objc_msgSend(v6, "setDelegate:", self);
  objc_msgSend(v6, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("WidgetCell"));
  objc_msgSend(v6, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PinCell"));
  objc_msgSend(v6, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("EmptyFavoritesCell"));
  objc_msgSend(v6, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(), CFSTR("WidgetHeader"));
  objc_msgSend(v6, "setBackgroundView:", 0);
  objc_msgSend(v6, "setBackgroundColor:", v3);
  objc_msgSend(v6, "setShowsHorizontalScrollIndicator:", 0);
  v7 = 0;
  v8 = v5 & 0xFFFFFFFFFFFFFFFELL;
  if ((v5 & 0xFFFFFFFFFFFFFFFELL) != 2)
    v7 = objc_msgSend(v6, "showsVerticalScrollIndicator", 0);
  objc_msgSend(v6, "setShowsVerticalScrollIndicator:", v7);
  objc_msgSend(v6, "_setDrawsSeparatorAtTopOfSections:", 1);
  objc_msgSend(MEMORY[0x24BDE27F0], "widgetRowHeight");
  objc_msgSend(v6, "setEstimatedRowHeight:");
  v9 = -[WGWidgetListEditViewTableHeaderView initWithReuseIdentifier:forTodayView:]([WGWidgetListEditViewTableHeaderView alloc], "initWithReuseIdentifier:forTodayView:", CFSTR("WidgetTableHeader"), self->_showsFavorites);
  objc_msgSend(v6, "setTableHeaderView:", v9);
  -[UINavigationController view](self->_navigationController, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v3);

  if (v8 == 2)
  {
    -[UINavigationController view](self->_navigationController, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCornerRadius:", 8.0);

  }
  -[WGWidgetListEditViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationController view](self->_navigationController, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", v14);

  -[UINavigationController navigationBar](self->_navigationController, "navigationBar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "_systemGroupBackgroundColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBarTintColor:", v16);

  objc_msgSend(v15, "setTranslucent:", 0);
  objc_msgSend(v15, "_setHidesShadow:", 1);

}

- (int64_t)_layoutMode
{
  id WeakRetained;
  int64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(WeakRetained, "layoutModeForWidgetListEditViewController:", self);
  else
    v4 = 0;

  return v4;
}

- (void)viewWillLayoutSubviews
{
  int64_t v3;
  void *v4;
  double x;
  double width;
  double MaxY;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  void *v32;
  void *v33;
  double v34;
  CGFloat v35;
  void *v36;
  uint64_t v37;
  double v38;
  void *v39;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  uint64_t v60;
  double v61;
  double v62;
  void *v63;
  uint64_t v64;
  objc_super v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;

  v65.receiver = self;
  v65.super_class = (Class)WGWidgetListEditViewController;
  -[WGWidgetListEditViewController viewWillLayoutSubviews](&v65, sel_viewWillLayoutSubviews);
  v3 = -[WGWidgetListEditViewController _layoutMode](self, "_layoutMode");
  -[UINavigationController navigationBar](self->_navigationController, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  x = v66.origin.x;
  width = v66.size.width;
  MaxY = CGRectGetMaxY(v66);
  -[UINavigationController navigationBar](self->_navigationController, "navigationBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_backgroundView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "superview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "convertRect:fromView:", v11, x, 0.0, width, MaxY);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  objc_msgSend(v9, "setFrame:", v13, v15, v17, v19);
  -[UITableViewController tableView](self->_tableViewController, "tableView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setRowHeight:", *MEMORY[0x24BDF7DE0]);
  objc_msgSend(v20, "tableHeaderView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTableHeaderView:", 0);
  objc_msgSend(v21, "frame");
  if (CGRectEqualToRect(v67, *MEMORY[0x24BDBF090]))
  {
    -[WGWidgetListEditViewController view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bounds");
    objc_msgSend(v21, "setFrame:", 0.0, 0.0);

  }
  objc_msgSend(v21, "sizeToFit");
  objc_msgSend(v20, "setTableHeaderView:", v21);
  if ((v3 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    -[WGWidgetListEditViewController view](self, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bounds");
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;

    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "_referenceBounds");
    CGRectGetHeight(v68);
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    UIRoundToScreenScale();
    v35 = v34;

    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "userInterfaceIdiom");

    if ((v37 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v38 = 16.0;
    else
      v38 = 0.0;
    v69.origin.x = v25;
    v69.origin.y = v27;
    v69.size.width = v29;
    v69.size.height = v31;
    CGRectGetHeight(v69);
    v70.origin.x = v25;
    v70.origin.y = v38;
    v70.size.width = v35;
    v70.size.height = v31;
    CGRectGetMinY(v70);
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "scale");
    v64 = v40;
    UIRectCenteredXInRectScale();
    v42 = v41;
    v44 = v43;
    v46 = v45;
    v48 = v47;

    -[UINavigationController view](self->_navigationController, "view", v64);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setFrame:", v42, v44, v46, v48);

    -[UITableViewController tableView](self->_tableViewController, "tableView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "contentInset");
    v52 = v51;
    v54 = v53;
    v56 = v55;
    v58 = v57;

    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "userInterfaceIdiom");

    v61 = 30.0;
    if ((v60 & 0xFFFFFFFFFFFFFFFBLL) != 1)
      v61 = 8.0;
    v62 = v56 + v61;
    -[UITableViewController tableView](self->_tableViewController, "tableView");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setContentInset:", v52, v54, v62, v58);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WGWidgetListEditViewController;
  -[WGWidgetListEditViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("WGWidgetListEditViewControllerWillAppear"), 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WGWidgetListEditViewController;
  -[WGWidgetListEditViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("WGWidgetListEditViewControllerDidAppear"), 0);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WGWidgetListEditViewController;
  -[WGWidgetListEditViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("WGWidgetListEditViewControllerWillDisappear"), 0);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WGWidgetListEditViewController;
  -[WGWidgetListEditViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  if (!self->_dismissingDueToInterfaceAction)
    -[WGWidgetListEditViewController _acknowledgeItemsSavingItemState:](self, "_acknowledgeItemsSavingItemState:", 0);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("WGWidgetListEditViewControllerDidDisappear"), 0);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id WeakRetained;
  objc_super v6;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "widgetEditListViewController:traitCollectionDidChange:", self, v4);
  v6.receiver = self;
  v6.super_class = (Class)WGWidgetListEditViewController;
  -[WGWidgetListEditViewController traitCollectionDidChange:](&v6, sel_traitCollectionDidChange_, v4);

}

- (BOOL)showsFavoritesSection
{
  _BOOL4 v3;

  v3 = -[WGWidgetListEditViewController showsFavorites](self, "showsFavorites");
  if (v3)
    LOBYTE(v3) = -[WGWidgetListEditViewController areWidgetsPinned](self, "areWidgetsPinned");
  return v3;
}

- (int64_t)pinSection
{
  return -[WGWidgetListEditViewController showsPinSection](self, "showsPinSection") - 1;
}

- (int64_t)todaySection
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSArray indexOfObject:](self->_groupIDs, "indexOfObject:", CFSTR("TodayGroup"));
  v4 = v3 + -[WGWidgetListEditViewController showsPinSection](self, "showsPinSection");
  return v4 + -[WGWidgetListEditViewController showsFavoritesSection](self, "showsFavoritesSection");
}

- (int64_t)favoritesSection
{
  if (-[WGWidgetListEditViewController showsFavoritesSection](self, "showsFavoritesSection"))
    return -[WGWidgetListEditViewController showsPinSection](self, "showsPinSection");
  else
    return -1;
}

- (int64_t)disabledWidgetsSection
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSArray count](self->_groupIDs, "count");
  v4 = v3 + -[WGWidgetListEditViewController showsPinSection](self, "showsPinSection");
  return v4 + -[WGWidgetListEditViewController showsFavoritesSection](self, "showsFavoritesSection");
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  _BOOL4 v4;
  _BOOL4 v5;
  NSUInteger v6;
  uint64_t v7;

  v4 = -[WGWidgetListEditViewController showsPinSection](self, "showsPinSection", a3);
  v5 = -[WGWidgetListEditViewController showsFavoritesSection](self, "showsFavoritesSection");
  v6 = -[NSArray count](self->_groupIDs, "count");
  v7 = 1;
  if (v4)
    v7 = 2;
  return v7 + v5 + v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v6;
  int64_t result;

  if (-[WGWidgetListEditViewController todaySection](self, "todaySection", a3) == a4)
  {
    v6 = 984;
    return objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v6), "count");
  }
  if (-[WGWidgetListEditViewController favoritesSection](self, "favoritesSection") == a4)
  {
    result = -[NSMutableArray count](self->_favoriteItemIDs, "count");
    if (result <= 1)
      return 1;
  }
  else
  {
    if (-[WGWidgetListEditViewController disabledWidgetsSection](self, "disabledWidgetsSection") == a4)
    {
      v6 = 1000;
      return objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v6), "count");
    }
    return -[WGWidgetListEditViewController pinSection](self, "pinSection") == a4;
  }
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id WeakRetained;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(id *, void *);
  void *v25;
  id v26;
  id v27;
  id v28;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "section");
  if (v8 == -[WGWidgetListEditViewController pinSection](self, "pinSection"))
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("PinCell"), v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pinSwitch");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setOn:", -[WGWidgetListEditViewController areWidgetsPinned](self, "areWidgetsPinned"));

    objc_msgSend(v9, "pinSwitch");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel_pinSwitchChanaged_, 4096);

    objc_msgSend(v9, "startAnimating");
  }
  else
  {
    v12 = objc_msgSend(v7, "section");
    if (v12 == -[WGWidgetListEditViewController favoritesSection](self, "favoritesSection")
      && !-[NSMutableArray count](self->_favoriteItemIDs, "count"))
    {
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("EmptyFavoritesCell"), v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("WidgetCell"), v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[WGWidgetListEditViewController _itemIdentifierForIndexPath:](self, "_itemIdentifierForIndexPath:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setEditing:", -[UITableViewController isEditing](self->_tableViewController, "isEditing"));
      WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(WeakRetained, "widgetListEditViewController:displayNameForItemWithIdentifier:", self, v13);
        v15 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = v13;
      }
      v16 = v15;
      objc_msgSend(v9, "textLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setText:", v16);

      objc_msgSend(v9, "textLabel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v19) = 1057803469;
      objc_msgSend(v18, "_setHyphenationFactor:", v19);

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_initWeak(&location, self);
        v22 = MEMORY[0x24BDAC760];
        v23 = 3221225472;
        v24 = __66__WGWidgetListEditViewController_tableView_cellForRowAtIndexPath___block_invoke;
        v25 = &unk_24D7316C0;
        objc_copyWeak(&v28, &location);
        v26 = v6;
        v27 = v13;
        objc_msgSend(WeakRetained, "widgetListEditViewController:requestsIconForItemWithIdentifier:withHandler:", self, v27, &v22);

        objc_destroyWeak(&v28);
        objc_destroyWeak(&location);
      }
      objc_msgSend(v9, "setWidgetEnabled:", objc_msgSend(v7, "section", v22, v23, v24, v25) != -[WGWidgetListEditViewController disabledWidgetsSection](self, "disabledWidgetsSection"));
      v20 = objc_msgSend(v7, "section");
      if (v20 == -[WGWidgetListEditViewController disabledWidgetsSection](self, "disabledWidgetsSection"))
        objc_msgSend(v9, "setShowsDot:", -[WGWidgetListEditViewController _isNewItem:](self, "_isNewItem:", v13));

    }
  }

  return v9;
}

void __66__WGWidgetListEditViewController_tableView_cellForRowAtIndexPath___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __66__WGWidgetListEditViewController_tableView_cellForRowAtIndexPath___block_invoke_2;
  v5[3] = &unk_24D731698;
  objc_copyWeak(&v9, a1 + 6);
  v6 = a1[4];
  v7 = a1[5];
  v8 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

  objc_destroyWeak(&v9);
}

void __66__WGWidgetListEditViewController_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = *(void **)(a1 + 32);
  objc_msgSend(WeakRetained, "_indexPathForItemWithIdentifier:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cellForRowAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BDF6F90];
  v7 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __66__WGWidgetListEditViewController_tableView_cellForRowAtIndexPath___block_invoke_3;
  v14[3] = &unk_24D731670;
  v8 = v5;
  v15 = v8;
  v16 = *(id *)(a1 + 48);
  objc_msgSend(v6, "performWithoutAnimation:", v14);
  if (objc_msgSend(WeakRetained, "wg_isAppearingOrAppeared"))
  {
    objc_msgSend(v8, "imageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "image");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v11 = (void *)MEMORY[0x24BDF6F90];
      v12[0] = v7;
      v12[1] = 3221225472;
      v12[2] = __66__WGWidgetListEditViewController_tableView_cellForRowAtIndexPath___block_invoke_4;
      v12[3] = &unk_24D7314D8;
      v13 = v8;
      objc_msgSend(v11, "animateWithDuration:animations:", v12, 0.25);

    }
  }

}

uint64_t __66__WGWidgetListEditViewController_tableView_cellForRowAtIndexPath___block_invoke_3(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

void __66__WGWidgetListEditViewController_tableView_cellForRowAtIndexPath___block_invoke_4(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "imageView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pl_performCrossFadeIfNecessary");

}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  char v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  if (-[WGWidgetListEditViewController disabledWidgetsSection](self, "disabledWidgetsSection", a3) == a4)
  {
    v6 = _os_feature_enabled_impl();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if ((v6 & 1) != 0)
      v9 = CFSTR("WIDGETS_EDIT_DISABLED_LEGACY");
    else
      v9 = CFSTR("WIDGETS_EDIT_DISABLED");
    goto LABEL_10;
  }
  if (!-[WGWidgetListEditViewController showsFavoritesSection](self, "showsFavoritesSection"))
    goto LABEL_11;
  if (-[WGWidgetListEditViewController todaySection](self, "todaySection") != a4)
  {
    if (-[WGWidgetListEditViewController favoritesSection](self, "favoritesSection") == a4)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("WIDGETS_EDIT_PINNED_FAVORITES");
      goto LABEL_10;
    }
LABEL_11:
    v10 = 0;
    return v10;
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = CFSTR("WIDGETS_EDIT_FAVORITES");
LABEL_10:
  objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_24D733868, CFSTR("Widgets"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("WidgetHeader"), a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "_secondaryLabelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v6);

  return v4;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  if (-[WGWidgetListEditViewController favoritesSection](self, "favoritesSection", a3) == a4)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("WIDGETS_EDIT_FAVORITES_DESCRIPTION"), &stru_24D733868, CFSTR("Widgets"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  uint64_t v5;

  v5 = objc_msgSend(a4, "section", a3);
  return v5 != -[WGWidgetListEditViewController disabledWidgetsSection](self, "disabledWidgetsSection")
      && v5 != -[WGWidgetListEditViewController pinSection](self, "pinSection");
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;

  v7 = a4;
  v8 = a5;
  v9 = objc_msgSend(v8, "section");
  if (v9 == -[WGWidgetListEditViewController favoritesSection](self, "favoritesSection"))
  {
    v10 = v8;
    if (!-[NSMutableArray count](self->_favoriteItemIDs, "count"))
    {
      v11 = (void *)MEMORY[0x24BDD15D8];
      v12 = -[WGWidgetListEditViewController favoritesSection](self, "favoritesSection");
      v13 = v11;
      v14 = 1;
LABEL_15:
      objc_msgSend(v13, "indexPathForRow:inSection:", v14, v12);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
  }
  else
  {
    if (v9 == -[WGWidgetListEditViewController disabledWidgetsSection](self, "disabledWidgetsSection"))
    {
      -[WGWidgetListEditViewController _itemIdentifierForIndexPath:](self, "_itemIdentifierForIndexPath:", v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[WGWidgetListEditViewController _indexForInsertingItemWithIdentifier:intoArray:](self, "_indexForInsertingItemWithIdentifier:intoArray:", v15, self->_disabledItemIDs);
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v16, -[WGWidgetListEditViewController disabledWidgetsSection](self, "disabledWidgetsSection"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
      goto LABEL_18;
    }
    if (v9 == -[WGWidgetListEditViewController pinSection](self, "pinSection"))
    {
      v17 = v7;
LABEL_16:
      v10 = v17;
      v15 = v8;
      goto LABEL_17;
    }
    v18 = -[WGWidgetListEditViewController _indexOfFirstEnabledWidgetInSection:](self, "_indexOfFirstEnabledWidgetInSection:", objc_msgSend(v8, "section"));
    if (objc_msgSend(v8, "row") < v18)
    {
      v19 = (void *)MEMORY[0x24BDD15D8];
      v12 = objc_msgSend(v8, "section");
      v13 = v19;
      v14 = v18;
      goto LABEL_15;
    }
    v20 = -[WGWidgetListEditViewController _indexOfLastEnabledWidgetInSection:](self, "_indexOfLastEnabledWidgetInSection:", objc_msgSend(v8, "section"));
    v21 = objc_msgSend(v7, "section");
    v22 = v20 - (v21 == objc_msgSend(v8, "section"));
    v10 = v8;
    if (objc_msgSend(v8, "row") > v22)
    {
      if (v22 >= v18)
        v23 = v22 + 1;
      else
        v23 = v18;
      v24 = (void *)MEMORY[0x24BDD15D8];
      v12 = objc_msgSend(v8, "section");
      v13 = v24;
      v14 = v23;
      goto LABEL_15;
    }
  }
LABEL_18:

  return v10;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[WGWidgetListEditViewController _itemIdentifierForIndexPath:](self, "_itemIdentifierForIndexPath:", v9);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "section");

  -[WGWidgetListEditViewController _itemIdentifiersInSection:](self, "_itemIdentifiersInSection:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WGWidgetListEditViewController _itemIdentifiersInSection:](self, "_itemIdentifiersInSection:", objc_msgSend(v8, "section"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeObject:", v16);
  v14 = objc_msgSend(v8, "row");
  v15 = objc_msgSend(v8, "section");

  if (v15 == -[WGWidgetListEditViewController favoritesSection](self, "favoritesSection")
    && !objc_msgSend(v13, "count"))
  {
    v14 = 0;
  }
  objc_msgSend(v13, "insertObject:atIndex:", v16, v14);
  objc_msgSend(v10, "reloadData");

}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  v5 = a4;
  v6 = objc_msgSend(v5, "section");
  v7 = 0;
  if (v6 != -[WGWidgetListEditViewController pinSection](self, "pinSection"))
  {
    v8 = objc_msgSend(v5, "section");
    if (v8 != -[WGWidgetListEditViewController favoritesSection](self, "favoritesSection")
      || -[NSMutableArray count](self->_favoriteItemIDs, "count"))
    {
      v7 = 1;
    }
  }

  return v7;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = a4;
  v6 = objc_msgSend(v5, "section");
  if (v6 == -[WGWidgetListEditViewController disabledWidgetsSection](self, "disabledWidgetsSection"))
  {
    v7 = 2;
  }
  else
  {
    v8 = objc_msgSend(v5, "section");
    v7 = 0;
    if (v8 != -[WGWidgetListEditViewController pinSection](self, "pinSection"))
    {
      v9 = objc_msgSend(v5, "section");
      if (v9 != -[WGWidgetListEditViewController favoritesSection](self, "favoritesSection")
        || -[NSMutableArray count](self->_favoriteItemIDs, "count"))
      {
        v7 = 1;
      }
    }
  }

  return v7;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return 0;
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("WIDGETS_EDIT_REMOVE"), &stru_24D733868, CFSTR("Widgets"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  id v9;

  v9 = a3;
  v8 = a5;
  if (v8)
  {
    if (a4 == 1)
    {
      -[WGWidgetListEditViewController _disableItemAtIndexPath:inTableView:](self, "_disableItemAtIndexPath:inTableView:", v8, v9);
    }
    else if (a4 == 2)
    {
      -[WGWidgetListEditViewController _enableItemAtIndexPath:inTableView:](self, "_enableItemAtIndexPath:inTableView:", v8, v9);
    }
  }

}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  double v5;
  void *v6;
  double contentMinY;
  double v8;
  double v9;
  double v10;
  id v11;

  v11 = a3;
  if (self->_contentMinY == 0.0)
  {
    -[WGWidgetListEditViewController _widgetListEditViewTableHeaderView](self, "_widgetListEditViewTableHeaderView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentMinY");
    self->_contentMinY = v5;

  }
  -[UINavigationController navigationBar](self->_navigationController, "navigationBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  contentMinY = self->_contentMinY;
  objc_msgSend(v11, "contentOffset");
  v9 = v8;
  objc_msgSend(v11, "contentInset");
  objc_msgSend(v6, "_setHidesShadow:", contentMinY > v9 + v10);

}

- (void)_acknowledgeItemsSavingItemState:(BOOL)a3
{
  if (a3)
  {
    -[WGWidgetListEditViewController _saveItemState](self, "_saveItemState");
    -[WGWidgetListEditViewController _saveItemArrangement](self, "_saveItemArrangement");
  }
  else
  {
    -[WGWidgetListEditViewController _acknowledgeItemsAndResetNewWidgetsCount](self, "_acknowledgeItemsAndResetNewWidgetsCount");
  }
}

- (void)_dismissDueToInterfaceActionAndAcknowledgeItemsSavingItemState:(BOOL)a3
{
  id WeakRetained;
  _QWORD v5[4];
  id v6;
  id location;

  self->_dismissingDueToInterfaceAction = 1;
  -[WGWidgetListEditViewController _acknowledgeItemsSavingItemState:](self, "_acknowledgeItemsSavingItemState:", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __97__WGWidgetListEditViewController__dismissDueToInterfaceActionAndAcknowledgeItemsSavingItemState___block_invoke;
    v5[3] = &unk_24D7316E8;
    objc_copyWeak(&v6, &location);
    objc_msgSend(WeakRetained, "dismissWidgetListEditViewController:animated:withCompletion:", self, 1, v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }

}

void __97__WGWidgetListEditViewController__dismissDueToInterfaceActionAndAcknowledgeItemsSavingItemState___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setDismissingDueToInterfaceAction:", 0);

}

- (void)_cancelWidgetListEditView
{
  -[WGWidgetListEditViewController _dismissDueToInterfaceActionAndAcknowledgeItemsSavingItemState:](self, "_dismissDueToInterfaceActionAndAcknowledgeItemsSavingItemState:", 0);
}

- (void)_dismissWidgetListEditView
{
  -[WGWidgetListEditViewController _dismissDueToInterfaceActionAndAcknowledgeItemsSavingItemState:](self, "_dismissDueToInterfaceActionAndAcknowledgeItemsSavingItemState:", 1);
}

- (id)_enabledItemIdentifiersForGroupID:(id)a3
{
  id v4;
  int *v5;
  void *v6;
  id v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqual:", CFSTR("TodayGroup")) & 1) != 0)
  {
    v5 = &OBJC_IVAR___WGWidgetListEditViewController__enabledTodayItemIDs;
  }
  else
  {
    if (!objc_msgSend(v4, "isEqual:", CFSTR("FavoriteGroup")))
    {
      v6 = 0;
      goto LABEL_7;
    }
    v5 = &OBJC_IVAR___WGWidgetListEditViewController__favoriteItemIDs;
  }
  v6 = *(Class *)((char *)&self->super.super.super.isa + *v5);
LABEL_7:
  v7 = v6;

  return v7;
}

- (void)_loadItems
{
  id WeakRetained;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  NSMutableArray *v13;
  NSMutableArray *enabledTodayItemIDs;
  NSMutableArray *v15;
  NSMutableArray *favoriteItemIDs;
  NSMutableArray *v17;
  NSMutableArray *disabledItemIDs;
  char v19;
  uint64_t v20;
  void *v21;
  NSMutableArray *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  char v29;
  NSMutableArray *v30;
  NSMutableArray *v31;
  NSArray *v32;
  NSArray *originalFavoriteItemIDs;
  uint64_t v34;
  uint64_t v35;
  id obj;
  uint64_t v37;
  char v38;
  _BOOL4 v39;
  void *v40;
  _QWORD v41[5];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v5 = self->_groupIDs;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v51 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i);
        objc_msgSend(WeakRetained, "widgetListEditViewController:itemIdentifiersForGroup:", self, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v4, "setObject:forKey:", v11, v10);

      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
    }
    while (v7);
  }

  objc_msgSend(WeakRetained, "disabledInterfaceItemIdentifiersForWidgetListEditViewController:", self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("Disabled"));

  v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  enabledTodayItemIDs = self->_enabledTodayItemIDs;
  self->_enabledTodayItemIDs = v13;

  v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  favoriteItemIDs = self->_favoriteItemIDs;
  self->_favoriteItemIDs = v15;

  v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  disabledItemIDs = self->_disabledItemIDs;
  self->_disabledItemIDs = v17;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v19 = objc_msgSend(WeakRetained, "widgetListEditViewControllerShouldIncludeInternalWidgets:", self);
  else
    v19 = 0;
  v39 = -[WGWidgetListEditViewController showsFavorites](self, "showsFavorites");
  v40 = WeakRetained;
  v38 = objc_msgSend(WeakRetained, "areWidgetsPinnedForWidgetListEditViewController:", self);
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v4;
  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
  if (v35)
  {
    v34 = *(_QWORD *)v47;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v47 != v34)
          objc_enumerationMutation(obj);
        v37 = v20;
        v21 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v20);
        -[WGWidgetListEditViewController _enabledItemIdentifiersForGroupID:](self, "_enabledItemIdentifiersForGroupID:", v21, v34);
        v22 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        objc_msgSend(obj, "objectForKey:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v43;
          do
          {
            for (j = 0; j != v25; ++j)
            {
              if (*(_QWORD *)v43 != v26)
                objc_enumerationMutation(v23);
              v28 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j);
              if ((objc_msgSend(v21, "isEqualToString:", CFSTR("FavoriteGroup")) & 1) == 0
                && ((v19 & 1) != 0 || (WGIsWidgetWithBundleIdentifierInternal(v28) & 1) == 0))
              {
                if (!v39
                  || !objc_msgSend(v40, "widgetListEditViewController:isItemWithIdentifierFavorited:", self, v28)|| (-[NSMutableArray addObject:](self->_favoriteItemIDs, "addObject:", v28), (v38 & 1) == 0))
                {
                  v29 = objc_msgSend(v40, "widgetListEditViewController:isItemWithIdentifierEnabled:", self, v28);
                  v30 = v22;
                  if ((v29 & 1) == 0)
                    v30 = self->_disabledItemIDs;
                  -[NSMutableArray addObject:](v30, "addObject:", v28);
                }
              }
            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
          }
          while (v25);
        }

        v20 = v37 + 1;
      }
      while (v37 + 1 != v35);
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
    }
    while (v35);
  }

  v31 = self->_disabledItemIDs;
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = __44__WGWidgetListEditViewController__loadItems__block_invoke;
  v41[3] = &unk_24D731710;
  v41[4] = self;
  -[NSMutableArray sortUsingComparator:](v31, "sortUsingComparator:", v41);
  v32 = (NSArray *)-[NSMutableArray copy](self->_favoriteItemIDs, "copy");
  originalFavoriteItemIDs = self->_originalFavoriteItemIDs;
  self->_originalFavoriteItemIDs = v32;

}

uint64_t __44__WGWidgetListEditViewController__loadItems__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_compareItemWithIdentifier:andItemWithIdentifierConsideringIsNew:", a2, a3);
}

- (void)_saveItemArrangement
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id WeakRetained;
  NSArray *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = self->_groupIDs;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    v16 = v4;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[WGWidgetListEditViewController _enabledItemIdentifiersForGroupID:](self, "_enabledItemIdentifiersForGroupID:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[WGWidgetListEditViewController showsFavorites](self, "showsFavorites")
          && -[WGWidgetListEditViewController areWidgetsPinned](self, "areWidgetsPinned")
          && objc_msgSend(v9, "isEqualToString:", CFSTR("TodayGroup")))
        {
          -[WGWidgetListEditViewController _enabledItemIdentifiersForGroupID:](self, "_enabledItemIdentifiersForGroupID:", CFSTR("FavoriteGroup"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v3;
          v14 = objc_msgSend(v12, "mutableCopy");

          v10 = (void *)v14;
          v3 = v13;
          v4 = v16;
        }
        if (v10)
          objc_msgSend(v3, "setObject:forKey:", v10, v9);

      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "widgetListEditViewController:didReorderItemsWithIdentifiersInGroups:", self, v3);

}

- (void)_acknowledgeItemsAndResetNewWidgetsCount
{
  void *v3;
  id v4;
  void (**v5)(_QWORD, _QWORD);
  id WeakRetained;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __74__WGWidgetListEditViewController__acknowledgeItemsAndResetNewWidgetsCount__block_invoke;
  v12 = &unk_24D731738;
  v13 = v3;
  v4 = v3;
  v5 = (void (**)(_QWORD, _QWORD))MEMORY[0x219A0A970](&v9);
  ((void (**)(_QWORD, NSMutableArray *))v5)[2](v5, self->_enabledTodayItemIDs);
  ((void (**)(_QWORD, NSMutableArray *))v5)[2](v5, self->_favoriteItemIDs);
  ((void (**)(_QWORD, NSMutableArray *))v5)[2](v5, self->_disabledItemIDs);
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "widgetListEditViewController:acknowledgeInterfaceItemsWithIdentifiers:", self, v4, v9, v10, v11, v12);

  v14 = CFSTR("WGNewWidgetsCountKey");
  v15[0] = &unk_24D744460;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("WGAvailableWidgetsUpdatedNotification"), self, v7);

}

void __74__WGWidgetListEditViewController__acknowledgeItemsAndResetNewWidgetsCount__block_invoke(uint64_t a1, void *a2)
{
  id v3;
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

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
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
        objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_saveItemState
{
  NSMutableArray *v3;
  id WeakRetained;
  _BOOL8 v5;
  NSMutableArray *v6;

  if (-[WGWidgetListEditViewController showsFavorites](self, "showsFavorites")
    && -[WGWidgetListEditViewController areWidgetsPinned](self, "areWidgetsPinned"))
  {
    -[NSMutableArray arrayByAddingObjectsFromArray:](self->_favoriteItemIDs, "arrayByAddingObjectsFromArray:", self->_enabledTodayItemIDs);
    v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self->_enabledTodayItemIDs;
  }
  v6 = v3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "widgetListEditViewController:setEnabled:forItemsWithIdentifiers:", self, 1, v6);
  objc_msgSend(WeakRetained, "widgetListEditViewController:setEnabled:forItemsWithIdentifiers:", self, 0, self->_disabledItemIDs);
  if (-[WGWidgetListEditViewController showsFavorites](self, "showsFavorites")
    && (-[NSArray isEqual:](self->_originalFavoriteItemIDs, "isEqual:", self->_favoriteItemIDs) & 1) == 0)
  {
    objc_msgSend(WeakRetained, "widgetListEditViewController:updateFavoritesToIdentifiers:", self, self->_favoriteItemIDs);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = -[WGWidgetListEditViewController areWidgetsPinned](self, "areWidgetsPinned");
    if (v5 != -[WGWidgetListEditViewController wereWidgetsPinnedOriginally](self, "wereWidgetsPinnedOriginally"))
      objc_msgSend(WeakRetained, "widgetListEditViewController:didChangeWidgetsPinning:", self, v5);
  }
  -[WGWidgetListEditViewController _acknowledgeItemsAndResetNewWidgetsCount](self, "_acknowledgeItemsAndResetNewWidgetsCount");

}

- (id)_groupKeyForSectionAtIndex:(unint64_t)a3
{
  __CFString *v5;

  if (-[WGWidgetListEditViewController todaySection](self, "todaySection") == a3)
  {
    v5 = CFSTR("TodayGroup");
  }
  else if (-[WGWidgetListEditViewController favoritesSection](self, "favoritesSection") == a3)
  {
    v5 = CFSTR("FavoriteGroup");
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (unint64_t)_sectionIndexForGroupKey:(id)a3
{
  id v4;
  int64_t v5;
  unint64_t v6;

  v4 = a3;
  if (!objc_msgSend(v4, "length"))
    goto LABEL_7;
  if (!objc_msgSend(v4, "isEqual:", CFSTR("TodayGroup")))
  {
    if (objc_msgSend(v4, "isEqual:", CFSTR("FavoriteGroup")))
    {
      v5 = -[WGWidgetListEditViewController favoritesSection](self, "favoritesSection");
      goto LABEL_6;
    }
LABEL_7:
    v6 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_8;
  }
  v5 = -[WGWidgetListEditViewController todaySection](self, "todaySection");
LABEL_6:
  v6 = v5;
LABEL_8:

  return v6;
}

- (id)_itemIdentifiersInSection:(unint64_t)a3
{
  int *v5;
  id v6;

  if (-[WGWidgetListEditViewController todaySection](self, "todaySection") == a3)
  {
    v5 = &OBJC_IVAR___WGWidgetListEditViewController__enabledTodayItemIDs;
  }
  else if (-[WGWidgetListEditViewController favoritesSection](self, "favoritesSection") == a3)
  {
    v5 = &OBJC_IVAR___WGWidgetListEditViewController__favoriteItemIDs;
  }
  else
  {
    if (-[WGWidgetListEditViewController disabledWidgetsSection](self, "disabledWidgetsSection") != a3)
    {
      v6 = 0;
      return v6;
    }
    v5 = &OBJC_IVAR___WGWidgetListEditViewController__disabledItemIDs;
  }
  v6 = *(id *)((char *)&self->super.super.super.isa + *v5);
  return v6;
}

- (id)_indexPathForItemWithIdentifier:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v5 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  v6 = MEMORY[0x24BDAC760];
  do
  {
    -[UITableViewController tableView](self->_tableViewController, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[WGWidgetListEditViewController numberOfSectionsInTableView:](self, "numberOfSectionsInTableView:", v7);

    if (v5 >= v8)
      break;
    -[WGWidgetListEditViewController _itemIdentifiersInSection:](self, "_itemIdentifiersInSection:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __66__WGWidgetListEditViewController__indexPathForItemWithIdentifier___block_invoke;
    v13[3] = &unk_24D731760;
    v14 = v4;
    v15 = &v17;
    v16 = v5;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v13);

    v10 = v18[5];
    ++v5;
  }
  while (!v10);
  v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __66__WGWidgetListEditViewController__indexPathForItemWithIdentifier___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;

  if (objc_msgSend(a2, "isEqual:", a1[4]))
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", a3, a1[6]);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1[5] + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    *a4 = 1;
  }
}

- (void)_enableItemAtIndexPath:(id)a3 inTableView:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  int64_t v10;
  int64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;

  v6 = a3;
  v7 = a4;
  -[WGWidgetListEditViewController _itemIdentifierForIndexPath:](self, "_itemIdentifierForIndexPath:", v6);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "widgetListEditViewController:defaultGroupForItemWithIdentifier:", self, v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[WGWidgetListEditViewController _sectionIndexForGroupKey:](self, "_sectionIndexForGroupKey:", v9);
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    v10 = -[WGWidgetListEditViewController todaySection](self, "todaySection");
  v11 = -[WGWidgetListEditViewController _indexOfLastEnabledWidgetInSection:](self, "_indexOfLastEnabledWidgetInSection:", v10, v17)+ 1;
  -[NSMutableArray removeObject:](self->_disabledItemIDs, "removeObject:", v18);
  -[WGWidgetListEditViewController _itemIdentifiersInSection:](self, "_itemIdentifiersInSection:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "insertObject:atIndex:", v18, v11);

  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v11, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __69__WGWidgetListEditViewController__enableItemAtIndexPath_inTableView___block_invoke;
  v19[3] = &unk_24D731788;
  v20 = v7;
  v21 = v6;
  v22 = v13;
  v14 = v13;
  v15 = v6;
  v16 = v7;
  objc_msgSend(v16, "performBatchUpdates:completion:", v19, 0);

}

void __69__WGWidgetListEditViewController__enableItemAtIndexPath_inTableView___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)a1[4];
  v7[0] = a1[5];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteRowsAtIndexPaths:withRowAnimation:", v3, 100);

  v4 = (void *)a1[4];
  v6 = a1[6];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "insertRowsAtIndexPaths:withRowAnimation:", v5, 100);

}

- (void)_disableItemAtIndexPath:(id)a3 inTableView:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  WGWidgetListEditViewController *v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  -[WGWidgetListEditViewController _itemIdentifierForIndexPath:](self, "_itemIdentifierForIndexPath:", v6);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v8 = -[WGWidgetListEditViewController _indexForInsertingItemWithIdentifier:intoArray:](self, "_indexForInsertingItemWithIdentifier:intoArray:", v13, self->_disabledItemIDs);
  -[NSMutableArray removeObject:](self->_enabledTodayItemIDs, "removeObject:", v13);
  -[NSMutableArray removeObject:](self->_favoriteItemIDs, "removeObject:", v13);
  -[NSMutableArray insertObject:atIndex:](self->_disabledItemIDs, "insertObject:atIndex:", v13, v8);
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v8, -[WGWidgetListEditViewController disabledWidgetsSection](self, "disabledWidgetsSection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __70__WGWidgetListEditViewController__disableItemAtIndexPath_inTableView___block_invoke;
  v14[3] = &unk_24D7317B0;
  v15 = v6;
  v16 = self;
  v17 = v7;
  v18 = v9;
  v10 = v9;
  v11 = v7;
  v12 = v6;
  objc_msgSend(v11, "performBatchUpdates:completion:", v14, 0);

}

void __70__WGWidgetListEditViewController__disableItemAtIndexPath_inTableView___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "section");
  if (v2 == objc_msgSend(*(id *)(a1 + 40), "favoritesSection")
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 992), "count"))
  {
    v7 = *(void **)(a1 + 48);
    v10[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reloadRowsAtIndexPaths:withRowAnimation:", v4, 100);
  }
  else
  {
    v3 = *(void **)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v9, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deleteRowsAtIndexPaths:withRowAnimation:", v4, 100);
  }

  v5 = *(void **)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertRowsAtIndexPaths:withRowAnimation:", v6, 100);

}

- (id)_itemIdentifierForIndexPath:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;

  v4 = a3;
  -[WGWidgetListEditViewController _itemIdentifiersInSection:](self, "_itemIdentifiersInSection:", objc_msgSend(v4, "section"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "row");
  if (v6 >= objc_msgSend(v5, "count"))
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (unint64_t)_indexForInsertingItemWithIdentifier:(id)a3 intoArray:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  _QWORD v11[5];

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v6, "count");
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __81__WGWidgetListEditViewController__indexForInsertingItemWithIdentifier_intoArray___block_invoke;
  v11[3] = &unk_24D7317D8;
  v11[4] = self;
  v9 = objc_msgSend(v6, "indexOfObject:inSortedRange:options:usingComparator:", v7, 0, v8, 1024, v11);

  return v9;
}

uint64_t __81__WGWidgetListEditViewController__indexForInsertingItemWithIdentifier_intoArray___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_compareItemWithIdentifier:andItemWithIdentifierConsideringIsNew:", a2, a3);
}

- (int64_t)_indexOfFirstEnabledWidgetInSection:(unint64_t)a3
{
  return 0;
}

- (int64_t)_indexOfLastEnabledWidgetInSection:(unint64_t)a3
{
  void *v3;
  int64_t v4;

  -[WGWidgetListEditViewController _itemIdentifiersInSection:](self, "_itemIdentifiersInSection:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") - 1;

  return v4;
}

- (BOOL)_isNewItem:(id)a3
{
  WGWidgetListEditViewController *v3;
  WGWidgetListEditViewControllerDataSource **p_dataSource;
  id v5;
  id WeakRetained;

  v3 = self;
  p_dataSource = &self->_dataSource;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  LOBYTE(v3) = objc_msgSend(WeakRetained, "widgetListEditViewController:isItemWithIdentifierNew:", v3, v5);

  return (char)v3;
}

- (int64_t)_compareItemWithIdentifier:(id)a3 andItemWithIdentifierConsideringIsNew:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  int64_t v9;
  id WeakRetained;
  id v11;
  id v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  v8 = -[WGWidgetListEditViewController _isNewItem:](self, "_isNewItem:", v6);
  if (v8 == -[WGWidgetListEditViewController _isNewItem:](self, "_isNewItem:", v7))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(WeakRetained, "widgetListEditViewController:displayNameForItemWithIdentifier:", self, v6);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "widgetListEditViewController:displayNameForItemWithIdentifier:", self, v7);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = v6;
      v12 = v7;
    }
    v13 = v12;
    v9 = objc_msgSend(v11, "localizedStandardCompare:", v12);

  }
  else if (-[WGWidgetListEditViewController _isNewItem:](self, "_isNewItem:", v6))
  {
    v9 = -1;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (id)_widgetListEditViewTableHeaderView
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[UITableViewController tableView](self->_tableViewController, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tableHeaderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (void)pinSwitchChanaged:(id)a3
{
  -[WGWidgetListEditViewController setWidgetsPinned:](self, "setWidgetsPinned:", objc_msgSend(a3, "isOn"));
}

- (void)setWidgetsPinned:(BOOL)a3
{
  _BOOL4 v3;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSMutableArray *enabledTodayItemIDs;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  BOOL v20;

  if (self->_widgetsPinned != a3)
  {
    v3 = a3;
    v5 = -[WGWidgetListEditViewController todaySection](self, "todaySection");
    self->_widgetsPinned = v3;
    v6 = -[WGWidgetListEditViewController todaySection](self, "todaySection");
    if (v3)
      v7 = v5;
    else
      v7 = v6;
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v9 = -[NSMutableArray count](self->_favoriteItemIDs, "count");
    if (v9)
    {
      v10 = v9;
      for (i = 0; i != v10; ++i)
      {
        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", i, v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v12);

      }
    }
    enabledTodayItemIDs = self->_enabledTodayItemIDs;
    if (v3)
      -[NSMutableArray removeObjectsInArray:](enabledTodayItemIDs, "removeObjectsInArray:", self->_favoriteItemIDs);
    else
      -[NSMutableArray replaceObjectsInRange:withObjectsFromArray:](enabledTodayItemIDs, "replaceObjectsInRange:withObjectsFromArray:", 0, 0, self->_favoriteItemIDs);
    -[UITableViewController tableView](self->_tableViewController, "tableView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __51__WGWidgetListEditViewController_setWidgetsPinned___block_invoke;
    v17[3] = &unk_24D731800;
    v20 = v3;
    v18 = v14;
    v19 = v8;
    v15 = v8;
    v16 = v14;
    objc_msgSend(v16, "performBatchUpdates:completion:", v17, 0);

  }
}

uint64_t __51__WGWidgetListEditViewController_setWidgetsPinned___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;

  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(v3, "insertSections:withRowAnimation:", v4, 0);

    return objc_msgSend(*(id *)(a1 + 32), "deleteRowsAtIndexPaths:withRowAnimation:", *(_QWORD *)(a1 + 40), 0);
  }
  else
  {
    objc_msgSend(v3, "deleteSections:withRowAnimation:", v4, 0);

    return objc_msgSend(*(id *)(a1 + 32), "insertRowsAtIndexPaths:withRowAnimation:", *(_QWORD *)(a1 + 40), 0);
  }
}

- (WGWidgetListEditViewControllerDataSource)dataSource
{
  return (WGWidgetListEditViewControllerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (WGWidgetListEditViewControllerDelegate)delegate
{
  return (WGWidgetListEditViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)_isDismissingDueToInterfaceAction
{
  return self->_dismissingDueToInterfaceAction;
}

- (void)_setDismissingDueToInterfaceAction:(BOOL)a3
{
  self->_dismissingDueToInterfaceAction = a3;
}

- (id)_statusBarColorAssertion
{
  return self->_statusBarColorAssertion;
}

- (void)_setStatusBarColorAssertion:(id)a3
{
  objc_storeStrong(&self->_statusBarColorAssertion, a3);
}

- (BOOL)showsPinSection
{
  return self->_showsPinSection;
}

- (void)setShowsPinSection:(BOOL)a3
{
  self->_showsPinSection = a3;
}

- (BOOL)showsFavorites
{
  return self->_showsFavorites;
}

- (void)setShowsFavorites:(BOOL)a3
{
  self->_showsFavorites = a3;
}

- (BOOL)wereWidgetsPinnedOriginally
{
  return self->_widgetsPinnedOriginally;
}

- (void)setWidgetsPinnedOriginally:(BOOL)a3
{
  self->_widgetsPinnedOriginally = a3;
}

- (BOOL)areWidgetsPinned
{
  return self->_widgetsPinned;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_statusBarColorAssertion, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_originalFavoriteItemIDs, 0);
  objc_storeStrong((id *)&self->_groupIDs, 0);
  objc_storeStrong((id *)&self->_disabledItemIDs, 0);
  objc_storeStrong((id *)&self->_favoriteItemIDs, 0);
  objc_storeStrong((id *)&self->_enabledTodayItemIDs, 0);
  objc_storeStrong((id *)&self->_tableViewController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
}

@end
