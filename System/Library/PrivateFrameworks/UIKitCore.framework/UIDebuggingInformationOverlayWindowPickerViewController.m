@implementation UIDebuggingInformationOverlayWindowPickerViewController

- (UIDebuggingInformationOverlayWindowPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  UIDebuggingInformationOverlayWindowPickerViewController *v4;
  UIDebuggingInformationOverlayWindowPickerViewController *v5;
  UITableView *v6;
  UITableView *v7;
  UITableView *tableView;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UIDebuggingInformationOverlayWindowPickerViewController;
  v4 = -[UIViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[UIViewController setTitle:](v4, "setTitle:", CFSTR("Current Window"));
    v6 = [UITableView alloc];
    v7 = -[UITableView initWithFrame:style:](v6, "initWithFrame:style:", 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[UITableView setDataSource:](v7, "setDataSource:", v5);
    -[UITableView setDelegate:](v7, "setDelegate:", v5);
    -[UITableView setRowHeight:](v7, "setRowHeight:", -1.0);
    tableView = v5->_tableView;
    v5->_tableView = v7;

  }
  return v5;
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
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UIDebuggingInformationOverlayWindowPickerViewController;
  -[UIViewController viewDidLoad](&v12, sel_viewDidLoad);
  +[UIColor whiteColor](UIColor, "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[UIViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAutoresizingMask:", 18);

  -[UIDebuggingInformationOverlayWindowPickerViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAutoresizingMask:", 18);

  -[UIDebuggingInformationOverlayWindowPickerViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  objc_msgSend(v7, "setFrame:");

  -[UIViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDebuggingInformationOverlayWindowPickerViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v10);

  -[UIDebuggingInformationOverlayWindowPickerViewController loadData](self, "loadData");
  -[UIDebuggingInformationOverlayWindowPickerViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reloadData");

}

- (void)loadData
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[UIViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:forScreen:](UIWindow, "allWindowsIncludingInternalWindows:onlyVisibleWindows:forScreen:", 1, 0, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[UIDebuggingInformationOverlayWindowPickerViewController setWindows:](self, "setWindows:", v6);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  +[UIDebuggingInformationOverlay overlay](UIDebuggingInformationOverlay, "overlay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inspectedWindow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDebuggingInformationOverlayWindowPickerViewController windows](self, "windows");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v13, "row"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v8)
  {
    -[UIDebuggingInformationOverlayWindowPickerViewController windows](self, "windows");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v13, "row"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIDebuggingInformationOverlay overlay](UIDebuggingInformationOverlay, "overlay");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setInspectedWindow:", v10);

    -[UIDebuggingInformationOverlayWindowPickerViewController tableView](self, "tableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reloadData");

  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  UITableViewCell *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;

  v5 = a4;
  -[UIDebuggingInformationOverlayWindowPickerViewController windows](self, "windows");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[UITableViewCell initWithStyle:reuseIdentifier:]([UITableViewCell alloc], "initWithStyle:reuseIdentifier:", 1, CFSTR("kCellReuseIdentifierWindows"));
  -[UITableViewCell textLabel](v10, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v9);

  -[UIDebuggingInformationOverlayWindowPickerViewController windows](self, "windows");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v5, "row");

  objc_msgSend(v12, "objectAtIndexedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDebuggingInformationOverlay overlay](UIDebuggingInformationOverlay, "overlay");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "inspectedWindow");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 == v16)
    v17 = 3;
  else
    v17 = 0;
  if (v14 == v16)
    v18 = 0;
  else
    v18 = 3;
  -[UITableViewCell setAccessoryType:](v10, "setAccessoryType:", v17);
  -[UITableViewCell setSelectionStyle:](v10, "setSelectionStyle:", v18);

  return v10;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[UIDebuggingInformationOverlayWindowPickerViewController windows](self, "windows", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (NSArray)windows
{
  return self->_windows;
}

- (void)setWindows:(id)a3
{
  objc_storeStrong((id *)&self->_windows, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windows, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
