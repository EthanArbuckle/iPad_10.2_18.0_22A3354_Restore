@implementation STYPerformanceChecker

+ (id)sharedPerfChecker
{
  if (sharedPerfChecker_onceToken != -1)
    dispatch_once(&sharedPerfChecker_onceToken, &__block_literal_global_3);
  return (id)sharedPerfChecker_sharedChecker;
}

void __42__STYPerformanceChecker_sharedPerfChecker__block_invoke()
{
  STYPerformanceChecker *v0;
  void *v1;
  NSObject *v2;
  dispatch_queue_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(STYPerformanceChecker);
  v1 = (void *)sharedPerfChecker_sharedChecker;
  sharedPerfChecker_sharedChecker = (uint64_t)v0;

  if (sharedPerfChecker_sharedChecker)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, -15);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = dispatch_queue_create("com.apple.Sentry.Frameworking.framework.STYPerformanceChecker", v2);
    objc_msgSend((id)sharedPerfChecker_sharedChecker, "setSerialUtilityQueue:", v3);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)sharedPerfChecker_sharedChecker, "setPerfCheckerErrors:", v4);

    v14[0] = &unk_1E86A4210;
    v14[1] = &unk_1E86A4210;
    v15[0] = CFSTR("Encountered unexpected configuration error.");
    v15[1] = CFSTR("System is under memory pressure.");
    v14[2] = &unk_1E86A4228;
    v15[2] = CFSTR("System is under thermal pressure.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)sharedPerfChecker_sharedChecker, "setPerfCheckerErrors:", v5);

    startMonitoringSystemConditions();
    objc_msgSend((id)sharedPerfChecker_sharedChecker, "setUnderThermalPressure:", 0);
    objc_msgSend((id)sharedPerfChecker_sharedChecker, "setUnderMemoryPressure:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "addObserverForName:object:queue:usingBlock:", kSTYNoMemoryPressureNotification, 0, 0, &__block_literal_global_16);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v8, "addObserverForName:object:queue:usingBlock:", kSTYHeavyMemoryPressureNotification, 0, 0, &__block_literal_global_17);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v10, "addObserverForName:object:queue:usingBlock:", kSTYNoThermalPressureNotification, 0, 0, &__block_literal_global_18);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v12, "addObserverForName:object:queue:usingBlock:", kSTYHeavyThermalPressureNotification, 0, 0, &__block_literal_global_19);

  }
}

uint64_t __42__STYPerformanceChecker_sharedPerfChecker__block_invoke_14()
{
  return objc_msgSend((id)sharedPerfChecker_sharedChecker, "setUnderMemoryPressure:", 0);
}

uint64_t __42__STYPerformanceChecker_sharedPerfChecker__block_invoke_2()
{
  return objc_msgSend((id)sharedPerfChecker_sharedChecker, "setUnderMemoryPressure:", 1);
}

uint64_t __42__STYPerformanceChecker_sharedPerfChecker__block_invoke_3()
{
  return objc_msgSend((id)sharedPerfChecker_sharedChecker, "setUnderThermalPressure:", 0);
}

uint64_t __42__STYPerformanceChecker_sharedPerfChecker__block_invoke_4()
{
  return objc_msgSend((id)sharedPerfChecker_sharedChecker, "setUnderThermalPressure:", 1);
}

- (void)checkPerformanceOfScenarioReport:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v6 = a4;
  objc_msgSend(v11, "scenario");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "kpi");

  if (v8 == -1001)
  {
    -[STYPerformanceChecker checkFramerateOfAnimationScenario:completionHandler:](self, "checkFramerateOfAnimationScenario:completionHandler:", v11, v6);
  }
  else
  {
    objc_msgSend(v11, "scenario");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "kpi");

    if (v10 == -1000)
      -[STYPerformanceChecker checkLatencyOfResponsivenessScenario:completionHandler:](self, "checkLatencyOfResponsivenessScenario:completionHandler:", v11, v6);
    else
      -[STYPerformanceChecker reportError:report:completionHandler:](self, "reportError:report:completionHandler:", -100001, v11, v6);
  }

}

- (void)reportError:(int64_t)a3 report:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *, id);
  void *v10;
  NSObject *v11;
  void *v12;
  NSDictionary *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSDictionary *perfCheckerErrors;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  int64_t v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void (**)(id, _QWORD, void *, id))a5;
  +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logHandle");
  v11 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v8, "scenario");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "scenarioID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    perfCheckerErrors = self->_perfCheckerErrors;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringValue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary valueForKey:](perfCheckerErrors, "valueForKey:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v29 = v20;
    v30 = 2048;
    v31 = a3;
    v32 = 2112;
    v33 = v24;
    _os_log_error_impl(&dword_1CB87B000, v11, OS_LOG_TYPE_ERROR, "Encountered error conditions while checking performance of %@ :  %ld / %@", buf, 0x20u);

  }
  v26 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = self->_perfCheckerErrors;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary valueForKey:](v13, "valueForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", v16, &stru_1E86A0F60, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", STYPerformanceCheckerErrorDomain, a3, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, 0, v19, v8);

}

- (void)checkLatencyOfResponsivenessScenario:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *serialUtilityQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  serialUtilityQueue = self->_serialUtilityQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__STYPerformanceChecker_checkLatencyOfResponsivenessScenario_completionHandler___block_invoke;
  block[3] = &unk_1E86A0A38;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(serialUtilityQueue, block);

}

uint64_t __80__STYPerformanceChecker_checkLatencyOfResponsivenessScenario_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  float v4;
  float v5;
  float v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "triage:", *(_QWORD *)(a1 + 40));
  if (v2)
    return objc_msgSend(*(id *)(a1 + 32), "reportError:report:completionHandler:", v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "observedLatencyInMs");
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 40), "targetLatencyInMs");
  return (*(uint64_t (**)(_QWORD, BOOL, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v5 < v6, 0, *(_QWORD *)(a1 + 40));
}

- (void)checkFramerateOfAnimationScenario:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *serialUtilityQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  serialUtilityQueue = self->_serialUtilityQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__STYPerformanceChecker_checkFramerateOfAnimationScenario_completionHandler___block_invoke;
  block[3] = &unk_1E86A0A38;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(serialUtilityQueue, block);

}

uint64_t __77__STYPerformanceChecker_checkFramerateOfAnimationScenario_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  float v4;
  float v5;
  float v6;
  float v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  float v13;
  double v14;
  float v15;
  void *v16;
  void *v17;
  float v18;
  double v19;
  float v20;
  int v21;
  void *v22;
  __int16 v23;
  double v24;
  __int16 v25;
  double v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "triage:", *(_QWORD *)(a1 + 40));
  if (v2)
    return objc_msgSend(*(id *)(a1 + 32), "reportError:report:completionHandler:", v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "observedFps");
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 40), "targetFps");
  v7 = v6;
  +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logHandle");
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v5 <= v7)
  {
    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 40), "scenario");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "scenarioID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "observedFps");
      v19 = v18;
      objc_msgSend(*(id *)(a1 + 40), "targetFps");
      v21 = 138412802;
      v22 = v17;
      v23 = 2048;
      v24 = v19;
      v25 = 2048;
      v26 = v20;
      _os_log_impl(&dword_1CB87B000, v9, OS_LOG_TYPE_DEFAULT, " %@'s observed framerate of %.0f was below threshold of %.0f ", (uint8_t *)&v21, 0x20u);

    }
  }
  else if (v10)
  {
    objc_msgSend(*(id *)(a1 + 40), "scenario");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scenarioID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "observedFps");
    v14 = v13;
    objc_msgSend(*(id *)(a1 + 40), "targetFps");
    v21 = 138412802;
    v22 = v12;
    v23 = 2048;
    v24 = v14;
    v25 = 2048;
    v26 = v15;
    _os_log_impl(&dword_1CB87B000, v9, OS_LOG_TYPE_DEFAULT, " %@'s observed framerate of %.0f was above threshold of %.0f ", (uint8_t *)&v21, 0x20u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (int64_t)triage:(id)a3
{
  if (self->_underThermalPressure)
    return -1003;
  if (self->_underMemoryPressure)
    return -1002;
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  stopMonitoringSystemConditions();
  v3.receiver = self;
  v3.super_class = (Class)STYPerformanceChecker;
  -[STYPerformanceChecker dealloc](&v3, sel_dealloc);
}

- (NSDictionary)perfCheckerErrors
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPerfCheckerErrors:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (OS_dispatch_queue)serialUtilityQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSerialUtilityQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)underMemoryPressure
{
  return self->_underMemoryPressure;
}

- (void)setUnderMemoryPressure:(BOOL)a3
{
  self->_underMemoryPressure = a3;
}

- (BOOL)underThermalPressure
{
  return self->_underThermalPressure;
}

- (void)setUnderThermalPressure:(BOOL)a3
{
  self->_underThermalPressure = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialUtilityQueue, 0);
  objc_storeStrong((id *)&self->_perfCheckerErrors, 0);
}

@end
