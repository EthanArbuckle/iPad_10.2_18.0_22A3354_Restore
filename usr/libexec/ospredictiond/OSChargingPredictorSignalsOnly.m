@implementation OSChargingPredictorSignalsOnly

- (OSChargingPredictorSignalsOnly)initWithDefaultsDomain:(id)a3 withContextStore:(id)a4 withTrialManager:(id)a5
{
  NSString *v8;
  _CDLocalContext *v9;
  OSIntelligenceTrialManager *v10;
  OSChargingPredictorSignalsOnly *v11;
  NSString *defaultsDomain;
  NSString *v13;
  _CDLocalContext *context;
  _CDLocalContext *v15;
  OSIntelligenceTrialManager *trialManager;
  OSIntelligenceTrialManager *v17;
  uint64_t v18;
  OSChargingSignals *chargingSignals;
  objc_super v21;

  v8 = (NSString *)a3;
  v9 = (_CDLocalContext *)a4;
  v10 = (OSIntelligenceTrialManager *)a5;
  v21.receiver = self;
  v21.super_class = (Class)OSChargingPredictorSignalsOnly;
  v11 = -[OSChargingPredictorSignalsOnly init](&v21, "init");
  defaultsDomain = v11->_defaultsDomain;
  v11->_defaultsDomain = v8;
  v13 = v8;

  context = v11->_context;
  v11->_context = v9;
  v15 = v9;

  trialManager = v11->_trialManager;
  v11->_trialManager = v10;
  v17 = v10;

  v18 = objc_claimAutoreleasedReturnValue(+[OSChargingSignals sharedInstance](OSChargingSignals, "sharedInstance"));
  chargingSignals = v11->_chargingSignals;
  v11->_chargingSignals = (OSChargingSignals *)v18;

  return v11;
}

- (id)chargingDecisionWithLog:(id)a3
{
  NSObject *v4;
  id v5;
  _BOOL8 v6;
  _BOOL4 v7;
  double v8;
  const char *v9;
  uint8_t *v10;
  uint64_t v12;
  __int16 v13;

  v4 = a3;
  v5 = objc_alloc_init((Class)_OSChargingPredictorOutput);
  v6 = -[OSChargingPredictorSignalsOnly areEntryConditionsMetWithLog:](self, "areEntryConditionsMetWithLog:", v4);
  v7 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    v8 = 1.0;
    if (v7)
    {
      v13 = 0;
      v9 = "Entry conditions are met";
      v10 = (uint8_t *)&v13;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
    }
  }
  else
  {
    v8 = 0.0;
    if (v7)
    {
      LOWORD(v12) = 0;
      v9 = "Entry conditions are not met";
      v10 = (uint8_t *)&v12;
      goto LABEL_6;
    }
  }
  objc_msgSend(v5, "setConfidence:", v8, v12);
  objc_msgSend(v5, "setMeetsSystemConfidenceThreshold:", v6);
  objc_msgSend(v5, "setChargingDuration:", 0.0);

  return v5;
}

- (BOOL)areEntryConditionsMetWithLog:(id)a3
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  BOOL v16;
  const char *v17;
  uint8_t *v18;
  __int16 v20;
  __int16 v21;
  uint8_t buf[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OSChargingPredictorSignalsOnly chargingSignals](self, "chargingSignals"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "walletMonitor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v6, "relevantEventDeadline"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
  LOBYTE(v6) = objc_msgSend(v7, "isEqualToDate:", v8);

  if ((v6 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[OSChargingPredictorSignalsOnly chargingSignals](self, "chargingSignals"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "calendarMonitor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v10, "relevantEventDeadline"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
    LOBYTE(v10) = objc_msgSend(v11, "isEqualToDate:", v12);

    if ((v10 & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[OSChargingPredictorSignalsOnly chargingSignals](self, "chargingSignals"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "locationMonitor"));
      v15 = objc_msgSend(v14, "inTypicalLocation");

      if ((v15 & 1) != 0)
      {
        v16 = 1;
LABEL_12:

        goto LABEL_13;
      }
      v16 = 0;
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        goto LABEL_12;
      v20 = 0;
      v17 = "Not in typical location. Returning NO";
      v18 = (uint8_t *)&v20;
    }
    else
    {
      v16 = 0;
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        goto LABEL_12;
      v21 = 0;
      v17 = "Found calendar event. Returning NO";
      v18 = (uint8_t *)&v21;
    }
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v17, v18, 2u);
    v16 = 0;
    goto LABEL_12;
  }
  v16 = 0;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Found wallet event. Returning NO", buf, 2u);
    v16 = 0;
  }
LABEL_13:

  return v16;
}

- (unint64_t)modelVersion
{
  return 1;
}

- (id)predictFullChargeDateWithBatteryLevel:(unint64_t)a3
{
  return 0;
}

- (OSChargingSignals)chargingSignals
{
  return self->_chargingSignals;
}

- (void)setChargingSignals:(id)a3
{
  objc_storeStrong((id *)&self->_chargingSignals, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialManager, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_defaultsDomain, 0);
  objc_storeStrong((id *)&self->_chargingSignals, 0);
}

@end
