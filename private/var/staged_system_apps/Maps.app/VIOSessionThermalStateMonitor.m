@implementation VIOSessionThermalStateMonitor

- (VIOSessionThermalStateMonitor)initWithStateManager:(id)a3 platformController:(id)a4
{
  VIOSessionThermalStateMonitor *v4;
  id v5;
  NSObject *v6;
  void *v7;
  objc_super v9;
  uint8_t buf[4];
  VIOSessionThermalStateMonitor *v11;

  v9.receiver = self;
  v9.super_class = (Class)VIOSessionThermalStateMonitor;
  v4 = -[VIOSessionMonitor initWithStateManager:platformController:](&v9, "initWithStateManager:platformController:", a3, a4);
  if (v4)
  {
    v5 = sub_1005C4914();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v4, "processInfoThermalStateDidChangeNotification:", NSProcessInfoThermalStateDidChangeNotification, 0);

    _GEOConfigAddDelegateListenerForKey(MapsConfig_OpticalHeadingSessionThrottlerThermalStateMonitorThreshold, off_1014B42C8, &_dispatch_main_q, v4);
    -[VIOSessionThermalStateMonitor reportStateToStateManager](v4, "reportStateToStateManager");
  }
  return v4;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  objc_super v6;
  uint8_t buf[4];
  VIOSessionThermalStateMonitor *v8;

  v3 = sub_1005C4914();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  GEOConfigRemoveDelegateListenerForAllKeys(self, v5);
  v6.receiver = self;
  v6.super_class = (Class)VIOSessionThermalStateMonitor;
  -[VIOSessionThermalStateMonitor dealloc](&v6, "dealloc");
}

+ (BOOL)isAvailable
{
  return GEOConfigGetBOOL(MapsConfig_OpticalHeadingSessionThrottlerEnableThermalStateMonitor, off_1014B3B38);
}

- (BOOL)shouldDisableVIOSession
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v3 = objc_msgSend(v2, "thermalState");
  LOBYTE(v3) = (uint64_t)v3 >= GEOConfigGetInteger(MapsConfig_OpticalHeadingSessionThrottlerThermalStateMonitorThreshold, off_1014B42C8);

  return (char)v3;
}

- (void)reportStateToStateManager
{
  const char *label;
  const char *v4;
  BOOL v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  const char *v11;
  uint64_t Integer;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  VIOSessionThermalStateMonitor *v21;
  int v22;
  VIOSessionThermalStateMonitor *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  _BYTE v27[14];
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v17 = sub_1004318FC();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v22 = 136316418;
        v23 = (VIOSessionThermalStateMonitor *)"-[VIOSessionThermalStateMonitor reportStateToStateManager]";
        v24 = 2080;
        v25 = "VIOSessionThermalStateMonitor.m";
        v26 = 1024;
        *(_DWORD *)v27 = 69;
        *(_WORD *)&v27[4] = 2080;
        *(_QWORD *)&v27[6] = "dispatch_get_main_queue()";
        v28 = 2080;
        v29 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v30 = 2080;
        v31 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v22,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v19 = sub_1004318FC();
        v20 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v21 = (VIOSessionThermalStateMonitor *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v22 = 138412290;
          v23 = v21;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v22, 0xCu);

        }
      }
    }
  }
  v6 = -[VIOSessionThermalStateMonitor shouldDisableVIOSession](self, "shouldDisableVIOSession");
  v7 = sub_1005C4914();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
      v11 = (const char *)objc_msgSend(v10, "thermalState");
      Integer = GEOConfigGetInteger(MapsConfig_OpticalHeadingSessionThrottlerThermalStateMonitorThreshold, off_1014B42C8);
      v22 = 134349568;
      v23 = self;
      v24 = 2048;
      v25 = v11;
      v26 = 2048;
      *(_QWORD *)v27 = Integer;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Will disable VIO with current thermal state: %ld, threshold: %ld", (uint8_t *)&v22, 0x20u);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor stateManager](self, "stateManager"));
    objc_msgSend(v13, "recordSessionDisableEvent:", 5);
  }
  else
  {
    if (v9)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
      v15 = (const char *)objc_msgSend(v14, "thermalState");
      v16 = GEOConfigGetInteger(MapsConfig_OpticalHeadingSessionThrottlerThermalStateMonitorThreshold, off_1014B42C8);
      v22 = 134349568;
      v23 = self;
      v24 = 2048;
      v25 = v15;
      v26 = 2048;
      *(_QWORD *)v27 = v16;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Will NOT disable VIO with current thermal state: %ld, threshold: %ld", (uint8_t *)&v22, 0x20u);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor stateManager](self, "stateManager"));
    objc_msgSend(v13, "resetSessionDisableEvent:", 5);
  }

}

- (void)processInfoThermalStateDidChangeNotification:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  uint8_t buf[4];
  VIOSessionThermalStateMonitor *v9;

  v4 = sub_1005C4914();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Detected thermal state changed", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1005C4EA8;
  block[3] = &unk_1011AD260;
  objc_copyWeak(&v7, (id *)buf);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  VIOSessionThermalStateMonitor *v7;

  v4 = sub_1005C4914();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Thermal state threshold value changed", (uint8_t *)&v6, 0xCu);
  }

  -[VIOSessionThermalStateMonitor reportStateToStateManager](self, "reportStateToStateManager");
}

@end
