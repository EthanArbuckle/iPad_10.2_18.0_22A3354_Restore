@implementation VLFSessionTask

- (VLFSessionTask)initWithPlatformController:(id)a3
{
  id v4;
  VLFSessionTask *v5;
  VLFSessionTask *v6;
  VLFSessionAnalyticsTracker *v7;
  VLFSessionAnalyticsTracker *analyticsTracker;
  VLFSessionStateManager *v9;
  id WeakRetained;
  VLFSessionStateManager *v11;
  VLFSessionStateManager *stateManager;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  char *v22;
  objc_super v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;

  v4 = a3;
  if (!v4)
  {
    v18 = sub_1004318FC();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v25 = "-[VLFSessionTask initWithPlatformController:]";
      v26 = 2080;
      v27 = "VLFSessionTask.m";
      v28 = 1024;
      v29 = 97;
      v30 = 2080;
      v31 = "platformController != nil";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v20 = sub_1004318FC();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v25 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)VLFSessionTask;
  v5 = -[VLFSessionTask init](&v23, "init");
  v6 = v5;
  if (v5)
  {
    v5->_canShowVLFPuckUI = 1;
    objc_storeWeak((id *)&v5->_platformController, v4);
    v7 = objc_alloc_init(VLFSessionAnalyticsTracker);
    analyticsTracker = v6->_analyticsTracker;
    v6->_analyticsTracker = v7;

    v9 = [VLFSessionStateManager alloc];
    WeakRetained = objc_loadWeakRetained((id *)&v6->_platformController);
    v11 = -[VLFSessionStateManager initWithPlatformController:](v9, "initWithPlatformController:", WeakRetained);
    stateManager = v6->_stateManager;
    v6->_stateManager = v11;

    -[VLFSessionStateManager addObserver:](v6->_stateManager, "addObserver:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    objc_msgSend(v13, "setFusionInfoEnabled:", 1);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v14, "addObserver:selector:name:object:", v6, "vlfSessionDidStartNotification:", CFSTR("VLFSessionDidStartNotification"), 0);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v15, "addObserver:selector:name:object:", v6, "vlfContaineeViewControllerDidAppearNotification:", off_1014BB958, 0);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v16, "addObserver:selector:name:object:", v6, "vlfContaineeViewControllerWillCancelNotification:", off_1014BB970, 0);

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[VLFSessionStateManager removeObserver:](self->_stateManager, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)VLFSessionTask;
  -[VLFSessionTask dealloc](&v3, "dealloc");
}

+ (int64_t)creationPreference
{
  return 2;
}

+ (BOOL)isVLFModeSupported
{
  _BOOL4 v2;

  v2 = sub_1003A5954();
  if (v2)
  {
    if (qword_1014D20C8 != -1)
      dispatch_once(&qword_1014D20C8, &stru_1011B1170);
    LOBYTE(v2) = byte_1014D20C0 != 0;
  }
  return v2;
}

- (void)showVLFUI
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  char *v8;
  _BOOL4 v9;
  _BOOL4 v10;
  char *v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  char *v16;
  id v17;
  NSObject *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  NSObject *v42;
  id v43;
  NSObject *v44;
  char *v45;
  id v46;
  id v47;
  NSObject *v48;
  id v49;
  NSObject *v50;
  char *v51;
  int v52;
  const char *v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  int v57;
  __int16 v58;
  const char *v59;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionTask platformController](self, "platformController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentSession"));

  v5 = objc_opt_class(NavigationSession);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    v6 = v4;
  else
    v6 = 0;
  v7 = v6;

  if (!v7)
  {
    v9 = 0;
    v10 = 0;
LABEL_16:
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionTask platformController](self, "platformController"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "chromeViewController"));

    v22 = objc_opt_class(IOSBasedChromeViewController);
    if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0)
      v23 = v21;
    else
      v23 = 0;
    v18 = v23;

    if (!v18)
    {
      v41 = sub_1004318FC();
      v42 = objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        v52 = 136315906;
        v53 = "-[VLFSessionTask showVLFUI]";
        v54 = 2080;
        v55 = "VLFSessionTask.m";
        v56 = 1024;
        v57 = 173;
        v58 = 2080;
        v59 = "chromeVC != nil";
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v52, 0x26u);
      }

      if (sub_100A70734())
      {
        v43 = sub_1004318FC();
        v44 = objc_claimAutoreleasedReturnValue(v43);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          v45 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v52 = 138412290;
          v53 = v45;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v52, 0xCu);

        }
      }
      v46 = sub_1003022F8();
      v32 = objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v52) = 0;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "chromeVC was not an IOSBased one; ignoring",
          (uint8_t *)&v52,
          2u);
      }
      goto LABEL_36;
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionTask originalUserState](self, "originalUserState"));

    if (!v24)
      -[VLFSessionTask saveUserState](self, "saveUserState");
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionTask originalMapState](self, "originalMapState"));

    if (!v25)
      -[VLFSessionTask saveMapState](self, "saveMapState");
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v26, "postNotificationName:object:", CFSTR("VLFSessionTaskWillShowVLFUINotification"), 0);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject mapView](v18, "mapView"));
    v28 = objc_msgSend(v27, "userTrackingMode");

    if (v28 == (id)2)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject mapView](v18, "mapView"));
      objc_msgSend(v29, "setUserTrackingMode:animated:", 1, 0);

    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject mapView](v18, "mapView"));
    objc_msgSend(v30, "setUserTrackingMode:animated:", 0, 0);

    v31 = objc_claimAutoreleasedReturnValue(-[NSObject appCoordinator](v18, "appCoordinator"));
    v32 = v31;
    if (v10)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject navModeController](v31, "navModeController"));
    }
    else if (v9)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject stepModeController](v31, "stepModeController"));
      if (!v33)
      {
        v34 = objc_claimAutoreleasedReturnValue(-[NSObject transitNavigationContext](v32, "transitNavigationContext"));
        if (v34)
        {
          v35 = (void *)v34;
        }
        else
        {
          v47 = sub_1004318FC();
          v48 = objc_claimAutoreleasedReturnValue(v47);
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            v52 = 136315906;
            v53 = "-[VLFSessionTask showVLFUI]";
            v54 = 2080;
            v55 = "VLFSessionTask.m";
            v56 = 1024;
            v57 = 204;
            v58 = 2080;
            v59 = "transitNavigationContext != nil";
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v52, 0x26u);
          }

          if (sub_100A70734())
          {
            v49 = sub_1004318FC();
            v50 = objc_claimAutoreleasedReturnValue(v49);
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            {
              v51 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
              v52 = 138412290;
              v53 = v51;
              _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v52, 0xCu);

            }
          }
          v35 = 0;
        }
        v36 = 0;
        goto LABEL_35;
      }
    }
    else
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject baseModeController](v31, "baseModeController"));
    }
    v36 = v33;
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "actionCoordinator"));
LABEL_35:
    objc_msgSend(v35, "showVLF");

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionTask platformController](self, "platformController"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "auxiliaryTasksManager"));
    v39 = objc_msgSend(v38, "auxilaryTaskForClass:", objc_opt_class(NavigationStateMonitoringTask));
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);

    objc_msgSend(v40, "cancelNavigationAutoLaunchIfNeccessary");
LABEL_36:

    goto LABEL_37;
  }
  v8 = (char *)objc_msgSend(v7, "currentTransportType");
  v9 = v8 != (char *)2;
  v10 = v8 == (char *)2;
  if ((unint64_t)(v8 - 4) > 0xFFFFFFFFFFFFFFFDLL)
    goto LABEL_16;
  v11 = v8;
  v12 = sub_1004318FC();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v52 = 136315650;
    v53 = "-[VLFSessionTask showVLFUI]";
    v54 = 2080;
    v55 = "VLFSessionTask.m";
    v56 = 1024;
    v57 = 166;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v52, 0x1Cu);
  }

  if (sub_100A70734())
  {
    v14 = sub_1004318FC();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      v52 = 138412290;
      v53 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v52, 0xCu);

    }
  }
  v17 = sub_1003022F8();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    if ((unint64_t)(v11 - 1) > 4)
      v19 = CFSTR("Undefined");
    else
      v19 = off_1011B1218[(_QWORD)(v11 - 1)];
    v52 = 138412290;
    v53 = (const char *)v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Invalid transport type for VLF during navigation: %@", (uint8_t *)&v52, 0xCu);
  }
LABEL_37:

}

- (void)setNavigationSession:(id)a3
{
  NavigationSession *v5;
  NavigationSession *navigationSession;
  NavigationSession *v7;

  v5 = (NavigationSession *)a3;
  navigationSession = self->_navigationSession;
  if (navigationSession != v5)
  {
    v7 = v5;
    -[NavigationSession removeObserver:](navigationSession, "removeObserver:", self);
    objc_storeStrong((id *)&self->_navigationSession, a3);
    -[NavigationSession addObserver:](self->_navigationSession, "addObserver:", self);
    v5 = v7;
  }

}

- (void)setCanShowVLFPuckUI:(BOOL)a3
{
  id v4;
  NSObject *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  int v9;
  __CFString *v10;

  if (self->_canShowVLFPuckUI != a3)
  {
    self->_canShowVLFPuckUI = a3;
    v4 = sub_1003022F8();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      if (self->_canShowVLFPuckUI)
        v6 = CFSTR("YES");
      else
        v6 = CFSTR("NO");
      v7 = v6;
      v9 = 138412290;
      v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Can show VLF puck UI: %@", (uint8_t *)&v9, 0xCu);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionTask stateManager](self, "stateManager"));
    -[VLFSessionTask updateVLFPuckUIForState:](self, "updateVLFPuckUIForState:", objc_msgSend(v8, "currentState"));

  }
}

- (void)updateVLFPuckUIForState:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint8_t v13[16];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionTask platformController](self, "platformController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "chromeViewController"));

  v7 = objc_opt_class(IOSBasedChromeViewController);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;

  if (!v9)
  {
    v11 = sub_1003022F8();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "chromeVC was not an IOSBased one; ignoring",
        v13,
        2u);
    }
    goto LABEL_12;
  }
  if (!-[VLFSessionTask canShowVLFPuckUI](self, "canShowVLFPuckUI"))
  {
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userLocationView"));
    -[NSObject setVlfMode:](v12, "setVlfMode:", 0);
LABEL_12:

    goto LABEL_13;
  }
  if (a3 != 2)
    a3 = a3 == 1;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userLocationView"));
  objc_msgSend(v10, "setVlfMode:", a3);

LABEL_13:
}

- (void)saveUserState
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  VLFSessionTaskUserState *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  id v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  id v30;
  NSObject *v31;
  id v32;
  NSObject *v33;
  void *v34;
  id v35;
  __int128 v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  uint8_t v40[4];
  id v41;
  uint8_t buf[24];
  int v43;
  __int16 v44;
  const char *v45;

  v3 = sub_1003022F8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Saving user state", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionTask platformController](self, "platformController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "chromeViewController"));

  v7 = objc_opt_class(IOSBasedChromeViewController);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    v10 = objc_opt_new(VLFSessionTaskUserState);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "camera"));
    objc_msgSend(v12, "centerCoordinateDistance");
    -[VLFSessionTaskUserState setOriginalCenterCoordinateDistance:](v10, "setOriginalCenterCoordinateDistance:");

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapView"));
    -[VLFSessionTaskUserState setOriginalUserTrackingMode:](v10, "setOriginalUserTrackingMode:", objc_msgSend(v13, "userTrackingMode"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapView"));
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "_userTrackingBehavior");
    }
    else
    {
      v38 = 0uLL;
      v39 = 0;
    }
    v36 = v38;
    v37 = v39;
    -[VLFSessionTaskUserState setOriginalUserTrackingBehavior:](v10, "setOriginalUserTrackingBehavior:", &v36);

    -[VLFSessionTask setOriginalUserState:](self, "setOriginalUserState:", v10);
    memset(buf, 0, sizeof(buf));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionTask originalUserState](self, "originalUserState"));
    v17 = v16;
    if (v16)
      objc_msgSend(v16, "originalUserTrackingBehavior");
    else
      memset(buf, 0, sizeof(buf));

    v18 = sub_1003022F8();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionTask originalUserState](self, "originalUserState"));
      objc_msgSend(v20, "originalCenterCoordinateDistance");
      *(_DWORD *)v40 = 134217984;
      v41 = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Original center coordinate distance: %f", v40, 0xCu);

    }
    v22 = sub_1003022F8();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionTask originalUserState](self, "originalUserState"));
      v25 = objc_msgSend(v24, "originalUserTrackingMode");
      *(_DWORD *)v40 = 134217984;
      v41 = v25;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Original tracking mode: %ld", v40, 0xCu);

    }
    v26 = sub_1003022F8();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      v28 = VKStringForAnnotationTrackingBehavior(buf);
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      *(_DWORD *)v40 = 138412290;
      v41 = v29;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "Original tracking behavior: %@", v40, 0xCu);

    }
  }
  else
  {
    v30 = sub_1004318FC();
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[VLFSessionTask saveUserState]";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "VLFSessionTask.m";
      *(_WORD *)&buf[22] = 1024;
      v43 = 261;
      v44 = 2080;
      v45 = "chromeVC != nil";
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v32 = sub_1004318FC();
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v34;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
    v35 = sub_1003022F8();
    v27 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "chromeVC was not an IOSBased one; ignoring",
        buf,
        2u);
    }
  }

}

- (void)clearUserState
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_1003022F8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Clearing user state", v5, 2u);
  }

  -[VLFSessionTask setOriginalUserState:](self, "setOriginalUserState:", 0);
}

- (void)saveMapState
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  VLFSessionTaskMapState *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  unsigned int v18;
  __CFString *v19;
  __CFString *v20;
  id v21;
  NSObject *v22;
  void *v23;
  unsigned int v24;
  __CFString *v25;
  __CFString *v26;
  id v27;
  NSObject *v28;
  void *v29;
  unsigned int v30;
  __CFString *v31;
  __CFString *v32;
  id v33;
  NSObject *v34;
  void *v35;
  unsigned int v36;
  __CFString *v37;
  __CFString *v38;
  id v39;
  NSObject *v40;
  id v41;
  NSObject *v42;
  char *v43;
  id v44;
  int v45;
  const char *v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  const char *v52;

  v3 = sub_1003022F8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v45) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Saving map state", (uint8_t *)&v45, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionTask platformController](self, "platformController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "chromeViewController"));

  v7 = objc_opt_class(IOSBasedChromeViewController);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    v10 = objc_opt_new(VLFSessionTaskMapState);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapView"));
    -[VLFSessionTaskMapState setScrollEnabled:](v10, "setScrollEnabled:", objc_msgSend(v11, "isScrollEnabled"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapView"));
    -[VLFSessionTaskMapState setRotateEnabled:](v10, "setRotateEnabled:", objc_msgSend(v12, "isRotateEnabled"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapView"));
    -[VLFSessionTaskMapState setZoomEnabled:](v10, "setZoomEnabled:", objc_msgSend(v13, "isZoomEnabled"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapView"));
    -[VLFSessionTaskMapState setPitchEnabled:](v10, "setPitchEnabled:", objc_msgSend(v14, "isPitchEnabled"));

    -[VLFSessionTask setOriginalMapState:](self, "setOriginalMapState:", v10);
    v15 = sub_1003022F8();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionTask originalMapState](self, "originalMapState"));
      v18 = objc_msgSend(v17, "scrollEnabled");
      v19 = CFSTR("NO");
      if (v18)
        v19 = CFSTR("YES");
      v20 = v19;
      v45 = 138412290;
      v46 = (const char *)v20;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Original scroll enabled: %@", (uint8_t *)&v45, 0xCu);

    }
    v21 = sub_1003022F8();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionTask originalMapState](self, "originalMapState"));
      v24 = objc_msgSend(v23, "rotateEnabled");
      v25 = CFSTR("NO");
      if (v24)
        v25 = CFSTR("YES");
      v26 = v25;
      v45 = 138412290;
      v46 = (const char *)v26;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "Original rotate enabled: %@", (uint8_t *)&v45, 0xCu);

    }
    v27 = sub_1003022F8();
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionTask originalMapState](self, "originalMapState"));
      v30 = objc_msgSend(v29, "zoomEnabled");
      v31 = CFSTR("NO");
      if (v30)
        v31 = CFSTR("YES");
      v32 = v31;
      v45 = 138412290;
      v46 = (const char *)v32;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "Original zoom enabled: %@", (uint8_t *)&v45, 0xCu);

    }
    v33 = sub_1003022F8();
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionTask originalMapState](self, "originalMapState"));
      v36 = objc_msgSend(v35, "pitchEnabled");
      v37 = CFSTR("NO");
      if (v36)
        v37 = CFSTR("YES");
      v38 = v37;
      v45 = 138412290;
      v46 = (const char *)v38;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "Original pitch enabled: %@", (uint8_t *)&v45, 0xCu);

    }
  }
  else
  {
    v39 = sub_1004318FC();
    v40 = objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      v45 = 136315906;
      v46 = "-[VLFSessionTask saveMapState]";
      v47 = 2080;
      v48 = "VLFSessionTask.m";
      v49 = 1024;
      v50 = 293;
      v51 = 2080;
      v52 = "chromeVC != nil";
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v45, 0x26u);
    }

    if (sub_100A70734())
    {
      v41 = sub_1004318FC();
      v42 = objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        v43 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v45 = 138412290;
        v46 = v43;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v45, 0xCu);

      }
    }
    v44 = sub_1003022F8();
    v34 = objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v45) = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "chromeVC was not an IOSBased one; ignoring",
        (uint8_t *)&v45,
        2u);
    }
  }

}

- (void)clearMapState
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_1003022F8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Clearing map state", v5, 2u);
  }

  -[VLFSessionTask setOriginalMapState:](self, "setOriginalMapState:", 0);
}

+ (BOOL)isSupportedForTransportType:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFALL) != 0;
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  v16 = a5;
  v6 = objc_opt_class(NavigationSession);
  if ((objc_opt_isKindOfClass(v16, v6) & 1) != 0)
    v7 = v16;
  else
    v7 = 0;
  v8 = v7;
  -[VLFSessionTask setNavigationSession:](self, "setNavigationSession:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionTask navigationSession](self, "navigationSession"));
  if (!v9)
  {
LABEL_7:
    v12 = 1;
    goto LABEL_9;
  }
  v10 = (void *)objc_opt_class(self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionTask navigationSession](self, "navigationSession"));
  v12 = (uint64_t)objc_msgSend(v10, "isSupportedForTransportType:", objc_msgSend(v11, "currentTransportType"));

  if ((_DWORD)v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionTask navigationSession](self, "navigationSession"));
    v14 = objc_msgSend(v13, "currentTransportType");

    if (v14 != (id)3)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionTask navigationSession](self, "navigationSession"));
      v12 = objc_msgSend(v15, "navigationType") != (id)2;

      goto LABEL_9;
    }
    goto LABEL_7;
  }
LABEL_9:
  -[VLFSessionTask setCanShowVLFPuckUI:](self, "setCanShowVLFPuckUI:", v12);

}

- (void)navigationSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4
{
  -[VLFSessionTask setCanShowVLFPuckUI:](self, "setCanShowVLFPuckUI:", objc_msgSend((id)objc_opt_class(self), "isSupportedForTransportType:", a4));
}

- (void)stateManager:(id)a3 didChangeState:(int64_t)a4
{
  -[VLFSessionTask updateVLFPuckUIForState:](self, "updateVLFPuckUIForState:", a4);
}

- (void)vlfSessionDidStartNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v4 = sub_1003022F8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "VLF session started", buf, 2u);
  }

  v6 = sub_1003022F8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Disabling idle timer", v11, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "idleTimerController"));
  objc_msgSend(v9, "setDesiredIdleTimerState:forReason:", 1, 3);

  -[VLFSessionTask setWasLastLocalizationSuccessful:](self, "setWasLastLocalizationSuccessful:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v10, "addObserver:selector:name:object:", self, "vlfSessionDidStopNotification:", CFSTR("VLFSessionDidStopNotification"), 0);

}

- (void)vlfSessionDidStopNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void **p_vtable;
  uint64_t v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  char *v22;
  int v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;

  v4 = a3;
  v5 = sub_1003022F8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v23) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "VLF session stopped", (uint8_t *)&v23, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("VLFSessionDidStopNotification"), 0);

  v8 = sub_1003022F8();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    LOWORD(v23) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Enabling idle timer", (uint8_t *)&v23, 2u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "idleTimerController"));
  objc_msgSend(v11, "setDesiredIdleTimerState:forReason:", 0, 3);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  p_vtable = MapsAppTestResizingProactive.vtable;
  v14 = objc_opt_class(VLFSession);
  if ((objc_opt_isKindOfClass(v12, v14) & 1) == 0)
  {
    v18 = sub_1004318FC();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v23 = 136315906;
      v24 = "-[VLFSessionTask vlfSessionDidStopNotification:]";
      v25 = 2080;
      v26 = "VLFSessionTask.m";
      v27 = 1024;
      v28 = 412;
      v29 = 2080;
      v30 = "[session isKindOfClass:[VLFSession class]]";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v23, 0x26u);
    }

    if (sub_100A70734())
    {
      v20 = sub_1004318FC();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v23 = 138412290;
        v24 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v23, 0xCu);

        p_vtable = (void **)(MapsAppTestResizingProactive + 24);
      }

    }
  }
  v15 = objc_opt_class(p_vtable + 72);
  if ((objc_opt_isKindOfClass(v12, v15) & 1) != 0)
  {
    -[VLFSessionTask setWasLastLocalizationSuccessful:](self, "setWasLastLocalizationSuccessful:", objc_msgSend(v12, "wasLastLocalizationSuccessful"));
  }
  else
  {
    v16 = sub_1003022F8();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v23 = 138412290;
      v24 = (const char *)v12;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Notification object (%@), was not a VLFSession; ignoring",
        (uint8_t *)&v23,
        0xCu);
    }

  }
}

- (void)vlfContaineeViewControllerDidAppearNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  char *v17;
  id v18;
  void **v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  NSObject *v23;
  VLFSessionTask *v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const char *v32;

  v4 = sub_1003022F8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "VLF mode VC did appear", buf, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionTask platformController](self, "platformController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "chromeViewController"));

  v8 = objc_opt_class(IOSBasedChromeViewController);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    v19 = _NSConcreteStackBlock;
    v20 = 3221225472;
    v21 = sub_100303878;
    v22 = &unk_1011AC8B0;
    v23 = v10;
    v24 = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", v19, v20, v21, v22));
    objc_msgSend(v11, "addObserver:selector:name:object:", self, "vlfContaineeViewControllerDidDisappearNotification:", off_1014BB950, 0);

    v12 = v23;
  }
  else
  {
    v13 = sub_1004318FC();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v26 = "-[VLFSessionTask vlfContaineeViewControllerDidAppearNotification:]";
      v27 = 2080;
      v28 = "VLFSessionTask.m";
      v29 = 1024;
      v30 = 426;
      v31 = 2080;
      v32 = "chromeVC != nil";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v15 = sub_1004318FC();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v26 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
    v18 = sub_1003022F8();
    v12 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "chromeVC was not an IOSBased one; ignoring",
        buf,
        2u);
    }
  }

}

- (void)vlfContaineeViewControllerDidDisappearNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  void *v24;
  id v25;
  NSObject *v26;
  _QWORD block[4];
  id v28;
  id v29;
  id v30;
  __int128 v31;
  uint64_t v32;
  char v33;
  uint8_t buf[24];
  int v35;
  __int16 v36;
  const char *v37;

  v4 = sub_1003022F8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "VLF mode VC did disappear", buf, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "removeObserver:name:object:", self, off_1014BB950, 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionTask platformController](self, "platformController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "chromeViewController"));

  v9 = objc_opt_class(IOSBasedChromeViewController);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    v10 = v8;
  else
    v10 = 0;
  v11 = v10;

  if (v11)
  {
    v12 = -[VLFSessionTask wasLastLocalizationSuccessful](self, "wasLastLocalizationSuccessful");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionTask originalMapState](self, "originalMapState"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionTask originalUserState](self, "originalUserState"));
    v15 = v14;
    memset(buf, 0, sizeof(buf));
    if (v14)
      objc_msgSend(v14, "originalUserTrackingBehavior");
    if (objc_msgSend(v15, "originalUserTrackingMode") || v12)
    {
      objc_msgSend(v15, "originalCenterCoordinateDistance");
      *(_QWORD *)&buf[8] = v16;
      buf[17] = 1;
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100303EFC;
    block[3] = &unk_1011B11D8;
    v28 = v13;
    v17 = v11;
    v31 = *(_OWORD *)buf;
    v32 = *(_QWORD *)&buf[16];
    v29 = v17;
    v30 = v15;
    v33 = v12;
    v18 = v15;
    v19 = v13;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    -[VLFSessionTask clearUserState](self, "clearUserState");
    -[VLFSessionTask clearMapState](self, "clearMapState");

  }
  else
  {
    v20 = sub_1004318FC();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[VLFSessionTask vlfContaineeViewControllerDidDisappearNotification:]";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "VLFSessionTask.m";
      *(_WORD *)&buf[22] = 1024;
      v35 = 465;
      v36 = 2080;
      v37 = "chromeVC != nil";
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v22 = sub_1004318FC();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
    v25 = sub_1003022F8();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "chromeVC was not an IOSBased one; ignoring",
        buf,
        2u);
    }

  }
}

- (void)vlfContaineeViewControllerWillCancelNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  char *v19;
  id v20;
  int v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;

  v4 = sub_1003022F8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v21) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "VLF will cancel", (uint8_t *)&v21, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionTask platformController](self, "platformController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "chromeViewController"));

  v8 = objc_opt_class(IOSBasedChromeViewController);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mapView"));
    v12 = objc_msgSend(v11, "userTrackingMode");

    if (v12 == (id)2)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mapView"));
      objc_msgSend(v13, "setUserTrackingMode:animated:", 1, 0);

    }
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mapView"));
    -[NSObject setUserTrackingMode:animated:](v14, "setUserTrackingMode:animated:", 0, 0);
  }
  else
  {
    v15 = sub_1004318FC();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v21 = 136315906;
      v22 = "-[VLFSessionTask vlfContaineeViewControllerWillCancelNotification:]";
      v23 = 2080;
      v24 = "VLFSessionTask.m";
      v25 = 1024;
      v26 = 521;
      v27 = 2080;
      v28 = "chromeVC != nil";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v21, 0x26u);
    }

    if (sub_100A70734())
    {
      v17 = sub_1004318FC();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v21 = 138412290;
        v22 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v21, 0xCu);

      }
    }
    v20 = sub_1003022F8();
    v14 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "chromeVC was not an IOSBased one; ignoring",
        (uint8_t *)&v21,
        2u);
    }
  }

}

- (VLFSessionAnalyticsTracker)analyticsTracker
{
  return self->_analyticsTracker;
}

- (void)setAnalyticsTracker:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsTracker, a3);
}

- (VLFSessionStateManager)stateManager
{
  return self->_stateManager;
}

- (void)setStateManager:(id)a3
{
  objc_storeStrong((id *)&self->_stateManager, a3);
}

- (PlatformController)platformController
{
  return (PlatformController *)objc_loadWeakRetained((id *)&self->_platformController);
}

- (void)setPlatformController:(id)a3
{
  objc_storeWeak((id *)&self->_platformController, a3);
}

- (NavigationSession)navigationSession
{
  return self->_navigationSession;
}

- (BOOL)canShowVLFPuckUI
{
  return self->_canShowVLFPuckUI;
}

- (VLFSessionTaskUserState)originalUserState
{
  return self->_originalUserState;
}

- (void)setOriginalUserState:(id)a3
{
  objc_storeStrong((id *)&self->_originalUserState, a3);
}

- (VLFSessionTaskMapState)originalMapState
{
  return self->_originalMapState;
}

- (void)setOriginalMapState:(id)a3
{
  objc_storeStrong((id *)&self->_originalMapState, a3);
}

- (BOOL)wasLastLocalizationSuccessful
{
  return self->_wasLastLocalizationSuccessful;
}

- (void)setWasLastLocalizationSuccessful:(BOOL)a3
{
  self->_wasLastLocalizationSuccessful = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalMapState, 0);
  objc_storeStrong((id *)&self->_originalUserState, 0);
  objc_storeStrong((id *)&self->_navigationSession, 0);
  objc_destroyWeak((id *)&self->_platformController);
  objc_storeStrong((id *)&self->_stateManager, 0);
  objc_storeStrong((id *)&self->_analyticsTracker, 0);
}

@end
