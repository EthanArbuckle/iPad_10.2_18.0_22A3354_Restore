@implementation VIOSessionTask

- (VIOSessionTask)initWithPlatformController:(id)a3
{
  id v4;
  VIOSessionTask *v5;
  VIOSessionTask *v6;
  uint64_t v7;
  NSMutableSet *monitors;
  VIOSessionAnalyticsCapturer *v9;
  VIOSessionAnalyticsCapturer *analyticsCapturer;
  void *v11;
  void *v12;
  void *v13;
  id WeakRetained;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  char *v23;
  objc_super v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const char *v32;

  v4 = a3;
  if (!v4)
  {
    v19 = sub_1004318FC();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v26 = "-[VIOSessionTask initWithPlatformController:]";
      v27 = 2080;
      v28 = "VIOSessionTask.m";
      v29 = 1024;
      v30 = 74;
      v31 = 2080;
      v32 = "platformController != nil";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v21 = sub_1004318FC();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v26 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v24.receiver = self;
  v24.super_class = (Class)VIOSessionTask;
  v5 = -[VIOSessionTask init](&v24, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_platformController, v4);
    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    monitors = v6->_monitors;
    v6->_monitors = (NSMutableSet *)v7;

    v9 = objc_alloc_init(VIOSessionAnalyticsCapturer);
    analyticsCapturer = v6->_analyticsCapturer;
    v6->_analyticsCapturer = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    objc_msgSend(v11, "setFusionInfoEnabled:", 1);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v12, "addObserver:forKeyPath:options:context:", v6, CFSTR("MapsWalkingEnableImageBasedHeading"), 1, 0);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    WeakRetained = objc_loadWeakRetained((id *)&v6->_platformController);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "chromeViewController"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_maps_uiScene"));
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, "sceneDidActivateNotification:", UISceneDidActivateNotification, v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[MapsARSessionManager sharedManager](MapsARSessionManager, "sharedManager"));
    objc_msgSend(v17, "requestSessionWithOwner:", v6);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("MapsWalkingEnableImageBasedHeading"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsARSessionManager sharedManager](MapsARSessionManager, "sharedManager"));
  objc_msgSend(v4, "resignSessionWithOwner:", self);

  v5.receiver = self;
  v5.super_class = (Class)VIOSessionTask;
  -[VIOSessionTask dealloc](&v5, "dealloc");
}

+ (int64_t)creationPreference
{
  return 2;
}

+ (BOOL)isVIOModeSupported
{
  if (qword_1014D56D0 != -1)
    dispatch_once(&qword_1014D56D0, &stru_1011BE940);
  if ((byte_1014D56C8 & 1) != 0)
    return 0;
  else
    return GEOConfigGetBOOL(MapsConfig_OpticalHeadingEnabled, off_1014B33B8);
}

+ (BOOL)isVIOModeSupportedInRoutePlanning
{
  unsigned int v2;

  v2 = objc_msgSend(a1, "isVIOModeSupported");
  if (v2)
    LOBYTE(v2) = GEOConfigGetBOOL(MapsConfig_OpticalHeadingEnableInRoutePlanning, off_1014B33C8);
  return v2;
}

+ (BOOL)isVIOModeEnabled
{
  unsigned int v2;
  void *v3;
  unsigned __int8 v4;

  v2 = objc_msgSend(a1, "isVIOModeSupported");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("MapsWalkingEnableImageBasedHeading"));

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (BOOL)isVIOModeEnabledInRoutePlanning
{
  unsigned int v2;

  v2 = objc_msgSend(a1, "isVIOModeEnabled");
  if (v2)
    LOBYTE(v2) = GEOConfigGetBOOL(MapsConfig_OpticalHeadingEnableInRoutePlanning, off_1014B33C8);
  return v2;
}

+ (BOOL)isVLFModeEnabled
{
  void *v2;
  unsigned __int8 v3;

  if (!+[VLFSessionTask isVLFModeSupported](VLFSessionTask, "isVLFModeSupported")
    || !GEOConfigGetBOOL(MapsConfig_VLFVIOEnabled, off_1014B3AC8))
  {
    return 0;
  }
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("MapsWalkingEnableImageBasedHeading"));

  return v3;
}

- (id)activeMonitors
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask monitors](self, "monitors"));
  v3 = objc_msgSend(v2, "copy");

  return v3;
}

- (BOOL)shouldStartVIOSession
{
  void *v3;
  id v4;
  NSObject *v5;
  const char *v6;
  id v7;
  NSObject *v8;
  uint32_t v9;
  BOOL v10;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  __CFString *v23;
  __CFString *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  NSObject *v31;
  __CFString *v32;
  __CFString *v33;
  void *v34;
  __CFString *v35;
  __CFString *v36;
  void *v37;
  __CFString *v38;
  __CFString *v39;
  void *v40;
  int v41;
  __CFString *v42;
  __int16 v43;
  __CFString *v44;
  __int16 v45;
  __CFString *v46;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask session](self, "session"));

  if (v3)
  {
    if (!-[VIOSessionTask shouldStartVLFSession](self, "shouldStartVLFSession"))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask platformController](self, "platformController"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "chromeViewController"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_maps_uiScene"));
      v15 = (__CFString *)objc_msgSend(v14, "activationState");

      if ((unint64_t)v15 >= 2)
      {
        v16 = sub_1007810CC();
        v5 = objc_claimAutoreleasedReturnValue(v16);
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          goto LABEL_9;
        v41 = 134217984;
        v42 = v15;
        v6 = "Our scene's activation state is not foreground (%ld); VIO should not start";
        v8 = v5;
        v9 = 12;
        goto LABEL_8;
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask currentRoutePlanningSession](self, "currentRoutePlanningSession"));

      if (v17)
      {
        v18 = sub_1007810CC();
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          if (objc_msgSend((id)objc_opt_class(self), "isVIOModeEnabledInRoutePlanning"))
            v20 = CFSTR("YES");
          else
            v20 = CFSTR("NO");
          v21 = v20;
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask currentRoutePlanningSession](self, "currentRoutePlanningSession"));
          if (objc_msgSend(v22, "currentTransportType") == (id)2)
            v23 = CFSTR("YES");
          else
            v23 = CFSTR("NO");
          v24 = v23;
          v41 = 138412546;
          v42 = v21;
          v43 = 2112;
          v44 = v24;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "shouldStartVIOSession route planning: (isVIOModeEnabledInRoutePlanning:%@) && (transportType==Walk:%@)", (uint8_t *)&v41, 0x16u);

        }
        if (objc_msgSend((id)objc_opt_class(self), "isVIOModeEnabledInRoutePlanning"))
        {
          v5 = objc_claimAutoreleasedReturnValue(-[VIOSessionTask currentRoutePlanningSession](self, "currentRoutePlanningSession"));
          v10 = -[NSObject currentTransportType](v5, "currentTransportType") == (id)2;
          goto LABEL_10;
        }
      }
      else
      {
        v25 = objc_claimAutoreleasedReturnValue(-[VIOSessionTask currentNavigationSession](self, "currentNavigationSession"));
        if (!v25
          || (v26 = (void *)v25,
              v27 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask currentNavigationSession](self, "currentNavigationSession")),
              v28 = objc_msgSend(v27, "guidanceType"),
              v27,
              v26,
              v28 == (id)2))
        {
          v29 = sub_1007810CC();
          v5 = objc_claimAutoreleasedReturnValue(v29);
          if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
            goto LABEL_9;
          LOWORD(v41) = 0;
          v6 = "shouldStartVIOSession not in nav nor route planning: NO";
          goto LABEL_7;
        }
        v30 = sub_1007810CC();
        v31 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          if (objc_msgSend((id)objc_opt_class(self), "isVIOModeEnabled"))
            v32 = CFSTR("YES");
          else
            v32 = CFSTR("NO");
          v33 = v32;
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask currentNavigationSession](self, "currentNavigationSession"));
          if (objc_msgSend(v34, "currentTransportType") == (id)2)
            v35 = CFSTR("YES");
          else
            v35 = CFSTR("NO");
          v36 = v35;
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask currentNavigationSession](self, "currentNavigationSession"));
          if (objc_msgSend(v37, "navigationType") == (id)3)
            v38 = CFSTR("YES");
          else
            v38 = CFSTR("NO");
          v39 = v38;
          v41 = 138412802;
          v42 = v33;
          v43 = 2112;
          v44 = v36;
          v45 = 2112;
          v46 = v39;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "shouldStartVIOSession nav: (isVIOModeEnabled:%@) && (transportType==Walk:%@) && (navigationType==TBT:%@)", (uint8_t *)&v41, 0x20u);

        }
        if (objc_msgSend((id)objc_opt_class(self), "isVIOModeEnabled"))
        {
          v5 = objc_claimAutoreleasedReturnValue(-[VIOSessionTask currentNavigationSession](self, "currentNavigationSession"));
          if (-[NSObject currentTransportType](v5, "currentTransportType") == (id)2)
          {
            v40 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask currentNavigationSession](self, "currentNavigationSession"));
            v10 = objc_msgSend(v40, "navigationType") == (id)3;

            goto LABEL_10;
          }
          goto LABEL_9;
        }
      }
      return 0;
    }
    v4 = sub_1007810CC();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v41) = 0;
      v6 = "Post-VLF VIO should start instead; VIO should not start";
LABEL_7:
      v8 = v5;
      v9 = 2;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, v6, (uint8_t *)&v41, v9);
    }
  }
  else
  {
    v7 = sub_1007810CC();
    v5 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v41) = 0;
      v6 = "We don't own the session; VIO should not start";
      goto LABEL_7;
    }
  }
LABEL_9:
  v10 = 0;
LABEL_10:

  return v10;
}

- (BOOL)shouldStartVLFSession
{
  id v3;
  NSObject *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  void *v22;
  uint8_t buf[4];
  __CFString *v24;
  __int16 v25;
  __CFString *v26;
  __int16 v27;
  __CFString *v28;
  __int16 v29;
  __CFString *v30;

  v3 = sub_1007810CC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    if (objc_msgSend((id)objc_opt_class(self), "isVLFModeEnabled"))
      v5 = CFSTR("YES");
    else
      v5 = CFSTR("NO");
    v6 = v5;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask session](self, "session"));
    if (v22)
      v7 = CFSTR("YES");
    else
      v7 = CFSTR("NO");
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask session](self, "session"));
    if (objc_msgSend(v9, "state") == (id)1)
      v10 = CFSTR("YES");
    else
      v10 = CFSTR("NO");
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask session](self, "session"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "technique"));
    if (objc_msgSend(v13, "vlfLocalized"))
      v14 = CFSTR("YES");
    else
      v14 = CFSTR("NO");
    v15 = v14;
    *(_DWORD *)buf = 138413058;
    v24 = v6;
    v25 = 2112;
    v26 = v8;
    v27 = 2112;
    v28 = v11;
    v29 = 2112;
    v30 = v15;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "shouldStartVLFSession: (isVLFModeEnabled:%@) && (session!=nil:%@) && (state==running:%@) && (vlfLocalized:%@)", buf, 0x2Au);

  }
  if (!objc_msgSend((id)objc_opt_class(self), "isVLFModeEnabled"))
    return 0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask session](self, "session"));
  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask session](self, "session"));
    if (objc_msgSend(v17, "state") == (id)1)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask session](self, "session"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "technique"));
      v20 = objc_msgSend(v19, "vlfLocalized");

    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)configuration
{
  ARGeoTrackingConfiguration *v3;
  double Double;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  char *v16;
  int v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  _QWORD v24[3];

  if (-[VIOSessionTask shouldStartVLFSession](self, "shouldStartVLFSession"))
  {
    v3 = objc_opt_new(ARGeoTrackingConfiguration);
    -[ARGeoTrackingConfiguration setVisualLocalizationUpdatesRequested:](v3, "setVisualLocalizationUpdatesRequested:", 0);
    -[ARGeoTrackingConfiguration setSupportEnablementOptions:](v3, "setSupportEnablementOptions:", 4);
    Double = GEOConfigGetDouble(MapsConfig_VLFSessionFrameRate, off_1014B3B28);
    v5 = sub_1007810CC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v18 = 134217984;
      v19 = *(const char **)&Double;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Configuring post-VLF VIO with framerate: %f", (uint8_t *)&v18, 0xCu);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Double));
    v24[0] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Double));
    v24[1] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Double));
    v24[2] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 3));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ARGeoTrackingConfiguration videoFormat](v3, "videoFormat"));
    objc_msgSend(v11, "setFrameRatesByPowerUsage:", v10);

  }
  else if (-[VIOSessionTask shouldStartVIOSession](self, "shouldStartVIOSession"))
  {
    v3 = objc_opt_new(ARPositionalTrackingConfiguration);
    -[ARGeoTrackingConfiguration setVioFusionEnabled:](v3, "setVioFusionEnabled:", GEOConfigGetBOOL(MapsConfig_OpticalHeadingEnableVIOFusion, off_1014B33F8));
  }
  else
  {
    v12 = sub_1004318FC();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v18 = 136315650;
      v19 = "-[VIOSessionTask configuration]";
      v20 = 2080;
      v21 = "VIOSessionTask.m";
      v22 = 1024;
      v23 = 202;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v18, 0x1Cu);
    }

    if (sub_100A70734())
    {
      v14 = sub_1004318FC();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v18 = 138412290;
        v19 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v18, 0xCu);

      }
    }
    v3 = 0;
  }
  return v3;
}

- (void)startVIOSession
{
  NSObject *v3;
  void *v4;
  unsigned int v5;
  id v6;
  NSObject *v7;
  void *v8;
  double v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  NSObject *v16;
  const char *v17;
  uint8_t *v18;
  id v19;
  const char *v20;
  uint8_t *v21;
  id v22;
  id v23;
  uint8_t v24[16];
  uint8_t v25[2];
  __int16 v26;
  uint8_t buf[16];
  uint8_t v28[2];
  __int16 v29;

  if (-[VIOSessionTask shouldStartVIOSession](self, "shouldStartVIOSession")
    && !-[VIOSessionTask isEligibleToStartVIO](self, "isEligibleToStartVIO"))
  {
    v19 = sub_1007810CC();
    v3 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v29 = 0;
      v20 = "VIO should not start or is not eligible to start; not starting";
      v21 = (uint8_t *)&v29;
LABEL_20:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, v20, v21, 2u);
    }
  }
  else
  {
    if (!-[VIOSessionTask shouldStartVLFSession](self, "shouldStartVLFSession")
      || -[VIOSessionTask isEligibleToStartVLF](self, "isEligibleToStartVLF"))
    {
      v3 = objc_claimAutoreleasedReturnValue(-[VIOSessionTask configuration](self, "configuration"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("MapsARSessionRecordingEnabledKey"));

      if (v5)
      {
        v6 = sub_1007810CC();
        v7 = objc_claimAutoreleasedReturnValue(v6);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "ARKit session recording is enabled; trying to create recording configuration",
            buf,
            2u);
        }

        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
        objc_msgSend(v8, "timeIntervalSince1970");
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("vio.%.0f.mov"), v9 * 1000.0));
        v11 = objc_claimAutoreleasedReturnValue(-[NSObject recordingConfigurationWithFileName:](v3, "recordingConfigurationWithFileName:", v10));

        v3 = v11;
      }
      -[VIOSessionTask createMonitorsForConfiguration:](self, "createMonitorsForConfiguration:", v3);
      if (-[VIOSessionTask areMonitorsDisablingVIO](self, "areMonitorsDisablingVIO"))
      {
        v12 = sub_1007810CC();
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v24 = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "VIO session will not start because a monitor wants to disable the session", v24, 2u);
        }

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask session](self, "session"));
        objc_msgSend(v14, "pause");
        goto LABEL_27;
      }
      if (-[NSObject isVIO](v3, "isVIO"))
      {
        v15 = sub_1007810CC();
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v26 = 0;
          v17 = "VIO session is starting";
          v18 = (uint8_t *)&v26;
LABEL_24:
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, v17, v18, 2u);
        }
      }
      else
      {
        if (!-[NSObject isVLF](v3, "isVLF"))
        {
LABEL_26:
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask session](self, "session"));
          objc_msgSend(v14, "runWithConfiguration:", v3);
LABEL_27:

          goto LABEL_28;
        }
        v23 = sub_1007810CC();
        v16 = objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v25 = 0;
          v17 = "Post-VLF VIO session is starting";
          v18 = v25;
          goto LABEL_24;
        }
      }

      goto LABEL_26;
    }
    v22 = sub_1007810CC();
    v3 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v28 = 0;
      v20 = "Post-VLF VIO should not start or is not eligible to start; not starting";
      v21 = v28;
      goto LABEL_20;
    }
  }
LABEL_28:

}

- (void)pauseVIOSession
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  v3 = sub_1007810CC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Pausing VIO session", v7, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask session](self, "session"));
  objc_msgSend(v5, "pause");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask monitors](self, "monitors"));
  objc_msgSend(v6, "removeAllObjects");

}

- (void)createMonitorsForConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  VIOSessionStateManager *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  unsigned int v23;
  id v24;
  NSObject *v25;
  _BOOL4 v26;
  NSString *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  NSString *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  _QWORD v46[12];
  _BYTE v47[128];

  v4 = a3;
  if (objc_msgSend(v4, "isVIO"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask session](self, "session"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "configuration"));
    v7 = objc_msgSend(v6, "isVIO");

  }
  else
  {
    v7 = 0;
  }
  if (objc_msgSend(v4, "isVLF"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask session](self, "session"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "configuration"));
    v7 |= objc_msgSend(v9, "isVLF");

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask monitors](self, "monitors"));
  v11 = objc_msgSend(v10, "count");

  if (v11 && v7)
  {
    v12 = sub_1007810CC();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Monitors already exist and VIO is not changing; not creating them again",
        buf,
        2u);
    }
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask monitors](self, "monitors"));
    objc_msgSend(v14, "removeAllObjects");

    v15 = [VIOSessionStateManager alloc];
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask session](self, "session"));
    v39 = v4;
    v13 = -[VIOSessionStateManager initWithSession:configuration:](v15, "initWithSession:configuration:", v16, v4);

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v46[0] = objc_opt_class(VIOSessionBatteryLevelMonitor);
    v46[1] = objc_opt_class(VIOSessionDailyUsageMonitor);
    v46[2] = objc_opt_class(VIOSessionDeviceMotionMonitor);
    v46[3] = objc_opt_class(VIOSessionPowerStateMonitor);
    v46[4] = objc_opt_class(VIOSessionTrackingStateMonitor);
    v46[5] = objc_opt_class(VIOSessionThermalStateMonitor);
    v46[6] = objc_opt_class(VLFVIOSessionAppBackgroundMonitor);
    v46[7] = objc_opt_class(VLFVIOSessionDistanceMonitor);
    v46[8] = objc_opt_class(VLFVIOSessionFusedLocationMonitor);
    v46[9] = objc_opt_class(VLFVIOSessionLocationAccuracyMonitor);
    v46[10] = objc_opt_class(VLFVIOSessionTimeoutMonitor);
    v46[11] = objc_opt_class(VIOSessionSunsetSunriseMonitor);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 12));
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(_QWORD *)v41 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
          v23 = objc_msgSend(v22, "isAvailable");
          v24 = sub_1007810CC();
          v25 = objc_claimAutoreleasedReturnValue(v24);
          v26 = os_log_type_enabled(v25, OS_LOG_TYPE_INFO);
          if (v23)
          {
            if (v26)
            {
              v27 = NSStringFromClass((Class)v22);
              v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
              *(_DWORD *)buf = 138412290;
              v45 = v28;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%@ is available; creating it",
                buf,
                0xCu);

            }
            v25 = objc_claimAutoreleasedReturnValue(-[VIOSessionTask monitors](self, "monitors"));
            v29 = objc_alloc((Class)v22);
            v30 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask platformController](self, "platformController"));
            v31 = objc_msgSend(v29, "initWithStateManager:platformController:", v13, v30);
            -[NSObject addObject:](v25, "addObject:", v31);

          }
          else if (v26)
          {
            v32 = NSStringFromClass((Class)v22);
            v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
            *(_DWORD *)buf = 138412290;
            v45 = v33;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%@ is unavailable; NOT creating it",
              buf,
              0xCu);

          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
      }
      while (v19);
    }

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask analyticsCapturer](self, "analyticsCapturer"));
    objc_msgSend(v34, "setStateManager:", v13);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask session](self, "session"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask analyticsCapturer](self, "analyticsCapturer"));
    objc_msgSend(v36, "setSession:", v35);

    v37 = sub_1007810CC();
    v38 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "New monitors have been created", buf, 2u);
    }

    v4 = v39;
  }

}

- (BOOL)areMonitorsDisablingVIO
{
  void *v2;
  NSObject *v3;
  __int128 v4;
  uint64_t v5;
  NSObject *i;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  void *v18;
  _BYTE v19[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask monitors](self, "monitors"));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v3)
  {
    v5 = *(_QWORD *)v14;
    *(_QWORD *)&v4 = 138412290;
    v12 = v4;
    while (2)
    {
      for (i = 0; i != v3; i = ((char *)i + 1))
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "isEnabled", v12)
          && objc_msgSend(v7, "shouldDisableVIOSession"))
        {
          v10 = sub_1007810CC();
          v3 = objc_claimAutoreleasedReturnValue(v10);
          if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v12;
            v18 = v7;
            _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%@ is requesting to prevent the VIO session from starting", buf, 0xCu);
          }

          LOBYTE(v3) = 1;
          goto LABEL_16;
        }
        v8 = sub_1007810CC();
        v9 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v12;
          v18 = v7;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%@ is NOT requesting to prevent the VIO session from starting", buf, 0xCu);
        }

      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_16:

  return (char)v3;
}

- (BOOL)isVIOSessionRunning
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask session](self, "session"));
  v3 = objc_msgSend(v2, "isVIORunning");

  return v3;
}

- (BOOL)isVLFSessionRunning
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask session](self, "session"));
  v3 = objc_msgSend(v2, "isVLFRunning");

  return v3;
}

- (void)setCurrentNavigationSession:(id)a3
{
  NavigationSession *v5;
  NavigationSession *currentNavigationSession;
  NavigationSession *v7;

  v5 = (NavigationSession *)a3;
  currentNavigationSession = self->_currentNavigationSession;
  if (currentNavigationSession != v5)
  {
    v7 = v5;
    -[NavigationSession removeObserver:](currentNavigationSession, "removeObserver:", self);
    objc_storeStrong((id *)&self->_currentNavigationSession, a3);
    -[NavigationSession addObserver:](self->_currentNavigationSession, "addObserver:", self);
    v5 = v7;
  }

}

- (void)setCurrentRoutePlanningSession:(id)a3
{
  RoutePlanningSession *v5;
  RoutePlanningSession *currentRoutePlanningSession;
  RoutePlanningSession *v7;

  v5 = (RoutePlanningSession *)a3;
  currentRoutePlanningSession = self->_currentRoutePlanningSession;
  if (currentRoutePlanningSession != v5)
  {
    v7 = v5;
    -[RoutePlanningSession removeObserver:](currentRoutePlanningSession, "removeObserver:", self);
    objc_storeStrong((id *)&self->_currentRoutePlanningSession, a3);
    -[RoutePlanningSession addObserver:](self->_currentRoutePlanningSession, "addObserver:", self);
    v5 = v7;
  }

}

- (void)handleTransportTypeChanged:(int64_t)a3
{
  void *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  id v10;
  NSObject *v11;
  const __CFString *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  unsigned __int8 v19;
  unsigned int v20;
  id v21;
  NSObject *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  int v26;
  const __CFString *v27;
  __int16 v28;
  const __CFString *v29;

  if (-[VIOSessionTask isVLFSessionRunning](self, "isVLFSessionRunning")
    && +[VLFSessionTask isSupportedForTransportType:](VLFSessionTask, "isSupportedForTransportType:", a3))
  {
    return;
  }
  if (a3 != 2)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[VIOSessionTask analyticsCapturer](self, "analyticsCapturer"));
    objc_msgSend((id)v8, "stopRecording");

    LOBYTE(v8) = -[VIOSessionTask isVIOSessionRunning](self, "isVIOSessionRunning");
    v9 = -[VIOSessionTask isVLFSessionRunning](self, "isVLFSessionRunning");
    if ((v8 & 1) == 0 && !v9)
      goto LABEL_29;
    v10 = sub_1007810CC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      if ((unint64_t)(a3 - 1) > 4)
        v12 = CFSTR("Undefined");
      else
        v12 = off_1011C6438[a3 - 1];
      v26 = 138412290;
      v27 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Transport type changed (%@); pausing VIO session",
        (uint8_t *)&v26,
        0xCu);
    }

    goto LABEL_28;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask currentRoutePlanningSession](self, "currentRoutePlanningSession"));
  v6 = (void *)objc_opt_class(self);
  if (v5)
    v7 = objc_msgSend(v6, "isVIOModeEnabledInRoutePlanning");
  else
    v7 = objc_msgSend(v6, "isVIOModeEnabled");
  v13 = v7;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask session](self, "session"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask analyticsCapturer](self, "analyticsCapturer"));
  v16 = v15;
  if (!v13 || !v14)
  {
    objc_msgSend(v15, "stopRecording");

    v19 = -[VIOSessionTask isVIOSessionRunning](self, "isVIOSessionRunning");
    v20 = -[VIOSessionTask isVLFSessionRunning](self, "isVLFSessionRunning");
    if ((v19 & 1) == 0 && !v20)
      goto LABEL_29;
    v21 = sub_1007810CC();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask currentRoutePlanningSession](self, "currentRoutePlanningSession"));
      v24 = CFSTR("VIO mode in route planning");
      if (!v23)
        v24 = CFSTR("VIO mode");
      v26 = 138412546;
      v27 = CFSTR("Walk");
      v28 = 2112;
      v29 = v24;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Transport type changed (%@) but %@ is not enabled; pausing VIO session",
        (uint8_t *)&v26,
        0x16u);

    }
LABEL_28:
    -[VIOSessionTask pauseVIOSession](self, "pauseVIOSession");
LABEL_29:
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask monitors](self, "monitors"));
    objc_msgSend(v25, "removeAllObjects");

    return;
  }
  objc_msgSend(v15, "startRecording");

  if (!-[VIOSessionTask isVIOSessionRunning](self, "isVIOSessionRunning"))
  {
    v17 = sub_1007810CC();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v26 = 138412290;
      v27 = CFSTR("Walk");
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Transport type changed (%@); starting VIO session",
        (uint8_t *)&v26,
        0xCu);
    }

    -[VIOSessionTask startVIOSession](self, "startVIOSession");
  }
}

- (BOOL)isEligibleToStartVIO
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  char *v13;
  const __CFString *v14;
  id v15;
  const char *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  id v28;
  id v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  char *v33;
  id v34;
  id v35;
  char *v36;
  const __CFString *v37;
  id v38;
  const char *v39;
  id v40;
  NSObject *v41;
  id v42;
  NSObject *v43;
  char *v44;
  id v45;
  NSObject *v46;
  id v47;
  NSObject *v48;
  char *v49;
  id v50;
  NSObject *v51;
  id v52;
  NSObject *v53;
  char *v54;
  id v55;
  NSObject *v56;
  id v57;
  NSObject *v58;
  char *v59;
  id v60;
  NSObject *v61;
  id v62;
  NSObject *v63;
  char *v64;
  id v65;
  NSObject *v66;
  id v67;
  NSObject *v68;
  char *v69;
  int v70;
  const char *v71;
  __int16 v72;
  const char *v73;
  __int16 v74;
  int v75;
  __int16 v76;
  const char *v77;

  if ((objc_msgSend((id)objc_opt_class(self), "isVIOModeEnabled") & 1) == 0)
  {
    v40 = sub_1004318FC();
    v41 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v70 = 136315906;
      v71 = "-[VIOSessionTask isEligibleToStartVIO]";
      v72 = 2080;
      v73 = "VIOSessionTask.m";
      v74 = 1024;
      v75 = 395;
      v76 = 2080;
      v77 = "[[self class] isVIOModeEnabled]";
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v70, 0x26u);
    }

    if (sub_100A70734())
    {
      v42 = sub_1004318FC();
      v43 = objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        v44 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v70 = 138412290;
        v71 = v44;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v70, 0xCu);

      }
    }
  }
  if ((objc_msgSend((id)objc_opt_class(self), "isVIOModeEnabled") & 1) == 0)
  {
    v15 = sub_1007810CC();
    v11 = objc_claimAutoreleasedReturnValue(v15);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_39;
    LOWORD(v70) = 0;
    v16 = "Can't start a VIO session when VIO mode is not enabled";
    goto LABEL_38;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask session](self, "session"));

  if (!v3)
  {
    v45 = sub_1004318FC();
    v46 = objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      v70 = 136315906;
      v71 = "-[VIOSessionTask isEligibleToStartVIO]";
      v72 = 2080;
      v73 = "VIOSessionTask.m";
      v74 = 1024;
      v75 = 401;
      v76 = 2080;
      v77 = "self.session != nil";
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v70, 0x26u);
    }

    if (sub_100A70734())
    {
      v47 = sub_1004318FC();
      v48 = objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        v49 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v70 = 138412290;
        v71 = v49;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v70, 0xCu);

      }
    }
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask session](self, "session"));

  if (!v4)
  {
    v17 = sub_1007810CC();
    v11 = objc_claimAutoreleasedReturnValue(v17);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_39;
    LOWORD(v70) = 0;
    v16 = "Can't start a VIO session when the current session has been transitioned to be used for another purpose";
    goto LABEL_38;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask currentRoutePlanningSession](self, "currentRoutePlanningSession"));

  if (v5)
  {
    if ((objc_msgSend((id)objc_opt_class(self), "isVIOModeEnabledInRoutePlanning") & 1) == 0)
    {
      v50 = sub_1004318FC();
      v51 = objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        v70 = 136315906;
        v71 = "-[VIOSessionTask isEligibleToStartVIO]";
        v72 = 2080;
        v73 = "VIOSessionTask.m";
        v74 = 1024;
        v75 = 408;
        v76 = 2080;
        v77 = "self.class.isVIOModeEnabledInRoutePlanning";
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v70, 0x26u);
      }

      if (sub_100A70734())
      {
        v52 = sub_1004318FC();
        v53 = objc_claimAutoreleasedReturnValue(v52);
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          v54 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v70 = 138412290;
          v71 = v54;
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v70, 0xCu);

        }
      }
    }
    if ((objc_msgSend((id)objc_opt_class(self), "isVIOModeEnabledInRoutePlanning") & 1) != 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask currentRoutePlanningSession](self, "currentRoutePlanningSession"));
      v7 = objc_msgSend(v6, "currentTransportType");

      if (v7 != (id)2)
      {
        v55 = sub_1004318FC();
        v56 = objc_claimAutoreleasedReturnValue(v55);
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          v70 = 136315906;
          v71 = "-[VIOSessionTask isEligibleToStartVIO]";
          v72 = 2080;
          v73 = "VIOSessionTask.m";
          v74 = 1024;
          v75 = 414;
          v76 = 2080;
          v77 = "self.currentRoutePlanningSession.currentTransportType == TransportTypeWalk";
          _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v70, 0x26u);
        }

        if (sub_100A70734())
        {
          v57 = sub_1004318FC();
          v58 = objc_claimAutoreleasedReturnValue(v57);
          if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
          {
            v59 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
            v70 = 138412290;
            v71 = v59;
            _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v70, 0xCu);

          }
        }
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask currentRoutePlanningSession](self, "currentRoutePlanningSession"));
      v9 = objc_msgSend(v8, "currentTransportType");

      if (v9 != (id)2)
      {
        v10 = sub_1007810CC();
        v11 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask currentRoutePlanningSession](self, "currentRoutePlanningSession"));
          v13 = (char *)objc_msgSend(v12, "currentTransportType");
          if ((unint64_t)(v13 - 1) > 4)
            v14 = CFSTR("Undefined");
          else
            v14 = off_1011C6460[(_QWORD)(v13 - 1)];
          v70 = 138412290;
          v71 = (const char *)v14;
          v39 = "Can't start a VIO session during route planning when the transport type is %@";
LABEL_44:
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v39, (uint8_t *)&v70, 0xCu);

          goto LABEL_39;
        }
        goto LABEL_39;
      }
      return 1;
    }
    v28 = sub_1007810CC();
    v11 = objc_claimAutoreleasedReturnValue(v28);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_39;
    LOWORD(v70) = 0;
    v16 = "Can't start a VIO session during route planning when VIO mode during route planning is not enabled";
LABEL_38:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v70, 2u);
    goto LABEL_39;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask currentNavigationSession](self, "currentNavigationSession"));

  if (!v18)
  {
    v29 = sub_1004318FC();
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v70 = 136315650;
      v71 = "-[VIOSessionTask isEligibleToStartVIO]";
      v72 = 2080;
      v73 = "VIOSessionTask.m";
      v74 = 1024;
      v75 = 432;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v70, 0x1Cu);
    }

    if (sub_100A70734())
    {
      v31 = sub_1004318FC();
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v70 = 138412290;
        v71 = v33;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v70, 0xCu);

      }
    }
    v34 = sub_1007810CC();
    v11 = objc_claimAutoreleasedReturnValue(v34);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_39;
    LOWORD(v70) = 0;
    v16 = "Can't start a VIO session when we're neither in route planning nor in navigation";
    goto LABEL_38;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask currentNavigationSession](self, "currentNavigationSession"));
  v20 = objc_msgSend(v19, "currentTransportType");

  if (v20 != (id)2)
  {
    v60 = sub_1004318FC();
    v61 = objc_claimAutoreleasedReturnValue(v60);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      v70 = 136315906;
      v71 = "-[VIOSessionTask isEligibleToStartVIO]";
      v72 = 2080;
      v73 = "VIOSessionTask.m";
      v74 = 1024;
      v75 = 420;
      v76 = 2080;
      v77 = "self.currentNavigationSession.currentTransportType == TransportTypeWalk";
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v70, 0x26u);
    }

    if (sub_100A70734())
    {
      v62 = sub_1004318FC();
      v63 = objc_claimAutoreleasedReturnValue(v62);
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        v64 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v70 = 138412290;
        v71 = v64;
        _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v70, 0xCu);

      }
    }
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask currentNavigationSession](self, "currentNavigationSession"));
  v22 = objc_msgSend(v21, "currentTransportType");

  if (v22 == (id)2)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask currentNavigationSession](self, "currentNavigationSession"));
    v24 = objc_msgSend(v23, "navigationType");

    if (v24 != (id)3)
    {
      v65 = sub_1004318FC();
      v66 = objc_claimAutoreleasedReturnValue(v65);
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      {
        v70 = 136315906;
        v71 = "-[VIOSessionTask isEligibleToStartVIO]";
        v72 = 2080;
        v73 = "VIOSessionTask.m";
        v74 = 1024;
        v75 = 426;
        v76 = 2080;
        v77 = "self.currentNavigationSession.navigationType == MNNavigationType_TurnByTurn";
        _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v70, 0x26u);
      }

      if (sub_100A70734())
      {
        v67 = sub_1004318FC();
        v68 = objc_claimAutoreleasedReturnValue(v67);
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        {
          v69 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v70 = 138412290;
          v71 = v69;
          _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v70, 0xCu);

        }
      }
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask currentNavigationSession](self, "currentNavigationSession"));
    v26 = objc_msgSend(v25, "navigationType");

    if (v26 == (id)3)
      return 1;
    v38 = sub_1007810CC();
    v11 = objc_claimAutoreleasedReturnValue(v38);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_39;
    LOWORD(v70) = 0;
    v16 = "Can't start a VIO session during non-TBT navigation";
    goto LABEL_38;
  }
  v35 = sub_1007810CC();
  v11 = objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask currentNavigationSession](self, "currentNavigationSession"));
    v36 = (char *)objc_msgSend(v12, "currentTransportType");
    if ((unint64_t)(v36 - 1) > 4)
      v37 = CFSTR("Undefined");
    else
      v37 = off_1011C6460[(_QWORD)(v36 - 1)];
    v70 = 138412290;
    v71 = (const char *)v37;
    v39 = "Can't start a VIO session during navigation when the transport type is %@";
    goto LABEL_44;
  }
LABEL_39:

  return 0;
}

- (BOOL)isEligibleToStartVLF
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char *v7;
  void **p_vtable;
  id v10;
  NSObject *v11;
  const char *v12;
  id v13;
  NSObject *v14;
  uint32_t v15;
  id v16;
  const __CFString *v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  char *v22;
  id v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  char *v27;
  id v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  char *v32;
  int v33;
  const char *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  const char *v40;

  if ((objc_msgSend((id)objc_opt_class(self), "isVLFModeEnabled") & 1) == 0)
  {
    v18 = sub_1004318FC();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v33 = 136315906;
      v34 = "-[VIOSessionTask isEligibleToStartVLF]";
      v35 = 2080;
      v36 = "VIOSessionTask.m";
      v37 = 1024;
      v38 = 443;
      v39 = 2080;
      v40 = "[[self class] isVLFModeEnabled]";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v33, 0x26u);
    }

    if (sub_100A70734())
    {
      v20 = sub_1004318FC();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v33 = 138412290;
        v34 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v33, 0xCu);

      }
    }
  }
  if ((objc_msgSend((id)objc_opt_class(self), "isVLFModeEnabled") & 1) == 0)
  {
    v10 = sub_1007810CC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    LOWORD(v33) = 0;
    v12 = "Can't start a post-VLF VIO session when VLF mode is not enabled";
LABEL_13:
    v14 = v11;
    v15 = 2;
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v33, v15);
    goto LABEL_15;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask session](self, "session"));

  if (!v3)
  {
    v23 = sub_1004318FC();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v33 = 136315906;
      v34 = "-[VIOSessionTask isEligibleToStartVLF]";
      v35 = 2080;
      v36 = "VIOSessionTask.m";
      v37 = 1024;
      v38 = 449;
      v39 = 2080;
      v40 = "self.session != nil";
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v33, 0x26u);
    }

    if (sub_100A70734())
    {
      v25 = sub_1004318FC();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v33 = 138412290;
        v34 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v33, 0xCu);

      }
    }
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask session](self, "session"));

  if (!v4)
  {
    v13 = sub_1007810CC();
    v11 = objc_claimAutoreleasedReturnValue(v13);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    LOWORD(v33) = 0;
    v12 = "Can't start a post-VLF VIO session when the current session has been transitioned to be used for another purpose";
    goto LABEL_13;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask currentNavigationSession](self, "currentNavigationSession"));

  if (!v5)
    return 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask currentNavigationSession](self, "currentNavigationSession"));
  v7 = (char *)objc_msgSend(v6, "currentTransportType");

  p_vtable = &OBJC_METACLASS___RouteStepLabelListView.vtable;
  if (!+[VLFSessionTask isSupportedForTransportType:](VLFSessionTask, "isSupportedForTransportType:", v7))
  {
    v28 = sub_1004318FC();
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v33 = 136315906;
      v34 = "-[VIOSessionTask isEligibleToStartVLF]";
      v35 = 2080;
      v36 = "VIOSessionTask.m";
      v37 = 1024;
      v38 = 457;
      v39 = 2080;
      v40 = "[VLFSessionTask isSupportedForTransportType:currentTransportType]";
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v33, 0x26u);
    }

    if (sub_100A70734())
    {
      v30 = sub_1004318FC();
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v33 = 138412290;
        v34 = v32;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v33, 0xCu);

      }
      p_vtable = (void **)(&OBJC_METACLASS___RouteStepLabelListView + 24);
    }
  }
  if ((objc_msgSend(p_vtable + 212, "isSupportedForTransportType:", v7) & 1) != 0)
    return 1;
  v16 = sub_1007810CC();
  v11 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    if ((unint64_t)(v7 - 1) > 4)
      v17 = CFSTR("Undefined");
    else
      v17 = off_1011C6460[(_QWORD)(v7 - 1)];
    v33 = 138412290;
    v34 = (const char *)v17;
    v12 = "Can't start a post-VLF VIO session during navigation when the transport type is %@";
    v14 = v11;
    v15 = 12;
    goto LABEL_14;
  }
LABEL_15:

  return 0;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  unsigned int v14;
  void *v15;
  unsigned int v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  void *v21;
  objc_super v22;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  if (v13 != v11)
  {

LABEL_10:
    v22.receiver = self;
    v22.super_class = (Class)VIOSessionTask;
    -[VIOSessionTask observeValueForKeyPath:ofObject:change:context:](&v22, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
    goto LABEL_11;
  }
  v14 = objc_msgSend(v10, "isEqualToString:", CFSTR("MapsWalkingEnableImageBasedHeading"));

  if (!v14)
    goto LABEL_10;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", NSKeyValueChangeNewKey));
  v16 = objc_msgSend(v15, "BOOLValue");

  if (v16)
  {
    if (-[VIOSessionTask shouldStartVIOSession](self, "shouldStartVIOSession")
      && !-[VIOSessionTask isVIOSessionRunning](self, "isVIOSessionRunning"))
    {
      v17 = sub_1007810CC();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "User enabled VIO from Maps settings; starting VIO session",
          buf,
          2u);
      }

      -[VIOSessionTask startVIOSession](self, "startVIOSession");
    }
  }
  else
  {
    v19 = sub_1007810CC();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "User disabled VIO from Maps settings; pausing VIO session",
        buf,
        2u);
    }

    -[VIOSessionTask pauseVIOSession](self, "pauseVIOSession");
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask monitors](self, "monitors"));
    objc_msgSend(v21, "removeAllObjects");

  }
LABEL_11:

}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1007835F0;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)sessionWasInterrupted:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10078368C;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)sessionInterruptionEnded:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100783738;
  v4[3] = &unk_1011AC8B0;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

- (void)navigationSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4
{
  _QWORD v4[6];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1007837D0;
  v4[3] = &unk_1011AD518;
  v4[4] = self;
  v4[5] = a4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)routePlanningSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4 userInitiated:(BOOL)a5
{
  -[VIOSessionTask handleTransportTypeChanged:](self, "handleTransportTypeChanged:", a4);
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  id v24;
  void *v25;
  char *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;
  NSObject *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  NSObject *v51;
  id v52;
  void *v53;
  _BYTE v54[12];
  __int16 v55;
  const char *v56;
  __int16 v57;
  int v58;

  v7 = a4;
  v8 = a5;
  v9 = objc_opt_class(RoutePlanningSession);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    v10 = v8;
  else
    v10 = 0;
  v11 = v10;
  -[VIOSessionTask setCurrentRoutePlanningSession:](self, "setCurrentRoutePlanningSession:", v11);

  v12 = v8;
  v13 = objc_opt_class(NavigationSession);
  if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
    v14 = v12;
  else
    v14 = 0;
  v15 = v14;

  -[VIOSessionTask setCurrentNavigationSession:](self, "setCurrentNavigationSession:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask session](self, "session"));

  if (!v16)
    goto LABEL_48;
  if (-[VIOSessionTask isVLFSessionRunning](self, "isVLFSessionRunning"))
  {
    v17 = objc_claimAutoreleasedReturnValue(-[VIOSessionTask currentNavigationSession](self, "currentNavigationSession"));
    if (v17
      && (v18 = (void *)v17,
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask currentNavigationSession](self, "currentNavigationSession")),
          v20 = +[VLFSessionTask isSupportedForTransportType:](VLFSessionTask, "isSupportedForTransportType:", objc_msgSend(v19, "currentTransportType")), v19, v18, (v20 & 1) == 0))
    {
      v24 = sub_1007810CC();
      v23 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask currentNavigationSession](self, "currentNavigationSession"));
        v26 = (char *)objc_msgSend(v25, "currentTransportType");
        if ((unint64_t)(v26 - 1) > 4)
          v27 = CFSTR("Undefined");
        else
          v27 = off_1011C6460[(_QWORD)(v26 - 1)];
        *(_DWORD *)v54 = 138412290;
        *(_QWORD *)&v54[4] = v27;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Post-VLF VIO is running and we entered nav for a non-supported transport type (%@); pausing VIO session",
          v54,
          0xCu);

      }
    }
    else
    {
      v21 = objc_opt_class(NavigationSession);
      if ((objc_opt_isKindOfClass(v7, v21) & 1) == 0)
        goto LABEL_48;
      v22 = sub_1007810CC();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v54 = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Navigation ended during Post-VLF VIO; pausing VIO session",
          v54,
          2u);
      }
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask analyticsCapturer](self, "analyticsCapturer"));
    objc_msgSend(v28, "stopRecording");

    -[VIOSessionTask pauseVIOSession](self, "pauseVIOSession");
  }
  if (!-[VIOSessionTask shouldStartVIOSession](self, "shouldStartVIOSession"))
  {
    v34 = objc_opt_class(RoutePlanningSession);
    if ((objc_opt_isKindOfClass(v7, v34) & 1) != 0
      && (v35 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask currentNavigationSession](self, "currentNavigationSession")),
          v35,
          !v35))
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask analyticsCapturer](self, "analyticsCapturer"));
      objc_msgSend(v47, "stopRecording");

      if (-[VIOSessionTask isVIOSessionRunning](self, "isVIOSessionRunning"))
      {
        v48 = sub_1007810CC();
        v39 = objc_claimAutoreleasedReturnValue(v48);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v54 = 0;
          v40 = "Ended route planning; pausing VIO session";
          goto LABEL_45;
        }
        goto LABEL_46;
      }
    }
    else
    {
      v36 = objc_opt_class(NavigationSession);
      if ((objc_opt_isKindOfClass(v7, v36) & 1) != 0)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask analyticsCapturer](self, "analyticsCapturer"));
        objc_msgSend(v37, "stopRecording");

        if (-[VIOSessionTask isVIOSessionRunning](self, "isVIOSessionRunning"))
        {
          v38 = sub_1007810CC();
          v39 = objc_claimAutoreleasedReturnValue(v38);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v54 = 0;
            v40 = "Ended navigation; pausing VIO session";
LABEL_45:
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, v40, v54, 2u);
            goto LABEL_46;
          }
          goto LABEL_46;
        }
      }
      else
      {
        v41 = objc_opt_class(NavigationSession);
        if ((objc_opt_isKindOfClass(v12, v41) & 1) == 0)
          goto LABEL_48;
        v42 = objc_opt_class(RoutePlanningSession);
        if ((objc_opt_isKindOfClass(v7, v42) & 1) == 0)
          goto LABEL_48;
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask analyticsCapturer](self, "analyticsCapturer"));
        objc_msgSend(v43, "stopRecording");

        if (-[VIOSessionTask isVIOSessionRunning](self, "isVIOSessionRunning"))
        {
          v44 = sub_1007810CC();
          v39 = objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v54 = 0;
            v40 = "VIO session was running during route planning and now it shouldn't be during navigation; pausing VIO session";
            goto LABEL_45;
          }
LABEL_46:

          -[VIOSessionTask pauseVIOSession](self, "pauseVIOSession");
        }
      }
    }
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask monitors](self, "monitors", *(_QWORD *)v54));
    objc_msgSend(v49, "removeAllObjects");

    goto LABEL_48;
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask analyticsCapturer](self, "analyticsCapturer"));
  objc_msgSend(v29, "startRecording");

  if (!-[VIOSessionTask isVIOSessionRunning](self, "isVIOSessionRunning"))
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask currentRoutePlanningSession](self, "currentRoutePlanningSession"));

    if (v30)
    {
      v31 = sub_1007810CC();
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v54 = 0;
        v33 = "Entered pedestrian route planning; starting VIO session";
LABEL_39:
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, v33, v54, 2u);
      }
    }
    else
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask currentNavigationSession](self, "currentNavigationSession"));

      if (v45)
      {
        v46 = sub_1007810CC();
        v32 = objc_claimAutoreleasedReturnValue(v46);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v54 = 0;
          v33 = "Entered pedestrian navigation; starting VIO session";
          goto LABEL_39;
        }
      }
      else
      {
        v50 = sub_1004318FC();
        v51 = objc_claimAutoreleasedReturnValue(v50);
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v54 = 136315650;
          *(_QWORD *)&v54[4] = "-[VIOSessionTask platformController:didChangeCurrentSessionFromSession:toSession:]";
          v55 = 2080;
          v56 = "VIOSessionTask.m";
          v57 = 1024;
          v58 = 581;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", v54, 0x1Cu);
        }

        if (!sub_100A70734())
          goto LABEL_41;
        v52 = sub_1004318FC();
        v32 = objc_claimAutoreleasedReturnValue(v52);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)v54 = 138412290;
          *(_QWORD *)&v54[4] = v53;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%@", v54, 0xCu);

        }
      }
    }

LABEL_41:
    -[VIOSessionTask startVIOSession](self, "startVIOSession", *(_QWORD *)v54);
  }
LABEL_48:

}

- (void)sessionManager:(id)a3 didGainSessionOwnership:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unsigned int v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  char *v17;
  int v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask session](self, "session"));

  if (v7)
  {
    v13 = sub_1004318FC();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v18 = 136315906;
      v19 = "-[VIOSessionTask sessionManager:didGainSessionOwnership:]";
      v20 = 2080;
      v21 = "VIOSessionTask.m";
      v22 = 1024;
      v23 = 626;
      v24 = 2080;
      v25 = "self.session == nil";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v18, 0x26u);
    }

    if (sub_100A70734())
    {
      v15 = sub_1004318FC();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v18 = 138412290;
        v19 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v18, 0xCu);

      }
    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask session](self, "session"));

  if (!v8)
  {
    objc_storeStrong((id *)&self->_session, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask analyticsCapturer](self, "analyticsCapturer"));
    objc_msgSend(v9, "resumeRecording");

    v10 = objc_claimAutoreleasedReturnValue(-[VIOSessionTask session](self, "session"));
    objc_msgSend((id)v10, "_addObserver:", self);

    LOBYTE(v10) = -[VIOSessionTask shouldStartVIOSession](self, "shouldStartVIOSession");
    v11 = -[VIOSessionTask shouldStartVLFSession](self, "shouldStartVLFSession");
    if ((v10 & 1) != 0 || v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask analyticsCapturer](self, "analyticsCapturer"));
      objc_msgSend(v12, "startRecording");

      -[VIOSessionTask startVIOSession](self, "startVIOSession");
    }
    else
    {
      -[VIOSessionTask pauseVIOSession](self, "pauseVIOSession");
    }
  }

}

- (void)sessionManager:(id)a3 didResignSessionOwnership:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ARSession *session;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  char *v15;
  int v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask session](self, "session", a3, a4));

  if (!v5)
  {
    v11 = sub_1004318FC();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v16 = 136315906;
      v17 = "-[VIOSessionTask sessionManager:didResignSessionOwnership:]";
      v18 = 2080;
      v19 = "VIOSessionTask.m";
      v20 = 1024;
      v21 = 651;
      v22 = 2080;
      v23 = "self.session != nil";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v16, 0x26u);
    }

    if (sub_100A70734())
    {
      v13 = sub_1004318FC();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v16 = 138412290;
        v17 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v16, 0xCu);

      }
    }
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask session](self, "session"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask analyticsCapturer](self, "analyticsCapturer"));
    objc_msgSend(v7, "pauseRecording");

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask monitors](self, "monitors"));
    objc_msgSend(v8, "removeAllObjects");

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask session](self, "session"));
    objc_msgSend(v9, "_removeObserver:", self);

    session = self->_session;
    self->_session = 0;

  }
}

- (void)sceneDidActivateNotification:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  unsigned __int8 v7;
  unsigned int v8;
  void *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask session](self, "session", a3));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask session](self, "session"));
    v6 = objc_msgSend(v5, "state");

    if (!v6)
    {
      v7 = -[VIOSessionTask shouldStartVIOSession](self, "shouldStartVIOSession");
      v8 = -[VIOSessionTask shouldStartVLFSession](self, "shouldStartVLFSession");
      if ((v7 & 1) != 0 || v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionTask analyticsCapturer](self, "analyticsCapturer"));
        objc_msgSend(v9, "startRecording");

        -[VIOSessionTask startVIOSession](self, "startVIOSession");
      }
    }
  }
}

- (ARSession)session
{
  return self->_session;
}

- (PlatformController)platformController
{
  return (PlatformController *)objc_loadWeakRetained((id *)&self->_platformController);
}

- (void)setPlatformController:(id)a3
{
  objc_storeWeak((id *)&self->_platformController, a3);
}

- (NavigationSession)currentNavigationSession
{
  return self->_currentNavigationSession;
}

- (RoutePlanningSession)currentRoutePlanningSession
{
  return self->_currentRoutePlanningSession;
}

- (NSMutableSet)monitors
{
  return self->_monitors;
}

- (void)setMonitors:(id)a3
{
  objc_storeStrong((id *)&self->_monitors, a3);
}

- (VIOSessionAnalyticsCapturer)analyticsCapturer
{
  return self->_analyticsCapturer;
}

- (void)setAnalyticsCapturer:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsCapturer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsCapturer, 0);
  objc_storeStrong((id *)&self->_monitors, 0);
  objc_storeStrong((id *)&self->_currentRoutePlanningSession, 0);
  objc_storeStrong((id *)&self->_currentNavigationSession, 0);
  objc_destroyWeak((id *)&self->_platformController);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
