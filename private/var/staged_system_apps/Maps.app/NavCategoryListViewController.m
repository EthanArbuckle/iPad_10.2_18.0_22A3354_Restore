@implementation NavCategoryListViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NavCategoryListViewController)initWithDelegate:(id)a3 categories:(id)a4
{
  id v6;
  id v7;
  NavCategoryListViewController *v8;
  NavCategoryListViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NavCategoryListViewController;
  v8 = -[NavCategoryListViewController initWithNibName:bundle:](&v14, "initWithNibName:bundle:", 0, 0);
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v8, "cardPresentationController"));
    objc_msgSend(v10, "setBlurInCardView:", 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("NavigationMaterialColor")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v9, "cardPresentationController"));
    objc_msgSend(v12, "setCardColor:", v11);

    -[NavCategoryListViewController setCategories:](v9, "setCategories:", v7);
    objc_storeWeak((id *)&v9->_categoryListDelegate, v6);
  }

  return v9;
}

- (NavCategoryListViewController)initWithDelegate:(id)a3 usingSearchHome:(id)a4
{
  id v6;
  id v7;
  NavCategoryListViewController *v8;
  NavCategoryListViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)NavCategoryListViewController;
  v8 = -[NavCategoryListViewController initWithNibName:bundle:](&v16, "initWithNibName:bundle:", 0, 0);
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v8, "cardPresentationController"));
    objc_msgSend(v10, "setBlurInCardView:", 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("NavigationMaterialColor")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v9, "cardPresentationController"));
    objc_msgSend(v12, "setCardColor:", v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v9, "cardPresentationController"));
    objc_msgSend(v13, "setTakesAvailableHeight:", 1);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v9, "cardPresentationController"));
    objc_msgSend(v14, "setPresentedModally:", 1);

    objc_storeWeak((id *)&v9->_categoryListDelegate, v6);
    -[NavCategoryListViewController setSearchHomeViewController:](v9, "setSearchHomeViewController:", v7);
  }

  return v9;
}

- (void)viewDidLoad
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  UIView *v8;
  UILabel *v9;
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
  ContainerHeaderView *v21;
  double v22;
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
  UITableView *v49;
  UITableView *tableView;
  void *v51;
  UITableView *v52;
  uint64_t v53;
  objc_class *v54;
  NSString *v55;
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
  ContainerHeaderView *v91;
  UILabel *v92;
  void *v93;
  UIView *v94;
  id v95;
  objc_super v96;
  _QWORD v97[4];
  _QWORD v98[4];
  _QWORD v99[4];
  _QWORD v100[4];

  v96.receiver = self;
  v96.super_class = (Class)NavCategoryListViewController;
  -[ContaineeViewController viewDidLoad](&v96, "viewDidLoad");
  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[NavCategoryListViewController setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("NavCategoryListViewContent"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v7, "setEdgeAttachedRegularHeightDimmingBehavior:", 2);

  v95 = objc_alloc_init((Class)NSMutableArray);
  v8 = objc_opt_new(UIView);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setAccessibilityIdentifier:](v8, "setAccessibilityIdentifier:", CFSTR("TitleView"));
  v9 = objc_opt_new(UILabel);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](v9, "setNumberOfLines:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_boldSystemFontWithSize:](UIFont, "_maps_boldSystemFontWithSize:", 27.0));
  -[UILabel setFont:](v9, "setFont:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("[NavSAR] Add Stop"), CFSTR("localized string not found"), 0));
  -[UILabel setText:](v9, "setText:", v12);

  -[UILabel setAccessibilityIdentifier:](v9, "setAccessibilityIdentifier:", CFSTR("HeaderLabel"));
  -[UIView addSubview:](v8, "addSubview:", v9);
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v9, "leadingAnchor"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v8, "leadingAnchor"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "constraintEqualToAnchor:constant:", v90, 16.0));
  v100[0] = v87;
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v9, "trailingAnchor"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v8, "trailingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "constraintEqualToAnchor:", v81));
  v100[1] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v9, "topAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v8, "topAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, 16.0));
  v100[2] = v16;
  v92 = v9;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v9, "bottomAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v8, "bottomAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, -16.0));
  v100[3] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v100, 4));
  objc_msgSend(v95, "addObjectsFromArray:", v20);

  v21 = objc_opt_new(ContainerHeaderView);
  -[ContainerHeaderView setTranslatesAutoresizingMaskIntoConstraints:](v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v22) = 1148846080;
  -[ContainerHeaderView setContentCompressionResistancePriority:forAxis:](v21, "setContentCompressionResistancePriority:forAxis:", 1, v22);
  v94 = v8;
  -[ContainerHeaderView setTitleView:](v21, "setTitleView:", v8);
  -[ContainerHeaderView setDelegate:](v21, "setDelegate:", self);
  -[ContainerHeaderView setHairLineAlpha:](v21, "setHairLineAlpha:", 0.0);
  -[ContainerHeaderView setAccessibilityIdentifier:](v21, "setAccessibilityIdentifier:", CFSTR("NavCategoryListHeader"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  objc_msgSend(v23, "addSubview:", v21);

  v85 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView topAnchor](v21, "topAnchor"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "topAnchor"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "constraintEqualToAnchor:", v82));
  v99[0] = v79;
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView leadingAnchor](v21, "leadingAnchor"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "leadingAnchor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "constraintEqualToAnchor:", v73));
  v99[1] = v71;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView trailingAnchor](v21, "trailingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "trailingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v26));
  v99[2] = v27;
  v91 = v21;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView bottomAnchor](v21, "bottomAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "bottomAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v30));
  v99[3] = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v99, 4));
  objc_msgSend(v95, "addObjectsFromArray:", v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryListViewController searchHomeViewController](self, "searchHomeViewController"));
  if (v33)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryListViewController searchHomeViewController](self, "searchHomeViewController"));
    -[NavCategoryListViewController addChildViewController:](self, "addChildViewController:", v34);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryListViewController searchHomeViewController](self, "searchHomeViewController"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "view"));

    objc_msgSend(v36, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    objc_msgSend(v37, "addSubview:", v36);

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryListViewController searchHomeViewController](self, "searchHomeViewController"));
    objc_msgSend(v38, "didMoveToParentViewController:", self);

    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "leadingAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "leadingAnchor"));
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:"));
    v98[0] = v86;
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "trailingAnchor"));
    v80 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v83 = v41;
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "trailingAnchor"));
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:"));
    v98[1] = v76;
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "topAnchor"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v74 = v42;
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "topAnchor"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:"));
    v98[2] = v69;
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "bottomAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "bottomAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v45));
    v98[3] = v46;
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v98, 4));
    v48 = v95;
    objc_msgSend(v95, "addObjectsFromArray:", v47);
  }
  else
  {
    v49 = (UITableView *)objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    tableView = self->_tableView;
    self->_tableView = v49;

    -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
    -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
    -[UITableView setSeparatorInset:](self->_tableView, "setSeparatorInset:", 0.0, 76.0, 0.0, 16.0);
    -[UITableView _setTopPadding:](self->_tableView, "_setTopPadding:", 0.0);
    -[UITableView _setBottomPadding:](self->_tableView, "_setBottomPadding:", 0.0);
    -[UITableView setSectionHeaderHeight:](self->_tableView, "setSectionHeaderHeight:", 0.0);
    -[UITableView setSectionFooterHeight:](self->_tableView, "setSectionFooterHeight:", 16.0);
    -[UITableView setAlwaysBounceVertical:](self->_tableView, "setAlwaysBounceVertical:", 0);
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UITableView setBackgroundColor:](self->_tableView, "setBackgroundColor:", v51);

    -[UITableView setLayoutMargins:](self->_tableView, "setLayoutMargins:", 0.0, 16.0, 0.0, 16.0);
    v52 = self->_tableView;
    v53 = objc_opt_class(NavCategoryCell);
    v54 = (objc_class *)objc_opt_class(NavCategoryCell);
    v55 = NSStringFromClass(v54);
    v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
    -[UITableView registerClass:forCellReuseIdentifier:](v52, "registerClass:forCellReuseIdentifier:", v53, v56);

    v57 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("NavTraySeparatorColor")));
    -[UITableView setSeparatorColor:](self->_tableView, "setSeparatorColor:", v57);

    -[UITableView setAccessibilityIdentifier:](self->_tableView, "setAccessibilityIdentifier:", CFSTR("NavCategoryListTableView"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    objc_msgSend(v58, "addSubview:", self->_tableView);

    v68 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryListViewController tableView](self, "tableView"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "leadingAnchor"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "leadingAnchor"));
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:"));
    v97[0] = v86;
    v83 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryListViewController tableView](self, "tableView"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "trailingAnchor"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v80 = v59;
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "trailingAnchor"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToAnchor:"));
    v97[1] = v74;
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryListViewController tableView](self, "tableView"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "topAnchor"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "topAnchor"));
    v70 = v60;
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:", v43));
    v97[2] = v44;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryListViewController tableView](self, "tableView"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "bottomAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "bottomAnchor"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v61));
    v97[3] = v62;
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v97, 4));
    v48 = v95;
    objc_msgSend(v95, "addObjectsFromArray:", v63);

    v36 = v68;
    v39 = v66;

    v40 = v67;
  }

  v64 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryListViewController view](self, "view"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  objc_msgSend(v64, "bringSubviewToFront:", v65);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v48);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NavCategoryListViewController;
  v4 = a3;
  -[MapsThemeViewController traitCollectionDidChange:](&v10, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryListViewController traitCollection](self, "traitCollection", v10.receiver, v10.super_class));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));

  if (v6 != v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryListViewController tableView](self, "tableView"));
    objc_msgSend(v8, "reloadData");

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v9, "updateHeightForCurrentLayoutAnimated:", 1);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NavCategoryListViewController;
  -[ContaineeViewController viewWillAppear:](&v7, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v4, "setHideGrabber:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryListViewController searchHomeViewController](self, "searchHomeViewController"));
  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryListViewController tableView](self, "tableView"));
    objc_msgSend(v6, "reloadData");

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NavCategoryListViewController;
  -[ContaineeViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryListViewController searchHomeViewController](self, "searchHomeViewController"));

  if (!v4)
    -[NavSARAPIController cancelFetchingSARCategories](self->_apiController, "cancelFetchingSARCategories");
}

- (void)willBecomeCurrent:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NavCategoryListViewController;
  -[ContaineeViewController willBecomeCurrent:](&v9, "willBecomeCurrent:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryListViewController searchHomeViewController](self, "searchHomeViewController"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryListViewController searchHomeViewController](self, "searchHomeViewController"));
    objc_msgSend(v6, "cleanSearch");

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryListViewController searchHomeViewController](self, "searchHomeViewController"));
    objc_msgSend(v7, "willBecomeCurrent:", v3);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryListViewController searchHomeViewController](self, "searchHomeViewController"));
    objc_msgSend(v8, "searchBarBecomeFirstResponder");

  }
}

- (void)willBecomeCurrentByGesture
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NavCategoryListViewController;
  -[ContaineeViewController willBecomeCurrentByGesture](&v5, "willBecomeCurrentByGesture");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryListViewController searchHomeViewController](self, "searchHomeViewController"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryListViewController searchHomeViewController](self, "searchHomeViewController"));
    objc_msgSend(v4, "willBecomeCurrentByGesture");

  }
}

- (void)didBecomeCurrent
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NavCategoryListViewController;
  -[ContaineeViewController didBecomeCurrent](&v5, "didBecomeCurrent");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryListViewController searchHomeViewController](self, "searchHomeViewController"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryListViewController searchHomeViewController](self, "searchHomeViewController"));
    objc_msgSend(v4, "didBecomeCurrent");

  }
}

- (void)willResignCurrent:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NavCategoryListViewController;
  -[ContaineeViewController willResignCurrent:](&v7, "willResignCurrent:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryListViewController searchHomeViewController](self, "searchHomeViewController"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryListViewController searchHomeViewController](self, "searchHomeViewController"));
    objc_msgSend(v6, "willResignCurrent:", v3);

  }
}

- (void)didResignCurrent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryListViewController searchHomeViewController](self, "searchHomeViewController"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryListViewController searchHomeViewController](self, "searchHomeViewController"));
    objc_msgSend(v4, "cleanSearch");

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryListViewController searchHomeViewController](self, "searchHomeViewController"));
    objc_msgSend(v5, "didResignCurrent");

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryListViewController searchHomeViewController](self, "searchHomeViewController"));
    objc_msgSend(v6, "endEditing");

  }
  v7.receiver = self;
  v7.super_class = (Class)NavCategoryListViewController;
  -[ContaineeViewController didResignCurrent](&v7, "didResignCurrent");
}

- (double)heightForLayout:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  id v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  objc_super v24;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryListViewController searchHomeViewController](self, "searchHomeViewController"));

  if (!v5)
  {
    if (a3 == 1)
    {
      -[ContaineeViewController headerHeight](self, "headerHeight");
      v19 = v18;
    }
    else
    {
      v7 = -1.0;
      if (a3 != 2)
        return v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryListViewController tableView](self, "tableView"));
      v10 = (uint64_t)objc_msgSend(v9, "numberOfRowsInSection:", 0);

      if (v10 < 1)
      {
        v12 = 0.0;
      }
      else
      {
        v11 = 0;
        v12 = 0.0;
        do
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryListViewController tableView](self, "tableView"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v11, 0));
          -[NavCategoryListViewController tableView:heightForRowAtIndexPath:](self, "tableView:heightForRowAtIndexPath:", v13, v14);
          v12 = v12 + v15;

          ++v11;
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryListViewController tableView](self, "tableView"));
          v17 = objc_msgSend(v16, "numberOfRowsInSection:", 0);

        }
        while (v11 < (uint64_t)v17);
      }
      -[ContaineeViewController headerHeight](self, "headerHeight");
      v19 = v12 + v20 + 16.0;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v21, "bottomSafeOffset");
    v7 = v19 + v22;

    return v7;
  }
  v6 = sub_1002A8AA0(self);
  if (a3 != 1 || (v7 = -1.0, v6 != 5))
  {
    v24.receiver = self;
    v24.super_class = (Class)NavCategoryListViewController;
    -[ContaineeViewController heightForLayout:](&v24, "heightForLayout:", a3);
    return v8;
  }
  return v7;
}

- (void)didDismissByGesture
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v2, "captureUserAction:onTarget:eventValue:", 4, 59, 0);

}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  void *v5;
  id v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryListViewController categoryListDelegate](self, "categoryListDelegate", a3, a4));
  objc_msgSend(v5, "dismissCategoryList:", self);

  v6 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v6, "captureUserAction:onTarget:eventValue:", 4, 59, 0);

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

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryListViewController categories](self, "categories", a3, a4));
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
  v8 = (objc_class *)objc_opt_class(NavCategoryCell);
  v9 = NSStringFromClass(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryListViewController categories](self, "categories"));
  v13 = objc_msgSend(v6, "row");

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", v13));
  objc_msgSend(v11, "setCategory:", v14);

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
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryListViewController categories](self, "categories"));
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
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryListViewController tableView](self, "tableView"));
  objc_msgSend(v20, "layoutMargins");
  v22 = Width - v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryListViewController tableView](self, "tableView"));
  objc_msgSend(v23, "layoutMargins");
  v25 = v22 - v24;

  +[NavCategoryCell heightForCellWithCategory:width:](NavCategoryCell, "heightForCellWithCategory:width:", v10, v25);
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
  id v11;

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryListViewController categories](self, "categories"));
  v8 = objc_msgSend(v6, "row");

  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v8));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryListViewController categories](self, "categories"));
  +[SARAnalytics captureSelectCategory:fromDisplayedCategories:isAddStopTray:](SARAnalytics, "captureSelectCategory:fromDisplayedCategories:isAddStopTray:", v11, v9, 1);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavCategoryListViewController categoryListDelegate](self, "categoryListDelegate"));
  objc_msgSend(v10, "categoryList:selectedSearchCategory:", self, v11);

}

- (NavCategoryListViewControllerDelegate)categoryListDelegate
{
  return (NavCategoryListViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_categoryListDelegate);
}

- (NavSARAPIController)apiController
{
  return self->_apiController;
}

- (void)setApiController:(id)a3
{
  objc_storeStrong((id *)&self->_apiController, a3);
}

- (NSArray)categories
{
  return self->_categories;
}

- (void)setCategories:(id)a3
{
  objc_storeStrong((id *)&self->_categories, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (SearchViewController)searchHomeViewController
{
  return self->_searchHomeViewController;
}

- (void)setSearchHomeViewController:(id)a3
{
  objc_storeStrong((id *)&self->_searchHomeViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchHomeViewController, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_apiController, 0);
  objc_destroyWeak((id *)&self->_categoryListDelegate);
}

@end
