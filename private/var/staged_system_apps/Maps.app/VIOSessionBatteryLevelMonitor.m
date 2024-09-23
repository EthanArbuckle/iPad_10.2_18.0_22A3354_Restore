@implementation VIOSessionBatteryLevelMonitor

- (VIOSessionBatteryLevelMonitor)initWithStateManager:(id)a3 platformController:(id)a4
{
  VIOSessionBatteryLevelMonitor *v4;
  id v5;
  NSObject *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BatteryMonitorToken *batteryMonitorToken;
  objc_super v14;
  uint8_t buf[4];
  VIOSessionBatteryLevelMonitor *v16;
  __int16 v17;
  void *v18;

  v14.receiver = self;
  v14.super_class = (Class)VIOSessionBatteryLevelMonitor;
  v4 = -[VIOSessionMonitor initWithStateManager:platformController:](&v14, "initWithStateManager:platformController:", a3, a4);
  if (v4)
  {
    v5 = sub_10063CB94();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (objc_class *)objc_opt_class(v4);
      v8 = NSStringFromClass(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      *(_DWORD *)buf = 134349314;
      v16 = v4;
      v17 = 2112;
      v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Enabling %@", buf, 0x16u);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[BatteryMonitorController sharedInstance](BatteryMonitorController, "sharedInstance"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "beginMonitoringBattery"));
    batteryMonitorToken = v4->_batteryMonitorToken;
    v4->_batteryMonitorToken = (BatteryMonitorToken *)v11;

    -[BatteryMonitorToken setDelegate:](v4->_batteryMonitorToken, "setDelegate:", v4);
    -[VIOSessionBatteryLevelMonitor reportStateToStateManager](v4, "reportStateToStateManager");
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
  VIOSessionBatteryLevelMonitor *v10;
  __int16 v11;
  void *v12;

  v3 = sub_10063CB94();
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
  v8.super_class = (Class)VIOSessionBatteryLevelMonitor;
  -[VIOSessionBatteryLevelMonitor dealloc](&v8, "dealloc");
}

- (NSString)description
{
  NSString *v2;
  void *v3;
  void *v4;
  float v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VIOSessionBatteryLevelMonitor;
  v2 = -[VIOSessionBatteryLevelMonitor description](&v8, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  objc_msgSend(v4, "batteryLevel");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" current battery level: %f"), v5));

  return (NSString *)v6;
}

+ (BOOL)isAvailable
{
  return GEOConfigGetBOOL(MapsConfig_OpticalHeadingSessionThrottlerEnableBatteryLevelMonitor, off_1014B3628);
}

- (BOOL)isBatteryLevelTooLow
{
  double Double;
  float v4;

  Double = GEOConfigGetDouble(MapsConfig_OpticalHeadingSessionThrottlerBatteryLevelThreshold, off_1014B3468);
  -[BatteryMonitorToken currentBatteryLevel](self->_batteryMonitorToken, "currentBatteryLevel");
  return Double >= (float)(v4 * 100.0);
}

- (void)reportStateToStateManager
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10063CE4C;
  v2[3] = &unk_1011AD260;
  objc_copyWeak(&v3, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (BatteryMonitorToken)batteryMonitorToken
{
  return self->_batteryMonitorToken;
}

- (void)setBatteryMonitorToken:(id)a3
{
  objc_storeStrong((id *)&self->_batteryMonitorToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryMonitorToken, 0);
}

@end
