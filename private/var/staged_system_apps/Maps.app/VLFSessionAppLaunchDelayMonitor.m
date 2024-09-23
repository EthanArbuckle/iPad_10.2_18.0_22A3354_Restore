@implementation VLFSessionAppLaunchDelayMonitor

- (VLFSessionAppLaunchDelayMonitor)initWithObserver:(id)a3
{
  VLFSessionAppLaunchDelayMonitor *v3;
  VLFSessionAppLaunchDelayMonitor *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VLFSessionAppLaunchDelayMonitor;
  v3 = -[VLFSessionMonitor initWithObserver:](&v8, "initWithObserver:", a3);
  v4 = v3;
  if (v3)
  {
    -[VLFSessionAppLaunchDelayMonitor _startTimer](v3, "_startTimer");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, "applicationDidEnterBackgroundNotification:", UIApplicationDidEnterBackgroundNotification, 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "addObserver:selector:name:object:", v4, "applicationDidBecomeActiveNotification:", UIApplicationDidBecomeActiveNotification, 0);

  }
  return v4;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL(MapsConfig_VLFSessionAppLaunchDelayMonitorEnabled, off_1014B3A98);
}

- (void)_startTimer
{
  const char *label;
  const char *v4;
  BOOL v5;
  void *v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  double Double;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  char *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v14 = sub_1004318FC();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v22 = "-[VLFSessionAppLaunchDelayMonitor _startTimer]";
        v23 = 2080;
        v24 = "VLFSessionAppLaunchDelayMonitor.m";
        v25 = 1024;
        v26 = 56;
        v27 = 2080;
        v28 = "dispatch_get_main_queue()";
        v29 = 2080;
        v30 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v31 = 2080;
        v32 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v16 = sub_1004318FC();
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v18 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v22 = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionAppLaunchDelayMonitor timeoutTimer](self, "timeoutTimer"));
  v7 = v6 == 0;

  if (v7)
  {
    Double = GEOConfigGetDouble(MapsConfig_VLFSessionAppLaunchDelayMonitorTimeoutThreshold, off_1014B3AA8);
    v11 = sub_100601CFC();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v22 = *(const char **)&Double;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Delaying VLF with timeout: %f", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100601D3C;
    v19[3] = &unk_1011AE190;
    objc_copyWeak(&v20, (id *)buf);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, v19, Double));
    -[VLFSessionAppLaunchDelayMonitor setTimeoutTimer:](self, "setTimeoutTimer:", v13);

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v8 = sub_100601CFC();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Already delaying VLF; ignoring", buf, 2u);
    }

  }
}

+ (BOOL)affectsPuckVisibility
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("VLFSessionAppLaunchDelayMonitorAffectsPuckVisibilityKey"));

  return v3;
}

+ (BOOL)affectsBannerVisibility
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("VLFSessionAppLaunchDelayMonitorAffectsBannerVisibilityKey"));

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
  int64_t v10;
  const __CFString *v11;
  const __CFString *v12;
  NSString *v13;
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
  v10 = -[VLFSessionMonitor state](self, "state");
  v11 = CFSTR("Hide");
  if (v10 == 1)
    v11 = CFSTR("EnablePuck");
  if (v10 == 2)
    v12 = CFSTR("EnablePuckAndBanner");
  else
    v12 = v11;
  v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: isEnabled: %@, affectsPuckVisibility: %@, affectsBannerVisibility: %@, currentState: %@, timeout: %f>"), v3, v5, v7, v9, v12, GEOConfigGetDouble(MapsConfig_VLFSessionAppLaunchDelayMonitorTimeoutThreshold, off_1014B3AA8));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  return v14;
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
  char *v14;
  int v15;
  const char *v16;
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
        v16 = "-[VLFSessionAppLaunchDelayMonitor applicationDidEnterBackgroundNotification:]";
        v17 = 2080;
        v18 = "VLFSessionAppLaunchDelayMonitor.m";
        v19 = 1024;
        v20 = 115;
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
          v14 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v15 = 138412290;
          v16 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v15, 0xCu);

        }
      }
    }
  }
  v8 = sub_100601CFC();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    LOWORD(v15) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "App backgrounded; updating state",
      (uint8_t *)&v15,
      2u);
  }

  -[VLFSessionAppLaunchDelayMonitor setIsInBackground:](self, "setIsInBackground:", 1);
  -[VLFSessionAppLaunchDelayMonitor setTimeoutTimer:](self, "setTimeoutTimer:", 0);
  -[VLFSessionMonitor setState:](self, "setState:", 0);

}

- (void)applicationDidBecomeActiveNotification:(id)a3
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
  char *v14;
  int v15;
  const char *v16;
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
        v16 = "-[VLFSessionAppLaunchDelayMonitor applicationDidBecomeActiveNotification:]";
        v17 = 2080;
        v18 = "VLFSessionAppLaunchDelayMonitor.m";
        v19 = 1024;
        v20 = 126;
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
          v14 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v15 = 138412290;
          v16 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v15, 0xCu);

        }
      }
    }
  }
  v8 = sub_100601CFC();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    LOWORD(v15) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "App foregrounded; starting timer",
      (uint8_t *)&v15,
      2u);
  }

  -[VLFSessionAppLaunchDelayMonitor setIsInBackground:](self, "setIsInBackground:", 0);
  -[VLFSessionAppLaunchDelayMonitor _startTimer](self, "_startTimer");

}

- (GCDTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timeoutTimer, a3);
}

- (BOOL)isInBackground
{
  return self->_isInBackground;
}

- (void)setIsInBackground:(BOOL)a3
{
  self->_isInBackground = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
}

@end
