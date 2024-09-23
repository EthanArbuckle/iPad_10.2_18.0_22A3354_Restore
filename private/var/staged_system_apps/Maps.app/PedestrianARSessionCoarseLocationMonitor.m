@implementation PedestrianARSessionCoarseLocationMonitor

- (PedestrianARSessionCoarseLocationMonitor)initWithObserver:(id)a3 locationManager:(id)a4
{
  id v6;
  id v7;
  PedestrianARSessionCoarseLocationMonitor *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  char *v19;
  objc_super v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    v15 = sub_1004318FC();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v22 = "-[PedestrianARSessionCoarseLocationMonitor initWithObserver:locationManager:]";
      v23 = 2080;
      v24 = "PedestrianARSessionCoarseLocationMonitor.m";
      v25 = 1024;
      v26 = 36;
      v27 = 2080;
      v28 = "locationManager != nil";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v17 = sub_1004318FC();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v22 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)PedestrianARSessionCoarseLocationMonitor;
  v8 = -[PedestrianARSessionMonitor initWithObserver:](&v20, "initWithObserver:", v6);
  if (v8)
  {
    v9 = sub_100604FC8();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v22 = (const char *)v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    objc_storeStrong((id *)&v8->_locationManager, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "addObserver:selector:name:object:", v8, "locationManagerApprovalDidChange:", MKLocationManagerApprovalDidChangeNotification, 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v12, "addObserver:selector:name:object:", v8, "applicationWillResignActiveNotification:", UIApplicationWillResignActiveNotification, 0);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v13, "addObserver:selector:name:object:", v8, "applicationDidBecomeActiveNotification:", UIApplicationDidBecomeActiveNotification, 0);

    -[PedestrianARSessionCoarseLocationMonitor updateState](v8, "updateState");
  }

  return v8;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  PedestrianARSessionCoarseLocationMonitor *v7;

  v3 = sub_100604FC8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Deallocing", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)PedestrianARSessionCoarseLocationMonitor;
  -[PedestrianARSessionMonitor dealloc](&v5, "dealloc");
}

+ ($6E15C01CA1BE37A4936191A84F7075E2)enablementGEOConfigKey
{
  uint64_t v2;
  void *v3;
  $6E15C01CA1BE37A4936191A84F7075E2 result;

  v2 = MapsConfig_PedestrianARSessionCoarseLocationMonitorEnabled;
  v3 = off_1014B3FE8;
  result.var0.var1 = v3;
  *(_QWORD *)&result.var0.var0 = v2;
  return result;
}

- (void)updateState
{
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  int v9;
  PedestrianARSessionCoarseLocationMonitor *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionCoarseLocationMonitor locationManager](self, "locationManager"));
  v4 = objc_msgSend(v3, "isAuthorizedForPreciseLocation");

  v5 = sub_100604FC8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if ((_DWORD)v4)
  {
    if (v7)
    {
      v9 = 134349056;
      v10 = self;
      v8 = "[%{public}p] Precise location authorization has been allowed; changing state";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v9, 0xCu);
    }
  }
  else if (v7)
  {
    v9 = 134349056;
    v10 = self;
    v8 = "[%{public}p] Precise location authorization has been denied; changing state";
    goto LABEL_6;
  }

  -[PedestrianARSessionMonitor setShouldShowPedestrianAR:](self, "setShouldShowPedestrianAR:", v4);
}

- (void)_startAuthorizationDelayTimer
{
  double Double;
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  PedestrianARSessionCoarseLocationMonitor *v11;
  __int16 v12;
  double v13;

  Double = GEOConfigGetDouble(MapsConfig_PedestrianARPreciseLocationAuthorizationDelay, off_1014B3FF8);
  v4 = sub_100604FC8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349312;
    v11 = self;
    v12 = 2048;
    v13 = Double;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Starting authorization delay timer for %f seconds before changing state", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v6 = &_dispatch_main_q;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10060536C;
  v8[3] = &unk_1011AE190;
  objc_copyWeak(&v9, (id *)buf);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, v8, Double));
  -[PedestrianARSessionCoarseLocationMonitor setAuthorizedDelayTimer:](self, "setAuthorizedDelayTimer:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  const __CFString *v7;
  void *v8;

  v3 = objc_msgSend((id)objc_opt_class(self), "friendlyName");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionCoarseLocationMonitor locationManager](self, "locationManager"));
  v6 = objc_msgSend(v5, "isAuthorizedForPreciseLocation");
  v7 = CFSTR("NO");
  if (v6)
    v7 = CFSTR("YES");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\nauthorized for precise location: %@\n"), v4, v7));

  return v8;
}

+ (id)friendlyName
{
  return CFSTR("Coarse Location Monitor");
}

- (void)applicationWillResignActiveNotification:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  PedestrianARSessionCoarseLocationMonitor *v7;

  v4 = sub_100604FC8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] Detected app background", (uint8_t *)&v6, 0xCu);
  }

  -[PedestrianARSessionCoarseLocationMonitor setIsInBackground:](self, "setIsInBackground:", 1);
}

- (void)applicationDidBecomeActiveNotification:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  PedestrianARSessionCoarseLocationMonitor *v7;

  v4 = sub_100604FC8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] Detected app foreground", (uint8_t *)&v6, 0xCu);
  }

  -[PedestrianARSessionCoarseLocationMonitor setIsInBackground:](self, "setIsInBackground:", 0);
  if (-[PedestrianARSessionCoarseLocationMonitor isDelayingStateChange](self, "isDelayingStateChange"))
  {
    -[PedestrianARSessionCoarseLocationMonitor setIsDelayingStateChange:](self, "setIsDelayingStateChange:", 0);
    -[PedestrianARSessionCoarseLocationMonitor _startAuthorizationDelayTimer](self, "_startAuthorizationDelayTimer");
  }
}

- (void)locationManagerApprovalDidChange:(id)a3
{
  void *v4;
  unsigned int v5;
  unsigned __int8 v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  id v10;
  NSObject *v11;
  int v12;
  PedestrianARSessionCoarseLocationMonitor *v13;

  -[PedestrianARSessionCoarseLocationMonitor setAuthorizedDelayTimer:](self, "setAuthorizedDelayTimer:", 0);
  -[PedestrianARSessionCoarseLocationMonitor setIsDelayingStateChange:](self, "setIsDelayingStateChange:", 0);
  if (-[PedestrianARSessionMonitor shouldShowPedestrianAR](self, "shouldShowPedestrianAR")
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionCoarseLocationMonitor locationManager](self, "locationManager")),
        v5 = objc_msgSend(v4, "isAuthorizedForPreciseLocation"),
        v4,
        !v5))
  {
    v10 = sub_100604FC8();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = 134349056;
      v13 = self;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}p] Authorization changed; updating state",
        (uint8_t *)&v12,
        0xCu);
    }

    -[PedestrianARSessionCoarseLocationMonitor updateState](self, "updateState");
  }
  else
  {
    v6 = -[PedestrianARSessionCoarseLocationMonitor isInBackground](self, "isInBackground");
    v7 = sub_100604FC8();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if ((v6 & 1) != 0)
    {
      if (v9)
      {
        v12 = 134349056;
        v13 = self;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Detected change from not authorized to authorized but we're in the background, waiting to re-foreground", (uint8_t *)&v12, 0xCu);
      }

      -[PedestrianARSessionCoarseLocationMonitor setIsDelayingStateChange:](self, "setIsDelayingStateChange:", 1);
    }
    else
    {
      if (v9)
      {
        v12 = 134349056;
        v13 = self;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Detected change from not authorized to authorized while foregrounded", (uint8_t *)&v12, 0xCu);
      }

      -[PedestrianARSessionCoarseLocationMonitor _startAuthorizationDelayTimer](self, "_startAuthorizationDelayTimer");
    }
  }
}

- (MKLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (GCDTimer)authorizedDelayTimer
{
  return self->_authorizedDelayTimer;
}

- (void)setAuthorizedDelayTimer:(id)a3
{
  objc_storeStrong((id *)&self->_authorizedDelayTimer, a3);
}

- (BOOL)isInBackground
{
  return self->_isInBackground;
}

- (void)setIsInBackground:(BOOL)a3
{
  self->_isInBackground = a3;
}

- (BOOL)isDelayingStateChange
{
  return self->_isDelayingStateChange;
}

- (void)setIsDelayingStateChange:(BOOL)a3
{
  self->_isDelayingStateChange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorizedDelayTimer, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end
