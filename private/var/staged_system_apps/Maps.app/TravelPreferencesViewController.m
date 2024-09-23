@implementation TravelPreferencesViewController

+ (BOOL)useCollectionView
{
  return 1;
}

- (TravelPreferencesViewController)initWithCompletionHandler:(id)a3
{
  id v4;
  TravelPreferencesViewController *v5;
  TravelPreferencesDataSource *v6;
  PreferenceValuesDataSource *dataSource;
  TravelPreferencesDataSource *v8;
  void *v9;
  void *v10;
  id v11;
  id completionHandler;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TravelPreferencesViewController;
  v5 = -[TravelPreferencesViewController initWithNibName:bundle:](&v14, "initWithNibName:bundle:", 0, 0);
  if (v5)
  {
    v6 = objc_alloc_init(TravelPreferencesDataSource);
    -[PreferenceValuesDataSource setDelegate:](v6, "setDelegate:", v5);
    -[TravelPreferencesDataSource setPrivacyDelegate:](v6, "setPrivacyDelegate:", v5);
    dataSource = v5->super._dataSource;
    v5->super._dataSource = &v6->super;
    v8 = v6;

    -[TravelPreferencesDataSource loadPreferences](v8, "loadPreferences");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v5, "cardPresentationController"));
    objc_msgSend(v9, "setPresentedModally:", 1);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v5, "cardPresentationController"));
    objc_msgSend(v10, "setTakesAvailableHeight:", 1);

    v11 = objc_msgSend(v4, "copy");
    completionHandler = v5->_completionHandler;
    v5->_completionHandler = v11;

  }
  return v5;
}

- (TravelPreferencesDataSource)travelPreferencesDataSource
{
  return (TravelPreferencesDataSource *)self->super._dataSource;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  ContainerHeaderView *v8;
  void *v9;
  void *v10;
  void *v11;
  ContainerHeaderView *titleHeaderView;
  ContainerHeaderView *v13;
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
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  ContainerHeaderView *v53;
  void *v54;
  objc_super v55;
  _QWORD v56[8];

  v55.receiver = self;
  v55.super_class = (Class)TravelPreferencesViewController;
  -[PreferencesValuesContaineeViewController viewDidLoad](&v55, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TravelPreferencesViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("TravelPreferencesView"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TravelPreferencesViewController view](self, "view"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v8 = -[ContainerHeaderView initWithFrame:]([ContainerHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[ContainerHeaderView setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[ContainerHeaderView setDelegate:](v8, "setDelegate:", self);
  -[ContainerHeaderView setHeaderSize:](v8, "setHeaderSize:", 1);
  -[ContainerHeaderView setHairLineAlpha:](v8, "setHairLineAlpha:", 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("[User Profile] Preferences"), CFSTR("localized string not found"), 0));
  -[ContainerHeaderView setTitle:](v8, "setTitle:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[ContainerHeaderView setBackgroundColor:](v8, "setBackgroundColor:", v11);

  objc_msgSend(v6, "addSubview:", v8);
  titleHeaderView = self->_titleHeaderView;
  self->_titleHeaderView = v8;
  v13 = v8;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController collectionView](self, "collectionView"));
  objc_msgSend(v14, "setAccessibilityIdentifier:", CFSTR("TravelPreferencesCollectionView"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController collectionView](self, "collectionView"));
  objc_msgSend(v16, "setBackgroundColor:", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController collectionView](self, "collectionView"));
  objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController collectionView](self, "collectionView"));
  +[TravelPreferencesDataSource registerCellsInCollectionView:](TravelPreferencesDataSource, "registerCellsInCollectionView:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController collectionView](self, "collectionView"));
  objc_msgSend(v7, "addSubview:", v19);

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView topAnchor](v13, "topAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v51));
  v56[0] = v50;
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView leadingAnchor](v13, "leadingAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v48));
  v56[1] = v47;
  v53 = v13;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView trailingAnchor](v13, "trailingAnchor"));
  v54 = v6;
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v45));
  v56[2] = v43;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView bottomAnchor](v13, "bottomAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v41));
  v56[3] = v40;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController collectionView](self, "collectionView"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "topAnchor"));
  v20 = v7;
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v37));
  v56[4] = v36;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController collectionView](self, "collectionView"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "leadingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v33));
  v56[5] = v32;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController collectionView](self, "collectionView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trailingAnchor"));
  v44 = v7;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v23));
  v56[6] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController collectionView](self, "collectionView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "bottomAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bottomAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v27));
  v56[7] = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v56, 8));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v30, "addObserver:selector:name:object:", self, "keyboardWillShow:", UIKeyboardWillShowNotification, 0);

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v31, "addObserver:selector:name:object:", self, "keyboardWillHide:", UIKeyboardWillHideNotification, 0);

  _GEOConfigAddDelegateListenerForKey(MapsConfig_PreferencesUniqueEntityDidUpdate, off_1014B5518, &_dispatch_main_q, self);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", self, UIKeyboardWillShowNotification, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "removeObserver:name:object:", self, UIKeyboardWillHideNotification, 0);

  GEOConfigRemoveDelegateListenerForKey(MapsConfig_PreferencesUniqueEntityDidUpdate, off_1014B5518, self);
  v7.receiver = self;
  v7.super_class = (Class)TravelPreferencesViewController;
  -[ContaineeViewController viewWillDisappear:](&v7, "viewWillDisappear:", v3);
}

- (void)setupSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TravelPreferencesViewController;
  -[PreferencesValuesContaineeViewController setupSubviews](&v2, "setupSubviews");
}

- (int64_t)collectionViewListLayoutAppearanceStyle
{
  return 2 * (sub_1002A8AA0(self) != 5);
}

- (int64_t)collectionViewConfigurationSeparatorStyle
{
  return sub_1002A8AA0(self) != 5;
}

- (NSDirectionalEdgeInsets)collectionViewListSectionContentInsetsForSection:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  NSDirectionalEdgeInsets result;

  if ((char *)-[PreferenceValuesDataSource numberOfSections](self->super._dataSource, "numberOfSections") - 2 == (_BYTE *)a3)
    v3 = 6.0;
  else
    v3 = 10.0;
  v4 = 0.0;
  v5 = 16.0;
  v6 = 16.0;
  result.trailing = v6;
  result.bottom = v3;
  result.leading = v5;
  result.top = v4;
  return result;
}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  id v5;
  id inited;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v5 = a3;
  inited = objc_initWeak(&location, self);
  if (MapsFeature_IsEnabled_SydneyARP(inited, v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TravelPreferencesViewController travelPreferencesDataSource](self, "travelPreferencesDataSource"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10064F79C;
    v9[3] = &unk_1011B29A8;
    objc_copyWeak(&v11, &location);
    v10 = v5;
    objc_msgSend(v8, "updatePhotoCreditPreferencesWithCompletion:", v9);

    objc_destroyWeak(&v11);
  }
  else
  {
    -[ContaineeViewController handleDismissAction:](self, "handleDismissAction:", v5);
  }
  objc_destroyWeak(&location);

}

- (void)dataSourceDidRebuildSections:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TravelPreferencesViewController;
  -[PreferencesValuesContaineeViewController dataSourceDidRebuildSections:](&v3, "dataSourceDidRebuildSections:", a3);
}

- (void)didTapOnPrivacyText
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[OBPrivacyPresenter presenterForPrivacySplashWithIdentifier:](OBPrivacyPresenter, "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.ratingsAndPhotos")));
  objc_msgSend(v3, "setPresentingViewController:", self);
  objc_msgSend(v3, "present");

}

- (void)keyboardWillShow:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  id v19;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", UIKeyboardFrameEndUserInfoKey));
  objc_msgSend(v5, "CGRectValue");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController collectionView](self, "collectionView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "coordinateSpace"));
  objc_msgSend(v14, "convertRect:fromCoordinateSpace:", v16, v7, v9, v11, v13);
  v18 = v17;

  v19 = (id)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController collectionView](self, "collectionView"));
  objc_msgSend(v19, "setContentInset:", 0.0, 0.0, v18, 0.0);

}

- (void)keyboardWillHide:(id)a3
{
  double left;
  double bottom;
  double right;
  void *v7;
  id v8;

  left = UIEdgeInsetsZero.left;
  bottom = UIEdgeInsetsZero.bottom;
  right = UIEdgeInsetsZero.right;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController collectionView](self, "collectionView", a3));
  objc_msgSend(v7, "setContentInset:", UIEdgeInsetsZero.top, left, bottom, right);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController collectionView](self, "collectionView"));
  objc_msgSend(v8, "setScrollIndicatorInsets:", UIEdgeInsetsZero.top, left, bottom, right);

}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  if (a3.var0 == (_DWORD)MapsConfig_PreferencesUniqueEntityDidUpdate && a3.var1 == off_1014B5518)
    -[TravelPreferencesViewController reloadData](self, "reloadData");
}

- (void)reloadData
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[TravelPreferencesViewController travelPreferencesDataSource](self, "travelPreferencesDataSource"));
  objc_msgSend(v2, "loadPreferences");

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_titleHeaderView, 0);
}

@end
