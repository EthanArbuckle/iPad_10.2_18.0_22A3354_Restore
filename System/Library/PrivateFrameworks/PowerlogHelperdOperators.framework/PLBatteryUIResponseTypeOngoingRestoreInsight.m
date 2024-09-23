@implementation PLBatteryUIResponseTypeOngoingRestoreInsight

- (id)dependencies
{
  return &unk_1EA1DC838;
}

- (void)configure:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (-[PLBatteryUIResponseTypeOngoingRestoreInsight shouldShowSuggestionThroughOverrides](self, "shouldShowSuggestionThroughOverrides"))
  {
    -[PLBatteryUIResponseTypeOngoingRestoreInsight setSuggest:](self, "setSuggest:", 1);
  }
  else if (_os_feature_enabled_impl())
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("end"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "doubleValue");
    v6 = v5;

    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBatteryUIResponseTypeOngoingRestoreInsight setEnd:](self, "setEnd:", v7);

    objc_msgSend(MEMORY[0x1E0D7FFA0], "objectForKey:forApplicationID:synchronize:", CFSTR("LastUpgradeTimestamp"), CFSTR("com.apple.powerlogd"), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    -[PLBatteryUIResponseTypeOngoingRestoreInsight setLastUpgradeTimestamp:](self, "setLastUpgradeTimestamp:");

  }
}

- (void)run
{
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, a1, a3, "OngoingRestoreInsight: Restore occured more than a week ago", a5, a6, a7, a8, 0);
}

void __51__PLBatteryUIResponseTypeOngoingRestoreInsight_run__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  float v18;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("DeviceSetup"));

  if (v8)
  {
    PLLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __51__PLBatteryUIResponseTypeOngoingRestoreInsight_run__block_invoke_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "floatValue");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v18 >= 1.0;

    *a4 = 1;
  }

}

- (id)result
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  if (!-[PLBatteryUIResponseTypeOngoingRestoreInsight suggest](self, "suggest"))
    return (id)MEMORY[0x1E0C9AA70];
  ADClientSetValueForScalarKey();
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("insight"), CFSTR("category"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("ongoingRestore"), CFSTR("type"));
  v9 = v3;
  v4 = v3;
  AnalyticsSendEventLazy();
  v5 = (void *)MEMORY[0x1E0C99D68];
  -[PLBatteryUIResponseTypeOngoingRestoreInsight lastUpgradeTimestamp](self, "lastUpgradeTimestamp");
  objc_msgSend(v5, "dateWithTimeIntervalSince1970:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v6);

  AnalyticsSendEventLazy();
  return &unk_1EA1D8670;
}

id __54__PLBatteryUIResponseTypeOngoingRestoreInsight_result__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __54__PLBatteryUIResponseTypeOngoingRestoreInsight_result__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("duration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (BOOL)shouldShowSuggestionThroughOverrides
{
  _BOOL4 v2;
  void *v3;
  char v4;

  v2 = +[PLUtilities inBUIDemoMode](PLUtilities, "inBUIDemoMode");
  if (v2)
  {
    +[PLUtilities powerlogDefaultForKey:](PLUtilities, "powerlogDefaultForKey:", CFSTR("BUI_ONGOINGRESTORE_SUGGESTION_SHOW"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLValue");

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (BOOL)didUpgradeInLast:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  NSObject *v10;

  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSince1970");
  v7 = v6;
  -[PLBatteryUIResponseTypeOngoingRestoreInsight lastUpgradeTimestamp](self, "lastUpgradeTimestamp");
  v9 = v7 - v8;

  PLLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[PLBatteryUIResponseTypeOngoingRestoreInsight didUpgradeInLast:].cold.1(self);

  return v9 <= a3;
}

- (BOOL)didRestore
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  BOOL v7;

  -[PLBatteryUIResponseTypeOngoingRestoreInsight responderService](self, "responderService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT DISTINCT Build FROM PLConfigAgent_EventNone_Config"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entriesForKey:withQuery:", CFSTR("PLConfigAgent_EventNone_Config"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[PLBatteryUIResponseTypeOngoingRestoreInsight didRestore].cold.1(v5);

  v7 = (unint64_t)objc_msgSend(v5, "count") < 2;
  return v7;
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

- (double)lastUpgradeTimestamp
{
  return self->_lastUpgradeTimestamp;
}

- (void)setLastUpgradeTimestamp:(double)a3
{
  self->_lastUpgradeTimestamp = a3;
}

- (NSDictionary)batteryBreakdown_Last24hrs
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBatteryBreakdown_Last24hrs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryBreakdown_Last24hrs, 0);
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_responderService, 0);
}

void __51__PLBatteryUIResponseTypeOngoingRestoreInsight_run__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, a1, a3, "OngoingRestoreInsight: DeviceSetup entity in the breakdown", a5, a6, a7, a8, 0);
}

- (void)didUpgradeInLast:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  os_log_t v2;
  os_log_type_t v3;
  const char *v4;
  uint8_t *v5;

  objc_msgSend(a1, "lastUpgradeTimestamp");
  OUTLINED_FUNCTION_1_1();
  _os_log_debug_impl(v1, v2, v3, v4, v5, 0x16u);
}

- (void)didRestore
{
  void *v1;
  os_log_t v2;
  os_log_type_t v3;
  const char *v4;
  uint8_t *v5;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_1_1();
  _os_log_debug_impl(v1, v2, v3, v4, v5, 0xCu);
}

@end
