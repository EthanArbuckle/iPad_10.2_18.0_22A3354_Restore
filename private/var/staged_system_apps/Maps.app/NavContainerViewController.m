@implementation NavContainerViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NavContainerViewController)initWithCoordinator:(id)a3 guidanceObserver:(id)a4 platformController:(id)a5
{
  id v8;
  id v9;
  id v10;
  NavContainerViewController *v11;
  NavContainerViewController *v12;
  OverlayContainerDimmingController *v13;
  void *v14;
  StatusIndicatorManager *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  PedestrianARSessionStateManager *pedestrianARSessionStateManager;
  objc_super v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)NavContainerViewController;
  v11 = -[ContainerViewController initWithNibName:bundle:](&v25, "initWithNibName:bundle:", 0, 0);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_guidanceObserver, a4);
    v12->_signStyle = 1;
    objc_storeStrong((id *)&v12->_platformController, a5);
    -[NavContainerViewController setCoordinator:](v12, "setCoordinator:", v8);
    v13 = sub_1004B484C();
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[OverlayContainerViewController setDimmingBehaviour:](v12, "setDimmingBehaviour:", v14);

    v15 = -[StatusIndicatorManager initWithDelegate:]([StatusIndicatorManager alloc], "initWithDelegate:", v12);
    -[NavContainerViewController setStatusIndicatorManager:](v12, "setStatusIndicatorManager:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MapsLightLevelController sharedController](MapsLightLevelController, "sharedController"));
    objc_msgSend(v16, "addObserver:", v12);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    objc_msgSend(v17, "registerObserver:", v12);

    if (GEOConfigGetBOOL(MapsConfig_BacklightSceneUpdaterOptimizationEnabled, off_1014B49F8))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v18, "addObserver:selector:name:object:", v12, "_updateBacklightSceneEnvironmentUI", CFSTR("NavContainerShouldUpdateBacklightSceneEnvironmentNotification"), 0);

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v19, "addObserver:selector:name:object:", v12, "vlfSessionTaskWillShowVLFUINotification:", CFSTR("VLFSessionTaskWillShowVLFUINotification"), 0);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v20, "addObserver:selector:name:object:", v12, "vlfContaineeViewControllerDidDisappearNotification:", off_1014BB950, 0);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v21, "addObserver:selector:name:object:", v12, "statusBarHeightChanged", CFSTR("IOSBasedChromeStatusBarHeightDidUpdateNotification"), 0);

    v22 = objc_claimAutoreleasedReturnValue(-[PlatformController pedestrianARSessionStateManager](v12->_platformController, "pedestrianARSessionStateManager"));
    pedestrianARSessionStateManager = v12->_pedestrianARSessionStateManager;
    v12->_pedestrianARSessionStateManager = (PedestrianARSessionStateManager *)v22;

  }
  return v12;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  NSString *v5;
  void *v6;
  objc_super v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsLightLevelController sharedController](MapsLightLevelController, "sharedController"));
  objc_msgSend(v3, "removeObserver:", self);

  if (self->_observingCollapsedHeight)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController navSignViewController](self, "navSignViewController"));
    v5 = NSStringFromSelector("collapsedHeight");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    objc_msgSend(v4, "removeObserver:forKeyPath:", self, v6);

  }
  v7.receiver = self;
  v7.super_class = (Class)NavContainerViewController;
  -[NavContainerViewController dealloc](&v7, "dealloc");
}

- (NavLaneGuidanceViewController)laneGuidanceViewController
{
  NavLaneGuidanceViewController *laneGuidanceViewController;
  NavLaneGuidanceViewController *v4;
  NavLaneGuidanceViewController *v5;

  laneGuidanceViewController = self->_laneGuidanceViewController;
  if (!laneGuidanceViewController)
  {
    v4 = -[NavLaneGuidanceViewController initWithDelegate:blurGroup:]([NavLaneGuidanceViewController alloc], "initWithDelegate:blurGroup:", self, CFSTR("NavSignBlur"));
    v5 = self->_laneGuidanceViewController;
    self->_laneGuidanceViewController = v4;

    laneGuidanceViewController = self->_laneGuidanceViewController;
  }
  return laneGuidanceViewController;
}

- (NavSignListViewController)navSignViewController
{
  NavSignListViewController *navSignViewController;
  NavSignListViewController *v4;
  NavSignListViewController *v5;

  navSignViewController = self->_navSignViewController;
  if (!navSignViewController)
  {
    v4 = -[NavSignListViewController initWithSignDelegate:]([NavSignListViewController alloc], "initWithSignDelegate:", self);
    v5 = self->_navSignViewController;
    self->_navSignViewController = v4;

    navSignViewController = self->_navSignViewController;
  }
  return navSignViewController;
}

- (void)insertDimmingOverlayForStaleMapEffectWithBlock:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  NavIndicatorsViewController *indicatorsViewController;
  int v18;
  id v19;
  __int16 v20;
  void *v21;

  if (self->_isArrivalState)
  {
    v5 = a3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController view](self, "view"));
    v7 = (*((uint64_t (**)(id, void *))a3 + 2))(v5, v6);
    v8 = (id)objc_claimAutoreleasedReturnValue(v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController speedLimitView](self->_indicatorsViewController, "speedLimitView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "superview"));

    v11 = sub_100431C0C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
    if (v10)
    {
      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController speedLimitView](self->_indicatorsViewController, "speedLimitView"));
        v18 = 138543618;
        v19 = v8;
        v20 = 2114;
        v21 = v14;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Inserting %{public}@ below %{public}@", (uint8_t *)&v18, 0x16u);

      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController view](self, "view"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NavIndicatorsViewController speedLimitView](self->_indicatorsViewController, "speedLimitView"));
      objc_msgSend(v15, "insertSubview:belowSubview:", v8, v16);

    }
    else
    {
      if (v13)
      {
        v18 = 138543362;
        v19 = v8;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Inserting %{public}@", (uint8_t *)&v18, 0xCu);
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController view](self, "view"));
      objc_msgSend(v15, "addSubview:", v8);
    }

  }
  else
  {
    indicatorsViewController = self->_indicatorsViewController;
    v8 = a3;
    -[NavIndicatorsViewController insertDimmingOverlayForStaleMapEffectWithBlock:](indicatorsViewController, "insertDimmingOverlayForStaleMapEffectWithBlock:", v8);
  }

}

- (NavJunctionViewController)junctionViewController
{
  NavJunctionViewController *junctionViewController;
  NavJunctionViewController *v4;
  NavJunctionViewController *v5;

  junctionViewController = self->_junctionViewController;
  if (!junctionViewController)
  {
    v4 = objc_opt_new(NavJunctionViewController);
    v5 = self->_junctionViewController;
    self->_junctionViewController = v4;

    -[NavJunctionViewController setDelegate:](self->_junctionViewController, "setDelegate:", self);
    junctionViewController = self->_junctionViewController;
  }
  return junctionViewController;
}

- (NavSecondarySignViewController)secondarySignViewController
{
  NavSecondarySignViewController *secondarySignViewController;
  NavSecondarySignViewController *v4;
  NavSecondarySignViewController *v5;

  secondarySignViewController = self->_secondarySignViewController;
  if (!secondarySignViewController)
  {
    v4 = objc_opt_new(NavSecondarySignViewController);
    v5 = self->_secondarySignViewController;
    self->_secondarySignViewController = v4;

    secondarySignViewController = self->_secondarySignViewController;
  }
  return secondarySignViewController;
}

- (NavIndicatorsViewController)indicatorsViewController
{
  NavIndicatorsViewController *indicatorsViewController;
  NavIndicatorsViewController *v4;
  void *v5;
  void *v6;
  NavIndicatorsViewController *v7;
  NavIndicatorsViewController *v8;

  indicatorsViewController = self->_indicatorsViewController;
  if (!indicatorsViewController)
  {
    v4 = [NavIndicatorsViewController alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController platformController](self, "platformController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pedestrianARSessionStateManager"));
    v7 = -[NavIndicatorsViewController initWithDelegate:pedestrianARSessionStateManager:](v4, "initWithDelegate:pedestrianARSessionStateManager:", self, v6);
    v8 = self->_indicatorsViewController;
    self->_indicatorsViewController = v7;

    indicatorsViewController = self->_indicatorsViewController;
  }
  return indicatorsViewController;
}

- (NavTrafficIncidentAlertCoordination)trafficIncidentAlertCoordinator
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController coordinator](self, "coordinator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "trafficIncidentAlertCoordinator"));

  return (NavTrafficIncidentAlertCoordination *)v3;
}

- (id)mapView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mapView"));

  return v3;
}

- (BOOL)allowsDisplayOnLockScreen
{
  return 1;
}

- (BOOL)hasBigStatusBar
{
  void *v2;
  double v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController view](self, "view"));
  objc_msgSend(v2, "safeAreaInsets");
  v4 = v3 > 40.0;

  return v4;
}

- (void)_showTemporaryStatusBar
{
  NSTimer *v3;
  NSTimer *temporaryStatusBarHidingTimer;
  _QWORD v5[5];

  if (!-[NavContainerViewController hasBigStatusBar](self, "hasBigStatusBar"))
  {
    -[NavContainerViewController setShowingTemporaryStatusBar:](self, "setShowingTemporaryStatusBar:", 1);
    v3 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_hideTemporaryStatusBar", 0, 0, 5.0));
    temporaryStatusBarHidingTimer = self->_temporaryStatusBarHidingTimer;
    self->_temporaryStatusBarHidingTimer = v3;

    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100C60F90;
    v5[3] = &unk_1011AC860;
    v5[4] = self;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v5, 0.25);
  }
}

- (void)_hideTemporaryStatusBar
{
  NSTimer *temporaryStatusBarHidingTimer;
  _QWORD v4[5];

  if (!-[NavContainerViewController hasBigStatusBar](self, "hasBigStatusBar"))
  {
    -[NavContainerViewController setShowingTemporaryStatusBar:](self, "setShowingTemporaryStatusBar:", 0);
    -[NSTimer invalidate](self->_temporaryStatusBarHidingTimer, "invalidate");
    temporaryStatusBarHidingTimer = self->_temporaryStatusBarHidingTimer;
    self->_temporaryStatusBarHidingTimer = 0;

    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100C610A4;
    v4[3] = &unk_1011AC860;
    v4[4] = self;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v4, 0.25);
  }
}

- (void)toggleTemporaryStatusBar
{
  if (-[NavContainerViewController showingTemporaryStatusBar](self, "showingTemporaryStatusBar"))
    -[NavContainerViewController _hideTemporaryStatusBar](self, "_hideTemporaryStatusBar");
  else
    -[NavContainerViewController _showTemporaryStatusBar](self, "_showTemporaryStatusBar");
}

- (void)hideStatusBarIfNeeded
{
  if (-[NavContainerViewController showingTemporaryStatusBar](self, "showingTemporaryStatusBar"))
    -[NavContainerViewController _hideTemporaryStatusBar](self, "_hideTemporaryStatusBar");
}

- (void)statusBarHeightChanged
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController navSignViewController](self, "navSignViewController"));
  objc_msgSend(v3, "updateFooterConstraints");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[NavContainerViewController view](self, "view"));
  objc_msgSend(v4, "layoutIfNeeded");

}

- (int64_t)preferredStatusBarStyle
{
  int64_t v2;
  void *v4;
  void *v5;
  unint64_t v6;
  _BOOL4 connectedToCarPlay;

  if (!self->_vlfActive)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    if (objc_msgSend(v4, "userInterfaceIdiom") != (id)1)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
      if (objc_msgSend(v5, "userInterfaceIdiom") != (id)5)
      {
        v6 = -[ContainerViewController containerStyle](self, "containerStyle");
        if (v6 <= 7
          && ((1 << v6) & 0xE3) != 0
          && (id)-[ContainerViewController containerStyle](self, "containerStyle") != (id)7)
        {
          if (!self->_isArrivalState)
          {

            v2 = 1;
            goto LABEL_11;
          }
          connectedToCarPlay = self->_connectedToCarPlay;

          if (connectedToCarPlay)
            return 1;
LABEL_10:
          v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController theme](self, "theme"));
          v2 = (int64_t)objc_msgSend(v4, "statusBarStyle");
LABEL_11:

          return v2;
        }
      }

    }
    goto LABEL_10;
  }
  return 0;
}

- (id)statusBarBackgroundViewStyle
{
  void *v3;
  void *v4;
  unint64_t v5;
  StatusBarBackgroundViewStyle *v6;
  _BOOL4 connectedToCarPlay;

  if (self->_vlfActive)
    goto LABEL_9;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  if (objc_msgSend(v3, "userInterfaceIdiom") != (id)1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    if (objc_msgSend(v4, "userInterfaceIdiom") != (id)5)
    {
      v5 = -[ContainerViewController containerStyle](self, "containerStyle");
      if (v5 <= 7
        && ((1 << v5) & 0xE3) != 0
        && (id)-[ContainerViewController containerStyle](self, "containerStyle") != (id)7)
      {
        if (self->_isArrivalState)
        {
          connectedToCarPlay = self->_connectedToCarPlay;

          if (!connectedToCarPlay)
            goto LABEL_9;
        }
        else
        {

        }
        v6 = -[StatusBarBackgroundViewStyle initWithBlurStyle:groupName:defaultColorProvider:disableBlur:]([StatusBarBackgroundViewStyle alloc], "initWithBlurStyle:groupName:defaultColorProvider:disableBlur:", 19, CFSTR("NavSignBlur"), &stru_1011EA450, 1);
        return v6;
      }
    }

  }
LABEL_9:
  v6 = (StatusBarBackgroundViewStyle *)objc_claimAutoreleasedReturnValue(+[StatusBarBackgroundViewStyle defaultBlurredStyleWithDefaultColorProvider:](StatusBarBackgroundViewStyle, "defaultBlurredStyleWithDefaultColorProvider:", &stru_1011BE7E0));
  return v6;
}

- (void)updateStatusBarColor
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  id v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  id v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController traitCollection](self, "traitCollection"));
  v4 = objc_msgSend(v3, "isLuminanceReduced");

  if ((v4 & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController laneGuidanceViewController](self, "laneGuidanceViewController"));
    if (objc_msgSend(v5, "hasLaneGuidance"))
    {

    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController navSignViewController](self, "navSignViewController"));
      v7 = objc_msgSend(v6, "hasElevationGraph");

      if (!v7)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController navSignViewController](self, "navSignViewController"));
        objc_msgSend(v13, "activeStepFadeIn");
        v15 = v14;

        if (v15 <= 0.0)
        {
          v21 = 0;
          goto LABEL_7;
        }
        v16 = sub_1006E66E4();
        v9 = (void *)objc_claimAutoreleasedReturnValue(v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController navSignViewController](self, "navSignViewController"));
        objc_msgSend(v10, "layoutProgress");
        v18 = v17 * 0.239999995;
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController navSignViewController](self, "navSignViewController"));
        objc_msgSend(v19, "activeStepFadeIn");
        v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "colorWithAlphaComponent:", v18 * v20));

LABEL_6:
LABEL_7:
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController iosBasedChromeViewController](self, "iosBasedChromeViewController"));
        objc_msgSend(v12, "setStatusBarAdditionalColor:", v21);

        return;
      }
    }
    v8 = sub_1006E66E4();
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController navSignViewController](self, "navSignViewController"));
    objc_msgSend(v10, "layoutProgress");
    v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "colorWithAlphaComponent:", v11 * 0.239999995));
    goto LABEL_6;
  }
}

- (void)updateLaneGuidanceBackgroundColor
{
  void *v3;
  unsigned __int8 v4;
  double v5;
  double v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController traitCollection](self, "traitCollection"));
  v4 = objc_msgSend(v3, "isLuminanceReduced");

  if ((v4 & 1) == 0)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[NavContainerViewController navSignViewController](self, "navSignViewController"));
    objc_msgSend(v8, "layoutProgress");
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController laneGuidanceViewController](self, "laneGuidanceViewController"));
    objc_msgSend(v7, "setLayoutProgress:", v6);

  }
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *laneGuidanceHeightConstraint;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSString *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
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
  UIButton *v38;
  UIButton *recenterButton;
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
  double v51;
  double height;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NavContainerResumeRouteControl *v57;
  NavContainerResumeRouteControl *resumeRouteBanner;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  PassThroughView *v68;
  UIView *navSignContainerView;
  UIView *v70;
  void *v71;
  void *v72;
  UIView *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  NSLayoutConstraint *v78;
  NSLayoutConstraint *signTopConstraint;
  void *v80;
  void *v81;
  NSLayoutConstraint *v82;
  NSLayoutConstraint *secondarySignTopConstraint;
  void *v84;
  void *v85;
  NSLayoutConstraint *v86;
  NSLayoutConstraint *junctionViewTopConstraint;
  NSLayoutConstraint *v88;
  NSLayoutConstraint *v89;
  NSLayoutConstraint *v90;
  NSLayoutConstraint *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  objc_super v141;
  _QWORD v142[18];

  v141.receiver = self;
  v141.super_class = (Class)NavContainerViewController;
  -[OverlayContainerViewController viewDidLoad](&v141, "viewDidLoad");
  +[CATransaction setFrameStallSkipRequest:](CATransaction, "setFrameStallSkipRequest:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController laneGuidanceViewController](self, "laneGuidanceViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController laneGuidanceViewController](self, "laneGuidanceViewController"));
  -[ContainerViewController addChildViewController:](self, "addChildViewController:", v5);

  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "heightAnchor"));
  v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToConstant:", 0.0));
  laneGuidanceHeightConstraint = self->_laneGuidanceHeightConstraint;
  self->_laneGuidanceHeightConstraint = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController laneGuidanceViewController](self, "laneGuidanceViewController"));
  objc_msgSend(v9, "didMoveToParentViewController:", self);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layer"));
  objc_msgSend(v10, "setCornerRadius:", 10.0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController navSignViewController](self, "navSignViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController navSignViewController](self, "navSignViewController"));
  -[ContainerViewController addChildViewController:](self, "addChildViewController:", v13);

  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController navSignViewController](self, "navSignViewController"));
  objc_msgSend(v14, "didMoveToParentViewController:", self);

  self->_observingCollapsedHeight = 1;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController navSignViewController](self, "navSignViewController"));
  v16 = NSStringFromSelector("collapsedHeight");
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  objc_msgSend(v15, "addObserver:forKeyPath:options:context:", self, v17, 1, 0);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController containerStyleManager](self, "containerStyleManager"));
  objc_msgSend(v18, "containerWidth");
  v20 = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController navSignViewController](self, "navSignViewController"));
  objc_msgSend(v21, "setCardWidth:", v20);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController secondarySignViewController](self, "secondarySignViewController"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "view"));

  objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController secondarySignViewController](self, "secondarySignViewController"));
  -[ContainerViewController addChildViewController:](self, "addChildViewController:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController secondarySignViewController](self, "secondarySignViewController"));
  objc_msgSend(v25, "didMoveToParentViewController:", self);

  v26 = v23;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "layer"));
  objc_msgSend(v27, "setCornerRadius:", 10.0);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController junctionViewController](self, "junctionViewController"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "view"));

  objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v29, "setHidden:", 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController junctionViewController](self, "junctionViewController"));
  -[ContainerViewController addChildViewController:](self, "addChildViewController:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController junctionViewController](self, "junctionViewController"));
  objc_msgSend(v31, "didMoveToParentViewController:", self);

  v140 = v29;
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "layer"));
  objc_msgSend(v32, "setCornerRadius:", 10.0);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController indicatorsViewController](self, "indicatorsViewController"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "view"));

  v138 = v34;
  objc_msgSend(v34, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController indicatorsViewController](self, "indicatorsViewController"));
  -[ContainerViewController addChildViewController:](self, "addChildViewController:", v35);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController indicatorsViewController](self, "indicatorsViewController"));
  objc_msgSend(v36, "didMoveToParentViewController:", self);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController statusIndicatorManager](self, "statusIndicatorManager"));
  objc_msgSend(v37, "updateIndicatorType");

  v38 = objc_opt_new(UIButton);
  recenterButton = self->_recenterButton;
  self->_recenterButton = v38;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_recenterButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration borderlessButtonConfiguration](UIButtonConfiguration, "borderlessButtonConfiguration"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 5, 22.0));
  objc_msgSend(v40, "setPreferredSymbolConfigurationForImage:", v41);

  v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("NavigationMaterialColor")));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "background"));
  objc_msgSend(v43, "setBackgroundColor:", v42);

  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "background"));
  objc_msgSend(v44, "setCornerRadius:", 30.0);

  objc_msgSend(v40, "setCornerStyle:", -1);
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("location.fill")));
  objc_msgSend(v40, "setImage:", v45);

  v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  -[UIButton setTintColor:](self->_recenterButton, "setTintColor:", v46);

  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("[Navigation] Recenter"), CFSTR("localized string not found"), 0));
  -[UIButton setAccessibilityLabel:](self->_recenterButton, "setAccessibilityLabel:", v48);

  -[UIButton addTarget:action:forControlEvents:](self->_recenterButton, "addTarget:action:forControlEvents:", self, "_pressedRecenterButton", 64);
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](self->_recenterButton, "layer"));
  objc_msgSend(v49, "setCornerRadius:", 30.0);

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](self->_recenterButton, "layer"));
  LODWORD(v51) = 1045220557;
  objc_msgSend(v50, "setShadowOpacity:", v51);

  height = CGSizeZero.height;
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](self->_recenterButton, "layer"));
  objc_msgSend(v53, "setShadowOffset:", CGSizeZero.width, height);

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](self->_recenterButton, "layer"));
  objc_msgSend(v54, "setShadowRadius:", 1.0);

  v55 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](self->_recenterButton, "layer"));
  objc_msgSend(v55, "setShadowPathIsBounds:", 1);

  -[UIButton _setTouchInsets:](self->_recenterButton, "_setTouchInsets:", -8.0, -16.0, -8.0, -16.0);
  -[UIButton setAccessibilityIdentifier:](self->_recenterButton, "setAccessibilityIdentifier:", CFSTR("RecenterButton"));
  v137 = v40;
  -[UIButton setConfiguration:](self->_recenterButton, "setConfiguration:", v40);
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController view](self, "view"));
  objc_msgSend(v56, "insertSubview:atIndex:", self->_recenterButton, 0);

  v57 = -[NavContainerResumeRouteControl initWithFrame:]([NavContainerResumeRouteControl alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  resumeRouteBanner = self->_resumeRouteBanner;
  self->_resumeRouteBanner = v57;

  v59 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController resumeRouteBanner](self, "resumeRouteBanner"));
  objc_msgSend(v59, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v60 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController resumeRouteBanner](self, "resumeRouteBanner"));
  objc_msgSend(v60, "addTarget:action:forControlEvents:", self, "_performBannerAction", 64);

  v61 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController resumeRouteBanner](self, "resumeRouteBanner"));
  objc_msgSend(v61, "addTarget:action:forControlEvents:", self, "_closeBannerAction", 0x1000000);

  v62 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
  LODWORD(v48) = objc_msgSend(v62, "isInternalInstall");

  if ((_DWORD)v48)
  {
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v63, "addObserver:selector:name:object:", self, "_navigationChromeVisibilityChanged", CFSTR("__internal__hideChromeInNavigation"), 0);

  }
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v64, "addObserver:selector:name:object:", self, "_containeeLayoutWillChange:", CFSTR("ContainerWillChangeLayoutNotification"), 0);

  v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v65, "addObserver:selector:name:object:", self, "_containeeLayoutDidChange:", CFSTR("ContainerDidChangeLayoutNotification"), 0);

  v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v66, "addObserver:selector:name:object:", self, "_containeeWillPresent:", CFSTR("ContainerWillPresentContaineeNotification"), 0);

  v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v67, "addObserver:selector:name:object:", self, "_containeeDidPresent:", CFSTR("ContainerDidPresentContaineeNotification"), 0);

  v68 = objc_opt_new(PassThroughView);
  navSignContainerView = self->_navSignContainerView;
  self->_navSignContainerView = (UIView *)v68;

  -[UIView setAccessibilityIdentifier:](self->_navSignContainerView, "setAccessibilityIdentifier:", CFSTR("NavSignContainerView"));
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_navSignContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setClipsToBounds:](self->_navSignContainerView, "setClipsToBounds:", 1);
  v70 = self->_navSignContainerView;
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController secondarySignViewController](self, "secondarySignViewController"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "view"));
  -[UIView addSubview:](v70, "addSubview:", v72);

  v73 = self->_navSignContainerView;
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController junctionViewController](self, "junctionViewController"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "view"));
  -[UIView addSubview:](v73, "addSubview:", v75);

  -[UIView addSubview:](self->_navSignContainerView, "addSubview:", v12);
  -[UIView addSubview:](self->_navSignContainerView, "addSubview:", v4);
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "topAnchor"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_navSignContainerView, "topAnchor"));
  v78 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "constraintEqualToAnchor:", v77));
  signTopConstraint = self->_signTopConstraint;
  self->_signTopConstraint = v78;

  v139 = v26;
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "topAnchor"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_navSignContainerView, "topAnchor"));
  v82 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "constraintEqualToAnchor:", v81));
  secondarySignTopConstraint = self->_secondarySignTopConstraint;
  self->_secondarySignTopConstraint = v82;

  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "topAnchor"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_navSignContainerView, "topAnchor"));
  v86 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "constraintEqualToAnchor:", v85));
  junctionViewTopConstraint = self->_junctionViewTopConstraint;
  self->_junctionViewTopConstraint = v86;

  v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
  v133 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_navSignContainerView, "leadingAnchor"));
  v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "constraintEqualToAnchor:", v133));
  v142[0] = v132;
  v134 = v4;
  v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
  v130 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_navSignContainerView, "trailingAnchor"));
  v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "constraintEqualToAnchor:", v130));
  v142[1] = v129;
  v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v126 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_navSignContainerView, "topAnchor"));
  v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "constraintEqualToAnchor:", v126));
  v88 = self->_laneGuidanceHeightConstraint;
  v142[2] = v125;
  v142[3] = v88;
  v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "leadingAnchor"));
  v124 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_navSignContainerView, "leadingAnchor"));
  v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v136, "constraintEqualToAnchor:", v124));
  v142[4] = v123;
  v127 = v12;
  v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "widthAnchor"));
  v121 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_navSignContainerView, "widthAnchor"));
  v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "constraintEqualToAnchor:", v121));
  v89 = self->_signTopConstraint;
  v142[5] = v120;
  v142[6] = v89;
  v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bottomAnchor"));
  v118 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_navSignContainerView, "bottomAnchor"));
  v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "constraintEqualToAnchor:", v118));
  v142[7] = v117;
  v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "leadingAnchor"));
  v115 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_navSignContainerView, "leadingAnchor"));
  v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "constraintEqualToAnchor:", v115));
  v142[8] = v114;
  v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "trailingAnchor"));
  v112 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_navSignContainerView, "trailingAnchor"));
  v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "constraintEqualToAnchor:", v112));
  v90 = self->_secondarySignTopConstraint;
  v142[9] = v111;
  v142[10] = v90;
  v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "leadingAnchor"));
  v109 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_navSignContainerView, "leadingAnchor"));
  v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "constraintEqualToAnchor:", v109));
  v142[11] = v108;
  v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "trailingAnchor"));
  v106 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_navSignContainerView, "trailingAnchor"));
  v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "constraintEqualToAnchor:", v106));
  v91 = self->_junctionViewTopConstraint;
  v142[12] = v105;
  v142[13] = v91;
  v103 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_recenterButton, "leadingAnchor"));
  v104 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController innerLayoutGuide](self, "innerLayoutGuide"));
  v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "leadingAnchor"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "constraintEqualToAnchor:", v102));
  v142[14] = v92;
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_recenterButton, "bottomAnchor"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController innerLayoutGuide](self, "innerLayoutGuide"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "bottomAnchor"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "constraintEqualToAnchor:", v95));
  v142[15] = v96;
  v97 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_recenterButton, "widthAnchor"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "constraintEqualToConstant:", 60.0));
  v142[16] = v98;
  v99 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_recenterButton, "heightAnchor"));
  v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "constraintEqualToConstant:", 60.0));
  v142[17] = v100;
  v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v142, 18));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v101);

}

- (void)viewDidMoveToParent
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
  NSLayoutConstraint *v13;
  NSLayoutConstraint *portraitIndicatorsTopConstraint;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSLayoutConstraint *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSArray *v25;
  NSArray *portraitIndicatorsConstraints;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSLayoutConstraint *v31;
  NSLayoutConstraint *landscapeIndicatorsTrailingConstraint;
  NSLayoutConstraint *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSArray *v43;
  NSArray *landscapeIndicatorsConstraints;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD v54[5];
  _QWORD v55[4];
  _QWORD v56[4];

  -[NavContainerViewController _teardownViewHierarchy](self, "_teardownViewHierarchy");
  self->_layoutSetup = 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController containerStyleManager](self, "containerStyleManager"));
  objc_msgSend(v3, "containerWidth");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController navSignViewController](self, "navSignViewController"));
  objc_msgSend(v6, "setCardWidth:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController indicatorsViewController](self, "indicatorsViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "viewportLayoutGuide"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topAnchor"));
  v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v12));
  portraitIndicatorsTopConstraint = self->_portraitIndicatorsTopConstraint;
  self->_portraitIndicatorsTopConstraint = v13;

  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "leadingAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController view](self, "view"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "safeAreaLayoutGuide"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "leadingAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v46));
  v56[0] = v45;
  v53 = v8;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trailingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController view](self, "view"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "safeAreaLayoutGuide"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v18));
  v20 = self->_portraitIndicatorsTopConstraint;
  v56[1] = v19;
  v56[2] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bottomAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController view](self, "view"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bottomAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v23));
  v56[3] = v24;
  v25 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v56, 4));
  portraitIndicatorsConstraints = self->_portraitIndicatorsConstraints;
  self->_portraitIndicatorsConstraints = v25;

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "trailingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController view](self, "view"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "safeAreaLayoutGuide"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "trailingAnchor"));
  v31 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v30));
  landscapeIndicatorsTrailingConstraint = self->_landscapeIndicatorsTrailingConstraint;
  self->_landscapeIndicatorsTrailingConstraint = v31;

  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "leadingAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_navSignContainerView, "trailingAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v50));
  v33 = self->_landscapeIndicatorsTrailingConstraint;
  v55[0] = v48;
  v55[1] = v33;
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "topAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "viewportLayoutGuide"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "topAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v37));
  v55[2] = v38;
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "bottomAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController view](self, "view"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "bottomAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v41));
  v55[3] = v42;
  v43 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v55, 4));
  landscapeIndicatorsConstraints = self->_landscapeIndicatorsConstraints;
  self->_landscapeIndicatorsConstraints = v43;

  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_100C629E4;
  v54[3] = &unk_1011AC860;
  v54[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v54);
  -[NavContainerViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  -[NavContainerViewController _updateArrivalStateForced:](self, "_updateArrivalStateForced:", 1);

}

- (void)_teardownViewHierarchy
{
  void *v3;
  void *v4;

  -[UIView removeFromSuperview](self->_navSignContainerView, "removeFromSuperview");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController indicatorsViewController](self, "indicatorsViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  objc_msgSend(v4, "removeFromSuperview");

  self->_layoutSetup = 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NavContainerViewController;
  -[ContainerViewController viewWillAppear:](&v8, "viewWillAppear:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController iosBasedChromeViewController](self, "iosBasedChromeViewController"));
  objc_msgSend(v5, "setNeedsUpdateComponent:animated:", CFSTR("statusBarStyle"), v3);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "_sceneConnectionsDidChange", UISceneWillConnectNotification, 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "addObserver:selector:name:object:", self, "_sceneConnectionsDidChange", UISceneDidDisconnectNotification, 0);

  -[NavContainerViewController setConnectedToCarPlay:animated:](self, "setConnectedToCarPlay:animated:", +[UIApplication _maps_isAnySceneConnectedForRole:](UIApplication, "_maps_isAnySceneConnectedForRole:", _UIWindowSceneSessionRoleCarPlay), 0);
  -[NavContainerViewController setNeedsUpdateOfSupportedInterfaceOrientations](self, "setNeedsUpdateOfSupportedInterfaceOrientations");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  double Double;
  id v6;
  GCDTimer *v7;
  GCDTimer *pedestrianARFeatureIntroTeachableMomentTimer;
  id *v9;
  _QWORD block[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)NavContainerViewController;
  -[OverlayContainerViewController viewDidAppear:](&v15, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController coordinator](self, "coordinator"));
  objc_msgSend(v4, "presentWithContainerViewController:", self);

  -[NavContainerViewController setDebugViewControllerEnabled:](self, "setDebugViewControllerEnabled:", 1);
  -[NavContainerViewController _updateIdleTimer](self, "_updateIdleTimer");
  if (-[NavContainerViewController isForWalkingNav](self, "isForWalkingNav"))
  {
    if (self->_pedestrianARFeatureIntroTeachableMomentTimer
      || !+[PedestrianARFeatureIntroTeachableMomentContaineeViewController shouldShowTeachableMoment](PedestrianARFeatureIntroTeachableMomentContaineeViewController, "shouldShowTeachableMoment"))
    {
      objc_initWeak(&location, self);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100C62DE4;
      block[3] = &unk_1011AD260;
      objc_copyWeak(&v11, &location);
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      v9 = &v11;
    }
    else
    {
      objc_initWeak(&location, self);
      Double = GEOConfigGetDouble(MapsConfig_PedestrianARFeatureIntroTeachableMomentCardDelay, off_1014B4278);
      v6 = &_dispatch_main_q;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100C62DB8;
      v12[3] = &unk_1011AE190;
      objc_copyWeak(&v13, &location);
      v7 = (GCDTimer *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, v12, Double));
      pedestrianARFeatureIntroTeachableMomentTimer = self->_pedestrianARFeatureIntroTeachableMomentTimer;
      self->_pedestrianARFeatureIntroTeachableMomentTimer = v7;

      v9 = &v13;
    }
    objc_destroyWeak(v9);
    objc_destroyWeak(&location);
  }
  -[NavContainerViewController _updateContaineeHiddenIfNeeded](self, "_updateContaineeHiddenIfNeeded");
}

- (void)viewDidDisappear:(BOOL)a3
{
  NSTimer *temporaryStatusBarHidingTimer;
  NSTimer *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NavContainerViewController;
  -[ContainerViewController viewDidDisappear:](&v6, "viewDidDisappear:", a3);
  -[NavContainerViewController setDebugViewControllerEnabled:](self, "setDebugViewControllerEnabled:", 0);
  -[NavContainerViewController setIdleTimer:](self, "setIdleTimer:", 0);
  -[GCDTimer invalidate](self->_pedestrianARFeatureIntroTeachableMomentTimer, "invalidate");
  temporaryStatusBarHidingTimer = self->_temporaryStatusBarHidingTimer;
  if (temporaryStatusBarHidingTimer)
  {
    -[NSTimer invalidate](temporaryStatusBarHidingTimer, "invalidate");
    v5 = self->_temporaryStatusBarHidingTimer;
    self->_temporaryStatusBarHidingTimer = 0;

  }
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NavContainerViewController;
  v6 = a3;
  -[ContainerViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v8, "willTransitionToTraitCollection:withTransitionCoordinator:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController coordinator](self, "coordinator", v8.receiver, v8.super_class));
  objc_msgSend(v7, "updateCameraForTraits:containerStyle:", v6, -[ContainerViewController containerStyle](self, "containerStyle"));

  -[NavContainerViewController _updateChildViewLayouts](self, "_updateChildViewLayouts");
  -[NavContainerViewController setShowingTemporaryStatusBar:](self, "setShowingTemporaryStatusBar:", 0);
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
  v9.super_class = (Class)NavContainerViewController;
  v7 = a4;
  -[OverlayContainerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100C62FF0;
  v8[3] = &unk_1011AEDC8;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

- (void)_updateSignContainerLeadingConstraint
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  double MaxX;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  double v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double MinX;
  double v50;
  CGFloat rect;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController view](self, "view"));
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;

  if (v5 <= 0.0)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController view](self, "view"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "traitCollection"));
    v36 = objc_msgSend(v35, "verticalSizeClass");

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController view](self, "view"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "traitCollection"));
    v39 = objc_msgSend(v38, "horizontalSizeClass");

    v40 = 10.0;
    if (v39 == (id)1)
      v40 = 0.0;
    if (v36 == (id)1)
      v30 = 8.0;
    else
      v30 = v40;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v7 = objc_msgSend(v6, "userInterfaceLayoutDirection");

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController view](self, "view"));
    objc_msgSend(v8, "bounds");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController view](self, "view"));
    v18 = v17;
    v19 = UIRectCornerRadiiZero[1];
    v20 = UIRectCornerRadiiZero[2];
    v21 = UIRectCornerRadiiZero[3];
    rect = v10;
    if (v7 == (id)1)
    {
      objc_msgSend(v17, "_rectTuckedAgainstBoundingPathEdge:withSize:cornerRadii:minimumPadding:", 8, 1.0, UIRectCornerRadiiZero[0], v19, v20, v21, 0.0);
      v23 = v22;
      v25 = v24;
      v27 = v26;
      v29 = v28;

      v52.origin.x = v23;
      v52.origin.y = v25;
      v52.size.width = v27;
      v52.size.height = v29;
      v30 = 23.0;
      if (!CGRectIsNull(v52))
      {
        v53.origin.x = rect;
        v53.origin.y = v12;
        v53.size.width = v14;
        v53.size.height = v16;
        MaxX = CGRectGetMaxX(v53);
        v54.origin.x = v23;
        v54.origin.y = v25;
        v54.size.width = v27;
        v54.size.height = v29;
        if (MaxX - CGRectGetMaxX(v54) != 0.0)
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController view](self, "view"));
          objc_msgSend(v32, "safeAreaInsets");
          v30 = v33;
LABEL_15:

        }
      }
    }
    else
    {
      objc_msgSend(v17, "_rectTuckedAgainstBoundingPathEdge:withSize:cornerRadii:minimumPadding:", 2, 1.0, UIRectCornerRadiiZero[0], v19, v20, v21, 0.0);
      v42 = v41;
      v44 = v43;
      v46 = v45;
      v48 = v47;

      v55.origin.x = v42;
      v55.origin.y = v44;
      v55.size.width = v46;
      v55.size.height = v48;
      v30 = 23.0;
      if (!CGRectIsNull(v55))
      {
        v56.origin.x = v42;
        v56.origin.y = v44;
        v56.size.width = v46;
        v56.size.height = v48;
        MinX = CGRectGetMinX(v56);
        v57.size.height = v16;
        v57.origin.x = rect;
        v57.origin.y = v12;
        v57.size.width = v14;
        if (MinX - CGRectGetMinX(v57) != 0.0)
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController view](self, "view"));
          objc_msgSend(v32, "safeAreaInsets");
          v30 = v50;
          goto LABEL_15;
        }
      }
    }
  }
  -[NSLayoutConstraint setConstant:](self->_signContainerLeadingConstraint, "setConstant:", v30);
}

- (void)viewSafeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NavContainerViewController;
  -[ContainerViewController viewSafeAreaInsetsDidChange](&v3, "viewSafeAreaInsetsDidChange");
  -[NavContainerViewController _updateIndicatorsLayout](self, "_updateIndicatorsLayout");
  -[NavContainerViewController _updateSignContainerLeadingConstraint](self, "_updateSignContainerLeadingConstraint");
}

- (unint64_t)supportedInterfaceOrientations
{
  if (!-[NavContainerViewController isConnectedToCarPlay](self, "isConnectedToCarPlay"))
    return 30;
  if (sub_1002A37C4())
    return 2;
  return 6;
}

- (int64_t)preferredUserInterfaceStyle
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  v3 = objc_msgSend(v2, "preferredUserInterfaceStyle");

  return (int64_t)v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  char v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NavContainerViewController;
  v4 = a3;
  -[ContainerViewController traitCollectionDidChange:](&v11, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController traitCollection](self, "traitCollection"));
  v6 = sub_1002A8A0C(v4, v5);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController traitCollection](self, "traitCollection"));
    v8 = objc_msgSend(v7, "isLuminanceReduced");

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100C63488;
    v9[3] = &unk_1011ACE58;
    v10 = (char)v8;
    v9[4] = self;
    +[UIView _maps_animateForAndromeda:animations:](UIView, "_maps_animateForAndromeda:animations:", v8, v9);
  }
}

- (void)didTapMapView:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  id v9;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  -[NavContainerViewController toggleTemporaryStatusBar](self, "toggleTemporaryStatusBar");
  if (-[NavContainerViewController debugViewControllerEnabled](self, "debugViewControllerEnabled"))
    -[NavContainerViewController _toggleTraceControls](self, "_toggleTraceControls");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  if (objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___MapViewResponderHandling))
    objc_msgSend(v7, "didTapMapView:atPoint:", v9, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController indicatorsViewController](self, "indicatorsViewController"));
  objc_msgSend(v8, "didTapMapView:atPoint:", v9, x, y);

  -[NavContainerViewController hideJunctionViewTemporarily](self, "hideJunctionViewTemporarily");
}

- (NavigationDebugViewsController)debugViewsController
{
  NavigationDebugViewsController *debugViewsController;
  NavigationDebugViewsController *v4;
  NavigationDebugViewsController *v5;

  debugViewsController = self->_debugViewsController;
  if (!debugViewsController)
  {
    v4 = -[NavigationDebugViewsController initWithDelegate:]([NavigationDebugViewsController alloc], "initWithDelegate:", 0);
    -[NavigationDebugViewsController setShowTraceControlsForStaleLocations:](v4, "setShowTraceControlsForStaleLocations:", 0);
    v5 = self->_debugViewsController;
    self->_debugViewsController = v4;

    debugViewsController = self->_debugViewsController;
  }
  return debugViewsController;
}

- (void)setDebugViewControllerEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (self->_debugViewControllerEnabled != a3)
  {
    v3 = a3;
    self->_debugViewControllerEnabled = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapView"));

    if (v3)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("PlaybackControls"));

      if (!v7)
      {
LABEL_7:

        return;
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController debugViewsController](self, "debugViewsController"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController overlayView](self, "overlayView"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController innerLayoutGuide](self, "innerLayoutGuide"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
      objc_msgSend(v8, "addDebugViewsToView:layoutGuide:mapView:modalPresentingViewController:", v9, v10, v12, v11);

    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController debugViewsController](self, "debugViewsController"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController overlayView](self, "overlayView"));
      objc_msgSend(v8, "removeDebugViewsFromView:", v9);
    }

    goto LABEL_7;
  }
}

- (void)_toggleTraceControls
{
  uint64_t v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  unsigned int v8;
  void *v9;
  id v10;

  v3 = objc_claimAutoreleasedReturnValue(-[NavContainerViewController debugViewsController](self, "debugViewsController"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("PlaybackControls"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController debugViewsController](self, "debugViewsController"));
      v8 = objc_msgSend(v7, "isShowingTraceControls");

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController debugViewsController](self, "debugViewsController"));
      v10 = v9;
      if (v8)
        objc_msgSend(v9, "hideTraceControlsAnimated:", 1);
      else
        objc_msgSend(v9, "showTraceControls");

    }
  }
}

- (BOOL)_shouldShowNavRecenterButton
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cardPresentationController"));
  if (objc_msgSend(v4, "containeeLayout") == (id)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController coordinator](self, "coordinator"));
    v6 = (objc_msgSend(v5, "shouldShowNavRecenterButton") & 1) != 0 || self->_isPanned;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_pressedRecenterButton
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v3, "captureUserAction:onTarget:eventValue:", 4001, -[NavContainerViewController currentMapViewTargetForAnalytics](self, "currentMapViewTargetForAnalytics"), 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController navSignViewController](self, "navSignViewController"));
  objc_msgSend(v4, "clearSelectionAnimated:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController coordinator](self, "coordinator"));
  objc_msgSend(v5, "recenterNavigation");

  -[NavContainerViewController updateLayoutAnimated:](self, "updateLayoutAnimated:", 1);
}

- (UIView)passThroughView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "passThroughView"));

  return (UIView *)v3;
}

- (BOOL)canDisplayJunctionViewInfo
{
  void *v3;
  BOOL v4;

  if (!self->_junctionViewActive)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController coordinator](self, "coordinator"));
  v4 = (objc_msgSend(v3, "isDisplayingTrafficIncident") & 1) == 0
    && !self->_trayOpen
    && !self->_isPanned
    && (id)-[NavContainerViewController signStyle](self, "signStyle") == (id)1;

  return v4;
}

- (void)willDisplayJunctionViewInfo:(id)a3
{
  void *v4;

  if (a3)
  {
    self->_junctionViewActive = 1;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController resumeRouteBanner](self, "resumeRouteBanner"));
    objc_msgSend(v4, "hideIfNeeded");

    -[NavContainerViewController _updateContaineeHiddenIfNeeded](self, "_updateContaineeHiddenIfNeeded");
  }
  else
  {
    -[NavContainerViewController willHideJunctionView](self, "willHideJunctionView");
  }
}

- (void)showJunctionViewIfNeeded
{
  GCDTimer *junctionViewTimer;
  void *v4;
  _BOOL4 junctionViewDisplayed;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  junctionViewTimer = self->_junctionViewTimer;
  self->_junctionViewTimer = 0;

  if (-[NavContainerViewController canDisplayJunctionViewInfo](self, "canDisplayJunctionViewInfo"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController resumeRouteBanner](self, "resumeRouteBanner"));
    objc_msgSend(v4, "hideIfNeeded");

    junctionViewDisplayed = self->_junctionViewDisplayed;
    self->_junctionViewDisplayed = 1;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController junctionViewController](self, "junctionViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
    objc_msgSend(v7, "setHidden:", 0);

    if (!junctionViewDisplayed)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController view](self, "view"));
      objc_msgSend(v8, "layoutIfNeeded");

      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100C63B90;
      v9[3] = &unk_1011AC860;
      v9[4] = self;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v9, 0.25);
    }
  }
}

- (void)hideJunctionViewIfNeededAnimated:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 junctionViewDisplayed;
  GCDTimer *junctionViewTimer;
  void *v7;
  double v8;
  _QWORD v9[5];
  _QWORD v10[5];

  v3 = a3;
  junctionViewDisplayed = self->_junctionViewDisplayed;
  self->_junctionViewDisplayed = 0;
  junctionViewTimer = self->_junctionViewTimer;
  self->_junctionViewTimer = 0;

  if (junctionViewDisplayed)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController view](self, "view"));
    objc_msgSend(v7, "layoutIfNeeded");

    v8 = 0.0;
    if (v3)
      v8 = 0.25;
    v9[4] = self;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100C63CBC;
    v10[3] = &unk_1011AC860;
    v10[4] = self;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100C63D20;
    v9[3] = &unk_1011AE8F8;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v10, v9, v8);
  }
}

- (void)hideJunctionViewIfNeeded
{
  -[NavContainerViewController hideJunctionViewIfNeededAnimated:](self, "hideJunctionViewIfNeededAnimated:", 1);
}

- (void)willHideJunctionView
{
  void *v3;

  self->_junctionViewActive = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController resumeRouteBanner](self, "resumeRouteBanner"));
  objc_msgSend(v3, "showIfNeeded");

  -[NavContainerViewController _updateContaineeHiddenIfNeeded](self, "_updateContaineeHiddenIfNeeded");
}

- (double)_maxAvailableHeightForJunctionView
{
  double v3;
  double v4;
  void *v5;
  double Height;
  unint64_t v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v16;
  CGRect v17;
  CGRect v18;

  -[ContainerViewController statusBarHeight](self, "statusBarHeight");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController view](self, "view"));
  objc_msgSend(v5, "frame");
  Height = CGRectGetHeight(v17);

  v7 = -[ContainerViewController containerStyle](self, "containerStyle");
  if (v7 <= 7 && ((1 << v7) & 0xE3) != 0)
  {
    -[NavContainerViewController _belowSignTopPosition](self, "_belowSignTopPosition");
    v9 = v4 + v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
    objc_msgSend(v11, "bounds");
    v12 = Height - CGRectGetHeight(v18);

    v13 = v12 - v9;
    v14 = -110.0;
  }
  else
  {
    -[NavContainerViewController _belowSignTopPosition](self, "_belowSignTopPosition");
    v13 = Height - (v4 + 0.0 + v16);
    v14 = -8.0;
  }
  return v13 + v14;
}

- (void)suppressTransitionsOfContainee:(id)a3
{
  objc_storeStrong((id *)&self->_suppressedContainee, a3);
}

- (void)_updateChildViewLayouts
{
  _QWORD block[5];

  if (-[PassThroughViewController hasParentView](self, "hasParentView"))
  {
    if (self->_layoutSetup)
    {
      -[NavContainerViewController _updateNavSignLayout](self, "_updateNavSignLayout");
      -[NavContainerViewController _updateSecondarySignLayout](self, "_updateSecondarySignLayout");
      -[NavContainerViewController _updateJunctionViewLayout](self, "_updateJunctionViewLayout");
      -[NavContainerViewController _updateIndicatorsLayout](self, "_updateIndicatorsLayout");
      -[NavContainerViewController _updateRecenterButtonLayout](self, "_updateRecenterButtonLayout");
      -[NavContainerViewController _updateStatusBarIndicatorLayout](self, "_updateStatusBarIndicatorLayout");
      -[NavContainerViewController _updateLaneGuidanceViewLayout](self, "_updateLaneGuidanceViewLayout");
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100C63F6C;
      block[3] = &unk_1011AC860;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)_updateNavSignLayout
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  unint64_t v7;
  void *v8;
  double v9;
  void *v10;
  unsigned int v11;
  void *v12;
  unsigned int v13;
  BOOL v14;
  int v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController containerStyleManager](self, "containerStyleManager"));
  objc_msgSend(v3, "containerWidth");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController navSignViewController](self, "navSignViewController"));
  objc_msgSend(v6, "setCardWidth:", v5);

  v7 = -[ContainerViewController containerStyle](self, "containerStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController view](self, "view"));
  objc_msgSend(v8, "safeAreaInsets");
  if (v9 == 0.0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController statusIndicatorView](self, "statusIndicatorView"));
    v11 = objc_msgSend(v10, "isVisible") ^ 1;

  }
  else
  {
    v11 = 0;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController laneGuidanceViewController](self, "laneGuidanceViewController"));
  v13 = objc_msgSend(v12, "hasLaneGuidance");

  v14 = !-[NavContainerViewController _isSecondarySignVisible](self, "_isSecondarySignVisible")
     && !self->_junctionViewDisplayed;
  if (v7 == 1)
    v15 = 1;
  else
    v15 = v11;
  v16 = (v15 | v13) == 0;
  v17 = 3;
  if (!v16)
    v17 = 0;
  if (v14 && v7 != 1)
    v18 = v17 | 0xC;
  else
    v18 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController navSignViewController](self, "navSignViewController"));
  objc_msgSend(v19, "setCornerRadius:", 10.0);

  v20 = (id)objc_claimAutoreleasedReturnValue(-[NavContainerViewController navSignViewController](self, "navSignViewController"));
  objc_msgSend(v20, "setCornerMask:", v18);

}

- (void)_updateSecondarySignLayout
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  -[NavContainerViewController _secondarySignTopPosition](self, "_secondarySignTopPosition");
  -[NSLayoutConstraint setConstant:](self->_secondarySignTopConstraint, "setConstant:");
  v3 = -[ContainerViewController containerStyle](self, "containerStyle");
  if (v3 <= 7 && ((1 << v3) & 0xE3) != 0)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[NavContainerViewController secondarySignViewController](self, "secondarySignViewController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layer"));
    v6 = v5;
    v7 = 0;
  }
  else
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[NavContainerViewController secondarySignViewController](self, "secondarySignViewController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layer"));
    v6 = v5;
    v7 = 12;
  }
  objc_msgSend(v5, "setMaskedCorners:", v7);

}

- (void)_updateLaneGuidanceViewLayout
{
  uint64_t v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  id v8;

  if ((id)-[ContainerViewController containerStyle](self, "containerStyle") == (id)1)
  {
    v3 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController view](self, "view"));
    objc_msgSend(v4, "safeAreaInsets");
    if (v5 == 0.0)
      v3 = 0;
    else
      v3 = 3;

  }
  v8 = (id)objc_claimAutoreleasedReturnValue(-[NavContainerViewController laneGuidanceViewController](self, "laneGuidanceViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layer"));
  objc_msgSend(v7, "setMaskedCorners:", v3);

}

- (void)_updateJunctionViewLayout
{
  double v3;
  double v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  -[NavContainerViewController _junctionViewTopPosition](self, "_junctionViewTopPosition");
  -[NSLayoutConstraint setConstant:](self->_junctionViewTopConstraint, "setConstant:");
  -[NavContainerViewController maxAvailableHeightForJunctionView:](self, "maxAvailableHeightForJunctionView:", 0.0);
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController junctionViewController](self, "junctionViewController"));
  objc_msgSend(v5, "setAvailableHeight:", v4);

  v6 = -[ContainerViewController containerStyle](self, "containerStyle");
  if (v6 <= 7 && ((1 << v6) & 0xE3) != 0)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(-[NavContainerViewController junctionViewController](self, "junctionViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layer"));
    v9 = v8;
    v10 = 0;
  }
  else
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(-[NavContainerViewController junctionViewController](self, "junctionViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layer"));
    v9 = v8;
    v10 = 12;
  }
  objc_msgSend(v8, "setMaskedCorners:", v10);

}

- (void)_updateIndicatorsLayout
{
  unint64_t v3;
  int *v4;
  int *v5;

  -[NavContainerViewController _indicatorsTopPosition](self, "_indicatorsTopPosition");
  -[NSLayoutConstraint setConstant:](self->_portraitIndicatorsTopConstraint, "setConstant:");
  -[NavContainerViewController _indicatorsTrailingInset](self, "_indicatorsTrailingInset");
  -[NSLayoutConstraint setConstant:](self->_landscapeIndicatorsTrailingConstraint, "setConstant:");
  v3 = -[ContainerViewController containerStyle](self, "containerStyle");
  if (v3 > 7)
  {
    v5 = &OBJC_IVAR___NavContainerViewController__landscapeIndicatorsConstraints;
    v4 = &OBJC_IVAR___NavContainerViewController__portraitIndicatorsConstraints;
  }
  else
  {
    v4 = off_1011EA490[v3];
    v5 = off_1011EA4D0[v3];
  }
  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + *v4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + *v5));
}

- (void)_updateRecenterButtonLayout
{
  void *v3;
  double v4;
  uint64_t v5;
  char isKindOfClass;
  unsigned int v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nextTopContext"));

  if (!v8
    || (v5 = objc_opt_class(NavModeController),
        isKindOfClass = objc_opt_isKindOfClass(v8, v5),
        v4 = 0.0,
        (isKindOfClass & 1) != 0))
  {
    v7 = -[NavContainerViewController _shouldShowNavRecenterButton](self, "_shouldShowNavRecenterButton", v4);
    v4 = 0.0;
    if (v7)
      v4 = 1.0;
  }
  -[UIButton setAlpha:](self->_recenterButton, "setAlpha:", v4);

}

- (void)_updateStatusBarIndicatorLayout
{
  unint64_t v3;
  void *v4;
  uint64_t v5;

  v3 = -[ContainerViewController containerStyle](self, "containerStyle");
  if (v3 < 8 && ((0xE3u >> v3) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsLightLevelController sharedController](MapsLightLevelController, "sharedController"));
    if (objc_msgSend(v4, "shouldUseNightMode"))
      v5 = 1;
    else
      v5 = 3;

  }
  -[StatusIndicatorView updateWithStatusBarStyle:](self->_statusIndicatorView, "updateWithStatusBarStyle:", v5);
}

- (unint64_t)layoutForCurrentViewControllerWithStyle:(unint64_t)a3
{
  objc_super v6;

  if (-[ContainerViewController containeeLayout](self, "containeeLayout"))
    return -[ContainerViewController containeeLayout](self, "containeeLayout");
  v6.receiver = self;
  v6.super_class = (Class)NavContainerViewController;
  return -[ContainerViewController layoutForCurrentViewControllerWithStyle:](&v6, "layoutForCurrentViewControllerWithStyle:", a3);
}

- (void)_containeeLayoutWillChange:(id)a3
{
  id v4;
  void *v5;
  UIViewController *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  NavContainerViewController *v15;
  __int16 v16;
  UIViewController *v17;
  __int16 v18;
  id v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v6 = (UIViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ContainerContainee")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ContainerLayout")));
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  v10 = sub_10043165C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v14 = 138543874;
    v15 = self;
    v16 = 2114;
    v17 = v6;
    v18 = 2048;
    v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%{public}@ containee: %{public}@ willChangeTo: %lu", (uint8_t *)&v14, 0x20u);
  }

  if (-[PassThroughViewController hasParentView](self, "hasParentView"))
  {
    if (self->_layoutSetup)
    {
      self->_trayOpen = (unint64_t)v9 > 1;
      if (v6 != self->_suppressedContainee)
      {
        if ((unint64_t)v9 >= 2)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController navSignViewController](self, "navSignViewController"));
          objc_msgSend(v12, "clearDragState");

        }
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController navSignViewController](self, "navSignViewController"));
        objc_msgSend(v13, "clearPartialExpansionAnimated:", +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"));

        if (self->_trayOpen)
          -[NavContainerViewController _updateLayeringToTrayProminent](self, "_updateLayeringToTrayProminent");
        -[NavContainerViewController _updateControlsHiddenAnimated:](self, "_updateControlsHiddenAnimated:", +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"));
        -[GCDTimer invalidate](self->_pedestrianARFeatureIntroTeachableMomentTimer, "invalidate");
      }
    }
  }

}

- (void)_containeeLayoutDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  UIViewController *suppressedContainee;
  int v14;
  NavContainerViewController *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ContainerContainee")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ContainerLayout")));
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  v10 = sub_10043165C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v14 = 138543874;
    v15 = self;
    v16 = 2114;
    v17 = v6;
    v18 = 2048;
    v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%{public}@ containee: %{public}@ didChangeTo: %lu", (uint8_t *)&v14, 0x20u);
  }

  if (-[PassThroughViewController hasParentView](self, "hasParentView"))
  {
    if (self->_layoutSetup)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));

      if (v6 == v12)
      {
        suppressedContainee = self->_suppressedContainee;
        self->_suppressedContainee = 0;

        if (v9 == (id)1)
          -[NavContainerViewController _updateLayeringToSignProminent](self, "_updateLayeringToSignProminent");
        -[NavContainerViewController _updateControlsHiddenAnimated:](self, "_updateControlsHiddenAnimated:", +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"));
      }
    }
  }

}

- (void)_containeeWillPresent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  if (-[PassThroughViewController hasParentView](self, "hasParentView") && self->_layoutSetup)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userInfo"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ContainerContainee")));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewIfLoaded"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cardPresentationController"));
      v9 = objc_msgSend(v8, "containeeLayout");

    }
    else
    {
      v9 = -[NavContainerViewController originalLayoutForViewController:](self, "originalLayoutForViewController:", v5);
    }
    self->_trayOpen = (unint64_t)v9 > 1;
    -[NavContainerViewController _updateControlsHiddenAnimated:](self, "_updateControlsHiddenAnimated:", +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"));

  }
}

- (void)_containeeDidPresent:(id)a3
{
  UIViewController *suppressedContainee;

  suppressedContainee = self->_suppressedContainee;
  self->_suppressedContainee = 0;

}

- (void)_updateLayeringToSignProminent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController indicatorsViewController](self, "indicatorsViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v3, "addSubview:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController view](self, "view"));
  objc_msgSend(v6, "addSubview:", self->_navSignContainerView);

  -[NavContainerViewController _pinSignAndIndicators](self, "_pinSignAndIndicators");
}

- (void)_updateLayeringToTrayProminent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UIView *navSignContainerView;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController indicatorsViewController](self, "indicatorsViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v3, "insertSubview:aboveSubview:", v5, self->_recenterButton);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController view](self, "view"));
  navSignContainerView = self->_navSignContainerView;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController indicatorsViewController](self, "indicatorsViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
  objc_msgSend(v6, "insertSubview:aboveSubview:", navSignContainerView, v9);

  -[NavContainerViewController _pinSignAndIndicators](self, "_pinSignAndIndicators");
}

- (void)_pinSignAndIndicators
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *signContainerTopConstraint;
  void *v9;
  void *v10;
  void *v11;
  NSLayoutConstraint *v12;
  NSLayoutConstraint *signContainerLeadingConstraint;
  NSLayoutConstraint *v14;
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

  if (!-[NSLayoutConstraint isActive](self->_signContainerTopConstraint, "isActive"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_navSignContainerView, "topAnchor"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewportLayoutGuide"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
    v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:", v6));
    signContainerTopConstraint = self->_signContainerTopConstraint;
    self->_signContainerTopConstraint = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_navSignContainerView, "leadingAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController view](self, "view"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "leadingAnchor"));
    v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v11));
    signContainerLeadingConstraint = self->_signContainerLeadingConstraint;
    self->_signContainerLeadingConstraint = v12;

    v14 = self->_signContainerLeadingConstraint;
    v24[0] = self->_signContainerTopConstraint;
    v24[1] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_navSignContainerView, "widthAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController containerView](self, "containerView"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "widthAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v17));
    v24[2] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_navSignContainerView, "bottomAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController view](self, "view"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bottomAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v21));
    v24[3] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v23);

    -[NavContainerViewController _updateSignContainerLeadingConstraint](self, "_updateSignContainerLeadingConstraint");
  }
}

- (BOOL)shouldHideCard
{
  void *v3;
  double Height;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  NSObject *v18;
  NavContainerViewController *v19;
  objc_class *v20;
  NSString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double signListHeight;
  unint64_t v32;
  unsigned int v33;
  id v34;
  NSObject *v35;
  NavContainerViewController *v36;
  objc_class *v37;
  NSString *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  const char *v43;
  id v44;
  unint64_t v45;
  int v46;
  NavContainerViewController *v47;
  objc_class *v48;
  NSString *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  const char *v54;
  unint64_t v55;
  int v56;
  _BOOL4 v57;
  _BOOL4 v58;
  double v59;
  uint64_t v60;
  uint64_t v61;
  unsigned int v62;
  _BOOL4 v63;
  _BOOL4 junctionViewDisplayed;
  int v66;
  const char *v67;
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  const char *v71;
  __int16 v72;
  int v73;
  __int16 v74;
  _BOOL4 v75;
  __int16 v76;
  _BOOL4 v77;
  __int16 v78;
  double v79;
  __int16 v80;
  double v81;
  __int16 v82;
  uint64_t v83;
  __int16 v84;
  unsigned int v85;
  __int16 v86;
  _BOOL4 v87;
  CGRect v88;
  CGRect v89;

  if (self->_isArrivalState && !-[NavContainerViewController isConnectedToCarPlay](self, "isConnectedToCarPlay"))
  {
    v17 = sub_100431C0C();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
LABEL_12:
      LOBYTE(v26) = 0;
      goto LABEL_53;
    }
    v19 = self;
    v20 = (objc_class *)objc_opt_class(v19);
    v21 = NSStringFromClass(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    if ((objc_opt_respondsToSelector(v19, "accessibilityIdentifier") & 1) != 0)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController performSelector:](v19, "performSelector:", "accessibilityIdentifier"));
      v24 = v23;
      if (v23 && !objc_msgSend(v23, "isEqualToString:", v22))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v22, v19, v24));

        goto LABEL_11;
      }

    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v22, v19));
LABEL_11:

    *(_DWORD *)buf = 138543362;
    v69 = v25;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Will unhide tray because we've arrived and aren't connected to CarPlay", buf, 0xCu);

    goto LABEL_12;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController view](self, "view"));
  objc_msgSend(v3, "frame");
  Height = CGRectGetHeight(v88);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  objc_msgSend(v6, "bounds");
  v7 = CGRectGetHeight(v89);

  -[ContainerViewController statusBarHeight](self, "statusBarHeight");
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController navSignViewController](self, "navSignViewController"));
  objc_msgSend(v10, "footerBottomPosition");
  v12 = v9 + v11;

  if (self->_junctionViewDisplayed)
  {
    -[NavContainerViewController _navSignBottomPosition](self, "_navSignBottomPosition");
    v14 = v13;
    -[NavContainerViewController maxAvailableHeightForJunctionView:](self, "maxAvailableHeightForJunctionView:", 0.0);
    v16 = v14 + v15;
  }
  else
  {
    v16 = 0.0;
  }
  v27 = Height - v7;
  if (v12 <= v16)
    v28 = v16;
  else
    v28 = v12;
  -[NavSignListViewController collapsedHeight](self->_navSignViewController, "collapsedHeight");
  v30 = v29;
  signListHeight = self->_signListHeight;
  v32 = -[ContainerViewController containerStyle](self, "containerStyle");
  if (v32 <= 7 && ((1 << v32) & 0xE3) != 0)
  {
    v26 = v28 > v27 && signListHeight > v30;
  }
  else
  {
    v57 = signListHeight > v30;
    if (v28 <= v27)
      v57 = 0;
    if (self->_junctionViewDisplayed)
      v26 = v28 > v27;
    else
      v26 = v57;
  }
  v33 = -[ContainerViewController containeesHidden](self, "containeesHidden");
  v34 = sub_100431C0C();
  v35 = objc_claimAutoreleasedReturnValue(v34);
  v18 = v35;
  if (v26 == v33)
  {
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      goto LABEL_53;
    v47 = self;
    v48 = (objc_class *)objc_opt_class(v47);
    v49 = NSStringFromClass(v48);
    v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
    if ((objc_opt_respondsToSelector(v47, "accessibilityIdentifier") & 1) != 0)
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController performSelector:](v47, "performSelector:", "accessibilityIdentifier"));
      v52 = v51;
      if (v51 && !objc_msgSend(v51, "isEqualToString:", v50))
      {
        v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v50, v47, v52));

        goto LABEL_39;
      }

    }
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v50, v47));
LABEL_39:

    if (v26)
      v54 = "hide";
    else
      v54 = "show";
    v55 = -[ContainerViewController containerStyle](v47, "containerStyle");
    if (v55 > 7)
      v56 = 1;
    else
      v56 = dword_100E3F560[v55];
    junctionViewDisplayed = self->_junctionViewDisplayed;
    *(_DWORD *)buf = 138544642;
    v69 = v53;
    v70 = 2080;
    v71 = v54;
    v72 = 1024;
    v73 = v56;
    v74 = 1024;
    v75 = v28 > v27;
    v76 = 1024;
    v77 = signListHeight > v30;
    v78 = 1024;
    LODWORD(v79) = junctionViewDisplayed;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "[%{public}@] Should %s tray because isLandscape: %d, bottomOfSignsIsGreaterThanTopOfTray: %d, signHeightGreaterThanCollapsed: %d, junctionViewDisplayed: %d", buf, 0x2Eu);

    goto LABEL_53;
  }
  if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    goto LABEL_53;
  v36 = self;
  v37 = (objc_class *)objc_opt_class(v36);
  v38 = NSStringFromClass(v37);
  v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
  if ((objc_opt_respondsToSelector(v36, "accessibilityIdentifier") & 1) != 0)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController performSelector:](v36, "performSelector:", "accessibilityIdentifier"));
    v41 = v40;
    if (v40 && !objc_msgSend(v40, "isEqualToString:", v39))
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v39, v36, v41));

      goto LABEL_29;
    }

  }
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v39, v36));
LABEL_29:

  v43 = "show";
  if (v26)
    v43 = "hide";
  v67 = v43;
  v44 = v42;
  v45 = -[ContainerViewController containerStyle](v36, "containerStyle");
  if (v45 > 7)
    v46 = 1;
  else
    v46 = dword_100E3F560[v45];
  v66 = v46;
  v58 = v28 > v27;
  v59 = self->_signListHeight;
  -[NavSignListViewController layoutProgress](self->_navSignViewController, "layoutProgress");
  v61 = v60;
  v62 = -[NavSignListViewController isDragging](self->_navSignViewController, "isDragging");

  v63 = self->_junctionViewDisplayed;
  *(_DWORD *)buf = 138545666;
  v69 = v42;
  v70 = 2080;
  v71 = v67;
  v72 = 1024;
  v73 = v66;
  v74 = 1024;
  v75 = v58;
  v76 = 1024;
  v77 = signListHeight > v30;
  v78 = 2048;
  v79 = v59;
  v80 = 2048;
  v81 = v30;
  v82 = 2048;
  v83 = v61;
  v84 = 1024;
  v85 = v62;
  v86 = 1024;
  v87 = v63;
  _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Should %s tray because isLandscape: %d, bottomOfSignsIsGreaterThanTopOfTray: %d, signHeightGreaterThanCollapsed: %d (currentHeight: %f, collapsedHeight: %f, layoutProgress: %f, isDragging: %d), junctionViewDisplayed: %d", buf, 0x52u);

LABEL_53:
  return v26;
}

- (void)updateLayoutAnimated:(BOOL)a3
{
  _BOOL4 v3;
  _QWORD *v5;
  void *v6;
  _QWORD v7[4];
  _QWORD *v8;
  _QWORD v9[5];
  objc_super v10;

  v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NavContainerViewController;
  -[ContainerViewController updateLayoutAnimated:](&v10, "updateLayoutAnimated:");
  -[ContainerViewController updateContaineeStackState](self, "updateContaineeStackState");
  -[NavContainerViewController _updateIdleTimer](self, "_updateIdleTimer");
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100C65520;
  v9[3] = &unk_1011AC860;
  v9[4] = self;
  v5 = objc_retainBlock(v9);
  v6 = v5;
  if (v3)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100C6556C;
    v7[3] = &unk_1011ADA00;
    v8 = v5;
    +[UIView _animateUsingDefaultTimingWithOptions:animations:completion:](UIView, "_animateUsingDefaultTimingWithOptions:animations:completion:", 4, v7, 0);

  }
  else
  {
    ((void (*)(_QWORD *))v5[2])(v5);
  }

}

- (unint64_t)originalLayoutForViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  id v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cardPresentationController"));
  v7 = (unint64_t)objc_msgSend(v6, "defaultContaineeLayout");

  if (!v7)
  {
    if ((objc_opt_respondsToSelector(v4, "defaultLayoutForContainerStyle:traitCollection:") & 1) == 0
      || (v9 = v4,
          v10 = -[ContainerViewController containerStyle](self, "containerStyle"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController traitCollection](self, "traitCollection")),
          v7 = (unint64_t)objc_msgSend(v9, "defaultLayoutForContainerStyle:traitCollection:", v10, v11),
          v9,
          v11,
          !v7))
    {
      v12 = objc_opt_class(NavTrayViewController);
      if ((objc_opt_isKindOfClass(v4, v12) & 1) != 0)
      {
        v7 = 1;
      }
      else
      {
        v13 = objc_opt_class(NavTrafficIncidentContaineeViewController);
        if ((objc_opt_isKindOfClass(v4, v13) & 1) != 0)
          v7 = 1;
        else
          v7 = 2;
      }
    }
  }

  return v7;
}

- (void)presentController:(id)a3 animated:(BOOL)a4 useDefaultContaineeLayout:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  unsigned int v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  objc_super v14;
  uint8_t buf[4];
  id v16;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController coordinator](self, "coordinator"));
  v10 = objc_msgSend(v9, "isShowingFullScreenDirectionsList");

  v11 = sub_100431C0C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (v10)
  {
    if (v13)
    {
      *(_DWORD *)buf = 138412290;
      v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Showing expanded nav sign; skipping presentation of %@",
        buf,
        0xCu);
    }

  }
  else
  {
    if (v13)
    {
      *(_DWORD *)buf = 138412290;
      v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Presenting controller: %@", buf, 0xCu);
    }

    v14.receiver = self;
    v14.super_class = (Class)NavContainerViewController;
    -[ContainerViewController presentController:animated:useDefaultContaineeLayout:](&v14, "presentController:animated:useDefaultContaineeLayout:", v8, v6, v5);
  }

}

- (void)containerStyleManagerDidChangeStyle:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NavContainerViewController;
  -[ContainerViewController containerStyleManagerDidChangeStyle:](&v8, "containerStyleManagerDidChangeStyle:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController coordinator](self, "coordinator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController traitCollection](self, "traitCollection"));
  objc_msgSend(v5, "updateCameraForTraits:containerStyle:", v6, a3);

  -[NavContainerViewController _updateChildViewLayouts](self, "_updateChildViewLayouts");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController iosBasedChromeViewController](self, "iosBasedChromeViewController"));
  objc_msgSend(v7, "setNeedsUpdateComponent:animated:", CFSTR("statusBarStyle"), 0);

  if (-[NavContainerViewController canDisplayJunctionViewInfo](self, "canDisplayJunctionViewInfo"))
    -[NavContainerViewController showJunctionViewIfNeeded](self, "showJunctionViewIfNeeded");
  else
    -[NavContainerViewController hideJunctionViewIfNeededAnimated:](self, "hideJunctionViewIfNeededAnimated:", 1);
}

- (double)availableHeight
{
  unint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  objc_super v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v3 = -[ContainerViewController containerStyle](self, "containerStyle");
  if (v3 > 6)
    goto LABEL_13;
  if (((1 << v3) & 0x54) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    if (objc_msgSend(v4, "userInterfaceIdiom") == (id)1)
    {

      goto LABEL_9;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v16 = objc_msgSend(v15, "userInterfaceIdiom");

    if (v16 == (id)5)
    {
LABEL_9:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController view](self, "view"));
      objc_msgSend(v5, "bounds");
      v18 = v17;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController topContentView](self, "topContentView"));
      objc_msgSend(v8, "frame");
      v19 = v18 - CGRectGetMaxY(v32);
      -[NavContainerViewController edgePadding](self, "edgePadding");
      v21 = v19 - v20;
      v10 = 0.0;
      if (v21 >= 0.0)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController view](self, "view"));
        objc_msgSend(v11, "bounds");
        v23 = v22;
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController topContentView](self, "topContentView"));
        objc_msgSend(v24, "frame");
        v25 = v23 - CGRectGetMaxY(v33);
        -[NavContainerViewController edgePadding](self, "edgePadding");
        v10 = v25 - v26;

        goto LABEL_11;
      }
      goto LABEL_12;
    }
LABEL_13:
    v29.receiver = self;
    v29.super_class = (Class)NavContainerViewController;
    -[ContainerViewController availableHeight](&v29, "availableHeight");
    return v27;
  }
  if (((1 << v3) & 0x22) == 0)
    goto LABEL_13;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController view](self, "view"));
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController topContentView](self, "topContentView"));
  objc_msgSend(v8, "frame");
  v9 = v7 - CGRectGetMaxY(v30) + 8.0;
  v10 = 0.0;
  if (v9 >= 0.0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController view](self, "view"));
    objc_msgSend(v11, "bounds");
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController topContentView](self, "topContentView"));
    objc_msgSend(v14, "frame");
    v10 = v13 - CGRectGetMaxY(v31) + 8.0;

LABEL_11:
  }
LABEL_12:

  return v10;
}

- (double)edgePadding
{
  return 16.0;
}

- (unint64_t)maxLayoutForEdgeInsetsUpdate
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  v4 = objc_opt_respondsToSelector(v3, "maxLayoutForEdgeInsetsUpdate");

  if ((v4 & 1) == 0)
    return 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  v6 = objc_msgSend(v5, "maxLayoutForEdgeInsetsUpdate");

  return (unint64_t)v6;
}

- (void)mapViewNavigationCameraHasStartedPanning:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v4 = a3;
  v5 = sub_100431C0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[Panning] mapViewNavigationCameraHasStartedPanning:", v10, 2u);
  }

  self->_isPanned = 1;
  -[NavContainerViewController updateLayoutAnimated:](self, "updateLayoutAnimated:", 1);
  if (self->_trayOpen && (id)-[ContainerViewController containerStyle](self, "containerStyle") != (id)7)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cardPresentationController"));
    objc_msgSend(v8, "wantsLayout:", 1);

  }
  -[NavContainerViewController hideJunctionViewIfNeededAnimated:](self, "hideJunctionViewIfNeededAnimated:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController indicatorsViewController](self, "indicatorsViewController"));
  objc_msgSend(v9, "mapViewNavigationCameraHasStartedPanning:", v4);

  -[NavContainerViewController _updateControlsHiddenAnimated:](self, "_updateControlsHiddenAnimated:", 1);
}

- (void)mapViewNavigationCameraHasStoppedPanning:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  v5 = sub_100431C0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[Panning] mapViewNavigationCameraHasStoppedPanning:", v8, 2u);
  }

  self->_isPanned = 0;
  -[NavContainerViewController updateLayoutAnimated:](self, "updateLayoutAnimated:", 1);
  -[NavContainerViewController showJunctionViewIfNeeded](self, "showJunctionViewIfNeeded");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController indicatorsViewController](self, "indicatorsViewController"));
  objc_msgSend(v7, "mapViewNavigationCameraHasStoppedPanning:", v4);

  -[NavContainerViewController _updateControlsHiddenAnimated:](self, "_updateControlsHiddenAnimated:", 1);
}

- (void)mapViewNavigationCameraDidLeaveDefaultZoom:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v4 = a3;
  v5 = sub_100431C0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[Panning] mapViewNavigationCameraDidLeaveDefaultZoom:", v10, 2u);
  }

  self->_isPanned = 1;
  -[NavContainerViewController updateLayoutAnimated:](self, "updateLayoutAnimated:", 1);
  if (self->_trayOpen && (id)-[ContainerViewController containerStyle](self, "containerStyle") != (id)7)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cardPresentationController"));
    objc_msgSend(v8, "wantsLayout:", 1);

  }
  -[NavContainerViewController hideJunctionViewIfNeededAnimated:](self, "hideJunctionViewIfNeededAnimated:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController indicatorsViewController](self, "indicatorsViewController"));
  objc_msgSend(v9, "mapViewNavigationCameraDidLeaveDefaultZoom:", v4);

  -[NavContainerViewController _updateControlsHiddenAnimated:](self, "_updateControlsHiddenAnimated:", 1);
}

- (void)mapViewNavigationCameraDidReturnToDefaultZoom:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  v5 = sub_100431C0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[Panning] mapViewNavigationCameraDidReturnToDefaultZoom:", v8, 2u);
  }

  self->_isPanned = 0;
  -[NavContainerViewController updateLayoutAnimated:](self, "updateLayoutAnimated:", 1);
  -[NavContainerViewController showJunctionViewIfNeeded](self, "showJunctionViewIfNeeded");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController indicatorsViewController](self, "indicatorsViewController"));
  objc_msgSend(v7, "mapViewNavigationCameraDidReturnToDefaultZoom:", v4);

  -[NavContainerViewController _updateControlsHiddenAnimated:](self, "_updateControlsHiddenAnimated:", 1);
}

- (void)_updateControlsHiddenAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  _BOOL8 v9;
  id v10;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController indicatorsViewController](self, "indicatorsViewController"));
  v6 = v5;
  v7 = self->_trayOpen || self->_isPanned || self->_isArrivalState;
  objc_msgSend(v5, "setControlsHidden:animated:", v7, v3);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController indicatorsViewController](self, "indicatorsViewController"));
  v9 = self->_isPanned || self->_isArrivalState;
  v10 = v8;
  objc_msgSend(v8, "setIndicatorsHidden:animated:", v9, v3);

}

- (void)mapView:(id)a3 didUpdateYaw:(double)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[NavContainerViewController indicatorsViewController](self, "indicatorsViewController", a3));
  objc_msgSend(v5, "setYaw:", a4);

}

- (void)setRoute:(id)a3
{
  GEOComposedRoute *v5;
  GEOComposedRoute *v6;

  v5 = (GEOComposedRoute *)a3;
  if (v5 && self->_route != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_route, a3);
    -[NavContainerViewController _updateRecenterButtonLayout](self, "_updateRecenterButtonLayout");
    v5 = v6;
  }

}

- (void)setSignStyle:(unint64_t)a3
{
  void *v5;
  void *v6;

  if (self->_signStyle != a3)
  {
    self->_signStyle = a3;
    if (-[NavContainerViewController isViewLoaded](self, "isViewLoaded"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController indicatorsViewController](self, "indicatorsViewController"));
      objc_msgSend(v5, "setIndicatorsType:", a3 != 1);

      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController iosBasedChromeViewController](self, "iosBasedChromeViewController"));
      objc_msgSend(v6, "setNeedsUpdateComponent:animated:", CFSTR("statusBarStyle"), 0);

    }
    if (a3 == 1)
      -[NavContainerViewController showJunctionViewIfNeeded](self, "showJunctionViewIfNeeded");
    else
      -[NavContainerViewController hideJunctionViewIfNeeded](self, "hideJunctionViewIfNeeded");
  }
}

- (void)setResumeRouteBannerHidden:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController resumeRouteBanner](self, "resumeRouteBanner"));
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "hideIfNeeded");
  else
    objc_msgSend(v4, "showIfNeeded");

}

- (BOOL)isForWalkingNav
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController route](self, "route"));
  v3 = objc_msgSend(v2, "transportType") == 2;

  return v3;
}

- (void)willDismissNavigationAnimated:(BOOL)a3
{
  double v3;
  _QWORD v4[5];
  _QWORD v5[5];

  v3 = 0.0;
  if (a3)
    v3 = 0.25;
  v4[4] = self;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100C66228;
  v5[3] = &unk_1011AC860;
  v5[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100C66308;
  v4[3] = &unk_1011AE8F8;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v5, v4, v3);
}

- (void)_navigationChromeVisibilityChanged
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("__internal__hideChromeInNavigation"));

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController view](self, "view", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subviews"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10), "setHidden:", v4);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  NSString *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = NSStringFromSelector("collapsedHeight");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = objc_msgSend(v10, "isEqualToString:", v14);

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController navSignViewController](self, "navSignViewController"));
    objc_msgSend(v16, "collapsedHeight");
    v18 = v17;

    -[NavContainerViewController signListHeight](self, "signListHeight");
    if (v18 <= v19)
    {
      -[NavContainerViewController signListHeight](self, "signListHeight");
      v18 = v20;
    }
    -[NavContainerViewController setSignListHeight:](self, "setSignListHeight:", v18);
    -[NavContainerViewController _indicatorsTopPosition](self, "_indicatorsTopPosition");
    -[NSLayoutConstraint setConstant:](self->_portraitIndicatorsTopConstraint, "setConstant:");
    -[NavContainerViewController _secondarySignTopPosition](self, "_secondarySignTopPosition");
    -[NSLayoutConstraint setConstant:](self->_secondarySignTopConstraint, "setConstant:");
    -[NavContainerViewController _junctionViewTopPosition](self, "_junctionViewTopPosition");
    -[NSLayoutConstraint setConstant:](self->_junctionViewTopConstraint, "setConstant:");
    -[ContainerViewController updateMapEdgeInsets](self, "updateMapEdgeInsets");
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)NavContainerViewController;
    -[NavContainerViewController observeValueForKeyPath:ofObject:change:context:](&v21, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
  }

}

- (double)topEdgeInset
{
  unint64_t v3;
  double result;
  void *v6;
  void *v7;
  double MinY;
  CGRect v9;

  v3 = -[ContainerViewController containerStyle](self, "containerStyle");
  if (v3 > 7 || ((1 << v3) & 0xE3) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewport"));
    objc_msgSend(v7, "frame");
    MinY = CGRectGetMinY(v9);

    return MinY;
  }
  else
  {
    -[NavContainerViewController _usedPortraitTopSpace](self, "_usedPortraitTopSpace");
  }
  return result;
}

- (double)bottomEdgeInset
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char isKindOfClass;
  void *v16;
  uint64_t v17;
  char v18;
  double v19;
  void *v20;
  double v21;
  objc_super v23;

  v3 = -[ContainerViewController containerStyle](self, "containerStyle");
  if (v3 - 2 < 2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController view](self, "view"));
    objc_msgSend(v8, "safeAreaInsets");
    v10 = v9;
LABEL_13:

    return v10;
  }
  if (v3 == 1 || v3 == 5)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController trafficIncidentAlertCoordinator](self, "trafficIncidentAlertCoordinator"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "alertViewController"));
    if (v4 == v6)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cardPresentationController"));
      v7 = objc_msgSend(v12, "containeeLayout") == (id)5;

    }
    else
    {
      v7 = 0;
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    v14 = objc_opt_class(NavTrafficIncidentReportSubmissionContaineeViewController);
    isKindOfClass = objc_opt_isKindOfClass(v13, v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    v17 = objc_opt_class(PlaceCardViewController);
    v18 = objc_opt_isKindOfClass(v16, v17);

    if (v7 || (isKindOfClass & 1) != 0 || (v18 & 1) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cardPresentationController"));
      objc_msgSend(v20, "cardHeight");
      v10 = v21;

      goto LABEL_13;
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)NavContainerViewController;
  -[ContainerViewController bottomEdgeInset](&v23, "bottomEdgeInset");
  return v19;
}

- (void)setBannerAction:(id)a3
{
  -[NavContainerViewController setBannerAction:animated:](self, "setBannerAction:animated:", a3, 0);
}

- (void)setBannerAction:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  NavContainerBannerAction *v6;
  NavContainerBannerAction *bannerAction;
  void *v8;
  void *v9;
  id v10;

  if (self->_bannerAction != a3)
  {
    v4 = a4;
    v6 = (NavContainerBannerAction *)objc_msgSend(a3, "copy");
    bannerAction = self->_bannerAction;
    self->_bannerAction = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerBannerAction title](self->_bannerAction, "title"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController resumeRouteBanner](self, "resumeRouteBanner"));
    objc_msgSend(v9, "setTitle:", v8);

    v10 = (id)objc_claimAutoreleasedReturnValue(-[NavContainerViewController iosBasedChromeViewController](self, "iosBasedChromeViewController"));
    objc_msgSend(v10, "setNeedsUpdateComponent:animated:", CFSTR("statusBarSupplementaryView"), v4);

  }
}

- (void)_performBannerAction
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t (**v6)(void);
  int v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController bannerAction](self, "bannerAction"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "actionHandler"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController bannerAction](self, "bannerAction"));
    v6 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "actionHandler"));
    v7 = v6[2]();

    if (v7)
      -[NavContainerViewController setBannerAction:animated:](self, "setBannerAction:animated:", 0, 1);
  }
}

- (void)_closeBannerAction
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController bannerAction](self, "bannerAction"));
  v4 = objc_msgSend(v3, "copy");

  objc_msgSend(v4, "setHidden:", 1);
  -[NavContainerViewController setBannerAction:animated:](self, "setBannerAction:animated:", v4, 1);

}

- (BOOL)_bannerActionShouldDisplay
{
  BOOL v3;
  void *v4;

  if (-[NavContainerBannerAction hidden](self->_bannerAction, "hidden"))
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerBannerAction title](self->_bannerAction, "title"));
  if (objc_msgSend(v4, "length"))
    v3 = !self->_junctionViewActive;
  else
    v3 = 0;

  return v3;
}

- (void)switchToOverviewMode
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController coordinator](self, "coordinator"));
  objc_msgSend(v3, "sender:switchToNavigationCameraMode:", self, 1);

  -[GCDTimer invalidate](self->_pedestrianARFeatureIntroTeachableMomentTimer, "invalidate");
}

- (void)switchToZoomedInMode
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController coordinator](self, "coordinator"));
  objc_msgSend(v3, "sender:switchToNavigationCameraMode:", self, 0);

  -[GCDTimer invalidate](self->_pedestrianARFeatureIntroTeachableMomentTimer, "invalidate");
}

- (void)toggleHeadingMode
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController coordinator](self, "coordinator"));
  objc_msgSend(v3, "toggleLowGuidanceNavigationCameraHeading");

  -[GCDTimer invalidate](self->_pedestrianARFeatureIntroTeachableMomentTimer, "invalidate");
}

- (void)enterPedestrianAR
{
  void *v3;

  -[GCDTimer invalidate](self->_pedestrianARFeatureIntroTeachableMomentTimer, "invalidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController coordinator](self, "coordinator"));
  objc_msgSend(v3, "enterPedestrianAR");

  -[ContainerViewController setLayoutIfSupported:animated:](self, "setLayoutIfSupported:animated:", 1, 0);
}

- (StatusIndicatorView)statusIndicatorView
{
  StatusIndicatorView *statusIndicatorView;
  StatusIndicatorView *v4;
  StatusIndicatorView *v5;

  statusIndicatorView = self->_statusIndicatorView;
  if (!statusIndicatorView)
  {
    v4 = -[StatusIndicatorView initForLimitedMode:]([StatusIndicatorView alloc], "initForLimitedMode:", 1);
    v5 = self->_statusIndicatorView;
    self->_statusIndicatorView = v4;

    statusIndicatorView = self->_statusIndicatorView;
  }
  return statusIndicatorView;
}

- (void)statusIndicatorTypeChanged:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController statusIndicatorView](self, "statusIndicatorView"));
  objc_msgSend(v5, "setType:", a3);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController iosBasedChromeViewController](self, "iosBasedChromeViewController"));
  objc_msgSend(v6, "setNeedsUpdateComponent:animated:", CFSTR("statusBarStyle"), 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController iosBasedChromeViewController](self, "iosBasedChromeViewController"));
  objc_msgSend(v7, "setNeedsUpdateComponent:animated:", CFSTR("statusBarSupplementaryView"), 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController iosBasedChromeViewController](self, "iosBasedChromeViewController"));
  objc_msgSend(v8, "updateComponentsIfNeeded");

  -[NavContainerViewController _updateNavSignLayout](self, "_updateNavSignLayout");
  v9 = (id)objc_claimAutoreleasedReturnValue(-[NavContainerViewController navSignViewController](self, "navSignViewController"));
  objc_msgSend(v9, "updateHeightConstraints");

}

- (id)statusBarSupplementaryView
{
  void *v3;
  void *v4;

  if (-[NavContainerViewController _bannerActionShouldDisplay](self, "_bannerActionShouldDisplay"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController resumeRouteBanner](self, "resumeRouteBanner"));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController statusIndicatorView](self, "statusIndicatorView"));
    if (objc_msgSend(v4, "isVisible"))
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController statusIndicatorView](self, "statusIndicatorView"));
    else
      v3 = 0;

  }
  return v3;
}

- (void)_updateIdleTimer
{
  void *v3;
  uint64_t v4;
  double v5;
  NavIdleTimeoutTimer *v6;
  void *v7;
  void *v8;
  NavIdleTimeoutTimer *v9;
  id v10;

  if (-[PassThroughViewController hasParentView](self, "hasParentView")
    && (id)-[ContainerViewController containeeLayout](self, "containeeLayout") != (id)1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    v4 = objc_opt_class(NavTrafficIncidentContaineeViewController);
    if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
      v5 = 5.0;
    else
      v5 = 15.0;

    v6 = [NavIdleTimeoutTimer alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController view](self, "view"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "window"));
    v9 = -[NavIdleTimeoutTimer initWithWindow:idleTimeout:](v6, "initWithWindow:idleTimeout:", v8, v5);
    -[NavContainerViewController setIdleTimer:](self, "setIdleTimer:", v9);

    v10 = (id)objc_claimAutoreleasedReturnValue(-[NavContainerViewController idleTimer](self, "idleTimer"));
    objc_msgSend(v10, "setDelegate:", self);

  }
  else
  {
    -[NavContainerViewController setIdleTimer:](self, "setIdleTimer:", 0);
  }
}

- (void)idleTimerDidTimeout:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  char isKindOfClass;
  void *v13;
  uint64_t v14;
  char v15;
  void *v16;
  id v17;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController coordinator](self, "coordinator", a3));
  v5 = objc_msgSend(v4, "defaultContaineeViewControllerType");

  if (v5 != (id)1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    v7 = objc_opt_class(NavShareETAViewController);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    {
LABEL_5:

LABEL_6:
      -[ContainerViewController popLastViewControllerAnimated:](self, "popLastViewControllerAnimated:", 1);
      return;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    v9 = objc_opt_class(NavTrafficIncidentReportingContaineeViewController);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    {

      goto LABEL_5;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    v11 = objc_opt_class(NavVoiceVolumeViewController);
    isKindOfClass = objc_opt_isKindOfClass(v10, v11);

    if ((isKindOfClass & 1) != 0)
      goto LABEL_6;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    v14 = objc_opt_class(ModalContaineeViewController);
    v15 = objc_opt_isKindOfClass(v13, v14);

    if ((v15 & 1) != 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController coordinator](self, "coordinator"));
      objc_msgSend(v16, "dismissModalContainee");

      v17 = (id)objc_claimAutoreleasedReturnValue(-[NavContainerViewController coordinator](self, "coordinator"));
      objc_msgSend(v17, "dismissTray");

    }
    else
    {
      -[ContainerViewController setLayoutIfSupported:animated:](self, "setLayoutIfSupported:animated:", 1, 1);
    }
  }
}

- (int)currentUITargetForAnalytics
{
  void *v2;
  unsigned int v3;
  int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController route](self, "route"));
  v3 = objc_msgSend(v2, "transportType") - 1;
  if (v3 > 4)
    v4 = 401;
  else
    v4 = dword_100E3F580[v3];

  return v4;
}

- (int)currentMapViewTargetForAnalytics
{
  void *v2;
  uint64_t v3;
  char isKindOfClass;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  v3 = objc_opt_class(GuidanceSearchResultsViewController);
  isKindOfClass = objc_opt_isKindOfClass(v2, v3);

  if ((isKindOfClass & 1) != 0)
    return 506;
  else
    return 505;
}

- (void)willBeginDisplayingInSecureLockScreen
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NavContainerViewController;
  -[ContainerViewController willBeginDisplayingInSecureLockScreen](&v3, "willBeginDisplayingInSecureLockScreen");
  -[NavContainerViewController hideStatusBarIfNeeded](self, "hideStatusBarIfNeeded");
  -[NavContainerViewController setIdleTimer:](self, "setIdleTimer:", 0);
}

- (void)vlfSessionTaskWillShowVLFUINotification:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[UIView setHidden:](self->_navSignContainerView, "setHidden:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController indicatorsViewController](self, "indicatorsViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v5, "setHidden:", 1);

  self->_vlfActive = 1;
  -[NavContainerViewController _updateRecenterButtonLayout](self, "_updateRecenterButtonLayout");
  v6 = (id)objc_claimAutoreleasedReturnValue(-[NavContainerViewController iosBasedChromeViewController](self, "iosBasedChromeViewController"));
  objc_msgSend(v6, "setNeedsUpdateComponent:animated:", CFSTR("statusBarStyle"), 0);

}

- (void)vlfContaineeViewControllerDidDisappearNotification:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[UIView setHidden:](self->_navSignContainerView, "setHidden:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController indicatorsViewController](self, "indicatorsViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v5, "setHidden:", 0);

  self->_vlfActive = 0;
  -[NavContainerViewController _updateRecenterButtonLayout](self, "_updateRecenterButtonLayout");
  v6 = (id)objc_claimAutoreleasedReturnValue(-[NavContainerViewController iosBasedChromeViewController](self, "iosBasedChromeViewController"));
  objc_msgSend(v6, "setNeedsUpdateComponent:animated:", CFSTR("statusBarStyle"), 0);

}

- (void)_sceneConnectionsDidChange
{
  -[NavContainerViewController setConnectedToCarPlay:animated:](self, "setConnectedToCarPlay:animated:", +[UIApplication _maps_isAnySceneConnectedForRole:](UIApplication, "_maps_isAnySceneConnectedForRole:", _UIWindowSceneSessionRoleCarPlay), 1);
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NavContainerViewController;
  v4 = a3;
  -[ContainerViewController sceneWillEnterForeground:](&v8, "sceneWillEnterForeground:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object", v8.receiver, v8.super_class));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_maps_uiScene"));

  if (v5 == v7)
    -[NavContainerViewController _applyConnectedToCarPlayAnimated:](self, "_applyConnectedToCarPlayAnimated:", 0);
}

- (void)setConnectedToCarPlay:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  id v7;
  NSObject *v8;
  NavContainerViewController *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 connectedToCarPlay;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  _BOOL4 v22;

  if (self->_connectedToCarPlay != a3)
  {
    v4 = a4;
    v5 = a3;
    v7 = sub_100431C0C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      self->_connectedToCarPlay = v5;
      -[NavContainerViewController _applyConnectedToCarPlayAnimated:](self, "_applyConnectedToCarPlayAnimated:", v4);
      return;
    }
    v9 = self;
    v10 = (objc_class *)objc_opt_class(v9);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if ((objc_opt_respondsToSelector(v9, "accessibilityIdentifier") & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController performSelector:](v9, "performSelector:", "accessibilityIdentifier"));
      v14 = v13;
      if (v13 && !objc_msgSend(v13, "isEqualToString:", v12))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v12, v9, v14));

        goto LABEL_8;
      }

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v12, v9));
LABEL_8:

    connectedToCarPlay = self->_connectedToCarPlay;
    *(_DWORD *)buf = 138543874;
    v18 = v15;
    v19 = 1024;
    v20 = connectedToCarPlay;
    v21 = 1024;
    v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}@] Changing connectedToCarPlay from %d to %d", buf, 0x18u);

    goto LABEL_9;
  }
}

- (void)_applyConnectedToCarPlayAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  NavContainerViewController *v7;
  unsigned __int8 *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  int v15;
  void *v16;
  void *v17;
  _QWORD block[5];
  uint8_t buf[4];
  __CFString *v20;
  __int16 v21;
  int v22;

  v3 = a3;
  v5 = sub_100431C0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = self;
    v8 = (unsigned __int8 *)v7;
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
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "performSelector:", "accessibilityIdentifier"));
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
    v15 = v8[603];
    *(_DWORD *)buf = 138543618;
    v20 = v14;
    v21 = 1024;
    v22 = v15;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] Applying connectedToCarPlay %d", buf, 0x12u);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController navSignViewController](self, "navSignViewController"));
  objc_msgSend(v16, "setConnectedToCarPlay:animated:", self->_connectedToCarPlay, v3);

  if (self->_connectedToCarPlay)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    objc_msgSend(v17, "setOrientation:animated:", 1, v3);

  }
  -[NavContainerViewController setNeedsUpdateOfSupportedInterfaceOrientations](self, "setNeedsUpdateOfSupportedInterfaceOrientations");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100C676B4;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setSignListHeight:(double)a3
{
  void *v5;
  double MaxY;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect v11;
  CGRect v12;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController view](self, "view"));
  objc_msgSend(v5, "frame");
  MaxY = CGRectGetMaxY(v11);
  -[UIView frame](self->_navSignContainerView, "frame");
  v7 = MaxY - CGRectGetMinY(v12);
  -[NSLayoutConstraint constant](self->_signTopConstraint, "constant");
  v9 = v7 - v8;

  if (v9 <= a3)
    v10 = v9;
  else
    v10 = a3;
  self->_signListHeight = v10;
  -[NavContainerViewController _updateContaineeHiddenIfNeeded](self, "_updateContaineeHiddenIfNeeded");
}

- (void)_updateContaineeHiddenIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  double signListHeight;
  double v14;
  id v15;

  v15 = (id)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "cardPresentationController"));
  if ((objc_msgSend(v3, "usingSheetPresentation") & 1) == 0)
    goto LABEL_10;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  if (objc_msgSend(v4, "isBeingPresented"))
  {
LABEL_9:

LABEL_10:
    return;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  if ((objc_msgSend(v5, "isBeingDismissed") & 1) != 0)
  {
LABEL_8:

    goto LABEL_9;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController view](self, "view"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "superview"));
  if (!v7)
  {
LABEL_7:

    goto LABEL_8;
  }
  v8 = (void *)v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentIOSBasedContext"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeContext](self, "chromeContext"));
  if (v10 != v11)
  {

    goto LABEL_7;
  }
  v12 = -[NavContainerViewController _isPresentingOverlappingContainee](self, "_isPresentingOverlappingContainee");

  if ((v12 & 1) == 0)
  {
    -[ContainerViewController setContaineesHidden:](self, "setContaineesHidden:", -[NavContainerViewController shouldHideCard](self, "shouldHideCard"));
    signListHeight = self->_signListHeight;
    -[NavSignListViewController collapsedHeight](self->_navSignViewController, "collapsedHeight");
    if (signListHeight > v14)
      -[GCDTimer invalidate](self->_pedestrianARFeatureIntroTeachableMomentTimer, "invalidate");
  }
}

- (BOOL)_isPresentingOverlappingContainee
{
  uint64_t v2;
  void *v3;
  unsigned __int8 v4;

  v2 = objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  v3 = (void *)v2;
  if (qword_1014D45A8 != -1)
  {
    dispatch_once(&qword_1014D45A8, &stru_1011EA470);
    if (v3)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  if (!v2)
    goto LABEL_5;
LABEL_3:
  v4 = objc_msgSend((id)qword_1014D45A0, "containsObject:", objc_opt_class(v3));
LABEL_6:

  return v4;
}

- (void)signListHeightWillChangeAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  _QWORD v11[5];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cardPresentationController"));
  v7 = objc_msgSend(v6, "containeeLayout");

  if (v7 == (id)2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cardPresentationController"));
    objc_msgSend(v9, "wantsLayout:", 1);

  }
  v10 = 0.0;
  if (v3)
    v10 = 0.25;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100C67BCC;
  v11[3] = &unk_1011AC860;
  v11[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v11, v10);
}

- (void)selectStep:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  id v17;

  v4 = a3;
  v17 = v4;
  if (v4)
  {
    v5 = objc_msgSend(v4, "stepIndex");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController route](self, "route"));
    v7 = objc_msgSend(v6, "segmentIndexForStepIndex:", v5);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController mapView](self, "mapView"));
    objc_msgSend(v8, "_setRouteContextInspectedSegmentIndex:inspectedStepIndex:", v7, v5);

    v9 = sub_100778658(v17);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController coordinator](self, "coordinator"));
    objc_msgSend(v16, "viewController:updateMapRect:", self, v9, v11, v13, v15);
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController coordinator](self, "coordinator"));
    objc_msgSend(v16, "recenterNavigation");
  }

  -[NavContainerViewController updateLayoutAnimated:](self, "updateLayoutAnimated:", 1);
}

- (void)pressedEndNavigationWithSender:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[NavContainerViewController coordinator](self, "coordinator"));
  objc_msgSend(v5, "pressedEndWithSender:", v4);

}

- (void)updatedLaneGuidanceHeight:(double)a3
{
  double v5;
  void *v6;
  void *v7;
  unsigned int v8;
  double v9;
  double v10;
  void *v11;
  CGRect v12;

  -[NSLayoutConstraint setConstant:](self->_signTopConstraint, "setConstant:");
  -[NSLayoutConstraint setConstant:](self->_laneGuidanceHeightConstraint, "setConstant:", a3);
  -[UIView frame](self->_navSignContainerView, "frame");
  v5 = CGRectGetHeight(v12) - a3;
  if (fabs(a3) <= 2.22044605e-16)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController navSignViewController](self, "navSignViewController"));
    if ((objc_msgSend(v6, "isExpanded") & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController navSignViewController](self, "navSignViewController"));
      v8 = objc_msgSend(v7, "isDragging");

      if (!v8)
        goto LABEL_8;
    }
    else
    {

    }
  }
  -[NavContainerViewController signListHeight](self, "signListHeight");
  if (v9 < v5)
  {
    -[NavContainerViewController signListHeight](self, "signListHeight");
    v5 = v10;
  }
LABEL_8:
  -[NavContainerViewController setSignListHeight:](self, "setSignListHeight:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController navSignViewController](self, "navSignViewController"));
  objc_msgSend(v11, "updateFooterConstraints");

  -[NavContainerViewController _indicatorsTopPosition](self, "_indicatorsTopPosition");
  -[NSLayoutConstraint setConstant:](self->_portraitIndicatorsTopConstraint, "setConstant:");
  -[NavContainerViewController _secondarySignTopPosition](self, "_secondarySignTopPosition");
  -[NSLayoutConstraint setConstant:](self->_secondarySignTopConstraint, "setConstant:");
  -[NavContainerViewController _junctionViewTopPosition](self, "_junctionViewTopPosition");
  -[NSLayoutConstraint setConstant:](self->_junctionViewTopConstraint, "setConstant:");
  -[ContainerViewController updateMapEdgeInsets](self, "updateMapEdgeInsets");
  -[NavContainerViewController _updateLaneGuidanceViewLayout](self, "_updateLaneGuidanceViewLayout");
  -[NavContainerViewController _updateNavSignLayout](self, "_updateNavSignLayout");
}

- (void)didTapLaneGuidance
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = sub_100431C0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Toggling nav sign list due to lane guidance tap", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController navSignViewController](self, "navSignViewController"));
  objc_msgSend(v5, "toggleExpansionAnimated:", 1);

}

- (double)_belowSignTopPosition
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  -[NSLayoutConstraint constant](self->_laneGuidanceHeightConstraint, "constant");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController navSignViewController](self, "navSignViewController"));
  objc_msgSend(v5, "collapsedHeight");
  v7 = v4 + v6;

  return v7;
}

- (double)_indicatorsTopPosition
{
  double v3;
  double v4;
  unsigned int v5;
  double v6;

  -[NavContainerViewController _belowSignTopPosition](self, "_belowSignTopPosition");
  v4 = v3;
  v5 = -[NavContainerViewController _isSecondarySignVisible](self, "_isSecondarySignVisible");
  v6 = -0.0;
  if (v5)
    v6 = 52.0;
  return v4 + v6;
}

- (double)_indicatorsTrailingInset
{
  void *v2;
  double v3;
  double v4;
  double result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController view](self, "view"));
  objc_msgSend(v2, "safeAreaInsets");
  v4 = v3;

  result = 0.0;
  if (v4 > 0.0)
    return 16.0;
  return result;
}

- (double)_usedPortraitTopSpace
{
  void *v3;
  void *v4;
  double MinY;
  double v6;
  double v7;
  double Height;
  double v9;
  void *v10;
  double v11;
  unsigned int v12;
  void *v13;
  void *v14;
  double v15;
  CGRect v17;
  CGRect v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewport"));
  objc_msgSend(v4, "frame");
  MinY = CGRectGetMinY(v17);

  -[NSLayoutConstraint constant](self->_laneGuidanceHeightConstraint, "constant");
  v7 = v6;
  Height = 0.0;
  v9 = 0.0;
  if (!-[UIView isHidden](self->_navSignContainerView, "isHidden"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController navSignViewController](self, "navSignViewController"));
    objc_msgSend(v10, "collapsedHeight");
    v9 = v11;

  }
  v12 = -[NavContainerViewController _isSecondarySignVisible](self, "_isSecondarySignVisible");
  if (self->_junctionViewDisplayed)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController junctionViewController](self, "junctionViewController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "view"));
    objc_msgSend(v14, "frame");
    Height = CGRectGetHeight(v18);

  }
  v15 = 52.0;
  if (!v12)
    v15 = 0.0;
  if (v15 <= Height)
    v15 = Height;
  return MinY + v7 + v9 + v15;
}

- (double)_navSignBottomPosition
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  -[NSLayoutConstraint constant](self->_signTopConstraint, "constant");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController navSignViewController](self, "navSignViewController"));
  objc_msgSend(v5, "collapsedHeight");
  v7 = v4 + v6;

  return v7;
}

- (double)_secondarySignTopPosition
{
  unsigned int v3;
  double v4;
  double v5;

  v3 = -[NavContainerViewController _isSecondarySignVisible](self, "_isSecondarySignVisible");
  -[NavContainerViewController _navSignBottomPosition](self, "_navSignBottomPosition");
  v5 = 52.0;
  if (v3)
    v5 = 0.0;
  return v4 - v5;
}

- (double)_junctionViewTopPosition
{
  _BOOL4 junctionViewDisplayed;
  double v4;
  double v5;
  double v6;

  junctionViewDisplayed = self->_junctionViewDisplayed;
  -[NavContainerViewController _navSignBottomPosition](self, "_navSignBottomPosition");
  v5 = v4;
  if (!junctionViewDisplayed)
  {
    -[NavContainerViewController maxAvailableHeightForJunctionView:](self, "maxAvailableHeightForJunctionView:", 0.0);
    return v5 - v6;
  }
  return v5;
}

- (double)maxAvailableHeightForJunctionView:(double)a3
{
  double v4;
  double v5;
  double v6;
  unint64_t v7;

  -[NavContainerViewController _maxAvailableHeightForJunctionView](self, "_maxAvailableHeightForJunctionView", a3);
  v4 = 250.0;
  if (v5 < 250.0)
  {
    -[NavContainerViewController _maxAvailableHeightForJunctionView](self, "_maxAvailableHeightForJunctionView");
    v4 = v6;
  }
  v7 = -[ContainerViewController containerStyle](self, "containerStyle");
  if (v7 <= 7 && ((1 << v7) & 0xE3) != 0 && v4 < 150.0)
    return 0.0;
  return v4;
}

- (void)hideJunctionViewTemporarily
{
  id v3;
  GCDTimer *v4;
  GCDTimer *junctionViewTimer;
  _QWORD v6[4];
  id v7;
  id location;

  -[NavContainerViewController hideJunctionViewIfNeededAnimated:](self, "hideJunctionViewIfNeededAnimated:", 1);
  objc_initWeak(&location, self);
  v3 = &_dispatch_main_q;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100C6838C;
  v6[3] = &unk_1011AE190;
  objc_copyWeak(&v7, &location);
  v4 = (GCDTimer *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, v6, 10.0));
  junctionViewTimer = self->_junctionViewTimer;
  self->_junctionViewTimer = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)applyTransitionWithProgress:(double)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)NavContainerViewController;
  -[OverlayContainerViewController applyTransitionWithProgress:](&v16, "applyTransitionWithProgress:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "previousTopContext"));
  v7 = objc_opt_class(PedestrianARContext);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nextTopContext"));
    v10 = objc_opt_class(PedestrianARContext);
    isKindOfClass = objc_opt_isKindOfClass(v9, v10);

    if ((isKindOfClass & 1) == 0)
      return;
  }
  -[UIView setAlpha:](self->_navSignContainerView, "setAlpha:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController indicatorsViewController](self, "indicatorsViewController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
  objc_msgSend(v13, "setAlpha:", a3);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "view"));
  objc_msgSend(v15, "setAlpha:", a3);

}

- (void)navigationService:(id)a3 updateSignsWithInfo:(id)a4
{
  id v5;
  unsigned int v6;
  void *v7;
  char BOOL;
  id v9;

  v5 = a4;
  v6 = -[NavContainerViewController _isSecondarySignVisible](self, "_isSecondarySignVisible");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "secondarySign"));

  self->_secondarySignActive = v7 != 0;
  if (v6 != -[NavContainerViewController _isSecondarySignVisible](self, "_isSecondarySignVisible"))
    -[NavContainerViewController _drawSecondarySign](self, "_drawSecondarySign");
  v9 = (id)objc_claimAutoreleasedReturnValue(-[NavContainerViewController traitCollection](self, "traitCollection"));
  if (objc_msgSend(v9, "isLuminanceReduced"))
  {
    BOOL = GEOConfigGetBOOL(MapsConfig_BacklightSceneUpdaterOptimizationEnabled, off_1014B49F8);

    if ((BOOL & 1) == 0)
      -[NavContainerViewController _updateBacklightSceneEnvironmentUI](self, "_updateBacklightSceneEnvironmentUI");
  }
  else
  {

  }
}

- (void)navigationService:(id)a3 showLaneDirections:(id)a4
{
  id v5;
  unsigned int v6;
  unsigned __int8 v7;

  v5 = a4;
  v6 = -[NavContainerViewController _isSecondarySignVisible](self, "_isSecondarySignVisible");
  v7 = objc_msgSend(v5, "isForManeuver");

  self->_isShowingMidstepLaneGuidance = v7 ^ 1;
  if (v6 != -[NavContainerViewController _isSecondarySignVisible](self, "_isSecondarySignVisible"))
    -[NavContainerViewController _drawSecondarySign](self, "_drawSecondarySign");
}

- (void)navigationService:(id)a3 hideLaneDirectionsForId:(id)a4
{
  unsigned int v5;

  v5 = -[NavContainerViewController _isSecondarySignVisible](self, "_isSecondarySignVisible", a3, a4);
  self->_isShowingMidstepLaneGuidance = 0;
  if (v5 != -[NavContainerViewController _isSecondarySignVisible](self, "_isSecondarySignVisible"))
    -[NavContainerViewController _drawSecondarySign](self, "_drawSecondarySign");
}

- (void)navigationService:(id)a3 showJunctionView:(id)a4
{
  id v5;
  NavJunctionViewInfo *v6;
  void *v7;

  self->_junctionViewActive = 1;
  v5 = a4;
  v6 = -[NavJunctionViewInfo initWithGuidanceJunctionViewInfo:]([NavJunctionViewInfo alloc], "initWithGuidanceJunctionViewInfo:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController junctionViewController](self, "junctionViewController"));
  objc_msgSend(v7, "setJunctionViewInfo:", v6);

  -[NavContainerViewController showJunctionViewIfNeeded](self, "showJunctionViewIfNeeded");
}

- (void)navigationService:(id)a3 hideJunctionViewForId:(id)a4
{
  self->_junctionViewActive = 0;
  -[NavContainerViewController hideJunctionViewIfNeededAnimated:](self, "hideJunctionViewIfNeededAnimated:", 1, a4);
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  uint64_t v8;
  id v9;

  if ((MNNavigationServiceStateChangedFromNavigatingToStopped(a4, a5) & 1) != 0
    || MNNavigationServiceStateChangedToNavigating(a4, a5, v8))
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[NavContainerViewController iosBasedChromeViewController](self, "iosBasedChromeViewController"));
    objc_msgSend(v9, "setNeedsUpdateComponent:animated:", CFSTR("statusBarStyle"), 0);

  }
}

- (void)navigationService:(id)a3 didUpdateArrivalInfo:(id)a4
{
  -[NavContainerViewController _updateArrivalStateForced:](self, "_updateArrivalStateForced:", 0, a4);
}

- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6
{
  -[NavContainerViewController _updateNavSignForArrival:forced:](self, "_updateNavSignForArrival:forced:", 0, 0, a5, a6);
}

- (void)_updateArrivalStateForced:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _BOOL8 v6;
  id v7;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "arrivalInfo"));

  if (v7)
    v6 = objc_msgSend(v7, "arrivalState") != 0;
  else
    v6 = 0;
  -[NavContainerViewController _updateNavSignForArrival:forced:](self, "_updateNavSignForArrival:forced:", v6, v3);

}

- (void)_updateNavSignForArrival:(BOOL)a3 forced:(BOOL)a4
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  id v9;

  if (self->_isArrivalState != a3 || a4)
  {
    v5 = a3;
    self->_isArrivalState = a3;
    if (!-[NavContainerViewController isConnectedToCarPlay](self, "isConnectedToCarPlay"))
      -[UIView setHidden:](self->_navSignContainerView, "setHidden:", v5);
    -[NavContainerViewController _updateControlsHiddenAnimated:](self, "_updateControlsHiddenAnimated:", 1);
    -[NavContainerViewController _updateChildViewLayouts](self, "_updateChildViewLayouts");
    -[NavContainerViewController _updateContaineeHiddenIfNeeded](self, "_updateContaineeHiddenIfNeeded");
    -[ContainerViewController updateMapEdgeInsets](self, "updateMapEdgeInsets");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController iosBasedChromeViewController](self, "iosBasedChromeViewController"));
    objc_msgSend(v7, "setNeedsUpdateComponent:animated:", CFSTR("statusBarStyle"), 1);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController iosBasedChromeViewController](self, "iosBasedChromeViewController"));
    objc_msgSend(v8, "setNeedsUpdateComponent:animated:", CFSTR("StaleMapEffect"), 1);

    v9 = (id)objc_claimAutoreleasedReturnValue(-[NavContainerViewController iosBasedChromeViewController](self, "iosBasedChromeViewController"));
    objc_msgSend(v9, "updateComponentsIfNeeded");

  }
}

- (BOOL)_isSecondarySignVisible
{
  return self->_isShowingMidstepLaneGuidance || self->_secondarySignActive;
}

- (void)_drawSecondarySign
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController view](self, "view"));
  objc_msgSend(v3, "layoutIfNeeded");

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100C68A24;
  v4[3] = &unk_1011AC860;
  v4[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v4, 0.25);
}

- (void)_updateBacklightSceneEnvironmentUI
{
  NSDate *lastBacklightSceneUpdateDate;
  double v4;
  NSDate *v5;
  NSDate *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (!GEOConfigGetBOOL(MapsConfig_BacklightSceneUpdaterOptimizationEnabled, off_1014B49F8))
    goto LABEL_5;
  lastBacklightSceneUpdateDate = self->_lastBacklightSceneUpdateDate;
  if (!lastBacklightSceneUpdateDate
    || (-[NSDate timeIntervalSinceNow](lastBacklightSceneUpdateDate, "timeIntervalSinceNow"), v4 <= -0.9))
  {
    v5 = objc_opt_new(NSDate);
    v6 = self->_lastBacklightSceneUpdateDate;
    self->_lastBacklightSceneUpdateDate = v5;

LABEL_5:
    v10 = (id)objc_claimAutoreleasedReturnValue(-[NavContainerViewController view](self, "view"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "window"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "windowScene"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_backlightSceneEnvironment"));
    objc_msgSend(v9, "invalidateAllTimelinesForReason:", CFSTR("Navigation service received sign info update"));

  }
}

- (BOOL)_shouldShowPedestrianARTeachableMomentCard
{
  void *v3;
  char *v4;
  id v5;
  NSObject *v6;
  const __CFString *v7;
  id v8;
  const char *v9;
  id v10;
  NSObject *v12;
  uint32_t v13;
  id v14;
  int v15;
  const __CFString *v16;

  if (!self->_pedestrianARSessionStateManager)
  {
    v8 = sub_100431C0C();
    v6 = objc_claimAutoreleasedReturnValue(v8);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      goto LABEL_19;
    LOWORD(v15) = 0;
    v9 = "Not showing Pedestrian AR teachable moment card because the feature is not enabled";
    goto LABEL_17;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  v4 = (char *)objc_msgSend(v3, "currentInterruptionKind");

  if (!v4)
  {
    if ((-[ContainerViewController containerStyle](self, "containerStyle") & 0xFFFFFFFFFFFFFFFDLL) == 4)
    {
      v10 = sub_100431C0C();
      v6 = objc_claimAutoreleasedReturnValue(v10);
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        goto LABEL_19;
      LOWORD(v15) = 0;
      v9 = "Not showing Pedestrian AR teachable moment card because the phone is in landscape";
    }
    else
    {
      if (-[PedestrianARSessionStateManager shouldShowPedestrianAR](self->_pedestrianARSessionStateManager, "shouldShowPedestrianAR"))
      {
        return 1;
      }
      v14 = sub_100431C0C();
      v6 = objc_claimAutoreleasedReturnValue(v14);
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        goto LABEL_19;
      LOWORD(v15) = 0;
      v9 = "Not showing the Pedestrian AR teachable moment card because the feature is not available right now";
    }
LABEL_17:
    v12 = v6;
    v13 = 2;
LABEL_18:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v15, v13);
    goto LABEL_19;
  }
  v5 = sub_100431C0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)(v4 - 2) > 0x15)
      v7 = CFSTR("kMapsInterruptionDirectionsSafetyWarning");
    else
      v7 = off_1011EA510[(_QWORD)(v4 - 2)];
    v15 = 138412290;
    v16 = v7;
    v9 = "Not showing Pedestrian AR teachable moment card because there is currently an interruption present: %@";
    v12 = v6;
    v13 = 12;
    goto LABEL_18;
  }
LABEL_19:

  return 0;
}

- (void)_showPedestrianARFeatureIntroTeachableMomentCardIfNecessary
{
  unsigned __int8 v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  id v7;
  const char *v8;
  uint8_t *v9;
  uint8_t v10[16];
  uint8_t buf[2];
  __int16 v12;

  if (!-[NavContainerViewController _shouldShowPedestrianARTeachableMomentCard](self, "_shouldShowPedestrianARTeachableMomentCard"))
  {
    v7 = sub_100431C0C();
    v5 = objc_claimAutoreleasedReturnValue(v7);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      goto LABEL_11;
    v12 = 0;
    v8 = "Not showing Pedestrian AR feature intro teachable moment card because we should not show any teachable moment cards right now";
    v9 = (uint8_t *)&v12;
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, v8, v9, 2u);
    goto LABEL_11;
  }
  v3 = +[PedestrianARFeatureIntroTeachableMomentContaineeViewController shouldShowTeachableMoment](PedestrianARFeatureIntroTeachableMomentContaineeViewController, "shouldShowTeachableMoment");
  v4 = sub_100431C0C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if ((v3 & 1) == 0)
  {
    if (!v6)
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v8 = "Not showing Pedestrian AR feature intro teachable moment card because it is not eligible to be shown";
    v9 = buf;
    goto LABEL_10;
  }
  if (v6)
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Showing the Pedestrian AR feature intro teachable moment card", v10, 2u);
  }

  v5 = objc_claimAutoreleasedReturnValue(-[NavContainerViewController coordinator](self, "coordinator"));
  -[NSObject showPedestrianARFeatureIntroTeachableMomentCard](v5, "showPedestrianARFeatureIntroTeachableMomentCard");
LABEL_11:

}

- (void)_showPedestrianARRaiseToEnterTeachableMomentCardIfNecessary
{
  id v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  _BOOL4 v16;
  id v17;
  uint8_t v18[16];
  __int16 v19;
  __int16 v20;
  __int16 v21;
  uint8_t buf[2];

  if (-[NavContainerViewController _shouldShowPedestrianARTeachableMomentCard](self, "_shouldShowPedestrianARTeachableMomentCard"))
  {
    if (+[PedestrianARRaiseToEnterTeachableMomentContaineeViewController hasShownTeachableMoment](PedestrianARRaiseToEnterTeachableMomentContaineeViewController, "hasShownTeachableMoment"))
    {
      v3 = sub_100431C0C();
      v4 = objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v21 = 0;
        v5 = "Not showing Pedestrian AR raise to enter teachable moment card because it has already been shown before";
        v6 = (uint8_t *)&v21;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, v5, v6, 2u);
      }
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[PedestrianARSessionUsageTracker sharedInstance](PedestrianARSessionUsageTracker, "sharedInstance"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerViewController route](self, "route"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uniqueRouteID"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));
      v12 = objc_msgSend(v8, "hasAREverLocalizedForRoute:", v11);

      if ((v12 & 1) == 0)
      {
        v17 = sub_100431C0C();
        v4 = objc_claimAutoreleasedReturnValue(v17);
        if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
          goto LABEL_8;
        v20 = 0;
        v5 = "Not showing Pedestrian AR raise to enter teachable moment card because the user hasn't localized on the current route yet";
        v6 = (uint8_t *)&v20;
        goto LABEL_7;
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[PedestrianARSessionUsageTracker sharedInstance](PedestrianARSessionUsageTracker, "sharedInstance"));
      v14 = objc_msgSend(v13, "hasARElementRendered");

      v15 = sub_100431C0C();
      v4 = objc_claimAutoreleasedReturnValue(v15);
      v16 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
      if ((v14 & 1) == 0)
      {
        if (!v16)
          goto LABEL_8;
        v19 = 0;
        v5 = "Not showing Pedestrian AR raise to enter teachable moment card because the user hasn't seen an AR element yet";
        v6 = (uint8_t *)&v19;
        goto LABEL_7;
      }
      if (v16)
      {
        *(_WORD *)v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Showing the Pedestrian AR raise to enter teachable moment card", v18, 2u);
      }

      v4 = objc_claimAutoreleasedReturnValue(-[NavContainerViewController coordinator](self, "coordinator"));
      -[NSObject showPedestrianARRaiseToEnterTeachableMomentCard](v4, "showPedestrianARRaiseToEnterTeachableMomentCard");
    }
  }
  else
  {
    v7 = sub_100431C0C();
    v4 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v5 = "Not showing Pedestrian AR raise to enter teachable moment card because we should not show any teachable momen"
           "t cards right now";
      v6 = buf;
      goto LABEL_7;
    }
  }
LABEL_8:

}

- (double)signListHeight
{
  return self->_signListHeight;
}

- (NavContainerBannerAction)bannerAction
{
  return self->_bannerAction;
}

- (NavActionCoordinator)coordinator
{
  return self->_coordinator;
}

- (void)setCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_coordinator, a3);
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (BOOL)showingTemporaryStatusBar
{
  return self->_showingTemporaryStatusBar;
}

- (void)setShowingTemporaryStatusBar:(BOOL)a3
{
  self->_showingTemporaryStatusBar = a3;
}

- (GuidanceObserver)guidanceObserver
{
  return self->_guidanceObserver;
}

- (double)availableHeightForJunctionView
{
  return self->_availableHeightForJunctionView;
}

- (unint64_t)signStyle
{
  return self->_signStyle;
}

- (BOOL)shouldShowNavIndicators
{
  return self->_shouldShowNavIndicators;
}

- (PlatformController)platformController
{
  return self->_platformController;
}

- (void)setPlatformController:(id)a3
{
  objc_storeStrong((id *)&self->_platformController, a3);
}

- (void)setDebugViewsController:(id)a3
{
  objc_storeStrong((id *)&self->_debugViewsController, a3);
}

- (BOOL)debugViewControllerEnabled
{
  return self->_debugViewControllerEnabled;
}

- (NavContainerResumeRouteControl)resumeRouteBanner
{
  return self->_resumeRouteBanner;
}

- (NavIdleTimeoutTimer)idleTimer
{
  return self->_idleTimer;
}

- (void)setIdleTimer:(id)a3
{
  objc_storeStrong((id *)&self->_idleTimer, a3);
}

- (void)setLaneGuidanceViewController:(id)a3
{
  objc_storeStrong((id *)&self->_laneGuidanceViewController, a3);
}

- (void)setNavSignViewController:(id)a3
{
  objc_storeStrong((id *)&self->_navSignViewController, a3);
}

- (void)setJunctionViewController:(id)a3
{
  objc_storeStrong((id *)&self->_junctionViewController, a3);
}

- (void)setSecondarySignViewController:(id)a3
{
  objc_storeStrong((id *)&self->_secondarySignViewController, a3);
}

- (void)setIndicatorsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_indicatorsViewController, a3);
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

- (BOOL)isConnectedToCarPlay
{
  return self->_connectedToCarPlay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusIndicatorView, 0);
  objc_storeStrong((id *)&self->_statusIndicatorManager, 0);
  objc_storeStrong((id *)&self->_indicatorsViewController, 0);
  objc_storeStrong((id *)&self->_secondarySignViewController, 0);
  objc_storeStrong((id *)&self->_junctionViewController, 0);
  objc_storeStrong((id *)&self->_navSignViewController, 0);
  objc_storeStrong((id *)&self->_laneGuidanceViewController, 0);
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong((id *)&self->_resumeRouteBanner, 0);
  objc_storeStrong((id *)&self->_debugViewsController, 0);
  objc_storeStrong((id *)&self->_platformController, 0);
  objc_storeStrong((id *)&self->_guidanceObserver, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_bannerAction, 0);
  objc_storeStrong((id *)&self->_lastBacklightSceneUpdateDate, 0);
  objc_storeStrong((id *)&self->_recenterButton, 0);
  objc_storeStrong((id *)&self->_pedestrianARFeatureIntroTeachableMomentTimer, 0);
  objc_storeStrong((id *)&self->_pedestrianARSessionStateManager, 0);
  objc_storeStrong((id *)&self->_suppressedContainee, 0);
  objc_storeStrong((id *)&self->_junctionViewTimer, 0);
  objc_storeStrong((id *)&self->_temporaryStatusBarHidingTimer, 0);
  objc_storeStrong((id *)&self->_laneGuidanceHeightConstraint, 0);
  objc_storeStrong((id *)&self->_landscapeIndicatorsTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_landscapeIndicatorsConstraints, 0);
  objc_storeStrong((id *)&self->_portraitIndicatorsTopConstraint, 0);
  objc_storeStrong((id *)&self->_portraitIndicatorsConstraints, 0);
  objc_storeStrong((id *)&self->_junctionViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_secondarySignTopConstraint, 0);
  objc_storeStrong((id *)&self->_signTopConstraint, 0);
  objc_storeStrong((id *)&self->_signContainerLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_signContainerTopConstraint, 0);
  objc_storeStrong((id *)&self->_navSignContainerView, 0);
}

@end
