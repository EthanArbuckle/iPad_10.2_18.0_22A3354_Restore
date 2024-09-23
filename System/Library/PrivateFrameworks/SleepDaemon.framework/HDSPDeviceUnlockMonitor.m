@implementation HDSPDeviceUnlockMonitor

- (HDSPDeviceUnlockMonitor)init
{
  void *v3;
  HDSPDeviceUnlockMonitor *v4;

  objc_msgSend(MEMORY[0x24BE6B628], "hkspMainThreadScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HDSPDeviceUnlockMonitor initWithCallbackScheduler:](self, "initWithCallbackScheduler:", v3);

  return v4;
}

- (HDSPDeviceUnlockMonitor)initWithCallbackScheduler:(id)a3
{
  id v4;
  HDSPDeviceUnlockMonitor *v5;
  HDSPDeviceUnlockMonitor *v6;
  uint64_t v7;
  HKSPObserverSet *observers;
  HDSPDeviceUnlockMonitor *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDSPDeviceUnlockMonitor;
  v5 = -[HDSPDeviceUnlockMonitor init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_monitorLock._os_unfair_lock_opaque = 0;
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BEA98C8]), "initWithCallbackScheduler:", v4);
    observers = v6->_observers;
    v6->_observers = (HKSPObserverSet *)v7;

    v9 = v6;
  }

  return v6;
}

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_monitorLock;
  void (**v4)(_QWORD);

  p_monitorLock = &self->_monitorLock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_monitorLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_monitorLock);
}

- (void)addObserver:(id)a3
{
  -[HKSPObserverSet addObserver:](self->_observers, "addObserver:", a3);
}

- (void)removeObserver:(id)a3
{
  -[HKSPObserverSet removeObserver:](self->_observers, "removeObserver:", a3);
}

- (void)setOverrideDeviceHasBeenUnlockedSinceBoot:(id)a3
{
  id v5;
  _QWORD v6[5];

  objc_storeStrong((id *)&self->_overrideDeviceHasBeenUnlockedSinceBoot, a3);
  v5 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __69__HDSPDeviceUnlockMonitor_setOverrideDeviceHasBeenUnlockedSinceBoot___block_invoke;
  v6[3] = &unk_24D4E3498;
  v6[4] = self;
  -[HDSPDeviceUnlockMonitor _withLock:](self, "_withLock:", v6);

}

uint64_t __69__HDSPDeviceUnlockMonitor_setOverrideDeviceHasBeenUnlockedSinceBoot___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 8) = 0;
  return result;
}

- (BOOL)hasBeenUnlockedSinceBoot
{
  void *v3;
  void *v4;
  char v5;
  char v7;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  -[HDSPDeviceUnlockMonitor overrideDeviceHasBeenUnlockedSinceBoot](self, "overrideDeviceHasBeenUnlockedSinceBoot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HDSPDeviceUnlockMonitor overrideDeviceHasBeenUnlockedSinceBoot](self, "overrideDeviceHasBeenUnlockedSinceBoot");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    return v5;
  }
  else
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __51__HDSPDeviceUnlockMonitor_hasBeenUnlockedSinceBoot__block_invoke;
    v8[3] = &unk_24D4E34C0;
    v8[4] = self;
    v8[5] = &v9;
    -[HDSPDeviceUnlockMonitor _withLock:](self, "_withLock:", v8);
    v7 = *((_BYTE *)v10 + 24);
    _Block_object_dispose(&v9, 8);
    return v7;
  }
}

void __51__HDSPDeviceUnlockMonitor_hasBeenUnlockedSinceBoot__block_invoke(uint64_t a1)
{
  _BYTE *v2;
  char v3;
  NSObject *v4;
  void *v5;
  int v6;
  id v7;
  int v8;
  void *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = *(_BYTE **)(a1 + 32);
  if (v2[8])
  {
    v3 = 1;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = objc_msgSend(v2, "_latestKeyBagValueForHasBeenUnlockedSinceBoot");
    HKSPLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)objc_opt_class();
      v6 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8);
      v8 = 138543618;
      v9 = v5;
      v10 = 1024;
      v11 = v6;
      v7 = v5;
      _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] found initial hasBeenUnlockedSinceBoot value of [%d]", (uint8_t *)&v8, 0x12u);

    }
    v3 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
}

- (BOOL)_latestKeyBagValueForHasBeenUnlockedSinceBoot
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = MKBDeviceUnlockedSinceBoot();
  v3 = v2;
  if ((v2 & 0x80000000) == 0)
    return (_DWORD)v2 == 1;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = (void *)objc_opt_class();
    v7 = (void *)MEMORY[0x24BDD16E0];
    v8 = v6;
    objc_msgSend(v7, "numberWithInt:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v6;
    v12 = 2112;
    v13 = v9;
    _os_log_error_impl(&dword_21610C000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] received an error when calling MKBDeviceUnlockedSinceBoot().  Error code: [%@]", (uint8_t *)&v10, 0x16u);

  }
  return 0;
}

- (void)handleFirstUnlock
{
  NSObject *v3;
  id v4;
  _QWORD v5[5];
  uint8_t buf[4];
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = (id)objc_opt_class();
    v4 = v7;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] handleFirstUnlock", buf, 0xCu);

  }
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__HDSPDeviceUnlockMonitor_handleFirstUnlock__block_invoke;
  v5[3] = &unk_24D4E3498;
  v5[4] = self;
  -[HDSPDeviceUnlockMonitor _withLock:](self, "_withLock:", v5);
  -[HKSPObserverSet enumerateObserversWithBlock:](self->_observers, "enumerateObserversWithBlock:", &__block_literal_global_4);
}

uint64_t __44__HDSPDeviceUnlockMonitor_handleFirstUnlock__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 8) = 1;
  return result;
}

uint64_t __44__HDSPDeviceUnlockMonitor_handleFirstUnlock__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deviceHasBeenUnlocked");
}

- (id)notificationListener:(id)a3 didReceiveNotificationWithName:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  _BYTE v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobile.keybagd.first_unlock")))
  {
    HKSPLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v10 = 138543618;
      *(_QWORD *)&v10[4] = objc_opt_class();
      *(_WORD *)&v10[12] = 2114;
      *(_QWORD *)&v10[14] = v5;
      v7 = *(id *)&v10[4];
      _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] received %{public}@", v10, 0x16u);

    }
    -[HDSPDeviceUnlockMonitor handleFirstUnlock](self, "handleFirstUnlock");
  }
  objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult", *(_OWORD *)v10, *(_QWORD *)&v10[16], v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (os_unfair_lock_s)monitorLock
{
  return self->_monitorLock;
}

- (HKSPObserverSet)observers
{
  return self->_observers;
}

- (NSNumber)overrideDeviceHasBeenUnlockedSinceBoot
{
  return self->_overrideDeviceHasBeenUnlockedSinceBoot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideDeviceHasBeenUnlockedSinceBoot, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
