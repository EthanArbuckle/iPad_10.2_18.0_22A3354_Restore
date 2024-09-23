@implementation UIDebuggingInformationListTableViewController

- (UIDebuggingInformationListTableViewController)initWithStyle:(int64_t)a3
{
  UIDebuggingInformationListTableViewController *v3;
  NSMutableArray *v4;
  NSMutableArray *topLevelViewControllers;
  NSMutableArray *v6;
  NSMutableArray *topLevelViewControllerNames;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIDebuggingInformationListTableViewController;
  v3 = -[UITableViewController initWithStyle:](&v9, sel_initWithStyle_, a3);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    topLevelViewControllers = v3->topLevelViewControllers;
    v3->topLevelViewControllers = v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    topLevelViewControllerNames = v3->topLevelViewControllerNames;
    v3->topLevelViewControllerNames = v6;

  }
  return v3;
}

- (void)toggleOverlayFullscreen
{
  id v2;

  +[UIDebuggingInformationOverlay overlay](UIDebuggingInformationOverlay, "overlay");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toggleFullscreen");

}

- (void)toggleOverlayVisibility
{
  id v2;

  +[UIDebuggingInformationOverlay overlay](UIDebuggingInformationOverlay, "overlay");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toggleVisibility");

}

- (void)viewDidLoad
{
  void *v3;
  UIView *v4;
  void *v5;
  UIView *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIDebuggingInformationListTableViewController;
  -[UIViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[UITableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("kReuseIdentifier"));

  v4 = [UIView alloc];
  -[UITableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v6 = -[UIView initWithFrame:](v4, "initWithFrame:", 0.0, 0.0);
  -[UITableViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTableFooterView:", v6);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSMutableArray count](self->topLevelViewControllerNames, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSMutableArray *topLevelViewControllerNames;
  uint64_t v10;
  void *v11;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("kReuseIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  topLevelViewControllerNames = self->topLevelViewControllerNames;
  v10 = objc_msgSend(v6, "row");

  -[NSMutableArray objectAtIndex:](topLevelViewControllerNames, "objectAtIndex:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v11);

  objc_msgSend(v7, "setAccessoryType:", 1);
  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  NSMutableArray *topLevelViewControllers;
  id v6;
  NSMutableArray *topLevelViewControllerNames;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  topLevelViewControllers = self->topLevelViewControllers;
  v6 = a4;
  -[NSMutableArray objectAtIndex:](topLevelViewControllers, "objectAtIndex:", objc_msgSend(v6, "row"));
  v19 = (id)objc_claimAutoreleasedReturnValue();
  topLevelViewControllerNames = self->topLevelViewControllerNames;
  v8 = objc_msgSend(v6, "row");

  -[NSMutableArray objectAtIndexedSubscript:](topLevelViewControllerNames, "objectAtIndexedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTitle:", v9);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v19, "prepareForDisplayAsTopLevelDebuggingViewController");
  objc_msgSend(v19, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rightBarButtonItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (!v12)
  {
    -[UIViewController navigationController](self, "navigationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "topViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "navigationItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "rightBarButtonItems");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "navigationItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setRightBarButtonItems:", v16);

  }
  -[UIViewController navigationController](self, "navigationController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "pushViewController:animated:", v19, 1);

}

- (void)addTopLevelViewController:(id)a3 forName:(id)a4
{
  NSMutableArray *topLevelViewControllers;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  topLevelViewControllers = self->topLevelViewControllers;
  v7 = a4;
  -[NSMutableArray addObject:](topLevelViewControllers, "addObject:", v9);
  -[NSMutableArray addObject:](self->topLevelViewControllerNames, "addObject:", v7);

  -[UITableViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reloadData");

}

- (id)topLevelViewControllerForName:(id)a3
{
  uint64_t v4;
  void *v5;

  v4 = -[NSMutableArray indexOfObjectIdenticalTo:](self->topLevelViewControllerNames, "indexOfObjectIdenticalTo:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->topLevelViewControllers, "objectAtIndex:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->topLevelViewControllerNames, 0);
  objc_storeStrong((id *)&self->topLevelViewControllers, 0);
}

@end
