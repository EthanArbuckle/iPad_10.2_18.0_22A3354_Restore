@implementation PLBatteryUIResponseTypeReduceBrightnessSuggestion

- (id)dependencies
{
  return &unk_1EA1DBDE8;
}

- (void)configure:(id)a3
{
  -[PLBatteryUIResponseTypeReduceBrightnessSuggestion setIsALSCurveHigherThanDefault:](self, "setIsALSCurveHigherThanDefault:", +[PLUtilities isALSCurveHigherThanDefault](PLUtilities, "isALSCurveHigherThanDefault", a3));
}

- (void)run
{
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, a1, a3, "Reduce Brightness Suggestion: ALS Curve is not higher than default", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (id)result
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  -[PLBatteryUIResponseTypeReduceBrightnessSuggestion setBatteryBreakdown_Last24hrs:](self, "setBatteryBreakdown_Last24hrs:", 0);
  if (!-[PLBatteryUIResponseTypeReduceBrightnessSuggestion suggest](self, "suggest"))
    return MEMORY[0x1E0C9AA70];
  ADClientSetValueForScalarKey();
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("suggestion"), CFSTR("category"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("reduceBrightness"), CFSTR("type"));
  v9 = MEMORY[0x1E0C809B0];
  v10 = v3;
  v4 = v3;
  AnalyticsSendEventLazy();
  v11[0] = CFSTR("PLBatteryUISuggestionTypeKey");
  v11[1] = CFSTR("PLBatteryUISuggestionEnergyPercentKey");
  v12[0] = &unk_1EA1C05D8;
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[PLBatteryUIResponseTypeReduceBrightnessSuggestion energyPercent](self, "energyPercent", v9, 3221225472, __59__PLBatteryUIResponseTypeReduceBrightnessSuggestion_result__block_invoke, &unk_1EA16D238);
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __59__PLBatteryUIResponseTypeReduceBrightnessSuggestion_result__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (BOOL)shouldShowSuggestionThroughOverrides
{
  _BOOL4 v2;
  void *v3;
  char v4;

  v2 = +[PLUtilities inBUIDemoMode](PLUtilities, "inBUIDemoMode");
  if (v2)
  {
    +[PLUtilities powerlogDefaultForKey:](PLUtilities, "powerlogDefaultForKey:", CFSTR("BUI_REDUCEBRIGHTNESS_SUGGESTION_SHOW"));
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

- (double)energyPercent
{
  return self->_energyPercent;
}

- (void)setEnergyPercent:(double)a3
{
  self->_energyPercent = a3;
}

- (BOOL)isALSCurveHigherThanDefault
{
  return self->_isALSCurveHigherThanDefault;
}

- (void)setIsALSCurveHigherThanDefault:(BOOL)a3
{
  self->_isALSCurveHigherThanDefault = a3;
}

- (NSDictionary)batteryBreakdown_Last24hrs
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBatteryBreakdown_Last24hrs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryBreakdown_Last24hrs, 0);
  objc_storeStrong((id *)&self->_responderService, 0);
}

@end
