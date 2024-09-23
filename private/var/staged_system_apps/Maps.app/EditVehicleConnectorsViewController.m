@implementation EditVehicleConnectorsViewController

- (EditVehicleConnectorsViewController)initWithVehicle:(id)a3
{
  id v5;
  EditVehicleConnectorsViewController *v6;
  EditVehicleConnectorsViewController *v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *startingConnectorTypes;
  NSMutableArray *v11;
  NSMutableArray *currentConnectorTypes;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)EditVehicleConnectorsViewController;
  v6 = -[EditVehicleConnectorsViewController initWithNibName:bundle:](&v21, "initWithNibName:bundle:", 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_vehicle, a3);
    v8 = VGChargingConnectorTypeOptionsUnpacked(objc_msgSend(v5, "supportedConnectors"));
    v9 = objc_claimAutoreleasedReturnValue(v8);
    startingConnectorTypes = v7->_startingConnectorTypes;
    v7->_startingConnectorTypes = (NSArray *)v9;

    v11 = (NSMutableArray *)-[NSArray mutableCopy](v7->_startingConnectorTypes, "mutableCopy");
    currentConnectorTypes = v7->_currentConnectorTypes;
    v7->_currentConnectorTypes = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("[Virtual Garage][Title] Add Adapter Plug"), CFSTR("localized string not found"), 0));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleConnectorsViewController navigationItem](v7, "navigationItem"));
    objc_msgSend(v15, "setTitle:", v14);

    v16 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, v7, "pressedCancel");
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleConnectorsViewController navigationItem](v7, "navigationItem"));
    objc_msgSend(v17, "setLeftBarButtonItem:", v16);

    v18 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, v7, "pressedDone");
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleConnectorsViewController navigationItem](v7, "navigationItem"));
    objc_msgSend(v19, "setRightBarButtonItem:", v18);

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
  void *v11;

  tableView = self->_tableView;
  if (!tableView)
  {
    v4 = (UITableView *)objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_tableView;
    self->_tableView = v4;

    -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
    -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
    v6 = self->_tableView;
    v7 = objc_opt_class(VehicleConnectorCell);
    v8 = (objc_class *)objc_opt_class(VehicleConnectorCell);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    -[UITableView registerClass:forCellReuseIdentifier:](v6, "registerClass:forCellReuseIdentifier:", v7, v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleConnectorsViewController tableFooterView](self, "tableFooterView"));
    -[UITableView setTableFooterView:](self->_tableView, "setTableFooterView:", v11);

    tableView = self->_tableView;
  }
  return tableView;
}

- (UIView)tableFooterView
{
  UIView *tableFooterView;
  UIView *v4;
  UIView *v5;
  UIView *v6;
  void *v7;

  tableFooterView = self->_tableFooterView;
  if (!tableFooterView)
  {
    v4 = objc_opt_new(UIView);
    v5 = self->_tableFooterView;
    self->_tableFooterView = v4;

    v6 = self->_tableFooterView;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleConnectorsViewController tableFooterLabel](self, "tableFooterLabel"));
    -[UIView addSubview:](v6, "addSubview:", v7);

    tableFooterView = self->_tableFooterView;
  }
  return tableFooterView;
}

- (UILabel)tableFooterLabel
{
  UILabel *tableFooterLabel;
  UILabel *v4;
  UILabel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  tableFooterLabel = self->_tableFooterLabel;
  if (!tableFooterLabel)
  {
    v4 = objc_opt_new(UILabel);
    v5 = self->_tableFooterLabel;
    self->_tableFooterLabel = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("[Virtual Garage] Plug Type Explanation"), CFSTR("localized string not found"), 0));
    -[UILabel setText:](self->_tableFooterLabel, "setText:", v7);

    -[UILabel setNumberOfLines:](self->_tableFooterLabel, "setNumberOfLines:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](self->_tableFooterLabel, "setTextColor:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleFootnote));
    -[UILabel setFont:](self->_tableFooterLabel, "setFont:", v9);

    tableFooterLabel = self->_tableFooterLabel;
  }
  return tableFooterLabel;
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
  objc_super v28;
  _QWORD v29[4];

  v28.receiver = self;
  v28.super_class = (Class)EditVehicleConnectorsViewController;
  -[EditVehicleConnectorsViewController viewDidLoad](&v28, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGroupedBackgroundColor](UIColor, "systemGroupedBackgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleConnectorsViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleConnectorsViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleConnectorsViewController tableView](self, "tableView"));
  objc_msgSend(v5, "addSubview:", v6);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleConnectorsViewController tableView](self, "tableView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "leadingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleConnectorsViewController view](self, "view"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "leadingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v24));
  v29[0] = v23;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleConnectorsViewController tableView](self, "tableView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleConnectorsViewController view](self, "view"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trailingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v19));
  v29[1] = v18;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleConnectorsViewController tableView](self, "tableView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "topAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleConnectorsViewController view](self, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v9));
  v29[2] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleConnectorsViewController tableView](self, "tableView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleConnectorsViewController view](self, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bottomAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v14));
  v29[3] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EditVehicleConnectorsViewController;
  -[EditVehicleConnectorsViewController viewWillAppear:](&v9, "viewWillAppear:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleConnectorsViewController traitCollection](self, "traitCollection"));
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    objc_msgSend(v7, "setLockedOrientations:", 2);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    objc_msgSend(v8, "setOrientation:animated:", 1, v3);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EditVehicleConnectorsViewController;
  -[EditVehicleConnectorsViewController viewWillDisappear:](&v7, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleConnectorsViewController traitCollection](self, "traitCollection"));
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    objc_msgSend(v6, "setLockedOrientations:", 0);

  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)EditVehicleConnectorsViewController;
  -[EditVehicleConnectorsViewController viewDidLayoutSubviews](&v11, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleConnectorsViewController tableView](self, "tableView"));
  objc_msgSend(v3, "frame");
  v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleConnectorsViewController tableFooterLabel](self, "tableFooterLabel"));
  objc_msgSend(v6, "sizeThatFits:", v5 + -40.0 + -32.0, 1.79769313e308);
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleConnectorsViewController tableFooterView](self, "tableFooterView"));
  objc_msgSend(v9, "setFrame:", 0.0, 0.0, v5, v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleConnectorsViewController tableFooterLabel](self, "tableFooterLabel"));
  objc_msgSend(v10, "setFrame:", 36.0, 0.0, v5 + -40.0 + -32.0, v8);

}

- (void)pressedCancel
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v3, "captureUserAction:onTarget:eventValue:", 34, 660, 0);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[EditVehicleConnectorsViewController navigationController](self, "navigationController"));
  v4 = objc_msgSend(v5, "popViewControllerAnimated:", 1);

}

- (void)pressedDone
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v3, "captureUserAction:onTarget:eventValue:", 41, 660, 0);

  -[VGVehicle setSupportedConnectors:](self->_vehicle, "setSupportedConnectors:", VGChargingConnectorTypeOptionsPacked(self->_currentConnectorTypes));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
  objc_msgSend(v4, "virtualGarageSaveVehicle:", self->_vehicle);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[EditVehicleConnectorsViewController navigationController](self, "navigationController"));
  v5 = objc_msgSend(v6, "popViewControllerAnimated:", 1);

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v4;
  void *v5;
  id v6;

  v4 = VGChargingConnectorTypeOptionsList(self, a2, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v5, "count");

  return (int64_t)v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;

  v6 = a4;
  v7 = a3;
  v8 = (objc_class *)objc_opt_class(VehicleConnectorCell);
  v9 = NSStringFromClass(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v10, v6));

  v16 = VGChargingConnectorTypeOptionsList(v12, v13, v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = objc_msgSend(v6, "row");

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", v18));
  objc_msgSend(v11, "setConnectorType:", objc_msgSend(v19, "unsignedIntegerValue"));
  objc_msgSend(v11, "setActive:", -[NSMutableArray containsObject:](self->_currentConnectorTypes, "containsObject:", v19));
  objc_msgSend(v11, "setSelectionStyle:", 3);

  return v11;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 72.0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  NSMutableArray *currentConnectorTypes;
  id v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cellForRowAtIndexPath:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "connectorType")));
  v9 = -[NSMutableArray containsObject:](self->_currentConnectorTypes, "containsObject:", v8);
  currentConnectorTypes = self->_currentConnectorTypes;
  if (v9)
    -[NSMutableArray removeObject:](currentConnectorTypes, "removeObject:", v8);
  else
    -[NSMutableArray addObject:](currentConnectorTypes, "addObject:", v8);
  objc_msgSend(v11, "setActive:", v9 ^ 1);

}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (void)setTableFooterView:(id)a3
{
  objc_storeStrong((id *)&self->_tableFooterView, a3);
}

- (void)setTableFooterLabel:(id)a3
{
  objc_storeStrong((id *)&self->_tableFooterLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableFooterLabel, 0);
  objc_storeStrong((id *)&self->_tableFooterView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_currentConnectorTypes, 0);
  objc_storeStrong((id *)&self->_startingConnectorTypes, 0);
  objc_storeStrong((id *)&self->_vehicle, 0);
}

@end
