@implementation CarMapWidgetChromeViewController

- (CarMapWidgetChromeViewController)initWithCarSceneType:(int64_t)a3
{
  CarMapWidgetChromeViewController *v4;
  CarMapWidgetChromeViewController *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CarMapWidgetChromeViewController;
  v4 = -[CarChromeViewController initWithCarSceneType:](&v8, "initWithCarSceneType:");
  v5 = v4;
  if ((a3 & 0xFFFFFFFFFFFFFFFCLL) != 4 && v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, "_externalDeviceStateUpdated:", CFSTR("MapsExternalDeviceUpdated"), 0);

  }
  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  UITapGestureRecognizer *v4;
  UITapGestureRecognizer *tapGesture;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CarMapWidgetChromeViewController;
  -[CarChromeViewController viewDidLoad](&v7, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetChromeViewController view](self, "view"));
  objc_msgSend(v3, "removeAllGestureRecognizers");

  v4 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_tappedMapWidget:");
  tapGesture = self->_tapGesture;
  self->_tapGesture = v4;

  -[UITapGestureRecognizer setDelegate:](self->_tapGesture, "setDelegate:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetChromeViewController view](self, "view"));
  objc_msgSend(v6, "addGestureRecognizer:", self->_tapGesture);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[4];
  id v9;
  id location;
  objc_super v11;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CarMapWidgetChromeViewController;
  -[CarMapWidgetChromeViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  if ((id)-[CarChromeViewController sceneType](self, "sceneType") == (id)7)
  {
    objc_initWeak(&location, self);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100B2B59C;
    v8[3] = &unk_1011B7368;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

- (void)didSuppress
{
  id v3;
  NSObject *v4;
  CarMapWidgetChromeViewController *v5;
  CarMapWidgetChromeViewController *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  objc_super v15;
  uint8_t buf[4];
  __CFString *v17;

  v15.receiver = self;
  v15.super_class = (Class)CarMapWidgetChromeViewController;
  -[CarChromeViewController didSuppress](&v15, "didSuppress");
  v3 = sub_1004335DC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = self;
    v6 = v5;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetChromeViewController performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    v17 = v12;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] is suppressing. Will deactivate RG for chrome.", buf, 0xCu);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "routeGeniusManager"));
  objc_msgSend(v14, "deactivateForChrome:", self);

}

- (void)didUnsuppress
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  char isKindOfClass;
  id v9;
  NSObject *v10;
  CarMapWidgetChromeViewController *v11;
  CarMapWidgetChromeViewController *v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  objc_super v21;
  uint8_t buf[4];
  __CFString *v23;

  v21.receiver = self;
  v21.super_class = (Class)CarMapWidgetChromeViewController;
  -[CarChromeViewController didUnsuppress](&v21, "didUnsuppress");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  objc_msgSend(v3, "setUserInteractionEnabled:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
  v5 = objc_opt_class(CarBasicMapBrowsingModeController);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
    v7 = objc_opt_class(CarBasicRouteGeniusModeController);
    isKindOfClass = objc_opt_isKindOfClass(v6, v7);

    if ((isKindOfClass & 1) == 0)
      return;
  }
  v9 = sub_1004335DC();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = self;
    v12 = v11;
    if (!v11)
    {
      v18 = CFSTR("<nil>");
      goto LABEL_13;
    }
    v13 = (objc_class *)objc_opt_class(v11);
    v14 = NSStringFromClass(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if ((objc_opt_respondsToSelector(v12, "accessibilityIdentifier") & 1) != 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetChromeViewController performSelector:](v12, "performSelector:", "accessibilityIdentifier"));
      v17 = v16;
      if (v16 && !objc_msgSend(v16, "isEqualToString:", v15))
      {
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v15, v12, v17));

        goto LABEL_11;
      }

    }
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v15, v12));
LABEL_11:

LABEL_13:
    *(_DWORD *)buf = 138543362;
    v23 = v18;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}@] is unsuppressing. Will try to activate RG for chrome.", buf, 0xCu);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "routeGeniusManager"));
  objc_msgSend(v20, "activateIfPossibleForChrome:", self);

}

- (void)prepareMapViewForFirstUse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CarMapWidgetChromeViewController;
  -[CarChromeViewController prepareMapViewForFirstUse](&v7, "prepareMapViewForFirstUse");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_mapLayer"));
  objc_msgSend(v4, "setApplicationUILayout:", 2);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_mapLayer"));
  objc_msgSend(v6, "setUseSmallCache:", 1);

}

- (BOOL)canShowCards
{
  return (unint64_t)-[CarChromeViewController sceneType](self, "sceneType") < 4
      || (id)-[CarChromeViewController sceneType](self, "sceneType") == (id)7
      || (id)-[CarInstrumentClusterChromeConfiguration showsETA](self->_chromeConfiguration, "showsETA") != (id)2;
}

- (BOOL)isDisplayingNavigation
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  id v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController pendingContexts](self, "pendingContexts"));
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(-[ChromeViewController contexts](self, "contexts"));
  v6 = v5;

  v7 = objc_msgSend(v6, "_maps_firstContextOfClass:", objc_opt_class(CarMapWidgetNavigationModeController));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (v8)
  {
    v9 = 1;
  }
  else
  {
    v10 = objc_msgSend(v6, "_maps_firstContextOfClass:", objc_opt_class(CarHybridInstrumentClusterNavigationModeController));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v9 = v11 != 0;

  }
  return v9;
}

- (void)configureAccessoriesOverlay:(id)a3 forContext:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  if ((unint64_t)-[CarChromeViewController sceneType](self, "sceneType") < 4
    || (id)-[CarChromeViewController sceneType](self, "sceneType") == (id)7)
  {
    v15.receiver = self;
    v15.super_class = (Class)CarMapWidgetChromeViewController;
    -[CarChromeViewController configureAccessoriesOverlay:forContext:](&v15, "configureAccessoriesOverlay:forContext:", v6, v7);
  }
  else
  {
    if ((objc_opt_respondsToSelector(v7, "showsSpeedLimit") & 1) != 0)
      v8 = objc_msgSend(v7, "showsSpeedLimit");
    else
      v8 = 0;
    v9 = 1;
    switch(-[CarInstrumentClusterChromeConfiguration showsSpeedLimit](self->_chromeConfiguration, "showsSpeedLimit"))
    {
      case 0uLL:
      case 3uLL:
        v9 = 0;
        goto LABEL_10;
      case 1uLL:
        goto LABEL_10;
      case 2uLL:
        v8 = 0;
LABEL_10:
        objc_msgSend(v6, "setShowSpeedSign:", v8);
        objc_msgSend(v6, "setSpeedSignIgnoresUserSettings:", v9);
        break;
      default:
        break;
    }
    if ((objc_opt_respondsToSelector(v7, "showsHeadingIndicator") & 1) != 0)
      v10 = objc_msgSend(v7, "showsHeadingIndicator");
    else
      v10 = 0;
    switch(-[CarInstrumentClusterChromeConfiguration showsHeadingIndicator](self->_chromeConfiguration, "showsHeadingIndicator"))
    {
      case 0uLL:
      case 3uLL:
        objc_msgSend(v6, "setShowHeadingIndicator:", v10);
        v11 = v6;
        v12 = 0;
        goto LABEL_19;
      case 1uLL:
        v13 = v6;
        v14 = v10;
        goto LABEL_18;
      case 2uLL:
        v13 = v6;
        v14 = 0;
LABEL_18:
        objc_msgSend(v13, "setShowHeadingIndicator:", v14);
        v11 = v6;
        v12 = 1;
LABEL_19:
        objc_msgSend(v11, "setHeadingIndicatorIgnoresUserSettings:", v12);
        break;
      default:
        break;
    }
  }

}

- (void)sceneConfigurationDidChange:(id)a3
{
  id v5;
  CarInstrumentClusterChromeConfiguration **p_chromeConfiguration;
  id v7;
  id v8;
  _BOOL4 v9;
  id v10;
  NSObject *v11;
  CarMapWidgetChromeViewController *v12;
  CarMapWidgetChromeViewController *v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  id v20;
  id v21;
  NSObject *v22;
  CarMapWidgetChromeViewController *v23;
  objc_class *v24;
  NSString *v25;
  void *v26;
  void *v27;
  void *v28;
  CarInstrumentClusterChromeConfiguration *v29;
  __CFString *v30;
  __CFString *v31;
  __CFString *v32;
  __CFString *v33;
  void *v34;
  unint64_t v35;
  const __CFString *v36;
  __CFString *v37;
  id v38;
  id v39;
  uint8_t buf[4];
  __CFString *v41;
  __int16 v42;
  const __CFString *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  __CFString *v47;
  __int16 v48;
  __CFString *v49;

  v5 = a3;
  if ((unint64_t)-[CarChromeViewController sceneType](self, "sceneType") <= 3)
  {
    v10 = sub_1004335DC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
LABEL_36:

      goto LABEL_37;
    }
    v12 = self;
    v13 = v12;
    if (!v12)
    {
      v19 = CFSTR("<nil>");
      goto LABEL_32;
    }
    v14 = (objc_class *)objc_opt_class(v12);
    v15 = NSStringFromClass(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    if ((objc_opt_respondsToSelector(v13, "accessibilityIdentifier") & 1) != 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetChromeViewController performSelector:](v13, "performSelector:", "accessibilityIdentifier"));
      v18 = v17;
      if (v17 && !objc_msgSend(v17, "isEqualToString:", v16))
      {
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v16, v13, v18));

        goto LABEL_12;
      }

    }
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v16, v13));
LABEL_12:

LABEL_32:
    v35 = -[CarChromeViewController sceneType](v13, "sceneType");
    if (v35 > 7)
      v36 = CFSTR(".Unknown");
    else
      v36 = off_1011E3318[v35];
    *(_DWORD *)buf = 138543618;
    v41 = v19;
    v42 = 2112;
    v43 = v36;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "[%{public}@] Received chromeConfiguration for unsupported sceneType: %@", buf, 0x16u);

    goto LABEL_36;
  }
  p_chromeConfiguration = &self->_chromeConfiguration;
  if (-[CarInstrumentClusterChromeConfiguration isEqual:](self->_chromeConfiguration, "isEqual:", v5))
    goto LABEL_37;
  v7 = -[CarInstrumentClusterChromeConfiguration showsHeadingIndicator](*p_chromeConfiguration, "showsHeadingIndicator");
  if (v7 == objc_msgSend(v5, "showsHeadingIndicator"))
  {
    v8 = -[CarInstrumentClusterChromeConfiguration showsSpeedLimit](*p_chromeConfiguration, "showsSpeedLimit");
    v9 = v8 != objc_msgSend(v5, "showsSpeedLimit");
  }
  else
  {
    v9 = 1;
  }
  v20 = -[CarInstrumentClusterChromeConfiguration showsETA](*p_chromeConfiguration, "showsETA");
  v39 = objc_msgSend(v5, "showsETA");
  v21 = sub_1004335DC();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    v38 = v20;
    v23 = self;
    v24 = (objc_class *)objc_opt_class(v23);
    v25 = NSStringFromClass(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    if ((objc_opt_respondsToSelector(v23, "accessibilityIdentifier") & 1) != 0)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetChromeViewController performSelector:](v23, "performSelector:", "accessibilityIdentifier"));
      v28 = v27;
      if (v27 && !objc_msgSend(v27, "isEqualToString:", v26))
      {
        v37 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v26, v23, v28));

        goto LABEL_20;
      }

    }
    v37 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v26, v23));
LABEL_20:

    v29 = *p_chromeConfiguration;
    if (v9)
      v30 = CFSTR("YES");
    else
      v30 = CFSTR("NO");
    v31 = v30;
    if (v38 == v39)
      v32 = CFSTR("NO");
    else
      v32 = CFSTR("YES");
    v33 = v32;
    *(_DWORD *)buf = 138544386;
    v41 = v37;
    v42 = 2112;
    v43 = (const __CFString *)v29;
    v44 = 2112;
    v45 = v5;
    v46 = 2112;
    v47 = v31;
    v48 = 2112;
    v49 = v33;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "[%{public}@] Will update chrome configuration from: %@ to :%@. needsAccessoriesUpdate: %@, needsCardsUpdate: %@", buf, 0x34u);

    v20 = v38;
  }

  objc_storeStrong((id *)&self->_chromeConfiguration, a3);
  if (v9)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
    -[CarChromeViewController reloadAccessoriesForContext:animated:](self, "reloadAccessoriesForContext:animated:", v34, -[CarMapWidgetChromeViewController isViewLoaded](self, "isViewLoaded"));

  }
  if (v20 != v39)
  {
    v11 = objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
    -[CarChromeViewController updateCardsForContext:animated:](self, "updateCardsForContext:animated:", v11, -[CarMapWidgetChromeViewController isViewLoaded](self, "isViewLoaded"));
    goto LABEL_36;
  }
LABEL_37:

}

- (void)_externalDeviceStateUpdated:(id)a3
{
  void *v4;
  char BOOL;
  id v6;
  NSObject *v7;
  CarMapWidgetChromeViewController *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  id chromeDeactivationToken;
  id v17;
  NSObject *v18;
  CarMapWidgetChromeViewController *v19;
  CarMapWidgetChromeViewController *v20;
  objc_class *v21;
  NSString *v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  uint8_t buf[4];
  __CFString *v28;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance", a3));
  if (!objc_msgSend(v4, "ownsScreen"))
  {

LABEL_13:
    v17 = sub_1004335DC();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
LABEL_23:

      chromeDeactivationToken = self->_chromeDeactivationToken;
      self->_chromeDeactivationToken = 0;
      goto LABEL_24;
    }
    v19 = self;
    v20 = v19;
    if (!v19)
    {
      v26 = CFSTR("<nil>");
      goto LABEL_22;
    }
    v21 = (objc_class *)objc_opt_class(v19);
    v22 = NSStringFromClass(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    if ((objc_opt_respondsToSelector(v20, "accessibilityIdentifier") & 1) != 0)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetChromeViewController performSelector:](v20, "performSelector:", "accessibilityIdentifier"));
      v25 = v24;
      if (v24 && !objc_msgSend(v24, "isEqualToString:", v23))
      {
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v23, v20, v25));

        goto LABEL_20;
      }

    }
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v23, v20));
LABEL_20:

LABEL_22:
    *(_DWORD *)buf = 138543362;
    v28 = v26;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[%{public}@] Releasing chrome deactivation token because we own the screen", buf, 0xCu);

    goto LABEL_23;
  }
  BOOL = GEOConfigGetBOOL(MapsConfig_CarPlayAllowActiveChromeWithoutScreenOwnership, off_1014B4AF8);

  if ((BOOL & 1) != 0)
    goto LABEL_13;
  if (self->_chromeDeactivationToken)
    return;
  v6 = sub_1004335DC();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    goto LABEL_11;
  v8 = self;
  v9 = (objc_class *)objc_opt_class(v8);
  v10 = NSStringFromClass(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetChromeViewController performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
    v13 = v12;
    if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
    {
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

      goto LABEL_10;
    }

  }
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_10:

  *(_DWORD *)buf = 138543362;
  v28 = v14;
  _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] Acquiring chrome deactivation token because we do not own the screen", buf, 0xCu);

LABEL_11:
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController acquireChromeDeactivationTokenForReason:](self, "acquireChromeDeactivationTokenForReason:", CFSTR("(no screen ownership)")));
  chromeDeactivationToken = self->_chromeDeactivationToken;
  self->_chromeDeactivationToken = v15;
LABEL_24:

}

- (void)windowWantsToZoomInDirection:(int64_t)a3
{
  id v5;
  NSObject *v6;
  CarMapWidgetChromeViewController *v7;
  CarMapWidgetChromeViewController *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  uint8_t buf[4];
  __CFString *v16;
  __int16 v17;
  int64_t v18;

  v5 = sub_1004335DC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    goto LABEL_11;
  v7 = self;
  v8 = v7;
  if (!v7)
  {
    v14 = CFSTR("<nil>");
    goto LABEL_10;
  }
  v9 = (objc_class *)objc_opt_class(v7);
  v10 = NSStringFromClass(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetChromeViewController performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
    v13 = v12;
    if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
    {
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

      goto LABEL_8;
    }

  }
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_8:

LABEL_10:
  *(_DWORD *)buf = 138543618;
  v16 = v14;
  v17 = 2048;
  v18 = a3;
  _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] windowWantsToZoomInDirection: called with direction: %ld", buf, 0x16u);

LABEL_11:
  if (a3 == 2)
  {
    -[CarChromeViewController zoomOut](self, "zoomOut");
  }
  else if (a3 == 1)
  {
    -[CarChromeViewController zoomIn](self, "zoomIn");
  }
}

- (void)_tappedMapWidget:(id)a3
{
  id v4;
  NSObject *v5;
  CarMapWidgetChromeViewController *v6;
  CarMapWidgetChromeViewController *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  uint8_t buf[4];
  __CFString *v15;

  v4 = sub_1004335DC();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = self;
    v7 = v6;
    if (!v6)
    {
      v13 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v8 = (objc_class *)objc_opt_class(v6);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if ((objc_opt_respondsToSelector(v7, "accessibilityIdentifier") & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetChromeViewController performSelector:](v7, "performSelector:", "accessibilityIdentifier"));
      v12 = v11;
      if (v11 && !objc_msgSend(v11, "isEqualToString:", v10))
      {
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v10, v7, v12));

        goto LABEL_8;
      }

    }
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v10, v7));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    v15 = v13;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] _tappedMapWidget", buf, 0xCu);

  }
  +[MapsCarPlayServicesShim openMapsCarPlayApplicationWithCompletion:](MapsCarPlayServicesShim, "openMapsCarPlayApplicationWithCompletion:", 0);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return self->_tapGesture == a3;
}

- (CarInstrumentClusterChromeConfiguration)chromeConfiguration
{
  return self->_chromeConfiguration;
}

- (void)setChromeConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_chromeConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chromeConfiguration, 0);
  objc_storeStrong(&self->_chromeDeactivationToken, 0);
  objc_storeStrong((id *)&self->_tapGesture, 0);
}

@end
