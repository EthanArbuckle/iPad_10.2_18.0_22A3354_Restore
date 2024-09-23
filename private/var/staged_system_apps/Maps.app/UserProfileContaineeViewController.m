@implementation UserProfileContaineeViewController

- (UserProfileContaineeViewController)initWithAccount:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  UserProfileContaineeViewController *v9;
  UserProfileContaineeViewController *v10;
  UserProfileCollectionViewController *v11;
  UserProfileCollectionViewController *contentViewController;
  UserProfileHeaderView *v13;
  UserProfileHeaderView *userProfileHeaderView;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)UserProfileContaineeViewController;
  v9 = -[UserProfileContaineeViewController initWithNibName:bundle:](&v16, "initWithNibName:bundle:", 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    v11 = -[UserProfileCollectionViewController initWithAccount:contentViewDelegate:]([UserProfileCollectionViewController alloc], "initWithAccount:contentViewDelegate:", v10->_account, v10);
    contentViewController = v10->_contentViewController;
    v10->_contentViewController = v11;

    v13 = -[UserProfileHeaderView initWithFrame:]([UserProfileHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    userProfileHeaderView = v10->_userProfileHeaderView;
    v10->_userProfileHeaderView = v13;

    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UserProfileContaineeViewController;
  -[ContaineeViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UserInformationManager sharedInstance](UserInformationManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "observers"));
  objc_msgSend(v4, "registerObserver:", self);

  -[UserProfileContaineeViewController setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("UserProfileView"));
  -[UserProfileContaineeViewController _retrieveUserInformation](self, "_retrieveUserInformation");
  -[UserProfileContaineeViewController _setupViews](self, "_setupViews");
  -[UserProfileContaineeViewController _setupConstraints](self, "_setupConstraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UserInformationManager sharedInstance](UserInformationManager, "sharedInstance"));
  +[MapsAnalyticStateProvider setUserProfileUserIsLoggedIntoICloud:](MapsAnalyticStateProvider, "setUserProfileUserIsLoggedIntoICloud:", objc_msgSend(v5, "loggedIn"));

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UserProfileContaineeViewController;
  -[UserProfileContaineeViewController viewDidAppear:](&v3, "viewDidAppear:", a3);
}

- (void)_setupViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UserProfileCollectionViewController *contentViewController;
  UserProfileCollectionViewController *v12;
  UserProfileCollectionViewController *v13;
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
  ContainerHeaderView *v34;
  ContainerHeaderView *headerView;
  double v36;
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
  _QWORD v54[4];
  _QWORD v55[4];

  if (sub_1002A8AA0(self) == 5)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v3, "setAllowResizeInFloatingStyle:", 1);

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v4, "setPresentedModally:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v5, "setDefaultContaineeLayout:", 5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v6, "setTakesAvailableHeight:", 1);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v7, "setHideGrabber:", 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v8, "setUseDefaultLayoutWhenCalculatingBottomInsetForFloatingControls:", 1);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileContaineeViewController userProfileHeaderView](self, "userProfileHeaderView"));
  objc_msgSend(v9, "setDelegate:", self);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileContaineeViewController userProfileHeaderView](self, "userProfileHeaderView"));
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  contentViewController = self->_contentViewController;
  if (!contentViewController)
  {
    v12 = -[UserProfileCollectionViewController initWithAccount:contentViewDelegate:]([UserProfileCollectionViewController alloc], "initWithAccount:contentViewDelegate:", self->_account, self);
    v13 = self->_contentViewController;
    self->_contentViewController = v12;

    contentViewController = self->_contentViewController;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileCollectionViewController view](contentViewController, "view"));
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[UserProfileContaineeViewController addChildViewController:](self, "addChildViewController:", self->_contentViewController);
  -[UserProfileCollectionViewController didMoveToParentViewController:](self->_contentViewController, "didMoveToParentViewController:", self);
  if (sub_1002A8AA0(self) == 5)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileContaineeViewController userProfileHeaderView](self, "userProfileHeaderView"));
    objc_msgSend(v15, "addSubview:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileCollectionViewController view](self->_contentViewController, "view"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileContaineeViewController userProfileHeaderView](self, "userProfileHeaderView"));
    objc_msgSend(v17, "insertSubview:belowSubview:", v18, v19);

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileContaineeViewController userProfileHeaderView](self, "userProfileHeaderView"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "leadingAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "leadingAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:"));
    v55[0] = v52;
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileContaineeViewController userProfileHeaderView](self, "userProfileHeaderView"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "topAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
    v50 = v20;
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "topAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:"));
    v55[1] = v47;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileContaineeViewController userProfileHeaderView](self, "userProfileHeaderView"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "trailingAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v23));
    v55[2] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileContaineeViewController userProfileHeaderView](self, "userProfileHeaderView"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "bottomAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bottomAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v28));
    v55[3] = v29;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v55, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v30);

    v31 = v43;
    v32 = v45;

    v33 = v44;
  }
  else
  {
    v34 = -[ContainerHeaderView initWithCardButtonType:]([ContainerHeaderView alloc], "initWithCardButtonType:", 0);
    headerView = self->_headerView;
    self->_headerView = v34;

    -[ContainerHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self->_headerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v36) = 1148846080;
    -[ContainerHeaderView setContentCompressionResistancePriority:forAxis:](self->_headerView, "setContentCompressionResistancePriority:forAxis:", 1, v36);
    -[ContainerHeaderView setDelegate:](self->_headerView, "setDelegate:", self);
    -[ContainerHeaderView setHairLineAlpha:](self->_headerView, "setHairLineAlpha:", 0.0);
    -[ContainerHeaderView setHeaderSize:](self->_headerView, "setHeaderSize:", 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileContaineeViewController userProfileHeaderView](self, "userProfileHeaderView"));
    -[ContainerHeaderView setTitleView:](self->_headerView, "setTitleView:", v37);

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
    objc_msgSend(v38, "addSubview:", self->_headerView);

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileCollectionViewController view](self->_contentViewController, "view"));
    objc_msgSend(v39, "addSubview:", v40);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView leadingAnchor](self->_headerView, "leadingAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "leadingAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v33));
    v54[0] = v53;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView topAnchor](self->_headerView, "topAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
    v52 = v41;
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "topAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:"));
    v54[1] = v49;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView trailingAnchor](self->_headerView, "trailingAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
    v48 = v42;
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "trailingAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:"));
    v54[2] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView bottomAnchor](self->_headerView, "bottomAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bottomAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v24));
    v54[3] = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v54, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v26);
  }

}

- (void)_setupConstraints
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
  _QWORD v24[4];

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileCollectionViewController view](self->_contentViewController, "view"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "topAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v20));
  v24[0] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileCollectionViewController view](self->_contentViewController, "view"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "leadingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v15));
  v24[1] = v14;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileCollectionViewController view](self->_contentViewController, "view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:", v5));
  v24[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileCollectionViewController view](self->_contentViewController, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
  v24[3] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (void)_retrieveUserInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UserInformationManager sharedInstance](UserInformationManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userIcon"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileContaineeViewController userProfileHeaderView](self, "userProfileHeaderView"));
  objc_msgSend(v5, "setUserIcon:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UserInformationManager sharedInstance](UserInformationManager, "sharedInstance"));
  LODWORD(v4) = objc_msgSend(v6, "loggedIn");

  if ((_DWORD)v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UserInformationManager sharedInstance](UserInformationManager, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileContaineeViewController userProfileHeaderView](self, "userProfileHeaderView"));
    objc_msgSend(v9, "setUserName:", v8);

    v16 = (id)objc_claimAutoreleasedReturnValue(+[UserInformationManager sharedInstance](UserInformationManager, "sharedInstance"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "userEmail"));
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("[User Profile] Apple Account - logged out state"), CFSTR("localized string not found"), 0));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileContaineeViewController userProfileHeaderView](self, "userProfileHeaderView"));
    objc_msgSend(v13, "setUserName:", v12);

    v16 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("[User Profile] Sign in to your account - logged out state"), CFSTR("localized string not found"), 0));
  }
  v14 = (void *)v10;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileContaineeViewController userProfileHeaderView](self, "userProfileHeaderView"));
  objc_msgSend(v15, "setUserEmail:", v14);

}

- (double)heightForLayout:(unint64_t)a3
{
  void *v5;
  NSString *v6;
  _BOOL4 IsAccessibilityCategory;
  void *v8;
  double v9;
  double v10;
  double result;
  double v12;
  void *v13;
  unint64_t v14;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileContaineeViewController traitCollection](self, "traitCollection"));
  v6 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

  if (IsAccessibilityCategory)
  {
LABEL_2:
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v8, "availableHeight");
    v10 = v9;

    return v10;
  }
  if (sub_1002A8AA0(self) != 5)
  {
    if (a3 == 5 || (v10 = -1.0, a3 == 3))
    {
      -[UserProfileContaineeViewController _calculateHeight](self, "_calculateHeight");
      v10 = v12;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    v14 = (unint64_t)objc_msgSend(v13, "containerStyle");
    if (v14 <= 7 && ((1 << v14) & 0xE3) != 0)
    {

      return v10;
    }

    goto LABEL_2;
  }
  v10 = -1.0;
  if (a3 == 2)
  {
    -[UserProfileContaineeViewController _calculateHeight](self, "_calculateHeight");
    return result;
  }
  return v10;
}

- (double)_calculateHeight
{
  int64_t numberOfRows;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;

  numberOfRows = self->_numberOfRows;
  if (sub_1002A8AA0(self) == 5)
    v4 = 66.0;
  else
    -[ContainerHeaderView systemLayoutSizeFittingSize:](self->_headerView, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  v5 = (double)numberOfRows * 52.0 + 12.0 + -1.0;
  if (!numberOfRows)
    v5 = 271.0;
  v6 = v5 + v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v7, "bottomSafeOffset");
  v9 = v6 + v8;

  return v9;
}

- (void)headerViewLinkTapped:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=ROOT")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v3, "_maps_openURL:options:completionHandler:", v4, 0, 0);

  +[UserProfileAnalyticsManager captureICloudSignInTapAction](UserProfileAnalyticsManager, "captureICloudSignInTapAction");
}

- (void)handleDismissAction:(id)a3
{
  id v4;
  void *v5;
  id v6;
  objc_super v7;

  v4 = a3;
  if (sub_1002A8AA0(self) == 5)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    v6 = objc_msgSend(v5, "appKitBundleClass");

    objc_msgSend(v6, "dismissCurrentToolbarPopover");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UserProfileContaineeViewController;
    -[ContaineeViewController handleDismissAction:](&v7, "handleDismissAction:", v4);
  }
  +[UserProfileAnalyticsManager captureExitAccountTapAction](UserProfileAnalyticsManager, "captureExitAccountTapAction");

}

- (void)profileContentDidUpdate
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v3, "updateHeightForCurrentLayout");

  if (sub_1002A8AA0(self) == 5)
  {
    -[UserProfileContaineeViewController heightForLayout:](self, "heightForLayout:", 2);
    v5 = v4;
    if (-[UserProfileContaineeViewController isViewLoaded](self, "isViewLoaded"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileContaineeViewController view](self, "view"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "windowScene"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sizeRestrictions"));
      objc_msgSend(v9, "setMinimumSize:", 320.0, v5);

      v13 = (id)objc_claimAutoreleasedReturnValue(-[UserProfileContaineeViewController view](self, "view"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "window"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "windowScene"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sizeRestrictions"));
      objc_msgSend(v12, "setMaximumSize:", 320.0, v5);

    }
  }
}

- (void)userProfileLinkTapped:(id)a3 availableActions:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = objc_msgSend(a3, "userProfileLinkType");
  switch((unint64_t)v7)
  {
    case 0uLL:
      -[UserProfileContaineeViewController _proceedToLibrary](self, "_proceedToLibrary");
      break;
    case 1uLL:
      -[UserProfileContaineeViewController _proceedToFavorites](self, "_proceedToFavorites");
      break;
    case 2uLL:
      -[UserProfileContaineeViewController _proceedToMyGuides](self, "_proceedToMyGuides");
      break;
    case 3uLL:
      -[UserProfileContaineeViewController _proceedToReports](self, "_proceedToReports");
      break;
    case 4uLL:
      -[UserProfileContaineeViewController _proceedToRatings](self, "_proceedToRatings");
      break;
    case 5uLL:
      -[UserProfileContaineeViewController _proceedToVirtualGarage](self, "_proceedToVirtualGarage");
      break;
    case 6uLL:
      -[UserProfileContaineeViewController _proceedToTravelPreferences](self, "_proceedToTravelPreferences");
      break;
    case 7uLL:
      -[UserProfileContaineeViewController _proceedToOfflineMaps](self, "_proceedToOfflineMaps");
      break;
    default:
      break;
  }
  v8 = (id)objc_claimAutoreleasedReturnValue(+[UserInformationManager sharedInstance](UserInformationManager, "sharedInstance"));
  +[UserProfileAnalyticsManager captureTapActionWithUserProfileLinkType:availableActions:signedIntoICloud:](UserProfileAnalyticsManager, "captureTapActionWithUserProfileLinkType:availableActions:signedIntoICloud:", v7, v6, objc_msgSend(v8, "loggedIn"));

}

- (void)_proceedToLibrary
{
  id WeakRetained;
  char v4;
  id v5;

  if (sub_1002A8AA0(self) == 5)
    -[UserProfileContaineeViewController handleDismissAction:](self, "handleDismissAction:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_opt_respondsToSelector(WeakRetained, "viewControllerShowLibraryRootView:");

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v5, "viewControllerShowLibraryRootView:", self);

  }
}

- (void)_proceedToFavorites
{
  uint64_t v3;
  UserProfileContaineeDelegate **p_delegate;
  id WeakRetained;
  void *v6;
  char v7;
  char v8;
  id v9;

  v3 = sub_1002A8AA0(self);
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = WeakRetained;
  if (v3 == 5)
  {
    v7 = objc_opt_respondsToSelector(WeakRetained, "presentMacToolTipForLinkType:");

    if ((v7 & 1) == 0)
      return;
    v9 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v9, "presentMacToolTipForLinkType:", 1);
  }
  else
  {
    v8 = objc_opt_respondsToSelector(WeakRetained, "viewControllerShowMyShortcuts:");

    if ((v8 & 1) == 0)
      return;
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "viewControllerShowMyShortcuts:", self);
  }

}

- (void)_proceedToMyGuides
{
  UserProfileContaineeDelegate **p_delegate;
  id v4;
  char v5;
  void *v6;
  id v7;
  id WeakRetained;
  void *v9;
  char v10;
  id v11;
  uint64_t v12;
  id v13;

  if (sub_1002A8AA0(self) != 5)
  {
    v13 = (id)objc_claimAutoreleasedReturnValue(+[CollectionManager sharedManager](CollectionManager, "sharedManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "currentCollectionsForiOSHome"));
    v7 = objc_msgSend(v6, "count");

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = WeakRetained;
    if (v7)
    {
      v10 = objc_opt_respondsToSelector(WeakRetained, "viewControllerShowCollections:");

      if ((v10 & 1) == 0)
        goto LABEL_11;
      v11 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v11, "viewControllerShowCollections:", self);
    }
    else
    {
      v12 = objc_opt_respondsToSelector(WeakRetained, "viewController:createNewCollectionWithSession:");

      if ((v12 & 1) == 0)
        goto LABEL_11;
      v11 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v11, "viewController:createNewCollectionWithSession:", self, 0);
    }

    goto LABEL_11;
  }
  p_delegate = &self->_delegate;
  v4 = objc_loadWeakRetained((id *)p_delegate);
  v5 = objc_opt_respondsToSelector(v4, "presentMacToolTipForLinkType:");

  if ((v5 & 1) != 0)
  {
    v13 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v13, "presentMacToolTipForLinkType:", 2);
LABEL_11:

  }
}

- (void)_proceedToOfflineMaps
{
  UserProfileContaineeDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector(WeakRetained, "viewControllerShowOfflineMaps:");

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "viewControllerShowOfflineMaps:", self);

  }
}

- (void)_proceedToReports
{
  id WeakRetained;
  char v4;
  id v5;

  if (sub_1002A8AA0(self) == 5)
    -[UserProfileContaineeViewController handleDismissAction:](self, "handleDismissAction:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_opt_respondsToSelector(WeakRetained, "viewControllerShowReports:");

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v5, "viewControllerShowReports:", self);

  }
}

- (void)_proceedToRatings
{
  id WeakRetained;
  char v4;
  id v5;

  if (sub_1002A8AA0(self) == 5)
    -[UserProfileContaineeViewController handleDismissAction:](self, "handleDismissAction:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_opt_respondsToSelector(WeakRetained, "viewControllerPresentRatingsHistory:");

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v5, "viewControllerPresentRatingsHistory:", self);

  }
}

- (void)_proceedToVirtualGarage
{
  id WeakRetained;
  char v4;
  id v5;

  if (sub_1002A8AA0(self) == 5)
    -[UserProfileContaineeViewController handleDismissAction:](self, "handleDismissAction:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_opt_respondsToSelector(WeakRetained, "viewControllerPresentVirtualGarage:");

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v5, "viewControllerPresentVirtualGarage:", self);

  }
}

- (void)_proceedToTravelPreferences
{
  UserProfileContaineeDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector(WeakRetained, "viewControllerPresentUserProfilePreferences:withTabType:");

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "viewControllerPresentUserProfilePreferences:withTabType:", self, 1);

  }
}

- (void)userDataDidUpdate
{
  -[UserProfileContaineeViewController _retrieveUserInformation](self, "_retrieveUserInformation");
  -[UserProfileContaineeViewController _setupConstraints](self, "_setupConstraints");
}

- (int64_t)floatingControlsOptions
{
  return 51;
}

- (int64_t)numberOfRows
{
  return self->_numberOfRows;
}

- (void)setNumberOfRows:(int64_t)a3
{
  self->_numberOfRows = a3;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (UserProfileHeaderView)userProfileHeaderView
{
  return self->_userProfileHeaderView;
}

- (void)setUserProfileHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_userProfileHeaderView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userProfileHeaderView, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end
