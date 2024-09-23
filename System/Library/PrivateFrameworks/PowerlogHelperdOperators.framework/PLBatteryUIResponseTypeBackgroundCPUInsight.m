@implementation PLBatteryUIResponseTypeBackgroundCPUInsight

- (id)dependencies
{
  return &unk_1EA1DCD60;
}

- (void)run
{
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, a1, a3, "Background CPU Insight: Successfully retrieved 10 day breakdown from cache", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (id)result
{
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  -[PLBatteryUIResponseTypeBackgroundCPUInsight setBatteryBreakdown_Last10Days:](self, "setBatteryBreakdown_Last10Days:", 0);
  if (!-[PLBatteryUIResponseTypeBackgroundCPUInsight suggest](self, "suggest"))
    return MEMORY[0x1E0C9AA70];
  v6[0] = CFSTR("PLBatteryUISuggestionTypeKey");
  v6[1] = CFSTR("PLBatteryUIPerAppUsageKey");
  v7[0] = &unk_1EA1C1490;
  -[PLBatteryUIResponseTypeBackgroundCPUInsight perAppUsage](self, "perAppUsage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
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

- (NSMutableDictionary)perAppUsage
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPerAppUsage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSMutableArray)batteryBreakdown_Last10Days
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBatteryBreakdown_Last10Days:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryBreakdown_Last10Days, 0);
  objc_storeStrong((id *)&self->_perAppUsage, 0);
  objc_storeStrong((id *)&self->_responderService, 0);
}

@end
