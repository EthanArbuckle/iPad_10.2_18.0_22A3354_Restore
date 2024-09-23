@implementation VLFSession

+ (ARGeoTrackingStatus)lastGeoTrackingStatus
{
  return (ARGeoTrackingStatus *)objc_getAssociatedObject(a1, off_1014AEB98);
}

+ (void)setLastGeoTrackingStatus:(id)a3
{
  objc_setAssociatedObject(a1, off_1014AEB98, a3, (void *)0x303);
}

+ (CLLocation)lastLocation
{
  return (CLLocation *)objc_getAssociatedObject(a1, off_1014AEBA0);
}

+ (void)setLastLocation:(id)a3
{
  objc_setAssociatedObject(a1, off_1014AEBA0, a3, (void *)0x303);
}

- (VLFSession)initWithMode:(int64_t)a3
{
  VLFSession *v4;
  id v5;
  NSObject *v6;
  const __CFString *v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  char *v12;
  UINotificationFeedbackGenerator *v13;
  UINotificationFeedbackGenerator *notificationGenerator;
  void *v15;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;

  v17.receiver = self;
  v17.super_class = (Class)VLFSession;
  v4 = -[VLFSession init](&v17, "init");
  if (v4)
  {
    v5 = sub_100610E40();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (a3)
      {
        if (a3 == 1)
        {
          v7 = CFSTR("VLFSessionModeNonUI");
        }
        else
        {
          v8 = sub_1004318FC();
          v9 = objc_claimAutoreleasedReturnValue(v8);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v19 = "NSString * _Nonnull NSStringFromVLFSessionMode(VLFSessionMode)";
            v20 = 2080;
            v21 = "VLFSession.h";
            v22 = 1024;
            v23 = 58;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
          }

          if (sub_100A70734())
          {
            v10 = sub_1004318FC();
            v11 = objc_claimAutoreleasedReturnValue(v10);
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              v12 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
              *(_DWORD *)buf = 138412290;
              v19 = v12;
              _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

            }
          }
          v7 = 0;
        }
      }
      else
      {
        v7 = CFSTR("VLFSessionModeUI");
      }
      *(_DWORD *)buf = 134349314;
      v19 = (const char *)v4;
      v20 = 2114;
      v21 = (const char *)v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%{public}p] Configuring with mode: %{public}@", buf, 0x16u);
    }

    v4->_mode = a3;
    if (a3)
    {
      v13 = (UINotificationFeedbackGenerator *)objc_alloc_init((Class)UINotificationFeedbackGenerator);
      notificationGenerator = v4->_notificationGenerator;
      v4->_notificationGenerator = v13;

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v15, "addObserver:forKeyPath:options:context:", v4, CFSTR("PedestrianARAutoFocusDistanceKey"), 0, 0);

  }
  return v4;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  VLFSession *v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  VLFSession *v17;
  objc_super v18;
  uint8_t buf[4];
  VLFSession *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;

  v3 = sub_100610E40();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v20 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Deallocating", buf, 0xCu);
  }

  -[CMPocketStateManager setDelegate:](self->_pocketStateManager, "setDelegate:", 0);
  if (self->_session)
  {
    v6 = sub_1004318FC();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v20 = (VLFSession *)"-[VLFSession dealloc]";
      v21 = 2080;
      v22 = "VLFSession.m";
      v23 = 1024;
      v24 = 107;
      v25 = 2080;
      v26 = "_session == nil";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v8 = sub_1004318FC();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = (VLFSession *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v20 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
    if (self->_session)
    {
      v11 = sub_100610E40();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134349056;
        v20 = self;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "[%{public}p] VLFSession being dealloc'd while still being the active ARSession owner", buf, 0xCu);
      }

      v13 = sub_1004318FC();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v20 = (VLFSession *)"-[VLFSession dealloc]";
        v21 = 2080;
        v22 = "VLFSession.m";
        v23 = 1024;
        v24 = 110;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
      }

      if (sub_100A70734())
      {
        v15 = sub_1004318FC();
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = (VLFSession *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v20 = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v5, "removeObserver:forKeyPath:", self, CFSTR("PedestrianARAutoFocusDistanceKey"));

  v18.receiver = self;
  v18.super_class = (Class)VLFSession;
  -[VLFSession dealloc](&v18, "dealloc");
}

- (BOOL)isRunning
{
  return self->_session != 0;
}

- (void)start
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  VisualLocalizationTraceRecorder *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  VLFSessionAnalyticsCapturer *v11;
  void *v12;
  uint64_t BOOL;
  int v14;
  uint64_t v15;
  int v16;
  int64_t v17;
  int v18;
  VLFSessionIndoorOutdoorAnalyticsRecorder *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  GEOVLFInitializationFailureDetails *initializationFailureDetails;
  void *v32;
  _QWORD v33[4];
  id v34;
  uint8_t buf[4];
  VLFSession *v36;

  v3 = sub_100610E40();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349056;
    v36 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%{public}p] Starting", buf, 0xCu);
  }

  if (GEOConfigGetBOOL(MapsConfig_VLTraceRecordingEnabled, off_1014B3698))
  {
    v5 = sub_100610E40();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      v36 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%{public}p] Recording VL trace", buf, 0xCu);
    }

    v7 = objc_alloc_init(VisualLocalizationTraceRecorder);
    -[VLFSession setTraceRecorder:](self, "setTraceRecorder:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSession traceRecorder](self, "traceRecorder"));
    objc_msgSend(v8, "start");

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSession analyticsCapturer](self, "analyticsCapturer"));
  v10 = v9 == 0;

  if (v10)
  {
    v11 = objc_alloc_init(VLFSessionAnalyticsCapturer);
    -[VLFSession setAnalyticsCapturer:](self, "setAnalyticsCapturer:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSession analyticsCapturer](self, "analyticsCapturer"));
    objc_msgSend(v12, "sessionStartedWithEntryPoint:", self->_entryPoint);

  }
  BOOL = GEOConfigGetBOOL(MapsConfig_VLFSessionIndoorOutdoorAnalyticsRecorderEnabled, off_1014B4968);
  v14 = BOOL;
  if (GEOVisualLocalizationCrowdsourcingIsSupported(BOOL, v15)
    && GEOVisualLocalizationCrowdsourcingIsAllowed())
  {
    v16 = GEOVisualLocalizationCrowdsourcingIsEnabled() ^ 1;
  }
  else
  {
    v16 = 1;
  }
  v17 = -[VLFSession mode](self, "mode");
  v18 = v14 ^ 1;
  if (v17)
    v18 = 1;
  if (((v18 | v16) & 1) == 0)
  {
    v19 = objc_alloc_init(VLFSessionIndoorOutdoorAnalyticsRecorder);
    -[VLFSession setIndoorOutdoorRecorder:](self, "setIndoorOutdoorRecorder:", v19);

  }
  if (GEOConfigGetBOOL(MapsConfig_VLFLocalizationPocketStateAnalyticsEnabled, off_1014B47D8)
    && +[CMPocketStateManager isPocketStateAvailable](CMPocketStateManager, "isPocketStateAvailable"))
  {
    v20 = objc_alloc_init((Class)CMPocketStateManager);
    -[VLFSession setPocketStateManager:](self, "setPocketStateManager:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSession pocketStateManager](self, "pocketStateManager"));
    objc_msgSend(v21, "setDelegate:", self);

    objc_initWeak((id *)buf, self);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSession pocketStateManager](self, "pocketStateManager"));
    v23 = &_dispatch_main_q;
    -[VLFSession timeout](self, "timeout");
    v24 = 15.0;
    if (v25 < 15.0)
    {
      -[VLFSession timeout](self, "timeout");
      v24 = v26;
    }
    -[VLFSession timeout](self, "timeout");
    v27 = 15.0;
    if (v28 < 15.0)
    {
      -[VLFSession timeout](self, "timeout");
      v27 = v29;
    }
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1006115B0;
    v33[3] = &unk_1011B0F78;
    objc_copyWeak(&v34, (id *)buf);
    objc_msgSend(v22, "queryStateOntoQueue:andMonitorFor:withTimeout:andHandler:", &_dispatch_main_q, v33, v24, v27);

    objc_destroyWeak(&v34);
    objc_destroyWeak((id *)buf);
  }
  if (-[VLFSession mode](self, "mode"))
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSession notificationGenerator](self, "notificationGenerator"));
    objc_msgSend(v30, "prepare");

  }
  -[VLFSession setNotifiedDelegate:](self, "setNotifiedDelegate:", 0);
  initializationFailureDetails = self->_initializationFailureDetails;
  self->_initializationFailureDetails = 0;

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[MapsARSessionManager sharedManager](MapsARSessionManager, "sharedManager"));
  objc_msgSend(v32, "requestSessionWithOwner:", self);

}

- (void)stop
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  VLFSession *v14;

  v3 = sub_100610E40();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 134349056;
    v14 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%{public}p] Stopping", (uint8_t *)&v13, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsARSessionManager sharedManager](MapsARSessionManager, "sharedManager"));
  objc_msgSend(v5, "resignSessionWithOwner:", self);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSession traceRecorder](self, "traceRecorder"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSession traceRecorder](self, "traceRecorder"));
    objc_msgSend(v7, "finish");

    -[VLFSession setTraceRecorder:](self, "setTraceRecorder:", 0);
    +[VLLocalizer _setDebugInfoRecorder:](VLLocalizer, "_setDebugInfoRecorder:", 0);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSession pocketStateManager](self, "pocketStateManager"));
  objc_msgSend(v8, "setDelegate:", 0);

  -[VLFSession setPocketStateManager:](self, "setPocketStateManager:", 0);
  if (!-[VLFSession hasNotifiedDelegate](self, "hasNotifiedDelegate"))
  {
    v9 = sub_100610E40();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 134349056;
      v14 = self;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%{public}p] Detected user cancelled", (uint8_t *)&v13, 0xCu);
    }

    self->_lastLocalizationResult = 2;
    -[VLFSession setWasLastLocalizationSuccessful:](self, "setWasLastLocalizationSuccessful:", 0);
    -[VLFSession setNotifiedDelegate:](self, "setNotifiedDelegate:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSession delegate](self, "delegate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Maps.VLFSession"), 2, 0));
    objc_msgSend(v11, "VLFSessionLocalizationFailedWithError:", v12);

  }
  if ((id)-[VLFSession mode](self, "mode") == (id)1)
    -[VLFSession sendAnalytics:](self, "sendAnalytics:", 0);
}

- (void)sendAnalytics:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSession analyticsCapturer](self, "analyticsCapturer"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSession analyticsCapturer](self, "analyticsCapturer"));
    objc_msgSend(v5, "sessionEndedWithResult:initializationFailureDetails:arFailureTypes:", self->_lastLocalizationResult, self->_initializationFailureDetails, v6);

    -[VLFSession setAnalyticsCapturer:](self, "setAnalyticsCapturer:", 0);
  }
  -[VLFSession setIndoorOutdoorRecorder:](self, "setIndoorOutdoorRecorder:", 0);

}

- (double)timeout
{
  return GEOConfigGetDouble(MapsConfig_VLFLocalizationTimeout, off_1014B3688);
}

- (ARConfiguration)configuration
{
  ARConfiguration *configuration;
  ARConfiguration **p_configuration;
  id v5;
  double Double;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  double v16;
  void *v17;
  unsigned int v18;
  id v19;
  NSObject *v20;
  int64_t v21;
  __CFString *v22;
  ARConfiguration *v23;
  __CFString *v24;
  double v25;
  double v26;
  id v27;
  ARConfiguration *v28;
  ARConfiguration *v29;
  uint64_t String;
  void *v31;
  id v32;
  id v33;
  NSObject *v34;
  uint64_t v35;
  double v36;
  id v37;
  ARConfiguration *v38;
  void *v39;
  ARConfiguration *v40;
  NSObject *v41;
  id v42;
  id v44;
  uint8_t buf[4];
  VLFSession *v46;
  __int16 v47;
  double v48;
  __int16 v49;
  double v50;
  _QWORD v51[3];

  p_configuration = &self->_configuration;
  configuration = self->_configuration;
  if (!configuration)
  {
    v5 = objc_alloc_init((Class)ARGeoTrackingConfiguration);
    objc_msgSend(v5, "setSupportEnablementOptions:", 4);
    if ((id)-[VLFSession mode](self, "mode") == (id)1)
    {
      objc_msgSend(v5, "setVisualLocalizationCallInterval:", GEOConfigGetDouble(MapsConfig_VLFSessionVisualLocalizationCallInterval, off_1014B3CE8));
      objc_msgSend(v5, "setUseLidarIfAvailable:", GEOConfigGetBOOL(MapsConfig_PedestrianARLidarEnabled, off_1014B4868));
      Double = GEOConfigGetDouble(MapsConfig_VLFSessionFrameRate, off_1014B3B28);
      v7 = sub_100610E40();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134349312;
        v46 = self;
        v47 = 2048;
        v48 = Double;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[%{public}p] Configuring VLF with framerate: %f", buf, 0x16u);
      }

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Double));
      v51[0] = v9;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Double));
      v51[1] = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Double));
      v51[2] = v11;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v51, 3));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "videoFormat"));
      objc_msgSend(v13, "setFrameRatesByPowerUsage:", v12);

    }
    else
    {
      objc_msgSend(v5, "setVisualLocalizationCallInterval:", GEOConfigGetDouble(MapsConfig_PedestrianARVisualLocalizationCallInterval, off_1014B3F98));
      objc_msgSend(v5, "setEnvironmentTexturing:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      objc_msgSend(v5, "setAutoFocusEnabled:", objc_msgSend(v9, "BOOLForKey:", CFSTR("PedestrianARAutoFocusEnabledKey")));
    }

    v14 = sub_100610E40();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v5, "visualLocalizationCallInterval");
      *(_DWORD *)buf = 134349312;
      v46 = self;
      v47 = 2048;
      v48 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "[%{public}p] Configuring VLF with call interval: %f", buf, 0x16u);
    }

    objc_storeStrong((id *)p_configuration, v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v18 = objc_msgSend(v17, "BOOLForKey:", CFSTR("MapsARSessionRecordingEnabledKey"));

    if (v18)
    {
      v19 = sub_100610E40();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        v46 = self;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "[%{public}p] ARKit session recording is enabled; trying to create recording configuration",
          buf,
          0xCu);
      }

      v21 = -[VLFSession mode](self, "mode");
      v22 = CFSTR("pedestrianar");
      if (v21 == 1)
        v22 = CFSTR("vlf");
      v23 = self->_configuration;
      v24 = v22;
      v25 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now")));
      objc_msgSend(*(id *)&v25, "timeIntervalSince1970");
      v27 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%.0f.mov"), v24, v26 * 1000.0));

      v28 = (ARConfiguration *)objc_claimAutoreleasedReturnValue(-[ARConfiguration recordingConfigurationWithFileName:](v23, "recordingConfigurationWithFileName:", v27));
      v29 = self->_configuration;
      self->_configuration = v28;
    }
    else
    {
      if (!_GEOConfigHasValue(MapsConfig_MapsARSessionPlaybackFilePathKey, off_1014B55D8))
      {
LABEL_24:

        configuration = *p_configuration;
        return configuration;
      }
      String = GEOConfigGetString(MapsConfig_MapsARSessionPlaybackFilePathKey, off_1014B55D8);
      v25 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(String));
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v32 = objc_msgSend(v31, "integerForKey:", CFSTR("MapsARSessionPlaybackModeKey"));

      v33 = sub_100610E40();
      v34 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        v35 = NSStringFromARReplayMode(v32);
        v36 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(v35));
        *(_DWORD *)buf = 134349570;
        v46 = self;
        v47 = 2112;
        v48 = v36;
        v49 = 2112;
        v50 = v25;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "[%{public}p] Replaying ARSession recording with mode: %@, file: %@", buf, 0x20u);

      }
      v37 = objc_alloc((Class)ARReplayConfiguration);
      v38 = *p_configuration;
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", *(_QWORD *)&v25));
      v44 = 0;
      v29 = (ARConfiguration *)objc_msgSend(v37, "initWithBaseConfiguration:fileURL:replayMode:outError:", v38, v39, v32, &v44);
      v27 = v44;

      if (v29)
      {
        v40 = v29;
        v41 = *p_configuration;
        *p_configuration = v40;
      }
      else
      {
        v42 = sub_100610E40();
        v41 = objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134349570;
          v46 = self;
          v47 = 2112;
          v48 = v25;
          v49 = 2112;
          v50 = *(double *)&v27;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "[%{public}p] Error configuring replay configuration for file path %@: %@", buf, 0x20u);
        }
      }

    }
    goto LABEL_24;
  }
  return configuration;
}

- (void)endRecordingIfNecessary
{
  ARConfiguration *configuration;
  uint64_t v4;
  ARConfiguration *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  configuration = self->_configuration;
  v4 = objc_opt_class(ARRecordingConfiguration);
  if ((objc_opt_isKindOfClass(configuration, v4) & 1) != 0)
  {
    v5 = self->_configuration;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ARConfiguration fileURL](v5, "fileURL"));
    objc_initWeak(&location, self);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100611FAC;
    v8[3] = &unk_1011B2260;
    objc_copyWeak(&v10, &location);
    v7 = v6;
    v9 = v7;
    -[ARConfiguration finishRecordingWithHandler:](v5, "finishRecordingWithHandler:", v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);

  }
}

- (void)startLocationUpdates
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[VLFLocationManager sharedLocationManager](VLFLocationManager, "sharedLocationManager"));
  objc_msgSend(v3, "addObserver:", self);

  v4 = (id)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  objc_msgSend(v4, "listenForLocationUpdates:", self);

}

- (void)stopLocationUpdates
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[VLFLocationManager sharedLocationManager](VLFLocationManager, "sharedLocationManager"));
  objc_msgSend(v3, "removeObserver:", self);

  v4 = (id)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  objc_msgSend(v4, "stopListeningForLocationUpdates:", self);

}

- (void)checkForSuccessWithFusionLocation:(id)a3 accuracyLocation:(id)a4
{
  id v6;
  id v7;
  const char *label;
  const char *v9;
  BOOL v10;
  void *v11;
  unsigned int v12;
  id v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  os_log_type_t v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  VLFSession *v22;
  id v23;
  uint32_t v24;
  id v25;
  id v26;
  uint64_t UInteger;
  id v28;
  NSObject *v29;
  unsigned int v30;
  void *v31;
  void *v32;
  uint64_t v33;
  char isKindOfClass;
  void *v35;
  unsigned int v36;
  id v37;
  NSObject *v38;
  id v39;
  NSObject *v40;
  _BOOL4 v41;
  int v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  NSObject *v47;
  double v48;
  double v49;
  double Double;
  id v51;
  NSObject *v52;
  _BOOL4 v53;
  const char *v54;
  char v55;
  int v56;
  id v57;
  id v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  NSObject *v64;
  id v65;
  NSObject *v66;
  VLFSession *v67;
  int v68;
  VLFSession *v69;
  __int16 v70;
  const char *v71;
  __int16 v72;
  _BYTE v73[24];
  __int16 v74;
  const char *v75;

  v6 = a3;
  v7 = a4;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v9 = dispatch_queue_get_label(0);
  if (label != v9)
  {
    v10 = !label || v9 == 0;
    if (v10 || strcmp(label, v9))
    {
      v63 = sub_1004318FC();
      v64 = objc_claimAutoreleasedReturnValue(v63);
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        v68 = 136316418;
        v69 = (VLFSession *)"-[VLFSession checkForSuccessWithFusionLocation:accuracyLocation:]";
        v70 = 2080;
        v71 = "VLFSession.m";
        v72 = 1024;
        *(_DWORD *)v73 = 290;
        *(_WORD *)&v73[4] = 2080;
        *(_QWORD *)&v73[6] = "dispatch_get_main_queue()";
        *(_WORD *)&v73[14] = 2080;
        *(_QWORD *)&v73[16] = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v74 = 2080;
        v75 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v68,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v65 = sub_1004318FC();
        v66 = objc_claimAutoreleasedReturnValue(v65);
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        {
          v67 = (VLFSession *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v68 = 138412290;
          v69 = v67;
          _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v68, 0xCu);

        }
      }
    }
  }
  if ((id)-[VLFSession mode](self, "mode") != (id)1)
  {
    v18 = sub_1004318FC();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v68 = 136315650;
      v69 = (VLFSession *)"-[VLFSession checkForSuccessWithFusionLocation:accuracyLocation:]";
      v70 = 2080;
      v71 = "VLFSession.m";
      v72 = 1024;
      *(_DWORD *)v73 = 293;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v68, 0x1Cu);
    }

    if (sub_100A70734())
    {
      v20 = sub_1004318FC();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = (VLFSession *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v68 = 138412290;
        v69 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v68, 0xCu);

      }
    }
    v23 = sub_100610E40();
    v14 = objc_claimAutoreleasedReturnValue(v23);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_28;
    v68 = 134349314;
    v69 = self;
    v70 = 2112;
    v71 = CFSTR("VLFSessionModeNonUI");
    v15 = "[%{public}p] Mode must be %@ to check location based success criteria";
    v16 = v14;
    v17 = OS_LOG_TYPE_ERROR;
    v24 = 22;
    goto LABEL_27;
  }
  if (!v6)
  {
    v25 = sub_100610E40();
    v14 = objc_claimAutoreleasedReturnValue(v25);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      goto LABEL_28;
    v68 = 134349056;
    v69 = self;
    v15 = "[%{public}p] fusionLocation was nil; ignoring";
LABEL_25:
    v16 = v14;
    v17 = OS_LOG_TYPE_DEBUG;
    goto LABEL_26;
  }
  if (!v7)
  {
    v26 = sub_100610E40();
    v14 = objc_claimAutoreleasedReturnValue(v26);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      goto LABEL_28;
    v68 = 134349056;
    v69 = self;
    v15 = "[%{public}p] accuracyLocation was nil; ignoring";
    goto LABEL_25;
  }
  objc_msgSend((id)objc_opt_class(self), "setLastLocation:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v12 = objc_msgSend(v11, "BOOLForKey:", CFSTR("VLFSessionKeepARSessionRunningForeverKey"));

  if (v12)
  {
    v13 = sub_100610E40();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v68 = 134349056;
      v69 = self;
      v15 = "[%{public}p] Debug switch to keep the session running forever is set; ignoring location update";
      v16 = v14;
      v17 = OS_LOG_TYPE_INFO;
LABEL_26:
      v24 = 12;
LABEL_27:
      _os_log_impl((void *)&_mh_execute_header, v16, v17, v15, (uint8_t *)&v68, v24);
    }
LABEL_28:

    goto LABEL_29;
  }
  UInteger = GEOConfigGetUInteger(MapsConfig_VLFSessionSuccessCriteria, off_1014B3B88);
  v28 = sub_100610E40();
  v29 = objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v68 = 134349312;
    v69 = self;
    v70 = 2048;
    v71 = (const char *)UInteger;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "[%{public}p] Checking success criteria for mode: %lu", (uint8_t *)&v68, 0x16u);
  }

  v30 = objc_msgSend(v6, "isCoordinateFused");
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSession session](self, "session"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "configuration"));
  v33 = objc_opt_class(ARReplayConfiguration);
  isKindOfClass = objc_opt_isKindOfClass(v32, v33);

  if ((isKindOfClass & 1) == 0)
  {
    if (!v30)
      goto LABEL_42;
LABEL_38:
    v39 = sub_100610E40();
    v40 = objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      v68 = 134349056;
      v69 = self;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "[%{public}p] Location is fused", (uint8_t *)&v68, 0xCu);
    }

    v41 = UInteger != 1;
    v42 = 1;
    goto LABEL_46;
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v36 = objc_msgSend(v35, "BOOLForKey:", CFSTR("VLFSessionIgnoreFusedLocationForReplayKey"));

  if (v36)
  {
    v37 = sub_100610E40();
    v38 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      v68 = 134349056;
      v69 = self;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "[%{public}p] Replaying from a recording; pretending as though the location is fused",
        (uint8_t *)&v68,
        0xCu);
    }

    goto LABEL_38;
  }
  v43 = objc_msgSend((id)objc_opt_class(self), "lastGeoTrackingStatus");
  v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
  v45 = objc_msgSend(v44, "state");

  if (v45 == (id)3)
    goto LABEL_38;
LABEL_42:
  v46 = sub_100610E40();
  v47 = objc_claimAutoreleasedReturnValue(v46);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
  {
    v68 = 134349056;
    v69 = self;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "[%{public}p] Location is not fused", (uint8_t *)&v68, 0xCu);
  }

  if (UInteger == 1)
    goto LABEL_29;
  v42 = 0;
  v41 = 1;
LABEL_46:
  objc_msgSend(v7, "horizontalAccuracy");
  v49 = v48;
  Double = GEOConfigGetDouble(MapKitConfig_UserLocation_MinAccuracyUncertainty[0], MapKitConfig_UserLocation_MinAccuracyUncertainty[1]);
  v51 = sub_100610E40();
  v52 = objc_claimAutoreleasedReturnValue(v51);
  v53 = os_log_type_enabled(v52, OS_LOG_TYPE_INFO);
  if (v49 > Double)
  {
    if (!v53)
      goto LABEL_52;
    v68 = 134349569;
    v69 = self;
    v70 = 2049;
    v71 = *(const char **)&v49;
    v72 = 2049;
    *(double *)v73 = Double;
    v54 = "[%{public}p] Horizontal accuracy (%{private}f) is above the minimum threshold: (%{private}f)";
  }
  else
  {
    if (!v53)
      goto LABEL_52;
    v68 = 134349569;
    v69 = self;
    v70 = 2049;
    v71 = *(const char **)&v49;
    v72 = 2049;
    *(double *)v73 = Double;
    v54 = "[%{public}p] Horizontal accuracy (%{private}f) fell below minimum threshold: (%{private}f)";
  }
  _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, v54, (uint8_t *)&v68, 0x20u);
LABEL_52:

  if (v49 <= Double)
    v55 = 1;
  else
    v55 = v42;
  if (UInteger || (v55 & 1) == 0)
  {
    v56 = v42 ^ 1;
    if (v49 > Double)
      v56 = 1;
    if (((v41 | v56) & 1) != 0)
    {
      v57 = sub_100610E40();
      v14 = objc_claimAutoreleasedReturnValue(v57);
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        goto LABEL_28;
      v68 = 134349056;
      v69 = self;
      v15 = "[%{public}p] Not localized yet";
      goto LABEL_25;
    }
  }
  v58 = sub_100610E40();
  v59 = objc_claimAutoreleasedReturnValue(v58);
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSession session](self, "session"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "currentFrame"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "location"));
    v68 = 134349827;
    v69 = self;
    v70 = 2113;
    v71 = (const char *)v6;
    v72 = 2113;
    *(_QWORD *)v73 = v7;
    *(_WORD *)&v73[8] = 2113;
    *(_QWORD *)&v73[10] = v62;
    _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "[%{public}p] Localization succeeded with CL fusion location: (%{private}@), accuracy location: (%{private}@), ARKit location: (%{private}@)", (uint8_t *)&v68, 0x2Au);

  }
  -[VLFSession stopLocationUpdates](self, "stopLocationUpdates");
  -[VLFSession registerSuccessWithVLFLocation:](self, "registerSuccessWithVLFLocation:", v6);
LABEL_29:

}

- (void)registerSuccessWithVLFLocation:(id)a3
{
  char *v4;
  const char *label;
  const char *v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  VLFSession *v18;
  int v19;
  VLFSession *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;

  v4 = (char *)a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v14 = sub_1004318FC();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v19 = 136316418;
        v20 = (VLFSession *)"-[VLFSession registerSuccessWithVLFLocation:]";
        v21 = 2080;
        v22 = "VLFSession.m";
        v23 = 1024;
        v24 = 363;
        v25 = 2080;
        v26 = "dispatch_get_main_queue()";
        v27 = 2080;
        v28 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v29 = 2080;
        v30 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v19,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v16 = sub_1004318FC();
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v18 = (VLFSession *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v19 = 138412290;
          v20 = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v19, 0xCu);

        }
      }
    }
  }
  if (!-[VLFSession hasNotifiedDelegate](self, "hasNotifiedDelegate"))
  {
    v8 = sub_100610E40();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v19 = 134349314;
      v20 = self;
      v21 = 2112;
      v22 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Registering success with vlf location: %@", (uint8_t *)&v19, 0x16u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSession session](self, "session"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "technique"));
    objc_msgSend(v11, "setVlfLocation:", v4);

    -[VLFSession setWasLastLocalizationSuccessful:](self, "setWasLastLocalizationSuccessful:", 1);
    self->_lastLocalizationResult = 4;
    -[VLFSession setNotifiedDelegate:](self, "setNotifiedDelegate:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSession delegate](self, "delegate"));
    objc_msgSend(v12, "VLFSessionLocalizationSucceeded");

    -[VLFSession stop](self, "stop");
    if (-[VLFSession mode](self, "mode"))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSession notificationGenerator](self, "notificationGenerator"));
      objc_msgSend(v13, "notificationOccurred:", 0);

    }
  }

}

- (void)registerFailureWithResult:(int64_t)a3 error:(id)a4 initializationFailureDetails:(id)a5
{
  id v8;
  id v9;
  const char *label;
  const char *v11;
  BOOL v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  VLFSession *v22;
  int v23;
  VLFSession *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  _BYTE v28[14];
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;

  v8 = a4;
  v9 = a5;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v11 = dispatch_queue_get_label(0);
  if (label != v11)
  {
    v12 = !label || v11 == 0;
    if (v12 || strcmp(label, v11))
    {
      v18 = sub_1004318FC();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v23 = 136316418;
        v24 = (VLFSession *)"-[VLFSession registerFailureWithResult:error:initializationFailureDetails:]";
        v25 = 2080;
        v26 = "VLFSession.m";
        v27 = 1024;
        *(_DWORD *)v28 = 385;
        *(_WORD *)&v28[4] = 2080;
        *(_QWORD *)&v28[6] = "dispatch_get_main_queue()";
        v29 = 2080;
        v30 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v31 = 2080;
        v32 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v23,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v20 = sub_1004318FC();
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v22 = (VLFSession *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v23 = 138412290;
          v24 = v22;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v23, 0xCu);

        }
      }
    }
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSession session](self, "session"));
  objc_msgSend(v13, "_removeObserver:", self);

  if (!-[VLFSession hasNotifiedDelegate](self, "hasNotifiedDelegate"))
  {
    v14 = sub_100610E40();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v23 = 134349570;
      v24 = self;
      v25 = 2048;
      v26 = (const char *)a3;
      v27 = 2112;
      *(_QWORD *)v28 = v8;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[%{public}p] Registering failure with result: %ld, error: %@", (uint8_t *)&v23, 0x20u);
    }

    -[VLFSession setWasLastLocalizationSuccessful:](self, "setWasLastLocalizationSuccessful:", 0);
    self->_lastLocalizationResult = a3;
    objc_storeStrong((id *)&self->_initializationFailureDetails, a5);
    -[VLFSession setNotifiedDelegate:](self, "setNotifiedDelegate:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSession delegate](self, "delegate"));
    objc_msgSend(v16, "VLFSessionLocalizationFailedWithError:", v8);

    -[VLFSession stop](self, "stop");
    if (-[VLFSession mode](self, "mode"))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSession notificationGenerator](self, "notificationGenerator"));
      objc_msgSend(v17, "notificationOccurred:", 2);

    }
  }

}

- (void)_processVLDebugInfo:(id)a3
{
  VLLocalizationDebugInfo *v5;
  const char *label;
  const char *v7;
  BOOL v8;
  VLLocalizationDebugInfo *lastDebugInfo;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  char *v16;
  int v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;

  v5 = (VLLocalizationDebugInfo *)a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v7 = dispatch_queue_get_label(0);
  if (label != v7)
  {
    v8 = !label || v7 == 0;
    if (v8 || strcmp(label, v7))
    {
      v12 = sub_1004318FC();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v17 = 136316418;
        v18 = "-[VLFSession _processVLDebugInfo:]";
        v19 = 2080;
        v20 = "VLFSession.m";
        v21 = 1024;
        v22 = 409;
        v23 = 2080;
        v24 = "dispatch_get_main_queue()";
        v25 = 2080;
        v26 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v27 = 2080;
        v28 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v17,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v14 = sub_1004318FC();
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v16 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v17 = 138412290;
          v18 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v17, 0xCu);

        }
      }
    }
  }
  if (v5)
  {
    lastDebugInfo = self->_lastDebugInfo;
    if (lastDebugInfo != v5
      && (-[VLLocalizationDebugInfo isEqual:](lastDebugInfo, "isEqual:", v5) & 1) == 0)
    {
      objc_storeStrong((id *)&self->_lastDebugInfo, a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSession traceRecorder](self, "traceRecorder"));
      objc_msgSend(v10, "recordAttempt:", self->_lastDebugInfo);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSession analyticsCapturer](self, "analyticsCapturer"));
      objc_msgSend(v11, "recordAttempt:", self->_lastDebugInfo);

    }
  }

}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  id v6;
  const char *label;
  const char *v8;
  BOOL v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[4];
  id v16[2];
  _BYTE location[12];
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;

  v6 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v8 = dispatch_queue_get_label(0);
  if (label == v8 || (label ? (v9 = v8 == 0) : (v9 = 1), !v9 && !strcmp(label, v8)))
  {
    v10 = sub_1004318FC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136316162;
      *(_QWORD *)&location[4] = "-[VLFSession session:didChangeState:]";
      v18 = 2080;
      v19 = "VLFSession.m";
      v20 = 1024;
      v21 = 421;
      v22 = 2080;
      v23 = "dispatch_get_main_queue()";
      v24 = 2080;
      v25 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion not on queue failed: %s/%s", location, 0x30u);

    }
    if (sub_100A70734())
    {
      v12 = sub_1004318FC();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)location = 138412290;
        *(_QWORD *)&location[4] = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", location, 0xCu);

      }
    }
  }
  objc_initWeak((id *)location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100613474;
  v15[3] = &unk_1011B72B0;
  objc_copyWeak(v16, (id *)location);
  v16[1] = (id)a4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v15);

  objc_destroyWeak(v16);
  objc_destroyWeak((id *)location);

}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v6;
  id v7;
  const char *label;
  const char *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  void *v21;
  _QWORD block[4];
  id v23;
  id v24;
  id v25;
  _BYTE location[12];
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;

  v6 = a3;
  v7 = a4;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v9 = dispatch_queue_get_label(0);
  if (label == v9 || (label ? (v10 = v9 == 0) : (v10 = 1), !v10 && !strcmp(label, v9)))
  {
    v17 = sub_1004318FC();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136316162;
      *(_QWORD *)&location[4] = "-[VLFSession session:didUpdateFrame:]";
      v27 = 2080;
      v28 = "VLFSession.m";
      v29 = 1024;
      v30 = 449;
      v31 = 2080;
      v32 = "dispatch_get_main_queue()";
      v33 = 2080;
      v34 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion not on queue failed: %s/%s", location, 0x30u);

    }
    if (sub_100A70734())
    {
      v19 = sub_1004318FC();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)location = 138412290;
        *(_QWORD *)&location[4] = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@", location, 0xCu);

      }
    }
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "vlDebugInfo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "geoTrackingStatus"));
  v13 = v12;
  if (v12 && objc_msgSend(v12, "state") == (id)2)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSession indoorOutdoorRecorder](self, "indoorOutdoorRecorder"));
    objc_msgSend(v14, "recordFrame:", v7);

  }
  objc_initWeak((id *)location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1006137A8;
  block[3] = &unk_1011AFF10;
  objc_copyWeak(&v25, (id *)location);
  v23 = v13;
  v24 = v11;
  v15 = v11;
  v16 = v13;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)location);

}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  const char *label;
  const char *v9;
  BOOL v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  void *v21;
  _QWORD block[4];
  id v23;
  id v24;
  id v25;
  _BYTE location[12];
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;

  v6 = a3;
  v7 = a4;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v9 = dispatch_queue_get_label(0);
  if (label == v9 || (label ? (v10 = v9 == 0) : (v10 = 1), !v10 && !strcmp(label, v9)))
  {
    v17 = sub_1004318FC();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136316162;
      *(_QWORD *)&location[4] = "-[VLFSession session:didFailWithError:]";
      v27 = 2080;
      v28 = "VLFSession.m";
      v29 = 1024;
      v30 = 487;
      v31 = 2080;
      v32 = "dispatch_get_main_queue()";
      v33 = 2080;
      v34 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion not on queue failed: %s/%s", location, 0x30u);

    }
    if (sub_100A70734())
    {
      v19 = sub_1004318FC();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)location = 138412290;
        *(_QWORD *)&location[4] = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@", location, 0xCu);

      }
    }
  }
  v11 = objc_alloc_init((Class)GEOVLFInitializationFailureDetails);
  objc_msgSend(v11, "setArkitErrorCode:", objc_msgSend(v7, "code"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "underlyingErrors"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "domain"));
    objc_msgSend(v11, "setArkitUnderlyingErrorDomain:", v14);

    objc_msgSend(v11, "setArkitUnderlyingErrorCode:", objc_msgSend(v13, "code"));
  }
  objc_initWeak((id *)location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100613C38;
  block[3] = &unk_1011AFF10;
  objc_copyWeak(&v25, (id *)location);
  v23 = v7;
  v24 = v11;
  v15 = v11;
  v16 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)location);

}

- (void)session:(id)a3 didChangeGeoTrackingStatus:(id)a4
{
  id v6;
  id v7;
  const char *label;
  const char *v9;
  BOOL v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  void *v19;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  _BYTE location[12];
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;

  v6 = a3;
  v7 = a4;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v9 = dispatch_queue_get_label(0);
  if (label == v9 || (label ? (v10 = v9 == 0) : (v10 = 1), !v10 && !strcmp(label, v9)))
  {
    v15 = sub_1004318FC();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136316162;
      *(_QWORD *)&location[4] = "-[VLFSession session:didChangeGeoTrackingStatus:]";
      v25 = 2080;
      v26 = "VLFSession.m";
      v27 = 1024;
      v28 = 506;
      v29 = 2080;
      v30 = "dispatch_get_main_queue()";
      v31 = 2080;
      v32 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion not on queue failed: %s/%s", location, 0x30u);

    }
    if (sub_100A70734())
    {
      v17 = sub_1004318FC();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)location = 138412290;
        *(_QWORD *)&location[4] = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", location, 0xCu);

      }
    }
  }
  objc_msgSend((id)objc_opt_class(self), "setLastGeoTrackingStatus:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentFrame"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "vlDebugInfo"));

  objc_initWeak((id *)location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100613F18;
  block[3] = &unk_1011AFF10;
  objc_copyWeak(&v23, (id *)location);
  v21 = v7;
  v22 = v12;
  v13 = v12;
  v14 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)location);

}

- (void)sessionManager:(id)a3 didGainSessionOwnership:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  unsigned int v16;
  id v17;
  NSObject *v18;
  _BOOL4 v19;
  id v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  VLFSession *v28;
  __int16 v29;
  const char *v30;

  v6 = a3;
  v7 = a4;
  v8 = sub_100610E40();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349314;
    v28 = self;
    v29 = 2080;
    v30 = "-[VLFSession sessionManager:didGainSessionOwnership:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[%{public}p] %s", buf, 0x16u);
  }

  objc_storeStrong((id *)&self->_session, a4);
  -[VLFSession setShouldObserveFrames:](self, "setShouldObserveFrames:", 0);
  -[VLFSession setNotifiedFirstFrame:](self, "setNotifiedFirstFrame:", 0);
  -[ARSession _addObserver:](self->_session, "_addObserver:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSession configuration](self, "configuration"));
  -[VLFSession setShouldUpdateCameraFocusLensPosition:](self, "setShouldUpdateCameraFocusLensPosition:", objc_msgSend(v10, "isAutoFocusEnabled") ^ 1);
  -[ARSession runWithConfiguration:options:](self->_session, "runWithConfiguration:options:", v10, 3);
  if (-[ARSession state](self->_session, "state") == (id)1 && (id)-[VLFSession mode](self, "mode") == (id)1)
    -[VLFSession startLocationUpdates](self, "startLocationUpdates");
  -[VLFSession timeout](self, "timeout");
  v12 = v11;
  if (v11 <= 0.0
    || (v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults")),
        v14 = objc_msgSend(v13, "BOOLForKey:", CFSTR("VLFSessionKeepARSessionRunningForeverKey")),
        v13,
        (v14 & 1) != 0))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v16 = objc_msgSend(v15, "BOOLForKey:", CFSTR("VLFSessionKeepARSessionRunningForeverKey"));

    v17 = sub_100610E40();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v19)
      {
        *(_DWORD *)buf = 134349056;
        v28 = self;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[%{public}p] Debug option to keep VLF running forever is enabled; not starting the timeout timer",
          buf,
          0xCu);
      }
    }
    else if (v19)
    {
      *(_DWORD *)buf = 134349312;
      v28 = self;
      v29 = 2048;
      v30 = *(const char **)&v12;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[%{public}p] Timeout was <= 0 (%f); not starting the timeout timer",
        buf,
        0x16u);
    }

  }
  else
  {
    v20 = sub_100610E40();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349312;
      v28 = self;
      v29 = 2048;
      v30 = *(const char **)&v12;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[%{public}p] Starting timeout timer for %f seconds", buf, 0x16u);
    }

    objc_initWeak((id *)buf, self);
    v22 = &_dispatch_main_q;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100614424;
    v25[3] = &unk_1011AE190;
    objc_copyWeak(&v26, (id *)buf);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, v25, v12));
    -[VLFSession setTimeoutTimer:](self, "setTimeoutTimer:", v23);

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v24, "postNotificationName:object:", CFSTR("VLFSessionDidStartNotification"), self);

}

- (void)sessionManager:(id)a3 didResignSessionOwnership:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  ARSession *session;
  ARConfiguration *configuration;
  void *v12;
  int v13;
  VLFSession *v14;
  __int16 v15;
  const char *v16;

  v5 = sub_100610E40();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v13 = 134349314;
    v14 = self;
    v15 = 2080;
    v16 = "-[VLFSession sessionManager:didResignSessionOwnership:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}p] %s", (uint8_t *)&v13, 0x16u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSession session](self, "session"));
  objc_msgSend(v7, "_removeObserver:", self);

  -[VLFSession setTimeoutTimer:](self, "setTimeoutTimer:", 0);
  if ((id)-[VLFSession mode](self, "mode") == (id)1)
  {
    -[VLFSession endRecordingIfNecessary](self, "endRecordingIfNecessary");
  }
  else
  {
    v8 = sub_100610E40();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v13 = 134349314;
      v14 = self;
      v15 = 2112;
      v16 = CFSTR("VLFSessionModeNonUI");
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[%{public}p] Will not end recording because we were not started for mode: %@", (uint8_t *)&v13, 0x16u);
    }

  }
  session = self->_session;
  self->_session = 0;

  configuration = self->_configuration;
  self->_configuration = 0;

  -[VLFSession stopLocationUpdates](self, "stopLocationUpdates");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v12, "postNotificationName:object:", CFSTR("VLFSessionDidStopNotification"), self);

}

- (void)locationManager:(id)a3 didUpdateLocation:(id)a4
{
  id v6;
  char *v7;
  const char *label;
  const char *v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  VLFSession *v19;
  int v20;
  VLFSession *v21;
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

  v6 = a3;
  v7 = (char *)a4;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v9 = dispatch_queue_get_label(0);
  if (label != v9)
  {
    v10 = !label || v9 == 0;
    if (v10 || strcmp(label, v9))
    {
      v15 = sub_1004318FC();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v20 = 136316418;
        v21 = (VLFSession *)"-[VLFSession locationManager:didUpdateLocation:]";
        v22 = 2080;
        v23 = "VLFSession.m";
        v24 = 1024;
        v25 = 607;
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
          v19 = (VLFSession *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v20 = 138412290;
          v21 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v20, 0xCu);

        }
      }
    }
  }
  v11 = sub_100610E40();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v20 = 134349315;
    v21 = self;
    v22 = 2113;
    v23 = v7;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "[%{public}p] Got VLF location update: (%{private}@)", (uint8_t *)&v20, 0x16u);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastLocation"));
  -[VLFSession checkForSuccessWithFusionLocation:accuracyLocation:](self, "checkForSuccessWithFusionLocation:accuracyLocation:", v7, v14);

}

- (void)locationManagerUpdatedLocation:(id)a3
{
  id v4;
  const char *label;
  const char *v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  char *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  VLFSession *v18;
  int v19;
  VLFSession *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;

  v4 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v14 = sub_1004318FC();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v19 = 136316418;
        v20 = (VLFSession *)"-[VLFSession locationManagerUpdatedLocation:]";
        v21 = 2080;
        v22 = "VLFSession.m";
        v23 = 1024;
        v24 = 618;
        v25 = 2080;
        v26 = "dispatch_get_main_queue()";
        v27 = 2080;
        v28 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v29 = 2080;
        v30 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v19,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v16 = sub_1004318FC();
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v18 = (VLFSession *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v19 = 138412290;
          v20 = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v19, 0xCu);

        }
      }
    }
  }
  v8 = sub_100610E40();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastLocation"));
    v19 = 134349315;
    v20 = self;
    v21 = 2113;
    v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[%{public}p] Got MK location update: (%{private}@)", (uint8_t *)&v19, 0x16u);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[VLFLocationManager sharedLocationManager](VLFLocationManager, "sharedLocationManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastLocation"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastLocation"));
  -[VLFSession checkForSuccessWithFusionLocation:accuracyLocation:](self, "checkForSuccessWithFusionLocation:accuracyLocation:", v12, v13);

}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 1;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  ARConfiguration *configuration;
  uint64_t v15;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("PedestrianARAutoFocusDistanceKey"))
    && (v13 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults")),
        v13,
        v13 == v11))
  {
    if (self->_session && (configuration = self->_configuration) != 0)
      v15 = -[ARConfiguration isAutoFocusEnabled](configuration, "isAutoFocusEnabled") ^ 1;
    else
      v15 = 0;
    -[VLFSession setShouldUpdateCameraFocusLensPosition:](self, "setShouldUpdateCameraFocusLensPosition:", v15);
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)VLFSession;
    -[VLFSession observeValueForKeyPath:ofObject:change:context:](&v16, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
  }

}

- (void)pocketStateManager:(id)a3 didUpdateState:(int64_t)a4
{
  _QWORD v6[5];
  id v7[2];
  id location;

  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100614D88;
  v6[3] = &unk_1011B2160;
  v6[4] = self;
  v7[1] = (id)a4;
  objc_copyWeak(v7, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (VLFSessionDelegate)delegate
{
  return (VLFSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)entryPoint
{
  return self->_entryPoint;
}

- (void)setEntryPoint:(int64_t)a3
{
  self->_entryPoint = a3;
}

- (ARSession)session
{
  return self->_session;
}

- (BOOL)wasLastLocalizationSuccessful
{
  return self->_wasLastLocalizationSuccessful;
}

- (void)setWasLastLocalizationSuccessful:(BOOL)a3
{
  self->_wasLastLocalizationSuccessful = a3;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (GCDTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timeoutTimer, a3);
}

- (BOOL)hasNotifiedDelegate
{
  return self->_notifiedDelegate;
}

- (void)setNotifiedDelegate:(BOOL)a3
{
  self->_notifiedDelegate = a3;
}

- (BOOL)hasNotifiedFirstFrame
{
  return self->_notifiedFirstFrame;
}

- (void)setNotifiedFirstFrame:(BOOL)a3
{
  self->_notifiedFirstFrame = a3;
}

- (BOOL)shouldObserveFrames
{
  return self->_shouldObserveFrames;
}

- (void)setShouldObserveFrames:(BOOL)a3
{
  self->_shouldObserveFrames = a3;
}

- (BOOL)shouldUpdateCameraFocusLensPosition
{
  return self->_shouldUpdateCameraFocusLensPosition;
}

- (void)setShouldUpdateCameraFocusLensPosition:(BOOL)a3
{
  self->_shouldUpdateCameraFocusLensPosition = a3;
}

- (UINotificationFeedbackGenerator)notificationGenerator
{
  return self->_notificationGenerator;
}

- (void)setNotificationGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_notificationGenerator, a3);
}

- (VisualLocalizationTraceRecorder)traceRecorder
{
  return self->_traceRecorder;
}

- (void)setTraceRecorder:(id)a3
{
  objc_storeStrong((id *)&self->_traceRecorder, a3);
}

- (VLFSessionAnalyticsCapturer)analyticsCapturer
{
  return self->_analyticsCapturer;
}

- (void)setAnalyticsCapturer:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsCapturer, a3);
}

- (VLFSessionIndoorOutdoorAnalyticsRecorder)indoorOutdoorRecorder
{
  return self->_indoorOutdoorRecorder;
}

- (void)setIndoorOutdoorRecorder:(id)a3
{
  objc_storeStrong((id *)&self->_indoorOutdoorRecorder, a3);
}

- (CMPocketStateManager)pocketStateManager
{
  return self->_pocketStateManager;
}

- (void)setPocketStateManager:(id)a3
{
  objc_storeStrong((id *)&self->_pocketStateManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pocketStateManager, 0);
  objc_storeStrong((id *)&self->_indoorOutdoorRecorder, 0);
  objc_storeStrong((id *)&self->_analyticsCapturer, 0);
  objc_storeStrong((id *)&self->_traceRecorder, 0);
  objc_storeStrong((id *)&self->_notificationGenerator, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_initializationFailureDetails, 0);
  objc_storeStrong((id *)&self->_lastDebugInfo, 0);
}

@end
