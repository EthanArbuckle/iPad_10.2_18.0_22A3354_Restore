@implementation VLFVIOSessionTimeoutMonitor

- (VLFVIOSessionTimeoutMonitor)initWithStateManager:(id)a3 platformController:(id)a4
{
  VLFVIOSessionTimeoutMonitor *v4;
  id v5;
  NSObject *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char isKindOfClass;
  id v16;
  NSObject *v17;
  objc_class *v18;
  NSString *v19;
  void *v20;
  const char *v21;
  id v22;
  objc_class *v23;
  NSString *v24;
  void *v25;
  objc_super v27;
  uint8_t buf[4];
  VLFVIOSessionTimeoutMonitor *v29;
  __int16 v30;
  void *v31;

  v27.receiver = self;
  v27.super_class = (Class)VLFVIOSessionTimeoutMonitor;
  v4 = -[VIOSessionMonitor initWithStateManager:platformController:](&v27, "initWithStateManager:platformController:", a3, a4);
  if (v4)
  {
    v5 = sub_100B9E490();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (objc_class *)objc_opt_class(v4);
      v8 = NSStringFromClass(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      *(_DWORD *)buf = 134349314;
      v29 = v4;
      v30 = 2112;
      v31 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Enabling %@", buf, 0x16u);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor configuration](v4, "configuration"));
    v11 = objc_msgSend(v10, "isVLF");

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor platformController](v4, "platformController"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentSession"));
      v14 = objc_opt_class(NavigationSession);
      isKindOfClass = objc_opt_isKindOfClass(v13, v14);

      if ((isKindOfClass & 1) == 0)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor platformController](v4, "platformController"));
        objc_msgSend(v25, "addObserver:", v4);

        -[VLFVIOSessionTimeoutMonitor _startTimeoutTimer](v4, "_startTimeoutTimer");
        return v4;
      }
      -[VIOSessionMonitor setEnabled:](v4, "setEnabled:", 0);
      v16 = sub_100B9E490();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        goto LABEL_11;
      v18 = (objc_class *)objc_opt_class(v4);
      v19 = NSStringFromClass(v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      *(_DWORD *)buf = 134349314;
      v29 = v4;
      v30 = 2112;
      v31 = v20;
      v21 = "[%{public}p] %@ will not run because we are currently navigating";
    }
    else
    {
      -[VIOSessionMonitor setEnabled:](v4, "setEnabled:", 0);
      v22 = sub_100B9E490();
      v17 = objc_claimAutoreleasedReturnValue(v22);
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
LABEL_11:

        return v4;
      }
      v23 = (objc_class *)objc_opt_class(v4);
      v24 = NSStringFromClass(v23);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v24);
      *(_DWORD *)buf = 134349314;
      v29 = v4;
      v30 = 2112;
      v31 = v20;
      v21 = "[%{public}p] %@ will not run because the session is not configured for VLF";
    }
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, v21, buf, 0x16u);

    goto LABEL_11;
  }
  return v4;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  VLFVIOSessionTimeoutMonitor *v11;
  __int16 v12;
  void *v13;

  v3 = sub_100B9E490();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (objc_class *)objc_opt_class(self);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    *(_DWORD *)buf = 134349314;
    v11 = self;
    v12 = 2112;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Disabling %@", buf, 0x16u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor platformController](self, "platformController"));
  objc_msgSend(v8, "removeObserver:", self);

  v9.receiver = self;
  v9.super_class = (Class)VLFVIOSessionTimeoutMonitor;
  -[VLFVIOSessionTimeoutMonitor dealloc](&v9, "dealloc");
}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  unsigned int v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  NSString *v11;
  void *v12;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = -[VIOSessionMonitor isEnabled](self, "isEnabled");
  v7 = CFSTR("NO");
  if (v6)
    v7 = CFSTR("YES");
  v8 = MapsConfig_VLFVIOTeardownTimeout;
  v9 = off_1014B3A48;
  v10 = v7;
  v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p enabled: %@, timeout: %f>"), v5, self, v10, GEOConfigGetDouble(v8, v9));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  return (NSString *)v12;
}

+ (BOOL)isAvailable
{
  return GEOConfigGetBOOL(MapsConfig_VLFVIOTeardownTimeoutEnabled, off_1014B3A38);
}

- (void)_startTimeoutTimer
{
  double Double;
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;
  uint8_t buf[4];
  VLFVIOSessionTimeoutMonitor *v15;
  __int16 v16;
  double v17;

  Double = GEOConfigGetDouble(MapsConfig_VLFVIOTeardownTimeout, off_1014B3A48);
  objc_initWeak(&location, self);
  v4 = sub_100B9E490();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349312;
    v15 = self;
    v16 = 2048;
    v17 = Double;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Starting timeout timer with time interval: %f", buf, 0x16u);
  }

  v6 = &_dispatch_main_q;
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_100B9E840;
  v11 = &unk_1011AE190;
  objc_copyWeak(&v12, &location);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, &v8, Double));
  -[VLFVIOSessionTimeoutMonitor setTimeoutTimer:](self, "setTimeoutTimer:", v7, v8, v9, v10, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v6;
  uint64_t v7;
  char isKindOfClass;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  VLFVIOSessionTimeoutMonitor *v13;

  v6 = a5;
  v7 = objc_opt_class(NavigationSession);
  isKindOfClass = objc_opt_isKindOfClass(v6, v7);

  if ((isKindOfClass & 1) != 0)
  {
    v9 = sub_100B9E490();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = 134349056;
      v13 = self;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}p] Navigation started; stopping timeout timer",
        (uint8_t *)&v12,
        0xCu);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor platformController](self, "platformController"));
    objc_msgSend(v11, "removeObserver:", self);

    -[VLFVIOSessionTimeoutMonitor setTimeoutTimer:](self, "setTimeoutTimer:", 0);
    -[VIOSessionMonitor setEnabled:](self, "setEnabled:", 0);
  }
}

- (GCDTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timeoutTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
}

@end
