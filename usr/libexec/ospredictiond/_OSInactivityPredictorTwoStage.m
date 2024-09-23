@implementation _OSInactivityPredictorTwoStage

- (_OSInactivityPredictorTwoStage)init
{
  return -[_OSInactivityPredictorTwoStage initWithAlternateModel:inEvaluationMode:](self, "initWithAlternateModel:inEvaluationMode:", 0, 0);
}

- (_OSInactivityPredictorTwoStage)initWithAlternateModel:(BOOL)a3 inEvaluationMode:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  _OSInactivityPredictorTwoStage *v6;
  const char *v7;
  os_log_t v8;
  OS_os_log *log;
  dispatch_queue_attr_t v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  uint64_t v14;
  NSDate *lastInputDate;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const __CFString *v23;
  NSObject *v24;
  uint64_t v25;
  TRIClient *trialClient;
  TRIClient *v27;
  id v28;
  _QWORD v30[4];
  id v31;
  BOOL v32;
  id location;
  objc_super v34;

  v4 = a4;
  v5 = a3;
  v34.receiver = self;
  v34.super_class = (Class)_OSInactivityPredictorTwoStage;
  v6 = -[_OSInactivityPredictor init](&v34, "init");
  if (v6)
  {
    if (v4)
      v7 = "inactivity.twoStageEvaluator";
    else
      v7 = "inactivity.twoStagePredictor";
    v8 = os_log_create("com.apple.osintelligence", v7);
    log = v6->_log;
    v6->_log = (OS_os_log *)v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = dispatch_queue_create("com.apple.osintelligence.queue", v11);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v12;

    v14 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
    lastInputDate = v6->_lastInputDate;
    v6->_lastInputDate = (NSDate *)v14;

    v16 = v6->_log;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      sub_10003E3BC(v5, v16, v17, v18, v19, v20, v21, v22);
    if (v5)
      v23 = CFSTR("twoStageXGB_v3_alt");
    else
      v23 = CFSTR("twoStageXGB_v3");
    -[_OSInactivityPredictor setPredictorType:](v6, "setPredictorType:", v23);
    -[_OSInactivityPredictor setQueryingMechanism:](v6, "setQueryingMechanism:", CFSTR("single"));
    -[_OSInactivityPredictor setRequireEnoughHistory:](v6, "setRequireEnoughHistory:", 1);
    v24 = v6->_log;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      sub_10003D7B4(v24);
    v25 = objc_claimAutoreleasedReturnValue(+[TRIClient clientWithIdentifier:](TRIClient, "clientWithIdentifier:", 293));
    trialClient = v6->_trialClient;
    v6->_trialClient = (TRIClient *)v25;

    -[_OSInactivityPredictorTwoStage updateTrialParameters:](v6, "updateTrialParameters:", v5);
    objc_initWeak(&location, v6);
    v27 = v6->_trialClient;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1000145FC;
    v30[3] = &unk_100060C38;
    objc_copyWeak(&v31, &location);
    v32 = v5;
    v28 = -[TRIClient addUpdateHandlerForNamespaceName:usingBlock:](v27, "addUpdateHandlerForNamespaceName:usingBlock:", CFSTR("COREOS_PREDICTION_INACTIVITY"), v30);
    -[_OSInactivityPredictor setConfidenceThresholdRelaxed:](v6, "setConfidenceThresholdRelaxed:", 0.5);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }
  return v6;
}

- (void)updateTrialParameters:(BOOL)a3
{
  _BOOL4 v3;
  OS_os_log *log;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  OS_os_log *v20;
  MLModel *v21;
  MLModel *engageModel;
  MLModel *v23;
  MLModel *durationModel;
  OS_os_log *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  const __CFString *v42;
  OS_os_log *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const __CFString *v51;
  void *v52;
  void *v53;
  double v54;
  void *v55;
  double v56;
  _BOOL4 v57;
  uint8_t buf[16];

  v3 = a3;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG))
    sub_10003E4E8(log, v6, v7, v8, v9, v10, v11, v12);
  v57 = v3;
  if (v3)
    v13 = CFSTR("alternateInactivityEngageModel");
  else
    v13 = CFSTR("defaultInactivityEngageModel");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", v13, CFSTR("COREOS_PREDICTION_INACTIVITY")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "directoryValue"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "path"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("inactivityDurationModel"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "directoryValue"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "path"));

  v20 = self->_log;
  if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v20, OS_LOG_TYPE_DEFAULT, "Loading compiled models", buf, 2u);
  }
  v21 = (MLModel *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities loadCompiledModelFromPath:](OSIntelligenceUtilities, "loadCompiledModelFromPath:", v16));
  engageModel = self->_engageModel;
  self->_engageModel = v21;

  v23 = (MLModel *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities loadCompiledModelFromPath:](OSIntelligenceUtilities, "loadCompiledModelFromPath:", v19));
  durationModel = self->_durationModel;
  self->_durationModel = v23;

  v25 = self->_log;
  if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEBUG))
    sub_10003E4A8((os_log_t)v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MLModel modelDescription](self->_engageModel, "modelDescription"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "metadata"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", MLModelCreatorDefinedKey));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("recommended_wait_time")));
  objc_msgSend(v29, "doubleValue");
  v31 = v30;

  -[_OSInactivityPredictor setRecommendedWaitTime:](self, "setRecommendedWaitTime:", fmax(v31, 1800.0));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MLModel modelDescription](self->_engageModel, "modelDescription"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "metadata"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", MLModelCreatorDefinedKey));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("long_threshold")));
  objc_msgSend(v35, "doubleValue");
  -[_OSInactivityPredictor setLongThreshold:](self, "setLongThreshold:");

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[MLModel modelDescription](self->_engageModel, "modelDescription"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "metadata"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", MLModelCreatorDefinedKey));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("model_version")));
  v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "description"));
  v41 = (void *)v40;
  if (v40)
    v42 = (const __CFString *)v40;
  else
    v42 = CFSTR("None");
  -[_OSInactivityPredictor setModelVersion:](self, "setModelVersion:", v42);

  v43 = self->_log;
  if (os_log_type_enabled((os_log_t)v43, OS_LOG_TYPE_DEBUG))
    sub_10003E438(v43, v44, v45, v46, v47, v48, v49, v50);
  if (v57)
    v51 = CFSTR("alternateConfidenceThreshold");
  else
    v51 = CFSTR("defaultConfidenceThreshold");
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", v51, CFSTR("COREOS_PREDICTION_INACTIVITY")));
  objc_msgSend(v52, "doubleValue");
  -[_OSInactivityPredictor setConfidenceThresholdStrict:](self, "setConfidenceThresholdStrict:");

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("multiplicativeLeewayStrict"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
  objc_msgSend(v53, "doubleValue");
  self->_multiplicativeLeewayStrict = v54;

  v55 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("multiplicativeLeewayRelaxed"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
  objc_msgSend(v55, "doubleValue");
  self->_multiplicativeLeewayRelaxed = v56;

}

+ (id)predictor
{
  return objc_msgSend(objc_alloc((Class)objc_opt_class(a1)), "initWithAlternateModel:inEvaluationMode:", 0, 0);
}

+ (id)alternatePredictor
{
  return objc_msgSend(objc_alloc((Class)objc_opt_class(a1)), "initWithAlternateModel:inEvaluationMode:", 1, 0);
}

+ (id)evaluator
{
  return objc_msgSend(objc_alloc((Class)objc_opt_class(a1)), "initWithAlternateModel:inEvaluationMode:", 0, 1);
}

- (id)longInactivityPredictionResultAtDate:(id)a3 withTimeSinceInactive:(double)a4 withOptions:(int64_t)a5 withError:(id *)a6
{
  id v9;
  void *v10;
  NSObject *queue;
  id v12;
  OS_os_log *log;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void **v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  _OSInactivityPredictorTwoStage *v24;
  uint64_t *v25;
  int64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint8_t buf[4];
  int64_t v34;

  v9 = a3;
  v10 = (void *)os_transaction_create("com.apple.osintelligence.inactivityprediction.twostage.prediction");
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_100014C8C;
  v31 = sub_100014C9C;
  v32 = 0;
  queue = self->_queue;
  v19 = _NSConcreteStackBlock;
  v20 = 3221225472;
  v21 = sub_100014CA4;
  v22 = &unk_100060C60;
  v12 = v9;
  v23 = v12;
  v24 = self;
  v25 = &v27;
  v26 = a5;
  dispatch_sync(queue, &v19);
  if (v28[5])
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v34 = a5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "(%ld) Returning Cached output", buf, 0xCu);
    }
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[_OSLockHistory sharedInstance](_OSLockHistory, "sharedInstance", v19, v20, v21, v22));
    v15 = objc_claimAutoreleasedReturnValue(-[_OSInactivityPredictorTwoStage longInactivityPredictionResultAtDate:withLockHistory:withOptions:withError:](self, "longInactivityPredictionResultAtDate:withLockHistory:withOptions:withError:", v12, v14, a5, a6));
    v16 = (void *)v28[5];
    v28[5] = v15;

  }
  v17 = (id)v28[5];

  _Block_object_dispose(&v27, 8);
  return v17;
}

- (id)longInactivityPredictionResultAtDate:(id)a3 withLockHistory:(id)a4 withOptions:(int64_t)a5 withError:(id *)a6
{
  id v10;
  id v11;
  NSObject *queue;
  id v13;
  id v14;
  id v15;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  int64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v10 = a3;
  v11 = a4;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_100014C8C;
  v33 = sub_100014C9C;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_100014C8C;
  v27 = sub_100014C9C;
  v28 = 0;
  queue = self->_queue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100014FC0;
  v17[3] = &unk_100060CB0;
  v17[4] = self;
  v18 = v10;
  v19 = v11;
  v20 = &v23;
  v21 = &v29;
  v22 = a5;
  v13 = v11;
  v14 = v10;
  dispatch_sync(queue, v17);
  *a6 = objc_retainAutorelease((id)v24[5]);
  v15 = (id)v30[5];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v15;
}

- (MLModel)engageModel
{
  return self->_engageModel;
}

- (MLModel)durationModel
{
  return self->_durationModel;
}

- (double)multiplicativeLeewayStrict
{
  return self->_multiplicativeLeewayStrict;
}

- (void)setMultiplicativeLeewayStrict:(double)a3
{
  self->_multiplicativeLeewayStrict = a3;
}

- (double)multiplicativeLeewayRelaxed
{
  return self->_multiplicativeLeewayRelaxed;
}

- (void)setMultiplicativeLeewayRelaxed:(double)a3
{
  self->_multiplicativeLeewayRelaxed = a3;
}

- (TRIClient)trialClient
{
  return self->_trialClient;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSDate)lastInputDate
{
  return self->_lastInputDate;
}

- (void)setLastInputDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastInputDate, a3);
}

- (NSDate)lastPredictedDate
{
  return self->_lastPredictedDate;
}

- (void)setLastPredictedDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastPredictedDate, a3);
}

- (_OSInactivityPredictorOutput)predictionOutput
{
  return self->_predictionOutput;
}

- (void)setPredictionOutput:(id)a3
{
  objc_storeStrong((id *)&self->_predictionOutput, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionOutput, 0);
  objc_storeStrong((id *)&self->_lastPredictedDate, 0);
  objc_storeStrong((id *)&self->_lastInputDate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);
  objc_storeStrong((id *)&self->_durationModel, 0);
  objc_storeStrong((id *)&self->_engageModel, 0);
}

@end
