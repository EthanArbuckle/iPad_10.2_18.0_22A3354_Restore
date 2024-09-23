@implementation VehicleDetailViewController

- (VehicleDetailViewController)initWithVehicle:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  VehicleDetailViewController *v8;
  VehicleDetailViewController *v9;
  VGVehicle *v10;
  VGVehicle *vehicle;
  id v12;
  void *v13;
  void *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)VehicleDetailViewController;
  v8 = -[VehicleDetailViewController initWithNibName:bundle:](&v16, "initWithNibName:bundle:", 0, 0);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v7);
    v10 = (VGVehicle *)objc_msgSend(v6, "copy");
    vehicle = v9->_vehicle;
    v9->_vehicle = v10;

    v12 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 2, v9, "_pressedEdit");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController navigationItem](v9, "navigationItem"));
    objc_msgSend(v13, "setRightBarButtonItem:", v12);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
    objc_msgSend(v14, "registerObserver:", v9);

  }
  return v9;
}

- (NSArray)tableStructure
{
  NSArray *tableStructure;
  _UNKNOWN **v4;
  NSMutableArray *v5;
  NSMutableArray *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  VehicleDetailTableSection *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  VehicleDetailTableSection *v19;
  void *v20;
  void *v21;
  VehicleDetailTableSection *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  void *v36;
  VehicleDetailTableSection *v37;
  void *v38;
  void *v39;
  void *v40;
  VehicleDetailTableSection *v41;
  void *v42;
  void *v43;
  VehicleDetailTableSection *v44;
  VehicleDetailTableSection *v45;
  void *v46;
  void *v47;
  VehicleDetailTableSection *v48;
  NSArray *v49;
  NSArray *v50;
  void *v52;
  void *v53;
  void *v54;
  void *v55;

  tableStructure = self->_tableStructure;
  if (!tableStructure)
  {
    v4 = MKPlaceCollectionsLogicController_ptr;
    v5 = objc_opt_new(NSMutableArray);
    if ((MapsFeature_IsEnabled_Alberta(v5) & 1) != 0)
    {
      v6 = objc_opt_new(NSMutableArray);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicle licensePlate](self->_vehicle, "licensePlate"));
      v8 = objc_msgSend(v7, "length");

      if (v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController licensePlateCell](self, "licensePlateCell"));
        -[NSMutableArray addObject:](v6, "addObject:", v9);

      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController editLicensePlateCell](self, "editLicensePlateCell"));
      -[NSMutableArray addObject:](v6, "addObject:", v10);

      v11 = -[VehicleDetailTableSection initWithCells:]([VehicleDetailTableSection alloc], "initWithCells:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("[Virtual Garage] LPR Information"), CFSTR("localized string not found"), 0));
      -[VehicleDetailTableSection setHeaderTitle:](v11, "setHeaderTitle:", v13);

      -[NSMutableArray addObject:](v5, "addObject:", v11);
      v4 = MKPlaceCollectionsLogicController_ptr;
    }
    v14 = -[VGVehicle isPureElectricVehicle](self->_vehicle, "isPureElectricVehicle");
    if ((_DWORD)v14 && MapsFeature_IsEnabled_EVRoutingEnhancements(v14, v15))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicle preferredChargingNetworks](self->_vehicle, "preferredChargingNetworks"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allObjects"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "sortedArrayUsingComparator:", &stru_1011DDBA0));

      v18 = sub_10039DCD4(v53, &stru_1011DDBC0);
      v52 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v19 = [VehicleDetailTableSection alloc];
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController addNetworksCell](self, "addNetworksCell"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "arrayByAddingObject:", v20));
      v22 = -[VehicleDetailTableSection initWithCells:](v19, "initWithCells:", v21);

      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("[Virtual Garage] Preferred Charging Networks header"), CFSTR("localized string not found"), 0));
      -[VehicleDetailTableSection setHeaderTitle:](v22, "setHeaderTitle:", v24);

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("[Virtual Garage] Preferred Charging Networks footer"), CFSTR("localized string not found"), 0));
      -[VehicleDetailTableSection setFooterText:](v22, "setFooterText:", v26);

      -[NSMutableArray addObject:](v5, "addObject:", v22);
    }
    v27 = objc_alloc_init((Class)v4[357]);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicle manufacturer](self->_vehicle, "manufacturer"));
    v29 = objc_msgSend(v28, "length");

    if (v29)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController vehicleMakeCell](self, "vehicleMakeCell"));
      objc_msgSend(v27, "addObject:", v30);

    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicle model](self->_vehicle, "model"));
    v32 = objc_msgSend(v31, "length");

    if (v32)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController vehicleModelCell](self, "vehicleModelCell"));
      objc_msgSend(v27, "addObject:", v33);

    }
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v35 = (objc_msgSend(v34, "BOOLForKey:", CFSTR("VirtualGarageEditConnectorPlugs")) & 1) != 0
       || -[VGVehicle supportedConnectors](self->_vehicle, "supportedConnectors") != 0;

    if (-[VGVehicle isPureElectricVehicle](self->_vehicle, "isPureElectricVehicle") && v35)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController editPlugsCell](self, "editPlugsCell"));
      objc_msgSend(v27, "addObject:", v36);

    }
    if (objc_msgSend(v27, "count"))
    {
      v37 = -[VehicleDetailTableSection initWithCells:]([VehicleDetailTableSection alloc], "initWithCells:", v27);
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("[Virtual Garage] Vehicle Information"), CFSTR("localized string not found"), 0));
      -[VehicleDetailTableSection setHeaderTitle:](v37, "setHeaderTitle:", v39);

      -[NSMutableArray addObject:](v5, "addObject:", v37);
    }
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicle applicationRecord](self->_vehicle, "applicationRecord"));

    if (v40)
    {
      v41 = [VehicleDetailTableSection alloc];
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController appCell](self, "appCell"));
      v55 = v42;
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v55, 1));
      v44 = -[VehicleDetailTableSection initWithCells:](v41, "initWithCells:", v43);

      -[NSMutableArray addObject:](v5, "addObject:", v44);
    }
    v45 = [VehicleDetailTableSection alloc];
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController deleteCell](self, "deleteCell"));
    v54 = v46;
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v54, 1));
    v48 = -[VehicleDetailTableSection initWithCells:](v45, "initWithCells:", v47);
    -[NSMutableArray addObject:](v5, "addObject:", v48);

    v49 = (NSArray *)-[NSMutableArray copy](v5, "copy");
    v50 = self->_tableStructure;
    self->_tableStructure = v49;

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

    -[UITableView setAccessibilityIdentifier:](self->_tableView, "setAccessibilityIdentifier:", CFSTR("VehicleDetailTableView"));
    -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
    -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController headerView](self, "headerView"));
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
  UIView *v8;
  void *v9;
  UIView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  UIView *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  _QWORD v63[12];

  headerView = self->_headerView;
  if (!headerView)
  {
    v4 = objc_opt_new(UIView);
    v5 = self->_headerView;
    self->_headerView = v4;

    -[UIView setAccessibilityIdentifier:](self->_headerView, "setAccessibilityIdentifier:", CFSTR("VehicleDetailHeader"));
    v6 = self->_headerView;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController vehicleColorView](self, "vehicleColorView"));
    -[UIView addSubview:](v6, "addSubview:", v7);

    v8 = self->_headerView;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController vehicleNameLabel](self, "vehicleNameLabel"));
    -[UIView addSubview:](v8, "addSubview:", v9);

    v10 = self->_headerView;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController vehicleBatteryView](self, "vehicleBatteryView"));
    -[UIView addSubview:](v10, "addSubview:", v11);

    v42 = self->_headerView;
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController vehicleColorView](self, "vehicleColorView"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "centerXAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_headerView, "centerXAnchor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToAnchor:", v60));
    v63[0] = v59;
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController vehicleColorView](self, "vehicleColorView"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "topAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_headerView, "topAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:constant:", v56, 32.0));
    v63[1] = v55;
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController vehicleColorView](self, "vehicleColorView"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "widthAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToConstant:", 100.0));
    v63[2] = v52;
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController vehicleColorView](self, "vehicleColorView"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "heightAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToConstant:", 100.0));
    v63[3] = v49;
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController vehicleNameLabel](self, "vehicleNameLabel"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "topAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController vehicleColorView](self, "vehicleColorView"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "bottomAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:constant:", v45, 16.0));
    v63[4] = v44;
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController vehicleNameLabel](self, "vehicleNameLabel"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "leadingAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_headerView, "leadingAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:constant:", v40, 8.0));
    v63[5] = v39;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController vehicleNameLabel](self, "vehicleNameLabel"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "trailingAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_headerView, "trailingAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:constant:", v36, -8.0));
    v63[6] = v35;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController vehicleBatteryView](self, "vehicleBatteryView"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "topAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController vehicleNameLabel](self, "vehicleNameLabel"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "bottomAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:constant:", v31, 2.0));
    v63[7] = v30;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController vehicleBatteryView](self, "vehicleBatteryView"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "centerXAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_headerView, "centerXAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v27));
    v63[8] = v26;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController vehicleBatteryView](self, "vehicleBatteryView"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "leadingAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_headerView, "leadingAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintGreaterThanOrEqualToAnchor:constant:", v23, 8.0));
    v63[9] = v22;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController vehicleBatteryView](self, "vehicleBatteryView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trailingAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_headerView, "trailingAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintLessThanOrEqualToAnchor:constant:", v13, -8.0));
    v63[10] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController vehicleBatteryView](self, "vehicleBatteryView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bottomAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_headerView, "bottomAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, -24.0));
    v63[11] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v63, 12));
    -[UIView addConstraints:](v42, "addConstraints:", v19);

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
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController vehicleIconView](self, "vehicleIconView"));
    -[UIView addSubview:](v7, "addSubview:", v8);

    v20 = self->_vehicleColorView;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController vehicleIconView](self, "vehicleIconView"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "centerXAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_vehicleColorView, "centerXAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v25));
    v28[0] = v24;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController vehicleIconView](self, "vehicleIconView"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "centerYAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_vehicleColorView, "centerYAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v21));
    v28[1] = v19;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController vehicleIconView](self, "vehicleIconView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "widthAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_vehicleColorView, "widthAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintLessThanOrEqualToAnchor:", v10));
    v28[2] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController vehicleIconView](self, "vehicleIconView"));
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

    -[UIImageView setAccessibilityIdentifier:](self->_vehicleIconView, "setAccessibilityIdentifier:", CFSTR("VehicleIcon"));
    -[UIImageView setContentMode:](self->_vehicleIconView, "setContentMode:", 1);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_vehicleIconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    vehicleIconView = self->_vehicleIconView;
  }
  return vehicleIconView;
}

- (UILabel)vehicleNameLabel
{
  UILabel *vehicleNameLabel;
  UILabel *v4;
  UILabel *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  vehicleNameLabel = self->_vehicleNameLabel;
  if (!vehicleNameLabel)
  {
    v4 = objc_opt_new(UILabel);
    v5 = self->_vehicleNameLabel;
    self->_vehicleNameLabel = v4;

    -[UILabel setAccessibilityIdentifier:](self->_vehicleNameLabel, "setAccessibilityIdentifier:", CFSTR("VehicleNameLabel"));
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_vehicleNameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:weight:](UIFont, "_preferredFontForTextStyle:weight:", UIFontTextStyleTitle2, UIFontWeightBold));
    -[UILabel setFont:](self->_vehicleNameLabel, "setFont:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](self->_vehicleNameLabel, "setTextColor:", v7);

    -[UILabel setTextAlignment:](self->_vehicleNameLabel, "setTextAlignment:", 1);
    LODWORD(v8) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](self->_vehicleNameLabel, "setContentCompressionResistancePriority:forAxis:", 1, v8);
    LODWORD(v9) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](self->_vehicleNameLabel, "setContentHuggingPriority:forAxis:", 1, v9);
    vehicleNameLabel = self->_vehicleNameLabel;
  }
  return vehicleNameLabel;
}

- (VehicleBatteryView)vehicleBatteryView
{
  VehicleBatteryView *vehicleBatteryView;
  VehicleBatteryView *v4;
  VehicleBatteryView *v5;
  double v6;
  double v7;

  vehicleBatteryView = self->_vehicleBatteryView;
  if (!vehicleBatteryView)
  {
    v4 = -[VehicleBatteryView initWithVehicle:configuration:batteryChargeTextAtEdge:]([VehicleBatteryView alloc], "initWithVehicle:configuration:batteryChargeTextAtEdge:", 0, 2, 8);
    v5 = self->_vehicleBatteryView;
    self->_vehicleBatteryView = v4;

    -[VehicleBatteryView setAccessibilityIdentifier:](self->_vehicleBatteryView, "setAccessibilityIdentifier:", CFSTR("VehicleBatteryView"));
    -[VehicleBatteryView setTranslatesAutoresizingMaskIntoConstraints:](self->_vehicleBatteryView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v6) = 1148846080;
    -[VehicleBatteryView setContentCompressionResistancePriority:forAxis:](self->_vehicleBatteryView, "setContentCompressionResistancePriority:forAxis:", 1, v6);
    LODWORD(v7) = 1148846080;
    -[VehicleBatteryView setContentHuggingPriority:forAxis:](self->_vehicleBatteryView, "setContentHuggingPriority:forAxis:", 1, v7);
    vehicleBatteryView = self->_vehicleBatteryView;
  }
  return vehicleBatteryView;
}

- (VehicleLabelCell)addNetworksCell
{
  VehicleLabelCell *addNetworksCell;
  VehicleLabelCell *v4;
  VehicleLabelCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  addNetworksCell = self->_addNetworksCell;
  if (!addNetworksCell)
  {
    v4 = objc_opt_new(VehicleLabelCell);
    v5 = self->_addNetworksCell;
    self->_addNetworksCell = v4;

    -[VehicleLabelCell setAccessibilityIdentifier:](self->_addNetworksCell, "setAccessibilityIdentifier:", CFSTR("AddNetworksCell"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("[Virtual Garage][Button] Add Network"), CFSTR("localized string not found"), 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleLabelCell label](self->_addNetworksCell, "label"));
    objc_msgSend(v8, "setText:", v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleLabelCell label](self->_addNetworksCell, "label"));
    objc_msgSend(v10, "setTextColor:", v9);

    -[VehicleLabelCell setAccessoryType:](self->_addNetworksCell, "setAccessoryType:", 0);
    addNetworksCell = self->_addNetworksCell;
  }
  return addNetworksCell;
}

- (VehicleTitleDetailCell)editPlugsCell
{
  VehicleTitleDetailCell *editPlugsCell;
  VehicleTitleDetailCell *v4;
  VehicleTitleDetailCell *v5;
  void *v6;
  void *v7;
  void *v8;

  editPlugsCell = self->_editPlugsCell;
  if (!editPlugsCell)
  {
    v4 = objc_opt_new(VehicleTitleDetailCell);
    v5 = self->_editPlugsCell;
    self->_editPlugsCell = v4;

    -[VehicleTitleDetailCell setAccessibilityIdentifier:](self->_editPlugsCell, "setAccessibilityIdentifier:", CFSTR("EditPlugsCell"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("[Virtual Garage][Button] Plug Type"), CFSTR("localized string not found"), 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleTitleDetailCell titleLabel](self->_editPlugsCell, "titleLabel"));
    objc_msgSend(v8, "setText:", v7);

    -[VehicleTitleDetailCell setAccessoryType:](self->_editPlugsCell, "setAccessoryType:", 1);
    editPlugsCell = self->_editPlugsCell;
  }
  return editPlugsCell;
}

- (VehicleTitleDetailCell)licensePlateCell
{
  VehicleTitleDetailCell *licensePlateCell;
  VehicleTitleDetailCell *v4;
  VehicleTitleDetailCell *v5;
  void *v6;
  void *v7;
  void *v8;

  licensePlateCell = self->_licensePlateCell;
  if (!licensePlateCell)
  {
    v4 = objc_opt_new(VehicleTitleDetailCell);
    v5 = self->_licensePlateCell;
    self->_licensePlateCell = v4;

    -[VehicleTitleDetailCell setAccessibilityIdentifier:](self->_licensePlateCell, "setAccessibilityIdentifier:", CFSTR("LicensePlateCell"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("[Virtual Garage] License Plate Number"), CFSTR("localized string not found"), 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleTitleDetailCell titleLabel](self->_licensePlateCell, "titleLabel"));
    objc_msgSend(v8, "setText:", v7);

    licensePlateCell = self->_licensePlateCell;
  }
  return licensePlateCell;
}

- (VehicleLabelCell)editLicensePlateCell
{
  VehicleLabelCell *editLicensePlateCell;
  VehicleLabelCell *v4;
  VehicleLabelCell *v5;

  editLicensePlateCell = self->_editLicensePlateCell;
  if (!editLicensePlateCell)
  {
    v4 = objc_opt_new(VehicleLabelCell);
    v5 = self->_editLicensePlateCell;
    self->_editLicensePlateCell = v4;

    -[VehicleLabelCell setAccessibilityIdentifier:](self->_editLicensePlateCell, "setAccessibilityIdentifier:", CFSTR("EditLicensePlateCell"));
    editLicensePlateCell = self->_editLicensePlateCell;
  }
  return editLicensePlateCell;
}

- (VehicleAppCell)appCell
{
  VehicleAppCell *appCell;
  VehicleAppCell *v4;
  VehicleAppCell *v5;
  void *v6;
  void *v7;

  appCell = self->_appCell;
  if (!appCell)
  {
    v4 = objc_opt_new(VehicleAppCell);
    v5 = self->_appCell;
    self->_appCell = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicle applicationRecord](self->_vehicle, "applicationRecord"));
    -[VehicleAppCell setApplicationRecord:](self->_appCell, "setApplicationRecord:", v6);

    -[VehicleAppCell setAccessibilityIdentifier:](self->_appCell, "setAccessibilityIdentifier:", CFSTR("AppCell"));
    -[VehicleAppCell setSelectionStyle:](self->_appCell, "setSelectionStyle:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleAppCell openButton](self->_appCell, "openButton"));
    objc_msgSend(v7, "addTarget:action:forControlEvents:", self, "_pressedOpen", 64);

    appCell = self->_appCell;
  }
  return appCell;
}

- (VehicleTitleDetailCell)vehicleMakeCell
{
  VehicleTitleDetailCell *vehicleMakeCell;
  VehicleTitleDetailCell *v4;
  VehicleTitleDetailCell *v5;
  void *v6;
  void *v7;
  void *v8;

  vehicleMakeCell = self->_vehicleMakeCell;
  if (!vehicleMakeCell)
  {
    v4 = objc_opt_new(VehicleTitleDetailCell);
    v5 = self->_vehicleMakeCell;
    self->_vehicleMakeCell = v4;

    -[VehicleTitleDetailCell setAccessibilityIdentifier:](self->_vehicleMakeCell, "setAccessibilityIdentifier:", CFSTR("VehicleMakeCell"));
    -[VehicleTitleDetailCell setSelectionStyle:](self->_vehicleMakeCell, "setSelectionStyle:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("[Virtual Garage] Manufacturer"), CFSTR("localized string not found"), 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleTitleDetailCell titleLabel](self->_vehicleMakeCell, "titleLabel"));
    objc_msgSend(v8, "setText:", v7);

    vehicleMakeCell = self->_vehicleMakeCell;
  }
  return vehicleMakeCell;
}

- (VehicleTitleDetailCell)vehicleModelCell
{
  VehicleTitleDetailCell *vehicleModelCell;
  VehicleTitleDetailCell *v4;
  VehicleTitleDetailCell *v5;
  void *v6;
  void *v7;
  void *v8;

  vehicleModelCell = self->_vehicleModelCell;
  if (!vehicleModelCell)
  {
    v4 = objc_opt_new(VehicleTitleDetailCell);
    v5 = self->_vehicleModelCell;
    self->_vehicleModelCell = v4;

    -[VehicleTitleDetailCell setAccessibilityIdentifier:](self->_vehicleModelCell, "setAccessibilityIdentifier:", CFSTR("VehicleModelCell"));
    -[VehicleTitleDetailCell setSelectionStyle:](self->_vehicleModelCell, "setSelectionStyle:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("[Virtual Garage] Model"), CFSTR("localized string not found"), 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleTitleDetailCell titleLabel](self->_vehicleModelCell, "titleLabel"));
    objc_msgSend(v8, "setText:", v7);

    vehicleModelCell = self->_vehicleModelCell;
  }
  return vehicleModelCell;
}

- (VehicleLabelCell)deleteCell
{
  VehicleLabelCell *deleteCell;
  VehicleLabelCell *v4;
  VehicleLabelCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  deleteCell = self->_deleteCell;
  if (!deleteCell)
  {
    v4 = objc_opt_new(VehicleLabelCell);
    v5 = self->_deleteCell;
    self->_deleteCell = v4;

    -[VehicleLabelCell setAccessibilityIdentifier:](self->_deleteCell, "setAccessibilityIdentifier:", CFSTR("DeleteCell"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleLabelCell label](self->_deleteCell, "label"));
    objc_msgSend(v7, "setTextColor:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("[Virtual Garage] Remove This Vehicle"), CFSTR("localized string not found"), 0));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleLabelCell label](self->_deleteCell, "label"));
    objc_msgSend(v10, "setText:", v9);

    deleteCell = self->_deleteCell;
  }
  return deleteCell;
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
  id v15;
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
  void *v29;
  void *v30;
  objc_super v31;
  _QWORD v32[4];

  v31.receiver = self;
  v31.super_class = (Class)VehicleDetailViewController;
  -[VehicleDetailViewController viewDidLoad](&v31, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("VehicleDetailView"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController tableView](self, "tableView"));
  objc_msgSend(v4, "addSubview:", v5);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController tableView](self, "tableView"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "leadingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController view](self, "view"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "leadingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v27));
  v32[0] = v26;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController tableView](self, "tableView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController view](self, "view"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "trailingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v22));
  v32[1] = v21;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController tableView](self, "tableView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "topAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v7));
  v32[2] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController tableView](self, "tableView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController view](self, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v12));
  v32[3] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

  v15 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "dismiss");
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v16, "setLeftBarButtonItem:", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController navigationItem](self, "navigationItem"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "leftBarButtonItem"));
  objc_msgSend(v18, "setAccessibilityIdentifier:", CFSTR("DoneButton"));

  -[VehicleDetailViewController _updateContent](self, "_updateContent");
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
  v9.super_class = (Class)VehicleDetailViewController;
  -[VehicleDetailViewController viewWillAppear:](&v9, "viewWillAppear:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController traitCollection](self, "traitCollection"));
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
  v7.super_class = (Class)VehicleDetailViewController;
  -[VehicleDetailViewController viewWillDisappear:](&v7, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController traitCollection](self, "traitCollection"));
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    objc_msgSend(v6, "setLockedOrientations:", 0);

  }
}

- (void)viewIsAppearing:(BOOL)a3
{
  double v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VehicleDetailViewController;
  -[VehicleDetailViewController viewIsAppearing:](&v6, "viewIsAppearing:", a3);
  -[UIView systemLayoutSizeFittingSize:](self->_headerView, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  -[UIView setFrame:](self->_headerView, "setFrame:", CGPointZero.x, CGPointZero.y, v4, v5);
  -[VehicleDetailViewController _reloadAndSave:](self, "_reloadAndSave:", 0);
}

- (void)dismiss
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v3, "captureUserAction:onTarget:eventValue:", 445, 662, 0);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController presentingViewController](self, "presentingViewController"));
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController tableStructure](self, "tableStructure", a3));
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
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController tableView:titleForHeaderInSection:](self, "tableView:titleForHeaderInSection:", v6, a4));

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

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController tableStructure](self, "tableStructure", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", a4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "footerText"));
  return v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController tableStructure](self, "tableStructure", a3));
  v4 = objc_msgSend(v3, "count");

  return (int64_t)v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController tableStructure](self, "tableStructure", a3));
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
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController tableStructure](self, "tableStructure"));
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
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController tableStructure](self, "tableStructure"));
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

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return UITableViewAutomaticDimension;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  VehicleConnectorListViewController *v15;
  void *v16;
  void *v17;
  __objc2_class *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  VGVehicle *vehicle;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);
  v40 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cellForRowAtIndexPath:", v6));

  v8 = (id)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController editPlugsCell](self, "editPlugsCell"));
  if (v40 == v8)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v14, "captureUserAction:onTarget:eventValue:", 438, 662, 0);

    v15 = -[VehicleConnectorListViewController initWithVehicle:]([VehicleConnectorListViewController alloc], "initWithVehicle:", self->_vehicle);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController navigationController](self, "navigationController"));
    objc_msgSend(v16, "pushViewController:animated:", v15, 1);

LABEL_14:
    goto LABEL_15;
  }
  v9 = (id)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController addNetworksCell](self, "addNetworksCell"));

  if (v40 == v9)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v17, "captureUserAction:onTarget:eventValue:", 453, 662, 0);

    if (sub_1002A8AA0(self) == 5)
      v18 = MacChargingNetworksPickerViewController;
    else
      v18 = _TtC4Maps35ChargingNetworkPickerViewController;
    v24 = [v18 alloc];
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicle preferredChargingNetworks](self->_vehicle, "preferredChargingNetworks"));
    v15 = (VehicleConnectorListViewController *)objc_msgSend(v24, "initWithExcludedNetworks:delegate:", v25, self);

    v26 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v15);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController topMostPresentedViewController](self, "topMostPresentedViewController"));
    objc_msgSend(v27, "presentViewController:animated:completion:", v26, 1, 0);

    goto LABEL_14;
  }
  v10 = (id)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController licensePlateCell](self, "licensePlateCell"));

  if (v40 == v10)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v19, "captureUserAction:onTarget:eventValue:", 2125, 662, 0);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "appCoordinator"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "baseActionCoordinator"));

    vehicle = self->_vehicle;
LABEL_11:
    objc_msgSend(v22, "presentLPRWithVehicle:scenario:presenter:completionBlock:", vehicle, 1, self, 0);

    goto LABEL_15;
  }
  v11 = (id)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController editLicensePlateCell](self, "editLicensePlateCell"));

  if (v40 == v11)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicle licensePlate](self->_vehicle, "licensePlate"));
    v29 = objc_msgSend(v28, "length");

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v31 = v30;
    if (v29)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[VehicleDetailViewController vehicleCount](self, "vehicleCount")));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "stringValue"));
      objc_msgSend(v31, "captureUserAction:onTarget:eventValue:", 2124, 660, v33);

      v34 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicle displayName](self->_vehicle, "displayName"));
      v35 = objc_msgSend(v34, "length");

      if (!v35)
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("[Vehicle Selection] My Vehicle"), CFSTR("localized string not found"), 0));
        -[VGVehicle setDisplayName:](self->_vehicle, "setDisplayName:", v37);

      }
      -[VGVehicle setLicensePlate:](self->_vehicle, "setLicensePlate:", 0);
      -[VehicleDetailViewController _reloadAndSave:](self, "_reloadAndSave:", 1);
      goto LABEL_15;
    }
    objc_msgSend(v30, "captureUserAction:onTarget:eventValue:", 2115, 660, 0);

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "appCoordinator"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "baseActionCoordinator"));

    vehicle = self->_vehicle;
    goto LABEL_11;
  }
  v12 = (id)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController deleteCell](self, "deleteCell"));

  v13 = v40;
  if (v40 == v12)
  {
    -[VehicleDetailViewController confirmRemoveVehicle](self, "confirmRemoveVehicle");
LABEL_15:
    v13 = v40;
  }

}

- (void)_updateContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  NSBundle *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  VGVehicle *vehicle;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  VGVehicle *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicle colorHex](self->_vehicle, "colorHex"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _maps_colorFromHexRepresentation:](UIColor, "_maps_colorFromHexRepresentation:", v3));
  v5 = v4;
  if (!v4)
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController vehicleColorView](self, "vehicleColorView"));
  objc_msgSend(v6, "setBackgroundColor:", v5);

  if (!v4)
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController vehicleColorView](self, "vehicleColorView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "backgroundColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_msgSend(v8, "_maps_euclideanDistanceFromColor:", v9);
  v11 = v10;

  if (v11 >= 0.1)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController vehicleIconView](self, "vehicleIconView"));
    objc_msgSend(v14, "setTintColor:", v13);
  }
  else
  {
    v12 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController traitCollection](self, "traitCollection"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:inBundle:compatibleWithTraitCollection:](UIColor, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("TertiaryVehicleTint"), v13, v14));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController vehicleIconView](self, "vehicleIconView"));
    objc_msgSend(v16, "setTintColor:", v15);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicle displayName](self->_vehicle, "displayName"));
  v18 = objc_msgSend(v17, "length");
  vehicle = self->_vehicle;
  if (v18)
    v20 = objc_claimAutoreleasedReturnValue(-[VGVehicle displayName](vehicle, "displayName"));
  else
    v20 = objc_claimAutoreleasedReturnValue(-[VGVehicle licensePlate](vehicle, "licensePlate"));
  v56 = (id)v20;

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController vehicleNameLabel](self, "vehicleNameLabel"));
  objc_msgSend(v21, "setText:", v56);

  v22 = -[VGVehicle isPureElectricVehicle](self->_vehicle, "isPureElectricVehicle") ^ 1;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController vehicleBatteryView](self, "vehicleBatteryView"));
  objc_msgSend(v23, "setHidden:", v22);

  if (-[VGVehicle isPureElectricVehicle](self->_vehicle, "isPureElectricVehicle"))
  {
    v24 = self->_vehicle;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController vehicleBatteryView](self, "vehicleBatteryView"));
    objc_msgSend(v25, "setVehicle:", v24);

  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicle licensePlate](self->_vehicle, "licensePlate"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController licensePlateCell](self, "licensePlateCell"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "detailLabel"));
  objc_msgSend(v28, "setText:", v26);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicle manufacturer](self->_vehicle, "manufacturer"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController vehicleMakeCell](self, "vehicleMakeCell"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "detailLabel"));
  objc_msgSend(v31, "setText:", v29);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicle model](self->_vehicle, "model"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController vehicleModelCell](self, "vehicleModelCell"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "detailLabel"));
  objc_msgSend(v34, "setText:", v32);

  v35 = VGChargingConnectorTypeOptionsUnpacked(-[VGVehicle supportedConnectors](self->_vehicle, "supportedConnectors"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  v37 = sub_10039DCD4(v36, &stru_1011DDC00);
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "componentsJoinedByString:", CFSTR(", ")));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController editPlugsCell](self, "editPlugsCell"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "detailLabel"));
  objc_msgSend(v41, "setText:", v39);

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicle licensePlate](self->_vehicle, "licensePlate"));
  v43 = objc_msgSend(v42, "length");

  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v45 = v44;
  if (v43)
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("[Virtual Garage] Remove License Plate Number"), CFSTR("localized string not found"), 0));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController editLicensePlateCell](self, "editLicensePlateCell"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "label"));
    objc_msgSend(v48, "setText:", v46);

    v49 = objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
  }
  else
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("[Virtual Garage] Update License Plate Number"), CFSTR("localized string not found"), 0));
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController editLicensePlateCell](self, "editLicensePlateCell"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "label"));
    objc_msgSend(v52, "setText:", v50);

    v49 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  }
  v53 = (void *)v49;
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController editLicensePlateCell](self, "editLicensePlateCell"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "label"));
  objc_msgSend(v55, "setTextColor:", v53);

}

- (void)confirmRemoveVehicle
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
  _QWORD v13[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController title](self, "title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("[Virtual Garage] Remove Vehicle Alert"), CFSTR("localized string not found"), 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v3, v5, 0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("[Virtual Garage] Remove Vehicle Alert Action"), CFSTR("localized string not found"), 0));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1009AE04C;
  v13[3] = &unk_1011AD938;
  v13[4] = self;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v8, 2, v13));
  objc_msgSend(v6, "addAction:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("[Virtual Garage] Remove Vehicle Alert Action Cancel"), CFSTR("localized string not found"), 0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v11, 1, 0));
  objc_msgSend(v6, "addAction:", v12);

  -[VehicleDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
}

- (BOOL)_isMinimumViableVehicle
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicle combinedDisplayName](self->_vehicle, "combinedDisplayName"));
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (void)_saveIfAppropriate
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1009AE24C;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_pressedEdit
{
  void *v3;
  NSBundle *v4;
  void *v5;
  EditVehicleViewController *v6;
  NSMutableArray *v7;
  void *v8;
  EditVehicleViewController *v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v3, "captureUserAction:onTarget:eventValue:", 2120, 662, 0);

  v4 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v11 = (id)objc_claimAutoreleasedReturnValue(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController traitCollection](self, "traitCollection"));
  v6 = [EditVehicleViewController alloc];
  v7 = sub_10037D03C(v11, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = -[EditVehicleViewController initWithColors:vehicle:delegate:](v6, "initWithColors:vehicle:delegate:", v8, self->_vehicle, self);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController navigationController](self, "navigationController"));
  objc_msgSend(v10, "pushViewController:animated:", v9, 1);

}

- (void)_pressedOpen
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  VGVehicle *vehicle;
  id v9;
  uint8_t buf[4];
  VGVehicle *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicle pairedAppIdentifier](self->_vehicle, "pairedAppIdentifier"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v4, "captureUserAction:onTarget:eventValue:", 2110, 662, 0);

    v9 = (id)objc_claimAutoreleasedReturnValue(+[FBSOpenApplicationService serviceWithDefaultShellEndpoint](FBSOpenApplicationService, "serviceWithDefaultShellEndpoint"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicle pairedAppIdentifier](self->_vehicle, "pairedAppIdentifier"));
    objc_msgSend(v9, "openApplication:withOptions:completion:", v5, 0, 0);

  }
  else
  {
    v6 = sub_1004326FC();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      vehicle = self->_vehicle;
      *(_DWORD *)buf = 138412290;
      v11 = vehicle;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "Tried to open an app for vehicle that doesn't have a pairedAppId: %@", buf, 0xCu);
    }

  }
}

- (void)_reloadAndSave:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  -[VehicleDetailViewController _updateContent](self, "_updateContent");
  if (v3)
    -[VehicleDetailViewController _saveIfAppropriate](self, "_saveIfAppropriate");
  -[VehicleDetailViewController setTableStructure:](self, "setTableStructure:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController tableView](self, "tableView"));
  objc_msgSend(v5, "reloadData");

}

- (void)networkPickerControllerDidSelectNetworks:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  __CFString *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  __CFString *v29;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicle preferredChargingNetworks](self->_vehicle, "preferredChargingNetworks"));
    v6 = v5;
    if (v5)
      v7 = v5;
    else
      v7 = objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    v9 = v7;

    v10 = sub_1004326FC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = v4;
      v13 = v12;
      if (v12)
      {
        if (objc_msgSend(v12, "count"))
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "componentsJoinedByString:", CFSTR(", ")));
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> [%@]"), v13, v14));

        }
        else
        {
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v13));
        }
      }
      else
      {
        v15 = CFSTR("<nil>");
      }

      v16 = v15;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicle displayName](self->_vehicle, "displayName"));
      v18 = (id)objc_claimAutoreleasedReturnValue(-[NSObject allObjects](v9, "allObjects"));
      v19 = v18;
      if (v18)
      {
        if (objc_msgSend(v18, "count"))
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "componentsJoinedByString:", CFSTR(", ")));
          v21 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> [%@]"), v19, v20));

        }
        else
        {
          v21 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v19));
        }
      }
      else
      {
        v21 = CFSTR("<nil>");
      }

      *(_DWORD *)buf = 138412802;
      v25 = v16;
      v26 = 2112;
      v27 = v17;
      v28 = 2112;
      v29 = v21;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Network Picker VC did select networks: %@, will update vehicle: %@ (current networks: %@)", buf, 0x20u);

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject setByAddingObjectsFromArray:](v9, "setByAddingObjectsFromArray:", v4));
    -[VGVehicle setPreferredChargingNetworks:](self->_vehicle, "setPreferredChargingNetworks:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
    objc_msgSend(v23, "virtualGarageSaveVehicle:", self->_vehicle);

  }
  else
  {
    v8 = sub_1004326FC();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Network Picker VC did not select any network. Ignoring.", buf, 2u);
    }
  }

}

- (void)editVehicleViewController:(id)a3 didSelectColor:(id)a4 nickname:(id)a5 removedNetworks:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  __CFString *v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  __CFString *v23;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = sub_1004326FC();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = v11;
    v15 = v14;
    if (v14)
    {
      if (objc_msgSend(v14, "count"))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "componentsJoinedByString:", CFSTR(", ")));
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> [%@]"), v15, v16));

      }
      else
      {
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v15));
      }
    }
    else
    {
      v17 = CFSTR("<nil>");
    }

    *(_DWORD *)buf = 138412802;
    v19 = v9;
    v20 = 2112;
    v21 = v10;
    v22 = 2112;
    v23 = v17;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "edit vehicle VC selected color: %@, nickname: %@, removedNetworks: %@", buf, 0x20u);

  }
  -[VehicleDetailViewController _reloadAndSave:](self, "_reloadAndSave:", 1);

}

- (void)editVehicleViewControllerDidSelectDone:(id)a3
{
  id v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[VehicleDetailViewController navigationController](self, "navigationController", a3));
  v4 = objc_msgSend(v5, "popToViewController:animated:", self, 1);

}

- (void)virtualGarageDidUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  if (self->_deletingVehicle)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "vehicles"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "count")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringValue"));
    objc_msgSend(v5, "captureUserAction:onTarget:eventValue:", 2112, 662, v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "vehicles"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "count")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringValue"));
    objc_msgSend(v9, "captureUserAction:onTarget:eventValue:", 2111, 660, v12);

    self->_deletingVehicle = 0;
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1009AEBD0;
  v14[3] = &unk_1011AC8B0;
  v14[4] = self;
  v15 = v4;
  v13 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);

}

- (VehicleDetailViewControllerDelegate)delegate
{
  return (VehicleDetailViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)vehicleCount
{
  return self->_vehicleCount;
}

- (void)setVehicleCount:(unint64_t)a3
{
  self->_vehicleCount = a3;
}

- (void)setTableStructure:(id)a3
{
  objc_storeStrong((id *)&self->_tableStructure, a3);
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (void)setVehicleColorView:(id)a3
{
  objc_storeStrong((id *)&self->_vehicleColorView, a3);
}

- (void)setVehicleIconView:(id)a3
{
  objc_storeStrong((id *)&self->_vehicleIconView, a3);
}

- (void)setVehicleNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_vehicleNameLabel, a3);
}

- (void)setVehicleBatteryView:(id)a3
{
  objc_storeStrong((id *)&self->_vehicleBatteryView, a3);
}

- (void)setAddNetworksCell:(id)a3
{
  objc_storeStrong((id *)&self->_addNetworksCell, a3);
}

- (void)setEditPlugsCell:(id)a3
{
  objc_storeStrong((id *)&self->_editPlugsCell, a3);
}

- (void)setLicensePlateCell:(id)a3
{
  objc_storeStrong((id *)&self->_licensePlateCell, a3);
}

- (void)setEditLicensePlateCell:(id)a3
{
  objc_storeStrong((id *)&self->_editLicensePlateCell, a3);
}

- (void)setAppCell:(id)a3
{
  objc_storeStrong((id *)&self->_appCell, a3);
}

- (void)setVehicleMakeCell:(id)a3
{
  objc_storeStrong((id *)&self->_vehicleMakeCell, a3);
}

- (void)setVehicleModelCell:(id)a3
{
  objc_storeStrong((id *)&self->_vehicleModelCell, a3);
}

- (void)setDeleteCell:(id)a3
{
  objc_storeStrong((id *)&self->_deleteCell, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleteCell, 0);
  objc_storeStrong((id *)&self->_vehicleModelCell, 0);
  objc_storeStrong((id *)&self->_vehicleMakeCell, 0);
  objc_storeStrong((id *)&self->_appCell, 0);
  objc_storeStrong((id *)&self->_editLicensePlateCell, 0);
  objc_storeStrong((id *)&self->_licensePlateCell, 0);
  objc_storeStrong((id *)&self->_editPlugsCell, 0);
  objc_storeStrong((id *)&self->_addNetworksCell, 0);
  objc_storeStrong((id *)&self->_vehicleBatteryView, 0);
  objc_storeStrong((id *)&self->_vehicleNameLabel, 0);
  objc_storeStrong((id *)&self->_vehicleIconView, 0);
  objc_storeStrong((id *)&self->_vehicleColorView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_tableStructure, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_strongSelf, 0);
  objc_storeStrong((id *)&self->_vehicle, 0);
}

@end
