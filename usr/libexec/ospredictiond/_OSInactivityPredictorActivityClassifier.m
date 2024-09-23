@implementation _OSInactivityPredictorActivityClassifier

+ (id)predictor
{
  return objc_alloc_init((Class)objc_opt_class(a1));
}

- (_OSInactivityPredictorActivityClassifier)init
{
  _OSInactivityPredictorActivityClassifier *v2;
  os_log_t v3;
  OS_os_log *log;
  NSObject *v5;
  uint64_t v6;
  TRIClient *trialClient;
  TRIClient *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_OSInactivityPredictorActivityClassifier;
  v2 = -[_OSInactivityPredictor init](&v14, "init");
  if (v2)
  {
    v3 = os_log_create("com.apple.osintelligence", "inactivity.activityClassifier");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    -[_OSInactivityPredictor setPredictorType:](v2, "setPredictorType:", CFSTR("XGBClassifier_v1"));
    -[_OSInactivityPredictor setQueryingMechanism:](v2, "setQueryingMechanism:", CFSTR("inchworm"));
    -[_OSInactivityPredictor setRequireEnoughHistory:](v2, "setRequireEnoughHistory:", 1);
    v5 = v2->_log;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      sub_10003D7B4(v5);
    v6 = objc_claimAutoreleasedReturnValue(+[TRIClient clientWithIdentifier:](TRIClient, "clientWithIdentifier:", 293));
    trialClient = v2->_trialClient;
    v2->_trialClient = (TRIClient *)v6;

    -[_OSInactivityPredictorActivityClassifier loadTrialFactors](v2, "loadTrialFactors");
    objc_initWeak(&location, v2);
    v8 = v2->_trialClient;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100008890;
    v11[3] = &unk_1000608F0;
    objc_copyWeak(&v12, &location);
    v9 = -[TRIClient addUpdateHandlerForNamespaceName:usingBlock:](v8, "addUpdateHandlerForNamespaceName:usingBlock:", CFSTR("COREOS_PREDICTION_INACTIVITY"), v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)loadTrialFactors
{
  OS_os_log *log;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  OS_os_log *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  OS_os_log *v22;
  TRIClient *trialClient;
  void *v24;
  TRIClient *v25;
  void *v26;
  TRIClient *v27;
  void *v28;
  TRIClient *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  TRIClient *v34;
  void *v35;
  TRIClient *v36;
  void *v37;
  TRIClient *v38;
  void *v39;

  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG))
    sub_10003D8D8(log, v4, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("macInactivityClassifier"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "directoryValue"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "path"));

  v14 = self->_log;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEBUG))
    sub_10003D870((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities loadCompiledModelFromPath:](OSIntelligenceUtilities, "loadCompiledModelFromPath:", v13));
  -[_OSInactivityPredictorActivityClassifier setClassifier:](self, "setClassifier:", v21);

  -[_OSInactivityPredictor setModelVersion:](self, "setModelVersion:", CFSTR("y9eiznriuc"));
  v22 = self->_log;
  if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEBUG))
    sub_10003D830((os_log_t)v22);
  trialClient = self->_trialClient;
  if (trialClient)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](trialClient, "levelForFactor:withNamespaceName:", CFSTR("macRecommendedWaitTime"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
    objc_msgSend(v24, "doubleValue");
    -[_OSInactivityPredictor setRecommendedWaitTime:](self, "setRecommendedWaitTime:");

  }
  else
  {
    -[_OSInactivityPredictor setRecommendedWaitTime:](self, "setRecommendedWaitTime:", 7200.0);
  }
  v25 = self->_trialClient;
  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](v25, "levelForFactor:withNamespaceName:", CFSTR("macChunkEngageDuration"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
    objc_msgSend(v26, "doubleValue");
    -[_OSInactivityPredictor setLongThreshold:](self, "setLongThreshold:");

  }
  else
  {
    -[_OSInactivityPredictor setLongThreshold:](self, "setLongThreshold:", 14400.0);
  }
  v27 = self->_trialClient;
  if (v27)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](v27, "levelForFactor:withNamespaceName:", CFSTR("macChunkEngageDuration"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
    objc_msgSend(v28, "doubleValue");
    -[_OSInactivityPredictorActivityClassifier setChunkEngageDuration:](self, "setChunkEngageDuration:");

  }
  else
  {
    -[_OSInactivityPredictorActivityClassifier setChunkEngageDuration:](self, "setChunkEngageDuration:", 14400.0);
  }
  v29 = self->_trialClient;
  if (v29)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](v29, "levelForFactor:withNamespaceName:", CFSTR("macConfidenceThreshold"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
    objc_msgSend(v30, "doubleValue");
    -[_OSInactivityPredictor setConfidenceThresholdStrict:](self, "setConfidenceThresholdStrict:");

  }
  else
  {
    -[_OSInactivityPredictor setConfidenceThresholdStrict:](self, "setConfidenceThresholdStrict:", 0.95);
  }
  -[_OSInactivityPredictor setConfidenceThresholdRelaxed:](self, "setConfidenceThresholdRelaxed:", 0.5);
  -[_OSInactivityPredictor confidenceThresholdStrict](self, "confidenceThresholdStrict");
  v32 = v31;
  -[_OSInactivityPredictor confidenceThresholdRelaxed](self, "confidenceThresholdRelaxed");
  if (v32 <= v33)
    -[_OSInactivityPredictor setConfidenceThresholdStrict:](self, "setConfidenceThresholdStrict:", 0.95);
  v34 = self->_trialClient;
  if (v34)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](v34, "levelForFactor:withNamespaceName:", CFSTR("macMaxChunksPerSession"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
    -[_OSInactivityPredictorActivityClassifier setMaxChunksPerSession:](self, "setMaxChunksPerSession:", objc_msgSend(v35, "longValue"));

  }
  else
  {
    -[_OSInactivityPredictorActivityClassifier setMaxChunksPerSession:](self, "setMaxChunksPerSession:", 3);
  }
  v36 = self->_trialClient;
  if (v36)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](v36, "levelForFactor:withNamespaceName:", CFSTR("macRequeryInterval"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
    objc_msgSend(v37, "doubleValue");
    -[_OSInactivityPredictorActivityClassifier setRequeryInterval:](self, "setRequeryInterval:");

  }
  else
  {
    -[_OSInactivityPredictorActivityClassifier setRequeryInterval:](self, "setRequeryInterval:", 7200.0);
  }
  v38 = self->_trialClient;
  if (v38)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](v38, "levelForFactor:withNamespaceName:", CFSTR("macCooldownDuration"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
    objc_msgSend(v39, "doubleValue");
    -[_OSInactivityPredictorActivityClassifier setCooldownDuration:](self, "setCooldownDuration:");

  }
  else
  {
    -[_OSInactivityPredictorActivityClassifier setCooldownDuration:](self, "setCooldownDuration:", 7200.0);
  }

}

- (id)longInactivityPredictionResultWithOptions:(int64_t)a3 withError:(id *)a4
{
  void *v7;
  double v8;
  double v9;
  unint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  -[_OSInactivityPredictor waitedDuration](self, "waitedDuration");
  if (self->_maxChunksPerSession)
  {
    v9 = v8;
    v10 = 0;
    v11 = 0;
    v12 = v7;
    while (1)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[_OSInactivityPredictorActivityClassifier longInactivityPredictionResultAtDate:withTimeSinceInactive:withOptions:withError:](self, "longInactivityPredictionResultAtDate:withTimeSinceInactive:withOptions:withError:", v12, a3, a4, v9));
      v14 = v13;
      if (!v11)
      {
        v11 = v13;
        objc_msgSend(v11, "setPredictedDuration:", 0.0);
      }
      if ((uint64_t)objc_msgSend(v14, "confidenceLevel") <= 1)
        break;
      objc_msgSend(v14, "predictedDuration");
      v16 = v15;
      objc_msgSend(v11, "predictedDuration");
      objc_msgSend(v11, "setPredictedDuration:", v16 + v17);
      objc_msgSend(v14, "predictedDuration");
      v19 = v18 * 3600.0;
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dateByAddingTimeInterval:", v18 * 3600.0));

      v9 = v9 + v19;
      ++v10;
      v12 = v7;
      if (v10 >= self->_maxChunksPerSession)
        goto LABEL_10;
    }

    v7 = v12;
  }
  else
  {
    v11 = 0;
  }
LABEL_10:

  return v11;
}

- (double)extrapolatedWaitdDurationsAtDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  _QWORD v15[3];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_OSActivityHistory sharedInstance](_OSActivityHistory, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "historicalSecondsSinceInactiveAtDate:whichStrata:", v3, 3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "historicalSecondsSinceInactiveAtDate:whichStrata:", v3, 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "historicalSecondsSinceInactiveAtDate:whichStrata:", v3, 2));

  +[OSIntelligenceUtilities medianOf:](OSIntelligenceUtilities, "medianOf:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  +[OSIntelligenceUtilities medianOf:](OSIntelligenceUtilities, "medianOf:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  +[OSIntelligenceUtilities medianOf:](OSIntelligenceUtilities, "medianOf:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v15[0] = v8;
  v15[1] = v9;
  v15[2] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 3));
  +[OSIntelligenceUtilities medianOf:](OSIntelligenceUtilities, "medianOf:", v11);
  v13 = v12;

  return v13;
}

- (double)determineTimeSinceInactiveWithInputDate:(id)a3 andInputTimeSinceInactive:(double)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  OS_os_log *v10;
  const char *v11;
  OS_os_log *log;
  NSObject *v13;
  uint32_t v14;
  double v15;
  double v16;
  int v18;
  double v19;
  __int16 v20;
  double v21;

  v6 = a3;
  v7 = *(double *)&v6;
  if (a4 >= 0.0)
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 134217984;
      v19 = a4 / 60.0;
      v11 = "Input timeSinceInactive is explicitly set to %.2f min";
      v13 = log;
      v14 = 12;
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v18, v14);
    }
  }
  else
  {
    if (!v6)
      v7 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now")));
    objc_msgSend(*(id *)&v7, "timeIntervalSinceNow");
    if (v8 <= 900.0)
    {
      if (v8 >= -900.0)
      {
        -[_OSInactivityPredictor waitedDuration](self, "waitedDuration");
        a4 = v16;
        v10 = self->_log;
        if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
        {
          v18 = 138412546;
          v19 = v7;
          v20 = 2048;
          v21 = a4 / 60.0;
          v11 = "Querying near now at %@. Real-time timeSinceInactive = %.2f min";
          goto LABEL_14;
        }
      }
      else
      {
        +[OSIntelligenceUtilities secondsSinceBecomingInactiveAtDate:](OSIntelligenceUtilities, "secondsSinceBecomingInactiveAtDate:", *(_QWORD *)&v7);
        a4 = v15;
        v10 = self->_log;
        if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
        {
          v18 = 138412546;
          v19 = v7;
          v20 = 2048;
          v21 = a4 / 60.0;
          v11 = "Querying into the past at %@. Historical timeSinceInactive = %.2f min";
          goto LABEL_14;
        }
      }
    }
    else
    {
      -[_OSInactivityPredictorActivityClassifier extrapolatedWaitdDurationsAtDate:](self, "extrapolatedWaitdDurationsAtDate:", *(_QWORD *)&v7);
      a4 = v9;
      v10 = self->_log;
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 138412546;
        v19 = v7;
        v20 = 2048;
        v21 = a4 / 60.0;
        v11 = "Querying into the future at %@. Extrapolated timeSinceInactive = %.2f min";
LABEL_14:
        v13 = v10;
        v14 = 22;
        goto LABEL_15;
      }
    }
  }

  return a4;
}

- (id)longInactivityPredictionResultAtDate:(id)a3 withTimeSinceInactive:(double)a4 withOptions:(int64_t)a5 withError:(id *)a6
{
  id v9;
  void *v10;
  double v11;
  OS_os_log *log;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  id v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  id v44;
  double v45;
  double v46;
  double v47;
  void *v49;
  uint8_t buf[4];
  void *v51;
  const __CFString *v52;
  void *v53;

  v9 = a3;
  v10 = (void *)os_transaction_create("com.apple.osintelligence.inactivityprediction.activityclassifier.predictionWithTimeSinceInactive");
  if (!self->_classifier)
  {
    *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.OSIntelligence.InactivityPredictorActivityClassifier"), 404, &off_100065840));
    v19 = objc_msgSend(objc_alloc((Class)_OSInactivityPredictorOutput), "initInvalidOutput");
LABEL_7:
    v20 = v19;
    goto LABEL_13;
  }
  objc_msgSend(v9, "timeIntervalSinceNow");
  if (v11 > 43260.0)
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Querying way too far into the future. Returning medium confidence by default.", buf, 2u);
    }
    v13 = objc_alloc((Class)_OSInactivityPredictorOutput);
    -[_OSInactivityPredictor confidenceThresholdRelaxed](self, "confidenceThresholdRelaxed");
    v15 = v14 + 0.01;
    -[_OSInactivityPredictor confidenceThresholdRelaxed](self, "confidenceThresholdRelaxed");
    v17 = v16;
    -[_OSInactivityPredictor confidenceThresholdStrict](self, "confidenceThresholdStrict");
    v19 = objc_msgSend(v13, "initWithConfidenceValue:andRelaxedThreshold:andStrictThreshold:andPredictedDuration:andReason:", 1, v15, v17, v18, 2.0);
    goto LABEL_7;
  }
  -[_OSInactivityPredictorActivityClassifier determineTimeSinceInactiveWithInputDate:andInputTimeSinceInactive:](self, "determineTimeSinceInactiveWithInputDate:andInputTimeSinceInactive:", v9, a4);
  v22 = v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MLModel modelDescription](self->_classifier, "modelDescription"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "inputDescriptionsByName"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "allKeys"));

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[_OSActivityHistory sharedInstance](_OSActivityHistory, "sharedInstance"));
  v52 = CFSTR("time_since_inactive");
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v22 / 3600.0));
  v53 = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[_OSInactivityFeatureFactory inputFeaturesWithNames:atDate:withIntervalHistory:withContext:](_OSInactivityFeatureFactory, "inputFeaturesWithNames:atDate:withIntervalHistory:withContext:", v25, v9, v26, v28));

  v30 = self->_log;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = v30;
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "dictionary"));
    v49 = v29;
    v33 = v10;
    v34 = v26;
    v35 = v25;
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "description"));
    *(_DWORD *)buf = 138412290;
    v51 = v36;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Features: %@", buf, 0xCu);

    v25 = v35;
    v26 = v34;
    v10 = v33;
    v29 = v49;

  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[MLModel predictionFromFeatures:error:](self->_classifier, "predictionFromFeatures:error:", v29, a6));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "featureValueForName:", CFSTR("classProbability")));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "dictionaryValue"));

  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", &off_100064D00));
  objc_msgSend(v40, "doubleValue");
  v42 = v41;

  v43 = v42 * self->_chunkEngageDuration / 3600.0;
  v44 = objc_alloc((Class)_OSInactivityPredictorOutput);
  -[_OSInactivityPredictor confidenceThresholdRelaxed](self, "confidenceThresholdRelaxed");
  v46 = v45;
  -[_OSInactivityPredictor confidenceThresholdStrict](self, "confidenceThresholdStrict");
  v20 = objc_msgSend(v44, "initWithConfidenceValue:andRelaxedThreshold:andStrictThreshold:andPredictedDuration:andReason:", 1, v42, v46, v47, v43);
  if (!objc_msgSend(v20, "confidenceLevel"))
    objc_msgSend(v20, "setPredictedDuration:", 0.0);

LABEL_13:
  return v20;
}

- (MLModel)classifier
{
  return self->_classifier;
}

- (void)setClassifier:(id)a3
{
  objc_storeStrong((id *)&self->_classifier, a3);
}

- (TRIClient)trialClient
{
  return self->_trialClient;
}

- (void)setTrialClient:(id)a3
{
  objc_storeStrong((id *)&self->_trialClient, a3);
}

- (double)requeryInterval
{
  return self->_requeryInterval;
}

- (void)setRequeryInterval:(double)a3
{
  self->_requeryInterval = a3;
}

- (double)chunkEngageDuration
{
  return self->_chunkEngageDuration;
}

- (void)setChunkEngageDuration:(double)a3
{
  self->_chunkEngageDuration = a3;
}

- (double)cooldownDuration
{
  return self->_cooldownDuration;
}

- (void)setCooldownDuration:(double)a3
{
  self->_cooldownDuration = a3;
}

- (unint64_t)maxChunksPerSession
{
  return self->_maxChunksPerSession;
}

- (void)setMaxChunksPerSession:(unint64_t)a3
{
  self->_maxChunksPerSession = a3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);
  objc_storeStrong((id *)&self->_classifier, 0);
}

@end
