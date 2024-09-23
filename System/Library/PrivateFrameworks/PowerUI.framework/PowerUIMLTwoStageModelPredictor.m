@implementation PowerUIMLTwoStageModelPredictor

- (MLModel)engageModel
{
  __objc2_class **v3;
  MLModel *v4;
  MLModel *engageModel;
  MLModel *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  MLModel *v14;
  MLModel *v15;
  double v16;
  NSObject *v17;
  MLModel *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __objc2_class *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *log;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  uint8_t buf[4];
  const __CFString *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v3 = off_24D3FB000;
  +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:](PowerUISmartChargeUtilities, "logMemoryUsageInternalForEvent:", CFSTR("Beginning of engageModel"));
  os_unfair_lock_lock(&self->_loadModelLock);
  if (!self->_engageModel)
  {
    -[PowerUITrialManager loadTrialEngageModelByDeletingExistingModel:](self->_trialManager, "loadTrialEngageModelByDeletingExistingModel:", 0);
    v4 = (MLModel *)objc_claimAutoreleasedReturnValue();
    engageModel = self->_engageModel;
    self->_engageModel = v4;

    v6 = self->_engageModel;
    v7 = self->_log;
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_215A71000, v7, OS_LOG_TYPE_DEFAULT, "Trial engage model found!", buf, 2u);
      }
      v9 = 0;
      v10 = 0;
    }
    else
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_215A71000, v7, OS_LOG_TYPE_DEFAULT, "Trial engage model not found...falling back to default model", buf, 2u);
      }
      v11 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "pathForResource:ofType:", CFSTR("engageModel"), CFSTR("mlmodelc"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "fileURLWithPath:", v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = 0;
      objc_msgSend(MEMORY[0x24BDBFFC8], "modelWithContentsOfURL:error:", v9, &v37);
      v14 = (MLModel *)objc_claimAutoreleasedReturnValue();
      v10 = v37;
      v15 = self->_engageModel;
      self->_engageModel = v14;

      if (v10 && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
        -[PowerUIMLTwoStageModelPredictor engageModel].cold.1();
    }
    -[PowerUIMLTwoStageModelPredictor loadThresholdForModel:](self, "loadThresholdForModel:", self->_engageModel);
    self->_threshold = v16;
    v17 = self->_log;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = self->_engageModel;
      log = v17;
      -[MLModel modelDescription](v18, "modelDescription");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "metadata");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *MEMORY[0x24BDBFF38];
      objc_msgSend(v34, "objectForKeyedSubscript:", *MEMORY[0x24BDBFF38]);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("model_version"));
      v36 = v10;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLModel modelDescription](self->_engageModel, "modelDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "metadata");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKeyedSubscript:", v19);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("bolt_id"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_threshold);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v39 = CFSTR("engageModel");
      v40 = 2112;
      v41 = v20;
      v42 = 2112;
      v43 = v24;
      v44 = 2112;
      v45 = v25;
      _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Engagement model: %@.%@ from bolt job = %@ (threshold = %@)", buf, 0x2Au);

      v3 = off_24D3FB000;
      v10 = v36;

    }
    else
    {
      v19 = *MEMORY[0x24BDBFF38];
    }
    v26 = v3[12];
    -[MLModel modelDescription](self->_engageModel, "modelDescription");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "metadata");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKeyedSubscript:", v19);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("model_version"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[__objc2_class setString:forPreferenceKey:inDomain:](v26, "setString:forPreferenceKey:inDomain:", v30, CFSTR("engageBoltID"), self->_defaultsDomain);

  }
  os_unfair_lock_unlock(&self->_loadModelLock);
  -[__objc2_class logMemoryUsageInternalForEvent:](v3[12], "logMemoryUsageInternalForEvent:", CFSTR("End of loadModelFromPath"));
  return self->_engageModel;
}

- (MLModel)durationModel
{
  __objc2_class **v3;
  MLModel *v4;
  MLModel *durationModel;
  MLModel *v6;
  NSObject *log;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  MLModel *v13;
  MLModel *v14;
  double v15;
  NSObject *v16;
  MLModel *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __objc2_class *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  uint8_t buf[4];
  const __CFString *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v3 = off_24D3FB000;
  +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:](PowerUISmartChargeUtilities, "logMemoryUsageInternalForEvent:", CFSTR("Beginning of durationModel"));
  os_unfair_lock_lock(&self->_loadModelLock);
  if (!self->_durationModel)
  {
    -[PowerUITrialManager loadTrialDurationModelByDeletingExistingModel:](self->_trialManager, "loadTrialDurationModelByDeletingExistingModel:", 0);
    v4 = (MLModel *)objc_claimAutoreleasedReturnValue();
    durationModel = self->_durationModel;
    self->_durationModel = v4;

    v6 = self->_durationModel;
    log = self->_log;
    v8 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Trial duration model found!", buf, 2u);
      }
    }
    else
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Trial duration model not found...falling back to default model", buf, 2u);
      }
      v9 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "pathForResource:ofType:", CFSTR("durationModel"), CFSTR("mlmodelc"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "fileURLWithPath:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBFFC8], "modelWithContentsOfURL:error:", v12, 0);
      v13 = (MLModel *)objc_claimAutoreleasedReturnValue();
      v14 = self->_durationModel;
      self->_durationModel = v13;

    }
    -[PowerUIMLTwoStageModelPredictor loadAdjustedHoursForModel:](self, "loadAdjustedHoursForModel:", self->_durationModel);
    self->_adjustedDuration = v15;
    v16 = self->_log;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = self->_durationModel;
      v18 = v16;
      -[MLModel modelDescription](v17, "modelDescription");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "metadata");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *MEMORY[0x24BDBFF38];
      objc_msgSend(v33, "objectForKeyedSubscript:", *MEMORY[0x24BDBFF38]);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("model_version"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLModel modelDescription](self->_durationModel, "modelDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "metadata");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKeyedSubscript:", v19);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("bolt_id"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_adjustedDuration);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v36 = CFSTR("durationModel");
      v37 = 2112;
      v38 = v20;
      v39 = 2112;
      v40 = v24;
      v41 = 2112;
      v42 = v25;
      _os_log_impl(&dword_215A71000, v18, OS_LOG_TYPE_DEFAULT, "Duration model: %@.%@ from bolt job = %@ (adjusted duration = %@)", buf, 0x2Au);

      v3 = off_24D3FB000;
    }
    else
    {
      v19 = *MEMORY[0x24BDBFF38];
    }
    v26 = v3[12];
    -[MLModel modelDescription](self->_durationModel, "modelDescription");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "metadata");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKeyedSubscript:", v19);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("model_version"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[__objc2_class setString:forPreferenceKey:inDomain:](v26, "setString:forPreferenceKey:inDomain:", v30, CFSTR("durationBoltID"), self->_defaultsDomain);

  }
  os_unfair_lock_unlock(&self->_loadModelLock);
  -[__objc2_class logMemoryUsageInternalForEvent:](v3[12], "logMemoryUsageInternalForEvent:", CFSTR("End of durationModel"));
  return self->_durationModel;
}

- (id)timeStringFromDate:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = timeStringFromDate__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&timeStringFromDate__onceToken, &__block_literal_global_1);
  objc_msgSend((id)timeStringFromDate__formatter, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __54__PowerUIMLTwoStageModelPredictor_timeStringFromDate___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)timeStringFromDate__formatter;
  timeStringFromDate__formatter = (uint64_t)v0;

  objc_msgSend((id)timeStringFromDate__formatter, "setDateStyle:", 1);
  return objc_msgSend((id)timeStringFromDate__formatter, "setTimeStyle:", 1);
}

- (PowerUIMLTwoStageModelPredictor)initWithDefaultsDomain:(id)a3 withContextStore:(id)a4 withTrialManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  PowerUIMLTwoStageModelPredictor *v12;
  PowerUIMLTwoStageModelPredictor *v13;
  os_log_t v14;
  OS_os_log *log;
  os_log_t v16;
  OS_os_log *statusLog;
  uint64_t v18;
  NSDate *deadline;
  void *v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  uint64_t v25;
  NSNumber *confidenceOverride;
  uint64_t v27;
  NSNumber *durationOverride;
  objc_super v30;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v30.receiver = self;
  v30.super_class = (Class)PowerUIMLTwoStageModelPredictor;
  v12 = -[PowerUIMLTwoStageModelPredictor init](&v30, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_loadModelLock._os_unfair_lock_opaque = 0;
    v14 = os_log_create("com.apple.powerui.smartcharging", "mltwostagemodelpredictor");
    log = v13->_log;
    v13->_log = (OS_os_log *)v14;

    v16 = os_log_create("com.apple.powerui.smartcharging", "mltwostagemodelpredictorStatusLog");
    statusLog = v13->_statusLog;
    v13->_statusLog = (OS_os_log *)v16;

    objc_storeStrong((id *)&v13->_defaultsDomain, a3);
    objc_storeStrong((id *)&v13->_context, a4);
    +[PowerUISmartChargeUtilities dateForPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "dateForPreferenceKey:inDomain:", CFSTR("twoStageModelOutput"), v13->_defaultsDomain);
    v18 = objc_claimAutoreleasedReturnValue();
    deadline = v13->_deadline;
    v13->_deadline = (NSDate *)v18;

    +[PowerUISmartChargeUtilities numberForPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "numberForPreferenceKey:inDomain:", CFSTR("twoStageModelEngagementResult"), v13->_defaultsDomain);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "doubleValue");
    v13->_lastEngagementResult = v21;

    +[PowerUISmartChargeUtilities numberForPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "numberForPreferenceKey:inDomain:", CFSTR("twoStageModelDurationResult"), v13->_defaultsDomain);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "doubleValue");
    v13->_lastDurationResult = v23;

    objc_storeStrong((id *)&v13->_trialManager, a5);
    -[PowerUIMLTwoStageModelPredictor loadMinInputChargeDuration](v13, "loadMinInputChargeDuration");
    v13->_minInputChargeDuration = v24;
    v13->_threshold = 1.0;
    +[PowerUISmartChargeUtilities numberForPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "numberForPreferenceKey:inDomain:", CFSTR("twoStageModelConfidenceOverride"), v13->_defaultsDomain);
    v25 = objc_claimAutoreleasedReturnValue();
    confidenceOverride = v13->_confidenceOverride;
    v13->_confidenceOverride = (NSNumber *)v25;

    +[PowerUISmartChargeUtilities numberForPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "numberForPreferenceKey:inDomain:", CFSTR("twoStageModelDurationOverride"), v13->_defaultsDomain);
    v27 = objc_claimAutoreleasedReturnValue();
    durationOverride = v13->_durationOverride;
    v13->_durationOverride = (NSNumber *)v27;

  }
  return v13;
}

- (unint64_t)predictorType
{
  return 2;
}

- (void)loadTrial
{
  MLModel *v3;
  MLModel *engageModel;
  MLModel *v5;
  MLModel *durationModel;
  double v7;
  double v8;
  double v9;

  +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:](PowerUISmartChargeUtilities, "logMemoryUsageInternalForEvent:", CFSTR("Beginning of loadTrial"));
  -[PowerUITrialManager loadTrialEngageModelByDeletingExistingModel:](self->_trialManager, "loadTrialEngageModelByDeletingExistingModel:", 1);
  v3 = (MLModel *)objc_claimAutoreleasedReturnValue();
  engageModel = self->_engageModel;
  self->_engageModel = v3;

  -[PowerUITrialManager loadTrialDurationModelByDeletingExistingModel:](self->_trialManager, "loadTrialDurationModelByDeletingExistingModel:", 1);
  v5 = (MLModel *)objc_claimAutoreleasedReturnValue();
  durationModel = self->_durationModel;
  self->_durationModel = v5;

  -[PowerUIMLTwoStageModelPredictor loadThresholdForModel:](self, "loadThresholdForModel:", self->_engageModel);
  self->_threshold = v7;
  -[PowerUIMLTwoStageModelPredictor loadAdjustedHoursForModel:](self, "loadAdjustedHoursForModel:", self->_durationModel);
  self->_adjustedDuration = v8;
  -[PowerUIMLTwoStageModelPredictor loadMinInputChargeDuration](self, "loadMinInputChargeDuration");
  self->_minInputChargeDuration = v9;
  -[PowerUIMLTwoStageModelPredictor resetSavedDeadline](self, "resetSavedDeadline");
  +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:](PowerUISmartChargeUtilities, "logMemoryUsageInternalForEvent:", CFSTR("End of loadTrial"));
}

- (double)loadThresholdForModel:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  NSObject *log;
  int v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PowerUITrialManager loadTrialThreshold](self->_trialManager, "loadTrialThreshold");
  v6 = v5;
  if (v5 <= 0.0)
  {
    objc_msgSend(v4, "modelDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BDBFF38]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("threshold"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v6 = v11;

    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 134217984;
      v15 = v6;
      _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Failed to load trial threshold. Falling back to default %lf", (uint8_t *)&v14, 0xCu);
    }
  }

  return v6;
}

- (double)loadAdjustedHoursForModel:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  NSObject *log;
  int v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PowerUITrialManager loadTrialAdjustedHours](self->_trialManager, "loadTrialAdjustedHours");
  v6 = v5;
  if (v5 <= 0.0)
  {
    objc_msgSend(v4, "modelDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BDBFF38]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("leeway"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v6 = v11;

    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 134217984;
      v15 = v6;
      _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Failed to load trial adjusted hours. Falling back to default %lf", (uint8_t *)&v14, 0xCu);
    }
  }

  return v6;
}

- (double)loadMinInputChargeDuration
{
  double v3;
  double v4;
  NSObject *log;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  -[PowerUITrialManager loadTrialMinInputChargeDuration](self->_trialManager, "loadTrialMinInputChargeDuration");
  v4 = v3;
  if (v3 <= 0.0)
  {
    log = self->_log;
    v4 = 600.0;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134217984;
      v8 = 0x4082C00000000000;
      _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Failed to load trial minimum duration for model input. Falling back to default %lf", (uint8_t *)&v7, 0xCu);
    }
  }
  return v4;
}

- (id)arrayWithShape:(id)a3 values:(id)a4 type:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  NSObject *log;
  uint8_t v17[16];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v9)
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v11;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBFFF0]), "initWithShape:dataType:error:", v8, a5, 0);
    if (v12 && objc_msgSend(v10, "count"))
    {
      v13 = 0;
      do
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:atIndexedSubscript:", v14, v13);

        ++v13;
      }
      while (v13 < objc_msgSend(v10, "count"));
    }
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Values not present", v17, 2u);
    }
    v12 = 0;
  }

  return v12;
}

- (unint64_t)engagementModelVersion
{
  return 3;
}

- (id)engagementModelBoltID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *log;
  __CFString *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  +[PowerUISmartChargeUtilities readStringForPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "readStringForPreferenceKey:inDomain:", CFSTR("engageBoltID"), self->_defaultsDomain);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PowerUIMLTwoStageModelPredictor engageModel](self, "engageModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modelDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "metadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDBFF38]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("model_version"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v3;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Engagement model bolt ID is %@", (uint8_t *)&v11, 0xCu);
  }
  if (v3)
    v9 = v3;
  else
    v9 = CFSTR("Unknown");

  return v9;
}

- (unint64_t)durationModelVersion
{
  return 3;
}

- (id)durationModelBoltID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *log;
  __CFString *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  +[PowerUISmartChargeUtilities readStringForPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "readStringForPreferenceKey:inDomain:", CFSTR("durationBoltID"), self->_defaultsDomain);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PowerUIMLTwoStageModelPredictor durationModel](self, "durationModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modelDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "metadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDBFF38]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("model_version"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v3;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Duration model bolt ID is %@", (uint8_t *)&v11, 0xCu);
  }
  if (v3)
    v9 = v3;
  else
    v9 = CFSTR("Unknown");

  return v9;
}

- (void)setPluginDate:(id)a3
{
  id v5;
  double v6;
  NSObject *log;
  NSDate *pluginDate;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[PowerUISmartChargeUtilities batteryLevelAtDate:](PowerUISmartChargeUtilities, "batteryLevelAtDate:", v5);
  self->_pluginBatteryLevel = v6;
  objc_storeStrong((id *)&self->_pluginDate, a3);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    pluginDate = self->_pluginDate;
    v9 = log;
    -[PowerUIMLTwoStageModelPredictor timeStringFromDate:](self, "timeStringFromDate:", pluginDate);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_pluginBatteryLevel);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v10;
    v14 = 2112;
    v15 = v11;
    _os_log_impl(&dword_215A71000, v9, OS_LOG_TYPE_DEFAULT, "Plugin date set to %@, plugin battery level to %@", (uint8_t *)&v12, 0x16u);

  }
}

- (double)getHourBinID:(id)a3 forHourBin:(unint64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;

  v5 = (void *)MEMORY[0x24BDBCE48];
  v6 = a3;
  objc_msgSend(v5, "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "components:fromDate:", 32, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (double)objc_msgSend(v8, "hour") / (double)a4;
  return v9;
}

- (id)predictFullChargeDateWithBatteryLevel:(unint64_t)a3
{
  NSObject *log;
  NSDate *deadline;
  NSDate *pluginDate;
  double pluginBatteryLevel;
  void *v9;
  double v10;
  double v11;
  NSDate *v12;
  NSDate *v13;
  int v15;
  NSDate *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (self->_deadline)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      deadline = self->_deadline;
      v15 = 138412290;
      v16 = deadline;
      _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Returning saved deadline: %@", (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    pluginDate = self->_pluginDate;
    pluginBatteryLevel = self->_pluginBatteryLevel;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PowerUIMLTwoStageModelPredictor adjustedChargingDecision:withPluginDate:withPluginBatteryLevel:forDate:forStatus:](self, "adjustedChargingDecision:withPluginDate:withPluginBatteryLevel:forDate:forStatus:", a3, pluginDate, v9, 0, pluginBatteryLevel);
    v11 = v10;

    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", v11);
    v12 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v13 = self->_deadline;
    self->_deadline = v12;

    +[PowerUISmartChargeUtilities setDate:forPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "setDate:forPreferenceKey:inDomain:", self->_deadline, CFSTR("twoStageModelOutput"), self->_defaultsDomain);
  }
  return self->_deadline;
}

- (double)adjustedChargingDecision:(unint64_t)a3 withPluginDate:(id)a4 withPluginBatteryLevel:(double)a5 forDate:(id)a6 forStatus:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  uint64_t v13;
  NSObject *v14;
  double v15;
  NSObject *v16;
  __CFString *v17;
  double adjustedDuration;
  void *v19;
  uint8_t buf[4];
  __CFString *v22;
  __int16 v23;
  double v24;
  __int16 v25;
  double v26;
  uint64_t v27;

  v7 = a7;
  v27 = *MEMORY[0x24BDAC8D0];
  v12 = a6;
  v13 = 88;
  if (v7)
    v13 = 96;
  v14 = *(id *)((char *)&self->super.isa + v13);
  -[PowerUIMLTwoStageModelPredictor chargingDecision:withPluginDate:withPluginBatteryLevel:forDate:withLog:](self, "chargingDecision:withPluginDate:withPluginBatteryLevel:forDate:withLog:", a3, a4, v12, v14, a5);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v22 = 0;
    _os_log_impl(&dword_215A71000, v14, OS_LOG_TYPE_DEFAULT, "MLTwoStageModel output %f hours", buf, 0xCu);
  }
  v15 = 0.0 - self->_adjustedDuration;
  v16 = v14;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    if (v15 < 0.0)
    {
      v17 = CFSTR("Distant Past");
    }
    else
    {
      objc_msgSend(v12, "dateByAddingTimeInterval:", v15 * 3600.0);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    adjustedDuration = self->_adjustedDuration;
    *(_DWORD *)buf = 138412802;
    v22 = v17;
    v23 = 2048;
    v24 = adjustedDuration;
    v25 = 2048;
    v26 = v15;
    _os_log_impl(&dword_215A71000, v16, OS_LOG_TYPE_DEFAULT, "SmartCharge: %@ duration post adjustment of %f hours, is %f hours", buf, 0x20u);
    if (v15 >= 0.0)

  }
  if (!v7)
  {
    self->_lastDurationResult = v15;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[PowerUISmartChargeUtilities setNumber:forPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "setNumber:forPreferenceKey:inDomain:", v19, CFSTR("twoStageModelDurationResult"), self->_defaultsDomain);

  }
  return v15 * 3600.0;
}

- (id)getInputFeaturesWithPluginDate:(id)a3 withPluginBatteryLevel:(double)a4 forDate:(id)a5 withLog:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  v12 = (void *)MEMORY[0x24BDBCE48];
  v13 = a5;
  objc_msgSend(v12, "currentCalendar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "components:fromDate:", 32, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "hour");
  objc_msgSend(v10, "timeIntervalSinceDate:", v13);
  v18 = v17;

  +[PowerUISmartChargeUtilities pluginEventsBefore:withMinimumDuration:withMinimumPlugoutBatteryLevel:ignoringDisconnectsShorterThan:](PowerUISmartChargeUtilities, "pluginEventsBefore:withMinimumDuration:withMinimumPlugoutBatteryLevel:ignoringDisconnectsShorterThan:", v10, self->_minInputChargeDuration, 75.0, 300.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v11;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v19, "count"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138412290;
    v25 = v21;
    _os_log_impl(&dword_215A71000, v20, OS_LOG_TYPE_DEFAULT, "Found %@ events for featurization", (uint8_t *)&v24, 0xCu);

  }
  if (objc_msgSend(v19, "count"))
  {
    -[PowerUIMLTwoStageModelPredictor getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:](self, "getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:", v19, (unint64_t)a4, v10, v20, (double)v16, -v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (PowerUIModelQueryResult)chargingDecision:(SEL)a3 withPluginDate:(unint64_t)a4 withPluginBatteryLevel:(id)a5 forDate:(double)a6 withLog:(id)a7
{
  NSObject *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  NSObject *v27;
  double v28;
  double v29;
  void *v30;
  double threshold;
  _BOOL4 v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  NSObject *v45;
  double v46;
  double v47;
  double v48;
  PowerUIModelQueryResult *result;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  uint8_t buf[4];
  double v56;
  __int16 v57;
  double v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v13 = a8;
  v14 = a7;
  v15 = a5;
  v16 = (void *)os_transaction_create();
  -[PowerUIMLTwoStageModelPredictor getInputFeaturesWithPluginDate:withPluginBatteryLevel:forDate:withLog:](self, "getInputFeaturesWithPluginDate:withPluginBatteryLevel:forDate:withLog:", v15, v14, v13, a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)&retstr->var0 = 0;
  *(int64x2_t *)&retstr->var1 = vdupq_n_s64(0xC0F869F000000000);
  if (v17 || self->_durationOverride && self->_confidenceOverride)
  {
    -[PowerUIMLTwoStageModelPredictor engageModel](self, "engageModel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "predictionFromFeatures:error:", v17, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "featureValueForName:", CFSTR("classProbability"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dictionaryValue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = v13;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v21, "description");
      v23 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 138412290;
      v56 = v23;
      _os_log_impl(&dword_215A71000, v22, OS_LOG_TYPE_DEFAULT, "Engagement model raw output %@", buf, 0xCu);

    }
    objc_msgSend(v21, "objectForKeyedSubscript:", &unk_24D443540);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "doubleValue");
    v26 = v25;

    if (self->_confidenceOverride
      && +[PowerUISmartChargeUtilities isInternalBuild](PowerUISmartChargeUtilities, "isInternalBuild"))
    {
      v27 = v22;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        -[NSNumber doubleValue](self->_confidenceOverride, "doubleValue");
        *(_DWORD *)buf = 134217984;
        v56 = v28;
        _os_log_impl(&dword_215A71000, v27, OS_LOG_TYPE_DEFAULT, "Confidence override exists: %f", buf, 0xCu);
      }

      -[NSNumber doubleValue](self->_confidenceOverride, "doubleValue");
      v26 = v29;
    }
    if (self->_statusLog != v22)
    {
      self->_lastEngagementResult = v26;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v26);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      +[PowerUISmartChargeUtilities setNumber:forPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "setNumber:forPreferenceKey:inDomain:", v30, CFSTR("twoStageModelEngagementResult"), self->_defaultsDomain);

    }
    threshold = self->_threshold;
    v32 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    if (v26 <= threshold)
    {
      if (v32)
      {
        v48 = self->_threshold;
        *(_DWORD *)buf = 134218240;
        v56 = v26;
        v57 = 2048;
        v58 = v48;
        _os_log_impl(&dword_215A71000, v22, OS_LOG_TYPE_DEFAULT, "Engagement model says NO (Prob %lf < Threshold %lf)", buf, 0x16u);
      }
      retstr->var1 = -99999.0;
      retstr->var2 = v26;
    }
    else
    {
      if (v32)
      {
        v33 = self->_threshold;
        *(_DWORD *)buf = 134218240;
        v56 = v26;
        v57 = 2048;
        v58 = v33;
        _os_log_impl(&dword_215A71000, v22, OS_LOG_TYPE_DEFAULT, "Engagement model says YES (Prob %lf > Threshold %lf)", buf, 0x16u);
      }
      v51 = v21;
      v52 = v19;
      v53 = v16;
      v54 = v13;
      retstr->var0 = 1;
      retstr->var2 = v26;
      -[PowerUIMLTwoStageModelPredictor durationModel](self, "durationModel");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "predictionFromFeatures:error:", v17, 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v50 = v35;
      objc_msgSend(v35, "featureValueForName:", CFSTR("duration_pred"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "doubleValue");
      v38 = v37;

      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v56 = v38;
        _os_log_impl(&dword_215A71000, v22, OS_LOG_TYPE_DEFAULT, "Regression model output: %lf", buf, 0xCu);
      }
      -[PowerUIMLTwoStageModelPredictor durationModel](self, "durationModel");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "modelDescription");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "metadata");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "objectForKeyedSubscript:", *MEMORY[0x24BDBFF38]);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("adjust_duration_by_confidence"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "BOOLValue");

      v19 = v52;
      v16 = v53;
      v21 = v51;
      if (v44)
      {
        v38 = v26 * v38;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v56 = v38;
          _os_log_impl(&dword_215A71000, v22, OS_LOG_TYPE_DEFAULT, "Duration adjusted by confidence: %lf", buf, 0xCu);
        }
      }
      if (self->_durationOverride)
      {
        v13 = v54;
        if (+[PowerUISmartChargeUtilities isInternalBuild](PowerUISmartChargeUtilities, "isInternalBuild"))
        {
          v45 = v22;
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            -[NSNumber doubleValue](self->_durationOverride, "doubleValue");
            *(_DWORD *)buf = 134217984;
            v56 = v46;
            _os_log_impl(&dword_215A71000, v45, OS_LOG_TYPE_DEFAULT, "Duration override exists: %f", buf, 0xCu);
          }

          -[NSNumber doubleValue](self->_durationOverride, "doubleValue");
          v38 = v47;
        }
      }
      else
      {
        v13 = v54;
      }
      retstr->var1 = v38;

    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    -[PowerUIMLTwoStageModelPredictor chargingDecision:withPluginDate:withPluginBatteryLevel:forDate:withLog:].cold.1(v13);
  }

  return result;
}

- (id)convertInputFeaturesToNeuralFeatures:(id)a3
{
  id v4;
  NSObject *log;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v13;
  uint8_t buf[16];

  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Convert model input features for neural model", buf, 2u);
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PowerUIMLTwoStageModelPredictor getMultiArrayForFeatureDict:](self, "getMultiArrayForFeatureDict:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("layer1_input"));
  v13 = 0;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBFF80]), "initWithDictionary:error:", v6, &v13);
  v10 = v13;
  if (v10)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      -[PowerUIMLTwoStageModelPredictor convertInputFeaturesToNeuralFeatures:].cold.1();
    v11 = 0;
  }
  else
  {
    v11 = v9;
  }

  return v11;
}

- (void)resetSavedDeadline
{
  NSDate *deadline;
  void *v9;
  id v10;

  deadline = self->_deadline;
  self->_deadline = 0;

  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)&self->_lastEngagementResult = _Q0;
  +[PowerUISmartChargeUtilities setDate:forPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "setDate:forPreferenceKey:inDomain:", self->_deadline, CFSTR("twoStageModelOutput"), self->_defaultsDomain);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_lastEngagementResult);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PowerUISmartChargeUtilities setNumber:forPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "setNumber:forPreferenceKey:inDomain:", v9, CFSTR("twoStageModelEngagementResult"), self->_defaultsDomain);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_lastDurationResult);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  +[PowerUISmartChargeUtilities setNumber:forPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "setNumber:forPreferenceKey:inDomain:", v10, CFSTR("twoStageModelDurationResult"), self->_defaultsDomain);

}

- (void)deleteCompiledModels
{
  void *v3;
  void *v4;
  double v5;
  NSObject *log;
  void *v7;
  double threshold;
  NSObject *v9;
  void *v10;
  void *v11;
  double v12;
  NSObject *v13;
  void *v14;
  double adjustedDuration;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)os_transaction_create();
  -[PowerUITrialManager loadTrialEngageModelByDeletingExistingModel:](self->_trialManager, "loadTrialEngageModelByDeletingExistingModel:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    os_unfair_lock_lock(&self->_loadModelLock);
    objc_storeStrong((id *)&self->_engageModel, v4);
    -[PowerUIMLTwoStageModelPredictor loadThresholdForModel:](self, "loadThresholdForModel:", self->_engageModel);
    self->_threshold = v5;
    os_unfair_lock_unlock(&self->_loadModelLock);
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)MEMORY[0x24BDD16E0];
      threshold = self->_threshold;
      v9 = log;
      objc_msgSend(v7, "numberWithDouble:", threshold);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v10;
      _os_log_impl(&dword_215A71000, v9, OS_LOG_TYPE_DEFAULT, "Trial engage model found! Threshold: %@", (uint8_t *)&v18, 0xCu);

    }
  }
  -[PowerUITrialManager loadTrialDurationModelByDeletingExistingModel:](self->_trialManager, "loadTrialDurationModelByDeletingExistingModel:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    os_unfair_lock_lock(&self->_loadModelLock);
    objc_storeStrong((id *)&self->_durationModel, v11);
    -[PowerUIMLTwoStageModelPredictor loadAdjustedHoursForModel:](self, "loadAdjustedHoursForModel:", self->_durationModel);
    self->_adjustedDuration = v12;
    os_unfair_lock_unlock(&self->_loadModelLock);
    v13 = self->_log;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)MEMORY[0x24BDD16E0];
      adjustedDuration = self->_adjustedDuration;
      v16 = v13;
      objc_msgSend(v14, "numberWithDouble:", adjustedDuration);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v17;
      _os_log_impl(&dword_215A71000, v16, OS_LOG_TYPE_DEFAULT, "Trial duration model found! adjustedDuration = %@", (uint8_t *)&v18, 0xCu);

    }
  }

}

- (void)deleteUpdatedModels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  NSObject *log;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v24[2];
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDBCF48];
  v29[0] = CFSTR("/var/mobile/Library/PowerUI");
  v29[1] = CFSTR("updatedClassifier.modelc");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURLWithPathComponents:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v8 = objc_msgSend(v3, "removeItemAtPath:error:", v7, &v23);
  v9 = v23;

  if ((v8 & 1) == 0)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v11 = log;
      objc_msgSend(v6, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v26 = v12;
      v27 = 2112;
      v28 = v9;
      _os_log_impl(&dword_215A71000, v11, OS_LOG_TYPE_DEFAULT, "Failed to clean up path: %@ -- %@", buf, 0x16u);

    }
  }
  v13 = (void *)MEMORY[0x24BDBCF48];
  v24[0] = CFSTR("/var/mobile/Library/PowerUI");
  v24[1] = CFSTR("updatedRegressor.modelc");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fileURLWithPathComponents:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "path");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v9;
  v17 = objc_msgSend(v3, "removeItemAtPath:error:", v16, &v22);
  v18 = v22;

  if ((v17 & 1) == 0)
  {
    v19 = self->_log;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = v19;
      objc_msgSend(v15, "path");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v26 = v21;
      v27 = 2112;
      v28 = v18;
      _os_log_impl(&dword_215A71000, v20, OS_LOG_TYPE_DEFAULT, "Failed to clean up path: %@ -- %@", buf, 0x16u);

    }
  }

}

- (void)loadEngagementModelFromURL:(id)a3
{
  id v5;
  NSObject *log;
  MLModel *v7;
  id v8;
  MLModel *engageModel;
  double v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  os_unfair_lock_lock(&self->_loadModelLock);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v5;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Reload engagement model: %@", buf, 0xCu);
  }
  v11 = 0;
  objc_msgSend(MEMORY[0x24BDBFFC8], "modelWithContentsOfURL:error:", v5, &v11);
  v7 = (MLModel *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  engageModel = self->_engageModel;
  self->_engageModel = v7;

  if (v8)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      -[PowerUIMLTwoStageModelPredictor engageModel].cold.1();
  }
  else
  {
    objc_storeStrong((id *)&self->_compiledClassifier, a3);
    -[PowerUIMLTwoStageModelPredictor loadThresholdForModel:](self, "loadThresholdForModel:", self->_engageModel);
    self->_threshold = v10;
  }
  os_unfair_lock_unlock(&self->_loadModelLock);

}

- (void)loadDurationModelFromURL:(id)a3
{
  id v5;
  NSObject *log;
  MLModel *v7;
  id v8;
  MLModel *durationModel;
  double v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  os_unfair_lock_lock(&self->_loadModelLock);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v5;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Reload duration model: %@", buf, 0xCu);
  }
  v11 = 0;
  objc_msgSend(MEMORY[0x24BDBFFC8], "modelWithContentsOfURL:error:", v5, &v11);
  v7 = (MLModel *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  durationModel = self->_durationModel;
  self->_durationModel = v7;

  if (v8)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      -[PowerUIMLTwoStageModelPredictor engageModel].cold.1();
  }
  else
  {
    objc_storeStrong((id *)&self->_compiledRegressor, a3);
    -[PowerUIMLTwoStageModelPredictor loadAdjustedHoursForModel:](self, "loadAdjustedHoursForModel:", self->_durationModel);
    self->_adjustedDuration = v10;
  }
  os_unfair_lock_unlock(&self->_loadModelLock);

}

- (id)adjustDeadlineForReengagement
{
  void *v3;
  NSDate *v4;
  NSDate *deadline;
  NSDate *v6;
  NSDate *v7;
  NSDate *v8;

  if (self->_deadline)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "earlierDate:", self->_deadline);
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    deadline = self->_deadline;

    if (v4 == deadline)
    {
      -[NSDate dateByAddingTimeInterval:](self->_deadline, "dateByAddingTimeInterval:", 86400.0);
      v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
      v7 = self->_deadline;
      self->_deadline = v6;

      +[PowerUISmartChargeUtilities setDate:forPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "setDate:forPreferenceKey:inDomain:", self->_deadline, CFSTR("twoStageModelOutput"), self->_defaultsDomain);
    }
    v8 = self->_deadline;

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (NSDate)pluginDate
{
  return self->_pluginDate;
}

- (double)pluginBatteryLevel
{
  return self->_pluginBatteryLevel;
}

- (void)setPluginBatteryLevel:(double)a3
{
  self->_pluginBatteryLevel = a3;
}

- (double)lastEngagementResult
{
  return self->_lastEngagementResult;
}

- (void)setLastEngagementResult:(double)a3
{
  self->_lastEngagementResult = a3;
}

- (double)lastDurationResult
{
  return self->_lastDurationResult;
}

- (void)setLastDurationResult:(double)a3
{
  self->_lastDurationResult = a3;
}

- (double)adjustedDuration
{
  return self->_adjustedDuration;
}

- (void)setAdjustedDuration:(double)a3
{
  self->_adjustedDuration = a3;
}

- (double)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(double)a3
{
  self->_threshold = a3;
}

- (double)minInputChargeDuration
{
  return self->_minInputChargeDuration;
}

- (void)setMinInputChargeDuration:(double)a3
{
  self->_minInputChargeDuration = a3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (OS_os_log)statusLog
{
  return self->_statusLog;
}

- (void)setStatusLog:(id)a3
{
  objc_storeStrong((id *)&self->_statusLog, a3);
}

- (NSNumber)confidenceOverride
{
  return self->_confidenceOverride;
}

- (void)setConfidenceOverride:(id)a3
{
  objc_storeStrong((id *)&self->_confidenceOverride, a3);
}

- (NSNumber)durationOverride
{
  return self->_durationOverride;
}

- (void)setDurationOverride:(id)a3
{
  objc_storeStrong((id *)&self->_durationOverride, a3);
}

- (NSString)defaultsDomain
{
  return self->_defaultsDomain;
}

- (void)setDefaultsDomain:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsDomain, a3);
}

- (_CDLocalContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (PowerUITrialManager)trialManager
{
  return self->_trialManager;
}

- (void)setTrialManager:(id)a3
{
  objc_storeStrong((id *)&self->_trialManager, a3);
}

- (NSDate)deadline
{
  return self->_deadline;
}

- (void)setDeadline:(id)a3
{
  objc_storeStrong((id *)&self->_deadline, a3);
}

- (os_unfair_lock_s)loadModelLock
{
  return self->_loadModelLock;
}

- (void)setLoadModelLock:(os_unfair_lock_s)a3
{
  self->_loadModelLock = a3;
}

- (NSURL)compiledClassifier
{
  return self->_compiledClassifier;
}

- (void)setCompiledClassifier:(id)a3
{
  objc_storeStrong((id *)&self->_compiledClassifier, a3);
}

- (NSURL)compiledRegressor
{
  return self->_compiledRegressor;
}

- (void)setCompiledRegressor:(id)a3
{
  objc_storeStrong((id *)&self->_compiledRegressor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compiledRegressor, 0);
  objc_storeStrong((id *)&self->_compiledClassifier, 0);
  objc_storeStrong((id *)&self->_deadline, 0);
  objc_storeStrong((id *)&self->_trialManager, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_defaultsDomain, 0);
  objc_storeStrong((id *)&self->_durationOverride, 0);
  objc_storeStrong((id *)&self->_confidenceOverride, 0);
  objc_storeStrong((id *)&self->_statusLog, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_pluginDate, 0);
  objc_storeStrong((id *)&self->_durationModel, 0);
  objc_storeStrong((id *)&self->_engageModel, 0);
}

- (void)engageModel
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_215A71000, v0, v1, "Error loading model from path: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)chargingDecision:(os_log_t)log withPluginDate:withPluginBatteryLevel:forDate:withLog:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_215A71000, log, OS_LOG_TYPE_ERROR, "input features invalid, return default query result", v1, 2u);
}

- (void)convertInputFeaturesToNeuralFeatures:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_215A71000, v0, v1, "Error while creating feature provider: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
