@implementation PedestrianARMotionMonitorTask

- (PedestrianARMotionMonitorTask)initWithPlatformController:(id)a3 stateManager:(id)a4 usageTracker:(id)a5
{
  id v9;
  id v10;
  id v11;
  PedestrianARMotionMonitorTask *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  ARSession *session;
  uint64_t UInteger;
  id v19;
  NSObject *v20;
  MapsRingBuffer *v21;
  MapsRingBuffer *pitchValues;
  MapsRingBuffer *v23;
  MapsRingBuffer *rollValues;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v30;
  NSObject *v31;
  id v32;
  NSObject *v33;
  char *v34;
  id v35;
  NSObject *v36;
  id v37;
  NSObject *v38;
  char *v39;
  id v40;
  NSObject *v41;
  id v42;
  NSObject *v43;
  char *v44;
  objc_super v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  const char *v53;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    v30 = sub_1004318FC();
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v47 = "-[PedestrianARMotionMonitorTask initWithPlatformController:stateManager:usageTracker:]";
      v48 = 2080;
      v49 = "PedestrianARMotionMonitorTask.m";
      v50 = 1024;
      v51 = 112;
      v52 = 2080;
      v53 = "platformController != nil";
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v32 = sub_1004318FC();
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v34 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v47 = v34;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (!v10)
  {
    v35 = sub_1004318FC();
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v47 = "-[PedestrianARMotionMonitorTask initWithPlatformController:stateManager:usageTracker:]";
      v48 = 2080;
      v49 = "PedestrianARMotionMonitorTask.m";
      v50 = 1024;
      v51 = 113;
      v52 = 2080;
      v53 = "stateManager != nil";
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v37 = sub_1004318FC();
      v38 = objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v39 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v47 = v39;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (!v11)
  {
    v40 = sub_1004318FC();
    v41 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v47 = "-[PedestrianARMotionMonitorTask initWithPlatformController:stateManager:usageTracker:]";
      v48 = 2080;
      v49 = "PedestrianARMotionMonitorTask.m";
      v50 = 1024;
      v51 = 114;
      v52 = 2080;
      v53 = "usageTracker != nil";
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v42 = sub_1004318FC();
      v43 = objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        v44 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v47 = v44;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v45.receiver = self;
  v45.super_class = (Class)PedestrianARMotionMonitorTask;
  v12 = -[PedestrianARMotionMonitorTask init](&v45, "init");
  if (v12)
  {
    v13 = sub_10083EF80();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v47 = (const char *)v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "[%{public}p] Initializing", buf, 0xCu);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MapsARSessionManager sharedManager](MapsARSessionManager, "sharedManager"));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "session"));
    session = v12->_session;
    v12->_session = (ARSession *)v16;

    objc_storeStrong((id *)&v12->_platformController, a3);
    objc_storeStrong((id *)&v12->_stateManager, a4);
    -[PedestrianARSessionStateManager addObserver:](v12->_stateManager, "addObserver:", v12);
    objc_storeStrong((id *)&v12->_usageTracker, a5);
    UInteger = GEOConfigGetUInteger(MapsConfig_PedestrianARDeviceMotionSampleSize, off_1014B46D8);
    v19 = sub_10083EF80();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349312;
      v47 = (const char *)v12;
      v48 = 2048;
      v49 = (const char *)UInteger;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "[%{public}p] Creating ring buffers with sample size: %lu", buf, 0x16u);
    }

    v21 = -[MapsRingBuffer initWithLength:]([MapsRingBuffer alloc], "initWithLength:", UInteger);
    pitchValues = v12->_pitchValues;
    v12->_pitchValues = v21;

    v23 = -[MapsRingBuffer initWithLength:]([MapsRingBuffer alloc], "initWithLength:", UInteger);
    rollValues = v12->_rollValues;
    v12->_rollValues = v23;

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v25, "addObserver:selector:name:object:", v12, "applicationDidEnterBackgroundNotification:", UIApplicationDidEnterBackgroundNotification, 0);

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v26, "addObserver:selector:name:object:", v12, "applicationDidBecomeActiveNotification:", UIApplicationDidBecomeActiveNotification, 0);

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v27, "addObserver:selector:name:object:", v12, "pedestrianARViewControllerDidAppearNotification:", CFSTR("PedestrianARViewControllerDidAppearNotification"), 0);

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v28, "addObserver:selector:name:object:", v12, "pedestrianARViewControllerDidDisappearNotification:", CFSTR("PedestrianARViewControllerDidDisappearNotification"), 0);

    -[PedestrianARMotionMonitorTask _startIfNecessary](v12, "_startIfNecessary");
  }

  return v12;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  PedestrianARMotionMonitorTask *v7;

  v3 = sub_10083EF80();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Deallocing", buf, 0xCu);
  }

  -[PedestrianARMotionMonitorTask _stop](self, "_stop");
  v5.receiver = self;
  v5.super_class = (Class)PedestrianARMotionMonitorTask;
  -[PedestrianARMotionMonitorTask dealloc](&v5, "dealloc");
}

- (void)_startIfNecessary
{
  void *v3;
  unsigned __int8 v4;
  id v5;
  NSObject *v6;
  const char *v7;
  id v8;
  int v9;
  PedestrianARMotionMonitorTask *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARMotionMonitorTask stateManager](self, "stateManager"));
  v4 = objc_msgSend(v3, "shouldShowPedestrianAR");

  if ((v4 & 1) != 0)
  {
    if (+[UIApplication _maps_isAnySceneForegroundForRole:](UIApplication, "_maps_isAnySceneForegroundForRole:", UIWindowSceneSessionRoleApplication)|| +[UIApplication _maps_isAnySceneForegroundForRole:](UIApplication, "_maps_isAnySceneForegroundForRole:", _UIWindowSceneSessionTypeCoverSheet))
    {
      -[PedestrianARMotionMonitorTask _start](self, "_start");
      return;
    }
    v8 = sub_10083EF80();
    v6 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v9 = 134349056;
      v10 = self;
      v7 = "[%{public}p] Application is not foreground; will not start";
      goto LABEL_7;
    }
  }
  else
  {
    v5 = sub_10083EF80();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v9 = 134349056;
      v10 = self;
      v7 = "[%{public}p] Pedestrian AR should not be shown; will not start";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, v7, (uint8_t *)&v9, 0xCu);
    }
  }

}

- (void)_start
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  unsigned int v9;
  id v10;
  _BOOL4 v11;
  int v12;
  PedestrianARMotionMonitorTask *v13;

  v3 = sub_10083EF80();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v12 = 134349056;
    v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Will start monitoring motion changes", (uint8_t *)&v12, 0xCu);
  }

  if (-[PedestrianARMotionMonitorTask isARSessionReplayingFromRecording](self, "isARSessionReplayingFromRecording"))
  {
    v5 = sub_10083EF80();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v12 = 134349056;
      v13 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}p] ARSession is being replayed from a trace; observing ARKit for motion updates",
        (uint8_t *)&v12,
        0xCu);
    }

    v7 = objc_claimAutoreleasedReturnValue(-[PedestrianARMotionMonitorTask session](self, "session"));
    -[NSObject _addObserver:](v7, "_addObserver:", self);
LABEL_10:

    return;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARMotionMonitorTask motionManager](self, "motionManager"));
  v9 = objc_msgSend(v8, "isDeviceMotionActive");

  v10 = sub_10083EF80();
  v7 = objc_claimAutoreleasedReturnValue(v10);
  v11 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v9)
  {
    if (v11)
    {
      v12 = 134349056;
      v13 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[%{public}p] We're already monitoring device motion updates; ignoring",
        (uint8_t *)&v12,
        0xCu);
    }
    goto LABEL_10;
  }
  if (v11)
  {
    v12 = 134349056;
    v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[%{public}p] ARSession is not being replayed from a trace; observing CoreMotion for motion updates",
      (uint8_t *)&v12,
      0xCu);
  }

  -[PedestrianARMotionMonitorTask _startMonitoringDeviceMotionChanges](self, "_startMonitoringDeviceMotionChanges");
}

- (void)_stop
{
  void *v3;
  void *v4;
  unsigned int v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  PedestrianARMotionMonitorTask *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARMotionMonitorTask session](self, "session"));
  objc_msgSend(v3, "_removeObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARMotionMonitorTask motionManager](self, "motionManager"));
  v5 = objc_msgSend(v4, "isDeviceMotionActive");

  if (v5)
  {
    v6 = sub_10083EF80();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = 134349056;
      v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Ending device motion updates", (uint8_t *)&v9, 0xCu);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARMotionMonitorTask motionManager](self, "motionManager"));
    objc_msgSend(v8, "stopDeviceMotionUpdates");

  }
  -[PedestrianARMotionMonitorTask setForegroundRestartTimer:](self, "setForegroundRestartTimer:", 0);
}

- (id)_topContext
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARMotionMonitorTask platformController](self, "platformController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iosBasedChromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topContext"));

  return v4;
}

- (BOOL)isARSessionReplayingFromRecording
{
  void *v2;
  void *v3;
  uint64_t v4;
  char isKindOfClass;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARMotionMonitorTask session](self, "session"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "configuration"));
  v4 = objc_opt_class(ARReplayConfiguration);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  return isKindOfClass & 1;
}

- (BOOL)isNavRunning
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  BOOL v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARMotionMonitorTask platformController](self, "platformController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentSession"));

  v4 = objc_opt_class(NavigationSession);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;

  v7 = v6 && objc_msgSend(v6, "sessionState") == (id)1 && objc_msgSend(v6, "guidanceType") != (id)2;
  return v7;
}

- (PedestrianARCoordination)coordinator
{
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = -[PedestrianARMotionMonitorTask isNavRunning](self, "isNavRunning");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARMotionMonitorTask platformController](self, "platformController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "iosBasedChromeViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appCoordinator"));
  v7 = v6;
  if (v3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "navModeController"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "navActionCoordinator"));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "baseModeController"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "actionCoordinator"));
  }
  v10 = (void *)v9;

  return (PedestrianARCoordination *)v10;
}

- (id)containerViewController
{
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = -[PedestrianARMotionMonitorTask isNavRunning](self, "isNavRunning");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARMotionMonitorTask platformController](self, "platformController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "iosBasedChromeViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appCoordinator"));
  v7 = v6;
  if (v3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "navModeController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "navActionCoordinator"));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "baseModeController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "actionCoordinator"));
  }
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "containerViewController"));

  return v11;
}

- (NSString)currentRouteID
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  char *v23;
  int v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARMotionMonitorTask platformController](self, "platformController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentSession"));

  v5 = objc_opt_class(RoutePlanningSession);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    v6 = v4;
  else
    v6 = 0;
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARMotionMonitorTask platformController](self, "platformController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentSession"));

  v10 = objc_opt_class(NavigationSession);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    v11 = v9;
  else
    v11 = 0;
  v12 = v11;

  if (v7)
  {
    v13 = v7;
LABEL_11:
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "currentRouteCollection"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentRoute"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uniqueRouteID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "UUIDString"));

    goto LABEL_12;
  }
  if (v12)
  {
    v13 = v12;
    goto LABEL_11;
  }
  v19 = sub_1004318FC();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v24 = 136315650;
    v25 = "-[PedestrianARMotionMonitorTask currentRouteID]";
    v26 = 2080;
    v27 = "PedestrianARMotionMonitorTask.m";
    v28 = 1024;
    v29 = 244;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v24, 0x1Cu);
  }

  if (sub_100A70734())
  {
    v21 = sub_1004318FC();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      v24 = 138412290;
      v25 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v24, 0xCu);

    }
  }
  v17 = 0;
LABEL_12:

  return (NSString *)v17;
}

- (int64_t)interfaceOrientation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARMotionMonitorTask platformController](self, "platformController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "windowScene"));
  v7 = objc_msgSend(v6, "interfaceOrientation");

  return (int64_t)v7;
}

- (BOOL)_isDeviceAngleAboveTopBound
{
  void *v3;
  void *v4;
  Block_layout *v5;
  int64_t v6;
  int64_t v7;
  char v8;

  if (-[PedestrianARMotionMonitorTask isARSessionReplayingFromRecording](self, "isARSessionReplayingFromRecording"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARMotionMonitorTask pitchValues](self, "pitchValues"));
    v4 = v3;
    v5 = &stru_1011D8CB8;
  }
  else
  {
    v6 = -[PedestrianARMotionMonitorTask interfaceOrientation](self, "interfaceOrientation");
    if ((unint64_t)(v6 - 1) > 1)
    {
      v7 = v6;
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARMotionMonitorTask rollValues](self, "rollValues"));
      v4 = v3;
      if (v7 == 4)
        v5 = &stru_1011D8CF8;
      else
        v5 = &stru_1011D8D18;
    }
    else
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARMotionMonitorTask pitchValues](self, "pitchValues"));
      v4 = v3;
      v5 = &stru_1011D8CD8;
    }
  }
  v8 = sub_10039E360(v3, v5);

  return v8;
}

- (BOOL)_isDeviceAngleBelowBottomBound
{
  void *v3;
  void *v4;
  Block_layout *v5;
  int64_t v6;
  int64_t v7;
  char v8;

  if (-[PedestrianARMotionMonitorTask isARSessionReplayingFromRecording](self, "isARSessionReplayingFromRecording"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARMotionMonitorTask pitchValues](self, "pitchValues"));
    v4 = v3;
    v5 = &stru_1011D8D38;
  }
  else
  {
    v6 = -[PedestrianARMotionMonitorTask interfaceOrientation](self, "interfaceOrientation");
    if ((unint64_t)(v6 - 1) > 1)
    {
      v7 = v6;
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARMotionMonitorTask rollValues](self, "rollValues"));
      v4 = v3;
      if (v7 == 4)
        v5 = &stru_1011D8D78;
      else
        v5 = &stru_1011D8D98;
    }
    else
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARMotionMonitorTask pitchValues](self, "pitchValues"));
      v4 = v3;
      v5 = &stru_1011D8D58;
    }
  }
  v8 = sub_10039E360(v3, v5);

  return v8;
}

- (void)_startMonitoringDeviceMotionChanges
{
  id v3;
  NSObject *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  unsigned int v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  PedestrianARMotionMonitorTask *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  PedestrianARMotionMonitorTask *v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  PedestrianARMotionMonitorTask *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;

  v3 = sub_10083EF80();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v27 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Will start monitoring device motion updates", buf, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARMotionMonitorTask motionManager](self, "motionManager"));
  v6 = objc_msgSend(v5, "isDeviceMotionAvailable");

  if ((v6 & 1) == 0)
  {
    v16 = sub_1004318FC();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v27 = (PedestrianARMotionMonitorTask *)"-[PedestrianARMotionMonitorTask _startMonitoringDeviceMotionChanges]";
      v28 = 2080;
      v29 = "PedestrianARMotionMonitorTask.m";
      v30 = 1024;
      v31 = 309;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
    }

    if (sub_100A70734())
    {
      v18 = sub_1004318FC();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = (PedestrianARMotionMonitorTask *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v27 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
    v21 = sub_10083EF80();
    v15 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349056;
      v27 = self;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "[%{public}p] Device motion updates are not available on this device", buf, 0xCu);
    }
    goto LABEL_13;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARMotionMonitorTask motionManager](self, "motionManager"));
  v8 = objc_msgSend(v7, "isDeviceMotionActive");

  if (v8)
  {
    v9 = sub_1004318FC();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v27 = (PedestrianARMotionMonitorTask *)"-[PedestrianARMotionMonitorTask _startMonitoringDeviceMotionChanges]";
      v28 = 2080;
      v29 = "PedestrianARMotionMonitorTask.m";
      v30 = 1024;
      v31 = 315;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
    }

    if (sub_100A70734())
    {
      v11 = sub_1004318FC();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = (PedestrianARMotionMonitorTask *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v27 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
    v14 = sub_10083EF80();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349056;
      v27 = self;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "[%{public}p] Already monitoring device motion changes; cannot start again",
        buf,
        0xCu);
    }
LABEL_13:

    return;
  }
  objc_initWeak((id *)buf, self);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARMotionMonitorTask motionManager](self, "motionManager"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARMotionMonitorTask deviceMotionUpdatesQueue](self, "deviceMotionUpdatesQueue"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1008400E8;
  v24[3] = &unk_1011D8DC0;
  objc_copyWeak(&v25, (id *)buf);
  objc_msgSend(v22, "startDeviceMotionUpdatesToQueue:withHandler:", v23, v24);

  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);
}

- (CMMotionManager)motionManager
{
  CMMotionManager *motionManager;
  id v4;
  NSObject *v5;
  CMMotionManager *v6;
  CMMotionManager *v7;
  double Double;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSString *v13;
  void *v14;
  id v15;
  const char *v16;
  dispatch_queue_attr_t v17;
  NSObject *v18;
  dispatch_queue_t v19;
  NSOperationQueue *v20;
  NSOperationQueue *deviceMotionUpdatesQueue;
  uint8_t buf[4];
  PedestrianARMotionMonitorTask *v24;
  __int16 v25;
  double v26;

  motionManager = self->_motionManager;
  if (!motionManager)
  {
    v4 = sub_10083EF80();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v24 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Creating CMMotionManager", buf, 0xCu);
    }

    v6 = (CMMotionManager *)objc_alloc_init((Class)CMMotionManager);
    v7 = self->_motionManager;
    self->_motionManager = v6;

    Double = GEOConfigGetDouble(MapsConfig_PedestrianARDeviceMotionUpdateInterval, off_1014B4308);
    v9 = sub_10083EF80();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349312;
      v24 = self;
      v25 = 2048;
      v26 = Double;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}p] Configuring motion manager with update interval: %f", buf, 0x16u);
    }

    -[CMMotionManager setDeviceMotionUpdateInterval:](self->_motionManager, "setDeviceMotionUpdateInterval:", Double);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleIdentifier"));
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@.deviceMotionUpdatesQueue.%p"), v12, objc_opt_class(self), self);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

    v15 = objc_retainAutorelease(v14);
    v16 = (const char *)objc_msgSend(v15, "UTF8String");
    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = dispatch_queue_create(v16, v18);

    v20 = objc_opt_new(NSOperationQueue);
    deviceMotionUpdatesQueue = self->_deviceMotionUpdatesQueue;
    self->_deviceMotionUpdatesQueue = v20;

    -[NSOperationQueue setUnderlyingQueue:](self->_deviceMotionUpdatesQueue, "setUnderlyingQueue:", v19);
    motionManager = self->_motionManager;
  }
  return motionManager;
}

- (BOOL)_shouldShowPedestrianAR
{
  const char *label;
  const char *v4;
  BOOL v5;
  unsigned int v6;
  unsigned int v7;
  id v8;
  NSObject *v9;
  unint64_t v10;
  const __CFString *v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  unsigned __int8 v22;
  id v23;
  NSObject *v24;
  const char *v25;
  void *v26;
  unsigned __int8 v27;
  id v28;
  id v29;
  void *v30;
  unsigned int v31;
  id v32;
  const char *v33;
  id v34;
  unsigned __int8 v35;
  void *v37;
  unsigned int v38;
  id v39;
  NSObject *v40;
  void *v41;
  unsigned int v42;
  id v43;
  NSObject *v44;
  os_log_type_t v45;
  void *v46;
  unsigned int v47;
  id v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  unsigned __int8 v53;
  id v54;
  id v55;
  id v56;
  char *v57;
  id v58;
  _BOOL4 v59;
  id v60;
  NSObject *v61;
  id v62;
  NSObject *v63;
  void *v64;
  _BYTE v65[24];
  _BYTE v66[24];
  __int16 v67;
  const char *v68;

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v60 = sub_1004318FC();
      v61 = objc_claimAutoreleasedReturnValue(v60);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v65 = 136316418;
        *(_QWORD *)&v65[4] = "-[PedestrianARMotionMonitorTask _shouldShowPedestrianAR]";
        *(_WORD *)&v65[12] = 2080;
        *(_QWORD *)&v65[14] = "PedestrianARMotionMonitorTask.m";
        *(_WORD *)&v65[22] = 1024;
        *(_DWORD *)v66 = 358;
        *(_WORD *)&v66[4] = 2080;
        *(_QWORD *)&v66[6] = "dispatch_get_main_queue()";
        *(_WORD *)&v66[14] = 2080;
        *(_QWORD *)&v66[16] = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v67 = 2080;
        v68 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          v65,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v62 = sub_1004318FC();
        v63 = objc_claimAutoreleasedReturnValue(v62);
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)v65 = 138412290;
          *(_QWORD *)&v65[4] = v64;
          _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "%@", v65, 0xCu);

        }
      }
    }
  }
  v6 = -[PedestrianARMotionMonitorTask _isDeviceAngleAboveTopBound](self, "_isDeviceAngleAboveTopBound");
  v7 = -[PedestrianARMotionMonitorTask _isDeviceAngleBelowBottomBound](self, "_isDeviceAngleBelowBottomBound");
  v8 = sub_10083EF80();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = -[PedestrianARMotionMonitorTask interfaceOrientation](self, "interfaceOrientation");
    if (v10 >= 5)
    {
      v12 = sub_1004318FC();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v65 = 136315650;
        *(_QWORD *)&v65[4] = "NSString * _Nonnull NSStringFromUIInterfaceOrientation(UIInterfaceOrientation)";
        *(_WORD *)&v65[12] = 2080;
        *(_QWORD *)&v65[14] = "PedestrianARMotionMonitorTask.m";
        *(_WORD *)&v65[22] = 1024;
        *(_DWORD *)v66 = 61;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", v65, 0x1Cu);
      }

      if (sub_100A70734())
      {
        v14 = sub_1004318FC();
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)v65 = 138412290;
          *(_QWORD *)&v65[4] = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", v65, 0xCu);

        }
      }
      v11 = CFSTR("?");
    }
    else
    {
      v11 = *(&off_1011D8E00 + v10);
    }
    *(_DWORD *)v65 = 134349826;
    *(_QWORD *)&v65[4] = self;
    if (v6)
      v17 = CFSTR("YES");
    else
      v17 = CFSTR("NO");
    *(_QWORD *)&v65[14] = v11;
    *(_WORD *)&v65[12] = 2112;
    if (v7)
      v18 = CFSTR("YES");
    else
      v18 = CFSTR("NO");
    *(_WORD *)&v65[22] = 2112;
    *(_QWORD *)v66 = v17;
    *(_WORD *)&v66[8] = 2112;
    *(_QWORD *)&v66[10] = v18;
    v19 = v17;
    v20 = v18;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] interface orientation: %@, isAboveTopBound: %@, isBelowBottomBound: %@", v65, 0x2Au);

  }
  if (v6)
  {
    -[PedestrianARMotionMonitorTask setSuppressLowerToExit:](self, "setSuppressLowerToExit:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v22 = objc_msgSend(v21, "BOOLForKey:", CFSTR("MapsEnablePedestrianARRaiseToStart"));

    if ((v22 & 1) == 0)
    {
      v29 = sub_10083EF80();
      v24 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v65 = 134349056;
        *(_QWORD *)&v65[4] = self;
        v25 = "[%{public}p] User has not enabled raise to start; will not raise to start";
        goto LABEL_41;
      }
LABEL_42:

      goto LABEL_43;
    }
    if (+[PedestrianARFeatureIntroTeachableMomentContaineeViewController shouldShowTeachableMoment](PedestrianARFeatureIntroTeachableMomentContaineeViewController, "shouldShowTeachableMoment"))
    {
      v23 = sub_10083EF80();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v65 = 134349056;
        *(_QWORD *)&v65[4] = self;
        v25 = "[%{public}p] The feature intro teachable moment card is eligible to be shown; will not raise to start";
LABEL_41:
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, v25, v65, 0xCu);
        goto LABEL_42;
      }
      goto LABEL_42;
    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARMotionMonitorTask coordinator](self, "coordinator"));
    v31 = objc_msgSend(v30, "isTeachableMomentCardActive");

    if (v31)
    {
      v32 = sub_10083EF80();
      v24 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v65 = 134349056;
        *(_QWORD *)&v65[4] = self;
        v33 = "[%{public}p] Teachable moment card is currently active; will not raise to start";
LABEL_53:
        v44 = v24;
        v45 = OS_LOG_TYPE_INFO;
LABEL_54:
        _os_log_impl((void *)&_mh_execute_header, v44, v45, v33, v65, 0xCu);
      }
    }
    else
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARMotionMonitorTask coordinator](self, "coordinator"));
      v42 = objc_msgSend(v41, "isWeatherPopoverActive");

      if (v42)
      {
        v43 = sub_10043214C();
        v24 = objc_claimAutoreleasedReturnValue(v43);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v65 = 134349056;
          *(_QWORD *)&v65[4] = self;
          v33 = "[%{public}p] User is currently viewing the weather; will not raise to start";
          goto LABEL_53;
        }
      }
      else
      {
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARMotionMonitorTask containerViewController](self, "containerViewController"));
        v47 = objc_msgSend(v46, "isVLFCrowdsourcingPermissionCardActive");

        if (!v47)
        {
          v49 = (void *)objc_claimAutoreleasedReturnValue(+[PedestrianARSessionUsageTracker sharedInstance](PedestrianARSessionUsageTracker, "sharedInstance"));
          v50 = objc_msgSend(v49, "hasAREverLocalized");

          if ((v50 & 1) != 0)
          {
            v51 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARMotionMonitorTask usageTracker](self, "usageTracker"));
            v52 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARMotionMonitorTask currentRouteID](self, "currentRouteID"));
            v53 = objc_msgSend(v51, "hasAREverLocalizedForRoute:", v52);

            if ((v53 & 1) != 0)
            {
              if (-[PedestrianARMotionMonitorTask suppressRaiseToStart](self, "suppressRaiseToStart"))
              {
                v54 = sub_10083EF80();
                v24 = objc_claimAutoreleasedReturnValue(v54);
                if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                  goto LABEL_42;
                *(_DWORD *)v65 = 134349056;
                *(_QWORD *)&v65[4] = self;
                v25 = "[%{public}p] Device is above top bound but we need to suppress the raise; will not raise to start";
              }
              else
              {
                v57 = (char *)-[PedestrianARMotionMonitorTask interfaceOrientation](self, "interfaceOrientation") - 1;
                v58 = sub_10083EF80();
                v24 = objc_claimAutoreleasedReturnValue(v58);
                v59 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);
                if ((unint64_t)v57 < 2)
                {
                  if (v59)
                  {
                    *(_DWORD *)v65 = 134349056;
                    *(_QWORD *)&v65[4] = self;
                    v35 = 1;
                    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "[%{public}p] Allowing raise to start", v65, 0xCu);
                  }
                  else
                  {
                    v35 = 1;
                  }
                  goto LABEL_44;
                }
                if (!v59)
                  goto LABEL_42;
                *(_DWORD *)v65 = 134349056;
                *(_QWORD *)&v65[4] = self;
                v25 = "[%{public}p] Device is above top bound but not in portrait orientation; will not raise to start";
              }
            }
            else
            {
              v56 = sub_10083EF80();
              v24 = objc_claimAutoreleasedReturnValue(v56);
              if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                goto LABEL_42;
              *(_DWORD *)v65 = 134349056;
              *(_QWORD *)&v65[4] = self;
              v25 = "[%{public}p] Device is above top bound but user has not localized for the current route; will not raise to start";
            }
          }
          else
          {
            v55 = sub_10083EF80();
            v24 = objc_claimAutoreleasedReturnValue(v55);
            if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
              goto LABEL_42;
            *(_DWORD *)v65 = 134349056;
            *(_QWORD *)&v65[4] = self;
            v25 = "[%{public}p] User has never successfully localized; will not raise to start";
          }
          goto LABEL_41;
        }
        v48 = sub_10083EF80();
        v24 = objc_claimAutoreleasedReturnValue(v48);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v65 = 134349056;
          *(_QWORD *)&v65[4] = self;
          v33 = "[%{public}p] VLF crowdsourcing permission card is currently active; will not raise to start";
          v44 = v24;
          v45 = OS_LOG_TYPE_DEBUG;
          goto LABEL_54;
        }
      }
    }
    v35 = 0;
    goto LABEL_44;
  }
  if (v7)
  {
    -[PedestrianARMotionMonitorTask setSuppressRaiseToStart:](self, "setSuppressRaiseToStart:", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v27 = objc_msgSend(v26, "BOOLForKey:", CFSTR("PedestrianAREnableLowerToExitKey"));

    if ((v27 & 1) != 0)
    {
      if (!-[PedestrianARMotionMonitorTask suppressLowerToExit](self, "suppressLowerToExit"))
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARMotionMonitorTask coordinator](self, "coordinator"));
        v38 = objc_msgSend(v37, "isPedestrianARShowingFailureView");

        if (!v38)
          return 0;
        v39 = sub_10083EF80();
        v40 = objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v65 = 134349056;
          *(_QWORD *)&v65[4] = self;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "[%{public}p] Device is below bottom bound but user is on the failure view; will not lower to exit, and suppr"
            "essing lower to exit",
            v65,
            0xCu);
        }

        -[PedestrianARMotionMonitorTask setSuppressLowerToExit:](self, "setSuppressLowerToExit:", 1);
        goto LABEL_43;
      }
      v28 = sub_10083EF80();
      v24 = objc_claimAutoreleasedReturnValue(v28);
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        goto LABEL_42;
      *(_DWORD *)v65 = 134349056;
      *(_QWORD *)&v65[4] = self;
      v25 = "[%{public}p] Device is below bottom bound but we need to suppress the lower; will not lower to exit";
      goto LABEL_41;
    }
    v34 = sub_10083EF80();
    v24 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v65 = 134349056;
      *(_QWORD *)&v65[4] = self;
      v25 = "[%{public}p] User has not enabled lower to exit; will not lower to exit";
      goto LABEL_41;
    }
    goto LABEL_42;
  }
LABEL_43:
  v24 = objc_claimAutoreleasedReturnValue(-[PedestrianARMotionMonitorTask coordinator](self, "coordinator", *(_OWORD *)v65, *(_QWORD *)&v65[16]));
  v35 = -[NSObject isPedestrianARActive](v24, "isPedestrianARActive");
LABEL_44:

  return v35;
}

- (void)updateVisibilityWithCurrentPitch:(double)a3 currentRoll:(double)a4
{
  const char *label;
  const char *v8;
  BOOL v9;
  id v10;
  NSObject *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  unsigned __int8 v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  id v36;
  NSObject *v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  id v41;
  NSObject *v42;
  id v43;
  NSObject *v44;
  PedestrianARMotionMonitorTask *v45;
  int v46;
  PedestrianARMotionMonitorTask *v47;
  __int16 v48;
  double v49;
  __int16 v50;
  _BYTE v51[38];

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v8 = dispatch_queue_get_label(0);
  if (label != v8)
  {
    v9 = !label || v8 == 0;
    if (v9 || strcmp(label, v8))
    {
      v41 = sub_1004318FC();
      v42 = objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        v46 = 136316418;
        v47 = (PedestrianARMotionMonitorTask *)"-[PedestrianARMotionMonitorTask updateVisibilityWithCurrentPitch:currentRoll:]";
        v48 = 2080;
        v49 = COERCE_DOUBLE("PedestrianARMotionMonitorTask.m");
        v50 = 1024;
        *(_DWORD *)v51 = 426;
        *(_WORD *)&v51[4] = 2080;
        *(_QWORD *)&v51[6] = "dispatch_get_main_queue()";
        *(_WORD *)&v51[14] = 2080;
        *(_QWORD *)&v51[16] = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        *(_WORD *)&v51[24] = 2080;
        *(_QWORD *)&v51[26] = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v46,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v43 = sub_1004318FC();
        v44 = objc_claimAutoreleasedReturnValue(v43);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          v45 = (PedestrianARMotionMonitorTask *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v46 = 138412290;
          v47 = v45;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v46, 0xCu);

        }
      }
    }
  }
  v10 = sub_10083EF80();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    if (-[PedestrianARMotionMonitorTask isARSessionReplayingFromRecording](self, "isARSessionReplayingFromRecording"))
      v12 = CFSTR("NO");
    else
      v12 = CFSTR("YES");
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARMotionMonitorTask pitchValues](self, "pitchValues"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastObject"));
    objc_msgSend(v15, "doubleValue");
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARMotionMonitorTask rollValues](self, "rollValues"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastObject"));
    objc_msgSend(v19, "doubleValue");
    v46 = 134350338;
    v47 = self;
    v48 = 2048;
    v49 = a3;
    v50 = 2048;
    *(double *)v51 = a4;
    *(_WORD *)&v51[8] = 2112;
    *(_QWORD *)&v51[10] = v12;
    *(_WORD *)&v51[18] = 2048;
    *(_QWORD *)&v51[20] = v17;
    *(_WORD *)&v51[28] = 2048;
    *(_QWORD *)&v51[30] = v20;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[%{public}p] Updating visibility with pitch: %f, roll: %f, fromCoreMotion: %@, previous device pitch: %f, previous device roll: %f", (uint8_t *)&v46, 0x3Eu);

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARMotionMonitorTask pitchValues](self, "pitchValues"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
  objc_msgSend(v21, "push:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARMotionMonitorTask rollValues](self, "rollValues"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4));
  objc_msgSend(v23, "push:", v24);

  v25 = -[PedestrianARMotionMonitorTask _shouldShowPedestrianAR](self, "_shouldShowPedestrianAR");
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARMotionMonitorTask coordinator](self, "coordinator"));
  v27 = objc_msgSend(v26, "isPedestrianARActive");

  if (!v25 || (v27 & 1) != 0)
  {
    v35 = v25 | v27 ^ 1;
    v36 = sub_10083EF80();
    v37 = objc_claimAutoreleasedReturnValue(v36);
    v38 = os_log_type_enabled(v37, OS_LOG_TYPE_INFO);
    if ((v35 & 1) != 0)
    {
      if (v38)
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARMotionMonitorTask _topContext](self, "_topContext"));
        v46 = 134349314;
        v47 = self;
        v48 = 2112;
        v49 = *(double *)&v39;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "[%{public}p] Not raising nor lowering. Current top context: %@", (uint8_t *)&v46, 0x16u);

      }
    }
    else
    {
      if (v38)
      {
        v46 = 134349056;
        v47 = self;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "[%{public}p] Lowering to exit pedestrian AR", (uint8_t *)&v46, 0xCu);
      }

      -[PedestrianARMotionMonitorTask setWaitingToExit:](self, "setWaitingToExit:", 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARMotionMonitorTask coordinator](self, "coordinator"));
      objc_msgSend(v40, "exitPedestrianAR");

    }
  }
  else
  {
    v28 = sub_10083EF80();
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v46 = 134349056;
      v47 = self;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "[%{public}p] Raising to enter pedestrian AR", (uint8_t *)&v46, 0xCu);
    }

    -[PedestrianARMotionMonitorTask setWaitingToStart:](self, "setWaitingToStart:", 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARMotionMonitorTask coordinator](self, "coordinator"));
    objc_msgSend(v30, "enterPedestrianAR");

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARMotionMonitorTask platformController](self, "platformController"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "currentSession"));
    v33 = objc_opt_class(RoutePlanningSession);
    if ((objc_opt_isKindOfClass(v32, v33) & 1) != 0)
      v34 = 302;
    else
      v34 = 402;

    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 124, v34, 0);
  }
}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v5 = a4;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100841404;
  block[3] = &unk_1011AD1E8;
  objc_copyWeak(&v9, &location);
  v8 = v5;
  v6 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)stateManager:(id)a3 didChangeState:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  NSObject *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  id v18;
  NSObject *v19;
  int v20;
  PedestrianARMotionMonitorTask *v21;
  __int16 v22;
  __CFString *v23;
  __int16 v24;
  __CFString *v25;

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    v7 = sub_10083EF80();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v20 = 134349056;
      v21 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Pedestrian AR became available; starting motion updates",
        (uint8_t *)&v20,
        0xCu);
    }

    -[PedestrianARMotionMonitorTask _startIfNecessary](self, "_startIfNecessary");
    goto LABEL_20;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARMotionMonitorTask coordinator](self, "coordinator"));
  if ((objc_msgSend(v9, "isPedestrianARActive") & 1) != 0)
  {

LABEL_8:
    v11 = sub_10083EF80();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARMotionMonitorTask coordinator](self, "coordinator"));
      if (objc_msgSend(v13, "isPedestrianARActive"))
        v14 = CFSTR("YES");
      else
        v14 = CFSTR("NO");
      v15 = v14;
      if (-[PedestrianARMotionMonitorTask waitingToStart](self, "waitingToStart"))
        v16 = CFSTR("YES");
      else
        v16 = CFSTR("NO");
      v17 = v16;
      v20 = 134349570;
      v21 = self;
      v22 = 2112;
      v23 = v15;
      v24 = 2112;
      v25 = v17;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}p] Pedestrian AR became unavailable but either AR is currently active (%@) or we're waiting for it to be active (%@); will not stop motion updates yet",
        (uint8_t *)&v20,
        0x20u);

    }
    goto LABEL_20;
  }
  v10 = -[PedestrianARMotionMonitorTask waitingToStart](self, "waitingToStart");

  if ((v10 & 1) != 0)
    goto LABEL_8;
  v18 = sub_10083EF80();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = 134349056;
    v21 = self;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "[%{public}p] Pedestrian AR became unavailable and is not currently active nor becoming active; stopping motion updates",
      (uint8_t *)&v20,
      0xCu);
  }

  -[PedestrianARMotionMonitorTask _stop](self, "_stop");
LABEL_20:

}

- (void)applicationDidEnterBackgroundNotification:(id)a3
{
  id v4;
  const char *label;
  const char *v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  PedestrianARMotionMonitorTask *v14;
  int v15;
  PedestrianARMotionMonitorTask *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;

  v4 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v10 = sub_1004318FC();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v15 = 136316418;
        v16 = (PedestrianARMotionMonitorTask *)"-[PedestrianARMotionMonitorTask applicationDidEnterBackgroundNotification:]";
        v17 = 2080;
        v18 = "PedestrianARMotionMonitorTask.m";
        v19 = 1024;
        v20 = 482;
        v21 = 2080;
        v22 = "dispatch_get_main_queue()";
        v23 = 2080;
        v24 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v25 = 2080;
        v26 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v15,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v12 = sub_1004318FC();
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v14 = (PedestrianARMotionMonitorTask *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v15 = 138412290;
          v16 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v15, 0xCu);

        }
      }
    }
  }
  v8 = sub_10083EF80();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v15 = 134349056;
    v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] App backgrounded", (uint8_t *)&v15, 0xCu);
  }

  -[PedestrianARMotionMonitorTask _stop](self, "_stop");
}

- (void)applicationDidBecomeActiveNotification:(id)a3
{
  id v4;
  const char *label;
  const char *v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  PedestrianARMotionMonitorTask *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  PedestrianARMotionMonitorTask *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;

  v4 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v11 = sub_1004318FC();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v19 = (PedestrianARMotionMonitorTask *)"-[PedestrianARMotionMonitorTask applicationDidBecomeActiveNotification:]";
        v20 = 2080;
        v21 = "PedestrianARMotionMonitorTask.m";
        v22 = 1024;
        v23 = 491;
        v24 = 2080;
        v25 = "dispatch_get_main_queue()";
        v26 = 2080;
        v27 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v28 = 2080;
        v29 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v13 = sub_1004318FC();
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = (PedestrianARMotionMonitorTask *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v19 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
  }
  v8 = sub_10083EF80();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v19 = self;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] App foregrounded; will re-start motion updates soon",
      buf,
      0xCu);
  }

  objc_initWeak((id *)buf, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100841BD8;
  v16[3] = &unk_1011AE190;
  objc_copyWeak(&v17, (id *)buf);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, v16, 1.0));
  -[PedestrianARMotionMonitorTask setForegroundRestartTimer:](self, "setForegroundRestartTimer:", v10);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);

}

- (void)pedestrianARViewControllerDidAppearNotification:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  PedestrianARMotionMonitorTask *v7;

  if (!-[PedestrianARMotionMonitorTask waitingToStart](self, "waitingToStart", a3))
  {
    v4 = sub_10083EF80();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 134349056;
      v7 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Detected Pedestrian AR appeared via button press; suppressing lower to exit",
        (uint8_t *)&v6,
        0xCu);
    }

    -[PedestrianARMotionMonitorTask setSuppressRaiseToStart:](self, "setSuppressRaiseToStart:", 0);
    -[PedestrianARMotionMonitorTask setSuppressLowerToExit:](self, "setSuppressLowerToExit:", 1);
  }
  -[PedestrianARMotionMonitorTask setWaitingToStart:](self, "setWaitingToStart:", 0);
}

- (void)pedestrianARViewControllerDidDisappearNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  NSObject *v9;
  int v10;
  PedestrianARMotionMonitorTask *v11;

  if (!-[PedestrianARMotionMonitorTask waitingToExit](self, "waitingToExit", a3))
  {
    v4 = sub_10083EF80();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v10 = 134349056;
      v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Detected Pedestrian AR disappeared via button press; suppressing raise to start",
        (uint8_t *)&v10,
        0xCu);
    }

    -[PedestrianARMotionMonitorTask setSuppressRaiseToStart:](self, "setSuppressRaiseToStart:", 1);
    -[PedestrianARMotionMonitorTask setSuppressLowerToExit:](self, "setSuppressLowerToExit:", 0);
  }
  -[PedestrianARMotionMonitorTask setWaitingToExit:](self, "setWaitingToExit:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARMotionMonitorTask stateManager](self, "stateManager"));
  v7 = objc_msgSend(v6, "shouldShowPedestrianAR");

  if ((v7 & 1) == 0)
  {
    v8 = sub_10083EF80();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = 134349056;
      v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Pedestrian AR disappeared and the feature is no longer available; stopping motion updates",
        (uint8_t *)&v10,
        0xCu);
    }

    -[PedestrianARMotionMonitorTask _stop](self, "_stop");
  }
}

+ (int64_t)creationPreference
{
  return 2;
}

- (PlatformController)platformController
{
  return self->_platformController;
}

- (void)setPlatformController:(id)a3
{
  objc_storeStrong((id *)&self->_platformController, a3);
}

- (PedestrianARSessionStateManager)stateManager
{
  return self->_stateManager;
}

- (void)setStateManager:(id)a3
{
  objc_storeStrong((id *)&self->_stateManager, a3);
}

- (PedestrianARSessionUsageTracker)usageTracker
{
  return self->_usageTracker;
}

- (void)setUsageTracker:(id)a3
{
  objc_storeStrong((id *)&self->_usageTracker, a3);
}

- (void)setMotionManager:(id)a3
{
  objc_storeStrong((id *)&self->_motionManager, a3);
}

- (NSOperationQueue)deviceMotionUpdatesQueue
{
  return self->_deviceMotionUpdatesQueue;
}

- (void)setDeviceMotionUpdatesQueue:(id)a3
{
  objc_storeStrong((id *)&self->_deviceMotionUpdatesQueue, a3);
}

- (MapsRingBuffer)pitchValues
{
  return self->_pitchValues;
}

- (void)setPitchValues:(id)a3
{
  objc_storeStrong((id *)&self->_pitchValues, a3);
}

- (MapsRingBuffer)rollValues
{
  return self->_rollValues;
}

- (void)setRollValues:(id)a3
{
  objc_storeStrong((id *)&self->_rollValues, a3);
}

- (BOOL)suppressRaiseToStart
{
  return self->_suppressRaiseToStart;
}

- (void)setSuppressRaiseToStart:(BOOL)a3
{
  self->_suppressRaiseToStart = a3;
}

- (BOOL)suppressLowerToExit
{
  return self->_suppressLowerToExit;
}

- (void)setSuppressLowerToExit:(BOOL)a3
{
  self->_suppressLowerToExit = a3;
}

- (BOOL)waitingToStart
{
  return self->_waitingToStart;
}

- (void)setWaitingToStart:(BOOL)a3
{
  self->_waitingToStart = a3;
}

- (BOOL)waitingToExit
{
  return self->_waitingToExit;
}

- (void)setWaitingToExit:(BOOL)a3
{
  self->_waitingToExit = a3;
}

- (ARSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (GCDTimer)foregroundRestartTimer
{
  return self->_foregroundRestartTimer;
}

- (void)setForegroundRestartTimer:(id)a3
{
  objc_storeStrong((id *)&self->_foregroundRestartTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundRestartTimer, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_rollValues, 0);
  objc_storeStrong((id *)&self->_pitchValues, 0);
  objc_storeStrong((id *)&self->_deviceMotionUpdatesQueue, 0);
  objc_storeStrong((id *)&self->_motionManager, 0);
  objc_storeStrong((id *)&self->_usageTracker, 0);
  objc_storeStrong((id *)&self->_stateManager, 0);
  objc_storeStrong((id *)&self->_platformController, 0);
}

@end
