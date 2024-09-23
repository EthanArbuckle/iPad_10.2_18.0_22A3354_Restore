@implementation AXPhoenixWakeGestureMonitor

+ (id)sharedInstance
{
  id location;
  dispatch_once_t *v4;

  v4 = (dispatch_once_t *)&sharedInstance_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global);
  if (*v4 != -1)
    dispatch_once(v4, location);
  objc_storeStrong(&location, 0);
  return (id)sharedInstance__sharedInstance;
}

void __45__AXPhoenixWakeGestureMonitor_sharedInstance__block_invoke()
{
  AXPhoenixWakeGestureMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(AXPhoenixWakeGestureMonitor);
  v1 = (void *)sharedInstance__sharedInstance;
  sharedInstance__sharedInstance = (uint64_t)v0;

}

- (AXPhoenixWakeGestureMonitor)init
{
  AXPhoenixWakeGestureMonitor *v3;
  AXPhoenixWakeGestureMonitor *v4;
  id v5;
  objc_super v6;
  SEL v7;
  AXPhoenixWakeGestureMonitor *v8;

  v7 = a2;
  v8 = 0;
  v6.receiver = self;
  v6.super_class = (Class)AXPhoenixWakeGestureMonitor;
  v8 = -[AXPhoenixEventMonitor init](&v6, sel_init);
  objc_storeStrong((id *)&v8, v8);
  if (v8 && (objc_msgSend(getCMWakeGestureManagerClass(), "isWakeGestureAvailable") & 1) != 0)
  {
    v4 = v8;
    v5 = (id)objc_msgSend(getCMWakeGestureManagerClass(), "sharedManager");
    -[AXPhoenixWakeGestureMonitor setGestureManager:](v4, "setGestureManager:");

  }
  v3 = v8;
  objc_storeStrong((id *)&v8, 0);
  return v3;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  CMWakeGestureManager *v3;
  CMWakeGestureManager *v4;
  os_log_t oslog;
  id location[2];
  AXPhoenixWakeGestureMonitor *v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[AXPhoenixWakeGestureMonitor gestureManager](v7, "gestureManager");
  -[CMWakeGestureManager setDelegate:](v3, "setDelegate:", v7);

  v4 = -[AXPhoenixWakeGestureMonitor gestureManager](v7, "gestureManager");
  -[CMWakeGestureManager startWakeGestureUpdates](v4, "startWakeGestureUpdates");

  oslog = (os_log_t)(id)AXLogBackTap();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_32((uint64_t)v8, (uint64_t)"-[AXPhoenixWakeGestureMonitor _startMonitoringWithQueue:]");
    _os_log_impl(&dword_228CDB000, oslog, OS_LOG_TYPE_DEFAULT, "[PHOENIX] %s Started monitoring wake gesture", v8, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_storeStrong(location, 0);
}

- (void)_stopMonitoring
{
  CMWakeGestureManager *v2;
  os_log_t oslog[3];
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  oslog[2] = &self->super.super;
  oslog[1] = (os_log_t)a2;
  v2 = -[AXPhoenixWakeGestureMonitor gestureManager](self, "gestureManager");
  -[CMWakeGestureManager stopWakeGestureUpdates](v2, "stopWakeGestureUpdates");

  oslog[0] = (os_log_t)(id)AXLogBackTap();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_32((uint64_t)v4, (uint64_t)"-[AXPhoenixWakeGestureMonitor _stopMonitoring]");
    _os_log_impl(&dword_228CDB000, oslog[0], OS_LOG_TYPE_DEFAULT, "[PHOENIX] %s Stopped monitoring wake gesture", v4, 0xCu);
  }
  objc_storeStrong((id *)oslog, 0);
}

- (BOOL)isDeviceHandheld
{
  uint64_t v2;
  double v3;
  double v4;
  float v5;
  char v7;
  os_log_t v8;
  os_log_type_t v9;
  os_log_t v10;
  os_log_type_t type;
  os_log_t oslog;
  float v13;
  char v14;
  double v15;
  double v16;
  double v17;
  id location[3];
  uint8_t v19[16];
  uint8_t v20[32];
  uint8_t v21[24];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = +[AXPhoenixWakeGestureMonitor sharedInstance](AXPhoenixWakeGestureMonitor, "sharedInstance");
  v2 = mach_absolute_time();
  v17 = MachAbsoluteTimeToTimeIntervalSinceBoot_0(v2);
  objc_msgSend(location[0], "wakeGestureTimestamp");
  v16 = v3;
  objc_msgSend(location[0], "dismissalTimestamp");
  v15 = v4;
  v14 = 0;
  if (v16 <= v4)
  {
    v8 = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v19, (uint64_t)"-[AXPhoenixWakeGestureMonitor isDeviceHandheld]");
      _os_log_impl(&dword_228CDB000, v8, OS_LOG_TYPE_DEFAULT, "[PHOENIX] %s Tagging as FarField as user dismissed", v19, 0xCu);
    }
    objc_storeStrong((id *)&v8, 0);
  }
  else
  {
    v5 = v17 - v16;
    v13 = v5;
    if (v5 >= 8.0)
    {
      v10 = (os_log_t)(id)AXLogBackTap();
      v9 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_2_8_32_8_0((uint64_t)v20, (uint64_t)"-[AXPhoenixWakeGestureMonitor isDeviceHandheld]", COERCE__INT64(v13));
        _os_log_impl(&dword_228CDB000, v10, v9, "[PHOENIX] %s Tagging as farfield as last user interaction %f secs back", v20, 0x16u);
      }
      objc_storeStrong((id *)&v10, 0);
    }
    else
    {
      v14 = 1;
      oslog = (os_log_t)(id)AXLogBackTap();
      type = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_2_8_32_8_0((uint64_t)v21, (uint64_t)"-[AXPhoenixWakeGestureMonitor isDeviceHandheld]", COERCE__INT64(v13));
        _os_log_impl(&dword_228CDB000, oslog, type, "[PHOENIX] %s Tagging as handheld as user interacted in last %f secs", v21, 0x16u);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
  }
  v7 = v14;
  objc_storeStrong(location, 0);
  return v7 & 1;
}

- (void)wakeGestureManager:(id)a3 didUpdateWakeGesture:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  AXPhoenixWakeGestureMonitor *v6;
  AXPhoenixWakeGestureMonitor *v7;
  id location[2];
  AXPhoenixWakeGestureMonitor *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (a4 == 1)
  {
    v7 = v10;
    v4 = mach_absolute_time();
    -[AXPhoenixWakeGestureMonitor setWakeGestureTimestamp:](v7, "setWakeGestureTimestamp:", MachAbsoluteTimeToTimeIntervalSinceBoot_0(v4));
    -[AXPhoenixWakeGestureMonitor _didReceiveWakeGesture](v10, "_didReceiveWakeGesture");
  }
  else if (a4 == 3)
  {
    v6 = v10;
    v5 = mach_absolute_time();
    -[AXPhoenixWakeGestureMonitor setDismissalTimestamp:](v6, "setDismissalTimestamp:", MachAbsoluteTimeToTimeIntervalSinceBoot_0(v5));
    -[AXPhoenixWakeGestureMonitor _didReceiveSleepGesture](v10, "_didReceiveSleepGesture");
  }
  objc_storeStrong(location, 0);
}

- (void)_didReceiveWakeGesture
{
  void *v2;
  AXPhoenixWakeGestureMonitor *v3;
  objc_super v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  id v10[2];
  void *v11;
  SEL v12;
  AXPhoenixWakeGestureMonitor *v13;

  v13 = self;
  v12 = a2;
  -[AXPhoenixWakeGestureMonitor wakeGestureTimestamp](self, "wakeGestureTimestamp");
  v11 = v2;
  v3 = v13;
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __53__AXPhoenixWakeGestureMonitor__didReceiveWakeGesture__block_invoke;
  v9 = &unk_24F18F288;
  v10[0] = v13;
  v10[1] = v11;
  v4.receiver = v3;
  v4.super_class = (Class)AXPhoenixWakeGestureMonitor;
  -[AXPhoenixEventMonitor enumerateObserversInQueue:](&v4, sel_enumerateObserversInQueue_);
  objc_storeStrong(v10, 0);
}

void __53__AXPhoenixWakeGestureMonitor__didReceiveWakeGesture__block_invoke(uint64_t a1, void *a2)
{
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(*(id *)(a1 + 32), "notifyObserver:", location[0]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(location[0], "gestureMonitorDidReceiveWakeGesture:timestamp:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40));
  objc_storeStrong(location, 0);
}

- (void)_didReceiveSleepGesture
{
  void *v2;
  AXPhoenixWakeGestureMonitor *v3;
  objc_super v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  id v10[2];
  void *v11;
  SEL v12;
  AXPhoenixWakeGestureMonitor *v13;

  v13 = self;
  v12 = a2;
  -[AXPhoenixWakeGestureMonitor dismissalTimestamp](self, "dismissalTimestamp");
  v11 = v2;
  v3 = v13;
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __54__AXPhoenixWakeGestureMonitor__didReceiveSleepGesture__block_invoke;
  v9 = &unk_24F18F288;
  v10[0] = v13;
  v10[1] = v11;
  v4.receiver = v3;
  v4.super_class = (Class)AXPhoenixWakeGestureMonitor;
  -[AXPhoenixEventMonitor enumerateObserversInQueue:](&v4, sel_enumerateObserversInQueue_);
  objc_storeStrong(v10, 0);
}

void __54__AXPhoenixWakeGestureMonitor__didReceiveSleepGesture__block_invoke(uint64_t a1, void *a2)
{
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(*(id *)(a1 + 32), "notifyObserver:", location[0]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(location[0], "gestureMonitorDidReceiveSleepGesture:timestamp:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40));
  objc_storeStrong(location, 0);
}

- (double)wakeGestureTimestamp
{
  return self->_wakeGestureTimestamp;
}

- (void)setWakeGestureTimestamp:(double)a3
{
  self->_wakeGestureTimestamp = a3;
}

- (double)dismissalTimestamp
{
  return self->_dismissalTimestamp;
}

- (void)setDismissalTimestamp:(double)a3
{
  self->_dismissalTimestamp = a3;
}

- (CMWakeGestureManager)gestureManager
{
  return self->_gestureManager;
}

- (void)setGestureManager:(id)a3
{
  objc_storeStrong((id *)&self->_gestureManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureManager, 0);
}

@end
