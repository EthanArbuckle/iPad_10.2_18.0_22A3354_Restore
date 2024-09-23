@implementation NIServerFindingSession

- (NIServerFindingSession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NIServerFindingSession *v15;
  NIFindingConfiguration *v16;
  NIFindingConfiguration *configuration;
  uint64_t v18;
  OS_dispatch_queue *clientQueue;
  void *v20;
  uint64_t v21;
  NSString *sessionIdentifier;
  NIDiscoveryToken *findingToken;
  void *v24;
  unsigned int v25;
  NSObject *v26;
  _BOOL4 v27;
  NIServerSystemStatusPublisher *v28;
  NIServerSystemStatusPublisher *systemStatusPublisher;
  void *v31;
  void *v32;
  uint8_t buf[16];
  objc_super v34;

  v9 = a3;
  v10 = a4;
  v12 = objc_opt_class(v10, v11);
  if (v12 != objc_opt_class(NIFindingConfiguration, v13))
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerFindingSession.mm"), 2393, CFSTR("Invalid configuration type."));

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "serverSessionIdentifier"));

  if (!v14)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerFindingSession.mm"), 2394, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resourcesManager.serverSessionIdentifier"));

  }
  v34.receiver = self;
  v34.super_class = (Class)NIServerFindingSession;
  v15 = -[NIServerBaseSession initWithResourcesManager:configuration:error:](&v34, "initWithResourcesManager:configuration:error:", v9, v10, a5);
  if (v15)
  {
    v16 = (NIFindingConfiguration *)objc_msgSend(v10, "copy");
    configuration = v15->_configuration;
    v15->_configuration = v16;

    v15->_isRunning = 0;
    v15->_shouldDeliverUpdates = 0;
    v15->_deliveredFirstUpdate = 0;
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "clientConnectionQueue"));
    clientQueue = v15->_clientQueue;
    v15->_clientQueue = (OS_dispatch_queue *)v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "serverSessionIdentifier"));
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "UUIDString"));
    sessionIdentifier = v15->_sessionIdentifier;
    v15->_sessionIdentifier = (NSString *)v21;

    findingToken = v15->_findingToken;
    v15->_findingToken = 0;

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v25 = objc_msgSend(v24, "BOOLForKey:", CFSTR("FindingPublishSystemStatus"));

    v26 = qword_10085F520;
    v27 = os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT);
    if (v25)
    {
      if (v27)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "#find-ses,System status publishing enabled", buf, 2u);
      }
      v28 = -[NIServerSystemStatusPublisher initWithSystemStatus:]([NIServerSystemStatusPublisher alloc], "initWithSystemStatus:", 2);
      systemStatusPublisher = v15->_systemStatusPublisher;
      v15->_systemStatusPublisher = v28;

    }
    else if (v27)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "#find-ses,System status publishing disabled", buf, 2u);
    }
  }

  return v15;
}

- (duration<long)nominalCycleRate
{
  return (duration<long long, std::ratio<1, 1000>>)100;
}

- (id)lastConfiguration
{
  return self->_configuration;
}

- (unint64_t)requiresUWBToRun
{
  NIFindingConfiguration *configuration;

  configuration = self->_configuration;
  if (!configuration)
    return 2;
  if (!-[NIFindingConfiguration isFinder](configuration, "isFinder"))
    return 0;
  if (-[NIServerFindingSession _doesClientWantFinderObserverSession](self, "_doesClientWantFinderObserverSession"))
    return 0;
  return 2;
}

- (unint64_t)requiresNarrowbandToRun
{
  void *v3;

  v3 = sub_100004784();
  if (sub_100395734((uint64_t)v3))
    return -[NIServerFindingSession requiresUWBToRun](self, "requiresUWBToRun");
  else
    return 0;
}

- (id)getQueueForInputingData
{
  return self->_clientQueue;
}

- (id)configure
{
  NSObject *v3;
  NSString *sessionIdentifier;
  NIFindingConfiguration *configuration;
  uint64_t v6;
  NIDiscoveryToken **p_findingToken;
  NIDiscoveryToken *v8;
  void *v10;
  uint64_t v11;
  void *v12;
  NSErrorUserInfoKey v13;
  const __CFString *v14;
  NSErrorUserInfoKey v15;
  const __CFString *v16;
  uint8_t buf[4];
  NSString *v18;
  __int16 v19;
  NIFindingConfiguration *v20;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (!self->_configuration)
    sub_1003DB908();
  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    sessionIdentifier = self->_sessionIdentifier;
    configuration = self->_configuration;
    *(_DWORD *)buf = 138543618;
    v18 = sessionIdentifier;
    v19 = 2114;
    v20 = configuration;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-ses,Configure [%{public}@]: %{public}@", buf, 0x16u);
  }
  if ((id)-[NIFindingConfiguration configType](self->_configuration, "configType") == (id)1)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[NIFindingConfiguration specifiedToken](self->_configuration, "specifiedToken"));
    p_findingToken = &self->_findingToken;
    v8 = *p_findingToken;
    *p_findingToken = (NIDiscoveryToken *)v6;

    if (*p_findingToken)
      return 0;
    v13 = NSLocalizedFailureReasonErrorKey;
    v14 = CFSTR("No discovery token for this configuration type");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
    v11 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, v10));
  }
  else
  {
    v15 = NSLocalizedFailureReasonErrorKey;
    v16 = CFSTR("Configuration type not supported");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
    v11 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, v10));
  }
  v12 = (void *)v11;

  return v12;
}

- (id)run
{
  NIServerSessionResourceManager *v3;
  void *v4;
  NSObject *v5;
  NSString *sessionIdentifier;
  void *v7;
  _BOOL4 isRunning;
  void *v9;
  void *v10;
  void *v12;
  unsigned int v13;
  NSObject *v14;
  NIServerFindingService *findingService;
  void *v16;
  NIServerFindingService *v17;
  NIServerFindingService *v18;
  id v19;
  void *v20;
  unsigned int v21;
  NIServerSystemStatusPublisher *systemStatusPublisher;
  uint64_t v23;
  objc_super v24;
  uint8_t buf[4];
  NSString *v26;
  __int16 v27;
  void *v28;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v24.receiver = self;
  v24.super_class = (Class)NIServerFindingSession;
  v3 = -[NIServerBaseSession resourcesManager](&v24, "resourcesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (id)qword_10085F520;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    sessionIdentifier = self->_sessionIdentifier;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clientProcessNameBestGuess"));
    *(_DWORD *)buf = 138543619;
    v26 = sessionIdentifier;
    v27 = 2113;
    v28 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-ses,Run [%{public}@]. Process: %{private}@", buf, 0x16u);

  }
  isRunning = self->_isRunning;
  self->_isRunning = 1;
  self->_shouldDeliverUpdates = 1;
  self->_deliveredFirstUpdate = 0;
  if (-[NIFindingConfiguration isFinder](self->_configuration, "isFinder"))
  {
    if (-[NIServerFindingSession _doesClientWantFinderObserverSession](self, "_doesClientWantFinderObserverSession"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerFindingServiceObserverRelay sharedInstance](NIServerFindingServiceObserverRelay, "sharedInstance"));
      objc_msgSend(v9, "addObserver:identifier:token:", self, self->_sessionIdentifier, self->_findingToken);

    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v13 = objc_msgSend(v12, "BOOLForKey:", CFSTR("FindingDisableService"));

      if (v13)
      {
        v14 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#find-ses,Finding session requested, but disabled via defaults write", buf, 2u);
        }
      }
      else
      {
        findingService = self->_findingService;
        if (findingService)
        {
          if (!isRunning)
          {
            -[NIServerFindingService clientWithIdentifier:updatedStateToRunning:dueToTimeout:](findingService, "clientWithIdentifier:updatedStateToRunning:dueToTimeout:", self->_sessionIdentifier, 1, 0);
            findingService = self->_findingService;
          }
          -[NIServerFindingService processUpdatedConfiguration:forClientIdentifier:](findingService, "processUpdatedConfiguration:forClientIdentifier:", self->_configuration, self->_sessionIdentifier);
        }
        else
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerFindingServicePool sharedInstance](NIServerFindingServicePool, "sharedInstance"));
          v17 = (NIServerFindingService *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "serviceForToken:createIfNotExists:", self->_findingToken, 1));
          v18 = self->_findingService;
          self->_findingService = v17;

          v19 = -[NIServerFindingService addClient:identifier:configuration:](self->_findingService, "addClient:identifier:configuration:", self, self->_sessionIdentifier, self->_configuration);
        }
        -[NIServerFindingSession _startRunawayFindingBackstopTimer](self, "_startRunawayFindingBackstopTimer");
        if (v4)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appStateMonitor"));
          v21 = objc_msgSend(v20, "isRunningBoardApp");

          if (v21)
          {
            systemStatusPublisher = self->_systemStatusPublisher;
            objc_msgSend(v4, "clientAuditToken");
            -[NIServerSystemStatusPublisher publishWithAuditToken:](systemStatusPublisher, "publishWithAuditToken:", &v23);
          }
        }
      }
    }
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerFindableDeviceProxySessionManager sharedInstance](NIServerFindableDeviceProxySessionManager, "sharedInstance"));
    objc_msgSend(v10, "addObserver:", self);

  }
  return 0;
}

- (id)pauseWithSource:(int64_t)a3
{
  NSObject *v4;
  NSString *sessionIdentifier;
  int v7;
  NSString *v8;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v4 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    sessionIdentifier = self->_sessionIdentifier;
    v7 = 138543362;
    v8 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#find-ses,Pause [%{public}@]", (uint8_t *)&v7, 0xCu);
  }
  -[NIServerFindingSession _resetSessionStateForOperation:](self, "_resetSessionStateForOperation:", 0);
  return 0;
}

- (BOOL)updateConfiguration:(id)a3
{
  id v4;
  uint64_t v5;
  NIFindingConfiguration **p_configuration;
  uint64_t v7;
  id v8;
  unsigned __int8 v9;
  NSObject *v10;
  _BOOL4 v11;
  NSString *sessionIdentifier;
  NIFindingConfiguration *v13;
  NSObject *v14;
  NSString *v15;
  NIFindingConfiguration *v16;
  NSString *v17;
  NIFindingConfiguration *v18;
  int v20;
  NSString *v21;
  __int16 v22;
  NIFindingConfiguration *v23;
  __int16 v24;
  id v25;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  p_configuration = &self->_configuration;
  if (v4
    && *p_configuration
    && (v7 = objc_opt_class(NIFindingConfiguration, v5), (objc_opt_isKindOfClass(v4, v7) & 1) != 0))
  {
    v8 = objc_msgSend(v4, "copy");
    v9 = -[NIFindingConfiguration canUpdateToConfiguration:](*p_configuration, "canUpdateToConfiguration:", v8);
    v10 = qword_10085F520;
    v11 = os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT);
    if ((v9 & 1) != 0)
    {
      if (v11)
      {
        sessionIdentifier = self->_sessionIdentifier;
        v13 = *p_configuration;
        v20 = 138543874;
        v21 = sessionIdentifier;
        v22 = 2114;
        v23 = v13;
        v24 = 2114;
        v25 = v8;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#find-ses,Update configuration [%{public}@]\nOld: %{public}@\nNew: %{public}@", (uint8_t *)&v20, 0x20u);
      }
      objc_storeStrong((id *)&self->_configuration, v8);
    }
    else if (v11)
    {
      v17 = self->_sessionIdentifier;
      v18 = *p_configuration;
      v20 = 138412802;
      v21 = v17;
      v22 = 2112;
      v23 = v18;
      v24 = 2112;
      v25 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#find-ses,Can't update configuration, parameters are too different [%@]\nOld: %@\nNew: %@", (uint8_t *)&v20, 0x20u);
    }

  }
  else
  {
    v14 = qword_10085F520;
    v9 = 0;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      v15 = self->_sessionIdentifier;
      v16 = *p_configuration;
      v20 = 138412802;
      v21 = v15;
      v22 = 2112;
      v23 = v16;
      v24 = 2112;
      v25 = v4;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#find-ses,Can't update configuration, one is nil or wrong type [%@]\nOld: %@\nNew: %@", (uint8_t *)&v20, 0x20u);
      v9 = 0;
    }
  }

  return v9;
}

- (void)dealloc
{
  NSObject *v3;
  NSString *sessionIdentifier;
  objc_super v5;
  uint8_t buf[4];
  NSString *v7;

  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    sessionIdentifier = self->_sessionIdentifier;
    *(_DWORD *)buf = 138543362;
    v7 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-ses,Dealloc [%{public}@]", buf, 0xCu);
  }
  -[NIServerFindingSession _resetSessionStateForOperation:](self, "_resetSessionStateForOperation:", 3);
  v5.receiver = self;
  v5.super_class = (Class)NIServerFindingSession;
  -[NIServerFindingSession dealloc](&v5, "dealloc");
}

- (void)invalidate
{
  NSObject *v3;
  NSString *sessionIdentifier;
  objc_super v5;
  uint8_t buf[4];
  NSString *v7;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (self->_findingToken)
  {
    v3 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      sessionIdentifier = self->_sessionIdentifier;
      *(_DWORD *)buf = 138543362;
      v7 = sessionIdentifier;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-ses,Invalidate [%{public}@]", buf, 0xCu);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)NIServerFindingSession;
  -[NIServerBaseSession invalidate](&v5, "invalidate");
  -[NIServerFindingSession _resetSessionStateForOperation:](self, "_resetSessionStateForOperation:", 2);
}

- (void)_resetSessionStateForOperation:(int)a3
{
  void *v5;
  unsigned __int8 v6;
  NIServerSessionResourceManager *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  NIServerFindingService *findingService;
  NIDiscoveryToken *findingToken;
  NIFindingConfiguration *configuration;
  void *v14;
  void *v15;
  OS_dispatch_source *runawayFindingBackstopTimer;
  OS_dispatch_source *v17;
  objc_super v18;

  if (a3 > 1)
    goto LABEL_4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("FindingDisableClientPausingService"));

  if ((v6 & 1) != 0)
    goto LABEL_4;
  v18.receiver = self;
  v18.super_class = (Class)NIServerFindingSession;
  v7 = -[NIServerBaseSession resourcesManager](&v18, "resourcesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "clientProcessNameBestGuess"));
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.NanoSettingsViewService"));

  if ((v10 & 1) != 0)
  {
LABEL_4:
    -[NIServerFindingService removeClientWithIdentifier:dueToTimeout:](self->_findingService, "removeClientWithIdentifier:dueToTimeout:", self->_sessionIdentifier, a3 == 1);
    findingService = self->_findingService;
    self->_findingService = 0;

    findingToken = self->_findingToken;
    self->_findingToken = 0;

    configuration = self->_configuration;
    self->_configuration = 0;

    if (a3 == 3)
      goto LABEL_8;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerFindingServiceObserverRelay sharedInstance](NIServerFindingServiceObserverRelay, "sharedInstance"));
    objc_msgSend(v14, "removeObserverWithIdentifier:", self->_sessionIdentifier);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerFindableDeviceProxySessionManager sharedInstance](NIServerFindableDeviceProxySessionManager, "sharedInstance"));
    objc_msgSend(v15, "removeObserver:", self);

  }
  else
  {
    -[NIServerFindingService clientWithIdentifier:updatedStateToRunning:dueToTimeout:](self->_findingService, "clientWithIdentifier:updatedStateToRunning:dueToTimeout:", self->_sessionIdentifier, 0, a3 == 1);
  }
  -[NIServerSystemStatusPublisher unpublish](self->_systemStatusPublisher, "unpublish");
LABEL_8:
  runawayFindingBackstopTimer = self->_runawayFindingBackstopTimer;
  if (runawayFindingBackstopTimer)
  {
    dispatch_source_cancel((dispatch_source_t)runawayFindingBackstopTimer);
    v17 = self->_runawayFindingBackstopTimer;
    self->_runawayFindingBackstopTimer = 0;

  }
  self->_isRunning = 0;
  self->_shouldDeliverUpdates = 0;
  self->_deliveredFirstUpdate = 0;
}

- (void)_startRunawayFindingBackstopTimer
{
  OS_dispatch_source *runawayFindingBackstopTimer;
  OS_dispatch_source *v4;
  void *v5;
  void *v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  NSObject *v12;
  OS_dispatch_source *v13;
  OS_dispatch_source **p_runawayFindingBackstopTimer;
  OS_dispatch_source *v15;
  OS_dispatch_source *v16;
  dispatch_time_t v17;
  OS_dispatch_source *v18;
  _QWORD handler[4];
  id v20;
  uint8_t buf[4];
  double v22;

  runawayFindingBackstopTimer = self->_runawayFindingBackstopTimer;
  if (runawayFindingBackstopTimer)
  {
    dispatch_source_cancel((dispatch_source_t)runawayFindingBackstopTimer);
    v4 = self->_runawayFindingBackstopTimer;
    self->_runawayFindingBackstopTimer = 0;

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("RunawayFindingBackstopTimeoutOverrideSeconds")));
  v7 = 1200000000000;

  if (v6)
  {
    v9 = objc_opt_class(NSNumber, v8);
    if ((objc_opt_isKindOfClass(v6, v9) & 1) != 0)
    {
      objc_msgSend(v6, "doubleValue");
      v11 = v10;
      v12 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v22 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#find-ses,Runaway finding backstop timeout override: %0.1f s", buf, 0xCu);
      }
      v7 = (unint64_t)(v11 * 1000000000.0);
    }
  }
  v13 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_clientQueue);
  p_runawayFindingBackstopTimer = &self->_runawayFindingBackstopTimer;
  v15 = self->_runawayFindingBackstopTimer;
  self->_runawayFindingBackstopTimer = v13;

  v16 = self->_runawayFindingBackstopTimer;
  v17 = dispatch_time(0, v7);
  dispatch_source_set_timer((dispatch_source_t)v16, v17, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  objc_initWeak((id *)buf, self);
  v18 = self->_runawayFindingBackstopTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1001F6520;
  handler[3] = &unk_1007FA078;
  objc_copyWeak(&v20, (id *)buf);
  dispatch_source_set_event_handler((dispatch_source_t)v18, handler);
  dispatch_resume((dispatch_object_t)*p_runawayFindingBackstopTimer);
  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);

}

- (BOOL)_doesClientWantFinderObserverSession
{
  NIFindingConfiguration *configuration;
  NIServerSessionResourceManager *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  objc_super v9;

  configuration = self->_configuration;
  if (!configuration || !-[NIFindingConfiguration isFinder](configuration, "isFinder"))
    return 0;
  v9.receiver = self;
  v9.super_class = (Class)NIServerFindingSession;
  v4 = -[NIServerBaseSession resourcesManager](&v9, "resourcesManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (-[NIFindingConfiguration isObserver](self->_configuration, "isObserver"))
  {
    v6 = 1;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "clientProcessNameBestGuess"));
    v6 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.nanofindlocallyd"));

  }
  return v6;
}

- (BOOL)supportsCameraAssistance
{
  return +[NIPlatformInfo supportsSyntheticAperture](NIPlatformInfo, "supportsSyntheticAperture");
}

- (id)_processFindingEvent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NIServerFindingService *findingService;
  NIServerFindingService *v14;
  void *v15;
  const char *v17;
  NSString *sessionIdentifier;
  int v19;
  const char *v20;
  __int16 v21;
  NSString *v22;
  __int16 v23;
  id v24;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (!v4)
    __assert_rtn("-[NIServerFindingSession _processFindingEvent:]", "NIServerFindingSession.mm", 2714, "event");
  if (self->_configuration)
  {
    v5 = (id)qword_10085F520;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v17 = sub_1002B69E0(-[NIFindingConfiguration isFinder](self->_configuration, "isFinder"));
      sessionIdentifier = self->_sessionIdentifier;
      v19 = 136315651;
      v20 = v17;
      v21 = 2112;
      v22 = sessionIdentifier;
      v23 = 2113;
      v24 = v4;
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "#find-ses,[%s] Process event [%@]: %{private}@", (uint8_t *)&v19, 0x20u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FindingEventDictKey_EventType")));
    v7 = objc_msgSend(v6, "integerValue");

    if ((unint64_t)v7 >= 7)
      v8 = 0;
    else
      v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FindingEventDictKey_ObjectDiscoveryToken")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FindingEventDictKey_SharedConfigurationData")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FindingEventDictKey_Location")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FindingEventDictKey_Heading")));
    if (-[NIFindingConfiguration isFinder](self->_configuration, "isFinder"))
    {
      findingService = self->_findingService;
      if (findingService)
      {
        v14 = findingService;
      }
      else
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerFindingServicePool sharedInstance](NIServerFindingServicePool, "sharedInstance"));
        v14 = (NIServerFindingService *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "serviceForToken:createIfNotExists:", self->_findingToken, 0));

      }
      switch((unint64_t)v8)
      {
        case 2uLL:
          if (v11)
            -[NIServerFindingService processSelfLocation:](v14, "processSelfLocation:", v11);
          break;
        case 3uLL:
          if (v12)
            -[NIServerFindingService processSelfHeading:](v14, "processSelfHeading:", v12);
          break;
        case 4uLL:
          if (v11 && -[NIDiscoveryToken isEqual:](self->_findingToken, "isEqual:", v9))
            -[NIServerFindingService processPeerLocation:forPeer:](v14, "processPeerLocation:forPeer:", v11, v9);
          break;
        case 5uLL:
          if (v9 && v10 && -[NIDiscoveryToken isEqual:](self->_findingToken, "isEqual:", v9))
            -[NIServerFindingService processClientDiscoveryEventWithSharedConfigurationData:](v14, "processClientDiscoveryEventWithSharedConfigurationData:", v10);
          break;
        case 6uLL:
          if (v9 && -[NIDiscoveryToken isEqual:](self->_findingToken, "isEqual:", v9))
            -[NIServerFindingService processClientRemovePeerEvent](v14, "processClientRemovePeerEvent");
          break;
        default:
          break;
      }
    }
    else if (v8 == (id)6)
    {
      if (!v9 || !-[NIDiscoveryToken isEqual:](self->_findingToken, "isEqual:", v9))
        goto LABEL_39;
      v14 = (NIServerFindingService *)objc_claimAutoreleasedReturnValue(+[NIServerFindableDeviceProxySessionManager sharedInstance](NIServerFindableDeviceProxySessionManager, "sharedInstance"));
      -[NIServerFindingService processClientRemovePeerEventForToken:](v14, "processClientRemovePeerEventForToken:", self->_findingToken);
    }
    else
    {
      if (v8 != (id)5 || !v9 || !v10 || !-[NIDiscoveryToken isEqual:](self->_findingToken, "isEqual:", v9))
        goto LABEL_39;
      v14 = (NIServerFindingService *)objc_claimAutoreleasedReturnValue(+[NIServerFindableDeviceProxySessionManager sharedInstance](NIServerFindableDeviceProxySessionManager, "sharedInstance"));
      -[NIServerFindingService processClientDiscoveryEventForToken:sharedConfigurationData:](v14, "processClientDiscoveryEventForToken:sharedConfigurationData:", self->_findingToken, v10);
    }

LABEL_39:
    goto LABEL_40;
  }
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    sub_1003DB930();
LABEL_40:

  return 0;
}

- (void)serviceDidGenerateShareableConfigurationData:(id)a3 forObject:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *clientQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  clientQueue = self->_clientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001F6B90;
  block[3] = &unk_100809CB0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async((dispatch_queue_t)clientQueue, block);

}

- (void)serviceDidDiscoverNearbyObject:(id)a3
{
  id v4;
  OS_dispatch_queue *clientQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001F6CA0;
  v7[3] = &unk_1007FA518;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async((dispatch_queue_t)clientQueue, v7);

}

- (void)serviceDidRemoveNearbyObject:(id)a3
{
  id v4;
  OS_dispatch_queue *clientQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001F6DB0;
  v7[3] = &unk_1007FA518;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async((dispatch_queue_t)clientQueue, v7);

}

- (void)serviceDidUpdateNearbyObjects:(id)a3
{
  id v4;
  OS_dispatch_queue *clientQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001F6F34;
  v7[3] = &unk_1007FA518;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async((dispatch_queue_t)clientQueue, v7);

}

- (void)serviceDidUpdateAlgorithmConvergenceState:(id)a3 forObject:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *clientQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  clientQueue = self->_clientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001F7190;
  block[3] = &unk_100809CB0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async((dispatch_queue_t)clientQueue, block);

}

- (void)didGenerateShareableConfigurationData:(id)a3 forToken:(id)a4
{
  id v6;
  id v7;
  NINearbyObject *v8;
  NIServerSessionResourceManager *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (-[NIDiscoveryToken isEqual:](self->_findingToken, "isEqual:", v7))
  {
    v8 = -[NINearbyObject initWithToken:]([NINearbyObject alloc], "initWithToken:", self->_findingToken);
    v12.receiver = self;
    v12.super_class = (Class)NIServerFindingSession;
    v9 = -[NIServerBaseSession resourcesManager](&v12, "resourcesManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "remote"));
    objc_msgSend(v11, "didGenerateShareableConfigurationData:forObject:", v6, v8);

  }
}

- (void)processVisionInput:(id)a3
{
  -[NIServerFindingService processVisionInput:](self->_findingService, "processVisionInput:", a3);
}

+ (id)sharedServicePrintableState
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v6[16];

  v2 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "#find-ses,sharedServicePrintableState", v6, 2u);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerFindingServicePool sharedInstance](NIServerFindingServicePool, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "printableState"));

  return v4;
}

- (NIFindingConfiguration)configuration
{
  return (NIFindingConfiguration *)objc_getProperty(self, a2, 104, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_systemStatusPublisher, 0);
  objc_storeStrong((id *)&self->_runawayFindingBackstopTimer, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_findingService, 0);
  objc_storeStrong((id *)&self->_findingToken, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
}

@end
