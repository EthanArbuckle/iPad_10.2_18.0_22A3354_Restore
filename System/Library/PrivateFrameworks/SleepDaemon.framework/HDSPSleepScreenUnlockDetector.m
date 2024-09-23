@implementation HDSPSleepScreenUnlockDetector

- (HDSPSleepScreenUnlockDetector)initWithEnvironment:(id)a3
{
  id v4;
  HDSPSleepScreenUnlockDetector *v5;
  HDSPSleepScreenUnlockDetector *v6;
  void (**v7)(void);
  uint64_t v8;
  HKSPMutexProvider *mutexProvider;
  HDSPSleepScreenUnlockDetector *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDSPSleepScreenUnlockDetector;
  v5 = -[HDSPSleepScreenUnlockDetector init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_environment, v4);
    objc_msgSend(v4, "mutexGenerator");
    v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v7[2]();
    v8 = objc_claimAutoreleasedReturnValue();
    mutexProvider = v6->_mutexProvider;
    v6->_mutexProvider = (HKSPMutexProvider *)v8;

    v10 = v6;
  }

  return v6;
}

- (void)_withLock:(id)a3
{
  -[HKSPMutexProvider performBlock:](self->_mutexProvider, "performBlock:", a3);
}

- (void)environmentWillBecomeReady:(id)a3
{
  void *v4;
  id v5;

  -[HDSPSleepScreenUnlockDetector environment](self, "environment", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sleepModeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:", self);

}

- (void)startDetecting
{
  NSObject *v3;
  id v4;
  id WeakRetained;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (!self->_isDetecting)
  {
    HKSPLogForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = (id)objc_opt_class();
      v4 = v8;
      _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] startDetecting", (uint8_t *)&v7, 0xCu);

    }
    self->_isDetecting = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
    objc_msgSend(WeakRetained, "actionManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:", self);

  }
}

- (void)stopDetecting
{
  NSObject *v3;
  id v4;
  id WeakRetained;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = (id)objc_opt_class();
    v4 = v8;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] stopDetecting", (uint8_t *)&v7, 0xCu);

  }
  self->_isDetecting = 0;
  -[HDSPSleepScreenUnlockDetector _resetCounter](self, "_resetCounter");
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "actionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

}

- (unint64_t)type
{
  return 1;
}

- (void)_resetCounter
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __46__HDSPSleepScreenUnlockDetector__resetCounter__block_invoke;
  v2[3] = &unk_24D4E3498;
  v2[4] = self;
  -[HDSPSleepScreenUnlockDetector _withLock:](self, "_withLock:", v2);
}

uint64_t __46__HDSPSleepScreenUnlockDetector__resetCounter__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNumberOfTimesDismissed:", 0);
}

- (void)setNumberOfTimesDismissed:(unint64_t)a3
{
  NSObject *v5;
  id v6;
  id WeakRetained;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = (id)objc_opt_class();
    v11 = 2048;
    v12 = a3;
    v6 = v10;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] setNumberOfTimesDismissed: %ld", (uint8_t *)&v9, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "userDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hksp_setInteger:forKey:", a3, CFSTR("HDSPSleepScreenUnlockCount"));

}

- (unint64_t)numberOfTimesDismissed
{
  id WeakRetained;
  void *v3;
  unint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "userDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hksp_integerForKey:", CFSTR("HDSPSleepScreenUnlockCount"));

  return v4;
}

- (void)sleepLockWasDismissed
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void (**v8)(void);
  void *v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (-[HDSPSleepScreenUnlockDetector isDetecting](self, "isDetecting"))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __54__HDSPSleepScreenUnlockDetector_sleepLockWasDismissed__block_invoke;
    v10[3] = &unk_24D4E34C0;
    v10[4] = self;
    v10[5] = &v11;
    -[HDSPSleepScreenUnlockDetector _withLock:](self, "_withLock:", v10);
    if (*((_BYTE *)v12 + 24))
    {
      HKSPLogForCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v4 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v16 = v4;
        v5 = v4;
        _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] counts as early wake up", buf, 0xCu);

      }
      -[HDSPSleepScreenUnlockDetector wakeDetectorDelegate](self, "wakeDetectorDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDSPSleepScreenUnlockDetector environment](self, "environment");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "currentDateProvider");
      v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v8[2]();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "wakeDetector:didDetectWakeUpEventOnDate:", self, v9);

    }
    _Block_object_dispose(&v11, 8);
  }
}

void __54__HDSPSleepScreenUnlockDetector_sleepLockWasDismissed__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  id v4;
  int v5;
  id v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "numberOfTimesDismissed") + 1;
  objc_msgSend(*(id *)(a1 + 32), "setNumberOfTimesDismissed:", v2);
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543618;
    v6 = (id)objc_opt_class();
    v7 = 2048;
    v8 = v2;
    v4 = v6;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleepLockWasDismissed (%ld times)", (uint8_t *)&v5, 0x16u);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2 == 2;
}

- (void)sleepModeDidChange:(int64_t)a3 previousMode:(int64_t)a4 reason:(unint64_t)a5
{
  if (a3 != a4)
    -[HDSPSleepScreenUnlockDetector _resetCounter](self, "_resetCounter");
}

- (HDSPWakeDetectorDelegate)wakeDetectorDelegate
{
  return (HDSPWakeDetectorDelegate *)objc_loadWeakRetained((id *)&self->_wakeDetectorDelegate);
}

- (void)setWakeDetectorDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_wakeDetectorDelegate, a3);
}

- (HDSPEnvironment)environment
{
  return (HDSPEnvironment *)objc_loadWeakRetained((id *)&self->_environment);
}

- (BOOL)isDetecting
{
  return self->_isDetecting;
}

- (HKSPMutexProvider)mutexProvider
{
  return self->_mutexProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutexProvider, 0);
  objc_destroyWeak((id *)&self->_environment);
  objc_destroyWeak((id *)&self->_wakeDetectorDelegate);
}

@end
