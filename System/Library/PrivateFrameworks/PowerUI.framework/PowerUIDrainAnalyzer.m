@implementation PowerUIDrainAnalyzer

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_10);
  return (id)sharedInstance_drainAnalyzer;
}

void __38__PowerUIDrainAnalyzer_sharedInstance__block_invoke()
{
  PowerUIDrainAnalyzer *v0;
  void *v1;

  v0 = objc_alloc_init(PowerUIDrainAnalyzer);
  v1 = (void *)sharedInstance_drainAnalyzer;
  sharedInstance_drainAnalyzer = (uint64_t)v0;

}

- (PowerUIDrainAnalyzer)init
{
  PowerUIDrainAnalyzer *v2;
  os_log_t v3;
  OS_os_log *log;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *notificationQueue;
  uint64_t v11;
  _CDLocalContext *context;
  uint64_t v13;
  NSUserDefaults *defaults;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  PowerUIDrainAnalyzer *v19;
  NSObject *v20;
  _QWORD v22[4];
  PowerUIDrainAnalyzer *v23;
  int v24;
  _QWORD handler[4];
  PowerUIDrainAnalyzer *v26;
  int out_token;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)PowerUIDrainAnalyzer;
  v2 = -[PowerUIDrainAnalyzer init](&v28, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.powerui.drainAnalyzer", ");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.powerui.drainAnalyzer.queue", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.powerui.drainAnalyzer.notify.queue", v8);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v9;

    objc_msgSend(MEMORY[0x24BE1B170], "userContext");
    v11 = objc_claimAutoreleasedReturnValue();
    context = v2->_context;
    v2->_context = (_CDLocalContext *)v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.powerui.lowSOCAnalyzer"));
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v13;

    -[NSUserDefaults objectForKey:](v2->_defaults, "objectForKey:", CFSTR("minSOC"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      -[NSUserDefaults objectForKey:](v2->_defaults, "objectForKey:", CFSTR("minSOC"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v2->_minBatteryLevel = objc_msgSend(v16, "integerValue");

    }
    else
    {
      v2->_minBatteryLevel = 100;
    }

    -[PowerUIDrainAnalyzer monitorPluggedInStatus](v2, "monitorPluggedInStatus");
    out_token = 0;
    v17 = v2->_notificationQueue;
    v18 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __28__PowerUIDrainAnalyzer_init__block_invoke;
    handler[3] = &unk_24D3FB748;
    v19 = v2;
    v26 = v19;
    notify_register_dispatch("com.apple.powerui.drainAnalyzer.predictLowSOC", &out_token, v17, handler);
    v24 = 0;
    v20 = v2->_notificationQueue;
    v22[0] = v18;
    v22[1] = 3221225472;
    v22[2] = __28__PowerUIDrainAnalyzer_init__block_invoke_2;
    v22[3] = &unk_24D3FB748;
    v23 = v19;
    notify_register_dispatch("com.apple.powerui.drainAnalyzer.lowSOCAnalytics", &v24, v20, v22);

  }
  return v2;
}

uint64_t __28__PowerUIDrainAnalyzer_init__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "recordPredictionResultAndTime");
  return objc_msgSend(*(id *)(a1 + 32), "resetState");
}

uint64_t __28__PowerUIDrainAnalyzer_init__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "recordPredictionResultAndTime");
  objc_msgSend(*(id *)(a1 + 32), "recordAnalytics");
  return objc_msgSend(*(id *)(a1 + 32), "resetState");
}

- (void)monitorPluggedInStatus
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__PowerUIDrainAnalyzer_monitorPluggedInStatus__block_invoke;
  block[3] = &unk_24D3FB7B0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __46__PowerUIDrainAnalyzer_monitorPluggedInStatus__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v2 = (void *)MEMORY[0x24BE1B1A0];
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForPluginStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateForChangeAtKeyPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __46__PowerUIDrainAnalyzer_monitorPluggedInStatus__block_invoke_2;
  v6[3] = &unk_24D3FC468;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BE1B190], "localWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:", CFSTR("com.apple.powerui.lowSOCAnalyzer.pluggedIn"), v4, CFSTR("com.apple.powerui.lowSOCAnalyzer.pluggedIn"), v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "registerCallback:", v5);

}

void __46__PowerUIDrainAnalyzer_monitorPluggedInStatus__block_invoke_2(uint64_t a1)
{
  BOOL v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = +[PowerUISmartChargeUtilities isPluggedInWithContext:](PowerUISmartChargeUtilities, "isPluggedInWithContext:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v3 = *(_QWORD **)(a1 + 32);
  if (v2)
  {
    v4 = (void *)v3[5];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("pluggedinTime"));

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKey:", CFSTR("predictionTime"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = v6;
      objc_msgSend(*(id *)(a1 + 32), "updateLPMAndMinSOC");
      v6 = v7;
    }

  }
  else
  {
    objc_msgSend(v3, "scheduleLowSOCPrediction");
  }
}

- (void)scheduleLowSOCPrediction
{
  void *v3;
  NSObject *log;
  double v5;
  double v6;
  NSObject *v7;
  void *v8;
  void *v9;
  double v10;
  NSObject *v11;
  xpc_object_t v12;
  _QWORD handler[5];
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("pluggedinTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v3;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Device pluggedin at %@", buf, 0xCu);
  }
  objc_msgSend(v3, "timeIntervalSinceNow");
  v6 = v5;
  -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", CFSTR("pluggedinTime"));
  if (v6 <= -10800.0)
  {
    -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("predictionTime"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 && (objc_msgSend(v8, "timeIntervalSinceNow"), v10 > -86400.0))
    {
      v11 = self->_log;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_215A71000, v11, OS_LOG_TYPE_DEFAULT, "Analytics from prediction in last 24 hours not recorded. Skipping Low SOC prediction", buf, 2u);
      }
    }
    else
    {
      v12 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_string(v12, (const char *)*MEMORY[0x24BDAC698], (const char *)*MEMORY[0x24BDAC6A8]);
      xpc_dictionary_set_BOOL(v12, (const char *)*MEMORY[0x24BDAC598], 1);
      xpc_dictionary_set_BOOL(v12, (const char *)*MEMORY[0x24BDAC6B8], 0);
      xpc_dictionary_set_int64(v12, (const char *)*MEMORY[0x24BDAC5D8], 7200);
      xpc_dictionary_set_int64(v12, (const char *)*MEMORY[0x24BDAC5B8], 7200);
      xpc_dictionary_set_BOOL(v12, (const char *)*MEMORY[0x24BDAC6D0], 1);
      xpc_dictionary_set_BOOL(v12, (const char *)*MEMORY[0x24BDAC6E8], 1);
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = __48__PowerUIDrainAnalyzer_scheduleLowSOCPrediction__block_invoke;
      handler[3] = &unk_24D3FC490;
      handler[4] = self;
      xpc_activity_register("com.apple.powerui.lowSOCPrediction.prediction", v12, handler);

    }
  }
  else
  {
    v7 = self->_log;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215A71000, v7, OS_LOG_TYPE_DEFAULT, "Device pluggedin for less than 3 hours. Skipping Low SOC prediction", buf, 2u);
    }
  }

}

void __48__PowerUIDrainAnalyzer_scheduleLowSOCPrediction__block_invoke(uint64_t a1, xpc_activity_t activity)
{
  xpc_activity_state_t state;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  state = xpc_activity_get_state(activity);
  if (state == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "recordPredictionResultAndTime");
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = 101;
    objc_msgSend(*(id *)(a1 + 32), "updateLPMAndMinSOC");
    objc_msgSend(*(id *)(a1 + 32), "scheduleAnalyticsActivity");
  }
  else if (!state)
  {
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = 136315138;
      v6 = "com.apple.powerui.lowSOCPrediction.prediction";
      _os_log_impl(&dword_215A71000, v4, OS_LOG_TYPE_INFO, "Checking in for %s!", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)scheduleAnalyticsActivity
{
  xpc_object_t v3;
  _QWORD handler[5];

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x24BDAC698], (const char *)*MEMORY[0x24BDAC6A8]);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x24BDAC598], 1);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x24BDAC6B8], 0);
  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x24BDAC5D8], 120);
  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x24BDAC5B8], 21600);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x24BDAC6D0], 1);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x24BDAC6E8], 1);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __49__PowerUIDrainAnalyzer_scheduleAnalyticsActivity__block_invoke;
  handler[3] = &unk_24D3FC490;
  handler[4] = self;
  xpc_activity_register("com.apple.powerui.lowSOCPrediction.analytics", v3, handler);

}

void __49__PowerUIDrainAnalyzer_scheduleAnalyticsActivity__block_invoke(uint64_t a1, xpc_activity_t activity)
{
  xpc_activity_state_t state;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  state = xpc_activity_get_state(activity);
  if (state == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "recordAnalytics");
    objc_msgSend(*(id *)(a1 + 32), "resetState");
  }
  else if (!state)
  {
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = 136315138;
      v6 = "com.apple.powerui.lowSOCPrediction.analytics";
      _os_log_impl(&dword_215A71000, v4, OS_LOG_TYPE_INFO, "Checking in for %s!", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)recordPredictionResultAndTime
{
  int64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *log;
  _BOOL4 v8;
  const char *v9;
  NSUserDefaults *defaults;
  void *v11;
  NSUserDefaults *v12;
  void *v13;
  NSUserDefaults *v14;
  void *v15;
  NSUserDefaults *v16;
  void *v17;
  NSUserDefaults *v18;
  void *v19;
  void *v20;
  uint8_t v21[24];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = +[PowerUISmartChargeUtilities currentBatteryLevelWithContext:](PowerUISmartChargeUtilities, "currentBatteryLevelWithContext:", self->_context);
  objc_msgSend(MEMORY[0x24BE6E028], "predictor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowSOCPredictionOutput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "lowSOCPredicted");
  log = self->_log;
  v8 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v6)
  {
    if (v8)
    {
      *(_DWORD *)v21 = 134217984;
      *(_QWORD *)&v21[4] = 15;
      v9 = "Predicted to hit low SOC: %ld%%";
LABEL_6:
      _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, v9, v21, 0xCu);
    }
  }
  else if (v8)
  {
    *(_DWORD *)v21 = 134217984;
    *(_QWORD *)&v21[4] = 15;
    v9 = "Not predicted to hit low SOC: %ld%%";
    goto LABEL_6;
  }
  defaults = self->_defaults;
  objc_msgSend(v5, "modelVersion", *(_OWORD *)v21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults setObject:forKey:](defaults, "setObject:forKey:", v11, CFSTR("modelVersion"));

  v12 = self->_defaults;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults setObject:forKey:](v12, "setObject:forKey:", v13, CFSTR("predictionTime"));

  v14 = self->_defaults;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults setObject:forKey:](v14, "setObject:forKey:", v15, CFSTR("predictionResult"));

  v16 = self->_defaults;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults setObject:forKey:](v16, "setObject:forKey:", v17, CFSTR("startSOC"));

  v18 = self->_defaults;
  v19 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "confidence");
  objc_msgSend(v19, "numberWithDouble:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults setObject:forKey:](v18, "setObject:forKey:", v20, CFSTR("predictionConfidence"));

}

- (void)updateLPMAndMinSOC
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__PowerUIDrainAnalyzer_updateLPMAndMinSOC__block_invoke;
  block[3] = &unk_24D3FB7B0;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __42__PowerUIDrainAnalyzer_updateLPMAndMinSOC__block_invoke(uint64_t a1)
{
  int64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;

  v2 = +[PowerUISmartChargeUtilities currentBatteryLevelWithContext:](PowerUISmartChargeUtilities, "currentBatteryLevelWithContext:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v3 = *(_QWORD *)(a1 + 32);
  if (v2 < *(_QWORD *)(v3 + 48))
  {
    *(_QWORD *)(v3 + 48) = v2;
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("minSOC"));

    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("kDefaultsMinSOCDate"));

  }
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isLowPowerModeEnabled");

  if (v9)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("wasInLPM"));
}

- (void)recordAnalytics
{
  OUTLINED_FUNCTION_5(&dword_215A71000, a1, a3, "Missing last prediction date. Skipping analytics", a5, a6, a7, a8, 0);
}

id __39__PowerUIDrainAnalyzer_recordAnalytics__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)resetState
{
  -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", CFSTR("predictionTime"));
  -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", CFSTR("predictionResult"));
  -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", CFSTR("wasInLPM"));
  -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", CFSTR("startSOC"));
  -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", CFSTR("minSOC"));
  -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", CFSTR("modelVersion"));
  self->_minBatteryLevel = 100;
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

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)setNotificationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_notificationQueue, a3);
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (int64_t)minBatteryLevel
{
  return self->_minBatteryLevel;
}

- (void)setMinBatteryLevel:(int64_t)a3
{
  self->_minBatteryLevel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
