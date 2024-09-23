@implementation UIDebuggingInformationInspectorDetailViewController

- (UIDebuggingInformationInspectorDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  UIDebuggingInformationInspectorDetailViewController *v4;
  UITableView *v5;
  UITableView *v6;
  UITableView *tableView;
  UITableView *v8;
  UIBarButtonItem *v9;
  UIBarButtonItem *v10;
  void *v11;
  void *v12;
  objc_super v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)UIDebuggingInformationInspectorDetailViewController;
  v4 = -[UIViewController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    v5 = [UITableView alloc];
    v6 = -[UITableView initWithFrame:style:](v5, "initWithFrame:style:", 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[UITableView setDataSource:](v6, "setDataSource:", v4);
    -[UITableView setDelegate:](v6, "setDelegate:", v4);
    -[UITableView setRowHeight:](v6, "setRowHeight:", -1.0);
    tableView = v4->_tableView;
    v4->_tableView = v6;
    v8 = v6;

    v9 = -[UIBarButtonItem initWithBarButtonSystemItem:target:action:]([UIBarButtonItem alloc], "initWithBarButtonSystemItem:target:action:", 16, v4, sel__flush);
    v15[0] = v9;
    v10 = -[UIBarButtonItem initWithBarButtonSystemItem:target:action:]([UIBarButtonItem alloc], "initWithBarButtonSystemItem:target:action:", 13, v4, sel__forceViewLayout);
    v15[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIViewController navigationItem](v4, "navigationItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setRightBarButtonItems:", v11);

  }
  return v4;
}

- (void)_flush
{
  objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
}

- (void)_forceViewLayout
{
  UIView **p_inspectedView;
  id WeakRetained;
  id v4;

  p_inspectedView = &self->_inspectedView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_inspectedView);
  objc_msgSend(WeakRetained, "setNeedsLayout");

  v4 = objc_loadWeakRetained((id *)p_inspectedView);
  objc_msgSend(v4, "layoutIfNeeded");

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
  v9.super_class = (Class)UIDebuggingInformationInspectorDetailViewController;
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
  id WeakRetained;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIDebuggingInformationInspectorDetailViewController;
  -[UIViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_inspectedView);

  if (WeakRetained)
  {
    -[UIDebuggingInformationInspectorDetailViewController _updateData](self, "_updateData");
    -[UITableView reloadData](self->_tableView, "reloadData");
  }
}

- (void)_updateData
{
  id WeakRetained;
  objc_class *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  _UIDebuggingOverlayDetailOpacity *v23;
  void *v24;
  id v25;
  id v26;
  int v27;
  __CFString *v28;
  __CFString *v29;
  void *v30;
  NSArray *v31;
  NSArray *data;
  NSArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _QWORD v46[9];
  UIEdgeInsets v47;

  v46[7] = *MEMORY[0x1E0C80C00];
  if (!-[NSArray count](self->_data, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_inspectedView);
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIDebuggingOverlayDetail detailWithTitle:detail:](_UIDebuggingOverlayDetail, "detailWithTitle:detail:", CFSTR("Class"), v5);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_loadWeakRetained((id *)&self->_inspectedView);
    objc_msgSend(v6, "frame");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{{%.2f %.2f}, {%.2f %.2f}}"), v7, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIDebuggingOverlayDetail detailWithTitle:detail:](_UIDebuggingOverlayDetail, "detailWithTitle:detail:", CFSTR("Frame"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_loadWeakRetained((id *)&self->_inspectedView);
    objc_msgSend(v13, "bounds");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{{%.2f %.2f}, {%.2f %.2f}}"), v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIDebuggingOverlayDetail detailWithTitle:detail:](_UIDebuggingOverlayDetail, "detailWithTitle:detail:", CFSTR("Bounds"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_loadWeakRetained((id *)&self->_inspectedView);
    objc_msgSend(v20, "safeAreaInsets");
    NSStringFromUIEdgeInsets(v47);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIDebuggingOverlayDetail detailWithTitle:detail:](_UIDebuggingOverlayDetail, "detailWithTitle:detail:", CFSTR("Safe Area"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_alloc_init(_UIDebuggingOverlayDetailOpacity);
    +[_UIDebuggingOverlayDetail detailWithTitle:detail:](_UIDebuggingOverlayDetailIvar, "detailWithTitle:detail:", CFSTR("iVar Description"), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDebuggingOverlayDetail setTitle:](v23, "setTitle:", CFSTR("Opacity"));
    v25 = objc_loadWeakRetained((id *)&self->_inspectedView);
    -[_UIDebuggingOverlayDetailOpacity _updateForInspectedView:](v23, "_updateForInspectedView:", v25);

    v26 = objc_loadWeakRetained((id *)&self->_inspectedView);
    v27 = objc_msgSend(v26, "_wantsAutolayout");
    v28 = CFSTR("No");
    if (v27)
      v28 = CFSTR("Yes");
    v29 = v28;

    +[_UIDebuggingOverlayDetail detailWithTitle:detail:](_UIDebuggingOverlayDetail, "detailWithTitle:detail:", CFSTR("Auto Layout"), v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v46[0] = v40;
    v46[1] = v24;
    v46[2] = v12;
    v46[3] = v19;
    v46[4] = v22;
    v46[5] = v23;
    v46[6] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 7);
    v31 = (NSArray *)objc_claimAutoreleasedReturnValue();
    data = self->_data;
    self->_data = v31;

  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v33 = self->_data;
  v34 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v42;
    do
    {
      v37 = 0;
      do
      {
        if (*(_QWORD *)v42 != v36)
          objc_enumerationMutation(v33);
        v38 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v37);
        v39 = objc_loadWeakRetained((id *)&self->_inspectedView);
        objc_msgSend(v38, "_updateForInspectedView:", v39);

        ++v37;
      }
      while (v35 != v37);
      v35 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v35);
  }

}

- (void)inspectView:(id)a3
{
  objc_storeWeak((id *)&self->_inspectedView, a3);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[NSArray objectAtIndexedSubscript:](self->_data, "objectAtIndexedSubscript:", objc_msgSend(a4, "row", a3));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIViewController navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pushViewController:animated:", v7, 1);

  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  UITableViewCell *v6;
  NSArray *data;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = a4;
  v6 = -[UITableViewCell initWithStyle:reuseIdentifier:]([UITableViewCell alloc], "initWithStyle:reuseIdentifier:", 3, CFSTR("kCellReuseIdentifierDetail"));
  data = self->_data;
  v8 = objc_msgSend(v5, "row");

  -[NSArray objectAtIndexedSubscript:](data, "objectAtIndexedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v11 = 3;
  else
    v11 = 0;
  -[UITableViewCell setSelectionStyle:](v6, "setSelectionStyle:", v11);

  objc_msgSend(v9, "viewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewCell setAccessoryType:](v6, "setAccessoryType:", v12 != 0);

  objc_msgSend(v9, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewCell textLabel](v6, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v13);

  objc_msgSend(v9, "detail");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewCell detailTextLabel](v6, "detailTextLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:", v15);

  objc_msgSend(v9, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewCell setAccessoryView:](v6, "setAccessoryView:", v17);

  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_data, "count", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_destroyWeak((id *)&self->_inspectedView);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
