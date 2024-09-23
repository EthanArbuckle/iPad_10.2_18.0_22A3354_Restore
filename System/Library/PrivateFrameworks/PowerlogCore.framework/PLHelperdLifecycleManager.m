@implementation PLHelperdLifecycleManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_20);
  return (id)sharedManager_helperdLifecycleManagerInstance;
}

void __42__PLHelperdLifecycleManager_sharedManager__block_invoke()
{
  PLHelperdLifecycleManager *v0;
  void *v1;

  v0 = objc_alloc_init(PLHelperdLifecycleManager);
  v1 = (void *)sharedManager_helperdLifecycleManagerInstance;
  sharedManager_helperdLifecycleManagerInstance = (uint64_t)v0;

}

- (PLHelperdLifecycleManager)init
{
  PLHelperdLifecycleManager *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLHelperdLifecycleManager;
  v2 = -[PLHelperdLifecycleManager init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[PLHelperdLifecycleManager setActiveServices:](v2, "setActiveServices:", v3);

  }
  return v2;
}

- (void)signalServiceActive:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[PLHelperdLifecycleManager activeServices](self, "activeServices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  -[PLHelperdLifecycleManager activeServices](self, "activeServices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLHelperdLifecycleManager serviceNameFor:](self, "serviceNameFor:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  if ((v8 & 1) != 0)
  {
    objc_sync_exit(v5);
  }
  else
  {
    PLLogPowerlogHelperdLifecycleManager();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[PLHelperdLifecycleManager serviceNameFor:](self, "serviceNameFor:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v10;
      _os_log_impl(&dword_1B6AB6000, v9, OS_LOG_TYPE_DEFAULT, "%@ became active", buf, 0xCu);

    }
    -[PLHelperdLifecycleManager activeServices](self, "activeServices");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLHelperdLifecycleManager serviceNameFor:](self, "serviceNameFor:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v12);

    PLLogPowerlogHelperdLifecycleManager();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      -[PLHelperdLifecycleManager activeServices](self, "activeServices");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLHelperdLifecycleManager signalServiceActive:].cold.1(v14, (uint64_t)buf, v13);
    }

    objc_sync_exit(v5);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3, CFSTR("service"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("PLHelperdLifecycleManager.serviceIsActive"), 0, v16);

  }
}

- (void)signalServiceInactive:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  dispatch_time_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  _QWORD block[5];
  const __CFString *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[PLHelperdLifecycleManager activeServices](self, "activeServices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  -[PLHelperdLifecycleManager activeServices](self, "activeServices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLHelperdLifecycleManager serviceNameFor:](self, "serviceNameFor:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  PLLogPowerlogHelperdLifecycleManager();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((v8 & 1) != 0)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[PLHelperdLifecycleManager serviceNameFor:](self, "serviceNameFor:", a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v27 = v11;
      _os_log_impl(&dword_1B6AB6000, v10, OS_LOG_TYPE_DEFAULT, "%@ became inactive", buf, 0xCu);

    }
    -[PLHelperdLifecycleManager activeServices](self, "activeServices");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLHelperdLifecycleManager serviceNameFor:](self, "serviceNameFor:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObject:", v13);

    -[PLHelperdLifecycleManager activeServices](self, "activeServices");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = objc_msgSend(v14, "count") == 0;

    PLLogPowerlogHelperdLifecycleManager();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if ((_DWORD)v13)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v27) = 1;
        _os_log_impl(&dword_1B6AB6000, v16, OS_LOG_TYPE_DEFAULT, "Will attempt to stop powerlogHelperd after %d seconds", buf, 8u);
      }

      v19 = dispatch_time(0, 1000000000);
      dispatch_get_global_queue(0, 0);
      v20 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __51__PLHelperdLifecycleManager_signalServiceInactive___block_invoke;
      block[3] = &unk_1E6A52050;
      block[4] = self;
      dispatch_after(v19, v20, block);

    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        -[PLHelperdLifecycleManager activeServices](self, "activeServices");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLHelperdLifecycleManager signalServiceActive:].cold.1(v17, (uint64_t)buf, v16);
      }

    }
    objc_sync_exit(v5);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = CFSTR("service");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("PLHelperdLifecycleManager.serviceIsInactive"), 0, v22);

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[PLHelperdLifecycleManager serviceNameFor:](self, "serviceNameFor:", a3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLHelperdLifecycleManager signalServiceInactive:].cold.2(v18, buf, v10);
    }

    objc_sync_exit(v5);
  }

}

uint64_t __51__PLHelperdLifecycleManager_signalServiceInactive___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopPowerlogHelperd");
}

- (BOOL)isServiceActive:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[PLHelperdLifecycleManager activeServices](self, "activeServices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  -[PLHelperdLifecycleManager activeServices](self, "activeServices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLHelperdLifecycleManager serviceNameFor:](self, "serviceNameFor:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v6, "containsObject:", v7);

  objc_sync_exit(v5);
  return a3;
}

- (void)stopPowerlogHelperd
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[PLHelperdLifecycleManager activeServices](self, "activeServices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  -[PLHelperdLifecycleManager activeServices](self, "activeServices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  PLLogPowerlogHelperdLifecycleManager();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      -[PLHelperdLifecycleManager activeServices](self, "activeServices");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 134217984;
      v10 = objc_msgSend(v8, "count");
      _os_log_impl(&dword_1B6AB6000, v6, OS_LOG_TYPE_DEFAULT, "Attempted to stop powerlogHelperd when %lu services are active; keeping powerlogHelperd alive",
        (uint8_t *)&v9,
        0xCu);

    }
  }
  else
  {
    if (v7)
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1B6AB6000, v6, OS_LOG_TYPE_DEFAULT, "No active services; stopping powerlogHelperd",
        (uint8_t *)&v9,
        2u);
    }

    +[PLUtilities exitWithReason:](PLUtilities, "exitWithReason:", 6);
  }
  objc_sync_exit(v3);

}

- (id)serviceNameFor:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("PLXPCService");
  if (a3 == 1)
    v3 = CFSTR("PLBatteryGaugeService");
  if (a3 == 2)
    return CFSTR("PLPowerMetricMonitorService");
  else
    return (id)v3;
}

- (NSMutableSet)activeServices
{
  return (NSMutableSet *)objc_getProperty(self, a2, 8, 1);
}

- (void)setActiveServices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeServices, 0);
}

- (void)signalServiceActive:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_1B6AB6000, a2, a3, "Currently active services: %@", (uint8_t *)a2);

  OUTLINED_FUNCTION_1();
}

- (void)signalServiceInactive:(os_log_t)log .cold.2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1B6AB6000, log, OS_LOG_TYPE_ERROR, "Signaled service inactive for %@ which is not currently active.", buf, 0xCu);

  OUTLINED_FUNCTION_1();
}

@end
