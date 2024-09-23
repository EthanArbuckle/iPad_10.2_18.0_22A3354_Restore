@implementation HDSPWatchOnWristMonitor

- (HDSPWatchOnWristMonitor)initWithUserDefaults:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  HDSPWatchOnWristMonitor *v7;

  v4 = (void *)MEMORY[0x24BE6B628];
  v5 = a3;
  objc_msgSend(v4, "hkspMainThreadScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HDSPWatchOnWristMonitor initWithUserDefaults:callbackScheduler:](self, "initWithUserDefaults:callbackScheduler:", v5, v6);

  return v7;
}

- (HDSPWatchOnWristMonitor)initWithUserDefaults:(id)a3 callbackScheduler:(id)a4
{
  id v7;
  id v8;
  HDSPWatchOnWristMonitor *v9;
  HDSPWatchOnWristMonitor *v10;
  uint64_t v11;
  HKSPObserverSet *observers;
  HKWristDetectionSettingManager *v13;
  HKWristDetectionSettingManager *wristDetectionSettingsManager;
  HDSPWatchOnWristMonitor *v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HDSPWatchOnWristMonitor;
  v9 = -[HDSPWatchOnWristMonitor init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userDefaults, a3);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BEA98C8]), "initWithCallbackScheduler:", v8);
    observers = v10->_observers;
    v10->_observers = (HKSPObserverSet *)v11;

    v10->_lock._os_unfair_lock_opaque = 0;
    v13 = (HKWristDetectionSettingManager *)objc_alloc_init(MEMORY[0x24BDD4170]);
    wristDetectionSettingsManager = v10->_wristDetectionSettingsManager;
    v10->_wristDetectionSettingsManager = v13;

    v15 = v10;
  }

  return v10;
}

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);

  p_lock = &self->_lock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (void)addObserver:(id)a3
{
  char v4;

  v4 = 0;
  -[HKSPObserverSet addObserver:wasFirst:](self->_observers, "addObserver:wasFirst:", a3, &v4);
  if (v4)
    -[HKWristDetectionSettingManager registerObserver:](self->_wristDetectionSettingsManager, "registerObserver:", self);
}

- (void)removeObserver:(id)a3
{
  char v4;

  v4 = 0;
  -[HKSPObserverSet removeObserver:wasLast:](self->_observers, "removeObserver:wasLast:", a3, &v4);
  if (v4)
    -[HKWristDetectionSettingManager unregisterObserver:](self->_wristDetectionSettingsManager, "unregisterObserver:", self);
}

- (BOOL)isOnWrist
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __36__HDSPWatchOnWristMonitor_isOnWrist__block_invoke;
  v4[3] = &unk_24D4E3CE8;
  v4[4] = self;
  v4[5] = &v5;
  -[HDSPWatchOnWristMonitor _withLock:](self, "_withLock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __36__HDSPWatchOnWristMonitor_isOnWrist__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_lock_isOnWrist");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_lock_isOnWrist
{
  return -[HKSPUserDefaults hksp_BOOLForKey:](self->_userDefaults, "hksp_BOOLForKey:", CFSTR("isOnWrist"));
}

- (void)_lock_setIsOnWrist:(BOOL)a3
{
  -[HKSPUserDefaults hksp_setBool:forKey:](self->_userDefaults, "hksp_setBool:forKey:", a3, CFSTR("isOnWrist"));
}

- (NSDate)lastOnWristDate
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__8;
  v9 = __Block_byref_object_dispose__8;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __42__HDSPWatchOnWristMonitor_lastOnWristDate__block_invoke;
  v4[3] = &unk_24D4E3CE8;
  v4[4] = self;
  v4[5] = &v5;
  -[HDSPWatchOnWristMonitor _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDate *)v2;
}

void __42__HDSPWatchOnWristMonitor_lastOnWristDate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_lock_lastOnWristDate");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_lock_lastOnWristDate
{
  return (id)-[HKSPUserDefaults hksp_objectForKey:](self->_userDefaults, "hksp_objectForKey:", CFSTR("lastOnWristDate"));
}

- (void)_lock_setLastOnWristDate:(id)a3
{
  -[HKSPUserDefaults hksp_setObject:forKey:](self->_userDefaults, "hksp_setObject:forKey:", a3, CFSTR("lastOnWristDate"));
}

- (BOOL)isWristDetectEnabled
{
  return -[HKWristDetectionSettingManager isWristDetectEnabled](self->_wristDetectionSettingsManager, "isWristDetectEnabled");
}

- (void)wristDetectionSettingManagerDidObserveWristDetectChange:(id)a3
{
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = (id)objc_opt_class();
    v5 = v7;
    _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] wristDetectionSettingManagerDidObserveWristDetectChange", (uint8_t *)&v6, 0xCu);

  }
  -[HKSPObserverSet enumerateObserversWithBlock:](self->_observers, "enumerateObserversWithBlock:", &__block_literal_global_5);
}

void __83__HDSPWatchOnWristMonitor_wristDetectionSettingManagerDidObserveWristDetectChange___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "wristDetectEnabledDidChange");

}

- (HKWristDetectionSettingManager)wristDetectionSettingsManager
{
  return self->_wristDetectionSettingsManager;
}

- (HKSPUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (HKSPObserverSet)observers
{
  return self->_observers;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_wristDetectionSettingsManager, 0);
}

@end
