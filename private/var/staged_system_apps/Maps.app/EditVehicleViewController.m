@implementation EditVehicleViewController

- (EditVehicleViewController)initWithColors:(id)a3 vehicle:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  EditVehicleViewController *v11;
  NSArray *v12;
  NSArray *colors;
  uint64_t v14;
  NSString *currentNickname;
  void *v16;
  void *v17;
  void *v18;
  NSMutableArray *v19;
  NSMutableArray *currentNetworks;
  NSMutableArray *v21;
  NSMutableArray *removedNetworks;
  VGChargingNetworkAvailabilityProvider *v23;
  VGChargingNetworkAvailabilityProvider *networksProvider;
  NSMutableArray *v25;
  NSMutableArray *networksAwaitingLogging;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  objc_super v40;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v40.receiver = self;
  v40.super_class = (Class)EditVehicleViewController;
  v11 = -[EditVehicleViewController initWithNibName:bundle:](&v40, "initWithNibName:bundle:", 0, 0);
  if (v11)
  {
    v12 = (NSArray *)objc_msgSend(v8, "copy");
    colors = v11->_colors;
    v11->_colors = v12;

    objc_storeStrong((id *)&v11->_vehicle, a4);
    objc_storeWeak((id *)&v11->_delegate, v10);
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "combinedDisplayName"));
    currentNickname = v11->_currentNickname;
    v11->_currentNickname = (NSString *)v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "preferredChargingNetworks"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allObjects"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "sortedArrayUsingComparator:", &stru_1011C15A0));
    v19 = (NSMutableArray *)objc_msgSend(v18, "mutableCopy");
    currentNetworks = v11->_currentNetworks;
    v11->_currentNetworks = v19;

    v21 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    removedNetworks = v11->_removedNetworks;
    v11->_removedNetworks = v21;

    v23 = (VGChargingNetworkAvailabilityProvider *)objc_msgSend(objc_alloc((Class)VGChargingNetworkAvailabilityProvider), "initWithDelegate:", v11);
    networksProvider = v11->_networksProvider;
    v11->_networksProvider = v23;

    v25 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    networksAwaitingLogging = v11->_networksAwaitingLogging;
    v11->_networksAwaitingLogging = v25;

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("[Virtual Garage] Edit Vehicle"), CFSTR("localized string not found"), 0));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController navigationItem](v11, "navigationItem"));
    objc_msgSend(v29, "setTitle:", v28);

    v30 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, v11, "pressedCancel");
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController navigationItem](v11, "navigationItem"));
    objc_msgSend(v31, "setLeftBarButtonItem:", v30);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController navigationItem](v11, "navigationItem"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "leftBarButtonItem"));
    objc_msgSend(v33, "setAccessibilityIdentifier:", CFSTR("LeftBarButtonItem"));

    v34 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, v11, "pressedDone");
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController navigationItem](v11, "navigationItem"));
    objc_msgSend(v35, "setRightBarButtonItem:", v34);

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController navigationItem](v11, "navigationItem"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "rightBarButtonItem"));
    objc_msgSend(v37, "setAccessibilityIdentifier:", CFSTR("RightBarButtonItem"));

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController view](v11, "view"));
    objc_msgSend(v38, "setAccessibilityIdentifier:", CFSTR("EditVehicleView"));

  }
  return v11;
}

- (NSArray)tableStructure
{
  NSArray *tableStructure;
  NSMutableArray *v4;
  VehicleDetailTableSection *v5;
  void *v6;
  void *v7;
  VehicleDetailTableSection *v8;
  void *v9;
  void *v10;
  VehicleDetailTableSection *v11;
  void *v12;
  void *v13;
  VehicleDetailTableSection *v14;
  void *v15;
  void *v16;
  VehicleDetailTableSection *preferredChargersSection;
  id v18;
  VehicleDetailTableSection *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  VehicleDetailTableSection *v24;
  VehicleDetailTableSection *v25;
  NSArray *v26;
  NSArray *v27;
  void *v29;
  void *v30;
  void *v31;

  tableStructure = self->_tableStructure;
  if (!tableStructure)
  {
    v4 = objc_opt_new(NSMutableArray);
    v5 = [VehicleDetailTableSection alloc];
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController nicknameCell](self, "nicknameCell"));
    v31 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v31, 1));
    v8 = -[VehicleDetailTableSection initWithCells:](v5, "initWithCells:", v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("[Virtual Garage] Vehicle Name"), CFSTR("localized string not found"), 0));
    -[VehicleDetailTableSection setHeaderTitle:](v8, "setHeaderTitle:", v10);

    -[NSMutableArray addObject:](v4, "addObject:", v8);
    v11 = [VehicleDetailTableSection alloc];
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController colorPickerCell](self, "colorPickerCell"));
    v30 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v30, 1));
    v14 = -[VehicleDetailTableSection initWithCells:](v11, "initWithCells:", v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("[Virtual Garage] Vehicle Color"), CFSTR("localized string not found"), 0));
    -[VehicleDetailTableSection setHeaderTitle:](v14, "setHeaderTitle:", v16);

    -[NSMutableArray addObject:](v4, "addObject:", v14);
    preferredChargersSection = self->_preferredChargersSection;
    self->_preferredChargersSection = 0;

    if (-[VGVehicle isPureElectricVehicle](self->_vehicle, "isPureElectricVehicle")
      && MapsFeature_IsEnabled_EVRoutingEnhancements()
      && -[NSMutableArray count](self->_currentNetworks, "count"))
    {
      v18 = sub_10039DCD4(self->_currentNetworks, &stru_1011C15C0);
      v29 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v19 = -[VehicleDetailTableSection initWithCells:]([VehicleDetailTableSection alloc], "initWithCells:", v29);
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("[Virtual Garage] Preferred Charging Networks header"), CFSTR("localized string not found"), 0));
      -[VehicleDetailTableSection setHeaderTitle:](v19, "setHeaderTitle:", v21);

      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("[Virtual Garage] Preferred Charging Networks footer"), CFSTR("localized string not found"), 0));
      -[VehicleDetailTableSection setFooterText:](v19, "setFooterText:", v23);

      v24 = self->_preferredChargersSection;
      self->_preferredChargersSection = v19;
      v25 = v19;

      -[NSMutableArray addObject:](v4, "addObject:", v25);
    }
    v26 = (NSArray *)-[NSMutableArray copy](v4, "copy", v29);
    v27 = self->_tableStructure;
    self->_tableStructure = v26;

    tableStructure = self->_tableStructure;
  }
  return tableStructure;
}

- (UITableView)tableView
{
  UITableView *tableView;
  UITableView *v4;
  UITableView *v5;
  void *v6;

  tableView = self->_tableView;
  if (!tableView)
  {
    v4 = (UITableView *)objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_tableView;
    self->_tableView = v4;

    -[UITableView setAccessibilityIdentifier:](self->_tableView, "setAccessibilityIdentifier:", CFSTR("EditVehicleTableView"));
    -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
    -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController headerView](self, "headerView"));
    -[UITableView setTableHeaderView:](self->_tableView, "setTableHeaderView:", v6);

    -[UITableView setKeyboardDismissMode:](self->_tableView, "setKeyboardDismissMode:", 1);
    tableView = self->_tableView;
  }
  return tableView;
}

- (UIView)headerView
{
  UIView *headerView;
  UIView *v4;
  UIView *v5;
  UIView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  UIView *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[6];

  headerView = self->_headerView;
  if (!headerView)
  {
    v4 = objc_opt_new(UIView);
    v5 = self->_headerView;
    self->_headerView = v4;

    -[UIView setAccessibilityIdentifier:](self->_headerView, "setAccessibilityIdentifier:", CFSTR("EditVehicleHeader"));
    v6 = self->_headerView;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController vehicleColorView](self, "vehicleColorView"));
    -[UIView addSubview:](v6, "addSubview:", v7);

    v24 = self->_headerView;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController vehicleColorView](self, "vehicleColorView"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "centerXAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_headerView, "centerXAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v30));
    v33[0] = v29;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController vehicleColorView](self, "vehicleColorView"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "topAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_headerView, "topAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:constant:", v26, 32.0));
    v33[1] = v25;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController vehicleColorView](self, "vehicleColorView"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "widthAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToConstant:", 100.0));
    v33[2] = v21;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController vehicleColorView](self, "vehicleColorView"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "heightAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToConstant:", 100.0));
    v33[3] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController vehicleColorView](self, "vehicleColorView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_headerView, "bottomAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintLessThanOrEqualToAnchor:constant:", v11, -24.0));
    v33[4] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_headerView, "heightAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintGreaterThanOrEqualToConstant:", 156.0));
    v33[5] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 6));
    -[UIView addConstraints:](v24, "addConstraints:", v15);

    -[UIView systemLayoutSizeFittingSize:](self->_headerView, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
    -[UIView setFrame:](self->_headerView, "setFrame:", CGPointZero.x, CGPointZero.y, v16, v17);
    headerView = self->_headerView;
  }
  return headerView;
}

- (UIView)vehicleColorView
{
  UIView *vehicleColorView;
  UIView *v4;
  UIView *v5;
  void *v6;
  UIView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  UIView *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];

  vehicleColorView = self->_vehicleColorView;
  if (!vehicleColorView)
  {
    v4 = objc_opt_new(UIView);
    v5 = self->_vehicleColorView;
    self->_vehicleColorView = v4;

    -[UIView setAccessibilityIdentifier:](self->_vehicleColorView, "setAccessibilityIdentifier:", CFSTR("VehicleColorView"));
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_vehicleColorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_vehicleColorView, "layer"));
    objc_msgSend(v6, "setCornerRadius:", 50.0);

    v7 = self->_vehicleColorView;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController vehicleIconView](self, "vehicleIconView"));
    -[UIView addSubview:](v7, "addSubview:", v8);

    v20 = self->_vehicleColorView;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController vehicleIconView](self, "vehicleIconView"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "centerXAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_vehicleColorView, "centerXAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v25));
    v28[0] = v24;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController vehicleIconView](self, "vehicleIconView"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "centerYAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_vehicleColorView, "centerYAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v21));
    v28[1] = v19;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController vehicleIconView](self, "vehicleIconView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "widthAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_vehicleColorView, "widthAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintLessThanOrEqualToAnchor:", v10));
    v28[2] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController vehicleIconView](self, "vehicleIconView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "heightAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_vehicleColorView, "heightAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintLessThanOrEqualToAnchor:", v14));
    v28[3] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 4));
    -[UIView addConstraints:](v20, "addConstraints:", v16);

    vehicleColorView = self->_vehicleColorView;
  }
  return vehicleColorView;
}

- (UIImageView)vehicleIconView
{
  UIImageView *vehicleIconView;
  id v4;
  void *v5;
  void *v6;
  UIImageView *v7;
  UIImageView *v8;

  vehicleIconView = self->_vehicleIconView;
  if (!vehicleIconView)
  {
    v4 = sub_10037CFB4((int)-[VGVehicle isPureElectricVehicle](self->_vehicle, "isPureElectricVehicle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "imageWithRenderingMode:", 2));

    v7 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v6);
    v8 = self->_vehicleIconView;
    self->_vehicleIconView = v7;

    -[UIImageView setContentMode:](self->_vehicleIconView, "setContentMode:", 1);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_vehicleIconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setAccessibilityIdentifier:](self->_vehicleIconView, "setAccessibilityIdentifier:", CFSTR("VehicleIconView"));

    vehicleIconView = self->_vehicleIconView;
  }
  return vehicleIconView;
}

- (VehicleTextFieldCell)nicknameCell
{
  VehicleTextFieldCell *nicknameCell;
  VehicleTextFieldCell *v4;
  VehicleTextFieldCell *v5;
  void *v6;
  void *v7;
  void *v8;

  nicknameCell = self->_nicknameCell;
  if (!nicknameCell)
  {
    v4 = objc_opt_new(VehicleTextFieldCell);
    v5 = self->_nicknameCell;
    self->_nicknameCell = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleTextFieldCell textField](self->_nicknameCell, "textField"));
    objc_msgSend(v6, "setDelegate:", self);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleTextFieldCell textField](self->_nicknameCell, "textField"));
    objc_msgSend(v7, "setAutocorrectionType:", 1);

    -[VehicleTextFieldCell setSelectionStyle:](self->_nicknameCell, "setSelectionStyle:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tableCellGroupedBackgroundColor](UIColor, "tableCellGroupedBackgroundColor"));
    -[VehicleTextFieldCell setBackgroundColor:](self->_nicknameCell, "setBackgroundColor:", v8);

    -[VehicleTextFieldCell setAccessibilityIdentifier:](self->_nicknameCell, "setAccessibilityIdentifier:", CFSTR("NicknameCell"));
    nicknameCell = self->_nicknameCell;
  }
  return nicknameCell;
}

- (VehicleColorPickerCell)colorPickerCell
{
  VehicleColorPickerCell *colorPickerCell;
  VehicleColorPickerCell *v4;
  VehicleColorPickerCell *v5;
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
  VehicleColorPickerCell *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[3];

  colorPickerCell = self->_colorPickerCell;
  if (!colorPickerCell)
  {
    v4 = objc_opt_new(VehicleColorPickerCell);
    v5 = self->_colorPickerCell;
    self->_colorPickerCell = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController colorPicker](self, "colorPicker"));
    -[VehicleColorPickerCell setColorPicker:](self->_colorPickerCell, "setColorPicker:", v6);

    -[VehicleColorPickerCell setSelectionStyle:](self->_colorPickerCell, "setSelectionStyle:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[VehicleColorPickerCell setBackgroundColor:](self->_colorPickerCell, "setBackgroundColor:", v7);

    -[VehicleColorPickerCell setAccessibilityIdentifier:](self->_colorPickerCell, "setAccessibilityIdentifier:", CFSTR("ColorPickerCell"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleColorPickerCell contentView](self->_colorPickerCell, "contentView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController colorPicker](self, "colorPicker"));
    objc_msgSend(v8, "addSubview:", v9);

    v19 = self->_colorPickerCell;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController colorPicker](self, "colorPicker"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "centerYAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleColorPickerCell centerYAnchor](self->_colorPickerCell, "centerYAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v22));
    v25[0] = v21;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController colorPicker](self, "colorPicker"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "leadingAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleColorPickerCell leadingAnchor](self->_colorPickerCell, "leadingAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
    v25[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController colorPicker](self, "colorPicker"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleColorPickerCell trailingAnchor](self->_colorPickerCell, "trailingAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v15));
    v25[2] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 3));
    -[VehicleColorPickerCell addConstraints:](v19, "addConstraints:", v17);

    colorPickerCell = self->_colorPickerCell;
  }
  return colorPickerCell;
}

- (VehicleColorPicker)colorPicker
{
  VehicleColorPicker *colorPicker;
  unint64_t v4;
  VehicleColorPicker *v5;
  NSArray *colors;
  void *v7;
  void *v8;
  VehicleColorPicker *v9;
  VehicleColorPicker *v10;
  double v11;

  colorPicker = self->_colorPicker;
  if (!colorPicker)
  {
    v4 = -[EditVehicleViewController selectedIndex](self, "selectedIndex");
    v5 = [VehicleColorPicker alloc];
    colors = self->_colors;
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
      v7 = 0;
    else
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v4));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGroupedBackgroundColor](UIColor, "systemGroupedBackgroundColor"));
    v9 = -[VehicleColorPicker initWithColors:colorsPerRow:colorEdgeInsets:selectedIndex:contrastColor:delegate:](v5, "initWithColors:colorsPerRow:colorEdgeInsets:selectedIndex:contrastColor:delegate:", colors, 6, v7, v8, self, 8.0, 8.0, 8.0, 8.0);
    v10 = self->_colorPicker;
    self->_colorPicker = v9;

    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    -[VehicleColorPicker setTranslatesAutoresizingMaskIntoConstraints:](self->_colorPicker, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v11) = 1148846080;
    -[VehicleColorPicker setContentCompressionResistancePriority:forAxis:](self->_colorPicker, "setContentCompressionResistancePriority:forAxis:", 1, v11);
    -[VehicleColorPicker setAccessibilityIdentifier:](self->_colorPicker, "setAccessibilityIdentifier:", CFSTR("ColorPicker"));
    colorPicker = self->_colorPicker;
  }
  return colorPicker;
}

- (unint64_t)selectedIndex
{
  NSNumber *selectedIndexBacking;
  void *v4;
  void *v5;
  unint64_t v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  NSNumber *v12;
  NSNumber *v13;

  selectedIndexBacking = self->_selectedIndexBacking;
  if (!selectedIndexBacking)
  {
    self->_selectedIndexBacking = (NSNumber *)&off_10126E8F0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicle colorHex](self->_vehicle, "colorHex"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _maps_colorFromHexRepresentation:](UIColor, "_maps_colorFromHexRepresentation:", v4));

    if (v5 && -[NSArray count](self->_colors, "count"))
    {
      v6 = 0;
      v7 = 1.79769313e308;
      do
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_colors, "objectAtIndexedSubscript:", v6));
        objc_msgSend(v8, "_maps_euclideanDistanceFromColor:", v5);
        v10 = v9;
        if (v7 <= 0.1)
          v11 = v7;
        else
          v11 = 0.1;
        if (v10 < v11)
        {
          v12 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v6));
          v13 = self->_selectedIndexBacking;
          self->_selectedIndexBacking = v12;

          v7 = v10;
        }

        ++v6;
      }
      while (v6 < -[NSArray count](self->_colors, "count"));
    }

    selectedIndexBacking = self->_selectedIndexBacking;
  }
  return -[NSNumber unsignedIntegerValue](selectedIndexBacking, "unsignedIntegerValue");
}

- (void)setSelectedIndex:(unint64_t)a3
{
  NSNumber *v4;
  NSNumber *selectedIndexBacking;

  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  selectedIndexBacking = self->_selectedIndexBacking;
  self->_selectedIndexBacking = v4;

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
  v29.super_class = (Class)EditVehicleViewController;
  -[EditVehicleViewController viewDidLoad](&v29, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController tableView](self, "tableView"));
  objc_msgSend(v3, "addSubview:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController tableView](self, "tableView"));
  objc_msgSend(v5, "setEditing:", 1);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController tableView](self, "tableView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "leadingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController view](self, "view"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "leadingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v25));
  v30[0] = v24;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController tableView](self, "tableView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController view](self, "view"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v20));
  v30[1] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController tableView](self, "tableView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v7));
  v30[2] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController tableView](self, "tableView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController view](self, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v12));
  v30[3] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGroupedBackgroundColor](UIColor, "systemGroupedBackgroundColor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController view](self, "view"));
  objc_msgSend(v16, "setBackgroundColor:", v15);

  -[EditVehicleViewController _updateContent](self, "_updateContent");
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
  v9.super_class = (Class)EditVehicleViewController;
  -[EditVehicleViewController viewWillAppear:](&v9, "viewWillAppear:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController traitCollection](self, "traitCollection"));
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
  v7.super_class = (Class)EditVehicleViewController;
  -[EditVehicleViewController viewWillDisappear:](&v7, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController traitCollection](self, "traitCollection"));
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    objc_msgSend(v6, "setLockedOrientations:", 0);

  }
}

- (void)colorPicker:(id)a3 didSelectIndex:(unint64_t)a4
{
  void *v6;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService", a3));
  objc_msgSend(v6, "captureUserAction:onTarget:eventValue:", 442, 662, 0);

  -[EditVehicleViewController setSelectedIndex:](self, "setSelectedIndex:", a4);
  -[EditVehicleViewController _updateContent](self, "_updateContent");
}

- (id)_selectedColor
{
  void *v3;

  if (-[EditVehicleViewController selectedIndex](self, "selectedIndex") == 0x7FFFFFFFFFFFFFFFLL)
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_colors, "objectAtIndexedSubscript:", -[EditVehicleViewController selectedIndex](self, "selectedIndex")));
  return v3;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService", a3));
  objc_msgSend(v3, "captureUserAction:onTarget:eventValue:", 2128, 662, 0);

}

- (BOOL)textFieldShouldReturn:(id)a3
{
  objc_msgSend(a3, "resignFirstResponder");
  return 0;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  void *v10;
  NSString *v11;
  NSString *currentNickname;

  length = a4.length;
  location = a4.location;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "text"));
  v11 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", location, length, v9));

  currentNickname = self->_currentNickname;
  self->_currentNickname = v11;

  -[EditVehicleViewController _updateDoneButtonAvailability](self, "_updateDoneButtonAvailability");
  return 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  NSString *v4;
  NSString *currentNickname;

  v4 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "text"));
  currentNickname = self->_currentNickname;
  self->_currentNickname = v4;

  -[EditVehicleViewController _updateContent](self, "_updateContent");
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController tableStructure](self, "tableStructure", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", a4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "headerTitle"));
  return v7;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = objc_alloc_init((Class)UITableViewHeaderFooterView);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration prominentInsetGroupedHeaderConfiguration](UIListContentConfiguration, "prominentInsetGroupedHeaderConfiguration"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController tableView:titleForHeaderInSection:](self, "tableView:titleForHeaderInSection:", v6, a4));

  objc_msgSend(v8, "setText:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textProperties"));
  objc_msgSend(v11, "setColor:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:weight:](UIFont, "_preferredFontForTextStyle:weight:", UIFontTextStyleSubheadline, UIFontWeightBold));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textProperties"));
  objc_msgSend(v13, "setFont:", v12);

  objc_msgSend(v7, "setContentConfiguration:", v8);
  return v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController tableStructure](self, "tableStructure", a3));
  v4 = objc_msgSend(v3, "count");

  return (int64_t)v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController tableStructure](self, "tableStructure", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", a4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cells"));
  v8 = objc_msgSend(v7, "count");

  return (int64_t)v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController tableStructure](self, "tableStructure"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "section")));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cells"));
  v9 = objc_msgSend(v5, "row");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v9));
  return v10;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  double Width;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect v21;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController tableStructure](self, "tableStructure"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "section")));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cells"));
  v11 = objc_msgSend(v6, "row");

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v11));
  objc_msgSend(v7, "frame");
  Width = CGRectGetWidth(v21);
  objc_msgSend(v7, "layoutMargins");
  v15 = Width - v14;
  objc_msgSend(v7, "layoutMargins");
  v17 = v16;

  objc_msgSend(v12, "cellHeightWithWidth:", v15 - v17);
  v19 = v18;

  return v19;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  id v7;
  VehicleDetailTableSection *v8;
  int64_t v9;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController tableStructure](self, "tableStructure"));
  v7 = objc_msgSend(v5, "section");

  v8 = (VehicleDetailTableSection *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v7));
  v9 = v8 == self->_preferredChargersSection;

  return v9;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return -[EditVehicleViewController tableView:editingStyleForRowAtIndexPath:](self, "tableView:editingStyleForRowAtIndexPath:", a3, a4) != 0;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  char *v16;
  int v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;

  v7 = a5;
  v8 = v7;
  if (a4 == 1)
  {
    v9 = objc_msgSend(v7, "row");
    if ((uint64_t)v9 >= (uint64_t)-[NSMutableArray count](self->_currentNetworks, "count"))
    {
      v12 = sub_1004318FC();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v17 = 136315650;
        v18 = "-[EditVehicleViewController tableView:commitEditingStyle:forRowAtIndexPath:]";
        v19 = 2080;
        v20 = "EditVehicleViewController.m";
        v21 = 1024;
        v22 = 432;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v17, 0x1Cu);
      }

      if (sub_100A70734())
      {
        v14 = sub_1004318FC();
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v16 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v17 = 138412290;
          v18 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v17, 0xCu);

        }
      }
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_currentNetworks, "objectAtIndexedSubscript:", objc_msgSend(v8, "row")));
      -[EditVehicleViewController _captureAnalyticsForRemovedNetwork:](self, "_captureAnalyticsForRemovedNetwork:", v10);
      -[NSMutableArray addObject:](self->_removedNetworks, "addObject:", v10);
      -[NSMutableArray removeObjectAtIndex:](self->_currentNetworks, "removeObjectAtIndex:", objc_msgSend(v8, "row"));
      -[EditVehicleViewController setTableStructure:](self, "setTableStructure:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController tableView](self, "tableView"));
      objc_msgSend(v11, "reloadData");

      -[EditVehicleViewController _updateContent](self, "_updateContent");
    }
  }

}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return UITableViewAutomaticDimension;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", a4, 1);
}

- (void)_updateDoneButtonAvailability
{
  unint64_t v3;
  void *v4;
  unsigned int v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = -[EditVehicleViewController selectedIndex](self, "selectedIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicle combinedDisplayName](self->_vehicle, "combinedDisplayName"));
  v5 = objc_msgSend(v4, "isEqualToString:", self->_currentNickname);

  v6 = -[NSMutableArray count](self->_removedNetworks, "count");
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v6)
      v7 = 1;
    else
      v7 = v5 ^ 1;
  }
  else
  {
    v7 = 1;
  }
  v9 = (id)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController navigationItem](self, "navigationItem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rightBarButtonItem"));
  objc_msgSend(v8, "setEnabled:", v7);

}

- (void)_updateContent
{
  void *v3;
  void *v4;
  NSString *currentNickname;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  NSBundle *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  -[EditVehicleViewController _updateDoneButtonAvailability](self, "_updateDoneButtonAvailability");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController _selectedColor](self, "_selectedColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController vehicleColorView](self, "vehicleColorView"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  currentNickname = self->_currentNickname;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController nicknameCell](self, "nicknameCell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textField"));
  objc_msgSend(v7, "setText:", currentNickname);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicle licensePlate](self->_vehicle, "licensePlate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController nicknameCell](self, "nicknameCell"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "textField"));
  objc_msgSend(v10, "setPlaceholder:", v8);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController vehicleColorView](self, "vehicleColorView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "backgroundColor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_msgSend(v12, "_maps_euclideanDistanceFromColor:", v13);
  v15 = v14;

  if (v15 >= 0.1)
  {
    v20 = (id)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController vehicleIconView](self, "vehicleIconView"));
    objc_msgSend(v17, "setTintColor:", v20);
  }
  else
  {
    v16 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v20 = (id)objc_claimAutoreleasedReturnValue(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController traitCollection](self, "traitCollection"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:inBundle:compatibleWithTraitCollection:](UIColor, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("TertiaryVehicleTint"), v20, v17));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController vehicleIconView](self, "vehicleIconView"));
    objc_msgSend(v19, "setTintColor:", v18);

  }
}

- (void)_captureAnalyticsForRemovedNetwork:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VGChargingNetworkAvailabilityProvider suggestedNetworks](self->_networksProvider, "suggestedNetworks"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[VGChargingNetworkAvailabilityProvider suggestedNetworks](self->_networksProvider, "suggestedNetworks"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10070CB68;
    v11[3] = &unk_1011C15E8;
    v12 = v10;
    v6 = sub_10039E1FC(v5, v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

    if (v7)
      v8 = 439;
    else
      v8 = 448;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v9, "captureUserAction:onTarget:eventValue:", v8, 122, 0);

  }
  else
  {
    -[NSMutableArray addObject:](self->_networksAwaitingLogging, "addObject:", v10);
  }

}

- (void)availableNetworksDidChangeForProvider:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10070CC14;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)pressedCancel
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v3, "captureUserAction:onTarget:eventValue:", 34, 662, 0);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController navigationController](self, "navigationController"));
  v4 = objc_msgSend(v5, "popViewControllerAnimated:", 1);

}

- (void)pressedDone
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  VGVehicle *vehicle;
  NSString *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController nicknameCell](self, "nicknameCell"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "textField"));
  objc_msgSend(v4, "endEditing:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v5, "captureUserAction:onTarget:eventValue:", 41, 662, 0);

  v13 = (id)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController _selectedColor](self, "_selectedColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_maps_hexRepresentation"));
  -[VGVehicle setColorHex:](self->_vehicle, "setColorHex:", v6);

  vehicle = self->_vehicle;
  v8 = self->_currentNickname;
  -[VGVehicle setDisplayName:](vehicle, "setDisplayName:", v8);
  v9 = -[NSMutableArray copy](self->_removedNetworks, "copy");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", self->_currentNetworks));
  -[VGVehicle setPreferredChargingNetworks:](self->_vehicle, "setPreferredChargingNetworks:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController delegate](self, "delegate"));
  objc_msgSend(v11, "editVehicleViewController:didSelectColor:nickname:removedNetworks:", self, v13, v8, v9);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[EditVehicleViewController delegate](self, "delegate"));
  objc_msgSend(v12, "editVehicleViewControllerDidSelectDone:", self);

}

- (EditVehicleViewControllerDelegate)delegate
{
  return (EditVehicleViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setTableStructure:(id)a3
{
  objc_storeStrong((id *)&self->_tableStructure, a3);
}

- (void)setVehicleColorView:(id)a3
{
  objc_storeStrong((id *)&self->_vehicleColorView, a3);
}

- (void)setVehicleIconView:(id)a3
{
  objc_storeStrong((id *)&self->_vehicleIconView, a3);
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (void)setNicknameCell:(id)a3
{
  objc_storeStrong((id *)&self->_nicknameCell, a3);
}

- (void)setColorPickerCell:(id)a3
{
  objc_storeStrong((id *)&self->_colorPickerCell, a3);
}

- (void)setColorPicker:(id)a3
{
  objc_storeStrong((id *)&self->_colorPicker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorPicker, 0);
  objc_storeStrong((id *)&self->_colorPickerCell, 0);
  objc_storeStrong((id *)&self->_nicknameCell, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_vehicleIconView, 0);
  objc_storeStrong((id *)&self->_vehicleColorView, 0);
  objc_storeStrong((id *)&self->_tableStructure, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_networksAwaitingLogging, 0);
  objc_storeStrong((id *)&self->_networksProvider, 0);
  objc_storeStrong((id *)&self->_removedNetworks, 0);
  objc_storeStrong((id *)&self->_currentNetworks, 0);
  objc_storeStrong((id *)&self->_preferredChargersSection, 0);
  objc_storeStrong((id *)&self->_currentNickname, 0);
  objc_storeStrong((id *)&self->_selectedIndexBacking, 0);
  objc_storeStrong((id *)&self->_vehicle, 0);
  objc_storeStrong((id *)&self->_colors, 0);
}

@end
