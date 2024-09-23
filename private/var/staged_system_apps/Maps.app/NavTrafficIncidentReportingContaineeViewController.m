@implementation NavTrafficIncidentReportingContaineeViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NavTrafficIncidentReportingContaineeViewController)initWithDelegate:(id)a3
{
  id v4;
  NavTrafficIncidentReportingContaineeViewController *v5;
  NavTrafficIncidentReportingContaineeViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NavTrafficIncidentReportingContaineeViewController;
  v5 = -[NavTrafficIncidentReportingContaineeViewController initWithNibName:bundle:](&v11, "initWithNibName:bundle:", 0, 0);
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v5, "cardPresentationController"));
    objc_msgSend(v7, "setBlurInCardView:", 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("NavigationMaterialColor")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v6, "cardPresentationController"));
    objc_msgSend(v9, "setCardColor:", v8);

    objc_storeWeak((id *)&v6->_incidentReportingDelegate, v4);
  }

  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  UIView *v4;
  UIView *v5;
  UILabel *v6;
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
  ContainerHeaderView *v19;
  double v20;
  void *v21;
  ContainerHeaderView *v22;
  UITableView *v23;
  UITableView *tableView;
  void *v25;
  UITableView *v26;
  uint64_t v27;
  objc_class *v28;
  NSString *v29;
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
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  ContainerHeaderView *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  UILabel *v77;
  UIView *v78;
  objc_super v79;
  _QWORD v80[8];
  _QWORD v81[4];

  v79.receiver = self;
  v79.super_class = (Class)NavTrafficIncidentReportingContaineeViewController;
  -[ContaineeViewController viewDidLoad](&v79, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v3, "setEdgeAttachedRegularHeightDimmingBehavior:", 2);

  v4 = objc_opt_new(UIView);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = v4;
  -[UIView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("TitleView"));
  v6 = objc_opt_new(UILabel);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](v6, "setNumberOfLines:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_boldSystemFontWithSize:](UIFont, "_maps_boldSystemFontWithSize:", 27.0));
  -[UILabel setFont:](v6, "setFont:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Report Incident [Nav, Tray]"), CFSTR("localized string not found"), 0));
  -[UILabel setText:](v6, "setText:", v9);

  -[UILabel setAccessibilityIdentifier:](v6, "setAccessibilityIdentifier:", CFSTR("HeaderLabel"));
  -[UIView addSubview:](v5, "addSubview:", v6);
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v6, "leadingAnchor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v5, "leadingAnchor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "constraintEqualToAnchor:constant:", v73, 16.0));
  v81[0] = v71;
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v6, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v5, "trailingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToAnchor:", v10));
  v81[1] = v11;
  v77 = v6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v6, "topAnchor"));
  v78 = v5;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v5, "topAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, 16.0));
  v81[2] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v6, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v5, "bottomAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, -16.0));
  v81[3] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v81, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v18);

  v19 = objc_opt_new(ContainerHeaderView);
  -[ContainerHeaderView setTranslatesAutoresizingMaskIntoConstraints:](v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v20) = 1148846080;
  -[ContainerHeaderView setContentCompressionResistancePriority:forAxis:](v19, "setContentCompressionResistancePriority:forAxis:", 1, v20);
  -[ContainerHeaderView setTitleView:](v19, "setTitleView:", v78);
  -[ContainerHeaderView setDelegate:](v19, "setDelegate:", self);
  -[ContainerHeaderView setHairLineAlpha:](v19, "setHairLineAlpha:", 0.0);
  -[ContainerHeaderView setAccessibilityIdentifier:](v19, "setAccessibilityIdentifier:", CFSTR("NavIncidentReportingHeaderView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v22 = v19;
  objc_msgSend(v21, "addSubview:", v19);

  v23 = (UITableView *)objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  tableView = self->_tableView;
  self->_tableView = v23;

  -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  -[UITableView setSeparatorInset:](self->_tableView, "setSeparatorInset:", 0.0, 76.0, 0.0, 16.0);
  -[UITableView _setTopPadding:](self->_tableView, "_setTopPadding:", 0.0);
  -[UITableView _setBottomPadding:](self->_tableView, "_setBottomPadding:", 0.0);
  -[UITableView setSectionHeaderHeight:](self->_tableView, "setSectionHeaderHeight:", 0.0);
  -[UITableView setSectionFooterHeight:](self->_tableView, "setSectionFooterHeight:", 16.0);
  -[UITableView setAlwaysBounceVertical:](self->_tableView, "setAlwaysBounceVertical:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UITableView setBackgroundColor:](self->_tableView, "setBackgroundColor:", v25);

  -[UITableView setLayoutMargins:](self->_tableView, "setLayoutMargins:", 0.0, 16.0, 0.0, 16.0);
  v26 = self->_tableView;
  v27 = objc_opt_class(NavIncidentReportingCell);
  v28 = (objc_class *)objc_opt_class(NavIncidentReportingCell);
  v29 = NSStringFromClass(v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  -[UITableView registerClass:forCellReuseIdentifier:](v26, "registerClass:forCellReuseIdentifier:", v27, v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("NavTraySeparatorColor")));
  -[UITableView setSeparatorColor:](self->_tableView, "setSeparatorColor:", v31);

  -[UITableView setAccessibilityIdentifier:](self->_tableView, "setAccessibilityIdentifier:", CFSTR("NavIncidentReportingTableView"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  objc_msgSend(v32, "addSubview:", self->_tableView);

  v74 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView topAnchor](v22, "topAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "topAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "constraintEqualToAnchor:", v72));
  v80[0] = v70;
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView leadingAnchor](v22, "leadingAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "leadingAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:", v65));
  v80[1] = v64;
  v68 = v22;
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView trailingAnchor](v22, "trailingAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "trailingAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:", v61));
  v80[2] = v60;
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView bottomAnchor](v22, "bottomAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "bottomAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:", v57));
  v80[3] = v56;
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentReportingContaineeViewController tableView](self, "tableView"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "leadingAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "leadingAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:", v52));
  v80[4] = v51;
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentReportingContaineeViewController tableView](self, "tableView"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "trailingAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "trailingAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:", v47));
  v80[5] = v46;
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentReportingContaineeViewController tableView](self, "tableView"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "topAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "topAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v34));
  v80[6] = v35;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentReportingContaineeViewController tableView](self, "tableView"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "bottomAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "bottomAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v39));
  v80[7] = v40;
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v80, 8));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v41);

  v42 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentLayoutManager sharedInstance](TrafficIncidentLayoutManager, "sharedInstance"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "currentIncidentsLayout"));
  -[NavTrafficIncidentReportingContaineeViewController setTrafficIncidentLayoutItems:](self, "setTrafficIncidentLayoutItems:", v43);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NavTrafficIncidentReportingContaineeViewController;
  -[ContaineeViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v4, "setHideGrabber:", 1);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  GEOLocation *v5;
  GEOLocation *incidentLocation;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NavTrafficIncidentReportingContaineeViewController;
  -[NavTrafficIncidentReportingContaineeViewController viewDidAppear:](&v9, "viewDidAppear:", a3);
  -[NavTrafficIncidentReportingContaineeViewController _dismissAfterDelay](self, "_dismissAfterDelay");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v5 = (GEOLocation *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentLocation"));
  incidentLocation = self->_incidentLocation;
  self->_incidentLocation = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v7, "captureUserAction:onTarget:eventValue:", 113, 0, 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v8, "updateHeightForCurrentLayout");

}

- (void)_dismissAfterDelay
{
  double Double;
  id v4;
  void *v5;
  void **v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  objc_initWeak(&location, self);
  Double = GEOConfigGetDouble(MapsConfig_TrafficIncidentsSelectionDismissDelay, off_1014B34E8);
  v4 = &_dispatch_main_q;
  v6 = _NSConcreteStackBlock;
  v7 = 3221225472;
  v8 = sub_100C76D08;
  v9 = &unk_1011AE190;
  objc_copyWeak(&v10, &location);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, &v6, Double));
  -[NavTrafficIncidentReportingContaineeViewController setTimer:](self, "setTimer:", v5, v6, v7, v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)setTrafficIncidentLayoutItems:(id)a3
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a3;
  v6 = self->_trafficIncidentLayoutItems;
  v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    v12 = (id)v7;
    v8 = objc_msgSend((id)v6, "isEqual:");

    v7 = (unint64_t)v12;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_trafficIncidentLayoutItems, a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentReportingContaineeViewController tableView](self, "tableView"));
      objc_msgSend(v9, "reloadData");

      if (!objc_msgSend(v12, "count"))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentReportingContaineeViewController incidentReportingDelegate](self, "incidentReportingDelegate"));
        objc_msgSend(v10, "dismissIncidentReportingViewController:", self);

      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      objc_msgSend(v11, "updateHeightForCurrentLayout");

      v7 = (unint64_t)v12;
    }
  }

}

- (double)heightForLayout:(unint64_t)a3
{
  double v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;

  if (a3 == 1)
  {
    -[ContaineeViewController headerHeight](self, "headerHeight");
    v15 = v14;
LABEL_10:
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v17, "bottomSafeOffset");
    v4 = v15 + v18;

    return v4;
  }
  v4 = -1.0;
  if (a3 == 2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentReportingContaineeViewController tableView](self, "tableView"));
    v6 = (uint64_t)objc_msgSend(v5, "numberOfRowsInSection:", 0);

    if (v6 < 1)
    {
      v8 = 0.0;
    }
    else
    {
      v7 = 0;
      v8 = 0.0;
      do
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentReportingContaineeViewController tableView](self, "tableView"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v7, 0));
        -[NavTrafficIncidentReportingContaineeViewController tableView:heightForRowAtIndexPath:](self, "tableView:heightForRowAtIndexPath:", v9, v10);
        v8 = v8 + v11;

        ++v7;
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentReportingContaineeViewController tableView](self, "tableView"));
        v13 = objc_msgSend(v12, "numberOfRowsInSection:", 0);

      }
      while (v7 < (uint64_t)v13);
    }
    -[ContaineeViewController headerHeight](self, "headerHeight");
    v15 = v8 + v16 + 16.0;
    goto LABEL_10;
  }
  return v4;
}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  void *v5;
  id v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentReportingContaineeViewController incidentReportingDelegate](self, "incidentReportingDelegate", a3, a4));
  objc_msgSend(v5, "dismissIncidentReportingViewController:", self);

  v6 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v6, "captureUserAction:onTarget:eventValue:", 4, 667, 0);

}

- (void)headerViewTapped:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController", a3));
  v5 = objc_msgSend(v4, "containeeLayout");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v8 = v6;
  if (v5 == (id)1)
    v7 = 2;
  else
    v7 = 1;
  objc_msgSend(v6, "wantsLayout:", v7);

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentReportingContaineeViewController trafficIncidentLayoutItems](self, "trafficIncidentLayoutItems", a3, a4));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;

  v6 = a4;
  v7 = a3;
  v8 = (objc_class *)objc_opt_class(NavIncidentReportingCell);
  v9 = NSStringFromClass(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentReportingContaineeViewController trafficIncidentLayoutItems](self, "trafficIncidentLayoutItems"));
  v13 = objc_msgSend(v6, "row");

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", v13));
  objc_msgSend(v11, "setItem:", v14);

  return v11;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double Width;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect v29;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentReportingContaineeViewController trafficIncidentLayoutItems](self, "trafficIncidentLayoutItems"));
  v9 = objc_msgSend(v6, "row");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v9));
  objc_msgSend(v7, "frame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v29.origin.x = v12;
  v29.origin.y = v14;
  v29.size.width = v16;
  v29.size.height = v18;
  Width = CGRectGetWidth(v29);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentReportingContaineeViewController tableView](self, "tableView"));
  objc_msgSend(v20, "layoutMargins");
  v22 = Width - v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentReportingContaineeViewController tableView](self, "tableView"));
  objc_msgSend(v23, "layoutMargins");
  v25 = v22 - v24;

  +[NavIncidentReportingCell heightForCellWithItem:width:](NavIncidentReportingCell, "heightForCellWithItem:width:", v10, v25);
  v27 = v26;

  return v27;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentReportingContaineeViewController trafficIncidentLayoutItems](self, "trafficIncidentLayoutItems"));
  v8 = objc_msgSend(v6, "row");

  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v8));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "incidentTypeAsString"));
  objc_msgSend(v9, "captureUserAction:onTarget:eventValue:", 2152, 667, v10);

  -[NavTrafficIncidentReportingContaineeViewController setTimer:](self, "setTimer:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentReportingContaineeViewController incidentReportingDelegate](self, "incidentReportingDelegate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentReportingContaineeViewController incidentLocation](self, "incidentLocation"));
  objc_msgSend(v11, "incidentReportingViewController:selectedTrafficIncidentItem:atLocation:", self, v13, v12);

}

- (NavTrafficIncidentReportingContaineeViewControllerDelegate)incidentReportingDelegate
{
  return (NavTrafficIncidentReportingContaineeViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_incidentReportingDelegate);
}

- (GEOLocation)incidentLocation
{
  return self->_incidentLocation;
}

- (void)setIncidentLocation:(id)a3
{
  objc_storeStrong((id *)&self->_incidentLocation, a3);
}

- (GCDTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (NSArray)trafficIncidentLayoutItems
{
  return self->_trafficIncidentLayoutItems;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_trafficIncidentLayoutItems, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_incidentLocation, 0);
  objc_destroyWeak((id *)&self->_incidentReportingDelegate);
}

@end
