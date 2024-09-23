@implementation _DASRequiresRestartPolicy

- (BOOL)appliesToActivity:(id)a3
{
  id v3;
  unsigned __int8 v4;

  v3 = a3;
  if ((objc_msgSend(v3, "triggersRestart") & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "requiresSignificantUserInactivity");

  return v4;
}

- (id)initializeTriggers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  _QWORD v15[4];
  _QWORD v16[4];
  _QWORD v17[4];
  _QWORD v18[4];
  _QWORD v19[4];
  _QWORD v20[4];
  _QWORD v21[4];
  _QWORD v22[4];

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", self->_deviceAssertionsHeld));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", self->_inUseStatus));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", self->_nextWakeRequest));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForBacklightOnStatus](_CDContextQueries, "keyPathForBacklightOnStatus"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", v3));

  v20[0] = CFSTR("identifier");
  v20[1] = CFSTR("predicate");
  v21[0] = CFSTR("com.apple.duetactivityscheduler.restartpolicy.assertionsheld");
  v21[1] = v13;
  v20[2] = CFSTR("deviceSet");
  v20[3] = CFSTR("mustWake");
  v21[2] = &off_10016E888;
  v21[3] = &__kCFBooleanTrue;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 4));
  v22[0] = v4;
  v18[0] = CFSTR("identifier");
  v18[1] = CFSTR("predicate");
  v19[0] = CFSTR("com.apple.duetactivityscheduler.restartpolicy.inusestatus");
  v19[1] = v11;
  v18[2] = CFSTR("deviceSet");
  v18[3] = CFSTR("mustWake");
  v19[2] = &off_10016E888;
  v19[3] = &__kCFBooleanTrue;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 4));
  v22[1] = v5;
  v16[0] = CFSTR("identifier");
  v16[1] = CFSTR("predicate");
  v17[0] = CFSTR("com.apple.das.restartpolicy.backlightOn");
  v17[1] = v10;
  v16[2] = CFSTR("deviceSet");
  v16[3] = CFSTR("mustWake");
  v17[2] = &off_10016E888;
  v17[3] = &__kCFBooleanFalse;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 4));
  v22[2] = v6;
  v14[0] = CFSTR("identifier");
  v14[1] = CFSTR("predicate");
  v15[0] = CFSTR("com.apple.duetactivityscheduler.restartpolicy.wakerequest");
  v15[1] = v12;
  v14[2] = CFSTR("deviceSet");
  v14[3] = CFSTR("mustWake");
  v15[2] = &off_10016E888;
  v15[3] = &__kCFBooleanTrue;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 4));
  v22[3] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 4));

  return v8;
}

- (_DASRequiresRestartPolicy)init
{
  _DASRequiresRestartPolicy *v2;
  _DASRequiresRestartPolicy *v3;
  NSString *policyName;
  uint64_t v5;
  _CDContextualKeyPath *deviceAssertionsHeld;
  uint64_t v7;
  _CDContextualKeyPath *inUseStatus;
  uint64_t v9;
  _CDContextualKeyPath *nextWakeRequest;
  uint64_t v11;
  NSDate *lastCacheDate;
  uint64_t v13;
  NSArray *triggers;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_DASRequiresRestartPolicy;
  v2 = -[_DASRequiresRestartPolicy init](&v16, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)CFSTR("Restart Required Activities Policy");

    v5 = objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForDeviceAssertionsHeldStatus](_CDContextQueries, "keyPathForDeviceAssertionsHeldStatus"));
    deviceAssertionsHeld = v3->_deviceAssertionsHeld;
    v3->_deviceAssertionsHeld = (_CDContextualKeyPath *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForInUseStatus](_CDContextQueries, "keyPathForInUseStatus"));
    inUseStatus = v3->_inUseStatus;
    v3->_inUseStatus = (_CDContextualKeyPath *)v7;

    v9 = objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForNextUserVisibleWakeDate](_CDContextQueries, "keyPathForNextUserVisibleWakeDate"));
    nextWakeRequest = v3->_nextWakeRequest;
    v3->_nextWakeRequest = (_CDContextualKeyPath *)v9;

    *(_OWORD *)&v3->_minDurationAfterLastUserInteraction = xmmword_10011D3C0;
    v11 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
    lastCacheDate = v3->_lastCacheDate;
    v3->_lastCacheDate = (NSDate *)v11;

    -[_DASRequiresRestartPolicy getDeviceRestartForecast](v3, "getDeviceRestartForecast");
    v13 = objc_claimAutoreleasedReturnValue(-[_DASRequiresRestartPolicy initializeTriggers](v3, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v13;

  }
  return v3;
}

+ (id)policyInstance
{
  if (qword_1001AB938 != -1)
    dispatch_once(&qword_1001AB938, &stru_10015E740);
  return (id)qword_1001AB940;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  _CDContextualKeyPath *deviceAssertionsHeld;
  void *v9;
  unsigned __int8 v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.duetactivityscheduler.restartpolicy.assertionsheld")))
  {
    deviceAssertionsHeld = self->_deviceAssertionsHeld;
  }
  else
  {
    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.duetactivityscheduler.restartpolicy.inusestatus")))
    {
      v10 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.das.restartpolicy.backlightOn"));
      goto LABEL_7;
    }
    deviceAssertionsHeld = self->_inUseStatus;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", deviceAssertionsHeld));
  v10 = objc_msgSend(v9, "BOOLValue");

LABEL_7:
  return v10;
}

- (double)weightForActivity:(id)a3
{
  return 1.0;
}

- (BOOL)cacheSleepPeriod:(id)a3 end:(id)a4 period1:(id *)a5 period2:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  BOOL v12;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  id v24;
  int v25;
  id v26;

  v9 = a3;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v12 = 0;
  if (v9 && v10)
  {
    if (objc_msgSend(v9, "compare:", v10) == (id)-1
      && objc_msgSend(v9, "compare:", v10) == (id)-1
      && objc_msgSend(v11, "compare:", v10) == (id)-1)
    {
      if (*a6)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a6, "endDate"));
        v15 = objc_msgSend(v11, "compare:", v14);

        if (v15 == (id)1)
        {
          v16 = *a6;
          *a6 = 0;

        }
      }
      if (!*a5
        || (v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a5, "endDate")),
            v18 = objc_msgSend(v11, "compare:", v17),
            v17,
            v18 == (id)1))
      {
        objc_storeStrong(a5, *a6);
        v19 = *a6;
        *a6 = 0;

      }
      if (!*a6)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[_CDDateRange periodWithStart:end:](_CDDateRange, "periodWithStart:end:", v9, v10));
        v21 = *a6;
        *a6 = v20;

      }
      if (!*a5)
      {
        objc_storeStrong(a5, *a6);
        v22 = *a6;
        *a6 = 0;

      }
      v23 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = *a5;
        v25 = 138412290;
        v26 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Using restart times of %@", (uint8_t *)&v25, 0xCu);
      }

      v12 = 1;
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (id)defaultDeviceRestartDateRangeWithDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "components:fromDate:", 30, v3));
  objc_msgSend(v5, "setHour:", 4);
  objc_msgSend(v5, "setMinute:", 0);
  objc_msgSend(v5, "setSecond:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateFromComponents:", v5));
  objc_msgSend(v6, "timeIntervalSinceDate:", v3);
  v8 = v7;

  if (v8 < 0.0)
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateByAddingTimeInterval:", 86400.0));

    v6 = (void *)v9;
  }
  v10 = objc_msgSend(v6, "dateByAddingTimeInterval:", (double)arc4random_uniform(0xE10u) + -8100.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[_CDDateRange periodWithStart:end:](_CDDateRange, "periodWithStart:end:", v11, v6));

  return v12;
}

- (void)reportAnalyticsWithStartDate:(id)a3 isDefaultTime:(BOOL)a4
{
  id v5;
  _QWORD v6[4];
  id v7;
  BOOL v8;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100062814;
  v6[3] = &unk_10015D508;
  v7 = a3;
  v8 = a4;
  v5 = v7;
  AnalyticsSendEventLazy(CFSTR("com.apple.dasd.restartTimes"), v6);

}

- (void)getDeviceRestartForecast
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _CDDateRange *v16;
  _CDDateRange *deviceRestartPeriod1;
  NSObject *v18;
  _CDDateRange *v19;
  int v20;
  _CDDateRange *v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_DASRequiresRestartPolicy lastCacheDate](self, "lastCacheDate"));
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;

  if (v6 >= 14400.0)
  {
    v7 = (void *)os_transaction_create("com.apple.dasd.cdsleepforsu");
    v8 = objc_autoreleasePoolPush();
    v9 = objc_alloc_init((Class)_CDSleepForAutoSu);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "getUnlockAndSoftwareUpdateTimes"));

    objc_autoreleasePoolPop(v8);
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", kCDSleepAutoSuSuStartKey));
      v12 = objc_msgSend(v11, "dateByAddingTimeInterval:", (double)arc4random_uniform(0x384u));
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", kCDSleepAutoSuExpirationTimeKey));
      -[_DASRequiresRestartPolicy reportAnalyticsWithStartDate:isDefaultTime:](self, "reportAnalyticsWithStartDate:isDefaultTime:", v13, 0);
      if (-[_DASRequiresRestartPolicy cacheSleepPeriod:end:period1:period2:](self, "cacheSleepPeriod:end:period1:period2:", v13, v14, &self->_deviceRestartPeriod1, &self->_deviceRestartPeriod2))
      {
        -[_DASRequiresRestartPolicy setLastCacheDate:](self, "setLastCacheDate:", v3);
      }

    }
    else
    {
      v15 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_1000E2BE0(v15);

      v16 = (_CDDateRange *)objc_claimAutoreleasedReturnValue(-[_DASRequiresRestartPolicy defaultDeviceRestartDateRangeWithDate:](self, "defaultDeviceRestartDateRangeWithDate:", v3));
      deviceRestartPeriod1 = self->_deviceRestartPeriod1;
      self->_deviceRestartPeriod1 = v16;

      -[_DASRequiresRestartPolicy setLastCacheDate:](self, "setLastCacheDate:", v3);
      v18 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = self->_deviceRestartPeriod1;
        v20 = 138412290;
        v21 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Using restart times of %@", (uint8_t *)&v20, 0xCu);
      }

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[_CDDateRange startDate](self->_deviceRestartPeriod1, "startDate"));
      -[_DASRequiresRestartPolicy reportAnalyticsWithStartDate:isDefaultTime:](self, "reportAnalyticsWithStartDate:isDefaultTime:", v13, 1);
    }

  }
}

- (id)getRebootForecastPeriod
{
  return self->_deviceRestartPeriod1;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  _DASPolicyResponseRationale *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  double v22;
  double v23;
  uint64_t v24;
  unsigned __int8 v25;
  unsigned int v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  void *i;
  uint64_t v34;
  void *v35;
  _CDDateRange *deviceRestartPeriod1;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  void *v46;
  unsigned __int8 v47;
  void *v48;
  _BOOL4 v50;
  void *v51;
  void *v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];

  v6 = a3;
  v7 = a4;
  -[_DASRequiresRestartPolicy getDeviceRestartForecast](self, "getDeviceRestartForecast");
  v8 = -[_DASPolicyResponseRationale initWithPolicyName:]([_DASPolicyResponseRationale alloc], "initWithPolicyName:", self->_policyName);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  if ((objc_msgSend(v6, "isSoftwareUpdateActivity") & 1) != 0)
    goto LABEL_3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.dasd.dataCollectiontask.dummyAutoSU"));

  if ((v11 & 1) != 0)
    goto LABEL_3;
  if ((-[_CDDateRange contains:](self->_deviceRestartPeriod1, "contains:", v9) & 1) != 0)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](_DASDaemon, "sharedInstance"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "allPendingRestartTasks"));

    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v29 = v28;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v55;
      while (2)
      {
        for (i = 0; i != v31; i = (char *)i + 1)
        {
          if (*(_QWORD *)v55 != v32)
            objc_enumerationMutation(v29);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i), "isSoftwareUpdateActivity") & 1) != 0)
          {
            v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("PendingSoftwareUpdate == 1")));
            -[_DASPolicyResponseRationale addRationaleWithCondition:](v8, "addRationaleWithCondition:", v44);

            v43 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", 33, v8, (double)0x384uLL));
            goto LABEL_66;
          }
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
        if (v31)
          continue;
        break;
      }
    }

LABEL_3:
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", self->_nextWakeRequest));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForBacklightOnStatus](_CDContextQueries, "keyPathForBacklightOnStatus"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v13));

    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", self->_deviceAssertionsHeld));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", self->_inUseStatus));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForLastUseDate](_CDContextQueries, "keyPathForLastUseDate"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v16));

    if (v12)
    {
      objc_msgSend(v12, "timeIntervalSinceDate:", v9);
      v50 = v18 < 3600.0;
      if (v14)
      {
LABEL_5:
        v19 = objc_msgSend(v14, "BOOLValue");
        goto LABEL_8;
      }
    }
    else
    {
      v50 = 0;
      if (v14)
        goto LABEL_5;
    }
    v19 = 0;
LABEL_8:
    v51 = v14;
    if (v53)
    {
      v20 = objc_msgSend(v53, "BOOLValue");
      if (v15)
      {
LABEL_10:
        v21 = objc_msgSend(v15, "BOOLValue");
        goto LABEL_13;
      }
    }
    else
    {
      v20 = 0;
      if (v15)
        goto LABEL_10;
    }
    v21 = 0;
LABEL_13:
    if (v17)
    {
      objc_msgSend(v9, "timeIntervalSinceDate:", v17);
      v23 = v22;
    }
    else
    {
      v23 = 900.0;
    }
    v52 = v9;
    if ((objc_msgSend(v6, "triggersRestart") & v20) == 1)
    {
      -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:](v8, "addRationaleForCondition:withRequiredValue:withCurrentValue:", CFSTR("Is any Assertion Held?"), 0.0, 1.0);
      -[_DASPolicyResponseRationale setResponseOptions:](v8, "setResponseOptions:", (unint64_t)-[_DASPolicyResponseRationale responseOptions](v8, "responseOptions") | 0x80);
      v24 = 33;
    }
    else
    {
      v24 = 0;
    }
    v25 = objc_msgSend(v15, "unsignedLongLongValue");
    if ((v25 & 0x40) != 0)
      v26 = 0;
    else
      v26 = v19;
    if (v26 == 1)
    {
      -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:](v8, "addRationaleForCondition:withRequiredValue:withCurrentValue:", CFSTR("Backlight On"), 0.0, 1.0);
      -[_DASPolicyResponseRationale setResponseOptions:](v8, "setResponseOptions:", (unint64_t)-[_DASPolicyResponseRationale responseOptions](v8, "responseOptions") | 2);
      v24 = 33;
    }
    if (!v21)
      goto LABEL_54;
    -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:](v8, "addRationaleForCondition:withRequiredValue:withCurrentValue:", CFSTR("Is User active?"), 0.0, 1.0);
    if ((v25 & 1) != 0)
    {
      v24 = 33;
      v34 = 4;
    }
    else if ((v25 & 4) != 0)
    {
      v24 = 33;
      v34 = 8;
    }
    else if ((v25 & 8) != 0)
    {
      v24 = 33;
      v34 = 16;
    }
    else if ((v25 & 0x10) != 0)
    {
      v24 = 33;
      v34 = 32;
    }
    else if ((v25 & 0x20) != 0)
    {
      v24 = 33;
      v34 = 64;
    }
    else
    {
      if ((v25 & 0x40) == 0)
      {
        v24 = 33;
LABEL_54:
        if (v50)
        {
          objc_msgSend(v12, "timeIntervalSinceDate:", v52);
          -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:](v8, "addRationaleForCondition:withRequiredValue:withCurrentValue:", CFSTR("Minimum seconds without any scheduled wake"), 3600.0, v45);
          -[_DASPolicyResponseRationale setResponseOptions:](v8, "setResponseOptions:", (unint64_t)-[_DASPolicyResponseRationale responseOptions](v8, "responseOptions") | 1);
          v24 = 33;
        }
        if (v23 < 900.0)
        {
          -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:](v8, "addRationaleForCondition:withRequiredValue:withCurrentValue:", CFSTR("Minumum seconds since user was last active"));
          -[_DASPolicyResponseRationale setResponseOptions:](v8, "setResponseOptions:", (unint64_t)-[_DASPolicyResponseRationale responseOptions](v8, "responseOptions") | 0x100);
          v24 = 33;
        }
        if (objc_msgSend(v6, "triggersRestart"))
        {
          if (+[_DASConfig requiresStrictDarkBoot](_DASConfig, "requiresStrictDarkBoot"))
          {
            if ((objc_msgSend(v6, "isSoftwareUpdateActivity") & 1) == 0)
            {
              v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
              v47 = objc_msgSend(v46, "isEqualToString:", CFSTR("com.apple.dasd.dataCollectiontask.dummyAutoSU"));

              if ((v47 & 1) == 0)
              {
                v48 = (void *)objc_claimAutoreleasedReturnValue(+[_DASBacklightStateMonitor sharedInstance](_DASBacklightStateMonitor, "sharedInstance"));
                if ((objc_msgSend(v48, "isBacklightOff") & 1) == 0)
                {
                  -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:](v8, "addRationaleForCondition:withRequiredValue:withCurrentValue:", CFSTR("Backlight On"), 0.0, 1.0);
                  -[_DASPolicyResponseRationale setResponseOptions:](v8, "setResponseOptions:", (unint64_t)-[_DASPolicyResponseRationale responseOptions](v8, "responseOptions") | 2);
                  v24 = 33;
                }

              }
            }
          }
        }
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", v24, v8, (double)0x384uLL));

        v9 = v52;
        goto LABEL_66;
      }
      -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:](v8, "addRationaleForCondition:withRequiredValue:withCurrentValue:", CFSTR("Is device on night stand?"), 0.0, 0.0);
      v24 = 0;
      v34 = 512;
    }
    -[_DASPolicyResponseRationale setResponseOptions:](v8, "setResponseOptions:", -[_DASPolicyResponseRationale responseOptions](v8, "responseOptions") | v34);
    goto LABEL_54;
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("DeviceRestartPeriodNotInRange == 1")));
  -[_DASPolicyResponseRationale addRationaleWithCondition:](v8, "addRationaleWithCondition:", v35);

  deviceRestartPeriod1 = self->_deviceRestartPeriod1;
  if (deviceRestartPeriod1)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[_CDDateRange startDate](deviceRestartPeriod1, "startDate"));
    objc_msgSend(v6, "setStartAfter:", v37);

    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startBefore"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startAfter"));
    objc_msgSend(v38, "timeIntervalSinceDate:", v39);
    v41 = v40;

    if (v41 < 0.0)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[_CDDateRange endDate](self->_deviceRestartPeriod1, "endDate"));
      objc_msgSend(v6, "setStartBefore:", v42);

    }
  }
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", 33, v8, (double)0x384uLL));
LABEL_66:

  return v43;
}

- (id)blockReasons:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  void *v23;
  void *v24;
  unsigned __int8 v25;
  void *v26;
  void *v27;
  unsigned __int8 v28;
  void *v29;
  void *v30;
  unsigned __int16 v31;
  void *v32;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rationale"));
  v7 = objc_msgSend(v6, "responseOptions");

  if ((v7 & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@::WakeScheduled"), self->_policyName));
    objc_msgSend(v5, "addObject:", v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rationale"));
  v10 = objc_msgSend(v9, "responseOptions");

  if ((v10 & 2) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@::BacklightOn"), self->_policyName));
    objc_msgSend(v5, "addObject:", v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rationale"));
  v13 = objc_msgSend(v12, "responseOptions");

  if ((v13 & 4) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@::UserPresentActive"), self->_policyName));
    objc_msgSend(v5, "addObject:", v14);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rationale"));
  v16 = objc_msgSend(v15, "responseOptions");

  if ((v16 & 8) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@::UserPresentPassiveWithDisplay"), self->_policyName));
    objc_msgSend(v5, "addObject:", v17);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rationale"));
  v19 = objc_msgSend(v18, "responseOptions");

  if ((v19 & 0x10) != 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@::UserPresentPassiveWithoutDisplay"), self->_policyName));
    objc_msgSend(v5, "addObject:", v20);

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rationale"));
  v22 = objc_msgSend(v21, "responseOptions");

  if ((v22 & 0x20) != 0)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@::UserRemoteClientActive"), self->_policyName));
    objc_msgSend(v5, "addObject:", v23);

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rationale"));
  v25 = objc_msgSend(v24, "responseOptions");

  if ((v25 & 0x40) != 0)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@::UserNotificationActive"), self->_policyName));
    objc_msgSend(v5, "addObject:", v26);

  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rationale"));
  v28 = objc_msgSend(v27, "responseOptions");

  if ((v28 & 0x80) != 0)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@::AssertionsHeld"), self->_policyName));
    objc_msgSend(v5, "addObject:", v29);

  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rationale"));
  v31 = (unsigned __int16)objc_msgSend(v30, "responseOptions");

  if ((v31 & 0x100) != 0)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@::UserActiveRecently"), self->_policyName));
    objc_msgSend(v5, "addObject:", v32);

  }
  return v5;
}

- (NSString)policyName
{
  return self->_policyName;
}

- (void)setPolicyName:(id)a3
{
  objc_storeStrong((id *)&self->_policyName, a3);
}

- (NSString)policyDescription
{
  return self->_policyDescription;
}

- (void)setPolicyDescription:(id)a3
{
  objc_storeStrong((id *)&self->_policyDescription, a3);
}

- (_CDContextualKeyPath)deviceAssertionsHeld
{
  return self->_deviceAssertionsHeld;
}

- (void)setDeviceAssertionsHeld:(id)a3
{
  objc_storeStrong((id *)&self->_deviceAssertionsHeld, a3);
}

- (_CDContextualKeyPath)inUseStatus
{
  return self->_inUseStatus;
}

- (void)setInUseStatus:(id)a3
{
  objc_storeStrong((id *)&self->_inUseStatus, a3);
}

- (_CDContextualKeyPath)nextWakeRequest
{
  return self->_nextWakeRequest;
}

- (void)setNextWakeRequest:(id)a3
{
  objc_storeStrong((id *)&self->_nextWakeRequest, a3);
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (void)setTriggers:(id)a3
{
  objc_storeStrong((id *)&self->_triggers, a3);
}

- (NSDate)lastCacheDate
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLastCacheDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (_CDDateRange)deviceRestartPeriod1
{
  return self->_deviceRestartPeriod1;
}

- (void)setDeviceRestartPeriod1:(id)a3
{
  objc_storeStrong((id *)&self->_deviceRestartPeriod1, a3);
}

- (_CDDateRange)deviceRestartPeriod2
{
  return self->_deviceRestartPeriod2;
}

- (void)setDeviceRestartPeriod2:(id)a3
{
  objc_storeStrong((id *)&self->_deviceRestartPeriod2, a3);
}

- (double)minDurationAfterLastUserInteraction
{
  return self->_minDurationAfterLastUserInteraction;
}

- (void)setMinDurationAfterLastUserInteraction:(double)a3
{
  self->_minDurationAfterLastUserInteraction = a3;
}

- (double)minDurationBeforeNextScheduledWake
{
  return self->_minDurationBeforeNextScheduledWake;
}

- (void)setMinDurationBeforeNextScheduledWake:(double)a3
{
  self->_minDurationBeforeNextScheduledWake = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceRestartPeriod2, 0);
  objc_storeStrong((id *)&self->_deviceRestartPeriod1, 0);
  objc_storeStrong((id *)&self->_lastCacheDate, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_nextWakeRequest, 0);
  objc_storeStrong((id *)&self->_inUseStatus, 0);
  objc_storeStrong((id *)&self->_deviceAssertionsHeld, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);
  objc_storeStrong((id *)&self->_policyName, 0);
}

@end
