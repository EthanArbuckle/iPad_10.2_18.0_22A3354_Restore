@implementation _OSInactivityPredictorRuleBasedModel

- (_OSInactivityPredictorRuleBasedModel)init
{
  _OSInactivityPredictorRuleBasedModel *v2;
  _OSInactivityPredictorRuleBasedModel *v3;
  OSIAmbientLightMonitor *v4;
  OSIAmbientLightMonitor *lightMonitor;
  uint64_t v6;
  TRIClient *trialClient;
  TRIClient *v8;
  id v9;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)_OSInactivityPredictorRuleBasedModel;
  v2 = -[_OSInactivityPredictor init](&v17, "init");
  v3 = v2;
  if (v2)
  {
    -[_OSInactivityPredictor setPredictorType:](v2, "setPredictorType:", CFSTR("ruleBased"));
    -[_OSInactivityPredictor setQueryingMechanism:](v3, "setQueryingMechanism:", CFSTR("anytime"));
    v4 = objc_alloc_init(OSIAmbientLightMonitor);
    lightMonitor = v3->_lightMonitor;
    v3->_lightMonitor = v4;

    v6 = objc_claimAutoreleasedReturnValue(+[TRIClient clientWithIdentifier:](TRIClient, "clientWithIdentifier:", 293));
    trialClient = v3->_trialClient;
    v3->_trialClient = (TRIClient *)v6;

    -[_OSInactivityPredictorRuleBasedModel updateTrialParameters](v3, "updateTrialParameters");
    objc_initWeak(&location, v3);
    v8 = v3->_trialClient;
    v11 = _NSConcreteStackBlock;
    v12 = 3221225472;
    v13 = sub_1000186F0;
    v14 = &unk_1000608F0;
    objc_copyWeak(&v15, &location);
    v9 = -[TRIClient addUpdateHandlerForNamespaceName:usingBlock:](v8, "addUpdateHandlerForNamespaceName:usingBlock:", CFSTR("COREOS_PREDICTION_INACTIVITY"), &v11);
    -[_OSInactivityPredictor setLongThreshold:](v3, "setLongThreshold:", 10800.0, v11, v12, v13, v14);
    -[_OSInactivityPredictor setConfidenceThresholdStrict:](v3, "setConfidenceThresholdStrict:", 0.8);
    -[_OSInactivityPredictor setConfidenceThresholdRelaxed:](v3, "setConfidenceThresholdRelaxed:", 0.5);
    -[_OSInactivityPredictor setRequireEnoughHistory:](v3, "setRequireEnoughHistory:", 0);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v3;
}

+ (id)predictor
{
  return objc_alloc_init((Class)objc_opt_class(a1));
}

- (void)updateTrialParameters
{
  TRIClient *trialClient;
  void *v4;
  double v5;
  TRIClient *v6;
  void *v7;
  TRIClient *v8;
  void *v9;
  TRIClient *v10;
  void *v11;
  TRIClient *v12;
  void *v13;
  TRIClient *v14;
  void *v15;
  TRIClient *v16;
  void *v17;
  TRIClient *v18;
  void *v19;
  TRIClient *v20;
  void *v21;
  double v22;
  TRIClient *v23;
  void *v24;
  TRIClient *v25;
  id v26;

  trialClient = self->_trialClient;
  if (trialClient)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](trialClient, "levelForFactor:withNamespaceName:", CFSTR("ruleBasedRecommendedWaitTime"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
    objc_msgSend(v4, "doubleValue");
    self->recommendedWaitTime = v5;

  }
  else
  {
    self->recommendedWaitTime = 1800.0;
  }
  v6 = self->_trialClient;
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](v6, "levelForFactor:withNamespaceName:", CFSTR("ruleBasedUseTimeRestriction"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
    self->_useTimeRestriction = objc_msgSend(v7, "BOOLeanValue");

  }
  else
  {
    self->_useTimeRestriction = 1;
  }
  v8 = self->_trialClient;
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](v8, "levelForFactor:withNamespaceName:", CFSTR("ruleBasedEarlyHour"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
    self->_timeRestrictionEarlyHour = objc_msgSend(v9, "longValue");

  }
  else
  {
    self->_timeRestrictionEarlyHour = 11;
  }
  v10 = self->_trialClient;
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](v10, "levelForFactor:withNamespaceName:", CFSTR("ruleBasedLateHour"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
    self->_timeRestrictionLateHour = objc_msgSend(v11, "longValue");

  }
  else
  {
    self->_timeRestrictionLateHour = 18;
  }
  v12 = self->_trialClient;
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](v12, "levelForFactor:withNamespaceName:", CFSTR("initialRuleBasedEarlyHour"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
    self->_initialTimeRestrictionEarlyHour = objc_msgSend(v13, "longValue");

  }
  else
  {
    self->_initialTimeRestrictionEarlyHour = 7;
  }
  v14 = self->_trialClient;
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](v14, "levelForFactor:withNamespaceName:", CFSTR("initialRuleBasedLateHour"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
    self->_initialTimeRestrictionLateHour = objc_msgSend(v15, "longValue");

  }
  else
  {
    self->_initialTimeRestrictionLateHour = 21;
  }
  v16 = self->_trialClient;
  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](v16, "levelForFactor:withNamespaceName:", CFSTR("coreRuleBasedBedtimeHour"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
    self->_coreTimeRestrictionBedtimeHour = objc_msgSend(v17, "longValue");

  }
  else
  {
    self->_coreTimeRestrictionBedtimeHour = 1;
  }
  v18 = self->_trialClient;
  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](v18, "levelForFactor:withNamespaceName:", CFSTR("coreRuleBasedWakeupHour"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
    self->_coreTimeRestrictionWakeupHour = objc_msgSend(v19, "longValue");

  }
  else
  {
    self->_coreTimeRestrictionWakeupHour = 6;
  }
  v20 = self->_trialClient;
  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](v20, "levelForFactor:withNamespaceName:", CFSTR("ruleBasedMaxDurationHours"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
    objc_msgSend(v21, "doubleValue");
    self->_maxPredictionDurationHours = v22;

  }
  else
  {
    self->_maxPredictionDurationHours = 6.0;
  }
  v23 = self->_trialClient;
  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](v23, "levelForFactor:withNamespaceName:", CFSTR("ruleBasedNegativeLuxPreventsEngagement"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
    self->_excludeNegativeLux = objc_msgSend(v24, "BOOLeanValue");

  }
  else
  {
    self->_excludeNegativeLux = 0;
  }
  v25 = self->_trialClient;
  if (v25)
  {
    v26 = (id)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](v25, "levelForFactor:withNamespaceName:", CFSTR("requeryDelta"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
    self->_requeryDelta = objc_msgSend(v26, "longValue");

  }
  else
  {
    self->_requeryDelta = 900;
  }
}

+ (id)log
{
  return objc_msgSend(a1, "logWithCategory:", CFSTR("ruleBasedPredictor"));
}

+ (id)sleepLog
{
  return objc_msgSend(a1, "logWithCategory:", CFSTR("ruleBasedSleepPredictor"));
}

- (id)sleepSuppressionPredictionResultAtDate:(id)a3 withError:(id *)a4
{
  id v5;
  int timeRestrictionLateHour;
  int timeRestrictionEarlyHour;
  double v8;
  double v9;
  id v10;
  NSObject *v11;
  int requeryDelta;
  id v13;
  NSObject *v14;
  unsigned int v15;
  double v16;
  double maxPredictionDurationHours;
  double v18;
  double v19;
  double v20;
  id v21;
  double v22;
  double v23;
  double v24;
  id v25;
  int v27;
  _BYTE v28[10];
  int v29;

  v5 = a3;
  if (!self->_useTimeRestriction)
  {
    maxPredictionDurationHours = self->_maxPredictionDurationHours;
LABEL_13:
    -[_OSInactivityPredictor confidenceThresholdStrict](self, "confidenceThresholdStrict");
    v18 = v20 + 0.01;
    goto LABEL_14;
  }
  timeRestrictionLateHour = self->_timeRestrictionLateHour;
  timeRestrictionEarlyHour = self->_timeRestrictionEarlyHour;
  -[_OSInactivityPredictor waitedDuration](self, "waitedDuration");
  v9 = v8;
  if (v8 < (double)self->_requeryDelta)
  {
    timeRestrictionLateHour = self->_initialTimeRestrictionLateHour;
    timeRestrictionEarlyHour = self->_initialTimeRestrictionEarlyHour;
    v10 = objc_msgSend((id)objc_opt_class(self), "sleepLog");
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      requeryDelta = self->_requeryDelta;
      v27 = 134218240;
      *(double *)v28 = v9;
      *(_WORD *)&v28[8] = 1024;
      v29 = requeryDelta;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Only waited %.2f seconds (<%d). Tighten time restrictions.", (uint8_t *)&v27, 0x12u);
    }

  }
  v13 = objc_msgSend((id)objc_opt_class(self), "sleepLog");
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v27 = 67109376;
    *(_DWORD *)v28 = timeRestrictionLateHour;
    *(_WORD *)&v28[4] = 1024;
    *(_DWORD *)&v28[6] = timeRestrictionEarlyHour;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Restricting entry between %d to %d", (uint8_t *)&v27, 0xEu);
  }

  v15 = +[OSIntelligenceUtilities isInputDateInTimeRange:withEarlyTimeOfDay:andLateTimeOfDay:](OSIntelligenceUtilities, "isInputDateInTimeRange:withEarlyTimeOfDay:andLateTimeOfDay:", v5, (double)timeRestrictionLateHour, (double)timeRestrictionEarlyHour);
  +[OSIntelligenceUtilities secondsUntilHour:fromDate:](OSIntelligenceUtilities, "secondsUntilHour:fromDate:", timeRestrictionEarlyHour, v5);
  maxPredictionDurationHours = 0.0;
  v18 = 0.0;
  if (v15)
  {
    v19 = v16 / 3600.0;
    if (self->_maxPredictionDurationHours >= v19)
      maxPredictionDurationHours = v19;
    else
      maxPredictionDurationHours = self->_maxPredictionDurationHours;
    goto LABEL_13;
  }
LABEL_14:
  v21 = objc_alloc((Class)_OSInactivityPredictorOutput);
  -[_OSInactivityPredictor confidenceThresholdRelaxed](self, "confidenceThresholdRelaxed");
  v23 = v22;
  -[_OSInactivityPredictor confidenceThresholdStrict](self, "confidenceThresholdStrict");
  v25 = objc_msgSend(v21, "initWithConfidenceValue:andRelaxedThreshold:andStrictThreshold:andPredictedDuration:andReason:", 1, v18, v23, v24, maxPredictionDurationHours);

  return v25;
}

- (id)longInactivityPredictionResultAtDate:(id)a3 withTimeSinceInactive:(double)a4 withOptions:(int64_t)a5 withError:(id *)a6
{
  id v9;
  id v10;
  int coreTimeRestrictionBedtimeHour;
  int coreTimeRestrictionWakeupHour;
  id v13;
  NSObject *v14;
  unsigned int v15;
  double v16;
  double maxPredictionDurationHours;
  double v18;
  double v19;
  double v20;
  id v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  int v27;
  int64_t v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;

  v9 = a3;
  if (a5 != 1)
  {
    if (self->_useTimeRestriction)
    {
      coreTimeRestrictionBedtimeHour = self->_coreTimeRestrictionBedtimeHour;
      coreTimeRestrictionWakeupHour = self->_coreTimeRestrictionWakeupHour;
      v13 = objc_msgSend((id)objc_opt_class(self), "log");
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v27 = 134218496;
        v28 = a5;
        v29 = 1024;
        v30 = coreTimeRestrictionBedtimeHour;
        v31 = 1024;
        v32 = coreTimeRestrictionWakeupHour;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "(%ld) Restricting entry between %d to %d", (uint8_t *)&v27, 0x18u);
      }

      v15 = +[OSIntelligenceUtilities isInputDateInTimeRange:withEarlyTimeOfDay:andLateTimeOfDay:](OSIntelligenceUtilities, "isInputDateInTimeRange:withEarlyTimeOfDay:andLateTimeOfDay:", v9, (double)coreTimeRestrictionBedtimeHour, (double)coreTimeRestrictionWakeupHour);
      +[OSIntelligenceUtilities secondsUntilHour:fromDate:](OSIntelligenceUtilities, "secondsUntilHour:fromDate:", coreTimeRestrictionWakeupHour, v9);
      maxPredictionDurationHours = 0.0;
      v18 = 0.0;
      if (!v15)
        goto LABEL_12;
      v19 = v16 / 3600.0;
      if (self->_maxPredictionDurationHours >= v19)
        maxPredictionDurationHours = v19;
      else
        maxPredictionDurationHours = self->_maxPredictionDurationHours;
    }
    else
    {
      maxPredictionDurationHours = self->_maxPredictionDurationHours;
    }
    -[_OSInactivityPredictor confidenceThresholdStrict](self, "confidenceThresholdStrict");
    v18 = v20 + 0.01;
LABEL_12:
    v21 = objc_alloc((Class)_OSInactivityPredictorOutput);
    -[_OSInactivityPredictor confidenceThresholdRelaxed](self, "confidenceThresholdRelaxed");
    v23 = v22;
    -[_OSInactivityPredictor confidenceThresholdStrict](self, "confidenceThresholdStrict");
    v10 = objc_msgSend(v21, "initWithConfidenceValue:andRelaxedThreshold:andStrictThreshold:andPredictedDuration:andReason:", 1, v18, v23, v24, maxPredictionDurationHours);
    goto LABEL_13;
  }
  v10 = (id)objc_claimAutoreleasedReturnValue(-[_OSInactivityPredictorRuleBasedModel sleepSuppressionPredictionResultAtDate:withError:](self, "sleepSuppressionPredictionResultAtDate:withError:", v9, a6));
LABEL_13:
  v25 = v10;

  return v25;
}

- (double)recommendedWaitTime
{
  return self->recommendedWaitTime;
}

- (void)setRecommendedWaitTime:(double)a3
{
  self->recommendedWaitTime = a3;
}

- (TRIClient)trialClient
{
  return self->_trialClient;
}

- (void)setTrialClient:(id)a3
{
  objc_storeStrong((id *)&self->_trialClient, a3);
}

- (OSIAmbientLightMonitor)lightMonitor
{
  return self->_lightMonitor;
}

- (void)setLightMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_lightMonitor, a3);
}

- (BOOL)useTimeRestriction
{
  return self->_useTimeRestriction;
}

- (void)setUseTimeRestriction:(BOOL)a3
{
  self->_useTimeRestriction = a3;
}

- (int)timeRestrictionLateHour
{
  return self->_timeRestrictionLateHour;
}

- (void)setTimeRestrictionLateHour:(int)a3
{
  self->_timeRestrictionLateHour = a3;
}

- (int)timeRestrictionEarlyHour
{
  return self->_timeRestrictionEarlyHour;
}

- (void)setTimeRestrictionEarlyHour:(int)a3
{
  self->_timeRestrictionEarlyHour = a3;
}

- (int)initialTimeRestrictionLateHour
{
  return self->_initialTimeRestrictionLateHour;
}

- (void)setInitialTimeRestrictionLateHour:(int)a3
{
  self->_initialTimeRestrictionLateHour = a3;
}

- (int)initialTimeRestrictionEarlyHour
{
  return self->_initialTimeRestrictionEarlyHour;
}

- (void)setInitialTimeRestrictionEarlyHour:(int)a3
{
  self->_initialTimeRestrictionEarlyHour = a3;
}

- (int)coreTimeRestrictionBedtimeHour
{
  return self->_coreTimeRestrictionBedtimeHour;
}

- (void)setCoreTimeRestrictionBedtimeHour:(int)a3
{
  self->_coreTimeRestrictionBedtimeHour = a3;
}

- (int)coreTimeRestrictionWakeupHour
{
  return self->_coreTimeRestrictionWakeupHour;
}

- (void)setCoreTimeRestrictionWakeupHour:(int)a3
{
  self->_coreTimeRestrictionWakeupHour = a3;
}

- (double)maxPredictionDurationHours
{
  return self->_maxPredictionDurationHours;
}

- (void)setMaxPredictionDurationHours:(double)a3
{
  self->_maxPredictionDurationHours = a3;
}

- (BOOL)excludeNegativeLux
{
  return self->_excludeNegativeLux;
}

- (void)setExcludeNegativeLux:(BOOL)a3
{
  self->_excludeNegativeLux = a3;
}

- (int)requeryDelta
{
  return self->_requeryDelta;
}

- (void)setRequeryDelta:(int)a3
{
  self->_requeryDelta = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lightMonitor, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);
}

@end
