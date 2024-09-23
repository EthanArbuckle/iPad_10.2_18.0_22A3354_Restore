@implementation PowerUIBatteryMitigationManager

- (PowerUIBatteryMitigationManager)initWithDefaultsDomain:(id)a3
{
  id v5;
  PowerUIBatteryMitigationManager *v6;
  PowerUIBatteryMitigationManager *v7;
  uint64_t v8;
  PowerUIAnalyticsManager *analyticsManager;
  os_log_t v10;
  OS_os_log *log;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PowerUIBatteryMitigationManager;
  v6 = -[PowerUIBatteryMitigationManager init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_defaultsDomain, a3);
    +[PowerUIAnalyticsManager sharedInstance](PowerUIAnalyticsManager, "sharedInstance");
    v8 = objc_claimAutoreleasedReturnValue();
    analyticsManager = v7->_analyticsManager;
    v7->_analyticsManager = (PowerUIAnalyticsManager *)v8;

    v10 = os_log_create("com.apple.powerui.smartcharging", "ocvmitigation");
    log = v7->_log;
    v7->_log = (OS_os_log *)v10;

    -[PowerUIBatteryMitigationManager fetchCurrentMitigationState](v7, "fetchCurrentMitigationState");
  }

  return v7;
}

+ (id)managerWithDefaultsDomain:(id)a3
{
  id v3;
  PowerUIBatteryMitigationManager *v4;

  v3 = a3;
  v4 = -[PowerUIBatteryMitigationManager initWithDefaultsDomain:]([PowerUIBatteryMitigationManager alloc], "initWithDefaultsDomain:", v3);

  return v4;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_9);
  return (id)sharedManager_manager;
}

void __48__PowerUIBatteryMitigationManager_sharedManager__block_invoke()
{
  PowerUIBatteryMitigationManager *v0;
  void *v1;

  v0 = -[PowerUIBatteryMitigationManager initWithDefaultsDomain:]([PowerUIBatteryMitigationManager alloc], "initWithDefaultsDomain:", CFSTR("com.apple.smartcharging.topoffprotection"));
  v1 = (void *)sharedManager_manager;
  sharedManager_manager = (uint64_t)v0;

}

- (id)getGaugingMitigationDict
{
  void *v3;
  int State;
  NSObject *log;
  _BOOL4 v6;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  CFTypeRef cf;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  cf = 0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  State = IOPSGaugingMitigationGetState();
  log = self->_log;
  v6 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if (State)
  {
    if (v6)
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v24) = State;
      _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Gauging mitigation state error received: %d", buf, 8u);
    }
    return v3;
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Gauging dict:", buf, 2u);
    }
    v8 = (id)cf;

    CFRelease(cf);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v8, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = self->_log;
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
            v16 = v14;
            objc_msgSend(v8, "objectForKeyedSubscript:", v15);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v24 = v15;
            v25 = 2112;
            v26 = v17;
            _os_log_impl(&dword_215A71000, v16, OS_LOG_TYPE_DEFAULT, "\t%@: %@", buf, 0x16u);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
      }
      while (v11);
    }

    return v8;
  }
}

- (BOOL)fetchCurrentMitigationState
{
  int mitigationsCurrentlyEnabled;
  NSObject *log;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  NSObject *v22;
  _BOOL4 v23;
  _BOOL4 v24;
  void *v25;
  uint64_t v27;
  int out_token;
  uint8_t buf[4];
  _BOOL4 v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  mitigationsCurrentlyEnabled = self->_mitigationsCurrentlyEnabled;
  out_token = 0;
  if (notify_register_check("com.apple.system.powersources.gaugingmitigation", &out_token))
  {
    log = self->_log;
    v5 = os_log_type_enabled(log, OS_LOG_TYPE_FAULT);
    if (v5)
    {
      -[PowerUIBatteryMitigationManager fetchCurrentMitigationState].cold.2(log, v6, v7, v8, v9, v10, v11, v12);
LABEL_8:
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    v27 = 0;
    if (notify_get_state(out_token, &v27))
    {
      v13 = self->_log;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        -[PowerUIBatteryMitigationManager fetchCurrentMitigationState].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
      notify_cancel(out_token);
      goto LABEL_8;
    }
    notify_cancel(out_token);
    v21 = v27 & 1;
    self->_mitigationsCurrentlyEnabled = v21;
    v22 = self->_log;
    if (mitigationsCurrentlyEnabled == v21)
    {
      v5 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
      if (!v5)
        return v5;
      v23 = self->_mitigationsCurrentlyEnabled;
      *(_DWORD *)buf = 67109120;
      v30 = v23;
      _os_log_impl(&dword_215A71000, v22, OS_LOG_TYPE_INFO, "Current mitigation state unchanged: %d", buf, 8u);
      goto LABEL_8;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v24 = self->_mitigationsCurrentlyEnabled;
      *(_DWORD *)buf = 67109120;
      v30 = v24;
      _os_log_impl(&dword_215A71000, v22, OS_LOG_TYPE_DEFAULT, "Current mitigation state changed to: %d", buf, 8u);
    }
    -[PowerUIBatteryMitigationManager getGaugingMitigationDict](self, "getGaugingMitigationDict");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PowerUIBatteryMitigationManager submitGaugingAnalytics:](self, "submitGaugingAnalytics:", v25);

    LOBYTE(v5) = 1;
  }
  return v5;
}

- (void)submitGaugingAnalytics:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  uint64_t v7;
  void *v8;
  double v9;
  uint64_t v10;
  void *v11;
  double v12;
  uint64_t v13;
  PowerUIAnalyticsManager *analyticsManager;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("lastQMaxUpdate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "timeIntervalSinceDate:", v5);
    v7 = (int)(v6 / 86400.0);
  }
  else
  {
    v7 = 0xFFFFFFFFLL;
  }
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("lastDOD0Update"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v4, "timeIntervalSinceDate:", v8);
    v10 = (int)(v9 / 86400.0);
  }
  else
  {
    v10 = 0xFFFFFFFFLL;
  }
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("lastFullChargeDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v4, "timeIntervalSinceDate:", v11);
    v13 = (int)(v12 / 86400.0);
  }
  else
  {
    v13 = 0xFFFFFFFFLL;
  }
  analyticsManager = self->_analyticsManager;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PowerUIAnalyticsManager submitGaugingEventWithUpdateType:qmaxState:daysSinceQMax:ocvState:daysSinceOCV:fullChargeState:daysSinceFullChargeAttempt:](analyticsManager, "submitGaugingEventWithUpdateType:qmaxState:daysSinceQMax:ocvState:daysSinceOCV:fullChargeState:daysSinceFullChargeAttempt:", 1, 0, v15, 0, v16, 0, v17);

}

- (unint64_t)decisionSignalID
{
  return self->_decisionSignalID;
}

- (BOOL)mitigationsCurrentlyEnabled
{
  return self->_mitigationsCurrentlyEnabled;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (PowerUIAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsManager, a3);
}

- (NSString)defaultsDomain
{
  return self->_defaultsDomain;
}

- (void)setDefaultsDomain:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsDomain, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsDomain, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)fetchCurrentMitigationState
{
  OUTLINED_FUNCTION_0(&dword_215A71000, a1, a3, "Could not register for gauging mitigation notification", a5, a6, a7, a8, 0);
}

@end
