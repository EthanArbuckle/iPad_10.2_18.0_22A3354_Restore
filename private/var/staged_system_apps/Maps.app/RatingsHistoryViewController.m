@implementation RatingsHistoryViewController

- (RatingsHistoryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  RatingsHistoryViewController *v4;
  RatingsHistoryViewController *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)RatingsHistoryViewController;
  v4 = -[RatingsHistoryViewController initWithNibName:bundle:](&v12, "initWithNibName:bundle:", 0, 0);
  v5 = v4;
  if (v4)
  {
    v6 = (objc_class *)objc_opt_class(v4);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[RatingsHistoryViewController setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v5, "cardPresentationController"));
    objc_msgSend(v9, "setPresentedModally:", 1);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v5, "cardPresentationController"));
    objc_msgSend(v10, "setTakesAvailableHeight:", 1);

  }
  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  ContainerHeaderView *v8;
  void *v9;
  void *v10;
  void *v11;
  ContainerHeaderView *titleHeaderView;
  ContainerHeaderView *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)RatingsHistoryViewController;
  -[ContaineeViewController viewDidLoad](&v15, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RatingsHistoryViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("RatingsHistoryView"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RatingsHistoryViewController view](self, "view"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v7 = sub_1002A8AA0(self) != 5;
  v8 = -[ContainerHeaderView initWithFrame:]([ContainerHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[ContainerHeaderView setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[ContainerHeaderView setDelegate:](v8, "setDelegate:", self);
  -[ContainerHeaderView setHeaderSize:](v8, "setHeaderSize:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("[User Profile] Ratings and Photos"), CFSTR("localized string not found"), 0));
  -[ContainerHeaderView setTitle:](v8, "setTitle:", v10);

  -[ContainerHeaderView setHairLineAlpha:](v8, "setHairLineAlpha:", 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[ContainerHeaderView setBackgroundColor:](v8, "setBackgroundColor:", v11);

  objc_msgSend(v6, "addSubview:", v8);
  titleHeaderView = self->_titleHeaderView;
  self->_titleHeaderView = v8;
  v13 = v8;

  -[RatingsHistoryViewController _setupTitleHeaderConstraints](self, "_setupTitleHeaderConstraints");
  -[RatingsHistoryViewController _updateContent](self, "_updateContent");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v14, "addObserver:selector:name:object:", self, "_updateContent", CFSTR("UsingOfflineMapsStateChangedNotification"), 0);

}

- (void)_updateContent
{
  UICollectionView *collectionView;
  UIView *emptyStateView;
  ErrorModeView *errorView;
  void *v6;
  unsigned int v7;
  void *v8;
  unsigned int v9;

  -[UICollectionView removeFromSuperview](self->_collectionView, "removeFromSuperview");
  collectionView = self->_collectionView;
  self->_collectionView = 0;

  -[UIView removeFromSuperview](self->_emptyStateView, "removeFromSuperview");
  emptyStateView = self->_emptyStateView;
  self->_emptyStateView = 0;

  -[ErrorModeView removeFromSuperview](self->_errorView, "removeFromSuperview");
  errorView = self->_errorView;
  self->_errorView = 0;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v7 = objc_msgSend(v6, "isUsingOfflineMaps");

  if (v7)
  {
    -[RatingsHistoryViewController _createOfflineStateLayout](self, "_createOfflineStateLayout");
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UserProfileLinkRatingsProvider sharedInstance](UserProfileLinkRatingsProvider, "sharedInstance"));
    v9 = objc_msgSend(v8, "hasRatings");

    if (v9)
    {
      -[RatingsHistoryViewController _createCollectionViewLayout](self, "_createCollectionViewLayout");
      -[RatingsHistoryViewController _updateHeaderHairline](self, "_updateHeaderHairline");
      -[RatingsHistoryViewController _setupCollectionViewConstraints](self, "_setupCollectionViewConstraints");
    }
    else
    {
      -[RatingsHistoryViewController _createEmptyStateLayout](self, "_createEmptyStateLayout");
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RatingsHistoryViewController;
  -[ContaineeViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[RatingsHistoryViewController loadDataSource](self, "loadDataSource");
  -[RatingsHistoryViewController _updateHeaderHairline](self, "_updateHeaderHairline");
}

- (void)_setupTitleHeaderConstraints
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
  _QWORD v20[4];

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView topAnchor](self->_titleHeaderView, "topAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "topAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v17));
  v20[0] = v16;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView leadingAnchor](self->_titleHeaderView, "leadingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "leadingAnchor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v13));
  v20[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView trailingAnchor](self->_titleHeaderView, "trailingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v6));
  v20[2] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView bottomAnchor](self->_titleHeaderView, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
  v20[3] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (void)_setupCollectionViewConstraints
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
  _QWORD v20[4];

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView topAnchor](self->_collectionView, "topAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "topAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v17));
  v20[0] = v16;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView leadingAnchor](self->_collectionView, "leadingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "leadingAnchor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v13));
  v20[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView trailingAnchor](self->_collectionView, "trailingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v6));
  v20[2] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView bottomAnchor](self->_collectionView, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:constant:", v10, -8.0));
  v20[3] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (void)_createCollectionViewLayout
{
  id v3;
  id v4;
  void *v5;
  UICollectionView *v6;
  void *v7;
  UICollectionView *collectionView;
  UICollectionView *v9;
  void *v10;
  UICollectionView *v11;
  uint64_t v12;
  void *v13;
  UICollectionView *v14;
  uint64_t v15;
  void *v16;
  UICollectionView *v17;
  uint64_t v18;
  objc_class *v19;
  NSString *v20;
  void *v21;
  _QWORD v22[5];

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100B6D048;
  v22[3] = &unk_1011AFFC0;
  v22[4] = self;
  v3 = objc_msgSend(objc_alloc((Class)UICollectionViewCompositionalLayout), "initWithSectionProvider:", v22);
  v4 = objc_alloc((Class)UICollectionView);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RatingsHistoryViewController view](self, "view"));
  objc_msgSend(v5, "bounds");
  v6 = (UICollectionView *)objc_msgSend(v4, "initWithFrame:collectionViewLayout:", v3);

  -[UICollectionView setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UICollectionView setBackgroundColor:](v6, "setBackgroundColor:", v7);

  -[UICollectionView setAutoresizingMask:](v6, "setAutoresizingMask:", 18);
  collectionView = self->_collectionView;
  self->_collectionView = v6;
  v9 = v6;

  -[UICollectionView setAccessibilityIdentifier:](self->_collectionView, "setAccessibilityIdentifier:", CFSTR("RatingsHistoryCollectionView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  objc_msgSend(v10, "addSubview:", v9);

  v11 = self->_collectionView;
  v12 = objc_opt_class(TwoLinesCollectionViewInsetGroupedListCell);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLineCollectionViewListCell identifier](TwoLinesCollectionViewInsetGroupedListCell, "identifier"));
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v11, "registerClass:forCellWithReuseIdentifier:", v12, v13);

  v14 = self->_collectionView;
  v15 = objc_opt_class(SectionHeaderCollectionReusableView);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[SectionHeaderCollectionReusableView reuseIdentifier](SectionHeaderCollectionReusableView, "reuseIdentifier"));
  -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v14, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v15, UICollectionElementKindSectionHeader, v16);

  v17 = self->_collectionView;
  v18 = objc_opt_class(UserProfileSectionFooterView);
  v19 = (objc_class *)objc_opt_class(UserProfileSectionFooterView);
  v20 = NSStringFromClass(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v17, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v18, UICollectionElementKindSectionFooter, v21);

}

- (void)_createEmptyStateLayout
{
  _TtC4Maps14EmptyStateView *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const __CFString *v10;
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
  _QWORD v25[3];

  v3 = -[EmptyStateView initWithFrame:]([_TtC4Maps14EmptyStateView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  objc_msgSend(v4, "addSubview:", v3);

  objc_storeStrong((id *)&self->_emptyStateView, v3);
  -[EmptyStateView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("RatingsHistoryEmptyStateView"));
  -[EmptyStateView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("[User Profile - Ratings] No Ratings or Photos"), CFSTR("localized string not found"), 0));
  -[EmptyStateView setTitle:](v3, "setTitle:", v6);

  v7 = sub_1002A8AA0(self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = v8;
  if (v7 == 5)
    v10 = CFSTR("[User Profile - Ratings, macOS] Rate places and add photos by clicking a place on the map and then clicking \"Rate This Place\" or \"Add Photos.\");
  else
    v10 = CFSTR("[User Profile - Ratings] Rate places and add photos by tapping a place on the map and then tapping \"Rate This Place\" or \"Add Photos.\");
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v10, CFSTR("localized string not found"), 0));

  -[EmptyStateView setSubtitle:](v3, "setSubtitle:", v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[EmptyStateView centerYAnchor](v3, "centerYAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "centerYAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v21));
  v25[0] = v20;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[EmptyStateView leadingAnchor](v3, "leadingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "leadingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13, 16.0));
  v25[1] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[EmptyStateView trailingAnchor](v3, "trailingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trailingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17, -16.0));
  v25[2] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 3));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v19);

}

- (void)_createOfflineStateLayout
{
  ErrorModeView *v3;
  void *v4;
  void *v5;
  unsigned int v6;
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
  _QWORD v32[4];
  id v33;
  id location;
  _QWORD v35[4];

  v3 = objc_alloc_init(ErrorModeView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  objc_msgSend(v4, "addSubview:", v3);

  objc_storeStrong((id *)&self->_errorView, v3);
  -[ErrorModeView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("RatingsHistoryOfflineStateView"));
  -[ErrorModeView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v6 = objc_msgSend(v5, "isUsingForcedOfflineMaps");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = v7;
  if (v6)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("[User Profile - Ratings] Using Offline Maps"), CFSTR("localized string not found"), CFSTR("Offline")));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("[User Profile - Ratings] Forced Offline Message"), CFSTR("localized string not found"), CFSTR("Offline")));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("[User Profile - Ratings] Settings"), CFSTR("localized string not found"), CFSTR("Offline")));

    objc_initWeak(&location, self);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100B6DB04;
    v32[3] = &unk_1011B4EB8;
    objc_copyWeak(&v33, &location);
    -[ErrorModeView setButtonTitle:handler:](v3, "setButtonTitle:handler:", v11, v32);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);

  }
  else
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("[User Profile - Ratings] You’re Offline"), CFSTR("localized string not found"), CFSTR("Offline")));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("[User Profile - Ratings] Offline message"), CFSTR("localized string not found"), CFSTR("Offline")));

  }
  -[ErrorModeView setTitle:andMessage:](v3, "setTitle:andMessage:", v31, v30);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[ErrorModeView topAnchor](v3, "topAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "topAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v27));
  v35[0] = v26;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ErrorModeView leadingAnchor](v3, "leadingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "leadingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:constant:", v23, 32.0));
  v35[1] = v22;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ErrorModeView trailingAnchor](v3, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "trailingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:constant:", v15, -32.0));
  v35[2] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ErrorModeView bottomAnchor](v3, "bottomAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bottomAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:", v19, -8.0));
  v35[3] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v21);

}

- (void)loadDataSource
{
  RatingsHistoryDataSource *v3;
  RatingsHistoryDataSource *ratingsDataSource;

  v3 = -[RatingsHistoryDataSource initWithCollectionView:updateLocation:]([RatingsHistoryDataSource alloc], "initWithCollectionView:updateLocation:", self->_collectionView, 0);
  ratingsDataSource = self->_ratingsDataSource;
  self->_ratingsDataSource = v3;

  -[DataSource setDelegate:](self->_ratingsDataSource, "setDelegate:", self);
  -[RatingsHistoryDataSource setPrivacyDelegate:](self->_ratingsDataSource, "setPrivacyDelegate:", self);
  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self->_ratingsDataSource);
  -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", self->_ratingsDataSource);
  -[DataSource setActive:](self->_ratingsDataSource, "setActive:", 1);
}

- (void)scrollViewDidScroll:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RatingsHistoryViewController;
  -[ContaineeViewController scrollViewDidScroll:](&v4, "scrollViewDidScroll:", a3);
  -[RatingsHistoryViewController _updateHeaderHairline](self, "_updateHeaderHairline");
}

- (void)dataSourceUpdated:(id)a3
{
  if (self->_ratingsDataSource == a3)
  {
    -[UICollectionView reloadData](self->_collectionView, "reloadData");
    -[RatingsHistoryViewController _updateHeaderHairline](self, "_updateHeaderHairline");
  }
}

- (void)dataSource:(id)a3 itemTapped:(id)a4
{
  uint64_t v5;
  void *v6;
  SearchResult *v7;
  void *v8;
  id v9;

  v9 = a4;
  v5 = objc_opt_class(0x10147D000);
  if ((objc_opt_isKindOfClass(v9, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapItem"));
    v7 = -[SearchResult initWithMapItem:]([SearchResult alloc], "initWithMapItem:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    objc_msgSend(v8, "viewController:openSearchResult:", self, v7);

  }
}

- (void)didTapOnPrivacyText
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[OBPrivacyPresenter presenterForPrivacySplashWithIdentifier:](OBPrivacyPresenter, "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.ratingsAndPhotos")));
  objc_msgSend(v3, "setPresentingViewController:", self);
  objc_msgSend(v3, "present");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratingsDataSource, 0);
  objc_storeStrong((id *)&self->_emptyStateView, 0);
  objc_storeStrong((id *)&self->_errorView, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_titleHeaderView, 0);
}

@end
