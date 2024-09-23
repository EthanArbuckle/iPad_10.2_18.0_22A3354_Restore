@implementation _DASRequiresPluggedInPolicy

- (id)predictionForDevicePluggedIn
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)os_transaction_create("com.apple.dasd.prediction.watchNearby");
  v4 = objc_autoreleasePoolPush();
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DKPredictor pluginLikelihood](self->_predictor, "pluginLikelihood"));
  objc_autoreleasePoolPop(v4);

  return v5;
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (BOOL)appliesToActivity:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fastPass"));

  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("pluggedinpolicy")));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      sub_1000E299C(v5);

    LOBYTE(v5) = 0;
  }
  else
  {
    LODWORD(v5) = objc_msgSend(v3, "beforeDaysFirstActivity") ^ 1;
  }

  return (char)v5;
}

- (_DKPredictionTimeline)pluginTimeline
{
  return (_DKPredictionTimeline *)objc_getProperty(self, a2, 64, 1);
}

- (double)weightForActivity:(id)a3
{
  id v4;
  double v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = 20.0;
  if (!-[_DASRequiresPluggedInPolicy requiresPluginForActivity:](self, "requiresPluginForActivity:", v4))
  {
    if ((objc_msgSend(v4, "requestsApplicationLaunch") & 1) != 0
      || (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "relatedApplications")),
          v7 = objc_msgSend(v6, "count"),
          v6,
          v7))
    {
      v5 = 2.0;
    }
    else
    {
      v5 = 10.0;
    }
  }

  return v5;
}

- (double)predictedScoreForActivity:(id)a3 atDate:(id)a4
{
  id v6;
  id v7;
  double v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  _DASRequiresPluggedInPolicy *v22;
  id v23;

  v6 = a3;
  v7 = a4;
  v8 = 0.5;
  if (objc_msgSend(v6, "targetDevice") != (id)1 && objc_msgSend(v6, "targetDevice") != (id)2)
  {
    v18 = _NSConcreteStackBlock;
    v19 = 3221225472;
    v20 = sub_100011180;
    v21 = &unk_10015D558;
    v22 = self;
    v23 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v9 = v23;
    +[_DASPredictionManager asyncDo:](_DASPredictionManager, "asyncDo:", &v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASRequiresPluggedInPolicy pluginTimeline](self, "pluginTimeline", v18, v19, v20, v21, v22));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueAtDate:", v7));
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "doubleValue");
      v14 = v13;
      -[_DASRequiresPluggedInPolicy scoreForActivity:isPluggedIn:](self, "scoreForActivity:isPluggedIn:", v6, v13 > 0.0);
      v8 = v14 * v15;
    }
    else
    {
      -[_DASRequiresPluggedInPolicy scoreForActivity:isPluggedIn:](self, "scoreForActivity:isPluggedIn:", v6, 0);
      v8 = v16;
    }

  }
  return v8;
}

- (double)scoreForActivity:(id)a3 isPluggedIn:(BOOL)a4
{
  double result;
  unsigned int v5;

  result = 1.0;
  if (!a4)
  {
    v5 = -[_DASRequiresPluggedInPolicy requiresPluginForActivity:](self, "requiresPluginForActivity:", a3, 1.0);
    result = 0.5;
    if (v5)
      return 0.0;
  }
  return result;
}

- (void)setPluginTimeline:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](_CDContextQueries, "keyPathForPluginStatus"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", v3));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", self->_batteryStatusKeyPath));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", self->_watchIsPluggedInKeyPath));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", self->_topOffCheckpointKeypath));
  v20[0] = CFSTR("identifier");
  v20[1] = CFSTR("predicate");
  v21[0] = CFSTR("com.apple.duetactivityscheduler.pluggedinpolicy.ispluggedin");
  v21[1] = v13;
  v20[2] = CFSTR("deviceSet");
  v20[3] = CFSTR("mustWake");
  v21[2] = &off_10016E870;
  v21[3] = &__kCFBooleanTrue;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 4));
  v22[0] = v4;
  v18[0] = CFSTR("identifier");
  v18[1] = CFSTR("predicate");
  v19[0] = CFSTR("com.apple.duetactivityscheduler.pluggedinpolicy.batteryStatus");
  v19[1] = v12;
  v18[2] = CFSTR("deviceSet");
  v18[3] = CFSTR("mustWake");
  v19[2] = &off_10016E870;
  v19[3] = &__kCFBooleanTrue;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 4));
  v22[1] = v5;
  v16[0] = CFSTR("identifier");
  v16[1] = CFSTR("predicate");
  v17[0] = CFSTR("com.apple.duetactivityscheduler.pluggedinpolicy.watchispluggedin");
  v17[1] = v10;
  v16[2] = CFSTR("deviceSet");
  v16[3] = CFSTR("mustWake");
  v17[2] = &off_10016E870;
  v17[3] = &__kCFBooleanTrue;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 4));
  v22[2] = v6;
  v14[0] = CFSTR("identifier");
  v14[1] = CFSTR("predicate");
  v15[0] = CFSTR("com.apple.das.top.checkpointStatus");
  v15[1] = v11;
  v14[2] = CFSTR("deviceSet");
  v14[3] = CFSTR("mustWake");
  v15[2] = &off_10016E870;
  v15[3] = &__kCFBooleanTrue;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 4));
  v22[3] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 4));

  return v8;
}

- (_DASRequiresPluggedInPolicy)init
{
  _DASRequiresPluggedInPolicy *v2;
  _DASRequiresPluggedInPolicy *v3;
  NSString *policyName;
  uint64_t v5;
  _CDContextualKeyPath *batteryStatusKeyPath;
  uint64_t v7;
  _CDContextualKeyPath *watchIsPluggedInKeyPath;
  uint64_t v9;
  _DKPredictor *predictor;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSUserDefaults *v15;
  NSUserDefaults *pluginStatusDefaults;
  uint64_t v17;
  _CDContextualKeyPath *topOffCheckpointKeypath;
  NSObject *v19;
  _BOOL4 deficitProcessing;
  dispatch_queue_attr_t v21;
  NSObject *v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *statsRecordingQueue;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  NSDate *lastPredictionTimelineUpdate;
  uint64_t v29;
  NSArray *triggers;
  objc_super v32;
  uint8_t buf[4];
  _BOOL4 v34;

  v32.receiver = self;
  v32.super_class = (Class)_DASRequiresPluggedInPolicy;
  v2 = -[_DASRequiresPluggedInPolicy init](&v32, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)CFSTR("Charger Plugged In Policy");

    v5 = objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForBatteryStateDataDictionary](_CDContextQueries, "keyPathForBatteryStateDataDictionary"));
    batteryStatusKeyPath = v3->_batteryStatusKeyPath;
    v3->_batteryStatusKeyPath = (_CDContextualKeyPath *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForDefaultPairedDevicePluginStatus](_CDContextQueries, "keyPathForDefaultPairedDevicePluginStatus"));
    watchIsPluggedInKeyPath = v3->_watchIsPluggedInKeyPath;
    v3->_watchIsPluggedInKeyPath = (_CDContextualKeyPath *)v7;

    v9 = objc_claimAutoreleasedReturnValue(+[_DASPredictionManager sharedPredictor](_DASPredictionManager, "sharedPredictor"));
    predictor = v3->_predictor;
    v3->_predictor = (_DKPredictor *)v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[_DASRequiresPluggedInPolicy predictionForDevicePluggedIn](v3, "predictionForDevicePluggedIn"));
    objc_storeStrong((id *)&v3->_pluginTimeline, v11);
    +[_DASPredictionManager setPrediction:forKey:](_DASPredictionManager, "setPrediction:forKey:", v11, CFSTR("plugin"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPLLogger sharedInstance](_DASPLLogger, "sharedInstance"));
    objc_msgSend(v12, "recordPrediction:key:valueMultiplier:", v11, CFSTR("powerPluggedInPrediction"), 100);

    v3->_isIpad = +[_DASConfig isiPad](_DASConfig, "isiPad");
    v13 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.duetactivityscheduler"));
    byte_1001AB920 = objc_msgSend(v13, "BOOLForKey:", CFSTR("imposePluginDelay"));

    v14 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.duetactivityscheduler"));
    v3->_ignoreIsCharging = objc_msgSend(v14, "BOOLForKey:", CFSTR("ignoreIsCharging"));

    v15 = (NSUserDefaults *)objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.duetactivityscheduler.plugin"));
    pluginStatusDefaults = v3->_pluginStatusDefaults;
    v3->_pluginStatusDefaults = v15;

    v17 = objc_claimAutoreleasedReturnValue(+[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/charging/topOffCheckpoint")));
    topOffCheckpointKeypath = v3->_topOffCheckpointKeypath;
    v3->_topOffCheckpointKeypath = (_CDContextualKeyPath *)v17;

    v3->_deficitProcessing = -[NSUserDefaults BOOLForKey:](v3->_pluginStatusDefaults, "BOOLForKey:", CFSTR("deficitProcessing"));
    v19 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("stats")));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      deficitProcessing = v3->_deficitProcessing;
      *(_DWORD *)buf = 67109120;
      v34 = deficitProcessing;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Deficit Processing=%u", buf, 8u);
    }

    v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    v23 = dispatch_queue_create("com.apple.dasd.pluginStatsRecording", v22);
    statsRecordingQueue = v3->_statsRecordingQueue;
    v3->_statsRecordingQueue = (OS_dispatch_queue *)v23;

    v25 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("predictions")));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      sub_1000E2930((uint64_t)v11, v25, v26);

    v27 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    lastPredictionTimelineUpdate = v3->_lastPredictionTimelineUpdate;
    v3->_lastPredictionTimelineUpdate = (NSDate *)v27;

    v29 = objc_claimAutoreleasedReturnValue(-[_DASRequiresPluggedInPolicy initializeTriggers](v3, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v29;

  }
  return v3;
}

- (BOOL)shouldLogScoreToPowerLog
{
  return 1;
}

+ (id)policyInstance
{
  if (qword_1001AB928 != -1)
    dispatch_once(&qword_1001AB928, &stru_10015E6F0);
  return (id)qword_1001AB930;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.duetactivityscheduler.pluggedinpolicy.ispluggedin")))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](_CDContextQueries, "keyPathForPluginStatus"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v8));
    v10 = objc_msgSend(v9, "BOOLValue");

    self = (_DASRequiresPluggedInPolicy *)objc_claimAutoreleasedReturnValue(+[_DASPLLogger sharedInstance](_DASPLLogger, "sharedInstance"));
    -[_DASRequiresPluggedInPolicy reportNewStatus:forTrigger:](self, "reportNewStatus:forTrigger:", v10, off_1001AB2D8);

    LOBYTE(self) = v10 ^ 1;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.duetactivityscheduler.pluggedinpolicy.batteryStatus")) & 1) != 0)
  {
    LOBYTE(self) = 1;
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.duetactivityscheduler.pluggedinpolicy.watchispluggedin")))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", self->_watchIsPluggedInKeyPath));
    LODWORD(self) = objc_msgSend(v11, "BOOLValue") ^ 1;

  }
  else
  {
    LOBYTE(self) = 0;
  }

  return (char)self;
}

- (BOOL)requiresPluginForActivity:(id)a3
{
  id v3;
  BOOL v4;
  id v5;

  v3 = a3;
  if ((objc_msgSend(v3, "requiresPlugin") & 1) != 0)
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

+ (BOOL)isWirelessCharger:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries batteryAdapterIsWirelessKey](_CDContextQueries, "batteryAdapterIsWirelessKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v4));

  LOBYTE(v3) = objc_msgSend(v5, "BOOLValue");
  return (char)v3;
}

- (void)computeAndRecordPolicyDurationStatsWhilePluggedIn:(BOOL)a3 considerPluggedIn:(BOOL)a4 atDate:(id)a5
{
  id v8;
  void *v9;
  OS_dispatch_queue *statsRecordingQueue;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _DASRequiresPluggedInPolicy *v15;
  id v16;
  BOOL v17;
  BOOL v18;

  v8 = a5;
  v9 = (void *)os_transaction_create("com.apple.dasd.recordplugins");
  statsRecordingQueue = self->_statsRecordingQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000609A0;
  v13[3] = &unk_10015E718;
  v17 = a3;
  v18 = a4;
  v14 = v9;
  v15 = self;
  v16 = v8;
  v11 = v8;
  v12 = v9;
  dispatch_async((dispatch_queue_t)statsRecordingQueue, v13);

}

- (unint64_t)notChargingReason
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_DASBatteryTemperatureReader batteryProperties](_DASBatteryTemperatureReader, "batteryProperties"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ChargerData")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("NotChargingReason")));

  v5 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = objc_msgSend(v4, "unsignedIntegerValue");
  }
  else
  {
    v7 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("pluggedinpolicy")));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000E29DC((uint64_t)v4, v7);

    v6 = 0;
  }

  return (unint64_t)v6;
}

- (BOOL)isIgnorableNotChargingReason:(unint64_t)a3
{
  return (a3 & 0xFF7FFFFFFE7F73FELL) == 0 && a3 != 0;
}

- (double)scoreForActivity:(id)a3 withBatteryStatus:(id)a4 withTopOffStatus:(unint64_t)a5 timeSincePluginStateChange:(double)a6 atDate:(id)a7 rationale:(id)a8
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  const __CFString *v39;
  id v40;
  _BOOL4 ignoreIsCharging;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _DASRequiresPluggedInPolicy *v46;
  char v48;
  uint64_t v49;
  unint64_t lastNotChargingReason;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  unsigned __int8 v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  unsigned int v60;
  id v62;
  id v63;
  id v64;

  v64 = a3;
  v13 = a4;
  v14 = a7;
  v63 = a8;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries batteryExternalConnectedKey](_CDContextQueries, "batteryExternalConnectedKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v15));
  v17 = objc_msgSend(v16, "BOOLValue");

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries batteryIsChargingKey](_CDContextQueries, "batteryIsChargingKey"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v18));
  v60 = objc_msgSend(v19, "BOOLValue");

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries batteryFullyChargedKey](_CDContextQueries, "batteryFullyChargedKey"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v20));
  v62 = v14;
  if ((objc_msgSend(v21, "BOOLValue") & 1) != 0)
  {
    v22 = 1;
  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries batteryPercentageKey](_CDContextQueries, "batteryPercentageKey"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v23));
    v22 = objc_msgSend(v24, "intValue") == 100;

  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries batteryVoltageKey](_CDContextQueries, "batteryVoltageKey"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v25));
  v27 = (uint64_t)objc_msgSend(v26, "integerValue");

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries batteryTemperatureKey](_CDContextQueries, "batteryTemperatureKey"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v28));
  v30 = (uint64_t)objc_msgSend(v29, "integerValue");

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries batteryPercentageKey](_CDContextQueries, "batteryPercentageKey"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v31));
  v33 = objc_msgSend(v32, "integerValue");

  v34 = v64;
  if ((objc_msgSend(v64, "hasMagneticSensitivity") & v17) == 1)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("hasMagneticSensitivity == YES AND isPluggedIn == YES")));
    v36 = v63;
    objc_msgSend(v63, "addRationaleWithCondition:", v35);

    v37 = 0.0;
    v38 = v62;
    goto LABEL_14;
  }
  if (a5 - 2 < 3)
  {
    v39 = CFSTR("topOffProtectionEngaged == %@");
    v40 = v17;
LABEL_10:
    v36 = v63;
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v39, &__kCFBooleanTrue));
    objc_msgSend(v63, "addRationaleWithCondition:", v42);

    goto LABEL_11;
  }
  ignoreIsCharging = self->_ignoreIsCharging;
  if (-[_DASRequiresPluggedInPolicy deviceIsToppingOff:](self, "deviceIsToppingOff:", a5))
  {
    v40 = 0;
    v39 = CFSTR("deviceTopOff == %@");
    goto LABEL_10;
  }
  v59 = (uint64_t)v33;
  v48 = v17 ^ 1;
  if (ignoreIsCharging)
    v48 = 1;
  v40 = v17;
  v36 = v63;
  if ((v48 & 1) != 0)
  {
LABEL_11:
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries batteryExternalConnectedKey](_CDContextQueries, "batteryExternalConnectedKey"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v40));
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%@ == %@"), v43, v44));
    objc_msgSend(v36, "addRationaleWithCondition:", v45);

    v34 = v64;
    v46 = self;
    v38 = v62;
    -[_DASRequiresPluggedInPolicy computeAndRecordPolicyDurationStatsWhilePluggedIn:considerPluggedIn:atDate:](self, "computeAndRecordPolicyDurationStatsWhilePluggedIn:considerPluggedIn:atDate:", v17, v40, v62);
    v37 = 1.0;
    if ((v40 & 1) != 0)
      goto LABEL_14;
    goto LABEL_12;
  }
  if (((v22 | v60) & 1) != 0)
  {
    v46 = self;
    self->_lastNotChargingReason = 0;
    v49 = 1;
    v36 = v63;
  }
  else
  {
    v46 = self;
    lastNotChargingReason = self->_lastNotChargingReason;
    if (!lastNotChargingReason)
    {
      lastNotChargingReason = -[_DASRequiresPluggedInPolicy notChargingReason](self, "notChargingReason");
      self->_lastNotChargingReason = lastNotChargingReason;
    }
    v36 = v63;
    if (-[_DASRequiresPluggedInPolicy isIgnorableNotChargingReason:](self, "isIgnorableNotChargingReason:", lastNotChargingReason))
    {
      v49 = 1;
    }
    else
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_lastNotChargingReason));
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("isCharging == NO AND notChargingReason == %@"), v51));
      objc_msgSend(v63, "addRationaleWithCondition:", v52);

      v34 = v64;
      v49 = 0;
    }
  }
  if (v46->_isIpad && v27 >= 4200 && v30 >= 3500 && !v46->_deficitProcessing)
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "userInfo"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKeyedSubscript:", _DASCTSBypassBatteryAgingProtectionKey));
    if ((objc_msgSend(v54, "BOOLValue") & 1) == 0)
    {
      v55 = objc_msgSend(v34, "backlogged");

      v46 = self;
      if ((v55 & 1) != 0)
        goto LABEL_33;
      v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v27));
      v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v30));
      v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("voltage == %@ AND temperature == %@"), v53, v54));
      objc_msgSend(v36, "addRationaleWithCondition:", v56);

      v49 = 0;
    }

    v46 = self;
  }
LABEL_33:
  if ((byte_1001AB920
     || (objc_msgSend(v34, "backlogged") & 1) == 0
     && +[_DASRequiresPluggedInPolicy isWirelessCharger:](_DASRequiresPluggedInPolicy, "isWirelessCharger:", v13)&& v59 <= 79)&& a6 > 0.0&& a6 < 900.0)
  {
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a6 / 60.0));
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("timeSincePlugin == %@"), v57));
    objc_msgSend(v36, "addRationaleWithCondition:", v58);

    v34 = v64;
    v38 = v62;
    -[_DASRequiresPluggedInPolicy computeAndRecordPolicyDurationStatsWhilePluggedIn:considerPluggedIn:atDate:](v46, "computeAndRecordPolicyDurationStatsWhilePluggedIn:considerPluggedIn:atDate:", 1, 0, v62);
  }
  else
  {
    v38 = v62;
    -[_DASRequiresPluggedInPolicy computeAndRecordPolicyDurationStatsWhilePluggedIn:considerPluggedIn:atDate:](v46, "computeAndRecordPolicyDurationStatsWhilePluggedIn:considerPluggedIn:atDate:", 1, v49, v62);
    v37 = 1.0;
    if ((v49 & 1) != 0)
      goto LABEL_14;
  }
LABEL_12:
  v37 = 0.5;
  if (-[_DASRequiresPluggedInPolicy requiresPluginForActivity:](v46, "requiresPluginForActivity:", v34))
  {
    -[_DASRequiresPluggedInPolicy updateRationaleForTransferSize:withActivity:](v46, "updateRationaleForTransferSize:withActivity:", v36, v34);
    v37 = 0.0;
  }
LABEL_14:

  return v37;
}

- (BOOL)deviceIsToppingOff:(unint64_t)a3
{
  return a3 == 5;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  _DASPolicyResponseRationale *v8;
  _CDContextualKeyPath *v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  double v26;
  double v27;

  v6 = a3;
  v7 = a4;
  v8 = -[_DASPolicyResponseRationale initWithPolicyName:]([_DASPolicyResponseRationale alloc], "initWithPolicyName:", self->_policyName);
  if (objc_msgSend(v6, "targetDevice"))
  {
    v9 = self->_watchIsPluggedInKeyPath;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v9));
    v11 = objc_msgSend(v10, "BOOLValue");

    -[_DASRequiresPluggedInPolicy scoreForActivity:isPluggedIn:](self, "scoreForActivity:isPluggedIn:", v6, v11);
    v13 = v12;
    if (v12 == 0.0)
    {
      -[_DASRequiresPluggedInPolicy updateRationaleForTransferSize:withActivity:](self, "updateRationaleForTransferSize:withActivity:", v8, v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v11));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%@ == %@"), v9, v14));

      -[_DASPolicyResponseRationale addRationaleWithCondition:](v8, "addRationaleWithCondition:", v15);
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithScore:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithScore:validityDuration:rationale:", v8, v13, (double)0x384uLL));
  }
  else
  {
    v9 = (_CDContextualKeyPath *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](_CDContextQueries, "keyPathForPluginStatus"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastModifiedDateForContextualKeyPath:", v17));

    if (v18)
    {
      -[_CDContextualKeyPath timeIntervalSinceDate:](v9, "timeIntervalSinceDate:", v18);
      v20 = v19;
    }
    else
    {
      v20 = 901.0;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", self->_topOffCheckpointKeypath));
    v22 = objc_msgSend(v21, "unsignedIntegerValue");

    v23 = objc_msgSend(v6, "schedulingPriority");
    if ((unint64_t)v23 < _DASSchedulingPriorityUtility
      && -[_DASRequiresPluggedInPolicy deviceIsToppingOff:](self, "deviceIsToppingOff:", v22))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("priority == %llu && topOffStatus == %llu"), objc_msgSend(v6, "schedulingPriority"), v22));
      -[_DASPolicyResponseRationale addRationaleWithCondition:](v8, "addRationaleWithCondition:", v24);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", 33, v8, (double)0x384uLL));

    }
    else
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", self->_batteryStatusKeyPath));
      -[_DASRequiresPluggedInPolicy scoreForActivity:withBatteryStatus:withTopOffStatus:timeSincePluginStateChange:atDate:rationale:](self, "scoreForActivity:withBatteryStatus:withTopOffStatus:timeSincePluginStateChange:atDate:rationale:", v6, v25, v22, v9, v8, v20);
      v27 = v26;

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithScore:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithScore:validityDuration:rationale:", v8, v27, (double)0x384uLL));
    }

  }
  return v16;
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

- (_CDContextualKeyPath)batteryStatusKeyPath
{
  return self->_batteryStatusKeyPath;
}

- (void)setBatteryStatusKeyPath:(id)a3
{
  objc_storeStrong((id *)&self->_batteryStatusKeyPath, a3);
}

- (_CDContextualKeyPath)watchIsPluggedInKeyPath
{
  return self->_watchIsPluggedInKeyPath;
}

- (void)setWatchIsPluggedInKeyPath:(id)a3
{
  objc_storeStrong((id *)&self->_watchIsPluggedInKeyPath, a3);
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

- (NSDate)lastPredictionTimelineUpdate
{
  return self->_lastPredictionTimelineUpdate;
}

- (void)setLastPredictionTimelineUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_lastPredictionTimelineUpdate, a3);
}

- (BOOL)isIpad
{
  return self->_isIpad;
}

- (void)setIsIpad:(BOOL)a3
{
  self->_isIpad = a3;
}

- (BOOL)deficitProcessing
{
  return self->_deficitProcessing;
}

- (void)setDeficitProcessing:(BOOL)a3
{
  self->_deficitProcessing = a3;
}

- (OS_dispatch_queue)statsRecordingQueue
{
  return self->_statsRecordingQueue;
}

- (void)setStatsRecordingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_statsRecordingQueue, a3);
}

- (NSUserDefaults)pluginStatusDefaults
{
  return self->_pluginStatusDefaults;
}

- (void)setPluginStatusDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_pluginStatusDefaults, a3);
}

- (_CDContextualKeyPath)topOffCheckpointKeypath
{
  return self->_topOffCheckpointKeypath;
}

- (void)setTopOffCheckpointKeypath:(id)a3
{
  objc_storeStrong((id *)&self->_topOffCheckpointKeypath, a3);
}

- (BOOL)ignoreIsCharging
{
  return self->_ignoreIsCharging;
}

- (void)setIgnoreIsCharging:(BOOL)a3
{
  self->_ignoreIsCharging = a3;
}

- (unint64_t)lastNotChargingReason
{
  return self->_lastNotChargingReason;
}

- (void)setLastNotChargingReason:(unint64_t)a3
{
  self->_lastNotChargingReason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topOffCheckpointKeypath, 0);
  objc_storeStrong((id *)&self->_pluginStatusDefaults, 0);
  objc_storeStrong((id *)&self->_statsRecordingQueue, 0);
  objc_storeStrong((id *)&self->_lastPredictionTimelineUpdate, 0);
  objc_storeStrong((id *)&self->_pluginTimeline, 0);
  objc_storeStrong((id *)&self->_predictor, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_watchIsPluggedInKeyPath, 0);
  objc_storeStrong((id *)&self->_batteryStatusKeyPath, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);
  objc_storeStrong((id *)&self->_policyName, 0);
}

@end
