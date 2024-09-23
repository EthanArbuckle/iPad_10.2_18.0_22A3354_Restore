@implementation PedestrianARViewController

- (PedestrianARViewController)initWithRoute:(id)a3 platformController:(id)a4 guidanceObserver:(id)a5 navigationService:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PedestrianARViewController *v14;
  os_activity_t v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id WeakRetained;
  void *v24;
  uint64_t v25;
  void *v26;
  NavigationSession *v27;
  NavigationSession *navigationSession;
  UINotificationFeedbackGenerator *v29;
  UINotificationFeedbackGenerator *notificationGenerator;
  id v32;
  NSObject *v33;
  id v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  id v38;
  NSObject *v39;
  id v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  id v44;
  NSObject *v45;
  id v46;
  NSObject *v47;
  uint64_t v48;
  void *v49;
  id v50;
  NSObject *v51;
  id v52;
  NSObject *v53;
  uint64_t v54;
  void *v55;
  id v56;
  NSObject *v57;
  id v58;
  NSObject *v59;
  char *v60;
  os_activity_scope_state_s v61;
  objc_super v62;
  uint8_t buf[4];
  const char *v64;
  __int16 v65;
  const char *v66;
  __int16 v67;
  int v68;
  __int16 v69;
  const char *v70;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v10)
  {
    v32 = sub_1004318FC();
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v64 = "-[PedestrianARViewController initWithRoute:platformController:guidanceObserver:navigationService:]";
      v65 = 2080;
      v66 = "PedestrianARViewController.m";
      v67 = 1024;
      v68 = 145;
      v69 = 2080;
      v70 = "route != nil";
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v34 = sub_1004318FC();
      v35 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v36 = objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v64 = (const char *)v36;
        v37 = (void *)v36;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (!v11)
  {
    v38 = sub_1004318FC();
    v39 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v64 = "-[PedestrianARViewController initWithRoute:platformController:guidanceObserver:navigationService:]";
      v65 = 2080;
      v66 = "PedestrianARViewController.m";
      v67 = 1024;
      v68 = 146;
      v69 = 2080;
      v70 = "platformController != nil";
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v40 = sub_1004318FC();
      v41 = objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        v42 = objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v64 = (const char *)v42;
        v43 = (void *)v42;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (!v12)
  {
    v44 = sub_1004318FC();
    v45 = objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v64 = "-[PedestrianARViewController initWithRoute:platformController:guidanceObserver:navigationService:]";
      v65 = 2080;
      v66 = "PedestrianARViewController.m";
      v67 = 1024;
      v68 = 147;
      v69 = 2080;
      v70 = "guidanceObserver != nil";
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v46 = sub_1004318FC();
      v47 = objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        v48 = objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v64 = (const char *)v48;
        v49 = (void *)v48;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (!v13)
  {
    v50 = sub_1004318FC();
    v51 = objc_claimAutoreleasedReturnValue(v50);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v64 = "-[PedestrianARViewController initWithRoute:platformController:guidanceObserver:navigationService:]";
      v65 = 2080;
      v66 = "PedestrianARViewController.m";
      v67 = 1024;
      v68 = 148;
      v69 = 2080;
      v70 = "navigationService != nil";
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v52 = sub_1004318FC();
      v53 = objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        v54 = objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v64 = (const char *)v54;
        v55 = (void *)v54;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v62.receiver = self;
  v62.super_class = (Class)PedestrianARViewController;
  v14 = -[ContainerViewController initWithNibName:bundle:](&v62, "initWithNibName:bundle:", 0, 0);
  if (v14)
  {
    v15 = _os_activity_create((void *)&_mh_execute_header, "Pedestrian AR Session", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DETACHED);
    -[PedestrianARViewController setActivity:](v14, "setActivity:", v15);

    v16 = objc_claimAutoreleasedReturnValue(-[PedestrianARViewController activity](v14, "activity", 0, 0));
    os_activity_scope_enter(v16, &v61);

    v17 = sub_1008A35A4();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v64 = (const char *)v14;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v19, "postNotificationName:object:", CFSTR("PedestrianARViewControllerDidAppearNotification"), v14);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v20, "addObserver:selector:name:object:", v14, "applicationDidEnterBackgroundNotification:", UIApplicationDidEnterBackgroundNotification, 0);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v21, "addObserver:selector:name:object:", v14, "vlfSessionDidGetFirstFrameNotification:", CFSTR("VLFSessionDidGetFirstFrameNotification"), 0);

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v22, "addObserver:forKeyPath:options:context:", v14, CFSTR("PedestrianARAutoFocusDistanceKey"), 0, 0);

    objc_storeWeak((id *)&v14->_platformController, v11);
    objc_storeStrong((id *)&v14->_guidanceObserver, a5);
    objc_storeStrong((id *)&v14->_navigationService, a6);
    WeakRetained = objc_loadWeakRetained((id *)&v14->_platformController);
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "currentSession"));

    v25 = objc_opt_class(NavigationSession);
    if ((objc_opt_isKindOfClass(v24, v25) & 1) != 0)
      v26 = v24;
    else
      v26 = 0;
    v27 = v26;

    navigationSession = v14->_navigationSession;
    v14->_navigationSession = v27;

    if (!v14->_navigationSession)
    {
      v56 = sub_1004318FC();
      v57 = objc_claimAutoreleasedReturnValue(v56);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v64 = "-[PedestrianARViewController initWithRoute:platformController:guidanceObserver:navigationService:]";
        v65 = 2080;
        v66 = "PedestrianARViewController.m";
        v67 = 1024;
        v68 = 169;
        v69 = 2080;
        v70 = "_navigationSession != nil";
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
      }

      if (sub_100A70734())
      {
        v58 = sub_1004318FC();
        v59 = objc_claimAutoreleasedReturnValue(v58);
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
          v60 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v64 = v60;
          _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
    v14->_entryPoint = (id)-[NavigationSession guidanceType](v14->_navigationSession, "guidanceType") != (id)2;
    -[NavigationSession addObserver:](v14->_navigationSession, "addObserver:", v14);
    v29 = (UINotificationFeedbackGenerator *)objc_alloc_init((Class)UINotificationFeedbackGenerator);
    notificationGenerator = v14->_notificationGenerator;
    v14->_notificationGenerator = v29;

    -[PedestrianARViewController setRoute:](v14, "setRoute:", v10);
    -[PedestrianARViewController createViews](v14, "createViews");
    -[PedestrianARViewController start](v14, "start");
    os_activity_scope_leave(&v61);
  }

  return v14;
}

- (void)dealloc
{
  NSObject *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  PedestrianARViewController *v14;

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[PedestrianARViewController activity](self, "activity"));
  os_activity_scope_enter(v3, &state);

  v4 = sub_1008A35A4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v14 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Deallocing", buf, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController session](self, "session"));
  objc_msgSend(v6, "_removeObserver:", self);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MapsARSessionManager sharedManager](MapsARSessionManager, "sharedManager"));
  objc_msgSend(v7, "resignSessionWithOwner:", self);

  -[NavigationSession removeObserver:](self->_navigationSession, "removeObserver:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController safetyView](self, "safetyView"));
  objc_msgSend(v8, "didEndARSession");

  -[PedestrianARViewController enableIdleTimer](self, "enableIdleTimer");
  if (!self->_sentDisappearNotification)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "postNotificationName:object:", CFSTR("PedestrianARViewControllerDidDisappearNotification"), self);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v10, "removeObserver:forKeyPath:", self, CFSTR("PedestrianARAutoFocusDistanceKey"));

  os_activity_scope_leave(&state);
  v11.receiver = self;
  v11.super_class = (Class)PedestrianARViewController;
  -[PedestrianARViewController dealloc](&v11, "dealloc");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  PedestrianARRenderingView *renderingView;
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
  PedestrianARGradientOverlay *gradientOverlay;
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
  PedestrianARInstructionContainerView *instructionContainerView;
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
  PedestrianARArrowGuidanceView *arrowGuidanceView;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSLayoutConstraint *v45;
  NSLayoutConstraint *arrowGuidanceViewLeadingConstraint;
  void *v47;
  void *v48;
  void *v49;
  NSLayoutConstraint *v50;
  NSLayoutConstraint *arrowGuidanceViewTrailingConstraint;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSLayoutConstraint *v56;
  NSLayoutConstraint *arrowGuidanceViewLeadingSafeAreaConstraint;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  NSLayoutConstraint *v62;
  NSLayoutConstraint *arrowGuidanceViewTrailingSafeAreaConstraint;
  NSLayoutConstraint *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  MUBlurView *closeButton;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  NSLayoutConstraint *v79;
  NSLayoutConstraint *closeButtonTopConstraint;
  void *v81;
  void *v82;
  void *v83;
  NSLayoutConstraint *v84;
  NSLayoutConstraint *closeButtonTrailingConstraint;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  NSLayoutConstraint *v90;
  NSLayoutConstraint *closeButtonSafeAreaTrailingConstraint;
  NSLayoutConstraint *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  UIButton *ttrButton;
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
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  objc_super v161;
  _QWORD v162[4];
  _QWORD v163[4];
  _QWORD v164[4];
  _QWORD v165[4];
  _QWORD v166[4];
  _QWORD v167[4];
  _QWORD v168[4];

  v161.receiver = self;
  v161.super_class = (Class)PedestrianARViewController;
  -[ContainerViewController viewDidLoad](&v161, "viewDidLoad");
  -[PedestrianARViewController setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", 2);
  v160 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController view](self, "view"));
  renderingView = self->_renderingView;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController containerView](self, "containerView"));
  objc_msgSend(v3, "insertSubview:belowSubview:", renderingView, v5);

  v149 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARRenderingView leadingAnchor](self->_renderingView, "leadingAnchor"));
  v154 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController view](self, "view"));
  v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v154, "leadingAnchor"));
  v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "constraintEqualToAnchor:", v144));
  v168[0] = v139;
  v129 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARRenderingView trailingAnchor](self->_renderingView, "trailingAnchor"));
  v134 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController view](self, "view"));
  v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "trailingAnchor"));
  v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "constraintEqualToAnchor:", v124));
  v168[1] = v120;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARRenderingView topAnchor](self->_renderingView, "topAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v8));
  v168[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARRenderingView bottomAnchor](self->_renderingView, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController view](self, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v12));
  v168[3] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v168, 4));
  objc_msgSend(v160, "addObjectsFromArray:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController view](self, "view"));
  gradientOverlay = self->_gradientOverlay;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController containerView](self, "containerView"));
  objc_msgSend(v15, "insertSubview:belowSubview:", gradientOverlay, v17);

  v150 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARGradientOverlay leadingAnchor](self->_gradientOverlay, "leadingAnchor"));
  v155 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController view](self, "view"));
  v145 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v155, "leadingAnchor"));
  v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "constraintEqualToAnchor:", v145));
  v167[0] = v140;
  v130 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARGradientOverlay trailingAnchor](self->_gradientOverlay, "trailingAnchor"));
  v135 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController view](self, "view"));
  v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "trailingAnchor"));
  v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "constraintEqualToAnchor:", v125));
  v167[1] = v121;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARGradientOverlay topAnchor](self->_gradientOverlay, "topAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController view](self, "view"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "topAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v20));
  v167[2] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARGradientOverlay bottomAnchor](self->_gradientOverlay, "bottomAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController view](self, "view"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bottomAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v24));
  v167[3] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v167, 4));
  objc_msgSend(v160, "addObjectsFromArray:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController view](self, "view"));
  instructionContainerView = self->_instructionContainerView;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController containerView](self, "containerView"));
  objc_msgSend(v27, "insertSubview:belowSubview:", instructionContainerView, v29);

  v151 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView leadingAnchor](self->_instructionContainerView, "leadingAnchor"));
  v156 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController view](self, "view"));
  v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v156, "leadingAnchor"));
  v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "constraintEqualToAnchor:", v146));
  v166[0] = v141;
  v131 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView trailingAnchor](self->_instructionContainerView, "trailingAnchor"));
  v136 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController view](self, "view"));
  v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v136, "trailingAnchor"));
  v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "constraintEqualToAnchor:", v126));
  v166[1] = v122;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView topAnchor](self->_instructionContainerView, "topAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController view](self, "view"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "topAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v32));
  v166[2] = v33;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView bottomAnchor](self->_instructionContainerView, "bottomAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController view](self, "view"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "bottomAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v36));
  v166[3] = v37;
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v166, 4));
  objc_msgSend(v160, "addObjectsFromArray:", v38);

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController view](self, "view"));
  arrowGuidanceView = self->_arrowGuidanceView;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController containerView](self, "containerView"));
  objc_msgSend(v39, "insertSubview:belowSubview:", arrowGuidanceView, v41);

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARArrowGuidanceView leadingAnchor](self->_arrowGuidanceView, "leadingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController view](self, "view"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "leadingAnchor"));
  v45 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:constant:", v44, 16.0));
  arrowGuidanceViewLeadingConstraint = self->_arrowGuidanceViewLeadingConstraint;
  self->_arrowGuidanceViewLeadingConstraint = v45;

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARArrowGuidanceView trailingAnchor](self->_arrowGuidanceView, "trailingAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController view](self, "view"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "trailingAnchor"));
  v50 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:constant:", v49, -16.0));
  arrowGuidanceViewTrailingConstraint = self->_arrowGuidanceViewTrailingConstraint;
  self->_arrowGuidanceViewTrailingConstraint = v50;

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARArrowGuidanceView leadingAnchor](self->_arrowGuidanceView, "leadingAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController view](self, "view"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "safeAreaLayoutGuide"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "leadingAnchor"));
  v56 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v55));
  arrowGuidanceViewLeadingSafeAreaConstraint = self->_arrowGuidanceViewLeadingSafeAreaConstraint;
  self->_arrowGuidanceViewLeadingSafeAreaConstraint = v56;

  v58 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARArrowGuidanceView trailingAnchor](self->_arrowGuidanceView, "trailingAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController view](self, "view"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "safeAreaLayoutGuide"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "trailingAnchor"));
  v62 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:", v61));
  arrowGuidanceViewTrailingSafeAreaConstraint = self->_arrowGuidanceViewTrailingSafeAreaConstraint;
  self->_arrowGuidanceViewTrailingSafeAreaConstraint = v62;

  v64 = self->_arrowGuidanceViewTrailingConstraint;
  v165[0] = self->_arrowGuidanceViewLeadingConstraint;
  v165[1] = v64;
  v157 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARArrowGuidanceView heightAnchor](self->_arrowGuidanceView, "heightAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController view](self, "view"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "heightAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v157, "constraintEqualToAnchor:multiplier:", v66, 0.5));
  v165[2] = v67;
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARArrowGuidanceView topAnchor](self->_arrowGuidanceView, "topAnchor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[MUBlurView bottomAnchor](self->_closeButton, "bottomAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "constraintEqualToAnchor:", v69));
  v165[3] = v70;
  v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v165, 4));
  objc_msgSend(v160, "addObjectsFromArray:", v71);

  v72 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController view](self, "view"));
  closeButton = self->_closeButton;
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController containerView](self, "containerView"));
  objc_msgSend(v72, "insertSubview:belowSubview:", closeButton, v74);

  v75 = (void *)objc_claimAutoreleasedReturnValue(-[MUBlurView topAnchor](self->_closeButton, "topAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController view](self, "view"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "safeAreaLayoutGuide"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "topAnchor"));
  v79 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "constraintEqualToAnchor:", v78));
  closeButtonTopConstraint = self->_closeButtonTopConstraint;
  self->_closeButtonTopConstraint = v79;

  v81 = (void *)objc_claimAutoreleasedReturnValue(-[MUBlurView trailingAnchor](self->_closeButton, "trailingAnchor"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController view](self, "view"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "trailingAnchor"));
  v84 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "constraintEqualToAnchor:", v83));
  closeButtonTrailingConstraint = self->_closeButtonTrailingConstraint;
  self->_closeButtonTrailingConstraint = v84;

  v86 = (void *)objc_claimAutoreleasedReturnValue(-[MUBlurView trailingAnchor](self->_closeButton, "trailingAnchor"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController view](self, "view"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "safeAreaLayoutGuide"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "trailingAnchor"));
  v90 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "constraintEqualToAnchor:", v89));
  closeButtonSafeAreaTrailingConstraint = self->_closeButtonSafeAreaTrailingConstraint;
  self->_closeButtonSafeAreaTrailingConstraint = v90;

  v92 = self->_closeButtonTopConstraint;
  v164[0] = self->_closeButtonSafeAreaTrailingConstraint;
  v164[1] = v92;
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[MUBlurView widthAnchor](self->_closeButton, "widthAnchor"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "constraintEqualToConstant:", 42.0));
  v164[2] = v94;
  v95 = (void *)objc_claimAutoreleasedReturnValue(-[MUBlurView heightAnchor](self->_closeButton, "heightAnchor"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(-[MUBlurView widthAnchor](self->_closeButton, "widthAnchor"));
  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "constraintEqualToAnchor:", v96));
  v164[3] = v97;
  v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v164, 4));
  objc_msgSend(v160, "addObjectsFromArray:", v98);

  if (self->_ttrButton)
  {
    v99 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController view](self, "view"));
    ttrButton = self->_ttrButton;
    v101 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController containerView](self, "containerView"));
    objc_msgSend(v99, "insertSubview:belowSubview:", ttrButton, v101);

    v147 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_ttrButton, "leadingAnchor"));
    v158 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController view](self, "view"));
    v152 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v158, "safeAreaLayoutGuide"));
    v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "leadingAnchor"));
    v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "constraintEqualToAnchor:constant:", v142, 16.0));
    v163[0] = v137;
    v132 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_ttrButton, "topAnchor"));
    v127 = (void *)objc_claimAutoreleasedReturnValue(-[MUBlurView topAnchor](self->_closeButton, "topAnchor"));
    v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "constraintEqualToAnchor:", v127));
    v163[1] = v123;
    v102 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_ttrButton, "widthAnchor"));
    v103 = (void *)objc_claimAutoreleasedReturnValue(-[MUBlurView widthAnchor](self->_closeButton, "widthAnchor"));
    v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "constraintEqualToAnchor:", v103));
    v163[2] = v104;
    v105 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_ttrButton, "heightAnchor"));
    v106 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_ttrButton, "widthAnchor"));
    v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "constraintEqualToAnchor:", v106));
    v163[3] = v107;
    v108 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v163, 4));
    objc_msgSend(v160, "addObjectsFromArray:", v108);

  }
  if (self->_safetyView)
  {
    v109 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController view](self, "view"));
    objc_msgSend(v109, "insertSubview:belowSubview:", self->_safetyView, self->_closeButton);

    v153 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSafetyView leadingAnchor](self->_safetyView, "leadingAnchor"));
    v159 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController view](self, "view"));
    v148 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v159, "leadingAnchor"));
    v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v153, "constraintEqualToAnchor:", v148));
    v162[0] = v143;
    v133 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSafetyView trailingAnchor](self->_safetyView, "trailingAnchor"));
    v138 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController view](self, "view"));
    v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "trailingAnchor"));
    v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "constraintEqualToAnchor:", v128));
    v162[1] = v110;
    v111 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSafetyView topAnchor](self->_safetyView, "topAnchor"));
    v112 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController view](self, "view"));
    v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "topAnchor"));
    v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "constraintEqualToAnchor:", v113));
    v162[2] = v114;
    v115 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSafetyView bottomAnchor](self->_safetyView, "bottomAnchor"));
    v116 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController view](self, "view"));
    v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "bottomAnchor"));
    v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "constraintEqualToAnchor:", v117));
    v162[3] = v118;
    v119 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v162, 4));
    objc_msgSend(v160, "addObjectsFromArray:", v119);

  }
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v160);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  os_activity_scope_state_s state;

  v3 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[PedestrianARViewController activity](self, "activity"));
  os_activity_scope_enter(v5, &state);

  v10.receiver = self;
  v10.super_class = (Class)PedestrianARViewController;
  -[ContainerViewController viewWillAppear:](&v10, "viewWillAppear:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[PedestrianARSessionUsageTracker sharedInstance](PedestrianARSessionUsageTracker, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController route](self, "route"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uniqueRouteID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
  objc_msgSend(v6, "registerUserEnteredARForRoute:entryPoint:", v9, -[PedestrianARViewController entryPoint](self, "entryPoint"));

  os_activity_scope_leave(&state);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  id v6;
  NSObject *v7;
  objc_super v8;
  uint8_t buf[16];
  os_activity_scope_state_s state;

  v3 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[PedestrianARViewController activity](self, "activity"));
  os_activity_scope_enter(v5, &state);

  v6 = sub_10043395C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Ending pedestrian AR session", buf, 2u);
  }

  v8.receiver = self;
  v8.super_class = (Class)PedestrianARViewController;
  -[ContainerViewController viewWillDisappear:](&v8, "viewWillDisappear:", v3);
  -[PedestrianARViewController stop](self, "stop");
  os_activity_scope_leave(&state);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[4];
  id v9;
  BOOL v10;
  _QWORD v11[4];
  id v12;
  BOOL v13;
  id location;
  objc_super v15;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PedestrianARViewController;
  -[ContainerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v15, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1008A49C4;
  v11[3] = &unk_1011DA460;
  objc_copyWeak(&v12, &location);
  v13 = width > height;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1008A4A00;
  v8[3] = &unk_1011DA460;
  objc_copyWeak(&v9, &location);
  v10 = width > height;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v11, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)viewSafeAreaInsetsDidChange
{
  void *v3;
  double Width;
  void *v5;
  _BOOL8 v6;
  objc_super v7;
  CGRect v8;
  CGRect v9;

  v7.receiver = self;
  v7.super_class = (Class)PedestrianARViewController;
  -[ContainerViewController viewSafeAreaInsetsDidChange](&v7, "viewSafeAreaInsetsDidChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController view](self, "view"));
  objc_msgSend(v3, "frame");
  Width = CGRectGetWidth(v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController view](self, "view"));
  objc_msgSend(v5, "frame");
  v6 = Width > CGRectGetHeight(v9);

  -[PedestrianARViewController _updateConstraintsForLandscape:](self, "_updateConstraintsForLandscape:", v6);
}

- (void)_updateConstraintsForLandscape:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
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
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController view](self, "view"));
    v5 = objc_msgSend(v4, "effectiveUserInterfaceLayoutDirection");

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController view](self, "view"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "windowScene"));
    v9 = objc_msgSend(v8, "interfaceOrientation");

    if (v5 == (id)1)
    {
      if (v9 != (id)3)
      {
LABEL_4:
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController closeButtonSafeAreaTrailingConstraint](self, "closeButtonSafeAreaTrailingConstraint"));
        objc_msgSend(v10, "setActive:", 0);

        v11 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController closeButtonTrailingConstraint](self, "closeButtonTrailingConstraint"));
        objc_msgSend(v11, "setActive:", 1);

        v12 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController closeButtonTrailingConstraint](self, "closeButtonTrailingConstraint"));
        objc_msgSend(v12, "setConstant:", -24.0);

        v13 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController arrowGuidanceViewLeadingSafeAreaConstraint](self, "arrowGuidanceViewLeadingSafeAreaConstraint"));
        objc_msgSend(v13, "setActive:", 1);

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController arrowGuidanceViewTrailingSafeAreaConstraint](self, "arrowGuidanceViewTrailingSafeAreaConstraint"));
        objc_msgSend(v14, "setActive:", 0);

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController arrowGuidanceViewLeadingConstraint](self, "arrowGuidanceViewLeadingConstraint"));
        objc_msgSend(v15, "setActive:", 0);

        v16 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController arrowGuidanceViewTrailingConstraint](self, "arrowGuidanceViewTrailingConstraint"));
        objc_msgSend(v16, "setActive:", 1);

        v17 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController arrowGuidanceViewTrailingConstraint](self, "arrowGuidanceViewTrailingConstraint"));
        objc_msgSend(v17, "setConstant:", -24.0);
LABEL_8:

        v27 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController closeButtonTopConstraint](self, "closeButtonTopConstraint"));
        v36 = v27;
        v28 = 24.0;
        goto LABEL_9;
      }
    }
    else if (v9 != (id)4)
    {
      goto LABEL_4;
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController closeButtonTrailingConstraint](self, "closeButtonTrailingConstraint"));
    objc_msgSend(v29, "setActive:", 0);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController closeButtonSafeAreaTrailingConstraint](self, "closeButtonSafeAreaTrailingConstraint"));
    objc_msgSend(v30, "setActive:", 1);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController closeButtonSafeAreaTrailingConstraint](self, "closeButtonSafeAreaTrailingConstraint"));
    objc_msgSend(v31, "setConstant:", 0.0);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController arrowGuidanceViewLeadingSafeAreaConstraint](self, "arrowGuidanceViewLeadingSafeAreaConstraint"));
    objc_msgSend(v32, "setActive:", 0);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController arrowGuidanceViewTrailingSafeAreaConstraint](self, "arrowGuidanceViewTrailingSafeAreaConstraint"));
    objc_msgSend(v33, "setActive:", 1);

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController arrowGuidanceViewLeadingConstraint](self, "arrowGuidanceViewLeadingConstraint"));
    objc_msgSend(v34, "setActive:", 1);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController arrowGuidanceViewLeadingConstraint](self, "arrowGuidanceViewLeadingConstraint"));
    objc_msgSend(v35, "setConstant:", 24.0);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController arrowGuidanceViewTrailingConstraint](self, "arrowGuidanceViewTrailingConstraint"));
    objc_msgSend(v17, "setActive:", 0);
    goto LABEL_8;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController closeButtonTopConstraint](self, "closeButtonTopConstraint"));
  objc_msgSend(v18, "setConstant:", 10.0);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController closeButtonTrailingConstraint](self, "closeButtonTrailingConstraint"));
  objc_msgSend(v19, "setActive:", 0);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController closeButtonSafeAreaTrailingConstraint](self, "closeButtonSafeAreaTrailingConstraint"));
  objc_msgSend(v20, "setActive:", 1);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController closeButtonSafeAreaTrailingConstraint](self, "closeButtonSafeAreaTrailingConstraint"));
  objc_msgSend(v21, "setConstant:", -16.0);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController arrowGuidanceViewLeadingSafeAreaConstraint](self, "arrowGuidanceViewLeadingSafeAreaConstraint"));
  objc_msgSend(v22, "setActive:", 0);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController arrowGuidanceViewTrailingSafeAreaConstraint](self, "arrowGuidanceViewTrailingSafeAreaConstraint"));
  objc_msgSend(v23, "setActive:", 0);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController arrowGuidanceViewLeadingConstraint](self, "arrowGuidanceViewLeadingConstraint"));
  objc_msgSend(v24, "setActive:", 1);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController arrowGuidanceViewTrailingConstraint](self, "arrowGuidanceViewTrailingConstraint"));
  objc_msgSend(v25, "setActive:", 1);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController arrowGuidanceViewLeadingConstraint](self, "arrowGuidanceViewLeadingConstraint"));
  objc_msgSend(v26, "setConstant:", 16.0);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController arrowGuidanceViewTrailingConstraint](self, "arrowGuidanceViewTrailingConstraint"));
  v36 = v27;
  v28 = -16.0;
LABEL_9:
  objc_msgSend(v27, "setConstant:", v28);

}

- (unint64_t)supportedInterfaceOrientations
{
  return 26;
}

- (PedestrianARLocalizingView)localizingView
{
  PedestrianARLocalizingView *localizingView;
  PedestrianARLocalizingView *v4;
  PedestrianARLocalizingView *v5;
  void *v6;
  PedestrianARLocalizingView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];

  localizingView = self->_localizingView;
  if (!localizingView)
  {
    v4 = -[PedestrianARLocalizingView initWithFrame:]([PedestrianARLocalizingView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[PedestrianARLocalizingView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PedestrianARLocalizingView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    v5 = self->_localizingView;
    self->_localizingView = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController view](self, "view"));
    v7 = self->_localizingView;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController gradientOverlay](self, "gradientOverlay"));
    objc_msgSend(v6, "insertSubview:aboveSubview:", v7, v8);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARLocalizingView leadingAnchor](self->_localizingView, "leadingAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController view](self, "view"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "leadingAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v24));
    v27[0] = v23;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARLocalizingView trailingAnchor](self->_localizingView, "trailingAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController view](self, "view"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v20));
    v27[1] = v19;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARLocalizingView topAnchor](self->_localizingView, "topAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController view](self, "view"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v10));
    v27[2] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARLocalizingView bottomAnchor](self->_localizingView, "bottomAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController view](self, "view"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bottomAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v14));
    v27[3] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

    localizingView = self->_localizingView;
  }
  return localizingView;
}

- (void)setState:(int64_t)a3
{
  NSObject *v5;
  id v6;
  NSObject *v7;
  char *v8;
  id v9;
  NSObject *v10;
  char *v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  PedestrianARViewController *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  void *v28;
  void *v29;
  int64_t v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  PedestrianARViewController *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;

  if (self->_state != a3)
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    v5 = objc_claimAutoreleasedReturnValue(-[PedestrianARViewController activity](self, "activity"));
    os_activity_scope_enter(v5, &state);

    if (-[PedestrianARViewController isStopping](self, "isStopping"))
    {
      v6 = sub_1008A35A4();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        if ((unint64_t)a3 >= 4)
          v8 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), a3));
        else
          v8 = (char *)*(&off_1011DA4F0 + a3);
        *(_DWORD *)buf = 134349314;
        v37 = self;
        v38 = 2112;
        v39 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Requested to update state: %@, but we are currently stopping; ignoring",
          buf,
          0x16u);

      }
    }
    else
    {
      self->_state = a3;
      v9 = sub_1008A35A4();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        if ((unint64_t)a3 >= 4)
          v11 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), a3));
        else
          v11 = (char *)*(&off_1011DA4F0 + a3);
        *(_DWORD *)buf = 134349314;
        v37 = self;
        v38 = 2112;
        v39 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}p] Updating state: %@", buf, 0x16u);

      }
      switch(a3)
      {
        case 0:
          v12 = sub_1004318FC();
          v13 = objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v37 = (PedestrianARViewController *)"-[PedestrianARViewController setState:]";
            v38 = 2080;
            v39 = "PedestrianARViewController.m";
            v40 = 1024;
            v41 = 489;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
          }

          if (sub_100A70734())
          {
            v14 = sub_1004318FC();
            v15 = objc_claimAutoreleasedReturnValue(v14);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              v16 = (PedestrianARViewController *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
              *(_DWORD *)buf = 138412290;
              v37 = v16;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

            }
          }
          break;
        case 1:
          -[PedestrianARViewController resetAnalytics](self, "resetAnalytics");
          -[PedestrianARViewController hideInstructionView](self, "hideInstructionView");
          -[PedestrianARViewController hideArrowGuidanceView](self, "hideArrowGuidanceView");
          -[PedestrianARViewController hideFailureView](self, "hideFailureView");
          -[PedestrianARViewController hideSafetyView](self, "hideSafetyView");
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController safetyView](self, "safetyView"));
          objc_msgSend(v25, "didEndARSession");

          v26 = -[PedestrianARViewController isRerouteNecessary](self, "isRerouteNecessary");
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController renderingView](self, "renderingView"));
          objc_msgSend(v27, "setShouldGenerateFeatures:", v26 ^ 1);

          v28 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController renderingView](self, "renderingView"));
          objc_msgSend(v28, "setShouldShowFeatures:", 0);

          -[PedestrianARViewController disableIdleTimer](self, "disableIdleTimer");
          -[PedestrianARViewController stopFailureViewTimeoutTimer](self, "stopFailureViewTimeoutTimer");
          -[PedestrianARViewController cancelReroute](self, "cancelReroute");
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController localizingView](self, "localizingView"));
          objc_msgSend(v29, "showAnimated:completion:", 1, 0);

          +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 123, -[PedestrianARViewController analyticsTarget](self, "analyticsTarget"), 0);
          break;
        case 2:
          objc_initWeak((id *)buf, self);
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController localizingView](self, "localizingView"));
          v33[0] = _NSConcreteStackBlock;
          v33[1] = 3221225472;
          v33[2] = sub_1008A57CC;
          v33[3] = &unk_1011AD4F0;
          objc_copyWeak(&v34, (id *)buf);
          objc_msgSend(v17, "hideAnimated:completion:", 1, v33);

          -[PedestrianARViewController showInstructionView](self, "showInstructionView");
          -[PedestrianARViewController showArrowGuidanceView](self, "showArrowGuidanceView");
          -[PedestrianARViewController hideFailureView](self, "hideFailureView");
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController safetyView](self, "safetyView"));
          objc_msgSend(v18, "didStartARSession");

          -[PedestrianARViewController showSafetyView](self, "showSafetyView");
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController renderingView](self, "renderingView"));
          objc_msgSend(v19, "setShouldGenerateFeatures:", 1);

          v20 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController renderingView](self, "renderingView"));
          objc_msgSend(v20, "setShouldShowFeatures:", 1);

          -[PedestrianARViewController disableIdleTimer](self, "disableIdleTimer");
          -[PedestrianARViewController stopFailureViewTimeoutTimer](self, "stopFailureViewTimeoutTimer");
          -[PedestrianARViewController cancelReroute](self, "cancelReroute");
          -[PedestrianARViewController playSuccessHaptic](self, "playSuccessHaptic");
          objc_destroyWeak(&v34);
          objc_destroyWeak((id *)buf);
          break;
        case 3:
          objc_initWeak((id *)buf, self);
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController localizingView](self, "localizingView"));
          v31[0] = _NSConcreteStackBlock;
          v31[1] = 3221225472;
          v31[2] = sub_1008A583C;
          v31[3] = &unk_1011AD4F0;
          objc_copyWeak(&v32, (id *)buf);
          objc_msgSend(v21, "hideAnimated:completion:", 0, v31);

          -[PedestrianARViewController hideInstructionView](self, "hideInstructionView");
          -[PedestrianARViewController hideArrowGuidanceView](self, "hideArrowGuidanceView");
          -[PedestrianARViewController showFailureView](self, "showFailureView");
          -[PedestrianARViewController hideSafetyView](self, "hideSafetyView");
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController safetyView](self, "safetyView"));
          objc_msgSend(v22, "didEndARSession");

          v23 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController renderingView](self, "renderingView"));
          objc_msgSend(v23, "setShouldGenerateFeatures:", 1);

          v24 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController renderingView](self, "renderingView"));
          objc_msgSend(v24, "setShouldShowFeatures:", 0);

          -[PedestrianARViewController enableIdleTimer](self, "enableIdleTimer");
          -[PedestrianARViewController startFailureViewTimeoutTimer](self, "startFailureViewTimeoutTimer");
          -[PedestrianARViewController cancelReroute](self, "cancelReroute");
          -[PedestrianARViewController playFailureHaptic](self, "playFailureHaptic");
          objc_destroyWeak(&v32);
          objc_destroyWeak((id *)buf);
          break;
        default:
          break;
      }
      v30 = self->_state;
      v7 = objc_claimAutoreleasedReturnValue(-[PedestrianARViewController gradientOverlay](self, "gradientOverlay"));
      -[NSObject setState:](v7, "setState:", v30);
    }

    os_activity_scope_leave(&state);
  }
}

- (void)setRoute:(id)a3
{
  id v5;
  const char *label;
  const char *v7;
  BOOL v8;
  NSObject *v9;
  unint64_t v10;
  unint64_t v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  char *v19;
  int v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;

  v5 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v7 = dispatch_queue_get_label(0);
  if (label != v7)
  {
    v8 = !label || v7 == 0;
    if (v8 || strcmp(label, v7))
    {
      v15 = sub_1004318FC();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v20 = 136316418;
        v21 = "-[PedestrianARViewController setRoute:]";
        v22 = 2080;
        v23 = "PedestrianARViewController.m";
        v24 = 1024;
        v25 = 501;
        v26 = 2080;
        v27 = "dispatch_get_main_queue()";
        v28 = 2080;
        v29 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v30 = 2080;
        v31 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v20,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v17 = sub_1004318FC();
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v19 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v20 = 138412290;
          v21 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v20, 0xCu);

        }
      }
    }
  }
  v9 = objc_claimAutoreleasedReturnValue(-[PedestrianARViewController activity](self, "activity", 0, 0));
  os_activity_scope_enter(v9, (os_activity_scope_state_t)&v20);

  v10 = self->_route;
  v11 = (unint64_t)v5;
  if (v11 | v10)
  {
    v12 = objc_msgSend((id)v10, "isEqual:", v11);

    if ((v12 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_route, a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController renderingView](self, "renderingView"));
      objc_msgSend(v13, "setRoute:", v11);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController instructionContainerView](self, "instructionContainerView"));
      objc_msgSend(v14, "setRoute:", v11);

    }
  }
  os_activity_scope_leave((os_activity_scope_state_t)&v20);

}

- (BOOL)isShowingFailureView
{
  PedestrianARViewController *v2;
  void *v3;
  void *v4;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController failureContainee](v2, "failureContainee"));
  LOBYTE(v2) = v3 == v4;

  return (char)v2;
}

- (BOOL)allowsDisplayOnLockScreen
{
  return 1;
}

- (void)createViews
{
  PedestrianARRenderingView *v3;
  void *v4;
  void *v5;
  PedestrianARRenderingView *v6;
  void *v7;
  void *v8;
  PedestrianARRenderingView *renderingView;
  PedestrianARGradientOverlay *v10;
  void *v11;
  PedestrianARGradientOverlay *v12;
  PedestrianARGradientOverlay *gradientOverlay;
  UIButton *ttrButton;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  UIButton *v19;
  void *v20;
  void *v21;
  id v22;
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
  MUBlurView *closeButton;
  PedestrianARInstructionContainerView *v39;
  void *v40;
  PedestrianARInstructionContainerView *v41;
  void *v42;
  PedestrianARInstructionContainerView *instructionContainerView;
  PedestrianARArrowGuidanceView *v44;
  void *v45;
  void *v46;
  void *v47;
  PedestrianARArrowGuidanceView *v48;
  PedestrianARArrowGuidanceView *arrowGuidanceView;
  PedestrianARFailureContaineeViewController *v50;
  PedestrianARFailureContaineeViewController *failureContainee;
  void *v52;
  PedestrianARSafetyView *v53;
  PedestrianARSafetyView *safetyView;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  _QWORD v63[4];

  v3 = [PedestrianARRenderingView alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController guidanceObserver](self, "guidanceObserver"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController navigationService](self, "navigationService"));
  v6 = -[PedestrianARRenderingView initWithGuidanceObserver:navigationService:](v3, "initWithGuidanceObserver:navigationService:", v4, v5);

  -[PedestrianARRenderingView setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController route](self, "route"));
  -[PedestrianARRenderingView setRoute:](v6, "setRoute:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARRenderingView mapViewDelegate](v6, "mapViewDelegate"));
  objc_msgSend(v8, "registerObserver:", self);

  renderingView = self->_renderingView;
  self->_renderingView = v6;

  v10 = [PedestrianARGradientOverlay alloc];
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[PedestrianARGradientOverlayConfiguration defaultConfiguration](PedestrianARGradientOverlayConfiguration, "defaultConfiguration"));
  v12 = -[PedestrianARGradientOverlay initWithConfiguration:](v10, "initWithConfiguration:", v11);

  -[PedestrianARGradientOverlay setTranslatesAutoresizingMaskIntoConstraints:](v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PedestrianARGradientOverlay setUserInteractionEnabled:](v12, "setUserInteractionEnabled:", 0);
  gradientOverlay = self->_gradientOverlay;
  self->_gradientOverlay = v12;

  ttrButton = (UIButton *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
  if (-[UIButton isInternalInstall](ttrButton, "isInternalInstall"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v16 = objc_msgSend(v15, "BOOLForKey:", CFSTR("PedestrianARTTRButtonEnabledKey"));

    if (!v16)
      goto LABEL_5;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("PedestrianARTTR")));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "imageWithRenderingMode:", 2));

    v19 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton setImage:forState:](v19, "setImage:forState:", v18, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UIButton setTintColor:](v19, "setTintColor:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor"));
    -[UIButton setBackgroundColor:](v19, "setBackgroundColor:", v21);

    -[UIButton _setCornerRadius:](v19, "_setCornerRadius:", 21.0);
    -[UIButton addTarget:action:forControlEvents:](v19, "addTarget:action:forControlEvents:", self, "ttrButtonTapped:", 64);

    ttrButton = self->_ttrButton;
    self->_ttrButton = v19;
  }

LABEL_5:
  v22 = objc_msgSend(objc_alloc((Class)MUBlurView), "initWithBlurEffectStyle:", 16);
  objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor"));
  objc_msgSend(v22, "setNonBlurredColor:", v23);

  objc_msgSend(v22, "_setCornerRadius:", 21.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "layer"));
  objc_msgSend(v24, "setMasksToBounds:", 1);

  objc_msgSend(v22, "setClipsToBounds:", 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController traitCollection](self, "traitCollection"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "_maps_traitCollectionWithMaximumContentSizeCategory:", UIContentSizeCategoryLarge));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_fontWithTextStyle:weight:compatibleWithTraitCollection:](UIFont, "_maps_fontWithTextStyle:weight:compatibleWithTraitCollection:", UIFontTextStyleBody, v26, UIFontWeightBold));
  v62 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v27));

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("xmark"), v62));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "imageWithRenderingMode:", 2));

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
  objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v29, "setImage:forState:", v61, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  objc_msgSend(v29, "setTintColor:", v30);

  objc_msgSend(v29, "addTarget:action:forControlEvents:", self, "closeButtonTapped:", 64);
  objc_msgSend(v22, "addSubview:", v29);
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "leadingAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "leadingAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:", v59));
  v63[0] = v58;
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "trailingAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:", v56));
  v63[1] = v55;
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "topAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "topAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v32));
  v63[2] = v33;
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "bottomAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bottomAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v35));
  v63[3] = v36;
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v63, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v37);

  closeButton = self->_closeButton;
  self->_closeButton = (MUBlurView *)v22;

  v39 = [PedestrianARInstructionContainerView alloc];
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARRenderingView mapViewDelegate](self->_renderingView, "mapViewDelegate"));
  v41 = -[PedestrianARInstructionContainerView initWithMapViewDelegate:navigationService:](v39, "initWithMapViewDelegate:navigationService:", v40, self->_navigationService);

  -[PedestrianARInstructionContainerView setTranslatesAutoresizingMaskIntoConstraints:](v41, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PedestrianARInstructionContainerView setUserInteractionEnabled:](v41, "setUserInteractionEnabled:", 0);
  -[PedestrianARInstructionContainerView setHidden:](v41, "setHidden:", 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController route](self, "route"));
  -[PedestrianARInstructionContainerView setRoute:](v41, "setRoute:", v42);

  instructionContainerView = self->_instructionContainerView;
  self->_instructionContainerView = v41;

  v44 = [PedestrianARArrowGuidanceView alloc];
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARRenderingView mapViewDelegate](self->_renderingView, "mapViewDelegate"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController route](self, "route"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController activity](self, "activity"));
  v48 = -[PedestrianARArrowGuidanceView initWithMapViewDelegate:route:activity:](v44, "initWithMapViewDelegate:route:activity:", v45, v46, v47);

  -[PedestrianARArrowGuidanceView setTranslatesAutoresizingMaskIntoConstraints:](v48, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PedestrianARArrowGuidanceView setUserInteractionEnabled:](v48, "setUserInteractionEnabled:", 0);
  -[PedestrianARArrowGuidanceView setHidden:](v48, "setHidden:", 1);
  arrowGuidanceView = self->_arrowGuidanceView;
  self->_arrowGuidanceView = v48;

  v50 = -[PedestrianARFailureContaineeViewController initWithEntryPoint:]([PedestrianARFailureContaineeViewController alloc], "initWithEntryPoint:", -[PedestrianARViewController entryPoint](self, "entryPoint"));
  -[PedestrianARFailureContaineeViewController setFailureContaineeDelegate:](v50, "setFailureContaineeDelegate:", self);
  failureContainee = self->_failureContainee;
  self->_failureContainee = v50;

  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  LODWORD(v45) = objc_msgSend(v52, "BOOLForKey:", CFSTR("PedestrianARSafetyUIKey"));

  if ((_DWORD)v45)
  {
    v53 = objc_alloc_init(PedestrianARSafetyView);
    -[PedestrianARSafetyView setTranslatesAutoresizingMaskIntoConstraints:](v53, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PedestrianARSafetyView setUserInteractionEnabled:](v53, "setUserInteractionEnabled:", 0);
    -[PedestrianARSafetyView setHidden:](v53, "setHidden:", 1);
    safetyView = self->_safetyView;
    self->_safetyView = v53;

  }
}

- (void)start
{
  NSObject *v3;
  id v4;
  NSObject *v5;
  void *v6;
  _BOOL4 v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  PedestrianARViewController *v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  void *v19;
  PedestrianARViewController *v20;
  void *v21;
  char *v22;
  void *v23;
  VLFSession *v24;
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
  os_activity_scope_state_s v37;
  uint8_t buf[4];
  PedestrianARViewController *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;

  v3 = objc_claimAutoreleasedReturnValue(-[PedestrianARViewController activity](self, "activity", 0, 0));
  os_activity_scope_enter(v3, &v37);

  v4 = sub_1008A35A4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349314;
    v39 = self;
    v40 = 2080;
    v41 = "-[PedestrianARViewController start]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] %s", buf, 0x16u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController arkitSessionStartTimestamp](self, "arkitSessionStartTimestamp"));
  v7 = v6 == 0;

  if (v7)
  {
    v15 = sub_10043395C();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Starting pedestrian AR session", buf, 2u);
    }

    v17 = sub_10043395C();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute origin](self->_route, "origin"));
      v20 = (PedestrianARViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "hawkQueryRepresentation"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute destination](self->_route, "destination"));
      v22 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "hawkQueryRepresentation"));
      *(_DWORD *)buf = 138478083;
      v39 = v20;
      v40 = 2113;
      v41 = v22;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Origin: %{private}@ -- Destination: %{private}@", buf, 0x16u);

    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[PedestrianARViewController setArkitSessionStartTimestamp:](self, "setArkitSessionStartTimestamp:", v23);

    -[PedestrianARViewController cancelReroute](self, "cancelReroute");
    -[PedestrianARViewController cancelWaitingForActiveFeature](self, "cancelWaitingForActiveFeature");
    v24 = -[VLFSession initWithMode:]([VLFSession alloc], "initWithMode:", 0);
    -[PedestrianARViewController setVlfSession:](self, "setVlfSession:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController vlfSession](self, "vlfSession"));
    objc_msgSend(v25, "setDelegate:", self);

    if (-[PedestrianARViewController entryPoint](self, "entryPoint"))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController vlfSession](self, "vlfSession"));
      objc_msgSend(v26, "setEntryPoint:", 4);
    }
    else
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController vlfSession](self, "vlfSession"));
      objc_msgSend(v26, "setEntryPoint:", 3);
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController vlfSession](self, "vlfSession"));
    objc_msgSend(v27, "start");

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController notificationGenerator](self, "notificationGenerator"));
    objc_msgSend(v28, "prepare");

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController vlfSession](self, "vlfSession"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "session"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[PedestrianARFloatingDebugViewController sharedInstance](PedestrianARFloatingDebugViewController, "sharedInstance"));
    objc_msgSend(v31, "setSession:", v30);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController vlfSession](self, "vlfSession"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "session"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController localizingView](self, "localizingView"));
    objc_msgSend(v34, "setSession:", v33);

    v14 = objc_claimAutoreleasedReturnValue(-[PedestrianARViewController vlfSession](self, "vlfSession"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject session](v14, "session"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController renderingView](self, "renderingView"));
    objc_msgSend(v36, "setSession:", v35);

  }
  else
  {
    v8 = sub_1004318FC();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v39 = (PedestrianARViewController *)"-[PedestrianARViewController start]";
      v40 = 2080;
      v41 = "PedestrianARViewController.m";
      v42 = 1024;
      v43 = 651;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
    }

    if (sub_100A70734())
    {
      v10 = sub_1004318FC();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = (PedestrianARViewController *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v39 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
    v13 = sub_1008A35A4();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349056;
      v39 = self;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "[%{public}p] ARKit session has already been started. Cannot start twice.", buf, 0xCu);
    }
  }

  os_activity_scope_leave(&v37);
}

- (void)stop
{
  NSObject *v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  os_activity_scope_state_s v14;
  uint8_t buf[4];
  PedestrianARViewController *v16;

  if (!-[PedestrianARViewController isStopping](self, "isStopping"))
  {
    v3 = objc_claimAutoreleasedReturnValue(-[PedestrianARViewController activity](self, "activity", 0, 0));
    os_activity_scope_enter(v3, &v14);

    -[PedestrianARViewController setIsStopping:](self, "setIsStopping:", 1);
    v4 = sub_1008A35A4();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v16 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Stopping pedestrian AR", buf, 0xCu);
    }

    -[PedestrianARViewController setSentDisappearNotification:](self, "setSentDisappearNotification:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("PedestrianARViewControllerDidDisappearNotification"), self);

    v7 = objc_alloc_init((Class)GEOVLFARFailureTypes);
    objc_msgSend(v7, "setArWalkingNoLabels:", -[PedestrianARViewController didRenderLabel](self, "didRenderLabel") ^ 1);
    objc_msgSend(v7, "setArWalkingUndulationFailure:", -[PedestrianARViewController didFailUndulationLookup](self, "didFailUndulationLookup"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController vlfSession](self, "vlfSession"));
    objc_msgSend(v8, "stop");

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController vlfSession](self, "vlfSession"));
    objc_msgSend(v9, "sendAnalytics:", v7);

    -[PedestrianARViewController setArkitSessionStartTimestamp:](self, "setArkitSessionStartTimestamp:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MapsARSessionManager sharedManager](MapsARSessionManager, "sharedManager"));
    objc_msgSend(v10, "resignSessionWithOwner:", self);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController arrowGuidanceView](self, "arrowGuidanceView"));
    objc_msgSend(v11, "stop");

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController arDelegate](self, "arDelegate"));
    objc_msgSend(v12, "pedestrianARViewControllerDidStop:", self);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[PedestrianARFloatingDebugViewController sharedInstance](PedestrianARFloatingDebugViewController, "sharedInstance"));
    objc_msgSend(v13, "setSession:", 0);

    os_activity_scope_leave(&v14);
  }
}

- (void)showInstructionView
{
  NSObject *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  PedestrianARViewController *v14;
  __int16 v15;
  void *v16;

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[PedestrianARViewController activity](self, "activity"));
  os_activity_scope_enter(v3, &state);

  v4 = sub_1008A35A4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController instructionContainerView](self, "instructionContainerView"));
    *(_DWORD *)buf = 134349312;
    v14 = self;
    v15 = 2048;
    v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Showing instruction view: %p", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController instructionContainerView](self, "instructionContainerView"));
  objc_msgSend(v7, "setHidden:", 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController instructionContainerView](self, "instructionContainerView"));
  objc_msgSend(v8, "setAlpha:", 0.0);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1008A6CAC;
  v11[3] = &unk_1011AC860;
  v11[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1008A6CE0;
  v9[3] = &unk_1011AD4F0;
  objc_copyWeak(&v10, (id *)buf);
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x10000, v11, v9, 0.15, 0.6);
  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
  os_activity_scope_leave(&state);
}

- (void)hideInstructionView
{
  NSObject *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  os_activity_scope_state_s v9;
  uint8_t buf[4];
  PedestrianARViewController *v11;
  __int16 v12;
  void *v13;

  v3 = objc_claimAutoreleasedReturnValue(-[PedestrianARViewController activity](self, "activity", 0, 0));
  os_activity_scope_enter(v3, &v9);

  v4 = sub_1008A35A4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController instructionContainerView](self, "instructionContainerView"));
    *(_DWORD *)buf = 134349312;
    v11 = self;
    v12 = 2048;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Hiding instruction view: %p", buf, 0x16u);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController instructionContainerView](self, "instructionContainerView"));
  objc_msgSend(v7, "_removeAllAnimations:", 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController instructionContainerView](self, "instructionContainerView"));
  objc_msgSend(v8, "setHidden:", 1);

  os_activity_scope_leave(&v9);
}

- (void)showFailureView
{
  NSObject *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  os_activity_scope_state_s v11;
  uint8_t buf[4];
  PedestrianARViewController *v13;
  __int16 v14;
  void *v15;

  v3 = objc_claimAutoreleasedReturnValue(-[PedestrianARViewController activity](self, "activity", 0, 0));
  os_activity_scope_enter(v3, &v11);

  v4 = sub_1008A35A4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController failureContainee](self, "failureContainee"));
    *(_DWORD *)buf = 134349312;
    v13 = self;
    v14 = 2048;
    v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Showing failure view: %p", buf, 0x16u);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController vlfSession](self, "vlfSession"));
  objc_msgSend(v7, "stop");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController vlfSession](self, "vlfSession"));
  objc_msgSend(v8, "sendAnalytics:", 0);

  -[PedestrianARViewController setArkitSessionStartTimestamp:](self, "setArkitSessionStartTimestamp:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController closeButton](self, "closeButton"));
  objc_msgSend(v9, "setHidden:", 1);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController failureContainee](self, "failureContainee"));
  -[ContainerViewController presentController:](self, "presentController:", v10);

  os_activity_scope_leave(&v11);
}

- (void)hideFailureView
{
  NSObject *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  os_activity_scope_state_s v8;
  uint8_t buf[4];
  PedestrianARViewController *v10;
  __int16 v11;
  void *v12;

  v3 = objc_claimAutoreleasedReturnValue(-[PedestrianARViewController activity](self, "activity", 0, 0));
  os_activity_scope_enter(v3, &v8);

  v4 = sub_1008A35A4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController failureContainee](self, "failureContainee"));
    *(_DWORD *)buf = 134349312;
    v10 = self;
    v11 = 2048;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Hiding failure view: %p", buf, 0x16u);

  }
  -[ContainerViewController popLastViewControllerAnimated:](self, "popLastViewControllerAnimated:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController closeButton](self, "closeButton"));
  objc_msgSend(v7, "setHidden:", 0);

  os_activity_scope_leave(&v8);
}

- (void)showArrowGuidanceView
{
  NSObject *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  PedestrianARViewController *v14;
  __int16 v15;
  void *v16;

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[PedestrianARViewController activity](self, "activity"));
  os_activity_scope_enter(v3, &state);

  v4 = sub_1008A35A4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController arrowGuidanceView](self, "arrowGuidanceView"));
    *(_DWORD *)buf = 134349312;
    v14 = self;
    v15 = 2048;
    v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Showing arrow guidance view: %p", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController arrowGuidanceView](self, "arrowGuidanceView"));
  objc_msgSend(v7, "setHidden:", 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController arrowGuidanceView](self, "arrowGuidanceView"));
  objc_msgSend(v8, "setAlpha:", 0.0);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1008A73F8;
  v11[3] = &unk_1011AC860;
  v11[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1008A742C;
  v9[3] = &unk_1011AD4F0;
  objc_copyWeak(&v10, (id *)buf);
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x10000, v11, v9, 0.15, 0.6);
  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
  os_activity_scope_leave(&state);
}

- (void)hideArrowGuidanceView
{
  NSObject *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  os_activity_scope_state_s v9;
  uint8_t buf[4];
  PedestrianARViewController *v11;
  __int16 v12;
  void *v13;

  v3 = objc_claimAutoreleasedReturnValue(-[PedestrianARViewController activity](self, "activity", 0, 0));
  os_activity_scope_enter(v3, &v9);

  v4 = sub_1008A35A4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController arrowGuidanceView](self, "arrowGuidanceView"));
    *(_DWORD *)buf = 134349312;
    v11 = self;
    v12 = 2048;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Hiding arrow guidance view: %p", buf, 0x16u);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController arrowGuidanceView](self, "arrowGuidanceView"));
  objc_msgSend(v7, "_removeAllAnimations:", 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController arrowGuidanceView](self, "arrowGuidanceView"));
  objc_msgSend(v8, "setHidden:", 1);

  os_activity_scope_leave(&v9);
}

- (void)showSafetyView
{
  NSObject *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  os_activity_scope_state_s v8;
  uint8_t buf[4];
  PedestrianARViewController *v10;
  __int16 v11;
  void *v12;

  v3 = objc_claimAutoreleasedReturnValue(-[PedestrianARViewController activity](self, "activity", 0, 0));
  os_activity_scope_enter(v3, &v8);

  v4 = sub_1008A35A4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController safetyView](self, "safetyView"));
    *(_DWORD *)buf = 134349312;
    v10 = self;
    v11 = 2048;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Showing safety view: %p", buf, 0x16u);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController safetyView](self, "safetyView"));
  objc_msgSend(v7, "setHidden:", 0);

  os_activity_scope_leave(&v8);
}

- (void)hideSafetyView
{
  NSObject *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  os_activity_scope_state_s v8;
  uint8_t buf[4];
  PedestrianARViewController *v10;
  __int16 v11;
  void *v12;

  v3 = objc_claimAutoreleasedReturnValue(-[PedestrianARViewController activity](self, "activity", 0, 0));
  os_activity_scope_enter(v3, &v8);

  v4 = sub_1008A35A4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController safetyView](self, "safetyView"));
    *(_DWORD *)buf = 134349312;
    v10 = self;
    v11 = 2048;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Hiding safety view: %p", buf, 0x16u);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController safetyView](self, "safetyView"));
  objc_msgSend(v7, "setHidden:", 1);

  os_activity_scope_leave(&v8);
}

- (void)disableIdleTimer
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "idleTimerController"));
  objc_msgSend(v2, "setDesiredIdleTimerState:forReason:", 1, 4);

}

- (void)enableIdleTimer
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "idleTimerController"));
  objc_msgSend(v2, "setDesiredIdleTimerState:forReason:", 0, 4);

}

- (BOOL)isRerouteNecessary
{
  NSObject *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  id v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  double v21;
  double v22;
  double Double;
  id v24;
  NSObject *v25;
  double v26;
  double v27;
  double v28;
  id v29;
  NSObject *v30;
  os_activity_scope_state_s v32;
  uint8_t buf[4];
  PedestrianARViewController *v34;
  __int16 v35;
  double v36;
  __int16 v37;
  double v38;

  v3 = objc_claimAutoreleasedReturnValue(-[PedestrianARViewController activity](self, "activity", 0, 0));
  os_activity_scope_enter(v3, &v32);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController route](self, "route"));
  if (objc_msgSend(v4, "source") == (id)2)
  {

LABEL_4:
    v7 = sub_1008A35A4();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v34 = self;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v8, OS_LOG_TYPE_INFO, "[%{public}p] The current route is curated or user created; do not re-route",
        buf,
        0xCu);
    }
    v9 = 0;
    goto LABEL_23;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController route](self, "route"));
  v6 = objc_msgSend(v5, "source") == (id)3;

  if (v6)
    goto LABEL_4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController navigationService](self, "navigationService"));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastLocation"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController session](self, "session"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentFrame"));
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "location"));

  if (v8 | v13)
  {
    if (v13)
    {
      v15 = (id)v13;
      v16 = objc_msgSend(objc_alloc((Class)GEOLocation), "initWithCLLocation:", v15);
      v17 = objc_alloc((Class)GEORouteMatcher);
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController route](self, "route"));
      v19 = objc_msgSend(v17, "initWithRoute:auditToken:", v18, 0);

      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "matchToRouteWithLocation:", v16));
    }
    else
    {
      v15 = (id)v8;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject routeMatch](v15, "routeMatch"));
    }
    objc_msgSend(v20, "distanceFromRoute");
    v22 = v21;
    Double = GEOConfigGetDouble(MapsConfig_PedestrianARPostLocalizationRerouteDistanceThreshold, off_1014B42B8);
    v24 = sub_1008A35A4();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349568;
      v34 = self;
      v35 = 2048;
      v36 = v22;
      v37 = 2048;
      v38 = Double;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "[%{public}p] Distance from the route: (%f) threshold: (%f)", buf, 0x20u);
    }

    if (v22 <= Double)
    {
      -[NSObject horizontalAccuracy](v15, "horizontalAccuracy");
      v27 = v26;
      v28 = GEOConfigGetDouble(MapsConfig_PedestrianARPostLocalizationRerouteHorizontalAccuracyThreshold, off_1014B4648);
      v29 = sub_1008A35A4();
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349568;
        v34 = self;
        v35 = 2048;
        v36 = v27;
        v37 = 2048;
        v38 = v28;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "[%{public}p] Location horizontal accuracy: (%f) threshold: (%f)", buf, 0x20u);
      }

      v9 = v27 > v28;
    }
    else
    {
      v9 = 1;
    }

  }
  else
  {
    v14 = sub_1008A35A4();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v34 = self;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[%{public}p] There is no known last location; cannot determine whether reroute is necessary",
        buf,
        0xCu);
    }
    v9 = 0;
  }

LABEL_23:
  os_activity_scope_leave(&v32);
  return v9;
}

- (BOOL)isRerouting
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController rerouteCompletionTimer](self, "rerouteCompletionTimer"));
  v3 = v2 != 0;

  return v3;
}

- (void)reroute
{
  NSObject *v3;
  void *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  double Double;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  PedestrianARViewController *v19;
  _QWORD v20[4];
  id v21;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  PedestrianARViewController *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[PedestrianARViewController activity](self, "activity"));
  os_activity_scope_enter(v3, &state);

  if (!-[PedestrianARViewController isRerouteNecessary](self, "isRerouteNecessary"))
  {
    v15 = sub_1004318FC();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v24 = (PedestrianARViewController *)"-[PedestrianARViewController reroute]";
      v25 = 2080;
      v26 = "PedestrianARViewController.m";
      v27 = 1024;
      v28 = 832;
      v29 = 2080;
      v30 = "[self isRerouteNecessary]";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v17 = sub_1004318FC();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = (PedestrianARViewController *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v24 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController rerouteCompletionTimer](self, "rerouteCompletionTimer"));
  v5 = v4 == 0;

  v6 = sub_1008A35A4();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v24 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Rerouting", buf, 0xCu);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController navigationService](self, "navigationService"));
    objc_msgSend(v9, "forceReroute");

    Double = GEOConfigGetDouble(MapsConfig_PedestrianARPostLocalizationRerouteTimeout, off_1014B4638);
    v11 = sub_1008A35A4();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349312;
      v24 = self;
      v25 = 2048;
      v26 = *(const char **)&Double;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}p] Starting reroute completion timer with timeout: %f", buf, 0x16u);
    }

    objc_initWeak((id *)buf, self);
    v13 = &_dispatch_main_q;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1008A8138;
    v20[3] = &unk_1011AE190;
    objc_copyWeak(&v21, (id *)buf);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, v20, Double));
    -[PedestrianARViewController setRerouteCompletionTimer:](self, "setRerouteCompletionTimer:", v14);

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v24 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[%{public}p] Reroute already in progress; ignoring",
        buf,
        0xCu);
    }

  }
  os_activity_scope_leave(&state);
}

- (void)cancelReroute
{
  NSObject *v3;
  void *v4;
  id v5;
  NSObject *v6;
  os_activity_scope_state_s v7;
  uint8_t buf[4];
  PedestrianARViewController *v9;

  v3 = objc_claimAutoreleasedReturnValue(-[PedestrianARViewController activity](self, "activity", 0, 0));
  os_activity_scope_enter(v3, &v7);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController rerouteCompletionTimer](self, "rerouteCompletionTimer"));
  LOBYTE(v3) = v4 == 0;

  if ((v3 & 1) == 0)
  {
    v5 = sub_1008A35A4();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v9 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Canceling reroute timer", buf, 0xCu);
    }

    -[PedestrianARViewController setRerouteCompletionTimer:](self, "setRerouteCompletionTimer:", 0);
  }
  os_activity_scope_leave(&v7);
}

- (BOOL)isWaitingForActiveFeature
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController activeFeatureTimer](self, "activeFeatureTimer"));
  v3 = v2 != 0;

  return v3;
}

- (void)waitForActiveFeatureIfNecessary
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;
  NSObject *v9;
  double Double;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  PedestrianARViewController *v19;
  __int16 v20;
  double v21;

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[PedestrianARViewController activity](self, "activity"));
  os_activity_scope_enter(v3, &state);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController renderingView](self, "renderingView"));
  objc_msgSend(v4, "setShouldGenerateFeatures:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController renderingView](self, "renderingView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapViewDelegate"));
  v7 = objc_msgSend(v6, "hasActiveFeatureSet");

  if (v7)
  {
    v8 = sub_1008A35A4();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v19 = self;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Active feature already exists; no need to wait",
        buf,
        0xCu);
    }

    -[PedestrianARViewController setState:](self, "setState:", 2);
  }
  else
  {
    Double = GEOConfigGetDouble(MapsConfig_PedestrianARPostLocalizationActiveFeatureTimeout, off_1014B4678);
    v11 = sub_1008A35A4();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349312;
      v19 = self;
      v20 = 2048;
      v21 = Double;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}p] Waiting for active feature with timeout: %f", buf, 0x16u);
    }

    objc_initWeak((id *)buf, self);
    v13 = &_dispatch_main_q;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1008A8614;
    v15[3] = &unk_1011AE190;
    objc_copyWeak(&v16, (id *)buf);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, v15, Double));
    -[PedestrianARViewController setActiveFeatureTimer:](self, "setActiveFeatureTimer:", v14);

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
  os_activity_scope_leave(&state);
}

- (void)cancelWaitingForActiveFeature
{
  NSObject *v3;
  void *v4;
  id v5;
  NSObject *v6;
  os_activity_scope_state_s v7;
  uint8_t buf[4];
  PedestrianARViewController *v9;

  v3 = objc_claimAutoreleasedReturnValue(-[PedestrianARViewController activity](self, "activity", 0, 0));
  os_activity_scope_enter(v3, &v7);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController activeFeatureTimer](self, "activeFeatureTimer"));
  LOBYTE(v3) = v4 == 0;

  if ((v3 & 1) == 0)
  {
    v5 = sub_1008A35A4();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v9 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Canceling active feature timer", buf, 0xCu);
    }

    -[PedestrianARViewController setActiveFeatureTimer:](self, "setActiveFeatureTimer:", 0);
  }
  os_activity_scope_leave(&v7);
}

- (void)startFailureViewTimeoutTimer
{
  NSObject *v3;
  double Double;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  PedestrianARViewController *v13;
  __int16 v14;
  double v15;

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[PedestrianARViewController activity](self, "activity"));
  os_activity_scope_enter(v3, &state);

  Double = GEOConfigGetDouble(MapsConfig_PedestrianARSessionFailureViewTimeout, off_1014B4208);
  v5 = sub_1008A35A4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349312;
    v13 = self;
    v14 = 2048;
    v15 = Double;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Starting failure view timeout with threshold: %f", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v7 = &_dispatch_main_q;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1008A8A18;
  v9[3] = &unk_1011AE190;
  objc_copyWeak(&v10, (id *)buf);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, v9, Double));
  -[PedestrianARViewController setFailureViewTimeoutTimer:](self, "setFailureViewTimeoutTimer:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
  os_activity_scope_leave(&state);
}

- (void)stopFailureViewTimeoutTimer
{
  -[PedestrianARViewController setFailureViewTimeoutTimer:](self, "setFailureViewTimeoutTimer:", 0);
}

- (void)resetAnalytics
{
  -[PedestrianARViewController setDidRenderLabel:](self, "setDidRenderLabel:", 0);
  -[PedestrianARViewController setDidFailUndulationLookup:](self, "setDidFailUndulationLookup:", 0);
}

- (void)showVLTracePopupIfNecessaryWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  unsigned __int8 v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[4];
  void (**v20)(_QWORD);
  _QWORD v21[4];
  id v22;
  id v23;
  _BYTE location[12];
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;

  v4 = (void (**)(_QWORD))a3;
  if (!v4)
  {
    v14 = sub_1004318FC();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136315906;
      *(_QWORD *)&location[4] = "-[PedestrianARViewController showVLTracePopupIfNecessaryWithCompletion:]";
      v25 = 2080;
      v26 = "PedestrianARViewController.m";
      v27 = 1024;
      v28 = 928;
      v29 = 2080;
      v30 = "completion != nil";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", location, 0x26u);
    }

    if (sub_100A70734())
    {
      v16 = sub_1004318FC();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)location = 138412290;
        *(_QWORD *)&location[4] = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", location, 0xCu);

      }
    }
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
  v6 = objc_msgSend(v5, "isInternalInstall");

  if ((v6 & 1) == 0
    || -[PedestrianARViewController didShowVLTracePopup](self, "didShowVLTracePopup")
    || (v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults")),
        v8 = objc_msgSend(v7, "BOOLForKey:", CFSTR("PedestrianARViewControllerTemporarilyEnableVLTraceRecordingKey")), v7, v8)|| GEOConfigGetBOOL(MapsConfig_VLTraceRecordingEnabled, off_1014B3698))
  {
    v4[2](v4);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Localization failure [Internal only]"), CFSTR("Would you like to enable VL trace recording until the next time you cold launch Maps? VL trace recording is required to diagnose issues with localization."), 1));
    objc_initWeak((id *)location, self);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1008A8F24;
    v21[3] = &unk_1011DA4B0;
    objc_copyWeak(&v23, (id *)location);
    v10 = v4;
    v22 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Yes"), 0, v21));
    objc_msgSend(v9, "addAction:", v11);

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1008A9140;
    v19[3] = &unk_1011AD960;
    v20 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("No"), 1, v19));
    objc_msgSend(v9, "addAction:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
    objc_msgSend(v13, "_maps_topMostPresentViewController:animated:completion:", v9, 1, 0);

    -[PedestrianARViewController setDidShowVLTracePopup:](self, "setDidShowVLTracePopup:", 1);
    -[PedestrianARViewController stopFailureViewTimeoutTimer](self, "stopFailureViewTimeoutTimer");

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)location);

  }
}

- (void)playSuccessHaptic
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController notificationGenerator](self, "notificationGenerator"));
  objc_msgSend(v2, "notificationOccurred:", 0);

}

- (void)playFailureHaptic
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController notificationGenerator](self, "notificationGenerator"));
  objc_msgSend(v2, "notificationOccurred:", 2);

}

- (ARConfiguration)configuration
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController session](self, "session"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "configuration"));

  return (ARConfiguration *)v3;
}

- (BOOL)isARSessionBeingRecorded
{
  void *v2;
  uint64_t v3;
  char isKindOfClass;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController configuration](self, "configuration"));
  v3 = objc_opt_class(ARRecordingConfiguration);
  isKindOfClass = objc_opt_isKindOfClass(v2, v3);

  return isKindOfClass & 1;
}

- (BOOL)isARSessionReplayingFromRecording
{
  void *v2;
  uint64_t v3;
  char isKindOfClass;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController configuration](self, "configuration"));
  v3 = objc_opt_class(ARReplayConfiguration);
  isKindOfClass = objc_opt_isKindOfClass(v2, v3);

  return isKindOfClass & 1;
}

- (int)analyticsTarget
{
  if (-[PedestrianARViewController entryPoint](self, "entryPoint"))
    return 402;
  else
    return 302;
}

- (id)mapView
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController renderingView](self, "renderingView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mapViewDelegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapView"));

  return v4;
}

- (BOOL)supportsEmptyStack
{
  return 1;
}

- (void)mapLayer:(id)a3 activeARWalkingFeatureDidUpdate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  void *v20;
  os_activity_scope_state_s v21;
  uint8_t buf[4];
  PedestrianARViewController *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  __CFString *v29;
  __int16 v30;
  __CFString *v31;
  __int16 v32;
  uint64_t v33;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[PedestrianARViewController activity](self, "activity", 0, 0));
  os_activity_scope_enter(v8, &v21);

  v9 = sub_1008A35A4();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "feature"));
    if (objc_msgSend(v7, "isVisible"))
      v12 = CFSTR("YES");
    else
      v12 = CFSTR("NO");
    v13 = v12;
    if (objc_msgSend(v7, "isDirectlyBehind"))
      v14 = CFSTR("YES");
    else
      v14 = CFSTR("NO");
    v15 = v14;
    objc_msgSend(v7, "screenHeading");
    *(_DWORD *)buf = 134350338;
    v23 = self;
    v24 = 2112;
    v25 = v7;
    v26 = 2112;
    v27 = v11;
    v28 = 2112;
    v29 = v13;
    v30 = 2112;
    v31 = v15;
    v32 = 2048;
    v33 = v16;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[%{public}p] Feature did update: %@, feature: %@, isVisible: %@, isDirectlyBehind: %@, screenHeading: %f", buf, 0x3Eu);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "feature"));
  if (v17)
  {
    v18 = -[PedestrianARViewController didRenderLabel](self, "didRenderLabel");

    if ((v18 & 1) == 0)
      -[PedestrianARViewController setDidRenderLabel:](self, "setDidRenderLabel:", 1);
  }
  if (objc_msgSend(v7, "isVisible"))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[PedestrianARSessionUsageTracker sharedInstance](PedestrianARSessionUsageTracker, "sharedInstance"));
    objc_msgSend(v19, "registerARElementRendered");

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v20, "postNotificationName:object:", CFSTR("PedestrianARViewControllerARFeatureDidAppearNotification"), self);

  }
  os_activity_scope_leave(&v21);

}

- (void)mapLayer:(id)a3 updatedFeatures:(id)a4
{
  void *v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  PedestrianARViewController *v11;

  v9 = (id)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController renderingView](self, "renderingView", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapViewDelegate"));
  if (objc_msgSend(v5, "hasActiveFeatureSet"))
  {
    v6 = -[PedestrianARViewController isWaitingForActiveFeature](self, "isWaitingForActiveFeature");

    if (v6)
    {
      -[PedestrianARViewController cancelWaitingForActiveFeature](self, "cancelWaitingForActiveFeature");
      v7 = sub_1008A35A4();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        v11 = self;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Got first active feature; changing state to .Running",
          buf,
          0xCu);
      }

      -[PedestrianARViewController setState:](self, "setState:", 2);
    }
  }
  else
  {

  }
}

- (void)mapLayer:(id)a3 failedElevationRequestWithReason:(int64_t)a4
{
  if (a4 == 1 && !-[PedestrianARViewController didFailUndulationLookup](self, "didFailUndulationLookup", a3))
    -[PedestrianARViewController setDidFailUndulationLookup:](self, "setDidFailUndulationLookup:", 1);
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  PedestrianARViewController *v13;
  __int16 v14;
  id v15;

  v5 = a4;
  v6 = sub_1008A35A4();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349314;
    v13 = self;
    v14 = 2112;
    v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[%{public}p] ARSession did fail with error: %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1008A97E0;
  v9[3] = &unk_1011AD1E8;
  objc_copyWeak(&v11, (id *)buf);
  v10 = v5;
  v8 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

- (void)session:(id)a3 didChangeGeoTrackingStatus:(id)a4
{
  id v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  uint8_t buf[4];
  PedestrianARViewController *v10;

  if (objc_msgSend(a4, "state", a3) != (id)3)
  {
    v5 = sub_1008A35A4();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] ARKit is no longer localized; re-starting localization",
        buf,
        0xCu);
    }

    objc_initWeak((id *)buf, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1008A9B08;
    block[3] = &unk_1011AD260;
    objc_copyWeak(&v8, (id *)buf);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    objc_destroyWeak(&v8);
    objc_destroyWeak((id *)buf);
  }
}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1008A9C74;
  v4[3] = &unk_1011AD260;
  objc_copyWeak(&v5, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)replayConfigurationDidFinishReplaying:(id)a3
{
  id v4;
  const char *label;
  const char *v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  void *v10;
  unsigned int v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  PedestrianARViewController *v19;
  int v20;
  PedestrianARViewController *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;

  v4 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v15 = sub_1004318FC();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v20 = 136316418;
        v21 = (PedestrianARViewController *)"-[PedestrianARViewController replayConfigurationDidFinishReplaying:]";
        v22 = 2080;
        v23 = "PedestrianARViewController.m";
        v24 = 1024;
        v25 = 1115;
        v26 = 2080;
        v27 = "dispatch_get_main_queue()";
        v28 = 2080;
        v29 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v30 = 2080;
        v31 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v20,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v17 = sub_1004318FC();
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v19 = (PedestrianARViewController *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v20 = 138412290;
          v21 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v20, 0xCu);

        }
      }
    }
  }
  v8 = sub_1008A35A4();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v20 = 134349056;
    v21 = self;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] ARKit replay ended", (uint8_t *)&v20, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v11 = objc_msgSend(v10, "BOOLForKey:", CFSTR("MapsARSessionPlaybackLoopKey"));

  v12 = sub_1008A35A4();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (v11)
  {
    if (v14)
    {
      v20 = 134349056;
      v21 = self;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[%{public}p] Looping replay", (uint8_t *)&v20, 0xCu);
    }

    -[PedestrianARViewController setArkitSessionStartTimestamp:](self, "setArkitSessionStartTimestamp:", 0);
    -[PedestrianARViewController start](self, "start");
  }
  else
  {
    if (v14)
    {
      v20 = 134349056;
      v21 = self;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[%{public}p] Stopping AR", (uint8_t *)&v20, 0xCu);
    }

    -[PedestrianARViewController stop](self, "stop");
  }

}

- (void)sessionManager:(id)a3 didGainSessionOwnership:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double Double;
  id v18;
  NSObject *v19;
  os_activity_scope_state_s v20;
  uint8_t buf[4];
  PedestrianARViewController *v22;
  __int16 v23;
  double v24;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[PedestrianARViewController activity](self, "activity", 0, 0));
  os_activity_scope_enter(v8, &v20);

  objc_storeStrong((id *)&self->_session, a4);
  if (-[PedestrianARViewController isARSessionBeingRecorded](self, "isARSessionBeingRecorded"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController configuration](self, "configuration"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fileURL"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "path"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController navigationService](self, "navigationService"));
    objc_msgSend(v12, "recordPedestrianTracePath:", v11);

  }
  else
  {
    if (-[PedestrianARViewController isARSessionReplayingFromRecording](self, "isARSessionReplayingFromRecording"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController configuration](self, "configuration"));
      objc_msgSend(v9, "setDelegate:", self);
      goto LABEL_6;
    }
    if (!GEOConfigGetBOOL(MapsConfig_PedestrianAREnableCustomPostLocalizationVLCallInterval, off_1014B4298))goto LABEL_7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController configuration](self, "configuration"));
    Double = GEOConfigGetDouble(MapsConfig_PedestrianARPostLocalizationVLCallInterval, off_1014B42A8);
    v18 = sub_1008A35A4();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349312;
      v22 = self;
      v23 = 2048;
      v24 = Double;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "[%{public}p] Configuring VL with custom interval: %f", buf, 0x16u);
    }

    objc_msgSend(v9, "setVisualLocalizationCallInterval:", Double);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController session](self, "session"));
    objc_msgSend(v11, "runWithConfiguration:", v9);
  }

LABEL_6:
LABEL_7:
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController configuration](self, "configuration"));
  -[PedestrianARViewController setShouldUpdateCameraFocusLensPosition:](self, "setShouldUpdateCameraFocusLensPosition:", objc_msgSend(v13, "isAutoFocusEnabled") ^ 1);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController session](self, "session"));
  objc_msgSend(v14, "_addObserver:", self);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController session](self, "session"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[PedestrianARFloatingDebugViewController sharedInstance](PedestrianARFloatingDebugViewController, "sharedInstance"));
  objc_msgSend(v16, "setSession:", v15);

  os_activity_scope_leave(&v20);
}

- (void)sessionManager:(id)a3 didResignSessionOwnership:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  ARSession *session;
  void **v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id v24;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  PedestrianARViewController *v27;

  v6 = a3;
  v7 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v8 = objc_claimAutoreleasedReturnValue(-[PedestrianARViewController activity](self, "activity"));
  os_activity_scope_enter(v8, &state);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController session](self, "session"));
  objc_msgSend(v9, "_removeObserver:", self);

  if (-[PedestrianARViewController isARSessionBeingRecorded](self, "isARSessionBeingRecorded"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController configuration](self, "configuration"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fileURL"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "path"));

    v13 = sub_1008A35A4();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v27 = self;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[%{public}p] Ending ARKit session recording", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController configuration](self, "configuration"));
    v19 = _NSConcreteStackBlock;
    v20 = 3221225472;
    v21 = sub_1008AA538;
    v22 = &unk_1011B2260;
    objc_copyWeak(&v24, (id *)buf);
    v16 = v12;
    v23 = v16;
    objc_msgSend(v15, "finishRecordingWithHandler:", &v19);

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
    goto LABEL_7;
  }
  if (-[PedestrianARViewController isARSessionReplayingFromRecording](self, "isARSessionReplayingFromRecording"))
  {
    v16 = (id)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController configuration](self, "configuration"));
    objc_msgSend(v16, "setDelegate:", 0);
LABEL_7:

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[PedestrianARFloatingDebugViewController sharedInstance](PedestrianARFloatingDebugViewController, "sharedInstance", v19, v20, v21, v22));
  objc_msgSend(v17, "setSession:", 0);

  session = self->_session;
  self->_session = 0;

  os_activity_scope_leave(&state);
}

- (void)VLFSessionLocalizationSucceeded
{
  NSObject *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];
  os_activity_scope_state_s state;

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[PedestrianARViewController activity](self, "activity"));
  os_activity_scope_enter(v3, &state);

  v4 = sub_10043395C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "VLF localization succeeded", v11, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[PedestrianARSessionUsageTracker sharedInstance](PedestrianARSessionUsageTracker, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController route](self, "route"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uniqueRouteID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
  objc_msgSend(v6, "registerLocalizationSuccessForRoute:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MapsARSessionManager sharedManager](MapsARSessionManager, "sharedManager"));
  objc_msgSend(v10, "requestSessionWithOwner:", self);

  if (-[PedestrianARViewController isRerouteNecessary](self, "isRerouteNecessary"))
    -[PedestrianARViewController reroute](self, "reroute");
  else
    -[PedestrianARViewController waitForActiveFeatureIfNecessary](self, "waitForActiveFeatureIfNecessary");
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 121, -[PedestrianARViewController analyticsTarget](self, "analyticsTarget"), 0);
  os_activity_scope_leave(&state);
}

- (void)VLFSessionLocalizationFailedWithError:(id)a3
{
  PedestrianARViewController *v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  os_activity_scope_state_s v14;
  uint8_t buf[4];
  PedestrianARViewController *v16;
  __int16 v17;
  PedestrianARViewController *v18;

  v4 = (PedestrianARViewController *)a3;
  v5 = objc_claimAutoreleasedReturnValue(-[PedestrianARViewController activity](self, "activity", 0, 0));
  os_activity_scope_enter(v5, &v14);

  v6 = sub_1008A35A4();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349314;
    v16 = self;
    v17 = 2112;
    v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[%{public}p] VLF localization failed with error: %@", buf, 0x16u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController domain](v4, "domain"));
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.Maps.VLFSession"));

  if (v9)
  {
    if (-[PedestrianARViewController code](v4, "code") == (id)2)
    {
      v10 = -[PedestrianARViewController analyticsTarget](self, "analyticsTarget");
      v11 = 122;
    }
    else
    {
      v10 = -[PedestrianARViewController analyticsTarget](self, "analyticsTarget");
      v11 = 119;
    }
  }
  else
  {
    v10 = -[PedestrianARViewController analyticsTarget](self, "analyticsTarget");
    v11 = 120;
  }
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", v11, v10, 0);
  if (!-[PedestrianARViewController isStopping](self, "isStopping"))
  {
    v12 = sub_10043395C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "VLF localization failed: %@", buf, 0xCu);
    }

    -[PedestrianARViewController setState:](self, "setState:", 3);
  }
  os_activity_scope_leave(&v14);

}

- (void)closeButtonTapped:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];
  os_activity_scope_state_s state;

  v4 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[PedestrianARViewController activity](self, "activity"));
  os_activity_scope_enter(v5, &state);

  v6 = sub_10043395C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "User tapped close button", v8, 2u);
  }

  -[PedestrianARViewController stop](self, "stop");
  os_activity_scope_leave(&state);

}

- (void)ttrButtonTapped:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];
  os_activity_scope_state_s state;

  v4 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[PedestrianARViewController activity](self, "activity"));
  os_activity_scope_enter(v5, &state);

  v6 = sub_10043395C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "User tapped TTR button", v9, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PedestrianARFloatingDebugViewController sharedInstance](PedestrianARFloatingDebugViewController, "sharedInstance"));
  objc_msgSend(v8, "composeTTR");

  os_activity_scope_leave(&state);
}

- (void)applyTransitionWithProgress:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController view](self, "view"));
  objc_msgSend(v4, "setAlpha:", a3);

}

- (void)failureViewRetryButtonTapped:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id buf[2];
  os_activity_scope_state_s state;

  v4 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[PedestrianARViewController activity](self, "activity"));
  os_activity_scope_enter(v5, &state);

  v6 = sub_10043395C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "User-initiated retry after failure", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1008AAD58;
  v8[3] = &unk_1011AD260;
  objc_copyWeak(&v9, buf);
  -[PedestrianARViewController showVLTracePopupIfNecessaryWithCompletion:](self, "showVLTracePopupIfNecessaryWithCompletion:", v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(buf);
  os_activity_scope_leave(&state);

}

- (void)failureViewDismissButtonTapped:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];
  os_activity_scope_state_s state;

  v4 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[PedestrianARViewController activity](self, "activity"));
  os_activity_scope_enter(v5, &state);

  v6 = sub_10043395C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "User-initiated dismiss after failure", v8, 2u);
  }

  -[PedestrianARViewController setIsDismissing:](self, "setIsDismissing:", 1);
  -[ContainerViewController popLastViewControllerAnimated:](self, "popLastViewControllerAnimated:", 1);
  os_activity_scope_leave(&state);

}

- (void)didResignContainee:(id)a3 finished:(BOOL)a4
{
  id v5;
  unsigned int v6;
  id v7;

  v7 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController failureContainee](self, "failureContainee"));
  if (v5 == v7)
  {
    v6 = -[PedestrianARViewController isDismissing](self, "isDismissing");

    if (v6)
      -[PedestrianARViewController stop](self, "stop");
  }
  else
  {

  }
}

- (void)applicationDidEnterBackgroundNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  os_activity_scope_state_s v8;
  uint8_t buf[4];
  PedestrianARViewController *v10;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[PedestrianARViewController activity](self, "activity", 0, 0));
  os_activity_scope_enter(v5, &v8);

  v6 = sub_1008A35A4();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] App backgrounded; dismissing ourselves",
      buf,
      0xCu);
  }

  -[PedestrianARViewController stop](self, "stop");
  os_activity_scope_leave(&v8);

}

- (void)vlfSessionDidGetFirstFrameNotification:(id)a3
{
  -[PedestrianARViewController setState:](self, "setState:", 1);
}

- (void)navigationSession:(id)a3 didUpdateRouteCollection:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  os_activity_scope_state_s v16;
  uint8_t buf[4];
  PedestrianARViewController *v18;
  __int16 v19;
  void *v20;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[PedestrianARViewController activity](self, "activity", 0, 0));
  os_activity_scope_enter(v8, &v16);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentRoute"));
  v10 = sub_1008A35A4();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uniqueRouteID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUIDString"));
    *(_DWORD *)buf = 134349314;
    v18 = self;
    v19 = 2112;
    v20 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}p] Route updated: %@", buf, 0x16u);

  }
  -[PedestrianARViewController setRoute:](self, "setRoute:", v9);
  if (-[PedestrianARViewController isRerouting](self, "isRerouting"))
  {
    -[PedestrianARViewController cancelReroute](self, "cancelReroute");
    v14 = sub_1008A35A4();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v18 = self;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[%{public}p] Reroute succeeded", buf, 0xCu);
    }

    -[PedestrianARViewController waitForActiveFeatureIfNecessary](self, "waitForActiveFeatureIfNecessary");
  }

  os_activity_scope_leave(&v16);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("PedestrianARAutoFocusDistanceKey"))
    && (v13 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults")),
        v13,
        v13 == v11))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController configuration](self, "configuration"));
    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARViewController configuration](self, "configuration"));
      -[PedestrianARViewController setShouldUpdateCameraFocusLensPosition:](self, "setShouldUpdateCameraFocusLensPosition:", objc_msgSend(v15, "isAutoFocusEnabled") ^ 1);

    }
    else
    {
      -[PedestrianARViewController setShouldUpdateCameraFocusLensPosition:](self, "setShouldUpdateCameraFocusLensPosition:", 0);
    }

  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)PedestrianARViewController;
    -[PedestrianARViewController observeValueForKeyPath:ofObject:change:context:](&v16, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
  }

}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (PedestrianARViewControllerDelegate)arDelegate
{
  return (PedestrianARViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_arDelegate);
}

- (void)setArDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_arDelegate, a3);
}

- (NavigationSession)navigationSession
{
  return self->_navigationSession;
}

- (void)setNavigationSession:(id)a3
{
  objc_storeStrong((id *)&self->_navigationSession, a3);
}

- (int64_t)entryPoint
{
  return self->_entryPoint;
}

- (int64_t)state
{
  return self->_state;
}

- (PlatformController)platformController
{
  return (PlatformController *)objc_loadWeakRetained((id *)&self->_platformController);
}

- (void)setPlatformController:(id)a3
{
  objc_storeWeak((id *)&self->_platformController, a3);
}

- (GuidanceObserver)guidanceObserver
{
  return self->_guidanceObserver;
}

- (void)setGuidanceObserver:(id)a3
{
  objc_storeStrong((id *)&self->_guidanceObserver, a3);
}

- (MNNavigationService)navigationService
{
  return self->_navigationService;
}

- (void)setNavigationService:(id)a3
{
  objc_storeStrong((id *)&self->_navigationService, a3);
}

- (UIButton)ttrButton
{
  return self->_ttrButton;
}

- (void)setTtrButton:(id)a3
{
  objc_storeStrong((id *)&self->_ttrButton, a3);
}

- (MUBlurView)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
  objc_storeStrong((id *)&self->_closeButton, a3);
}

- (NSLayoutConstraint)closeButtonTopConstraint
{
  return self->_closeButtonTopConstraint;
}

- (void)setCloseButtonTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_closeButtonTopConstraint, a3);
}

- (NSLayoutConstraint)closeButtonTrailingConstraint
{
  return self->_closeButtonTrailingConstraint;
}

- (void)setCloseButtonTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_closeButtonTrailingConstraint, a3);
}

- (NSLayoutConstraint)closeButtonSafeAreaTrailingConstraint
{
  return self->_closeButtonSafeAreaTrailingConstraint;
}

- (void)setCloseButtonSafeAreaTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_closeButtonSafeAreaTrailingConstraint, a3);
}

- (PedestrianARRenderingView)renderingView
{
  return self->_renderingView;
}

- (void)setRenderingView:(id)a3
{
  objc_storeStrong((id *)&self->_renderingView, a3);
}

- (PedestrianARGradientOverlay)gradientOverlay
{
  return self->_gradientOverlay;
}

- (void)setGradientOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_gradientOverlay, a3);
}

- (void)setLocalizingView:(id)a3
{
  objc_storeStrong((id *)&self->_localizingView, a3);
}

- (PedestrianARInstructionContainerView)instructionContainerView
{
  return self->_instructionContainerView;
}

- (void)setInstructionContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_instructionContainerView, a3);
}

- (PedestrianARSafetyView)safetyView
{
  return self->_safetyView;
}

- (void)setSafetyView:(id)a3
{
  objc_storeStrong((id *)&self->_safetyView, a3);
}

- (PedestrianARArrowGuidanceView)arrowGuidanceView
{
  return self->_arrowGuidanceView;
}

- (void)setArrowGuidanceView:(id)a3
{
  objc_storeStrong((id *)&self->_arrowGuidanceView, a3);
}

- (NSLayoutConstraint)arrowGuidanceViewLeadingConstraint
{
  return self->_arrowGuidanceViewLeadingConstraint;
}

- (void)setArrowGuidanceViewLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_arrowGuidanceViewLeadingConstraint, a3);
}

- (NSLayoutConstraint)arrowGuidanceViewLeadingSafeAreaConstraint
{
  return self->_arrowGuidanceViewLeadingSafeAreaConstraint;
}

- (void)setArrowGuidanceViewLeadingSafeAreaConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_arrowGuidanceViewLeadingSafeAreaConstraint, a3);
}

- (NSLayoutConstraint)arrowGuidanceViewTrailingConstraint
{
  return self->_arrowGuidanceViewTrailingConstraint;
}

- (void)setArrowGuidanceViewTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_arrowGuidanceViewTrailingConstraint, a3);
}

- (NSLayoutConstraint)arrowGuidanceViewTrailingSafeAreaConstraint
{
  return self->_arrowGuidanceViewTrailingSafeAreaConstraint;
}

- (void)setArrowGuidanceViewTrailingSafeAreaConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_arrowGuidanceViewTrailingSafeAreaConstraint, a3);
}

- (PedestrianARFailureContaineeViewController)failureContainee
{
  return self->_failureContainee;
}

- (void)setFailureContainee:(id)a3
{
  objc_storeStrong((id *)&self->_failureContainee, a3);
}

- (AuxiliaryTasksManager)auxiliaryTasksManager
{
  return self->_auxiliaryTasksManager;
}

- (void)setAuxiliaryTasksManager:(id)a3
{
  objc_storeStrong((id *)&self->_auxiliaryTasksManager, a3);
}

- (NSDate)arkitSessionStartTimestamp
{
  return self->_arkitSessionStartTimestamp;
}

- (void)setArkitSessionStartTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_arkitSessionStartTimestamp, a3);
}

- (ARSession)session
{
  return self->_session;
}

- (VLFSession)vlfSession
{
  return self->_vlfSession;
}

- (void)setVlfSession:(id)a3
{
  objc_storeStrong((id *)&self->_vlfSession, a3);
}

- (BOOL)isDismissing
{
  return self->_isDismissing;
}

- (void)setIsDismissing:(BOOL)a3
{
  self->_isDismissing = a3;
}

- (BOOL)isStopping
{
  return self->_isStopping;
}

- (void)setIsStopping:(BOOL)a3
{
  self->_isStopping = a3;
}

- (BOOL)didRenderLabel
{
  return self->_didRenderLabel;
}

- (void)setDidRenderLabel:(BOOL)a3
{
  self->_didRenderLabel = a3;
}

- (BOOL)didFailUndulationLookup
{
  return self->_didFailUndulationLookup;
}

- (void)setDidFailUndulationLookup:(BOOL)a3
{
  self->_didFailUndulationLookup = a3;
}

- (BOOL)sentDisappearNotification
{
  return self->_sentDisappearNotification;
}

- (void)setSentDisappearNotification:(BOOL)a3
{
  self->_sentDisappearNotification = a3;
}

- (BOOL)shouldUpdateCameraFocusLensPosition
{
  return self->_shouldUpdateCameraFocusLensPosition;
}

- (void)setShouldUpdateCameraFocusLensPosition:(BOOL)a3
{
  self->_shouldUpdateCameraFocusLensPosition = a3;
}

- (BOOL)didShowVLTracePopup
{
  return self->_didShowVLTracePopup;
}

- (void)setDidShowVLTracePopup:(BOOL)a3
{
  self->_didShowVLTracePopup = a3;
}

- (GCDTimer)failureViewTimeoutTimer
{
  return self->_failureViewTimeoutTimer;
}

- (void)setFailureViewTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_failureViewTimeoutTimer, a3);
}

- (GCDTimer)rerouteCompletionTimer
{
  return self->_rerouteCompletionTimer;
}

- (void)setRerouteCompletionTimer:(id)a3
{
  objc_storeStrong((id *)&self->_rerouteCompletionTimer, a3);
}

- (GCDTimer)activeFeatureTimer
{
  return self->_activeFeatureTimer;
}

- (void)setActiveFeatureTimer:(id)a3
{
  objc_storeStrong((id *)&self->_activeFeatureTimer, a3);
}

- (UINotificationFeedbackGenerator)notificationGenerator
{
  return self->_notificationGenerator;
}

- (void)setNotificationGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_notificationGenerator, a3);
}

- (OS_os_activity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
  objc_storeStrong((id *)&self->_activity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_notificationGenerator, 0);
  objc_storeStrong((id *)&self->_activeFeatureTimer, 0);
  objc_storeStrong((id *)&self->_rerouteCompletionTimer, 0);
  objc_storeStrong((id *)&self->_failureViewTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_vlfSession, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_arkitSessionStartTimestamp, 0);
  objc_storeStrong((id *)&self->_auxiliaryTasksManager, 0);
  objc_storeStrong((id *)&self->_failureContainee, 0);
  objc_storeStrong((id *)&self->_arrowGuidanceViewTrailingSafeAreaConstraint, 0);
  objc_storeStrong((id *)&self->_arrowGuidanceViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_arrowGuidanceViewLeadingSafeAreaConstraint, 0);
  objc_storeStrong((id *)&self->_arrowGuidanceViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_arrowGuidanceView, 0);
  objc_storeStrong((id *)&self->_safetyView, 0);
  objc_storeStrong((id *)&self->_instructionContainerView, 0);
  objc_storeStrong((id *)&self->_localizingView, 0);
  objc_storeStrong((id *)&self->_gradientOverlay, 0);
  objc_storeStrong((id *)&self->_renderingView, 0);
  objc_storeStrong((id *)&self->_closeButtonSafeAreaTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_closeButtonTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_closeButtonTopConstraint, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_ttrButton, 0);
  objc_storeStrong((id *)&self->_navigationService, 0);
  objc_storeStrong((id *)&self->_guidanceObserver, 0);
  objc_destroyWeak((id *)&self->_platformController);
  objc_storeStrong((id *)&self->_navigationSession, 0);
  objc_destroyWeak((id *)&self->_arDelegate);
  objc_storeStrong((id *)&self->_route, 0);
}

@end
