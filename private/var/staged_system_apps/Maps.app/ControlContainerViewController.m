@implementation ControlContainerViewController

- (CGRect)lookAroundButtonFrame
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "floatingControlsOverlay"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "floatingControlsViewController"));
  objc_msgSend(v4, "lookAroundButtonFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (Class)actionCoordinatorClass
{
  return (Class)objc_opt_class(ActionCoordinator, a2);
}

- (id)coordinator
{
  return self->_coordinator;
}

- (void)resetState
{
  ActionCoordinator *coordinator;
  id v3;

  coordinator = self->_coordinator;
  v3 = (id)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  -[ActionCoordinator viewControllerClosed:animated:](coordinator, "viewControllerClosed:animated:", v3, 0);

}

- (ControlContainerViewController)initWithPlatformController:(id)a3
{
  id v5;
  ControlContainerViewController *v6;
  ControlContainerViewController *v7;
  ActionCoordinator *v8;
  ActionCoordinator *coordinator;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  StatusIndicatorManager *v14;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ControlContainerViewController;
  v6 = -[ContainerViewController initWithNibName:bundle:](&v16, "initWithNibName:bundle:", 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_platformController, a3);
    v8 = (ActionCoordinator *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(v7), "actionCoordinatorClass")), "initWithPlatformController:", v7->_platformController);
    coordinator = v7->_coordinator;
    v7->_coordinator = v8;

    v7->_dateCreated = (NSDate *)+[NSDate now](NSDate, "now");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContainerViewController _controlContainerDimmingBehaviour](v7, "_controlContainerDimmingBehaviour"));
    -[OverlayContainerViewController setDimmingBehaviour:](v7, "setDimmingBehaviour:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "addObserver:selector:name:object:", v7, "_applicationDidBecomeActive:", UIApplicationDidBecomeActiveNotification, 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v12, "addObserver:selector:name:object:", v7, "_applicationDidEnterBackground:", UIApplicationDidEnterBackgroundNotification, 0);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v13, "addObserver:selector:name:object:", v7, "_offlineMapsStateChanged", CFSTR("UsingOfflineMapsStateChangedNotification"), 0);

    v14 = -[StatusIndicatorManager initWithDelegate:]([StatusIndicatorManager alloc], "initWithDelegate:", v7);
    -[ControlContainerViewController setStatusIndicatorManager:](v7, "setStatusIndicatorManager:", v14);

  }
  return v7;
}

- (id)keyCommands
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)ControlContainerViewController;
  v3 = -[ControlContainerViewController keyCommands](&v15, "keyCommands");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)v4;
  if (v4)
    v6 = (void *)v4;
  else
    v6 = &__NSArray0__struct;
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContainerViewController _mapViewIfCurrent](self, "_mapViewIfCurrent"));
  v9 = objc_msgSend(v8, "isFocused");

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "keyCommands"));
    v12 = v11;
    if (!v11)
      v11 = &__NSArray0__struct;
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v7));

    v7 = (id)v13;
  }
  return v7;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  objc_super v11;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "targetForAction:withSender:", a3, v6));

  if (!v8)
  {
    v11.receiver = self;
    v11.super_class = (Class)ControlContainerViewController;
    v9 = -[ControlContainerViewController targetForAction:withSender:](&v11, "targetForAction:withSender:", a3, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }

  return v8;
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  _MKMapViewSuspendedEffectsToken *mapSuspendedEffectsToken;
  objc_super v6;

  v3 = a3;
  -[_MKMapViewSuspendedEffectsToken invalidate](self->_mapSuspendedEffectsToken, "invalidate");
  mapSuspendedEffectsToken = self->_mapSuspendedEffectsToken;
  self->_mapSuspendedEffectsToken = 0;

  v6.receiver = self;
  v6.super_class = (Class)ControlContainerViewController;
  -[OverlayContainerViewController viewWillDisappear:](&v6, "viewWillDisappear:", v3);
}

- (void)setChromeViewController:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ControlContainerViewController;
  -[ContainerViewController setChromeViewController:](&v4, "setChromeViewController:", a3);
  -[ActionCoordinator setContainerViewController:](self->_coordinator, "setContainerViewController:", self);
}

- (void)refreshControls
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v2, "setNeedsUpdateComponent:animated:", CFSTR("floatingControls"), 1);

}

- (void)updateLayoutAnimated:(BOOL)a3
{
  void *v3;
  void *v4;
  char v6;
  unint64_t v7;
  _MKMapViewSuspendedEffectsToken *mapSuspendedEffectsToken;
  _MKMapViewSuspendedEffectsToken *v9;
  _MKMapViewSuspendedEffectsToken *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ControlContainerViewController;
  -[ContainerViewController updateLayoutAnimated:](&v11, "updateLayoutAnimated:", a3);
  if ((id)-[ContainerViewController containeeLayout](self, "containeeLayout") == (id)3
    || (id)-[ContainerViewController containeeLayout](self, "containeeLayout") == (id)4)
  {
    v6 = 0;
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cardPresentationController"));
    if (!objc_msgSend(v4, "takesAvailableHeight"))
      goto LABEL_13;
    v6 = 1;
  }
  v7 = -[ContainerViewController containerStyle](self, "containerStyle");
  if (v7 > 7 || ((1 << v7) & 0xA3) == 0)
  {
    if ((v6 & 1) == 0)
    {
LABEL_14:
      -[_MKMapViewSuspendedEffectsToken invalidate](self->_mapSuspendedEffectsToken, "invalidate");
      mapSuspendedEffectsToken = self->_mapSuspendedEffectsToken;
      self->_mapSuspendedEffectsToken = 0;
      goto LABEL_15;
    }
LABEL_13:

    goto LABEL_14;
  }
  if ((v6 & 1) != 0)
  {

  }
  if (!self->_mapSuspendedEffectsToken)
  {
    mapSuspendedEffectsToken = (_MKMapViewSuspendedEffectsToken *)objc_claimAutoreleasedReturnValue(-[ControlContainerViewController _mapViewIfCurrent](self, "_mapViewIfCurrent"));
    v9 = (_MKMapViewSuspendedEffectsToken *)objc_claimAutoreleasedReturnValue(-[_MKMapViewSuspendedEffectsToken beginStoppingEffects](mapSuspendedEffectsToken, "beginStoppingEffects"));
    v10 = self->_mapSuspendedEffectsToken;
    self->_mapSuspendedEffectsToken = v9;

LABEL_15:
  }
}

- (void)contentHeightUpdatedWithValue:(double)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  _BOOL8 v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)ControlContainerViewController;
  -[OverlayContainerViewController contentHeightUpdatedWithValue:](&v35, "contentHeightUpdatedWithValue:");
  v5 = -[ContainerViewController containerStyle](self, "containerStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cardPresentationController"));
  v8 = objc_msgSend(v7, "usingSheetPresentation");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cardPresentationController"));
    v5 = (unint64_t)objc_msgSend(v10, "containerStyle");

  }
  if ((v5 | 4) != 5)
    goto LABEL_19;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContainerViewController _mapViewIfCurrent](self, "_mapViewIfCurrent"));
  v12 = objc_msgSend(v11, "userTrackingMode");

  if (v12 == (id)1)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContainerViewController _mapViewIfCurrent](self, "_mapViewIfCurrent"));
    objc_msgSend(v13, "setUserTrackingMode:", 0);

  }
  if (v5 == 5)
    v14 = 1;
  else
    v14 = 2;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  objc_msgSend(v15, "heightForLayout:", v14);
  v17 = v16;

  if (v17 != a3)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContainerViewController statusIndicatorView](self, "statusIndicatorView"));
    objc_msgSend(v18, "setProminent:", 0);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  objc_msgSend(v19, "heightForLayout:", 3);
  v21 = v20;

  if (v21 != v17)
  {
    if (v17 < a3)
    {
      v22 = (a3 - v17) / (v17 * 1.10000002 - v17);
      v23 = 0.0;
      if (v22 >= 0.0)
        v24 = v22;
      else
        v24 = 0.0;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContainerViewController _mapViewIfCurrent](self, "_mapViewIfCurrent"));
      objc_msgSend(v25, "setCompassEnabled:", 0);

      if (v24 <= 1.0)
        v23 = 1.0 - v24;
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController topBannerView](self, "topBannerView"));
      objc_msgSend(v26, "setAlpha:", v23);

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "userLocationView"));
      v29 = v28;
      v30 = v23;
      goto LABEL_20;
    }
LABEL_19:
    v31 = -[ControlContainerViewController _permitCompassShowing](self, "_permitCompassShowing");
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContainerViewController _mapViewIfCurrent](self, "_mapViewIfCurrent"));
    objc_msgSend(v32, "setCompassEnabled:", v31);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController topBannerView](self, "topBannerView"));
    objc_msgSend(v33, "setAlpha:", 1.0);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "userLocationView"));
    v29 = v28;
    v30 = 1.0;
LABEL_20:
    objc_msgSend(v28, "setVlfCalloutAlpha:", v30);

    if (sub_1002A8AA0(self) == 1)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
      objc_msgSend(v34, "setNeedsUpdateComponent:animated:", CFSTR("weatherOverlay"), 1);

    }
  }
}

- (id)_mapViewIfCurrent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContainerViewController chromeContext](self, "chromeContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topIOSBasedContext"));

  if (v3 == v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapView"));

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)delaysFirstCardPresentation
{
  return 1;
}

- (BOOL)_chromeEnabled
{
  void *v2;
  void *v3;
  unsigned __int8 v4;
  char v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MKSystemController sharedInstance](MKSystemController, "sharedInstance"));
  if (objc_msgSend(v2, "isInternalInstall"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("__internal__DisableChrome"));

    v5 = v4 ^ 1;
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (id)_controlContainerDimmingBehaviour
{
  void *v2;
  DimmingBehaviour *v3;
  void *v4;
  DimmingBehaviour *v5;
  void *v6;
  DimmingBehaviour *v7;
  void *v8;
  DimmingBehaviour *v9;
  void *v10;
  OverlayContainerDimmingController *v11;
  DimmingBehaviour *v12;
  void *v13;
  OverlayContainerDimmingController *v14;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
  v3 = sub_10075C278();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend(v2, "setObject:forKey:", v4, objc_opt_class(VenueFloorCardViewController));

  v5 = sub_10075C2B8();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v2, "setObject:forKey:", v6, objc_opt_class(PedestrianARFeatureIntroTeachableMomentContaineeViewController));

  v7 = sub_10075C2B8();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v2, "setObject:forKey:", v8, objc_opt_class(PedestrianARRaiseToEnterTeachableMomentContaineeViewController));

  v9 = sub_10075C2B8();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v2, "setObject:forKey:", v10, objc_opt_class(MapsSaveRouteContainee));

  v11 = [OverlayContainerDimmingController alloc];
  v12 = sub_10075C31C(&stru_1011C5AA0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = -[OverlayContainerDimmingController initWithDimmingBehaviour:customBehaviours:](v11, "initWithDimmingBehaviour:customBehaviours:", v13, v2);

  return v14;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ControlContainerViewController;
  -[OverlayContainerViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContainerViewController statusIndicatorManager](self, "statusIndicatorManager"));
  objc_msgSend(v3, "updateIndicatorType");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController topContentView](self, "topContentView"));
  objc_msgSend(v4, "setHidden:", 1);

}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  unint64_t v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  if (objc_msgSend(v2, "userInterfaceIdiom") == (id)1)
  {
    v3 = 30;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    if (objc_msgSend(v4, "userInterfaceIdiom") == (id)5)
      v3 = 30;
    else
      v3 = 26;

  }
  return v3;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ControlContainerViewController;
  -[OverlayContainerViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));

  if (!v4)
    -[ActionCoordinator viewControllerClosed:animated:](self->_coordinator, "viewControllerClosed:animated:", 0, 1);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  _QWORD v21[5];
  id v22;
  uint64_t v23;
  uint64_t v24;
  objc_super v25;
  uint8_t buf[4];
  id v27;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v8 = sub_100431B2C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "ControlContainer viewWillTransitionToSize %@", buf, 0xCu);
  }

  v25.receiver = self;
  v25.super_class = (Class)ControlContainerViewController;
  -[OverlayContainerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v25, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContainerViewController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "window"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "windowScene"));

  if (!objc_msgSend(v12, "activationState") || objc_msgSend(v12, "activationState") == (id)1)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContainerViewController chromeContext](self, "chromeContext"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "topIOSBasedContext"));

    if (v13 == v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "mapView"));

      objc_msgSend(v17, "centerCoordinate");
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100587C48;
      v21[3] = &unk_1011BBCF0;
      v23 = v18;
      v24 = v19;
      v21[4] = self;
      v22 = v17;
      v20 = v17;
      objc_msgSend(v7, "animateAlongsideTransition:completion:", &stru_1011BBCC8, v21);

    }
  }

}

- (void)_applicationDidEnterBackground:(id)a3
{
  CGRect *p_frameWhenEnteringBackground;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  id v8;

  p_frameWhenEnteringBackground = &self->_frameWhenEnteringBackground;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[ControlContainerViewController viewIfLoaded](self, "viewIfLoaded", a3));
  objc_msgSend(v8, "frame");
  p_frameWhenEnteringBackground->origin.x = v4;
  p_frameWhenEnteringBackground->origin.y = v5;
  p_frameWhenEnteringBackground->size.width = v6;
  p_frameWhenEnteringBackground->size.height = v7;

}

- (void)_applicationDidBecomeActive:(id)a3
{
  void *v4;
  BOOL v5;
  CGSize size;
  CGRect v7;

  if (-[ActionCoordinator isRoutePlanningPresented](self->_coordinator, "isRoutePlanningPresented", a3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContainerViewController view](self, "view"));
    objc_msgSend(v4, "frame");
    v5 = CGRectEqualToRect(v7, self->_frameWhenEnteringBackground);

    if (!v5)
      -[ActionCoordinator ensureRoutePlanningContentIsVisible](self->_coordinator, "ensureRoutePlanningContentIsVisible");
  }
  size = CGRectZero.size;
  self->_frameWhenEnteringBackground.origin = CGRectZero.origin;
  self->_frameWhenEnteringBackground.size = size;
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  char isKindOfClass;
  objc_super v10;

  v4 = a3;
  v6 = a4;
  if (!-[ContainerViewController delaysFirstCardPresentation]_0()
    || (v7 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContainerViewController presentedViewController](self, "presentedViewController")),
        v8 = objc_opt_class(ContaineeViewController),
        isKindOfClass = objc_opt_isKindOfClass(v7, v8),
        v7,
        (isKindOfClass & 1) == 0))
  {
    v10.receiver = self;
    v10.super_class = (Class)ControlContainerViewController;
    -[ControlContainerViewController dismissViewControllerAnimated:completion:](&v10, "dismissViewControllerAnimated:completion:", v4, v6);
  }

}

- (BOOL)isRootContainer
{
  return 1;
}

- (unint64_t)originalLayoutForViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cardPresentationController"));
    v8 = (unint64_t)objc_msgSend(v7, "defaultContaineeLayout");

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cardPresentationController"));
    v8 = (unint64_t)objc_msgSend(v6, "defaultContaineeLayout");
  }

  if (!v8)
  {
    if ((id)-[ContainerViewController containerStyle](self, "containerStyle") == (id)5
      || (id)-[ContainerViewController containerStyle](self, "containerStyle") == (id)4)
    {
      v8 = 3;
    }
    else if ((id)-[ContainerViewController containerStyle](self, "containerStyle") == (id)6)
    {
      v8 = 3;
    }
    else
    {
      v8 = 2;
    }
  }

  return v8;
}

- (void)containerStyleManagerWillChangeStyle:(unint64_t)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ControlContainerViewController;
  -[ContainerViewController containerStyleManagerWillChangeStyle:](&v3, "containerStyleManagerWillChangeStyle:", a3);
}

- (void)containerStyleManagerDidChangeStyle:(unint64_t)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ControlContainerViewController;
  -[ContainerViewController containerStyleManagerDidChangeStyle:](&v9, "containerStyleManagerDidChangeStyle:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  v5 = objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___FloatingControlsProtocol);

  if (v5)
  {
    -[ControlContainerViewController refreshControls](self, "refreshControls");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
    objc_msgSend(v6, "setNeedsUpdateComponent:animated:", CFSTR("weatherOverlay"), 1);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
    objc_msgSend(v7, "setNeedsUpdateComponent:animated:", CFSTR("lookAroundButton"), 1);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContainerViewController statusIndicatorView](self, "statusIndicatorView"));
    objc_msgSend(v8, "setProminent:", 0);

  }
}

- (int64_t)floatingControlsOptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char isKindOfClass;
  void *v11;
  char v12;
  void *v13;
  id v14;

  if ((id)-[ContainerViewController containerStyle](self, "containerStyle") != (id)6)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presentedViewController"));
    if (objc_msgSend(v4, "isBeingDismissed"))
    {

    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "presentedViewController"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "presentationController"));
      v8 = objc_opt_class(CustomContaineePresentationController);
      isKindOfClass = objc_opt_isKindOfClass(v7, v8);

      if ((isKindOfClass & 1) != 0)
        return 0;
    }
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  v12 = objc_opt_respondsToSelector(v11, "floatingControlsOptions");

  if ((v12 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    v14 = objc_msgSend(v13, "floatingControlsOptions");

    return (int64_t)v14;
  }
  else if (sub_1002A8AA0(self) == 5)
  {
    return 76;
  }
  else
  {
    return 72;
  }
}

- (BOOL)_permitCompassShowing
{
  void *v3;
  unsigned __int8 v4;
  uint64_t v5;
  char v6;

  if (!-[ControlContainerViewController _chromeEnabled](self, "_chromeEnabled"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentOrPendingViewController](self, "currentOrPendingViewController"));
  do
  {
    v4 = objc_msgSend(v3, "isMemberOfClass:", objc_opt_class(SettingsViewController));
    if ((v4 & 1) != 0)
      break;
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presentedViewController"));

    v3 = (void *)v5;
  }
  while (v5);
  v6 = v4 ^ 1;

  return v6;
}

- (void)presentController:(id)a3 animated:(BOOL)a4 useDefaultContaineeLayout:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  objc_super v16;

  v7 = a5;
  v8 = a4;
  v10 = a3;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  v13 = (id)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));

  v16.receiver = self;
  v16.super_class = (Class)ControlContainerViewController;
  -[OverlayContainerViewController presentController:animated:useDefaultContaineeLayout:completion:](&v16, "presentController:animated:useDefaultContaineeLayout:completion:", v10, v8, v7, v11);

  if (v13 != v10)
  {
    if (v12)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContainerViewController statusIndicatorView](self, "statusIndicatorView"));
      objc_msgSend(v14, "setProminent:", 0);

    }
    -[ControlContainerViewController _setUpdateContentInjectionBlockForController:](self, "_setUpdateContentInjectionBlockForController:", v10);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v15, "setNeedsUpdateComponent:animated:", CFSTR("floatingControls"), 1);

}

- (void)removeControllersFromStack:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v3 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "conformsToProtocol:", &OBJC_PROTOCOL___ContaineeContentInjection))
          objc_msgSend(v8, "removeContentFromMapView");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)replaceCurrentWithController:(id)a3 moveToContaineeLayout:(unint64_t)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));

  v8.receiver = self;
  v8.super_class = (Class)ControlContainerViewController;
  -[ContainerViewController replaceCurrentWithController:moveToContaineeLayout:](&v8, "replaceCurrentWithController:moveToContaineeLayout:", v6, a4);
  if (v7 != v6)
    -[ControlContainerViewController _setUpdateContentInjectionBlockForController:](self, "_setUpdateContentInjectionBlockForController:", v6);

}

- (void)willPresentContainee:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)ControlContainerViewController;
  -[ContainerViewController willPresentContainee:animated:](&v8, "willPresentContainee:animated:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v6, "setNeedsUpdateComponent:animated:", CFSTR("lookAroundButton"), v4);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v7, "setNeedsUpdateComponent:animated:", CFSTR("weatherOverlay"), v4);

}

- (void)transitionAlongsideContainee:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a4;
  v9.receiver = self;
  v9.super_class = (Class)ControlContainerViewController;
  v6 = a3;
  -[ContainerViewController transitionAlongsideContainee:animated:](&v9, "transitionAlongsideContainee:animated:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController", v9.receiver, v9.super_class));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "transitionCoordinator"));

  objc_msgSend(v7, "updateComponentsIfNeededWithTansitionCoordinator:", v8);
}

- (void)_setUpdateContentInjectionBlockForController:(id)a3
{
  id v4;
  id v5;
  void **v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  id v10;
  id location;

  v4 = a3;
  if ((objc_opt_respondsToSelector(v4, "setUpdateContentInjection:") & 1) != 0)
  {
    v5 = v4;
    objc_initWeak(&location, self);
    v6 = _NSConcreteStackBlock;
    v7 = 3221225472;
    v8 = sub_1005887DC;
    v9 = &unk_1011BBD18;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v5, "setUpdateContentInjection:", &v6);
    objc_msgSend(v5, "addContentToMapView", v6, v7, v8, v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);

  }
}

- (void)updateContentInjection
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  if ((objc_opt_respondsToSelector(v2, "removeContentFromMapView") & 1) != 0)
    objc_msgSend(v2, "removeContentFromMapView");
  if ((objc_opt_respondsToSelector(v2, "addContentToMapView") & 1) != 0)
    objc_msgSend(v2, "addContentToMapView");

}

- (int64_t)preferredUserInterfaceStyle
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  v3 = objc_msgSend(v2, "preferredUserInterfaceStyle");

  return (int64_t)v3;
}

- (UIView)passThroughView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "passThroughView"));

  return (UIView *)v3;
}

- (void)_cancelAllOngoingGesturesBeingRecognizedInView:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "gestureRecognizers", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "isEnabled"))
        {
          objc_msgSend(v8, "setEnabled:", 0);
          objc_msgSend(v8, "setEnabled:", 1);
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)mapView:(id)a3 didBecomePitched:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ControlContainerViewController;
  -[ContainerViewController mapView:didBecomePitched:](&v5, "mapView:didBecomePitched:", a3, a4);
  -[ActionCoordinator finishExitFrom3dMode](self->_coordinator, "finishExitFrom3dMode");
}

- (void)mapView:(id)a3 didChangeLookAroundAvailability:(int64_t)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController", a3, a4));
  objc_msgSend(v4, "setNeedsUpdateComponent:animated:", CFSTR("lookAroundButton"), 1);

}

- (void)mapView:(id)a3 didChangeMapType:(unint64_t)a4
{
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  LOBYTE(a2) = objc_opt_respondsToSelector(v7, a2);

  if ((a2 & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    objc_msgSend(v8, "mapView:didChangeMapType:", v9, a4);

  }
}

- (BOOL)mapViewShouldHandleTapToDeselect:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venuesManager](self->_coordinator, "venuesManager"));
  LOBYTE(a2) = objc_opt_respondsToSelector(v6, a2);

  if ((a2 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venuesManager](self->_coordinator, "venuesManager"));
    v8 = objc_msgSend(v7, "mapViewShouldHandleTapToDeselect:", v5);

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (void)mapViewDidChangeVisibleRegion:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  LOBYTE(a2) = objc_opt_respondsToSelector(v5, a2);

  if ((a2 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    objc_msgSend(v6, "mapViewDidChangeVisibleRegion:", v7);

  }
}

- (void)mapView:(id)a3 regionWillChangeAnimated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;

  v4 = a4;
  v13 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  v8 = objc_opt_respondsToSelector(v7, a2);

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    objc_msgSend(v9, "mapView:regionDidChangeAnimated:", v13, v4);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContainerViewController chromeContext](self, "chromeContext"));
  v11 = objc_opt_respondsToSelector(v10, a2);

  if ((v11 & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContainerViewController chromeContext](self, "chromeContext"));
    objc_msgSend(v12, "mapView:regionWillChangeAnimated:", v13, v4);

  }
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  objc_super v15;

  v4 = a4;
  v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ControlContainerViewController;
  -[ContainerViewController mapView:regionDidChangeAnimated:](&v15, "mapView:regionDidChangeAnimated:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  LOBYTE(a2) = objc_opt_respondsToSelector(v8, a2);

  if ((a2 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    objc_msgSend(v9, "mapView:regionDidChangeAnimated:", v7, v4);

  }
  -[ActionCoordinator finishExitFrom3dMode](self->_coordinator, "finishExitFrom3dMode");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator appCoordinator](self->_coordinator, "appCoordinator"));
  objc_msgSend(v10, "setNeedsUserActivityUpdate");

  -[NSDate timeIntervalSinceNow](self->_dateCreated, "timeIntervalSinceNow");
  v12 = v11;
  -[NSDate timeIntervalSinceNow](self->_dateCreated, "timeIntervalSinceNow");
  if (v12 < 0.0)
    v13 = -v13;
  if (v13 > 5.0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContainerViewController statusIndicatorView](self, "statusIndicatorView"));
    objc_msgSend(v14, "setProminent:", 0);

  }
}

- (void)mapView:(id)a3 didChangeFocusedVenue:(id)a4 focusedBuilding:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venuesManager](self->_coordinator, "venuesManager"));
  LOBYTE(a2) = objc_opt_respondsToSelector(v11, a2);

  if ((a2 & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venuesManager](self->_coordinator, "venuesManager"));
    objc_msgSend(v12, "mapView:didChangeFocusedVenue:focusedBuilding:", v13, v9, v10);

  }
}

- (void)mapView:(id)a3 didChangeDisplayedFloorOrdinal:(signed __int16)a4 forVenue:(id)a5
{
  uint64_t v6;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v12 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venuesManager](self->_coordinator, "venuesManager"));
  LOBYTE(a2) = objc_opt_respondsToSelector(v10, a2);

  if ((a2 & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venuesManager](self->_coordinator, "venuesManager"));
    objc_msgSend(v11, "mapView:didChangeDisplayedFloorOrdinal:forVenue:", v12, v6, v9);

  }
}

- (void)mapView:(id)a3 willStartRespondingToGesture:(int64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  void *v9;
  void *v10;
  id v11;

  v5 = a5;
  v11 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  LOBYTE(a2) = objc_opt_respondsToSelector(v9, a2);

  if ((a2 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    objc_msgSend(v10, "mapView:willStartRespondingToGesture:animated:", v11, a4, v5);

  }
}

- (void)mapView:(id)a3 didStopRespondingToGesture:(int64_t)a4 zoomDirection:(int64_t)a5 zoomGestureType:(int64_t)a6 didDecelerate:(BOOL)a7 tiltDirection:(int64_t)a8
{
  _BOOL8 v9;
  void *v15;
  void *v16;
  id v17;

  v9 = a7;
  v17 = a3;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  LOBYTE(a2) = objc_opt_respondsToSelector(v15, a2);

  if ((a2 & 1) != 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    objc_msgSend(v16, "mapView:didStopRespondingToGesture:zoomDirection:zoomGestureType:didDecelerate:tiltDirection:", v17, a4, a5, a6, v9, a8);

  }
}

- (void)mapView:(id)a3 didChangeUserTrackingMode:(int64_t)a4 animated:(BOOL)a5 fromTrackingButton:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  id v18;

  v6 = a6;
  v7 = a5;
  v18 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venuesManager](self->_coordinator, "venuesManager"));
  v12 = objc_opt_respondsToSelector(v11, a2);

  if ((v12 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venuesManager](self->_coordinator, "venuesManager"));
    objc_msgSend(v13, "mapView:didChangeUserTrackingMode:animated:fromTrackingButton:", v18, a4, v7, v6);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  v15 = objc_opt_respondsToSelector(v14, a2);

  if ((v15 & 1) != 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    objc_msgSend(v16, "mapView:didChangeUserTrackingMode:animated:fromTrackingButton:", v18, a4, v7, v6);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchSessionManager](self->_coordinator, "searchSessionManager"));
  objc_msgSend(v17, "clearLastSearchSessionViewport");

}

- (void)mapView:(id)a3 didChangeUserTrackingMode:(int64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  objc_super v17;

  v5 = a5;
  v9 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ControlContainerViewController;
  -[ContainerViewController mapView:didChangeUserTrackingMode:animated:](&v17, "mapView:didChangeUserTrackingMode:animated:", v9, a4, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venuesManager](self->_coordinator, "venuesManager"));
  v11 = objc_opt_respondsToSelector(v10, a2);

  if ((v11 & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venuesManager](self->_coordinator, "venuesManager"));
    objc_msgSend(v12, "mapView:didChangeUserTrackingMode:animated:", v9, a4, v5);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  v14 = objc_opt_respondsToSelector(v13, a2);

  if ((v14 & 1) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    objc_msgSend(v15, "mapView:didChangeUserTrackingMode:animated:", v9, a4, v5);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchSessionManager](self->_coordinator, "searchSessionManager"));
  objc_msgSend(v16, "clearLastSearchSessionViewport");

}

- (void)mapView:(id)a3 didUpdateUserLocation:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venuesManager](self->_coordinator, "venuesManager"));
  LOBYTE(a2) = objc_opt_respondsToSelector(v8, a2);

  if ((a2 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venuesManager](self->_coordinator, "venuesManager"));
    objc_msgSend(v9, "mapView:didUpdateUserLocation:", v10, v7);

  }
}

- (void)mapViewDidStartUserInteraction:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ControlContainerViewController;
  -[ContainerViewController mapViewDidStartUserInteraction:](&v5, "mapViewDidStartUserInteraction:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContainerViewController statusIndicatorView](self, "statusIndicatorView"));
  objc_msgSend(v4, "setProminent:", 0);

}

- (void)mapView:(id)a3 calloutPrimaryActionTriggeredForLabelMarker:(id)a4
{
  -[ControlContainerViewController expandPlaceCardController](self, "expandPlaceCardController", a3, a4);
}

- (void)mapView:(id)a3 calloutPrimaryActionTriggeredForAnnotationView:(id)a4
{
  -[ControlContainerViewController expandPlaceCardController](self, "expandPlaceCardController", a3, a4);
}

- (void)expandPlaceCardController
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  v4 = objc_opt_class(PlaceCardViewController);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cardPresentationController"));
    objc_msgSend(v6, "wantsLayout:", 2);

  }
}

- (void)didTapMapView:(id)a3 atPoint:(CGPoint)a4
{
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  unsigned int v12;
  id v13;

  -[ActionCoordinator didTapMapView:atPoint:](self->_coordinator, "didTapMapView:atPoint:", a3, a4.x, a4.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKSystemController sharedInstance](MKSystemController, "sharedInstance"));
  v6 = objc_msgSend(v5, "isInternalInstall");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapSelectionManager](self->_coordinator, "mapSelectionManager"));
    if (objc_msgSend(v7, "hasSelection"))
    {

    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v9 = objc_msgSend(v8, "BOOLForKey:", CFSTR("__internal__EnabletapToMinimize"));

      if (v9)
      {
        v13 = (id)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "cardPresentationController"));
        objc_msgSend(v10, "wantsLayout:", 1);

LABEL_7:
        return;
      }
    }
    v13 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapSelectionManager](self->_coordinator, "mapSelectionManager"));
    if (objc_msgSend(v13, "hasSelection"))
      goto LABEL_7;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v12 = objc_msgSend(v11, "BOOLForKey:", CFSTR("__internal__EnabletapToHide"));

    if (v12)
      -[ControlContainerViewController setChromeHidden:](self, "setChromeHidden:", -[ContainerViewController chromeHidden](self, "chromeHidden") ^ 1);
  }
}

- (void)setChromeHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];

  v3 = a3;
  if (-[ContainerViewController chromeHidden](self, "chromeHidden") != a3)
  {
    v15.receiver = self;
    v15.super_class = (Class)ControlContainerViewController;
    -[ContainerViewController setChromeHidden:](&v15, "setChromeHidden:", v3);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController visibleCardViews](self, "visibleCardViews", 0));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9), "setHidden:", v3);
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      }
      while (v7);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController topContentView](self, "topContentView"));
    objc_msgSend(v10, "setHidden:", v3);

  }
}

- (StatusIndicatorView)statusIndicatorView
{
  StatusIndicatorView *statusIndicatorView;
  StatusIndicatorView *v4;
  StatusIndicatorView *v5;

  statusIndicatorView = self->_statusIndicatorView;
  if (!statusIndicatorView)
  {
    v4 = -[StatusIndicatorView initWithFrame:]([StatusIndicatorView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_statusIndicatorView;
    self->_statusIndicatorView = v4;

    -[StatusIndicatorView setTarget:action:](self->_statusIndicatorView, "setTarget:action:", self, "_didTapStatusIndicatorView:");
    statusIndicatorView = self->_statusIndicatorView;
  }
  return statusIndicatorView;
}

- (void)_captureStatusIndicatorViewTapAction:(int)a3
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  id v6;

  v3 = *(_QWORD *)&a3;
  v4 = -[ControlContainerViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics");
  if (v4 > 300)
  {
    if ((v4 - 301) < 5 || v4 == 607)
    {
      v5 = 504;
      goto LABEL_6;
    }
LABEL_10:
    v5 = 0;
    goto LABEL_6;
  }
  if ((v4 - 8) >= 6)
  {
    if (v4 == 201)
    {
      v5 = 501;
      goto LABEL_6;
    }
    goto LABEL_10;
  }
  v5 = 502;
LABEL_6:
  v6 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v6, "captureUserAction:onTarget:eventValue:", v3, v5, 0);

}

- (void)_didTapStatusIndicatorView:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = objc_msgSend(a3, "type");
  if (v4 == (id)8)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v5, "captureUserAction:onTarget:eventValue:", 390, 83, 0);

    v6 = (id)objc_claimAutoreleasedReturnValue(-[ControlContainerViewController coordinator](self, "coordinator"));
    objc_msgSend(v6, "viewControllerShowOfflineMaps:", 0);
  }
  else if (v4 == (id)6)
  {
    -[ControlContainerViewController _captureStatusIndicatorViewTapAction:](self, "_captureStatusIndicatorViewTapAction:", 61);
    v6 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    objc_msgSend(v6, "promptPreciseLocationOff");
  }
  else
  {
    if (v4 != (id)5)
      return;
    v6 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    objc_msgSend(v6, "promptLocationServicesOff");
  }

}

- (void)statusIndicatorTypeChanged:(unint64_t)a3
{
  _BOOL8 v5;
  void *v6;
  id v7;

  v5 = -[ControlContainerViewController _appearState](self, "_appearState") == 2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContainerViewController statusIndicatorView](self, "statusIndicatorView"));
  objc_msgSend(v6, "setType:", a3);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[ControlContainerViewController iosBasedChromeViewController](self, "iosBasedChromeViewController"));
  objc_msgSend(v7, "setNeedsUpdateComponent:animated:", CFSTR("statusBarSupplementaryView"), v5);

}

- (id)statusBarBackgroundViewStyle
{
  return +[StatusBarBackgroundViewStyle defaultBlurredStyleWithDefaultColorProvider:](StatusBarBackgroundViewStyle, "defaultBlurredStyleWithDefaultColorProvider:", &stru_1011BE7E0);
}

- (id)statusBarSupplementaryView
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContainerViewController statusIndicatorView](self, "statusIndicatorView"));
  if (objc_msgSend(v3, "isVisible"))
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContainerViewController statusIndicatorView](self, "statusIndicatorView"));
  else
    v4 = 0;

  return v4;
}

- (id)_topBannerViewHorizontalConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSArray *v17;
  void *v19;
  objc_super v20;
  _QWORD v21[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "floatingControlsOverlay"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "floatingControlsViewController"));

  if (v5)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController topBannerView](self, "topBannerView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "leadingAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController overlayView](self, "overlayView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
    v9 = objc_msgSend(v6, "constraintEqualToAnchor:constant:", v8, sub_1005EC29C());
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v21[0] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController topBannerView](self, "topBannerView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "trailingAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "floatingButtonLeadingGuide"));
    v14 = objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, -sub_1005EC29C());
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v21[1] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 2));

  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)ControlContainerViewController;
    v17 = -[OverlayContainerViewController _topBannerViewHorizontalConstraints](&v20, "_topBannerViewHorizontalConstraints");
    v16 = (void *)objc_claimAutoreleasedReturnValue(v17);
  }

  return v16;
}

- (double)_topBannerMaxHeight
{
  void *v3;
  id v4;
  double result;
  void *v6;
  void *v7;
  void *v8;
  double Height;
  objc_super v10;
  CGRect v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContainerViewController traitCollection](self, "traitCollection"));
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == (id)5)
  {
    v10.receiver = self;
    v10.super_class = (Class)ControlContainerViewController;
    -[OverlayContainerViewController _topBannerMaxHeight](&v10, "_topBannerMaxHeight");
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "floatingControlsOverlay"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "floatingControlsViewController"));

    objc_msgSend(v8, "floatingButtonsFrame");
    Height = CGRectGetHeight(v11);

    return Height;
  }
  return result;
}

- (void)updateTopBannerViewWithTopBannerItems:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  objc_super v9;

  v4 = a3;
  -[OverlayContainerViewController topEdgeInset](self, "topEdgeInset");
  v6 = v5;
  v9.receiver = self;
  v9.super_class = (Class)ControlContainerViewController;
  -[OverlayContainerViewController updateTopBannerViewWithTopBannerItems:](&v9, "updateTopBannerViewWithTopBannerItems:", v4);

  if (-[ActionCoordinator isRoutePlanningPresented](self->_coordinator, "isRoutePlanningPresented"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContainerViewController view](self, "view"));
    objc_msgSend(v7, "layoutIfNeeded");

    -[OverlayContainerViewController topEdgeInset](self, "topEdgeInset");
    if (vabdd_f64(v6, v8) > 2.22044605e-16)
      -[ActionCoordinator ensureRoutePlanningContentIsVisible](self->_coordinator, "ensureRoutePlanningContentIsVisible");
  }
}

- (void)_offlineMapsStateChanged
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v3, "setNeedsUpdateComponent:animated:", CFSTR("lookAroundButton"), 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v4, "setNeedsUpdateComponent:animated:", CFSTR("weatherOverlay"), 1);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v5, "setNeedsUpdateComponent:animated:", CFSTR("floatingControls"), 1);

}

- (int)currentUITargetForAnalytics
{
  void *v3;
  unsigned int v4;
  int v5;
  objc_super v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContainerViewController coordinator](self, "coordinator"));
  if ((objc_opt_respondsToSelector(v3, "currentUITargetForAnalytics") & 1) != 0)
  {
    v4 = objc_msgSend(v3, "currentUITargetForAnalytics");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)ControlContainerViewController;
    v4 = -[ContainerViewController currentUITargetForAnalytics](&v7, "currentUITargetForAnalytics");
  }
  v5 = v4;

  return v5;
}

- (int)currentMapViewTargetForAnalytics
{
  void *v3;
  unsigned int v4;
  int v5;
  objc_super v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContainerViewController coordinator](self, "coordinator"));
  if ((objc_opt_respondsToSelector(v3, "currentMapViewTargetForAnalytics") & 1) != 0)
  {
    v4 = objc_msgSend(v3, "currentMapViewTargetForAnalytics");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)ControlContainerViewController;
    v4 = -[ContainerViewController currentMapViewTargetForAnalytics](&v7, "currentMapViewTargetForAnalytics");
  }
  v5 = v4;

  return v5;
}

- (FloatingControlsPresentation)floatingControlsPresentationController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "floatingControlsOverlay"));

  return (FloatingControlsPresentation *)v3;
}

- (IOSBasedChromeContext)chromeContext
{
  return (IOSBasedChromeContext *)objc_loadWeakRetained((id *)&self->_chromeContext);
}

- (void)setChromeContext:(id)a3
{
  objc_storeWeak((id *)&self->_chromeContext, a3);
}

- (ActionCoordinator)actionCoordinator
{
  return self->_coordinator;
}

- (PlatformController)platformController
{
  return self->_platformController;
}

- (void)setPlatformController:(id)a3
{
  objc_storeStrong((id *)&self->_platformController, a3);
}

- (StatusIndicatorManager)statusIndicatorManager
{
  return self->_statusIndicatorManager;
}

- (void)setStatusIndicatorManager:(id)a3
{
  objc_storeStrong((id *)&self->_statusIndicatorManager, a3);
}

- (void)setStatusIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_statusIndicatorView, a3);
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (void)setDateCreated:(id)a3
{
  self->_dateCreated = (NSDate *)a3;
}

- (UIViewController)viewControllerInActivePresentation
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_viewControllerInActivePresentation);
}

- (void)setViewControllerInActivePresentation:(id)a3
{
  objc_storeWeak((id *)&self->_viewControllerInActivePresentation, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewControllerInActivePresentation);
  objc_storeStrong((id *)&self->_statusIndicatorView, 0);
  objc_storeStrong((id *)&self->_statusIndicatorManager, 0);
  objc_storeStrong((id *)&self->_platformController, 0);
  objc_destroyWeak((id *)&self->_chromeContext);
  objc_storeStrong((id *)&self->_mapSuspendedEffectsToken, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
}

@end
