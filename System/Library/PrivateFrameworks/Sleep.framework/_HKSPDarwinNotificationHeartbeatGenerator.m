@implementation _HKSPDarwinNotificationHeartbeatGenerator

- (_HKSPDarwinNotificationHeartbeatGenerator)initWithLifecycleNotification:(id)a3
{
  id v5;
  _HKSPDarwinNotificationHeartbeatGenerator *v6;
  _HKSPDarwinNotificationHeartbeatGenerator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HKSPDarwinNotificationHeartbeatGenerator;
  v6 = -[_HKSPDarwinNotificationHeartbeatGenerator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_lifecycleNotification, a3);

  return v7;
}

- (void)sendHeartbeat
{
  NSObject *v3;
  void *v4;
  NSString *lifecycleNotification;
  id v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v8;
  void *v9;
  __int16 v10;
  NSString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_lifecycleNotification)
  {
    HKSPLogForCategory(4uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = (void *)objc_opt_class();
      lifecycleNotification = self->_lifecycleNotification;
      v8 = 138543618;
      v9 = v4;
      v10 = 2114;
      v11 = lifecycleNotification;
      v6 = v4;
      _os_log_impl(&dword_1A4F0E000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] posting lifecycle notification %{public}@", (uint8_t *)&v8, 0x16u);

    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)self->_lifecycleNotification, 0, 0, 1u);
  }
}

- (NSString)lifecycleNotification
{
  return self->_lifecycleNotification;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lifecycleNotification, 0);
}

@end
