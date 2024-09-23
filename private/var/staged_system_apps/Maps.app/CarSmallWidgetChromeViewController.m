@implementation CarSmallWidgetChromeViewController

- (CarSmallWidgetChromeViewController)initWithCarSceneType:(int64_t)a3
{
  CarSmallWidgetChromeViewController *v4;
  id v5;
  NSObject *v6;
  const __CFString *v7;
  objc_super v9;
  uint8_t buf[4];
  CarSmallWidgetChromeViewController *v11;
  __int16 v12;
  const __CFString *v13;

  v9.receiver = self;
  v9.super_class = (Class)CarSmallWidgetChromeViewController;
  v4 = -[ChromeViewController init](&v9, "init");
  if (v4)
  {
    v5 = sub_10043364C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      if ((unint64_t)a3 > 7)
        v7 = CFSTR(".Unknown");
      else
        v7 = off_1011BBBF0[a3];
      *(_DWORD *)buf = 134349314;
      v11 = v4;
      v12 = 2114;
      v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] initialising with sceneType: %{public}@", buf, 0x16u);
    }

    v4->_sceneType = a3;
  }
  return v4;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  CarSmallWidgetChromeViewController *v9;

  v3 = sub_10043379C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routeGeniusManager"));
  objc_msgSend(v6, "deactivateForChrome:", self);

  v7.receiver = self;
  v7.super_class = (Class)CarSmallWidgetChromeViewController;
  -[ChromeViewController dealloc](&v7, "dealloc");
}

- (void)viewDidLoad
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  UITapGestureRecognizer *v8;
  UITapGestureRecognizer *tapGesture;
  void *v10;
  uint8_t v11[16];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CarSmallWidgetChromeViewController;
  -[ChromeViewController viewDidLoad](&v12, "viewDidLoad");
  v3 = sub_10043379C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "CarSmallWidgetChromeViewController view loaded.", v11, 2u);
  }

  if ((id)-[CarSmallWidgetChromeViewController sceneType](self, "sceneType") == (id)3)
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  else
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor crsui_dashboardWidgetBackgroundColor](UIColor, "crsui_dashboardWidgetBackgroundColor"));
  v6 = (void *)v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetChromeViewController view](self, "view"));
  objc_msgSend(v7, "setBackgroundColor:", v6);

  v8 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_tappedWidget:");
  tapGesture = self->_tapGesture;
  self->_tapGesture = v8;

  -[UITapGestureRecognizer setDelegate:](self->_tapGesture, "setDelegate:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetChromeViewController view](self, "view"));
  objc_msgSend(v10, "addGestureRecognizer:", self->_tapGesture);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  NSString *v13;
  void *v14;
  NSString *v15;
  void *v16;
  unsigned int v17;
  __CFString *v18;
  __CFString *v19;
  objc_super v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  __CFString *v26;
  CGSize v27;
  CGSize v28;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CarSmallWidgetChromeViewController;
  -[CarSmallWidgetChromeViewController viewWillTransitionToSize:withTransitionCoordinator:](&v20, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8 = sub_10043379C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetChromeViewController view](self, "view"));
    objc_msgSend(v10, "frame");
    v27.width = v11;
    v27.height = v12;
    v13 = NSStringFromCGSize(v27);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v28.width = width;
    v28.height = height;
    v15 = NSStringFromCGSize(v28);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = objc_msgSend(v7, "isAnimated");
    v18 = CFSTR("NO");
    if (v17)
      v18 = CFSTR("YES");
    v19 = v18;
    *(_DWORD *)buf = 138412802;
    v22 = v14;
    v23 = 2112;
    v24 = v16;
    v25 = 2112;
    v26 = v19;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Widget will transition from size: %@ to size: %@, animated: %@", buf, 0x20u);

  }
}

- (void)viewDidLayoutSubviews
{
  id v3;
  NSObject *v4;
  void *v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  CGRect v17;
  CGRect v18;

  v12.receiver = self;
  v12.super_class = (Class)CarSmallWidgetChromeViewController;
  -[ChromeViewController viewDidLayoutSubviews](&v12, "viewDidLayoutSubviews");
  v3 = sub_10043379C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetChromeViewController view](self, "view"));
    objc_msgSend(v5, "frame");
    v6 = NSStringFromCGRect(v17);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetChromeViewController view](self, "view"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "safeAreaLayoutGuide"));
    objc_msgSend(v9, "layoutFrame");
    v10 = NSStringFromCGRect(v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    *(_DWORD *)buf = 138412546;
    v14 = v7;
    v15 = 2112;
    v16 = v11;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Widget chromeVC didLayoutSubviews, frame: %@, safeAreaLayoutGuide: %@", buf, 0x16u);

  }
}

- (id)defaultFullscreenViewControllerPresentationTransition
{
  return -[CarSmallWidgetChromeTransitionAnimator initWithOperation:]([CarSmallWidgetChromeTransitionAnimator alloc], "initWithOperation:", 1);
}

- (id)defaultFullscreenViewControllerDismissalTransition
{
  return -[CarSmallWidgetChromeTransitionAnimator initWithOperation:]([CarSmallWidgetChromeTransitionAnimator alloc], "initWithOperation:", 2);
}

+ (BOOL)canTransitionWithoutMap
{
  return 1;
}

- (BOOL)shouldAutomaticallyLoadMapView
{
  return 0;
}

- (id)createMapReplacementView
{
  return 0;
}

- (void)didSuppress
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  CarSmallWidgetChromeViewController *v9;

  v7.receiver = self;
  v7.super_class = (Class)CarSmallWidgetChromeViewController;
  -[ChromeViewController didSuppress](&v7, "didSuppress");
  v3 = sub_1004336BC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] is suppressing. Will deactivate RG for chrome.", buf, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routeGeniusManager"));
  objc_msgSend(v6, "deactivateForChrome:", self);

}

- (void)didUnsuppress
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  CarSmallWidgetChromeViewController *v14;

  v12.receiver = self;
  v12.super_class = (Class)CarSmallWidgetChromeViewController;
  -[ChromeViewController didUnsuppress](&v12, "didUnsuppress");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
  v4 = objc_opt_class(CarSmallWidgetBrowsingModeController);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
    v6 = objc_opt_class(CarSmallWidgetRouteGeniusModeController);
    isKindOfClass = objc_opt_isKindOfClass(v5, v6);

    if ((isKindOfClass & 1) == 0)
      return;
  }
  v8 = sub_1004336BC();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v14 = self;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] is unsuppressing. Will try to activate RG for chrome.", buf, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "routeGeniusManager"));
  objc_msgSend(v11, "activateIfPossibleForChrome:", self);

}

- (void)_tappedWidget:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  CarSmallWidgetChromeViewController *v7;

  v4 = sub_10043364C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@ _tappedWidget", (uint8_t *)&v6, 0xCu);
  }

  +[MapsCarPlayServicesShim openMapsCarPlayApplicationWithCompletion:](MapsCarPlayServicesShim, "openMapsCarPlayApplicationWithCompletion:", 0);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  unsigned int v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext", a3, a4));
  v6 = objc_opt_respondsToSelector(v5, "modeHandlesGestures");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
    v8 = objc_msgSend(v7, "modeHandlesGestures") ^ 1;

  }
  else
  {
    LOBYTE(v8) = 1;
  }
  return v8;
}

- (BOOL)isEligibleForMapViewFrameRateLimiting
{
  return 0;
}

- (int64_t)sceneType
{
  return self->_sceneType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGesture, 0);
}

@end
