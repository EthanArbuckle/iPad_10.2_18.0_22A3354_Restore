@implementation UIDebuggingInformationVCDetailViewController

- (UIDebuggingInformationVCDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  UIDebuggingInformationVCDetailViewController *v4;
  UITableView *v5;
  UITableView *v6;
  UITableView *tableView;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIDebuggingInformationVCDetailViewController;
  v4 = -[UIViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    v5 = [UITableView alloc];
    v6 = -[UITableView initWithFrame:style:](v5, "initWithFrame:style:", 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[UITableView setDataSource:](v6, "setDataSource:", v4);
    -[UITableView setDelegate:](v6, "setDelegate:", v4);
    -[UITableView setRowHeight:](v6, "setRowHeight:", -1.0);
    tableView = v4->_tableView;
    v4->_tableView = v6;

  }
  return v4;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  UITableView *tableView;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIDebuggingInformationVCDetailViewController;
  -[UIViewController viewDidLoad](&v9, sel_viewDidLoad);
  +[UIColor whiteColor](UIColor, "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[UIViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAutoresizingMask:", 18);

  -[UIView setAutoresizingMask:](self->_tableView, "setAutoresizingMask:", 18);
  tableView = self->_tableView;
  -[UIViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  -[UITableView setFrame:](tableView, "setFrame:");

  -[UIViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", self->_tableView);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIDebuggingInformationVCDetailViewController;
  -[UIViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[UIDebuggingInformationVCDetailViewController _updateDataAndReload:](self, "_updateDataAndReload:", 1);
}

- (void)inspectVC:(id)a3
{
  -[UIDebuggingInformationVCDetailViewController setInspectedVC:](self, "setInspectedVC:", a3);
  -[UIDebuggingInformationVCDetailViewController _updateDataAndReload:](self, "_updateDataAndReload:", 1);
}

- (void)_updateDataAndReload:(BOOL)a3
{
  _BOOL4 v3;
  id WeakRetained;
  objc_class *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  unint64_t v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  NSArray *v21;
  NSArray *data;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  NSArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _QWORD v39[8];

  v3 = a3;
  v39[6] = *MEMORY[0x1E0C80C00];
  if (!self->_data)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_inspectedVC);
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIDebuggingOverlayDetail detailWithTitle:detail:](_UIDebuggingOverlayViewControllerDetail, "detailWithTitle:detail:", CFSTR("Class"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_loadWeakRetained((id *)&self->_inspectedVC);
    objc_msgSend(v9, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIDebuggingOverlayDetail detailWithTitle:detail:](_UIDebuggingOverlayViewDetail, "detailWithTitle:detail:", CFSTR("View"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    +[_UIDebuggingOverlayDetail detailWithTitle:detail:](_UIDebuggingOverlayPresentingViewControllerDetail, "detailWithTitle:detail:", CFSTR("Presenting"), CFSTR("None"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIDebuggingOverlayDetail detailWithTitle:detail:](_UIDebuggingOverlayPresentedViewControllerDetail, "detailWithTitle:detail:", CFSTR("Presented"), CFSTR("None"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_loadWeakRetained((id *)&self->_inspectedVC);
    v17 = objc_msgSend(v16, "modalPresentationStyle") + 1;
    if (v17 > 9)
      v18 = CFSTR("Unknown");
    else
      v18 = off_1E16E7C60[v17];
    +[_UIDebuggingOverlayDetail detailWithTitle:detail:](_UIDebuggingOverlayViewControllerDetail, "detailWithTitle:detail:", CFSTR("Modal"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    +[_UIDebuggingOverlayDetail detailWithTitle:detail:](_UIDebuggingOverlayDetailIvar, "detailWithTitle:detail:", CFSTR("iVar Description"), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v8;
    v39[1] = v13;
    v39[2] = v14;
    v39[3] = v15;
    v39[4] = v19;
    v39[5] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 6);
    v21 = (NSArray *)objc_claimAutoreleasedReturnValue();
    data = self->_data;
    self->_data = v21;

  }
  -[UIViewController viewIfLoaded](self, "viewIfLoaded");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[UIViewController view](self, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "window");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v27 = self->_data;
      v28 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v35;
        do
        {
          v31 = 0;
          do
          {
            if (*(_QWORD *)v35 != v30)
              objc_enumerationMutation(v27);
            v32 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v31);
            v33 = objc_loadWeakRetained((id *)&self->_inspectedVC);
            objc_msgSend(v32, "_updateForInspectedViewController:", v33, (_QWORD)v34);

            ++v31;
          }
          while (v29 != v31);
          v29 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        }
        while (v29);
      }

      if (v3)
        -[UITableView reloadData](self->_tableView, "reloadData");
    }
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  UIDebuggingInformationVCDetailViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  if (objc_msgSend(v11, "section"))
  {
    v5 = objc_alloc_init(UIDebuggingInformationVCDetailViewController);
    -[UIDebuggingInformationVCDetailViewController inspectedVC](self, "inspectedVC");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "childViewControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v11, "row"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDebuggingInformationVCDetailViewController setInspectedVC:](v5, "setInspectedVC:", v8);

LABEL_4:
    -[UIViewController navigationController](self, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pushViewController:animated:", v5, 1);

    goto LABEL_5;
  }
  -[NSArray objectAtIndexedSubscript:](self->_data, "objectAtIndexedSubscript:", objc_msgSend(v11, "row"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewController");
  v5 = (UIDebuggingInformationVCDetailViewController *)objc_claimAutoreleasedReturnValue();

  if (v5)
    goto LABEL_4;
LABEL_5:

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  UITableViewCell *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v5 = a4;
  v6 = -[UITableViewCell initWithStyle:reuseIdentifier:]([UITableViewCell alloc], "initWithStyle:reuseIdentifier:", 3, CFSTR("kCellReuseIdentifierDetail"));
  -[NSArray objectAtIndexedSubscript:](self->_data, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "section"))
  {
    -[UIDebuggingInformationVCDetailViewController inspectedVC](self, "inspectedVC");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "childViewControllers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell textLabel](v6, "textLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v12);

    -[UITableViewCell setAccessoryType:](v6, "setAccessoryType:", 1);
  }
  else
  {
    objc_msgSend(v7, "viewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      v15 = 3;
    else
      v15 = 0;
    -[UITableViewCell setSelectionStyle:](v6, "setSelectionStyle:", v15);

    objc_msgSend(v7, "viewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell setAccessoryType:](v6, "setAccessoryType:", v16 != 0);

    objc_msgSend(v7, "title");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell textLabel](v6, "textLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setText:", v17);

    objc_msgSend(v7, "detail");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell detailTextLabel](v6, "detailTextLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setText:", v19);

  }
  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  int64_t v8;

  -[UIDebuggingInformationVCDetailViewController _updateDataAndReload:](self, "_updateDataAndReload:", 0);
  if (!a4)
    return -[NSArray count](self->_data, "count");
  -[UIDebuggingInformationVCDetailViewController inspectedVC](self, "inspectedVC");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "childViewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4)
    return CFSTR("Children");
  else
    return CFSTR("Info");
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  -[UIDebuggingInformationVCDetailViewController inspectedVC](self, "inspectedVC", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "childViewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
    v5 = 2;
  else
    v5 = 1;

  return v5;
}

- (UIViewController)inspectedVC
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_inspectedVC);
}

- (void)setInspectedVC:(id)a3
{
  objc_storeWeak((id *)&self->_inspectedVC, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_inspectedVC);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
