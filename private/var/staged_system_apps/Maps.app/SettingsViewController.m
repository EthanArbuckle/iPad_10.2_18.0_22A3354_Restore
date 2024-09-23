@implementation SettingsViewController

- (id)tableViewController
{
  SettingsTableViewController *settingsTableViewController;
  SettingsTableViewController *v4;
  SettingsTableViewController *v5;
  void *v6;
  void *v7;
  void *v8;

  settingsTableViewController = self->_settingsTableViewController;
  if (!settingsTableViewController)
  {
    v4 = objc_alloc_init(SettingsTableViewController);
    v5 = self->_settingsTableViewController;
    self->_settingsTableViewController = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsViewController settingsController](self, "settingsController"));
    -[SettingsTableViewController setSettingsController:](self->_settingsTableViewController, "setSettingsController:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", self, "settingsTableViewControllerDidReloadData:", CFSTR("SettingsTableViewControllerDidReloadDataNotification"), 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "addObserver:selector:name:object:", self, "settingsTableViewControllerDidScroll:", CFSTR("SettingsTableViewControllerDidScrollNotification"), 0);

    settingsTableViewController = self->_settingsTableViewController;
  }
  return settingsTableViewController;
}

- (id)keyCommands
{
  void *v2;
  void *v3;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", UIKeyInputEscape, 0, "headerViewButtonTapped:buttonType:"));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));

  return v3;
}

- (void)loadView
{
  CardView *v3;
  CardView *cardView;
  objc_super v5;

  if (sub_1002A8AA0(self) == 5)
  {
    v5.receiver = self;
    v5.super_class = (Class)SettingsViewController;
    -[SettingsViewController loadView](&v5, "loadView");
  }
  else
  {
    v3 = -[CardView initAllowingBlurred:]([CardView alloc], "initAllowingBlurred:", 1);
    cardView = self->_cardView;
    self->_cardView = v3;

    -[CardView setHideGrabber:](self->_cardView, "setHideGrabber:", 1);
    -[SettingsViewController setView:](self, "setView:", self->_cardView);
  }
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  ContainerHeaderView *v10;
  ContainerHeaderView *headerView;
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
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)SettingsViewController;
  -[SettingsViewController viewDidLoad](&v24, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsViewController view](self, "view"));
  objc_msgSend(v5, "setPreservesSuperviewLayoutMargins:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsViewController view](self, "view"));
  objc_msgSend(v6, "setInsetsLayoutMarginsFromSafeArea:", 0);

  -[SettingsViewController setViewRespectsSystemMinimumLayoutMargins:](self, "setViewRespectsSystemMinimumLayoutMargins:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsViewController view](self, "view"));
  objc_msgSend(v7, "setAccessibilityIdentifier:", CFSTR("SettingsView"));

  -[SettingsViewController _updateMargins](self, "_updateMargins");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CardView contentView](self->_cardView, "contentView"));
  if (sub_1002A8AA0(self) == 5)
  {
    v9 = v8;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsViewController view](self, "view"));
  }
  else
  {
    v10 = -[ContainerHeaderView initWithRespectSafeArea:]([ContainerHeaderView alloc], "initWithRespectSafeArea:", 1);
    headerView = self->_headerView;
    self->_headerView = v10;

    -[ContainerHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self->_headerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[ContainerHeaderView setAccessibilityIdentifier:](self->_headerView, "setAccessibilityIdentifier:", CFSTR("SettingsHeaderView"));
    -[ContainerHeaderView setDelegate:](self->_headerView, "setDelegate:", self);
    -[ContainerHeaderView setHairLineAlpha:](self->_headerView, "setHairLineAlpha:", 0.0);
    -[ContainerHeaderView setShouldCenterButtonVertically:](self->_headerView, "setShouldCenterButtonVertically:", 1);
    -[ContainerHeaderView setVerticalAlignmentOffset:](self->_headerView, "setVerticalAlignmentOffset:", 4.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("MAP_MODE_AND_SETTINGS_TITLE"), CFSTR("localized string not found"), 0));
    -[ContainerHeaderView setTitle:](self->_headerView, "setTitle:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CardView contentView](self->_cardView, "contentView"));
    objc_msgSend(v14, "addSubview:", self->_headerView);

    v9 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_handleDebugMenuTriggerTap:");
    objc_msgSend(v9, "setNumberOfTapsRequired:", 2);
    v15 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_handleDebugMenuTriggerTap:");
    objc_msgSend(v15, "setNumberOfTapsRequired:", 1);
    objc_msgSend(v9, "setNumberOfTouchesRequired:", 1);
    objc_msgSend(v15, "setNumberOfTouchesRequired:", 2);
    -[ContainerHeaderView addGestureRecognizer:](self->_headerView, "addGestureRecognizer:", v9);
    -[ContainerHeaderView addGestureRecognizer:](self->_headerView, "addGestureRecognizer:", v15);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsViewController tableViewController](self, "tableViewController"));
  -[SettingsViewController addChildViewController:](self, "addChildViewController:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsViewController tableViewController](self, "tableViewController"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "view"));
  objc_msgSend(v8, "addSubview:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsViewController tableViewController](self, "tableViewController"));
  objc_msgSend(v19, "didMoveToParentViewController:", self);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsViewController tableViewController](self, "tableViewController"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "view"));
  objc_msgSend(v21, "setFrame:", 0.0, 0.0, 422.0, 1000.0);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsViewController tableViewController](self, "tableViewController"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "view"));
  objc_msgSend(v23, "layoutIfNeeded");

  -[SettingsViewController setupConstraints](self, "setupConstraints");
  -[SettingsViewController _updateCompactVerticalLayout](self, "_updateCompactVerticalLayout");
  -[SettingsViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SettingsViewController;
  -[MapsThemeViewController traitCollectionDidChange:](&v4, "traitCollectionDidChange:", a3);
  -[SettingsViewController _updateMargins](self, "_updateMargins");
  -[SettingsViewController _updateCompactVerticalLayout](self, "_updateCompactVerticalLayout");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)SettingsViewController;
  v7 = a4;
  -[SettingsViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1008AC0D8;
  v8[3] = &unk_1011AEDC8;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

- (int64_t)_adaptivePresentationStyle
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_settingsController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "chrome"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "traitCollection"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsViewController presentationController](self, "presentationController"));
  v7 = objc_msgSend(v6, "adaptivePresentationStyleForTraitCollection:", v5);

  return (int64_t)v7;
}

- (void)_updateMargins
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  id v13;

  if (sub_1002A8AA0(self) == 5)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsViewController view](self, "view"));
    v4 = 0.0;
    v5 = 0.0;
    v6 = 0.0;
    v13 = v3;
  }
  else
  {
    v7 = 0.0;
    if ((id)-[SettingsViewController _adaptivePresentationStyle](self, "_adaptivePresentationStyle") == (id)2)
      v8 = 4.0;
    else
      v8 = 0.0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsViewController view](self, "view"));
    objc_msgSend(v9, "safeAreaInsets");
    if (20.0 - v10 >= 0.0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsViewController view](self, "view", 20.0 - v10));
      objc_msgSend(v11, "safeAreaInsets");
      v7 = 20.0 - v12;

    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsViewController view](self, "view"));
    v13 = v3;
    v4 = v8;
    v5 = v7;
    v6 = v8;
  }
  objc_msgSend(v3, "setLayoutMargins:", 0.0, v4, v5, v6);

}

- (void)_updateCompactVerticalLayout
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[SettingsViewController traitCollection](self, "traitCollection"));
  v3 = objc_msgSend(v5, "verticalSizeClass") == (id)1
    && (id)-[SettingsViewController _adaptivePresentationStyle](self, "_adaptivePresentationStyle") != (id)2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsViewController tableViewController](self, "tableViewController"));
  objc_msgSend(v4, "setUseCompactVerticalLayout:", v3);

}

- (void)_clearTableIfNeeded
{
  void *v3;
  SettingsTableViewController *settingsTableViewController;

  if (self->_settingsTableViewController)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "removeObserver:name:object:", self, NSUserDefaultsDidChangeNotification, 0);

    settingsTableViewController = self->_settingsTableViewController;
    self->_settingsTableViewController = 0;

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SettingsViewController;
  -[SettingsViewController viewWillAppear:](&v7, "viewWillAppear:", a3);
  -[SettingsViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  -[CardView setLayoutStyle:](self->_cardView, "setLayoutStyle:", 1);
  -[SettingsViewController _updateCompactVerticalLayout](self, "_updateCompactVerticalLayout");
  -[SettingsViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsViewController settingsController](self, "settingsController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "settingsTipController"));
  objc_msgSend(v5, "settingsOpened");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("SettingsViewControllerWillAppearNotification"), self);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SettingsViewController;
  -[SettingsViewController viewDidDisappear:](&v5, "viewDidDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("SettingsViewControllerDidDisappearNotification"), self);

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SettingsViewController;
  -[SettingsViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  -[SettingsViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
}

- (void)viewSafeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SettingsViewController;
  -[SettingsViewController viewSafeAreaInsetsDidChange](&v3, "viewSafeAreaInsetsDidChange");
  -[SettingsViewController _updateMargins](self, "_updateMargins");
  -[SettingsViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
}

- (void)_updatePreferredContentSize
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;

  -[ContainerHeaderView systemLayoutSizeFittingSize:](self->_headerView, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsViewController tableViewController](self, "tableViewController"));
  objc_msgSend(v5, "desiredHeight");
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsViewController view](self, "view"));
  objc_msgSend(v8, "layoutMargins");
  v10 = v9;

  v11 = sub_1002A8AA0(self);
  if (v11 == 5)
    v12 = v4;
  else
    v12 = v10;
  -[SettingsViewController setPreferredContentSize:](self, "setPreferredContentSize:", dbl_100E3C540[v11 == 5], v4 + v7 + v12);
}

- (void)settingsTableViewControllerDidScroll:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contentOffset")));
  objc_msgSend(v5, "pointValue");
  v7 = v6;

  v8 = 1.0;
  if (v7 <= 1.0)
    v8 = 0.0;
  -[ContainerHeaderView setHairLineAlpha:](self->_headerView, "setHairLineAlpha:", v8);
}

- (void)settingsTableViewControllerDidReloadData:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsViewController tableViewController](self, "tableViewController", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v5, "layoutIfNeeded");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsViewController navigationController](self, "navigationController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "superview"));
  objc_msgSend(v8, "setNeedsLayout");

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1008AC74C;
  v9[3] = &unk_1011AC860;
  v9[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v9, 0.25);
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
  uint64_t v30;
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
  _QWORD v45[4];
  void *v46;
  _QWORD v47[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsViewController tableViewController](self, "tableViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));

  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsViewController view](self, "view"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "layoutMarginsGuide"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "leadingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v35));
  v47[0] = v33;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsViewController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layoutMarginsGuide"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v8));
  v47[1] = v9;
  v44 = v4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsViewController view](self, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v12));
  v47[2] = v13;
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v47, 3));

  if (sub_1002A8AA0(self) == 5)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "topAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsViewController view](self, "view"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "topAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v16));
    v46 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v46, 1));
    v19 = v43;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "arrayByAddingObjectsFromArray:", v18));
  }
  else
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView leadingAnchor](self->_headerView, "leadingAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsViewController view](self, "view"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "layoutMarginsGuide"));
    v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "leadingAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v30));
    v45[0] = v18;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView trailingAnchor](self->_headerView, "trailingAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsViewController view](self, "view"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "layoutMarginsGuide"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "trailingAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v31));
    v45[1] = v29;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView topAnchor](self->_headerView, "topAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsViewController view](self, "view"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "topAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v22));
    v45[2] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "topAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView bottomAnchor](self->_headerView, "bottomAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v25));
    v45[3] = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v45, 4));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "arrayByAddingObjectsFromArray:", v27));

    v15 = v32;
    v17 = (void *)v30;

    v16 = v40;
    v14 = v38;

    v19 = v36;
  }

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v20);
}

- (int64_t)preferredStatusBarStyle
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsViewController theme](self, "theme"));
  v3 = objc_msgSend(v2, "statusBarStyle");

  return (int64_t)v3;
}

- (void)updateTheme
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SettingsViewController;
  -[MapsThemeViewController updateTheme](&v3, "updateTheme");
  -[SettingsViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  -[CardView updateTheme](self->_cardView, "updateTheme");
  -[ContainerHeaderView updateTheme](self->_headerView, "updateTheme");
}

- (void)dismissCustomPresentationContainee
{
  void *v3;
  void (**v4)(void);
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsViewController dismissSettingsViewControllerHandler](self, "dismissSettingsViewControllerHandler"));

  if (v3)
  {
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[SettingsViewController dismissSettingsViewControllerHandler](self, "dismissSettingsViewControllerHandler"));
    v4[2]();

  }
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsViewController presentingViewController](self, "presentingViewController"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1008ACD98;
  v6[3] = &unk_1011AD260;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_handleDebugMenuTriggerTap:(id)a3
{
  id v4;

  if (objc_msgSend(a3, "state") == (id)3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[SettingsViewController _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate"));
    objc_msgSend(v4, "presentMapsDebugControllerIfEnabled");

  }
}

- (id)dismissSettingsViewControllerHandler
{
  return self->_dismissSettingsViewControllerHandler;
}

- (void)setDismissSettingsViewControllerHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (SettingsController)settingsController
{
  return (SettingsController *)objc_loadWeakRetained((id *)&self->_settingsController);
}

- (void)setSettingsController:(id)a3
{
  objc_storeWeak((id *)&self->_settingsController, a3);
}

- (CardView)cardView
{
  return self->_cardView;
}

- (void)setCardView:(id)a3
{
  objc_storeStrong((id *)&self->_cardView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardView, 0);
  objc_destroyWeak((id *)&self->_settingsController);
  objc_storeStrong(&self->_dismissSettingsViewControllerHandler, 0);
  objc_storeStrong((id *)&self->_settingsTableViewController, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end
