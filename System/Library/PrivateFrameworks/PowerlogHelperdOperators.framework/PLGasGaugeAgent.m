@implementation PLGasGaugeAgent

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLGasGaugeAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

- (PLGasGaugeAgent)init
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  PLGasGaugeAgent *v11;
  objc_super v13;

  if (+[PLSMCAgent supportsBasicSMC](PLSMCAgent, "supportsBasicSMC"))
  {
    v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v3)
      -[PLGasGaugeAgent init].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    v11 = 0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)PLGasGaugeAgent;
    self = -[PLAgent init](&v13, sel_init);
    v11 = self;
  }

  return v11;
}

- (void)initOperatorDependancies
{
  OUTLINED_FUNCTION_6_0(&dword_1DA9D6000, MEMORY[0x1E0C81028], a3, "PLGasGaugeAgent cannot connect to gas gauge", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)dealloc
{
  io_connect_t v3;
  objc_super v4;

  v3 = -[PLIOKitOperatorComposition conn](self->_ggComposition, "conn");
  if (v3)
    IOServiceClose(v3);
  v4.receiver = self;
  v4.super_class = (Class)PLGasGaugeAgent;
  -[PLAgent dealloc](&v4, sel_dealloc);
}

+ (id)entryEventPointDefinitions
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("MetricMonitorInstantKeys");
  +[PLGasGaugeAgent entryEventPointDefinitionGasGaugePower](PLGasGaugeAgent, "entryEventPointDefinitionGasGaugePower");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)entryEventPointDefinitionGasGaugePower
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v12[0] = *MEMORY[0x1E0D80298];
  v10 = *MEMORY[0x1E0D80318];
  v11 = &unk_1EA1DAF98;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E0D802F0];
  v8 = CFSTR("GasGaugePower");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_RealFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)logEventPointMetricMonitorInstantKeys
{
  OUTLINED_FUNCTION_6_0(&dword_1DA9D6000, MEMORY[0x1E0C81028], a3, "failed to read gasgauge power", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (PLIOKitOperatorComposition)ggComposition
{
  return self->_ggComposition;
}

- (void)setGgComposition:(id)a3
{
  objc_storeStrong((id *)&self->_ggComposition, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ggComposition, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_6_0(&dword_1DA9D6000, MEMORY[0x1E0C81028], a3, "PLGasGaugeAgent returning nil because this device has an SMC", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

@end
