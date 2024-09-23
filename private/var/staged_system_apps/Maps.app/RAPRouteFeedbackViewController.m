@implementation RAPRouteFeedbackViewController

- (RAPRouteFeedbackViewController)initWithReport:(id)a3 recording:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  RAPRouteFeedbackViewController *v12;
  RAPRouteFeedbackViewController *v13;
  RAPRouteFeedbackDataSource *v14;
  RAPDirectionsRecording *recording;
  void *v16;
  RAPRouteFeedbackDataSource *v17;
  RAPRouteFeedbackDataSource *dataSource;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id location;
  objc_super v25;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)RAPRouteFeedbackViewController;
  v12 = -[RAPRouteFeedbackViewController init](&v25, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_report, a3);
    objc_storeStrong((id *)&v13->_recording, a4);
    objc_storeWeak((id *)&v13->_delegate, v11);
    v14 = [RAPRouteFeedbackDataSource alloc];
    recording = v13->_recording;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteFeedbackViewController traitCollection](v13, "traitCollection"));
    v17 = -[RAPRouteFeedbackDataSource initWithRecording:traitCollection:delegate:](v14, "initWithRecording:traitCollection:delegate:", recording, v16, v13);
    dataSource = v13->_dataSource;
    v13->_dataSource = v17;

    objc_initWeak(&location, v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
    objc_msgSend(v19, "registerObserver:", v13);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10022AC6C;
    v22[3] = &unk_1011AD100;
    objc_copyWeak(&v23, &location);
    objc_msgSend(v20, "virtualGarageGetGarageWithReply:", v22);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RAPRouteFeedbackViewController;
  -[RAPRouteFeedbackViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("[RAP Web UI] Report an Issue"), CFSTR("localized string not found"), 0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteFeedbackViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v5, "setTitle:", v4);

  -[RAPRouteFeedbackViewController _setupViews](self, "_setupViews");
  -[RAPRouteFeedbackViewController _setupConstraints](self, "_setupConstraints");

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  RAPRouteFeedbackViewController *v6;
  id v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RAPRouteFeedbackViewController;
  -[RAPRouteFeedbackViewController viewDidAppear:](&v9, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteFeedbackViewController navigationController](self, "navigationController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllers"));
  v6 = (RAPRouteFeedbackViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

  if (v6 == self)
  {
    v7 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, self, "_cancelPressed:");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteFeedbackViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v8, "setLeftBarButtonItem:", v7);

  }
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RAPRouteFeedbackViewController;
  -[RAPRouteFeedbackViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  -[RAPRouteFeedbackViewController _updateTableHeightConstraint](self, "_updateTableHeightConstraint");
  -[RAPRouteFeedbackViewController _reloadTableViewIfNeeded](self, "_reloadTableViewIfNeeded");
}

- (void)_reloadTableViewIfNeeded
{
  double v3;
  double v4;
  NSNumber *computedWidth;
  double v6;
  NSNumber *v7;
  NSNumber *v8;
  _QWORD block[5];

  -[RAPRouteFeedbackViewController _cellContentWidth](self, "_cellContentWidth");
  v4 = v3;
  computedWidth = self->_computedWidth;
  if (!computedWidth || (-[NSNumber cgFloatValue](computedWidth, "cgFloatValue"), vabdd_f64(v6, v4) > 2.22044605e-16))
  {
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v4));
    v8 = self->_computedWidth;
    self->_computedWidth = v7;

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10022AF38;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RAPRouteFeedbackViewController;
  v4 = a3;
  -[RAPRouteFeedbackViewController traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteFeedbackViewController traitCollection](self, "traitCollection", v9.receiver, v9.super_class));
  -[RAPRouteFeedbackDataSource setTraitCollection:](self->_dataSource, "setTraitCollection:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteFeedbackViewController traitCollection](self, "traitCollection"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "preferredContentSizeCategory"));

  if (v6 != v8)
    -[RAPRouteFeedbackViewController _updateTableHeightConstraint](self, "_updateTableHeightConstraint");
}

- (void)_setupViews
{
  UIScrollView *v3;
  UIScrollView *scrollView;
  void *v5;
  void *v6;
  UIView *v7;
  UIView *containerView;
  UILayoutGuide *v9;
  UILayoutGuide *containerLayoutGuide;
  UILabel *v11;
  UILabel *titleLabel;
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
  UIView *v23;
  UIView *tableViewContainer;
  UITableView *v25;
  UITableView *tableView;
  objc_class *v27;
  UITableView *v28;
  NSString *v29;
  void *v30;
  objc_class *v31;
  UITableView *v32;
  NSString *v33;
  void *v34;
  void *v35;
  NSLayoutConstraint *v36;
  NSLayoutConstraint *tableHeightConstraint;
  id v38;

  v3 = (UIScrollView *)objc_alloc_init((Class)UIScrollView);
  scrollView = self->_scrollView;
  self->_scrollView = v3;

  -[UIScrollView setTranslatesAutoresizingMaskIntoConstraints:](self->_scrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIScrollView setAlwaysBounceVertical:](self->_scrollView, "setAlwaysBounceVertical:", 1);
  -[UIScrollView setClipsToBounds:](self->_scrollView, "setClipsToBounds:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView layer](self->_scrollView, "layer"));
  objc_msgSend(v5, "setAllowsGroupOpacity:", 0);

  -[UIScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", -[RAPRouteFeedbackViewController allowsScrolling](self, "allowsScrolling"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteFeedbackViewController view](self, "view"));
  objc_msgSend(v6, "addSubview:", self->_scrollView);

  v7 = (UIView *)objc_alloc_init((Class)UIView);
  containerView = self->_containerView;
  self->_containerView = v7;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_containerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_containerView);
  v9 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  containerLayoutGuide = self->_containerLayoutGuide;
  self->_containerLayoutGuide = v9;

  -[UIView addLayoutGuide:](self->_containerView, "addLayoutGuide:", self->_containerLayoutGuide);
  v11 = (UILabel *)objc_alloc_init((Class)UILabel);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v11;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v13);

  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteFeedbackViewController traitCollection](self, "traitCollection"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_fontWithTextStyle:weight:compatibleWithTraitCollection:](UIFont, "_maps_fontWithTextStyle:weight:compatibleWithTraitCollection:", UIFontTextStyleTitle3, v14, UIFontWeightBold));
  -[UILabel setFont:](self->_titleLabel, "setFont:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteFeedbackDataSource endWaypointMapItem](self->_dataSource, "endWaypointMapItem"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "name"));
  v18 = v17;
  if (v17)
  {
    v38 = v17;
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v38 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Destination [RAP]"), CFSTR("localized string not found"), 0));

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("[RAP] route feedback title"), CFSTR("localized string not found"), 0));

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v21, v38));
  -[UILabel setText:](self->_titleLabel, "setText:", v22);
  -[UIView addSubview:](self->_containerView, "addSubview:", self->_titleLabel);
  v23 = (UIView *)objc_alloc_init((Class)UIView);
  tableViewContainer = self->_tableViewContainer;
  self->_tableViewContainer = v23;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableViewContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_containerView, "addSubview:", self->_tableViewContainer);
  v25 = (UITableView *)objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  tableView = self->_tableView;
  self->_tableView = v25;

  -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  -[UITableView setScrollEnabled:](self->_tableView, "setScrollEnabled:", 0);
  -[UITableView setSeparatorStyle:](self->_tableView, "setSeparatorStyle:", 0);
  v27 = +[RAPRouteFeedbackDataSource _cellClassForItemType:](RAPRouteFeedbackDataSource, "_cellClassForItemType:", 0);
  v28 = self->_tableView;
  v29 = NSStringFromClass(v27);
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  -[UITableView registerClass:forCellReuseIdentifier:](v28, "registerClass:forCellReuseIdentifier:", v27, v30);

  v31 = +[RAPRouteFeedbackDataSource _cellClassForItemType:](RAPRouteFeedbackDataSource, "_cellClassForItemType:", 1);
  v32 = self->_tableView;
  v33 = NSStringFromClass(v31);
  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  -[UITableView registerClass:forCellReuseIdentifier:](v32, "registerClass:forCellReuseIdentifier:", v31, v34);

  -[UIView addSubview:](self->_tableViewContainer, "addSubview:", self->_tableView);
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_tableViewContainer, "heightAnchor"));
  v36 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToConstant:", 0.0));
  tableHeightConstraint = self->_tableHeightConstraint;
  self->_tableHeightConstraint = v36;

}

- (void)_setupConstraints
{
  void *v3;
  double v4;
  NSLayoutConstraint *tableHeightConstraint;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  RAPRouteFeedbackViewController *v15;
  uint64_t v16;
  RAPRouteFeedbackViewController *v17;
  RAPRouteFeedbackViewController *v18;
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
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  _QWORD v95[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteFeedbackViewController traitCollection](self, "traitCollection"));
  if (objc_msgSend(v3, "userInterfaceIdiom") == (id)5)
    v4 = 5.0;
  else
    v4 = 8.0;

  v91 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView topAnchor](self->_scrollView, "topAnchor"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteFeedbackViewController view](self, "view"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "safeAreaLayoutGuide"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "topAnchor"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "constraintEqualToAnchor:", v89));
  v95[0] = v88;
  v86 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView leadingAnchor](self->_scrollView, "leadingAnchor"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteFeedbackViewController view](self, "view"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "leadingAnchor"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "constraintEqualToAnchor:", v85));
  v95[1] = v84;
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView trailingAnchor](self->_scrollView, "trailingAnchor"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteFeedbackViewController view](self, "view"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "trailingAnchor"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "constraintEqualToAnchor:", v81));
  v95[2] = v80;
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView contentLayoutGuide](self->_scrollView, "contentLayoutGuide"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "widthAnchor"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteFeedbackViewController view](self, "view"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "widthAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "constraintEqualToAnchor:", v76));
  v95[3] = v75;
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_containerView, "topAnchor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView topAnchor](self->_scrollView, "topAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "constraintEqualToAnchor:", v73));
  v95[4] = v72;
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_containerView, "leadingAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView leadingAnchor](self->_scrollView, "leadingAnchor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "constraintEqualToAnchor:", v70));
  v95[5] = v69;
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_containerView, "trailingAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView trailingAnchor](self->_scrollView, "trailingAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "constraintEqualToAnchor:", v67));
  v95[6] = v66;
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_containerView, "bottomAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView bottomAnchor](self->_scrollView, "bottomAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintEqualToAnchor:", v64));
  v95[7] = v63;
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_containerLayoutGuide, "topAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_containerView, "topAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:", v61));
  v95[8] = v60;
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_containerLayoutGuide, "leadingAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_containerView, "leadingAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToAnchor:", v58));
  v95[9] = v57;
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_containerLayoutGuide, "trailingAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_containerView, "trailingAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:", v55));
  v95[10] = v54;
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_containerLayoutGuide, "bottomAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_containerView, "bottomAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:", v52));
  v95[11] = v51;
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_titleLabel, "topAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_containerLayoutGuide, "topAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:constant:", v49, v4));
  v95[12] = v48;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_containerLayoutGuide, "leadingAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:constant:", v46, 16.0));
  v95[13] = v45;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_containerLayoutGuide, "trailingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:constant:", v43, -16.0));
  v95[14] = v42;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_tableViewContainer, "topAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v40));
  v95[15] = v39;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_tableViewContainer, "leadingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_containerLayoutGuide, "leadingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v37));
  v95[16] = v36;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_tableViewContainer, "trailingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_containerLayoutGuide, "trailingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v34));
  tableHeightConstraint = self->_tableHeightConstraint;
  v95[17] = v33;
  v95[18] = tableHeightConstraint;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_tableViewContainer, "bottomAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_containerLayoutGuide, "bottomAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v31));
  v95[19] = v30;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView leadingAnchor](self->_tableView, "leadingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_tableViewContainer, "leadingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v28));
  v95[20] = v27;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView trailingAnchor](self->_tableView, "trailingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_tableViewContainer, "trailingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v6));
  v95[21] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView topAnchor](self->_tableView, "topAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_tableViewContainer, "topAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
  v95[22] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView bottomAnchor](self->_tableView, "bottomAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_tableViewContainer, "bottomAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
  v95[23] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v95, 24));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

  v15 = self;
  v16 = objc_opt_class(MacRAPBaseViewController);
  if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
    v17 = v15;
  else
    v17 = 0;
  v18 = v17;

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView bottomAnchor](self->_scrollView, "bottomAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteFeedbackViewController view](v15, "view"));
  v21 = v20;
  if (v18)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "safeAreaLayoutGuide"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bottomAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v23));
    v94 = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v94, 1));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v25);

  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bottomAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v22));
    v93 = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v93, 1));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v24);
    v25 = 0;
  }

}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (double)desiredHeight
{
  double v2;

  -[UIScrollView contentSize](self->_scrollView, "contentSize");
  return v2;
}

- (void)setAllowsScrolling:(BOOL)a3
{
  if (self->_allowsScrolling != a3)
  {
    self->_allowsScrolling = a3;
    -[UIScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:");
  }
}

- (double)_cellContentWidth
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteFeedbackViewController tableView](self, "tableView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cellForRowAtIndexPath:", v4));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentView"));
    objc_msgSend(v6, "bounds");
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteFeedbackViewController view](self, "view"));
    objc_msgSend(v6, "frame");
  }
  v8 = v7;

  return v8;
}

- (void)_updateTableHeightConstraint
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  id v8;

  -[UITableView layoutIfNeeded](self->_tableView, "layoutIfNeeded");
  -[NSLayoutConstraint constant](self->_tableHeightConstraint, "constant");
  v4 = v3;
  -[UITableView contentSize](self->_tableView, "contentSize");
  if (v4 != v5)
  {
    -[UITableView contentSize](self->_tableView, "contentSize");
    -[NSLayoutConstraint setConstant:](self->_tableHeightConstraint, "setConstant:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteFeedbackViewController view](self, "view"));
    objc_msgSend(v7, "setNeedsLayout");

    v8 = (id)objc_claimAutoreleasedReturnValue(-[RAPRouteFeedbackViewController view](self, "view"));
    objc_msgSend(v8, "layoutIfNeeded");

  }
}

- (void)dataSourceDidUpdate:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;

  v4 = a3;
  -[UITableView reloadData](self->_tableView, "reloadData");
  -[RAPRouteFeedbackViewController _updateTableHeightConstraint](self, "_updateTableHeightConstraint");
  v5 = sub_100431F8C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "datasourceDidUpdate: %@", (uint8_t *)&v7, 0xCu);
  }

}

- (void)_dismiss
{
  id v3;
  NSObject *v4;
  void *v5;
  id WeakRetained;
  uint8_t v7[16];

  v3 = sub_100431F8C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "will dismiss RAPRouteFeedbackViewController", v7, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v5, "captureUserAction:onTarget:eventValue:", 10109, 68, 0);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "routeFeedbackViewControllerDidDismiss:", self);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  void *v7;
  int64_t v8;
  id v9;
  NSObject *v10;
  RAPRouteFeedbackDataSource *dataSource;
  int v13;
  int64_t v14;
  __int16 v15;
  RAPRouteFeedbackDataSource *v16;

  v6 = a3;
  if (a4)
  {
    if (a4 == 1)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteFeedbackDataSource allItems](self->_dataSource, "allItems"));
      v8 = (int64_t)objc_msgSend(v7, "count");

    }
    else
    {
      v9 = sub_100431F8C();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        dataSource = self->_dataSource;
        v13 = 134218242;
        v14 = a4;
        v15 = 2112;
        v16 = dataSource;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "numberOfRowsInSection: called with invalid section: %lu, dataSource: %@", (uint8_t *)&v13, 0x16u);
      }

      v8 = 0;
    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  id v11;
  NSObject *v12;
  RAPRouteFeedbackDataSource *dataSource;
  int v15;
  int64_t v16;
  __int16 v17;
  RAPRouteFeedbackDataSource *v18;

  v6 = a3;
  if (a4 == 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = v7;
    v9 = CFSTR("[RAP] Nav step list - Route Steps");
    goto LABEL_5;
  }
  if (!a4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = v7;
    v9 = CFSTR("[RAP] Nav step list - Arrival");
LABEL_5:
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v9, CFSTR("localized string not found"), 0));

    goto LABEL_9;
  }
  v11 = sub_100431F8C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    dataSource = self->_dataSource;
    v15 = 134218242;
    v16 = a4;
    v17 = 2112;
    v18 = dataSource;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "titleForHeaderInSection: called with invalid section: %lu, dataSource: %@", (uint8_t *)&v15, 0x16u);
  }

  v10 = 0;
LABEL_9:

  return v10;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  void *v5;
  NSNumber *computedWidth;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteFeedbackDataSource _stepItemForIndexPath:](self->_dataSource, "_stepItemForIndexPath:", a4));
  computedWidth = self->_computedWidth;
  if (computedWidth)
  {
    -[NSNumber cgFloatValue](computedWidth, "cgFloatValue");
    v8 = v7;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteFeedbackViewController view](self, "view"));
    objc_msgSend(v9, "frame");
    v8 = v10;

  }
  objc_msgSend(objc_msgSend(v5, "cellClass"), "heightForItem:width:maximumHeight:", v5, v8, 1.79769313e308);
  v12 = v11;

  return v12;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  NSString *v10;
  void *v11;
  void *v12;
  UITableViewCell *v13;
  id v14;
  id v15;
  NSObject *v16;
  RAPRouteFeedbackDataSource *dataSource;
  UITableViewCell *v18;
  id v19;
  NSObject *v20;
  RAPRouteFeedbackDataSource *v21;
  int v23;
  void *v24;
  __int16 v25;
  RAPRouteFeedbackDataSource *v26;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "section");
  if ((unint64_t)v8 > 1)
  {
    v14 = v8;
    v15 = sub_100431F8C();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      dataSource = self->_dataSource;
      v23 = 134218242;
      v24 = v14;
      v25 = 2112;
      v26 = dataSource;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "cellForRowAtIndexPath: called with invalid section: %lu, dataSource: %@", (uint8_t *)&v23, 0x16u);
    }

    v18 = objc_opt_new(UITableViewCell);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteFeedbackDataSource _stepItemForIndexPath:](self->_dataSource, "_stepItemForIndexPath:", v7));
    v10 = NSStringFromClass((Class)objc_msgSend(v9, "cellClass"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v11));

    if (v12)
    {
      objc_msgSend(v12, "setItem:", v9);
      objc_msgSend(v12, "setAccessoryType:", -[RAPRouteFeedbackViewController _canTableViewSelectIndexPath:](self, "_canTableViewSelectIndexPath:", v7));
      v13 = v12;
    }
    else
    {
      v19 = sub_100431F8C();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = self->_dataSource;
        v23 = 138412546;
        v24 = v9;
        v25 = 2112;
        v26 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "cellForRowAtIndexPath: called with invalid item: %@, dataSource: %@", (uint8_t *)&v23, 0x16u);
      }

      v13 = objc_opt_new(UITableViewCell);
    }
    v18 = v13;

  }
  return v18;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  RAPRouteStepDetailViewController *stepDetailViewController;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  RAPRouteStepDetailViewController *v14;
  RAPReport *report;
  void *v16;
  id v17;
  RAPRouteStepDetailViewController *v18;
  RAPRouteStepDetailViewController *v19;
  uint64_t v20;
  id v21;
  char *v22;
  void *v23;
  RAPRouteStepDetailViewController *v24;
  RAPReport *v25;
  void *v26;
  id v27;
  RAPRouteStepDetailViewController *v28;
  RAPRouteStepDetailViewController *v29;
  id v30;
  NSObject *v31;
  id v32;
  NSObject *v33;
  void *v34;
  uint8_t v35[16];
  uint8_t buf[16];

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  stepDetailViewController = self->_stepDetailViewController;
  self->_stepDetailViewController = 0;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteFeedbackDataSource _stepItemForIndexPath:](self->_dataSource, "_stepItemForIndexPath:", v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteFeedbackDataSource _userPathForStepItem:](self->_dataSource, "_userPathForStepItem:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteFeedbackDataSource _routeForStepItem:](self->_dataSource, "_routeForStepItem:", v8));
  v11 = objc_msgSend(v10, "_maps_routeIndex");

  v12 = objc_opt_class(RouteStepManeuverItem);
  if ((objc_opt_isKindOfClass(v8, v12) & 1) != 0)
  {
    v13 = v8;
    v14 = [RAPRouteStepDetailViewController alloc];
    report = self->_report;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "step"));

    if (v11 == (id)0x7FFFFFFFFFFFFFFFLL)
      v17 = 0;
    else
      v17 = v11;
    v18 = -[RAPRouteStepDetailViewController initWithReport:step:userPath:routeIndex:delegate:](v14, "initWithReport:step:userPath:routeIndex:delegate:", report, v16, v9, v17, self);
    v19 = self->_stepDetailViewController;
    self->_stepDetailViewController = v18;

  }
  else
  {
    v20 = objc_opt_class(RouteStepWaypointItem);
    if ((objc_opt_isKindOfClass(v8, v20) & 1) != 0)
    {
      v21 = v8;
      v22 = (char *)objc_msgSend(v21, "waypointType");
      if ((unint64_t)(v22 - 1) >= 2)
      {
        if (!v22)
        {
          v30 = sub_100431F8C();
          v31 = objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "tableView:didSelectRowAtIndexPath: tapped an origin waypoint, this is not supported", buf, 2u);
          }

        }
      }
      else
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "arrivalStep"));

        if (v23)
        {
          v24 = [RAPRouteStepDetailViewController alloc];
          v25 = self->_report;
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "arrivalStep"));
          if (v11 == (id)0x7FFFFFFFFFFFFFFFLL)
            v27 = 0;
          else
            v27 = v11;
          v28 = -[RAPRouteStepDetailViewController initWithReport:step:userPath:routeIndex:delegate:](v24, "initWithReport:step:userPath:routeIndex:delegate:", v25, v26, v9, v27, self);
          v29 = self->_stepDetailViewController;
          self->_stepDetailViewController = v28;

        }
      }

    }
  }
  if (self->_stepDetailViewController)
  {
    v32 = sub_100431F8C();
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v35 = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "tableView:didSelectRowAtIndexPath: will present a RAPRouteStepDetailViewController", v35, 2u);
    }

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteFeedbackViewController navigationController](self, "navigationController"));
    objc_msgSend(v34, "pushViewController:animated:", self->_stepDetailViewController, 1);

  }
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  if (-[RAPRouteFeedbackViewController _canTableViewSelectIndexPath:](self, "_canTableViewSelectIndexPath:", v5))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (BOOL)_canTableViewSelectIndexPath:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  char v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteFeedbackDataSource _stepItemForIndexPath:](self->_dataSource, "_stepItemForIndexPath:", a3));
  v5 = objc_opt_class(RouteStepWaypointItem);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    v6 = v4;
  else
    v6 = 0;
  v7 = v6;
  v8 = v7;
  if (!v7)
    goto LABEL_10;
  if (objc_msgSend(v7, "waypointType"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "waypoint"));
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapItemIfLoaded"));

    if (v10 && -[RAPRouteFeedbackViewController isMapItemTrailOrTrailHead:](self, "isMapItemTrailOrTrailHead:", v10))
    {
      v11 = 0;
LABEL_21:

      goto LABEL_22;
    }

LABEL_10:
    v12 = v4;
    v13 = objc_opt_class(RouteStepManeuverItem);
    if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
      v14 = v12;
    else
      v14 = 0;
    v10 = v14;

    if (v10)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "step"));
      if (objc_msgSend(v15, "isArrivalStep"))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteFeedbackDataSource endWaypointMapItem](self->_dataSource, "endWaypointMapItem"));
        v17 = -[RAPRouteFeedbackViewController isMapItemTrailOrTrailHead:](self, "isMapItemTrailOrTrailHead:", v16);

      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }
    v11 = v17 ^ 1;
    goto LABEL_21;
  }
  v11 = 0;
LABEL_22:

  return v11;
}

- (void)routeStepDetailViewControllerDidSubmitReport:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  uint8_t v7[16];

  v4 = sub_100431F8C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "routeStepDetailViewControllerDidSubmitReport: will dismiss RAP", v7, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "routeFeedbackViewControllerDidDismiss:", self);

}

- (void)macFooterViewLeftButtonTapped:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = sub_100431F8C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "macFooterViewLeftButtonTapped: will dismiss", v6, 2u);
  }

  -[RAPRouteFeedbackViewController _dismiss](self, "_dismiss");
}

- (void)virtualGarageDidUpdate:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10022CD10;
  v4[3] = &unk_1011AC8B0;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

- (BOOL)isMapItemTrailOrTrailHead:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "_placeCategoryType") == 1
    || objc_msgSend(v3, "_placeCategoryType") == 2;

  return v4;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setRoute:(id)a3
{
  objc_storeStrong((id *)&self->_route, a3);
}

- (BOOL)showsHairline
{
  return self->_showsHairline;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (BOOL)allowsScrolling
{
  return self->_allowsScrolling;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_computedWidth, 0);
  objc_storeStrong((id *)&self->_stepDetailViewController, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_recording, 0);
  objc_storeStrong((id *)&self->_report, 0);
  objc_storeStrong((id *)&self->_tableHeightConstraint, 0);
  objc_storeStrong((id *)&self->_directionsListViewController, 0);
  objc_storeStrong((id *)&self->_tableViewContainer, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_containerLayoutGuide, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
