@implementation _DASEnergyUsageTracker

- (void)stopTrackingActivity:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  NSObject *log;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSMutableSet *obj;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];

  v4 = a3;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[_DASEnergyUsageTracker nameStringForActivity:](self, "nameStringForActivity:", v4));
  if (v26)
  {
    obj = self->_startedDASActivities;
    objc_sync_enter(obj);
    v5 = -[NSMutableSet mutableCopy](self->_startedDASActivities, "mutableCopy");
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid", obj));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uuid"));
          v13 = objc_msgSend(v11, "isEqual:", v12);

          if (v13)
          {
            -[NSMutableSet removeObject:](self->_startedDASActivities, "removeObject:", v10);

            objc_sync_exit(obj);
            v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
            if (objc_msgSend(v4, "requiresNetwork"))
              objc_msgSend(v14, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("requiresNetwork"));
            log = self->_log;
            if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
            {
              v16 = log;
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleId"));
              *(_DWORD *)buf = 138412802;
              v32 = v26;
              v33 = 2112;
              v34 = v17;
              v35 = 2112;
              v36 = v14;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Report to PowerLog stop tracking activity (from daemon) %@ with bundle name %@ and info %@", buf, 0x20u);

            }
            -[PLDiscretionaryEnergyMonitor reportStopEvent:withInfo:](self->_energyMonitor, "reportStopEvent:withInfo:", v26, v14);

            goto LABEL_18;
          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
        if (v7)
          continue;
        break;
      }
    }

    objc_sync_exit(obj);
  }
  else
  {
    v18 = self->_log;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1000E03AC((uint64_t)v4, v18, v19, v20, v21, v22, v23, v24);
  }
LABEL_18:

}

- (id)nameStringForActivity:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuid"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuid"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "substringToIndex:", 6));
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@"), v6, v9));

    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

- (_DASEnergyUsageTracker)init
{
  _DASEnergyUsageTracker *v2;
  os_log_t v3;
  OS_os_log *log;
  uint64_t v5;
  NSCountedSet *startedActivities;
  uint64_t v7;
  NSMutableSet *startedDASActivities;
  uint64_t v9;
  NSMutableDictionary *bundleToProcessesMap;
  uint64_t v11;
  _CDContext *context;
  id v13;
  _DASEnergyUsageTracker *v14;
  PLDiscretionaryEnergyMonitor *v15;
  PLDiscretionaryEnergyMonitor *energyMonitor;
  _QWORD v18[4];
  _DASEnergyUsageTracker *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)_DASEnergyUsageTracker;
  v2 = -[_DASEnergyUsageTracker init](&v20, "init");
  if (v2)
  {
    v3 = os_log_create("com.apple.duetactivityscheduler", "energybudgeting");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSCountedSet set](NSCountedSet, "set"));
    startedActivities = v2->_startedActivities;
    v2->_startedActivities = (NSCountedSet *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    startedDASActivities = v2->_startedDASActivities;
    v2->_startedDASActivities = (NSMutableSet *)v7;

    v2->_initialReading = 1;
    v9 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    bundleToProcessesMap = v2->_bundleToProcessesMap;
    v2->_bundleToProcessesMap = (NSMutableDictionary *)v9;

    v11 = objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](_CDClientContext, "userContext"));
    context = v2->_context;
    v2->_context = (_CDContext *)v11;

    v13 = objc_alloc((Class)PLDiscretionaryEnergyMonitor);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100027508;
    v18[3] = &unk_10015D6F8;
    v14 = v2;
    v19 = v14;
    v15 = (PLDiscretionaryEnergyMonitor *)objc_msgSend(v13, "initWithCompletionBlock:", v18);
    energyMonitor = v14->_energyMonitor;
    v14->_energyMonitor = v15;

    -[_DASEnergyUsageTracker initializePluginTrigger](v14, "initializePluginTrigger");
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_1001AB450 != -1)
    dispatch_once(&qword_1001AB450, &stru_10015D718);
  return (id)qword_1001AB458;
}

+ (id)instanceWithReportingHandler:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_DASEnergyUsageTracker sharedInstance](_DASEnergyUsageTracker, "sharedInstance"));
  objc_msgSend(v4, "setHandler:", v3);

  return v4;
}

+ (BOOL)shouldTrackActivity:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  unsigned int v12;
  id v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](_CDClientContext, "userContext"));
  if (+[_DASPhotosPolicy isActivity:consideredNonDiscretionary:](_DASPhotosPolicy, "isActivity:consideredNonDiscretionary:", v3, v4))
  {
    goto LABEL_10;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](_CDContextQueries, "keyPathForPluginStatus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));
  v7 = objc_msgSend(v6, "BOOLValue");

  if ((v7 & 1) != 0)
    goto LABEL_10;
  v8 = objc_msgSend(v3, "schedulingPriority");
  if (v8 != (id)_DASSchedulingPriorityUtility)
    goto LABEL_7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "widgetID"));

  if (v9)
    goto LABEL_10;
  if (!+[_DASEnergyBudgetPolicy budgetIsPositive:](_DASEnergyBudgetPolicy, "budgetIsPositive:", v4))
  {
LABEL_7:
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "launchReason"));
    v12 = objc_msgSend(v11, "isEqualToString:", _DASLaunchReasonBackgroundRemoteNotification);

    if (!v12)
      goto LABEL_9;
    v13 = v3;
    objc_sync_enter(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "policyResponseMetadata"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Application Policy")));
    v16 = objc_msgSend(v15, "reason");

    objc_sync_exit(v13);
    if ((v16 & 2) == 0)
    {
LABEL_9:
      v10 = objc_msgSend(v3, "budgeted");
      goto LABEL_11;
    }
LABEL_10:
    v10 = 0;
    goto LABEL_11;
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (void)energyConsumptionHandler:(id)a3
{
  double v4;
  double v5;
  void (**v6)(double);

  -[_DASEnergyUsageTracker energyConsumed:](self, "energyConsumed:", a3);
  if (v4 > 0.0)
  {
    v5 = v4;
    v6 = (void (**)(double))objc_claimAutoreleasedReturnValue(-[_DASEnergyUsageTracker handler](self, "handler"));
    v6[2](v5);

  }
}

- (void)initializePluginTrigger
{
  void *v3;
  PLDiscretionaryEnergyMonitor *energyMonitor;
  _CDContext *context;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](_CDContextQueries, "keyPathForPluginStatus"));
  context = self->_context;
  energyMonitor = self->_energyMonitor;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](_CDContextQueries, "keyPathForPluginStatus"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_CDContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v6));
  -[PLDiscretionaryEnergyMonitor reportChargingStatus:](energyMonitor, "reportChargingStatus:", objc_msgSend(v7, "BOOLValue"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", v3));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000278E8;
  v10[3] = &unk_10015D740;
  v10[4] = self;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualChangeRegistration localWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:](_CDContextualChangeRegistration, "localWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:", CFSTR("com.apple.das.energytracker"), v8, CFSTR("com.apple.dasd.contextstore-registration"), v10));

  -[_CDContext registerCallback:](self->_context, "registerCallback:", v9);
}

- (id)bundleInformationWithNetworkQuality:(id)a3
{
  id v3;
  void *v4;
  char *v5;
  const __CFString *v6;
  uint64_t v7;
  const __CFString *v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](_CDClientContext, "userContext"));
  if (+[_CDNetworkContext cellInterfaceUp:](_CDNetworkContext, "cellInterfaceUp:", v4))
  {
    v5 = (char *)+[_CDNetworkContext cellInterfaceClass:](_CDNetworkContext, "cellInterfaceClass:", v4)
       - 1;
    if ((unint64_t)v5 > 2)
      v6 = CFSTR("Unknown");
    else
      v6 = *(&off_10015D760 + (_QWORD)v5);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("cell"));
    v7 = (uint64_t)+[_CDNetworkContext cellQuality:](_CDNetworkContext, "cellQuality:", v4);
  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Wifi"), CFSTR("wifi"));
    v7 = (uint64_t)+[_CDNetworkContext wifiQuality:](_CDNetworkContext, "wifiQuality:", v4);
  }
  if (v7 > 49)
  {
    if (v7 == 100)
    {
      v8 = CFSTR("Best");
      goto LABEL_17;
    }
    if (v7 == 50)
    {
      v8 = CFSTR("Fair");
      goto LABEL_17;
    }
LABEL_14:
    v8 = CFSTR("Unknown");
    goto LABEL_17;
  }
  if (!v7)
  {
    v8 = CFSTR("None");
    goto LABEL_17;
  }
  if (v7 != 20)
    goto LABEL_14;
  v8 = CFSTR("Poor");
LABEL_17:
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("quality"));

  return v3;
}

- (double)energyConsumed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *pllReportID;
  double v10;
  double v11;
  NSObject *log;
  NSObject *v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  NSObject *v19;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BLMUUIDForDuet")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BLMEnergyForDuet")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("totalAccumulatedEnergy")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BLMEnergyResponseTimestamp")));

  if (v4 && v6 && v5 && v7)
  {
    pllReportID = self->_pllReportID;
    if (!pllReportID || (-[NSString isEqual:](pllReportID, "isEqual:", v5) & 1) == 0)
    {
      self->_discEnergyConsumed = 0.0;
      objc_storeStrong((id *)&self->_pllReportID, v5);
    }
    -[_DASEnergyUsageTracker accountedNewEnergy:](self, "accountedNewEnergy:", v6);
    v11 = v10;
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v13 = log;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v11));
      objc_msgSend(v8, "timeIntervalSinceNow");
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v15 / -60.0));
      v21 = 138412802;
      v22 = v7;
      v23 = 2112;
      v24 = v14;
      v25 = 2112;
      v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "PowerLog Accounting (incl fast accounting): %@, Slow Accounting is at %@, last accounted %@ minutes ago", (uint8_t *)&v21, 0x20u);

    }
    objc_msgSend(v7, "doubleValue");
    -[_DASEnergyUsageTracker energyConsumedFrom:](self, "energyConsumedFrom:");
    v18 = v17;
  }
  else
  {
    v18 = 0.0;
    if (self->_initialReading)
    {
      v19 = self->_log;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "PowerLog Update: Received empty report for initial reading. Will try again later", (uint8_t *)&v21, 2u);
      }
    }
  }

  return v18;
}

- (double)energyConsumedFrom:(double)a3
{
  NSObject *log;
  double discEnergyConsumed;
  double result;
  double v8;
  NSObject *v9;
  int v10;
  double v11;

  if (self->_initialReading)
  {
    self->_discEnergyConsumed = a3;
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      discEnergyConsumed = self->_discEnergyConsumed;
      v10 = 134217984;
      v11 = discEnergyConsumed;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "PowerLog: Initial Discretionary Energy Readings: %lf", (uint8_t *)&v10, 0xCu);
    }
    self->_initialReading = 0;
    return 0.0;
  }
  else
  {
    v8 = a3 - self->_discEnergyConsumed;
    result = 0.0;
    if (v8 >= 0.0)
    {
      self->_discEnergyConsumed = a3;
      v9 = self->_log;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 134217984;
        v11 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PowerLog Update: Discretionary energy consumed since last read: %.2f", (uint8_t *)&v10, 0xCu);
      }
      return v8;
    }
  }
  return result;
}

- (double)dailyBudget
{
  double v3;
  NSObject *log;
  double v5;
  const char *v6;
  int v8;
  uint64_t v9;

  +[PLDiscretionaryEnergyMonitor getDiscretionaryEnergyBudget](PLDiscretionaryEnergyMonitor, "getDiscretionaryEnergyBudget");
  log = self->_log;
  if (v3 <= 0.0)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      sub_1000E02A4(log);
    log = self->_log;
    v5 = 250.0;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 134217984;
      v9 = 0x406F400000000000;
      v6 = "energy daily budget is %f";
      goto LABEL_8;
    }
  }
  else
  {
    v5 = v3;
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 134217984;
      v9 = *(_QWORD *)&v5;
      v6 = "PLEnergyMonitor energy daily budget is %f";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v8, 0xCu);
    }
  }
  return v5;
}

- (void)startTrackingActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableSet *v8;
  void *v9;
  uint64_t v10;
  NSObject *log;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;

  v4 = a3;
  if (+[_DASEnergyUsageTracker shouldTrackActivity:](_DASEnergyUsageTracker, "shouldTrackActivity:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DASSystemBudgetManager identifierWithActivity:](_DASSystemBudgetManager, "identifierWithActivity:", v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DASSystemBudgetManager involvedProcessesForActivity:withIdentifier:](_DASSystemBudgetManager, "involvedProcessesForActivity:withIdentifier:", v4, v5));
    if (objc_msgSend(v6, "count"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASEnergyUsageTracker nameStringForActivity:](self, "nameStringForActivity:", v4));
      if (v7)
      {
        v8 = self->_startedDASActivities;
        objc_sync_enter(v8);
        -[NSMutableSet addObject:](self->_startedDASActivities, "addObject:", v4);
        objc_sync_exit(v8);

        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, CFSTR("involvedIdentifiers"));
        if (objc_msgSend(v4, "requiresNetwork"))
        {
          objc_msgSend(v9, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("requiresNetwork"));
          v10 = objc_claimAutoreleasedReturnValue(-[_DASEnergyUsageTracker bundleInformationWithNetworkQuality:](self, "bundleInformationWithNetworkQuality:", v9));

          v9 = (void *)v10;
        }
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
        {
          v12 = log;
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleId"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "relatedApplications"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "involvedProcesses"));
          v30 = 138413314;
          v31 = v7;
          v32 = 2112;
          v33 = v13;
          v34 = 2112;
          v35 = v14;
          v36 = 2112;
          v37 = v15;
          v38 = 2112;
          v39 = v9;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Report to PowerLog start tracking activity (from daemon) %@ with bundle name %@, relatedApplications %@, and involvedProcesses %@ with info %@", (uint8_t *)&v30, 0x34u);

        }
        -[PLDiscretionaryEnergyMonitor reportStartEvent:withInfo:](self->_energyMonitor, "reportStartEvent:withInfo:", v7, v9);

      }
      else
      {
        v23 = self->_log;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          sub_1000E0348((uint64_t)v4, v23, v24, v25, v26, v27, v28, v29);
      }

    }
    else
    {
      v16 = self->_log;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_1000E02E4((uint64_t)v4, v16, v17, v18, v19, v20, v21, v22);
    }

  }
}

- (double)accountedNewEnergy:(id)a3
{
  id v3;
  id v4;
  __int128 v5;
  id v6;
  uint64_t v7;
  double v8;
  const __CFString *v9;
  double v10;
  void *i;
  const __CFString *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *log;
  uint64_t v23;
  __int128 v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  double v32;
  _BYTE v33[128];

  v3 = a3;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (!v4)
  {
    v10 = 0.0;
    goto LABEL_23;
  }
  v6 = v4;
  v7 = *(_QWORD *)v28;
  v8 = 0.0;
  v9 = CFSTR("bundleID");
  *(_QWORD *)&v5 = 134217984;
  v25 = v5;
  v10 = 0.0;
  do
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      v12 = v9;
      if (*(_QWORD *)v28 != v7)
        objc_enumerationMutation(v3);
      v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("updateType"), v25));
      v15 = objc_msgSend(v14, "unsignedCharValue");

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("energy")));
      objc_msgSend(v16, "doubleValue");
      v18 = v17;

      if (v18 <= 0.0)
        goto LABEL_17;
      v9 = v12;
      if (v15 != 2)
      {
        if (v15 != 1)
          continue;
        v10 = v10 + v18;
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v12));
        if (objc_msgSend(v19, "compare:", CFSTR("cloudphotod")))
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v12));
          v21 = objc_msgSend(v20, "compare:", CFSTR("assetsd"));

          if (!v21)
LABEL_16:
            v8 = v8 + v18;
LABEL_17:
          v9 = v12;
          continue;
        }

        goto LABEL_16;
      }
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v25;
        v32 = v18;
        _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "PowerLog Update: Complications energy %.2f", buf, 0xCu);
      }
      v10 = v10 + v18;
    }
    v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  }
  while (v6);
  if (v8 > 2.22507386e-308)
  {
    LODWORD(v23) = llround(v8);
    +[_DASMetricRecorder setValue:forKey:](_DASMetricRecorder, "setValue:forKey:", v23, CFSTR("com.apple.duet.energy.hyperion.approximatetotal"));
  }
LABEL_23:

  return v10;
}

- (id)trackingBundlesWithParameters:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  void *v27;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", kDASBudgetKeyBundleIDs));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", kDASBudgetKeyPIDs));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", kDASBudgetKeyProcessNames));
  v7 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    v27 = v6;
    v8 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));

    v6 = (void *)v8;
  }
  else
  {
    v9 = objc_opt_class(NSArray);
    if ((objc_opt_isKindOfClass(v6, v9) & 1) == 0)
    {

      v6 = 0;
    }
  }
  if (objc_msgSend(v4, "count"))
  {
    v10 = v4;
LABEL_9:
    v11 = v10;
    goto LABEL_10;
  }
  if (objc_msgSend(v6, "count"))
  {
    v10 = v6;
    goto LABEL_9;
  }
  if (objc_msgSend(v5, "count"))
  {
    v21 = v4;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v20 = v5;
    v13 = v5;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[_DASUtils processNameFromPID:](_DASUtils, "processNameFromPID:", objc_msgSend(v18, "intValue", v20)));
          if (v19)
            objc_msgSend(v11, "addObject:", v18);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v15);
    }

    v5 = v20;
    v4 = v21;
  }
  else
  {
    v11 = 0;
  }
LABEL_10:

  return v11;
}

- (void)startTrackingActivityWithParameters:(id)a3
{
  id v4;
  _CDContext *context;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  NSCountedSet *v10;
  NSCountedSet *startedActivities;
  void *v12;
  void *v13;
  void *v14;
  NSObject *log;
  NSObject *v16;
  void *v17;
  PLDiscretionaryEnergyMonitor *energyMonitor;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;

  v4 = a3;
  context = self->_context;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](_CDContextQueries, "keyPathForPluginStatus"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_CDContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v6));
  v8 = objc_msgSend(v7, "BOOLValue");

  if ((v8 & 1) == 0
    && +[_DASEnergyBudgetPolicy budgetIsPositive:](_DASEnergyBudgetPolicy, "budgetIsPositive:", self->_context))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[_DASEnergyUsageTracker trackingBundlesWithParameters:](self, "trackingBundlesWithParameters:", v4));
    if (v9)
    {
      v10 = self->_startedActivities;
      objc_sync_enter(v10);
      startedActivities = self->_startedActivities;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
      -[NSCountedSet addObject:](startedActivities, "addObject:", v12);

      objc_sync_exit(v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v9));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CFSTR("involvedIdentifiers"));
      objc_msgSend(v14, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("selfBudgeted"));
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        v16 = log;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
        v20 = 138412546;
        v21 = v17;
        v22 = 2112;
        v23 = v4;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Report to PowerLog start tracking activity %@ from parameters %@", (uint8_t *)&v20, 0x16u);

      }
      energyMonitor = self->_energyMonitor;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
      -[PLDiscretionaryEnergyMonitor reportStartEvent:withInfo:](energyMonitor, "reportStartEvent:withInfo:", v19, v14);

    }
  }

}

- (void)stopTrackingActivityWithParameters:(id)a3
{
  id v4;
  void *v5;
  NSCountedSet *v6;
  NSCountedSet *startedActivities;
  void *v8;
  NSCountedSet *v9;
  void *v10;
  void *v11;
  NSObject *log;
  PLDiscretionaryEnergyMonitor *energyMonitor;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASEnergyUsageTracker trackingBundlesWithParameters:](self, "trackingBundlesWithParameters:", v4));
  if (v5)
  {
    v6 = self->_startedActivities;
    objc_sync_enter(v6);
    startedActivities = self->_startedActivities;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 0));
    LODWORD(startedActivities) = -[NSCountedSet containsObject:](startedActivities, "containsObject:", v8);

    if ((_DWORD)startedActivities)
    {
      v9 = self->_startedActivities;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 0));
      -[NSCountedSet removeObject:](v9, "removeObject:", v10);

      objc_sync_exit(v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      objc_msgSend(v11, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("selfBudgeted"));
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138412546;
        v16 = v5;
        v17 = 2112;
        v18 = v4;
        _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Report to PowerLog stop tracking activity %@ from parameters %@", (uint8_t *)&v15, 0x16u);
      }
      energyMonitor = self->_energyMonitor;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 0));
      -[PLDiscretionaryEnergyMonitor reportStopEvent:withInfo:](energyMonitor, "reportStopEvent:withInfo:", v14, v11);

    }
    else
    {
      objc_sync_exit(v6);

    }
  }

}

- (BOOL)initialReading
{
  return self->_initialReading;
}

- (void)setInitialReading:(BOOL)a3
{
  self->_initialReading = a3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (NSCountedSet)startedActivities
{
  return self->_startedActivities;
}

- (void)setStartedActivities:(id)a3
{
  objc_storeStrong((id *)&self->_startedActivities, a3);
}

- (NSMutableSet)startedDASActivities
{
  return self->_startedDASActivities;
}

- (void)setStartedDASActivities:(id)a3
{
  objc_storeStrong((id *)&self->_startedDASActivities, a3);
}

- (NSMutableDictionary)bundleToProcessesMap
{
  return self->_bundleToProcessesMap;
}

- (void)setBundleToProcessesMap:(id)a3
{
  objc_storeStrong((id *)&self->_bundleToProcessesMap, a3);
}

- (_CDContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (PLDiscretionaryEnergyMonitor)energyMonitor
{
  return self->_energyMonitor;
}

- (void)setEnergyMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_energyMonitor, a3);
}

- (NSString)pllReportID
{
  return self->_pllReportID;
}

- (void)setPllReportID:(id)a3
{
  objc_storeStrong((id *)&self->_pllReportID, a3);
}

- (double)discEnergyConsumed
{
  return self->_discEnergyConsumed;
}

- (void)setDiscEnergyConsumed:(double)a3
{
  self->_discEnergyConsumed = a3;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_pllReportID, 0);
  objc_storeStrong((id *)&self->_energyMonitor, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_bundleToProcessesMap, 0);
  objc_storeStrong((id *)&self->_startedDASActivities, 0);
  objc_storeStrong((id *)&self->_startedActivities, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
