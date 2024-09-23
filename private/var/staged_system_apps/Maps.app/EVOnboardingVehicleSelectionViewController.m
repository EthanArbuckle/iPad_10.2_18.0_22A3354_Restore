@implementation EVOnboardingVehicleSelectionViewController

- (EVOnboardingVehicleSelectionViewController)initWithVehicles:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  EVOnboardingVehicleSelectionViewController *v9;
  EVOnboardingVehicleSelectionViewController *v10;
  uint64_t v11;
  NSMutableSet *selectedIndexPaths;
  NSUInteger v13;
  uint64_t v14;
  unint64_t i;
  NSMutableSet *v16;
  void *v17;
  char IsEnabled_EVRoutingEnhancements;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  objc_super v26;

  v7 = a3;
  v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)EVOnboardingVehicleSelectionViewController;
  v9 = -[EVOnboardingBaseViewController initWithDelegate:](&v26, "initWithDelegate:", v8);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    objc_storeStrong((id *)&v10->_vehicles, a3);
    v11 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    selectedIndexPaths = v10->_selectedIndexPaths;
    v10->_selectedIndexPaths = (NSMutableSet *)v11;

    v13 = -[NSArray count](v10->_vehicles, "count");
    if (v13)
    {
      for (i = 0; i < v13; ++i)
      {
        v16 = v10->_selectedIndexPaths;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", i, 0));
        -[NSMutableSet addObject:](v16, "addObject:", v17);

        v13 = -[NSArray count](v10->_vehicles, "count");
      }
    }
    IsEnabled_EVRoutingEnhancements = MapsFeature_IsEnabled_EVRoutingEnhancements(v13, v14);
    v19 = objc_alloc((Class)UIBarButtonItem);
    v20 = v19;
    if ((IsEnabled_EVRoutingEnhancements & 1) != 0)
    {
      v21 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("[EV Onboarding] Next"), CFSTR("localized string not found"), 0));
      v23 = objc_msgSend(v20, "initWithTitle:style:target:action:", v22, 2, v10, "_donePressed");
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[EVOnboardingVehicleSelectionViewController navigationItem](v10, "navigationItem"));
      objc_msgSend(v24, "setRightBarButtonItem:", v23);

    }
    else
    {
      v21 = objc_msgSend(v19, "initWithBarButtonSystemItem:target:action:", 0, v10, "_donePressed");
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[EVOnboardingVehicleSelectionViewController navigationItem](v10, "navigationItem"));
      objc_msgSend(v22, "setRightBarButtonItem:", v21);
    }

  }
  return v10;
}

- (void)viewDidAppear:(BOOL)a3
{
  NSMutableSet *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  _BYTE v14[128];

  v13.receiver = self;
  v13.super_class = (Class)EVOnboardingVehicleSelectionViewController;
  -[EVOnboardingVehicleSelectionViewController viewDidAppear:](&v13, "viewDidAppear:", a3);
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = self->_selectedIndexPaths;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[UITableView selectRowAtIndexPath:animated:scrollPosition:](self->_tableView, "selectRowAtIndexPath:animated:scrollPosition:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), 0, 0, (_QWORD)v9);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v6);
  }

}

- (id)obViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  UITableView *v26;
  UITableView *tableView;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("[VirtualGarage] Choose Vehicles"), CFSTR("localized string not found"), 0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("[EV Onboarding] Choose vehicles to plan your trips with."), CFSTR("localized string not found"), 0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("multipleEV")));
  v8 = objc_msgSend(objc_alloc((Class)OBTableWelcomeController), "initWithTitle:detailText:icon:adoptTableViewScrollView:", v4, v6, v7, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
  objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("EVOnboardingVehicleSelectionView"));

  objc_msgSend(v8, "setModalPresentationStyle:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "headerView"));
  objc_msgSend(v10, "setAllowFullWidthIcon:", 1);

  v11 = objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v8, "setTableView:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tableView"));
  objc_msgSend(v12, "setAccessibilityIdentifier:", CFSTR("EVOnboardingVehicleSelectionTableView"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tableView"));
  objc_msgSend(v13, "setAllowsMultipleSelection:", 1);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tableView"));
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tableView"));
  LODWORD(v16) = 1148846080;
  objc_msgSend(v15, "setContentCompressionResistancePriority:forAxis:", 1, v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tableView"));
  objc_msgSend(v17, "setDataSource:", self);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tableView"));
  objc_msgSend(v18, "setDelegate:", self);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tableView"));
  objc_msgSend(v20, "setBackgroundColor:", v19);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tableView"));
  v22 = objc_opt_class(VehicleCell);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[VehicleCell reuseIdentifier](VehicleCell, "reuseIdentifier"));
  objc_msgSend(v21, "registerClass:forCellReuseIdentifier:", v22, v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
  objc_msgSend(v25, "setBackgroundColor:", v24);

  v26 = (UITableView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tableView"));
  tableView = self->_tableView;
  self->_tableView = v26;

  return v8;
}

- (id)_selectedVehicles
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_selectedIndexPaths, "allObjects"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100B1C598;
  v7[3] = &unk_1011B2860;
  v7[4] = self;
  v4 = sub_10039DCD4(v3, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

- (void)_updateNextButton
{
  _BOOL8 v3;
  void *v4;
  id v5;

  if (MapsFeature_IsEnabled_EVRoutingEnhancements(self, a2))
  {
    v3 = -[NSMutableSet count](self->_selectedIndexPaths, "count") != 0;
    v5 = (id)objc_claimAutoreleasedReturnValue(-[EVOnboardingVehicleSelectionViewController navigationItem](self, "navigationItem"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rightBarButtonItem"));
    objc_msgSend(v4, "setEnabled:", v3);

  }
}

- (void)_donePressed
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  __CFString *v10;
  id WeakRetained;
  uint8_t buf[4];
  __CFString *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v3, "captureUserAction:onTarget:eventValue:", 41, 660, 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EVOnboardingVehicleSelectionViewController _selectedVehicles](self, "_selectedVehicles"));
  v5 = sub_10043173C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = v4;
    v8 = v7;
    if (v7)
    {
      if (objc_msgSend(v7, "count"))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", ")));
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> [%@]"), v8, v9));

      }
      else
      {
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v8));
      }
    }
    else
    {
      v10 = CFSTR("<nil>");
    }

    *(_DWORD *)buf = 138412290;
    v13 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "User pressed done with vehicles: %@.", buf, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "vehicleSelectionViewController:didSelectContinueWithVehicles:", self, v4);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v8, "captureUserAction:onTarget:eventValue:", 2113, 660, 0);

  -[NSMutableSet addObject:](self->_selectedIndexPaths, "addObject:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cellForRowAtIndexPath:", v6));

  objc_msgSend(v9, "setAccessoryType:", 3);
  -[EVOnboardingVehicleSelectionViewController _updateNextButton](self, "_updateNextButton");
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v8, "captureUserAction:onTarget:eventValue:", 447, 660, 0);

  -[NSMutableSet removeObject:](self->_selectedIndexPaths, "removeObject:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cellForRowAtIndexPath:", v6));

  objc_msgSend(v9, "setAccessoryType:", 0);
  -[EVOnboardingVehicleSelectionViewController _updateNextButton](self, "_updateNextButton");
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return UITableViewAutomaticDimension;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_vehicles, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSArray *vehicles;
  id v12;
  void *v13;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[VehicleCell reuseIdentifier](VehicleCell, "reuseIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v8, v6));

  v10 = -[NSMutableSet containsObject:](self->_selectedIndexPaths, "containsObject:", v6);
  vehicles = self->_vehicles;
  v12 = objc_msgSend(v6, "row");

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](vehicles, "objectAtIndexedSubscript:", v12));
  objc_msgSend(v9, "setupWithVehicle:cellStyle:isSelected:", v13, 0, v10);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_selectedIndexPaths, 0);
  objc_storeStrong((id *)&self->_vehicles, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
