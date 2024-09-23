@implementation PedestrianARDebugMapAnnotationsTask

- (PedestrianARDebugMapAnnotationsTask)initWithPlatformController:(id)a3 navigationService:(id)a4
{
  id v6;
  id v7;
  PedestrianARDebugMapAnnotationsTask *v8;
  id v9;
  NSObject *v10;
  void *v11;
  __CFString *v12;
  id WeakRetained;
  id v14;
  void *v15;
  GEOObserverHashTable *v16;
  GEOObserverHashTable *observers;
  NSArray *v18;
  NSArray *annotations;
  id v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  char *v25;
  id v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  char *v30;
  objc_super v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  const char *v39;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    v21 = sub_1004318FC();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v33 = "-[PedestrianARDebugMapAnnotationsTask initWithPlatformController:navigationService:]";
      v34 = 2080;
      v35 = "PedestrianARDebugMapAnnotationsTask.m";
      v36 = 1024;
      v37 = 137;
      v38 = 2080;
      v39 = "platformController != nil";
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v23 = sub_1004318FC();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v33 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (!v7)
  {
    v26 = sub_1004318FC();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v33 = "-[PedestrianARDebugMapAnnotationsTask initWithPlatformController:navigationService:]";
      v34 = 2080;
      v35 = "PedestrianARDebugMapAnnotationsTask.m";
      v36 = 1024;
      v37 = 138;
      v38 = 2080;
      v39 = "navigationService != nil";
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v28 = sub_1004318FC();
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v33 = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v31.receiver = self;
  v31.super_class = (Class)PedestrianARDebugMapAnnotationsTask;
  v8 = -[PedestrianARDebugMapAnnotationsTask init](&v31, "init");
  if (v8)
  {
    v9 = sub_10058BB28();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v33 = (const char *)v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    objc_storeWeak((id *)&v8->_platformController, v6);
    objc_storeStrong((id *)&v8->_navigationService, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v12 = PlatformControllerDidChangeChromeViewControllerNotification;
    WeakRetained = objc_loadWeakRetained((id *)&v8->_platformController);
    objc_msgSend(v11, "addObserver:selector:name:object:", v8, "platformControllerDidChangeChromeViewControllerNotification:", v12, WeakRetained);

    v14 = objc_loadWeakRetained((id *)&v8->_platformController);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "chromeViewController"));
    -[PedestrianARDebugMapAnnotationsTask setChromeViewController:](v8, "setChromeViewController:", v15);

    v16 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___VKCustomFeatureDataSourceObserver, 0);
    observers = v8->_observers;
    v8->_observers = v16;

    v18 = (NSArray *)objc_alloc_init((Class)NSArray);
    annotations = v8->_annotations;
    v8->_annotations = v18;

  }
  return v8;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  PedestrianARDebugMapAnnotationsTask *v7;

  v3 = sub_10058BB28();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)PedestrianARDebugMapAnnotationsTask;
  -[PedestrianARDebugMapAnnotationsTask dealloc](&v5, "dealloc");
}

- (VKMapView)mapView
{
  void *v3;
  void *v4;
  void *v5;

  if (-[PedestrianARDebugMapAnnotationsTask _shouldProvideDebugAnnotations](self, "_shouldProvideDebugAnnotations"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask renderingView](self, "renderingView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapViewDelegate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapView"));

  }
  else
  {
    v5 = 0;
  }
  return (VKMapView *)v5;
}

- (BOOL)isProvidingARAnnotations
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask renderingView](self, "renderingView"));
  v3 = v2 != 0;

  return v3;
}

- (void)setNavigationSession:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  int v11;
  PedestrianARDebugMapAnnotationsTask *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationSession);

  if (WeakRetained != v4)
  {
    v6 = sub_10058BB28();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = objc_loadWeakRetained((id *)&self->_navigationSession);
      v11 = 134349570;
      v12 = self;
      v13 = 2112;
      v14 = v8;
      v15 = 2112;
      v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Transitioning from navigation session (%@) to (%@)", (uint8_t *)&v11, 0x20u);

    }
    v9 = objc_loadWeakRetained((id *)&self->_navigationSession);
    objc_msgSend(v9, "removeObserver:", self);

    v10 = objc_storeWeak((id *)&self->_navigationSession, v4);
    objc_msgSend(v4, "addObserver:", self);

    if (-[PedestrianARDebugMapAnnotationsTask _shouldProvideDebugAnnotations](self, "_shouldProvideDebugAnnotations"))
      -[PedestrianARDebugMapAnnotationsTask _startProvidingARAnnotationsIfNecessary](self, "_startProvidingARAnnotationsIfNecessary");
  }

}

- (void)setChromeViewController:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  int v14;
  PedestrianARDebugMapAnnotationsTask *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  if (WeakRetained != v4)
  {
    v6 = sub_10058BB28();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = objc_loadWeakRetained((id *)&self->_chromeViewController);
      v14 = 134349570;
      v15 = self;
      v16 = 2112;
      v17 = v8;
      v18 = 2112;
      v19 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Transitioning from chrome VC (%@) to (%@)", (uint8_t *)&v14, 0x20u);

    }
    v9 = objc_loadWeakRetained((id *)&self->_chromeViewController);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_mapLayer"));
    objc_msgSend(v11, "removeCustomFeatureDataSource:", self);

    v12 = objc_loadWeakRetained((id *)&self->_chromeViewController);
    objc_msgSend(v12, "removeContextStackObserver:", self);

    v13 = objc_storeWeak((id *)&self->_chromeViewController, v4);
    objc_msgSend(v4, "addContextStackObserver:", self);

    -[PedestrianARDebugMapAnnotationsTask _stopProvidingARAnnotations](self, "_stopProvidingARAnnotations");
    if (-[PedestrianARDebugMapAnnotationsTask _shouldProvideDebugAnnotations](self, "_shouldProvideDebugAnnotations"))
      -[PedestrianARDebugMapAnnotationsTask _startProvidingARAnnotationsIfNecessary](self, "_startProvidingARAnnotationsIfNecessary");
  }

}

- (BOOL)_shouldProvideDebugAnnotations
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask chromeViewController](self, "chromeViewController"));
  v4 = objc_opt_class(IOSChromeViewController);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask iosBasedChromeViewController](self, "iosBasedChromeViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentIOSBasedContext"));
    v7 = objc_opt_class(NavModeController);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask navigationSession](self, "navigationSession"));
      if (v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask navigationSession](self, "navigationSession"));
        v10 = objc_msgSend(v9, "currentTransportType") == (id)2;

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_startProvidingARAnnotationsIfNecessary
{
  void *v3;
  id v4;
  NSObject *v5;
  const char *v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  PedestrianARDebugMapAnnotationsTask *v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  PedestrianARRenderingView *v18;
  void *v19;
  void *v20;
  PedestrianARRenderingView *v21;
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
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
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
  NSObject *v104;
  _QWORD v105[3];
  uint8_t buf[4];
  PedestrianARDebugMapAnnotationsTask *v107;
  __int16 v108;
  const char *v109;
  __int16 v110;
  int v111;

  if (-[PedestrianARDebugMapAnnotationsTask _shouldProvideDebugAnnotations](self, "_shouldProvideDebugAnnotations"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask renderingView](self, "renderingView"));

    if (v3)
    {
      v4 = sub_10058BB28();
      v5 = objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        v107 = self;
        v6 = "[%{public}p] We already have a rendering view; will not start providing AR annotations again";
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, v6, buf, 0xCu);
      }
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[MapsRadarController sharedInstance](MapsRadarController, "sharedInstance"));
      objc_msgSend(v13, "addAttachmentProvider:", self);

      v14 = sub_10058BB28();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        v107 = self;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[%{public}p] Starting to provide AR annotations now", buf, 0xCu);
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask _iOSMapView](self, "_iOSMapView"));
      objc_msgSend(v16, "addCustomFeatureDataSource:", self);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask iosBasedChromeViewController](self, "iosBasedChromeViewController"));
      v104 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "currentIOSBasedContext"));

      v18 = [PedestrianARRenderingView alloc];
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject guidanceObserver](v104, "guidanceObserver"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask navigationService](self, "navigationService"));
      v21 = -[PedestrianARRenderingView initWithGuidanceObserver:navigationService:](v18, "initWithGuidanceObserver:navigationService:", v19, v20);
      -[PedestrianARDebugMapAnnotationsTask setRenderingView:](self, "setRenderingView:", v21);

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask renderingView](self, "renderingView"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "mapViewDelegate"));
      objc_msgSend(v23, "registerObserver:", self);

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask renderingView](self, "renderingView"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "mapViewDelegate"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "mapView"));
      objc_msgSend(v26, "setARMode:", 3);

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask renderingView](self, "renderingView"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "mapViewDelegate"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "mapView"));
      objc_msgSend(v29, "setARSceneType:", 0);

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask renderingView](self, "renderingView"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "mapViewDelegate"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "mapView"));
      objc_msgSend(v32, "setRendersInBackground:", 1);

      v33 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask navigationSession](self, "navigationSession"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "currentRouteCollection"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "currentRoute"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask renderingView](self, "renderingView"));
      objc_msgSend(v36, "setRoute:", v35);

      v37 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask renderingView](self, "renderingView"));
      objc_msgSend(v37, "setShouldGenerateFeatures:", 1);

      v38 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask renderingView](self, "renderingView"));
      objc_msgSend(v38, "setShouldShowFeatures:", 1);

      v39 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask renderingView](self, "renderingView"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "mapViewDelegate"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "mapView"));
      LODWORD(v42) = 0;
      objc_msgSend(v41, "setOpacity:", v42);

      v43 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask iosBasedChromeViewController](self, "iosBasedChromeViewController"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "view"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "layer"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask renderingView](self, "renderingView"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "mapViewDelegate"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "mapView"));
      objc_msgSend(v45, "insertSublayer:atIndex:", v48, 0);

      v49 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask iosBasedChromeViewController](self, "iosBasedChromeViewController"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "view"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "window"));
      objc_msgSend(v51, "frame");
      v53 = v52;
      v55 = v54;
      v57 = v56;
      v59 = v58;
      v60 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask renderingView](self, "renderingView"));
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "mapViewDelegate"));
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "mapView"));
      objc_msgSend(v62, "setBounds:", v53, v55, v57, v59);

      v63 = objc_msgSend(objc_alloc((Class)UIButton), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      -[PedestrianARDebugMapAnnotationsTask setDebugWarningBannerButton:](self, "setDebugWarningBannerButton:", v63);

      v64 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask debugWarningBannerButton](self, "debugWarningBannerButton"));
      objc_msgSend(v64, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      v65 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask debugWarningBannerButton](self, "debugWarningBannerButton"));
      v66 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", &stru_1011BBD38));
      objc_msgSend(v65, "addAction:forControlEvents:", v66, 64);

      v67 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "colorWithAlphaComponent:", 0.600000024));
      v69 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask debugWarningBannerButton](self, "debugWarningBannerButton"));
      objc_msgSend(v69, "setBackgroundColor:", v68);

      v70 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask debugWarningBannerButton](self, "debugWarningBannerButton"));
      objc_msgSend(v70, "setTitle:forState:", CFSTR("AR nav label simulation active. Tap to file radars."), 0);

      v71 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask debugWarningBannerButton](self, "debugWarningBannerButton"));
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "titleLabel"));
      objc_msgSend(v72, "setAdjustsFontSizeToFitWidth:", 1);

      v73 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask debugWarningBannerButton](self, "debugWarningBannerButton"));
      v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "titleLabel"));
      objc_msgSend(v74, "setMinimumScaleFactor:", 0.0);

      v75 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
      v76 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask debugWarningBannerButton](self, "debugWarningBannerButton"));
      v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "titleLabel"));
      objc_msgSend(v77, "setTextColor:", v75);

      v78 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask debugWarningBannerButton](self, "debugWarningBannerButton"));
      v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "layer"));
      objc_msgSend(v79, "setZPosition:", 3.40282347e38);

      v80 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask iosBasedChromeViewController](self, "iosBasedChromeViewController"));
      v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "view"));
      v82 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask debugWarningBannerButton](self, "debugWarningBannerButton"));
      objc_msgSend(v81, "addSubview:", v82);

      v103 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask debugWarningBannerButton](self, "debugWarningBannerButton"));
      v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "leadingAnchor"));
      v102 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask iosBasedChromeViewController](self, "iosBasedChromeViewController"));
      v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "view"));
      v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "leadingAnchor"));
      v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "constraintEqualToAnchor:", v99));
      v105[0] = v98;
      v97 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask debugWarningBannerButton](self, "debugWarningBannerButton"));
      v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "trailingAnchor"));
      v96 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask iosBasedChromeViewController](self, "iosBasedChromeViewController"));
      v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "view"));
      v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "trailingAnchor"));
      v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "constraintEqualToAnchor:", v93));
      v105[1] = v83;
      v84 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask debugWarningBannerButton](self, "debugWarningBannerButton"));
      v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "topAnchor"));
      v86 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask iosBasedChromeViewController](self, "iosBasedChromeViewController"));
      v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "view"));
      v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "safeAreaLayoutGuide"));
      v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "topAnchor"));
      v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "constraintEqualToAnchor:", v89));
      v105[2] = v90;
      v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v105, 3));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v91);

      v92 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask observers](self, "observers"));
      objc_msgSend(v92, "globalFeaturesDidChangeForDataSource:", self);

      v5 = v104;
    }
  }
  else
  {
    v7 = sub_1004318FC();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v107 = (PedestrianARDebugMapAnnotationsTask *)"-[PedestrianARDebugMapAnnotationsTask _startProvidingARAnnotationsIfNecessary]";
      v108 = 2080;
      v109 = "PedestrianARDebugMapAnnotationsTask.m";
      v110 = 1024;
      v111 = 224;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
    }

    if (sub_100A70734())
    {
      v9 = sub_1004318FC();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = (PedestrianARDebugMapAnnotationsTask *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v107 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
    v12 = sub_10058BB28();
    v5 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v107 = self;
      v6 = "[%{public}p] Cannot provide AR annotations";
      goto LABEL_13;
    }
  }

}

- (void)_stopProvidingARAnnotations
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  PedestrianARDebugMapAnnotationsTask *v11;

  v3 = sub_10058BB28();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v10 = 134349056;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Stop providing AR annotations", (uint8_t *)&v10, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsRadarController sharedInstance](MapsRadarController, "sharedInstance"));
  objc_msgSend(v5, "removeAttachmentProvider:", self);

  -[PedestrianARDebugMapAnnotationsTask setRenderingView:](self, "setRenderingView:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask debugWarningBannerButton](self, "debugWarningBannerButton"));
  objc_msgSend(v6, "removeFromSuperview");

  -[PedestrianARDebugMapAnnotationsTask setDebugWarningBannerButton:](self, "setDebugWarningBannerButton:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask _iOSMapView](self, "_iOSMapView"));
  objc_msgSend(v7, "removeCustomFeatureDataSource:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routeContext"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "routeInfo"));
  objc_msgSend(v9, "setDebugAnnotations:", 0);

}

- (id)_iOSMapView
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask iosBasedChromeViewController](self, "iosBasedChromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mapView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_mapLayer"));

  return v4;
}

- (void)_updateDebugRouteAnnotations
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  uint64_t v17;
  char v18;
  void *v19;
  float v20;
  float v21;
  const __CFString *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  unsigned int v33;
  const __CFString *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  unsigned int v43;
  id v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  double v53;
  double v54;
  id v55;
  id v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;

  if (-[PedestrianARDebugMapAnnotationsTask _shouldProvideDebugAnnotations](self, "_shouldProvideDebugAnnotations"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask annotations](self, "annotations"));
    v4 = sub_10039E1FC(v3, &stru_1011BBD78);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

    if (!v5)
    {
LABEL_38:

      return;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask renderingView](self, "renderingView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapViewDelegate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "labelMarker"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "arWalkingFeature"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "guidanceInfoForFeature:", v9));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "labelMarker"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "arWalkingFeature"));
    v13 = objc_opt_class(VKARWalkingArrivalFeature);
    isKindOfClass = objc_opt_isKindOfClass(v12, v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "labelMarker"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "arWalkingFeature"));
    v17 = objc_opt_class(VKARWalkingContinueFeature);
    v18 = objc_opt_isKindOfClass(v16, v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "labelMarker"));
    objc_msgSend(v19, "facingDirection");
    v21 = v20;

    v22 = CFSTR("N");
    if (v21 < 337.5 && v21 >= 22.5)
    {
      if (v21 >= 67.5)
      {
        if (v21 >= 112.5)
        {
          if (v21 >= 157.5)
          {
            if (v21 >= 202.5)
            {
              if (v21 >= 247.5)
              {
                if (v21 >= 292.5 || v21 < 247.5)
                  v22 = CFSTR("NW");
                else
                  v22 = CFSTR("W");
              }
              else
              {
                v22 = CFSTR("SW");
              }
            }
            else
            {
              v22 = CFSTR("S");
            }
          }
          else
          {
            v22 = CFSTR("SE");
          }
        }
        else
        {
          v22 = CFSTR("E");
        }
      }
      else
      {
        v22 = CFSTR("NE");
      }
    }
    v60 = v10;
    if ((isKindOfClass & 1) != 0)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask renderingView](self, "renderingView"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "route"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "legs"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "lastObject"));

      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "destinationDisplayInfo"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "arInfo"));

      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "storefrontFaceGeometrys"));
      v31 = objc_msgSend(v30, "count");

      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v33 = objc_msgSend(v32, "BOOLForKey:", CFSTR("PedestrianARInjectFakeStorefrontArrivalDataKey"));

      v34 = CFSTR("Non-AARL");
      if (v33)
        v34 = CFSTR("Fake-AARL");
      if (v31)
        v35 = CFSTR("AARL");
      else
        v35 = v34;
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "arrowLabel"));

      if (v36)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "arrowLabel"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\n%@"), v35, v37));

      }
      else
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v35));
      }

    }
    else
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "arrowLabel"));

      if ((v18 & 1) != 0)
        v40 = CFSTR("CARL");
      else
        v40 = CFSTR("MARL");
      if (!v39)
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - %@"), v40, v22));
        goto LABEL_37;
      }
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "arrowLabel"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - %@\n%@"), v40, v22, v27));
    }

LABEL_37:
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "labelMarker"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "arWalkingFeature"));
    v43 = objc_msgSend(v5, "isOccluded");
    v44 = v42;
    v45 = objc_alloc((Class)GEOFeatureStyleAttributes);
    v46 = objc_msgSend(v44, "type");

    v47 = objc_msgSend(v45, "initWithAttributes:", 65632, v46, 150, 1, 65594, v43, 0);
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask _iOSMapView](self, "_iOSMapView"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "routeContext"));

    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "routeInfo"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "route"));

    v52 = objc_msgSend(objc_alloc((Class)GEORouteMatcher), "initWithRoute:auditToken:", v51, 0);
    objc_msgSend(v5, "coordinate");
    v54 = v53;
    objc_msgSend(v5, "coordinate");
    v55 = objc_msgSend(v52, "closestRouteCoordinateForLocationCoordinate:", v54);
    v56 = objc_msgSend(objc_alloc((Class)VKRouteEtaDescription), "initWithEtaText:etaAdvisoryFeatureStyleAttributes:routeEtaType:", v38, v47, 6);
    v57 = objc_msgSend(objc_alloc((Class)VKRouteRangeAnnotationInfo), "initWithEtaDescription:start:end:", v56, v55, v55);
    v61 = v57;
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v61, 1));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "routeInfo"));
    objc_msgSend(v59, "setDebugAnnotations:", v58);

    goto LABEL_38;
  }
}

- (void)navigationSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4
{
  id v5;
  NSObject *v6;
  int v7;
  PedestrianARDebugMapAnnotationsTask *v8;

  if (a4 != 2)
  {
    v5 = sub_10058BB28();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 134349056;
      v8 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Navigation changed transport type to non-walking", (uint8_t *)&v7, 0xCu);
    }

    -[PedestrianARDebugMapAnnotationsTask _stopProvidingARAnnotations](self, "_stopProvidingARAnnotations");
  }
}

- (void)navigationSession:(id)a3 didUpdateRouteCollection:(id)a4
{
  id v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  PedestrianARDebugMapAnnotationsTask *v11;

  v5 = a4;
  -[PedestrianARDebugMapAnnotationsTask _stopProvidingARAnnotations](self, "_stopProvidingARAnnotations");
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentRoute"));

  if (objc_msgSend(v9, "transportType") == 2)
  {
    v6 = -[PedestrianARDebugMapAnnotationsTask _shouldProvideDebugAnnotations](self, "_shouldProvideDebugAnnotations");

    if (v6)
    {
      v7 = sub_10058BB28();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        v11 = self;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Navigation re-routed and the new route's transport type is walking", buf, 0xCu);
      }

      -[PedestrianARDebugMapAnnotationsTask _startProvidingARAnnotationsIfNecessary](self, "_startProvidingARAnnotationsIfNecessary");
    }
  }
  else
  {

  }
}

- (id)globalAnnotations
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  PedestrianARCustomFeatureAnnotation *v24;
  id v25;
  NSObject *v26;
  void *v27;
  id v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned int v34;
  id v35;
  id v36;
  id v37;
  id v38;
  PedestrianARDebugMapAnnotationsTask *v39;
  id v40;
  PedestrianARDebugMapAnnotationsTask *v42;
  void *v43;
  id obj;
  _QWORD v45[5];
  BOOL v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  PedestrianARDebugMapAnnotationsTask *v52;
  __int16 v53;
  void *v54;
  _BYTE v55[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask renderingView](self, "renderingView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapViewDelegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "labelMarkers"));

  obj = v7;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v48;
    v42 = self;
    v43 = v3;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v48 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v12, "isARWalkingFeature"))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "arWalkingFeature"));

          if (v13)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "arWalkingFeature"));
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask renderingView](self, "renderingView"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mapViewDelegate"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "currentFeature"));

            if (v14 == v17)
            {
              v19 = objc_msgSend(v12, "featureLabelIdentifier");
              v20 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask renderingView](self, "renderingView"));
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "mapViewDelegate"));
              v18 = v19 == objc_msgSend(v21, "currentIdentifier");

            }
            else
            {
              v18 = 0;
            }
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask annotations](self, "annotations"));
            v45[0] = _NSConcreteStackBlock;
            v45[1] = 3221225472;
            v45[2] = sub_10058D8E4;
            v45[3] = &unk_1011BBDA0;
            v45[4] = v12;
            v46 = v18;
            v23 = sub_10039E1FC(v22, v45);
            v24 = (PedestrianARCustomFeatureAnnotation *)objc_claimAutoreleasedReturnValue(v23);

            if (v24)
            {
              v25 = sub_10058BB28();
              v26 = objc_claimAutoreleasedReturnValue(v25);
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                v27 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARCustomFeatureAnnotation debugDescription](v24, "debugDescription"));
                *(_DWORD *)buf = 134349314;
                v52 = self;
                v53 = 2112;
                v54 = v27;
                _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "[%{public}p] Found cached annotation: %@", buf, 0x16u);

              }
            }
            else
            {
              v28 = objc_alloc((Class)VKCustomFeature);
              objc_msgSend(v12, "coordinate3D");
              v26 = objc_msgSend(v28, "initWithCoordinate3D:");
              -[NSObject setDataSource:](v26, "setDataSource:", self);
              v24 = -[PedestrianARCustomFeatureAnnotation initWithCustomFeature:labelMarker:isActive:]([PedestrianARCustomFeatureAnnotation alloc], "initWithCustomFeature:labelMarker:isActive:", v26, v12, v18);
              v29 = sub_10058BB28();
              v30 = objc_claimAutoreleasedReturnValue(v29);
              if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
              {
                v31 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARCustomFeatureAnnotation debugDescription](v24, "debugDescription"));
                *(_DWORD *)buf = 134349314;
                v52 = self;
                v53 = 2112;
                v54 = v31;
                _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "[%{public}p] Annotation was not present in cache; created a new one: %@",
                  buf,
                  0x16u);

              }
            }

            v32 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARCustomFeatureAnnotation feature](v24, "feature"));
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "arWalkingFeature"));
            v34 = objc_msgSend(v12, "isOccluded");
            v35 = v33;
            v36 = objc_alloc((Class)GEOFeatureStyleAttributes);
            v37 = objc_msgSend(v35, "type");

            v38 = objc_msgSend(v36, "initWithAttributes:", 5, 3, 65632, v37, 65538, v18, 150, 1, 65594, v34, 0);
            objc_msgSend(v32, "setStyleAttributes:", v38);
            v3 = v43;
            objc_msgSend(v43, "addObject:", v24);

            self = v42;
          }
        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    }
    while (v9);
  }

  v39 = self;
  v40 = objc_msgSend(v3, "copy");
  -[PedestrianARDebugMapAnnotationsTask setAnnotations:](v39, "setAnnotations:", v40);

  -[PedestrianARDebugMapAnnotationsTask _updateDebugRouteAnnotations](v39, "_updateDebugRouteAnnotations");
  return v3;
}

- (id)annotationsInMapRect:(id)a3
{
  return &__NSArray0__struct;
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask observers](self, "observers"));
  objc_msgSend(v5, "registerObserver:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask observers](self, "observers"));
  objc_msgSend(v5, "unregisterObserver:", v4);

}

- (id)clusterStyleAttributes
{
  return 0;
}

- (BOOL)isClusteringEnabled
{
  return 0;
}

- (unsigned)sceneID
{
  return 0;
}

- (unsigned)sceneState
{
  return 1;
}

- (void)featureSetStateDidChange:(id)a3 previous:(int64_t)a4 current:(int64_t)a5
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask renderingView](self, "renderingView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapViewDelegate"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentFeatureSet"));

  if (v8 == v10)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask observers](self, "observers"));
    objc_msgSend(v9, "globalFeaturesDidChangeForDataSource:", self);

  }
  else
  {
    objc_msgSend(v10, "removeObserver:", self);
  }

}

- (void)mapLayer:(id)a3 updatedFeatures:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  PedestrianARDebugMapAnnotationsTask *v13;
  __int16 v14;
  id v15;

  v5 = a4;
  v6 = sub_10058BB28();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v12 = 134349314;
    v13 = self;
    v14 = 2112;
    v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] VKMapView updated features: %@", (uint8_t *)&v12, 0x16u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask renderingView](self, "renderingView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapViewDelegate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentFeatureSet"));
  objc_msgSend(v10, "addObserver:", self);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask observers](self, "observers"));
  objc_msgSend(v11, "globalFeaturesDidChangeForDataSource:", self);

}

- (void)mapLayer:(id)a3 activeARWalkingFeatureDidUpdate:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  PedestrianARDebugMapAnnotationsTask *v13;
  __int16 v14;
  id v15;

  v5 = a4;
  v6 = sub_10058BB28();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v12 = 134349314;
    v13 = self;
    v14 = 2112;
    v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] VKMapView updated the active feature: %@", (uint8_t *)&v12, 0x16u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask renderingView](self, "renderingView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapViewDelegate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentFeatureSet"));
  objc_msgSend(v10, "addObserver:", self);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask observers](self, "observers"));
  objc_msgSend(v11, "globalFeaturesDidChangeForDataSource:", self);

}

- (void)mapLayer:(id)a3 failedElevationRequestWithReason:(int64_t)a4
{
  id v6;
  NSObject *v7;
  MapsRadarDraft *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  PedestrianARDebugMapAnnotationsTask *v13;
  PedestrianARDebugMapAnnotationsTask *v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  PedestrianARDebugMapAnnotationsTask *v24;
  __int16 v25;
  int64_t v26;

  v6 = sub_10058BB28();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349312;
    v24 = self;
    v25 = 2048;
    v26 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] An elevation request failed with reason: %ld", buf, 0x16u);
  }

  if (!-[PedestrianARDebugMapAnnotationsTask didShowUndulationFailureAlert](self, "didShowUndulationFailureAlert"))
  {
    -[PedestrianARDebugMapAnnotationsTask setDidShowUndulationFailureAlert:](self, "setDidShowUndulationFailureAlert:", 1);
    v8 = objc_opt_new(MapsRadarDraft);
    -[MapsRadarDraft setTitle:](v8, "setTitle:", CFSTR("[AR Nav Label Simulator] Elevation lookup failure"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("AR walking elevation request failed with reason: %ld"), a4));
    -[MapsRadarDraft setDescriptionText:](v8, "setDescriptionText:", v9);

    -[MapsRadarDraft setClassification:](v8, "setClassification:", 6);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MapsRadarComponent mapsAppNavUIWalkingComponent](MapsRadarComponent, "mapsAppNavUIWalkingComponent"));
    -[MapsRadarDraft setComponent:](v8, "setComponent:", v10);

    v11 = sub_10058BB28();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
LABEL_14:

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[MapsRadarController sharedInstance](MapsRadarController, "sharedInstance"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask chromeViewController](self, "chromeViewController"));
      objc_msgSend(v21, "launchTTRWithRadar:promptTitle:fromViewController:", v8, CFSTR("There has been an error in looking up the elevation of an AR label. Please file a radar."), v22);

      return;
    }
    v13 = self;
    v14 = v13;
    if (!v13)
    {
      v20 = CFSTR("<nil>");
      goto LABEL_13;
    }
    v15 = (objc_class *)objc_opt_class(v13);
    v16 = NSStringFromClass(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    if ((objc_opt_respondsToSelector(v14, "accessibilityIdentifier") & 1) != 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask performSelector:](v14, "performSelector:", "accessibilityIdentifier"));
      v19 = v18;
      if (v18 && !objc_msgSend(v18, "isEqualToString:", v17))
      {
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v17, v14, v19));

        goto LABEL_11;
      }

    }
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v17, v14));
LABEL_11:

LABEL_13:
    *(_DWORD *)buf = 138543362;
    v24 = (PedestrianARDebugMapAnnotationsTask *)v20;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Launching TTR for elevation request failure", buf, 0xCu);

    goto LABEL_14;
  }
}

- (void)chromeViewController:(id)a3 didMoveFromContextStack:(id)a4 toContextStack:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  PedestrianARDebugMapAnnotationsTask *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;

  v7 = a4;
  v8 = a5;
  v9 = sub_10058BB28();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = 134349570;
    v12 = self;
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}p] Chrome VC moved from stack: %@ to stack: %@", (uint8_t *)&v11, 0x20u);
  }

  -[PedestrianARDebugMapAnnotationsTask _stopProvidingARAnnotations](self, "_stopProvidingARAnnotations");
  if (-[PedestrianARDebugMapAnnotationsTask _shouldProvideDebugAnnotations](self, "_shouldProvideDebugAnnotations"))
    -[PedestrianARDebugMapAnnotationsTask _startProvidingARAnnotationsIfNecessary](self, "_startProvidingARAnnotationsIfNecessary");

}

+ (int64_t)creationPreference
{
  return 2;
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v9 = a5;
  v6 = objc_opt_class(NavigationSession);
  if ((objc_opt_isKindOfClass(v9, v6) & 1) != 0)
    v7 = v9;
  else
    v7 = 0;
  v8 = v7;
  -[PedestrianARDebugMapAnnotationsTask setNavigationSession:](self, "setNavigationSession:", v8);

}

- (void)platformControllerDidChangeChromeViewControllerNotification:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[PedestrianARDebugMapAnnotationsTask platformController](self, "platformController", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "chromeViewController"));
  -[PedestrianARDebugMapAnnotationsTask setChromeViewController:](self, "setChromeViewController:", v4);

}

- (void)generateAttachmentsForRadarDraft:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10058E2A8;
  block[3] = &unk_1011AECC0;
  block[4] = self;
  v8 = a3;
  v9 = a4;
  v5 = v9;
  v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (PlatformController)platformController
{
  return (PlatformController *)objc_loadWeakRetained((id *)&self->_platformController);
}

- (void)setPlatformController:(id)a3
{
  objc_storeWeak((id *)&self->_platformController, a3);
}

- (MNNavigationService)navigationService
{
  return self->_navigationService;
}

- (void)setNavigationService:(id)a3
{
  objc_storeStrong((id *)&self->_navigationService, a3);
}

- (NavigationSession)navigationSession
{
  return (NavigationSession *)objc_loadWeakRetained((id *)&self->_navigationSession);
}

- (ChromeViewController)chromeViewController
{
  return (ChromeViewController *)objc_loadWeakRetained((id *)&self->_chromeViewController);
}

- (PedestrianARRenderingView)renderingView
{
  return self->_renderingView;
}

- (void)setRenderingView:(id)a3
{
  objc_storeStrong((id *)&self->_renderingView, a3);
}

- (UIButton)debugWarningBannerButton
{
  return self->_debugWarningBannerButton;
}

- (void)setDebugWarningBannerButton:(id)a3
{
  objc_storeStrong((id *)&self->_debugWarningBannerButton, a3);
}

- (BOOL)didShowUndulationFailureAlert
{
  return self->_didShowUndulationFailureAlert;
}

- (void)setDidShowUndulationFailureAlert:(BOOL)a3
{
  self->_didShowUndulationFailureAlert = a3;
}

- (GEOObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (NSArray)annotations
{
  return self->_annotations;
}

- (void)setAnnotations:(id)a3
{
  objc_storeStrong((id *)&self->_annotations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_debugWarningBannerButton, 0);
  objc_storeStrong((id *)&self->_renderingView, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_destroyWeak((id *)&self->_navigationSession);
  objc_storeStrong((id *)&self->_navigationService, 0);
  objc_destroyWeak((id *)&self->_platformController);
}

@end
