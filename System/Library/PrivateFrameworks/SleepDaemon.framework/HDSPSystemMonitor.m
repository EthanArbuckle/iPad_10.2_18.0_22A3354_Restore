@implementation HDSPSystemMonitor

+ (id)_platformSpecificReadyProviderForEnvironment:(id)a3
{
  id v3;
  void *v4;
  int v5;
  __objc2_class **v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "behavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAppleWatch");
  v6 = off_24D4E2BC8;
  if (!v5)
    v6 = off_24D4E2A30;
  v7 = (void *)objc_msgSend(objc_alloc(*v6), "initWithEnvironment:", v3);

  return v7;
}

- (HDSPSystemMonitor)initWithEnvironment:(id)a3
{
  id v4;
  void *v5;
  int v6;
  HDSPWatchOnWristMonitor *v7;
  void *v8;
  void *v9;
  HDSPWatchOnWristMonitor *v10;
  HDSPDevicePowerMonitor *v11;
  void *v12;
  HDSPDevicePowerMonitor *v13;
  HDSPDeviceUnlockMonitor *v14;
  void *v15;
  HDSPDeviceUnlockMonitor *v16;
  HDSPSystemMonitor *v17;

  v4 = a3;
  objc_msgSend(v4, "behavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAppleWatch");

  if (v6)
  {
    v7 = [HDSPWatchOnWristMonitor alloc];
    objc_msgSend(v4, "userDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "defaultCallbackScheduler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HDSPWatchOnWristMonitor initWithUserDefaults:callbackScheduler:](v7, "initWithUserDefaults:callbackScheduler:", v8, v9);

    v11 = [HDSPDevicePowerMonitor alloc];
    objc_msgSend(v4, "defaultCallbackScheduler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HDSPDevicePowerMonitor initWithCallbackScheduler:](v11, "initWithCallbackScheduler:", v12);

  }
  else
  {
    v10 = 0;
    v13 = 0;
  }
  v14 = [HDSPDeviceUnlockMonitor alloc];
  objc_msgSend(v4, "defaultCallbackScheduler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HDSPDeviceUnlockMonitor initWithCallbackScheduler:](v14, "initWithCallbackScheduler:", v15);
  v17 = -[HDSPSystemMonitor initWithEnvironment:watchOnWristMonitor:devicePowerMonitor:deviceUnlockMonitor:](self, "initWithEnvironment:watchOnWristMonitor:devicePowerMonitor:deviceUnlockMonitor:", v4, v10, v13, v16);

  return v17;
}

- (HDSPSystemMonitor)initWithEnvironment:(id)a3 watchOnWristMonitor:(id)a4 devicePowerMonitor:(id)a5 deviceUnlockMonitor:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HDSPApplicationWorkspaceMonitor *v15;
  HDSPSystemMonitor *v16;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend((id)objc_opt_class(), "_platformSpecificReadyProviderForEnvironment:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc_init(HDSPApplicationWorkspaceMonitor);
  v16 = -[HDSPSystemMonitor initWithEnvironment:watchOnWristMonitor:devicePowerMonitor:deviceUnlockMonitor:systemReadyProvider:applicationWorkspaceMonitor:](self, "initWithEnvironment:watchOnWristMonitor:devicePowerMonitor:deviceUnlockMonitor:systemReadyProvider:applicationWorkspaceMonitor:", v13, v12, v11, v10, v14, v15);

  return v16;
}

- (HDSPSystemMonitor)initWithEnvironment:(id)a3 watchOnWristMonitor:(id)a4 devicePowerMonitor:(id)a5 deviceUnlockMonitor:(id)a6 systemReadyProvider:(id)a7 applicationWorkspaceMonitor:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  HDSPSystemMonitor *v18;
  NSObject *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void (**v24)(void);
  uint64_t v25;
  HKSPMutexProvider *mutexProvider;
  HDSPSystemMonitor *v27;
  id v29;
  id obj;
  id v31;
  id v32;
  objc_super v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v32 = a7;
  obj = a8;
  v31 = a8;
  v33.receiver = self;
  v33.super_class = (Class)HDSPSystemMonitor;
  v18 = -[HDSPSystemMonitor init](&v33, sel_init);
  if (v18)
  {
    HKSPLogForCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v35 = v20;
      v36 = 2114;
      v37 = v32;
      v29 = v17;
      v21 = v16;
      v22 = v15;
      v23 = v20;
      _os_log_impl(&dword_21610C000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] initializing with %{public}@", buf, 0x16u);

      v15 = v22;
      v16 = v21;
      v17 = v29;
    }

    objc_storeWeak((id *)&v18->_environment, v14);
    objc_storeStrong((id *)&v18->_systemReadyProvider, a7);
    -[HDSPSystemReadyProvider setDelegate:](v18->_systemReadyProvider, "setDelegate:", v18);
    objc_storeStrong((id *)&v18->_deviceUnlockMonitor, a6);
    objc_storeStrong((id *)&v18->_devicePowerMonitor, a5);
    objc_storeStrong((id *)&v18->_watchOnWristMonitor, a4);
    objc_storeStrong((id *)&v18->_applicationWorkspaceMonitor, obj);
    objc_msgSend(v14, "mutexGenerator");
    v24 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v24[2]();
    v25 = objc_claimAutoreleasedReturnValue();
    mutexProvider = v18->_mutexProvider;
    v18->_mutexProvider = (HKSPMutexProvider *)v25;

    v27 = v18;
  }

  return v18;
}

- (void)_withLock:(id)a3
{
  -[HKSPMutexProvider performBlock:](self->_mutexProvider, "performBlock:", a3);
}

- (void)environmentWillBecomeReady:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "diagnostics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addProvider:", self);

  objc_msgSend(v4, "notificationListener");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:", self->_deviceUnlockMonitor);

  objc_msgSend(v4, "notificationListener");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addObserver:", self->_devicePowerMonitor);
}

- (BOOL)isSystemReady
{
  NSObject *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  char v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __34__HDSPSystemMonitor_isSystemReady__block_invoke;
  v9[3] = &unk_24D4E34C0;
  v9[4] = self;
  v9[5] = &v10;
  -[HDSPSystemMonitor _withLock:](self, "_withLock:", v9);
  if (*((_BYTE *)v11 + 24))
  {
    HKSPLogForCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v15 = v3;
      v4 = v3;
      _os_log_impl(&dword_21610C000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] system is ready", buf, 0xCu);

    }
  }
  else
  {
    HKSPLogForCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v15 = v5;
      v6 = v5;
      _os_log_impl(&dword_21610C000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] system not ready", buf, 0xCu);

    }
  }

  v7 = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __34__HDSPSystemMonitor_isSystemReady__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  v1 = result;
  v2 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v2 + 8))
  {
    v3 = 1;
  }
  else
  {
    result = objc_msgSend(*(id *)(v2 + 64), "isSystemReady");
    *(_BYTE *)(*(_QWORD *)(v1 + 32) + 8) = result;
    v3 = *(_BYTE *)(*(_QWORD *)(v1 + 32) + 8);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) = v3;
  return result;
}

- (void)systemDidBecomeReady
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "systemDidBecomeReady");

}

- (id)diagnosticDescription
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  int v9;
  void *v10;
  unsigned int v11;
  void *v12;
  float v13;
  double v14;
  void *v15;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = -[HDSPSystemMonitor isSystemReady](self, "isSystemReady");
  -[HDSPSystemMonitor deviceUnlockMonitor](self, "deviceUnlockMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Ready: %d\nHas Been Unlocked: %d\n"), v4, objc_msgSend(v5, "hasBeenUnlockedSinceBoot"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "behavior");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isAppleWatch");

  if (v9)
  {
    -[HDSPSystemMonitor devicePowerMonitor](self, "devicePowerMonitor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isCharging");
    -[HDSPSystemMonitor devicePowerMonitor](self, "devicePowerMonitor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "batteryLevel");
    v14 = v13;
    -[HDSPSystemMonitor watchOnWristMonitor](self, "watchOnWristMonitor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("Charging: %d\nBattery: %f\nOn Wrist: %d\n"), v11, *(_QWORD *)&v14, objc_msgSend(v15, "isOnWrist"));

  }
  return v6;
}

- (HDSPEnvironment)environment
{
  return (HDSPEnvironment *)objc_loadWeakRetained((id *)&self->_environment);
}

- (HDSPSystemReadyDelegate)delegate
{
  return (HDSPSystemReadyDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HDSPDeviceUnlockMonitor)deviceUnlockMonitor
{
  return self->_deviceUnlockMonitor;
}

- (HDSPDevicePowerMonitor)devicePowerMonitor
{
  return self->_devicePowerMonitor;
}

- (HDSPApplicationWorkspaceMonitor)applicationWorkspaceMonitor
{
  return self->_applicationWorkspaceMonitor;
}

- (HDSPWatchOnWristMonitor)watchOnWristMonitor
{
  return self->_watchOnWristMonitor;
}

- (HDSPSystemReadyProvider)systemReadyProvider
{
  return self->_systemReadyProvider;
}

- (BOOL)systemReady
{
  return self->_systemReady;
}

- (HKSPMutexProvider)mutexProvider
{
  return self->_mutexProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutexProvider, 0);
  objc_storeStrong((id *)&self->_systemReadyProvider, 0);
  objc_storeStrong((id *)&self->_watchOnWristMonitor, 0);
  objc_storeStrong((id *)&self->_applicationWorkspaceMonitor, 0);
  objc_storeStrong((id *)&self->_devicePowerMonitor, 0);
  objc_storeStrong((id *)&self->_deviceUnlockMonitor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_environment);
}

@end
