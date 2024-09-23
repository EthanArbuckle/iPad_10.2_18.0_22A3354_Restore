@implementation MapsBannerViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (MapsBannerViewController)initWithRequestId:(id)a3 target:(id)a4 bannerView:(id)a5 delegate:(id)a6 aperturePresentation:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  MapsBannerViewController *v16;
  NSString *v17;
  uint64_t v18;
  NSString *requestIdentifier;
  id *p_bannerView;
  void *v21;
  void *v22;
  uint64_t v23;
  NSLayoutConstraint *widthConstraint;
  double v25;
  double v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  unsigned int v34;
  void *v35;
  objc_super v37;

  v7 = a7;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v37.receiver = self;
  v37.super_class = (Class)MapsBannerViewController;
  v16 = -[MapsBannerViewController initWithNibName:bundle:](&v37, "initWithNibName:bundle:", 0, 0);
  if (v16)
  {
    if (objc_msgSend(v13, "destination") == (id)1)
      v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CarPlay-%@"), v12);
    else
      v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("iOS-%@"), v12);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    requestIdentifier = v16->_requestIdentifier;
    v16->_requestIdentifier = (NSString *)v18;

    objc_storeWeak((id *)&v16->_target, v13);
    p_bannerView = (id *)&v16->_bannerView;
    objc_storeStrong((id *)&v16->_bannerView, a5);
    objc_storeWeak((id *)&v16->_delegate, v15);
    v16->_cachedDisplayWidth = -1.0;
    v16->_aperturePresentation = v7;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController view](v16, "view"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "widthAnchor"));
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToConstant:", 0.0));
    widthConstraint = v16->_widthConstraint;
    v16->_widthConstraint = (NSLayoutConstraint *)v23;

    -[MapsBannerViewController approximateWidth](v16, "approximateWidth");
    v26 = v25;
    -[BannerView sizeThatFits:](v16->_bannerView, "sizeThatFits:");
    -[MapsBannerViewController setPreferredContentSize:](v16, "setPreferredContentSize:", v26);
    v16->_waitingForDisplay = 1;
    if (v7)
    {
      v16->_waitingForDisplay = 0;
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController view](v16, "view"));
      objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    }
    v28 = *p_bannerView;
    v29 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v16, "_handleTapOnContent:");
    objc_msgSend(v28, "addGestureRecognizer:", v29);

    v30 = objc_msgSend(objc_alloc((Class)UISwipeGestureRecognizer), "initWithTarget:action:", v16, "_handleSwipeGesture:");
    objc_msgSend(v30, "setAllowedTouchTypes:", &off_101273D70);
    objc_msgSend(v30, "setDirection:", 4);
    objc_msgSend(*p_bannerView, "addGestureRecognizer:", v30);
    v31 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v16, "_handleBackGesture:");
    objc_msgSend(v31, "setAllowedPressTypes:", &off_101273D88);
    objc_msgSend(*p_bannerView, "addGestureRecognizer:", v31);
    if (objc_msgSend(v13, "destination") == (id)1)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v32, "addObserver:selector:name:object:", v16, "_sceneDidActivate:", UISceneDidActivateNotification, 0);

    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
    v34 = objc_msgSend(v33, "isInternalInstall");

    if (v34)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[MapsRadarController sharedInstance](MapsRadarController, "sharedInstance"));
      objc_msgSend(v35, "addAttachmentProvider:", v16);

    }
  }

  return v16;
}

- (void)dealloc
{
  void *v3;
  unsigned int v4;
  void *v5;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
  v4 = objc_msgSend(v3, "isInternalInstall");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsRadarController sharedInstance](MapsRadarController, "sharedInstance"));
    objc_msgSend(v5, "removeAttachmentProvider:", self);

  }
  v6.receiver = self;
  v6.super_class = (Class)MapsBannerViewController;
  -[MapsBannerViewController dealloc](&v6, "dealloc");
}

- (void)loadView
{
  id v3;
  void *v4;
  id v5;
  _QWORD *v6;
  id v7;

  if (self->_aperturePresentation)
  {
    v3 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController target](self, "target"));
    v5 = objc_msgSend(v4, "destination");

    v6 = &PLPlatterViewStyleNavigationBanner;
    if (v5 == (id)1)
      v6 = &PLPlatterViewStyleCarPlayBanner;
    v3 = (id)objc_claimAutoreleasedReturnValue(+[PLPlatterView platterViewWithStyle:](PLPlatterView, "platterViewWithStyle:", *v6));
  }
  v7 = v3;
  -[MapsBannerViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  NSArray *bannerConstraints;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;
  _QWORD v22[5];

  v21.receiver = self;
  v21.super_class = (Class)MapsBannerViewController;
  -[MapsBannerViewController viewDidLoad](&v21, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController _contentView](self, "_contentView"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("MapsBannerViewContent"));
  -[BannerView setTranslatesAutoresizingMaskIntoConstraints:](self->_bannerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", self->_bannerView);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BannerView leadingAnchor](self->_bannerView, "leadingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v19));
  v22[0] = v18;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BannerView trailingAnchor](self->_bannerView, "trailingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v16));
  v22[1] = v15;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BannerView topAnchor](self->_bannerView, "topAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v13));
  v22[2] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BannerView bottomAnchor](self->_bannerView, "bottomAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v6));
  v22[3] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BannerView widthAnchor](self->_bannerView, "widthAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "widthAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
  v22[4] = v10;
  v11 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 5));
  bannerConstraints = self->_bannerConstraints;
  self->_bannerConstraints = v11;

  if (!self->_aperturePresentation)
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", self->_bannerConstraints);

}

- (id)_contentView
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController view](self, "view"));
  v4 = objc_opt_class(PLPlatterView);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController view](self, "view"));
  v7 = v6;
  if ((isKindOfClass & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "customContentView"));

  }
  else
  {
    objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("MapsBannerView"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController view](self, "view"));
  }
  return v8;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MapsBannerViewController;
  -[MapsBannerViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[MapsBannerViewController _performViewWillAppear](self, "_performViewWillAppear");
}

- (void)_sceneDidActivate:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v5 = objc_opt_class(UIScene);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    v6 = v4;
  else
    v6 = 0;
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_persistenceIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController requestIdentifier](self, "requestIdentifier"));
  v10 = objc_msgSend(v8, "containsString:", v9);

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "removeObserver:name:object:", self, UISceneDidActivateNotification, 0);

    -[MapsBannerViewController _performViewWillAppear](self, "_performViewWillAppear");
  }
}

- (void)_performViewWillAppear
{
  id v3;
  NSObject *v4;
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  MapsBannerViewController *v13;
  __int16 v14;
  void *v15;

  if (!self->_didViewWillAppear)
  {
    v3 = sub_100431C7C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = NSStringFromCGSize(self->_deferredContentSize);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      v12 = 134218242;
      v13 = self;
      v14 = 2114;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "_performViewWillAppear %p, setting preferredContentSize %{public}@", (uint8_t *)&v12, 0x16u);

    }
    self->_didViewWillAppear = 1;
    self->_waitingForDisplay = 0;
    -[MapsBannerViewController setPreferredContentSize:](self, "setPreferredContentSize:", self->_deferredContentSize.width, self->_deferredContentSize.height);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController view](self, "view"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "window"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController knobSelectRecognizer](self, "knobSelectRecognizer"));
    objc_msgSend(v8, "addGestureRecognizer:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController bannerView](self, "bannerView"));
    v11 = objc_msgSend(v10, "bannerType");

    if (v11 == (id)2)
      AudioServicesPlaySystemSoundWithCompletion(0x55Au, 0);
  }
}

- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1007EC844;
  v3[3] = &unk_1011AEDC8;
  v3[4] = self;
  objc_msgSend(a3, "animateAlongsideTransition:completion:", v3, 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MapsBannerViewController;
  -[MapsBannerViewController viewWillDisappear:](&v7, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController knobSelectRecognizer](self, "knobSelectRecognizer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController knobSelectRecognizer](self, "knobSelectRecognizer"));
  objc_msgSend(v5, "removeGestureRecognizer:", v6);

}

- (id)accessibilityIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(self);
  return NSStringFromClass(v2);
}

- (NSString)description
{
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MapsBannerViewController;
  v3 = -[MapsBannerViewController description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController requestIdentifier](self, "requestIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return (NSString *)v6;
}

- (double)displayWidth
{
  double cachedDisplayWidth;
  BNBannerSource **p_target;
  id WeakRetained;
  void *v6;
  id v7;
  double v8;
  id v9;
  NSObject *v10;
  id v11;
  double v12;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;

  cachedDisplayWidth = self->_cachedDisplayWidth;
  if (cachedDisplayWidth == -1.0)
  {
    p_target = &self->_target;
    WeakRetained = objc_loadWeakRetained((id *)&self->_target);
    v14 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "layoutDescriptionWithError:", &v14));
    v7 = v14;

    if (v6)
    {
      objc_msgSend(v6, "presentationSize");
      cachedDisplayWidth = v8;
      self->_cachedDisplayWidth = v8;
    }
    else
    {
      v9 = sub_100431C7C();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = objc_loadWeakRetained((id *)p_target);
        *(_DWORD *)buf = 138412546;
        v16 = v11;
        v17 = 2112;
        v18 = v7;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Unable to determine layout for target: %@ error: %@", buf, 0x16u);

      }
      -[MapsBannerViewController approximateWidth](self, "approximateWidth");
      cachedDisplayWidth = v12;
    }

  }
  return cachedDisplayWidth;
}

- (double)approximateWidth
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  double Width;
  CGRect v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController target](self, "target"));
  v3 = objc_msgSend(v2, "destination");

  if (v3 == (id)1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "screen"));
    v6 = v5;
    if (v5)
      v7 = v5;
    else
      v7 = (id)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    v8 = v7;

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  }
  objc_msgSend(v8, "bounds");
  Width = CGRectGetWidth(v11);

  return Width;
}

- (void)updateFromGuidanceState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  unsigned int v24;
  int64_t v25;
  void *v26;
  void *v27;
  unsigned int v28;
  uint64_t v29;
  id v30;
  NSObject *v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  id v43;
  id v44;
  NSObject *v45;
  void *v46;
  uint64_t v47;
  _QWORD v48[5];
  uint8_t buf[4];
  id v50;
  __int16 v51;
  __CFString *v52;
  __int16 v53;
  _BOOL4 v54;
  __int16 v55;
  _BOOL4 v56;
  __int16 v57;
  unsigned int v58;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController alternateBannerView](self, "alternateBannerView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "item"));
  objc_msgSend(v6, "updateFromGuidanceState:", v4);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController alternateBannerView](self, "alternateBannerView"));
  objc_msgSend(v7, "updateFromBannerItem");

  -[MapsBannerViewController displayWidth](self, "displayWidth");
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController bannerView](self, "bannerView"));
  objc_msgSend(v10, "sizeThatFits:", v9, 400.0);
  v12 = v11;

  -[MapsBannerViewController setPreferredContentSize:](self, "setPreferredContentSize:", v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController bannerView](self, "bannerView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "item"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "guidanceState"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController bannerView](self, "bannerView"));
  v17 = objc_msgSend(v15, "shouldExpandForSpokenEventFromGuidanceUpdate:forType:", v4, objc_msgSend(v16, "bannerType"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController bannerView](self, "bannerView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "item"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "guidanceState"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController bannerView](self, "bannerView"));
  v22 = objc_msgSend(v21, "bannerType");
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController target](self, "target"));
  v24 = objc_msgSend(v20, "shouldPresentNextGuidanceUpdate:forType:target:", v4, v22, v23);

  v25 = -[MapsBannerViewController activeLayoutMode](self, "activeLayoutMode");
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController systemApertureElementContext](self, "systemApertureElementContext"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "transitionContext"));

  v28 = -[MapsBannerViewController _useSignificantUpdateSPI](self, "_useSignificantUpdateSPI") & v24;
  if (v25 == 4)
    v29 = 0;
  else
    v29 = v28;
  v30 = sub_100431C7C();
  v31 = objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    v32 = objc_msgSend(v4, "guidanceState");
    v47 = v29;
    if ((unint64_t)v32 >= 5)
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("?? - %lu"), v32));
    else
      v33 = *(&off_1011C9480 + (_QWORD)v32);
    v34 = v33;
    v35 = objc_msgSend(v4, "maneuver");
    v36 = CFSTR("NO_TURN");
    switch((int)v35)
    {
      case 0:
        break;
      case 1:
        v36 = CFSTR("LEFT_TURN");
        break;
      case 2:
        v36 = CFSTR("RIGHT_TURN");
        break;
      case 3:
        v36 = CFSTR("STRAIGHT_AHEAD");
        break;
      case 4:
        v36 = CFSTR("U_TURN");
        break;
      case 5:
        v36 = CFSTR("FOLLOW_ROAD");
        break;
      case 6:
        v36 = CFSTR("ENTER_ROUNDABOUT");
        break;
      case 7:
        v36 = CFSTR("EXIT_ROUNDABOUT");
        break;
      case 11:
        v36 = CFSTR("OFF_RAMP");
        break;
      case 12:
        v36 = CFSTR("ON_RAMP");
        break;
      case 16:
        v36 = CFSTR("ARRIVE_END_OF_NAVIGATION");
        break;
      case 17:
        v36 = CFSTR("START_ROUTE");
        break;
      case 18:
        v36 = CFSTR("ARRIVE_AT_DESTINATION");
        break;
      case 20:
        v36 = CFSTR("KEEP_LEFT");
        break;
      case 21:
        v36 = CFSTR("KEEP_RIGHT");
        break;
      case 22:
        v36 = CFSTR("ENTER_FERRY");
        break;
      case 23:
        v36 = CFSTR("EXIT_FERRY");
        break;
      case 24:
        v36 = CFSTR("CHANGE_FERRY");
        break;
      case 25:
        v36 = CFSTR("START_ROUTE_WITH_U_TURN");
        break;
      case 26:
        v36 = CFSTR("U_TURN_AT_ROUNDABOUT");
        break;
      case 27:
        v36 = CFSTR("LEFT_TURN_AT_END");
        break;
      case 28:
        v36 = CFSTR("RIGHT_TURN_AT_END");
        break;
      case 29:
        v36 = CFSTR("HIGHWAY_OFF_RAMP_LEFT");
        break;
      case 30:
        v36 = CFSTR("HIGHWAY_OFF_RAMP_RIGHT");
        break;
      case 33:
        v36 = CFSTR("ARRIVE_AT_DESTINATION_LEFT");
        break;
      case 34:
        v36 = CFSTR("ARRIVE_AT_DESTINATION_RIGHT");
        break;
      case 35:
        v36 = CFSTR("U_TURN_WHEN_POSSIBLE");
        break;
      case 39:
        v36 = CFSTR("ARRIVE_END_OF_DIRECTIONS");
        break;
      case 41:
        v36 = CFSTR("ROUNDABOUT_EXIT_1");
        break;
      case 42:
        v36 = CFSTR("ROUNDABOUT_EXIT_2");
        break;
      case 43:
        v36 = CFSTR("ROUNDABOUT_EXIT_3");
        break;
      case 44:
        v36 = CFSTR("ROUNDABOUT_EXIT_4");
        break;
      case 45:
        v36 = CFSTR("ROUNDABOUT_EXIT_5");
        break;
      case 46:
        v36 = CFSTR("ROUNDABOUT_EXIT_6");
        break;
      case 47:
        v36 = CFSTR("ROUNDABOUT_EXIT_7");
        break;
      case 48:
        v36 = CFSTR("ROUNDABOUT_EXIT_8");
        break;
      case 49:
        v36 = CFSTR("ROUNDABOUT_EXIT_9");
        break;
      case 50:
        v36 = CFSTR("ROUNDABOUT_EXIT_10");
        break;
      case 51:
        v36 = CFSTR("ROUNDABOUT_EXIT_11");
        break;
      case 52:
        v36 = CFSTR("ROUNDABOUT_EXIT_12");
        break;
      case 53:
        v36 = CFSTR("ROUNDABOUT_EXIT_13");
        break;
      case 54:
        v36 = CFSTR("ROUNDABOUT_EXIT_14");
        break;
      case 55:
        v36 = CFSTR("ROUNDABOUT_EXIT_15");
        break;
      case 56:
        v36 = CFSTR("ROUNDABOUT_EXIT_16");
        break;
      case 57:
        v36 = CFSTR("ROUNDABOUT_EXIT_17");
        break;
      case 58:
        v36 = CFSTR("ROUNDABOUT_EXIT_18");
        break;
      case 59:
        v36 = CFSTR("ROUNDABOUT_EXIT_19");
        break;
      case 60:
        v36 = CFSTR("SHARP_LEFT_TURN");
        break;
      case 61:
        v36 = CFSTR("SHARP_RIGHT_TURN");
        break;
      case 62:
        v36 = CFSTR("SLIGHT_LEFT_TURN");
        break;
      case 63:
        v36 = CFSTR("SLIGHT_RIGHT_TURN");
        break;
      case 64:
        v36 = CFSTR("CHANGE_HIGHWAY");
        break;
      case 65:
        v36 = CFSTR("CHANGE_HIGHWAY_LEFT");
        break;
      case 66:
        v36 = CFSTR("CHANGE_HIGHWAY_RIGHT");
        break;
      case 80:
        v36 = CFSTR("TOLL_STATION");
        break;
      case 81:
        v36 = CFSTR("ENTER_TUNNEL");
        break;
      case 82:
        v36 = CFSTR("WAYPOINT_STOP");
        break;
      case 83:
        v36 = CFSTR("WAYPOINT_STOP_LEFT");
        break;
      case 84:
        v36 = CFSTR("WAYPOINT_STOP_RIGHT");
        break;
      case 85:
        v36 = CFSTR("RESUME_ROUTE");
        break;
      case 86:
        v36 = CFSTR("RESUME_ROUTE_WITH_U_TURN");
        break;
      case 87:
        v36 = CFSTR("CUSTOM");
        break;
      case 88:
        v36 = CFSTR("TURN_AROUND");
        break;
      default:
        v36 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v35));
        break;
    }
    *(_DWORD *)buf = 138413314;
    v50 = v34;
    v51 = 2112;
    v52 = v36;
    v53 = 1024;
    v54 = v25 == 4;
    v55 = 1024;
    v56 = v27 == 0;
    v57 = 1024;
    v58 = v28;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "[Persistent Banners] state:%@, maneuver:%@, isExpanded: %d, notAlreadyAnimating: %d, isSignificantUpdate: %d", buf, 0x28u);

    v29 = v47;
  }

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController bannerView](self, "bannerView"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "item"));
  objc_msgSend(v38, "updateFromGuidanceState:", v4);

  if (v25 != 4 || v27)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController bannerView](self, "bannerView"));
    objc_msgSend(v40, "updateFromBannerItem");

  }
  else
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController systemApertureElementContext](self, "systemApertureElementContext"));
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_1007ED44C;
    v48[3] = &unk_1011AC860;
    v48[4] = self;
    objc_msgSend(v39, "setElementNeedsLayoutUpdateWithOptions:coordinatedAnimations:", v29, v48);

  }
  v41 = v17 | v24;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController target](self, "target"));
  v43 = objc_msgSend(v42, "destination");

  if (v41 == 1 && v43 != (id)1)
  {
    if (self->_aperturePresentation
      && -[MapsBannerViewController _shouldExpandForGuidanceState:](self, "_shouldExpandForGuidanceState:", v4))
    {
      v44 = sub_100431C7C();
      v45 = objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController systemApertureElementContext](self, "systemApertureElementContext"));
        *(_DWORD *)buf = 138412290;
        v50 = v46;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "[Persistent Banners] Will expand on update %@", buf, 0xCu);

      }
      -[MapsBannerViewController _requestAlertingAssertionIfNecessary](self, "_requestAlertingAssertionIfNecessary");
    }
    -[MapsBannerViewController _setTimeout](self, "_setTimeout");
  }

}

- (BOOL)_shouldExpandForGuidanceState:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  BOOL v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  char isKindOfClass;
  void *v19;
  void *v20;
  double v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v5 = objc_msgSend(v4, "isCurrentlyConnectedToAnyCarScene");

  if ((v5 & 1) != 0)
  {
    v6 = 0;
    goto LABEL_21;
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication", 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "connectedScenes"));

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (!v9)
  {
LABEL_14:

LABEL_17:
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastSceneDeactivationTime"));

    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastSceneDeactivationTime"));
      objc_msgSend(v20, "timeIntervalSinceNow");
      v6 = v21 < -GEOConfigGetDouble(MapsConfig_ApertureBackgroundCooloffInterval, off_1014B49B8);

      v15 = 0;
    }
    else
    {
      v15 = 0;
      v6 = 1;
    }
    goto LABEL_20;
  }
  v10 = v9;
  v11 = *(_QWORD *)v24;
LABEL_5:
  v12 = 0;
  while (1)
  {
    if (*(_QWORD *)v24 != v11)
      objc_enumerationMutation(v8);
    v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v12);
    v14 = objc_opt_class(UIWindowScene);
    if ((objc_opt_isKindOfClass(v13, v14) & 1) == 0)
      goto LABEL_12;
    v15 = v13;
    if (!objc_msgSend(v15, "activationState"))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "delegate"));
      v17 = objc_opt_class(MapsSceneDelegate);
      isKindOfClass = objc_opt_isKindOfClass(v16, v17);

      if ((isKindOfClass & 1) != 0)
        break;
    }

LABEL_12:
    if (v10 == (id)++v12)
    {
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v10)
        goto LABEL_5;
      goto LABEL_14;
    }
  }

  if (!v15)
    goto LABEL_17;
  v6 = 0;
LABEL_20:

LABEL_21:
  return v6;
}

- (void)postTemporaryAlternateBannerView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void ***v9;
  void *v10;
  id v11;
  NSObject *v12;
  BannerView *alternateBannerView;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  MapsBannerViewController *v18;
  id v19;
  uint8_t buf[4];
  BannerView *v21;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController alternateBannerActiveTimer](self, "alternateBannerActiveTimer"));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "item"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "guidanceState"));
    v8 = -[MapsBannerViewController _shouldExpandForGuidanceState:](self, "_shouldExpandForGuidanceState:", v7);

    if (v8)
    {
      v14 = _NSConcreteStackBlock;
      v15 = 3221225472;
      v16 = sub_1007ED894;
      v17 = &unk_1011AC8B0;
      v18 = self;
      v19 = v4;
      v9 = objc_retainBlock(&v14);
      if (-[MapsBannerViewController _useSignificantUpdateSPI](self, "_useSignificantUpdateSPI", v14, v15, v16, v17, v18)&& -[SBUISystemApertureAutomaticallyInvalidatable isValid](self->_alertingAssertion, "isValid"))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController systemApertureElementContext](self, "systemApertureElementContext"));
        objc_msgSend(v10, "setElementNeedsLayoutUpdateWithOptions:coordinatedAnimations:", 1, v9);

      }
      else
      {
        ((void (*)(void ***))v9[2])(v9);
      }
      v11 = sub_100431C7C();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        alternateBannerView = self->_alternateBannerView;
        *(_DWORD *)buf = 138412290;
        v21 = alternateBannerView;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[Persistent Banners] Will expand for alerting view %@", buf, 0xCu);
      }

      -[MapsBannerViewController _requestAlertingAssertionIfNecessary](self, "_requestAlertingAssertionIfNecessary");
      -[MapsBannerViewController _revertToPrimaryBannerViewAfterDelay](self, "_revertToPrimaryBannerViewAfterDelay");
      if (-[BannerView bannerType](self->_alternateBannerView, "bannerType") == (id)2)
        AudioServicesPlaySystemSoundWithCompletion(0x55Au, 0);

    }
  }

}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height;
  double width;
  _BOOL4 waitingForDisplay;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSString *v10;
  void *v11;
  NSString *v12;
  void *v13;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  MapsBannerViewController *v18;
  CGSize v19;
  CGSize v20;

  height = a3.height;
  width = a3.width;
  self->_deferredContentSize = a3;
  waitingForDisplay = self->_waitingForDisplay;
  v7 = sub_100431C7C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (waitingForDisplay)
  {
    if (v9)
    {
      v19.width = width;
      v19.height = height;
      v10 = NSStringFromCGSize(v19);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      *(_DWORD *)buf = 138412546;
      v16 = v11;
      v17 = 2112;
      v18 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Deferring update to size %@ for %@", buf, 0x16u);

    }
  }
  else
  {
    if (v9)
    {
      v20.width = width;
      v20.height = height;
      v12 = NSStringFromCGSize(v20);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      *(_DWORD *)buf = 138412546;
      v16 = v13;
      v17 = 2112;
      v18 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Setting banner size to %@ for %@", buf, 0x16u);

    }
    v14.receiver = self;
    v14.super_class = (Class)MapsBannerViewController;
    -[MapsBannerViewController setPreferredContentSize:](&v14, "setPreferredContentSize:", width, height);
  }
}

- (UITapGestureRecognizer)knobSelectRecognizer
{
  UITapGestureRecognizer *knobSelectRecognizer;
  UITapGestureRecognizer *v4;
  UITapGestureRecognizer *v5;

  knobSelectRecognizer = self->_knobSelectRecognizer;
  if (!knobSelectRecognizer)
  {
    v4 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_handleTapOnContent:");
    v5 = self->_knobSelectRecognizer;
    self->_knobSelectRecognizer = v4;

    -[UITapGestureRecognizer setAllowedPressTypes:](self->_knobSelectRecognizer, "setAllowedPressTypes:", &off_101273DA0);
    knobSelectRecognizer = self->_knobSelectRecognizer;
  }
  return knobSelectRecognizer;
}

- (void)_setTimeout
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;
  uint8_t buf[4];
  void *v22;

  objc_initWeak(&location, self);
  if (!self->_aperturePresentation)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("__internal_MapsDebugForceStickyBanners"));

    if ((v4 & 1) == 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController bannerView](self, "bannerView"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "item"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "guidanceState"));
      if ((objc_msgSend(v7, "isSticky") & 1) != 0)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController target](self, "target"));
        v9 = objc_msgSend(v8, "destination") == (id)1;

        if (!v9)
          goto LABEL_10;
      }
      else
      {

      }
      v10 = sub_100431C7C();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController requestIdentifier](self, "requestIdentifier"));
        *(_DWORD *)buf = 138412290;
        v22 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Setting timer to dismiss banner: %@", buf, 0xCu);

      }
      v13 = &_dispatch_main_q;
      v15 = _NSConcreteStackBlock;
      v16 = 3221225472;
      v17 = sub_1007EDFB0;
      v18 = &unk_1011AE190;
      objc_copyWeak(&v19, &location);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, &v15, 10.0));
      -[MapsBannerViewController setTimeoutTimer:](self, "setTimeoutTimer:", v14, v15, v16, v17, v18);

      objc_destroyWeak(&v19);
    }
  }
LABEL_10:
  objc_destroyWeak(&location);
}

- (void)_setApertureExpansionTimeout
{
  id v3;
  void *v4;
  void **v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  v3 = &_dispatch_main_q;
  v5 = _NSConcreteStackBlock;
  v6 = 3221225472;
  v7 = sub_1007EE0D4;
  v8 = &unk_1011AE190;
  objc_copyWeak(&v9, &location);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, &v5, 7.0));
  -[MapsBannerViewController setApertureExpansionTimer:](self, "setApertureExpansionTimer:", v4, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (BOOL)_useSignificantUpdateSPI
{
  if (qword_1014D3448 != -1)
    dispatch_once(&qword_1014D3448, &stru_1011C9418);
  return byte_1014B20C0;
}

- (void)_revertToPrimaryBannerViewAfterDelay
{
  id v3;
  void *v4;
  void **v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  if (self->_aperturePresentation)
  {
    v3 = &_dispatch_main_q;
    v5 = _NSConcreteStackBlock;
    v6 = 3221225472;
    v7 = sub_1007EE31C;
    v8 = &unk_1011AE190;
    objc_copyWeak(&v9, &location);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, &v5, 10.0));
    -[MapsBannerViewController setAlternateBannerActiveTimer:](self, "setAlternateBannerActiveTimer:", v4, v5, v6, v7, v8);

    objc_destroyWeak(&v9);
  }
  objc_destroyWeak(&location);
}

- (void)_revertToPrimaryBannerView
{
  id v3;
  NSObject *v4;
  _QWORD *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[16];

  v3 = sub_100431C7C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[Persistent Banners] removing alerting expansion reason", buf, 2u);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1007EE49C;
  v7[3] = &unk_1011AC860;
  v7[4] = self;
  v5 = objc_retainBlock(v7);
  if (-[MapsBannerViewController _useSignificantUpdateSPI](self, "_useSignificantUpdateSPI")
    && -[SBUISystemApertureAutomaticallyInvalidatable isValid](self->_alertingAssertion, "isValid"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController systemApertureElementContext](self, "systemApertureElementContext"));
    objc_msgSend(v6, "setElementNeedsLayoutUpdateWithOptions:coordinatedAnimations:", 1, v5);

  }
  else
  {
    ((void (*)(_QWORD *))v5[2])(v5);
  }

}

- (void)_dismissBannerWithReason:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;

  v4 = a3;
  v5 = sub_100431C7C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController requestIdentifier](self, "requestIdentifier"));
    *(_DWORD *)buf = 138412546;
    v17 = v7;
    v18 = 2112;
    v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Revoking banner: %@ with reason: %@", buf, 0x16u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController target](self, "target"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController requestIdentifier](self, "requestIdentifier"));
  v15 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "revokePresentableWithRequestIdentifier:reason:animated:userInfo:error:", v9, v4, 1, &__NSDictionary0__struct, &v15));
  v11 = v15;

  if (!v10)
  {
    v12 = sub_100431C7C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController requestIdentifier](self, "requestIdentifier"));
      *(_DWORD *)buf = 138412546;
      v17 = v14;
      v18 = 2112;
      v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to revoke banner %@; error: %@",
        buf,
        0x16u);

    }
  }
  -[MapsBannerViewController setTimeoutTimer:](self, "setTimeoutTimer:", 0);

}

- (NSString)requesterIdentifier
{
  return (NSString *)MapsAppBundleId;
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)presentableWillAppearAsBanner:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  BannerView *bannerView;
  uint64_t v8;
  double v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;

  v4 = a3;
  v5 = sub_100431C7C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v12 = 136315394;
    v13 = "-[MapsBannerViewController presentableWillAppearAsBanner:]";
    v14 = 2112;
    v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v12, 0x16u);
  }

  bannerView = self->_bannerView;
  v8 = objc_claimAutoreleasedReturnValue(-[MapsBannerViewController view](self, "view"));
  objc_msgSend((id)v8, "frame");
  -[BannerView sizeThatFits:](bannerView, "sizeThatFits:", v9, 400.0);
  -[MapsBannerViewController setPreferredContentSize:](self, "setPreferredContentSize:");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController delegate](self, "delegate"));
  LOBYTE(v8) = objc_opt_respondsToSelector(v10, "presentableWillAppearAsBanner:");

  if ((v8 & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController delegate](self, "delegate"));
    objc_msgSend(v11, "presentableWillAppearAsBanner:", self);

  }
}

- (void)presentableDidAppearAsBanner:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;

  v4 = a3;
  v5 = sub_100431C7C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v12 = 136315394;
    v13 = "-[MapsBannerViewController presentableDidAppearAsBanner:]";
    v14 = 2112;
    v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v12, 0x16u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController bannerView](self, "bannerView"));
  v8 = objc_msgSend(v7, "bannerType");

  if (v8 == (id)2)
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 9002, 38, 0);
  -[MapsBannerViewController _setTimeout](self, "_setTimeout");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController delegate](self, "delegate"));
  v10 = objc_opt_respondsToSelector(v9, "presentableDidAppearAsBanner:");

  if ((v10 & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController delegate](self, "delegate"));
    objc_msgSend(v11, "presentableDidAppearAsBanner:", self);

  }
}

- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = sub_100431C7C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v13 = 136315650;
    v14 = "-[MapsBannerViewController presentableWillDisappearAsBanner:withReason:]";
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s %@ %@", (uint8_t *)&v13, 0x20u);
  }

  -[MapsBannerViewController setTimeoutTimer:](self, "setTimeoutTimer:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController delegate](self, "delegate"));
  v11 = objc_opt_respondsToSelector(v10, "presentableWillDisappearAsBanner:withReason:");

  if ((v11 & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController delegate](self, "delegate"));
    objc_msgSend(v12, "presentableWillDisappearAsBanner:withReason:", self, v7);

  }
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = sub_100431C7C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v14 = 136315650;
    v15 = "-[MapsBannerViewController presentableDidDisappearAsBanner:withReason:]";
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s %@ %@", (uint8_t *)&v14, 0x20u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController bannerView](self, "bannerView"));
  if ((objc_opt_respondsToSelector(v10, "wasDismissedByUser") & 1) != 0
    && ((objc_msgSend(v7, "isEqualToString:", CFSTR("BNBannerRevocationReasonDragDismissal")) & 1) != 0
     || objc_msgSend(v7, "isEqualToString:", CFSTR("DismissInteraction"))))
  {
    objc_msgSend(v10, "wasDismissedByUser");
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController delegate](self, "delegate"));
  v12 = objc_opt_respondsToSelector(v11, "presentableDidDisappearAsBanner:withReason:");

  if ((v12 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController delegate](self, "delegate"));
    objc_msgSend(v13, "presentableDidDisappearAsBanner:withReason:", self, v7);

  }
}

- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = sub_100431C7C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v13 = 136315650;
    v14 = "-[MapsBannerViewController presentableWillNotAppearAsBanner:withReason:]";
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s %@ %@", (uint8_t *)&v13, 0x20u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController delegate](self, "delegate"));
  v11 = objc_opt_respondsToSelector(v10, "presentableDidDisappearAsBanner:withReason:");

  if ((v11 & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController delegate](self, "delegate"));
    objc_msgSend(v12, "presentableDidDisappearAsBanner:withReason:", self, v7);

  }
}

- (void)_requestAlertingAssertionIfNecessary
{
  uint64_t v3;
  unsigned __int8 v4;
  unsigned __int8 v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  __CFString *v9;
  void *v10;
  unsigned int v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  SBUISystemApertureAutomaticallyInvalidatable *v16;
  SBUISystemApertureAutomaticallyInvalidatable *alertingAssertion;
  SBUISystemApertureAutomaticallyInvalidatable *v18;
  __CFString *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  void *v24;

  v3 = -[MapsBannerViewController activeLayoutMode](self, "activeLayoutMode");
  v4 = -[SBUISystemApertureAutomaticallyInvalidatable isValid](self->_alertingAssertion, "isValid");
  if (v3 < 4)
  {
LABEL_6:
    v11 = -[SBUISystemApertureAutomaticallyInvalidatable isValid](self->_alertingAssertion, "isValid");
    v12 = sub_100431C7C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
    if (v11)
    {
      if (v14)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[Persistent Banners] Resetting alerting assertion invalidation timer", buf, 2u);
      }

      -[MapsBannerViewController _setApertureExpansionTimeout](self, "_setApertureExpansionTimeout");
    }
    else
    {
      if (v14)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[Persistent Banners] Taking alerting assertion", buf, 2u);
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController systemApertureElementContext](self, "systemApertureElementContext"));
      v16 = (SBUISystemApertureAutomaticallyInvalidatable *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "requestAlertingAssertion"));
      alertingAssertion = self->_alertingAssertion;
      self->_alertingAssertion = v16;

      -[SBUISystemApertureAutomaticallyInvalidatable setAutomaticallyInvalidatable:](self->_alertingAssertion, "setAutomaticallyInvalidatable:", 0);
      -[MapsBannerViewController _setApertureExpansionTimeout](self, "_setApertureExpansionTimeout");
      objc_initWeak((id *)buf, self);
      v18 = self->_alertingAssertion;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1007EF0A0;
      v21[3] = &unk_1011C9440;
      v21[4] = self;
      objc_copyWeak(&v22, (id *)buf);
      -[SBUISystemApertureAutomaticallyInvalidatable addInvalidationBlock:](v18, "addInvalidationBlock:", v21);
      objc_destroyWeak(&v22);
      objc_destroyWeak((id *)buf);
    }
    return;
  }
  v5 = v4;
  v6 = sub_100431C7C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if ((v5 & 1) != 0)
  {
    if (v8)
    {
      v9 = sub_1007EF04C(v3);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      *(_DWORD *)buf = 138412290;
      v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[Persistent Banners] Already expanded (%@); will use alerting assertion anyway.",
        buf,
        0xCu);

    }
    goto LABEL_6;
  }
  if (v8)
  {
    v19 = sub_1007EF04C(v3);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    *(_DWORD *)buf = 138412290;
    v24 = v20;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[Persistent Banners] User expanded (%@); will not use alerting assertion.",
      buf,
      0xCu);

  }
}

- (void)_updateShowsControls
{
  uint64_t v3;
  void *v4;
  void *v5;
  unsigned int v6;
  int v7;
  void *v8;
  uint64_t v9;
  unsigned int v10;
  int v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  __CFString *v28;
  __CFString *v29;
  __CFString *v30;
  __CFString *v31;
  char *v32;
  char *v33;
  __CFString *v34;
  int v35;
  __CFString *v36;
  uint8_t buf[4];
  __CFString *v38;
  __int16 v39;
  __CFString *v40;
  __int16 v41;
  __CFString *v42;
  __int16 v43;
  __CFString *v44;
  __int16 v45;
  __CFString *v46;
  __int16 v47;
  __CFString *v48;
  __int16 v49;
  __CFString *v50;
  __int16 v51;
  __CFString *v52;

  v3 = objc_claimAutoreleasedReturnValue(-[MapsBannerViewController bannerView](self, "bannerView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v3, "item"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "guidanceState"));

  v6 = objc_msgSend(v5, "isInArrivalState");
  LODWORD(v3) = objc_msgSend(v5, "isInParkingState");
  v32 = (char *)objc_msgSend(v5, "currentLegIndex");
  v33 = (char *)objc_msgSend(v5, "numberOfLegs");
  v35 = v3;
  v7 = v6 | v3;
  if (self->_didShowControlsForArrival && (v7 & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController systemApertureElementContext](self, "systemApertureElementContext"));
    objc_msgSend(v8, "requestTransitionToPreferredLayoutMode");

  }
  self->_didShowControlsForArrival = v7;
  v9 = -[MapsBannerViewController activeLayoutMode](self, "activeLayoutMode");
  v10 = -[SBUISystemApertureAutomaticallyInvalidatable isValid](self->_alertingAssertion, "isValid");
  if (v9 > 3)
    v11 = v10 ^ 1;
  else
    v11 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController bannerView](self, "bannerView"));
  v13 = objc_msgSend(v12, "showsControls");

  v14 = v7 | v11;
  if ((v7 | v11) != v13)
  {
    v15 = sub_100431C7C();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      if ((_DWORD)v14)
        v17 = CFSTR("YES");
      else
        v17 = CFSTR("NO");
      v31 = v17;
      if (v6)
        v18 = CFSTR("YES");
      else
        v18 = CFSTR("NO");
      v30 = v18;
      if (v35)
        v19 = CFSTR("YES");
      else
        v19 = CFSTR("NO");
      v36 = v19;
      if (v32 + 1 >= v33)
        v20 = CFSTR("YES");
      else
        v20 = CFSTR("NO");
      v34 = v20;
      if (v7)
        v21 = CFSTR("YES");
      else
        v21 = CFSTR("NO");
      v29 = v21;
      if (v9 <= 3)
        v22 = CFSTR("NO");
      else
        v22 = CFSTR("YES");
      v28 = v22;
      if (v10)
        v23 = CFSTR("NO");
      else
        v23 = CFSTR("YES");
      v24 = v23;
      if (v11)
        v25 = CFSTR("YES");
      else
        v25 = CFSTR("NO");
      v14 = v14;
      v26 = v25;
      *(_DWORD *)buf = 138545154;
      v38 = v31;
      v39 = 2114;
      v40 = v30;
      v41 = 2114;
      v42 = v36;
      v43 = 2114;
      v44 = v34;
      v45 = 2114;
      v46 = v29;
      v47 = 2114;
      v48 = v28;
      v49 = 2114;
      v50 = v24;
      v51 = 2114;
      v52 = v26;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[Persistent Banners] Setting showsControls = %{public}@ (isArrived:%{public}@, isParked: %{public}@, currentLegIsLast:%{public}@, shouldShowControlsForArrival:%{public}@, isExpanded:%{public}@, userExpanded:%{public}@, shouldShowControlsForUserExpansion:%{public}@)", buf, 0x52u);

    }
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController bannerView](self, "bannerView", v28));
  objc_msgSend(v27, "setShowsControls:", v14);

}

- (id)systemApertureElementViewController
{
  id v3;
  NSObject *v4;
  uint8_t v6[16];

  v3 = sub_100431C7C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[Persistent Banners] Returning self from systemApertureElementViewController", v6, 2u);
  }

  return self;
}

- (int64_t)contentRole
{
  return 2;
}

- (BOOL)preventsInteractiveDismissal
{
  return 1;
}

- (unint64_t)presentationBehaviors
{
  return 8;
}

- (int64_t)preferredLayoutMode
{
  return 3;
}

- (int64_t)maximumLayoutMode
{
  return 4;
}

- (SBUISystemApertureAccessoryView)leadingView
{
  void *v3;

  if ((objc_opt_respondsToSelector(self->_bannerView, "leadingView") & 1) != 0)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BannerView leadingView](self->_bannerView, "leadingView"));
  else
    v3 = 0;
  return (SBUISystemApertureAccessoryView *)v3;
}

- (SBUISystemApertureAccessoryView)trailingView
{
  void *v3;

  if ((objc_opt_respondsToSelector(self->_bannerView, "leadingView") & 1) != 0)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BannerView trailingView](self->_bannerView, "trailingView"));
  else
    v3 = 0;
  return (SBUISystemApertureAccessoryView *)v3;
}

- (SBUISystemApertureAccessoryView)minimalView
{
  void *v3;

  if ((objc_opt_respondsToSelector(self->_bannerView, "minimalView") & 1) != 0)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BannerView minimalView](self->_bannerView, "minimalView"));
  else
    v3 = 0;
  return (SBUISystemApertureAccessoryView *)v3;
}

- (SBUISystemApertureAccessoryView)detachedMinimalView
{
  void *v3;

  if ((objc_opt_respondsToSelector(self->_bannerView, "detachedMinimalView") & 1) != 0)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BannerView detachedMinimalView](self->_bannerView, "detachedMinimalView"));
  else
    v3 = 0;
  return (SBUISystemApertureAccessoryView *)v3;
}

- (NSSet)backgroundActivitiesToSuppress
{
  return +[NSSet setWithObject:](NSSet, "setWithObject:", STBackgroundActivityIdentifierNavigation);
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  id v5;
  NSObject *v6;
  __CFString *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int64_t activeLayoutMode;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  CGRect v20;

  v5 = sub_100431C7C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = sub_1007EF04C(self->_activeLayoutMode);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = sub_1007EF04C(a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v16 = 138412546;
    v17 = v8;
    v18 = 2112;
    v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[Persistent Banners] Active Layout Mode %@ -> %@", (uint8_t *)&v16, 0x16u);

  }
  v11 = 12;
  if (!self->_alternateBannerView)
    v11 = 8;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR___MapsBannerViewController__requestIdentifier[v11]), "arrayByAddingObject:", self->_widthConstraint));
  activeLayoutMode = self->_activeLayoutMode;
  if (a3 > 3 || activeLayoutMode == a3)
  {
    if (a3 == 4 && activeLayoutMode != 4)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController view](self, "view"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "window"));
      objc_msgSend(v15, "frame");
      -[NSLayoutConstraint setConstant:](self->_widthConstraint, "setConstant:", CGRectGetWidth(v20));

      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);
    }
  }
  else
  {
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v12);
  }
  self->_activeLayoutMode = a3;

}

- (NSString)elementIdentifier
{
  return (NSString *)SBUISystemApertureElementIdentifierTurnByTurn;
}

- (UIColor)keyColor
{
  return +[MapsTheme apertureKeyColor](MapsTheme, "apertureKeyColor");
}

- (void)_openMaps
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;

  v3 = sub_100431C7C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController requestIdentifier](self, "requestIdentifier"));
    *(_DWORD *)buf = 138412290;
    v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Pressed banner: %@", buf, 0xCu);

  }
  v6 = (void *)objc_opt_new(_LSOpenConfiguration);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "window"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "windowScene"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_currentOpenApplicationEndpoint"));
  objc_msgSend(v6, "setTargetConnectionEndpoint:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  objc_msgSend(v11, "openApplicationWithBundleIdentifier:configuration:completionHandler:", CFSTR("com.apple.Maps"), v6, &stru_1011C9460);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController target](self, "target"));
  v18 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "revokeAllPresentablesWithReason:userInfo:error:", CFSTR("Entering Maps"), &__NSDictionary0__struct, &v18));
  v14 = v18;

  if (!v13)
  {
    v15 = sub_100431C7C();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController requestIdentifier](self, "requestIdentifier"));
      *(_DWORD *)buf = 138412546;
      v20 = v17;
      v21 = 2112;
      v22 = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to revoke banner %@; error: %@",
        buf,
        0x16u);

    }
  }

}

- (void)_handleTapOnContent:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController bannerView](self, "bannerView", a3));
  v5 = objc_msgSend(v4, "bannerType");

  if (v5 == (id)2)
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 9003, 38, 0);
  -[MapsBannerViewController _openMaps](self, "_openMaps");
}

- (void)_handleSwipeGesture:(id)a3
{
  if (objc_msgSend(a3, "direction") == (id)4)
    -[MapsBannerViewController _dismissBannerWithReason:](self, "_dismissBannerWithReason:", CFSTR("DismissInteraction"));
}

- (void)_handleBackGesture:(id)a3
{
  if (objc_msgSend(a3, "state") == (id)3)
    -[MapsBannerViewController _dismissBannerWithReason:](self, "_dismissBannerWithReason:", CFSTR("DismissInteraction"));
}

- (void)_wheelChangedWithEvent:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (objc_msgSend(v4, "type") == (id)7 && (char *)objc_msgSend(v4, "subtype") - 200 <= (char *)2)
  {
    -[MapsBannerViewController _dismissBannerWithReason:](self, "_dismissBannerWithReason:", CFSTR("DismissInteraction"));
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MapsBannerViewController;
    -[MapsBannerViewController _wheelChangedWithEvent:](&v5, "_wheelChangedWithEvent:", v4);
  }

}

- (void)generateAttachmentsForRadarDraft:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  const char *label;
  const char *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  const char *v21;
  id v22;
  id v23;
  id v24;
  NSObject *v25;
  const char *v26;
  const char *v27;
  id v28;
  NSObject *v29;
  MapsBannerViewController *v30;
  id v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  MapsBannerViewController *v35;
  _QWORD block[4];
  id v37;
  void (**v38)(_QWORD);
  id v39;
  uint8_t buf[4];
  MapsBannerViewController *v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  const char *v51;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (!v7)
  {
    v31 = sub_1004318FC();
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v41 = (MapsBannerViewController *)"-[MapsBannerViewController generateAttachmentsForRadarDraft:withCompletion:]";
      v42 = 2080;
      v43 = "MapsBannerViewController.m";
      v44 = 1024;
      v45 = 815;
      v46 = 2080;
      v47 = "completion != nil";
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v33 = sub_1004318FC();
      v34 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v35 = (MapsBannerViewController *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v41 = v35;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v9 = dispatch_queue_get_label(0);
  if (label != v9)
  {
    v10 = !label || v9 == 0;
    if (v10 || strcmp(label, v9))
    {
      v24 = sub_1004318FC();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v27 = dispatch_queue_get_label(0);
        *(_DWORD *)buf = 136316418;
        v41 = (MapsBannerViewController *)"-[MapsBannerViewController generateAttachmentsForRadarDraft:withCompletion:]";
        v42 = 2080;
        v43 = "MapsBannerViewController.m";
        v44 = 1024;
        v45 = 816;
        v46 = 2080;
        v47 = "dispatch_get_main_queue()";
        v48 = 2080;
        v49 = v26;
        v50 = 2080;
        v51 = v27;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v28 = sub_1004318FC();
        v29 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v30 = (MapsBannerViewController *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v41 = v30;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController viewIfLoaded](self, "viewIfLoaded"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController view](self, "view"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "window"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "windowScene"));

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerViewController view](self, "view"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "window"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "windowScene"));
      v18 = objc_msgSend(v17, "activationState");

      if (!v18)
      {
        objc_initWeak((id *)buf, self);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1007F0174;
        block[3] = &unk_1011B0288;
        objc_copyWeak(&v39, (id *)buf);
        v37 = v6;
        v38 = v7;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

        objc_destroyWeak(&v39);
        objc_destroyWeak((id *)buf);
        goto LABEL_19;
      }
      v19 = sub_100431C7C();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134349056;
        v41 = self;
        v21 = "[%{public}p] Activation state is not foreground active; not generating radar attachments";
LABEL_17:
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, v21, buf, 0xCu);
      }
    }
    else
    {
      v23 = sub_100431C7C();
      v20 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134349056;
        v41 = self;
        v21 = "[%{public}p] No window scene; not generating radar attachments";
        goto LABEL_17;
      }
    }
  }
  else
  {
    v22 = sub_100431C7C();
    v20 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v41 = self;
      v21 = "[%{public}p] View is not loaded yet; not generating radar attachments";
      goto LABEL_17;
    }
  }

  v7[2](v7);
LABEL_19:

}

- (int64_t)activeLayoutMode
{
  return self->_activeLayoutMode;
}

- (BannerView)bannerView
{
  return self->_bannerView;
}

- (BannerView)alternateBannerView
{
  return self->_alternateBannerView;
}

- (BNBannerSource)target
{
  return (BNBannerSource *)objc_loadWeakRetained((id *)&self->_target);
}

- (MapsBannerViewControllerDelegate)delegate
{
  return (MapsBannerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (GCDTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timeoutTimer, a3);
}

- (GCDTimer)apertureExpansionTimer
{
  return self->_apertureExpansionTimer;
}

- (void)setApertureExpansionTimer:(id)a3
{
  objc_storeStrong((id *)&self->_apertureExpansionTimer, a3);
}

- (GCDTimer)alternateBannerActiveTimer
{
  return self->_alternateBannerActiveTimer;
}

- (void)setAlternateBannerActiveTimer:(id)a3
{
  objc_storeStrong((id *)&self->_alternateBannerActiveTimer, a3);
}

- (void)setKnobSelectRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_knobSelectRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knobSelectRecognizer, 0);
  objc_storeStrong((id *)&self->_alternateBannerActiveTimer, 0);
  objc_storeStrong((id *)&self->_apertureExpansionTimer, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_target);
  objc_storeStrong((id *)&self->_alternateBannerView, 0);
  objc_storeStrong((id *)&self->_bannerView, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_alternateBannerConstraints, 0);
  objc_storeStrong((id *)&self->_bannerConstraints, 0);
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_alertingAssertion, 0);
}

@end
