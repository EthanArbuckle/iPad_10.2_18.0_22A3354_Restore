@implementation VLFSessionCoarseLocationMonitor

- (VLFSessionCoarseLocationMonitor)initWithObserver:(id)a3 locationManager:(id)a4
{
  id v6;
  id v7;
  VLFSessionCoarseLocationMonitor *v8;
  VLFSessionCoarseLocationMonitor *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  char *v18;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    v14 = sub_1004318FC();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v21 = "-[VLFSessionCoarseLocationMonitor initWithObserver:locationManager:]";
      v22 = 2080;
      v23 = "VLFSessionCoarseLocationMonitor.m";
      v24 = 1024;
      v25 = 37;
      v26 = 2080;
      v27 = "locationManager != nil";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v16 = sub_1004318FC();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v21 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)VLFSessionCoarseLocationMonitor;
  v8 = -[VLFSessionMonitor initWithObserver:](&v19, "initWithObserver:", v6);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_locationManager, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "addObserver:selector:name:object:", v9, "locationManagerApprovalDidChange:", MKLocationManagerApprovalDidChangeNotification, 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "addObserver:selector:name:object:", v9, "applicationWillResignActiveNotification:", UIApplicationWillResignActiveNotification, 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v12, "addObserver:selector:name:object:", v9, "applicationDidBecomeActiveNotification:", UIApplicationDidBecomeActiveNotification, 0);

    -[VLFSessionCoarseLocationMonitor updateStateForCurrentPreciseLocationAuthorizationStatus](v9, "updateStateForCurrentPreciseLocationAuthorizationStatus");
  }

  return v9;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL(MapsConfig_VLFSessionCoarseLocationMonitorEnabled, off_1014B3768);
}

- (void)updateStateForCurrentPreciseLocationAuthorizationStatus
{
  void *v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionCoarseLocationMonitor locationManager](self, "locationManager"));
  v4 = objc_msgSend(v3, "isAuthorizedForPreciseLocation");

  v5 = sub_10099B6C4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      v8 = 2;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Precise location authorization has been allowed; changing state",
        buf,
        2u);
    }
    else
    {
      v8 = 2;
    }
  }
  else
  {
    if (v7)
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Precise location authorization has been denied; changing state",
        v9,
        2u);
    }
    v8 = 0;
  }

  -[VLFSessionMonitor setState:](self, "setState:", v8);
}

+ (BOOL)affectsPuckVisibility
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("VLFSessionCoarseLocationMonitorAffectsPuckVisibilityKey"));

  return v3;
}

+ (BOOL)affectsBannerVisibility
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("VLFSessionCoarseLocationMonitorAffectsBannerVisibilityKey"));

  return v3;
}

- (id)debugDescription
{
  uint64_t v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  int64_t v12;
  const __CFString *v13;
  void *v14;

  v3 = objc_opt_class(self);
  if (objc_msgSend((id)objc_opt_class(self), "isEnabled"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  v5 = v4;
  if (objc_msgSend((id)objc_opt_class(self), "affectsPuckVisibility"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  v7 = v6;
  if (objc_msgSend((id)objc_opt_class(self), "affectsBannerVisibility"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v9 = v8;
  if (-[MKLocationManager isAuthorizedForPreciseLocation](self->_locationManager, "isAuthorizedForPreciseLocation"))v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  v11 = v10;
  v12 = -[VLFSessionMonitor state](self, "state");
  v13 = CFSTR("Hide");
  if (v12 == 1)
    v13 = CFSTR("EnablePuck");
  if (v12 == 2)
    v13 = CFSTR("EnablePuckAndBanner");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: isEnabled: %@, affectsPuckVisibility: %@, affectsBannerVisibility: %@, currentValue: %@, currentState: %@>"), v3, v5, v7, v9, v11, v13));

  return v14;
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
  double v11;

  Double = GEOConfigGetDouble(MapsConfig_VLFPreciseLocationAuthorizationDelay, off_1014B3AD8);
  v4 = sub_10099B6C4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v11 = Double;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Starting authorization delay timer for %f seconds before changing state", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v6 = &_dispatch_main_q;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10099BA58;
  v8[3] = &unk_1011AE190;
  objc_copyWeak(&v9, (id *)buf);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, v8, Double));
  -[VLFSessionCoarseLocationMonitor setAuthorizedDelayTimer:](self, "setAuthorizedDelayTimer:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

- (void)applicationWillResignActiveNotification:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = sub_10099B6C4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Detected app background", v6, 2u);
  }

  -[VLFSessionCoarseLocationMonitor setIsInBackground:](self, "setIsInBackground:", 1);
}

- (void)applicationDidBecomeActiveNotification:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = sub_10099B6C4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Detected app foreground", v6, 2u);
  }

  -[VLFSessionCoarseLocationMonitor setIsInBackground:](self, "setIsInBackground:", 0);
  if (-[VLFSessionCoarseLocationMonitor isDelayingStateChange](self, "isDelayingStateChange"))
  {
    -[VLFSessionCoarseLocationMonitor setIsDelayingStateChange:](self, "setIsDelayingStateChange:", 0);
    -[VLFSessionCoarseLocationMonitor _startAuthorizationDelayTimer](self, "_startAuthorizationDelayTimer");
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
  uint8_t v12[16];
  uint8_t buf[16];
  uint8_t v14[16];

  -[VLFSessionCoarseLocationMonitor setAuthorizedDelayTimer:](self, "setAuthorizedDelayTimer:", 0);
  -[VLFSessionCoarseLocationMonitor setIsDelayingStateChange:](self, "setIsDelayingStateChange:", 0);
  if (-[VLFSessionMonitor state](self, "state")
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionCoarseLocationMonitor locationManager](self, "locationManager")),
        v5 = objc_msgSend(v4, "isAuthorizedForPreciseLocation"),
        v4,
        !v5))
  {
    v10 = sub_10099B6C4();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Authorization changed; updating state", v12, 2u);
    }

    -[VLFSessionCoarseLocationMonitor updateStateForCurrentPreciseLocationAuthorizationStatus](self, "updateStateForCurrentPreciseLocationAuthorizationStatus");
  }
  else
  {
    v6 = -[VLFSessionCoarseLocationMonitor isInBackground](self, "isInBackground");
    v7 = sub_10099B6C4();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if ((v6 & 1) != 0)
    {
      if (v9)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Detected change from not authorized to authorized but we're in the background, waiting to re-foreground", buf, 2u);
      }

      -[VLFSessionCoarseLocationMonitor setIsDelayingStateChange:](self, "setIsDelayingStateChange:", 1);
    }
    else
    {
      if (v9)
      {
        *(_WORD *)v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Detected change from not authorized to authorized while foregrounded", v14, 2u);
      }

      -[VLFSessionCoarseLocationMonitor _startAuthorizationDelayTimer](self, "_startAuthorizationDelayTimer");
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
