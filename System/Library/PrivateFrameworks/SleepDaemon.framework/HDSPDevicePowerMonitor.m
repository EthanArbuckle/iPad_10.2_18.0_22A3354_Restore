@implementation HDSPDevicePowerMonitor

- (HDSPDevicePowerMonitor)init
{
  void *v3;
  HDSPDevicePowerMonitor *v4;

  objc_msgSend(MEMORY[0x24BE6B628], "hkspMainThreadScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HDSPDevicePowerMonitor initWithCallbackScheduler:](self, "initWithCallbackScheduler:", v3);

  return v4;
}

- (HDSPDevicePowerMonitor)initWithCallbackScheduler:(id)a3
{
  id v4;
  HDSPDevicePowerMonitor *v5;
  uint64_t v6;
  HKSPObserverSet *observers;
  HDSPDevicePowerMonitor *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDSPDevicePowerMonitor;
  v5 = -[HDSPDevicePowerMonitor init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BEA98C8]), "initWithCallbackScheduler:", v4);
    observers = v5->_observers;
    v5->_observers = (HKSPObserverSet *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)addObserver:(id)a3
{
  -[HKSPObserverSet addObserver:](self->_observers, "addObserver:", a3);
}

- (void)removeObserver:(id)a3
{
  -[HKSPObserverSet removeObserver:](self->_observers, "removeObserver:", a3);
}

- (BOOL)isCharging
{
  NSNumber *isChargingOverride;
  int v4;
  NSObject *v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  isChargingOverride = self->_isChargingOverride;
  if (isChargingOverride)
    return -[NSNumber BOOLValue](isChargingOverride, "BOOLValue");
  v4 = HKSPIsCharging();
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543618;
    v8 = (id)objc_opt_class();
    v9 = 1024;
    v10 = v4;
    v6 = v8;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] charging: %d", (uint8_t *)&v7, 0x12u);

  }
  return v4;
}

- (float)batteryLevel
{
  NSNumber *batteryLevelOverride;
  float result;
  float v4;
  float v5;
  NSObject *v6;
  id v7;
  int v8;
  id v9;
  __int16 v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  batteryLevelOverride = self->_batteryLevelOverride;
  if (batteryLevelOverride)
  {
    -[NSNumber floatValue](batteryLevelOverride, "floatValue");
  }
  else
  {
    HKSPBatteryLevel();
    v5 = v4;
    HKSPLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543618;
      v9 = (id)objc_opt_class();
      v10 = 2048;
      v11 = v5;
      v7 = v9;
      _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] battery level: %f", (uint8_t *)&v8, 0x16u);

    }
    return v5;
  }
  return result;
}

- (id)notificationListener:(id)a3 didReceiveNotificationWithName:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  HKSPObserverSet *observers;
  void *v9;
  _QWORD v11[5];
  uint8_t buf[4];
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.system.powersources.source")) & 1) != 0)
  {
    HKSPLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v13 = (id)objc_opt_class();
      v14 = 2114;
      v15 = v5;
      v7 = v13;
      _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] received %{public}@", buf, 0x16u);

    }
    observers = self->_observers;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __78__HDSPDevicePowerMonitor_notificationListener_didReceiveNotificationWithName___block_invoke;
    v11[3] = &unk_24D4E5CD8;
    v11[4] = self;
    -[HKSPObserverSet enumerateObserversWithBlock:](observers, "enumerateObserversWithBlock:", v11);
  }
  objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __78__HDSPDevicePowerMonitor_notificationListener_didReceiveNotificationWithName___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "deviceChangedChargingState:", objc_msgSend(v2, "isCharging"));

}

- (HKSPObserverSet)observers
{
  return self->_observers;
}

- (NSNumber)isChargingOverride
{
  return self->_isChargingOverride;
}

- (void)setIsChargingOverride:(id)a3
{
  objc_storeStrong((id *)&self->_isChargingOverride, a3);
}

- (NSNumber)batteryLevelOverride
{
  return self->_batteryLevelOverride;
}

- (void)setBatteryLevelOverride:(id)a3
{
  objc_storeStrong((id *)&self->_batteryLevelOverride, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryLevelOverride, 0);
  objc_storeStrong((id *)&self->_isChargingOverride, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
