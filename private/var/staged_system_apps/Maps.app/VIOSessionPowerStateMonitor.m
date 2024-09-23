@implementation VIOSessionPowerStateMonitor

- (VIOSessionPowerStateMonitor)initWithStateManager:(id)a3 platformController:(id)a4
{
  VIOSessionPowerStateMonitor *v4;
  id v5;
  NSObject *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  objc_super v12;
  uint8_t buf[4];
  VIOSessionPowerStateMonitor *v14;
  __int16 v15;
  void *v16;

  v12.receiver = self;
  v12.super_class = (Class)VIOSessionPowerStateMonitor;
  v4 = -[VIOSessionMonitor initWithStateManager:platformController:](&v12, "initWithStateManager:platformController:", a3, a4);
  if (v4)
  {
    v5 = sub_1006A7184();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (objc_class *)objc_opt_class(v4);
      v8 = NSStringFromClass(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      *(_DWORD *)buf = 134349314;
      v14 = v4;
      v15 = 2112;
      v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Enabling %@", buf, 0x16u);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "addObserver:selector:name:object:", v4, "powerStateDidChangeNotification:", NSProcessInfoPowerStateDidChangeNotification, 0);

    -[VIOSessionPowerStateMonitor reportStateToStateManager](v4, "reportStateToStateManager");
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
  objc_super v8;
  uint8_t buf[4];
  VIOSessionPowerStateMonitor *v10;
  __int16 v11;
  void *v12;

  v3 = sub_1006A7184();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (objc_class *)objc_opt_class(self);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    *(_DWORD *)buf = 134349314;
    v10 = self;
    v11 = 2112;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Disabling %@", buf, 0x16u);

  }
  v8.receiver = self;
  v8.super_class = (Class)VIOSessionPowerStateMonitor;
  -[VIOSessionPowerStateMonitor dealloc](&v8, "dealloc");
}

+ (BOOL)isAvailable
{
  return GEOConfigGetBOOL(MapsConfig_OpticalHeadingSessionThrottlerEnablePowerStateMonitor, off_1014B3478);
}

- (BOOL)isLowPowerModeEnabled
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v3 = objc_msgSend(v2, "isLowPowerModeEnabled");

  return v3;
}

- (void)reportStateToStateManager
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1006A7388;
  v2[3] = &unk_1011AD260;
  objc_copyWeak(&v3, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

@end
