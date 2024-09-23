@implementation InfoCardViewController

- (void)viewDidLoad
{
  void *v3;
  double *v4;
  void *v5;
  _TtC4Maps18InfoCardHeaderView *v6;
  _TtC4Maps18InfoCardHeaderView *titleHeaderView;
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
  _UNKNOWN **v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _BYTE v39[128];
  _QWORD v40[3];

  v38.receiver = self;
  v38.super_class = (Class)InfoCardViewController;
  -[ContaineeViewController viewDidLoad](&v38, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v3, "setAlwaysUseDefaultContaineeLayout:", 1);

  if (sub_1002A8AA0(self) == 5)
  {
    -[ContaineeViewController setKeepOriginalSafeInsets:](self, "setKeepOriginalSafeInsets:", 1);
    v4 = (double *)&kMUPlaceHorizontalMarginSpacing;
  }
  else
  {
    v4 = (double *)&qword_100E39428;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController view](self, "view"));
  objc_msgSend(v5, "setLayoutMargins:", 0.0, *v4, 0.0, *v4);

  v6 = -[InfoCardHeaderView initWithFrame:]([_TtC4Maps18InfoCardHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  titleHeaderView = self->_titleHeaderView;
  self->_titleHeaderView = v6;

  -[InfoCardHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self->_titleHeaderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController _createButtonConfigurations](self, "_createButtonConfigurations"));
  -[InfoCardHeaderView setButtonConfigurations:](self->_titleHeaderView, "setButtonConfigurations:", v8);

  -[InfoCardHeaderView setDelegate:](self->_titleHeaderView, "setDelegate:", self);
  -[InfoCardHeaderView setPreservesSuperviewLayoutMargins:](self->_titleHeaderView, "setPreservesSuperviewLayoutMargins:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController view](self, "view"));
  objc_msgSend(v9, "addSubview:", self->_titleHeaderView);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardHeaderView trailingAnchor](self->_titleHeaderView, "trailingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController view](self, "view"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "safeAreaLayoutGuide"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "trailingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v30));
  v40[0] = v29;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardHeaderView topAnchor](self->_titleHeaderView, "topAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController view](self, "view"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "safeAreaLayoutGuide"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "topAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v11));
  v40[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardHeaderView leadingAnchor](self->_titleHeaderView, "leadingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController view](self, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "safeAreaLayoutGuide"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v16));
  v40[2] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 3));
  objc_msgSend(v10, "addObjectsFromArray:", v18);

  objc_storeStrong((id *)&self->_currentHeaderConstraints, v10);
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v10);
  -[InfoCardViewController _contentSizeDidChange](self, "_contentSizeDidChange");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v19, "addObserver:selector:name:object:", self, "_contentSizeDidChange", UIContentSizeCategoryDidChangeNotification, 0);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v21 = &off_101274100;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v35;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v35 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(v20, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v25), 0, off_1014A1878);
        v25 = (char *)v25 + 1;
      }
      while (v23 != v25);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v23);
  }

  objc_msgSend(v20, "addObserver:forKeyPath:options:context:", self, CFSTR("DefaultDisabledTransitModesKey"), 0, off_1014A1878);
  self->_isObservingUserDefaultsKVO = 1;

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)InfoCardViewController;
  -[InfoCardViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController keyboardProxyView](self, "keyboardProxyView"));
  objc_msgSend(v4, "becomeFirstResponder");

}

- (void)viewDidDisappear:(BOOL)a3
{
  KeyboardProxyingView *keyboardProxyView;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)InfoCardViewController;
  -[InfoCardViewController viewDidDisappear:](&v5, "viewDidDisappear:", a3);
  keyboardProxyView = self->_keyboardProxyView;
  self->_keyboardProxyView = 0;

}

- (id)preferredFocusEnvironments
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  objc_super v8;
  _QWORD v9[2];

  if (sub_1002A8AA0(self) == 5)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController keyboardProxyView](self, "keyboardProxyView"));
    v9[0] = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController contentViewController](self, "contentViewController"));
    v9[1] = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 2));

    return v5;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)InfoCardViewController;
    v7 = -[InfoCardViewController preferredFocusEnvironments](&v8, "preferredFocusEnvironments");
    return (id)objc_claimAutoreleasedReturnValue(v7);
  }
}

- (double)titleTrailingConstant
{
  double result;

  -[InfoCardHeaderView titleToEndTrailingConstant](self->_titleHeaderView, "titleToEndTrailingConstant");
  return result;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  _UNKNOWN **v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  if (self->_isObservingUserDefaultsKVO)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = &off_101274100;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(v4, "removeObserver:forKeyPath:", self, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9));
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

    objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("DefaultDisabledTransitModesKey"));
  }
  v10.receiver = self;
  v10.super_class = (Class)InfoCardViewController;
  -[InfoCardViewController dealloc](&v10, "dealloc");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  DrivePreferences *v11;
  void *v12;
  DrivePreferences *v13;
  void *v14;
  void *v15;
  TransitPreferences *v16;
  void *v17;
  TransitPreferences *v18;
  objc_super v19;

  v10 = a3;
  if (off_1014A1878 == a6)
  {
    if (objc_msgSend(&off_101274100, "containsObject:", v10))
    {
      v11 = [DrivePreferences alloc];
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v13 = -[DrivePreferences initWithDefaults:](v11, "initWithDefaults:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[DrivePreferences automobileOptions](v13, "automobileOptions"));

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController contentViewController](self, "contentViewController"));
      objc_msgSend(v15, "setAutomobileOptions:", v14);
    }
    else
    {
      if (!objc_msgSend(v10, "isEqualToString:", CFSTR("DefaultDisabledTransitModesKey")))
        goto LABEL_8;
      v16 = [TransitPreferences alloc];
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v18 = -[WatchSyncedPreferences initWithDefaults:](v16, "initWithDefaults:", v17);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPreferences transitOptions](v18, "transitOptions"));

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController contentViewController](self, "contentViewController"));
      objc_msgSend(v15, "setTransitOptions:", v14);
    }

    goto LABEL_8;
  }
  v19.receiver = self;
  v19.super_class = (Class)InfoCardViewController;
  -[InfoCardViewController observeValueForKeyPath:ofObject:change:context:](&v19, "observeValueForKeyPath:ofObject:change:context:", v10, a4, a5, a6);
LABEL_8:

}

- (void)_contentSizeDidChange
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKFontManager sharedManager](MKFontManager, "sharedManager"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "largeTitleFont"));

  objc_msgSend(v8, "pointSize");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController titleHeaderView](self, "titleHeaderView"));
  objc_msgSend(v6, "titleLabelPointSize");
  self->_useSmoothTransition = v5 == v7;

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
  void *v11;
  double Height;
  double v13;
  double v14;
  double v15;
  double result;
  double v17;
  CGRect v18;
  CGRect v19;

  if (a3 != 3)
  {
    if (a3 == 2)
    {
      sub_1005EC2E4();
      return result;
    }
    if (a3 == 1)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      objc_msgSend(v4, "bottomSafeOffset");
      v6 = v5;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController contentViewController](self, "contentViewController"));
      objc_msgSend((id)objc_opt_class(v7), "headerHeightInMinimalMode");
      v9 = v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController titleHeaderView](self, "titleHeaderView"));
      objc_msgSend(v10, "frame");
      if (v9 > CGRectGetHeight(v18))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController contentViewController](self, "contentViewController"));
        objc_msgSend((id)objc_opt_class(v11), "headerHeightInMinimalMode");
      }
      else
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController titleHeaderView](self, "titleHeaderView"));
        objc_msgSend(v11, "frame");
        Height = CGRectGetHeight(v19);
      }
      v17 = Height;

      v14 = v6 + v17;
      goto LABEL_12;
    }
    goto LABEL_8;
  }
  if (sub_1002A8AA0(self) != 5)
  {
LABEL_8:
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v4, "availableHeight");
    v14 = v15;
    goto LABEL_12;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController contentViewController](self, "contentViewController"));
  objc_msgSend(v4, "currentHeight");
  v14 = v13 + 10.0;
LABEL_12:

  return v14;
}

- (void)setContentViewController:(id)a3
{
  MUInfoCardContentProtocol *v5;
  MUInfoCardContentProtocol **p_contentViewController;
  MUInfoCardContentProtocol *contentViewController;
  void *v8;
  DrivePreferences *v9;
  void *v10;
  DrivePreferences *v11;
  void *v12;
  TransitPreferences *v13;
  void *v14;
  TransitPreferences *v15;
  void *v16;
  CyclePreferences *v17;
  void *v18;
  CyclePreferences *v19;
  void *v20;
  WalkPreferences *v21;
  void *v22;
  WalkPreferences *v23;
  void *v24;
  void *v25;
  MUInfoCardContentProtocol *v26;
  _QWORD v27[4];
  MUInfoCardContentProtocol *v28;
  InfoCardViewController *v29;

  v5 = (MUInfoCardContentProtocol *)a3;
  p_contentViewController = &self->_contentViewController;
  contentViewController = self->_contentViewController;
  if (contentViewController != v5)
  {
    v26 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MUInfoCardContentProtocol view](contentViewController, "view"));
    objc_msgSend(v8, "removeFromSuperview");

    -[MUInfoCardContentProtocol removeFromParentViewController](*p_contentViewController, "removeFromParentViewController");
    objc_storeStrong((id *)&self->_contentViewController, a3);
    v9 = [DrivePreferences alloc];
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v11 = -[DrivePreferences initWithDefaults:](v9, "initWithDefaults:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DrivePreferences automobileOptions](v11, "automobileOptions"));
    -[MUInfoCardContentProtocol setAutomobileOptions:](*p_contentViewController, "setAutomobileOptions:", v12);

    v13 = [TransitPreferences alloc];
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v15 = -[WatchSyncedPreferences initWithDefaults:](v13, "initWithDefaults:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPreferences transitOptions](v15, "transitOptions"));
    -[MUInfoCardContentProtocol setTransitOptions:](*p_contentViewController, "setTransitOptions:", v16);

    v17 = [CyclePreferences alloc];
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v19 = -[CyclePreferences initWithDefaults:](v17, "initWithDefaults:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CyclePreferences cyclingOptions](v19, "cyclingOptions"));
    -[MUInfoCardContentProtocol setCyclingOptions:](*p_contentViewController, "setCyclingOptions:", v20);

    v21 = [WalkPreferences alloc];
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v23 = -[WalkPreferences initWithDefaults:](v21, "initWithDefaults:", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[WalkPreferences walkingOptions](v23, "walkingOptions"));
    -[MUInfoCardContentProtocol setWalkingOptions:](*p_contentViewController, "setWalkingOptions:", v24);

    v5 = v26;
    if (v26)
    {
      -[MUInfoCardContentProtocol setScrollViewDelegate:](v26, "setScrollViewDelegate:", self);
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      -[InfoCardViewController willChangeLayout:](self, "willChangeLayout:", objc_msgSend(v25, "containeeLayout"));

      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_100223ADC;
      v27[3] = &unk_1011AC8B0;
      v28 = v26;
      v29 = self;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v27);

      v5 = v26;
    }
  }

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double Height;
  double v11;
  double v12;
  void *v13;
  void *v14;
  objc_super v15;
  CGRect v16;

  v15.receiver = self;
  v15.super_class = (Class)InfoCardViewController;
  -[ContaineeViewController viewDidLayoutSubviews](&v15, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;

  -[InfoCardHeaderView bounds](self->_titleHeaderView, "bounds");
  Height = CGRectGetHeight(v16);
  if (Height == 0.0)
    -[ContaineeViewController headerHeight](self, "headerHeight");
  v11 = Height;
  v12 = v9 - Height;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MUInfoCardContentProtocol view](self->_contentViewController, "view"));
  objc_msgSend(v13, "setFrame:", v5, v11, v7, v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MUInfoCardContentProtocol scrollView](self->_contentViewController, "scrollView"));
  objc_msgSend(v14, "setContentInset:", -v11, 0.0, 0.0, 0.0);

}

- (MULibraryAccessProviding)libraryAccessProvider
{
  return 0;
}

- (id)_createButtonConfigurations
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _TtC4Maps27InfoCardButtonConfiguration *v7;
  void *v8;
  unsigned __int8 v9;
  _TtC4Maps27InfoCardButtonConfiguration *v10;
  uint64_t v11;
  _TtC4Maps27InfoCardButtonConfiguration *v12;
  _TtC4Maps27InfoCardButtonConfiguration *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController libraryAccessProvider](self, "libraryAccessProvider"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController libraryAccessProvider](self, "libraryAccessProvider"));
      v6 = objc_msgSend(v5, "savedStateOfPlace");

      if (v6 == (id)2)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
        v9 = objc_msgSend(v8, "isUsingOfflineMaps");

        if ((v9 & 1) != 0)
          goto LABEL_10;
        v7 = -[InfoCardButtonConfiguration initWithType:shouldBlur:tintColor:visibility:]([_TtC4Maps27InfoCardButtonConfiguration alloc], "initWithType:shouldBlur:tintColor:visibility:", 5, 0, 0, 0);
      }
      else
      {
        if (v6 != (id)1)
          goto LABEL_10;
        v7 = (_TtC4Maps27InfoCardButtonConfiguration *)objc_claimAutoreleasedReturnValue(+[LibraryUIUtilities createPlacedCardSavedButtonConfig](_TtC4Maps18LibraryUIUtilities, "createPlacedCardSavedButtonConfig"));
      }
      v10 = v7;
      if (v7)
      {
        objc_msgSend(v3, "addObject:", v7);

      }
    }
  }
LABEL_10:
  if (sub_1002A8AA0(self) == 5)
  {
    v11 = 1;
    -[ContaineeViewController setKeepOriginalSafeInsets:](self, "setKeepOriginalSafeInsets:", 1);
    v12 = (_TtC4Maps27InfoCardButtonConfiguration *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController view](self, "view"));
    -[InfoCardButtonConfiguration setLayoutMargins:](v12, "setLayoutMargins:", 0.0, kMUPlaceHorizontalMarginSpacing, 0.0, kMUPlaceHorizontalMarginSpacing);
  }
  else
  {
    if (!-[InfoCardViewController supportsSharing](self, "supportsSharing"))
    {
      v11 = 0;
      goto LABEL_16;
    }
    v12 = -[InfoCardButtonConfiguration initWithType:shouldBlur:tintColor:visibility:]([_TtC4Maps27InfoCardButtonConfiguration alloc], "initWithType:shouldBlur:tintColor:visibility:", 3, 0, 0, 0);
    objc_msgSend(v3, "addObject:", v12);
    v11 = 0;
  }

LABEL_16:
  v13 = -[InfoCardButtonConfiguration initWithType:shouldBlur:tintColor:visibility:]([_TtC4Maps27InfoCardButtonConfiguration alloc], "initWithType:shouldBlur:tintColor:visibility:", v11, 0, 0, 1);
  objc_msgSend(v3, "addObject:", v13);

  return v3;
}

- (void)rebuildHeaderViewButtons
{
  id v3;

  if (-[InfoCardViewController isViewLoaded](self, "isViewLoaded"))
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[InfoCardViewController _createButtonConfigurations](self, "_createButtonConfigurations"));
    -[InfoCardHeaderView setButtonConfigurations:](self->_titleHeaderView, "setButtonConfigurations:", v3);

  }
}

- (void)_showHeader:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  void *v7;
  _QWORD *v8;
  void *v9;
  _QWORD v10[5];
  BOOL v11;

  v4 = a4;
  v5 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController contentViewController](self, "contentViewController"));
  objc_msgSend(v7, "hideTitle:", v5);

  -[InfoCardHeaderView setHideTitleLabel:](self->_titleHeaderView, "setHideTitleLabel:", v5 ^ 1);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100223FBC;
  v10[3] = &unk_1011ACE58;
  v10[4] = self;
  v11 = v5;
  v8 = objc_retainBlock(v10);
  v9 = v8;
  if (v4)
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v8, 0.25);
  else
    ((void (*)(_QWORD *))v8[2])(v8);

}

- (void)handleDismissAction:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[InfoCardViewController instrumentDismissAction](self, "instrumentDismissAction");
  v5.receiver = self;
  v5.super_class = (Class)InfoCardViewController;
  -[ContaineeViewController handleDismissAction:](&v5, "handleDismissAction:", v4);

}

- (void)instrumentDismissAction
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[InfoCardViewController analyticsDelegate](self, "analyticsDelegate"));
  objc_msgSend(v2, "infoCardAnalyticsDidSelectAction:target:eventValue:feedbackDelegateSelector:actionRichProviderId:", 4, 201, 0, 0, 0);

}

- (void)setContaineeDelegate:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)InfoCardViewController;
  -[ContaineeViewController setContaineeDelegate:](&v8, "setContaineeDelegate:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController containeeDelegate](self, "containeeDelegate"));
  v5 = objc_opt_respondsToSelector(v4, "containeeViewController:didCreateKeyboardProxy:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController containeeDelegate](self, "containeeDelegate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController keyboardProxyView](self, "keyboardProxyView"));
    objc_msgSend(v6, "containeeViewController:didCreateKeyboardProxy:", self, v7);

  }
}

- (id)headerView
{
  return self->_titleHeaderView;
}

- (KeyboardProxyingView)keyboardProxyView
{
  KeyboardProxyingView *v3;
  KeyboardProxyingView *keyboardProxyView;
  void *v5;

  if (!self->_keyboardProxyView && sub_1002A8AA0(self) == 5)
  {
    v3 = -[KeyboardProxyingView initWithFrame:]([KeyboardProxyingView alloc], "initWithFrame:", 0.0, 0.0, 10.0, 10.0);
    keyboardProxyView = self->_keyboardProxyView;
    self->_keyboardProxyView = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController view](self, "view"));
    objc_msgSend(v5, "addSubview:", self->_keyboardProxyView);

  }
  return self->_keyboardProxyView;
}

- (void)updateHeaderWithConstraints:(id)a3
{
  NSArray **p_currentHeaderConstraints;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    p_currentHeaderConstraints = &self->_currentHeaderConstraints;
    if (-[NSArray count](*p_currentHeaderConstraints, "count"))
      +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", *p_currentHeaderConstraints);
    objc_storeStrong((id *)p_currentHeaderConstraints, a3);
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v6);
  }

}

- (void)rebuildHeaderMenu
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController traitCollection](self, "traitCollection"));
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == (id)5)
    -[InfoCardHeaderView invalidateButtonMenus](self->_titleHeaderView, "invalidateButtonMenus");
}

- (id)headerMenuSortOrderByActionType
{
  uint64_t v2;
  _UNKNOWN ***v3;
  uint64_t v4;
  _UNKNOWN **v6;
  _UNKNOWN **v7;
  _UNKNOWN **v8;
  uint64_t v9;
  _UNKNOWN **v10;
  _UNKNOWN **v11;
  _UNKNOWN **v12;
  _UNKNOWN **v13;
  _UNKNOWN **v14;
  uint64_t v15;
  _UNKNOWN **v16;
  uint64_t v17;
  _UNKNOWN **v18;
  _UNKNOWN **v19;
  _UNKNOWN **v20;
  _UNKNOWN **v21;
  _UNKNOWN **v22;
  _UNKNOWN **v23;
  _UNKNOWN **v24;
  uint64_t v25;
  _UNKNOWN **v26;
  _UNKNOWN **v27;
  uint64_t v28;
  _UNKNOWN **v29;
  uint64_t v30;
  _UNKNOWN **v31;
  _UNKNOWN **v32;
  _UNKNOWN **v33;
  uint64_t v34;
  _UNKNOWN **v35;
  _UNKNOWN **v36;
  _UNKNOWN **v37;
  _UNKNOWN **v38;
  _UNKNOWN **v39;
  _UNKNOWN **v40;
  _UNKNOWN **v41;
  uint64_t v42;
  _UNKNOWN **v43;
  _UNKNOWN **v44;
  _UNKNOWN **v45;
  uint64_t v46;
  _UNKNOWN **v47;
  _UNKNOWN **v48;
  _UNKNOWN **v49;
  _UNKNOWN **v50;
  _UNKNOWN **v51;
  uint64_t v52;
  _UNKNOWN **v53;
  uint64_t v54;
  _UNKNOWN **v55;
  _UNKNOWN **v56;
  _UNKNOWN **v57;
  _UNKNOWN **v58;
  uint64_t v59;
  _UNKNOWN **v60;
  _UNKNOWN **v61;
  uint64_t v62;
  _UNKNOWN **v63;
  uint64_t v64;
  _UNKNOWN **v65;
  _UNKNOWN **v66;
  _UNKNOWN **v67;
  uint64_t v68;
  _UNKNOWN **v69;
  _UNKNOWN **v70;

  v2 = MKMenuSeperatorIdentifier;
  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    v37 = &off_10126C520;
    v38 = &off_10126C538;
    v39 = &off_10126C550;
    v40 = &off_10126C568;
    v41 = &off_10126C580;
    v42 = v2;
    v43 = &off_10126C598;
    v44 = &off_10126C5B0;
    v45 = &off_10126C5C8;
    v46 = v2;
    v47 = &off_10126C5E0;
    v48 = &off_10126C5F8;
    v49 = &off_10126C610;
    v50 = &off_10126C628;
    v51 = &off_10126C640;
    v52 = v2;
    v53 = &off_10126C658;
    v54 = v2;
    v55 = &off_10126C670;
    v56 = &off_10126C688;
    v57 = &off_10126C6A0;
    v58 = &off_10126C6B8;
    v59 = v2;
    v60 = &off_10126C6D0;
    v61 = &off_10126C6E8;
    v62 = v2;
    v63 = &off_10126C700;
    v64 = v2;
    v65 = &off_10126C718;
    v66 = &off_10126C730;
    v67 = &off_10126C748;
    v68 = v2;
    v69 = &off_10126C760;
    v70 = &off_10126C778;
    v3 = &v37;
    v4 = 34;
  }
  else
  {
    v6 = &off_10126C598;
    v7 = &off_10126C5B0;
    v8 = &off_10126C5C8;
    v9 = v2;
    v10 = &off_10126C5E0;
    v11 = &off_10126C5F8;
    v12 = &off_10126C610;
    v13 = &off_10126C628;
    v14 = &off_10126C640;
    v15 = v2;
    v16 = &off_10126C658;
    v17 = v2;
    v18 = &off_10126C790;
    v19 = &off_10126C7A8;
    v20 = &off_10126C670;
    v21 = &off_10126C688;
    v22 = &off_10126C550;
    v23 = &off_10126C6A0;
    v26 = &off_10126C6D0;
    v27 = &off_10126C6E8;
    v28 = v2;
    v29 = &off_10126C700;
    v30 = v2;
    v31 = &off_10126C718;
    v24 = &off_10126C6B8;
    v25 = v2;
    v32 = &off_10126C730;
    v33 = &off_10126C748;
    v34 = v2;
    v35 = &off_10126C760;
    v36 = &off_10126C778;
    v3 = &v6;
    v4 = 31;
  }
  return objc_autoreleaseReturnValue((id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, v4, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19,
                                             v20,
                                             v21,
                                             v22,
                                             v23,
                                             v24,
                                             v25,
                                             v26,
                                             v27,
                                             v28,
                                             v29,
                                             v30,
                                             v31,
                                             v32,
                                             v33,
                                             v34,
                                             v35,
                                             v36,
                                             v37,
                                             v38,
                                             v39,
                                             v40,
                                             v41,
                                             v42,
                                             v43,
                                             v44,
                                             v45,
                                             v46,
                                             v47,
                                             v48,
                                             v49,
                                             v50,
                                             v51,
                                             v52,
                                             v53,
                                             v54,
                                             v55,
                                             v56,
                                             v57,
                                             v58,
                                             v59,
                                             v60,
                                             v61,
                                             v62,
                                             v63,
                                             v64)));
}

- (id)_createActionMenu
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id location;

  v3 = objc_alloc((Class)MKPlaceCardMenuBuildingOptions);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController headerMenuSortOrderByActionType](self, "headerMenuSortOrderByActionType"));
  v5 = objc_msgSend(v3, "initWithRequestedActionTypes:", v4);

  objc_msgSend(v5, "setAddMismatchedItems:", 0);
  objc_initWeak(&location, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController headerActionItems](self, "headerActionItems"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1002246F8;
  v9[3] = &unk_1011ACDC8;
  objc_copyWeak(&v10, &location);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKPlaceCardActionItem buildActionMenuForItems:buildingOptions:menuElementCreationBlock:](MKPlaceCardActionItem, "buildActionMenuForItems:buildingOptions:menuElementCreationBlock:", v6, v5, v9));
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
  return v7;
}

- (id)headerActionItems
{
  return &__NSArray0__struct;
}

- (id)menuElementForActionItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resolvedActionItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "titleForDisplayStyle:", 0));

  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100224894;
  v10[3] = &unk_1011ACE30;
  v7 = v4;
  v11 = v7;
  objc_copyWeak(&v12, &location);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v6, 0, 0, v10));
  objc_msgSend(v8, "setAttributes:", objc_msgSend(v7, "enabled") ^ 1);
  objc_destroyWeak(&v12);

  objc_destroyWeak(&location);
  return v8;
}

- (void)headerViewTapped:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController analyticsDelegate](self, "analyticsDelegate", a3));
  objc_msgSend(v4, "infoCardAnalyticsDidSelectAction:eventValue:feedbackDelegateSelector:", 6042, 0, 0);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v5, "wantsExpandLayout");

}

- (void)headerView:(id)a3 selectedActionButton:(id)a4 withPresentationOptions:(id)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v8, "type") == (id)3)
  {
    -[InfoCardViewController handleShareWithPresentationOptions:](self, "handleShareWithPresentationOptions:", v9);
  }
  else if (objc_msgSend(v8, "type") == (id)5 || objc_msgSend(v8, "type") == (id)6)
  {
    -[InfoCardViewController handleAddOrRemoveFromLibraryHeaderAction:](self, "handleAddOrRemoveFromLibraryHeaderAction:", objc_msgSend(v8, "type") == (id)5);
  }
  else
  {
    -[InfoCardViewController _handleDismissActionWithHeaderView:](self, "_handleDismissActionWithHeaderView:", v10);
  }

}

- (id)underlyingHeaderViewForHitTesting:(id)a3
{
  void *v4;

  if (-[InfoCardHeaderView hideTitleLabel](self->_titleHeaderView, "hideTitleLabel", a3))
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MUInfoCardContentProtocol viewForHeaderContainmentString](self->_contentViewController, "viewForHeaderContainmentString"));
  else
    v4 = 0;
  return v4;
}

- (id)headerView:(id)a3 menuForButtonConfiguration:(id)a4
{
  void *v5;

  if (objc_msgSend(a4, "type", a3) == (id)1)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController _createActionMenu](self, "_createActionMenu"));
  else
    v5 = 0;
  return v5;
}

- (void)headerViewDidUpdateButtonContainerContentSize:(id)a3
{
  -[InfoCardViewController updateContentHeaderTrailingConstant](self, "updateContentHeaderTrailingConstant", a3);
}

- (void)updateContentHeaderTrailingConstant
{
  -[MUInfoCardContentProtocol updateHeaderTrailingConstant](self->_contentViewController, "updateHeaderTrailingConstant");
}

- (void)_handleDismissActionWithHeaderView:(id)a3
{
  id v4;

  v4 = a3;
  if (sub_1002A8AA0(self) != 5)
    -[InfoCardViewController handleDismissAction:](self, "handleDismissAction:", v4);

}

- (BOOL)supportsSharing
{
  return 1;
}

- (MUInfoCardAnalyticsDelegate)analyticsDelegate
{
  void *v3;
  unsigned int v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController contentViewController](self, "contentViewController"));
  v4 = objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___MUInfoCardAnalyticsDelegate);

  if (v4)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController contentViewController](self, "contentViewController"));
  else
    v5 = 0;
  return (MUInfoCardAnalyticsDelegate *)v5;
}

- (void)willChangeLayout:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v6 = objc_msgSend(v5, "containeeLayout");

  v10.receiver = self;
  v10.super_class = (Class)InfoCardViewController;
  -[ContaineeViewController willChangeLayout:](&v10, "willChangeLayout:", a3);
  if (a3 == 2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController titleHeaderView](self, "titleHeaderView"));
    objc_msgSend(v8, "setHairLineAlpha:", 0.0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController contentViewController](self, "contentViewController"));
    objc_msgSend(v9, "scrollToTopAnimated:", 1);

    if (v6 != (id)1)
      return;
  }
  else
  {
    if (a3 != 1)
      return;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController contentViewController](self, "contentViewController"));
    objc_msgSend(v7, "scrollToTopAnimated:", 1);

  }
  -[InfoCardViewController _showHeader:animated:](self, "_showHeader:animated:", 0, 1);
}

- (void)willBecomeCurrent:(BOOL)a3
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)InfoCardViewController;
  -[ContaineeViewController willBecomeCurrent:](&v4, "willBecomeCurrent:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DeviceRecentLocations sharedInstance](DeviceRecentLocations, "sharedInstance"));
  objc_msgSend(v3, "updateLocationsWithCompletionHandler:", 0);

}

- (void)applyAlphaToContent:(double)a3
{
  void *v5;
  id v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController contentViewController](self, "contentViewController"));
  objc_msgSend(v5, "setContentAlpha:", a3);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  -[InfoCardViewController applyLayoutToContent:](self, "applyLayoutToContent:", objc_msgSend(v6, "containeeLayout"));

}

- (void)applyLayoutToContent:(unint64_t)a3
{
  uint64_t v3;
  id v4;

  if (a3 - 1 > 4)
    v3 = 0;
  else
    v3 = qword_100E346F0[a3 - 1];
  v4 = (id)objc_claimAutoreleasedReturnValue(-[InfoCardViewController contentViewController](self, "contentViewController"));
  objc_msgSend(v4, "setContentVisibility:", v3);

}

- (void)shouldDismissForHorizontalSwipe_nonUIKitCardsOnly
{
  -[InfoCardViewController handleDismissAction:](self, "handleDismissAction:", 0);
}

- (int64_t)floatingControlsOptions
{
  return 251;
}

- (BOOL)isShowingFullHeader
{
  void *v2;
  double v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController titleHeaderView](self, "titleHeaderView"));
  objc_msgSend(v2, "hairLineAlpha");
  v4 = v3 == 0.0;

  return v4;
}

- (void)didScrollPastTransition
{
  id v3;

  if (!self->_useSmoothTransition)
  {
    -[InfoCardHeaderView setHideTitleLabel:](self->_titleHeaderView, "setHideTitleLabel:", 0);
    v3 = (id)objc_claimAutoreleasedReturnValue(-[InfoCardViewController titleHeaderView](self, "titleHeaderView"));
    objc_msgSend(v3, "setBlurButtons:", 0);

  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double Height;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  objc_super v29;
  CGRect v30;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)InfoCardViewController;
  -[ContaineeViewController scrollViewDidScroll:](&v29, "scrollViewDidScroll:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v6 = objc_msgSend(v5, "containeeLayout");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MUInfoCardContentProtocol scrollView](self->_contentViewController, "scrollView"));
  v8 = v7;
  if (v6 == (id)1)
  {
    objc_msgSend(v7, "setClipsToBounds:", 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController titleHeaderView](self, "titleHeaderView"));
    v10 = v9;
    v11 = 0.0;
LABEL_17:
    objc_msgSend(v9, "setHairLineAlpha:", v11);

    goto LABEL_18;
  }
  objc_msgSend(v7, "contentInset");
  v13 = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController contentViewController](self, "contentViewController"));
  objc_msgSend(v14, "heightForContentAboveTitle");
  v16 = v15;

  objc_msgSend(v4, "contentOffset");
  v18 = v13 - v16 + v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController titleHeaderView](self, "titleHeaderView"));
  objc_msgSend(v19, "frame");
  Height = CGRectGetHeight(v30);

  if (v18 <= 0.0)
  {
    if (v16 > 0.0)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController contentViewController](self, "contentViewController"));
      objc_msgSend(v24, "contentAboveTitleScrollPositionChanged:", fabs(v18 / v16));

    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController contentViewController](self, "contentViewController"));
    objc_msgSend(v25, "hideTitle:", 0);

    -[InfoCardHeaderView setHideTitleLabel:](self->_titleHeaderView, "setHideTitleLabel:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController titleHeaderView](self, "titleHeaderView"));
    objc_msgSend(v26, "setBlurButtons:", 0);

    v23 = 0.0;
  }
  else
  {
    if (self->_useSmoothTransition)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController contentViewController](self, "contentViewController"));
      objc_msgSend(v21, "hideTitle:", 1);

      -[InfoCardHeaderView setHideTitleLabel:](self->_titleHeaderView, "setHideTitleLabel:", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController titleHeaderView](self, "titleHeaderView"));
      objc_msgSend(v22, "setBlurButtons:", 0);

    }
    if (v18 <= 10.0)
    {
      v23 = v18 / 10.0;
      if (!self->_useSmoothTransition)
        -[InfoCardHeaderView setHideTitleLabel:](self->_titleHeaderView, "setHideTitleLabel:", 1);
    }
    else
    {
      -[InfoCardViewController didScrollPastTransition](self, "didScrollPastTransition");
      v23 = 1.0;
    }
  }
  objc_msgSend(v4, "verticalScrollIndicatorInsets");
  if (Height != v27)
  {
    objc_msgSend(v4, "verticalScrollIndicatorInsets");
    objc_msgSend(v4, "setScrollIndicatorInsets:", v13 + Height);
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MUInfoCardContentProtocol scrollView](self->_contentViewController, "scrollView", 1.0));
  objc_msgSend(v28, "setClipsToBounds:", v23 == 1.0);

  if (sub_1002A8AA0(self) != 5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController titleHeaderView](self, "titleHeaderView"));
    v10 = v9;
    v11 = v23;
    goto LABEL_17;
  }
LABEL_18:

}

- (MacPopoverPresentationController)macPopoverPresentationController
{
  ExpandableMacPopoverPresentationController *expandablePopoverPresentationController;
  ExpandableMacPopoverPresentationController *v4;
  ExpandableMacPopoverPresentationController *v5;

  expandablePopoverPresentationController = self->_expandablePopoverPresentationController;
  if (!expandablePopoverPresentationController)
  {
    v4 = -[MacPopoverPresentationController initWithContaineeViewController:]([ExpandableMacPopoverPresentationController alloc], "initWithContaineeViewController:", self);
    v5 = self->_expandablePopoverPresentationController;
    self->_expandablePopoverPresentationController = v4;

    expandablePopoverPresentationController = self->_expandablePopoverPresentationController;
  }
  return (MacPopoverPresentationController *)expandablePopoverPresentationController;
}

- (double)macContaineeWidth
{
  return 326.0;
}

- (MUInfoCardContentProtocol)contentViewController
{
  return self->_contentViewController;
}

- (_TtC4Maps18InfoCardHeaderView)titleHeaderView
{
  return self->_titleHeaderView;
}

- (void)setKeyboardProxyView:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardProxyView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardProxyView, 0);
  objc_storeStrong((id *)&self->_titleHeaderView, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_currentHeaderConstraints, 0);
  objc_storeStrong((id *)&self->_expandablePopoverPresentationController, 0);
}

@end
