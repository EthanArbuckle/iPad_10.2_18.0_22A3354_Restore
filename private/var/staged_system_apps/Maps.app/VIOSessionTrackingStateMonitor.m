@implementation VIOSessionTrackingStateMonitor

- (VIOSessionTrackingStateMonitor)initWithStateManager:(id)a3 platformController:(id)a4
{
  VIOSessionTrackingStateMonitor *v4;
  id v5;
  NSObject *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  objc_super v12;
  uint8_t buf[4];
  VIOSessionTrackingStateMonitor *v14;
  __int16 v15;
  void *v16;

  v12.receiver = self;
  v12.super_class = (Class)VIOSessionTrackingStateMonitor;
  v4 = -[VIOSessionMonitor initWithStateManager:platformController:](&v12, "initWithStateManager:platformController:", a3, a4);
  if (v4)
  {
    v5 = sub_100C0166C();
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
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor session](v4, "session"));
    objc_msgSend(v10, "_addObserver:", v4);

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
  VIOSessionTrackingStateMonitor *v11;
  __int16 v12;
  void *v13;

  v3 = sub_100C0166C();
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
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor session](self, "session"));
  objc_msgSend(v8, "_removeObserver:", self);

  v9.receiver = self;
  v9.super_class = (Class)VIOSessionTrackingStateMonitor;
  -[VIOSessionTrackingStateMonitor dealloc](&v9, "dealloc");
}

+ (BOOL)isAvailable
{
  return GEOConfigGetBOOL(MapsConfig_OpticalHeadingSessionThrottlerEnableTrackingStateMonitor, off_1014B3608);
}

- (void)session:(id)a3 cameraDidChangeTrackingState:(id)a4
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  id v8;
  NSObject *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  _QWORD block[4];
  id v14[2];
  uint8_t buf[4];
  VIOSessionTrackingStateMonitor *v16;
  __int16 v17;
  __CFString *v18;
  __int16 v19;
  __CFString *v20;

  v5 = a4;
  v6 = (unint64_t)objc_msgSend(v5, "trackingState");
  v7 = (unint64_t)objc_msgSend(v5, "trackingStateReason");

  v8 = sub_100C0166C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    if (v6 >= 3)
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), v6));
    else
      v10 = off_1011E90D0[v6];
    v11 = v10;
    if (v7 >= 5)
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), v7));
    else
      v12 = off_1011E90E8[v7];
    *(_DWORD *)buf = 134349570;
    v16 = self;
    v17 = 2112;
    v18 = v11;
    v19 = 2112;
    v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[%{public}p] Detected tracking state %@ with reason: %@", buf, 0x20u);

  }
  objc_initWeak((id *)buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100C01990;
  block[3] = &unk_1011B72B0;
  v14[1] = (id)v6;
  objc_copyWeak(v14, (id *)buf);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(v14);
  objc_destroyWeak((id *)buf);
}

@end
