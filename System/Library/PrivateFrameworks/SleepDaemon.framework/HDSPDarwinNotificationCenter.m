@implementation HDSPDarwinNotificationCenter

- (HDSPDarwinNotificationCenter)initWithEnvironment:(id)a3
{
  id v4;
  HDSPDarwinNotificationCenter *v5;
  HDSPDarwinNotificationCenter *v6;
  HDSPDarwinNotificationCenter *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDSPDarwinNotificationCenter;
  v5 = -[HDSPDarwinNotificationCenter init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_environment, v4);
    v7 = v6;
  }

  return v6;
}

- (void)publishNotificationForEvent:(id)a3
{
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  _BOOL4 v11;
  id v12;
  id v13;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v15;
  id v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BEA95B8];
  v6 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BEA95B8]);

  if (v6)
  {
    -[HDSPDarwinNotificationCenter environment](self, "environment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sensitiveUIMonitor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "shouldHideForSensitivity:", 1);

    HKSPLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if ((v9 & 1) != 0)
    {
      if (v11)
      {
        v15 = 138543618;
        v16 = (id)objc_opt_class();
        v17 = 2114;
        v18 = v5;
        v12 = v16;
        _os_log_impl(&dword_21610C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] not posting %{public}@ because sensitive UI is disabled", (uint8_t *)&v15, 0x16u);

      }
    }
    else
    {
      if (v11)
      {
        v15 = 138543362;
        v16 = (id)objc_opt_class();
        v13 = v16;
        _os_log_impl(&dword_21610C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Posting HKSPNotificationPresentGoodMorningAlert", (uint8_t *)&v15, 0xCu);

      }
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x24BEA9428], 0, 0, 1u);
    }
  }
}

- (void)tearDownNotifications
{
  -[HDSPDarwinNotificationCenter tearDownNotificationForEventIdentifier:](self, "tearDownNotificationForEventIdentifier:", *MEMORY[0x24BEA95B8]);
}

- (void)tearDownNotificationForEventIdentifier:(id)a3
{
  NSObject *v3;
  id v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x24BEA95B8]))
  {
    HKSPLogForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543362;
      v7 = (id)objc_opt_class();
      v4 = v7;
      _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Posting HKSPNotificationDismissGoodMorningAlert", (uint8_t *)&v6, 0xCu);

    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x24BEA9420], 0, 0, 1u);
  }
}

- (HDSPEnvironment)environment
{
  return (HDSPEnvironment *)objc_loadWeakRetained((id *)&self->_environment);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_environment);
}

@end
