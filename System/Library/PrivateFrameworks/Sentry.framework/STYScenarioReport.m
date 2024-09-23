@implementation STYScenarioReport

- (STYScenarioReport)initWithScenario:(id)a3
{
  id v5;
  STYScenarioReport *v6;
  STYScenarioReport *v7;
  STYScenarioReport *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)STYScenarioReport;
  v6 = -[STYScenarioReport init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_scenario, a3);
    v8 = v7;
  }

  return v7;
}

- (STYScenarioReport)initWithSignpostInterval:(id)a3 scenario:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  char *v10;
  float v11;
  void *v12;
  int v13;
  float *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  float v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  id v30;
  int v31;
  void *v32;
  int v33;
  int v34;
  uint64_t v40;
  void *v41;
  char *v42;
  objc_super v44;

  v8 = a3;
  v9 = a4;
  v44.receiver = self;
  v44.super_class = (Class)STYScenarioReport;
  v10 = -[STYScenarioReport init](&v44, sel_init);
  if (v10)
  {
    v11 = machCtsTimeToMs(objc_msgSend(v8, "durationMachContinuousTime"));
    objc_storeStrong((id *)v10 + 6, a4);
    *((float *)v10 + 2) = v11;
    *((_QWORD *)v10 + 3) = objc_msgSend(v8, "startMachContinuousTime");
    *((_QWORD *)v10 + 4) = objc_msgSend(v8, "endMachContinuousTime");
    mach_get_times();
    *(int64x2_t *)(v10 + 24) = vaddq_s64(vdupq_n_s64(0), *(int64x2_t *)(v10 + 24));
    +[STYUserScenarioCache sharedCache](STYUserScenarioCache, "sharedCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "latencyGoalsForSignpostInterval:", v8);
    *((_DWORD *)v10 + 3) = v13;
    v14 = (float *)(v10 + 12);

    +[STYUserScenarioCache sharedCache](STYUserScenarioCache, "sharedCache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "issueCategoryForSignpostInterval:", v8);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)*((_QWORD *)v10 + 5);
    *((_QWORD *)v10 + 5) = v16;

    if (!+[STYDeviceInfo isMemoryConstrained](STYDeviceInfo, "isMemoryConstrained"))
    {
      objc_msgSend(v8, "subsystem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "isEqualToString:", CFSTR("com.apple.SpringBoard")))
      {

      }
      else
      {
        objc_msgSend(v8, "subsystem");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("com.apple.app_launch_measurement"));

        if ((v20 & 1) == 0)
        {
          +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "logHandle");
          v22 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            -[STYScenarioReport initWithSignpostInterval:scenario:error:].cold.3(v22, v23, v24);

          v25 = *v14 / 1.6;
          *v14 = v25;
        }
      }
    }
    +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper", 0, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "logHandle");
    v27 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      -[STYScenarioReport initWithSignpostInterval:scenario:error:].cold.2(v9, v27);

    +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "logHandle");
    v29 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      -[STYScenarioReport initWithSignpostInterval:scenario:error:].cold.1(v9, (float *)v10 + 3, v29);

    if (objc_msgSend(v9, "kpi") == -1001)
    {
      v30 = v8;
      objc_msgSend(v30, "frameRate");
      *((_DWORD *)v10 + 4) = v31;
      +[STYUserScenarioCache sharedCache](STYUserScenarioCache, "sharedCache");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "framerateGoalsForSignpostInterval:", v30);
      v34 = v33;

      *((_DWORD *)v10 + 5) = v34;
    }
    else
    {
      __asm { FMOV            V0.2S, #-1.0 }
      *((_QWORD *)v10 + 2) = _D0;
    }
    objc_storeStrong((id *)v10 + 8, a3);
    symptomsSignatureForInterval(v8);
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = (void *)*((_QWORD *)v10 + 9);
    *((_QWORD *)v10 + 9) = v40;

    v42 = v10;
  }

  return (STYScenarioReport *)v10;
}

- (STYScenarioReport)initWithSignpostEvent:(id)a3 scenario:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  STYScenarioReport *v9;
  STYScenarioReport *v10;
  uint64_t v16;
  NSMutableDictionary *symptomsSignature;
  STYScenarioReport *v18;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)STYScenarioReport;
  v9 = -[STYScenarioReport init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_scenario, a4);
    v10->_scenarioStartTime = 0;
    v10->_scenarioEndTime = mach_absolute_time();
    __asm { FMOV            V0.2S, #-1.0 }
    *(_QWORD *)&v10->_observedFps = _D0;
    symptomsSignatureForEvent(v7);
    v16 = objc_claimAutoreleasedReturnValue();
    symptomsSignature = v10->_symptomsSignature;
    v10->_symptomsSignature = (NSMutableDictionary *)v16;

    v18 = v10;
  }

  return v10;
}

- (id)convertDictionaryToString:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v6;

  v6 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", a3, 0, &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v3, 4);

  return v4;
}

+ (id)reportFromSignpostEvent:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  STYScenarioReport *v7;

  v5 = a3;
  +[STYUserScenario scenarioFromSignpostEvent:error:](STYUserScenario, "scenarioFromSignpostEvent:error:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = -[STYScenarioReport initWithSignpostEvent:scenario:error:]([STYScenarioReport alloc], "initWithSignpostEvent:scenario:error:", v5, v6, a4);
  else
    v7 = 0;

  return v7;
}

+ (id)reportFromSignpostInterval:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  STYScenarioReport *v7;

  v5 = a3;
  +[STYUserScenario scenarioFromSignpostInterval:error:](STYUserScenario, "scenarioFromSignpostInterval:error:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = -[STYScenarioReport initWithSignpostInterval:scenario:error:]([STYScenarioReport alloc], "initWithSignpostInterval:scenario:error:", v5, v6, a4);
  else
    v7 = 0;

  return v7;
}

- (float)observedLatencyInMs
{
  return self->_observedLatencyInMs;
}

- (float)targetLatencyInMs
{
  return self->_targetLatencyInMs;
}

- (void)setTargetLatencyInMs:(float)a3
{
  self->_targetLatencyInMs = a3;
}

- (float)observedFps
{
  return self->_observedFps;
}

- (float)targetFps
{
  return self->_targetFps;
}

- (unint64_t)scenarioStartTime
{
  return self->_scenarioStartTime;
}

- (unint64_t)scenarioEndTime
{
  return self->_scenarioEndTime;
}

- (NSString)issueCategory
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (STYUserScenario)scenario
{
  return (STYUserScenario *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)metadata
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (SignpostInterval)interval
{
  return (SignpostInterval *)objc_getProperty(self, a2, 64, 1);
}

- (void)setInterval:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSMutableDictionary)symptomsSignature
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSymptomsSignature:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symptomsSignature, 0);
  objc_storeStrong((id *)&self->_interval, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_scenario, 0);
  objc_storeStrong((id *)&self->_issueCategory, 0);
}

- (void)initWithSignpostInterval:(void *)a1 scenario:(float *)a2 error:(NSObject *)a3 .cold.1(void *a1, float *a2, NSObject *a3)
{
  void *v5;
  double v6;
  int v7;
  void *v8;
  __int16 v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "scenarioID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *a2;
  v7 = 138412546;
  v8 = v5;
  v9 = 2048;
  v10 = v6;
  _os_log_debug_impl(&dword_1CB87B000, a3, OS_LOG_TYPE_DEBUG, "[Signpost: %@] The target latency is %.0f ms", (uint8_t *)&v7, 0x16u);

}

- (void)initWithSignpostInterval:(void *)a1 scenario:(NSObject *)a2 error:.cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "scenarioID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_0(&dword_1CB87B000, a2, v4, "[Signpost: %@] Signpost interval is whitelisted", (uint8_t *)&v5);

}

- (void)initWithSignpostInterval:(NSObject *)a1 scenario:(uint64_t)a2 error:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = 0x3FF999999999999ALL;
  OUTLINED_FUNCTION_0_0(&dword_1CB87B000, a1, a3, "Device is not memory constrained reducing the threshold by a fraction of %f", (uint8_t *)&v3);
}

@end
