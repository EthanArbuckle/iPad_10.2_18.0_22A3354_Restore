@implementation PLBatteryUIResponseTypeNoteworthyInformation

- (id)dependencies
{
  return &unk_1EA1DBDB8;
}

- (void)run
{
  double v3;
  unint64_t v4;
  unint64_t v5;
  _BOOL4 v6;
  _BOOL4 v7;
  NSObject *v8;
  _BOOL8 v9;
  int v10;
  double v11;
  __int16 v12;
  unint64_t v13;
  __int16 v14;
  unint64_t v15;
  __int16 v16;
  _BOOL4 v17;
  __int16 v18;
  _BOOL4 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (-[PLBatteryUIResponseTypeNoteworthyInformation hasNoterworthyInformationThroughOverrides](self, "hasNoterworthyInformationThroughOverrides"))
  {
    -[PLBatteryUIResponseTypeNoteworthyInformation setHasNoteworthyInformation:](self, "setHasNoteworthyInformation:", 1);
  }
  else
  {
    v3 = (double)-[PLBatteryUIResponseTypeNoteworthyInformation getUISOCLevelPercentThresholdValue](self, "getUISOCLevelPercentThresholdValue");
    v4 = -[PLBatteryUIResponseTypeNoteworthyInformation getNumDaysBelowUISOCLevelThresholdValue](self, "getNumDaysBelowUISOCLevelThresholdValue");
    v5 = -[PLBatteryUIResponseTypeNoteworthyInformation getNumDaysBelowUISOCLevel:forLastNDays:](self, "getNumDaysBelowUISOCLevel:forLastNDays:", 7, v3);
    v6 = -[PLBatteryUIResponseTypeNoteworthyInformation hasRelevantSuggestion](self, "hasRelevantSuggestion");
    v7 = -[PLBatteryUIResponseTypeNoteworthyInformation getBUIVisitDefaultValue](self, "getBUIVisitDefaultValue");
    PLLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v10 = 134219008;
      v11 = v3;
      v12 = 2048;
      v13 = v4;
      v14 = 2048;
      v15 = v5;
      v16 = 1024;
      v17 = v6;
      v18 = 1024;
      v19 = v7;
      _os_log_debug_impl(&dword_1DA9D6000, v8, OS_LOG_TYPE_DEBUG, "UISOCLevelPercentThresholdValue=%f, numDaysBelowUISOCLevelThresholdValue=%zu, numDaysBelowUISOCLevel=%zu, doesHaveRelevantSuggestion=%d, userHasVisitedBUI=%d", (uint8_t *)&v10, 0x2Cu);
    }

    v9 = v5 >= v4 && v6 && !v7;
    -[PLBatteryUIResponseTypeNoteworthyInformation setHasNoteworthyInformation:](self, "setHasNoteworthyInformation:", v9);
  }
}

- (id)result
{
  void *v3;
  void *v4;
  uint64_t v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v6 = MEMORY[0x1E0C809B0];
  AnalyticsSendEventLazy();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLBatteryUIResponseTypeNoteworthyInformation hasNoteworthyInformation](self, "hasNoteworthyInformation", v6, 3221225472, __54__PLBatteryUIResponseTypeNoteworthyInformation_result__block_invoke, &unk_1EA16D238, self, CFSTR("hasNoteworthyInformation")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __54__PLBatteryUIResponseTypeNoteworthyInformation_result__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("result");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "hasNoteworthyInformation"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (unint64_t)getNumDaysAboveDrainThreshold:(double)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  double v13;
  double v14;
  unint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[PLBatteryUIResponseTypeNoteworthyInformation getResultFromCacheForUISOCDrainResponseType](self, "getResultFromCacheForUISOCDrainResponseType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[PLBatteryUIResponseTypeNoteworthyInformation getNumDaysAboveDrainThreshold:].cold.1((uint64_t)v4, v5);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("PLBatteryUIEnergyKey"), (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "doubleValue");
        v14 = v13;

        if (v14 > a3)
          ++v9;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
    v15 = v9;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (unint64_t)getNumDaysBelowUISOCLevel:(double)a3 forLastNDays:(unint64_t)a4
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  unint64_t v8;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT datetime(timestamp, 'unixepoch', 'localtime', 'start of day'), COUNT(*) FROM PLBatteryAgent_EventBackward_BatteryUI WHERE level <= %f AND timestamp >((SELECT MAX(timestamp) FROM PLBatteryAgent_EventBackward_Battery)-%zu*86400) GROUP BY datetime(timestamp, 'unixepoch', 'localtime', 'start of day');"),
    *(_QWORD *)&a3,
    a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D80028], "sharedSQLiteConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performQuery:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v6;
    _os_log_impl(&dword_1DA9D6000, v7, OS_LOG_TYPE_DEFAULT, "queryResult=%@", buf, 0xCu);
  }

  v8 = objc_msgSend(v6, "count");
  return v8;
}

- (BOOL)hasRelevantSuggestion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[PLBatteryUIResponseTypeNoteworthyInformation getResultFromCacheForSuggestionResponseType:](self, "getResultFromCacheForSuggestionResponseType:", 13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeNoteworthyInformation getResultFromCacheForSuggestionResponseType:](self, "getResultFromCacheForSuggestionResponseType:", 14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeNoteworthyInformation getResultFromCacheForSuggestionResponseType:](self, "getResultFromCacheForSuggestionResponseType:", 15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeNoteworthyInformation getResultFromCacheForSuggestionResponseType:](self, "getResultFromCacheForSuggestionResponseType:", 17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412802;
    v13 = v3;
    v14 = 2112;
    v15 = v4;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_1DA9D6000, v7, OS_LOG_TYPE_DEFAULT, "resultAutolockSuggestion=%@, resultAutoBrightnessSuggestion=%@, resultReduceBrightnessSuggestion=%@", (uint8_t *)&v12, 0x20u);
  }

  v8 = objc_msgSend(v3, "count");
  v9 = objc_msgSend(v4, "count") + v8;
  v10 = v9 + objc_msgSend(v5, "count");
  LOBYTE(v10) = v10 + objc_msgSend(v6, "count") != 0;

  return v10;
}

- (id)getResultFromCacheForUISOCDrainResponseType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  PLBatteryUsageUIKeyFromConfiguration();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeNoteworthyInformation responderService](self, "responderService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1EA1C0380);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("result"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)getResultFromCacheForSuggestionResponseType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  PLBatteryUsageUIKeyFromConfiguration();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeNoteworthyInformation responderService](self, "responderService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "responseCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("result"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (double)getDailyPercentDrainThresholdValue
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;

  if (!+[PLUtilities inBUIDemoMode](PLUtilities, "inBUIDemoMode"))
    return 100.0;
  +[PLUtilities powerlogDefaultForKey:](PLUtilities, "powerlogDefaultForKey:", CFSTR("BUI_NOTEWORTHY_INFORMATION_DAILY_PERCENT_DRAIN_THRESHOLD"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (objc_msgSend(v2, "doubleValue"), v4 > 0.0))
  {
    objc_msgSend(v3, "doubleValue");
    v6 = v5;
  }
  else
  {
    v6 = 100.0;
  }

  return v6;
}

- (unint64_t)getNumDaysAboveDrainThresholdValue
{
  void *v2;
  void *v3;
  unint64_t v4;

  if (!+[PLUtilities inBUIDemoMode](PLUtilities, "inBUIDemoMode"))
    return 7;
  +[PLUtilities powerlogDefaultForKey:](PLUtilities, "powerlogDefaultForKey:", CFSTR("BUI_NOTEWORTHY_INFORMATION_NUM_DAYS_ABOVE_DRAIN_THRESHOLD"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && objc_msgSend(v2, "unsignedIntValue"))
    v4 = objc_msgSend(v3, "unsignedIntValue");
  else
    v4 = 7;

  return v4;
}

- (unint64_t)getUISOCLevelPercentThresholdValue
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  unint64_t v6;

  if (!+[PLUtilities inBUIDemoMode](PLUtilities, "inBUIDemoMode"))
    return 10;
  +[PLUtilities powerlogDefaultForKey:](PLUtilities, "powerlogDefaultForKey:", CFSTR("BUI_NOTEWORTHY_INFORMATION_UISOC_LEVEL_THRESHOLD"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (objc_msgSend(v2, "doubleValue"), v4 > 0.0))
  {
    objc_msgSend(v3, "doubleValue");
    v6 = (unint64_t)v5;
  }
  else
  {
    v6 = 10;
  }

  return v6;
}

- (unint64_t)getNumDaysBelowUISOCLevelThresholdValue
{
  void *v2;
  void *v3;
  unint64_t v4;

  if (!+[PLUtilities inBUIDemoMode](PLUtilities, "inBUIDemoMode"))
    return 5;
  +[PLUtilities powerlogDefaultForKey:](PLUtilities, "powerlogDefaultForKey:", CFSTR("BUI_NOTEWORTHY_INFORMATION_NUM_DAYS_BELOW_UISOC_LEVEL_THRESHOLD"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && objc_msgSend(v2, "unsignedIntValue"))
    v4 = objc_msgSend(v3, "unsignedIntValue");
  else
    v4 = 5;

  return v4;
}

- (BOOL)getBUIVisitDefaultValue
{
  void *v2;
  char v3;
  NSObject *v4;

  objc_msgSend(MEMORY[0x1E0D7FFA0], "objectForKey:forApplicationID:synchronize:", CFSTR("BUIVisitDefaultKey"), CFSTR("com.apple.powerlogd"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  PLLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[PLBatteryUIResponseTypeNoteworthyInformation getBUIVisitDefaultValue].cold.1(v3, v4);

  return v3;
}

- (BOOL)hasNoterworthyInformationThroughOverrides
{
  _BOOL4 v2;
  void *v3;
  char v4;

  v2 = +[PLUtilities inBUIDemoMode](PLUtilities, "inBUIDemoMode");
  if (v2)
  {
    +[PLUtilities powerlogDefaultForKey:](PLUtilities, "powerlogDefaultForKey:", CFSTR("BUI_HAS_NOTEWORTHY_INFORMATION"));
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

- (BOOL)hasNoteworthyInformation
{
  return self->_hasNoteworthyInformation;
}

- (void)setHasNoteworthyInformation:(BOOL)a3
{
  self->_hasNoteworthyInformation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responderService, 0);
}

- (void)getNumDaysAboveDrainThreshold:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1DA9D6000, a2, OS_LOG_TYPE_DEBUG, "UISOCDrainResult=%@", (uint8_t *)&v2, 0xCu);
}

- (void)getBUIVisitDefaultValue
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1DA9D6000, a2, OS_LOG_TYPE_DEBUG, "BUIVisitDefaultValue=%d", (uint8_t *)v2, 8u);
}

@end
