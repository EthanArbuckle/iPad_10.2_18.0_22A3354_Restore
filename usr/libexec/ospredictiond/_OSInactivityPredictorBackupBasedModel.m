@implementation _OSInactivityPredictorBackupBasedModel

- (_OSInactivityPredictorBackupBasedModel)init
{
  _OSInactivityPredictorBackupBasedModel *v2;
  os_log_t v3;
  OS_os_log *log;
  uint64_t v5;
  TRIClient *trialClient;
  TRIClient *v7;
  id v8;
  _OSInactivityPredictionBackupManager *v9;
  uint64_t v10;
  NSDictionary *hourToEntry;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)_OSInactivityPredictorBackupBasedModel;
  v2 = -[_OSInactivityPredictor init](&v19, "init");
  if (v2)
  {
    v3 = os_log_create("com.apple.osintelligence", "inactivity.model.backup");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    -[_OSInactivityPredictor setPredictorType:](v2, "setPredictorType:", CFSTR("backup"));
    -[_OSInactivityPredictor setQueryingMechanism:](v2, "setQueryingMechanism:", CFSTR("anytime"));
    v5 = objc_claimAutoreleasedReturnValue(+[TRIClient clientWithIdentifier:](TRIClient, "clientWithIdentifier:", 293));
    trialClient = v2->_trialClient;
    v2->_trialClient = (TRIClient *)v5;

    -[_OSInactivityPredictorBackupBasedModel updateTrialParameters](v2, "updateTrialParameters");
    objc_initWeak(&location, v2);
    v7 = v2->_trialClient;
    v13 = _NSConcreteStackBlock;
    v14 = 3221225472;
    v15 = sub_100029FA4;
    v16 = &unk_1000608F0;
    objc_copyWeak(&v17, &location);
    v8 = -[TRIClient addUpdateHandlerForNamespaceName:usingBlock:](v7, "addUpdateHandlerForNamespaceName:usingBlock:", CFSTR("COREOS_PREDICTION_INACTIVITY"), &v13);
    -[_OSInactivityPredictor setLongThreshold:](v2, "setLongThreshold:", 10800.0, v13, v14, v15, v16);
    -[_OSInactivityPredictor setConfidenceThresholdStrict:](v2, "setConfidenceThresholdStrict:", 0.9);
    -[_OSInactivityPredictor setConfidenceThresholdRelaxed:](v2, "setConfidenceThresholdRelaxed:", 0.4);
    -[_OSInactivityPredictor setRequireEnoughHistory:](v2, "setRequireEnoughHistory:", 0);
    v9 = objc_alloc_init(_OSInactivityPredictionBackupManager);
    v10 = objc_claimAutoreleasedReturnValue(-[_OSInactivityPredictionBackupManager hydrateBackup](v9, "hydrateBackup"));
    hourToEntry = v2->_hourToEntry;
    v2->_hourToEntry = (NSDictionary *)v10;

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v2;
}

+ (id)predictor
{
  return objc_alloc_init((Class)objc_opt_class(a1));
}

- (void)updateTrialParameters
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("backupRecommendedWaitTime"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
  objc_msgSend(v3, "doubleValue");
  -[_OSInactivityPredictor setRecommendedWaitTime:](self, "setRecommendedWaitTime:");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("backupAverageDurationMultiplier"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
  objc_msgSend(v4, "doubleValue");
  self->_averageDurationMultiplier = v5;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("backupPCTLongThreshold"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
  objc_msgSend(v6, "doubleValue");
  self->_pctLongThreshold = (double)(int)v7;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("backupNumLongThreshold"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
  self->_numLongThreshold = objc_msgSend(v8, "longValue");

  v10 = (id)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("backupMaxDurationHours"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
  objc_msgSend(v10, "doubleValue");
  self->_maxPredictionDurationHours = v9;

}

- (BOOL)showsSignificantInactivity:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  double v7;

  v4 = a3;
  v5 = objc_opt_class(_OSInactivityPredictorBackupHourEntry_v2);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    objc_msgSend(v4, "pctLong");
    v7 = v6;

    if (v7 > self->_pctLongThreshold)
      return 1;
  }
  else
  {
    objc_msgSend(v4, "count");

  }
  return 0;
}

- (id)longInactivityPredictionResultAtDate:(id)a3 withTimeSinceInactive:(double)a4 withOptions:(int64_t)a5 withError:(id *)a6
{
  double v7;
  double maxPredictionDurationHours;
  id v9;
  id v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  uint64_t v15;

  -[_OSInactivityPredictorBackupBasedModel computeInactivityHoursFromBackupForDate:](self, "computeInactivityHoursFromBackupForDate:", a3, a5, a6, a4);
  if (v7 >= self->_maxPredictionDurationHours)
    maxPredictionDurationHours = self->_maxPredictionDurationHours;
  else
    maxPredictionDurationHours = v7;
  v9 = objc_alloc((Class)_OSInactivityPredictorOutput);
  v10 = v9;
  if (maxPredictionDurationHours <= 0.0)
  {
    v14 = kInvalidPredictedDuration;
    v12 = 0.0;
    v13 = 0;
    v15 = 0;
  }
  else
  {
    -[_OSInactivityPredictor confidenceThresholdStrict](self, "confidenceThresholdStrict");
    v12 = v11 + 0.01;
    v9 = v10;
    v13 = 2;
    v14 = maxPredictionDurationHours;
    v15 = 1;
  }
  return objc_msgSend(v9, "initWithConfidenceLevel:andConfidenceValue:andPredictedDuration:andReason:", v13, v15, v12, v14);
}

- (double)computeInactivityHoursFromBackupForDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  OS_os_log *v8;
  NSDictionary *hourToEntry;
  id v10;
  id v11;
  id v12;
  int v13;
  double v14;
  OS_os_log *v15;
  OS_os_log *log;
  double v18;
  double v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  __int128 *p_buf;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  int v29;
  uint8_t v30[4];
  uint64_t v31;
  uint8_t v32[16];
  __int128 buf;
  uint64_t v34;
  uint64_t v35;

  v4 = a3;
  if (-[NSDictionary count](self->_hourToEntry, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "components:fromDate:", 60, v4));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateFromComponents:", v6));
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v34 = 0x2020000000;
    v35 = 0;
    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 0;
    v8 = self->_log;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEBUG))
      sub_10003FB80(v32, (uint64_t)objc_msgSend(v6, "hour"), (os_log_t)v8);

    hourToEntry = self->_hourToEntry;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10002A570;
    v20[3] = &unk_1000611A0;
    v20[4] = self;
    v10 = v6;
    v21 = v10;
    v11 = v5;
    v22 = v11;
    v12 = v7;
    v23 = v12;
    p_buf = &buf;
    v25 = &v26;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](hourToEntry, "enumerateKeysAndObjectsUsingBlock:", v20);
    v13 = *((_DWORD *)v27 + 6);
    if (v13)
    {
      v14 = *(double *)(*((_QWORD *)&buf + 1) + 24) / (double)v13 * self->_averageDurationMultiplier;
    }
    else
    {
      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR))
      {
        v19 = kInvalidPredictedDuration;
        *(_DWORD *)v30 = 134217984;
        v31 = kInvalidPredictedDuration;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_ERROR, "No backup entry was summed up; predicting %.1fh duration",
          v30,
          0xCu);
        v14 = v19;
      }
      else
      {
        v14 = kInvalidPredictedDuration;
      }
    }

    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&buf, 8);

  }
  else
  {
    v15 = self->_log;
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
    {
      v18 = kInvalidPredictedDuration;
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = kInvalidPredictedDuration;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v15, OS_LOG_TYPE_ERROR, "No backup entry found at all; predicting %.1fh duration",
        (uint8_t *)&buf,
        0xCu);
      v14 = v18;
    }
    else
    {
      v14 = kInvalidPredictedDuration;
    }
  }

  return v14;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (NSDictionary)hourToEntry
{
  return self->_hourToEntry;
}

- (void)setHourToEntry:(id)a3
{
  objc_storeStrong((id *)&self->_hourToEntry, a3);
}

- (TRIClient)trialClient
{
  return self->_trialClient;
}

- (void)setTrialClient:(id)a3
{
  objc_storeStrong((id *)&self->_trialClient, a3);
}

- (double)maxPredictionDurationHours
{
  return self->_maxPredictionDurationHours;
}

- (void)setMaxPredictionDurationHours:(double)a3
{
  self->_maxPredictionDurationHours = a3;
}

- (double)averageDurationMultiplier
{
  return self->_averageDurationMultiplier;
}

- (void)setAverageDurationMultiplier:(double)a3
{
  self->_averageDurationMultiplier = a3;
}

- (double)pctLongThreshold
{
  return self->_pctLongThreshold;
}

- (void)setPctLongThreshold:(double)a3
{
  self->_pctLongThreshold = a3;
}

- (int)numLongThreshold
{
  return self->_numLongThreshold;
}

- (void)setNumLongThreshold:(int)a3
{
  self->_numLongThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialClient, 0);
  objc_storeStrong((id *)&self->_hourToEntry, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
