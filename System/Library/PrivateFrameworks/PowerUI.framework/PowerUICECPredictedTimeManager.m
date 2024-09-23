@implementation PowerUICECPredictedTimeManager

- (PowerUICECPredictedTimeManager)initWithContextStore:(id)a3 withHandler:(id)a4
{
  id v7;
  id v8;
  PowerUICECPredictedTimeManager *v9;
  os_log_t v10;
  OS_os_log *log;
  NSString *debugStatus;
  uint64_t v13;
  NSUserDefaults *defaults;
  PowerUITrialManager *v15;
  PowerUITrialManager *trialManager;
  uint64_t v17;
  PowerUIBatteryMitigationManager *batteryMitigationManager;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSDate *tModelPredition;
  uint64_t v24;
  _OSChargingPredictor *pluggedInPredictor;
  void *v26;
  void *v27;
  uint64_t v28;
  NSDate *deadline;
  void *v30;
  void *v31;
  uint64_t v32;
  NSDate *modelDeadline;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSArray *monitors;
  uint64_t v40;
  id handler;
  objc_super v43;
  _QWORD v44[5];

  v44[4] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v43.receiver = self;
  v43.super_class = (Class)PowerUICECPredictedTimeManager;
  v9 = -[PowerUICECPredictedTimeManager init](&v43, sel_init);
  if (v9)
  {
    v10 = os_log_create("com.apple.powerui.cec", "predictedTimeManager");
    log = v9->_log;
    v9->_log = (OS_os_log *)v10;

    objc_storeStrong((id *)&v9->_context, a3);
    debugStatus = v9->_debugStatus;
    v9->_debugStatus = (NSString *)&stru_24D3FD658;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.powerui.cec"));
    defaults = v9->_defaults;
    v9->_defaults = (NSUserDefaults *)v13;

    v9->_predictionLeeway = 18000.0;
    v15 = -[PowerUITrialManager initWithDefaultsDomain:]([PowerUITrialManager alloc], "initWithDefaultsDomain:", CFSTR("com.apple.powerui.cec"));
    trialManager = v9->_trialManager;
    v9->_trialManager = v15;

    v9->_tBypassSignals = -[NSUserDefaults BOOLForKey:](v9->_defaults, "BOOLForKey:", CFSTR("testBypassSignals"));
    +[PowerUIBatteryMitigationManager sharedManager](PowerUIBatteryMitigationManager, "sharedManager");
    v17 = objc_claimAutoreleasedReturnValue();
    batteryMitigationManager = v9->_batteryMitigationManager;
    v9->_batteryMitigationManager = (PowerUIBatteryMitigationManager *)v17;

    -[NSUserDefaults objectForKey:](v9->_defaults, "objectForKey:", CFSTR("testModelDuration"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      v21 = (void *)MEMORY[0x24BDBCE60];
      objc_msgSend(v19, "doubleValue");
      objc_msgSend(v21, "dateWithTimeIntervalSinceNow:");
      v22 = objc_claimAutoreleasedReturnValue();
      tModelPredition = v9->_tModelPredition;
      v9->_tModelPredition = (NSDate *)v22;

    }
    objc_msgSend(MEMORY[0x24BE6E030], "predictor");
    v24 = objc_claimAutoreleasedReturnValue();
    pluggedInPredictor = v9->_pluggedInPredictor;
    v9->_pluggedInPredictor = (_OSChargingPredictor *)v24;

    -[NSUserDefaults objectForKey:](v9->_defaults, "objectForKey:", CFSTR("predictedDeadline"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = (void *)MEMORY[0x24BDBCE60];
    if (v26)
    {
      objc_msgSend(v26, "doubleValue");
      objc_msgSend(v27, "dateWithTimeIntervalSinceReferenceDate:");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    }
    v28 = objc_claimAutoreleasedReturnValue();
    deadline = v9->_deadline;
    v9->_deadline = (NSDate *)v28;

    -[NSUserDefaults objectForKey:](v9->_defaults, "objectForKey:", CFSTR("predictedModelDeadline"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      v31 = (void *)MEMORY[0x24BDBCE60];
      objc_msgSend(v30, "doubleValue");
      objc_msgSend(v31, "dateWithTimeIntervalSinceReferenceDate:");
      v32 = objc_claimAutoreleasedReturnValue();
      modelDeadline = v9->_modelDeadline;
      v9->_modelDeadline = (NSDate *)v32;

    }
    +[PowerUIAlarmSignalMonitor monitorWithDelegate:trialManager:withContext:](PowerUIAlarmSignalMonitor, "monitorWithDelegate:trialManager:withContext:", v9, v9->_trialManager, v9->_context);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v34;
    +[PowerUIWalletSignalMonitor monitorWithDelegate:](PowerUIWalletSignalMonitor, "monitorWithDelegate:", v9);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v44[1] = v35;
    +[PowerUICalendarSignalMonitor monitorWithDelegate:trialManager:withContext:](PowerUICalendarSignalMonitor, "monitorWithDelegate:trialManager:withContext:", v9, v9->_trialManager, v9->_context);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v44[2] = v36;
    +[PowerUILocationSignalMonitor monitorWithDelegate:trialManager:withContext:](PowerUILocationSignalMonitor, "monitorWithDelegate:trialManager:withContext:", v9, v9->_trialManager, v9->_context);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v44[3] = v37;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 4);
    v38 = objc_claimAutoreleasedReturnValue();
    monitors = v9->_monitors;
    v9->_monitors = (NSArray *)v38;

    v40 = MEMORY[0x2199EC2D0](v8);
    handler = v9->_handler;
    v9->_handler = (id)v40;

  }
  return v9;
}

+ (PowerUICECPredictedTimeManager)managerWithContextStore:(id)a3 withHandler:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  PowerUICECPredictedTimeManager *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  v6 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __70__PowerUICECPredictedTimeManager_managerWithContextStore_withHandler___block_invoke;
  v12[3] = &unk_24D3FCE20;
  v13 = v5;
  v14 = v6;
  v7 = managerWithContextStore_withHandler__onceToken;
  v8 = v6;
  v9 = v5;
  if (v7 != -1)
    dispatch_once(&managerWithContextStore_withHandler__onceToken, v12);
  v10 = (PowerUICECPredictedTimeManager *)(id)managerWithContextStore_withHandler__manager;

  return v10;
}

void __70__PowerUICECPredictedTimeManager_managerWithContextStore_withHandler___block_invoke(uint64_t a1)
{
  PowerUICECPredictedTimeManager *v1;
  void *v2;

  v1 = -[PowerUICECPredictedTimeManager initWithContextStore:withHandler:]([PowerUICECPredictedTimeManager alloc], "initWithContextStore:withHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)managerWithContextStore_withHandler__manager;
  managerWithContextStore_withHandler__manager = (uint64_t)v1;

}

- (void)startAllMonitoring
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_monitors;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "startMonitoring", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)stopAllMonitoring
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_monitors;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "stopMonitoring", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (BOOL)testOverrideForSignalMonitors
{
  _BOOL4 v3;
  NSObject *log;
  uint8_t v6[16];

  v3 = -[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", CFSTR("testBypassSignals"));
  if (v3)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "TestMode: Bypass Signals set", v6, 2u);
    }
  }
  return v3;
}

- (id)deadlineFromMonitors
{
  _BOOL4 v3;
  NSString *debugStatus;
  __CFString *v5;
  void *v6;
  __CFString *v7;
  NSString *v8;
  NSString *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  NSObject *log;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSString *v22;
  NSString *v23;
  NSObject *v24;
  NSArray *obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v3 = -[PowerUICECPredictedTimeManager testOverrideForSignalMonitors](self, "testOverrideForSignalMonitors");
  self->_tBypassSignals = v3;
  if (v3)
  {
    debugStatus = self->_debugStatus;
    v5 = CFSTR("\n");
    if (!debugStatus)
      v5 = &stru_24D3FD658;
    v6 = (void *)MEMORY[0x24BDD17C8];
    v7 = v5;
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@%@%@"), debugStatus, v7, CFSTR("Signal monitors overriden"));
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v9 = self->_debugStatus;
    self->_debugStatus = v8;

    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = self->_monitors;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v11)
    {
      v12 = v11;
      v7 = 0;
      v13 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v28 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v15, "requiredFullChargeDate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            log = self->_log;
            if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v32 = v15;
              v33 = 2112;
              v34 = v16;
              _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Monitor %@ suggested %@", buf, 0x16u);
            }
            objc_msgSend(v10, "earlierDate:", v16);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v18, "isEqualToDate:", v16))
            {
              v19 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", v16, 1, 1);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "stringWithFormat:", CFSTR("Monitor %@ suggested %@"), v15, v20);
              v21 = objc_claimAutoreleasedReturnValue();

              v7 = (__CFString *)v21;
            }
            v10 = v18;
          }

        }
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v12);
    }
    else
    {
      v7 = 0;
    }

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n%@"), self->_debugStatus, 0);
    v22 = (NSString *)objc_claimAutoreleasedReturnValue();
    v23 = self->_debugStatus;
    self->_debugStatus = v22;

    v24 = self->_log;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v10;
      _os_log_impl(&dword_215A71000, v24, OS_LOG_TYPE_DEFAULT, "Monitors suggested: %@", buf, 0xCu);
    }
  }

  return v10;
}

- (BOOL)hasSufficientTimeForFullCharge
{
  NSString *debugStatus;
  NSDate *v4;
  NSDate *v5;
  NSDate *v6;
  NSObject *log;
  NSObject *v8;
  NSObject *v9;
  NSDate *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  double v14;
  double v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  NSDate *v19;
  double v20;
  double v21;
  double v22;
  NSObject *v23;
  NSUserDefaults *defaults;
  NSObject *v25;
  NSDate *deadline;
  void *v27;
  void *v28;
  void *v29;
  NSString *v30;
  NSString *v31;
  void *v32;
  double v33;
  void *v34;
  NSString *v35;
  NSString *v36;
  double v37;
  BOOL v38;
  uint8_t buf[4];
  NSDate *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  debugStatus = self->_debugStatus;
  self->_debugStatus = (NSString *)&stru_24D3FD658;

  -[PowerUICECPredictedTimeManager predictedUnplugTime](self, "predictedUnplugTime");
  v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
  -[PowerUICECPredictedTimeManager deadlineFromMonitors](self, "deadlineFromMonitors");
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  -[NSDate earlierDate:](v4, "earlierDate:", v5);
  v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v41 = v4;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Model Deadline is %@", buf, 0xCu);
  }
  v8 = self->_log;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v41 = v5;
    _os_log_impl(&dword_215A71000, v8, OS_LOG_TYPE_DEFAULT, "Signal Deadline is %@", buf, 0xCu);
  }
  v9 = self->_log;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v41 = v6;
    _os_log_impl(&dword_215A71000, v9, OS_LOG_TYPE_DEFAULT, "Deadline is %@", buf, 0xCu);
  }
  -[NSDate dateByAddingTimeInterval:](v6, "dateByAddingTimeInterval:", -1800.0);
  v10 = (NSDate *)objc_claimAutoreleasedReturnValue();

  v11 = self->_log;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v41 = v10;
    _os_log_impl(&dword_215A71000, v11, OS_LOG_TYPE_DEFAULT, "Deadline post buffer is %@", buf, 0xCu);
  }
  if (-[PowerUIBatteryMitigationManager mitigationsCurrentlyEnabled](self->_batteryMitigationManager, "mitigationsCurrentlyEnabled"))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v12 = objc_claimAutoreleasedReturnValue();

    v10 = (NSDate *)v12;
  }
  v13 = self->_log;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v41 = v10;
    _os_log_impl(&dword_215A71000, v13, OS_LOG_TYPE_DEFAULT, "Deadline post battery mitigations is %@", buf, 0xCu);
  }
  -[PowerUICECPredictedTimeManager timeToFullChargeFromBatteryLevel:](self, "timeToFullChargeFromBatteryLevel:", +[PowerUISmartChargeUtilities currentBatteryLevelWithContext:](PowerUISmartChargeUtilities, "currentBatteryLevelWithContext:", self->_context));
  v15 = v14;
  v16 = self->_log;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)MEMORY[0x24BDD16E0];
    v18 = v16;
    objc_msgSend(v17, "numberWithDouble:", v15);
    v19 = (NSDate *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v41 = v19;
    _os_log_impl(&dword_215A71000, v18, OS_LOG_TYPE_DEFAULT, "Time to full charge is %@", buf, 0xCu);

  }
  -[NSDate timeIntervalSinceReferenceDate](self->_deadline, "timeIntervalSinceReferenceDate");
  v21 = v20;
  -[NSDate timeIntervalSinceReferenceDate](v10, "timeIntervalSinceReferenceDate");
  if (!self->_deadline || v22 < v21)
  {
    v23 = self->_log;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v41 = v10;
      _os_log_impl(&dword_215A71000, v23, OS_LOG_TYPE_DEFAULT, "Setting new deadline %@", buf, 0xCu);
    }
    objc_storeStrong((id *)&self->_deadline, v10);
    defaults = self->_defaults;
    -[NSDate timeIntervalSinceReferenceDate](self->_deadline, "timeIntervalSinceReferenceDate");
    -[NSUserDefaults setDouble:forKey:](defaults, "setDouble:forKey:", CFSTR("predictedDeadline"));
  }
  v25 = self->_log;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    deadline = self->_deadline;
    *(_DWORD *)buf = 138412290;
    v41 = deadline;
    _os_log_impl(&dword_215A71000, v25, OS_LOG_TYPE_DEFAULT, "Final deadline is %@", buf, 0xCu);
  }
  v27 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", self->_deadline, 1, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "stringWithFormat:", CFSTR("Final deadline is %@"), v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n%@"), self->_debugStatus, v29);
  v30 = (NSString *)objc_claimAutoreleasedReturnValue();
  v31 = self->_debugStatus;
  self->_debugStatus = v30;

  v32 = (void *)MEMORY[0x24BDD17C8];
  -[NSDate timeIntervalSinceNow](self->_deadline, "timeIntervalSinceNow");
  objc_msgSend(v32, "stringWithFormat:", CFSTR("Time to full charge %d mins, Time from deadline %d mins"), ((int)v15 / 60), ((int)v33 / 60));
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n%@"), self->_debugStatus, v34);
  v35 = (NSString *)objc_claimAutoreleasedReturnValue();
  v36 = self->_debugStatus;
  self->_debugStatus = v35;

  -[NSDate timeIntervalSinceNow](self->_deadline, "timeIntervalSinceNow");
  v38 = v37 > v15;

  return v38;
}

- (id)testingOverrideForPredictedUnplugTime
{
  void *v3;
  void *v4;
  void *v5;
  NSDate *v6;
  NSDate *tModelPredition;
  NSObject *log;
  NSDate *v9;
  NSDate *v10;
  int v12;
  NSDate *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("testModelDuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v3, "doubleValue");
    objc_msgSend(v5, "dateWithTimeIntervalSinceNow:");
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    tModelPredition = self->_tModelPredition;
    self->_tModelPredition = v6;

    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v9 = self->_tModelPredition;
      v12 = 138412290;
      v13 = v9;
      _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "TestMode: ModelPrediction set to %@", (uint8_t *)&v12, 0xCu);
    }
  }
  v10 = self->_tModelPredition;

  return v10;
}

- (double)leewayForConfidence:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  NSObject *log;
  _BOOL4 v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  NSObject *v14;
  double result;
  int v16;
  double v17;
  __int16 v18;
  double v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[PowerUITrialManager doubleFactorForName:](self->_trialManager, "doubleFactorForName:", CFSTR("thresholdForCECWithPluginModel"));
  v6 = v5;
  -[PowerUITrialManager doubleFactorForName:](self->_trialManager, "doubleFactorForName:", CFSTR("leewayForCECWithPluginModel"));
  v8 = v7;
  log = self->_log;
  v10 = os_log_type_enabled(log, OS_LOG_TYPE_INFO);
  if (v6 == 0.0 || v8 == 0.0)
  {
    v8 = 18900.0;
    v6 = 0.575;
    if (!v10)
      goto LABEL_8;
    LOWORD(v16) = 0;
    v11 = "Trial parameter loading failed resorting to defaults";
    v12 = log;
    v13 = 2;
  }
  else
  {
    if (!v10)
      goto LABEL_8;
    v16 = 134218240;
    v17 = v6;
    v18 = 2048;
    v19 = v8;
    v11 = "Loaded threshold %f and leeway %f from trial ";
    v12 = log;
    v13 = 22;
  }
  _os_log_impl(&dword_215A71000, v12, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v16, v13);
LABEL_8:
  v14 = self->_log;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v16 = 134218496;
    v17 = a3;
    v18 = 2048;
    v19 = v6;
    v20 = 2048;
    v21 = v8;
    _os_log_impl(&dword_215A71000, v14, OS_LOG_TYPE_INFO, "Evaluating confidence %f with threshold of %f and leeway of %f", (uint8_t *)&v16, 0x20u);
  }
  result = INFINITY;
  if (v6 < a3)
    return v8;
  return result;
}

- (id)predictedUnplugTime
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSDate *v7;
  NSDate *modelDeadline;
  void *v9;
  void *v10;
  NSDate *v11;
  _OSChargingPredictor *pluggedInPredictor;
  void *v14;
  id v15;
  NSObject *log;
  NSObject *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  NSObject *v26;
  double predictionLeeway;
  NSDate *v28;
  NSObject *v29;
  NSDate *v30;
  NSUserDefaults *defaults;
  void *v32;
  void *v33;
  id v34;
  uint8_t buf[4];
  double v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  double v40;
  __int16 v41;
  double v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  -[PowerUICECPredictedTimeManager testingOverrideForPredictedUnplugTime](self, "testingOverrideForPredictedUnplugTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", v3, 1, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("ML model deadline is overriden to %@"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)&self->_debugStatus, v6);
    v7 = v3;
LABEL_5:
    v11 = v7;
    goto LABEL_6;
  }
  modelDeadline = self->_modelDeadline;
  if (modelDeadline)
  {
    v9 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", modelDeadline, 1, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("Cached ML model predicted deadline %@"), v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)&self->_debugStatus, v6);
    v7 = self->_modelDeadline;
    goto LABEL_5;
  }
  pluggedInPredictor = self->_pluggedInPredictor;
  v34 = 0;
  -[_OSChargingPredictor chargePredictionOutputOfScheme:withError:](pluggedInPredictor, "chargePredictionOutputOfScheme:withError:", 1, &v34);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v34;
  if (v15)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v17 = log;
      objc_msgSend(v15, "localizedDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v36 = *(double *)&v18;
      _os_log_impl(&dword_215A71000, v17, OS_LOG_TYPE_DEFAULT, "Error querying the predictor through the client %@", buf, 0xCu);

    }
  }
  objc_msgSend(v14, "confidence");
  v20 = v19;
  objc_msgSend(v14, "chargingDuration");
  v22 = v21;
  -[PowerUICECPredictedTimeManager leewayForConfidence:](self, "leewayForConfidence:", v20);
  self->_predictionLeeway = v23;
  v24 = fmin(fmax(v22 - v23, 0.0), 36000.0);
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = self->_log;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    predictionLeeway = self->_predictionLeeway;
    *(_DWORD *)buf = 134218754;
    v36 = v24;
    v37 = 2112;
    v38 = v25;
    v39 = 2048;
    v40 = predictionLeeway;
    v41 = 2048;
    v42 = v20;
    _os_log_impl(&dword_215A71000, v26, OS_LOG_TYPE_DEFAULT, "OSIntelligence predicts device to be plugged in for %lf until %@ after leeway of %lf with confidence %lf", buf, 0x2Au);
  }
  if (v20 <= 0.575)
  {
    v29 = self->_log;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215A71000, v29, OS_LOG_TYPE_DEFAULT, "Prediction model not confident. Setting an earlier date", buf, 2u);
    }
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v28 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = v25;
  }
  v30 = self->_modelDeadline;
  self->_modelDeadline = v28;

  defaults = self->_defaults;
  -[NSDate timeIntervalSinceReferenceDate](self->_modelDeadline, "timeIntervalSinceReferenceDate");
  -[NSUserDefaults setDouble:forKey:](defaults, "setDouble:forKey:", CFSTR("predictedModelDeadline"));
  v32 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", self->_modelDeadline, 1, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "stringWithFormat:", CFSTR("ML model predicted deadline %@ (confidence %lf)"), v33, *(_QWORD *)&v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)&self->_debugStatus, v6);
  v11 = self->_modelDeadline;

LABEL_6:
  return v11;
}

- (double)timeToFullChargeFromBatteryLevel:(unint64_t)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;

  if (a3 == 80)
  {
    +[PowerUISmartChargeUtilities historicalFullChargeDurationStartingAt:withMinimumPluginDuration:](PowerUISmartChargeUtilities, "historicalFullChargeDurationStartingAt:withMinimumPluginDuration:", 80, 1200);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v3, "count") >= 3)
    {
      objc_msgSend(v3, "sortedArrayUsingSelector:", sel_compare_);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "subarrayWithRange:", 1, objc_msgSend(v4, "count") - 2);
      v5 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v5;
    }
    objc_msgSend(v3, "percentile:", 0.95);
    v7 = v6;
    if ((unint64_t)objc_msgSend(v3, "count") < 4)
    {
      v9 = 5400.0;
    }
    else
    {
      v8 = fmin(v7 / 60.0, 180.0);
      if (v8 <= 40.0)
        v9 = 2400.0;
      else
        v9 = v8 * 60.0;
    }

  }
  else if (a3 - 31 > 0x2B)
  {
    return 14400.0;
  }
  else
  {
    return (double)(60 * (170 - a3) + 15);
  }
  return v9;
}

- (void)debug
{
  id v2;

  v2 = -[PowerUICECPredictedTimeManager predictedUnplugTime](self, "predictedUnplugTime");
}

- (void)monitor:(id)a3 maySuggestNewFullChargeDeadline:(id)a4
{
  double v5;

  objc_msgSend(a4, "timeIntervalSinceDate:", self->_deadline);
  if (v5 < 0.0)
    (*((void (**)(void))self->_handler + 2))();
}

- (void)resetState
{
  NSDate *deadline;
  NSDate *modelDeadline;

  -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", CFSTR("predictedDeadline"));
  -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", CFSTR("predictedModelDeadline"));
  deadline = self->_deadline;
  self->_deadline = 0;

  modelDeadline = self->_modelDeadline;
  self->_modelDeadline = 0;

  -[PowerUICECPredictedTimeManager stopAllMonitoring](self, "stopAllMonitoring");
}

- (NSDate)deadline
{
  return self->_deadline;
}

- (void)setDeadline:(id)a3
{
  objc_storeStrong((id *)&self->_deadline, a3);
}

- (NSString)debugStatus
{
  return self->_debugStatus;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (_CDLocalContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSArray)monitors
{
  return self->_monitors;
}

- (void)setMonitors:(id)a3
{
  objc_storeStrong((id *)&self->_monitors, a3);
}

- (PowerUITrialManager)trialManager
{
  return self->_trialManager;
}

- (void)setTrialManager:(id)a3
{
  objc_storeStrong((id *)&self->_trialManager, a3);
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (_OSChargingPredictor)pluggedInPredictor
{
  return self->_pluggedInPredictor;
}

- (void)setPluggedInPredictor:(id)a3
{
  objc_storeStrong((id *)&self->_pluggedInPredictor, a3);
}

- (NSDate)modelDeadline
{
  return self->_modelDeadline;
}

- (void)setModelDeadline:(id)a3
{
  objc_storeStrong((id *)&self->_modelDeadline, a3);
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSDate)tModelPredition
{
  return self->_tModelPredition;
}

- (void)setTModelPredition:(id)a3
{
  objc_storeStrong((id *)&self->_tModelPredition, a3);
}

- (BOOL)tBypassSignals
{
  return self->_tBypassSignals;
}

- (void)setTBypassSignals:(BOOL)a3
{
  self->_tBypassSignals = a3;
}

- (double)predictionLeeway
{
  return self->_predictionLeeway;
}

- (void)setPredictionLeeway:(double)a3
{
  self->_predictionLeeway = a3;
}

- (PowerUIBatteryMitigationManager)batteryMitigationManager
{
  return self->_batteryMitigationManager;
}

- (void)setBatteryMitigationManager:(id)a3
{
  objc_storeStrong((id *)&self->_batteryMitigationManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryMitigationManager, 0);
  objc_storeStrong((id *)&self->_tModelPredition, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_modelDeadline, 0);
  objc_storeStrong((id *)&self->_pluggedInPredictor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_trialManager, 0);
  objc_storeStrong((id *)&self->_monitors, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_debugStatus, 0);
  objc_storeStrong((id *)&self->_deadline, 0);
}

@end
