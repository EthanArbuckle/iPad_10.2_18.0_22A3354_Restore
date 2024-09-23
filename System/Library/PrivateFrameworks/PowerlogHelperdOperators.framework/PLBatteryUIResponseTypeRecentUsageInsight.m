@implementation PLBatteryUIResponseTypeRecentUsageInsight

- (id)dependencies
{
  return &unk_1EA1DDA80;
}

- (void)configure:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("end"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeRecentUsageInsight setEnd:](self, "setEnd:", v7);

  -[PLBatteryUIResponseTypeRecentUsageInsight getfirstEntryTimestampFromDb](self, "getfirstEntryTimestampFromDb");
  -[PLBatteryUIResponseTypeRecentUsageInsight setFirstEntryTimestamp:](self, "setFirstEntryTimestamp:");
  objc_msgSend(MEMORY[0x1E0D7FFA0], "objectForKey:forApplicationID:synchronize:", CFSTR("LastUpgradeTimestamp"), CFSTR("com.apple.powerlogd"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  -[PLBatteryUIResponseTypeRecentUsageInsight setLastUpgradeTimestamp:](self, "setLastUpgradeTimestamp:");

  +[PLUtilities containerPath](PLUtilities, "containerPath");
  v9 = (void *)_CFPreferencesCopyValueWithContainer();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "doubleValue");
    v12 = v11;
  }
  else
  {
    v12 = 864000.0;
  }

  -[PLBatteryUIResponseTypeRecentUsageInsight setMaxTimeValBeforeUpgrade:](self, "setMaxTimeValBeforeUpgrade:", v12);
  +[PLUtilities containerPath](PLUtilities, "containerPath");
  v13 = (void *)_CFPreferencesCopyValueWithContainer();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "doubleValue");
    v16 = v15;
  }
  else
  {
    v16 = 259200.0;
  }

  -[PLBatteryUIResponseTypeRecentUsageInsight setMinTimeValBeforeUpgrade:](self, "setMinTimeValBeforeUpgrade:", v16);
  +[PLUtilities containerPath](PLUtilities, "containerPath");
  v17 = (void *)_CFPreferencesCopyValueWithContainer();
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "doubleValue");
    v20 = v19;
  }
  else
  {
    v20 = 864000.0;
  }

  -[PLBatteryUIResponseTypeRecentUsageInsight setMaxTimeValAfterUpgrade:](self, "setMaxTimeValAfterUpgrade:", v20);
  +[PLUtilities containerPath](PLUtilities, "containerPath");
  v21 = (void *)_CFPreferencesCopyValueWithContainer();
  v22 = v21;
  if (v21)
  {
    objc_msgSend(v21, "doubleValue");
    v24 = v23;
  }
  else
  {
    v24 = 86400.0;
  }

  -[PLBatteryUIResponseTypeRecentUsageInsight setMinTimeValAfterUpgrade:](self, "setMinTimeValAfterUpgrade:", v24);
  +[PLUtilities containerPath](PLUtilities, "containerPath");
  v25 = (void *)_CFPreferencesCopyValueWithContainer();
  v26 = v25;
  if (v25)
  {
    objc_msgSend(v25, "doubleValue");
    v28 = v27;
  }
  else
  {
    v28 = 0.3;
  }

  -[PLBatteryUIResponseTypeRecentUsageInsight setMinDrainPercentBeforeUpgrade:](self, "setMinDrainPercentBeforeUpgrade:", v28);
  +[PLUtilities containerPath](PLUtilities, "containerPath");
  v29 = (void *)_CFPreferencesCopyValueWithContainer();
  v30 = v29;
  v31 = 1.3;
  v32 = 1.3;
  if (v29)
  {
    objc_msgSend(v29, "doubleValue");
    v32 = v33;
  }

  -[PLBatteryUIResponseTypeRecentUsageInsight setEnergyThresholdForUpgradeInsight:](self, "setEnergyThresholdForUpgradeInsight:", v32);
  +[PLUtilities containerPath](PLUtilities, "containerPath");
  v34 = (void *)_CFPreferencesCopyValueWithContainer();
  v35 = v34;
  if (v34)
  {
    objc_msgSend(v34, "doubleValue");
    v31 = v36;
  }

  -[PLBatteryUIResponseTypeRecentUsageInsight setForegroundTimeThresholdForUpgradeInsight:](self, "setForegroundTimeThresholdForUpgradeInsight:", v31);
}

- (void)run
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_1DA9D6000, a2, OS_LOG_TYPE_DEBUG, "Recent Usage Insight: Upgrade found in bucket %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_6();
}

- (id)result
{
  void *v3;
  id v4;
  void *v6;

  -[PLBatteryUIResponseTypeRecentUsageInsight setBatteryBreakdown_Last10Days:](self, "setBatteryBreakdown_Last10Days:", 0);
  if (!-[PLBatteryUIResponseTypeRecentUsageInsight suggest](self, "suggest"))
    return (id)MEMORY[0x1E0C9AA70];
  ADClientSetValueForScalarKey();
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("insight"), CFSTR("category"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("upgradeUsage"), CFSTR("type"));
  v6 = v3;
  v4 = v3;
  AnalyticsSendEventLazy();

  return &unk_1EA1DA420;
}

id __51__PLBatteryUIResponseTypeRecentUsageInsight_result__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (BOOL)didUpgrade
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  NSObject *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  -[PLBatteryUIResponseTypeRecentUsageInsight end](self, "end");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSince1970");
  v5 = v4;
  -[PLBatteryUIResponseTypeRecentUsageInsight lastUpgradeTimestamp](self, "lastUpgradeTimestamp");
  v7 = v6;

  -[PLBatteryUIResponseTypeRecentUsageInsight lastUpgradeTimestamp](self, "lastUpgradeTimestamp");
  if (v8 == 0.0)
  {
    PLLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[PLBatteryUIResponseTypeRecentUsageInsight didUpgrade].cold.1();
  }
  else
  {
    v10 = v5 - v7;
    -[PLBatteryUIResponseTypeRecentUsageInsight minTimeValAfterUpgrade](self, "minTimeValAfterUpgrade");
    if (v10 <= v11
      || (-[PLBatteryUIResponseTypeRecentUsageInsight maxTimeValAfterUpgrade](self, "maxTimeValAfterUpgrade"), v10 >= v12))
    {
      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[PLBatteryUIResponseTypeRecentUsageInsight didUpgrade].cold.3();
    }
    else
    {
      -[PLBatteryUIResponseTypeRecentUsageInsight lastUpgradeTimestamp](self, "lastUpgradeTimestamp");
      v14 = v13;
      -[PLBatteryUIResponseTypeRecentUsageInsight firstEntryTimestamp](self, "firstEntryTimestamp");
      v16 = v14 - v15;
      -[PLBatteryUIResponseTypeRecentUsageInsight minTimeValBeforeUpgrade](self, "minTimeValBeforeUpgrade");
      if (v16 > v17)
        return 1;
      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[PLBatteryUIResponseTypeRecentUsageInsight didUpgrade].cold.2();
    }
  }

  return 0;
}

- (double)getfirstEntryTimestampFromDb
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;

  v3 = *MEMORY[0x1E0D80368];
  +[PLOperator entryKeyForType:andName:](PLAppTimeService, "entryKeyForType:andName:", *MEMORY[0x1E0D80368], CFSTR("AppRunTime"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7FF48], "entryKeyForType:andName:", v3, *MEMORY[0x1E0D80190]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7FF48], "entryKeyForType:andName:", v3, *MEMORY[0x1E0D80168]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeRecentUsageInsight responderService](self, "responderService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "storage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "entryForKey:withID:", v4, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLBatteryUIResponseTypeRecentUsageInsight responderService](self, "responderService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "storage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "entryForKey:withID:", v5, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLBatteryUIResponseTypeRecentUsageInsight responderService](self, "responderService");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "storage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "entryForKey:withID:", v6, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 9.22337204e18;
  if (v9 && v12 && v15)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("timestamp"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "doubleValue");
    v19 = v18;
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("timestamp"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "doubleValue");
    v22 = fmax(v19, v21);
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("timestamp"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "doubleValue");
    v16 = fmax(v22, v24);

  }
  return v16;
}

- (BOOL)shouldShowSuggestionThroughOverrides
{
  _BOOL4 v2;
  void *v3;
  char v4;

  v2 = +[PLUtilities inBUIDemoMode](PLUtilities, "inBUIDemoMode");
  if (v2)
  {
    +[PLUtilities powerlogDefaultForKey:](PLUtilities, "powerlogDefaultForKey:", CFSTR("BUI_RESENTUSAGE_SUGGESTION_SHOW"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLValue");

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (PLBatteryUIResponderService)responderService
{
  return (PLBatteryUIResponderService *)objc_getProperty(self, a2, 16, 1);
}

- (void)setResponderService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)suggest
{
  return self->_suggest;
}

- (void)setSuggest:(BOOL)a3
{
  self->_suggest = a3;
}

- (NSDate)end
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEnd:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (double)firstEntryTimestamp
{
  return self->_firstEntryTimestamp;
}

- (void)setFirstEntryTimestamp:(double)a3
{
  self->_firstEntryTimestamp = a3;
}

- (double)lastUpgradeTimestamp
{
  return self->_lastUpgradeTimestamp;
}

- (void)setLastUpgradeTimestamp:(double)a3
{
  self->_lastUpgradeTimestamp = a3;
}

- (double)minTimeValBeforeUpgrade
{
  return self->_minTimeValBeforeUpgrade;
}

- (void)setMinTimeValBeforeUpgrade:(double)a3
{
  self->_minTimeValBeforeUpgrade = a3;
}

- (double)maxTimeValBeforeUpgrade
{
  return self->_maxTimeValBeforeUpgrade;
}

- (void)setMaxTimeValBeforeUpgrade:(double)a3
{
  self->_maxTimeValBeforeUpgrade = a3;
}

- (double)minTimeValAfterUpgrade
{
  return self->_minTimeValAfterUpgrade;
}

- (void)setMinTimeValAfterUpgrade:(double)a3
{
  self->_minTimeValAfterUpgrade = a3;
}

- (double)maxTimeValAfterUpgrade
{
  return self->_maxTimeValAfterUpgrade;
}

- (void)setMaxTimeValAfterUpgrade:(double)a3
{
  self->_maxTimeValAfterUpgrade = a3;
}

- (double)minDrainPercentBeforeUpgrade
{
  return self->_minDrainPercentBeforeUpgrade;
}

- (void)setMinDrainPercentBeforeUpgrade:(double)a3
{
  self->_minDrainPercentBeforeUpgrade = a3;
}

- (double)energyThresholdForUpgradeInsight
{
  return self->_energyThresholdForUpgradeInsight;
}

- (void)setEnergyThresholdForUpgradeInsight:(double)a3
{
  self->_energyThresholdForUpgradeInsight = a3;
}

- (double)foregroundTimeThresholdForUpgradeInsight
{
  return self->_foregroundTimeThresholdForUpgradeInsight;
}

- (void)setForegroundTimeThresholdForUpgradeInsight:(double)a3
{
  self->_foregroundTimeThresholdForUpgradeInsight = a3;
}

- (NSMutableArray)batteryBreakdown_Last10Days
{
  return (NSMutableArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setBatteryBreakdown_Last10Days:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryBreakdown_Last10Days, 0);
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_responderService, 0);
}

- (void)didUpgrade
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "Recent Usage Insight: After upgrade time criteria not satisfied", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

@end
