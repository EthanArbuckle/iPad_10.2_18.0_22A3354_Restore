@implementation _DASDataCollectionSUTask

- (_DASDataCollectionSUTask)initWithName:(id)a3 intervalDuration:(double)a4 withLogger:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  dispatch_source_t v24;
  void *v25;
  NSObject *v26;
  dispatch_time_t v27;
  NSObject *v28;
  _QWORD handler[4];
  id v31;
  objc_super v32;

  v8 = a3;
  v9 = a5;
  v32.receiver = self;
  v32.super_class = (Class)_DASDataCollectionSUTask;
  v10 = -[_DASDataCollectionSUTask init](&v32, "init");
  if (v10)
  {
    v11 = _DASSchedulingPriorityMaintenance;
    v12 = _DASActivityDurationShort;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dateByAddingTimeInterval:", 86400.0));
    v16 = objc_claimAutoreleasedReturnValue(+[_DASActivity activityWithName:priority:duration:startingAfter:startingBefore:](_DASActivity, "activityWithName:priority:duration:startingAfter:startingBefore:", v8, v11, v12, v13, v15));
    v17 = (void *)*((_QWORD *)v10 + 3);
    *((_QWORD *)v10 + 3) = v16;

    objc_msgSend(*((id *)v10 + 3), "setTriggersRestart:", 1);
    *((double *)v10 + 2) = a4;
    objc_storeStrong((id *)v10 + 9, a5);
    *((_QWORD *)v10 + 4) = 0;
    v18 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v19 = (void *)*((_QWORD *)v10 + 7);
    *((_QWORD *)v10 + 7) = v18;

    v20 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v21 = (void *)*((_QWORD *)v10 + 8);
    *((_QWORD *)v10 + 8) = v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](_DASDaemon, "sharedInstance"));
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "evaluationQueue"));
    v24 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v23);
    v25 = (void *)*((_QWORD *)v10 + 1);
    *((_QWORD *)v10 + 1) = v24;

    v26 = *((_QWORD *)v10 + 1);
    v27 = dispatch_walltime(0, (uint64_t)(*((double *)v10 + 2) * 1000000000.0));
    dispatch_source_set_timer(v26, v27, (unint64_t)(*((double *)v10 + 2) * 1000000000.0), 0x3B9ACA00uLL);
    v28 = *((_QWORD *)v10 + 1);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000980A4;
    handler[3] = &unk_10015D4E0;
    v31 = v10;
    dispatch_source_set_event_handler(v28, handler);
    dispatch_activate(*((dispatch_object_t *)v10 + 1));

  }
  return (_DASDataCollectionSUTask *)v10;
}

+ (id)taskWithName:(id)a3 intervalDuration:(double)a4 withLogger:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  v10 = objc_msgSend(objc_alloc((Class)a1), "initWithName:intervalDuration:withLogger:", v9, v8, a4);

  return v10;
}

- (BOOL)isEligibleNow
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  NSObject *logger;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](_DASDaemon, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_DASSmartPowerNapMonitor sharedMonitorWithDaemon:](_DASSmartPowerNapMonitor, "sharedMonitorWithDaemon:", v3));

  v5 = objc_msgSend(v4, "inSmartPowerNap");
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
    sub_1000E8298(v5, logger);

  return v5;
}

- (void)evaluateActivityOnTick
{
  unsigned int v3;
  int64_t currentEligibilityState;
  char v5;
  char v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
    sub_1000E8414();
  if (self->_currentEligibilityState == 1)
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
      sub_1000E83E8();
    -[_DASDataCollectionSUTask evaluatePolicies](self, "evaluatePolicies");
  }
  v3 = -[_DASDataCollectionSUTask isEligibleNow](self, "isEligibleNow");
  currentEligibilityState = self->_currentEligibilityState;
  if (!currentEligibilityState && v3)
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
      sub_1000E83BC();
    -[_DASDataCollectionSUTask reportTaskBecomingEligible](self, "reportTaskBecomingEligible");
    self->_currentEligibilityState = 1;
    -[_DASDataCollectionSUTask setCurrentEligibilityWindowStart](self, "setCurrentEligibilityWindowStart");
    -[_DASDataCollectionSUTask evaluatePolicies](self, "evaluatePolicies");
    return;
  }
  if (currentEligibilityState == 1)
    v5 = v3;
  else
    v5 = 1;
  if ((v5 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
      sub_1000E8390();
    self->_currentEligibilityState = 3;
    -[_DASDataCollectionSUTask setCurrentEligibilityWindowEnd](self, "setCurrentEligibilityWindowEnd");
    -[_DASDataCollectionSUTask handleTaskExpiration](self, "handleTaskExpiration");
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
      sub_1000E8364();
    goto LABEL_34;
  }
  if (currentEligibilityState == 2)
    v6 = v3;
  else
    v6 = 1;
  if ((v6 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
      sub_1000E8338();
LABEL_34:
    self->_currentEligibilityState = 0;
    -[_DASDataCollectionSUTask resetCurrentEligibilityWindow](self, "resetCurrentEligibilityWindow");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[_DASActivity setStartAfter:](self->_activity, "setStartAfter:", v16);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivity startAfter](self->_activity, "startAfter"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dateByAddingTimeInterval:", 86400.0));
    -[_DASActivity setStartBefore:](self->_activity, "setStartBefore:", v14);
    goto LABEL_35;
  }
  if (currentEligibilityState)
    v7 = 1;
  else
    v7 = v3;
  if ((v7 & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivity startBefore](self->_activity, "startBefore"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "earlierDate:", v8));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivity startBefore](self->_activity, "startBefore"));
    v12 = objc_msgSend(v10, "isEqualToDate:", v11);

    if (!v12)
    {
LABEL_36:

      return;
    }
    -[_DASDataCollectionSUTask handleTaskExpirationNeverEligible](self, "handleTaskExpirationNeverEligible");
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
      sub_1000E830C();
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[_DASActivity setStartAfter:](self->_activity, "setStartAfter:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivity startAfter](self->_activity, "startAfter"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dateByAddingTimeInterval:", 86400.0));
    -[_DASActivity setStartBefore:](self->_activity, "setStartBefore:", v15);

LABEL_35:
    goto LABEL_36;
  }
}

- (void)evaluatePolicies
{
  _DASDataCollectionSUTask *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _DASDataCollectionSUTask *v12;
  _DASActivity *activity;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *logger;
  _BOOL4 v22;
  NSObject *v23;
  id v24;
  NSMutableSet *blockReasonsSoFar;
  void *v26;
  void *v27;
  id v28;
  NSMutableSet *persistentBlockers;
  void *context;
  void *v31;
  id v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  id v39;
  _BYTE v40[128];

  v2 = self;
  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
    sub_1000E8440();
  v31 = (void *)os_transaction_create("com.apple.dasd.evaluatePoliciesForSUTelemetryActivity");
  context = objc_autoreleasePoolPush();
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyManager allPoliciesForPlatform](_DASPolicyManager, "allPoliciesForPlatform"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v35;
    do
    {
      v8 = 0;
      v32 = v6;
      do
      {
        if (*(_QWORD *)v35 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v8);
        v10 = objc_autoreleasePoolPush();
        if (objc_msgSend(v9, "appliesToActivity:", v2->_activity))
        {
          v11 = objc_autoreleasePoolPush();
          v12 = v2;
          activity = v2->_activity;
          v14 = v4;
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](_DASDaemon, "sharedInstance"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "context"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "responseForActivity:withState:", activity, v16));

          v4 = v14;
          objc_autoreleasePoolPop(v11);
          if (objc_msgSend(v17, "policyDecision") == (id)33 || objc_msgSend(v17, "policyDecision") == (id)100)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "policyName"));
            objc_msgSend(v14, "addObject:", v18);

            if ((objc_opt_respondsToSelector(v9, "blockReasons:") & 1) != 0)
            {
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "blockReasons:", v17));
              objc_msgSend(v14, "addObjectsFromArray:", v19);

            }
          }

          v2 = v12;
          v6 = v32;
        }
        objc_autoreleasePoolPop(v10);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v6);
  }

  v20 = objc_msgSend(v4, "count");
  logger = v2->_logger;
  v22 = os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT);
  if (v20)
  {
    if (v22)
    {
      v23 = logger;
      v24 = objc_msgSend(v4, "count");
      *(_DWORD *)buf = 134217984;
      v39 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "SUTelemetryTask: found %lu blockers.", buf, 0xCu);

    }
    -[_DASDataCollectionSUTask reportBlockersOnEvaluation:](v2, "reportBlockersOnEvaluation:", v4);
    blockReasonsSoFar = v2->_blockReasonsSoFar;
    v26 = v4;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));
    -[NSMutableSet addObjectsFromArray:](blockReasonsSoFar, "addObjectsFromArray:", v27);

    v28 = -[NSMutableSet count](v2->_persistentBlockers, "count");
    persistentBlockers = v2->_persistentBlockers;
    if (v28)
      -[NSMutableSet intersectSet:](persistentBlockers, "intersectSet:", v26);
    else
      -[NSMutableSet unionSet:](persistentBlockers, "unionSet:", v26);
    v4 = v26;
  }
  else
  {
    if (v22)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, logger, OS_LOG_TYPE_DEFAULT, "SUTelemetryTask: no blocking policies.", buf, 2u);
    }
    -[_DASDataCollectionSUTask markAsCompleted](v2, "markAsCompleted");
    -[_DASDataCollectionSUTask reportSuccessOnEvaluation](v2, "reportSuccessOnEvaluation");
  }

  objc_autoreleasePoolPop(context);
}

- (void)markAsCompleted
{
  self->_currentEligibilityState = 2;
  -[_DASDataCollectionSUTask setCurrentEligibilityWindowEnd](self, "setCurrentEligibilityWindowEnd");
  -[NSMutableSet removeAllObjects](self->_blockReasonsSoFar, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_persistentBlockers, "removeAllObjects");
}

- (void)handleTaskExpiration
{
  -[_DASDataCollectionSUTask reportTaskExpiration](self, "reportTaskExpiration");
  -[_DASDataCollectionSUTask reportBlockersStatisticsOnExpiration](self, "reportBlockersStatisticsOnExpiration");
  -[NSMutableSet removeAllObjects](self->_blockReasonsSoFar, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_persistentBlockers, "removeAllObjects");
}

- (void)setCurrentEligibilityWindowStart
{
  NSDate *v3;
  NSDate *currentEligibilityWindowStart;

  v3 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  currentEligibilityWindowStart = self->_currentEligibilityWindowStart;
  self->_currentEligibilityWindowStart = v3;

}

- (void)setCurrentEligibilityWindowEnd
{
  NSDate *v3;
  NSDate *currentEligibilityWindowEnd;

  v3 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  currentEligibilityWindowEnd = self->_currentEligibilityWindowEnd;
  self->_currentEligibilityWindowEnd = v3;

}

- (void)resetCurrentEligibilityWindow
{
  NSDate *currentEligibilityWindowStart;
  NSDate *currentEligibilityWindowEnd;

  currentEligibilityWindowStart = self->_currentEligibilityWindowStart;
  self->_currentEligibilityWindowStart = 0;

  currentEligibilityWindowEnd = self->_currentEligibilityWindowEnd;
  self->_currentEligibilityWindowEnd = 0;

}

- (void)addExperimentInformationWithDictionary:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_DASTrialManager sharedInstance](_DASTrialManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "experimentID"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "experimentID"));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v5, CFSTR("ExperimentID"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "treatmentID"));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("TreatmentID"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v3, "deploymentID")));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("DeploymentID"));

  }
}

- (void)handleTaskExpirationNeverEligible
{
  void *v3;
  id v4;
  id v5;
  void **v6;
  uint64_t v7;
  id (*v8)(uint64_t);
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
    sub_1000E846C();
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  -[_DASDataCollectionSUTask addExperimentInformationWithDictionary:](self, "addExperimentInformationWithDictionary:", v3);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("NeverEligible"), CFSTR("Decision"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100098B24;
  v11[3] = &unk_10015DA30;
  v4 = v3;
  v12 = v4;
  AnalyticsSendEventLazy(CFSTR("com.apple.das.SU.BlockedReasonCounts_v2"), v11);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("NeverEligible"), CFSTR("BlockReason"));
  v6 = _NSConcreteStackBlock;
  v7 = 3221225472;
  v8 = sub_100098B2C;
  v9 = &unk_10015DA30;
  v10 = v4;
  v5 = v4;
  AnalyticsSendEventLazy(CFSTR("com.apple.das.SU.PersistentBlocker_v2"), &v6);
  -[NSMutableSet removeAllObjects](self->_blockReasonsSoFar, "removeAllObjects", v6, v7, v8, v9);
  -[NSMutableSet removeAllObjects](self->_persistentBlockers, "removeAllObjects");

}

- (void)reportBlockersOnEvaluation:(id)a3
{
  id v4;
  NSObject *logger;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  id v12;
  id obj;
  _QWORD v14[4];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
    sub_1000E8498(logger);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        -[_DASDataCollectionSUTask addExperimentInformationWithDictionary:](self, "addExperimentInformationWithDictionary:", v11);
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("Decision"));
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_100098CF4;
        v14[3] = &unk_10015DA30;
        v15 = v11;
        v12 = v11;
        AnalyticsSendEventLazy(CFSTR("com.apple.das.SU.BlockedReasonCounts_v2"), v14);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

}

- (void)reportSuccessOnEvaluation
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
    sub_1000E8510();
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  -[_DASDataCollectionSUTask addExperimentInformationWithDictionary:](self, "addExperimentInformationWithDictionary:", v3);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Success"), CFSTR("Decision"));
  if (self->_currentEligibilityWindowStart && self->_currentEligibilityWindowEnd)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[_CDDateRange periodWithStart:end:](_CDDateRange, "periodWithStart:end:"));
    objc_msgSend(v4, "duration");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("WindowDuration"));

  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100098E88;
  v10[3] = &unk_10015DA30;
  v6 = v3;
  v11 = v6;
  AnalyticsSendEventLazy(CFSTR("com.apple.das.SU.BlockedReasonCounts_v2"), v10);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("Success"), CFSTR("BlockReason"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100098E90;
  v8[3] = &unk_10015DA30;
  v9 = v6;
  v7 = v6;
  AnalyticsSendEventLazy(CFSTR("com.apple.das.SU.PersistentBlocker_v2"), v8);

}

- (void)reportTaskBecomingEligible
{
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
    sub_1000E853C();
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  -[_DASDataCollectionSUTask addExperimentInformationWithDictionary:](self, "addExperimentInformationWithDictionary:", v3);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Eligible"), CFSTR("Decision"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100098FC8;
  v8[3] = &unk_10015DA30;
  v4 = v3;
  v9 = v4;
  AnalyticsSendEventLazy(CFSTR("com.apple.das.SU.BlockedReasonCounts_v2"), v8);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Eligible"), CFSTR("BlockReason"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100098FD0;
  v6[3] = &unk_10015DA30;
  v7 = v4;
  v5 = v4;
  AnalyticsSendEventLazy(CFSTR("com.apple.das.SU.PersistentBlocker_v2"), v6);

}

- (void)reportTaskExpiration
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
    sub_1000E8568();
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  -[_DASDataCollectionSUTask addExperimentInformationWithDictionary:](self, "addExperimentInformationWithDictionary:", v3);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Expired"), CFSTR("Decision"));
  if (self->_currentEligibilityWindowStart && self->_currentEligibilityWindowEnd)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[_CDDateRange periodWithStart:end:](_CDDateRange, "periodWithStart:end:"));
    objc_msgSend(v4, "duration");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("WindowDuration"));

  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100099164;
  v10[3] = &unk_10015DA30;
  v6 = v3;
  v11 = v6;
  AnalyticsSendEventLazy(CFSTR("com.apple.das.SU.BlockedReasonCounts_v2"), v10);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("Expired"), CFSTR("BlockReason"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10009916C;
  v8[3] = &unk_10015DA30;
  v9 = v6;
  v7 = v6;
  AnalyticsSendEventLazy(CFSTR("com.apple.das.SU.PersistentBlocker_v2"), v8);

}

- (void)reportBlockersStatisticsOnExpiration
{
  NSObject *logger;
  id v4;
  _UNKNOWN **v5;
  void **v6;
  void *v7;
  id v8;
  uint64_t v9;
  const __CFString *v10;
  void *i;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  const __CFString *v16;
  _UNKNOWN **v17;
  void **v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  _DASDataCollectionSUTask *v29;
  NSMutableSet *obj;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[_DASTrialManager sharedInstance](_DASTrialManager, "sharedInstance"));
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
    sub_1000E85C0((uint64_t)self, logger);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = self->_persistentBlockers;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  v5 = &AnalyticsSendEvent_ptr;
  v6 = _NSConcreteStackBlock;
  v7 = &unk_10015DA30;
  if (v4)
  {
    v8 = v4;
    v9 = *(_QWORD *)v36;
    v10 = CFSTR("BlockReason");
    v29 = self;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v36 != v9)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5[127], "dictionary"));
        -[_DASDataCollectionSUTask addExperimentInformationWithDictionary:](self, "addExperimentInformationWithDictionary:", v13);
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v10);
        if (self->_currentEligibilityWindowStart && self->_currentEligibilityWindowEnd)
        {
          v14 = v8;
          v15 = v9;
          v16 = v10;
          v17 = v5;
          v18 = v6;
          v19 = v7;
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[_CDDateRange periodWithStart:end:](_CDDateRange, "periodWithStart:end:"));
          objc_msgSend(v20, "duration");
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v21, CFSTR("WindowDuration"));

          v7 = v19;
          v6 = v18;
          v5 = v17;
          v10 = v16;
          v9 = v15;
          v8 = v14;
          self = v29;
        }
        v33[0] = v6;
        v33[1] = 3221225472;
        v33[2] = sub_100099508;
        v33[3] = v7;
        v34 = v13;
        v22 = v13;
        AnalyticsSendEventLazy(CFSTR("com.apple.das.SU.PersistentBlocker_v2"), v33);

      }
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v8);
  }

  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
    sub_1000E8594();
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5[127], "dictionary"));
  -[_DASDataCollectionSUTask addExperimentInformationWithDictionary:](self, "addExperimentInformationWithDictionary:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSMutableSet count](self->_blockReasonsSoFar, "count")));
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v24, CFSTR("NumberOfBlockers"));

  objc_msgSend(v23, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("Expired"));
  if (self->_currentEligibilityWindowStart && self->_currentEligibilityWindowEnd)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[_CDDateRange periodWithStart:end:](_CDDateRange, "periodWithStart:end:"));
    objc_msgSend(v25, "duration");
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v26, CFSTR("WindowDuration"));

  }
  v31[0] = v6;
  v31[1] = 3221225472;
  v31[2] = sub_100099510;
  v31[3] = v7;
  v32 = v23;
  v27 = v23;
  AnalyticsSendEventLazy(CFSTR("com.apple.das.SU.BlockReasonsCardinality_v2"), v31);

}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (double)interval
{
  return self->_interval;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (_DASActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
  objc_storeStrong((id *)&self->_activity, a3);
}

- (int64_t)currentEligibilityState
{
  return self->_currentEligibilityState;
}

- (void)setCurrentEligibilityState:(int64_t)a3
{
  self->_currentEligibilityState = a3;
}

- (NSDate)currentEligibilityWindowStart
{
  return self->_currentEligibilityWindowStart;
}

- (void)setCurrentEligibilityWindowStart:(id)a3
{
  objc_storeStrong((id *)&self->_currentEligibilityWindowStart, a3);
}

- (NSDate)currentEligibilityWindowEnd
{
  return self->_currentEligibilityWindowEnd;
}

- (void)setCurrentEligibilityWindowEnd:(id)a3
{
  objc_storeStrong((id *)&self->_currentEligibilityWindowEnd, a3);
}

- (NSMutableSet)blockReasonsSoFar
{
  return self->_blockReasonsSoFar;
}

- (void)setBlockReasonsSoFar:(id)a3
{
  objc_storeStrong((id *)&self->_blockReasonsSoFar, a3);
}

- (NSMutableSet)persistentBlockers
{
  return self->_persistentBlockers;
}

- (void)setPersistentBlockers:(id)a3
{
  objc_storeStrong((id *)&self->_persistentBlockers, a3);
}

- (OS_os_log)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
  objc_storeStrong((id *)&self->_logger, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_persistentBlockers, 0);
  objc_storeStrong((id *)&self->_blockReasonsSoFar, 0);
  objc_storeStrong((id *)&self->_currentEligibilityWindowEnd, 0);
  objc_storeStrong((id *)&self->_currentEligibilityWindowStart, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
