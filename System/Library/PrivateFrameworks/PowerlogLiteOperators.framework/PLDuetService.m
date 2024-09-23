@implementation PLDuetService

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLDuetService;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventNoneDefinitions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[6];

  v10[5] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("DASPoliciesBlockingCriteria");
  +[PLDuetServiceDAS entryEventNoneDefinitionsDASPoliciesBlockingCriteria](PLDuetServiceDAS, "entryEventNoneDefinitionsDASPoliciesBlockingCriteria");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v2;
  v9[1] = CFSTR("DASActivity");
  +[PLDuetServiceDAS entryEventNoneDefinitionsDASActivity](PLDuetServiceDAS, "entryEventNoneDefinitionsDASActivity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v3;
  v9[2] = CFSTR("DASDropCount");
  +[PLDuetServiceDAS entryEventNoneDefinitionsDASActivityDropCount](PLDuetServiceDAS, "entryEventNoneDefinitionsDASActivityDropCount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v4;
  v9[3] = CFSTR("DASInfo");
  +[PLDuetServiceDAS entryEventNoneDefinitionsDASInfo](PLDuetServiceDAS, "entryEventNoneDefinitionsDASInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v5;
  v9[4] = CFSTR("DASActivityLifecycle");
  +[PLDuetServiceDAS entryEventNoneDefinitionsDASActivityLifecycle](PLDuetServiceDAS, "entryEventNoneDefinitionsDASActivityLifecycle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryEventForwardDefinitions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[7];
  _QWORD v12[8];

  v12[7] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("BatterySaverMode");
  objc_msgSend(a1, "entryEventForwardDefinitionBatterySaverMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v2;
  v11[1] = CFSTR("DASPrediction");
  +[PLDuetServiceDAS entryEventForwardDefinitionsDASPrediction](PLDuetServiceDAS, "entryEventForwardDefinitionsDASPrediction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v3;
  v11[2] = CFSTR("DASApplicationUsagePrediction");
  +[PLDuetServiceDAS entryEventForwardDefinitionsDASApplicationPrediction](PLDuetServiceDAS, "entryEventForwardDefinitionsDASApplicationPrediction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v4;
  v11[3] = CFSTR("LpmSourceInformation");
  +[PLDuetServiceLpmSource entryEventForwardDefinitionLpmSourceInformation](PLDuetServiceLpmSource, "entryEventForwardDefinitionLpmSourceInformation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v5;
  v11[4] = CFSTR("DASEnergyBudgetAvailable");
  +[PLDuetServiceDAS entryEventForwardDefinitionsDASEnergyBudgetAvailable](PLDuetServiceDAS, "entryEventForwardDefinitionsDASEnergyBudgetAvailable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v6;
  v11[5] = CFSTR("DASDataBudgetAvailable");
  +[PLDuetServiceDAS entryEventForwardDefinitionsDASDataBudgetAvailable](PLDuetServiceDAS, "entryEventForwardDefinitionsDASDataBudgetAvailable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[5] = v7;
  v11[6] = CFSTR("DASTrial");
  +[PLDuetServiceDAS entryEventForwardDefinitionsDASTrial](PLDuetServiceDAS, "entryEventForwardDefinitionsDASTrial");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryEventBackwardDefinitions
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("DASEnergyBudgetReport");
  +[PLDuetServiceDAS entryEventBackwardDefinitionsDASEnergyBudgetReport](PLDuetServiceDAS, "entryEventBackwardDefinitionsDASEnergyBudgetReport");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)entryEventForwardDefinitionBatterySaverMode
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[2];
  uint64_t v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(MEMORY[0x1E0D80078], "hasBattery"))
    return MEMORY[0x1E0C9AA70];
  v14[0] = *MEMORY[0x1E0D80298];
  v12 = *MEMORY[0x1E0D80318];
  v13 = &unk_1E86537F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E0D802F0];
  v10[0] = CFSTR("Mode");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("Value");
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)entryEventIntervalDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("DuetEvents");
  objc_msgSend(a1, "eventIntervalDefinitionDuetEvents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("ComplicationEvents");
  v8[0] = v3;
  objc_msgSend(a1, "eventIntervalDefinitionComplicationEvents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)eventIntervalDefinitionDuetEvents
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[4];
  _QWORD v16[4];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a1, "isDebugEnabled"))
    return MEMORY[0x1E0C9AA70];
  v19[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80250];
  v17[0] = *MEMORY[0x1E0D80318];
  v17[1] = v2;
  v18[0] = &unk_1E8653800;
  v18[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v14;
  v19[1] = *MEMORY[0x1E0D802F0];
  v15[0] = CFSTR("BundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat_withBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  v15[1] = CFSTR("UpdateType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v6;
  v15[2] = CFSTR("StartDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_DateFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v8;
  v15[3] = CFSTR("EndDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_DateFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)eventIntervalDefinitionComplicationEvents
{
  objc_msgSend(a1, "isDebugEnabled");
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryAggregateDefinitions
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("DuetEnergyAccumulator");
  objc_msgSend(a1, "aggregateNameDuetEnergyAccumulator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)aggregateNameDuetEnergyAccumulator
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[3];
  _QWORD v20[3];
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[4];
  _QWORD v24[6];

  v24[4] = *MEMORY[0x1E0C80C00];
  v23[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80340];
  v21[0] = *MEMORY[0x1E0D80318];
  v21[1] = v2;
  v22[0] = &unk_1E86537F0;
  v22[1] = &unk_1E8634CE0;
  v21[2] = *MEMORY[0x1E0D80250];
  v22[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v14;
  v23[1] = *MEMORY[0x1E0D802F0];
  v19[0] = CFSTR("BundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat_withBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v4;
  v19[1] = CFSTR("QualificationID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v6;
  v19[2] = CFSTR("Energy");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_RealFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v9;
  v23[2] = *MEMORY[0x1E0D80228];
  v17 = &unk_1E8653810;
  v15 = *MEMORY[0x1E0D80220];
  v16 = &unk_1E8653820;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = *MEMORY[0x1E0D80238];
  v24[2] = v11;
  v24[3] = &unk_1E86525C8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)trimConditionsForEntryKey:(id)a3 forTrimDate:(id)a4
{
  uint64_t v4;
  id v5;
  void *v6;

  v4 = *MEMORY[0x1E0D80368];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLDuetService, "entryKeyForType:andName:", v4, CFSTR("DuetEnergyAccumulator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v5, "isEqualToString:", v6);

  if ((_DWORD)v4)
    return CFSTR("ID < 0");
  else
    return 0;
}

- (PLDuetService)init
{
  PLDuetService *v3;
  PLDuetService *v4;
  uint64_t v5;
  PLDuetServiceLpmSource *lpmSource;
  uint64_t v7;
  PLDuetServiceDAS *dasEvent;
  uint64_t v9;
  PLDuetServiceImpl *impl;
  objc_super v12;

  if ((objc_msgSend(MEMORY[0x1E0D80020], "nonUIBuild") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PLDuetService;
    v4 = -[PLOperator init](&v12, sel_init);
    if (v4)
    {
      v5 = objc_opt_new();
      lpmSource = v4->_lpmSource;
      v4->_lpmSource = (PLDuetServiceLpmSource *)v5;

      v7 = objc_opt_new();
      dasEvent = v4->_dasEvent;
      v4->_dasEvent = (PLDuetServiceDAS *)v7;

      v9 = objc_opt_new();
      impl = v4->_impl;
      v4->_impl = (PLDuetServiceImpl *)v9;

    }
    self = v4;
    v3 = self;
  }

  return v3;
}

- (void)initOperatorDependancies
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PLDuetService impl](self, "impl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PLDuetService impl](self, "impl");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "initOperatorDependancies:", self);

  }
  -[PLDuetService lpmSource](self, "lpmSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "initOperatorDependanciesLpmSource:", self);

  -[PLDuetService dasEvent](self, "dasEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "initOperatorDependanciesDAS:", self);

  if (objc_msgSend(MEMORY[0x1E0D80078], "hasBattery"))
    -[PLDuetService setupBatterySaverModeForNotification:](self, "setupBatterySaverModeForNotification:", CFSTR("com.apple.system.lowpowermode"));
}

- (void)setupBatterySaverModeForNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  const char *v7;
  NSObject *v8;
  id v9;
  uint32_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  _QWORD handler[5];
  id v16;
  int out_token;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  uint32_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v4;
    _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "batterysaver: setting up %@", buf, 0xCu);
  }

  out_token = -1;
  v6 = objc_retainAutorelease(v4);
  v7 = (const char *)objc_msgSend(v6, "UTF8String");
  -[PLOperator workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __54__PLDuetService_setupBatterySaverModeForNotification___block_invoke;
  handler[3] = &unk_1E8580B18;
  handler[4] = self;
  v9 = v6;
  v16 = v9;
  v10 = notify_register_dispatch(v7, &out_token, v8, handler);

  PLLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v19 = v9;
      v20 = 1024;
      v21 = v10;
      _os_log_error_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_ERROR, "batterysaver: failed to register for %@ with status %d", buf, 0x12u);
    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v9;
      _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "batterysaver: re-syncing %@", buf, 0xCu);
    }

    if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.system.lowpowermode")))
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isLowPowerModeEnabled");

      -[PLDuetService logEventForwardBatterySaverModeWithState:fromNotification:](self, "logEventForwardBatterySaverModeWithState:fromNotification:", v14, v9);
    }
    else
    {
      -[PLDuetService handleBatterySaverModeToken:withNotification:](self, "handleBatterySaverModeToken:withNotification:", out_token, v9);
    }
    PLLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v9;
      _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "batterysaver: setup complete for %@", buf, 0xCu);
    }
  }

}

uint64_t __54__PLDuetService_setupBatterySaverModeForNotification___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleBatterySaverModeToken:withNotification:", a2, *(_QWORD *)(a1 + 40));
}

- (void)handleBatterySaverModeToken:(int)a3 withNotification:(id)a4
{
  id v6;
  uint32_t state;
  uint32_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t state64;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  state64 = 0;
  state = notify_get_state(a3, &state64);
  if (state)
  {
    v8 = state;
    PLLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v14 = v6;
      v15 = 1024;
      LODWORD(v16) = v8;
      _os_log_error_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_ERROR, "batterysaver: notify_get_state failed for %@ with status %d", buf, 0x12u);
    }

  }
  else
  {
    v10 = state64;
    PLLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v14 = v6;
      v15 = 2048;
      v16 = state64;
      _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "batterysaver: callback %@=%llu", buf, 0x16u);
    }

    -[PLDuetService logEventForwardBatterySaverModeWithState:fromNotification:](self, "logEventForwardBatterySaverModeWithState:fromNotification:", v10 != 0, v6);
  }

}

- (void)logEventForwardBatterySaverModeWithState:(BOOL)a3 fromNotification:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v4 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v13 = 138412546;
    v14 = v6;
    v15 = 1024;
    v16 = v4;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "batterysaver: %@=%d", (uint8_t *)&v13, 0x12u);
  }

  +[PLOperator entryKeyForType:andName:](PLDuetService, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("BatterySaverMode"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v8);
  v10 = -[PLDuetService registrationModeStringToEnum:](self, "registrationModeStringToEnum:", v6);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("Mode"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("Value"));

  -[PLOperator logEntry:](self, "logEntry:", v9);
}

- (int64_t)registrationModeStringToEnum:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.system.lowpowermode")) ^ 1;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  -[PLDuetService impl](self, "impl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PLDuetService impl](self, "impl");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopService");

  }
  -[PLDuetService lpmSource](self, "lpmSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopService");

  -[PLDuetService dasEvent](self, "dasEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stopService");

  v7.receiver = self;
  v7.super_class = (Class)PLDuetService;
  -[PLOperator dealloc](&v7, sel_dealloc);
}

- (PLDuetServiceLpmSource)lpmSource
{
  return (PLDuetServiceLpmSource *)objc_getProperty(self, a2, 48, 1);
}

- (PLDuetServiceDAS)dasEvent
{
  return (PLDuetServiceDAS *)objc_getProperty(self, a2, 56, 1);
}

- (PLDuetServiceImpl)impl
{
  return (PLDuetServiceImpl *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
  objc_storeStrong((id *)&self->_dasEvent, 0);
  objc_storeStrong((id *)&self->_lpmSource, 0);
}

@end
