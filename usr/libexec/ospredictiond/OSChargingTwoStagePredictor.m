@implementation OSChargingTwoStagePredictor

- (MLModel)engageModel
{
  os_unfair_lock_s *p_loadModelLock;
  void *v4;
  void *v5;
  OS_os_log *v6;
  OS_os_log *v7;
  int64_t modelExecutionPath;
  int64_t v9;
  OS_os_log *v10;
  void *v11;
  void *v12;
  MLModel *v13;
  id v14;
  MLModel *v15;
  OS_os_log *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  __CFString *v20;
  MLModel *v21;
  MLModel *engageModel;
  OS_os_log *v23;
  MLModel *v24;
  MLModel *v25;
  MLModel *v26;
  OS_os_log *v27;
  _BOOL4 v28;
  NSBundle *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  MLModel *v33;
  MLModel *v34;
  double v35;
  NSObject *v36;
  MLModel *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  os_unfair_lock_s *v43;
  void *v44;
  void *v46;
  NSObject *log;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  uint8_t buf[4];
  const __CFString *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  _QWORD v63[2];

  p_loadModelLock = &self->_loadModelLock;
  os_unfair_lock_lock(&self->_loadModelLock);
  if (self->_engageModel)
    goto LABEL_38;
  self->_modelExecutionPath = -[OSIntelligenceTrialManager longFactorForName:](self->_trialManager, "longFactorForName:", CFSTR("modelExecutionPath"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities numberForPreferenceKey:inDomain:](OSIntelligenceUtilities, "numberForPreferenceKey:inDomain:", CFSTR("modelExecutionPathOverride"), self->_defaultsDomain));
  v5 = v4;
  if (v4)
  {
    self->_modelExecutionPath = (int)objc_msgSend(v4, "intValue");
    v6 = self->_log;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "_modelExecutionPath override loaded", buf, 2u);
    }
  }
  v7 = self->_log;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    modelExecutionPath = self->_modelExecutionPath;
    *(_DWORD *)buf = 134217984;
    v56 = (const __CFString *)modelExecutionPath;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "_modelExecutionPath: %ld", buf, 0xCu);
  }
  v9 = self->_modelExecutionPath;
  if (v9 == 2)
  {
    v12 = 0;
    v14 = 0;
LABEL_15:
    v16 = self->_log;
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v16, OS_LOG_TYPE_DEFAULT, "Loading baseline updatable classifier model.", buf, 2u);
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[OSChargingTwoStagePredictor compileModel:](self, "compileModel:", CFSTR("updatable_model_classifier")));

    objc_storeStrong((id *)&self->_compiledClassifier, v17);
    v18 = self->_log;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "description"));
      *(_DWORD *)buf = 138412290;
      v56 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Model asset path: %@", buf, 0xCu);

    }
    v53 = 0;
    v21 = (MLModel *)objc_claimAutoreleasedReturnValue(+[MLModel modelWithContentsOfURL:error:](MLModel, "modelWithContentsOfURL:error:", v17, &v53));
    v14 = v53;
    engageModel = self->_engageModel;
    self->_engageModel = v21;

    if (v14 && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      sub_10003FBC4();
    v12 = v17;
    goto LABEL_26;
  }
  if (v9 != 1)
  {
    v23 = self->_log;
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v23, OS_LOG_TYPE_DEFAULT, "Loading non-updatable classifier model.", buf, 2u);
    }
    v24 = (MLModel *)objc_claimAutoreleasedReturnValue(-[OSIntelligenceTrialManager loadTrialEngageModelByDeletingExistingModel:](self->_trialManager, "loadTrialEngageModelByDeletingExistingModel:", 0));
    v25 = self->_engageModel;
    self->_engageModel = v24;

    v12 = 0;
    v14 = 0;
    goto LABEL_26;
  }
  v10 = self->_log;
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v10, OS_LOG_TYPE_DEFAULT, "Loading updated classifier model.", buf, 2u);
  }
  v63[0] = CFSTR("/var/mobile/Library/OSIntelligence");
  v63[1] = CFSTR("updatedClassifier.modelc");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v63, 2));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](NSURL, "fileURLWithPathComponents:", v11));

  objc_storeStrong((id *)&self->_compiledClassifier, v12);
  v54 = 0;
  v13 = (MLModel *)objc_claimAutoreleasedReturnValue(+[MLModel modelWithContentsOfURL:error:](MLModel, "modelWithContentsOfURL:error:", v12, &v54));
  v14 = v54;
  v15 = self->_engageModel;
  self->_engageModel = v13;

  if (v14)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      sub_10003FC24();
    goto LABEL_15;
  }
LABEL_26:
  v26 = self->_engageModel;
  v27 = self->_log;
  v28 = os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEFAULT);
  if (v26)
  {
    if (v28)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v27, OS_LOG_TYPE_DEFAULT, "Trial engage model found!", buf, 2u);
    }
  }
  else
  {
    if (v28)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v27, OS_LOG_TYPE_DEFAULT, "Trial engage model not found...falling back to default model", buf, 2u);
    }
    v29 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "pathForResource:ofType:", CFSTR("engageModel"), CFSTR("mlmodelc")));
    v32 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v31));

    v52 = 0;
    v33 = (MLModel *)objc_claimAutoreleasedReturnValue(+[MLModel modelWithContentsOfURL:error:](MLModel, "modelWithContentsOfURL:error:", v32, &v52));
    v14 = v52;
    v34 = self->_engageModel;
    self->_engageModel = v33;

    if (v14 && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      sub_10003FBC4();
    v12 = (void *)v32;
  }
  -[OSChargingTwoStagePredictor loadThresholdForModel:](self, "loadThresholdForModel:", self->_engageModel);
  self->_threshold = v35;
  v36 = self->_log;
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    v37 = self->_engageModel;
    log = v36;
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[MLModel modelDescription](v37, "modelDescription"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "metadata"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectForKeyedSubscript:", MLModelCreatorDefinedKey));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("model_version")));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[MLModel modelDescription](self->_engageModel, "modelDescription"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "metadata"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", MLModelCreatorDefinedKey));
    v50 = v14;
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("bolt_id")));
    v42 = v5;
    v43 = p_loadModelLock;
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_threshold));
    *(_DWORD *)buf = 138413058;
    v56 = CFSTR("engageModel");
    v57 = 2112;
    v58 = v38;
    v59 = 2112;
    v60 = v41;
    v61 = 2112;
    v62 = v44;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Engagement model: %@.%@ from bolt job = %@ (threshold = %@)", buf, 0x2Au);

    p_loadModelLock = v43;
    v5 = v42;

    v14 = v50;
  }

LABEL_38:
  os_unfair_lock_unlock(p_loadModelLock);
  return self->_engageModel;
}

- (MLModel)durationModel
{
  os_unfair_lock_s *p_loadModelLock;
  void *v4;
  void *v5;
  OS_os_log *v6;
  OS_os_log *v7;
  int64_t modelExecutionPath;
  int64_t v9;
  OS_os_log *v10;
  void *v11;
  void *v12;
  MLModel *v13;
  id v14;
  MLModel *v15;
  OS_os_log *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  __CFString *v20;
  MLModel *v21;
  id v22;
  MLModel *durationModel;
  NSObject *v24;
  MLModel *v25;
  NSObject *v26;
  __CFString *v27;
  OS_os_log *v28;
  MLModel *v29;
  MLModel *v30;
  MLModel *v31;
  OS_os_log *v32;
  _BOOL4 v33;
  NSBundle *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  MLModel *v38;
  MLModel *v39;
  double v40;
  NSObject *v41;
  MLModel *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  os_unfair_lock_s *v49;
  void *v50;
  void *v52;
  NSObject *log;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  uint8_t buf[4];
  const __CFString *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;
  _QWORD v68[2];

  p_loadModelLock = &self->_loadModelLock;
  os_unfair_lock_lock(&self->_loadModelLock);
  if (self->_durationModel)
    goto LABEL_38;
  self->_modelExecutionPath = -[OSIntelligenceTrialManager longFactorForName:](self->_trialManager, "longFactorForName:", CFSTR("modelExecutionPath"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities numberForPreferenceKey:inDomain:](OSIntelligenceUtilities, "numberForPreferenceKey:inDomain:", CFSTR("modelExecutionPathOverride"), self->_defaultsDomain));
  v5 = v4;
  if (v4)
  {
    self->_modelExecutionPath = (int)objc_msgSend(v4, "intValue");
    v6 = self->_log;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "_modelExecutionPath override loaded", buf, 2u);
    }
  }
  v7 = self->_log;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    modelExecutionPath = self->_modelExecutionPath;
    *(_DWORD *)buf = 134217984;
    v61 = (const __CFString *)modelExecutionPath;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "_modelExecutionPath: %ld", buf, 0xCu);
  }
  v9 = self->_modelExecutionPath;
  if (v9 == 2)
  {
    v12 = 0;
    v14 = 0;
LABEL_15:
    v16 = self->_log;
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v16, OS_LOG_TYPE_DEFAULT, "Loading baseline updatable duration model.", buf, 2u);
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[OSChargingTwoStagePredictor compileModel:](self, "compileModel:", CFSTR("updatable_model_regress")));

    objc_storeStrong((id *)&self->_compiledRegressor, v17);
    v18 = self->_log;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "description"));
      *(_DWORD *)buf = 138412290;
      v61 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Model asset path: %@", buf, 0xCu);

    }
    v58 = 0;
    v21 = (MLModel *)objc_claimAutoreleasedReturnValue(+[MLModel modelWithContentsOfURL:error:](MLModel, "modelWithContentsOfURL:error:", v17, &v58));
    v22 = v58;
    durationModel = self->_durationModel;
    self->_durationModel = v21;

    v24 = self->_log;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = self->_durationModel;
      v26 = v24;
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MLModel modelDescription](v25, "modelDescription"));
      *(_DWORD *)buf = 138412290;
      v61 = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "duration model description: %@", buf, 0xCu);

    }
    if (v22 && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      sub_10003FBC4();
    v12 = v17;
    goto LABEL_29;
  }
  if (v9 == 1)
  {
    v10 = self->_log;
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v10, OS_LOG_TYPE_DEFAULT, "Loading updated duration model.", buf, 2u);
    }
    v68[0] = CFSTR("/var/mobile/Library/OSIntelligence");
    v68[1] = CFSTR("updatedRegressor.modelc");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v68, 2));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](NSURL, "fileURLWithPathComponents:", v11));

    objc_storeStrong((id *)&self->_compiledRegressor, v12);
    v59 = 0;
    v13 = (MLModel *)objc_claimAutoreleasedReturnValue(+[MLModel modelWithContentsOfURL:error:](MLModel, "modelWithContentsOfURL:error:", v12, &v59));
    v14 = v59;
    v15 = self->_durationModel;
    self->_durationModel = v13;

    if (v14)
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
        sub_10003FC24();
      goto LABEL_15;
    }
  }
  else
  {
    v28 = self->_log;
    if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v28, OS_LOG_TYPE_DEFAULT, "Loading non-updatable duration model.", buf, 2u);
    }
    v29 = (MLModel *)objc_claimAutoreleasedReturnValue(-[OSIntelligenceTrialManager loadTrialDurationModelByDeletingExistingModel:](self->_trialManager, "loadTrialDurationModelByDeletingExistingModel:", 0));
    v30 = self->_durationModel;
    self->_durationModel = v29;

    v12 = 0;
  }
  v22 = 0;
LABEL_29:
  v31 = self->_durationModel;
  v32 = self->_log;
  v33 = os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_DEFAULT);
  if (v31)
  {
    if (v33)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v32, OS_LOG_TYPE_DEFAULT, "Trial duration model found!", buf, 2u);
    }
  }
  else
  {
    if (v33)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v32, OS_LOG_TYPE_DEFAULT, "Trial duration model not found...falling back to default model", buf, 2u);
    }
    v34 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "pathForResource:ofType:", CFSTR("durationModel"), CFSTR("mlmodelc")));
    v37 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v36));

    v38 = (MLModel *)objc_claimAutoreleasedReturnValue(+[MLModel modelWithContentsOfURL:error:](MLModel, "modelWithContentsOfURL:error:", v37, 0));
    v39 = self->_durationModel;
    self->_durationModel = v38;

    v12 = (void *)v37;
  }
  -[OSChargingTwoStagePredictor loadAdjustedHoursForModel:](self, "loadAdjustedHoursForModel:", self->_durationModel);
  self->_adjustedDuration = v40;
  v41 = self->_log;
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    v42 = self->_durationModel;
    log = v41;
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[MLModel modelDescription](v42, "modelDescription"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "metadata"));
    v57 = v22;
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectForKeyedSubscript:", MLModelCreatorDefinedKey));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("model_version")));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[MLModel modelDescription](self->_durationModel, "modelDescription"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "metadata"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectForKeyedSubscript:", MLModelCreatorDefinedKey));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("bolt_id")));
    v47 = v12;
    v48 = v5;
    v49 = p_loadModelLock;
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_adjustedDuration));
    *(_DWORD *)buf = 138413058;
    v61 = CFSTR("durationModel");
    v62 = 2112;
    v63 = v43;
    v64 = 2112;
    v65 = v46;
    v66 = 2112;
    v67 = v50;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Duration model: %@.%@ from bolt job = %@ (adjusted duration = %@)", buf, 0x2Au);

    p_loadModelLock = v49;
    v5 = v48;
    v12 = v47;

    v22 = v57;
  }

LABEL_38:
  os_unfair_lock_unlock(p_loadModelLock);
  return self->_durationModel;
}

- (id)timeStringFromDate:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_1000768A8;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_1000768A8, &stru_1000611C0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000768B0, "stringFromDate:", v4));

  return v5;
}

- (OSChargingTwoStagePredictor)initWithDefaultsDomain:(id)a3 withContextStore:(id)a4 withTrialManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  OSChargingTwoStagePredictor *v12;
  OSChargingTwoStagePredictor *v13;
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
  objc_super v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)OSChargingTwoStagePredictor;
  v12 = -[OSChargingTwoStagePredictor init](&v26, "init");
  v13 = v12;
  if (v12)
  {
    v12->_loadModelLock._os_unfair_lock_opaque = 0;
    v14 = os_log_create("com.apple.osintelligence.chargeprediction", "mltwostagemodelpredictor");
    log = v13->_log;
    v13->_log = (OS_os_log *)v14;

    v16 = os_log_create("com.apple.osintelligence.chargeprediction", "mltwostagemodelpredictorStatusLog");
    statusLog = v13->_statusLog;
    v13->_statusLog = (OS_os_log *)v16;

    objc_storeStrong((id *)&v13->_defaultsDomain, a3);
    objc_storeStrong((id *)&v13->_context, a4);
    v18 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities dateForPreferenceKey:inDomain:](OSIntelligenceUtilities, "dateForPreferenceKey:inDomain:", CFSTR("twoStageModelOutput"), v13->_defaultsDomain));
    deadline = v13->_deadline;
    v13->_deadline = (NSDate *)v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities numberForPreferenceKey:inDomain:](OSIntelligenceUtilities, "numberForPreferenceKey:inDomain:", CFSTR("twoStageModelEngagementResult"), v13->_defaultsDomain));
    objc_msgSend(v20, "doubleValue");
    v13->_lastEngagementResult = v21;

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities numberForPreferenceKey:inDomain:](OSIntelligenceUtilities, "numberForPreferenceKey:inDomain:", CFSTR("twoStageModelDurationResult"), v13->_defaultsDomain));
    objc_msgSend(v22, "doubleValue");
    v13->_lastDurationResult = v23;

    objc_storeStrong((id *)&v13->_trialManager, a5);
    -[OSChargingTwoStagePredictor loadMinInputChargeDuration](v13, "loadMinInputChargeDuration");
    v13->_minInputChargeDuration = v24;
    v13->_threshold = 1.0;
  }

  return v13;
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

  v3 = (MLModel *)objc_claimAutoreleasedReturnValue(-[OSIntelligenceTrialManager loadTrialEngageModelByDeletingExistingModel:](self->_trialManager, "loadTrialEngageModelByDeletingExistingModel:", 1));
  engageModel = self->_engageModel;
  self->_engageModel = v3;

  v5 = (MLModel *)objc_claimAutoreleasedReturnValue(-[OSIntelligenceTrialManager loadTrialDurationModelByDeletingExistingModel:](self->_trialManager, "loadTrialDurationModelByDeletingExistingModel:", 1));
  durationModel = self->_durationModel;
  self->_durationModel = v5;

  -[OSChargingTwoStagePredictor loadThresholdForModel:](self, "loadThresholdForModel:", self->_engageModel);
  self->_threshold = v7;
  -[OSChargingTwoStagePredictor loadAdjustedHoursForModel:](self, "loadAdjustedHoursForModel:", self->_durationModel);
  self->_adjustedDuration = v8;
  -[OSChargingTwoStagePredictor loadMinInputChargeDuration](self, "loadMinInputChargeDuration");
  self->_minInputChargeDuration = v9;
  -[OSChargingTwoStagePredictor resetSavedDeadline](self, "resetSavedDeadline");
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
  OS_os_log *log;
  int v14;
  double v15;

  v4 = a3;
  -[OSIntelligenceTrialManager loadTrialThreshold](self->_trialManager, "loadTrialThreshold");
  v6 = v5;
  if (v5 <= 0.0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "modelDescription"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metadata"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", MLModelCreatorDefinedKey));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("threshold")));
    objc_msgSend(v10, "doubleValue");
    v6 = v11;

    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 134217984;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Failed to load trial threshold. Falling back to default %lf", (uint8_t *)&v14, 0xCu);
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
  OS_os_log *log;
  int v14;
  double v15;

  v4 = a3;
  -[OSIntelligenceTrialManager loadTrialAdjustedHours](self->_trialManager, "loadTrialAdjustedHours");
  v6 = v5;
  if (v5 <= 0.0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "modelDescription"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metadata"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", MLModelCreatorDefinedKey));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("leeway")));
    objc_msgSend(v10, "doubleValue");
    v6 = v11;

    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 134217984;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Failed to load trial adjusted hours. Falling back to default %lf", (uint8_t *)&v14, 0xCu);
    }
  }

  return v6;
}

- (double)loadMinInputChargeDuration
{
  double v3;
  double v4;
  OS_os_log *log;
  int v7;
  uint64_t v8;

  -[OSIntelligenceTrialManager loadTrialMinInputChargeDuration](self->_trialManager, "loadTrialMinInputChargeDuration");
  v4 = v3;
  if (v3 <= 0.0)
  {
    log = self->_log;
    v4 = 600.0;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134217984;
      v8 = 0x4082C00000000000;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Failed to load trial minimum duration for model input. Falling back to default %lf", (uint8_t *)&v7, 0xCu);
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
  id v12;
  unint64_t v13;
  void *v14;
  OS_os_log *log;
  uint8_t v17[16];
  void *v18;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v9)
  {
    if (!v8)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "count")));
      v18 = v11;
      v8 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));

    }
    v12 = objc_msgSend(objc_alloc((Class)MLMultiArray), "initWithShape:dataType:error:", v8, a5, 0);
    if (v12 && objc_msgSend(v10, "count"))
    {
      v13 = 0;
      do
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v13));
        objc_msgSend(v12, "setObject:atIndexedSubscript:", v14, v13);

        ++v13;
      }
      while (v13 < (unint64_t)objc_msgSend(v10, "count"));
    }
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Values not present", v17, 2u);
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
  OS_os_log *log;
  __CFString *v9;
  int v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OSChargingTwoStagePredictor engageModel](self, "engageModel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "modelDescription"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metadata"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", MLModelCreatorDefinedKey));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("model_version")));

  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Engagement model bolt ID is %@", (uint8_t *)&v11, 0xCu);
  }
  if (v7)
    v9 = v7;
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
  OS_os_log *log;
  __CFString *v9;
  int v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OSChargingTwoStagePredictor durationModel](self, "durationModel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "modelDescription"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metadata"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", MLModelCreatorDefinedKey));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("model_version")));

  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Duration model bolt ID is %@", (uint8_t *)&v11, 0xCu);
  }
  if (v7)
    v9 = v7;
  else
    v9 = CFSTR("Unknown");

  return v9;
}

- (unint64_t)modelVersion
{
  return -[OSChargingTwoStagePredictor durationModelVersion](self, "durationModelVersion");
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

  v5 = a3;
  +[OSIntelligenceUtilities batteryLevelAtDate:](OSIntelligenceUtilities, "batteryLevelAtDate:", v5);
  self->_pluginBatteryLevel = v6;
  objc_storeStrong((id *)&self->_pluginDate, a3);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    pluginDate = self->_pluginDate;
    v9 = log;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[OSChargingTwoStagePredictor timeStringFromDate:](self, "timeStringFromDate:", pluginDate));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_pluginBatteryLevel));
    v12 = 138412546;
    v13 = v10;
    v14 = 2112;
    v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Plugin date set to %@, plugin battery level to %@", (uint8_t *)&v12, 0x16u);

  }
}

- (double)getHourBinID:(id)a3 forHourBin:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "components:fromDate:", 32, v5));

  v8 = (double)(uint64_t)objc_msgSend(v7, "hour") / (double)a4;
  return v8;
}

- (BOOL)isSufficientDataAvailable
{
  void *v3;
  void *v4;
  NSObject *v5;
  BOOL v6;
  NSObject *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  NSObject *log;
  NSObject *v13;
  void *v14;
  void *v15;
  double v16;
  int v18;
  double v19;
  __int16 v20;
  uint64_t v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities pluginEventsBefore:withMinimumDuration:withMinimumPlugoutBatteryLevel:](OSIntelligenceUtilities, "pluginEventsBefore:withMinimumDuration:withMinimumPlugoutBatteryLevel:", v3, self->_minInputChargeDuration, 80.0));
  if ((unint64_t)objc_msgSend(v4, "count") > 8)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startDate"));
    objc_msgSend(v3, "timeIntervalSinceDate:", v9);
    v11 = v10;

    if (v11 <= 1209600.0)
    {
      log = self->_log;
      v6 = 0;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        v13 = log;
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "startDate"));
        objc_msgSend(v3, "timeIntervalSinceDate:", v15);
        v18 = 134217984;
        v19 = v16 / 86400.0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Not enough days of history: %f", (uint8_t *)&v18, 0xCu);

        goto LABEL_8;
      }
    }
    else
    {
      v6 = 1;
    }
  }
  else
  {
    v5 = self->_log;
    v6 = 0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v5;
      v18 = 134218240;
      v19 = COERCE_DOUBLE(objc_msgSend(v4, "count"));
      v20 = 2048;
      v21 = 9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Not enough charging events: %lu < %lu", (uint8_t *)&v18, 0x16u);

LABEL_8:
      v6 = 0;
    }
  }

  return v6;
}

- (id)predictFullChargeDateWithBatteryLevel:(unint64_t)a3
{
  OS_os_log *log;
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

  if (self->_deadline)
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      deadline = self->_deadline;
      v15 = 138412290;
      v16 = deadline;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Returning saved deadline: %@", (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    pluginDate = self->_pluginDate;
    pluginBatteryLevel = self->_pluginBatteryLevel;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[OSChargingTwoStagePredictor adjustedChargingDecision:withPluginDate:withPluginBatteryLevel:forDate:forStatus:](self, "adjustedChargingDecision:withPluginDate:withPluginBatteryLevel:forDate:forStatus:", a3, pluginDate, v9, 0, pluginBatteryLevel);
    v11 = v10;

    v12 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", v11));
    v13 = self->_deadline;
    self->_deadline = v12;

    +[OSIntelligenceUtilities setDate:forPreferenceKey:inDomain:](OSIntelligenceUtilities, "setDate:forPreferenceKey:inDomain:", self->_deadline, CFSTR("twoStageModelOutput"), self->_defaultsDomain);
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

  v7 = a7;
  v12 = a6;
  v13 = 88;
  if (v7)
    v13 = 96;
  v14 = *(id *)((char *)&self->super.isa + v13);
  -[OSChargingTwoStagePredictor chargingDecision:withPluginDate:withPluginBatteryLevel:forDate:withLog:](self, "chargingDecision:withPluginDate:withPluginBatteryLevel:forDate:withLog:", a3, a4, v12, v14, a5);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v22 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "MLTwoStageModel output %f hours", buf, 0xCu);
  }
  v15 = 0.0 - self->_adjustedDuration;
  v16 = v14;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = v15 < 0.0
        ? CFSTR("Distant Past")
        : (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dateByAddingTimeInterval:", v15 * 3600.0));
    adjustedDuration = self->_adjustedDuration;
    *(_DWORD *)buf = 138412802;
    v22 = v17;
    v23 = 2048;
    v24 = adjustedDuration;
    v25 = 2048;
    v26 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "SmartCharge: %@ duration post adjustment of %f hours, is %f hours", buf, 0x20u);
    if (v15 >= 0.0)

  }
  if (!v7)
  {
    self->_lastDurationResult = v15;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v15));
    +[OSIntelligenceUtilities setNumber:forPreferenceKey:inDomain:](OSIntelligenceUtilities, "setNumber:forPreferenceKey:inDomain:", v19, CFSTR("twoStageModelDurationResult"), self->_defaultsDomain);

  }
  return v15 * 3600.0;
}

- (id)getInputFeaturesWithPluginDate:(id)a3 withPluginBatteryLevel:(double)a4 forDate:(id)a5 withLog:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  double v16;
  double v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v23;
  void *v24;

  v10 = a3;
  v11 = a6;
  v12 = a5;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "components:fromDate:", 32, v12));

  v15 = objc_msgSend(v14, "hour");
  objc_msgSend(v10, "timeIntervalSinceDate:", v12);
  v17 = v16;

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities pluginEventsBefore:withMinimumDuration:withMinimumPlugoutBatteryLevel:](OSIntelligenceUtilities, "pluginEventsBefore:withMinimumDuration:withMinimumPlugoutBatteryLevel:", v10, self->_minInputChargeDuration, 80.0));
  v19 = v11;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v18, "count")));
    v23 = 138412290;
    v24 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Found %@ events for featurization", (uint8_t *)&v23, 0xCu);

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[OSChargingTwoStagePredictor getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:](self, "getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:", v18, (unint64_t)a4, v10, v19, (double)(uint64_t)v15, -v17));

  return v21;
}

- (OSChargingTwoStagePredictorQueryResult)chargingDecision:(SEL)a3 withPluginDate:(unint64_t)a4 withPluginBatteryLevel:(id)a5 forDate:(double)a6 withLog:(id)a7
{
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  double v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  void *i;
  double v33;
  NSObject *v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  double threshold;
  _BOOL4 v53;
  double v54;
  BOOL v55;
  double v56;
  void *v57;
  void *v58;
  unsigned int v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  NSObject *v64;
  double v65;
  void *v66;
  id v67;
  id v68;
  uint64_t v69;
  void *j;
  double v71;
  NSObject *v72;
  double v73;
  void *v74;
  void *v75;
  void *v76;
  double v77;
  double v78;
  void *v79;
  void *v80;
  double v81;
  OSChargingTwoStagePredictorQueryResult *result;
  void *v83;
  OSChargingTwoStagePredictor *v84;
  void *v85;
  void *v86;
  void *v87;
  NSObject *v88;
  NSObject *v89;
  id v90;
  id v91;
  id v92;
  id v93;
  void *v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  uint8_t v103[128];
  uint8_t buf[4];
  double v105;
  __int16 v106;
  double v107;
  _BYTE v108[128];

  v13 = a5;
  v14 = a7;
  v15 = a8;
  v16 = (void *)os_transaction_create("com.apple.osintelligence.smartcharging.mlmodelpredictor.decision");
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[OSChargingTwoStagePredictor getInputFeaturesWithPluginDate:withPluginBatteryLevel:forDate:withLog:](self, "getInputFeaturesWithPluginDate:withPluginBatteryLevel:forDate:withLog:", v13, v14, v15, a6));
  *(_QWORD *)&retstr->var0 = 0;
  *(int64x2_t *)&retstr->var1 = vdupq_n_s64(0xC0F869F000000000);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[OSChargingTwoStagePredictor engageModel](self, "engageModel"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "modelDescription"));
  v20 = objc_msgSend(v19, "isUpdatable");

  v94 = v17;
  if (v20)
  {
    v21 = objc_claimAutoreleasedReturnValue(-[OSChargingTwoStagePredictor convertInputFeaturesToNeuralFeatures:](self, "convertInputFeaturesToNeuralFeatures:", v17));
    if (!v21)
      goto LABEL_46;
    v22 = v21;
    v84 = self;
    v86 = v16;
    v90 = v14;
    v92 = v13;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[OSChargingTwoStagePredictor engageModel](self, "engageModel"));
    v83 = (void *)v22;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "predictionFromFeatures:error:", v22, 0));

    v88 = v15;
    v25 = v15;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "featureNames")));
      *(_DWORD *)buf = 138412290;
      v105 = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "outfeature names: %@", buf, 0xCu);

    }
    v101 = 0u;
    v102 = 0u;
    v99 = 0u;
    v100 = 0u;
    v27 = v24;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "featureNames"));
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v99, v108, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v100;
      do
      {
        for (i = 0; i != v30; i = (char *)i + 1)
        {
          if (*(_QWORD *)v100 != v31)
            objc_enumerationMutation(v28);
          v33 = *(double *)(*((_QWORD *)&v99 + 1) + 8 * (_QWORD)i);
          v34 = v25;
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            v35 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "featureValueForName:", *(_QWORD *)&v33)));
            *(_DWORD *)buf = 138412546;
            v105 = v33;
            v106 = 2112;
            v107 = v35;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "  outfeatures: %@ - %@", buf, 0x16u);

          }
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v99, v108, 16);
      }
      while (v30);
    }

    v36 = v27;
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "featureValueForName:", CFSTR("Identity")));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "dictionaryValue"));

    v39 = v25;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v40 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "description")));
      *(_DWORD *)buf = 138412290;
      v105 = v40;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Neural engagement model raw output %@", buf, 0xCu);

      v36 = v27;
    }

    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("1")));
    objc_msgSend(v41, "doubleValue");
    v43 = v42;

    v13 = v92;
    v15 = v88;
    v14 = v90;
    self = v84;
    v16 = v86;
    v44 = v83;
  }
  else
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[OSChargingTwoStagePredictor engageModel](self, "engageModel"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "predictionFromFeatures:error:", v17, 0));

    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "featureValueForName:", CFSTR("classProbability")));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "dictionaryValue"));

    v47 = v15;
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      v48 = v36;
      v49 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "description")));
      *(_DWORD *)buf = 138412290;
      v105 = v49;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Engagement model raw output %@", buf, 0xCu);

      v36 = v48;
    }

    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKeyedSubscript:", &off_100064E68));
    objc_msgSend(v38, "doubleValue");
    v43 = v50;
  }

  if (self->_statusLog != v15)
  {
    self->_lastEngagementResult = v43;
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v43));
    +[OSIntelligenceUtilities setNumber:forPreferenceKey:inDomain:](OSIntelligenceUtilities, "setNumber:forPreferenceKey:inDomain:", v51, CFSTR("twoStageModelEngagementResult"), self->_defaultsDomain);

  }
  retstr->var2 = v43;
  threshold = self->_threshold;
  v53 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  v17 = v94;
  if (v43 <= threshold)
  {
    if (v53)
    {
      v56 = self->_threshold;
      *(_DWORD *)buf = 134218240;
      v105 = v43;
      v106 = 2048;
      v107 = v56;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Engagement model says NO (Prob %lf < Threshold %lf)", buf, 0x16u);
    }
    v55 = 0;
  }
  else
  {
    if (v53)
    {
      v54 = self->_threshold;
      *(_DWORD *)buf = 134218240;
      v105 = v43;
      v106 = 2048;
      v107 = v54;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Engagement model says YES (Prob %lf > Threshold %lf)", buf, 0x16u);
    }
    v55 = 1;
  }
  retstr->var0 = v55;
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[OSChargingTwoStagePredictor durationModel](self, "durationModel"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "modelDescription"));
  v59 = objc_msgSend(v58, "isUpdatable");

  if (v59)
  {
    v60 = objc_claimAutoreleasedReturnValue(-[OSChargingTwoStagePredictor convertInputFeaturesToNeuralFeatures:](self, "convertInputFeaturesToNeuralFeatures:", v94));
    if (v60)
    {
      v61 = v60;
      v87 = v16;
      v91 = v14;
      v93 = v13;
      v62 = (void *)objc_claimAutoreleasedReturnValue(-[OSChargingTwoStagePredictor durationModel](self, "durationModel"));
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "predictionFromFeatures:error:", v61, 0));

      v89 = v15;
      v64 = v15;
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        v65 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "featureNames")));
        *(_DWORD *)buf = 138412290;
        v105 = v65;
        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "outfeature names: %@", buf, 0xCu);

      }
      v85 = (void *)v61;

      v97 = 0u;
      v98 = 0u;
      v95 = 0u;
      v96 = 0u;
      v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "featureNames"));
      v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v95, v103, 16);
      if (v67)
      {
        v68 = v67;
        v69 = *(_QWORD *)v96;
        do
        {
          for (j = 0; j != v68; j = (char *)j + 1)
          {
            if (*(_QWORD *)v96 != v69)
              objc_enumerationMutation(v66);
            v71 = *(double *)(*((_QWORD *)&v95 + 1) + 8 * (_QWORD)j);
            v72 = v64;
            if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
            {
              v73 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "featureValueForName:", *(_QWORD *)&v71)));
              *(_DWORD *)buf = 138412546;
              v105 = v71;
              v106 = 2112;
              v107 = v73;
              _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "  outfeatures: %@ - %@", buf, 0x16u);

            }
          }
          v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v95, v103, 16);
        }
        while (v68);
      }

      v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "featureValueForName:", CFSTR("Identity")));
      v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "multiArrayValue"));

      v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "objectAtIndexedSubscript:", 0));
      objc_msgSend(v76, "doubleValue");
      v78 = v77;

      v13 = v93;
      v15 = v89;
      v14 = v91;
      v79 = v85;
      v16 = v87;
      v17 = v94;
      goto LABEL_44;
    }
LABEL_46:
    v78 = -99999.0;
    goto LABEL_47;
  }
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[OSChargingTwoStagePredictor durationModel](self, "durationModel"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "predictionFromFeatures:error:", v94, 0));

  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "featureValueForName:", CFSTR("duration_pred")));
  objc_msgSend(v63, "doubleValue");
  v78 = v81;
LABEL_44:

  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v105 = v78;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Regression model output: %lf", buf, 0xCu);
  }
LABEL_47:
  retstr->var1 = v78;

  return result;
}

- (id)convertInputFeaturesToNeuralFeatures:(id)a3
{
  id v4;
  OS_os_log *log;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v13;
  uint8_t buf[16];

  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Convert model input features for neural model", buf, 2u);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dictionary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OSChargingTwoStagePredictor getMultiArrayForFeatureDict:](self, "getMultiArrayForFeatureDict:", v7));

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("layer1_input"));
  v13 = 0;
  v9 = objc_msgSend(objc_alloc((Class)MLDictionaryFeatureProvider), "initWithDictionary:error:", v6, &v13);
  v10 = v13;
  if (v10)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      sub_10003FC84();
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
  +[OSIntelligenceUtilities setDate:forPreferenceKey:inDomain:](OSIntelligenceUtilities, "setDate:forPreferenceKey:inDomain:", self->_deadline, CFSTR("twoStageModelOutput"), self->_defaultsDomain);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_lastEngagementResult));
  +[OSIntelligenceUtilities setNumber:forPreferenceKey:inDomain:](OSIntelligenceUtilities, "setNumber:forPreferenceKey:inDomain:", v9, CFSTR("twoStageModelEngagementResult"), self->_defaultsDomain);

  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_lastDurationResult));
  +[OSIntelligenceUtilities setNumber:forPreferenceKey:inDomain:](OSIntelligenceUtilities, "setNumber:forPreferenceKey:inDomain:", v10, CFSTR("twoStageModelDurationResult"), self->_defaultsDomain);

}

- (void)deleteCompiledModels
{
  void *v3;
  void *v4;
  double v5;
  NSObject *log;
  double threshold;
  NSObject *v8;
  void *v9;
  void *v10;
  double v11;
  NSObject *v12;
  double adjustedDuration;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;

  v3 = (void *)os_transaction_create("com.apple.osintelligence.deleteCompiledModels");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OSIntelligenceTrialManager loadTrialEngageModelByDeletingExistingModel:](self->_trialManager, "loadTrialEngageModelByDeletingExistingModel:", 1));
  if (v4)
  {
    os_unfair_lock_lock(&self->_loadModelLock);
    objc_storeStrong((id *)&self->_engageModel, v4);
    -[OSChargingTwoStagePredictor loadThresholdForModel:](self, "loadThresholdForModel:", self->_engageModel);
    self->_threshold = v5;
    os_unfair_lock_unlock(&self->_loadModelLock);
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      threshold = self->_threshold;
      v8 = log;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", threshold));
      v16 = 138412290;
      v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Trial engage model found! Threshold: %@", (uint8_t *)&v16, 0xCu);

    }
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[OSIntelligenceTrialManager loadTrialDurationModelByDeletingExistingModel:](self->_trialManager, "loadTrialDurationModelByDeletingExistingModel:", 1));

  if (v10)
  {
    os_unfair_lock_lock(&self->_loadModelLock);
    objc_storeStrong((id *)&self->_durationModel, v10);
    -[OSChargingTwoStagePredictor loadAdjustedHoursForModel:](self, "loadAdjustedHoursForModel:", self->_durationModel);
    self->_adjustedDuration = v11;
    os_unfair_lock_unlock(&self->_loadModelLock);
    v12 = self->_log;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      adjustedDuration = self->_adjustedDuration;
      v14 = v12;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", adjustedDuration));
      v16 = 138412290;
      v17 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Trial duration model found! adjustedDuration = %@", (uint8_t *)&v16, 0xCu);

    }
  }

}

- (void)deleteUpdatedModels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  NSObject *log;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[2];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  _QWORD v27[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v27[0] = CFSTR("/var/mobile/Library/OSIntelligence");
  v27[1] = CFSTR("updatedClassifier.modelc");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](NSURL, "fileURLWithPathComponents:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "path"));
  v21 = 0;
  v7 = objc_msgSend(v3, "removeItemAtPath:error:", v6, &v21);
  v8 = v21;

  if ((v7 & 1) == 0)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v10 = log;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "path"));
      *(_DWORD *)buf = 138412546;
      v24 = v11;
      v25 = 2112;
      v26 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Failed to clean up path: %@ -- %@", buf, 0x16u);

    }
  }
  v22[0] = CFSTR("/var/mobile/Library/OSIntelligence");
  v22[1] = CFSTR("updatedRegressor.modelc");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 2));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](NSURL, "fileURLWithPathComponents:", v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "path"));
  v20 = v8;
  v15 = objc_msgSend(v3, "removeItemAtPath:error:", v14, &v20);
  v16 = v20;

  if ((v15 & 1) == 0)
  {
    v17 = self->_log;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "path"));
      *(_DWORD *)buf = 138412546;
      v24 = v19;
      v25 = 2112;
      v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Failed to clean up path: %@ -- %@", buf, 0x16u);

    }
  }

}

- (id)compileModel:(id)a3
{
  id v4;
  NSBundle *v5;
  void *v6;
  void *v7;
  id v8;
  OS_os_log *log;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  OS_os_log *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;

  v4 = a3;
  v5 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URLForResource:withExtension:", v4, CFSTR("ml")));

  v22 = 0;
  objc_msgSend(v7, "checkResourceIsReachableAndReturnError:", &v22);
  v8 = v22;
  log = self->_log;
  if (v8)
  {
    v10 = v8;
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      sub_10003FE10();

LABEL_5:
    v11 = 0;
    goto LABEL_19;
  }
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEFAULT))
  {
    v12 = log;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description"));
    *(_DWORD *)buf = 138412290;
    v24 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "model url access success: %@", buf, 0xCu);

  }
  if (!v7)
  {
    v17 = self->_log;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_10003FCE4(v17, (uint64_t)self);
    goto LABEL_5;
  }
  v21 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MLModel compileModelAtURL:error:](MLModel, "compileModelAtURL:error:", v7, &v21));
  v15 = v21;
  v16 = self->_log;
  if (v15)
  {
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
      sub_10003FDB0();
    v11 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
    {
      v18 = v16;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "description"));
      *(_DWORD *)buf = 138412290;
      v24 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "compiled model URL: %@", buf, 0xCu);

    }
    v11 = v14;
  }

LABEL_19:
  return v11;
}

- (void)loadEngagementModelFromURL:(id)a3
{
  id v5;
  OS_os_log *log;
  MLModel *v7;
  id v8;
  MLModel *engageModel;
  double v10;
  id v11;
  uint8_t buf[4];
  id v13;

  v5 = a3;
  os_unfair_lock_lock(&self->_loadModelLock);
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Reload engagement model: %@", buf, 0xCu);
  }
  v11 = 0;
  v7 = (MLModel *)objc_claimAutoreleasedReturnValue(+[MLModel modelWithContentsOfURL:error:](MLModel, "modelWithContentsOfURL:error:", v5, &v11));
  v8 = v11;
  engageModel = self->_engageModel;
  self->_engageModel = v7;

  if (v8)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      sub_10003FBC4();
  }
  else
  {
    objc_storeStrong((id *)&self->_compiledClassifier, a3);
    -[OSChargingTwoStagePredictor loadThresholdForModel:](self, "loadThresholdForModel:", self->_engageModel);
    self->_threshold = v10;
  }
  os_unfair_lock_unlock(&self->_loadModelLock);

}

- (void)loadDurationModelFromURL:(id)a3
{
  id v5;
  OS_os_log *log;
  MLModel *v7;
  id v8;
  MLModel *durationModel;
  double v10;
  id v11;
  uint8_t buf[4];
  id v13;

  v5 = a3;
  os_unfair_lock_lock(&self->_loadModelLock);
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Reload duration model: %@", buf, 0xCu);
  }
  v11 = 0;
  v7 = (MLModel *)objc_claimAutoreleasedReturnValue(+[MLModel modelWithContentsOfURL:error:](MLModel, "modelWithContentsOfURL:error:", v5, &v11));
  v8 = v11;
  durationModel = self->_durationModel;
  self->_durationModel = v7;

  if (v8)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      sub_10003FBC4();
  }
  else
  {
    objc_storeStrong((id *)&self->_compiledRegressor, a3);
    -[OSChargingTwoStagePredictor loadAdjustedHoursForModel:](self, "loadAdjustedHoursForModel:", self->_durationModel);
    self->_adjustedDuration = v10;
  }
  os_unfair_lock_unlock(&self->_loadModelLock);

}

- (id)loadModelWithModelNameString:(id)a3
{
  id v4;
  NSBundle *v5;
  void *v6;
  void *v7;
  void *v8;
  OS_os_log *log;
  void *v10;
  id v11;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;

  v4 = a3;
  os_unfair_lock_lock(&self->_loadModelLock);
  v5 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pathForResource:ofType:", v4, CFSTR("mlmodelc")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v7));

  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v15 = v4;
    v16 = 2112;
    v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Loading model %@ from disk at path %@", buf, 0x16u);
  }
  v13 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MLModel modelWithContentsOfURL:error:](MLModel, "modelWithContentsOfURL:error:", v8, &v13));
  v11 = v13;
  if (v11 && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    sub_10003FBC4();
  os_unfair_lock_unlock(&self->_loadModelLock);

  return v10;
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

- (OSIntelligenceTrialManager)trialManager
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

- (int64_t)modelExecutionPath
{
  return self->_modelExecutionPath;
}

- (void)setModelExecutionPath:(int64_t)a3
{
  self->_modelExecutionPath = a3;
}

- (NSNumber)modelUpdateIterations
{
  return self->_modelUpdateIterations;
}

- (void)setModelUpdateIterations:(id)a3
{
  objc_storeStrong((id *)&self->_modelUpdateIterations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelUpdateIterations, 0);
  objc_storeStrong((id *)&self->_compiledRegressor, 0);
  objc_storeStrong((id *)&self->_compiledClassifier, 0);
  objc_storeStrong((id *)&self->_deadline, 0);
  objc_storeStrong((id *)&self->_trialManager, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_defaultsDomain, 0);
  objc_storeStrong((id *)&self->_statusLog, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_pluginDate, 0);
  objc_storeStrong((id *)&self->_durationModel, 0);
  objc_storeStrong((id *)&self->_engageModel, 0);
}

@end
