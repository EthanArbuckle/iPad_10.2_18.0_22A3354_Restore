@implementation PowerUICECManager

uint64_t __48__PowerUICECManager_monitorBatteryNotifications__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleCallback:", CFSTR("Battery state"));
}

- (void)handleCallback:(id)a3
{
  id v4;
  int64_t v5;
  _BOOL4 v6;
  NSObject *log;
  unint64_t currentPhase;
  int64_t v9;
  unint64_t *p_currentPhase;
  _BOOL4 v11;
  void *v12;
  int v13;
  _BOOL4 v14;
  _BOOL4 v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  _BYTE v26[10];
  unint64_t v27;
  __int16 v28;
  int64_t v29;
  __int16 v30;
  _BOOL4 v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = +[PowerUISmartChargeUtilities currentBatteryLevelWithContext:](PowerUISmartChargeUtilities, "currentBatteryLevelWithContext:", self->_context);
  v6 = -[PowerUICECManager isPluggedIntoEligiblePowerSource](self, "isPluggedIntoEligiblePowerSource");
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    currentPhase = self->_currentPhase;
    v25 = 138413058;
    *(_QWORD *)v26 = v4;
    *(_WORD *)&v26[8] = 2048;
    v27 = currentPhase;
    v28 = 2048;
    v29 = v5;
    v30 = 1024;
    v31 = v6;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Evaluating state. Trigger: %@ (CurrentPhase %lu batteryLevel %ld, isPluggedIntoEligibleSource %d)", (uint8_t *)&v25, 0x26u);
  }
  p_currentPhase = &self->_currentPhase;
  v9 = self->_currentPhase;
  if (v9 > 19)
  {
    if (v9 == 20)
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
        -[PowerUICECManager handleCallback:].cold.6();
    }
    else
    {
      if (v9 != 30)
      {
LABEL_21:
        if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
          -[PowerUICECManager handleCallback:].cold.2();
        goto LABEL_34;
      }
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
        -[PowerUICECManager handleCallback:].cold.5();
    }
  }
  else
  {
    if (v9)
    {
      if (v9 == 10)
      {
        if (-[PowerUICECManager isActiveRegion](self, "isActiveRegion"))
        {
          v11 = -[PowerUICECPredictedTimeManager hasSufficientTimeForFullCharge](self->_pluggedInTimeManager, "hasSufficientTimeForFullCharge");
          +[PowerUINotificationManager sharedInstance](PowerUINotificationManager, "sharedInstance");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "immediateCharge");

          v14 = -[PowerUICECManager isEnabled](self, "isEnabled");
          v15 = v14;
          if (v11 && (v13 & 1) == 0 && v14)
          {
            -[PowerUICECManager evaluatePausingNow](self, "evaluatePausingNow");
          }
          else
          {
            v16 = self->_log;
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              v25 = 67109632;
              *(_DWORD *)v26 = v15;
              *(_WORD *)&v26[4] = 1024;
              *(_DWORD *)&v26[6] = v13;
              LOWORD(v27) = 1024;
              *(_DWORD *)((char *)&v27 + 2) = v11;
              _os_log_impl(&dword_215A71000, v16, OS_LOG_TYPE_DEFAULT, "Deciding to Charge up. (isCECEnabled %d, didUserOverride %d, notEnoughTime %d)", (uint8_t *)&v25, 0x14u);
            }
            -[PowerUICECManager handleChargeUp](self, "handleChargeUp");
          }
        }
        else
        {
          -[PowerUICECManager handleDisengagement](self, "handleDisengagement");
        }
        goto LABEL_34;
      }
      goto LABEL_21;
    }
    if (-[PowerUICECManager isEnabled](self, "isEnabled"))
    {
      if (-[PowerUICECManager isActiveRegion](self, "isActiveRegion"))
      {
        if (-[PowerUICECManager evaluateEngagementAndSetup](self, "evaluateEngagementAndSetup"))
        {
          -[PowerUICECManager updatePhaseFrom:to:](self, "updatePhaseFrom:to:", self->_currentPhase, 10);
          -[PowerUICECManager evaluatePausingNow](self, "evaluatePausingNow");
          -[PowerUICECManager registerTimer](self, "registerTimer");
        }
        else
        {
          if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
            -[PowerUICECManager handleCallback:].cold.3();
          -[PowerUICECManager updatePhaseFrom:to:](self, "updatePhaseFrom:to:", self->_currentPhase, 30);
        }
      }
      else
      {
        v17 = self->_log;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v25) = 0;
          _os_log_impl(&dword_215A71000, v17, OS_LOG_TYPE_DEFAULT, "Not in active region", (uint8_t *)&v25, 2u);
        }
      }
    }
    else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
    {
      -[PowerUICECManager handleCallback:].cold.4();
    }
  }
LABEL_34:
  v18 = self->_log;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[PowerUICECManager handleCallback:].cold.1((uint64_t)p_currentPhase, v18, v19, v20, v21, v22, v23, v24);

}

- (BOOL)isEnabled
{
  NSDate *cecTemporarilyDisabledDate;
  double v4;
  char v5;

  if (+[PowerUICECManager isCECSupported](PowerUICECManager, "isCECSupported"))
  {
    cecTemporarilyDisabledDate = self->_cecTemporarilyDisabledDate;
    if (cecTemporarilyDisabledDate)
    {
      -[NSDate timeIntervalSinceNow](cecTemporarilyDisabledDate, "timeIntervalSinceNow");
      if (v4 < 0.0)
        -[PowerUICECManager setTemporarilyDisabled:from:](self, "setTemporarilyDisabled:from:", 0, 0);
    }
    v5 = self->_isCECEnabled & ~self->_isCECTemporarilyDisabled;
  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

- (BOOL)isActiveRegion
{
  NSObject *log;
  double tPluggedInWaitInterval;
  double v5;
  _BOOL4 v6;
  int v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (self->_isInternal)
  {
    if (self->_tPluggedInWaitInterval == 0.0)
    {
      v5 = 900.0;
    }
    else
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        tPluggedInWaitInterval = self->_tPluggedInWaitInterval;
        v8 = 134217984;
        v9 = tPluggedInWaitInterval;
        _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "TestMode: PluggedInWait set to %lf", (uint8_t *)&v8, 0xCu);
      }
      v5 = self->_tPluggedInWaitInterval;
    }
    if (self->_tOverrideActiveCheck)
    {
      LOBYTE(v6) = 1;
      return v6;
    }
  }
  else
  {
    v5 = 900.0;
  }
  if (!self->_shouldSupportCEC)
    goto LABEL_14;
  v6 = -[PowerUICECManager isPluggedIntoEligiblePowerSource](self, "isPluggedIntoEligiblePowerSource");
  if (!v6)
    return v6;
  if (+[PowerUISmartChargeUtilities deviceWasConnectedToChargerWithinSeconds:withContext:](PowerUISmartChargeUtilities, "deviceWasConnectedToChargerWithinSeconds:withContext:", self->_context, v5)|| +[PowerUISmartChargeUtilities currentBatteryLevelWithContext:](PowerUISmartChargeUtilities, "currentBatteryLevelWithContext:", self->_context) < 30)
  {
LABEL_14:
    LOBYTE(v6) = 0;
    return v6;
  }
  LOBYTE(v6) = +[PowerUISmartChargeUtilities currentBatteryLevelWithContext:](PowerUISmartChargeUtilities, "currentBatteryLevelWithContext:", self->_context) < 75;
  return v6;
}

- (BOOL)isPluggedIntoEligiblePowerSource
{
  uint64_t v3;
  CFMutableDictionaryRef v4;
  NSObject *log;
  char v6;
  mach_port_t v7;
  const __CFDictionary *v8;
  io_service_t MatchingService;
  kern_return_t v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v19;
  uint8_t v20[8];
  CFMutableDictionaryRef properties;

  if (!+[PowerUISmartChargeUtilities isPluggedInWithContext:](PowerUISmartChargeUtilities, "isPluggedInWithContext:", self->_context))return 0;
  if (self->_isInternal)
  {
    -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("testPowerSource"));
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (CFMutableDictionaryRef)v3;
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
        -[PowerUICECManager isPluggedIntoEligiblePowerSource].cold.3(log, v4);
      v6 = -[__CFDictionary BOOLValue](v4, "BOOLValue");
LABEL_19:

      return v6;
    }
  }
  v7 = *MEMORY[0x24BDD8B18];
  v8 = IOServiceMatching("IOPMPowerSource");
  MatchingService = IOServiceGetMatchingService(v7, v8);
  if (MatchingService)
  {
    properties = 0;
    v10 = IORegistryEntryCreateCFProperties(MatchingService, &properties, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    if (!v10)
    {
      v4 = properties;
      -[__CFDictionary objectForKeyedSubscript:](properties, "objectForKeyedSubscript:", CFSTR("FedDetails"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13
        && (objc_msgSend(v13, "objectAtIndexedSubscript:", 0),
            v15 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("FedExternalConnected")),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            v17 = objc_msgSend(v16, "BOOLValue"),
            v16,
            v15,
            (v17 & 1) == 0))
      {
        v19 = self->_log;
        v6 = 0;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v20 = 0;
          _os_log_impl(&dword_215A71000, v19, OS_LOG_TYPE_DEFAULT, "Device powering from another device", v20, 2u);
          v6 = 0;
        }
      }
      else
      {
        v6 = 1;
      }

      goto LABEL_19;
    }
    v11 = v10;
    v12 = self->_log;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[PowerUICECManager isPluggedIntoEligiblePowerSource].cold.2(v11, v12);
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    -[PowerUICECManager isPluggedIntoEligiblePowerSource].cold.1();
  }
  return 1;
}

+ (BOOL)isCECSupported
{
  void *v2;
  void *v3;
  char v4;

  if (!_os_feature_enabled_impl()
    || !+[PowerUISmartChargeUtilities isiPhone](PowerUISmartChargeUtilities, "isiPhone"))
  {
    return 0;
  }
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "countryCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("US"));

  return v4;
}

void __48__PowerUICECManager_monitorBatteryNotifications__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 56);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__PowerUICECManager_monitorBatteryNotifications__block_invoke_2;
  block[3] = &unk_24D3FB7B0;
  block[4] = v1;
  dispatch_async(v2, block);
}

+ (id)monitorWithDelegate:(id)a3
{
  return +[PowerUICECManager manager](PowerUICECManager, "manager", a3);
}

- (unint64_t)signalID
{
  return 11;
}

- (id)requiredFullChargeDate
{
  unint64_t currentPhase;
  BOOL v3;

  currentPhase = self->_currentPhase;
  if (currentPhase)
    v3 = currentPhase == 30;
  else
    v3 = 1;
  if (v3)
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  else
    -[NSDate dateByAddingTimeInterval:](self->_userDeadline, "dateByAddingTimeInterval:", (double)0x708uLL);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)handleNotificationResponse:(id)a3
{
  void *v4;
  int v5;
  NSObject *log;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[16];

  objc_msgSend(a3, "actionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("cecChargeUp"));

  if (v5)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "User requested immediate charge.", buf, 2u);
    }
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__PowerUICECManager_handleNotificationResponse___block_invoke;
    block[3] = &unk_24D3FB7B0;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

uint64_t __48__PowerUICECManager_handleNotificationResponse___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handlePowerUICECStateChange:withHandler:", 2, &__block_literal_global_14);
}

+ (id)fetchEstimatedCountryCode
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = os_log_create("com.apple.powerui.cec", ");
  objc_msgSend(MEMORY[0x24BE7D058], "currentEstimates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      +[PowerUICECManager fetchEstimatedCountryCode].cold.4();
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "countryCode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      +[PowerUICECManager fetchEstimatedCountryCode].cold.1();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE7D058], "lastKnownEstimates");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v6, "count"))
    {
      v7 = 0;
      goto LABEL_13;
    }
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      +[PowerUICECManager fetchEstimatedCountryCode].cold.2();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "countryCode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      +[PowerUICECManager fetchEstimatedCountryCode].cold.1();
    v3 = v6;
  }
  v7 = v5;

  v6 = v3;
LABEL_13:

  return v7;
}

+ (id)manager
{
  id v2;

  if (+[PowerUICECManager isCECSupported](PowerUICECManager, "isCECSupported"))
  {
    if (manager_onceToken_0 != -1)
      dispatch_once(&manager_onceToken_0, &__block_literal_global_75);
    v2 = (id)manager_manager_0;
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

void __28__PowerUICECManager_manager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)manager_manager_0;
  manager_manager_0 = v0;

}

- (PowerUICECManager)init
{
  id v2;
  os_log_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  void *v17;
  dispatch_source_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  _QWORD *v30;
  NSObject *v31;
  _QWORD *v32;
  NSObject *v33;
  _QWORD *v34;
  const char *v35;
  NSObject *v36;
  _QWORD *v37;
  NSObject *v38;
  _BYTE *v39;
  _QWORD v41[4];
  id v42;
  int v43;
  _QWORD v44[4];
  id v45;
  int v46;
  _QWORD v47[4];
  id v48;
  int v49;
  _QWORD v50[4];
  id v51;
  int out_token;
  _QWORD block[4];
  id v54;
  _QWORD v55[4];
  id v56;
  _QWORD handler[4];
  id v58;
  objc_super v59;
  _QWORD v60[4];
  _QWORD v61[5];

  v61[4] = *MEMORY[0x24BDAC8D0];
  v59.receiver = self;
  v59.super_class = (Class)PowerUICECManager;
  v2 = -[PowerUICECManager init](&v59, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.powerui.cec", ");
    v4 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v3;

    *((_BYTE *)v2 + 15) = +[PowerUISmartChargeUtilities isInternalBuild](PowerUISmartChargeUtilities, "isInternalBuild");
    v60[0] = &unk_24D443C48;
    v60[1] = &unk_24D443C60;
    v61[0] = CFSTR("Not Evaluated");
    v61[1] = CFSTR("Engaged");
    v60[2] = &unk_24D443C78;
    v60[3] = &unk_24D443C90;
    v61[2] = CFSTR("Charge Up");
    v61[3] = CFSTR("Evaluated and Not Engaged");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v61, v60, 4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)*((_QWORD *)v2 + 6);
    *((_QWORD *)v2 + 6) = v5;

    objc_msgSend(v2, "refreshShouldSupportCEC");
    +[PowerUIChargingController sharedInstance](PowerUIChargingController, "sharedInstance");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)*((_QWORD *)v2 + 12);
    *((_QWORD *)v2 + 12) = v7;

    +[PowerUIAnalyticsManager sharedInstance](PowerUIAnalyticsManager, "sharedInstance");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)*((_QWORD *)v2 + 13);
    *((_QWORD *)v2 + 13) = v9;

    objc_msgSend(MEMORY[0x24BE1B170], "userContext");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.powerui.cec"));
    v14 = (void *)*((_QWORD *)v2 + 11);
    *((_QWORD *)v2 + 11) = v13;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create("com.apple.powerui.cecmanager.queue", v15);
    v17 = (void *)*((_QWORD *)v2 + 7);
    *((_QWORD *)v2 + 7) = v16;

    v18 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, *((dispatch_queue_t *)v2 + 7));
    v19 = (void *)*((_QWORD *)v2 + 14);
    *((_QWORD *)v2 + 14) = v18;

    v20 = *((_QWORD *)v2 + 14);
    v21 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __25__PowerUICECManager_init__block_invoke;
    handler[3] = &unk_24D3FB7B0;
    v22 = v2;
    v58 = v22;
    dispatch_source_set_event_handler(v20, handler);
    objc_msgSend(v22, "loadState");
    if (v22[3] == 10)
      objc_msgSend(v22, "registerTimer");
    objc_msgSend(v22, "monitorBatteryNotifications");
    +[PowerUIBDCDataManager sharedInstance](PowerUIBDCDataManager, "sharedInstance");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v22[19];
    v22[19] = v23;

    v25 = *((_QWORD *)v2 + 5);
    v55[0] = v21;
    v55[1] = 3221225472;
    v55[2] = __25__PowerUICECManager_init__block_invoke_2;
    v55[3] = &unk_24D3FB7B0;
    v26 = v22;
    v56 = v26;
    +[PowerUICECPredictedTimeManager managerWithContextStore:withHandler:](PowerUICECPredictedTimeManager, "managerWithContextStore:withHandler:", v25, v55);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)v26[10];
    v26[10] = v27;

    v29 = *((_QWORD *)v2 + 7);
    block[0] = v21;
    block[1] = 3221225472;
    block[2] = __25__PowerUICECManager_init__block_invoke_4;
    block[3] = &unk_24D3FB7B0;
    v30 = v26;
    v54 = v30;
    dispatch_async(v29, block);
    out_token = 0;
    v31 = *((_QWORD *)v2 + 7);
    v50[0] = v21;
    v50[1] = 3221225472;
    v50[2] = __25__PowerUICECManager_init__block_invoke_5;
    v50[3] = &unk_24D3FB748;
    v32 = v30;
    v51 = v32;
    notify_register_dispatch("com.apple.powerui.cec.notification", &out_token, v31, v50);
    v49 = 0;
    v33 = *((_QWORD *)v2 + 7);
    v47[0] = v21;
    v47[1] = 3221225472;
    v47[2] = __25__PowerUICECManager_init__block_invoke_6;
    v47[3] = &unk_24D3FB748;
    v34 = v32;
    v48 = v34;
    notify_register_dispatch("com.apple.powerui.cec.powerLogDonation", &v49, v33, v47);
    v46 = 0;
    v35 = (const char *)objc_msgSend(objc_retainAutorelease((id)*MEMORY[0x24BE7D060]), "UTF8String");
    v36 = *((_QWORD *)v2 + 7);
    v44[0] = v21;
    v44[1] = 3221225472;
    v44[2] = __25__PowerUICECManager_init__block_invoke_7;
    v44[3] = &unk_24D3FB748;
    v37 = v34;
    v45 = v37;
    notify_register_dispatch(v35, &v46, v36, v44);
    v43 = 0;
    v38 = *((_QWORD *)v2 + 7);
    v41[0] = v21;
    v41[1] = 3221225472;
    v41[2] = __25__PowerUICECManager_init__block_invoke_8;
    v41[3] = &unk_24D3FB748;
    v39 = v37;
    v42 = v39;
    notify_register_dispatch("com.apple.powerui.cec.checkForEligiblePowerSource", &v43, v38, v41);
    v39[13] = 1;

  }
  return (PowerUICECManager *)v2;
}

uint64_t __25__PowerUICECManager_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleCallback:", CFSTR("Timer"));
}

void __25__PowerUICECManager_init__block_invoke_2(uint64_t a1)
{
  _QWORD *v1;
  NSObject *v2;
  _QWORD block[4];
  _QWORD *v4;

  v1 = *(_QWORD **)(a1 + 32);
  v2 = v1[7];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __25__PowerUICECManager_init__block_invoke_3;
  block[3] = &unk_24D3FB7B0;
  v4 = v1;
  dispatch_async(v2, block);

}

uint64_t __25__PowerUICECManager_init__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleCallback:", CFSTR("PluggedIn Prediction"));
}

uint64_t __25__PowerUICECManager_init__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleCallback:", CFSTR("Boot up"));
}

void __25__PowerUICECManager_init__block_invoke_5(uint64_t a1, int token)
{
  void *v3;
  id v4;
  id v5;
  uint64_t state64;

  state64 = 0;
  notify_get_state(token, &state64);
  if (state64 == 2)
  {
    +[PowerUINotificationManager sharedInstance](PowerUINotificationManager, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v3, "postCECEngagedNotificationWithDate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  }
  else
  {
    if (state64 != 1)
      return;
    +[PowerUINotificationManager sharedInstance](PowerUINotificationManager, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v3, "postCECFirstTimeNotification");
  }

}

uint64_t __25__PowerUICECManager_init__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "recordPowerLogEvent");
}

uint64_t __25__PowerUICECManager_init__block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "refreshShouldSupportCEC");
}

void __25__PowerUICECManager_init__block_invoke_8(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    v5[0] = 67109120;
    v5[1] = objc_msgSend(v3, "isPluggedIntoEligiblePowerSource");
    _os_log_impl(&dword_215A71000, v4, OS_LOG_TYPE_DEFAULT, "Is Power source eligible: %d", (uint8_t *)v5, 8u);

  }
}

- (void)refreshShouldSupportCEC
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  if (+[PowerUICECManager isCECSupported](PowerUICECManager, "isCECSupported"))
  {
    +[PowerUICECManager fetchEstimatedCountryCode](PowerUICECManager, "fetchEstimatedCountryCode");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v6 = v3;
      v5 = objc_msgSend(v3, "isEqualToString:", CFSTR("US"));
      v4 = v6;
    }
    else
    {
      v5 = 1;
    }
    self->_shouldSupportCEC = v5;

  }
  else
  {
    self->_shouldSupportCEC = 0;
  }
}

- (void)loadState
{
  void *v3;
  NSString *v4;
  NSString *debugStatus;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSDate *v15;
  NSDate *userDeadline;
  void *v17;
  void *v18;
  NSDate *v19;
  NSDate *pluggedInDate;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  NSDate *v26;
  NSDate *cecTemporarilyDisabledDate;
  double v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  NSDate *v33;
  NSDate *pauseChargingCheckDate;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  unint64_t currentPhase;
  void *v43;
  void *v44;
  NSDate *v45;
  void *v46;
  void *v47;
  NSDate *v48;
  void *v49;
  NSDate *v50;
  NSObject *log;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  NSDate *v57;
  __int16 v58;
  NSDate *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  NSDate *v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  -[NSUserDefaults stringForKey:](self->_defaults, "stringForKey:", CFSTR("bootUUIDOnLastInit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults stringForKey:](self->_defaults, "stringForKey:", CFSTR("debugStatus"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  debugStatus = self->_debugStatus;
  self->_debugStatus = v4;

  +[PowerUISmartChargeUtilities getCurrentBootSessionUUID](PowerUISmartChargeUtilities, "getCurrentBootSessionUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v3);
  -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", v6, CFSTR("bootUUIDOnLastInit"));
  v8 = self->_log;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)MEMORY[0x24BDD16E0];
    v10 = v8;
    objc_msgSend(v9, "numberWithBool:", v7 ^ 1u);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v53 = v11;
    _os_log_impl(&dword_215A71000, v10, OS_LOG_TYPE_DEFAULT, "CECManager initializing. Was the device restarted: %@", buf, 0xCu);

  }
  if ((v7 & 1) == 0)
    -[PowerUICECManager resetState](self, "resetState");
  self->_currentPhase = -[NSUserDefaults integerForKey:](self->_defaults, "integerForKey:", CFSTR("currentPhase"));
  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("userDeadline"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v12, "doubleValue");
    objc_msgSend(v14, "dateWithTimeIntervalSinceReferenceDate:");
    v15 = (NSDate *)objc_claimAutoreleasedReturnValue();
    userDeadline = self->_userDeadline;
    self->_userDeadline = v15;

  }
  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("pluggedInDateInterval"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v17, "doubleValue");
    objc_msgSend(v18, "dateWithTimeIntervalSinceReferenceDate:");
    v19 = (NSDate *)objc_claimAutoreleasedReturnValue();
    pluggedInDate = self->_pluggedInDate;
    self->_pluggedInDate = v19;

  }
  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("pluggedInBatteryLevel"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
    self->_pluggedInBatteryLevel = (int)objc_msgSend(v21, "intValue");
  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("currentState"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v23 = objc_msgSend(v22, "unsignedIntegerValue");
  }
  else
  {
    if (!+[PowerUICECManager isCECSupported](PowerUICECManager, "isCECSupported"))
      goto LABEL_16;
    v23 = 1;
  }
  self->_currentState = v23;
LABEL_16:
  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("tempDisabledInterval"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v25 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v24, "doubleValue");
    objc_msgSend(v25, "dateWithTimeIntervalSinceReferenceDate:");
    v26 = (NSDate *)objc_claimAutoreleasedReturnValue();
    cecTemporarilyDisabledDate = self->_cecTemporarilyDisabledDate;
    self->_cecTemporarilyDisabledDate = v26;

    -[NSDate timeIntervalSinceNow](self->_cecTemporarilyDisabledDate, "timeIntervalSinceNow");
    if (v28 <= 0.0)
    {
      -[NSDate timeIntervalSinceNow](self->_cecTemporarilyDisabledDate, "timeIntervalSinceNow");
      -[PowerUICECManager setupTempDisabledCheckAfterInterval:](self, "setupTempDisabledCheckAfterInterval:");
    }
    else
    {
      self->_isCECTemporarilyDisabled = 1;
    }
  }
  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("disabled"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
    v30 = objc_msgSend(v29, "BOOLValue") ^ 1;
  else
    LOBYTE(v30) = 1;
  self->_isCECEnabled = v30;
  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("pauseChargingCheckDate"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    v32 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v31, "doubleValue");
    objc_msgSend(v32, "dateWithTimeIntervalSinceReferenceDate:");
    v33 = (NSDate *)objc_claimAutoreleasedReturnValue();
    pauseChargingCheckDate = self->_pauseChargingCheckDate;
    self->_pauseChargingCheckDate = v33;

  }
  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("testPluggedInWait"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    -[NSUserDefaults doubleForKey:](self->_defaults, "doubleForKey:", CFSTR("testPluggedInWait"));
    self->_tPluggedInWaitInterval = v36;
  }
  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("firstTime"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
    self->_displayedFirstTimeNotification = -[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", CFSTR("firstTime"));
  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("testOverrideActiveCheck"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if (v38)
    self->_tOverrideActiveCheck = objc_msgSend(v38, "BOOLValue");
  v40 = self->_log;
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    v41 = (void *)MEMORY[0x24BDD16E0];
    currentPhase = self->_currentPhase;
    log = v40;
    objc_msgSend(v41, "numberWithUnsignedInteger:", currentPhase);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_currentState);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = self->_userDeadline;
    v46 = v6;
    v47 = v3;
    v48 = self->_cecTemporarilyDisabledDate;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isCECEnabled);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = self->_pauseChargingCheckDate;
    *(_DWORD *)buf = 138413570;
    v53 = v43;
    v54 = 2112;
    v55 = v44;
    v56 = 2112;
    v57 = v45;
    v58 = 2112;
    v59 = v48;
    v3 = v47;
    v6 = v46;
    v60 = 2112;
    v61 = v49;
    v62 = 2112;
    v63 = v50;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "CECManager Loaded state. Phase %@, State %@, User Deadline %@, TempDisabledDate %@, isCECEnabled %@, pauseChargingCheckDate %@", buf, 0x3Eu);

  }
}

- (id)status
{
  void *v3;
  void *v4;
  void *v5;
  NSDictionary *phaseDescriptions;
  void *v7;
  void *v8;
  NSDictionary *v9;
  void *v10;
  void *v11;
  NSDate *userDeadline;
  NSDate *pauseChargingCheckDate;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_currentPhase);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("CECCurrentPhase"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isChargingPaused);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("CECChargingPaused"));

  phaseDescriptions = self->_phaseDescriptions;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_currentPhase);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](phaseDescriptions, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = self->_phaseDescriptions;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_currentPhase);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("CECCurrentPhaseString"));

  }
  userDeadline = self->_userDeadline;
  if (userDeadline)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", userDeadline, CFSTR("CECUserDeadline"));
  pauseChargingCheckDate = self->_pauseChargingCheckDate;
  if (pauseChargingCheckDate)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", pauseChargingCheckDate, CFSTR("CECCheckDate"));
  return v3;
}

- (void)monitorBatteryNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[5];

  v3 = (void *)MEMORY[0x24BE1B1A0];
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForBatteryStateDataDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForBatteryStateDataDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForForegroundApp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateForKeyPath:withFormat:", v4, CFSTR("(SELF.%@.value.externalConnected = %@) AND NOT (SELF.%@.value = %@)"), v5, MEMORY[0x24BDBD1C8], v6, CFSTR("com.apple.camera"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __48__PowerUICECManager_monitorBatteryNotifications__block_invoke;
  v15[3] = &unk_24D3FC468;
  v15[4] = self;
  objc_msgSend(MEMORY[0x24BE1B190], "localWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:", CFSTR("com.apple.powerui.cec.battery"), v7, CFSTR("com.apple.powerui.cec.batteryState"), v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDLocalContext registerCallback:](self->_context, "registerCallback:", v9);
  v10 = (void *)MEMORY[0x24BE1B1A0];
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForPluginStatus");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateForChangeAtKeyPath:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __48__PowerUICECManager_monitorBatteryNotifications__block_invoke_3;
  v14[3] = &unk_24D3FC468;
  v14[4] = self;
  objc_msgSend(MEMORY[0x24BE1B190], "localWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:", CFSTR("com.apple.powerui.cec.unplug"), v12, CFSTR("com.apple.powerui.cec.pluggedIn"), v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDLocalContext registerCallback:](self->_context, "registerCallback:", v13);

}

void __48__PowerUICECManager_monitorBatteryNotifications__block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 56);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__PowerUICECManager_monitorBatteryNotifications__block_invoke_4;
  block[3] = &unk_24D3FB7B0;
  block[4] = v1;
  dispatch_async(v2, block);
}

void __48__PowerUICECManager_monitorBatteryNotifications__block_invoke_4(uint64_t a1)
{
  BOOL v2;
  _QWORD *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  int64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _BYTE *v17;
  void *v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  _QWORD block[5];
  uint8_t buf[4];
  int64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = +[PowerUISmartChargeUtilities isPluggedInWithContext:](PowerUISmartChargeUtilities, "isPluggedInWithContext:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  v3 = *(_QWORD **)(a1 + 32);
  if (v2)
  {
    v4 = v3[4];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v24) = 1;
      _os_log_impl(&dword_215A71000, v4, OS_LOG_TYPE_DEFAULT, "Plugged In %d", buf, 8u);
    }
    v5 = *(_QWORD *)(a1 + 32);
    if (!*(_QWORD *)(v5 + 136))
    {
      v6 = *(void **)(v5 + 40);
      objc_msgSend(MEMORY[0x24BE1B180], "keyPathForPluginStatus");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastModifiedDateForContextualKeyPath:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = (int64_t)v8;
        _os_log_impl(&dword_215A71000, v9, OS_LOG_TYPE_DEFAULT, "Setting pluggedIn date to %@", buf, 0xCu);
      }
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 136), v8);
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(v10 + 88);
      objc_msgSend(*(id *)(v10 + 136), "timeIntervalSinceReferenceDate");
      objc_msgSend(v11, "setDouble:forKey:", CFSTR("pluggedInDateInterval"));
      v12 = +[PowerUISmartChargeUtilities currentBatteryLevelWithContext:](PowerUISmartChargeUtilities, "currentBatteryLevelWithContext:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
      v13 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v24 = v12;
        _os_log_impl(&dword_215A71000, v13, OS_LOG_TYPE_DEFAULT, "Setting pluggedIn battery level to %ld", buf, 0xCu);
      }
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144) = v12;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setInteger:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144), CFSTR("pluggedInBatteryLevel"));

      v5 = *(_QWORD *)(a1 + 32);
    }
    if (!*(_BYTE *)(v5 + 9))
    {
      if (objc_msgSend((id)v5, "isEnabled"))
      {
        if (+[PowerUICECManager isCECSupported](PowerUICECManager, "isCECSupported"))
        {
          v14 = *(_QWORD *)(a1 + 32);
          if (*(_BYTE *)(v14 + 14))
          {
            objc_msgSend(*(id *)(v14 + 88), "objectForKey:", CFSTR("firstTime"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v15;
            if (v15)
              *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = objc_msgSend(v15, "BOOLValue");
            v17 = *(_BYTE **)(a1 + 32);
            if (!v17[9])
            {
              if (objc_msgSend(v17, "shouldEngageCEC"))
              {
                +[PowerUINotificationManager sharedInstance](PowerUINotificationManager, "sharedInstance");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = (id)objc_msgSend(v18, "postCECFirstTimeNotification");

                objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setBool:forKey:", 1, CFSTR("firstTime"));
                *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 1;
              }
            }

          }
        }
      }
    }
    v20 = *(_QWORD *)(a1 + 32);
    v21 = *(NSObject **)(v20 + 56);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__PowerUICECManager_monitorBatteryNotifications__block_invoke_139;
    block[3] = &unk_24D3FB7B0;
    block[4] = v20;
    dispatch_async(v21, block);
  }
  else
  {
    objc_msgSend(v3, "recordAnalytics");
    objc_msgSend(*(id *)(a1 + 32), "resetState");
  }
}

uint64_t __48__PowerUICECManager_monitorBatteryNotifications__block_invoke_139(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleCallback:", CFSTR("PluggedIn state"));
}

- (void)registerTimer
{
  NSObject *timer;
  dispatch_time_t v4;
  _QWORD block[5];

  timer = self->_timer;
  v4 = dispatch_walltime(0, 300000000000);
  dispatch_source_set_timer(timer, v4, 0x45D964B800uLL, 0xDF8475800uLL);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__PowerUICECManager_registerTimer__block_invoke;
  block[3] = &unk_24D3FB7B0;
  block[4] = self;
  if (registerTimer_timerToken != -1)
    dispatch_once(&registerTimer_timerToken, block);
}

void __34__PowerUICECManager_registerTimer__block_invoke(uint64_t a1)
{
  dispatch_activate(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 112));
}

- (void)unregisterTimer
{
  dispatch_source_set_timer((dispatch_source_t)self->_timer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
}

- (void)setupTempDisabledCheckAfterInterval:(double)a3
{
  dispatch_time_t v4;
  NSObject *queue;
  _QWORD block[5];

  v4 = dispatch_walltime(0, (uint64_t)(a3 * 1000000000.0));
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__PowerUICECManager_setupTempDisabledCheckAfterInterval___block_invoke;
  block[3] = &unk_24D3FB7B0;
  block[4] = self;
  dispatch_after(v4, queue, block);
}

uint64_t __57__PowerUICECManager_setupTempDisabledCheckAfterInterval___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTemporarilyDisabled:from:", 0, 0);
}

- (id)defaultDateToDisableUntilGivenDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *log;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (defaultDateToDisableUntilGivenDate__onceToken_1 != -1)
    dispatch_once(&defaultDateToDisableUntilGivenDate__onceToken_1, &__block_literal_global_142);
  objc_msgSend((id)defaultDateToDisableUntilGivenDate__calendar_1, "components:fromDate:", 60, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hour") >= 6)
    objc_msgSend(v5, "setDay:", objc_msgSend(v5, "day") + 1);
  objc_msgSend(v5, "setHour:", 6);
  objc_msgSend((id)defaultDateToDisableUntilGivenDate__calendar_1, "dateFromComponents:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Feature disabled until: %@", (uint8_t *)&v9, 0xCu);
  }

  return v6;
}

void __56__PowerUICECManager_defaultDateToDisableUntilGivenDate___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)defaultDateToDisableUntilGivenDate__calendar_1;
  defaultDateToDisableUntilGivenDate__calendar_1 = v0;

}

- (BOOL)isEngaged
{
  return self->_currentPhase == 10;
}

- (BOOL)hasInfluencedCharging
{
  unint64_t currentPhase;

  currentPhase = self->_currentPhase;
  return currentPhase == 10 || currentPhase == 20;
}

- (unint64_t)cecState
{
  return self->_currentState;
}

- (void)setTemporarilyDisabled:(BOOL)a3 from:(id)a4
{
  id v6;
  NSDate *v7;
  NSDate *cecTemporarilyDisabledDate;
  NSUserDefaults *defaults;
  NSObject *log;
  NSObject *v11;
  void *v12;
  unint64_t currentState;
  NSObject *v14;
  void *v15;
  NSDate *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (a3)
  {
    if (!self->_isCECTemporarilyDisabled)
    {
      self->_isCECTemporarilyDisabled = 1;
      -[PowerUICECManager defaultDateToDisableUntilGivenDate:](self, "defaultDateToDisableUntilGivenDate:", v6);
      v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
      cecTemporarilyDisabledDate = self->_cecTemporarilyDisabledDate;
      self->_cecTemporarilyDisabledDate = v7;

      -[NSDate timeIntervalSinceNow](self->_cecTemporarilyDisabledDate, "timeIntervalSinceNow");
      -[PowerUICECManager setupTempDisabledCheckAfterInterval:](self, "setupTempDisabledCheckAfterInterval:");
      defaults = self->_defaults;
      -[NSDate timeIntervalSinceReferenceDate](self->_cecTemporarilyDisabledDate, "timeIntervalSinceReferenceDate");
      -[NSUserDefaults setDouble:forKey:](defaults, "setDouble:forKey:", CFSTR("tempDisabledInterval"));
    }
  }
  else
  {
    if ((self->_currentState & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Enabling CEC from temporarily disabled", (uint8_t *)&v17, 2u);
      }
      self->_currentState = 1;
      -[PowerUICECManager recordPowerLogCECState:](self, "recordPowerLogCECState:", 1);
      v11 = self->_log;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (void *)MEMORY[0x24BDD16E0];
        currentState = self->_currentState;
        v14 = v11;
        objc_msgSend(v12, "numberWithUnsignedInteger:", currentState);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138412290;
        v18 = v15;
        _os_log_impl(&dword_215A71000, v14, OS_LOG_TYPE_DEFAULT, "CEC State set to: %@", (uint8_t *)&v17, 0xCu);

      }
      -[NSUserDefaults setInteger:forKey:](self->_defaults, "setInteger:forKey:", self->_currentState, CFSTR("currentState"));
    }
    self->_isCECTemporarilyDisabled = 0;
    v16 = self->_cecTemporarilyDisabledDate;
    self->_cecTemporarilyDisabledDate = 0;

    -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", CFSTR("tempDisabledInterval"));
  }

}

- (void)handlePowerUICECStateChange:(unint64_t)a3 withHandler:(id)a4
{
  id v6;
  NSObject *log;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *queue;
  id v12;
  _QWORD block[5];
  id v14;
  unint64_t v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)MEMORY[0x24BDD16E0];
    v9 = log;
    objc_msgSend(v8, "numberWithUnsignedInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v10;
    _os_log_impl(&dword_215A71000, v9, OS_LOG_TYPE_DEFAULT, "CEC State: %@", buf, 0xCu);

  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__PowerUICECManager_handlePowerUICECStateChange_withHandler___block_invoke;
  block[3] = &unk_24D3FCD50;
  v14 = v6;
  v15 = a3;
  block[4] = self;
  v12 = v6;
  dispatch_async(queue, block);

}

void __61__PowerUICECManager_handlePowerUICECStateChange_withHandler___block_invoke(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 48);
  if (v2 >= 4)
  {
    v10 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("PowerUISmartChargingErrorDomain"), 1, 0);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD))(v10 + 16))(v10, 0);

  }
  else
  {
    switch(v2)
    {
      case 0uLL:
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) = 0;
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 10) = 0;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setBool:forKey:", 1, CFSTR("disabled"));
        v3 = *(_QWORD *)(a1 + 32);
        v4 = *(void **)(v3 + 104);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", +[PowerUISmartChargeUtilities currentBatteryLevelWithContext:](PowerUISmartChargeUtilities, "currentBatteryLevelWithContext:", *(_QWORD *)(v3 + 40)));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
        v7 = v4;
        v8 = v5;
        v9 = 4;
        goto LABEL_12;
      case 1uLL:
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) = 1;
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 10) = 1;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "removeObjectForKey:", CFSTR("disabled"));
        objc_msgSend(*(id *)(a1 + 32), "setTemporarilyDisabled:from:", 0, 0);
        v16 = *(_QWORD *)(a1 + 32);
        v17 = *(void **)(v16 + 104);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", +[PowerUISmartChargeUtilities currentBatteryLevelWithContext:](PowerUISmartChargeUtilities, "currentBatteryLevelWithContext:", *(_QWORD *)(v16 + 40)));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
        v7 = v17;
        v8 = v5;
        v9 = 5;
        goto LABEL_12;
      case 2uLL:
        v18 = *(_QWORD *)(a1 + 32);
        if (*(_QWORD *)(v18 + 24) != 10)
          goto LABEL_10;
        *(_QWORD *)(v18 + 128) = 2;
        v19 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setTemporarilyDisabled:from:", 1, v5);
        goto LABEL_13;
      case 3uLL:
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) = 3;
        v22 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setTemporarilyDisabled:from:", 1, v23);

        v24 = *(_QWORD *)(a1 + 32);
        v25 = *(void **)(v24 + 104);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", +[PowerUISmartChargeUtilities currentBatteryLevelWithContext:](PowerUISmartChargeUtilities, "currentBatteryLevelWithContext:", *(_QWORD *)(v24 + 40)));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
        v7 = v25;
        v8 = v5;
        v9 = 3;
LABEL_12:
        objc_msgSend(v7, "submitEngagementEventWithBatteryLevel:targetSoC:predictedEndOfCharge:modeOfOperation:eventType:", v8, 0, v6, 1, v9);
LABEL_13:

        v26 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v27 = (void *)MEMORY[0x24BDD16E0];
          v28 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128);
          v29 = v26;
          objc_msgSend(v27, "numberWithUnsignedInteger:", v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v33 = v30;
          _os_log_impl(&dword_215A71000, v29, OS_LOG_TYPE_DEFAULT, "CEC State set to: %@", buf, 0xCu);

        }
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setInteger:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128), CFSTR("currentState"));
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        objc_msgSend(*(id *)(a1 + 32), "recordPowerLogCECState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128));
        objc_msgSend(*(id *)(a1 + 32), "handleCallback:", CFSTR("User"));
        break;
      default:
        v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = (void *)MEMORY[0x24BDD16E0];
          v13 = *(_QWORD *)(a1 + 48);
          v14 = v11;
          objc_msgSend(v12, "numberWithUnsignedInteger:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v33 = v15;
          _os_log_impl(&dword_215A71000, v14, OS_LOG_TYPE_DEFAULT, "Unsupported CEC State: %@", buf, 0xCu);

        }
LABEL_10:
        v20 = *(_QWORD *)(a1 + 40);
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("PowerUISmartChargingErrorDomain"), 1, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v20 + 16))(v20, 0, v21);

        break;
    }
  }
}

- (void)updatePhaseFrom:(unint64_t)a3 to:(unint64_t)a4
{
  int64_t v7;
  _BOOL4 v8;
  NSObject *log;
  NSDictionary *phaseDescriptions;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSDictionary *v15;
  void *v16;
  void *v17;
  PowerUIAnalyticsManager *analyticsManager;
  void *v19;
  int v20;
  unint64_t v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  int64_t v29;
  __int16 v30;
  _BOOL4 v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v7 = +[PowerUISmartChargeUtilities currentBatteryLevelWithContext:](PowerUISmartChargeUtilities, "currentBatteryLevelWithContext:", self->_context);
  v8 = -[PowerUICECManager isPluggedIntoEligiblePowerSource](self, "isPluggedIntoEligiblePowerSource");
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    phaseDescriptions = self->_phaseDescriptions;
    v11 = (void *)MEMORY[0x24BDD16E0];
    v12 = log;
    objc_msgSend(v11, "numberWithUnsignedInteger:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](phaseDescriptions, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = self->_phaseDescriptions;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 134219266;
    v21 = a3;
    v22 = 2048;
    v23 = a4;
    v24 = 2112;
    v25 = v14;
    v26 = 2112;
    v27 = v17;
    v28 = 2048;
    v29 = v7;
    v30 = 1024;
    v31 = v8;
    _os_log_impl(&dword_215A71000, v12, OS_LOG_TYPE_DEFAULT, "CEC Phase update from %lu to %lu (%@ --> %@); BatteryLevel %ld, PluggedIntoEligibleSource %d",
      (uint8_t *)&v20,
      0x3Au);

  }
  self->_currentPhase = a4;
  -[NSUserDefaults setInteger:forKey:](self->_defaults, "setInteger:forKey:", a4, CFSTR("currentPhase"));
  if (self->_currentPhase != 10)
  {
    -[PowerUIChargingController clearChargeLimitForLimitType:](self->_chargingController, "clearChargeLimitForLimitType:", 4);
    analyticsManager = self->_analyticsManager;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PowerUIAnalyticsManager submitEngagementEventWithBatteryLevel:targetSoC:predictedEndOfCharge:modeOfOperation:eventType:](analyticsManager, "submitEngagementEventWithBatteryLevel:targetSoC:predictedEndOfCharge:modeOfOperation:eventType:", v19, 0, self->_userDeadline, 1, 9);

    self->_isChargingPaused = 0;
  }
  -[PowerUICECManager recordPowerLogEvent](self, "recordPowerLogEvent");
  -[PowerUICECManager promptBDCToQueryCurrentState](self, "promptBDCToQueryCurrentState");
}

- (void)promptBDCToQueryCurrentState
{
  void *v3;
  id v4;

  -[PowerUIBDCDataManager getBDCDataDictTemplate](self->_bdcDataManager, "getBDCDataDictTemplate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_24D443CA8, CFSTR("ChargingState"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_24D443CA8, CFSTR("InflowState"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_24D443CC0, CFSTR("ChargeLimit"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_currentPhase);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, CFSTR("CheckPoint"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_24D443CD8, CFSTR("ModeOfOperation"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_24D443CA8, CFSTR("DecisionMaker"));
  -[PowerUIBDCDataManager promptBDCToQueryState:](self->_bdcDataManager, "promptBDCToQueryState:", v4);

}

- (void)handleDisengagement
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_215A71000, v0, OS_LOG_TYPE_ERROR, "Battery level below %ld post engagement", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)handleChargeUp
{
  void *v3;

  +[PowerUINotificationManager sharedInstance](PowerUINotificationManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeCECNotifications");

  -[PowerUICECManager updatePhaseFrom:to:](self, "updatePhaseFrom:to:", self->_currentPhase, 20);
  -[PowerUICECPredictedTimeManager stopAllMonitoring](self->_pluggedInTimeManager, "stopAllMonitoring");
  -[PowerUICECManager unregisterTimer](self, "unregisterTimer");
}

- (void)evaluatePausingNow
{
  NSDate *pauseChargingCheckDate;
  double v4;
  NSObject *log;
  int isChargingPaused;
  void *v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  PowerUIAnalyticsManager *analyticsManager;
  void *v13;
  void *v14;
  id v15;
  BOOL v16;
  void *v17;
  id v18;
  int64_t v19;
  PowerUIAnalyticsManager *v20;
  void *v21;
  id v22;
  NSDate *v23;
  NSDate *v24;
  NSUserDefaults *defaults;
  int v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  pauseChargingCheckDate = self->_pauseChargingCheckDate;
  if (pauseChargingCheckDate)
  {
    -[NSDate timeIntervalSinceNow](pauseChargingCheckDate, "timeIntervalSinceNow");
    if (v4 > -300.0)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        v26 = 134217984;
        v27 = 5;
        _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Evaluated pausing in last %lu mins. Skipping", (uint8_t *)&v26, 0xCu);
      }
      return;
    }
  }
  isChargingPaused = self->_isChargingPaused;
  +[PowerUICECGridDataManager sharedInstance](PowerUICECGridDataManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldChargeNow");

  v9 = self->_log;
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_215A71000, v9, OS_LOG_TYPE_DEFAULT, "CEC Engaged : Charging up", (uint8_t *)&v26, 2u);
    }
    +[PowerUINotificationManager sharedInstance](PowerUINotificationManager, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeCECPausedNotification");

    -[PowerUIChargingController clearChargeLimitForLimitType:](self->_chargingController, "clearChargeLimitForLimitType:", 4);
    if (!self->_isChargingPaused
      || (analyticsManager = self->_analyticsManager,
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", +[PowerUISmartChargeUtilities currentBatteryLevelWithContext:](PowerUISmartChargeUtilities, "currentBatteryLevelWithContext:", self->_context)), v13 = (void *)objc_claimAutoreleasedReturnValue(), -[PowerUIAnalyticsManager submitEngagementEventWithBatteryLevel:targetSoC:predictedEndOfCharge:modeOfOperation:eventType:](analyticsManager, "submitEngagementEventWithBatteryLevel:targetSoC:predictedEndOfCharge:modeOfOperation:eventType:", v13, 0, self->_userDeadline, 1, 9), v13, !self->_isChargingPaused))
    {
      if (!self->_firstChargingEvaluation)
      {
        v16 = 0;
        goto LABEL_20;
      }
    }
    +[PowerUINotificationManager sharedInstance](PowerUINotificationManager, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v14, "postInternalCECNotificationWithID:chargingStatus:information:shouldReplace:", CFSTR("chargingStatus"), 1, CFSTR("Lower carbon emission electricity is available right now!"), 1);
    v16 = 0;
  }
  else
  {
    if (v10)
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_215A71000, v9, OS_LOG_TYPE_DEFAULT, "CEC Engaged : Charging paused", (uint8_t *)&v26, 2u);
    }
    +[PowerUINotificationManager sharedInstance](PowerUINotificationManager, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id)objc_msgSend(v17, "postCECEngagedNotificationWithDate:", self->_userDeadline);

    v19 = +[PowerUISmartChargeUtilities currentBatteryLevelWithContext:](PowerUISmartChargeUtilities, "currentBatteryLevelWithContext:", self->_context);
    if (-[PowerUIChargingController setChargeLimitTo:forLimitType:](self->_chargingController, "setChargeLimitTo:forLimitType:", v19, 4))
    {
      v20 = self->_analyticsManager;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PowerUIAnalyticsManager submitEngagementEventWithBatteryLevel:targetSoC:predictedEndOfCharge:modeOfOperation:eventType:](v20, "submitEngagementEventWithBatteryLevel:targetSoC:predictedEndOfCharge:modeOfOperation:eventType:", v21, 0, self->_userDeadline, 1, 8);

    }
    if (self->_isChargingPaused && !self->_firstChargingEvaluation)
    {
      v16 = 1;
      goto LABEL_20;
    }
    +[PowerUINotificationManager sharedInstance](PowerUINotificationManager, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 1;
    v22 = (id)objc_msgSend(v14, "postInternalCECNotificationWithID:chargingStatus:information:shouldReplace:", CFSTR("chargingStatus"), 0, CFSTR("Lower carbon emission electricity is available in future."), 1);
  }

LABEL_20:
  self->_isChargingPaused = v16;
  if (isChargingPaused != (v8 ^ 1))
  {
    -[PowerUICECManager analyticsCECSessionChargingState:](self, "analyticsCECSessionChargingState:");
    -[PowerUICECManager recordPowerLogEvent](self, "recordPowerLogEvent");
    -[PowerUICECManager promptBDCToQueryCurrentState](self, "promptBDCToQueryCurrentState");
  }
  self->_firstChargingEvaluation = 0;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v23 = (NSDate *)objc_claimAutoreleasedReturnValue();
  v24 = self->_pauseChargingCheckDate;
  self->_pauseChargingCheckDate = v23;

  defaults = self->_defaults;
  -[NSDate timeIntervalSinceReferenceDate](self->_pauseChargingCheckDate, "timeIntervalSinceReferenceDate");
  -[NSUserDefaults setDouble:forKey:](defaults, "setDouble:forKey:", CFSTR("pauseChargingCheckDate"));
}

- (BOOL)shouldEngageCEC
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *v11;
  NSString *debugStatus;
  NSObject *log;
  _BOOL4 v14;
  BOOL v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __CFString *v36;
  NSObject *v37;
  id v38;
  void *v39;
  NSString *v40;
  void *v41;
  NSString *v42;
  NSString *v43;
  void *v44;
  double v45;
  uint64_t v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v3 = +[PowerUISmartChargeUtilities currentBatteryLevelWithContext:](PowerUISmartChargeUtilities, "currentBatteryLevelWithContext:", self->_context);
  +[PowerUISmartChargeUtilities lastPluggedInDate](PowerUISmartChargeUtilities, "lastPluggedInDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", v4, 1, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD1500];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringFromDate:dateStyle:timeStyle:", v8, 1, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("BatteryLevel %ld, PluggedIn at %@ Evaluated at %@"), v3, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\n%@"), v10);
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  debugStatus = self->_debugStatus;
  self->_debugStatus = v11;

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Evaluating engagement for current session", buf, 2u);
  }

  v14 = -[PowerUICECPredictedTimeManager hasSufficientTimeForFullCharge](self->_pluggedInTimeManager, "hasSufficientTimeForFullCharge");
  v15 = v14;
  if (v14)
  {
    -[PowerUICECPredictedTimeManager timeToFullChargeFromBatteryLevel:](self->_pluggedInTimeManager, "timeToFullChargeFromBatteryLevel:", 80);
    v17 = v16;
    -[PowerUICECPredictedTimeManager deadline](self->_pluggedInTimeManager, "deadline");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timeIntervalSinceNow");
    v20 = v19;

    v21 = fmax(v20 - v17, 0.0);
    -[PowerUICECPredictedTimeManager timeToFullChargeFromBatteryLevel:](self->_pluggedInTimeManager, "timeToFullChargeFromBatteryLevel:", +[PowerUISmartChargeUtilities currentBatteryLevelWithContext:](PowerUISmartChargeUtilities, "currentBatteryLevelWithContext:", self->_context));
    v23 = fmax(v22 - v17, 0.0);
    v24 = self->_log;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = (void *)MEMORY[0x24BDD16E0];
      v26 = v24;
      objc_msgSend(v25, "numberWithDouble:", v21);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v23);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v54 = v27;
      v55 = 2112;
      v56 = v28;
      _os_log_impl(&dword_215A71000, v26, OS_LOG_TYPE_DEFAULT, "PluggedIn interval %@, Required charging interval %@", buf, 0x16u);

    }
    +[PowerUICECGridDataManager sharedInstance](PowerUICECGridDataManager, "sharedInstance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v30) = objc_msgSend(v29, "shouldEngageForPluggedInTime:", v21);

    if ((_DWORD)v30)
    {
      +[PowerUICECGridDataManager sharedInstance](PowerUICECGridDataManager, "sharedInstance");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setupChargingTime:forPluggedInTime:", v23, v21);

      v32 = (void *)MEMORY[0x24BDD17C8];
      +[PowerUICECGridDataManager sharedInstance](PowerUICECGridDataManager, "sharedInstance");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "cleanIntervals");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      +[PowerUICECGridDataManager cleanIntervalsStringFromDates:](PowerUICECGridDataManager, "cleanIntervalsStringFromDates:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "stringWithFormat:", CFSTR("Clean windows %@"), v35);
      v36 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v37 = self->_log;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_215A71000, v37, OS_LOG_TYPE_DEFAULT, "Throwing Gridmix notification", buf, 2u);
      }
      +[PowerUINotificationManager sharedInstance](PowerUINotificationManager, "sharedInstance");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = CFSTR("Not enough variation in carbon emissions");
      v38 = (id)objc_msgSend(v33, "postInternalCECNotificationWithID:chargingStatus:information:shouldReplace:", CFSTR("engagedEvaluation"), 1, CFSTR("Not enough variation in carbon emissions"), 1);
    }

  }
  else
  {
    LOBYTE(v30) = 0;
    v36 = &stru_24D3FD658;
  }
  v39 = (void *)MEMORY[0x24BDD17C8];
  v40 = self->_debugStatus;
  -[PowerUICECPredictedTimeManager debugStatus](self->_pluggedInTimeManager, "debugStatus");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "stringWithFormat:", CFSTR("%@\n%@\n%@"), v40, v41, v36);
  v42 = (NSString *)objc_claimAutoreleasedReturnValue();
  v43 = self->_debugStatus;
  self->_debugStatus = v42;

  if (!v15)
  {
    -[PowerUICECPredictedTimeManager deadline](self->_pluggedInTimeManager, "deadline");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "timeIntervalSinceNow");
    if (v45 < 0.0)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v46 = objc_claimAutoreleasedReturnValue();

      v44 = (void *)v46;
    }
    v47 = self->_log;
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215A71000, v47, OS_LOG_TYPE_DEFAULT, "Throwing Predictor notification", buf, 2u);
    }
    v48 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", v44, 1, 1);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "stringWithFormat:", CFSTR("Device not predicted to be plugged in for long enough (until %@)"), v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    +[PowerUINotificationManager sharedInstance](PowerUINotificationManager, "sharedInstance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (id)objc_msgSend(v30, "postInternalCECNotificationWithID:chargingStatus:information:shouldReplace:", CFSTR("engagedEvaluation"), 1, v50, 1);

    LOBYTE(v30) = 0;
  }

  return (char)v30;
}

- (BOOL)evaluateEngagementAndSetup
{
  _BOOL8 v3;
  NSObject *log;
  void *v5;
  NSString *v6;
  NSString *debugStatus;
  NSDate *v8;
  NSDate *userDeadline;
  NSUserDefaults *defaults;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  uint8_t buf[4];
  _BOOL4 v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (-[PowerUICECManager isActiveRegion](self, "isActiveRegion"))
  {
    v3 = -[PowerUICECManager shouldEngageCEC](self, "shouldEngageCEC");
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v17 = v3;
      _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Should engage %d", buf, 8u);
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Should engage %d"), v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n%@"), self->_debugStatus, v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    debugStatus = self->_debugStatus;
    self->_debugStatus = v6;

    -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", self->_debugStatus, CFSTR("debugStatus"));
    if (v3)
    {
      -[PowerUICECPredictedTimeManager startAllMonitoring](self->_pluggedInTimeManager, "startAllMonitoring");
      -[PowerUICECPredictedTimeManager deadline](self->_pluggedInTimeManager, "deadline");
      v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
      userDeadline = self->_userDeadline;
      self->_userDeadline = v8;

      defaults = self->_defaults;
      -[NSDate timeIntervalSinceReferenceDate](self->_userDeadline, "timeIntervalSinceReferenceDate");
      -[NSUserDefaults setDouble:forKey:](defaults, "setDouble:forKey:", CFSTR("userDeadline"));
      +[PowerUINotificationManager sharedInstance](PowerUINotificationManager, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[PowerUICECGridDataManager sharedInstance](PowerUICECGridDataManager, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "cleanIntervals");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "postInternalCECNotificationForChargingDates:", v13);

    }
    v14 = -[PowerUICECPredictedTimeManager hasSufficientTimeForFullCharge](self->_pluggedInTimeManager, "hasSufficientTimeForFullCharge");
    -[PowerUICECManager analyticsCECEngagementEvaluation:byPredictedTime:byGridMix:](self, "analyticsCECEngagementEvaluation:byPredictedTime:byGridMix:", v3, v14, v3 & v14);

  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)resetState
{
  NSObject *log;
  NSObject *v4;
  NSString *debugStatus;
  NSString *v6;
  void *v7;
  void *v8;
  NSDate *userDeadline;
  NSDate *pauseChargingCheckDate;
  NSDate *pluggedInDate;
  int v12;
  NSString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Reset state", (uint8_t *)&v12, 2u);
  }
  v4 = self->_log;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    debugStatus = self->_debugStatus;
    v12 = 138412290;
    v13 = debugStatus;
    _os_log_impl(&dword_215A71000, v4, OS_LOG_TYPE_DEFAULT, "Debug: %@", (uint8_t *)&v12, 0xCu);
  }
  -[PowerUICECManager handleNewDebugState:](self, "handleNewDebugState:", self->_debugStatus);
  v6 = self->_debugStatus;
  self->_debugStatus = 0;

  self->_firstChargingEvaluation = 1;
  -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", self->_debugStatus, CFSTR("debugStatus"));
  self->_isChargingPaused = 0;
  -[PowerUICECManager updatePhaseFrom:to:](self, "updatePhaseFrom:to:", self->_currentPhase, 0);
  -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", CFSTR("userDeadline"));
  -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", CFSTR("pauseChargingCheckDate"));
  +[PowerUINotificationManager sharedInstance](PowerUINotificationManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeCECNotifications");

  -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", CFSTR("debugStatus"));
  -[PowerUICECPredictedTimeManager resetState](self->_pluggedInTimeManager, "resetState");
  +[PowerUICECGridDataManager sharedInstance](PowerUICECGridDataManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resetState");

  userDeadline = self->_userDeadline;
  self->_userDeadline = 0;

  pauseChargingCheckDate = self->_pauseChargingCheckDate;
  self->_pauseChargingCheckDate = 0;

  -[PowerUICECManager clearAnalyticsDate](self, "clearAnalyticsDate");
  pluggedInDate = self->_pluggedInDate;
  self->_pluggedInDate = 0;

  self->_pluggedInBatteryLevel = -1;
  -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", CFSTR("pluggedInDateInterval"));
  -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", CFSTR("pluggedInBatteryLevel"));
  -[PowerUICECManager unregisterTimer](self, "unregisterTimer");
}

- (void)handleNewDebugState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  NSObject *log;
  NSDate *v17;
  double v18;
  NSObject *v19;
  NSObject *v20;
  double v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  double v31;
  __int16 v32;
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("debugStatusHistory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v4;
  if (v4)
  {
    v5 = (void *)objc_msgSend(v4, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  objc_msgSend(v5, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        -[PowerUICECManager dateFormatter](self, "dateFormatter");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "dateFromString:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "timeIntervalSinceNow");
        if (v15 < -86400.0)
        {
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v31 = *(double *)&v14;
            v32 = 2112;
            v33 = v12;
            _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Removing entry for %@ %@", buf, 0x16u);
          }
          objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, v12);
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v9);
  }
  v17 = self->_pluggedInDate;
  -[NSDate timeIntervalSinceNow](v17, "timeIntervalSinceNow");
  if (v18 <= -7200.0)
  {
    -[PowerUICECManager dateFormatter](self, "dateFormatter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringFromDate:", v17);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setObject:forKeyedSubscript:", self->_debugStatus, v23);
    v24 = self->_log;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = *(double *)&v6;
      _os_log_impl(&dword_215A71000, v24, OS_LOG_TYPE_DEFAULT, "Debug history %@", buf, 0xCu);
    }
    -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", v6, CFSTR("debugStatusHistory"));

  }
  else
  {
    v19 = self->_log;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = v19;
      -[NSDate timeIntervalSinceNow](v17, "timeIntervalSinceNow");
      *(_DWORD *)buf = 134217984;
      v31 = v21 / 60.0;
      _os_log_impl(&dword_215A71000, v20, OS_LOG_TYPE_DEFAULT, "Skipping debug since device was pluggedIn for %lf mins", buf, 0xCu);

    }
  }

}

- (void)analyticsCECEngagementEvaluation:(BOOL)a3 byPredictedTime:(BOOL)a4 byGridMix:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v8;
  double v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;

  v5 = a5;
  v6 = a3;
  -[NSUserDefaults setBool:forKey:](self->_defaults, "setBool:forKey:", a4, CFSTR("cecEngagementPredictedTime"));
  -[NSUserDefaults setBool:forKey:](self->_defaults, "setBool:forKey:", v5, CFSTR("cecEngagementGridMix"));
  -[NSUserDefaults setBool:forKey:](self->_defaults, "setBool:forKey:", v6, CFSTR("cecEngagement"));
  if (v6)
  {
    -[PowerUICECPredictedTimeManager deadline](self->_pluggedInTimeManager, "deadline");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v12 = v8;
      objc_msgSend(v8, "timeIntervalSinceNow");
      if (v9 >= 0.0)
      {
        v11 = v12;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v10 = objc_claimAutoreleasedReturnValue();

        v11 = (id)v10;
      }
      v13 = v11;
      -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", v11, CFSTR("cecDeadline"));

    }
    else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      -[PowerUICECManager analyticsCECEngagementEvaluation:byPredictedTime:byGridMix:].cold.1();
    }
  }
}

- (id)dateFormatter
{
  if (dateFormatter_onceToken != -1)
    dispatch_once(&dateFormatter_onceToken, &__block_literal_global_185);
  return (id)dateFormatter_formatter;
}

uint64_t __34__PowerUICECManager_dateFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)dateFormatter_formatter;
  dateFormatter_formatter = (uint64_t)v0;

  objc_msgSend((id)dateFormatter_formatter, "setDateStyle:", 1);
  return objc_msgSend((id)dateFormatter_formatter, "setTimeStyle:", 3);
}

- (void)analyticsCECSessionChargingState:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a3;
  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("cecChargingStatusTimeline"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v5;
  if (v5)
  {
    v6 = objc_msgSend(v5, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
  -[PowerUICECManager dateFormatter](self, "dateFormatter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, v10);

  -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", v7, CFSTR("cecChargingStatusTimeline"));
}

- (id)sessionEndCECAnalytics
{
  void *v3;
  void *v4;
  NSObject *log;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSDate *v12;
  double v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  double v55;
  uint64_t j;
  void *v57;
  void *v58;
  int v59;
  NSObject *v60;
  id v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  NSString *v68;
  NSString *debugStatus;
  void *v70;
  double v71;
  double v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  NSString *v77;
  NSString *v78;
  NSDate *v79;
  unint64_t v80;
  void *v81;
  void *v82;
  NSString *v83;
  NSString *v84;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  NSDate *v91;
  id obj;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _BYTE v101[128];
  void *v102;
  uint8_t v103[128];
  uint8_t buf[4];
  void *v105;
  uint64_t v106;

  v106 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("cecEngagement"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Engagement result missing", buf, 2u);
    }
  }
  v6 = objc_msgSend(v4, "BOOLValue");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("engaged"));

  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("cecEngagementPredictedTime"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("engagedPredictedTime"));
  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("cecEngagementGridMix"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("engagedGridMix"));
  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("cecDeadline"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v11 = self->_log;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215A71000, v11, OS_LOG_TYPE_DEFAULT, "No CEC Deadline", buf, 2u);
    }
  }
  v12 = self->_pluggedInDate;
  objc_msgSend(v10, "timeIntervalSinceNow");
  v14 = (uint64_t)v13;
  if ((uint64_t)v13 >= 0)
    v15 = (uint64_t)v13;
  else
    v15 = -v14;
  if (v15 % 0xE10 <= 0x707)
    v16 = 0;
  else
    v16 = (v14 >> 63) | 1;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v16 + (uint64_t)v13 / 3600);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("differenceHours"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v14 / 60);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("differenceRaw"));

  if (v10)
  {
    v19 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v10, "timeIntervalSinceDate:", v12);
    objc_msgSend(v19, "numberWithInteger:", (uint64_t)v20 / 60);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("predictedPluggedInDuration"));

  }
  v91 = v12;
  -[NSDate timeIntervalSinceNow](v12, "timeIntervalSinceNow");
  v23 = (uint64_t)(v22 / -60.0);
  if (v23 <= 180)
    v24 = MEMORY[0x24BDBD1C0];
  else
    v24 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("longerSession"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("pluggedInDuration"));

  if (self->_pluggedInBatteryLevel != -1)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("pluggedInBatteryLevel"));

  }
  v27 = +[PowerUISmartChargeUtilities currentBatteryLevelWithContext:](PowerUISmartChargeUtilities, "currentBatteryLevelWithContext:", self->_context);
  if (v27 < 100)
    v28 = v6;
  else
    v28 = 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("pluggedOutBatteryLevel"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("underchargeFromPrediction"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v28);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("undercharge"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", !self->_isCECEnabled);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("cecDisabled"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isCECTemporarilyDisabled);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("cecTemporarilyDisabled"));

  if (!(_DWORD)v6)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_24D44AFC0, CFSTR("pausedMinutes"));
    v79 = v12;
    goto LABEL_60;
  }
  v89 = v10;
  v90 = v9;
  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("cecChargingStatusTimeline"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = self->_log;
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v105 = v34;
    _os_log_impl(&dword_215A71000, v35, OS_LOG_TYPE_DEFAULT, "Charging timeline %@", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "allKeys");
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v103, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v98;
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v98 != v39)
          objc_enumerationMutation(obj);
        v41 = *(_QWORD *)(*((_QWORD *)&v97 + 1) + 8 * i);
        -[PowerUICECManager dateFormatter](self, "dateFormatter");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "dateFromString:", v41);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v34, "objectForKeyedSubscript:", v41);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setObject:forKeyedSubscript:", v44, v43);

      }
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v103, 16);
    }
    while (v38);
  }
  v88 = v34;
  v45 = self->_log;
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v105 = v36;
    _os_log_impl(&dword_215A71000, v45, OS_LOG_TYPE_DEFAULT, "Dates charging timeline %@", buf, 0xCu);
  }
  objc_msgSend(v36, "allKeys");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)objc_msgSend(v46, "mutableCopy");

  v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("self"), 1);
  v102 = v48;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v102, 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "sortUsingDescriptors:", v49);

  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  v50 = v47;
  v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v93, v101, 16);
  if (!v51)
  {
    v55 = 0.0;
    v70 = v50;
    v10 = v89;
LABEL_57:

    v80 = 0x24BDD1000;
    v79 = v91;
    goto LABEL_59;
  }
  v52 = v51;
  v86 = v48;
  v87 = v3;
  v53 = 0;
  v54 = *(_QWORD *)v94;
  v55 = 0.0;
  do
  {
    for (j = 0; j != v52; ++j)
    {
      if (*(_QWORD *)v94 != v54)
        objc_enumerationMutation(v50);
      v57 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * j);
      objc_msgSend(v36, "objectForKeyedSubscript:", v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v58, "BOOLValue");

      if (v59)
      {
        v60 = self->_log;
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v105 = v57;
          _os_log_impl(&dword_215A71000, v60, OS_LOG_TYPE_DEFAULT, "Prev date %@", buf, 0xCu);
        }
        v61 = v57;
      }
      else
      {
        if (!v53)
          continue;
        objc_msgSend(v57, "timeIntervalSinceDate:", v53);
        v63 = v62;
        v64 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", v53, 0, 1);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", v57, 0, 1);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "stringWithFormat:", CFSTR("Paused from %@ to %@, "), v65, v66);
        v67 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n%@"), self->_debugStatus, v67);
        v68 = (NSString *)objc_claimAutoreleasedReturnValue();
        debugStatus = self->_debugStatus;
        self->_debugStatus = v68;

        v55 = v55 + v63;
        v61 = 0;
        v53 = (void *)v67;
      }

      v53 = v61;
    }
    v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v93, v101, 16);
  }
  while (v52);

  if (v53)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "timeIntervalSinceDate:", v53);
    v72 = v71;
    v73 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", v53, 0, 1);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", v70, 0, 1);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "stringWithFormat:", CFSTR("Paused from %@ to %@"), v74, v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n%@"), self->_debugStatus, v76);
    v77 = (NSString *)objc_claimAutoreleasedReturnValue();
    v78 = self->_debugStatus;
    self->_debugStatus = v77;

    v55 = v55 + v72;
    v48 = v86;
    v3 = v87;
    v10 = v89;
    goto LABEL_57;
  }
  v48 = v86;
  v3 = v87;
  v10 = v89;
  v80 = 0x24BDD1000uLL;
  v79 = v91;
LABEL_59:
  objc_msgSend(*(id *)(v80 + 1760), "numberWithInteger:", (uint64_t)(v55 / 60.0));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v81, CFSTR("pausedMinutes"));

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Paused for %d mins in total"), ((int)v55 / 60));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n%@"), self->_debugStatus, v82);
  v83 = (NSString *)objc_claimAutoreleasedReturnValue();
  v84 = self->_debugStatus;
  self->_debugStatus = v83;

  v9 = v90;
LABEL_60:

  return v3;
}

- (void)recordPowerLogCECState:(unint64_t)a3
{
  void *v5;
  void *v6;
  NSObject *log;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("cecState"));

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Writing to PowerLog %@", (uint8_t *)&v9, 0xCu);
  }
  v8 = (void *)MEMORY[0x2199EC15C]();
  PLLogRegisteredEvent();
  objc_autoreleasePoolPop(v8);

}

- (void)recordPowerLogEvent
{
  void *v3;
  int isChargingPaused;
  unint64_t currentPhase;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *log;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isChargingPaused = self->_isChargingPaused;
  currentPhase = self->_currentPhase;
  if (self->_isInternal)
  {
    -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("powerLogPaused"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      isChargingPaused = objc_msgSend(v6, "BOOLValue");
    -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("powerLogStatus"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      currentPhase = objc_msgSend(v8, "integerValue");

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_currentState);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("cecState"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", currentPhase);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("status"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", isChargingPaused != 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("isPaused"));

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = v3;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Writing to PowerLog %@", (uint8_t *)&v14, 0xCu);
  }
  v13 = (void *)MEMORY[0x2199EC15C]();
  PLLogRegisteredEvent();
  objc_autoreleasePoolPop(v13);

}

- (void)recordAnalytics
{
  void *v3;
  NSObject *log;
  id v5;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[PowerUICECManager sessionEndCECAnalytics](self, "sessionEndCECAnalytics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v5 = v3;
    AnalyticsSendEventLazy();

  }
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = v3;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Reported CEC metrics to CoreAnalytics %@", buf, 0xCu);
  }
  -[PowerUICECManager clearAnalyticsDate](self, "clearAnalyticsDate");

}

id __36__PowerUICECManager_recordAnalytics__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)clearAnalyticsDate
{
  -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", CFSTR("cecDeadline"));
  -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", CFSTR("cecEngagement"));
  -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", CFSTR("cecEngagementPredictedTime"));
  -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", CFSTR("cecEngagementGridMix"));
  -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", CFSTR("cecChargingStatusTimeline"));
}

- (NSDate)userDeadline
{
  return self->_userDeadline;
}

- (void)setUserDeadline:(id)a3
{
  objc_storeStrong((id *)&self->_userDeadline, a3);
}

- (unint64_t)currentPhase
{
  return self->_currentPhase;
}

- (void)setCurrentPhase:(unint64_t)a3
{
  self->_currentPhase = a3;
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

- (NSDictionary)phaseDescriptions
{
  return self->_phaseDescriptions;
}

- (void)setPhaseDescriptions:(id)a3
{
  objc_storeStrong((id *)&self->_phaseDescriptions, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BOOL)isChargingPaused
{
  return self->_isChargingPaused;
}

- (void)setIsChargingPaused:(BOOL)a3
{
  self->_isChargingPaused = a3;
}

- (BOOL)displayedFirstTimeNotification
{
  return self->_displayedFirstTimeNotification;
}

- (void)setDisplayedFirstTimeNotification:(BOOL)a3
{
  self->_displayedFirstTimeNotification = a3;
}

- (BOOL)isCECEnabled
{
  return self->_isCECEnabled;
}

- (void)setIsCECEnabled:(BOOL)a3
{
  self->_isCECEnabled = a3;
}

- (BOOL)isCECTemporarilyDisabled
{
  return self->_isCECTemporarilyDisabled;
}

- (void)setIsCECTemporarilyDisabled:(BOOL)a3
{
  self->_isCECTemporarilyDisabled = a3;
}

- (NSDate)cecTemporarilyDisabledDate
{
  return self->_cecTemporarilyDisabledDate;
}

- (void)setCecTemporarilyDisabledDate:(id)a3
{
  objc_storeStrong((id *)&self->_cecTemporarilyDisabledDate, a3);
}

- (NSDate)pauseChargingCheckDate
{
  return self->_pauseChargingCheckDate;
}

- (void)setPauseChargingCheckDate:(id)a3
{
  objc_storeStrong((id *)&self->_pauseChargingCheckDate, a3);
}

- (PowerUICECPredictedTimeManager)pluggedInTimeManager
{
  return self->_pluggedInTimeManager;
}

- (void)setPluggedInTimeManager:(id)a3
{
  objc_storeStrong((id *)&self->_pluggedInTimeManager, a3);
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (PowerUIChargingController)chargingController
{
  return self->_chargingController;
}

- (void)setChargingController:(id)a3
{
  objc_storeStrong((id *)&self->_chargingController, a3);
}

- (PowerUIAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsManager, a3);
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (double)tPluggedInWaitInterval
{
  return self->_tPluggedInWaitInterval;
}

- (void)setTPluggedInWaitInterval:(double)a3
{
  self->_tPluggedInWaitInterval = a3;
}

- (BOOL)tOverrideActiveCheck
{
  return self->_tOverrideActiveCheck;
}

- (void)setTOverrideActiveCheck:(BOOL)a3
{
  self->_tOverrideActiveCheck = a3;
}

- (BOOL)firstChargingEvaluation
{
  return self->_firstChargingEvaluation;
}

- (void)setFirstChargingEvaluation:(BOOL)a3
{
  self->_firstChargingEvaluation = a3;
}

- (unint64_t)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(unint64_t)a3
{
  self->_currentState = a3;
}

- (NSDate)pluggedInDate
{
  return self->_pluggedInDate;
}

- (void)setPluggedInDate:(id)a3
{
  objc_storeStrong((id *)&self->_pluggedInDate, a3);
}

- (int64_t)pluggedInBatteryLevel
{
  return self->_pluggedInBatteryLevel;
}

- (void)setPluggedInBatteryLevel:(int64_t)a3
{
  self->_pluggedInBatteryLevel = a3;
}

- (PowerUIBDCDataManager)bdcDataManager
{
  return self->_bdcDataManager;
}

- (void)setBdcDataManager:(id)a3
{
  objc_storeStrong((id *)&self->_bdcDataManager, a3);
}

- (NSString)debugStatus
{
  return self->_debugStatus;
}

- (BOOL)shouldSupportCEC
{
  return self->_shouldSupportCEC;
}

- (void)setShouldSupportCEC:(BOOL)a3
{
  self->_shouldSupportCEC = a3;
}

- (BOOL)isInternal
{
  return self->_isInternal;
}

- (void)setIsInternal:(BOOL)a3
{
  self->_isInternal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugStatus, 0);
  objc_storeStrong((id *)&self->_bdcDataManager, 0);
  objc_storeStrong((id *)&self->_pluggedInDate, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_chargingController, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_pluggedInTimeManager, 0);
  objc_storeStrong((id *)&self->_pauseChargingCheckDate, 0);
  objc_storeStrong((id *)&self->_cecTemporarilyDisabledDate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_phaseDescriptions, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_userDeadline, 0);
}

+ (void)fetchEstimatedCountryCode
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_215A71000, v0, v1, "Estimated countries = %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)isPluggedIntoEligiblePowerSource
{
  NSObject *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4[0] = 67109120;
  v4[1] = objc_msgSend(a2, "BOOLValue");
  _os_log_debug_impl(&dword_215A71000, v3, OS_LOG_TYPE_DEBUG, "TestMode: Power source value set to %d", (uint8_t *)v4, 8u);

  OUTLINED_FUNCTION_2();
}

- (void)handleCallback:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_215A71000, a2, a3, "Current Phase %lu", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)handleCallback:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_215A71000, v0, v1, "Unsupported Phase", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

- (void)handleCallback:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_215A71000, v0, v1, "Evaluated and decided to not engage", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

- (void)handleCallback:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_215A71000, v0, v1, "CEC is not enabled. Skipping", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

- (void)handleCallback:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_215A71000, v0, v1, "No-op", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

- (void)handleCallback:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_215A71000, v0, v1, "Charging up", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

- (void)analyticsCECEngagementEvaluation:byPredictedTime:byGridMix:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_215A71000, v0, v1, "CEC engaged but deadline is missing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

@end
