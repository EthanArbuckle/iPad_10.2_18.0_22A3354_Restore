@implementation PMMDataProtectionMonitor

+ (id)PMMDataProtectionMonitorLockStateToString:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return CFSTR("Unknown");
  else
    return off_24D971DF8[a3];
}

+ (id)PMMDataProtectionMonitorEncryptedDataAvailabilityToString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return CFSTR("Unknown");
  else
    return off_24D971E18[a3 - 1];
}

+ (id)PMMDataProtectionMonitorDataProtectionStatus:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("unknown");
  if (a3 == 1)
    v3 = CFSTR("enabled");
  if (a3)
    return (id)v3;
  else
    return CFSTR("disabled");
}

- (PMMDataProtectionMonitor)init
{
  PMMDataProtectionMonitor *v2;
  PMMDataProtectionMonitor *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PMMDataProtectionMonitor;
  v2 = -[PMMDataProtectionMonitor init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    pthread_rwlock_init(&v2->_rwlock, 0);
    pthread_rwlock_wrlock(&v3->_rwlock);
    v3->_encryptedDataAvailability = 0;
    v3->_unlockedSinceBoot = 1;
    v3->_dataProtectionStatus = 2;
    pthread_rwlock_unlock(&v3->_rwlock);
    -[PMMDataProtectionMonitor _registerForKeyBagNotifications](v3, "_registerForKeyBagNotifications");
  }
  return v3;
}

- (void)_registerForKeyBagNotifications
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_2188D0000, a2, OS_LOG_TYPE_ERROR, "Failed to determine lock state, %ld", (uint8_t *)&v2, 0xCu);
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;
  objc_super v5;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *MEMORY[0x24BE67240]), 0);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, self, CFSTR("com.apple.mobile.keybagd.first_unlock"), 0);
  pthread_rwlock_destroy(&self->_rwlock);
  v5.receiver = self;
  v5.super_class = (Class)PMMDataProtectionMonitor;
  -[PMMDataProtectionMonitor dealloc](&v5, sel_dealloc);
}

- (void)handkeKeybagLockStatusChange:(int64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = 2;
  if (a3 == 2)
    v5 = 3;
  if (a3 == 1)
    v6 = 1;
  else
    v6 = v5;
  -[PMMDataProtectionMonitor setEncryptedDataAvailability:](self, "setEncryptedDataAvailability:", v6);
  -[PMMDataProtectionMonitor setDataProtectionStatus:](self, "setDataProtectionStatus:", MKBGetDeviceLockState() != 3);
  __atxlog_handle_default();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    +[PMMDataProtectionMonitor PMMDataProtectionMonitorLockStateToString:](PMMDataProtectionMonitor, "PMMDataProtectionMonitorLockStateToString:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PMMDataProtectionMonitor PMMDataProtectionMonitorEncryptedDataAvailabilityToString:](PMMDataProtectionMonitor, "PMMDataProtectionMonitorEncryptedDataAvailabilityToString:", -[PMMDataProtectionMonitor encryptedDataAvailability](self, "encryptedDataAvailability"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_2188D0000, v7, OS_LOG_TYPE_INFO, "received lock state change, %@, encrypted data availability, %@", (uint8_t *)&v10, 0x16u);

  }
}

- (void)handleUnlockedSinceBoot
{
  NSObject *v3;
  uint8_t v4[16];

  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2188D0000, v3, OS_LOG_TYPE_INFO, "received unlock since boot notification", v4, 2u);
  }

  -[PMMDataProtectionMonitor setUnlockedSinceBoot:](self, "setUnlockedSinceBoot:", 1);
}

- (PMMDataProtectionMonitorDelegate)delegate
{
  _opaque_pthread_rwlock_t *p_rwlock;
  id WeakRetained;

  p_rwlock = &self->_rwlock;
  pthread_rwlock_rdlock(&self->_rwlock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  pthread_rwlock_unlock(p_rwlock);
  return (PMMDataProtectionMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  _opaque_pthread_rwlock_t *p_rwlock;
  PMMDataProtectionMonitorDelegate **p_delegate;
  id WeakRetained;
  id obj;

  obj = a3;
  p_rwlock = &self->_rwlock;
  pthread_rwlock_wrlock(&self->_rwlock);
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained != obj)
    objc_storeWeak((id *)p_delegate, obj);
  pthread_rwlock_unlock(p_rwlock);

}

- (int64_t)encryptedDataAvailability
{
  _opaque_pthread_rwlock_t *p_rwlock;
  int64_t encryptedDataAvailability;

  p_rwlock = &self->_rwlock;
  pthread_rwlock_rdlock(&self->_rwlock);
  encryptedDataAvailability = self->_encryptedDataAvailability;
  pthread_rwlock_unlock(p_rwlock);
  return encryptedDataAvailability;
}

- (void)setEncryptedDataAvailability:(int64_t)a3
{
  _opaque_pthread_rwlock_t *p_rwlock;
  NSObject *v6;
  void *v7;
  id WeakRetained;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  p_rwlock = &self->_rwlock;
  pthread_rwlock_wrlock(&self->_rwlock);
  if (self->_encryptedDataAvailability != a3)
  {
    self->_encryptedDataAvailability = a3;
    __atxlog_handle_default();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      +[PMMDataProtectionMonitor PMMDataProtectionMonitorEncryptedDataAvailabilityToString:](PMMDataProtectionMonitor, "PMMDataProtectionMonitorEncryptedDataAvailabilityToString:", self->_encryptedDataAvailability);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_2188D0000, v6, OS_LOG_TYPE_INFO, "encrypted data availability changed to, %@", (uint8_t *)&v9, 0xCu);

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "dataProtectionMonitor:encryptedDataAvailbilityDidChange:", self, self->_encryptedDataAvailability);

  }
  pthread_rwlock_unlock(p_rwlock);
}

- (BOOL)unlockedSinceBoot
{
  PMMDataProtectionMonitor *v2;
  _opaque_pthread_rwlock_t *p_rwlock;

  v2 = self;
  p_rwlock = &self->_rwlock;
  pthread_rwlock_rdlock(&self->_rwlock);
  LOBYTE(v2) = v2->_unlockedSinceBoot;
  pthread_rwlock_unlock(p_rwlock);
  return (char)v2;
}

- (void)setUnlockedSinceBoot:(BOOL)a3
{
  _BOOL4 v3;
  _opaque_pthread_rwlock_t *p_rwlock;
  NSObject *v6;
  _BOOL4 unlockedSinceBoot;
  id WeakRetained;
  _DWORD v9[2];
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  p_rwlock = &self->_rwlock;
  pthread_rwlock_wrlock(&self->_rwlock);
  if (self->_unlockedSinceBoot != v3)
  {
    self->_unlockedSinceBoot = v3;
    __atxlog_handle_default();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      unlockedSinceBoot = self->_unlockedSinceBoot;
      v9[0] = 67109120;
      v9[1] = unlockedSinceBoot;
      _os_log_impl(&dword_2188D0000, v6, OS_LOG_TYPE_INFO, "unlocked since boot changed to, %{BOOL}d", (uint8_t *)v9, 8u);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "dataProtectionMonitor:unlockedSinceBoot:", self, self->_unlockedSinceBoot);

  }
  pthread_rwlock_unlock(p_rwlock);
}

- (BOOL)dataProtectionEnabled
{
  PMMDataProtectionMonitor *v2;
  _opaque_pthread_rwlock_t *p_rwlock;

  v2 = self;
  p_rwlock = &self->_rwlock;
  pthread_rwlock_rdlock(&self->_rwlock);
  LOBYTE(v2) = v2->_dataProtectionStatus != 0;
  pthread_rwlock_unlock(p_rwlock);
  return (char)v2;
}

- (void)setDataProtectionStatus:(BOOL)a3
{
  unsigned int v3;
  _opaque_pthread_rwlock_t *p_rwlock;
  NSObject *v6;
  void *v7;
  id WeakRetained;
  int v9;
  void *v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  p_rwlock = &self->_rwlock;
  pthread_rwlock_wrlock(&self->_rwlock);
  if (self->_dataProtectionStatus != v3)
  {
    self->_dataProtectionStatus = v3;
    __atxlog_handle_default();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      +[PMMDataProtectionMonitor PMMDataProtectionMonitorDataProtectionStatus:](PMMDataProtectionMonitor, "PMMDataProtectionMonitorDataProtectionStatus:", self->_dataProtectionStatus);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_2188D0000, v6, OS_LOG_TYPE_INFO, "data protection enabled, %@", (uint8_t *)&v9, 0xCu);

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "dataProtectionMonitor:dataProtectionStatusDidChange:", self, self->_dataProtectionStatus);

  }
  pthread_rwlock_unlock(p_rwlock);
}

- (int64_t)dataProtectionStatus
{
  return self->_dataProtectionStatus;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
