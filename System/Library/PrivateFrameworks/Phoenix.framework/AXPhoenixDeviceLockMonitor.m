@implementation AXPhoenixDeviceLockMonitor

+ (id)sharedInstance
{
  id location;
  dispatch_once_t *v4;

  v4 = (dispatch_once_t *)&sharedInstance_onceToken_0;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_2);
  if (*v4 != -1)
    dispatch_once(v4, location);
  objc_storeStrong(&location, 0);
  return (id)sharedInstance__sharedInstance_0;
}

void __44__AXPhoenixDeviceLockMonitor_sharedInstance__block_invoke()
{
  AXPhoenixDeviceLockMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(AXPhoenixDeviceLockMonitor);
  v1 = (void *)sharedInstance__sharedInstance_0;
  sharedInstance__sharedInstance_0 = (uint64_t)v0;

}

- (AXPhoenixDeviceLockMonitor)init
{
  AXPhoenixDeviceLockMonitor *v3;
  objc_super v4;
  SEL v5;
  AXPhoenixDeviceLockMonitor *v6;

  v5 = a2;
  v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)AXPhoenixDeviceLockMonitor;
  v6 = -[AXPhoenixEventMonitor init](&v4, sel_init);
  objc_storeStrong((id *)&v6, v6);
  if (v6)
    -[AXPhoenixDeviceLockMonitor setDeviceLocked:](v6, "setDeviceLocked:", 0);
  v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(id *);
  void *v8;
  id v9;
  id v10;
  id location[2];
  AXPhoenixDeviceLockMonitor *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_initWeak(&v10, v12);
  queue = location[0];
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __56__AXPhoenixDeviceLockMonitor__startMonitoringWithQueue___block_invoke;
  v8 = &unk_24F18F158;
  objc_copyWeak(&v9, &v10);
  dispatch_async(queue, &v4);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v10);
  objc_storeStrong(location, 0);
}

void __56__AXPhoenixDeviceLockMonitor__startMonitoringWithQueue___block_invoke(id *a1)
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v2;
  id v3;
  os_log_t oslog;
  id location[3];
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  location[2] = a1;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  if (location[0])
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, location[0], (CFNotificationCallback)HandleDeviceLockStateChanged, CFSTR("com.apple.mobile.keybagd.lock_status"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    oslog = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v6, (uint64_t)"-[AXPhoenixDeviceLockMonitor _startMonitoringWithQueue:]_block_invoke");
      _os_log_impl(&dword_228CDB000, oslog, OS_LOG_TYPE_DEFAULT, "[PHOENIX] %s Started monitoring device lock/unlock state", v6, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    v3 = location[0];
    v2 = mach_absolute_time();
    objc_msgSend(v3, "deviceLockStateChanged:", MachAbsoluteTimeToTimeIntervalSinceBoot_1(v2));
  }
  objc_storeStrong(location, 0);
}

- (void)_stopMonitoring
{
  __CFNotificationCenter *DarwinNotifyCenter;
  os_log_t oslog[2];
  AXPhoenixDeviceLockMonitor *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = self;
  oslog[1] = (os_log_t)a2;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, v4, CFSTR("com.apple.mobile.keybagd.lock_status"), 0);
  oslog[0] = (os_log_t)(id)AXLogBackTap();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_32((uint64_t)v5, (uint64_t)"-[AXPhoenixDeviceLockMonitor _stopMonitoring]");
    _os_log_impl(&dword_228CDB000, oslog[0], OS_LOG_TYPE_DEFAULT, "[PHOENIX] %s Stopped monitoring device lock/unlock state", v5, 0xCu);
  }
  objc_storeStrong((id *)oslog, 0);
}

- (void)deviceLockStateChanged:(double)a3
{
  const __CFString *v3;
  AXPhoenixDeviceLockMonitor *v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  id v10[2];
  os_log_type_t v11;
  id v12;
  id location;
  double v14;
  SEL v15;
  AXPhoenixDeviceLockMonitor *v16;
  uint8_t v17[24];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v16 = self;
  v15 = a2;
  v14 = a3;
  -[AXPhoenixDeviceLockMonitor setDeviceLocked:](self, "setDeviceLocked:", -[AXPhoenixDeviceLockMonitor _queryIsDeviceLocked](self, "_queryIsDeviceLocked"));
  objc_initWeak(&location, v16);
  v12 = (id)AXLogBackTap();
  v11 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
  {
    if (-[AXPhoenixDeviceLockMonitor isDeviceLocked](v16, "isDeviceLocked"))
      v3 = CFSTR("Locked");
    else
      v3 = CFSTR("Unlocked");
    __os_log_helper_16_2_2_8_32_8_66((uint64_t)v17, (uint64_t)"-[AXPhoenixDeviceLockMonitor deviceLockStateChanged:]", (uint64_t)v3);
    _os_log_impl(&dword_228CDB000, (os_log_t)v12, v11, "[PHOENIX] %s Device Lock Status Changed : %{public}@", v17, 0x16u);
  }
  objc_storeStrong(&v12, 0);
  v4 = v16;
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __53__AXPhoenixDeviceLockMonitor_deviceLockStateChanged___block_invoke;
  v9 = &unk_24F18F6C0;
  objc_copyWeak(v10, &location);
  v10[1] = *(id *)&v14;
  -[AXPhoenixEventMonitor enumerateObserversInQueue:](v4, "enumerateObserversInQueue:", &v5);
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

void __53__AXPhoenixDeviceLockMonitor_deviceLockStateChanged___block_invoke(uint64_t a1, void *a2)
{
  id v3[2];
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3[1] = (id)a1;
  v3[0] = objc_loadWeakRetained((id *)(a1 + 32));
  if (v3[0])
    objc_msgSend(v3[0], "_notifyObserver:isDeviceLocked:timestamp:", location[0], objc_msgSend(v3[0], "isDeviceLocked") & 1, *(double *)(a1 + 40));
  objc_storeStrong(v3, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)_queryIsDeviceLocked
{
  BOOL v3;
  int v4;

  v4 = MKBGetDeviceLockState();
  v3 = 1;
  if (v4 != 2)
    return v4 == 1;
  return v3;
}

- (void)_notifyObserver:(id)a3 isDeviceLocked:(BOOL)a4 timestamp:(double)a5
{
  id location[2];
  AXPhoenixDeviceLockMonitor *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[AXPhoenixEventMonitor notifyObserver:](v8, "notifyObserver:", location[0]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(location[0], "phoenixDeviceLockMonitor:didReceiveDeviceLockStateChanged:timestamp:", v8, a4, a5);
  objc_storeStrong(location, 0);
}

- (BOOL)isDeviceLocked
{
  return self->_deviceLocked;
}

- (void)setDeviceLocked:(BOOL)a3
{
  self->_deviceLocked = a3;
}

@end
