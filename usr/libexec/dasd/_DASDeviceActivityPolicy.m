@implementation _DASDeviceActivityPolicy

- (NSArray)triggers
{
  return self->_triggers;
}

- (BOOL)appliesToActivity:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fileProtection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DASFileProtection complete](_DASFileProtection, "complete"));
  if ((objc_msgSend(v4, "isEqual:", v5) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fastPass"));
    v6 = v7 == 0;

  }
  return v6;
}

- (double)weightForActivity:(id)a3
{
  id v4;
  double v5;

  v4 = a3;
  v5 = 20.0;
  if (!-[_DASDeviceActivityPolicy requiresDeviceInactivityForActivity:](self, "requiresDeviceInactivityForActivity:", v4))
  {
    if (objc_msgSend(v4, "requestsApplicationLaunch"))
      v5 = 5.0;
    else
      v5 = 10.0;
  }

  return v5;
}

- (double)scoreForActivity:(id)a3 atDate:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  void **v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  _DASDeviceActivityPolicy *v25;
  id v26;

  v6 = a3;
  v7 = a4;
  v21 = _NSConcreteStackBlock;
  v22 = 3221225472;
  v23 = sub_100011040;
  v24 = &unk_10015D558;
  v25 = self;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v26 = v8;
  +[_DASPredictionManager asyncDo:](_DASPredictionManager, "asyncDo:", &v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDeviceActivityPolicy deviceActivityTimeline](self, "deviceActivityTimeline", v21, v22, v23, v24, v25));
  v10 = objc_msgSend(v6, "duration");
  if ((unint64_t)v10 <= _DASActivityDurationModerate)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueAtDate:", v7));
    objc_msgSend(v18, "doubleValue");
    v13 = 1.0 - v19;

    v17 = v7;
  }
  else
  {
    v11 = (double)(unint64_t)v10;
    v12 = 0.0;
    v13 = 1.0;
    do
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueAtDate:", v7));
      objc_msgSend(v14, "doubleValue");
      v16 = v15;

      v13 = v13 * (1.0 - v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dateByAddingTimeInterval:", 900.0));

      v12 = v12 + 900.0;
      v7 = v17;
    }
    while (v12 < v11);
  }

  return v13;
}

- (_DKPredictionTimeline)deviceActivityTimeline
{
  return (_DKPredictionTimeline *)objc_getProperty(self, a2, 48, 1);
}

+ (void)printLowLikelihoodRegions
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPredictionManager lowLikelihoodPeriodStartForPredictionWithKey:](_DASPredictionManager, "lowLikelihoodPeriodStartForPredictionWithKey:", CFSTR("deviceActivity")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPredictionManager lowLikelihoodPeriodEndForPredictionWithKey:](_DASPredictionManager, "lowLikelihoodPeriodEndForPredictionWithKey:", CFSTR("deviceActivity")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("predictions")));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "descriptionWithLocale:", v4));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "descriptionWithLocale:", v4));
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Low Likelihood is from %@ to %@", (uint8_t *)&v8, 0x16u);

  }
}

- (id)initializeTriggers
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];
  _QWORD v7[4];
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", self->_inUseStatus));
  v6[0] = CFSTR("identifier");
  v6[1] = CFSTR("predicate");
  v7[0] = CFSTR("com.apple.duetactivityscheduler.deviceactivitypolicy.inusestatus");
  v7[1] = v2;
  v6[2] = CFSTR("deviceSet");
  v6[3] = CFSTR("mustWake");
  v7[2] = &off_10016E780;
  v7[3] = &__kCFBooleanTrue;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 4));
  v8 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));

  return v4;
}

- (_DASDeviceActivityPolicy)init
{
  _DASDeviceActivityPolicy *v2;
  _DASDeviceActivityPolicy *v3;
  NSString *policyName;
  uint64_t v5;
  _DKPredictor *predictor;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  uint64_t v11;
  _CDContextualKeyPath *inUseStatus;
  uint64_t v13;
  NSArray *triggers;
  id v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)_DASDeviceActivityPolicy;
  v2 = -[_DASDeviceActivityPolicy init](&v17, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)CFSTR("Device Activity Policy");

    v5 = objc_claimAutoreleasedReturnValue(+[_DASPredictionManager sharedPredictor](_DASPredictionManager, "sharedPredictor"));
    predictor = v3->_predictor;
    v3->_predictor = (_DKPredictor *)v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create("com.apple.duet.activityscheduler.deviceactivitypolicy.queue", v8);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v9;

    objc_msgSend((id)objc_opt_class(v3), "printLowLikelihoodRegions");
    v11 = objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForInUseStatus](_CDContextQueries, "keyPathForInUseStatus"));
    inUseStatus = v3->_inUseStatus;
    v3->_inUseStatus = (_CDContextualKeyPath *)v11;

    v13 = objc_claimAutoreleasedReturnValue(-[_DASDeviceActivityPolicy initializeTriggers](v3, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v13;

    v15 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.duetactivityscheduler"));
    v3->_considerAlwaysActive = objc_msgSend(v15, "BOOLForKey:", CFSTR("deviceInUse"));

    -[_DASDeviceActivityPolicy initializeTimelines](v3, "initializeTimelines");
  }
  return v3;
}

- (void)initializeTimelines
{
  OS_dispatch_queue *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004EDE8;
  block[3] = &unk_10015D4E0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (id)predictionForDeviceActivity
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)os_transaction_create("com.apple.dasd.prediction.deviceActivity");
  v4 = objc_autoreleasePoolPush();
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DKPredictor deviceActivityLikelihood](self->_predictor, "deviceActivityLikelihood"));
  objc_autoreleasePoolPop(v4);

  return v5;
}

- (BOOL)shouldLogScoreToPowerLog
{
  return 1;
}

+ (id)policyInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004EFA8;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001AB718 != -1)
    dispatch_once(&qword_1001AB718, block);
  return (id)qword_1001AB720;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v5 = a4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.duetactivityscheduler.deviceactivitypolicy.inusestatus")))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForInUseStatus](_CDContextQueries, "keyPathForInUseStatus"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));
    v8 = objc_msgSend(v7, "BOOLValue");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)isDeviceInUse:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForInUseStatus](_CDContextQueries, "keyPathForInUseStatus"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v4));

  LOBYTE(v4) = ((unint64_t)objc_msgSend(v5, "unsignedLongLongValue") & 5) != 0;
  return (char)v4;
}

- (BOOL)backgroundTaskAllowedWithType:(id)a3 withRequiredFileProtection:(id)a4 withRationale:(id)a5 withState:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  unsigned __int8 v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if ((objc_msgSend(v10, "isEqualToString:", _DASLaunchReasonBackgroundProcessing) & 1) == 0)
  {
    if (!objc_msgSend(v10, "isEqualToString:", _DASLaunchReasonHealthResearch))
      goto LABEL_9;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[_DASFileProtection complete](_DASFileProtection, "complete"));
    if ((objc_msgSend(v11, "isEqual:", v14) & 1) != 0)
    {
      v16 = 1;
      goto LABEL_7;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[_DASFileProtection completeUnlessOpen](_DASFileProtection, "completeUnlessOpen"));
    v18 = objc_msgSend(v11, "isEqual:", v17);

    if ((v18 & 1) != 0)
      goto LABEL_9;
  }
  if (!objc_msgSend((id)objc_opt_class(self), "isDeviceInUse:", v13))
  {
LABEL_9:
    v16 = 1;
    goto LABEL_10;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("launchType == PROCESSING AND deviceActive == %@"), v14));
  objc_msgSend(v12, "addRationaleWithCondition:", v15);

  v16 = 0;
LABEL_7:

LABEL_10:
  return v16;
}

- (BOOL)requiresDeviceInactivityForActivity:(id)a3
{
  id v3;
  BOOL v4;
  id v5;

  v3 = a3;
  if ((objc_msgSend(v3, "requiresDeviceInactivity") & 1) != 0)
  {
    v4 = 1;
  }
  else if (+[_DASPhotosPolicy isiCPLActivity:](_DASPhotosPolicy, "isiCPLActivity:", v3)
         && objc_msgSend(v3, "transferSizeType") == (id)30)
  {
    v5 = objc_msgSend(v3, "schedulingPriority");
    v4 = (unint64_t)v5 < _DASSchedulingPriorityUserInitiated;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)updateRationaleForTransferSize:(id)a3 withActivity:(id)a4
{
  id v5;

  v5 = a3;
  if (objc_msgSend(a4, "transferSizeType") == (id)30)
    objc_msgSend(v5, "setResponseOptions:", (unint64_t)objc_msgSend(v5, "responseOptions") | 1);

}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  _DASPolicyResponseRationale *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  double v23;
  void *v25;

  v6 = a3;
  v7 = a4;
  v8 = -[_DASPolicyResponseRationale initWithPolicyName:]([_DASPolicyResponseRationale alloc], "initWithPolicyName:", CFSTR("Device Activity Policy"));
  if (!self->_considerAlwaysActive
    || !-[_DASDeviceActivityPolicy requiresDeviceInactivityForActivity:](self, "requiresDeviceInactivityForActivity:", v6))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForInUseStatus](_CDContextQueries, "keyPathForInUseStatus"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v11));

    if (-[_DASDeviceActivityPolicy requiresDeviceInactivityForActivity:](self, "requiresDeviceInactivityForActivity:", v6)&& +[_DASDeviceActivityPolicy isDeviceInUse:](_DASDeviceActivityPolicy, "isDeviceInUse:", v7))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("deviceActivity == %@"), v12));
      -[_DASPolicyResponseRationale addRationaleWithCondition:](v8, "addRationaleWithCondition:", v13);

      -[_DASDeviceActivityPolicy updateRationaleForTransferSize:withActivity:](self, "updateRationaleForTransferSize:withActivity:", v8, v6);
LABEL_7:
      v14 = (double)0x384uLL;
LABEL_19:
      v19 = objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", 33, v8, v14));
      goto LABEL_20;
    }
    if (objc_msgSend(v6, "requestsApplicationLaunch")
      && (objc_msgSend(v6, "isContactTracingBackgroundActivity") & 1) == 0)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "launchReason"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fileProtection"));
      v22 = -[_DASDeviceActivityPolicy backgroundTaskAllowedWithType:withRequiredFileProtection:withRationale:withState:](self, "backgroundTaskAllowedWithType:withRequiredFileProtection:withRationale:withState:", v20, v21, v8, v7);

      if ((v22 & 1) == 0)
      {
        v14 = 10800.0;
        goto LABEL_19;
      }
      if ((objc_msgSend(v12, "unsignedIntValue") & 4) != 0)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("deviceActivity == %@"), v12));
        -[_DASPolicyResponseRationale addRationaleWithCondition:](v8, "addRationaleWithCondition:", v25);

        goto LABEL_7;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      -[_DASDeviceActivityPolicy scoreForActivity:atDate:](self, "scoreForActivity:atDate:", v6, v16);
      v18 = 1.0 - v23;
    }
    else
    {
      if (objc_msgSend(v12, "BOOLValue"))
        v15 = 0.1;
      else
        v15 = 0.5;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      -[_DASDeviceActivityPolicy scoreForActivity:atDate:](self, "scoreForActivity:atDate:", v6, v16);
      v18 = v15 + v17 * 0.5;
    }

    v19 = objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithScore:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithScore:validityDuration:rationale:", 0, fmax(v18, 0.05), (double)0x384uLL));
LABEL_20:
    v10 = (void *)v19;

    goto LABEL_21;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("considerAlwaysActive == YES && requiresDeviceInactivity == YES")));
  -[_DASPolicyResponseRationale addRationaleWithCondition:](v8, "addRationaleWithCondition:", v9);

  -[_DASDeviceActivityPolicy updateRationaleForTransferSize:withActivity:](self, "updateRationaleForTransferSize:withActivity:", v8, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", 33, v8, (double)0x384uLL));
LABEL_21:

  return v10;
}

- (NSString)policyName
{
  return self->_policyName;
}

- (void)setPolicyName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)policyDescription
{
  return self->_policyDescription;
}

- (void)setPolicyDescription:(id)a3
{
  objc_storeStrong((id *)&self->_policyDescription, a3);
}

- (void)setTriggers:(id)a3
{
  objc_storeStrong((id *)&self->_triggers, a3);
}

- (_DKPredictor)predictor
{
  return self->_predictor;
}

- (void)setPredictor:(id)a3
{
  objc_storeStrong((id *)&self->_predictor, a3);
}

- (void)setDeviceActivityTimeline:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSDate)lastPredictionTimelineUpdate
{
  return self->_lastPredictionTimelineUpdate;
}

- (void)setLastPredictionTimelineUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_lastPredictionTimelineUpdate, a3);
}

- (_CDContextualKeyPath)inUseStatus
{
  return self->_inUseStatus;
}

- (void)setInUseStatus:(id)a3
{
  objc_storeStrong((id *)&self->_inUseStatus, a3);
}

- (BOOL)considerAlwaysActive
{
  return self->_considerAlwaysActive;
}

- (void)setConsiderAlwaysActive:(BOOL)a3
{
  self->_considerAlwaysActive = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_inUseStatus, 0);
  objc_storeStrong((id *)&self->_lastPredictionTimelineUpdate, 0);
  objc_storeStrong((id *)&self->_deviceActivityTimeline, 0);
  objc_storeStrong((id *)&self->_predictor, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);
  objc_storeStrong((id *)&self->_policyName, 0);
}

@end
