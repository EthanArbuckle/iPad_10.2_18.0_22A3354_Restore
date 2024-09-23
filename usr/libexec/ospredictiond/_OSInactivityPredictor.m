@implementation _OSInactivityPredictor

- (_OSInactivityPredictor)init
{
  _OSInactivityPredictor *v2;
  _OSInactivityPredictor *v3;
  NSString *predictorType;
  NSString *modelVersion;
  NSString *queryingMechanism;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_OSInactivityPredictor;
  v2 = -[_OSInactivityPredictor init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    predictorType = v2->predictorType;
    v2->predictorType = (NSString *)CFSTR("basic");

    modelVersion = v3->modelVersion;
    v3->modelVersion = (NSString *)CFSTR("None");

    queryingMechanism = v3->queryingMechanism;
    v3->queryingMechanism = (NSString *)CFSTR("single");

    *(_OWORD *)&v3->recommendedWaitTime = xmmword_10004B5E0;
    *(_OWORD *)&v3->confidenceThresholdStrict = xmmword_10004B5D0;
    v3->requireEnoughHistory = 0;
  }
  return v3;
}

+ (id)predictor
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  _BOOL4 v13;
  const char *v14;
  unsigned int v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  uint64_t v19;
  const char *v20;
  NSObject *v21;
  __objc2_class *v22;
  void *v23;
  void *v24;
  uint8_t v26[16];

  v3 = (void *)os_transaction_create("com.apple.osintelligence.activatepredictor");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceDefines inactivityUserDefaults](OSIntelligenceDefines, "inactivityUserDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("modelType")));

  if (v5)
  {
    v6 = objc_msgSend(v4, "integerForKey:", CFSTR("modelType"));
    switch((unint64_t)v6)
    {
      case 1uLL:
        v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v26 = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "User has overridden device to only use ML-based model", v26, 2u);
        }

        if ((objc_msgSend(a1, "hasEnoughInactivityHistory") & 1) != 0)
          goto LABEL_37;
        v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          goto LABEL_36;
        *(_WORD *)v26 = 0;
        v9 = "User does not have enough inactivity history so performance may be worse than expected by a customer";
        goto LABEL_35;
      case 2uLL:
        v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v26 = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "User has overridden device to only use alternate model", v26, 2u);
        }

        if ((objc_msgSend(a1, "hasEnoughInactivityHistory") & 1) != 0)
          goto LABEL_26;
        v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          goto LABEL_25;
        *(_WORD *)v26 = 0;
        v14 = "User does not have enough inactivity history so performance may be worse than expected by a customer";
        goto LABEL_24;
      case 3uLL:
        v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          goto LABEL_43;
        *(_WORD *)v26 = 0;
        v20 = "User has overridden device to only use rule-based model";
        goto LABEL_42;
      case 4uLL:
        v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v26 = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "User has overridden device to only use backup-based model", v26, 2u);
        }

        if (+[_OSInactivityPredictionBackupManager hasBackup](_OSInactivityPredictionBackupManager, "hasBackup"))
        {
          goto LABEL_32;
        }
        v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          goto LABEL_43;
        *(_WORD *)v26 = 0;
        v20 = "User does not have a backup so falling back to rule-based.";
        goto LABEL_42;
      default:
        v10 = (uint64_t)v6;
        v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          sub_10003E348(v10, v11);

        break;
    }
  }
  if (!objc_msgSend(a1, "hasEnoughInactivityHistory"))
  {
    v15 = +[_OSInactivityPredictionBackupManager hasBackup](_OSInactivityPredictionBackupManager, "hasBackup");
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v17)
      {
        *(_WORD *)v26 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "User does not have enough inactivity history but has backup; using the backup model.",
          v26,
          2u);
      }

LABEL_32:
      v22 = _OSInactivityPredictorBackupBasedModel;
    }
    else
    {
      if (v17)
      {
        *(_WORD *)v26 = 0;
        v20 = "User has neither enough history nor backup; using the rule-based model.";
LABEL_42:
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v20, v26, 2u);
      }
LABEL_43:

      v22 = _OSInactivityPredictorRuleBasedModel;
    }
    goto LABEL_44;
  }
  v12 = objc_msgSend(a1, "readEvaluatedPredictorTypeFromDefaults");
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
  v13 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v12 != (id)2)
  {
    if (v13)
    {
      *(_WORD *)v26 = 0;
      v9 = "User has enough inactivity history; using two stage ML model.";
LABEL_35:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, v26, 2u);
    }
LABEL_36:

LABEL_37:
    v22 = _OSInactivityPredictorTwoStage;
LABEL_44:
    v19 = objc_claimAutoreleasedReturnValue(-[__objc2_class predictor](v22, "predictor", *(_QWORD *)v26));
    goto LABEL_45;
  }
  if (v13)
  {
    *(_WORD *)v26 = 0;
    v14 = "User has enough inactivity history and has sporadic behavior; using alternate ML model.";
LABEL_24:
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v14, v26, 2u);
  }
LABEL_25:

LABEL_26:
  v19 = objc_claimAutoreleasedReturnValue(+[_OSInactivityPredictorTwoStage alternatePredictor](_OSInactivityPredictorTwoStage, "alternatePredictor", *(_QWORD *)v26));
LABEL_45:
  v23 = (void *)v19;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[_OSInactivityPredictorSignalsAndModel predictorWithPredictor:](_OSInactivityPredictorSignalsAndModel, "predictorWithPredictor:", v19));

  return v24;
}

- (unint64_t)modelTypeFromPredictorName:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ruleBased")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("backup")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "hasSuffix:", CFSTR("_alt")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("twoStage")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "containsString:", CFSTR("lassifier")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (unint64_t)readEvaluatedPredictorTypeFromDefaults
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceDefines inactivityUserDefaults](OSIntelligenceDefines, "inactivityUserDefaults"));
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("predictorType"));

  return (unint64_t)v3;
}

+ (BOOL)hasEnoughInactivityHistory
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_OSLockHistory sharedInstance](_OSLockHistory, "sharedInstance"));
  v3 = objc_msgSend(v2, "hasEnoughHistoryForInactivityPrediction");

  return v3;
}

+ (id)projectedDateOfHistorySufficiencyWithError:(id *)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_OSLockHistory sharedInstance](_OSLockHistory, "sharedInstance", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "projectedDateOfHistorySufficiency"));

  return v4;
}

+ (id)userHistoryDiagnosis
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_OSLockHistory sharedInstance](_OSLockHistory, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "userHistoryDiagnosis"));

  return v3;
}

+ (BOOL)isDeviceRarelyUsedRecently
{
  void *v3;
  double v4;
  BOOL v5;
  void *v6;
  void *v7;
  double v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dailyAverageActiveDurationsInHours:", 7));
  +[OSIntelligenceUtilities meanOf:](OSIntelligenceUtilities, "meanOf:", v3);
  v5 = v4 * 3600.0 < 1800.0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "ultraLongInactiveDurationsInHours:withThreshold:", 7, 50400.0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForKeyPath:", CFSTR("@sum.self")));
  objc_msgSend(v7, "doubleValue");
  if (v8 * 3600.0 > 144000.0)
    v5 = 1;

  return v5;
}

+ (id)deviceUsageDiagnosis
{
  unsigned int v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v3 = objc_msgSend(a1, "isDeviceRarelyUsedRecently");
  v4 = &stru_100062558;
  if (v3)
    v4 = CFSTR("NOT ");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("This device is %@frequently used in the past %d days."), v4, 7));
  v6 = v5;
  if ((v3 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dailyAverageActiveDurationsInHours:", 7));
    +[OSIntelligenceUtilities meanOf:](OSIntelligenceUtilities, "meanOf:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("In the past %d days, the device is on average used for %.2f hours daily (we recommend >%.2f hours)\n  -> daily usages: %@"), 7, v8, 0x3FE0000000000000, v7));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "ultraLongInactiveDurationsInHours:withThreshold:", 7, 50400.0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueForKeyPath:", CFSTR("@sum.self")));
    objc_msgSend(v11, "doubleValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("In the past %d days, the device has in total %.2f hours of ultra long inactivity (we recommend <%.2f hours)\n  -> ultra long durations: %@"), 7, v12, 0x4044000000000000, v10));
    v14 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\n%@\n%@\nInactivity prediction accuracy is NOT guaranteed on low-usage devices! Please use your device more."), v6, v9, v13));

  }
  else
  {
    v14 = v5;
  }

  return v14;
}

+ (id)ultraLongInactiveDurationsInHours:(int)a3 withThreshold:(double)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _QWORD v33[2];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", (double)-a3 * 86400.0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_OSLockHistory sharedInstance](_OSLockHistory, "sharedInstance"));
  v9 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("startDate >= %@"), v7));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4));
  v11 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("duration >= %@"), v10));

  v25 = (void *)v11;
  v26 = (void *)v9;
  v33[0] = v9;
  v33[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 2));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v12));

  v27 = v8;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lockedIntervalsQueryWithPredicate:", v13));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "endDate"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "startDate"));
        objc_msgSend(v20, "timeIntervalSinceDate:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v22 / 3600.0));
        objc_msgSend(v6, "addObject:", v23);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v16);
  }

  return v6;
}

+ (id)dailyAverageActiveDurationsInHours:(int)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  double v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _QWORD v32[2];

  v24 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (a3 >= 1)
  {
    v4 = 0;
    v23 = a3;
    do
    {
      v5 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", (double)(int)v4 * -86400.0));
      v6 = v4 + 1;
      v7 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", (double)((int)v4 + 1) * -86400.0));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[_OSLockHistory sharedInstance](_OSLockHistory, "sharedInstance"));
      v25 = (void *)v7;
      v32[0] = v7;
      v32[1] = v5;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 2));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("startDate BETWEEN %@"), v9));

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "unlockedIntervalsQueryWithPredicate:", v10));
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      v26 = (void *)v5;
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v28;
        v15 = 0.0;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(_QWORD *)v28 != v14)
              objc_enumerationMutation(v11);
            v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "endDate"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "startDate"));
            objc_msgSend(v18, "timeIntervalSinceDate:", v19);
            v15 = v15 + v20;

          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        }
        while (v13);
      }
      else
      {
        v15 = 0.0;
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v15 / 3600.0));
      objc_msgSend(v24, "setObject:atIndexedSubscript:", v21, v4);

      ++v4;
    }
    while (v6 != v23);
  }
  return v24;
}

+ (id)log
{
  return objc_msgSend(a1, "logWithCategory:", CFSTR("basepredictor"));
}

+ (id)logWithCategory:(id)a3
{
  id v3;
  os_log_t v4;

  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("inactivity.%@"), a3)));
  v4 = os_log_create("com.apple.osintelligence", (const char *)objc_msgSend(v3, "UTF8String"));

  return v4;
}

- (id)longInactivityPredictionResultWithOptions:(int64_t)a3 withError:(id *)a4
{
  void *v7;
  void *v8;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  -[_OSInactivityPredictor waitedDuration](self, "waitedDuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_OSInactivityPredictor longInactivityPredictionResultAtDate:withTimeSinceInactive:withOptions:withError:](self, "longInactivityPredictionResultAtDate:withTimeSinceInactive:withOptions:withError:", v7, a3, a4));

  return v8;
}

- (double)waitedDuration
{
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  double v7;
  void *v8;
  double v9;
  double v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities lastLockDate](OSIntelligenceUtilities, "lastLockDate"));
  v4 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities lastPluggedInDate](OSIntelligenceUtilities, "lastPluggedInDate"));
  v5 = (void *)v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (v6)
  {
    -[_OSInactivityPredictor recommendedWaitTime](self, "recommendedWaitTime");
    v10 = v7;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "laterDate:", v4));
    objc_msgSend(v8, "timeIntervalSinceNow");
    v10 = -v9;

  }
  return v10;
}

- (id)longInactivityPredictionResultAtDate:(id)a3 withTimeSinceInactive:(double)a4 withOptions:(int64_t)a5 withError:(id *)a6
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint8_t buf[16];

  v7 = a3;
  v8 = objc_msgSend((id)objc_opt_class(self), "log");
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "This should not be called...Subclass must override this function!", buf, 2u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s must be overridden in a subclass"), "-[_OSInactivityPredictor longInactivityPredictionResultAtDate:withTimeSinceInactive:withOptions:withError:]"));
  v11 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v10, 0));

  objc_exception_throw(v11);
}

- (NSString)description
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_OSInactivityPredictor metadata](self, "metadata"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "description"));

  return (NSString *)v3;
}

- (id)metadata
{
  return objc_msgSend(objc_alloc((Class)_OSInactivityPredictorMetadata), "initWithProtocolConformer:", self);
}

- (double)recommendedWaitTime
{
  return self->recommendedWaitTime;
}

- (void)setRecommendedWaitTime:(double)a3
{
  self->recommendedWaitTime = a3;
}

- (double)confidenceThresholdRelaxed
{
  return self->confidenceThresholdRelaxed;
}

- (void)setConfidenceThresholdRelaxed:(double)a3
{
  self->confidenceThresholdRelaxed = a3;
}

- (double)confidenceThresholdStrict
{
  return self->confidenceThresholdStrict;
}

- (void)setConfidenceThresholdStrict:(double)a3
{
  self->confidenceThresholdStrict = a3;
}

- (double)longThreshold
{
  return self->longThreshold;
}

- (void)setLongThreshold:(double)a3
{
  self->longThreshold = a3;
}

- (NSString)modelVersion
{
  return self->modelVersion;
}

- (void)setModelVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)predictorType
{
  return self->predictorType;
}

- (void)setPredictorType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)queryingMechanism
{
  return self->queryingMechanism;
}

- (void)setQueryingMechanism:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)requireEnoughHistory
{
  return self->requireEnoughHistory;
}

- (void)setRequireEnoughHistory:(BOOL)a3
{
  self->requireEnoughHistory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->queryingMechanism, 0);
  objc_storeStrong((id *)&self->predictorType, 0);
  objc_storeStrong((id *)&self->modelVersion, 0);
}

@end
