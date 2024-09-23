@implementation WFLocationPickerViewController

- (WFLocationPickerViewController)initWithPickerType:(unint64_t)a3 value:(id)a4
{
  id v7;
  WFLocationPickerViewController *v8;
  WFLocationPickerViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  WFLocationPickerViewController *v17;
  objc_super v19;

  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)WFLocationPickerViewController;
  v8 = -[WFLocationPickerViewController init](&v19, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_pickerType = a3;
    objc_storeStrong((id *)&v8->_value, a4);
    objc_msgSend(v7, "placemark");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v7, "placemark");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      MKMapItemWithPlacemark(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFLocationPickerViewController updateValueWithMapItem:](v9, "updateValueWithMapItem:", v12);

    }
    -[WFLocationPickerViewController updateRecentsWithSearchText:](v9, "updateRecentsWithSearchText:", 0);
    WFLocalizedString(CFSTR("Choose Location"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLocationPickerViewController setTitle:](v9, "setTitle:", v13);

    -[WFLocationPickerViewController navigationItem](v9, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, v9, sel_cancel_);
    objc_msgSend(v14, "setLeftBarButtonItem:", v15);

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, v9, sel_done_);
    objc_msgSend(v14, "setRightBarButtonItem:", v16);

    v17 = v9;
  }

  return v9;
}

- (void)loadView
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UISearchBar *v12;
  UISearchBar *searchBar;
  void *v14;
  UIView *v15;
  UIView *dividerView;
  void *v17;
  UITableView *v18;
  UITableView *tableView;
  void *v20;
  UITableView *v21;
  void *v22;
  id v23;

  v3 = objc_alloc(MEMORY[0x24BEBDB00]);
  v4 = *MEMORY[0x24BDBF090];
  v5 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v23 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], v5, v6, v7);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setBackgroundColor:", v8);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD928]), "initWithSearchResultsController:", 0);
  objc_msgSend(v9, "setObscuresBackgroundDuringPresentation:", 0);
  objc_msgSend(v9, "setHidesNavigationBarDuringPresentation:", 0);
  objc_msgSend(v9, "setAutomaticallyShowsCancelButton:", 0);
  -[WFLocationPickerViewController navigationItem](self, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSearchController:", v9);

  -[WFLocationPickerViewController navigationItem](self, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHidesSearchBarWhenScrolling:", 0);

  objc_msgSend(v9, "searchBar");
  v12 = (UISearchBar *)objc_claimAutoreleasedReturnValue();
  searchBar = self->_searchBar;
  self->_searchBar = v12;

  -[UISearchBar setTranslatesAutoresizingMaskIntoConstraints:](self->_searchBar, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UISearchBar setAutocorrectionType:](self->_searchBar, "setAutocorrectionType:", 1);
  WFLocalizedString(CFSTR("Search or Enter Address"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISearchBar setPlaceholder:](self->_searchBar, "setPlaceholder:", v14);

  -[UISearchBar setTextContentType:](self->_searchBar, "setTextContentType:", *MEMORY[0x24BEBE7B0]);
  -[UISearchBar setDelegate:](self->_searchBar, "setDelegate:", self);
  v15 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", v4, v5, v6, v7);
  dividerView = self->_dividerView;
  self->_dividerView = v15;

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.8, 1.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_dividerView, "setBackgroundColor:", v17);

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_dividerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v18 = (UITableView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F0]), "initWithFrame:style:", 0, v4, v5, v6, v7);
  tableView = self->_tableView;
  self->_tableView = v18;

  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  -[UITableView setKeyboardDismissMode:](self->_tableView, "setKeyboardDismissMode:", 1);
  -[UITableView setRowHeight:](self->_tableView, "setRowHeight:", *MEMORY[0x24BEBE770]);
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_scaledValueForValue:", 44.0);
  -[UITableView setEstimatedRowHeight:](self->_tableView, "setEstimatedRowHeight:");

  -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v21 = self->_tableView;
  -[UITableView indexPathForSelectedRow](v21, "indexPathForSelectedRow");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView deselectRowAtIndexPath:animated:](v21, "deselectRowAtIndexPath:animated:", v22, 0);

  -[WFLocationPickerViewController reloadData](self, "reloadData");
  objc_msgSend(v23, "addSubview:", self->_tableView);
  -[WFLocationPickerViewController setView:](self, "setView:", v23);
  -[WFLocationPickerViewController updateUI](self, "updateUI");

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFLocationPickerViewController;
  -[WFLocationPickerViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[WFLocationPickerViewController checkLocationAuthorization](self, "checkLocationAuthorization");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFLocationPickerViewController;
  -[WFLocationPickerViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[WFLocationPickerViewController locationManager](self, "locationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFLocationPickerViewController locationManager](self, "locationManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startUpdatingLocation");

  }
  -[WFLocationPickerViewController setupMap](self, "setupMap");
}

- (void)viewWillDisappear:(BOOL)a3
{
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
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)WFLocationPickerViewController;
  -[WFLocationPickerViewController viewWillDisappear:](&v15, sel_viewWillDisappear_, a3);
  -[WFLocationPickerViewController mapView](self, "mapView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLocationPickerViewController mapView](self, "mapView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "annotations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAnnotations:", v6);

  -[WFLocationPickerViewController mapView](self, "mapView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLocationPickerViewController mapView](self, "mapView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "overlays");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeOverlays:", v9);

  -[WFLocationPickerViewController mapView](self, "mapView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", 0);

  -[WFLocationPickerViewController mapView](self, "mapView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setShowsUserLocation:", 0);

  -[WFLocationPickerViewController searchBar](self, "searchBar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resignFirstResponder");

  -[WFLocationPickerViewController navigationItem](self, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "searchController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", 0);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFLocationPickerViewController;
  -[WFLocationPickerViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  -[WFLocationPickerViewController locationManager](self, "locationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFLocationPickerViewController locationManager](self, "locationManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopUpdatingLocation");

  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFLocationPickerViewController;
  -[WFLocationPickerViewController viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
  -[WFLocationPickerViewController setupMap](self, "setupMap");
  -[WFLocationPickerViewController updateMapHeight](self, "updateMapHeight");
  -[WFLocationPickerViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrollToNearestSelectedRowAtScrollPosition:animated:", 0, 0);

}

- (void)updateViewConstraints
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
  void *v45;
  double v46;
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
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  char v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  objc_super v82;

  v82.receiver = self;
  v82.super_class = (Class)WFLocationPickerViewController;
  -[WFLocationPickerViewController updateViewConstraints](&v82, sel_updateViewConstraints);
  v3 = (void *)objc_opt_new();
  -[WFLocationPickerViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLocationPickerViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeAreaLayoutGuide");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  -[WFLocationPickerViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLocationPickerViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "safeAreaLayoutGuide");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v15);

  -[WFLocationPickerViewController tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLocationPickerViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "safeAreaLayoutGuide");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v21);

  -[WFLocationPickerViewController dividerView](self, "dividerView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "superview");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFLocationPickerViewController tableView](self, "tableView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    -[WFLocationPickerViewController dividerView](self, "dividerView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "topAnchor");
  }
  else
  {
    -[WFLocationPickerViewController view](self, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "bottomAnchor");
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v28);

  -[WFLocationPickerViewController dividerView](self, "dividerView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "superview");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[WFLocationPickerViewController dividerView](self, "dividerView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLocationPickerViewController view](self, "view");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "safeAreaLayoutGuide");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "leadingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v36);

    -[WFLocationPickerViewController dividerView](self, "dividerView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "trailingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLocationPickerViewController view](self, "view");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "safeAreaLayoutGuide");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "trailingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v42);

    -[WFLocationPickerViewController dividerView](self, "dividerView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "heightAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "scale");
    objc_msgSend(v44, "constraintEqualToConstant:", 1.0 / v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v47);

  }
  -[WFLocationPickerViewController mapView](self, "mapView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "superview");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    -[WFLocationPickerViewController mapView](self, "mapView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "topAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLocationPickerViewController dividerView](self, "dividerView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "bottomAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v54);

    -[WFLocationPickerViewController mapView](self, "mapView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "leadingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLocationPickerViewController view](self, "view");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "safeAreaLayoutGuide");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "leadingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:", v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v60);

    -[WFLocationPickerViewController mapView](self, "mapView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "trailingAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLocationPickerViewController view](self, "view");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "safeAreaLayoutGuide");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "trailingAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:", v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v66);

    -[WFLocationPickerViewController mapView](self, "mapView");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "bottomAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLocationPickerViewController view](self, "view");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "bottomAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:", v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v71);

    -[WFLocationPickerViewController mapView](self, "mapView");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "heightAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLocationPickerViewController mapHeight](self, "mapHeight");
    objc_msgSend(v73, "constraintEqualToConstant:");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLocationPickerViewController setMapHeightConstraint:](self, "setMapHeightConstraint:", v74);

    -[WFLocationPickerViewController mapHeightConstraint](self, "mapHeightConstraint");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v75);

  }
  -[WFLocationPickerViewController constraints](self, "constraints");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend(v3, "isEqual:", v76);

  if ((v77 & 1) == 0)
  {
    v78 = (void *)MEMORY[0x24BDD1628];
    -[WFLocationPickerViewController constraints](self, "constraints");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "deactivateConstraints:", v79);

    -[WFLocationPickerViewController setConstraints:](self, "setConstraints:", v3);
    v80 = (void *)MEMORY[0x24BDD1628];
    -[WFLocationPickerViewController constraints](self, "constraints");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "activateConstraints:", v81);

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WFLocationPickerViewController;
  v4 = a3;
  -[WFLocationPickerViewController traitCollectionDidChange:](&v12, sel_traitCollectionDidChange_, v4);
  -[WFLocationPickerViewController traitCollection](self, "traitCollection", v12.receiver, v12.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
  {
    -[WFLocationPickerViewController traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userInterfaceStyle");
    if (v9 == 1)
      v10 = 2;
    else
      v10 = v9 == 2;
    -[WFLocationPickerViewController searchBar](self, "searchBar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setKeyboardAppearance:", v10);

  }
}

- (BOOL)showsMapView
{
  return -[WFLocationPickerViewController pickerType](self, "pickerType") == 1;
}

- (WFLocationTriggerEditorMapDragRadiusView)dragView
{
  WFLocationTriggerEditorMapDragRadiusView *v3;
  WFLocationTriggerEditorMapDragRadiusView *v4;
  WFLocationTriggerEditorMapDragRadiusView *dragView;
  void *v6;

  if (-[WFLocationPickerViewController showsMapView](self, "showsMapView") && !self->_dragView)
  {
    v3 = [WFLocationTriggerEditorMapDragRadiusView alloc];
    v4 = -[WFLocationTriggerEditorMapDragRadiusView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    dragView = self->_dragView;
    self->_dragView = v4;

    -[WFLocationTriggerEditorMapDragRadiusView setAutoresizingMask:](self->_dragView, "setAutoresizingMask:", 18);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLocationTriggerEditorMapDragRadiusView setBackgroundColor:](self->_dragView, "setBackgroundColor:", v6);

    -[WFLocationTriggerEditorMapDragRadiusView setMapView:](self->_dragView, "setMapView:", self->_mapView);
    -[WFLocationTriggerEditorMapDragRadiusView setDelegate:](self->_dragView, "setDelegate:", self);
    -[WFLocationTriggerEditorMapDragRadiusView setProximity:](self->_dragView, "setProximity:", -[WFLocationPickerViewController proximityType](self, "proximityType"));
  }
  return self->_dragView;
}

- (MKMapView)mapView
{
  MKMapView *v3;
  MKMapView *mapView;
  void *v5;

  if (-[WFLocationPickerViewController showsMapView](self, "showsMapView") && !self->_mapView)
  {
    v3 = (MKMapView *)objc_alloc_init(MEMORY[0x24BDDB130]);
    mapView = self->_mapView;
    self->_mapView = v3;

    -[MKMapView setTranslatesAutoresizingMaskIntoConstraints:](self->_mapView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MKMapView setDelegate:](self->_mapView, "setDelegate:", self);
    -[MKMapView setPitchEnabled:](self->_mapView, "setPitchEnabled:", 0);
    -[MKMapView setRotateEnabled:](self->_mapView, "setRotateEnabled:", 0);
    -[MKMapView setShowsUserLocation:](self->_mapView, "setShowsUserLocation:", 1);
    -[WFLocationPickerViewController dragView](self, "dragView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMapView:", self->_mapView);
    -[MKMapView addSubview:](self->_mapView, "addSubview:", v5);

  }
  return self->_mapView;
}

- (void)updateUI
{
  id v3;

  -[WFLocationPickerViewController value](self, "value");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[WFLocationPickerViewController updateUIWithValue:](self, "updateUIWithValue:", v3);

}

- (void)updateUIWithValue:(id)a3
{
  _BOOL4 v4;
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

  v15 = a3;
  -[WFLocationPickerViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  v4 = -[WFLocationPickerViewController hasLocation](self, "hasLocation");
  objc_msgSend(v15, "defaultSearchText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLocationPickerViewController searchBar](self, "searchBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  if (v4 && -[WFLocationPickerViewController showsMapView](self, "showsMapView"))
  {
    -[WFLocationPickerViewController searchBar](self, "searchBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resignFirstResponder");

    -[WFLocationPickerViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLocationPickerViewController mapView](self, "mapView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v9);

    -[WFLocationPickerViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLocationPickerViewController dividerView](self, "dividerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v11);

  }
  else
  {
    -[WFLocationPickerViewController mapView](self, "mapView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeFromSuperview");

    -[WFLocationPickerViewController dividerView](self, "dividerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeFromSuperview");
  }

  if (-[WFLocationPickerViewController allowsPickingCurrentLocation](self, "allowsPickingCurrentLocation")
    && objc_msgSend(v15, "isCurrentLocation"))
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", -[WFLocationPickerViewController currentLocationRowIndex](self, "currentLocationRowIndex"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLocationPickerViewController setSelectedIndexPath:](self, "setSelectedIndexPath:", v13);

  }
  -[WFLocationPickerViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setNeedsUpdateConstraints");

}

- (void)updateRecentsWithSearchText:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[2];
  uint64_t v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v4 = (void *)MEMORY[0x24BE27DF8];
    v5 = *MEMORY[0x24BE27DC0];
    v22 = *MEMORY[0x24BE27DA0];
    v6 = (void *)MEMORY[0x24BDBCE30];
    v7 = a3;
    objc_msgSend(v6, "arrayWithObjects:count:", &v22, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "predicateForKey:inCollection:", v5, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v9;
    v10 = (void *)MEMORY[0x24BE27DF8];
    objc_msgSend(MEMORY[0x24BE27DF8], "predicateForKey:matchingText:comparison:", *MEMORY[0x24BE27DB8], v7, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v11;
    objc_msgSend(MEMORY[0x24BE27DF8], "predicateForKey:matchingText:comparison:", *MEMORY[0x24BE27DB0], v7, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v21[1] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "predicateSatisfyingAnySubpredicate:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "predicateSatisfyingAllSubpredicates:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }
  v17 = objc_alloc_init(MEMORY[0x24BE27E00]);
  objc_msgSend(v17, "setSearchPredicate:", v16);
  objc_msgSend(v17, "setDomains:", &unk_24EE46B10);
  objc_msgSend(MEMORY[0x24BE27E00], "frecencyComparator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setComparator:", v18);

  objc_msgSend(MEMORY[0x24BE27DF0], "defaultInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __62__WFLocationPickerViewController_updateRecentsWithSearchText___block_invoke;
  v20[3] = &unk_24EE259C0;
  v20[4] = self;
  objc_msgSend(v19, "performRecentsSearch:queue:completion:", v17, MEMORY[0x24BDAC9B8], v20);

}

- (BOOL)shouldShowCurrentLocationItem
{
  _BOOL4 v3;

  v3 = -[WFLocationPickerViewController allowsPickingCurrentLocation](self, "allowsPickingCurrentLocation");
  if (v3)
    LOBYTE(v3) = -[WFLocationPickerViewController hasSufficientLocationAuthorization](self, "hasSufficientLocationAuthorization");
  return v3;
}

- (void)setAllowsPickingCurrentLocation:(BOOL)a3
{
  CLLocationManager *v4;
  CLLocationManager *locationManager;

  if (self->_allowsPickingCurrentLocation != a3)
  {
    self->_allowsPickingCurrentLocation = a3;
    if (!self->_locationManager)
    {
      WFCLLocationManagerWithOptions();
      v4 = (CLLocationManager *)objc_claimAutoreleasedReturnValue();
      locationManager = self->_locationManager;
      self->_locationManager = v4;

      -[WFLocationPickerViewController checkLocationAuthorization](self, "checkLocationAuthorization");
    }
    -[WFLocationPickerViewController reloadData](self, "reloadData");
  }
}

- (void)setResolvesCurrentLocationToPlacemark:(BOOL)a3
{
  CLLocationManager *v4;
  CLLocationManager *locationManager;
  CLLocationManager *v6;

  if (self->_resolvesCurrentLocationToPlacemark != a3)
  {
    self->_resolvesCurrentLocationToPlacemark = a3;
    if (a3)
    {
      WFCLLocationManagerWithOptions();
      v4 = (CLLocationManager *)objc_claimAutoreleasedReturnValue();
      locationManager = self->_locationManager;
      self->_locationManager = v4;

      -[CLLocationManager startUpdatingLocation](self->_locationManager, "startUpdatingLocation");
    }
    else
    {
      -[CLLocationManager stopUpdatingLocation](self->_locationManager, "stopUpdatingLocation");
      v6 = self->_locationManager;
      self->_locationManager = 0;

    }
    -[WFLocationPickerViewController reloadData](self, "reloadData");
  }
}

- (int64_t)currentLocationRowIndex
{
  if (-[WFLocationPickerViewController shouldShowCurrentLocationItem](self, "shouldShowCurrentLocationItem"))
    return 0;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)firstRecentRowIndex
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  int64_t v6;

  -[WFLocationPickerViewController recents](self, "recents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4)
  {
    v6 = -[WFLocationPickerViewController currentLocationRowIndex](self, "currentLocationRowIndex");
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
      return 0;
    else
      return v6 + 1;
  }
  return v5;
}

- (int64_t)lastRecentRowIndex
{
  int64_t v3;
  int64_t v4;
  int64_t v5;
  void *v6;

  v3 = -[WFLocationPickerViewController firstRecentRowIndex](self, "firstRecentRowIndex");
  v4 = 0x7FFFFFFFFFFFFFFFLL;
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v3;
    -[WFLocationPickerViewController recents](self, "recents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 + objc_msgSend(v6, "count") - 1;

  }
  return v4;
}

- (int64_t)firstLocalSearchResultRowIndex
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  int64_t v6;

  -[WFLocationPickerViewController localSearchResults](self, "localSearchResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4)
  {
    v6 = -[WFLocationPickerViewController lastRecentRowIndex](self, "lastRecentRowIndex");
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
      v6 = -[WFLocationPickerViewController currentLocationRowIndex](self, "currentLocationRowIndex");
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
      return 0;
    else
      return v6 + 1;
  }
  return v5;
}

- (void)reloadData
{
  id v2;

  -[WFLocationPickerViewController tableView](self, "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

- (void)setupMap
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[WFLocationPickerViewController circularRegion](self, "circularRegion");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[WFLocationPickerViewController mapView](self, "mapView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[WFLocationPickerViewController circularRegion](self, "circularRegion");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "center");
      -[WFLocationPickerViewController displayLocationCoordinate:](self, "displayLocationCoordinate:");

    }
  }
}

- (double)mapHeight
{
  return 300.0;
}

- (void)updateMapHeight
{
  void *v3;
  double v4;
  double v5;
  id v6;

  -[WFLocationPickerViewController mapHeightConstraint](self, "mapHeightConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFLocationPickerViewController mapHeight](self, "mapHeight");
    v5 = v4;
    -[WFLocationPickerViewController mapHeightConstraint](self, "mapHeightConstraint");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setConstant:", v5);

  }
}

- (BOOL)hasLocation
{
  void *v2;
  BOOL v3;

  -[WFLocationPickerViewController value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (unint64_t)proximityType
{
  if (-[WFLocationPickerViewController regionCondition](self, "regionCondition"))
    return 2;
  else
    return 1;
}

- (void)displayLocationCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude;
  double latitude;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  id v13;

  longitude = a3.longitude;
  latitude = a3.latitude;
  -[WFLocationPickerViewController mapView](self, "mapView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "annotations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeAnnotations:", v6);

  objc_msgSend(v13, "overlays");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeOverlays:", v7);

  -[WFLocationPickerViewController circularRegion](self, "circularRegion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "radius");
  v10 = v9;

  if (v10 < 100.0)
    v10 = 100.0;
  -[WFLocationPickerViewController showMapRegionForCoordinate:radius:](self, "showMapRegionForCoordinate:radius:", latitude, longitude, v10);
  v11 = objc_alloc_init(MEMORY[0x24BDDB168]);
  objc_msgSend(v11, "setCoordinate:", latitude, longitude);
  objc_msgSend(v13, "addAnnotation:", v11);
  -[WFLocationPickerViewController overlayWithCenterCoordinate:radius:](self, "overlayWithCenterCoordinate:radius:", latitude, longitude, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v13, "addOverlay:", v12);
  objc_msgSend(v13, "selectAnnotation:animated:", v11, 0);

}

- (void)getMapItemFromRecentContact:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  double v24;
  double v25;
  double v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("mapKitHandle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_class();
  WFEnforceClass(v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)MEMORY[0x24BDDB0F0];
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __80__WFLocationPickerViewController_getMapItemFromRecentContact_completionHandler___block_invoke;
    v31[3] = &unk_24EE25A10;
    v32 = v7;
    v13 = v7;
    objc_msgSend(v12, "_mapItemFromHandle:completionHandler:", v11, v31);
    v14 = v32;
  }
  else
  {
    objc_msgSend(v6, "address");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE19618], "streetAddressesInString:error:", v13, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKey:", CFSTR("latitude"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_class();
    WFEnforceClass(v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKey:", CFSTR("longitude"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_opt_class();
    WFEnforceClass(v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0;
    if (v18 && v21)
    {
      v23 = objc_alloc(MEMORY[0x24BDBFA80]);
      objc_msgSend(v18, "doubleValue");
      v25 = v24;
      objc_msgSend(v21, "doubleValue");
      v22 = (void *)objc_msgSend(v23, "initWithLatitude:longitude:", v25, v26);
    }
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __80__WFLocationPickerViewController_getMapItemFromRecentContact_completionHandler___block_invoke_3;
    v28[3] = &unk_24EE25A38;
    v29 = v6;
    v30 = v7;
    v27 = v7;
    -[WFLocationPickerViewController getPlacemarkFromLocation:streetAddress:completionHandler:](self, "getPlacemarkFromLocation:streetAddress:completionHandler:", v22, v14, v28);

  }
}

- (void)getPlacemarkFromLocation:(id)a3 streetAddress:(id)a4 completionHandler:(id)a5
{
  unint64_t v7;
  unint64_t v8;
  id v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  id v12;
  void *v13;
  unint64_t v14;
  _QWORD v15[4];
  void (**v16)(_QWORD, _QWORD, _QWORD);

  v7 = (unint64_t)a3;
  v8 = (unint64_t)a4;
  v9 = a5;
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))v9;
  if (v7 && v8)
  {
    objc_msgSend((id)v8, "postalAddress");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc(MEMORY[0x24BDDB160]);
    objc_msgSend((id)v7, "coordinate");
    v13 = (void *)objc_msgSend(v12, "initWithCoordinate:postalAddress:", v11);
    ((void (**)(_QWORD, void *, _QWORD))v10)[2](v10, v13, 0);

  }
  else
  {
    if (!(v7 | v8))
    {
      (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
      goto LABEL_11;
    }
    if (v7)
      v14 = v7;
    else
      v14 = v8;
    objc_msgSend(MEMORY[0x24BE19450], "itemWithObject:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __91__WFLocationPickerViewController_getPlacemarkFromLocation_streetAddress_completionHandler___block_invoke;
    v15[3] = &unk_24EE25A60;
    v16 = v10;
    objc_msgSend(v11, "getObjectRepresentation:forClass:", v15, objc_opt_class());

  }
LABEL_11:

}

- (id)locationFromRecentContact:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  CLLocationDegrees v6;
  void *v7;
  double v8;
  CLLocationDegrees v9;
  CLLocationCoordinate2D v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;

  objc_msgSend(a3, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("latitude"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  objc_msgSend(v3, "objectForKey:", CFSTR("longitude"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  v10 = CLLocationCoordinate2DMake(v6, v9);
  objc_msgSend(v3, "objectForKey:", CFSTR("hAccuracy"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  objc_msgSend(v3, "objectForKey:", CFSTR("vAccuracy"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = v15;

  objc_msgSend(v3, "objectForKey:", CFSTR("referenceFrame"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "integerValue");

  v19 = objc_alloc(MEMORY[0x24BDBFA80]);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:referenceFrame:", v20, v18, v10.latitude, v10.longitude, 0.0, v13, v16);

  return v21;
}

- (void)showMapRegionForCoordinate:(CLLocationCoordinate2D)a3 radius:(double)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;

  v5 = MEMORY[0x22769EDC4](self, a2, (__n128)a3, *(__n128 *)&a3.longitude, a4 * 3.5, a4 * 3.5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[WFLocationPickerViewController mapView](self, "mapView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "regionThatFits:", v5, v7, v9, v11);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  if (v16 >= -180.0
    && v16 <= 180.0
    && v14 >= -90.0
    && v14 <= 90.0
    && v18 >= 0.0
    && v18 <= 180.0
    && v20 >= 0.0
    && v20 <= 360.0)
  {
    -[WFLocationPickerViewController mapView](self, "mapView");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setRegion:animated:", 0, v14, v16, v18, v20);

  }
}

- (void)setRegionCondition:(unint64_t)a3
{
  unint64_t v4;
  id v5;

  if (self->_regionCondition != a3)
  {
    self->_regionCondition = a3;
    v4 = -[WFLocationPickerViewController proximityType](self, "proximityType");
    -[WFLocationPickerViewController dragView](self, "dragView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setProximity:", v4);

  }
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
  -[WFLocationPickerViewController updateUI](self, "updateUI");
}

- (id)circularRegion
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[WFLocationPickerViewController value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "placemark");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "region");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (void)cancel:(id)a3
{
  id v4;

  -[WFLocationPickerViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationPickerDidCancel:", self);

}

- (void)done:(id)a3
{
  void *v4;
  id v5;

  -[WFLocationPickerViewController delegate](self, "delegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[WFLocationPickerViewController value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationPicker:didFinishWithValue:", self, v4);

}

- (void)checkLocationAuthorization
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[WFLocationPickerViewController setCurrentAppLocationAuthorizationStatus:](self, "setCurrentAppLocationAuthorizationStatus:", WFCLLocationManagerAuthorizationStatusForWorkflowEnvironment());
  getWFTriggersLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v6 = 136315394;
    v7 = "-[WFLocationPickerViewController checkLocationAuthorization]";
    v8 = 1024;
    v9 = -[WFLocationPickerViewController currentAppLocationAuthorizationStatus](self, "currentAppLocationAuthorizationStatus");
    _os_log_impl(&dword_226666000, v3, OS_LOG_TYPE_DEBUG, "%s Current CLAuthorizationStatus: %d", (uint8_t *)&v6, 0x12u);
  }

  if (!-[WFLocationPickerViewController currentAppLocationAuthorizationStatus](self, "currentAppLocationAuthorizationStatus"))
  {
    getWFTriggersLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v6 = 136315138;
      v7 = "-[WFLocationPickerViewController checkLocationAuthorization]";
      _os_log_impl(&dword_226666000, v4, OS_LOG_TYPE_DEBUG, "%s Rrequesting WhenInUse…", (uint8_t *)&v6, 0xCu);
    }

    -[WFLocationPickerViewController locationManager](self, "locationManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestWhenInUseAuthorization");

  }
}

- (BOOL)hasSufficientLocationAuthorization
{
  return -[WFLocationPickerViewController currentAppLocationAuthorizationStatus](self, "currentAppLocationAuthorizationStatus")- 3 < 2;
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  getWFTriggersLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 136315394;
    v7 = "-[WFLocationPickerViewController locationManagerDidChangeAuthorization:]";
    v8 = 1024;
    v9 = objc_msgSend(v4, "authorizationStatus");
    _os_log_impl(&dword_226666000, v5, OS_LOG_TYPE_DEBUG, "%s locationManager:didChangeAuthorizationStatus: got status: %d", (uint8_t *)&v6, 0x12u);
  }

  -[WFLocationPickerViewController setCurrentAppLocationAuthorizationStatus:](self, "setCurrentAppLocationAuthorizationStatus:", objc_msgSend(v4, "authorizationStatus"));
  -[WFLocationPickerViewController reloadData](self, "reloadData");

}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a4;
  -[WFLocationPickerViewController currentLocation](self, "currentLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(v9, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLocationPickerViewController setCurrentLocation:](self, "setCurrentLocation:", v8);

  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int64_t v10;

  v5 = -[WFLocationPickerViewController currentLocationRowIndex](self, "currentLocationRowIndex", a3, a4);
  -[WFLocationPickerViewController recents](self, "recents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    v8 = v7;
  else
    v8 = v7 + 1;
  -[WFLocationPickerViewController localSearchResults](self, "localSearchResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 + objc_msgSend(v9, "count");

  return v10;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5;
  id v6;

  v5 = a4;
  objc_msgSend(v5, "setOpaque:", 0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("locationCell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 3, CFSTR("locationCell"));
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v8);

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1E8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "detailTextLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFont:", v10);

  v12 = -[WFLocationPickerViewController firstRecentRowIndex](self, "firstRecentRowIndex");
  v13 = -[WFLocationPickerViewController firstLocalSearchResultRowIndex](self, "firstLocalSearchResultRowIndex");
  v14 = objc_msgSend(v6, "row");
  if (v14 == -[WFLocationPickerViewController currentLocationRowIndex](self, "currentLocationRowIndex"))
  {
    WFLocalizedString(CFSTR("Current Location"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("location.fill"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    goto LABEL_14;
  }
  if (v12 == 0x7FFFFFFFFFFFFFFFLL
    || objc_msgSend(v6, "row") < v12
    || (v19 = objc_msgSend(v6, "row"),
        v19 > -[WFLocationPickerViewController lastRecentRowIndex](self, "lastRecentRowIndex")))
  {
    if (v13 == 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v6, "row") < v13)
    {
      v18 = 0;
      v16 = 0;
      v17 = 0;
      v15 = 0;
      goto LABEL_14;
    }
    v20 = objc_msgSend(v6, "row") - v13;
    -[WFLocationPickerViewController localSearchResults](self, "localSearchResults");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectAtIndexedSubscript:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_shortAddress");
    v23 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = objc_msgSend(v6, "row") - v12;
    -[WFLocationPickerViewController recents](self, "recents");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectAtIndexedSubscript:", v24);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "displayName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "address");
    v23 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v23;
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("mappin.and.ellipse"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  objc_msgSend(v7, "textLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setText:", v15);

  objc_msgSend(v7, "detailTextLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setText:", v18);

  objc_msgSend(v7, "imageView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setImage:", v16);

  objc_msgSend(v7, "imageView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setTintColor:", v17);

  -[WFLocationPickerViewController selectedIndexPath](self, "selectedIndexPath");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqual:", v30))
  {
    if (-[WFLocationPickerViewController hasLocation](self, "hasLocation"))
      v31 = 3;
    else
      v31 = 0;
  }
  else
  {
    v31 = 0;
  }

  objc_msgSend(v7, "setAccessoryType:", v31);
  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  int64_t v15;
  int64_t v16;
  _BOOL4 v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[5];
  _QWORD v26[5];

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);
  -[WFLocationPickerViewController selectedIndexPath](self, "selectedIndexPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellForRowAtIndexPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessoryType:", 0);

  objc_msgSend(v7, "cellForRowAtIndexPath:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setAccessoryType:", 3);
  -[WFLocationPickerViewController setSelectedIndexPath:](self, "setSelectedIndexPath:", v6);
  v11 = -[WFLocationPickerViewController firstRecentRowIndex](self, "firstRecentRowIndex");
  v12 = -[WFLocationPickerViewController firstLocalSearchResultRowIndex](self, "firstLocalSearchResultRowIndex");
  v13 = objc_msgSend(v6, "row");

  v14 = -[WFLocationPickerViewController currentLocationRowIndex](self, "currentLocationRowIndex");
  v15 = v14;
  if (v11 != 0x7FFFFFFFFFFFFFFFLL && v13 >= v11)
  {
    v16 = -[WFLocationPickerViewController lastRecentRowIndex](self, "lastRecentRowIndex");
    v18 = v12 != 0x7FFFFFFFFFFFFFFFLL && v13 >= v12;
    if (v13 != v15)
    {
      if (v13 > v16)
      {
        if (!v18)
          return;
        goto LABEL_18;
      }
      -[WFLocationPickerViewController recents](self, "recents");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectAtIndex:", v13 - v11);
      v19 = (id)objc_claimAutoreleasedReturnValue();

      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __68__WFLocationPickerViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
      v25[3] = &unk_24EE25A88;
      v25[4] = self;
      -[WFLocationPickerViewController getMapItemFromRecentContact:completionHandler:](self, "getMapItemFromRecentContact:completionHandler:", v19, v25);
LABEL_22:

      return;
    }
LABEL_14:
    if (!-[WFLocationPickerViewController resolvesCurrentLocationToPlacemark](self, "resolvesCurrentLocationToPlacemark"))
    {
      v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEC3E90]), "initWithCurrentLocation");
      -[WFLocationPickerViewController setValue:](self, "setValue:", v24);
      goto LABEL_20;
    }
    v19 = objc_alloc_init(MEMORY[0x24BDBFA68]);
    -[WFLocationPickerViewController currentLocation](self, "currentLocation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __68__WFLocationPickerViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    v26[3] = &unk_24EE259C0;
    v26[4] = self;
    objc_msgSend(v19, "reverseGeocodeLocation:completionHandler:", v20, v26);

    goto LABEL_22;
  }
  if (v13 == v14)
    goto LABEL_14;
  if (v12 != 0x7FFFFFFFFFFFFFFFLL && v13 >= v12)
  {
LABEL_18:
    v21 = v13 - v12;
    -[WFLocationPickerViewController localSearchResults](self, "localSearchResults");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectAtIndex:", v21);
    v24 = (id)objc_claimAutoreleasedReturnValue();

    -[WFLocationPickerViewController updateValueWithMapItem:](self, "updateValueWithMapItem:", v24);
LABEL_20:

  }
}

- (void)updateValueWithMapItem:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = -[WFLocationPickerViewController pickerType](self, "pickerType");
  if (v4 == 1)
  {
    CLPlacemarkFromMapItem(v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLocationPickerViewController circularRegion](self, "circularRegion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "radius");
    -[WFLocationPickerViewController setRegionValueWithPlacemark:radius:](self, "setRegionValueWithPlacemark:radius:", v5);

    goto LABEL_5;
  }
  if (!v4)
  {
    CLPlacemarkFromMapItem(v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLocationPickerViewController setLocationValueWithPlacemark:](self, "setLocationValueWithPlacemark:", v5);
LABEL_5:

  }
}

- (void)updateValueWithRadius:(double)a3
{
  void *v5;
  id v6;

  -[WFLocationPickerViewController value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "placemark");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[WFLocationPickerViewController setRegionValueWithPlacemark:radius:](self, "setRegionValueWithPlacemark:radius:", v6, a3);
}

- (void)setLocationValueWithPlacemark:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x24BEC3E90];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithPlacemark:", v5);

  -[WFLocationPickerViewController setValue:](self, "setValue:", v6);
}

- (void)setRegionValueWithPlacemark:(id)a3 radius:(double)a4
{
  void *v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  objc_msgSend(v20, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 < 100.0)
    a4 = 100.0;
  objc_msgSend(v20, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(MEMORY[0x24BDBFA50]);
  objc_msgSend(v6, "coordinate");
  v10 = v9;
  v12 = v11;
  if (v7)
  {
    objc_msgSend(v20, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v8, "initWithCenter:radius:identifier:", v13, v10, v12, a4);
  }
  else
  {
    -[WFLocationPickerViewController value](self, "value");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "locationName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v8, "initWithCenter:radius:identifier:", v15, v10, v12, a4);

  }
  v16 = objc_alloc(MEMORY[0x24BDBFAC8]);
  objc_msgSend(v20, "addressDictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithLocation:addressDictionary:region:areasOfInterest:", v6, v17, v14, 0);

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC3E90]), "initWithPlacemark:", v18);
  -[WFLocationPickerViewController setValue:](self, "setValue:", v19);

}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v4;
  void *v5;

  v4 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB138]), "initWithAnnotation:reuseIdentifier:", v4, CFSTR("marker"));
    objc_msgSend(v5, "setTitleVisibility:", 1);
    objc_msgSend(v5, "setSubtitleVisibility:", 1);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)mapView:(id)a3 regionWillChangeAnimated:(BOOL)a4
{
  id v4;

  -[WFLocationPickerViewController dragView](self, "dragView", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeHandle:", 1);

}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (-[WFLocationPickerViewController proximityType](self, "proximityType"))
  {
    -[WFLocationPickerViewController dragView](self, "dragView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "annotations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "overlays");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addHandleForAnnotation:withOverlay:", v7, v9);

  }
}

- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (-[WFLocationPickerViewController proximityType](self, "proximityType"))
  {
    -[WFLocationPickerViewController dragView](self, "dragView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "annotation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "overlays");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addHandleForAnnotation:withOverlay:", v8, v10);

  }
}

- (void)mapView:(id)a3 didDeselectAnnotationView:(id)a4
{
  id v4;

  -[WFLocationPickerViewController dragView](self, "dragView", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeHandle:", 1);

}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  Class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  BOOL v16;
  double v17;

  v5 = a4;
  v6 = objc_opt_class();
  WFEnforceClass(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[WFLocationPickerViewController proximityType](self, "proximityType");
  if (v8 == 1)
  {
    v9 = (Class *)0x24BDDB038;
    goto LABEL_5;
  }
  if (v8 == 2)
  {
    v9 = (Class *)&off_24EE10290;
LABEL_5:
    v10 = (void *)objc_msgSend(objc_alloc(*v9), "initWithCircle:", v7);
    goto LABEL_7;
  }
  v10 = 0;
LABEL_7:
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setStrokeColor:", v11);

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "colorWithAlphaComponent:", 0.15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFillColor:", v13);

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "scale");
  v16 = v15 <= 1.0;
  v17 = 2.0;
  if (!v16)
    v17 = 4.0;
  objc_msgSend(v10, "setLineWidth:", v17);

  return v10;
}

- (void)mapViewDidChangeVisibleRegion:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  MKMapRect v19;
  MKMapRect v20;
  MKMapRect v21;

  v18 = a3;
  objc_msgSend(v18, "overlays");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "boundingMapRect");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    objc_msgSend(v18, "visibleMapRect");
    v21.origin.x = v13;
    v21.origin.y = v14;
    v21.size.width = v15;
    v21.size.height = v16;
    v19.origin.x = v6;
    v19.origin.y = v8;
    v19.size.width = v10;
    v19.size.height = v12;
    v20 = MKMapRectUnion(v19, v21);
    objc_msgSend(v4, "setBoundingRect:", v20.origin.x, v20.origin.y, v20.size.width, v20.size.height);
    objc_msgSend(v18, "rendererForOverlay:", v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setNeedsDisplay");

  }
}

- (void)mapRadiusView:(id)a3 radiusDidChange:(double)a4
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;

  -[WFLocationPickerViewController circularRegion](self, "circularRegion", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[WFLocationPickerViewController updateValueWithRadius:](self, "updateValueWithRadius:", a4);
    -[WFLocationPickerViewController circularRegion](self, "circularRegion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "center");
    v9 = v8;
    v11 = v10;

    -[WFLocationPickerViewController showMapRegionForCoordinate:radius:](self, "showMapRegionForCoordinate:radius:", v9, v11, a4);
  }
}

- (id)overlayWithCenterCoordinate:(CLLocationCoordinate2D)a3 radius:(double)a4
{
  double longitude;
  double latitude;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  longitude = a3.longitude;
  latitude = a3.latitude;
  if (-[WFLocationPickerViewController proximityType](self, "proximityType") == 1)
  {
    objc_msgSend(MEMORY[0x24BDDB030], "circleWithCenterCoordinate:radius:", latitude, longitude, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (-[WFLocationPickerViewController proximityType](self, "proximityType") == 2)
  {
    -[WFLocationPickerViewController mapView](self, "mapView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "visibleMapRect");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

    +[WFReverseCircleOverlay circleWithCenterCoordinate:radius:boundingMapRect:](WFReverseCircleOverlay, "circleWithCenterCoordinate:radius:boundingMapRect:", latitude, longitude, a4, v11, v13, v15, v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- ($87AA8D00A04278A3139823EF00364AAC)mapRadiusView:(id)a3 boundingMapRectForOverlay:(id)a4
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  $87AA8D00A04278A3139823EF00364AAC result;

  v4 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "innerCircleBoundingMapRect");
  else
    objc_msgSend(v4, "boundingMapRect");
  v9 = v5;
  v10 = v6;
  v11 = v7;
  v12 = v8;

  v13 = v9;
  v14 = v10;
  v15 = v11;
  v16 = v12;
  result.var1.var1 = v16;
  result.var1.var0 = v15;
  result.var0.var1 = v14;
  result.var0.var0 = v13;
  return result;
}

- (id)mapRadiusView:(id)a3 overlayForRadius:(double)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[WFLocationPickerViewController mapView](self, "mapView", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "annotations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "coordinate");
  -[WFLocationPickerViewController overlayWithCenterCoordinate:radius:](self, "overlayWithCenterCoordinate:radius:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)resetSearchResults
{
  void *v3;
  void *v4;

  -[WFLocationPickerViewController localSearch](self, "localSearch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFLocationPickerViewController localSearch](self, "localSearch");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancel");

    -[WFLocationPickerViewController setLocalSearch:](self, "setLocalSearch:", 0);
  }
  -[WFLocationPickerViewController setLocalSearchResults:](self, "setLocalSearchResults:", 0);
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];

  v5 = a4;
  -[WFLocationPickerViewController resetSearchResults](self, "resetSearchResults");
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    -[WFLocationPickerViewController searchBar](self, "searchBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLocationPickerViewController updateRecentsWithSearchText:](self, "updateRecentsWithSearchText:", v8);

    v9 = objc_alloc_init(MEMORY[0x24BDDB0B8]);
    -[WFLocationPickerViewController searchBar](self, "searchBar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNaturalLanguageQuery:", v11);

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB0A0]), "initWithRequest:", v9);
    -[WFLocationPickerViewController setLocalSearch:](self, "setLocalSearch:", v12);

    -[WFLocationPickerViewController localSearch](self, "localSearch");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __58__WFLocationPickerViewController_searchBar_textDidChange___block_invoke;
    v14[3] = &unk_24EE25AB0;
    v14[4] = self;
    objc_msgSend(v13, "startWithCompletionHandler:", v14);

  }
  else
  {
    -[WFLocationPickerViewController updateRecentsWithSearchText:](self, "updateRecentsWithSearchText:", 0);
    -[WFLocationPickerViewController updateUIWithValue:](self, "updateUIWithValue:", 0);
    -[WFLocationPickerViewController reloadData](self, "reloadData");
  }
}

- (WFLocationPickerViewControllerDelegate)delegate
{
  return (WFLocationPickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)pickerType
{
  return self->_pickerType;
}

- (WFLocationValue)value
{
  return self->_value;
}

- (BOOL)allowsTextOnlyLocation
{
  return self->_allowsTextOnlyLocation;
}

- (void)setAllowsTextOnlyLocation:(BOOL)a3
{
  self->_allowsTextOnlyLocation = a3;
}

- (BOOL)allowsPickingCurrentLocation
{
  return self->_allowsPickingCurrentLocation;
}

- (unint64_t)regionCondition
{
  return self->_regionCondition;
}

- (BOOL)resolvesCurrentLocationToPlacemark
{
  return self->_resolvesCurrentLocationToPlacemark;
}

- (UISearchBar)searchBar
{
  return self->_searchBar;
}

- (void)setSearchBar:(id)a3
{
  objc_storeStrong((id *)&self->_searchBar, a3);
}

- (UIView)dividerView
{
  return self->_dividerView;
}

- (void)setDividerView:(id)a3
{
  objc_storeStrong((id *)&self->_dividerView, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (void)setMapView:(id)a3
{
  objc_storeStrong((id *)&self->_mapView, a3);
}

- (void)setDragView:(id)a3
{
  objc_storeStrong((id *)&self->_dragView, a3);
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setSelectedIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_selectedIndexPath, a3);
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (NSLayoutConstraint)mapHeightConstraint
{
  return self->_mapHeightConstraint;
}

- (void)setMapHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_mapHeightConstraint, a3);
}

- (NSArray)recents
{
  return self->_recents;
}

- (void)setRecents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1072);
}

- (MKLocalSearch)localSearch
{
  return self->_localSearch;
}

- (void)setLocalSearch:(id)a3
{
  objc_storeStrong((id *)&self->_localSearch, a3);
}

- (NSArray)localSearchResults
{
  return self->_localSearchResults;
}

- (void)setLocalSearchResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1088);
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (int)currentAppLocationAuthorizationStatus
{
  return self->_currentAppLocationAuthorizationStatus;
}

- (void)setCurrentAppLocationAuthorizationStatus:(int)a3
{
  self->_currentAppLocationAuthorizationStatus = a3;
}

- (CLLocation)currentLocation
{
  return self->_currentLocation;
}

- (void)setCurrentLocation:(id)a3
{
  objc_storeStrong((id *)&self->_currentLocation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_localSearchResults, 0);
  objc_storeStrong((id *)&self->_localSearch, 0);
  objc_storeStrong((id *)&self->_recents, 0);
  objc_storeStrong((id *)&self->_mapHeightConstraint, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_dragView, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_dividerView, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __58__WFLocationPickerViewController_searchBar_textDidChange___block_invoke(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(a2, "mapItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setLocalSearchResults:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "reloadData");
}

void __68__WFLocationPickerViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WFLocalizedString(CFSTR("Unknown Location"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x24BDBFAC8];
    objc_msgSend(*(id *)(a1 + 32), "currentLocation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "placemarkWithLocation:name:postalAddress:", v4, v5, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC3E90]), "initWithLocationName:placemark:", v5, v3);
  objc_msgSend(*(id *)(a1 + 32), "setValue:", v7);

  v8 = *(void **)(a1 + 32);
  MKMapItemWithPlacemark(v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateValueWithMapItem:", v9);

}

void __68__WFLocationPickerViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a2;
  getWFGeneralLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = 136315394;
    v9 = "-[WFLocationPickerViewController tableView:didSelectRowAtIndexPath:]_block_invoke_2";
    v10 = 2114;
    v11 = v5;
    _os_log_impl(&dword_226666000, v7, OS_LOG_TYPE_ERROR, "%s Failed to get map item: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "updateValueWithMapItem:", v6);
}

uint64_t __91__WFLocationPickerViewController_getPlacemarkFromLocation_streetAddress_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __80__WFLocationPickerViewController_getMapItemFromRecentContact_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__WFLocationPickerViewController_getMapItemFromRecentContact_completionHandler___block_invoke_2;
  block[3] = &unk_24EE259E8;
  v7 = *(id *)(a1 + 32);
  v12 = v6;
  v13 = v7;
  v11 = v5;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __80__WFLocationPickerViewController_getMapItemFromRecentContact_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (a2)
  {
    MKMapItemWithPlacemark(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "displayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setName:", v7);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    getWFGeneralLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = 136315650;
      v11 = "-[WFLocationPickerViewController getMapItemFromRecentContact:completionHandler:]_block_invoke_3";
      v12 = 2114;
      v13 = v5;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_226666000, v8, OS_LOG_TYPE_ERROR, "%s Failed to get map item for recent contact: %{public}@ %@", (uint8_t *)&v10, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __80__WFLocationPickerViewController_getMapItemFromRecentContact_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __62__WFLocationPickerViewController_updateRecentsWithSearchText___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "setRecents:", a2);
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      objc_msgSend(*(id *)(a1 + 32), "reloadData");
  }
}

@end
