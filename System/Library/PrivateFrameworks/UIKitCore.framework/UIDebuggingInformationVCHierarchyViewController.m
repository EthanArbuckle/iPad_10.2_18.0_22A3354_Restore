@implementation UIDebuggingInformationVCHierarchyViewController

- (UIDebuggingInformationVCHierarchyViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  UIDebuggingInformationVCHierarchyViewController *v4;
  UITableView *v5;
  UITableView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIDebuggingInformationVCHierarchyViewController;
  v4 = -[UIViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    v5 = [UITableView alloc];
    v6 = -[UITableView initWithFrame:style:](v5, "initWithFrame:style:", 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[UITableView setDataSource:](v6, "setDataSource:", v4);
    -[UITableView setDelegate:](v6, "setDelegate:", v4);
    -[UITableView setRowHeight:](v6, "setRowHeight:", -1.0);
    -[UIDebuggingInformationVCHierarchyViewController setTableView:](v4, "setTableView:", v6);

  }
  return v4;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UIDebuggingInformationVCHierarchyViewController;
  -[UIViewController viewDidLoad](&v11, sel_viewDidLoad);
  -[UIViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAutoresizingMask:", 18);

  -[UIDebuggingInformationVCHierarchyViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAutoresizingMask:", 18);

  -[UIViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDebuggingInformationVCHierarchyViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

  -[UIDebuggingInformationVCHierarchyViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  objc_msgSend(v7, "setFrame:");

  -[UIViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColor whiteColor](UIColor, "whiteColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v10);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIDebuggingInformationVCHierarchyViewController;
  -[UIViewController viewWillAppear:](&v9, sel_viewWillAppear_, a3);
  +[UIDebuggingInformationOverlay overlay](UIDebuggingInformationOverlay, "overlay");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inspectedWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rootViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDebuggingInformationVCHierarchyViewController getViewControllersRecursiveWithLevel:forView:](self, "getViewControllersRecursiveWithLevel:forView:", 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDebuggingInformationVCHierarchyViewController setData:](self, "setData:", v7);

  -[UIDebuggingInformationVCHierarchyViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reloadData");

}

- (id)getViewControllersRecursiveWithLevel:(int)a3 forView:(id)a4
{
  id v6;
  UIDebuggingInformationVCHierarchyDataContainer *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = -[UIDebuggingInformationVCHierarchyDataContainer initWithViewController:atLevel:]([UIDebuggingInformationVCHierarchyDataContainer alloc], "initWithViewController:atLevel:", v6, a3);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v6, "childViewControllers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    v13 = (a3 + 1);
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        -[UIDebuggingInformationVCHierarchyViewController getViewControllersRecursiveWithLevel:forView:](self, "getViewControllersRecursiveWithLevel:forView:", v13, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObjectsFromArray:", v15);

        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  v16 = (void *)objc_msgSend(v8, "copy");
  return v16;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  UIDebuggingInformationVCDetailViewController *v9;
  void *v10;
  id v11;

  v5 = a4;
  -[UIDebuggingInformationVCHierarchyViewController data](self, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewController");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(UIDebuggingInformationVCDetailViewController);
  -[UIDebuggingInformationVCDetailViewController inspectVC:](v9, "inspectVC:", v11);
  -[UIViewController navigationController](self, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pushViewController:animated:", v9, 1);

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  UITableViewCell *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_class *v11;
  __CFString *v12;
  void *v13;

  v5 = a4;
  v6 = -[UITableViewCell initWithStyle:reuseIdentifier:]([UITableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("kCellReuseIdentifier"));
  -[UIDebuggingInformationVCHierarchyViewController data](self, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "row");

  objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = CFSTR("Deallocated");
  }
  -[UITableViewCell textLabel](v6, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v12);

  -[UITableViewCell setSelectionStyle:](v6, "setSelectionStyle:", 3);
  -[UITableViewCell setAccessoryType:](v6, "setAccessoryType:", 1);

  return v6;
}

- (int64_t)tableView:(id)a3 indentationLevelForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int64_t v9;

  v5 = a4;
  -[UIDebuggingInformationVCHierarchyViewController data](self, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "level");

  return v9;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[UIDebuggingInformationVCHierarchyViewController data](self, "data", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (NSArray)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
