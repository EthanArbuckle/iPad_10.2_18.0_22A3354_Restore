@implementation VIOSessionDeviceMotionMonitor

- (VIOSessionDeviceMotionMonitor)initWithStateManager:(id)a3 platformController:(id)a4
{
  VIOSessionDeviceMotionMonitor *v4;
  id v5;
  NSObject *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  CMMotionActivityManager *v10;
  CMMotionActivityManager *motionActivityManager;
  void *v12;
  void *v13;
  id v14;
  objc_super v16;
  uint8_t buf[4];
  VIOSessionDeviceMotionMonitor *v18;
  __int16 v19;
  void *v20;

  v16.receiver = self;
  v16.super_class = (Class)VIOSessionDeviceMotionMonitor;
  v4 = -[VIOSessionMonitor initWithStateManager:platformController:](&v16, "initWithStateManager:platformController:", a3, a4);
  if (v4)
  {
    v5 = sub_100C0343C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (objc_class *)objc_opt_class(v4);
      v8 = NSStringFromClass(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      *(_DWORD *)buf = 134349314;
      v18 = v4;
      v19 = 2112;
      v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Enabling %@", buf, 0x16u);

    }
    v10 = (CMMotionActivityManager *)objc_alloc_init((Class)CMMotionActivityManager);
    motionActivityManager = v4->_motionActivityManager;
    v4->_motionActivityManager = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor session](v4, "session"));
    objc_msgSend(v12, "_addObserver:", v4);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor session](v4, "session"));
    v14 = objc_msgSend(v13, "state");

    if (v14 == (id)1)
      -[VIOSessionDeviceMotionMonitor startMonitoringDeviceMotion](v4, "startMonitoringDeviceMotion");
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
  VIOSessionDeviceMotionMonitor *v11;
  __int16 v12;
  void *v13;

  v3 = sub_100C0343C();
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
  -[CMMotionActivityManager stopActivityUpdates](self->_motionActivityManager, "stopActivityUpdates");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor session](self, "session"));
  objc_msgSend(v8, "_removeObserver:", self);

  v9.receiver = self;
  v9.super_class = (Class)VIOSessionDeviceMotionMonitor;
  -[VIOSessionDeviceMotionMonitor dealloc](&v9, "dealloc");
}

+ (BOOL)isAvailable
{
  int BOOL;

  BOOL = GEOConfigGetBOOL(MapsConfig_OpticalHeadingSessionThrottlerEnableDeviceMotionMonitor, off_1014B35F8);
  if (BOOL)
    LOBYTE(BOOL) = +[CMMotionActivityManager isActivityAvailable](CMMotionActivityManager, "isActivityAvailable");
  return BOOL;
}

- (void)startMonitoringDeviceMotion
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _BYTE location[12];
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;

  if ((objc_msgSend((id)objc_opt_class(self), "isAvailable") & 1) == 0)
  {
    v5 = sub_1004318FC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136315906;
      *(_QWORD *)&location[4] = "-[VIOSessionDeviceMotionMonitor startMonitoringDeviceMotion]";
      v13 = 2080;
      v14 = "VIOSessionDeviceMotionMonitor.m";
      v15 = 1024;
      v16 = 70;
      v17 = 2080;
      v18 = "[[self class] isAvailable]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", location, 0x26u);
    }

    if (sub_100A70734())
    {
      v7 = sub_1004318FC();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)location = 138412290;
        *(_QWORD *)&location[4] = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@", location, 0xCu);

      }
    }
  }
  if (objc_msgSend((id)objc_opt_class(self), "isAvailable"))
  {
    objc_initWeak((id *)location, self);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionDeviceMotionMonitor motionActivityManager](self, "motionActivityManager"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100C037FC;
    v10[3] = &unk_1011E9118;
    objc_copyWeak(&v11, (id *)location);
    objc_msgSend(v3, "startActivityUpdatesToQueue:withHandler:", v4, v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)location);
  }
}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  id v4;

  if (a4 == 1)
  {
    -[VIOSessionDeviceMotionMonitor startMonitoringDeviceMotion](self, "startMonitoringDeviceMotion", a3);
  }
  else
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[VIOSessionDeviceMotionMonitor motionActivityManager](self, "motionActivityManager", a3));
    objc_msgSend(v4, "stopActivityUpdates");

  }
}

- (CMMotionActivityManager)motionActivityManager
{
  return self->_motionActivityManager;
}

- (void)setMotionActivityManager:(id)a3
{
  objc_storeStrong((id *)&self->_motionActivityManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
}

@end
