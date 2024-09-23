@implementation TrafficIncidentContaineeViewController

- (TrafficIncidentContaineeViewController)init
{
  TrafficIncidentContaineeViewController *v2;
  TrafficIncidentsViewController *v3;
  TrafficIncidentsViewController *incidentsViewController;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TrafficIncidentContaineeViewController;
  v2 = -[TrafficIncidentContaineeViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", 0, 0);
  if (v2)
  {
    v3 = objc_alloc_init(TrafficIncidentsViewController);
    incidentsViewController = v2->_incidentsViewController;
    v2->_incidentsViewController = v3;

    -[TrafficIncidentsViewController setScrollViewDelegate:](v2->_incidentsViewController, "setScrollViewDelegate:", v2);
    -[TrafficIncidentsViewController setDelegate:](v2->_incidentsViewController, "setDelegate:", v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController incidentsViewController](v2, "incidentsViewController"));
    -[TrafficIncidentContaineeViewController addChildViewController:](v2, "addChildViewController:", v5);

  }
  return v2;
}

- (VKTrafficIncidentFeature)incident
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController incidentsViewController](self, "incidentsViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "incident"));

  return (VKTrafficIncidentFeature *)v3;
}

- (void)setIncident:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController incidentsViewController](self, "incidentsViewController"));
  objc_msgSend(v5, "setIncident:", v4);

  -[TrafficIncidentContaineeViewController _updateHeaderView](self, "_updateHeaderView");
  -[TrafficIncidentContaineeViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
  -[TrafficIncidentContaineeViewController _logAdvisoryShown](self, "_logAdvisoryShown");
}

- (TrafficIncidentReport)incidentReport
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController incidentsViewController](self, "incidentsViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "incidentReport"));

  return (TrafficIncidentReport *)v3;
}

- (void)setIncidentReport:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController incidentsViewController](self, "incidentsViewController"));
  objc_msgSend(v5, "setIncidentReport:", v4);

  -[TrafficIncidentContaineeViewController _updateHeaderView](self, "_updateHeaderView");
  -[TrafficIncidentContaineeViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
  -[TrafficIncidentContaineeViewController _logAdvisoryShown](self, "_logAdvisoryShown");
}

- (void)_updateHeaderView
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
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;

  if (-[TrafficIncidentContaineeViewController isViewLoaded](self, "isViewLoaded"))
  {
    if (sub_1002A8AA0(self) == 5)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController incident](self, "incident"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController macTitleView](self, "macTitleView"));
      objc_msgSend(v5, "setTitle:", v4);

      v6 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController incident](self, "incident"));
      if (v6)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController incident](self, "incident"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController macTitleView](self, "macTitleView"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "window"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "screen"));
        if (v10)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "window"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "screen"));
          objc_msgSend(v12, "nativeScale");
          v14 = v13;

        }
        else
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
          objc_msgSend(v11, "nativeScale");
          v14 = v19;
        }

        v20 = sub_1005E0E80(v7, 4, v14);
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController macTitleView](self, "macTitleView"));
        objc_msgSend(v22, "setImage:", v21);

      }
      else
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController macTitleView](self, "macTitleView"));
        objc_msgSend(v7, "setImage:", 0);
      }

      -[TrafficIncidentContaineeViewController _updateMacTableViewHeader](self, "_updateMacTableViewHeader");
    }
    else if (-[TrafficIncidentsViewController numberOfItems](self->_incidentsViewController, "numberOfItems"))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Advisories_Maps_Incidents"), CFSTR("localized string not found"), 0));

      v24 = 0;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v16, CFSTR("%lu"), &v24, -[TrafficIncidentsViewController numberOfItems](self->_incidentsViewController, "numberOfItems")));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController titleView](self, "titleView"));
      objc_msgSend(v18, "setTitle:", v17);

    }
    else
    {
      v23 = (id)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController titleView](self, "titleView"));
      objc_msgSend(v23, "setTitle:", 0);

    }
  }
}

- (void)_updateMacTableViewHeader
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
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController incidentsViewController](self, "incidentsViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tableView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tableHeaderView"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController macTitleView](self, "macTitleView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController incidentsViewController](self, "incidentsViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tableView"));
  objc_msgSend(v8, "setTableHeaderView:", v6);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController incidentsViewController](self, "incidentsViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tableView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tableHeaderView"));
  objc_msgSend(v11, "setNeedsLayout");

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController incidentsViewController](self, "incidentsViewController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tableView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "tableHeaderView"));
  objc_msgSend(v14, "layoutIfNeeded");

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController macTitleView](self, "macTitleView"));
  objc_msgSend(v15, "frame");
  v17 = v16;
  v19 = v18;

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController macTitleView](self, "macTitleView"));
  objc_msgSend(v20, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  v22 = v21;
  v24 = v23;

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController macTitleView](self, "macTitleView"));
  objc_msgSend(v25, "setFrame:", v17, v19, v22, v24);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController macTitleView](self, "macTitleView"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController incidentsViewController](self, "incidentsViewController"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "tableView"));
  objc_msgSend(v28, "setTableHeaderView:", v26);

  if (!v5)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController macTitleView](self, "macTitleView"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "widthAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController incidentsViewController](self, "incidentsViewController"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "tableView"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "widthAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v33));
    v36 = v34;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v36, 1));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v35);

  }
}

- (void)_logAdvisoryShown
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v2, "captureUserAction:onTarget:eventValue:", 111, 743, 0);

}

- (void)viewDidLoad
{
  void *v3;
  TrafficFeatureTitleView *v4;
  void *v5;
  ContainerHeaderView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  TrafficIncidentTitleView *v11;
  void *v12;
  void *v13;
  double left;
  double bottom;
  double right;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
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
  objc_super v59;
  _QWORD v60[3];
  _QWORD v61[4];

  v59.receiver = self;
  v59.super_class = (Class)TrafficIncidentContaineeViewController;
  -[ContaineeViewController viewDidLoad](&v59, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController view](self, "view"));
  if (sub_1002A8AA0(self) == 5)
  {
    v4 = -[TrafficFeatureTitleView initWithFrame:]([TrafficFeatureTitleView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[TrafficIncidentContaineeViewController setMacTitleView:](self, "setMacTitleView:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController macTitleView](self, "macTitleView"));
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  }
  else
  {
    v6 = -[ContainerHeaderView initWithFrame:]([ContainerHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[TrafficIncidentContaineeViewController setHeaderView:](self, "setHeaderView:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController headerView](self, "headerView"));
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController headerView](self, "headerView"));
    objc_msgSend(v8, "setHairLineAlpha:", 0.0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController headerView](self, "headerView"));
    objc_msgSend(v9, "setDelegate:", self);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController headerView](self, "headerView"));
    objc_msgSend(v3, "addSubview:", v10);

    v11 = objc_alloc_init(TrafficIncidentTitleView);
    -[TrafficIncidentContaineeViewController setTitleView:](self, "setTitleView:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController titleView](self, "titleView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController headerView](self, "headerView"));
    objc_msgSend(v13, "setTitleView:", v12);

    left = UIEdgeInsetsZero.left;
    bottom = UIEdgeInsetsZero.bottom;
    right = UIEdgeInsetsZero.right;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController headerView](self, "headerView"));
    objc_msgSend(v5, "setTitleViewInsets:", UIEdgeInsetsZero.top, left, bottom, right);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController incidentsViewController](self, "incidentsViewController"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "view"));
  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController incidentsViewController](self, "incidentsViewController"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "view"));
  objc_msgSend(v3, "addSubview:", v20);

  if (sub_1002A8AA0(self) == 5)
    v21 = objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController view](self, "view"));
  else
    v21 = objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController headerView](self, "headerView"));
  v22 = (void *)v21;
  v57 = (void *)v21;
  if (sub_1002A8AA0(self) == 5)
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "topAnchor"));
  else
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bottomAnchor"));
  v24 = (void *)v23;
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController incidentsViewController](self, "incidentsViewController"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "tableView"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "leadingAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:", v50));
  v61[0] = v49;
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController incidentsViewController](self, "incidentsViewController"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "tableView"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "trailingAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v45));
  v61[1] = v44;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController incidentsViewController](self, "incidentsViewController"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "tableView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "topAnchor"));
  v56 = v24;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:constant:", v24, 0.0));
  v61[2] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController incidentsViewController](self, "incidentsViewController"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "tableView"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "bottomAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:constant:", v31, -0.0));
  v61[3] = v32;
  v58 = v3;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v61, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v33);

  if (sub_1002A8AA0(self) == 5)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController incidentsViewController](self, "incidentsViewController"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "tableView"));
    objc_msgSend(v35, "addObserver:forKeyPath:options:context:", self, CFSTR("contentSize"), 1, &unk_1014D2768);
    v36 = v57;
  }
  else
  {
    v36 = v57;
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "leadingAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "leadingAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v35));
    v60[0] = v55;
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "trailingAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "trailingAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v37));
    v60[1] = v38;
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "topAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "topAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v40));
    v60[2] = v41;
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v60, 3));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v42);

  }
  -[TrafficIncidentContaineeViewController _updateHeaderView](self, "_updateHeaderView");

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == &unk_1014D2768)
    -[TrafficIncidentContaineeViewController _updatePreferredContentSize](self, "_updatePreferredContentSize", a3, a4, a5);
}

- (void)_updatePreferredContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  if (sub_1002A8AA0(self) == 5)
  {
    -[TrafficIncidentContaineeViewController preferredContentSize](self, "preferredContentSize");
    v4 = v3;
    v6 = v5;
    -[TrafficIncidentContaineeViewController _calculatePreferredContentSize](self, "_calculatePreferredContentSize");
    if (v4 != v8 || v6 != v7)
      -[TrafficIncidentContaineeViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TrafficIncidentContaineeViewController;
  -[ContaineeViewController viewDidLayoutSubviews](&v13, "viewDidLayoutSubviews");
  if (sub_1002A8AA0(self) == 5)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController incidentsViewController](self, "incidentsViewController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tableView"));
    objc_msgSend(v4, "contentSize");
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController incidentsViewController](self, "incidentsViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tableView"));
    objc_msgSend(v8, "frame");
    v10 = v6 > v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController incidentsViewController](self, "incidentsViewController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tableView"));
    objc_msgSend(v12, "setScrollEnabled:", v10);

  }
}

- (CGSize)_calculatePreferredContentSize
{
  unsigned int v3;
  double v4;
  uint64_t v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  v3 = -[TrafficIncidentContaineeViewController isViewLoaded](self, "isViewLoaded");
  v4 = 282.0;
  if (v3)
  {
    v5 = sub_1002A8AA0(self);
    v4 = 282.0;
    if (v5 == 5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController view](self, "view"));
      objc_msgSend(v6, "layoutIfNeeded");

      v7 = 0.0;
      if (sub_1002A8AA0(self) != 5)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController titleView](self, "titleView"));
        objc_msgSend(v8, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
        v7 = v9;

      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController incidentsViewController](self, "incidentsViewController"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tableView"));
      objc_msgSend(v11, "contentSize");
      v13 = v12;

      v4 = v7 + v13 + 17.0 + 13.0;
    }
  }
  v14 = 282.0;
  result.height = v4;
  result.width = v14;
  return result;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  if (sub_1002A8AA0(self) == 5)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController incidentsViewController](self, "incidentsViewController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tableView"));
    objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("contentSize"), &unk_1014D2768);

  }
  v5.receiver = self;
  v5.super_class = (Class)TrafficIncidentContaineeViewController;
  -[TrafficIncidentContaineeViewController dealloc](&v5, "dealloc");
}

- (void)applyAlphaToContent:(double)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TrafficIncidentContaineeViewController;
  -[ContaineeViewController applyAlphaToContent:](&v6, "applyAlphaToContent:");
  if (sub_1002A8AA0(self) != 5)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController headerView](self, "headerView"));
    objc_msgSend(v5, "setHairLineAlpha:", a3);

  }
}

- (id)contentView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController incidentsViewController](self, "incidentsViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "view"));

  return v3;
}

- (void)handleDismissAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void (**v7)(void);
  objc_super v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v5, "captureUserAction:onTarget:eventValue:", 108, 741, 0);

  v8.receiver = self;
  v8.super_class = (Class)TrafficIncidentContaineeViewController;
  -[ContaineeViewController handleDismissAction:](&v8, "handleDismissAction:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController dismissHandler](self, "dismissHandler"));
  if (v6)
  {
    v7 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController dismissHandler](self, "dismissHandler"));
    v7[2]();

  }
}

- (double)heightForLayout:(unint64_t)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  CGRect v13;

  if (a3 == 2)
  {
    if (sub_1002A8AA0(self) == 5)
    {
      -[TrafficIncidentContaineeViewController preferredContentSize](self, "preferredContentSize");
      return v9;
    }
    else
    {
      return 325.0;
    }
  }
  else if (a3 == 1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v4, "bottomSafeOffset");
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentContaineeViewController headerView](self, "headerView"));
    objc_msgSend(v7, "frame");
    v8 = v6 + CGRectGetHeight(v13);

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v10, "availableHeight");
    v8 = v11;

  }
  return v8;
}

- (void)headerViewTapped:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController", a3));
  objc_msgSend(v3, "wantsExpandLayout");

}

- (void)dismiss
{
  -[TrafficIncidentContaineeViewController handleDismissAction:](self, "handleDismissAction:", 0);
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (void)setDismissHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (TrafficIncidentsViewController)incidentsViewController
{
  return self->_incidentsViewController;
}

- (ContainerHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (TrafficFeatureTitleView)macTitleView
{
  return self->_macTitleView;
}

- (void)setMacTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_macTitleView, a3);
}

- (TrafficIncidentTitleView)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_titleView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_macTitleView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_incidentsViewController, 0);
  objc_storeStrong(&self->_dismissHandler, 0);
}

@end
