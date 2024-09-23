@implementation UserProfileCollectionViewController

- (UserProfileCollectionViewController)initWithAccount:(id)a3 contentViewDelegate:(id)a4
{
  id v7;
  id v8;
  UserProfileCollectionViewController *v9;
  UserProfileCollectionViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UserProfileCollectionViewController;
  v9 = -[UserProfileCollectionViewController initWithNibName:bundle:](&v12, "initWithNibName:bundle:", 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeWeak((id *)&v10->_contentViewDelegate, v8);
    -[UserProfileCollectionViewController _loadGarage](v10, "_loadGarage");
    -[UserProfileCollectionViewController _addRowContent](v10, "_addRowContent");
  }

  return v10;
}

- (void)_loadGarage
{
  void *v3;
  VGVirtualGarage *v4;
  VGVirtualGarage *virtualGarage;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UserProfileLinkGarageProvider sharedInstance](UserProfileLinkGarageProvider, "sharedInstance"));
  v4 = (VGVirtualGarage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "virtualGarage"));
  virtualGarage = self->_virtualGarage;
  self->_virtualGarage = v4;

  -[UserProfileCollectionViewController _addRowContent](self, "_addRowContent");
  v7 = (id)objc_claimAutoreleasedReturnValue(-[UserProfileCollectionViewController collectionView](self, "collectionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", 0));
  objc_msgSend(v7, "reloadSections:", v6);

}

- (void)viewDidLoad
{
  NSMutableDictionary *v3;
  NSMutableDictionary *linkDictionaryByType;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __objc2_class **v13;
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
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)UserProfileCollectionViewController;
  -[UserProfileCollectionViewController viewDidLoad](&v30, "viewDidLoad");
  v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  linkDictionaryByType = self->_linkDictionaryByType;
  self->_linkDictionaryByType = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileCollectionViewController view](self, "view"));
  objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("UserProfileCollectionView"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileCollectionViewController view](self, "view"));
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UserProfileCollectionViewController _createLayout](self, "_createLayout");
  -[UserProfileCollectionViewController _setupConstraints](self, "_setupConstraints");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v7, "setDataSource:", self);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v8, "setDelegate:", self);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v6, "addSubview:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v10, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(UserProfilePersonalizationLinkCell), CFSTR("UserProfileLinkCell"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UserInformationManager sharedInstance](UserInformationManager, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "observers"));
  objc_msgSend(v12, "registerObserver:", self);

  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    v13 = &off_101198750;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UserProfileLinkFavoritesProvider sharedInstance](UserProfileLinkFavoritesProvider, "sharedInstance"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "observers"));
    objc_msgSend(v15, "registerObserver:", self);

    v13 = off_1011984D0;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class sharedInstance](*v13, "sharedInstance"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "observers"));
  objc_msgSend(v17, "registerObserver:", self);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UserProfileLinkGarageProvider sharedInstance](UserProfileLinkGarageProvider, "sharedInstance"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "observers"));
  objc_msgSend(v19, "registerObserver:", self);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UserProfileLinkRatingsProvider sharedInstance](UserProfileLinkRatingsProvider, "sharedInstance"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "observers"));
  objc_msgSend(v21, "registerObserver:", self);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UserProfileLinkReportsProvider sharedInstance](UserProfileLinkReportsProvider, "sharedInstance"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "observers"));
  objc_msgSend(v23, "registerObserver:", self);

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UserProfileLinkPreferencesProvider sharedInstance](UserProfileLinkPreferencesProvider, "sharedInstance"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "observers"));
  objc_msgSend(v25, "registerObserver:", self);

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UserProfileLinkOfflineMapsProvider sharedInstance](UserProfileLinkOfflineMapsProvider, "sharedInstance"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "observers"));
  objc_msgSend(v27, "registerObserver:", self);

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v28, "addObserver:selector:name:object:", self, "countryConfigurationDidChange:", GEOCountryConfigurationCountryCodeDidChangeNotification, 0);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileCollectionViewController _generateAvailableActionsForAnalytics](self, "_generateAvailableActionsForAnalytics"));
  -[UserProfileCollectionViewController _captureAvailableActions:](self, "_captureAvailableActions:", v29);

}

- (void)_createLayout
{
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void **v10;
  uint64_t v11;
  id (*v12)(uint64_t, uint64_t, void *);
  void *v13;
  id v14;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc((Class)UICollectionViewCompositionalLayout);
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_100B1D524;
  v13 = &unk_1011B5F50;
  objc_copyWeak(&v14, &location);
  v4 = objc_msgSend(v3, "initWithSectionProvider:", &v10);
  v5 = objc_alloc((Class)UICollectionView);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileCollectionViewController view](self, "view", v10, v11, v12, v13));
  objc_msgSend(v6, "bounds");
  v7 = objc_msgSend(v5, "initWithFrame:collectionViewLayout:", v4);

  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v7, "setAlwaysBounceVertical:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v7, "setBackgroundColor:", v8);

  objc_msgSend(v7, "setAutoresizingMask:", 18);
  objc_storeStrong((id *)&self->_collectionView, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileCollectionViewController view](self, "view"));
  objc_msgSend(v9, "addSubview:", v7);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
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

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileCollectionViewController collectionView](self, "collectionView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileCollectionViewController view](self, "view"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "topAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v20));
  v24[0] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileCollectionViewController collectionView](self, "collectionView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileCollectionViewController view](self, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "leadingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v15));
  v24[1] = v14;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileCollectionViewController collectionView](self, "collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileCollectionViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:", v5));
  v24[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileCollectionViewController collectionView](self, "collectionView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileCollectionViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
  v24[3] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (void)_addRowContent
{
  NSMutableArray *v3;
  NSMutableArray *userProfilePersonalizationSections;
  unsigned int v5;
  NSMutableArray *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  int LagunaBeachContributions;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t IsEnabled_Alberta;
  int v24;
  uint64_t v25;
  int IsEnabled_EVRouting;
  int v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;

  if (-[NSMutableArray count](self->_userProfilePersonalizationSections, "count"))
    -[NSMutableArray removeAllObjects](self->_userProfilePersonalizationSections, "removeAllObjects");
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  userProfilePersonalizationSections = self->_userProfilePersonalizationSections;
  self->_userProfilePersonalizationSections = v3;

  v5 = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
  v6 = self->_userProfilePersonalizationSections;
  if (v5)
    -[NSMutableArray addObject:](v6, "addObject:", &off_1012706D8);
  else
    -[NSMutableArray addObjectsFromArray:](v6, "addObjectsFromArray:", &off_101274268);
  if (_MKRAPIsAvailable(-[NSMutableArray addObject:](self->_userProfilePersonalizationSections, "addObject:", &off_101270720))&& (sub_1003DDB84() & 1) == 0)
  {
    -[NSMutableArray addObject:](self->_userProfilePersonalizationSections, "addObject:", &off_101270738);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "countryCode"));
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("CN"));

  LagunaBeachContributions = GEOCanUserMakeLagunaBeachContributions(v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UserProfileLinkRatingsProvider sharedInstance](UserProfileLinkRatingsProvider, "sharedInstance"));
  v14 = objc_msgSend(v13, "hasRatings");

  if (!v9 && LagunaBeachContributions && v14)
    -[NSMutableArray addObject:](self->_userProfilePersonalizationSections, "addObject:", &off_101270750);
  v15 = sub_1002A8AA0(self);
  v16 = v15 == 5;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UserProfileLinkGarageProvider sharedInstance](UserProfileLinkGarageProvider, "sharedInstance"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "virtualGarage"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "vehicles"));
  v20 = objc_msgSend(v19, "count");
  if (v20)
    v16 = 0;
  if (v15 != 5 && !v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UserProfileLinkGarageProvider sharedInstance](UserProfileLinkGarageProvider, "sharedInstance"));
    v16 = objc_msgSend(v21, "hasUnpairedVehicles") ^ 1;

  }
  IsEnabled_Alberta = MapsFeature_IsEnabled_Alberta(v22);
  v24 = IsEnabled_Alberta;
  IsEnabled_EVRouting = MapsFeature_IsEnabled_EVRouting(IsEnabled_Alberta, v25);
  v27 = v16 ^ 1;
  if (v15 != 5)
  {
    if ((v27 & IsEnabled_EVRouting | v24) != 1)
      goto LABEL_23;
    goto LABEL_22;
  }
  if ((v27 & (IsEnabled_EVRouting | v24) & 1) != 0)
LABEL_22:
    -[NSMutableArray addObject:](self->_userProfilePersonalizationSections, "addObject:", &off_101270768);
LABEL_23:
  -[NSMutableArray addObject:](self->_userProfilePersonalizationSections, "addObject:", &off_101270780);
  v28 = -[NSMutableArray count](self->_userProfilePersonalizationSections, "count");
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileCollectionViewController contentViewDelegate](self, "contentViewDelegate"));
  v30 = objc_msgSend(v29, "numberOfRows");

  if (v30 != v28)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileCollectionViewController contentViewDelegate](self, "contentViewDelegate"));
    objc_msgSend(v31, "setNumberOfRows:", v28);

    v32 = (id)objc_claimAutoreleasedReturnValue(-[UserProfileCollectionViewController contentViewDelegate](self, "contentViewDelegate"));
    objc_msgSend(v32, "profileContentDidUpdate");

  }
}

- (id)_createModelForType:(int64_t)a3
{
  void *v5;
  void *v6;
  UserProfileLinkFactory *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_linkDictionaryByType, "objectForKeyedSubscript:", v5));
  if (!v6)
  {
    v7 = objc_alloc_init(UserProfileLinkFactory);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileLinkFactory createModelForType:](v7, "createModelForType:", a3));
    -[NSMutableDictionary setObject:forKey:](self->_linkDictionaryByType, "setObject:forKey:", v6, v5);

  }
  return v6;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;
  __CFString *v12;
  void *v13;
  void *v14;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v6, "row");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("UserProfileLinkCell"), v6));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_userProfilePersonalizationSections, "objectAtIndexedSubscript:", v8));
  v11 = (unint64_t)objc_msgSend(v10, "integerValue");

  if (v11 > 7)
  {
    v13 = 0;
  }
  else
  {
    v12 = off_1011E30B0[v11];
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileCollectionViewController _createModelForType:](self, "_createModelForType:", v11));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", v12));
    objc_msgSend(v9, "setGlyphBackgroundColor:", v14);

  }
  objc_msgSend(v9, "setUserProfileLink:", v13);

  return v9;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return (int64_t)-[NSMutableArray count](self->_userProfilePersonalizationSections, "count", a3, a4);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cellForItemAtIndexPath:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileCollectionViewController contentViewDelegate](self, "contentViewDelegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "userProfileLink"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileCollectionViewController _generateAvailableActionsForAnalytics](self, "_generateAvailableActionsForAnalytics"));
  objc_msgSend(v8, "userProfileLinkTapped:availableActions:", v9, v10);

  objc_msgSend(v7, "deselectItemAtIndexPath:animated:", v6, 1);
}

- (void)userProfileLinkCellTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[UserProfileCollectionViewController contentViewDelegate](self, "contentViewDelegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userProfileLink"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileCollectionViewController _generateAvailableActionsForAnalytics](self, "_generateAvailableActionsForAnalytics"));
  objc_msgSend(v7, "userProfileLinkTapped:availableActions:", v5, v6);

}

- (void)userDataDidUpdate
{
  id v3;

  -[UserProfileCollectionViewController _addRowContent](self, "_addRowContent");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[UserProfileCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v3, "reloadData");

}

- (void)dataDidUpdateForUserProfileLinkType:(int64_t)a3
{
  id v6;
  NSObject *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  __objc2_class **v15;
  UserProfileLinkFactory *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  int v26;

  v6 = sub_10043261C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class(self);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v21 = 138412802;
    v22 = v10;
    v23 = 2112;
    v24 = v12;
    v25 = 1024;
    v26 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@ %@%d", (uint8_t *)&v21, 0x1Cu);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_linkDictionaryByType, "objectForKeyedSubscript:", v13));
  if (v14)
  {
    if (a3)
      goto LABEL_5;
LABEL_9:
    v15 = &off_101198750;
    goto LABEL_11;
  }
  v16 = objc_alloc_init(UserProfileLinkFactory);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileLinkFactory createModelForType:](v16, "createModelForType:", a3));

  if (!a3)
    goto LABEL_9;
LABEL_5:
  if (a3 == 4)
  {
    v15 = off_1011984E8;
    goto LABEL_11;
  }
  if (a3 == 3)
  {
    v15 = &off_1011984F0;
LABEL_11:
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class sharedInstance](*v15, "sharedInstance"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "retrieveSubtitleText"));
    objc_msgSend(v14, "setSubtitle:", v18);

  }
  -[NSMutableDictionary setObject:forKey:](self->_linkDictionaryByType, "setObject:forKey:", v14, v13);
  -[UserProfileCollectionViewController _addRowContent](self, "_addRowContent");
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileCollectionViewController collectionView](self, "collectionView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", 0));
  objc_msgSend(v19, "reloadSections:", v20);

}

- (void)countryConfigurationDidChange:(id)a3
{
  id v4;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  -[UserProfileCollectionViewController _addRowContent](self, "_addRowContent");
  v4 = (id)objc_claimAutoreleasedReturnValue(-[UserProfileCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v4, "reloadData");

}

- (id)_generateAvailableActionsForAnalytics
{
  void *v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_userProfilePersonalizationSections;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = (unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8), "integerValue", (_QWORD)v11)- 1;
        if (v9 <= 6)
          objc_msgSend(v3, "addObject:", (&off_1011E30F0)[v9]);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)_captureAvailableActions:(id)a3
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  id v6;

  v6 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UserInformationManager sharedInstance](UserInformationManager, "sharedInstance"));
  v4 = objc_msgSend(v3, "loggedIn");

  if ((v4 & 1) == 0)
    objc_msgSend(v6, "addObject:", &off_101270840);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UserInformationManager sharedInstance](UserInformationManager, "sharedInstance"));
  +[UserProfileAnalyticsManager captureAccountDidAppearWithAvailableActions:signedIntoICloud:](UserProfileAnalyticsManager, "captureAccountDidAppearWithAvailableActions:signedIntoICloud:", v6, objc_msgSend(v5, "loggedIn"));

  +[MapsAnalyticStateProvider setUserProfileAvailableActions:](MapsAnalyticStateProvider, "setUserProfileAvailableActions:", v6);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (UserProfileContentViewDelegate)contentViewDelegate
{
  return (UserProfileContentViewDelegate *)objc_loadWeakRetained((id *)&self->_contentViewDelegate);
}

- (void)setContentViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_contentViewDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contentViewDelegate);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_linkDictionaryByType, 0);
  objc_storeStrong((id *)&self->_userProfilePersonalizationSections, 0);
  objc_storeStrong((id *)&self->_virtualGarage, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
