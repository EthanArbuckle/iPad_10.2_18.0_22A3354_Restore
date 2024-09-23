@implementation HKSPSensitiveUIMonitor

+ (id)sharedMonitor
{
  if (qword_1ED05F268 != -1)
    dispatch_once(&qword_1ED05F268, &__block_literal_global_10);
  return (id)qword_1ED05F260;
}

void __39__HKSPSensitiveUIMonitor_sharedMonitor__block_invoke()
{
  HKSPSensitiveUIMonitor *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [HKSPSensitiveUIMonitor alloc];
  objc_msgSend(MEMORY[0x1E0D519E8], "hkspMainThreadScheduler");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[HKSPSensitiveUIMonitor initWithCallbackScheduler:](v0, "initWithCallbackScheduler:", v3);
  v2 = (void *)qword_1ED05F260;
  qword_1ED05F260 = v1;

}

- (BOOL)_isVendorRelease
{
  if (qword_1ED05F270 != -1)
    dispatch_once(&qword_1ED05F270, &__block_literal_global_185_0);
  return _MergedGlobals_14;
}

void __42__HKSPSensitiveUIMonitor__isVendorRelease__block_invoke()
{
  id v0;

  v0 = (id)MGGetStringAnswer();
  _MergedGlobals_14 = objc_msgSend(CFSTR("Vendor"), "isEqualToString:", v0);

}

- (HKSPSensitiveUIMonitor)initWithCallbackScheduler:(id)a3
{
  id v4;
  HKSPSensitiveUIMonitor *v5;
  HKSPObserverSet *v6;
  HKSPObserverSet *observers;
  uint64_t v8;
  NSUserDefaults *userDefaults;
  NPSManager *v10;
  NPSManager *npsManager;
  HKSPSensitiveUIMonitor *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKSPSensitiveUIMonitor;
  v5 = -[HKSPSensitiveUIMonitor init](&v14, sel_init);
  if (v5)
  {
    v6 = -[HKSPObserverSet initWithCallbackScheduler:]([HKSPObserverSet alloc], "initWithCallbackScheduler:", v4);
    observers = v5->_observers;
    v5->_observers = v6;

    objc_msgSend(MEMORY[0x1E0C99EA0], "hksp_internalUserDefaults");
    v8 = objc_claimAutoreleasedReturnValue();
    userDefaults = v5->_userDefaults;
    v5->_userDefaults = (NSUserDefaults *)v8;

    v10 = (NPSManager *)objc_alloc_init(MEMORY[0x1E0D51618]);
    npsManager = v5->_npsManager;
    v5->_npsManager = v10;

    v5->_needPrefsUpdate = 1;
    v5->_lock._os_unfair_lock_opaque = 0;
    -[HKSPSensitiveUIMonitor registerForNotifications](v5, "registerForNotifications");
    v12 = v5;
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[HKSPSensitiveUIMonitor unregisterForNotifications](self, "unregisterForNotifications");
  v3.receiver = self;
  v3.super_class = (Class)HKSPSensitiveUIMonitor;
  -[HKSPSensitiveUIMonitor dealloc](&v3, sel_dealloc);
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

- (void)registerForNotifications
{
  -[NSUserDefaults addObserver:forKeyPath:options:context:](self->_userDefaults, "addObserver:forKeyPath:options:context:", self, CFSTR("hideAzulSensitiveUI"), 0, 0);
}

- (void)unregisterForNotifications
{
  -[NSUserDefaults removeObserver:forKeyPath:](self->_userDefaults, "removeObserver:forKeyPath:", self, CFSTR("hideAzulSensitiveUI"));
}

- (void)_handleNotification
{
  NSObject *v3;
  id v4;
  _QWORD v5[5];
  uint8_t buf[4];
  id v7;
  __int16 v8;
  HKSPSensitiveUIMonitor *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  HKSPLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v7 = (id)objc_opt_class();
    v8 = 2048;
    v9 = self;
    v4 = v7;
    _os_log_impl(&dword_1A4F0E000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] sensitiveUIStateChanged", buf, 0x16u);

  }
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__HKSPSensitiveUIMonitor__handleNotification__block_invoke;
  v5[3] = &unk_1E4E3AF48;
  v5[4] = self;
  -[HKSPSensitiveUIMonitor _withLock:](self, "_withLock:", v5);
  -[HKSPObserverSet enumerateObserversWithBlock:](self->_observers, "enumerateObserversWithBlock:", &__block_literal_global_196);
}

uint64_t __45__HKSPSensitiveUIMonitor__handleNotification__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 10) = 1;
  return result;
}

void __45__HKSPSensitiveUIMonitor__handleNotification__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "sensitiveUIStateChanged");

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  objc_super v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  HKSPSensitiveUIMonitor *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("hideAzulSensitiveUI")))
  {
    HKSPLogForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v17 = (id)objc_opt_class();
      v18 = 2048;
      v19 = self;
      v14 = v17;
      _os_log_impl(&dword_1A4F0E000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] NSUserDefaults key path changed", buf, 0x16u);

    }
    -[HKSPSensitiveUIMonitor _handleNotification](self, "_handleNotification");
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)HKSPSensitiveUIMonitor;
    -[HKSPSensitiveUIMonitor observeValueForKeyPath:ofObject:change:context:](&v15, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void)addObserver:(id)a3
{
  -[HKSPObserverSet addObserver:](self->_observers, "addObserver:", a3);
}

- (void)removeObserver:(id)a3
{
  -[HKSPObserverSet removeObserver:](self->_observers, "removeObserver:", a3);
}

- (BOOL)shouldHideForSensitivity:(int64_t)a3
{
  return a3 >= 2 && -[HKSPSensitiveUIMonitor _hideSensitiveUI](self, "_hideSensitiveUI");
}

- (BOOL)_hideSensitiveUI
{
  BOOL v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  if (-[HKSPSensitiveUIMonitor _isVendorRelease](self, "_isVendorRelease"))
    return 1;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__HKSPSensitiveUIMonitor__hideSensitiveUI__block_invoke;
  v5[3] = &unk_1E4E3B8A0;
  v5[4] = self;
  v5[5] = &v6;
  -[HKSPSensitiveUIMonitor _withLock:](self, "_withLock:", v5);
  v3 = *((_BYTE *)v7 + 24) != 0;
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __42__HKSPSensitiveUIMonitor__hideSensitiveUI__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  char v7;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 10) && !*(_BYTE *)(v2 + 8))
  {
    objc_msgSend(*(id *)(v2 + 24), "objectForKey:", CFSTR("hideAzulSensitiveUI"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    v5 = (void *)MEMORY[0x1E0C9AAB0];
    if (v3)
      v5 = (void *)v3;
    v6 = v5;

    v7 = objc_msgSend(v6, "BOOLValue");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = v7;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 10) = 0;
    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_BYTE *)(v2 + 9);
}

- (void)overrideHideSensitiveUI:(BOOL)a3
{
  _QWORD v4[5];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__HKSPSensitiveUIMonitor_overrideHideSensitiveUI___block_invoke;
  v4[3] = &unk_1E4E3AD30;
  v4[4] = self;
  v5 = a3;
  -[HKSPSensitiveUIMonitor _withLock:](self, "_withLock:", v4);
  -[HKSPSensitiveUIMonitor _handleNotification](self, "_handleNotification");
}

uint64_t __50__HKSPSensitiveUIMonitor_overrideHideSensitiveUI___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 8) = 1;
  *(_BYTE *)(*(_QWORD *)(result + 32) + 9) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setCurrentSensitiveUIHidden:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NPSManager *npsManager;
  void *v11;
  _QWORD v12[5];
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  HKSPSensitiveUIMonitor *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  HKSPLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_opt_class();
    v7 = (void *)MEMORY[0x1E0CB37E8];
    v8 = v6;
    objc_msgSend(v7, "numberWithBool:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v14 = v6;
    v15 = 2048;
    v16 = self;
    v17 = 2114;
    v18 = v9;
    _os_log_impl(&dword_1A4F0E000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] Setting current sensitive UI hidden: %{public}@", buf, 0x20u);

  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__HKSPSensitiveUIMonitor_setCurrentSensitiveUIHidden___block_invoke;
  v12[3] = &unk_1E4E3AF48;
  v12[4] = self;
  -[HKSPSensitiveUIMonitor _withLock:](self, "_withLock:", v12);
  -[NSUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:", v3, CFSTR("hideAzulSensitiveUI"));
  npsManager = self->_npsManager;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("hideAzulSensitiveUI"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPSManager synchronizeUserDefaultsDomain:keys:](npsManager, "synchronizeUserDefaultsDomain:keys:", CFSTR("com.apple.internal.sleep"), v11);

}

uint64_t __54__HKSPSensitiveUIMonitor_setCurrentSensitiveUIHidden___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 10) = 1;
  return result;
}

- (HKSPObserverSet)observers
{
  return self->_observers;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (NPSManager)npsManager
{
  return self->_npsManager;
}

- (BOOL)sensitiveUIOverridden
{
  return self->_sensitiveUIOverridden;
}

- (BOOL)hideSensitiveUI
{
  return self->_hideSensitiveUI;
}

- (BOOL)needPrefsUpdate
{
  return self->_needPrefsUpdate;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_npsManager, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
