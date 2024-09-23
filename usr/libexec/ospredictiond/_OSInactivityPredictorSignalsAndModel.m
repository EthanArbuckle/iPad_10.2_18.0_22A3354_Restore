@implementation _OSInactivityPredictorSignalsAndModel

- (_OSInactivityPredictorSignalsAndModel)init
{
  id v3;
  void *v4;
  _OSInactivityPredictorSignalsAndModel *v5;

  v3 = objc_alloc((Class)objc_opt_class(self));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_OSInactivityPredictorTwoStage predictor](_OSInactivityPredictorTwoStage, "predictor"));
  v5 = (_OSInactivityPredictorSignalsAndModel *)objc_msgSend(v3, "initWithPredictor:", v4);

  return v5;
}

- (_OSInactivityPredictorSignalsAndModel)initWithPredictor:(id)a3
{
  id v5;
  _OSInactivityPredictorSignalsAndModel *v6;
  OSIDNDMonitor *v7;
  OSIDNDMonitor *dndMonitor;
  OSIAlarmMonitor *v9;
  OSIAlarmMonitor *alarmMonitor;
  uint64_t v11;
  TRIClient *trialClient;
  TRIClient *v13;
  id v14;
  uint64_t v15;
  OSIntelligenceAnalyticsManager *analyticsManager;
  os_log_t v17;
  OS_os_log *log;
  void **v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  id location;
  objc_super v26;

  v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)_OSInactivityPredictorSignalsAndModel;
  v6 = -[_OSInactivityPredictor init](&v26, "init");
  if (v6)
  {
    v7 = objc_alloc_init(OSIDNDMonitor);
    dndMonitor = v6->_dndMonitor;
    v6->_dndMonitor = v7;

    v9 = objc_alloc_init(OSIAlarmMonitor);
    alarmMonitor = v6->_alarmMonitor;
    v6->_alarmMonitor = v9;

    objc_storeStrong((id *)&v6->_baseModel, a3);
    v11 = objc_claimAutoreleasedReturnValue(+[TRIClient clientWithIdentifier:](TRIClient, "clientWithIdentifier:", 293));
    trialClient = v6->_trialClient;
    v6->_trialClient = (TRIClient *)v11;

    -[_OSInactivityPredictorSignalsAndModel updateTrialParameters](v6, "updateTrialParameters");
    objc_initWeak(&location, v6);
    v13 = v6->_trialClient;
    v20 = _NSConcreteStackBlock;
    v21 = 3221225472;
    v22 = sub_100010B78;
    v23 = &unk_1000608F0;
    objc_copyWeak(&v24, &location);
    v14 = -[TRIClient addUpdateHandlerForNamespaceName:usingBlock:](v13, "addUpdateHandlerForNamespaceName:usingBlock:", CFSTR("COREOS_PREDICTION_INACTIVITY"), &v20);
    v15 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceAnalyticsManager sharedInstanceWithTrialClient:withNamespace:](OSIntelligenceAnalyticsManager, "sharedInstanceWithTrialClient:withNamespace:", v6->_trialClient, CFSTR("COREOS_PREDICTION_INACTIVITY"), v20, v21, v22, v23));
    analyticsManager = v6->_analyticsManager;
    v6->_analyticsManager = (OSIntelligenceAnalyticsManager *)v15;

    v17 = os_log_create("com.apple.osintelligence", "inactivity.model.signals");
    log = v6->_log;
    v6->_log = (OS_os_log *)v17;

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)updateTrialParameters
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  id v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("requeryDelta"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
  self->_requeryDelta = objc_msgSend(v3, "longValue");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("snapDND"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
  self->_useDND = objc_msgSend(v4, "BOOLeanValue");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("snapAlarm"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
  self->_useAlarm = objc_msgSend(v5, "BOOLeanValue");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("alarmLeeway"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
  objc_msgSend(v6, "doubleValue");
  self->_alarmLeeway = v7;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("signalsAlarmOffset"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
  objc_msgSend(v8, "doubleValue");
  self->_alarmOffset = v9;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("signalsDNDOffset"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
  objc_msgSend(v10, "doubleValue");
  self->_dndOffset = v11;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("accelerateLookahead"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
  objc_msgSend(v12, "doubleValue");
  self->_accelerateLookahead = v13;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("signalsUseTimeRestriction"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
  self->_rarelyUsedTimeRestriction = objc_msgSend(v14, "BOOLeanValue");

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("signalsTimeRestrictionEarlyHour"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
  self->_rarelyUsedTimeRestrictionEarlyHour = objc_msgSend(v15, "longValue");

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("signalsTimeRestrictionLateHour"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
  self->_rarelyUsedTimeRestrictionLateHour = objc_msgSend(v16, "longValue");

  v18 = (id)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("signalsRarelyUsedMaxDuration"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
  objc_msgSend(v18, "doubleValue");
  self->_rarelyUsedMaxPredictionDuration = v17;

}

+ (id)predictorWithPredictor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1)), "initWithPredictor:", v4);

  return v5;
}

- (id)predictorType
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_OSInactivityPredictor predictorType](self->_baseModel, "predictorType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (with heuristics)"), v2));

  return v3;
}

- (id)queryingMechanism
{
  return -[_OSInactivityPredictor queryingMechanism](self->_baseModel, "queryingMechanism");
}

- (double)recommendedWaitTime
{
  double result;

  -[_OSInactivityPredictor recommendedWaitTime](self->_baseModel, "recommendedWaitTime");
  return result;
}

- (double)longThreshold
{
  double result;

  -[_OSInactivityPredictor longThreshold](self->_baseModel, "longThreshold");
  return result;
}

- (double)confidenceThresholdStrict
{
  double result;

  -[_OSInactivityPredictor confidenceThresholdStrict](self->_baseModel, "confidenceThresholdStrict");
  return result;
}

- (double)confidenceThresholdRelaxed
{
  double result;

  -[_OSInactivityPredictor confidenceThresholdRelaxed](self->_baseModel, "confidenceThresholdRelaxed");
  return result;
}

- (BOOL)requireEnoughHistory
{
  return -[_OSInactivityPredictor requireEnoughHistory](self->_baseModel, "requireEnoughHistory");
}

- (id)inferInputDateAndWaitTimeToQueryModelWithOptions:(int64_t)a3 withError:(id *)a4
{
  void *v7;
  unsigned int v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](_CDClientContext, "userContext"));
  v8 = +[OSIntelligenceUtilities isPluggedInWithContext:](OSIntelligenceUtilities, "isPluggedInWithContext:", v7);

  v9 = 0.0;
  if (v8)
  {
    -[_OSInactivityPredictor waitedDuration](self, "waitedDuration");
    v9 = v10;
    -[_OSInactivityPredictorSignalsAndModel recommendedWaitTime](self, "recommendedWaitTime");
    if (v9 >= v11)
      v9 = v11;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -v9));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[_OSInactivityPredictorSignalsAndModel longInactivityPredictionResultAtDate:withTimeSinceInactive:withOptions:withError:](self, "longInactivityPredictionResultAtDate:withTimeSinceInactive:withOptions:withError:", v12, a3, a4, v9));
  objc_msgSend(v13, "safeSubtractWaitTimeFromPredictedDuration:", v9);

  return v13;
}

- (id)longInactivityPredictionResultWithOptions:(int64_t)a3 withError:(id *)a4
{
  id v7;
  _OSIInactivityEntrySignals *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  id v17;
  double v18;
  id v19;
  _OSIInactivityEntrySignals *v20;
  OS_os_log *log;
  double v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  uint64_t v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  OS_os_log *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[10];
  _QWORD v42[10];
  uint8_t buf[4];
  id v44;

  if (a3 == 2)
  {
    v8 = objc_alloc_init(_OSIInactivityEntrySignals);
    -[_OSInactivityPredictor waitedDuration](self, "waitedDuration");
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[_OSInactivityPredictorSignalsAndModel baseModel](self, "baseModel"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "predictorType"));
    -[_OSIInactivityEntrySignals checkSleepSignalsWithTimeSinceInactive:andPredictorType:](v8, "checkSleepSignalsWithTimeSinceInactive:andPredictorType:", v12, v10);

    v13 = objc_alloc((Class)_OSInactivityPredictorOutput);
    if (-[_OSIInactivityEntrySignals areSleepHeuristicsMet](v8, "areSleepHeuristicsMet"))
      v14 = 2;
    else
      v14 = 0;
    v15 = (double)-[_OSIInactivityEntrySignals areSleepHeuristicsMet](v8, "areSleepHeuristicsMet");
    if (-[_OSIInactivityEntrySignals areSleepHeuristicsMet](v8, "areSleepHeuristicsMet"))
      v16 = 1;
    else
      v16 = 4;
    v7 = objc_msgSend(v13, "initWithConfidenceLevel:andConfidenceValue:andPredictedDuration:andReason:", v14, v16, v15, 0.0);

  }
  else if (a3 == 1)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[_OSInactivityPredictorSignalsAndModel sleepSuppresionPredictionResultWithError:](self, "sleepSuppresionPredictionResultWithError:", a4));
  }
  else
  {
    self->_accelerateSuppression = 0;
    v17 = objc_alloc((Class)_OSInactivityPredictorOutput);
    -[_OSInactivityPredictor confidenceThresholdRelaxed](self->_baseModel, "confidenceThresholdRelaxed");
    v19 = objc_msgSend(v17, "initWithConfidenceLevel:andConfidenceValue:andPredictedDuration:andReason:", 0, 4, v18 + -0.01, 0.0);
    v20 = objc_alloc_init(_OSIInactivityEntrySignals);
    -[_OSInactivityPredictor waitedDuration](self, "waitedDuration");
    if (-[_OSIInactivityEntrySignals checkInactivitySignalsWithTimeSinceInactive:](v20, "checkInactivitySignalsWithTimeSinceInactive:"))
    {
      v7 = (id)objc_claimAutoreleasedReturnValue(-[_OSInactivityPredictorSignalsAndModel inferInputDateAndWaitTimeToQueryModelWithOptions:withError:](self, "inferInputDateAndWaitTimeToQueryModelWithOptions:withError:", a3, a4));

      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v44 = v7;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Model queried: %@", buf, 0xCu);
      }
    }
    else
    {
      v7 = v19;
    }
    v42[0] = &off_100064D18;
    v41[0] = CFSTR("AmbientLightLevel");
    v41[1] = CFSTR("StationaryLevel");
    -[_OSIInactivityEntrySignals pctStationary](v20, "pctStationary");
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (int)(v22 * 100.0)));
    v42[1] = v40;
    v41[2] = CFSTR("CurrentPlayback");
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[_OSIInactivityEntrySignals hasRecentPlaybackChange](v20, "hasRecentPlaybackChange")));
    v42[2] = v39;
    v41[3] = CFSTR("DeadlineSetter");
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v7, "outputReason")));
    v42[3] = v38;
    v41[4] = CFSTR("ModelType");
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[_OSInactivityPredictor predictorType](self->_baseModel, "predictorType"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("cpn_%@"), v37));
    v42[4] = v23;
    v41[5] = CFSTR("ModelConfidence");
    objc_msgSend(v7, "confidenceValue");
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (int)(v24 * 100.0)));
    v42[5] = v25;
    v41[6] = CFSTR("ModelConfidenceLevel");
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v7, "confidenceLevel")));
    v42[6] = v26;
    v41[7] = CFSTR("PredictedDuration");
    objc_msgSend(v7, "predictedDuration");
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v42[7] = v27;
    v41[8] = CFSTR("TreatmentID");
    v28 = objc_claimAutoreleasedReturnValue(-[TRIClient treatmentIdWithNamespaceName:](self->_trialClient, "treatmentIdWithNamespaceName:", CFSTR("COREOS_PREDICTION_INACTIVITY")));
    v29 = (void *)v28;
    if (v28)
      v30 = (const __CFString *)v28;
    else
      v30 = &stru_100062558;
    v42[8] = v30;
    v41[9] = CFSTR("RolloutID");
    v31 = objc_claimAutoreleasedReturnValue(-[TRIClient rolloutIdentifiersWithNamespaceName:](self->_trialClient, "rolloutIdentifiersWithNamespaceName:", CFSTR("COREOS_PREDICTION_INACTIVITY")));
    v32 = (void *)v31;
    if (v31)
      v33 = (const __CFString *)v31;
    else
      v33 = &stru_100062558;
    v42[9] = v33;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v42, v41, 10));

    v35 = self->_log;
    if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v34;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v35, OS_LOG_TYPE_DEFAULT, "Logging sleep suppression query event to PL: %@", buf, 0xCu);
    }
    PLLogRegisteredEvent(24, CFSTR("InactivityPredictionQuery"), v34, 0);

  }
  return v7;
}

- (id)longInactivityPredictionResultAtDate:(id)a3 withTimeSinceInactive:(double)a4 withOptions:(int64_t)a5 withError:(id *)a6
{
  id v10;
  void *v11;
  unsigned int v12;
  OS_os_log *log;
  id v14;
  id v15;
  uint64_t v16;
  OS_os_log *v17;
  double accelerateLookahead;
  OS_os_log *v19;
  double v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  int64_t v25;
  char v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t rarelyUsedTimeRestrictionEarlyHour;
  id v31;
  double v32;
  id v33;
  OS_os_log *v34;
  id v35;
  void *v36;
  void *v37;
  double v38;
  OSIAlarmMonitor *alarmMonitor;
  void *v40;
  void *v41;
  void *v42;
  OS_os_log *v43;
  id v44;
  NSString *deadlineSetter;
  OSIntelligenceAnalyticsManager *analyticsManager;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  id v51;
  OS_os_log *v52;
  NSString *v53;
  OSIntelligenceAnalyticsManager *v54;
  void *v55;
  OS_os_log *v56;
  _BOOL4 v57;
  NSString *v58;
  __CFString *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  double rarelyUsedMaxPredictionDuration;
  double v64;
  void *v65;
  double v66;
  id v67;
  OSIntelligenceAnalyticsManager *v68;
  id v69;
  id v70;
  double v71;
  double v72;
  double v73;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint8_t buf[4];
  int64_t v81;
  __int16 v82;
  id v83;
  __int16 v84;
  void *v85;

  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceDefines inactivityUserDefaults](OSIntelligenceDefines, "inactivityUserDefaults"));
  v12 = objc_msgSend(v11, "BOOLForKey:", CFSTR("heuristicsOnly"));
  v79 = v11;
  if (v12)
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Using heuristics only.", buf, 2u);
    }
    v14 = objc_msgSend(objc_alloc((Class)_OSInactivityPredictorOutput), "initWithConfidenceLevel:andConfidenceValue:andPredictedDuration:andReason:", 2, 1, 1.0, 12.0);
  }
  else
  {
    v15 = v10;
    if (a5 == 1 && self->_accelerateSuppression)
    {
      v16 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", self->_accelerateLookahead));

      v17 = self->_log;
      if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
      {
        accelerateLookahead = self->_accelerateLookahead;
        *(_DWORD *)buf = 134217984;
        v81 = *(_QWORD *)&accelerateLookahead;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v17, OS_LOG_TYPE_DEFAULT, "Advancing query date to %.2f seconds from now to accelerate sleep suppression", buf, 0xCu);
      }
      v15 = (id)v16;
    }
    v19 = self->_log;
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v81 = a5;
      v82 = 2112;
      v83 = v15;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v19, OS_LOG_TYPE_DEFAULT, "(%ld) Querying model with input date: %@", buf, 0x16u);
    }
    v14 = (id)objc_claimAutoreleasedReturnValue(-[_OSInactivityPredictor longInactivityPredictionResultAtDate:withTimeSinceInactive:withOptions:withError:](self->_baseModel, "longInactivityPredictionResultAtDate:withTimeSinceInactive:withOptions:withError:", v15, a5, a6, a4));
    self->_accelerateSuppression = 0;

    v11 = v79;
  }
  if (objc_msgSend(v14, "confidenceLevel") == (id)2)
  {
    objc_msgSend(v14, "predictedDuration");
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dateByAddingTimeInterval:", v20 * 3600.0));
    v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "laterDate:"));
    v23 = self->_log;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = v23;
      objc_msgSend(v14, "predictedDuration");
      *(_DWORD *)buf = 134218498;
      v81 = v25;
      v82 = 2112;
      v83 = v10;
      v84 = 2112;
      v85 = v21;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Raw model confidently predicted %.2f hours of inactivity from %@ until %@", buf, 0x20u);

    }
    if (self->_rarelyUsedTimeRestriction)
      v26 = v12;
    else
      v26 = 1;
    v77 = (void *)v22;
    if ((v26 & 1) != 0
      || !+[_OSInactivityPredictor isDeviceRarelyUsedRecently](_OSInactivityPredictor, "isDeviceRarelyUsedRecently"))
    {
      v78 = 0;
    }
    else
    {
      -[_OSInactivityPredictorSignalsAndModel setIsRarelyUsed:](self, "setIsRarelyUsed:", 1);
      v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "components:fromDate:", 60, v22));
      v28 = objc_msgSend(v27, "hour");
      v29 = (uint64_t)v28;
      rarelyUsedTimeRestrictionEarlyHour = self->_rarelyUsedTimeRestrictionEarlyHour;
      if ((uint64_t)v28 < self->_rarelyUsedTimeRestrictionLateHour && (uint64_t)v28 >= rarelyUsedTimeRestrictionEarlyHour)
      {
        v31 = objc_alloc((Class)_OSInactivityPredictorOutput);
        -[_OSInactivityPredictor confidenceThresholdStrict](self->_baseModel, "confidenceThresholdStrict");
        v33 = objc_msgSend(v31, "initWithConfidenceLevel:andConfidenceValue:andPredictedDuration:andReason:", 1, 0, v32 + -0.01, 0.0);

        v34 = self->_log;
        if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v34, OS_LOG_TYPE_DEFAULT, "Restricting entry: Rarely-used device not in time range", buf, 2u);
        }
        v14 = v33;
        v35 = v14;
        goto LABEL_61;
      }
      objc_msgSend(v27, "setHour:", self->_rarelyUsedTimeRestrictionEarlyHour);
      objc_msgSend(v27, "setMinute:", 0);
      objc_msgSend(v27, "setSecond:", 0);
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "dateFromComponents:", v27));
      v61 = v60;
      if (v29 > rarelyUsedTimeRestrictionEarlyHour)
      {
        v62 = objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "dateByAddingTimeInterval:", 86400.0));

        v61 = (void *)v62;
      }
      rarelyUsedMaxPredictionDuration = self->_rarelyUsedMaxPredictionDuration;
      objc_msgSend(v61, "timeIntervalSinceDate:", v77);
      if (rarelyUsedMaxPredictionDuration * 3600.0 < v64)
        v64 = rarelyUsedMaxPredictionDuration * 3600.0;
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "dateByAddingTimeInterval:", v64));
      objc_msgSend(v65, "timeIntervalSinceDate:", v21);
      if (v66 <= 0.0)
      {
        v67 = v65;
        v65 = v21;
        v21 = v67;
      }
      else
      {
        v67 = 0;
      }

      v78 = v67;
      v22 = (uint64_t)v77;
    }
    if (self->_useDND)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[OSIDNDMonitor scheduledDNDEndDate](self->_dndMonitor, "scheduledDNDEndDate"));
      v37 = v36;
      if (v36 && (objc_msgSend(v36, "timeIntervalSinceDate:", v22), v38 > 0.0))
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "dateByAddingTimeInterval:", -self->_dndOffset));
      else
        v27 = 0;

    }
    else
    {
      v27 = 0;
    }
    alarmMonitor = self->_alarmMonitor;
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "dateByAddingTimeInterval:", self->_alarmLeeway));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[OSIAlarmMonitor nextAlarmFireDateBetweenDate:andDate:](alarmMonitor, "nextAlarmFireDateBetweenDate:andDate:", v22, v40));

    v75 = v21;
    if (self->_useAlarm && v41)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "dateByAddingTimeInterval:", -self->_alarmOffset));

      if (v42)
      {
        v43 = self->_log;
        if (os_log_type_enabled((os_log_t)v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v81 = (int64_t)v42;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v43, OS_LOG_TYPE_DEFAULT, "Using alarm date: %@", buf, 0xCu);
        }
        v44 = v42;
        deadlineSetter = self->_deadlineSetter;
        self->_deadlineSetter = (NSString *)CFSTR("Alarm");

        analyticsManager = self->_analyticsManager;
        objc_msgSend(v44, "timeIntervalSinceReferenceDate");
        v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        objc_msgSend(v44, "timeIntervalSinceReferenceDate");
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        -[_OSInactivityPredictorSignalsAndModel recommendedWaitTime](self, "recommendedWaitTime");
        v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        -[OSIntelligenceAnalyticsManager saveNextAlarmInterval:nextDNDInterval:predictionInterval:recommendedWait:deadlineSetter:modelConfidenceLevel:withPredictor:](analyticsManager, "saveNextAlarmInterval:nextDNDInterval:predictionInterval:recommendedWait:deadlineSetter:modelConfidenceLevel:withPredictor:", v47, 0, v48, v49, self->_deadlineSetter, objc_msgSend(v14, "confidenceLevel"), self);

        v50 = 2;
        v51 = v44;
LABEL_60:

        v69 = objc_alloc((Class)_OSInactivityPredictorOutput);
        v70 = objc_msgSend(v14, "confidenceLevel");
        objc_msgSend(v14, "confidenceValue");
        v72 = v71;
        objc_msgSend(v51, "timeIntervalSinceDate:", v10);
        v35 = objc_msgSend(v69, "initWithConfidenceLevel:andConfidenceValue:andPredictedDuration:andReason:", v70, v50, v72, v73 / 3600.0);

        v11 = v79;
        v21 = v75;
LABEL_61:

        goto LABEL_62;
      }
    }
    else
    {

    }
    if (v27)
    {
      v52 = self->_log;
      if (os_log_type_enabled((os_log_t)v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v81 = (int64_t)v27;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v52, OS_LOG_TYPE_DEFAULT, "Using DND date: %@", buf, 0xCu);
      }
      v51 = v27;
      v53 = self->_deadlineSetter;
      self->_deadlineSetter = (NSString *)CFSTR("DND");

      v54 = self->_analyticsManager;
      objc_msgSend(v51, "timeIntervalSinceReferenceDate");
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      objc_msgSend(v51, "timeIntervalSinceReferenceDate");
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      -[_OSInactivityPredictorSignalsAndModel recommendedWaitTime](self, "recommendedWaitTime");
      v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      -[OSIntelligenceAnalyticsManager saveNextAlarmInterval:nextDNDInterval:predictionInterval:recommendedWait:deadlineSetter:modelConfidenceLevel:withPredictor:](v54, "saveNextAlarmInterval:nextDNDInterval:predictionInterval:recommendedWait:deadlineSetter:modelConfidenceLevel:withPredictor:", 0, v47, v48, v55, self->_deadlineSetter, objc_msgSend(v14, "confidenceLevel"), self);

      v44 = 0;
      v50 = 3;
    }
    else
    {
      v56 = self->_log;
      v57 = os_log_type_enabled((os_log_t)v56, OS_LOG_TYPE_DEFAULT);
      if (v78)
      {
        if (v57)
        {
          *(_DWORD *)buf = 138412290;
          v81 = (int64_t)v78;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v56, OS_LOG_TYPE_DEFAULT, "Using 'rarely-used' date: %@", buf, 0xCu);
        }
        v51 = v78;
        v58 = self->_deadlineSetter;
        v59 = CFSTR("RarelyUsed");
      }
      else
      {
        if (v57)
        {
          *(_DWORD *)buf = 138412290;
          v81 = (int64_t)v21;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v56, OS_LOG_TYPE_DEFAULT, "Using model output: %@", buf, 0xCu);
        }
        v51 = v21;
        v58 = self->_deadlineSetter;
        v59 = CFSTR("Model");
      }
      self->_deadlineSetter = &v59->isa;

      v68 = self->_analyticsManager;
      objc_msgSend(v51, "timeIntervalSinceReferenceDate");
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      -[_OSInactivityPredictorSignalsAndModel recommendedWaitTime](self, "recommendedWaitTime");
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      -[OSIntelligenceAnalyticsManager saveNextAlarmInterval:nextDNDInterval:predictionInterval:recommendedWait:deadlineSetter:modelConfidenceLevel:withPredictor:](v68, "saveNextAlarmInterval:nextDNDInterval:predictionInterval:recommendedWait:deadlineSetter:modelConfidenceLevel:withPredictor:", 0, 0, v47, v48, self->_deadlineSetter, objc_msgSend(v14, "confidenceLevel"), self);
      v44 = 0;
      v50 = 1;
    }
    goto LABEL_60;
  }
  v14 = v14;
  v35 = v14;
LABEL_62:

  return v35;
}

- (id)sleepSuppresionPredictionResultWithError:(id *)a3
{
  _OSIInactivityEntrySignals *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  id v10;
  double v11;
  id v12;
  double v13;
  int v14;
  NSObject *log;
  NSObject *v16;
  int requeryDelta;
  void *v18;
  void *v19;
  OS_os_log *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  _OSIInactivityEntrySignals *v26;
  void *v27;
  void *v28;
  OS_os_log *v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  const __CFString *v39;
  uint64_t v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  OS_os_log *v44;
  id v45;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  _OSIInactivityEntrySignals *v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[10];
  _QWORD v56[10];
  _QWORD v57[5];
  _QWORD v58[5];
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  int v62;

  self->_accelerateSuppression = 0;
  v5 = objc_alloc_init(_OSIInactivityEntrySignals);
  -[_OSInactivityPredictor waitedDuration](self, "waitedDuration");
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_OSInactivityPredictorSignalsAndModel baseModel](self, "baseModel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "predictorType"));
  -[_OSIInactivityEntrySignals checkSleepSignalsWithTimeSinceInactive:andPredictorType:](v5, "checkSleepSignalsWithTimeSinceInactive:andPredictorType:", v9, v7);

  v10 = objc_alloc((Class)_OSInactivityPredictorOutput);
  -[_OSInactivityPredictor confidenceThresholdRelaxed](self->_baseModel, "confidenceThresholdRelaxed");
  v12 = objc_msgSend(v10, "initWithConfidenceLevel:andConfidenceValue:andPredictedDuration:andReason:", 0, 4, v11 + -0.01, 0.0);
  if (-[_OSIInactivityEntrySignals areSleepHeuristicsMet](v5, "areSleepHeuristicsMet"))
  {
    -[_OSIInactivityEntrySignals secondsSinceWait](v5, "secondsSinceWait");
    if (v13 < (double)self->_requeryDelta)
    {
      v14 = -[_OSIInactivityEntrySignals lux](v5, "lux");
      if (v14 < -[_OSIInactivityEntrySignals immediateMaxDarkLuxThreshold](v5, "immediateMaxDarkLuxThreshold"))
      {
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
        {
          v16 = log;
          -[_OSIInactivityEntrySignals secondsSinceWait](v5, "secondsSinceWait");
          requeryDelta = self->_requeryDelta;
          *(_DWORD *)buf = 134218240;
          v60 = v18;
          v61 = 1024;
          v62 = requeryDelta;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Accelerating queries because waited %.2f seconds (<%d) in the dark", buf, 0x12u);

        }
        self->_accelerateSuppression = 1;
      }
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[_OSInactivityPredictorSignalsAndModel inferInputDateAndWaitTimeToQueryModelWithOptions:withError:](self, "inferInputDateAndWaitTimeToQueryModelWithOptions:withError:", 1, a3));

    v20 = self->_log;
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v60 = v19;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v20, OS_LOG_TYPE_DEFAULT, "Model queried for sleep suppression: %@", buf, 0xCu);
    }
  }
  else
  {
    v19 = v12;
  }
  if (!self->_deadlineSetter)
  {
    self->_deadlineSetter = (NSString *)&stru_100062558;

  }
  v57[0] = CFSTR("modelConfidenceLevel");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v19, "confidenceLevel")));
  v58[0] = v21;
  v57[1] = CFSTR("entryAmbientLightLevelBucketed");
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", +[OSIntelligenceAnalyticsManager bucketLuxValue:](OSIntelligenceAnalyticsManager, "bucketLuxValue:", -[_OSIInactivityEntrySignals lux](v5, "lux"))));
  v58[1] = v22;
  v57[2] = CFSTR("entryStationaryLevel");
  -[_OSIInactivityEntrySignals pctStationary](v5, "pctStationary");
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", round(v23 * 10.0)));
  v58[2] = v24;
  v57[3] = CFSTR("currentPlayback");
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[_OSIInactivityEntrySignals hasRecentPlaybackChange](v5, "hasRecentPlaybackChange")));
  v58[3] = v25;
  v57[4] = CFSTR("deadlineSetter");
  v26 = v5;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[_OSInactivityPredictorSignalsAndModel deadlineSetter](self, "deadlineSetter"));
  v58[4] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v58, v57, 5));

  v29 = self->_log;
  if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_DEBUG))
    sub_10003E220((uint64_t)v28, v29);
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_10001264C;
  v53[3] = &unk_100060C10;
  v50 = v28;
  v54 = v50;
  AnalyticsSendEventLazy(CFSTR("com.apple.SmartPowerNap.InactivityPredictorQuery"), v53);
  v55[0] = CFSTR("AmbientLightLevel");
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[_OSIInactivityEntrySignals lux](v26, "lux")));
  v56[0] = v49;
  v55[1] = CFSTR("StationaryLevel");
  -[_OSIInactivityEntrySignals pctStationary](v26, "pctStationary");
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (int)(v30 * 100.0)));
  v56[1] = v48;
  v55[2] = CFSTR("CurrentPlayback");
  v52 = v26;
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[_OSIInactivityEntrySignals hasRecentPlaybackChange](v26, "hasRecentPlaybackChange")));
  v56[2] = v47;
  v55[3] = CFSTR("DeadlineSetter");
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v19, "outputReason")));
  v56[3] = v31;
  v55[4] = CFSTR("ModelType");
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[_OSInactivityPredictor predictorType](self->_baseModel, "predictorType"));
  v56[4] = v32;
  v55[5] = CFSTR("ModelConfidence");
  objc_msgSend(v19, "confidenceValue");
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (int)(v33 * 100.0)));
  v56[5] = v34;
  v55[6] = CFSTR("ModelConfidenceLevel");
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v19, "confidenceLevel")));
  v56[6] = v35;
  v55[7] = CFSTR("PredictedDuration");
  v51 = v19;
  objc_msgSend(v19, "predictedDuration");
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v56[7] = v36;
  v55[8] = CFSTR("TreatmentID");
  v37 = objc_claimAutoreleasedReturnValue(-[TRIClient treatmentIdWithNamespaceName:](self->_trialClient, "treatmentIdWithNamespaceName:", CFSTR("COREOS_PREDICTION_INACTIVITY")));
  v38 = (void *)v37;
  if (v37)
    v39 = (const __CFString *)v37;
  else
    v39 = &stru_100062558;
  v56[8] = v39;
  v55[9] = CFSTR("RolloutID");
  v40 = objc_claimAutoreleasedReturnValue(-[TRIClient rolloutIdentifiersWithNamespaceName:](self->_trialClient, "rolloutIdentifiersWithNamespaceName:", CFSTR("COREOS_PREDICTION_INACTIVITY")));
  v41 = (void *)v40;
  if (v40)
    v42 = (const __CFString *)v40;
  else
    v42 = &stru_100062558;
  v56[9] = v42;
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v56, v55, 10));

  v44 = self->_log;
  if (os_log_type_enabled((os_log_t)v44, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v60 = v43;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v44, OS_LOG_TYPE_DEFAULT, "Logging sleep suppression query event to PL: %@", buf, 0xCu);
  }
  PLLogRegisteredEvent(24, CFSTR("InactivityPredictionQuery"), v43, 0);
  v45 = v51;

  return v45;
}

- (OSIAlarmMonitor)alarmMonitor
{
  return self->_alarmMonitor;
}

- (void)setAlarmMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_alarmMonitor, a3);
}

- (OSIDNDMonitor)dndMonitor
{
  return self->_dndMonitor;
}

- (void)setDndMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_dndMonitor, a3);
}

- (_OSInactivityPredictor)baseModel
{
  return self->_baseModel;
}

- (void)setBaseModel:(id)a3
{
  objc_storeStrong((id *)&self->_baseModel, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (TRIClient)trialClient
{
  return self->_trialClient;
}

- (void)setTrialClient:(id)a3
{
  objc_storeStrong((id *)&self->_trialClient, a3);
}

- (NSString)deadlineSetter
{
  return self->_deadlineSetter;
}

- (void)setDeadlineSetter:(id)a3
{
  objc_storeStrong((id *)&self->_deadlineSetter, a3);
}

- (int)requeryDelta
{
  return self->_requeryDelta;
}

- (void)setRequeryDelta:(int)a3
{
  self->_requeryDelta = a3;
}

- (BOOL)useDND
{
  return self->_useDND;
}

- (void)setUseDND:(BOOL)a3
{
  self->_useDND = a3;
}

- (BOOL)useAlarm
{
  return self->_useAlarm;
}

- (void)setUseAlarm:(BOOL)a3
{
  self->_useAlarm = a3;
}

- (double)alarmLeeway
{
  return self->_alarmLeeway;
}

- (void)setAlarmLeeway:(double)a3
{
  self->_alarmLeeway = a3;
}

- (double)alarmOffset
{
  return self->_alarmOffset;
}

- (void)setAlarmOffset:(double)a3
{
  self->_alarmOffset = a3;
}

- (double)dndOffset
{
  return self->_dndOffset;
}

- (void)setDndOffset:(double)a3
{
  self->_dndOffset = a3;
}

- (double)accelerateLookahead
{
  return self->_accelerateLookahead;
}

- (void)setAccelerateLookahead:(double)a3
{
  self->_accelerateLookahead = a3;
}

- (BOOL)isRarelyUsed
{
  return self->_isRarelyUsed;
}

- (void)setIsRarelyUsed:(BOOL)a3
{
  self->_isRarelyUsed = a3;
}

- (BOOL)rarelyUsedTimeRestriction
{
  return self->_rarelyUsedTimeRestriction;
}

- (void)setRarelyUsedTimeRestriction:(BOOL)a3
{
  self->_rarelyUsedTimeRestriction = a3;
}

- (int)rarelyUsedTimeRestrictionEarlyHour
{
  return self->_rarelyUsedTimeRestrictionEarlyHour;
}

- (void)setRarelyUsedTimeRestrictionEarlyHour:(int)a3
{
  self->_rarelyUsedTimeRestrictionEarlyHour = a3;
}

- (int)rarelyUsedTimeRestrictionLateHour
{
  return self->_rarelyUsedTimeRestrictionLateHour;
}

- (void)setRarelyUsedTimeRestrictionLateHour:(int)a3
{
  self->_rarelyUsedTimeRestrictionLateHour = a3;
}

- (double)rarelyUsedMaxPredictionDuration
{
  return self->_rarelyUsedMaxPredictionDuration;
}

- (void)setRarelyUsedMaxPredictionDuration:(double)a3
{
  self->_rarelyUsedMaxPredictionDuration = a3;
}

- (BOOL)accelerateSuppression
{
  return self->_accelerateSuppression;
}

- (void)setAccelerateSuppression:(BOOL)a3
{
  self->_accelerateSuppression = a3;
}

- (OSIntelligenceAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_deadlineSetter, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_baseModel, 0);
  objc_storeStrong((id *)&self->_dndMonitor, 0);
  objc_storeStrong((id *)&self->_alarmMonitor, 0);
}

@end
