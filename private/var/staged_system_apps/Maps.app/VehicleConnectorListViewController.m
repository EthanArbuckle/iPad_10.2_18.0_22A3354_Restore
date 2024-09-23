@implementation VehicleConnectorListViewController

- (VehicleConnectorListViewController)initWithVehicle:(id)a3
{
  id v5;
  VehicleConnectorListViewController *v6;
  VehicleConnectorListViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VehicleConnectorListViewController;
  v6 = -[VehicleConnectorListViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_vehicle, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v7->_editingEnabled = objc_msgSend(v8, "BOOLForKey:", CFSTR("VirtualGarageEditConnectorPlugs"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("[Virtual Garage][Title] Plug Type"), CFSTR("localized string not found"), 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleConnectorListViewController navigationItem](v7, "navigationItem"));
    objc_msgSend(v11, "setTitle:", v10);

  }
  return v7;
}

- (UITableView)tableView
{
  UITableView *tableView;
  UITableView *v4;
  UITableView *v5;
  UITableView *v6;
  uint64_t v7;
  objc_class *v8;
  NSString *v9;
  void *v10;

  tableView = self->_tableView;
  if (!tableView)
  {
    v4 = (UITableView *)objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_tableView;
    self->_tableView = v4;

    -[UITableView setAccessibilityIdentifier:](self->_tableView, "setAccessibilityIdentifier:", CFSTR("VehicleConnectorListTableView"));
    -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
    -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
    v6 = self->_tableView;
    v7 = objc_opt_class(VehicleConnectorCell);
    v8 = (objc_class *)objc_opt_class(VehicleConnectorCell);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    -[UITableView registerClass:forCellReuseIdentifier:](v6, "registerClass:forCellReuseIdentifier:", v7, v10);

    tableView = self->_tableView;
  }
  return tableView;
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;
  _QWORD v30[4];

  v29.receiver = self;
  v29.super_class = (Class)VehicleConnectorListViewController;
  -[VehicleConnectorListViewController viewDidLoad](&v29, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleConnectorListViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("VehicleConnectorListView"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGroupedBackgroundColor](UIColor, "systemGroupedBackgroundColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleConnectorListViewController view](self, "view"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleConnectorListViewController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleConnectorListViewController tableView](self, "tableView"));
  objc_msgSend(v6, "addSubview:", v7);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleConnectorListViewController tableView](self, "tableView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "leadingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleConnectorListViewController view](self, "view"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "leadingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v25));
  v30[0] = v24;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleConnectorListViewController tableView](self, "tableView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleConnectorListViewController view](self, "view"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v20));
  v30[1] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleConnectorListViewController tableView](self, "tableView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleConnectorListViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
  v30[2] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleConnectorListViewController tableView](self, "tableView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bottomAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleConnectorListViewController view](self, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v15));
  v30[3] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSArray *v6;
  NSArray *unpackedConnectorTypes;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  objc_super v13;

  v3 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VehicleConnectorListViewController;
  -[VehicleConnectorListViewController viewWillAppear:](&v13, "viewWillAppear:");
  v5 = VGChargingConnectorTypeOptionsUnpacked(-[VGVehicle supportedConnectors](self->_vehicle, "supportedConnectors"));
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue(v5);
  unpackedConnectorTypes = self->_unpackedConnectorTypes;
  self->_unpackedConnectorTypes = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleConnectorListViewController tableView](self, "tableView"));
  objc_msgSend(v8, "reloadData");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleConnectorListViewController traitCollection](self, "traitCollection"));
  v10 = objc_msgSend(v9, "userInterfaceIdiom");

  if (!v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    objc_msgSend(v11, "setLockedOrientations:", 2);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    objc_msgSend(v12, "setOrientation:animated:", 1, v3);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VehicleConnectorListViewController;
  -[VehicleConnectorListViewController viewWillDisappear:](&v7, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleConnectorListViewController traitCollection](self, "traitCollection"));
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    objc_msgSend(v6, "setLockedOrientations:", 0);

  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (self->_editingEnabled)
    return 2;
  else
    return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4)
    return 1;
  else
    return -[NSArray count](self->_unpackedConnectorTypes, "count", a3);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSArray *unpackedConnectorTypes;
  id v21;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v6, "section");
  v9 = (objc_class *)objc_opt_class(VehicleConnectorCell);
  v10 = NSStringFromClass(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v11, v6));
  if (v8)
  {

    objc_msgSend(v12, "setSelectionStyle:", 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("[Virtual Garage][Button] Add Adapter Plug"), CFSTR("localized string not found"), 0));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "textLabel"));
    objc_msgSend(v15, "setText:", v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "textLabel"));
    objc_msgSend(v17, "setTextColor:", v16);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "textLabel"));
    objc_msgSend(v19, "setFont:", v18);

  }
  else
  {

    unpackedConnectorTypes = self->_unpackedConnectorTypes;
    v21 = objc_msgSend(v6, "row");

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](unpackedConnectorTypes, "objectAtIndexedSubscript:", v21));
    objc_msgSend(v12, "setConnectorType:", objc_msgSend(v18, "unsignedIntegerValue"));
  }

  return v12;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v4;
  double result;

  v4 = objc_msgSend(a4, "section", a3);
  result = 44.0;
  if (!v4)
    return 72.0;
  return result;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  EditVehicleConnectorsViewController *v9;

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  v7 = objc_msgSend(v6, "section");

  if (v7)
  {
    v9 = -[EditVehicleConnectorsViewController initWithVehicle:]([EditVehicleConnectorsViewController alloc], "initWithVehicle:", self->_vehicle);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleConnectorListViewController navigationController](self, "navigationController"));
    objc_msgSend(v8, "pushViewController:animated:", v9, 1);

  }
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_unpackedConnectorTypes, 0);
  objc_storeStrong((id *)&self->_vehicle, 0);
}

@end
