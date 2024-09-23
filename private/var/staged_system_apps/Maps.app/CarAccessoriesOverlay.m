@implementation CarAccessoriesOverlay

- (void)dealloc
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  objc_super v6;
  uint8_t buf[4];
  CarAccessoriesOverlay *v8;

  v3 = sub_100A9B584();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  -[MapsLightLevelController removeObserver:](self->_lightLevelController, "removeObserver:", self);
  GEOConfigRemoveDelegateListenerForAllKeys(self, v5);
  -[CarAccessoriesOverlay setContentView:layoutGuide:](self, "setContentView:layoutGuide:", 0, 0);
  v6.receiver = self;
  v6.super_class = (Class)CarAccessoriesOverlay;
  -[CarAccessoriesOverlay dealloc](&v6, "dealloc");
}

- (CarAccessoriesOverlay)initWithCarSceneType:(int64_t)a3
{
  CarAccessoriesOverlay *v4;
  id v5;
  NSObject *v6;
  objc_super v8;
  uint8_t buf[4];
  CarAccessoriesOverlay *v10;

  v8.receiver = self;
  v8.super_class = (Class)CarAccessoriesOverlay;
  v4 = -[CarAccessoriesOverlay init](&v8, "init");
  if (v4)
  {
    v5 = sub_100A9B584();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    v4->_sceneType = a3;
    v4->_userPermitsHeadingIndicator = GEOConfigGetBOOL(MapsConfig_NavigationShowHeading, off_1014B2FD8);
    v4->_userPermitsSpeedSign = GEOConfigGetBOOL(MapsConfig_NavigationShowSpeedLimit, off_1014B2FE8);
    _GEOConfigAddDelegateListenerForKey(MapsConfig_NavigationShowHeading, off_1014B2FD8, &_dispatch_main_q, v4);
    _GEOConfigAddDelegateListenerForKey(MapsConfig_NavigationShowSpeedLimit, off_1014B2FE8, &_dispatch_main_q, v4);

  }
  return v4;
}

- (void)setHost:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  MapsLightLevelController *v8;
  void *v9;
  void *v10;
  MapsLightLevelController *v11;
  MapsLightLevelController *lightLevelController;
  void *v13;
  void *v14;
  UIStackView *accessoryStackView;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  MapsLightLevelController *v28;
  id v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  CarAccessoriesOverlay *v33;
  __int16 v34;
  void *v35;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_host);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_host, v4);
    if (v4)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containingViewController"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_maps_carSceneDelegate"));

      v8 = [MapsLightLevelController alloc];
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "window"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "windowScene"));
      v11 = -[MapsLightLevelController initWithWindowScene:](v8, "initWithWindowScene:", v10);
      lightLevelController = self->_lightLevelController;
      self->_lightLevelController = v11;

      -[MapsLightLevelController addObserver:](self->_lightLevelController, "addObserver:", self);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "overlayContentView"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layoutGuideForOverlay:", self));
      -[CarAccessoriesOverlay setContentView:layoutGuide:](self, "setContentView:layoutGuide:", v13, v14);

      accessoryStackView = self->_accessoryStackView;
      if (accessoryStackView)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView _maps_leftRHDAnchor](accessoryStackView, "_maps_leftRHDAnchor"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapInsetsLayoutGuide"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "_maps_rightRHDAnchor"));
        LODWORD(v19) = 1148846080;
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_maps_constraintWithRHDAnchor:relation:constant:priority:", v18, 1, 8.0, v19));
        v31 = v20;
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v31, 1));
        objc_msgSend(v4, "setMapInsetsConstraints:forOverlay:", v21, self);

        v22 = objc_claimAutoreleasedReturnValue(-[UIStackView _maps_leftRHDAnchor](self->_accessoryStackView, "_maps_leftRHDAnchor"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewportLayoutGuide"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "_maps_rightRHDAnchor"));
        LODWORD(v25) = 1148846080;
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject _maps_constraintWithRHDAnchor:relation:constant:priority:](v22, "_maps_constraintWithRHDAnchor:relation:constant:priority:", v24, 1, 8.0, v25));
        v30 = v26;
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v30, 1));
        objc_msgSend(v4, "setViewportConstraints:forOverlay:", v27, self);

      }
      else
      {
        v29 = sub_100A9B584();
        v22 = objc_claimAutoreleasedReturnValue(v29);
        if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
LABEL_9:

          goto LABEL_10;
        }
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarAccessoriesOverlay host](self, "host"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "overlayContentView"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "sceneIdentifierForLogging"));
        *(_DWORD *)buf = 134349314;
        v33 = self;
        v34 = 2112;
        v35 = v26;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "[%{public}p] [%@] Failed to set up constraints for accessory stackView as it was nil at the time.", buf, 0x16u);
      }

      goto LABEL_9;
    }
    -[MapsLightLevelController removeObserver:](self->_lightLevelController, "removeObserver:", self);
    v28 = self->_lightLevelController;
    self->_lightLevelController = 0;

    -[CarAccessoriesOverlay setContentView:layoutGuide:](self, "setContentView:layoutGuide:", 0, 0);
  }
LABEL_10:

}

- (void)setContentView:(id)a3 layoutGuide:(id)a4
{
  id v6;
  id v7;
  id v8;
  UIStackView *accessoryStackView;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  UIStackView *v15;
  UIStackView *v16;
  UIStackView *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  NSLayoutConstraint *v29;
  NSLayoutConstraint *leadingConstraint;
  void *v31;
  void *v32;
  double v33;
  NSLayoutConstraint *v34;
  NSLayoutConstraint *trailingConstraint;
  void *v36;
  void *v37;
  void *v38;
  NSLayoutConstraint *v39;
  NSLayoutConstraint *v40;
  void *v41;
  CarSpeedSignView *speedSignView;
  void *v43;
  NSObject *speedSignObserver;
  CarHeadingIndicatorView *headingIndicator;
  void *v46;
  NSObject *headingIndicatorObserver;
  _QWORD v48[3];
  void *v49;
  uint8_t buf[4];
  CarAccessoriesOverlay *v51;
  __int16 v52;
  void *v53;

  v6 = a3;
  v7 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[UIStackView superview](self->_accessoryStackView, "superview"));
  if (v8 != v6)
  {
    -[UIStackView removeFromSuperview](self->_accessoryStackView, "removeFromSuperview");
    accessoryStackView = self->_accessoryStackView;
    self->_accessoryStackView = 0;

    if (v6)
    {
      v10 = sub_100A9B584();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarAccessoriesOverlay host](self, "host"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "overlayContentView"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sceneIdentifierForLogging"));
        *(_DWORD *)buf = 134349314;
        v51 = self;
        v52 = 2112;
        v53 = v14;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[%{public}p] [%@] Will create new accessory container view", buf, 0x16u);

      }
      v15 = (UIStackView *)objc_msgSend(objc_alloc((Class)UIStackView), "initWithArrangedSubviews:", &__NSArray0__struct);
      v16 = self->_accessoryStackView;
      self->_accessoryStackView = v15;

      -[UIStackView setAccessibilityIdentifier:](self->_accessoryStackView, "setAccessibilityIdentifier:", CFSTR("CarAccessoryOverlayStackView"));
      -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_accessoryStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIStackView setSpacing:](self->_accessoryStackView, "setSpacing:", 8.0);
      -[UIStackView setAlpha:](self->_accessoryStackView, "setAlpha:", 0.0);
      v17 = self->_accessoryStackView;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView heightAnchor](v17, "heightAnchor"));
      LODWORD(v19) = 1112014848;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToConstant:priority:", 0.0, v19));
      v49 = v20;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v49, 1));
      -[UIStackView addConstraints:](v17, "addConstraints:", v21);

      LODWORD(v22) = 1148846080;
      -[UIStackView setContentCompressionResistancePriority:forAxis:](self->_accessoryStackView, "setContentCompressionResistancePriority:forAxis:", 1, v22);
      LODWORD(v23) = 1148846080;
      -[UIStackView setContentCompressionResistancePriority:forAxis:](self->_accessoryStackView, "setContentCompressionResistancePriority:forAxis:", 0, v23);
      LODWORD(v24) = 1148846080;
      -[UIStackView setContentHuggingPriority:forAxis:](self->_accessoryStackView, "setContentHuggingPriority:forAxis:", 1, v24);
      LODWORD(v25) = 1148846080;
      -[UIStackView setContentHuggingPriority:forAxis:](self->_accessoryStackView, "setContentHuggingPriority:forAxis:", 0, v25);
      objc_msgSend(v6, "addSubview:", self->_accessoryStackView);
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView _maps_leftRHDAnchor](self->_accessoryStackView, "_maps_leftRHDAnchor"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_maps_leftRHDAnchor"));
      LODWORD(v28) = 1148846080;
      v29 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "_maps_constraintWithRHDAnchor:relation:constant:priority:", v27, 0, 8.0, v28));
      leadingConstraint = self->_leadingConstraint;
      self->_leadingConstraint = v29;

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView _maps_rightRHDAnchor](self->_accessoryStackView, "_maps_rightRHDAnchor"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_maps_rightRHDAnchor"));
      LODWORD(v33) = 1148846080;
      v34 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "_maps_constraintWithRHDAnchor:relation:constant:priority:", v32, 0, -8.0, v33));
      trailingConstraint = self->_trailingConstraint;
      self->_trailingConstraint = v34;

      v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](self->_accessoryStackView, "topAnchor"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:constant:", v37, 8.0));
      v39 = self->_leadingConstraint;
      v40 = self->_trailingConstraint;
      v48[0] = v38;
      v48[1] = v39;
      v48[2] = v40;
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v48, 3));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v41);

      -[CarAccessoriesOverlay reloadAnimated:](self, "reloadAnimated:", 0);
    }
    else
    {
      speedSignView = self->_speedSignView;
      self->_speedSignView = 0;

      if (self->_speedSignObserver)
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        objc_msgSend(v43, "removeObserver:", self->_speedSignObserver);

        speedSignObserver = self->_speedSignObserver;
        self->_speedSignObserver = 0;

      }
      headingIndicator = self->_headingIndicator;
      self->_headingIndicator = 0;

      if (self->_headingIndicatorObserver)
      {
        v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        objc_msgSend(v46, "removeObserver:", self->_headingIndicatorObserver);

        headingIndicatorObserver = self->_headingIndicatorObserver;
        self->_headingIndicatorObserver = 0;

      }
    }
  }

}

- (BOOL)_wantsHorizontalLayout
{
  void *v2;
  BOOL v3;

  if (self->_sceneType != 7)
    return 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView window](self->_accessoryStackView, "window"));
  v3 = objc_msgSend(v2, "_car_hybridInstrumentClusterAlignment") == 0;

  return v3;
}

- (BOOL)_shouldShowHeadingIndicator
{
  _BOOL4 v3;

  if (-[CarAccessoriesOverlay headingIndicatorIgnoresUserSettings](self, "headingIndicatorIgnoresUserSettings")
    || (v3 = -[CarAccessoriesOverlay userPermitsHeadingIndicator](self, "userPermitsHeadingIndicator")))
  {
    LOBYTE(v3) = -[CarAccessoriesOverlay showHeadingIndicator](self, "showHeadingIndicator");
  }
  return v3;
}

- (void)setShowSpeedSign:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 showSpeedSign;
  int v11;
  CarAccessoriesOverlay *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  _BOOL4 v18;

  if (self->_showSpeedSign != a3)
  {
    v3 = a3;
    v5 = sub_100A9B584();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarAccessoriesOverlay host](self, "host"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "overlayContentView"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sceneIdentifierForLogging"));
      showSpeedSign = self->_showSpeedSign;
      v11 = 134349826;
      v12 = self;
      v13 = 2112;
      v14 = v9;
      v15 = 1024;
      v16 = showSpeedSign;
      v17 = 1024;
      v18 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] [%@] Updating showSpeedSign %d -> %d", (uint8_t *)&v11, 0x22u);

    }
    self->_showSpeedSign = v3;
  }
}

- (BOOL)_shouldShowSpeedSign
{
  _BOOL4 v3;

  if (-[CarAccessoriesOverlay speedSignIgnoresUserSettings](self, "speedSignIgnoresUserSettings")
    || (v3 = -[CarAccessoriesOverlay userPermitsSpeedSign](self, "userPermitsSpeedSign")))
  {
    LOBYTE(v3) = -[CarAccessoriesOverlay showSpeedSign](self, "showSpeedSign");
  }
  return v3;
}

- (void)reloadAnimated:(BOOL)a3
{
  unsigned int v4;
  CarHeadingIndicatorView *headingIndicator;
  CarHeadingIndicatorView *v6;
  CarHeadingIndicatorView *v7;
  void *v8;
  CarHeadingIndicatorView *v9;
  void *v10;
  NSObject *v11;
  NSObject *headingIndicatorObserver;
  id v13;
  void *v14;
  void *v15;
  char *v16;
  void *v17;
  NSObject *v18;
  unsigned int v19;
  id v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  char *v25;
  CarSpeedSignView *speedSignView;
  CarSpeedSignView *v27;
  CarSpeedSignView *v28;
  void *v29;
  CarSpeedSignView *v30;
  void *v31;
  NSObject *v32;
  NSObject *speedSignObserver;
  void *v34;
  void *v35;
  char *v36;
  __CFString *v37;
  __CFString *v38;
  __CFString *v39;
  __CFString *v40;
  void *v41;
  NSObject *v42;
  unsigned int v43;
  UIStackView **p_accessoryStackView;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  _BOOL4 v51;
  void *v52;
  void *v53;
  _BOOL4 v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  double v66;
  void *v67;
  void *v68;
  void *v69;
  unsigned int v70;
  id v71;
  NSObject *v72;
  void *v73;
  void *v74;
  char *v75;
  NSObject *v76;
  NSObject *v77;
  void *v78;
  __CFString *v79;
  id v80;
  id v81;
  NSObject *v82;
  _BOOL4 v83;
  void *v84;
  void *v85;
  char *v86;
  id v87;
  void *v88;
  void *v89;
  __CFString *v90;
  void *v91;
  void *v92;
  char *v93;
  id v94;
  NSObject *v95;
  id v96;
  NSObject *v97;
  void *v98;
  __CFString *v99;
  NSObject *v100;
  NSObject *v101;
  void *v102;
  __CFString *v103;
  id v104;
  NSObject *v105;
  id v106;
  NSObject *v107;
  void *v108;
  void *v109;
  os_log_t log;
  _QWORD v111[5];
  id v112;
  _QWORD v113[5];
  id v114;
  _QWORD v115[2];
  _BYTE location[12];
  __int16 v117;
  const char *v118;
  __int16 v119;
  _BYTE v120[18];

  if (self->_accessoryStackView)
  {
    log = (os_log_t)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 2));
    v4 = -[CarAccessoriesOverlay _shouldShowHeadingIndicator](self, "_shouldShowHeadingIndicator");
    headingIndicator = self->_headingIndicator;
    if (v4)
    {
      if (!headingIndicator)
      {
        v6 = -[CarHeadingIndicatorView initWithCarSceneType:]([CarHeadingIndicatorView alloc], "initWithCarSceneType:", self->_sceneType);
        v7 = self->_headingIndicator;
        self->_headingIndicator = v6;

        -[CarHeadingIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->_headingIndicator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        headingIndicator = self->_headingIndicator;
      }
      -[CarHeadingIndicatorView setActive:](headingIndicator, "setActive:", 1);
      if (!self->_headingIndicatorObserver)
      {
        objc_initWeak((id *)location, self);
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        v9 = self->_headingIndicator;
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
        v113[0] = _NSConcreteStackBlock;
        v113[1] = 3221225472;
        v113[2] = sub_100A9CF10;
        v113[3] = &unk_1011BA648;
        objc_copyWeak(&v114, (id *)location);
        v113[4] = self;
        v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "addObserverForName:object:queue:usingBlock:", CFSTR("CarHeadingIndicatorViewDidChangeVisibility"), v9, v10, v113));
        headingIndicatorObserver = self->_headingIndicatorObserver;
        self->_headingIndicatorObserver = v11;

        objc_destroyWeak(&v114);
        objc_destroyWeak((id *)location);
      }
      if (!-[CarHeadingIndicatorView contentsHidden](self->_headingIndicator, "contentsHidden"))
        -[NSObject addObject:](log, "addObject:", self->_headingIndicator);
    }
    else if (headingIndicator)
    {
      -[CarHeadingIndicatorView setActive:](headingIndicator, "setActive:", 0);
      if (self->_headingIndicatorObserver)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        objc_msgSend(v17, "removeObserver:", self->_headingIndicatorObserver);

        v18 = self->_headingIndicatorObserver;
        self->_headingIndicatorObserver = 0;

      }
    }
    v19 = -[CarAccessoriesOverlay _shouldShowSpeedSign](self, "_shouldShowSpeedSign");
    v20 = sub_100A9B584();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
    if (v19)
    {
      if (v22)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarAccessoriesOverlay host](self, "host"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "overlayContentView"));
        v25 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "sceneIdentifierForLogging"));
        *(_DWORD *)location = 134349314;
        *(_QWORD *)&location[4] = self;
        v117 = 2112;
        v118 = v25;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "[%{public}p] [%@] Eligible to show speed sign", location, 0x16u);

      }
      speedSignView = self->_speedSignView;
      if (!speedSignView)
      {
        v27 = -[CarSpeedSignView initWithCarSceneType:]([CarSpeedSignView alloc], "initWithCarSceneType:", self->_sceneType);
        v28 = self->_speedSignView;
        self->_speedSignView = v27;

        -[CarSpeedSignView setTranslatesAutoresizingMaskIntoConstraints:](self->_speedSignView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[CarSpeedSignView setDimmed:animated:](self->_speedSignView, "setDimmed:animated:", -[MapsLightLevelController shouldUseNightMode](self->_lightLevelController, "shouldUseNightMode"), 0);
        speedSignView = self->_speedSignView;
      }
      -[CarSpeedSignView setActive:](speedSignView, "setActive:", 1);
      if (!self->_speedSignObserver)
      {
        objc_initWeak((id *)location, self);
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        v30 = self->_speedSignView;
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
        v111[0] = _NSConcreteStackBlock;
        v111[1] = 3221225472;
        v111[2] = sub_100A9D078;
        v111[3] = &unk_1011BA648;
        objc_copyWeak(&v112, (id *)location);
        v111[4] = self;
        v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "addObserverForName:object:queue:usingBlock:", CFSTR("CarSpeedSignViewDidChangeVisibility"), v30, v31, v111));
        speedSignObserver = self->_speedSignObserver;
        self->_speedSignObserver = v32;

        objc_destroyWeak(&v112);
        objc_destroyWeak((id *)location);
      }
      if (!-[CarSpeedSignView contentsHidden](self->_speedSignView, "contentsHidden"))
        -[NSObject addObject:](log, "addObject:", self->_speedSignView);
    }
    else
    {
      if (v22)
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[CarAccessoriesOverlay host](self, "host"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "overlayContentView"));
        v36 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "sceneIdentifierForLogging"));
        if (-[CarAccessoriesOverlay userPermitsSpeedSign](self, "userPermitsSpeedSign"))
          v37 = CFSTR("YES");
        else
          v37 = CFSTR("NO");
        v38 = v37;
        if (-[CarAccessoriesOverlay showSpeedSign](self, "showSpeedSign"))
          v39 = CFSTR("YES");
        else
          v39 = CFSTR("NO");
        *(_DWORD *)location = 134349826;
        *(_QWORD *)&location[4] = self;
        v117 = 2112;
        v118 = v36;
        v119 = 2112;
        *(_QWORD *)v120 = v37;
        *(_WORD *)&v120[8] = 2112;
        *(_QWORD *)&v120[10] = v39;
        v40 = v39;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "[%{public}p] [%@] Not eligible to show speed sign; userPermitsSpeedSign:(%@), showSpeedSign:(%@)",
          location,
          0x2Au);

      }
      -[CarSpeedSignView setActive:](self->_speedSignView, "setActive:", 0);
      if (self->_speedSignObserver)
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        objc_msgSend(v41, "removeObserver:", self->_speedSignObserver);

        v42 = self->_speedSignObserver;
        self->_speedSignObserver = 0;

      }
    }
    v43 = -[CarAccessoriesOverlay _wantsHorizontalLayout](self, "_wantsHorizontalLayout");
    p_accessoryStackView = &self->_accessoryStackView;
    if (v43)
      v45 = 1;
    else
      v45 = 4;
    if (v43)
      v46 = 3;
    else
      v46 = 2;
    -[UIStackView setAxis:](self->_accessoryStackView, "setAxis:", v43 ^ 1);
    -[UIStackView setAlignment:](*p_accessoryStackView, "setAlignment:", v45);
    -[UIStackView setDistribution:](*p_accessoryStackView, "setDistribution:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
    v48 = objc_msgSend(v47, "rightHandDrive");

    if (-[UIStackView axis](*p_accessoryStackView, "axis"))
    {
      -[NSLayoutConstraint setActive:](self->_leadingConstraint, "setActive:", 0);
      -[NSLayoutConstraint setActive:](self->_trailingConstraint, "setActive:", 1);
    }
    else if (-[NSObject count](log, "count") == (id)1)
    {
      if (-[NSObject containsObject:](log, "containsObject:", self->_speedSignView))
      {
        -[NSLayoutConstraint setActive:](self->_leadingConstraint, "setActive:", v48);
        -[NSLayoutConstraint setActive:](self->_trailingConstraint, "setActive:", v48 ^ 1);
      }
      else if (-[NSObject containsObject:](log, "containsObject:", self->_headingIndicator))
      {
        -[NSLayoutConstraint setActive:](self->_leadingConstraint, "setActive:", v48 ^ 1);
        -[NSLayoutConstraint setActive:](self->_trailingConstraint, "setActive:", v48);
      }
      else
      {
        v94 = sub_1004318FC();
        v95 = objc_claimAutoreleasedReturnValue(v94);
        if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)location = 136315650;
          *(_QWORD *)&location[4] = "-[CarAccessoriesOverlay reloadAnimated:]";
          v117 = 2080;
          v118 = "CarAccessoriesOverlay.m";
          v119 = 1024;
          *(_DWORD *)v120 = 264;
          _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", location, 0x1Cu);
        }

        if (sub_100A70734())
        {
          v96 = sub_1004318FC();
          v97 = objc_claimAutoreleasedReturnValue(v96);
          if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
          {
            v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
            *(_DWORD *)location = 138412290;
            *(_QWORD *)&location[4] = v98;
            _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_ERROR, "%@", location, 0xCu);

          }
        }
      }
    }
    else
    {
      -[NSLayoutConstraint setActive:](self->_leadingConstraint, "setActive:", 1);
      -[NSLayoutConstraint setActive:](self->_trailingConstraint, "setActive:", 1);
    }
    if (!-[CarAccessoriesOverlay ignoresCollisionConstraints](self, "ignoresCollisionConstraints"))
    {
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView window](self->_accessoryStackView, "window"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "screen"));
      v51 = v50 == 0;

      if (v51)
      {
        v104 = sub_1004318FC();
        v105 = objc_claimAutoreleasedReturnValue(v104);
        if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)location = 136315906;
          *(_QWORD *)&location[4] = "-[CarAccessoriesOverlay reloadAnimated:]";
          v117 = 2080;
          v118 = "CarAccessoriesOverlay.m";
          v119 = 1024;
          *(_DWORD *)v120 = 276;
          *(_WORD *)&v120[4] = 2080;
          *(_QWORD *)&v120[6] = "_accessoryStackView.window.screen != nil";
          _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", location, 0x26u);
        }

        if (sub_100A70734())
        {
          v106 = sub_1004318FC();
          v107 = objc_claimAutoreleasedReturnValue(v106);
          if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
          {
            v108 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
            *(_DWORD *)location = 138412290;
            *(_QWORD *)&location[4] = v108;
            _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_ERROR, "%@", location, 0xCu);

          }
        }
      }
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView window](self->_accessoryStackView, "window"));
      if (objc_msgSend(v52, "_car_isHybridInstrumentCluster"))
      {
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView window](self->_accessoryStackView, "window"));
        v54 = objc_msgSend(v53, "_car_hybridInstrumentClusterAlignment") == (id)2;

      }
      else
      {
        v54 = 0;
      }

      v55 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
      if (objc_msgSend(v55, "rightHandDrive") | v54)
        v56 = 2;
      else
        v56 = 8;

      v57 = (void *)objc_claimAutoreleasedReturnValue(-[CarAccessoriesOverlay host](self, "host"));
      v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "collisionGuideForEdge:", v56));

      v58 = (void *)objc_claimAutoreleasedReturnValue(-[CarAccessoriesOverlay host](self, "host"));
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "collisionGuideForEdge:", 1));

      v60 = (void *)objc_claimAutoreleasedReturnValue(-[CarAccessoriesOverlay host](self, "host"));
      v61 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](self->_accessoryStackView, "bottomAnchor"));
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "topAnchor"));
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintLessThanOrEqualToAnchor:", v62));
      v115[0] = v63;
      v64 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView _maps_leftRHDAnchor](self->_accessoryStackView, "_maps_leftRHDAnchor"));
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "_maps_rightRHDAnchor"));
      LODWORD(v66) = 1148846080;
      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "_maps_constraintWithRHDAnchor:relation:constant:priority:", v65, 1, 0.0, v66));
      v115[1] = v67;
      v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v115, 2));
      objc_msgSend(v60, "setCollisionConstraints:forOverlay:", v68, self);

    }
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_accessoryStackView, "arrangedSubviews"));
    v70 = objc_msgSend(v69, "isEqualToArray:", log);

    if (v70)
    {
      v71 = sub_100A9B584();
      v72 = objc_claimAutoreleasedReturnValue(v71);
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
      {
        v73 = (void *)objc_claimAutoreleasedReturnValue(-[CarAccessoriesOverlay host](self, "host"));
        v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "overlayContentView"));
        v75 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "sceneIdentifierForLogging"));
        v76 = log;
        v77 = v76;
        if (v76)
        {
          if (-[NSObject count](v76, "count"))
          {
            v78 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject componentsJoinedByString:](v77, "componentsJoinedByString:", CFSTR(", ")));
            v79 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> [%@]"), v77, v78));

          }
          else
          {
            v79 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v77));
          }
        }
        else
        {
          v79 = CFSTR("<nil>");
        }

        *(_DWORD *)location = 134349570;
        *(_QWORD *)&location[4] = self;
        v117 = 2112;
        v118 = v75;
        v119 = 2112;
        *(_QWORD *)v120 = v79;
        _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEBUG, "[%{public}p] [%@] Will not reload accessories, nothing has changed: %@", location, 0x20u);

      }
    }
    else
    {
      v80 = -[NSObject count](log, "count");
      v81 = sub_100A9B584();
      v82 = objc_claimAutoreleasedReturnValue(v81);
      v83 = os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG);
      if (v80)
      {
        if (v83)
        {
          v84 = (void *)objc_claimAutoreleasedReturnValue(-[CarAccessoriesOverlay host](self, "host"));
          v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "overlayContentView"));
          v86 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "sceneIdentifierForLogging"));
          v87 = (id)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_accessoryStackView, "arrangedSubviews"));
          v88 = v87;
          if (v87)
          {
            if (objc_msgSend(v87, "count"))
            {
              v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "componentsJoinedByString:", CFSTR(", ")));
              v90 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> [%@]"), v88, v89));

            }
            else
            {
              v90 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v88));
            }
          }
          else
          {
            v90 = CFSTR("<nil>");
          }

          v99 = v90;
          v100 = log;
          v101 = v100;
          if (v100)
          {
            if (-[NSObject count](v100, "count"))
            {
              v102 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject componentsJoinedByString:](v101, "componentsJoinedByString:", CFSTR(", ")));
              v103 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> [%@]"), v101, v102));

            }
            else
            {
              v103 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v101));
            }
          }
          else
          {
            v103 = CFSTR("<nil>");
          }

          *(_DWORD *)location = 134349826;
          *(_QWORD *)&location[4] = self;
          v117 = 2112;
          v118 = v86;
          v119 = 2112;
          *(_QWORD *)v120 = v99;
          *(_WORD *)&v120[8] = 2112;
          *(_QWORD *)&v120[10] = v103;
          _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEBUG, "[%{public}p] [%@] Will update accessories (%@ => %@)", location, 0x2Au);

        }
        -[UIStackView _maps_setArrangedSubviews:](self->_accessoryStackView, "_maps_setArrangedSubviews:", log);
        v72 = objc_claimAutoreleasedReturnValue(-[CarAccessoriesOverlay host](self, "host"));
        -[NSObject setCollisionConstraintsEnabled:forOverlay:](v72, "setCollisionConstraintsEnabled:forOverlay:", -[CarAccessoriesOverlay isHidden](self, "isHidden") ^ 1, self);
      }
      else
      {
        if (v83)
        {
          v91 = (void *)objc_claimAutoreleasedReturnValue(-[CarAccessoriesOverlay host](self, "host"));
          v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "overlayContentView"));
          v93 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "sceneIdentifierForLogging"));
          *(_DWORD *)location = 134349314;
          *(_QWORD *)&location[4] = self;
          v117 = 2112;
          v118 = v93;
          _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEBUG, "[%{public}p] [%@] Will remove all accessories", location, 0x16u);

        }
        -[UIStackView _maps_setArrangedSubviews:](self->_accessoryStackView, "_maps_setArrangedSubviews:", 0);
        v72 = objc_claimAutoreleasedReturnValue(-[CarAccessoriesOverlay host](self, "host"));
        -[NSObject setCollisionConstraintsEnabled:forOverlay:](v72, "setCollisionConstraintsEnabled:forOverlay:", 0, self);
      }
    }

  }
  else
  {
    v13 = sub_100A9B584();
    log = (os_log_t)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarAccessoriesOverlay host](self, "host"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "overlayContentView"));
      v16 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sceneIdentifierForLogging"));
      *(_DWORD *)location = 134349314;
      *(_QWORD *)&location[4] = self;
      v117 = 2112;
      v118 = v16;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "[%{public}p] [%@] Will not reload accessories, overlay not active", location, 0x16u);

    }
  }

}

- (BOOL)isHidden
{
  double v2;

  -[UIStackView alpha](self->_accessoryStackView, "alpha");
  return v2 == 0.0;
}

- (void)setHidden:(BOOL)a3
{
  -[CarAccessoriesOverlay setHidden:animated:](self, "setHidden:animated:", a3, 0);
}

- (void)setHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  CarAccessoriesOverlay *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  CarAccessoriesOverlay *v14;
  int v15;
  double v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  id v23;
  void *v24;
  void *v25;
  __CFString *v26;
  double v27;
  unsigned int v28;
  void *v29;
  const __CFString *v30;
  _QWORD v31[5];
  float v32;
  BOOL v33;
  uint8_t buf[4];
  CarAccessoriesOverlay *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  const __CFString *v39;
  __int16 v40;
  __CFString *v41;

  if (!self->_accessoryStackView)
    return;
  v4 = a3;
  if (!a4)
    goto LABEL_12;
  if (UIAccessibilityIsReduceMotionEnabled())
  {
    v6 = sub_100A9B584();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
LABEL_11:

LABEL_12:
      v15 = 0;
      goto LABEL_14;
    }
    v8 = self;
    v9 = (objc_class *)objc_opt_class(v8);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarAccessoriesOverlay performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (CarAccessoriesOverlay *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_10;
      }

    }
    v14 = (CarAccessoriesOverlay *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_10:

    *(_DWORD *)buf = 138543362;
    v35 = v14;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] Reduce motion enabled, running accessory view update without animation", buf, 0xCu);

    goto LABEL_11;
  }
  v15 = 1;
LABEL_14:
  -[UIStackView alpha](self->_accessoryStackView, "alpha");
  if (v16 != (double)!v4)
  {
    v17 = sub_100A9B584();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarAccessoriesOverlay host](self, "host"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "overlayContentView"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "sceneIdentifierForLogging"));
      v22 = CFSTR("show");
      if (v4)
        v22 = CFSTR("hide");
      v30 = v22;
      v23 = (id)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_accessoryStackView, "arrangedSubviews"));
      v24 = v23;
      if (v23)
      {
        if (objc_msgSend(v23, "count"))
        {
          v29 = v19;
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "componentsJoinedByString:", CFSTR(", ")));
          v26 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> [%@]"), v24, v25));

          v19 = v29;
        }
        else
        {
          v26 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v24));
        }
      }
      else
      {
        v26 = CFSTR("<nil>");
      }

      *(_DWORD *)buf = 134349826;
      v35 = self;
      v36 = 2112;
      v37 = v21;
      v38 = 2112;
      v39 = v30;
      v40 = 2112;
      v41 = v26;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "[%{public}p] [%@] Will %@ accessory view using alpha (accessories:%@)", buf, 0x2Au);

    }
    v27 = 0.0;
    if (v15)
    {
      v28 = +[UIView _maps_shouldAdoptImplicitAnimationParameters](UIView, "_maps_shouldAdoptImplicitAnimationParameters", 0.0);
      v27 = 0.1;
      if (v28)
        v27 = 0.0;
    }
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100A9D5A4;
    v31[3] = &unk_1011E1480;
    v31[4] = self;
    v32 = (float)!v4;
    v33 = v4;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v31, 0, v27, 0.0);
  }
}

- (void)lightLevelController:(id)a3 didUpdateLightLevel:(int64_t)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  int v13;
  CarAccessoriesOverlay *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  __CFString *v18;

  v5 = objc_msgSend(a3, "shouldUseNightMode");
  -[CarSpeedSignView setDimmed:animated:](self->_speedSignView, "setDimmed:animated:", v5, 1);
  v6 = sub_100A9B584();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarAccessoriesOverlay host](self, "host"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "overlayContentView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sceneIdentifierForLogging"));
    v11 = CFSTR("NO");
    if ((_DWORD)v5)
      v11 = CFSTR("YES");
    v12 = v11;
    v13 = 134349570;
    v14 = self;
    v15 = 2112;
    v16 = v10;
    v17 = 2112;
    v18 = v12;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[%{public}p] [%@] carAccessories lightLevelController:didUpdateLightLevel shuldUseNightMode: %@", (uint8_t *)&v13, 0x20u);

  }
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  int BOOL;
  int v5;

  BOOL = GEOConfigGetBOOL(MapsConfig_NavigationShowHeading, off_1014B2FD8);
  v5 = GEOConfigGetBOOL(MapsConfig_NavigationShowSpeedLimit, off_1014B2FE8);
  if (self->_userPermitsHeadingIndicator != BOOL)
  {
    self->_userPermitsHeadingIndicator = BOOL;
    if (self->_userPermitsSpeedSign == v5)
    {
      if (self->_headingIndicatorIgnoresUserSettings)
        return;
      goto LABEL_6;
    }
LABEL_7:
    self->_userPermitsSpeedSign = v5;
    if (self->_speedSignIgnoresUserSettings)
      return;
LABEL_6:
    -[CarAccessoriesOverlay reloadAnimated:](self, "reloadAnimated:", 1);
    return;
  }
  if (self->_userPermitsSpeedSign != v5)
    goto LABEL_7;
}

- (ChromeOverlayHosting)host
{
  return (ChromeOverlayHosting *)objc_loadWeakRetained((id *)&self->_host);
}

- (BOOL)showHeadingIndicator
{
  return self->_showHeadingIndicator;
}

- (void)setShowHeadingIndicator:(BOOL)a3
{
  self->_showHeadingIndicator = a3;
}

- (BOOL)showSpeedSign
{
  return self->_showSpeedSign;
}

- (BOOL)headingIndicatorIgnoresUserSettings
{
  return self->_headingIndicatorIgnoresUserSettings;
}

- (void)setHeadingIndicatorIgnoresUserSettings:(BOOL)a3
{
  self->_headingIndicatorIgnoresUserSettings = a3;
}

- (BOOL)speedSignIgnoresUserSettings
{
  return self->_speedSignIgnoresUserSettings;
}

- (void)setSpeedSignIgnoresUserSettings:(BOOL)a3
{
  self->_speedSignIgnoresUserSettings = a3;
}

- (BOOL)ignoresCollisionConstraints
{
  return self->_ignoresCollisionConstraints;
}

- (void)setIgnoresCollisionConstraints:(BOOL)a3
{
  self->_ignoresCollisionConstraints = a3;
}

- (BOOL)userPermitsHeadingIndicator
{
  return self->_userPermitsHeadingIndicator;
}

- (void)setUserPermitsHeadingIndicator:(BOOL)a3
{
  self->_userPermitsHeadingIndicator = a3;
}

- (BOOL)userPermitsSpeedSign
{
  return self->_userPermitsSpeedSign;
}

- (void)setUserPermitsSpeedSign:(BOOL)a3
{
  self->_userPermitsSpeedSign = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_host);
  objc_storeStrong((id *)&self->_trailingConstraint, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
  objc_storeStrong((id *)&self->_speedSignObserver, 0);
  objc_storeStrong((id *)&self->_speedSignView, 0);
  objc_storeStrong((id *)&self->_headingIndicatorObserver, 0);
  objc_storeStrong((id *)&self->_headingIndicator, 0);
  objc_storeStrong((id *)&self->_accessoryStackView, 0);
  objc_storeStrong((id *)&self->_lightLevelController, 0);
}

@end
