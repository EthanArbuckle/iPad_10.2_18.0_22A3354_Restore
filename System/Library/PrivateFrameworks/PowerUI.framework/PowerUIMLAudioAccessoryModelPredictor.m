@implementation PowerUIMLAudioAccessoryModelPredictor

- (PowerUIMLAudioAccessoryModelPredictor)init
{
  PowerUIMLAudioAccessoryModelPredictor *v2;
  PowerUIMLAudioAccessoryModelPredictor *v3;
  os_log_t v4;
  OS_os_log *log;
  NSObject *v6;
  os_log_t v7;
  OS_os_log *statusLog;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  __int16 v16[8];
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PowerUIMLAudioAccessoryModelPredictor;
  v2 = -[PowerUIMLAudioAccessoryModelPredictor init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = os_log_create("com.apple.powerui.smartcharging.AudioAccessory", "mlaudioaccessorymodelpredictor");
    log = v3->_log;
    v3->_log = (OS_os_log *)v4;

    v6 = v3->_log;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v16[0] = 0;
      _os_log_impl(&dword_215A71000, v6, OS_LOG_TYPE_DEFAULT, "Initializing PowerUIMLAudioAccessoryModelPredictor...", (uint8_t *)v16, 2u);
    }
    v7 = os_log_create("com.apple.powerui.smartcharging", "mlaudioaccessorymodelpredictorStatusLog");
    statusLog = v3->_statusLog;
    v3->_statusLog = (OS_os_log *)v7;

    +[PowerUISmartChargeUtilities numberForPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "numberForPreferenceKey:inDomain:", CFSTR("MinimumNumberOfDaysOfHistory"), CFSTR("com.apple.smartcharging.topoffprotection.audioaccessories"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      v11 = objc_msgSend(v9, "intValue");
    else
      v11 = 14;
    v3->_minimumDaysOfHistory = v11;
    +[PowerUISmartChargeUtilities numberForPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "numberForPreferenceKey:inDomain:", CFSTR("MinimumNumberOfPreviousConnections"), CFSTR("com.apple.smartcharging.topoffprotection.audioaccessories"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
      v14 = objc_msgSend(v12, "intValue");
    else
      v14 = 10;
    v3->_minimumNumberOfPreviousConnections = v14;
    v3->_lastUsedLeeway = -1.0;

  }
  return v3;
}

- (MLModel)highUsageEngageModel
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MLModel *v9;
  MLModel *highUsageEngageModel;
  NSObject *log;
  uint8_t v13[16];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_highUsageEngageModel)
  {
    v4 = (void *)os_transaction_create();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pathForResource:ofType:", CFSTR("base_engage"), CFSTR("mlmodelc"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x24BDBFFC8];
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "modelWithContentsOfURL:error:", v8, 0);
    v9 = (MLModel *)objc_claimAutoreleasedReturnValue();
    highUsageEngageModel = self->_highUsageEngageModel;
    self->_highUsageEngageModel = v9;

    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Created highUsageEngageModel object lazily.", v13, 2u);
    }

  }
  os_unfair_lock_unlock(p_lock);
  return self->_highUsageEngageModel;
}

- (MLModel)highUsageRegressionModel
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MLModel *v9;
  MLModel *highUsageRegressionModel;
  NSObject *log;
  uint8_t v13[16];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_highUsageRegressionModel)
  {
    v4 = (void *)os_transaction_create();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pathForResource:ofType:", CFSTR("base_duration"), CFSTR("mlmodelc"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x24BDBFFC8];
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "modelWithContentsOfURL:error:", v8, 0);
    v9 = (MLModel *)objc_claimAutoreleasedReturnValue();
    highUsageRegressionModel = self->_highUsageRegressionModel;
    self->_highUsageRegressionModel = v9;

    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Created highUsageRegressionModel object lazily.", v13, 2u);
    }

  }
  os_unfair_lock_unlock(p_lock);
  return self->_highUsageRegressionModel;
}

- (MLModel)lowUsageEngageModel
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MLModel *v9;
  id v10;
  MLModel *lowUsageEngageModel;
  NSObject *log;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lowUsageEngageModel)
  {
    v4 = (void *)os_transaction_create();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pathForResource:ofType:", CFSTR("easy_engage"), CFSTR("mlmodelc"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x24BDBFFC8];
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(v7, "modelWithContentsOfURL:error:", v8, &v15);
    v9 = (MLModel *)objc_claimAutoreleasedReturnValue();
    v10 = v15;
    lowUsageEngageModel = self->_lowUsageEngageModel;
    self->_lowUsageEngageModel = v9;

    if (v10)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v10;
        _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Error loading low usage engagement model: %@", buf, 0xCu);
      }
    }
    v13 = self->_log;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215A71000, v13, OS_LOG_TYPE_DEFAULT, "Created lowUsageEngageModel object lazily.", buf, 2u);
    }

  }
  os_unfair_lock_unlock(p_lock);
  return self->_lowUsageEngageModel;
}

- (MLModel)lowUsageRegressionModel
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MLModel *v9;
  id v10;
  MLModel *lowUsageRegressionModel;
  NSObject *log;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lowUsageRegressionModel)
  {
    v4 = (void *)os_transaction_create();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pathForResource:ofType:", CFSTR("long_duration"), CFSTR("mlmodelc"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x24BDBFFC8];
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(v7, "modelWithContentsOfURL:error:", v8, &v15);
    v9 = (MLModel *)objc_claimAutoreleasedReturnValue();
    v10 = v15;
    lowUsageRegressionModel = self->_lowUsageRegressionModel;
    self->_lowUsageRegressionModel = v9;

    if (v10)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v10;
        _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Error loading low usage regression model: %@", buf, 0xCu);
      }
    }
    v13 = self->_log;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215A71000, v13, OS_LOG_TYPE_DEFAULT, "Created lowUsageRegressionModel object lazily.", buf, 2u);
    }

  }
  os_unfair_lock_unlock(p_lock);
  return self->_lowUsageRegressionModel;
}

- (id)chargingDecisionForDate:(id)a3 forAudioAccessory:(id)a4
{
  id v6;
  id v7;
  NSObject *log;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  PowerUIModelPredictionContainer *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  NSObject *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  id v49;
  PowerUIModelPredictionContainer *v50;
  double v51;
  double v52;
  uint64_t v53;
  PowerUIModelPredictionContainer *v54;
  void *v56;
  double v57;
  double v58;
  NSObject *v59;
  double v60;
  NSObject *v61;
  _BOOL4 v62;
  NSObject *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  uint8_t buf[4];
  double v71;
  __int16 v72;
  double v73;
  __int16 v74;
  void *v75;
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v71 = *(double *)&v6;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "chargingDecisionForDate %@ was called", buf, 0xCu);
  }
  v9 = (void *)os_transaction_create();
  -[PowerUIMLAudioAccessoryModelPredictor getBTConnectionEventsForPredictionUpTo:forDevice:](self, "getBTConnectionEventsForPredictionUpTo:forDevice:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PowerUISmartChargeUtilities concatenateChargeSessions:withMaxDeltaSecondsBetweenEvents:](PowerUISmartChargeUtilities, "concatenateChargeSessions:withMaxDeltaSecondsBetweenEvents:", v10, 10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = self->_log;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)MEMORY[0x24BDD16E0];
    v14 = v12;
    objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v71 = *(double *)&v15;
    _os_log_impl(&dword_215A71000, v14, OS_LOG_TYPE_DEFAULT, "Found %@ events for featurization", buf, 0xCu);

  }
  if (objc_msgSend(v11, "count") >= (unint64_t)self->_minimumNumberOfPreviousConnections)
  {
    objc_msgSend(v11, "reverseObjectEnumerator");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "allObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    +[PowerUIPredictorHelper meanEventDuration:](PowerUIPredictorHelper, "meanEventDuration:", v18);
    v21 = v20;
    +[PowerUIPredictorHelper medianTimeBetweenDescendingEvents:](PowerUIPredictorHelper, "medianTimeBetweenDescendingEvents:", v18);
    v23 = v22;
    v24 = self->_log;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v71 = v21;
      v72 = 2048;
      v73 = v23;
      _os_log_impl(&dword_215A71000, v24, OS_LOG_TYPE_DEFAULT, "meanEventDuration: %f - medianTimeBetweenEvents: %f", buf, 0x16u);
    }
    if (v21 >= 1400.0)
    {
      -[PowerUIMLAudioAccessoryModelPredictor highUsageEngageModel](self, "highUsageEngageModel");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23 >= 139200.0)
      {
        -[PowerUIMLAudioAccessoryModelPredictor lowUsageRegressionModel](self, "lowUsageRegressionModel");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 0.88;
      }
      else
      {
        -[PowerUIMLAudioAccessoryModelPredictor highUsageRegressionModel](self, "highUsageRegressionModel");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 0.82;
      }
    }
    else
    {
      -[PowerUIMLAudioAccessoryModelPredictor lowUsageEngageModel](self, "lowUsageEngageModel");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23 >= 139200.0)
      {
        -[PowerUIMLAudioAccessoryModelPredictor lowUsageRegressionModel](self, "lowUsageRegressionModel");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 0.84;
      }
      else
      {
        -[PowerUIMLAudioAccessoryModelPredictor highUsageRegressionModel](self, "highUsageRegressionModel");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 0.75;
      }
    }
    v65 = v7;
    self->_lastUsedLeeway = 9.375;
    objc_msgSend(v25, "modelDescription", v9);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "metadata");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKeyedSubscript:", *MEMORY[0x24BDBFF38]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("model_version"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringValue");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = self->_log;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = (void *)MEMORY[0x24BDD16E0];
      v34 = v32;
      objc_msgSend(v33, "numberWithDouble:", v26);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 9.375);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v71 = *(double *)&v35;
      v72 = 2112;
      v73 = *(double *)&v36;
      v74 = 2112;
      v75 = v31;
      _os_log_impl(&dword_215A71000, v34, OS_LOG_TYPE_DEFAULT, "threshold: %@ - leeway: %@ - model version: %@", buf, 0x20u);

    }
    -[PowerUIMLAudioAccessoryModelPredictor getInputFeaturesForDate:withEventsInDescendingOrder:withLog:](self, "getInputFeaturesForDate:withEventsInDescendingOrder:withLog:", v6, v18, self->_log);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = 0;
    v66 = v25;
    objc_msgSend(v25, "predictionFromFeatures:error:", v37, &v69);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v69;
    if (v39 && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      -[PowerUIMLAudioAccessoryModelPredictor chargingDecisionForDate:forAudioAccessory:].cold.3();
    objc_msgSend(v38, "featureValueForName:", CFSTR("classProbability"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "dictionaryValue");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = self->_log;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = v42;
      objc_msgSend(v41, "description");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v71 = *(double *)&v44;
      _os_log_impl(&dword_215A71000, v43, OS_LOG_TYPE_DEFAULT, "Engagement model raw output %@", buf, 0xCu);

    }
    objc_msgSend(v41, "objectForKeyedSubscript:", &unk_24D443528);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "doubleValue");
    v47 = v46;

    v68 = v39;
    objc_msgSend(v67, "predictionFromFeatures:error:", v37, &v68);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v68;

    if (v49)
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
        -[PowerUIMLAudioAccessoryModelPredictor chargingDecisionForDate:forAudioAccessory:].cold.2();
    }
    else if (!v39)
    {
      objc_msgSend(v48, "featureValueForName:", CFSTR("duration_pred"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "doubleValue");
      v58 = v57;

      v59 = self->_log;
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v71 = v58;
        _os_log_impl(&dword_215A71000, v59, OS_LOG_TYPE_DEFAULT, "Unadjusted regression model output %lf", buf, 0xCu);
      }
      v60 = v58 + -9.375;
      v61 = self->_log;
      v62 = os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT);
      if (v47 > v26)
      {
        if (v62)
        {
          *(_DWORD *)buf = 134218240;
          v71 = v47;
          v72 = 2048;
          v73 = v26;
          _os_log_impl(&dword_215A71000, v61, OS_LOG_TYPE_DEFAULT, "Engagement model says YES (Prob %lf > Threshold %lf)", buf, 0x16u);
        }
        if (v60 <= 0.0 || v60 > 4320.0)
        {
          v63 = self->_log;
          v9 = v64;
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v71 = v60;
            _os_log_impl(&dword_215A71000, v63, OS_LOG_TYPE_DEFAULT, "... but smartChargeDuration out of bound (%lf)", buf, 0xCu);
          }
          v17 = -[PowerUIModelPredictionContainer initInvalidEntry:withEngagementConfidence:withSmartChargeDuration:withModelVersion:]([PowerUIModelPredictionContainer alloc], "initInvalidEntry:withEngagementConfidence:withSmartChargeDuration:withModelVersion:", 3, v31, v47, v60);
          goto LABEL_32;
        }
        v54 = -[PowerUIModelPredictionContainer initWithEngagementConfidence:withSmartChargeDuration:withModelVersion:]([PowerUIModelPredictionContainer alloc], "initWithEngagementConfidence:withSmartChargeDuration:withModelVersion:", v31, v47, v60);
LABEL_31:
        v17 = v54;
        v9 = v64;
LABEL_32:

        v7 = v65;
        goto LABEL_33;
      }
      if (v62)
      {
        *(_DWORD *)buf = 134218240;
        v71 = v47;
        v72 = 2048;
        v73 = v26;
        _os_log_impl(&dword_215A71000, v61, OS_LOG_TYPE_DEFAULT, "... but engagement model says NO (Prob %lf < Threshold %lf)", buf, 0x16u);
      }
      v50 = [PowerUIModelPredictionContainer alloc];
      v53 = 2;
      v51 = v47;
      v52 = v60;
LABEL_30:
      v54 = -[PowerUIModelPredictionContainer initInvalidEntry:withEngagementConfidence:withSmartChargeDuration:withModelVersion:](v50, "initInvalidEntry:withEngagementConfidence:withSmartChargeDuration:withModelVersion:", v53, v31, v51, v52);
      goto LABEL_31;
    }
    v50 = [PowerUIModelPredictionContainer alloc];
    v51 = 0.0;
    v52 = 0.0;
    v53 = 5;
    goto LABEL_30;
  }
  v16 = self->_log;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    -[PowerUIMLAudioAccessoryModelPredictor chargingDecisionForDate:forAudioAccessory:].cold.1(v16, v11);
  v17 = -[PowerUIModelPredictionContainer initInvalidEntry:withEngagementConfidence:withSmartChargeDuration:withModelVersion:]([PowerUIModelPredictionContainer alloc], "initInvalidEntry:withEngagementConfidence:withSmartChargeDuration:withModelVersion:", 1, CFSTR("Unknown"), 0.0, 0.0);
  v18 = v11;
LABEL_33:

  return v17;
}

- (id)getInputFeaturesForDate:(id)a3 withEventsInDescendingOrder:(id)a4 withLog:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  void *v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  double v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *log;
  void *v59;
  id v60;
  NSObject *v61;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v73;
  uint8_t buf[4];
  id v75;
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "components:fromDate:", 608, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "hour");
  v13 = (double)v12;
  if (objc_msgSend(v11, "weekday") == 1 || (v14 = 0.0, objc_msgSend(v11, "weekday") == 7))
    v14 = 1.0;
  +[PowerUIPredictorHelper timeBetweenUsesForSortedDescendingByAgeEvents:forHourBin:atDate:addAtDate:](PowerUIPredictorHelper, "timeBetweenUsesForSortedDescendingByAgeEvents:forHourBin:atDate:addAtDate:", v8, 1, v7, 1);
  v15 = objc_claimAutoreleasedReturnValue();
  +[PowerUIPredictorHelper timeBetweenUsesForSortedDescendingByAgeEvents:forHourBin:atDate:addAtDate:](PowerUIPredictorHelper, "timeBetweenUsesForSortedDescendingByAgeEvents:forHourBin:atDate:addAtDate:", v8, 2, v7, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PowerUIPredictorHelper timeBetweenUsesForSortedDescendingByAgeEvents:forHourBin:atDate:addAtDate:](PowerUIPredictorHelper, "timeBetweenUsesForSortedDescendingByAgeEvents:forHourBin:atDate:addAtDate:", v8, 4, v7, 1);
  v17 = objc_claimAutoreleasedReturnValue();
  +[PowerUIPredictorHelper timeBetweenUsesForSortedDescendingByAgeEvents:forHourBin:atDate:addAtDate:](PowerUIPredictorHelper, "timeBetweenUsesForSortedDescendingByAgeEvents:forHourBin:atDate:addAtDate:", v8, 24, v7, 1);
  v18 = objc_claimAutoreleasedReturnValue();
  +[PowerUIPredictorHelper medianOf:](PowerUIPredictorHelper, "medianOf:", v15);
  v20 = v19;
  +[PowerUIPredictorHelper medianOf:](PowerUIPredictorHelper, "medianOf:", v16);
  v22 = v21;
  +[PowerUIPredictorHelper medianOf:](PowerUIPredictorHelper, "medianOf:", v17);
  v24 = v23;
  +[PowerUIPredictorHelper medianOf:](PowerUIPredictorHelper, "medianOf:", v18);
  v26 = v25;
  v69 = (void *)v15;
  +[PowerUIPredictorHelper standardDeviationOf:](PowerUIPredictorHelper, "standardDeviationOf:", v15);
  v28 = v27;
  +[PowerUIPredictorHelper standardDeviationOf:](PowerUIPredictorHelper, "standardDeviationOf:", v16);
  v63 = v29;
  v68 = (void *)v17;
  +[PowerUIPredictorHelper standardDeviationOf:](PowerUIPredictorHelper, "standardDeviationOf:", v17);
  v64 = v30;
  v67 = (void *)v18;
  v31 = v18;
  v32 = v8;
  +[PowerUIPredictorHelper standardDeviationOf:](PowerUIPredictorHelper, "standardDeviationOf:", v31);
  v66 = v33;
  v71 = v9;
  +[PowerUIPredictorHelper getUsageBucketsForEvents:forDate:withLog:](PowerUIPredictorHelper, "getUsageBucketsForEvents:forDate:withLog:", v8, v7, v9);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v11;
  +[PowerUIPredictorHelper hoursUntilUseFromBucketedUsage:withCurrentHour:withComponentsMinutes:](PowerUIPredictorHelper, "hoursUntilUseFromBucketedUsage:withCurrentHour:withComponentsMinutes:", v34, v12, objc_msgSend(v11, "minute"));
  v65 = v35;
  -[PowerUIMLAudioAccessoryModelPredictor historicalMeaningfulUnderchargeRate:](self, "historicalMeaningfulUnderchargeRate:", v8);
  v37 = v36;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v13);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v39, CFSTR("hour"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v14);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v40, CFSTR("is_weekend"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v37);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v41, CFSTR("meaningful_undercharge_rolling_average"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v20);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v42, CFSTR("classic_time_between_uses_med_dur_1"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v22);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v43, CFSTR("classic_time_between_uses_med_dur_2"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v24);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v44, CFSTR("classic_time_between_uses_med_dur_4"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v26);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v45, CFSTR("classic_time_between_uses_med_dur_24"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v28);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v46, CFSTR("classic_time_between_uses_std_dur_1"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v63);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v47, CFSTR("classic_time_between_uses_std_dur_2"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v64);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v48, CFSTR("classic_time_between_uses_std_dur_4"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v66);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v49, CFSTR("classic_time_between_uses_std_dur_24"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v65);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v50, CFSTR("hours_until_use"));

  v51 = 0;
  v52 = 0.0;
  do
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("hour_plus_%d"), v51);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (int)(v13 + v52);
    if (v54 > 23)
      v54 -= 24;
    v55 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v34, "objectAtIndexedSubscript:", v54);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "doubleValue");
    objc_msgSend(v55, "numberWithDouble:");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setObject:forKeyedSubscript:", v57, v53);

    v52 = v52 + 1.0;
    v51 = (v51 + 1);
  }
  while ((_DWORD)v51 != 6);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v75 = v38;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "ml input dict: %@", buf, 0xCu);
  }
  v73 = 0;
  v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBFF80]), "initWithDictionary:error:", v38, &v73);
  v60 = v73;
  if (v60)
  {
    v61 = self->_log;
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v75 = v60;
      _os_log_impl(&dword_215A71000, v61, OS_LOG_TYPE_DEFAULT, "Error creating input features: %@", buf, 0xCu);
    }
  }

  return v59;
}

- (BOOL)isSufficientDataAvailableForEngagementForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  BOOL v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t minimumNumberOfPreviousConnections;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  NSObject *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *log;
  void *v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_minimumNumberOfPreviousConnections > 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PowerUIMLAudioAccessoryModelPredictor getBTConnectionEventsForPredictionUpTo:forDevice:](self, "getBTConnectionEventsForPredictionUpTo:forDevice:", v5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count") >= (unint64_t)self->_minimumNumberOfPreviousConnections)
    {
      objc_msgSend(v6, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "startDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timeIntervalSinceDate:", v19);
      v21 = v20;

      if (v21 < (double)self->_minimumDaysOfHistory * 86400.0)
      {
        v10 = objc_alloc_init(MEMORY[0x24BDD1500]);
        -[NSObject setDateFormat:](v10, "setDateFormat:", CFSTR("yyyy-MM-dd 'at' HH:mm"));
        v22 = self->_log;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          log = v22;
          objc_msgSend(v6, "firstObject");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "startDate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject stringFromDate:](v10, "stringFromDate:", v23);
          v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v25 = objc_msgSend(v24, "UTF8String");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v21 / 86400.0);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_minimumDaysOfHistory);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v32 = v25;
          v33 = 2112;
          v34 = v26;
          v35 = 2112;
          v36 = v27;
          _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Oldest connection event (%s) younger than %@ < %@ days. Disengage.", buf, 0x20u);

        }
        goto LABEL_12;
      }
      v8 = 1;
    }
    else
    {
      v7 = self->_log;
      v8 = 0;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (void *)MEMORY[0x24BDD16E0];
        v10 = v7;
        objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_minimumNumberOfPreviousConnections);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v32 = (uint64_t)v11;
        v33 = 2112;
        v34 = v12;
        _os_log_impl(&dword_215A71000, v10, OS_LOG_TYPE_DEFAULT, "Not enough connection events: %@ < %@. Disengage.", buf, 0x16u);

LABEL_12:
        v8 = 0;
      }
    }

    goto LABEL_14;
  }
  v13 = self->_log;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)MEMORY[0x24BDD16E0];
    minimumNumberOfPreviousConnections = self->_minimumNumberOfPreviousConnections;
    v16 = v13;
    objc_msgSend(v14, "numberWithInt:", minimumNumberOfPreviousConnections);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v32 = (uint64_t)v17;
    _os_log_impl(&dword_215A71000, v16, OS_LOG_TYPE_DEFAULT, "Minimum number of required connections is %@ < 1. Proceed.", buf, 0xCu);

  }
  v8 = 1;
LABEL_14:

  return v8;
}

- (id)getBTConnectionEventsForPredictionUpTo:(id)a3 forDevice:(id)a4
{
  return -[PowerUIMLAudioAccessoryModelPredictor getBTConnectionEventsUpTo:withMinimumDuration:withLimit:forDevice:](self, "getBTConnectionEventsUpTo:withMinimumDuration:withLimit:forDevice:", a3, 1000, a4, 300.0);
}

- (id)getBTConnectionEventsUpTo:(id)a3 withMinimumDuration:(double)a4 withLimit:(unsigned int)a5 forDevice:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[9];
  _QWORD v37[5];
  _QWORD v38[4];
  id v39;
  _QWORD v40[5];
  id v41;
  _QWORD v42[5];
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;

  v9 = a3;
  v10 = a6;
  v28 = (void *)os_transaction_create();
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy_;
  v48 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v49 = (id)objc_claimAutoreleasedReturnValue();
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy_;
  v42[4] = __Block_byref_object_dispose_;
  v43 = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy_;
  v40[4] = __Block_byref_object_dispose_;
  v41 = 0;
  v11 = objc_alloc(MEMORY[0x24BE0CC98]);
  objc_msgSend(v9, "dateByAddingTimeInterval:", -2592000.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v11, "initWithStartDate:endDate:maxEvents:lastN:reversed:", v12, v9, a5, 0, 0);
  v35 = v9;

  v13 = objc_alloc(MEMORY[0x24BE0CC98]);
  objc_msgSend(v9, "dateByAddingTimeInterval:", -5184000.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v13, "initWithStartDate:endDate:maxEvents:lastN:reversed:", v14, v9, 0, 0, 0);

  BiomeLibrary();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "Device");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "Wireless");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "Bluetooth");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "publisherWithOptions:", v33);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  BiomeLibrary();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "Device");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "TimeZone");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "publisherWithOptions:", v30);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "orderedMergeWithOther:comparator:", v20, &__block_literal_global);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x24BDAC760];
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __107__PowerUIMLAudioAccessoryModelPredictor_getBTConnectionEventsUpTo_withMinimumDuration_withLimit_forDevice___block_invoke_2;
  v38[3] = &unk_24D3FB6D0;
  v23 = v10;
  v39 = v23;
  objc_msgSend(v21, "filterWithIsIncluded:", v38);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v22;
  v37[1] = 3221225472;
  v37[2] = __107__PowerUIMLAudioAccessoryModelPredictor_getBTConnectionEventsUpTo_withMinimumDuration_withLimit_forDevice___block_invoke_3;
  v37[3] = &unk_24D3FB6F8;
  v37[4] = self;
  v36[0] = v22;
  v36[1] = 3221225472;
  v36[2] = __107__PowerUIMLAudioAccessoryModelPredictor_getBTConnectionEventsUpTo_withMinimumDuration_withLimit_forDevice___block_invoke_137;
  v36[3] = &unk_24D3FB720;
  v36[4] = self;
  v36[5] = v42;
  *(double *)&v36[8] = a4;
  v36[6] = v40;
  v36[7] = &v44;
  v25 = (id)objc_msgSend(v24, "sinkWithCompletion:receiveInput:", v37, v36);

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v45[5]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v40, 8);
  _Block_object_dispose(v42, 8);

  _Block_object_dispose(&v44, 8);
  return v26;
}

uint64_t __107__PowerUIMLAudioAccessoryModelPredictor_getBTConnectionEventsUpTo_withMinimumDuration_withLimit_forDevice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(a2, "timestamp");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "timestamp");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

uint64_t __107__PowerUIMLAudioAccessoryModelPredictor_getBTConnectionEventsUpTo_withMinimumDuration_withLimit_forDevice___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "eventBody");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "address");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

void __107__PowerUIMLAudioAccessoryModelPredictor_getBTConnectionEventsUpTo_withMinimumDuration_withLimit_forDevice___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (objc_msgSend(v3, "state"))
  {
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 64);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __107__PowerUIMLAudioAccessoryModelPredictor_getBTConnectionEventsUpTo_withMinimumDuration_withLimit_forDevice___block_invoke_3_cold_1(v4, v3);
  }

}

void __107__PowerUIMLAudioAccessoryModelPredictor_getBTConnectionEventsUpTo_withMinimumDuration_withLimit_forDevice___block_invoke_137(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  PowerUIChargeSession *v27;
  uint64_t v28;
  void *v29;

  v4 = a2;
  v5 = (void *)MEMORY[0x2199EC15C]();
  objc_msgSend(v4, "eventBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v8 = v4;
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 64);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __107__PowerUIMLAudioAccessoryModelPredictor_getBTConnectionEventsUpTo_withMinimumDuration_withLimit_forDevice___block_invoke_137_cold_1(v9, v8);
    objc_msgSend(v8, "eventBody");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "starting"))
    {
      v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);

      if (!v11)
      {
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v13 = v8;
        v14 = *(void **)(v12 + 40);
        *(_QWORD *)(v12 + 40) = v13;
        goto LABEL_16;
      }
    }
    else
    {

    }
    objc_msgSend(v8, "eventBody");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "starting") & 1) == 0)
    {
      v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);

      if (!v15)
      {
LABEL_17:

        goto LABEL_18;
      }
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "eventBody");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0.0;
      if (objc_msgSend(v16, "hasSecondsFromGMT"))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "eventBody");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "secondsFromGMT");
        v17 = v19;

      }
      v20 = (void *)MEMORY[0x24BDBCE60];
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "timestamp");
      objc_msgSend(v20, "dateWithTimeIntervalSinceReferenceDate:", v17 + v21);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x24BDBCE60];
      objc_msgSend(v8, "timestamp");
      objc_msgSend(v22, "dateWithTimeIntervalSinceReferenceDate:", v17 + v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "timeIntervalSinceDate:", v14);
      if (v25 >= *(double *)(a1 + 64))
      {
        v26 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        v27 = -[PowerUIChargeSession initWithStartDate:withEndDate:withStartSoC:withEndSoC:]([PowerUIChargeSession alloc], "initWithStartDate:withEndDate:withStartSoC:withEndSoC:", v14, v24, 0, 0);
        objc_msgSend(v26, "addObject:", v27);

      }
      v28 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v29 = *(void **)(v28 + 40);
      *(_QWORD *)(v28 + 40) = 0;

    }
LABEL_16:

    goto LABEL_17;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
LABEL_18:
  objc_autoreleasePoolPop(v5);

}

- (BOOL)deviceHasAtLeastOneLongConnection:(id)a3 forReferenceDate:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  NSObject *v21;
  BOOL v22;
  NSObject *log;
  uint8_t v25[16];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeInterval:sinceDate:", a4, -2592000.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v12);
      objc_msgSend(v13, "startDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "earlierDate:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "startDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15 == v16)
        break;
      objc_msgSend(v13, "endDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "startDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "timeIntervalSinceDate:", v18);
      v20 = v19;

      if (v20 >= 10800.0)
      {
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v25 = 0;
          _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "At least one long engagement was found.", v25, 2u);
        }

        v22 = 1;
        goto LABEL_15;
      }
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

  v21 = self->_log;
  v22 = 0;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v25 = 0;
    _os_log_impl(&dword_215A71000, v21, OS_LOG_TYPE_DEFAULT, "No long engagements were found.", v25, 2u);
    v22 = 0;
  }
LABEL_15:

  return v22;
}

- (double)historicalMeaningfulUnderchargeRate:(id)a3
{
  id v3;
  int v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;

  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  if (v4 < 2)
  {
    v6 = 0;
  }
  else
  {
    v5 = 0;
    v6 = 0;
    v7 = v4;
    v32 = (v4 - 2) + 1;
    do
    {
      v35 = v6;
      v33 = v7;
      v34 = v7 - 1;
      v8 = (v7 - 1);
      objc_msgSend(v3, "objectAtIndexedSubscript:", v8, v32);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "endDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dateByAddingTimeInterval:", 9000.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "objectAtIndexedSubscript:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "endDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectAtIndexedSubscript:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "startDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceDate:", v15);
      v17 = v16;

      v18 = v32;
      do
      {
        objc_msgSend(v3, "objectAtIndexedSubscript:", v5 + v18 - 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "startDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "earlierDate:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectAtIndexedSubscript:", v5 + v18 - 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "startDate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21 != v23)
          break;
        objc_msgSend(v3, "objectAtIndexedSubscript:", v5 + v18 - 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "endDate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "earlierDate:", v11);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectAtIndexedSubscript:", v5 + v18 - 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "startDate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "timeIntervalSinceDate:", v28);
        v17 = v17 + v29;

        --v18;
      }
      while ((int)v5 + (int)v18 > 0);
      v6 = v35;
      if (v17 > 7200.0)
        v6 = v35 + 1;

      --v5;
      v7 = v34;
    }
    while (v33 > 2);
  }
  v30 = 0.0;
  if (objc_msgSend(v3, "count") && v6)
    v30 = (double)v6 / (double)(unint64_t)objc_msgSend(v3, "count");

  return v30;
}

- (double)lastUsedLeeway
{
  return self->_lastUsedLeeway;
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

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (int)minimumDaysOfHistory
{
  return self->_minimumDaysOfHistory;
}

- (void)setMinimumDaysOfHistory:(int)a3
{
  self->_minimumDaysOfHistory = a3;
}

- (int)minimumNumberOfPreviousConnections
{
  return self->_minimumNumberOfPreviousConnections;
}

- (void)setMinimumNumberOfPreviousConnections:(int)a3
{
  self->_minimumNumberOfPreviousConnections = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusLog, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_lowUsageRegressionModel, 0);
  objc_storeStrong((id *)&self->_lowUsageEngageModel, 0);
  objc_storeStrong((id *)&self->_highUsageRegressionModel, 0);
  objc_storeStrong((id *)&self->_highUsageEngageModel, 0);
}

- (void)chargingDecisionForDate:(void *)a1 forAudioAccessory:(void *)a2 .cold.1(void *a1, void *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = a1;
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(a2, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_215A71000, v4, v6, "Only %@ events were found, charging decision should not have been queried for device.", v7);

  OUTLINED_FUNCTION_0_1();
}

- (void)chargingDecisionForDate:forAudioAccessory:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_215A71000, v0, v1, "Error getting regression model predictions: %@", v2);
}

- (void)chargingDecisionForDate:forAudioAccessory:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_215A71000, v0, v1, "Error getting engagement model predictions: %@", v2);
}

void __107__PowerUIMLAudioAccessoryModelPredictor_getBTConnectionEventsUpTo_withMinimumDuration_withLimit_forDevice___block_invoke_3_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "UTF8String");
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_215A71000, v3, v6, "Error getting bluetooth biome events: %s", v7);

  OUTLINED_FUNCTION_0_1();
}

void __107__PowerUIMLAudioAccessoryModelPredictor_getBTConnectionEventsUpTo_withMinimumDuration_withLimit_forDevice___block_invoke_137_cold_1(void *a1, void *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCE60];
  v4 = a1;
  objc_msgSend(a2, "timestamp");
  objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a2, "eventBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithBool:", objc_msgSend(v7, "starting"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412546;
  v10 = v5;
  v11 = 2112;
  v12 = v8;
  _os_log_debug_impl(&dword_215A71000, v4, OS_LOG_TYPE_DEBUG, "bluetooth event: %@ - starting :%@", (uint8_t *)&v9, 0x16u);

  OUTLINED_FUNCTION_0_1();
}

@end
