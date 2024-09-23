@implementation RAPEditEntryPointViewController

- (RAPEditEntryPointViewController)initWithMapRect:(id)a3 entryPoint:(id)a4 delegate:(id)a5 initialViewMode:(int64_t)a6
{
  double var1;
  double var0;
  double v11;
  double v12;
  id v14;
  id v15;
  RAPEditEntryPointViewController *v16;
  RAPEditEntryPointViewController *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  RAPMarkerViewAttributes *v28;
  void *v29;
  RAPMarkerViewAttributes *v30;
  RAPEditLocationMapView *v31;
  RAPEditLocationMapView *editLocationMapView;
  void *v33;
  void *v34;
  CLLocationDegrees v35;
  CLLocationDegrees v36;
  CLLocationDegrees v37;
  CLLocationDegrees v38;
  UITableView *v39;
  UITableView *tableView;
  UITableView *v41;
  uint64_t v42;
  objc_class *v43;
  NSString *v44;
  void *v45;
  UITableView *v46;
  uint64_t v47;
  objc_class *v48;
  NSString *v49;
  void *v50;
  void *v52;
  void *v53;
  objc_super v54;

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v11 = a3.var0.var1;
  v12 = a3.var0.var0;
  v14 = a4;
  v15 = a5;
  v54.receiver = self;
  v54.super_class = (Class)RAPEditEntryPointViewController;
  v16 = -[RAPEditEntryPointViewController init](&v54, "init");
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_delegate, v15);
    v17->_editState = v14 != 0;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Add Entrance [Report an Issue]"), CFSTR("localized string not found"), 0));

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Edit Entrance [Report an Issue]"), CFSTR("localized string not found"), 0));

    v52 = (void *)v21;
    v53 = (void *)v19;
    if (v17->_editState)
      v22 = v21;
    else
      v22 = v19;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController navigationItem](v17, "navigationItem"));
    objc_msgSend(v23, "setTitle:", v22);

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Back"), CFSTR("localized string not found"), 0));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController navigationItem](v17, "navigationItem"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "backBarButtonItem"));
    objc_msgSend(v27, "setTitle:", v25);

    v28 = [RAPMarkerViewAttributes alloc];
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[RAPEntryPoint entryPointStyleAttributes](RAPEntryPoint, "entryPointStyleAttributes"));
    v30 = -[RAPMarkerViewAttributes initWithTitle:styleAttributes:](v28, "initWithTitle:styleAttributes:", 0, v29);

    v31 = -[RAPEditLocationMapView initWithMapRect:viewMode:markerViewAttributes:]([RAPEditLocationMapView alloc], "initWithMapRect:viewMode:markerViewAttributes:", a6, v30, v12, v11, var0, var1);
    editLocationMapView = v17->_editLocationMapView;
    v17->_editLocationMapView = v31;

    -[RAPEditLocationMapView setCrosshairEnabled:](v17->_editLocationMapView, "setCrosshairEnabled:", 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("Pan & zoom map to adjust entrance location [Report an Issue]"), CFSTR("localized string not found"), 0));
    -[RAPEditLocationMapView setPrompt:](v17->_editLocationMapView, "setPrompt:", v34);

    if (v14)
    {
      objc_storeStrong((id *)&v17->_entryPoint, a4);
      v17->_entryPointType = (int64_t)objc_msgSend(v14, "entryPointType");
      objc_msgSend(v14, "coordinate");
      v17->_originalCoordinate.latitude = v35;
      v17->_originalCoordinate.longitude = v36;
      v17->_originalEntryPointType = (int64_t)objc_msgSend(v14, "entryPointType");
      objc_msgSend(v14, "coordinate");
      -[RAPEditLocationMapView setCenterCoordinate:](v17->_editLocationMapView, "setCenterCoordinate:");
    }
    else
    {
      v17->_entryPointType = 0;
      -[RAPEditLocationMapView centerCoordinate](v17->_editLocationMapView, "centerCoordinate");
      v17->_originalCoordinate.latitude = v37;
      v17->_originalCoordinate.longitude = v38;
    }
    v39 = (UITableView *)objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 1, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    tableView = v17->_tableView;
    v17->_tableView = v39;

    v41 = v17->_tableView;
    v42 = objc_opt_class(RAPCheckmarkTableViewCell);
    v43 = (objc_class *)objc_opt_class(RAPCheckmarkTableViewCell);
    v44 = NSStringFromClass(v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
    -[UITableView registerClass:forCellReuseIdentifier:](v41, "registerClass:forCellReuseIdentifier:", v42, v45);

    v46 = v17->_tableView;
    v47 = objc_opt_class(RAPSingleLineTableViewCell);
    v48 = (objc_class *)objc_opt_class(RAPSingleLineTableViewCell);
    v49 = NSStringFromClass(v48);
    v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
    -[UITableView registerClass:forCellReuseIdentifier:](v46, "registerClass:forCellReuseIdentifier:", v47, v50);

    -[UITableView _maps_initializeRAPAppearance](v17->_tableView, "_maps_initializeRAPAppearance");
    -[UITableView setDataSource:](v17->_tableView, "setDataSource:", v17);
    -[UITableView setDelegate:](v17->_tableView, "setDelegate:", v17);

  }
  return v17;
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
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)RAPEditEntryPointViewController;
  -[RAPEditEntryPointViewController viewDidLoad](&v21, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("RAPGroupedTableViewBackgroundColor")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController editLocationMapView](self, "editLocationMapView"));
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController editLocationMapView](self, "editLocationMapView"));
  objc_msgSend(v6, "setDelegate:", self);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController editLocationMapView](self, "editLocationMapView"));
  objc_msgSend(v7, "addSubview:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController tableView](self, "tableView"));
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController tableView](self, "tableView"));
  objc_msgSend(v10, "addSubview:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController entryPoint](self, "entryPoint"));
  v13 = objc_alloc((Class)UIBarButtonItem);
  v14 = v13;
  if (v12)
  {
    v15 = objc_msgSend(v13, "initWithBarButtonSystemItem:target:action:", 0, self, "_editEntryPoint");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v16, "setRightBarButtonItem:", v15);
  }
  else
  {
    v15 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Save [RAP][Entry Point]"), CFSTR("localized string not found"), 0));
    v17 = objc_msgSend(v14, "initWithTitle:style:target:action:", v16, 2, self, "_saveEntryPoint");
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v18, "setRightBarButtonItem:", v17);

  }
  v19 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, self, "_cancelEditingEntryPoint");
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v20, "setLeftBarButtonItem:", v19);

  -[RAPEditEntryPointViewController _updateDoneButton](self, "_updateDoneButton");
  -[RAPEditEntryPointViewController setupConstraints](self, "setupConstraints");
}

- (void)setupConstraints
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
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[8];

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController editLocationMapView](self, "editLocationMapView"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "leadingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController view](self, "view"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "leadingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v41));
  v45[0] = v40;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController editLocationMapView](self, "editLocationMapView"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "trailingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController view](self, "view"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "trailingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v36));
  v45[1] = v35;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController editLocationMapView](self, "editLocationMapView"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "topAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController view](self, "view"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "safeAreaLayoutGuide"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "topAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v30));
  v45[2] = v29;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController editLocationMapView](self, "editLocationMapView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "heightAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController view](self, "view"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "heightAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:multiplier:", v25, 0.5));
  v45[3] = v24;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController tableView](self, "tableView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController editLocationMapView](self, "editLocationMapView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bottomAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v20));
  v45[4] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController tableView](self, "tableView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController view](self, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "leadingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v15));
  v45[5] = v14;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController tableView](self, "tableView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:", v5));
  v45[6] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController tableView](self, "tableView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
  v45[7] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v45, 8));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (void)_cancelEditingEntryPoint
{
  void *v3;
  void *v4;

  -[RAPEditEntryPointViewController _captureUserAction:](self, "_captureUserAction:", -[RAPEditEntryPointViewController backAction](self, "backAction"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController delegate](self, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController editLocationMapView](self, "editLocationMapView"));
  objc_msgSend(v3, "editEntryPointController:willDismissWithViewMode:", self, objc_msgSend(v4, "viewMode"));

  -[RAPEditEntryPointViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_editEntryPoint
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;

  -[RAPEditEntryPointViewController _captureUserAction:](self, "_captureUserAction:", 16);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController delegate](self, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController entryPoint](self, "entryPoint"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController editLocationMapView](self, "editLocationMapView"));
  objc_msgSend(v5, "centerCoordinate");
  objc_msgSend(v3, "userDidRequestModificationOfEntryPoint:withCoordinates:entryPointType:", v4, -[RAPEditEntryPointViewController entryPointType](self, "entryPointType"), v6, v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController delegate](self, "delegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController editLocationMapView](self, "editLocationMapView"));
  objc_msgSend(v8, "editEntryPointController:willDismissWithViewMode:", self, objc_msgSend(v9, "viewMode"));

  -[RAPEditEntryPointViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_saveEntryPoint
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;

  -[RAPEditEntryPointViewController _captureUserAction:](self, "_captureUserAction:", 10110);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController delegate](self, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController editLocationMapView](self, "editLocationMapView"));
  objc_msgSend(v4, "centerCoordinate");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userDidRequestCreationOfEntryPointWithCoordinates:entryPointType:", -[RAPEditEntryPointViewController entryPointType](self, "entryPointType"), v5, v6));
  -[RAPEditEntryPointViewController setEntryPoint:](self, "setEntryPoint:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController delegate](self, "delegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController editLocationMapView](self, "editLocationMapView"));
  objc_msgSend(v8, "editEntryPointController:willDismissWithViewMode:", self, objc_msgSend(v9, "viewMode"));

  -[RAPEditEntryPointViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_deleteEntryPoint
{
  void *v3;
  void *v4;

  -[RAPEditEntryPointViewController _captureUserAction:](self, "_captureUserAction:", 10190);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController delegate](self, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController entryPoint](self, "entryPoint"));
  objc_msgSend(v3, "userDidRequestDeletionOfEntryPoint:", v4);

  -[RAPEditEntryPointViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)editLocationMapView:(id)a3 didChangeViewMode:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  if ((unint64_t)a4 <= 2)
  {
    v7 = v6;
    -[RAPEditEntryPointViewController _captureUserAction:](self, "_captureUserAction:", dword_100E3F3B0[a4]);
    v6 = v7;
  }

}

- (void)editLocationMapViewFinishedPanning:(id)a3
{
  -[RAPEditEntryPointViewController _captureUserAction:](self, "_captureUserAction:", 10141);
}

- (void)editLocationMapViewFinishedZoomingIn:(id)a3
{
  -[RAPEditEntryPointViewController _captureUserAction:](self, "_captureUserAction:", 10185);
}

- (void)editLocationMapViewFinishedZoomingOut:(id)a3
{
  -[RAPEditEntryPointViewController _captureUserAction:](self, "_captureUserAction:", 10186);
}

- (void)_captureUserAction:(int)a3
{
  if (a3)
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", *(_QWORD *)&a3, -[RAPEditEntryPointViewController analyticTarget](self, "analyticTarget"), 0);
}

- (int)analyticTarget
{
  if (self->_editState)
    return 1159;
  else
    return 1161;
}

- (int)backAction
{
  return 10111;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController entryPoint](self, "entryPoint", a3));

  if (v3)
    return 2;
  else
    return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4)
    return 1;
  else
    return 3;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  if (a4)
  {
    v4 = 0;
  }
  else
  {
    v5 = a3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Entrance Type [RAP]"), CFSTR("localized string not found"), 0));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_maps_groupedHeaderViewWithTitle:", v7));

  }
  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  if (objc_msgSend(v6, "section"))
    v8 = objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController _tableView:deleteCellForIndexPath:](self, "_tableView:deleteCellForIndexPath:", v7, v6));
  else
    v8 = objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController _tableView:entryTypeCellForIndexPath:](self, "_tableView:entryTypeCellForIndexPath:", v7, v6));
  v9 = (void *)v8;

  return v9;
}

- (id)_tableView:(id)a3 entryTypeCellForIndexPath:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v6 = a4;
  v7 = a3;
  v8 = (objc_class *)objc_opt_class(RAPCheckmarkTableViewCell);
  v9 = NSStringFromClass(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v10, v6));

  v12 = objc_msgSend(v6, "row");
  if (v12 == (id)2)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Both [Report an Issue]"), CFSTR("localized string not found"), 0));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "textLabel"));
    objc_msgSend(v15, "setText:", v14);
    v16 = 3;
    goto LABEL_7;
  }
  if (v12 == (id)1)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Walk [RAP][Entry Points]"), CFSTR("localized string not found"), 0));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "textLabel"));
    objc_msgSend(v15, "setText:", v14);
    v16 = 1;
    goto LABEL_7;
  }
  if (!v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Drive [RAP][Entry Points]"), CFSTR("localized string not found"), 0));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "textLabel"));
    objc_msgSend(v15, "setText:", v14);
    v16 = 2;
LABEL_7:

    objc_msgSend(v11, "setChecked:", -[RAPEditEntryPointViewController entryPointType](self, "entryPointType") == v16);
  }
  return v11;
}

- (id)_tableView:(id)a3 deleteCellForIndexPath:(id)a4
{
  id v5;
  id v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a4;
  v6 = a3;
  v7 = (objc_class *)objc_opt_class(RAPSingleLineTableViewCell);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v9, v5));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Remove Entrance [Report an Issue]"), CFSTR("localized string not found"), 0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textLabel"));
  objc_msgSend(v13, "setText:", v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textLabel"));
  objc_msgSend(v15, "setTextColor:", v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textLabel"));
  objc_msgSend(v16, "setTextAlignment:", 1);

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  id v11;
  id v12;

  v12 = a3;
  v6 = a4;
  objc_msgSend(v12, "deselectRowAtIndexPath:animated:", v6, 1);
  if (objc_msgSend(v6, "section"))
  {
    -[RAPEditEntryPointViewController _captureUserAction:](self, "_captureUserAction:", 10190);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController delegate](self, "delegate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController entryPoint](self, "entryPoint"));
    objc_msgSend(v7, "userDidRequestDeletionOfEntryPoint:", v8);

    -[RAPEditEntryPointViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
  else
  {
    v9 = -[RAPEditEntryPointViewController entryPointType](self, "entryPointType");
    v10 = (unint64_t)objc_msgSend(v6, "row");
    if (v10 <= 2)
      -[RAPEditEntryPointViewController setEntryPointType:](self, "setEntryPointType:", qword_100E3F3C0[v10]);
    if (v9 != (void *)-[RAPEditEntryPointViewController entryPointType](self, "entryPointType"))
    {
      -[RAPEditEntryPointViewController _captureUserAction:](self, "_captureUserAction:", 10191);
      v11 = objc_msgSend(objc_alloc((Class)NSIndexSet), "initWithIndex:", 0);
      objc_msgSend(v12, "reloadSections:withRowAnimation:", v11, 5);

      -[RAPEditEntryPointViewController _updateDoneButton](self, "_updateDoneButton");
    }
  }

}

- (void)_updateDoneButton
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  int64_t entryPointType;
  _BOOL4 v10;
  void *v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView mapView](self->_editLocationMapView, "mapView"));
  objc_msgSend(v3, "centerCoordinate");
  v5 = v4;
  v7 = v6;

  v8 = 0;
  if (v7 >= -180.0 && v7 <= 180.0 && v5 >= -90.0 && v5 <= 90.0)
  {
    entryPointType = self->_entryPointType;
    if (self->_editState)
    {
      if (entryPointType == self->_originalEntryPointType)
      {
        v10 = vabdd_f64(v5, self->_originalCoordinate.latitude) >= 0.00000000999999994;
        v8 = vabdd_f64(v7, self->_originalCoordinate.longitude) >= 0.00000000999999994 || v10;
      }
      else
      {
        v8 = 1;
      }
    }
    else
    {
      v8 = entryPointType != 0;
    }
  }
  v12 = (id)objc_claimAutoreleasedReturnValue(-[RAPEditEntryPointViewController navigationItem](self, "navigationItem"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "rightBarButtonItem"));
  objc_msgSend(v11, "setEnabled:", v8);

}

- (RAPEditLocationMapView)editLocationMapView
{
  return self->_editLocationMapView;
}

- (void)setEditLocationMapView:(id)a3
{
  objc_storeStrong((id *)&self->_editLocationMapView, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (RAPEditEntryPointDelegate)delegate
{
  return (RAPEditEntryPointDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (RAPEntryPoint)entryPoint
{
  return self->_entryPoint;
}

- (void)setEntryPoint:(id)a3
{
  objc_storeStrong((id *)&self->_entryPoint, a3);
}

- (int64_t)entryPointType
{
  return self->_entryPointType;
}

- (void)setEntryPointType:(int64_t)a3
{
  self->_entryPointType = a3;
}

- (int64_t)editState
{
  return self->_editState;
}

- (void)setEditState:(int64_t)a3
{
  self->_editState = a3;
}

- (CLLocationCoordinate2D)originalCoordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_originalCoordinate.latitude;
  longitude = self->_originalCoordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (void)setOriginalCoordinate:(CLLocationCoordinate2D)a3
{
  self->_originalCoordinate = a3;
}

- (int64_t)originalEntryPointType
{
  return self->_originalEntryPointType;
}

- (void)setOriginalEntryPointType:(int64_t)a3
{
  self->_originalEntryPointType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryPoint, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_editLocationMapView, 0);
}

@end
