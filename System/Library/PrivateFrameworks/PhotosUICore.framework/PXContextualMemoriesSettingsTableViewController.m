@implementation PXContextualMemoriesSettingsTableViewController

- (PXContextualMemoriesSettingsTableViewController)init
{
  PXContextualMemoriesSettingsTableViewController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXContextualMemoriesSettingsTableViewController;
  v2 = -[PXContextualMemoriesSettingsTableViewController initWithStyle:](&v5, sel_initWithStyle_, 1);
  if (v2)
  {
    objc_msgSend((id)objc_opt_class(), "title");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXContextualMemoriesSettingsTableViewController setTitle:](v2, "setTitle:", v3);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  -[PXContextualMemoriesSettings timeSetting](self->_settings, "timeSetting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("date"), &kPXContextualMemoriesSettingsKVOContextKeyDate);

  -[PXContextualMemoriesSettings locationSetting](self->_settings, "locationSetting");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("coordinate"), &kPXContextualMemoriesSettingsKVOContextKeyCoordinate);

  -[PXContextualMemoriesSettings locationSetting](self->_settings, "locationSetting");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("placemark"), &kPXContextualMemoriesSettingsKVOContextKeyPlacemark);

  -[PXContextualMemoriesSettings peopleSetting](self->_settings, "peopleSetting");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:forKeyPath:context:", self, CFSTR("peopleNames"), &kPXContextualMemoriesSettingsKVOContextKeyPeople);

  v7.receiver = self;
  v7.super_class = (Class)PXContextualMemoriesSettingsTableViewController;
  -[PXContextualMemoriesSettingsTableViewController dealloc](&v7, sel_dealloc);
}

- (void)_installProgressIndicatorView
{
  id v3;
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
  id v27;

  v27 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PXContextualMemoriesSettingsTableViewController setProgressIndicatorView:](self, "setProgressIndicatorView:", v27);
  v3 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "setText:", CFSTR("Loading..."));
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B58]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v4);

  objc_msgSend(v3, "setTextAlignment:", 1);
  objc_msgSend(v27, "addSubview:", v3);
  objc_msgSend(v3, "widthAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "widthAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 1);

  objc_msgSend(v3, "centerXAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "centerXAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActive:", 1);

  objc_msgSend(v3, "centerYAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "centerYAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActive:", 1);

  -[PXContextualMemoriesSettingsTableViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v27);
  objc_msgSend(v27, "widthAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "widthAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActive:", 1);

  objc_msgSend(v27, "heightAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "heightAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setActive:", 1);

  objc_msgSend(v27, "centerXAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "centerXAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setActive:", 1);

  objc_msgSend(v27, "centerYAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "centerYAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setActive:", 1);

}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PXContextualMemoriesSettingsTableViewController;
  -[PXContextualMemoriesSettingsTableViewController viewDidLoad](&v15, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x1E0DC34F0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Reset all"), &stru_1E5149688, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithTitle:style:target:action:", v5, 0, self, sel__didPressResetAll_);
  -[PXContextualMemoriesSettingsTableViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRightBarButtonItem:", v6);

  v8 = *MEMORY[0x1E0DC53D8];
  -[PXContextualMemoriesSettingsTableViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRowHeight:", v8);

  -[PXContextualMemoriesSettingsTableViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEstimatedRowHeight:", 44.0);

  -[PXContextualMemoriesSettingsTableViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAllowsMultipleSelection:", 1);

  -[PXContextualMemoriesSettingsTableViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PXContextualMemoriesSettingsValueTableViewCell"));

  -[PXContextualMemoriesSettingsTableViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PXContextualMemoriesSettingsDatePickerTableViewCell"));

  -[PXContextualMemoriesSettingsTableViewController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PXContextualMemoriesSettingsLocationPickerTableViewCell"));

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXContextualMemoriesSettingsTableViewController;
  -[PXContextualMemoriesSettingsTableViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[PXContextualMemoriesSettingsTableViewController _installProgressIndicatorView](self, "_installProgressIndicatorView");
  +[PXContextualMemoriesSettingsController sharedController](PXContextualMemoriesSettingsController, "sharedController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__PXContextualMemoriesSettingsTableViewController_viewWillAppear___block_invoke;
  v5[3] = &unk_1E5120DF0;
  v5[4] = self;
  objc_msgSend(v4, "requestUpdatedContextualMemoriesSettingsWithOptions:completionHandler:", 0, v5);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[PXContextualMemoriesSettings settings](self->_settings, "settings", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  int64_t v8;

  -[PXContextualMemoriesSettings settings](self->_settings, "settings", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && self->_showsDatePicker
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && self->_showsLocationPicker)
  {
    v8 = 2;
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  BOOL v9;
  __CFString *v10;
  __CFString *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  __CFString *v32;
  void *v33;
  id v34;
  _QWORD v36[4];
  id v37;
  CLLocationCoordinate2D v38;

  v6 = a3;
  v7 = a4;
  v8 = -[PXContextualMemoriesSettingsTableViewController _isDatePickerCellAtIndexPath:](self, "_isDatePickerCellAtIndexPath:", v7);
  v9 = -[PXContextualMemoriesSettingsTableViewController _isLocationPickerCellAtIndexPath:](self, "_isLocationPickerCellAtIndexPath:", v7);
  if (v8)
  {
    v10 = CFSTR("PXContextualMemoriesSettingsDatePickerTableViewCell");
    v11 = CFSTR("PXContextualMemoriesSettingsDatePickerTableViewCell");
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("PXContextualMemoriesSettingsDatePickerTableViewCell"), v7);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "datePicker");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXContextualMemoriesSettings timeSetting](self->_settings, "timeSetting");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDate:animated:", v15, 0);

    objc_msgSend(v12, "datePicker");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "addTarget:action:forControlEvents:", self, sel__didChangeDatePicker_, 4096);
  }
  else if (v9)
  {
    v17 = CFSTR("PXContextualMemoriesSettingsLocationPickerTableViewCell");
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("PXContextualMemoriesSettingsLocationPickerTableViewCell"), v7);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "mapView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setMapViewDelegate:", self);
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", self, sel__handleLongPress_);
    objc_msgSend(v18, "addGestureRecognizer:", v19);
    -[PXContextualMemoriesSettings locationSetting](self->_settings, "locationSetting");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addAnnotation:", v20);

    -[PXContextualMemoriesSettings locationSetting](self->_settings, "locationSetting");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "coordinate");
    v23 = v22;
    v25 = v24;

    v38.latitude = v23;
    v38.longitude = v25;
    if (CLLocationCoordinate2DIsValid(v38))
    {
      -[PXContextualMemoriesSettingsTableViewController _regionForLocationCoordinate:](self, "_regionForLocationCoordinate:", v23, v25);
      objc_msgSend(v18, "setRegion:animated:", 0);
    }

    v10 = CFSTR("PXContextualMemoriesSettingsLocationPickerTableViewCell");
  }
  else
  {
    v26 = CFSTR("PXContextualMemoriesSettingsValueTableViewCell");
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("PXContextualMemoriesSettingsValueTableViewCell"), v7);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXContextualMemoriesSettings settings](self->_settings, "settings");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v27;
    objc_msgSend(v29, "title");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "length");
    if (v31)
    {
      objc_msgSend(v29, "title");
      v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = CFSTR(" ");
    }
    objc_msgSend(v12, "valueLabel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setText:", v32);

    if (v31)
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __83__PXContextualMemoriesSettingsTableViewController_tableView_cellForRowAtIndexPath___block_invoke;
    v36[3] = &unk_1E5120E18;
    v37 = v29;
    v34 = v29;
    objc_msgSend(v12, "setResetHandler:", v36);
    objc_msgSend(v12, "setNeedsUpdateConstraints");
    objc_msgSend(v12, "updateConstraintsIfNeeded");

    v10 = CFSTR("PXContextualMemoriesSettingsValueTableViewCell");
  }

  return v12;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[PXContextualMemoriesSettings settings](self->_settings, "settings", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "headerTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;

  v6 = a3;
  v7 = a4;
  if (-[PXContextualMemoriesSettingsTableViewController _isDatePickerCellAtIndexPath:](self, "_isDatePickerCellAtIndexPath:", v7))
  {
    v8 = 200.0;
  }
  else if (-[PXContextualMemoriesSettingsTableViewController _isLocationPickerCellAtIndexPath:](self, "_isLocationPickerCellAtIndexPath:", v7))
  {
    v8 = 250.0;
  }
  else
  {
    objc_msgSend(v6, "rowHeight");
    v8 = v9;
  }

  return v8;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5;
  _BOOL4 v6;

  v5 = a4;
  if (-[PXContextualMemoriesSettingsTableViewController _isDatePickerCellAtIndexPath:](self, "_isDatePickerCellAtIndexPath:", v5))
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    v6 = !-[PXContextualMemoriesSettingsTableViewController _isLocationPickerCellAtIndexPath:](self, "_isLocationPickerCellAtIndexPath:", v5);
  }

  return v6;
}

- (void)_tableView:(id)a3 selectionDidUpdateForRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  -[PXContextualMemoriesSettingsTableViewController _indexPathForDateValue](self, "_indexPathForDateValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXContextualMemoriesSettingsTableViewController _indexPathForLocationValue](self, "_indexPathForLocationValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXContextualMemoriesSettingsTableViewController _indexPathForPeopleValue](self, "_indexPathForPeopleValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v8))
  {
    -[PXContextualMemoriesSettingsTableViewController _updateDatePickerHidden](self, "_updateDatePickerHidden");
  }
  else if (objc_msgSend(v6, "isEqual:", v8))
  {
    -[PXContextualMemoriesSettingsTableViewController _updateLocationPickerHidden](self, "_updateLocationPickerHidden");
  }
  else if (objc_msgSend(v7, "isEqual:", v8))
  {
    -[PXContextualMemoriesSettingsTableViewController _showContactsPicker](self, "_showContactsPicker");
  }

}

- (void)_updateDatePickerHidden
{
  _BOOL4 showsDatePicker;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  showsDatePicker = self->_showsDatePicker;
  -[PXContextualMemoriesSettingsTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginUpdates");

  self->_showsDatePicker ^= 1u;
  -[PXContextualMemoriesSettingsTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXContextualMemoriesSettingsTableViewController _indexPathForDatePicker](self, "_indexPathForDatePicker");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (showsDatePicker)
  {
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deleteRowsAtIndexPaths:withRowAnimation:", v8, 0);
  }
  else
  {
    v10 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "insertRowsAtIndexPaths:withRowAnimation:", v8, 0);
  }

  -[PXContextualMemoriesSettingsTableViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endUpdates");

}

- (void)_updateLocationPickerHidden
{
  _BOOL4 showsLocationPicker;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  showsLocationPicker = self->_showsLocationPicker;
  -[PXContextualMemoriesSettingsTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginUpdates");

  self->_showsLocationPicker ^= 1u;
  -[PXContextualMemoriesSettingsTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXContextualMemoriesSettingsTableViewController _indexPathForLocationPicker](self, "_indexPathForLocationPicker");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (showsLocationPicker)
  {
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deleteRowsAtIndexPaths:withRowAnimation:", v8, 0);
  }
  else
  {
    v10 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "insertRowsAtIndexPaths:withRowAnimation:", v8, 0);
  }

  -[PXContextualMemoriesSettingsTableViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endUpdates");

}

- (int64_t)_sectionForSettingOfClass:(Class)a3
{
  void *v4;
  int64_t v5;
  _QWORD v7[5];

  -[PXContextualMemoriesSettings settings](self->_settings, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__PXContextualMemoriesSettingsTableViewController__sectionForSettingOfClass___block_invoke;
  v7[3] = &__block_descriptor_40_e46_B32__0___PXContextualMemoriesSetting__8Q16_B24lu32l8;
  v7[4] = a3;
  v5 = objc_msgSend(v4, "indexOfObjectPassingTest:", v7);

  return v5;
}

- (void)_reloadRowAndRestoreSelectionIfNeededAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXContextualMemoriesSettingsTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathsForSelectedRows");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXContextualMemoriesSettingsTableViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadRowsAtIndexPaths:withRowAnimation:", v8, 5);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v13), "isEqual:", v4, (_QWORD)v15))
        {
          -[PXContextualMemoriesSettingsTableViewController tableView](self, "tableView");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "selectRowAtIndexPath:animated:scrollPosition:", v4, 0, 0);

        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

- (int64_t)_sectionForDate
{
  return -[PXContextualMemoriesSettingsTableViewController _sectionForSettingOfClass:](self, "_sectionForSettingOfClass:", objc_opt_class());
}

- (int64_t)_sectionForLocation
{
  return -[PXContextualMemoriesSettingsTableViewController _sectionForSettingOfClass:](self, "_sectionForSettingOfClass:", objc_opt_class());
}

- (int64_t)_sectionForPeople
{
  return -[PXContextualMemoriesSettingsTableViewController _sectionForSettingOfClass:](self, "_sectionForSettingOfClass:", objc_opt_class());
}

- (id)_indexPathForDateValue
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, -[PXContextualMemoriesSettingsTableViewController _sectionForDate](self, "_sectionForDate"));
}

- (id)_indexPathForLocationValue
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, -[PXContextualMemoriesSettingsTableViewController _sectionForLocation](self, "_sectionForLocation"));
}

- (id)_indexPathForPeopleValue
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, -[PXContextualMemoriesSettingsTableViewController _sectionForPeople](self, "_sectionForPeople"));
}

- (id)_indexPathForDatePicker
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 1, -[PXContextualMemoriesSettingsTableViewController _sectionForDate](self, "_sectionForDate"));
}

- (id)_indexPathForLocationPicker
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 1, -[PXContextualMemoriesSettingsTableViewController _sectionForLocation](self, "_sectionForLocation"));
}

- (BOOL)_isDatePickerCellAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  -[PXContextualMemoriesSettingsTableViewController _indexPathForDatePicker](self, "_indexPathForDatePicker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "section");
  if (v6 == objc_msgSend(v5, "section"))
  {
    v7 = objc_msgSend(v4, "row");
    v8 = v7 == objc_msgSend(v5, "row");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_isLocationPickerCellAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  -[PXContextualMemoriesSettingsTableViewController _indexPathForLocationPicker](self, "_indexPathForLocationPicker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "section");
  if (v6 == objc_msgSend(v5, "section"))
  {
    v7 = objc_msgSend(v4, "row");
    v8 = v7 == objc_msgSend(v5, "row");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_isPeopleValueCellAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  -[PXContextualMemoriesSettingsTableViewController _indexPathForPeopleValue](self, "_indexPathForPeopleValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "section");
  if (v6 == objc_msgSend(v5, "section"))
  {
    v7 = objc_msgSend(v4, "row");
    v8 = v7 == objc_msgSend(v5, "row");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- ($FF1229205817863B52D17A627F035FCE)_regionForLocationCoordinate:(SEL)a3
{
  return self;
}

- (void)_didChangeDatePicker:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "date");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PXContextualMemoriesSettings timeSetting](self->_settings, "timeSetting");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDate:", v5);

}

- (void)_handleLongPress:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  id v10;

  v10 = a3;
  if (objc_msgSend(v10, "state") == 1)
  {
    objc_msgSend(v10, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "locationInView:", v4);
    objc_msgSend(v4, "convertPoint:toCoordinateFromView:", v4);
    v6 = v5;
    v8 = v7;
    -[PXContextualMemoriesSettings locationSetting](self->_settings, "locationSetting");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCoordinate:", v6, v8);

  }
}

- (void)_didPressResetAll:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[PXContextualMemoriesSettings settings](self->_settings, "settings", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "resetToDefault");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_showContactsPicker
{
  void *v3;
  objc_class *v4;
  id v5;
  id *v6;
  void *v7;
  id v8;
  id *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  v24 = &v23;
  v25 = 0x2050000000;
  v3 = (void *)getCNContactPickerViewControllerClass_softClass;
  v26 = getCNContactPickerViewControllerClass_softClass;
  if (!getCNContactPickerViewControllerClass_softClass)
  {
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = (uint64_t)__getCNContactPickerViewControllerClass_block_invoke;
    v21 = &unk_1E51482E0;
    v22 = &v23;
    __getCNContactPickerViewControllerClass_block_invoke((uint64_t)&v18);
    v3 = (void *)v24[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v23, 8);
  v5 = objc_alloc_init(v4);
  objc_msgSend(v5, "setDelegate:", self);
  v18 = 0;
  v19 = (uint64_t)&v18;
  v20 = 0x2020000000;
  v6 = (id *)getCNContactGivenNameKeySymbolLoc_ptr;
  v21 = (void *)getCNContactGivenNameKeySymbolLoc_ptr;
  if (!getCNContactGivenNameKeySymbolLoc_ptr)
  {
    v7 = ContactsLibrary();
    v6 = (id *)dlsym(v7, "CNContactGivenNameKey");
    *(_QWORD *)(v19 + 24) = v6;
    getCNContactGivenNameKeySymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v18, 8);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getCNContactGivenNameKey(void)");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("PXContextualMemoriesSettingsTableViewController.m"), 40, CFSTR("%s"), dlerror());

    goto LABEL_12;
  }
  v8 = *v6;
  v27 = v8;
  v18 = 0;
  v19 = (uint64_t)&v18;
  v20 = 0x2020000000;
  v9 = (id *)getCNContactFamilyNameKeySymbolLoc_ptr;
  v21 = (void *)getCNContactFamilyNameKeySymbolLoc_ptr;
  if (!getCNContactFamilyNameKeySymbolLoc_ptr)
  {
    v10 = ContactsLibrary();
    v9 = (id *)dlsym(v10, "CNContactFamilyNameKey");
    *(_QWORD *)(v19 + 24) = v9;
    getCNContactFamilyNameKeySymbolLoc_ptr = (uint64_t)v9;
  }
  _Block_object_dispose(&v18, 8);
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getCNContactFamilyNameKey(void)");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("PXContextualMemoriesSettingsTableViewController.m"), 39, CFSTR("%s"), dlerror());

LABEL_12:
    __break(1u);
  }
  v28 = *v9;
  v11 = (void *)MEMORY[0x1E0C99D20];
  v12 = v28;
  objc_msgSend(v11, "arrayWithObjects:count:", &v27, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setDisplayedPropertyKeys:", v13);
  -[PXContextualMemoriesSettingsTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);

}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  PXPlacesPinAnnotationView *v9;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "userLocation");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v5, "dequeueReusableAnnotationViewWithIdentifier:", CFSTR("pin"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = v8;
      -[MKAnnotationView setAnnotation:](v9, "setAnnotation:", v6);

    }
    else
    {
      v9 = -[MKPinAnnotationView initWithAnnotation:reuseIdentifier:]([PXPlacesPinAnnotationView alloc], "initWithAnnotation:reuseIdentifier:", v6, CFSTR("pin"));
      -[MKPinAnnotationView setAnimatesDrop:](v9, "setAnimatesDrop:", 1);
      -[MKAnnotationView setCanShowCallout:](v9, "setCanShowCallout:", 1);
      -[MKAnnotationView setDraggable:](v9, "setDraggable:", 1);
    }
  }

  return v9;
}

- (void)contactPickerDidCancel:(id)a3
{
  void *v4;
  id v5;

  -[PXContextualMemoriesSettingsTableViewController _indexPathForPeopleValue](self, "_indexPathForPeopleValue", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PXContextualMemoriesSettingsTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deselectRowAtIndexPath:animated:", v5, 1);

}

- (void)contactPicker:(id)a3 didSelectContacts:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v10);
        v25 = 0;
        v26 = &v25;
        v27 = 0x2050000000;
        v12 = (void *)getCNContactFormatterClass_softClass;
        v28 = getCNContactFormatterClass_softClass;
        if (!getCNContactFormatterClass_softClass)
        {
          v24[0] = MEMORY[0x1E0C809B0];
          v24[1] = 3221225472;
          v24[2] = __getCNContactFormatterClass_block_invoke;
          v24[3] = &unk_1E51482E0;
          v24[4] = &v25;
          __getCNContactFormatterClass_block_invoke((uint64_t)v24);
          v12 = (void *)v26[3];
        }
        v13 = objc_retainAutorelease(v12);
        _Block_object_dispose(&v25, 8);
        objc_msgSend(v13, "stringFromContact:style:", v11, 0, v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "length"))
          objc_msgSend(v6, "addObject:", v14);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
    }
    while (v8);
  }

  -[PXContextualMemoriesSettings peopleSetting](self->_settings, "peopleSetting");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPeopleNames:", v6);

  -[PXContextualMemoriesSettingsTableViewController _indexPathForPeopleValue](self, "_indexPathForPeopleValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXContextualMemoriesSettingsTableViewController tableView](self, "tableView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "deselectRowAtIndexPath:animated:", v16, 1);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  objc_super v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  PXContextualMemoriesSettingsTableViewController *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  PXContextualMemoriesSettingsTableViewController *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  PXContextualMemoriesSettingsTableViewController *v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a6 == &kPXContextualMemoriesSettingsKVOContextKeyDate)
  {
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __98__PXContextualMemoriesSettingsTableViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v27 = &unk_1E5149198;
    v28 = self;
LABEL_9:
    px_dispatch_on_main_queue();
    goto LABEL_10;
  }
  if (a6 == &kPXContextualMemoriesSettingsKVOContextKeyCoordinate
    || a6 == &kPXContextualMemoriesSettingsKVOContextKeyPlacemark)
  {
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __98__PXContextualMemoriesSettingsTableViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
    v22 = &unk_1E5149198;
    v23 = self;
    goto LABEL_9;
  }
  if (a6 == &kPXContextualMemoriesSettingsKVOContextKeyPeople)
  {
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __98__PXContextualMemoriesSettingsTableViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_3;
    v17 = &unk_1E5149198;
    v18 = self;
    goto LABEL_9;
  }
  v13.receiver = self;
  v13.super_class = (Class)PXContextualMemoriesSettingsTableViewController;
  -[PXContextualMemoriesSettingsTableViewController observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
LABEL_10:

}

- (PXContextualMemoriesSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
  objc_storeStrong((id *)&self->_settings, a3);
}

- (BOOL)showsDatePicker
{
  return self->_showsDatePicker;
}

- (void)setShowsDatePicker:(BOOL)a3
{
  self->_showsDatePicker = a3;
}

- (BOOL)showsLocationPicker
{
  return self->_showsLocationPicker;
}

- (void)setShowsLocationPicker:(BOOL)a3
{
  self->_showsLocationPicker = a3;
}

- (UIView)progressIndicatorView
{
  return self->_progressIndicatorView;
}

- (void)setProgressIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_progressIndicatorView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressIndicatorView, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

void __98__PXContextualMemoriesSettingsTableViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (objc_msgSend(*(id *)(a1 + 32), "showsDatePicker"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_indexPathForDatePicker");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cellForRowAtIndexPath:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "datePicker");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "timeSetting");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDate:animated:", v7, 1);

  }
  objc_msgSend(*(id *)(a1 + 32), "_indexPathForDateValue");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_reloadRowAndRestoreSelectionIfNeededAtIndexPath:", v8);

}

void __98__PXContextualMemoriesSettingsTableViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_indexPathForLocationValue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_reloadRowAndRestoreSelectionIfNeededAtIndexPath:", v2);

}

void __98__PXContextualMemoriesSettingsTableViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_indexPathForPeopleValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadRowsAtIndexPaths:withRowAnimation:", v4, 100);

}

uint64_t __77__PXContextualMemoriesSettingsTableViewController__sectionForSettingOfClass___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  char isKindOfClass;

  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    *a4 = 1;
  return isKindOfClass & 1;
}

uint64_t __83__PXContextualMemoriesSettingsTableViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resetToDefault");
}

void __66__PXContextualMemoriesSettingsTableViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1024), a2);
  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "progressIndicatorView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "setProgressIndicatorView:", 0);
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadData");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "timeSetting");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("date"), 0, &kPXContextualMemoriesSettingsKVOContextKeyDate);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "locationSetting");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("coordinate"), 0, &kPXContextualMemoriesSettingsKVOContextKeyCoordinate);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "locationSetting");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("placemark"), 0, &kPXContextualMemoriesSettingsKVOContextKeyPlacemark);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "peopleSetting");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("peopleNames"), 0, &kPXContextualMemoriesSettingsKVOContextKeyPeople);

}

+ (id)title
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Contextual Settings"), &stru_1E5149688, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
