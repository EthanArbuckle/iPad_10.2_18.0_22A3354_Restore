@implementation _DASDefaultPairedPolicy

- (BOOL)appliesToActivity:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  if (objc_msgSend(v3, "targetDevice") == (id)1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));
    v5 = v4 == 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)initializeTriggers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  _QWORD v8[4];
  void *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForDefaultPairedDeviceNearbyStatus](_CDContextQueries, "keyPathForDefaultPairedDeviceNearbyStatus"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", v2));

  v7[0] = CFSTR("identifier");
  v7[1] = CFSTR("predicate");
  v8[0] = CFSTR("com.apple.duetactivityscheduler.defaultpairedpolicy.nearbystatus");
  v8[1] = v3;
  v7[2] = CFSTR("deviceSet");
  v7[3] = CFSTR("mustWake");
  v8[2] = &off_10016E768;
  v8[3] = &__kCFBooleanTrue;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 4));
  v9 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));

  return v5;
}

- (_DASDefaultPairedPolicy)init
{
  _DASDefaultPairedPolicy *v2;
  _DASDefaultPairedPolicy *v3;
  NSString *policyName;
  uint64_t v5;
  _DKPredictor *predictor;
  uint64_t v7;
  _DKPredictionTimeline *deviceNearbyTimeline;
  uint64_t v9;
  NSDate *lastPredictionTimelineUpdate;
  uint64_t v11;
  NSArray *triggers;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_DASDefaultPairedPolicy;
  v2 = -[_DASDefaultPairedPolicy init](&v14, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)CFSTR("Default Paired Nearby Policy");

    v5 = objc_claimAutoreleasedReturnValue(+[_DASPredictionManager sharedPredictor](_DASPredictionManager, "sharedPredictor"));
    predictor = v3->_predictor;
    v3->_predictor = (_DKPredictor *)v5;

    v7 = objc_claimAutoreleasedReturnValue(-[_DASDefaultPairedPolicy predictionForDeviceNearby](v3, "predictionForDeviceNearby"));
    deviceNearbyTimeline = v3->_deviceNearbyTimeline;
    v3->_deviceNearbyTimeline = (_DKPredictionTimeline *)v7;

    v9 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    lastPredictionTimelineUpdate = v3->_lastPredictionTimelineUpdate;
    v3->_lastPredictionTimelineUpdate = (NSDate *)v9;

    v11 = objc_claimAutoreleasedReturnValue(-[_DASDefaultPairedPolicy initializeTriggers](v3, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v11;

  }
  return v3;
}

- (id)predictionForDeviceNearby
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v3 = (void *)os_transaction_create("com.apple.dasd.prediction.watchNearby");
  v4 = objc_autoreleasePoolPush();
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_DKQuery predicateForEventsWithStartInDateRangeFrom:to:](_DKQuery, "predicateForEventsWithStartInDateRangeFrom:to:", v5, v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_DKQuery predicateForEventsWithIntegerValue:](_DKQuery, "predicateForEventsWithIntegerValue:", 1));
  v13[0] = v7;
  v13[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 2));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_DKPredictor predictionForStreamWithName:withPredicate:withPredictionType:](self->_predictor, "predictionForStreamWithName:withPredicate:withPredictionType:", CFSTR("/defaultPaired/nearby"), v10, 1));
  objc_autoreleasePoolPop(v4);

  return v11;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;

  v5 = a4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.duetactivityscheduler.defaultpairedpolicy.nearbystatus")))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForDefaultPairedDeviceNearbyStatus](_CDContextQueries, "keyPathForDefaultPairedDeviceNearbyStatus"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));
    v8 = objc_msgSend(v7, "BOOLValue") ^ 1;

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (double)weightForActivity:(id)a3
{
  return 1.0;
}

+ (id)policyInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004E4F0;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001AB708 != -1)
    dispatch_once(&qword_1001AB708, block);
  return (id)qword_1001AB710;
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
  _DASDefaultPairedPolicy *v25;
  id v26;

  v6 = a3;
  v7 = a4;
  v21 = _NSConcreteStackBlock;
  v22 = 3221225472;
  v23 = sub_10004E6A4;
  v24 = &unk_10015D558;
  v25 = self;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v26 = v8;
  +[_DASPredictionManager asyncDo:](_DASPredictionManager, "asyncDo:", &v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDefaultPairedPolicy deviceNearbyTimeline](self, "deviceNearbyTimeline", v21, v22, v23, v24, v25));
  v10 = objc_msgSend(v6, "duration");
  if ((unint64_t)v10 <= _DASActivityDurationModerate)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueAtDate:", v7));
    objc_msgSend(v18, "doubleValue");
    v13 = v19;

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

      v13 = v13 * v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dateByAddingTimeInterval:", 900.0));

      v12 = v12 + 900.0;
      v7 = v17;
    }
    while (v12 < v11);
  }

  return v13;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  _DASPolicyResponseRationale *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForDefaultPairedDeviceNearbyStatus](_CDContextQueries, "keyPathForDefaultPairedDeviceNearbyStatus"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v8));

  LOBYTE(v7) = objc_msgSend(v9, "BOOLValue");
  if ((v7 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[_DASDefaultPairedPolicy scoreForActivity:atDate:](self, "scoreForActivity:atDate:", v6, v10);
    v12 = v11;

    v13 = -[_DASPolicyResponseRationale initWithPolicyName:]([_DASPolicyResponseRationale alloc], "initWithPolicyName:", CFSTR("Default Paired Nearby Policy"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v12));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("defaultPaired.likelihood == %@"), v14));
    -[_DASPolicyResponseRationale addRationaleWithCondition:](v13, "addRationaleWithCondition:", v15);

    v16 = objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithScore:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithScore:validityDuration:rationale:", 0, fmax(v12, 0.01), (double)0x384uLL));
  }
  else
  {
    v13 = -[_DASPolicyResponseRationale initWithPolicyName:]([_DASPolicyResponseRationale alloc], "initWithPolicyName:", CFSTR("Default Paired Nearby Policy"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("defaultPairedIsNearby == %@"), v17));
    -[_DASPolicyResponseRationale addRationaleWithCondition:](v13, "addRationaleWithCondition:", v18);

    v16 = objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", 33, v13, (double)0x384uLL));
  }
  v19 = (void *)v16;

  return v19;
}

- (NSString)policyName
{
  return self->_policyName;
}

- (void)setPolicyName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)policyDescription
{
  return self->_policyDescription;
}

- (void)setPolicyDescription:(id)a3
{
  objc_storeStrong((id *)&self->_policyDescription, a3);
}

- (NSArray)triggers
{
  return self->_triggers;
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

- (_DKPredictionTimeline)deviceNearbyTimeline
{
  return (_DKPredictionTimeline *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDeviceNearbyTimeline:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSDate)lastPredictionTimelineUpdate
{
  return self->_lastPredictionTimelineUpdate;
}

- (void)setLastPredictionTimelineUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_lastPredictionTimelineUpdate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPredictionTimelineUpdate, 0);
  objc_storeStrong((id *)&self->_deviceNearbyTimeline, 0);
  objc_storeStrong((id *)&self->_predictor, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);
  objc_storeStrong((id *)&self->_policyName, 0);
}

@end
