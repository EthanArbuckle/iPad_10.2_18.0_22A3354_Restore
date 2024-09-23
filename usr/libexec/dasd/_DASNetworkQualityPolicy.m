@implementation _DASNetworkQualityPolicy

- (BOOL)appliesToActivity:(id)a3
{
  return objc_msgSend(a3, "requiresNetwork");
}

- (NSArray)triggers
{
  return self->_triggers;
}

+ (BOOL)shouldReportOversizeLoadForTransferSize:(unint64_t)a3 withContext:(id)a4
{
  return _DASActivityTransferSizeModerate <= a3;
}

- (double)weightForActivity:(id)a3
{
  return (double)(unint64_t)(12 * (100 - (_QWORD)objc_msgSend(a3, "schedulingPriority"))) / 100.0;
}

- (double)predictedScoreForActivity:(id)a3 atDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  _BOOL8 v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  id v21;
  double v22;
  _BOOL8 v23;
  double v24;
  double v25;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASNetworkQualityPolicy wifiPredictionTimeline](self, "wifiPredictionTimeline"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueAtDate:", v7));
  v10 = objc_msgSend(v9, "integerValue");

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPredictionManager predictionForKey:](_DASPredictionManager, "predictionForKey:", CFSTR("plugin")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "valueAtDate:", v7));
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "doubleValue");
    v15 = v14 > 0.5;
  }
  else
  {
    v15 = 0;
  }
  -[_DASNetworkQualityPolicy scoreForActivity:networkQuality:interface:interfaceSubtype:pluginStatus:radioHot:linkAvailable:](self, "scoreForActivity:networkQuality:interface:interfaceSubtype:pluginStatus:radioHot:linkAvailable:", v6, v10, 1, 0, v15, 0, 0);
  v17 = v16;
  if (!objc_msgSend(v6, "requiresInexpensiveNetworking")
    || (v18 = v17, -[_DASNetworkQualityPolicy inDiscountedHoursAtDate:](self, "inDiscountedHoursAtDate:", v7)))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[_DASNetworkQualityPolicy cellPredictionTimeline](self, "cellPredictionTimeline"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "valueAtDate:", v7));
    v21 = objc_msgSend(v20, "integerValue");

    if (v13)
    {
      objc_msgSend(v13, "doubleValue");
      v23 = v22 > 0.5;
    }
    else
    {
      v23 = 0;
    }
    -[_DASNetworkQualityPolicy scoreForActivity:networkQuality:interface:interfaceSubtype:pluginStatus:radioHot:linkAvailable:](self, "scoreForActivity:networkQuality:interface:interfaceSubtype:pluginStatus:radioHot:linkAvailable:", v6, v21, 2, 0, v23, 0, 0);
    v25 = v24;
    if (v24 <= 0.0
      || (v18 = 1.0, !-[_DASNetworkQualityPolicy inLowCongestionHoursAtDate:](self, "inLowCongestionHoursAtDate:", v7)))
    {
      if (v17 >= v25)
        v18 = v17;
      else
        v18 = v25;
    }
  }

  return v18;
}

- (double)scoreForActivity:(id)a3 networkQuality:(int64_t)a4 interface:(int64_t)a5 interfaceSubtype:(int64_t)a6 pluginStatus:(BOOL)a7 radioHot:(BOOL)a8 linkAvailable:(BOOL *)a9
{
  double result;

  -[_DASNetworkQualityPolicy companionScoreForActivity:networkQuality:interface:interfaceSubtype:pluginStatus:radioHot:linkAvailable:](self, "companionScoreForActivity:networkQuality:interface:interfaceSubtype:pluginStatus:radioHot:linkAvailable:", a3, a4, a5, a6, a7, a8);
  return result;
}

- (double)companionScoreForActivity:(id)a3 networkQuality:(int64_t)a4 interface:(int64_t)a5 interfaceSubtype:(int64_t)a6 pluginStatus:(BOOL)a7 radioHot:(BOOL)a8 linkAvailable:(BOOL *)a9
{
  _BOOL8 v9;
  id v15;
  double v16;
  id v17;
  double v18;

  v9 = a8;
  v15 = a3;
  if (a9)
    *a9 = a4 > 0;
  if (a4 >= 1)
    v16 = 1.0;
  else
    v16 = 0.0;
  if (a4 >= 1 && !a7)
  {
    v16 = 0.0;
    if (-[_DASNetworkQualityPolicy minimumQualityForActivity:interface:interfaceSubtype:](self, "minimumQualityForActivity:interface:interfaceSubtype:", v15, a5, a6) <= a4)
    {
      v17 = objc_msgSend(v15, "schedulingPriority");
      if ((unint64_t)v17 >= _DASSchedulingPriorityUserInitiated)
      {
        v16 = (double)a4;
      }
      else
      {
        -[_DASNetworkQualityPolicy scoreWithInexpensiveCellForActivity:networkQuality:interface:radioHot:](self, "scoreWithInexpensiveCellForActivity:networkQuality:interface:radioHot:", v15, a4, a5, v9);
        v16 = v18;
      }
    }
  }

  return v16;
}

- (_DKPredictionTimeline)wifiPredictionTimeline
{
  return (_DKPredictionTimeline *)objc_getProperty(self, a2, 64, 1);
}

- (_DKPredictionTimeline)cellPredictionTimeline
{
  return (_DKPredictionTimeline *)objc_getProperty(self, a2, 88, 1);
}

- (id)initializeTriggers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  _QWORD v11[4];
  _QWORD v12[4];
  _QWORD v13[4];
  _QWORD v14[4];
  _QWORD v15[4];
  _QWORD v16[4];
  _QWORD v17[3];

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", self->_wifiStatus));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", self->_wiredStatus));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", self->_cellStatus));
  v15[0] = CFSTR("identifier");
  v15[1] = CFSTR("predicate");
  v16[0] = CFSTR("com.apple.duetactivityscheduler.nwstatus.wifi");
  v16[1] = v10;
  v15[2] = CFSTR("deviceSet");
  v15[3] = CFSTR("mustWake");
  v16[2] = &off_10016E828;
  v16[3] = &__kCFBooleanTrue;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 4));
  v17[0] = v4;
  v13[0] = CFSTR("identifier");
  v13[1] = CFSTR("predicate");
  v14[0] = CFSTR("com.apple.duetactivityscheduler.nwstatus.wired");
  v14[1] = v9;
  v13[2] = CFSTR("deviceSet");
  v13[3] = CFSTR("mustWake");
  v14[2] = &off_10016E828;
  v14[3] = &__kCFBooleanTrue;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 4));
  v17[1] = v5;
  v11[0] = CFSTR("identifier");
  v11[1] = CFSTR("predicate");
  v12[0] = CFSTR("com.apple.duetactivityscheduler.nwstatus.cell");
  v12[1] = v3;
  v11[2] = CFSTR("deviceSet");
  v11[3] = CFSTR("mustWake");
  v12[2] = &off_10016E828;
  v12[3] = &__kCFBooleanTrue;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 4));
  v17[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 3));

  return v7;
}

- (void)registerForPredictionChanges
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[5];
  id v27;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](_CDClientContext, "userContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", self->_wifiStatus));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_CDNetworkContext predictionKey](_CDNetworkContext, "predictionKey"));
  v23 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));

  objc_storeStrong((id *)&self->_wifiPredictionTimeline, v6);
  v7 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("predictions")));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_1000E2758();

  +[_DASPredictionManager setPrediction:forKey:](_DASPredictionManager, "setPrediction:forKey:", v6, CFSTR("wifiPredictions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPLLogger sharedInstance](_DASPLLogger, "sharedInstance"));
  objc_msgSend(v8, "recordPrediction:key:valueMultiplier:", v6, CFSTR("wiFiAssociatedPrediction"), 1);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](_CDClientContext, "userContext"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", self->_cellStatus));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[_CDNetworkContext predictionKey](_CDNetworkContext, "predictionKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v11));

  objc_storeStrong((id *)&self->_cellPredictionTimeline, v12);
  v13 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("predictions")));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    sub_1000E26F4();

  +[_DASPredictionManager setPrediction:forKey:](_DASPredictionManager, "setPrediction:forKey:", v12, CFSTR("cellPredictions"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPLLogger sharedInstance](_DASPLLogger, "sharedInstance"));
  objc_msgSend(v14, "recordPrediction:key:valueMultiplier:", v12, CFSTR("cellQualityPrediction"), 1);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextPredictionQueries keyPathForWiFiQualityPrediction](_CDContextPredictionQueries, "keyPathForWiFiQualityPrediction"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", v15));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10005BEC4;
  v26[3] = &unk_10015E5E0;
  v26[4] = self;
  v27 = v15;
  v17 = v15;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualChangeRegistration localWakingRegistrationWithIdentifier:contextualPredicate:callback:](_CDContextualChangeRegistration, "localWakingRegistrationWithIdentifier:contextualPredicate:callback:", CFSTR("com.apple.duetactivityscheduler.wifiqualityprediction"), v16, v26));

  -[_CDContext registerCallback:](self->_userContext, "registerCallback:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextPredictionQueries keyPathForCellQualityPrediction](_CDContextPredictionQueries, "keyPathForCellQualityPrediction"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", v19));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10005BFD4;
  v24[3] = &unk_10015E5E0;
  v24[4] = self;
  v25 = v19;
  v21 = v19;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualChangeRegistration localWakingRegistrationWithIdentifier:contextualPredicate:callback:](_CDContextualChangeRegistration, "localWakingRegistrationWithIdentifier:contextualPredicate:callback:", CFSTR("com.apple.duetactivityscheduler.cellqualityprediction"), v20, v24));

  -[_CDContext registerCallback:](self->_userContext, "registerCallback:", v22);
}

- (_DASNetworkQualityPolicy)init
{
  _DASNetworkQualityPolicy *v2;
  _DASNetworkQualityPolicy *v3;
  NSString *policyName;
  uint64_t v5;
  _CDContextualKeyPath *wifiStatus;
  uint64_t v7;
  _DASNetworkEvaluationMonitor *networkEvaluator;
  uint64_t v9;
  _CDContext *userContext;
  uint64_t v11;
  _CDContextualKeyPath *wiredStatus;
  uint64_t v13;
  _CDContextualKeyPath *cellStatus;
  uint64_t v15;
  NSArray *triggers;
  dispatch_queue_attr_t v17;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *telephonyQueue;
  id v21;
  dispatch_source_t v22;
  OS_dispatch_source *refreshHoursTimer;
  NSObject *v24;
  _DASNetworkQualityPolicy *v25;
  NSObject *v26;
  dispatch_time_t v27;
  _QWORD handler[4];
  _DASNetworkQualityPolicy *v30;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)_DASNetworkQualityPolicy;
  v2 = -[_DASNetworkQualityPolicy init](&v31, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)CFSTR("Network Quality Policy");

    v5 = objc_claimAutoreleasedReturnValue(+[_CDNetworkContext keyPathForWiFiConnectionStatus](_CDNetworkContext, "keyPathForWiFiConnectionStatus"));
    wifiStatus = v3->_wifiStatus;
    v3->_wifiStatus = (_CDContextualKeyPath *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[_DASNetworkEvaluationMonitor sharedInstance](_DASNetworkEvaluationMonitor, "sharedInstance"));
    networkEvaluator = v3->_networkEvaluator;
    v3->_networkEvaluator = (_DASNetworkEvaluationMonitor *)v7;

    v9 = objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](_CDClientContext, "userContext"));
    userContext = v3->_userContext;
    v3->_userContext = (_CDContext *)v9;

    v11 = objc_claimAutoreleasedReturnValue(+[_CDNetworkContext keyPathForWiredConnectionStatus](_CDNetworkContext, "keyPathForWiredConnectionStatus"));
    wiredStatus = v3->_wiredStatus;
    v3->_wiredStatus = (_CDContextualKeyPath *)v11;

    v13 = objc_claimAutoreleasedReturnValue(+[_CDNetworkContext keyPathForCellConnectionStatus](_CDNetworkContext, "keyPathForCellConnectionStatus"));
    cellStatus = v3->_cellStatus;
    v3->_cellStatus = (_CDContextualKeyPath *)v13;

    v15 = objc_claimAutoreleasedReturnValue(-[_DASNetworkQualityPolicy initializeTriggers](v3, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v15;

    -[_DASNetworkQualityPolicy clearOffPeakDiscountedHours](v3, "clearOffPeakDiscountedHours");
    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = dispatch_queue_create("com.apple.dasd.networkqualitypolicy.telephony", v18);
    telephonyQueue = v3->_telephonyQueue;
    v3->_telephonyQueue = (OS_dispatch_queue *)v19;

    v21 = -[_DASNetworkQualityPolicy initializeCoreTelephonyClient](v3, "initializeCoreTelephonyClient");
    v22 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)v3->_telephonyQueue);
    refreshHoursTimer = v3->_refreshHoursTimer;
    v3->_refreshHoursTimer = (OS_dispatch_source *)v22;

    v24 = v3->_refreshHoursTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10005C2F0;
    handler[3] = &unk_10015D4E0;
    v25 = v3;
    v30 = v25;
    dispatch_source_set_event_handler(v24, handler);
    v26 = v3->_refreshHoursTimer;
    v27 = dispatch_walltime(0, 21600000000000);
    dispatch_source_set_timer(v26, v27, 0x13A52453C000uLL, 0x3B9ACA00uLL);
    dispatch_activate((dispatch_object_t)v3->_refreshHoursTimer);
    -[_DASNetworkQualityPolicy loadCTInformationWithSDM:](v25, "loadCTInformationWithSDM:", 1);

  }
  return v3;
}

- (void)clearOffPeakDiscountedHours
{
  -[_DASNetworkQualityPolicy setLowCongestionHours:](self, "setLowCongestionHours:", &__NSDictionary0__struct);
  -[_DASNetworkQualityPolicy setDiscountedHours:](self, "setDiscountedHours:", &__NSDictionary0__struct);
}

- (void)parseCTCongestionHoursDictionary:(id)a3 atDate:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _DASNetworkQualityPolicy *v15;
  id v16;
  NSObject *v17;
  double v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *i;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  BOOL v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  _BOOL4 v38;
  BOOL v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  id v46;
  void *v47;
  double v48;
  double v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  NSObject *refreshHoursTimer;
  double v66;
  dispatch_time_t v67;
  void *v68;
  _DASNetworkQualityPolicy *v69;
  void *v70;
  id v71;
  void *v72;
  id v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  id v78;
  uint64_t v79;
  id obj;
  void *v81;
  id v82;
  uint64_t v83;
  id v84;
  void *v85;
  void *v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  uint8_t buf[4];
  id v92;
  __int16 v93;
  void *v94;
  __int16 v95;
  void *v96;
  __int16 v97;
  void *v98;
  _BYTE v99[128];

  v6 = a3;
  v7 = a4;
  if (!qword_1001AB8B0)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v9 = (void *)qword_1001AB8B0;
    qword_1001AB8B0 = v8;

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ExpirationDate")));
  if (v11)
  {
    v12 = objc_alloc_init((Class)NSISO8601DateFormatter);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dateFromString:", v11));
    v14 = v13;
    if (v13)
    {
      v15 = self;
      v16 = v13;

      v17 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("carrierBundle")));
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v92 = v16;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Expiration Date is %@", buf, 0xCu);
      }

      v10 = v16;
      self = v15;
    }

  }
  objc_msgSend(v10, "timeIntervalSinceDate:", v7);
  if (v18 >= 0.0)
  {
    v68 = v10;
    v69 = self;
    v70 = v11;
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001AB8B0, "components:fromDate:", 540, v7));
    v71 = v6;
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("TimeWindows")));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v78 = objc_alloc_init((Class)NSDateFormatter);
    objc_msgSend(v78, "setDateFormat:", CFSTR("HH:mm:SS"));
    v22 = 0;
    v76 = v21;
    v73 = v7;
    v77 = v20;
    do
    {
      v75 = v22;
      v79 = (int)(v22 + objc_msgSend(v74, "weekday") - 1) % 7;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_10016F458, "objectAtIndexedSubscript:"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "objectForKeyedSubscript:", v23));

      v89 = 0u;
      v90 = 0u;
      v87 = 0u;
      v88 = 0u;
      obj = v24;
      v84 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v99, 16);
      if (v84)
      {
        v83 = *(_QWORD *)v88;
        v25 = v79 + 1;
        do
        {
          for (i = 0; i != v84; i = (char *)i + 1)
          {
            if (*(_QWORD *)v88 != v83)
              objc_enumerationMutation(obj);
            v27 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * (_QWORD)i);
            v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("WindowType")));
            v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("StartTime")));
            v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("EndTime")));
            v30 = (void *)v28;
            v31 = (void *)v29;
            if (v30)
              v32 = v29 == 0;
            else
              v32 = 1;
            v85 = v30;
            if (v32)
            {
              v33 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("carrierBundle")));
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_10016F458, "objectAtIndexedSubscript:", v79));
                *(_DWORD *)buf = 138412802;
                v92 = v34;
                v93 = 2112;
                v94 = v85;
                v95 = 2112;
                v96 = v31;
                _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Error reading times for %@ (%@-%@)", buf, 0x20u);

              }
            }
            else
            {
              v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "dateFromString:"));
              v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "dateFromString:", v31));
              v37 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("carrierBundle")));
              v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
              if (v35)
                v39 = v36 == 0;
              else
                v39 = 1;
              if (v39)
              {
                if (v38)
                {
                  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_10016F458, "objectAtIndexedSubscript:", v79));
                  *(_DWORD *)buf = 138412802;
                  v92 = v40;
                  v93 = 2112;
                  v94 = v85;
                  v95 = 2112;
                  v96 = v31;
                  _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Error parsing times for %@ (%@-%@)", buf, 0x20u);

                }
                v33 = v35;
              }
              else
              {
                if (v38)
                {
                  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_10016F458, "objectAtIndexedSubscript:", v79));
                  *(_DWORD *)buf = 138413058;
                  v92 = v86;
                  v93 = 2112;
                  v94 = v85;
                  v95 = 2112;
                  v96 = v31;
                  v97 = 2112;
                  v98 = v41;
                  _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%@ hours are %@-%@ for %@", buf, 0x2Au);

                }
                v37 = objc_msgSend(v74, "copy");
                -[NSObject setDay:](v37, "setDay:", (char *)objc_msgSend(v74, "day") + v75);
                -[NSObject setHour:](v37, "setHour:", objc_msgSend((id)qword_1001AB8B0, "component:fromDate:", 32, v35));
                -[NSObject setMinute:](v37, "setMinute:", objc_msgSend((id)qword_1001AB8B0, "component:fromDate:", 64, v35));
                -[NSObject setSecond:](v37, "setSecond:", objc_msgSend((id)qword_1001AB8B0, "component:fromDate:", 128, v35));
                v33 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001AB8B0, "dateFromComponents:", v37));

                -[NSObject setHour:](v37, "setHour:", objc_msgSend((id)qword_1001AB8B0, "component:fromDate:", 32, v36));
                -[NSObject setMinute:](v37, "setMinute:", objc_msgSend((id)qword_1001AB8B0, "component:fromDate:", 64, v36));
                -[NSObject setSecond:](v37, "setSecond:", objc_msgSend((id)qword_1001AB8B0, "component:fromDate:", 128, v36));
                v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001AB8B0, "dateFromComponents:", v37));

                objc_msgSend(v42, "timeIntervalSinceDate:", v33);
                if (v43 >= 0.0)
                {
                  v36 = v42;
                }
                else
                {
                  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "dateByAddingTimeInterval:", 86400.0));

                }
                objc_msgSend(v36, "timeIntervalSinceDate:", v33);
                v45 = round(v44 * 0.5);
                if (v45 > 10800.0)
                  v45 = 10800.0;
                v46 = -[NSObject dateByAddingTimeInterval:](v33, "dateByAddingTimeInterval:", (double)arc4random_uniform(fmax(v45, 0.0)));
                v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
                objc_msgSend(v7, "timeIntervalSinceDate:", v36);
                v49 = v48;
                v50 = objc_alloc((Class)NSDateInterval);
                v51 = v50;
                v81 = v47;
                if (v49 <= 0.0)
                {
                  v82 = objc_msgSend(v50, "initWithStartDate:endDate:", v47, v36);
                }
                else
                {
                  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "dateByAddingTimeInterval:", 604800.0));
                  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "dateByAddingTimeInterval:", 604800.0));
                  v82 = objc_msgSend(v51, "initWithStartDate:endDate:", v52, v53);

                  v47 = v81;
                  v21 = v76;
                }
                if ((objc_msgSend(v86, "isEqualToString:", CFSTR("OffPeak")) & 1) != 0
                  || objc_msgSend(v86, "isEqualToString:", CFSTR("DiscountedRateAndOffPeak")))
                {
                  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v25));
                  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "objectForKeyedSubscript:", v54));

                  if (!v55)
                    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
                  objc_msgSend(v55, "addObject:", v82);
                  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v25));
                  objc_msgSend(v77, "setObject:forKeyedSubscript:", v55, v56);

                  v21 = v76;
                  v47 = v81;
                }
                if ((objc_msgSend(v86, "isEqualToString:", CFSTR("DiscountedRate")) & 1) != 0
                  || objc_msgSend(v86, "isEqualToString:", CFSTR("DiscountedRateAndOffPeak")))
                {
                  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v25));
                  v58 = v21;
                  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", v57));

                  if (!v59)
                    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
                  objc_msgSend(v59, "addObject:", v82);
                  v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v25));
                  objc_msgSend(v58, "setObject:forKeyedSubscript:", v59, v60);

                  v21 = v58;
                  v47 = v81;
                }

                v7 = v73;
                v20 = v77;
              }

            }
          }
          v84 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v99, 16);
        }
        while (v84);
      }

      v22 = v75 + 1;
    }
    while (v75 != 6);
    v61 = objc_msgSend(v20, "copy");
    -[_DASNetworkQualityPolicy setLowCongestionHours:](v69, "setLowCongestionHours:", v61);

    v62 = objc_msgSend(v21, "copy");
    -[_DASNetworkQualityPolicy setDiscountedHours:](v69, "setDiscountedHours:", v62);

    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dateByAddingTimeInterval:", 21600.0));
    v10 = v68;
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "earlierDate:", v63));

    refreshHoursTimer = v69->_refreshHoursTimer;
    objc_msgSend(v64, "timeIntervalSinceDate:", v7);
    v67 = dispatch_walltime(0, (uint64_t)(v66 * 1000000000.0 + 1.0e10));
    dispatch_source_set_timer(refreshHoursTimer, v67, 0x13A52453C000uLL, 0x2540BE400uLL);

    v11 = v70;
    v6 = v71;
  }
  else
  {
    v19 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("carrierBundle")));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v92 = v10;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Expiration Date in the past (%@). Exiting", buf, 0xCu);
    }

    -[_DASNetworkQualityPolicy clearOffPeakDiscountedHours](self, "clearOffPeakDiscountedHours");
  }

}

- (id)initializeCoreTelephonyClient
{
  CoreTelephonyClient *coreTelephonyClient;
  CoreTelephonyClient *v4;
  CoreTelephonyClient *v5;

  coreTelephonyClient = self->_coreTelephonyClient;
  if (!coreTelephonyClient)
  {
    v4 = (CoreTelephonyClient *)objc_msgSend(objc_alloc((Class)CoreTelephonyClient), "initWithQueue:", self->_telephonyQueue);
    v5 = self->_coreTelephonyClient;
    self->_coreTelephonyClient = v4;

    -[CoreTelephonyClient setDelegate:](self->_coreTelephonyClient, "setDelegate:", self);
    coreTelephonyClient = self->_coreTelephonyClient;
  }
  return coreTelephonyClient;
}

- (void)loadCTInformationWithSDM:(BOOL)a3
{
  CoreTelephonyClient *coreTelephonyClient;
  _QWORD v4[5];
  BOOL v5;

  coreTelephonyClient = self->_coreTelephonyClient;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005CEE4;
  v4[3] = &unk_10015E630;
  v4[4] = self;
  v5 = a3;
  -[CoreTelephonyClient getPreferredDataSubscriptionContext:](coreTelephonyClient, "getPreferredDataSubscriptionContext:", v4);
}

- (void)updatePNWStatus:(BOOL)a3
{
  CoreTelephonyClient *coreTelephonyClient;
  _QWORD v5[4];
  id v6;
  id location;

  if (a3)
  {
    objc_initWeak(&location, self);
    coreTelephonyClient = self->_coreTelephonyClient;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10005D35C;
    v5[3] = &unk_10015E658;
    objc_copyWeak(&v6, &location);
    -[CoreTelephonyClient isPrivateNetworkSIM:completion:](coreTelephonyClient, "isPrivateNetworkSIM:completion:", 0, v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  else
  {
    self->_privateNetworkCellConnection = 0;
  }
}

- (BOOL)inLowCongestionHoursAtDate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  BOOL v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v4 = a3;
  v5 = (void *)qword_1001AB8B0;
  if (!qword_1001AB8B0)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v7 = (void *)qword_1001AB8B0;
    qword_1001AB8B0 = v6;

    v5 = (void *)qword_1001AB8B0;
  }
  v8 = objc_msgSend(v5, "component:fromDate:", 512, v4);
  v9 = 0;
  v10 = (uint64_t)v8 - 1;
  v11 = 1;
  do
  {
    v12 = v11;
    v10 = (v9 + v10 + 7) % 7;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[_DASNetworkQualityPolicy lowCongestionHours](self, "lowCongestionHours"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v10 + 1));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v14));

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v16 = v15;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v19)
            objc_enumerationMutation(v16);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i), "containsDate:", v4) & 1) != 0)
          {

            v21 = 1;
            goto LABEL_15;
          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v18)
          continue;
        break;
      }
    }

    v11 = 0;
    v21 = 0;
    v9 = -1;
  }
  while ((v12 & 1) != 0);
LABEL_15:

  return v21;
}

- (BOOL)inDiscountedHoursAtDate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  BOOL v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v4 = a3;
  v5 = (void *)qword_1001AB8B0;
  if (!qword_1001AB8B0)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v7 = (void *)qword_1001AB8B0;
    qword_1001AB8B0 = v6;

    v5 = (void *)qword_1001AB8B0;
  }
  v8 = objc_msgSend(v5, "component:fromDate:", 512, v4);
  v9 = 0;
  v10 = (uint64_t)v8 - 1;
  v11 = 1;
  do
  {
    v12 = v11;
    v10 = (v9 + v10 + 7) % 7;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[_DASNetworkQualityPolicy discountedHours](self, "discountedHours"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v10 + 1));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v14));

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v16 = v15;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v19)
            objc_enumerationMutation(v16);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i), "containsDate:", v4) & 1) != 0)
          {

            v21 = 1;
            goto LABEL_15;
          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v18)
          continue;
        break;
      }
    }

    v11 = 0;
    v21 = 0;
    v9 = -1;
  }
  while ((v12 & 1) != 0);
LABEL_15:

  return v21;
}

- (BOOL)shouldLogScoreToPowerLog
{
  return 1;
}

+ (id)policyInstance
{
  if (qword_1001AB8B8 != -1)
    dispatch_once(&qword_1001AB8B8, &stru_10015E678);
  return (id)qword_1001AB8C0;
}

+ (int64_t)currentNetworkQualityWithContext:(id)a3 interface:(int64_t *)a4
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;

  v5 = a3;
  v6 = (uint64_t)+[_CDNetworkContext wiredQuality:](_CDNetworkContext, "wiredQuality:", v5);
  if (v6 < 1)
  {
    v9 = +[_CDNetworkContext wifiQuality:](_CDNetworkContext, "wifiQuality:", v5);
    if (v9)
    {
      v7 = v9;
      if (a4)
      {
        v8 = +[_CDNetworkContext wifiInterfaceClass:](_CDNetworkContext, "wifiInterfaceClass:", v5);
        goto LABEL_7;
      }
    }
    else
    {
      if (a4)
        *a4 = (int64_t)+[_CDNetworkContext cellInterfaceClass:](_CDNetworkContext, "cellInterfaceClass:", v5);
      v7 = +[_CDNetworkContext cellQuality:](_CDNetworkContext, "cellQuality:", v5);
    }
  }
  else
  {
    v7 = (id)v6;
    if (a4)
    {
      v8 = +[_CDNetworkContext wiredInterfaceClass:](_CDNetworkContext, "wiredInterfaceClass:", v5);
LABEL_7:
      *a4 = (int64_t)v8;
    }
  }

  return (int64_t)v7;
}

- (void)updateSystemConstraintsWithContext:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  id v9;

  v3 = a3;
  v4 = (uint64_t)+[_CDNetworkContext wiredQuality:](_CDNetworkContext, "wiredQuality:", v3);
  v5 = (uint64_t)+[_CDNetworkContext wifiQuality:](_CDNetworkContext, "wifiQuality:", v3);
  v6 = (uint64_t)+[_CDNetworkContext cellQuality:](_CDNetworkContext, "cellQuality:", v3);

  v9 = (id)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](_DASDaemon, "sharedInstance"));
  if (v5 <= 20 && v4 < 21)
  {
    objc_msgSend(v9, "addConstraint:forSchedulingPriority:", 16, _DASSchedulingPriorityMaintenance);
    objc_msgSend(v9, "addConstraint:forSchedulingPriority:", 16, _DASSchedulingPriorityUtility);
    v8 = _DASSchedulingPriorityMaintenance;
    if (v6 < 21)
    {
      objc_msgSend(v9, "addConstraint:forSchedulingPriority:", 32, _DASSchedulingPriorityMaintenance);
      objc_msgSend(v9, "addConstraint:forSchedulingPriority:", 32, _DASSchedulingPriorityUtility);
      goto LABEL_9;
    }
  }
  else
  {
    objc_msgSend(v9, "removeConstraint:forSchedulingPriority:", 16, _DASSchedulingPriorityMaintenance);
    objc_msgSend(v9, "removeConstraint:forSchedulingPriority:", 16, _DASSchedulingPriorityUtility);
    v8 = _DASSchedulingPriorityMaintenance;
  }
  objc_msgSend(v9, "removeConstraint:forSchedulingPriority:", 32, v8);
  objc_msgSend(v9, "removeConstraint:forSchedulingPriority:", 32, _DASSchedulingPriorityUtility);
LABEL_9:

}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 v11;
  BOOL v12;
  uint64_t v13;
  BOOL v14;
  void *v15;
  BOOL v16;
  unsigned int v17;
  char v18;
  char v19;

  v6 = a3;
  v7 = a4;
  v8 = (uint64_t)+[_CDNetworkContext wiredQuality:](_CDNetworkContext, "wiredQuality:", v7);
  v9 = (uint64_t)+[_CDNetworkContext wifiQuality:](_CDNetworkContext, "wifiQuality:", v7);
  v10 = (uint64_t)+[_CDNetworkContext cellQuality:](_CDNetworkContext, "cellQuality:", v7);
  v11 = +[_CDNetworkContext cellInterfaceUp:](_CDNetworkContext, "cellInterfaceUp:", v7);
  v12 = v9 > 0 || v10 < 1;
  if (v12 || (v13 = 1, !byte_1001AB8C8) && byte_1001AB8C9)
    v13 = 0;
  -[_DASNetworkQualityPolicy updatePNWStatus:](self, "updatePNWStatus:", v13);
  byte_1001AB8C9 = v10 > 0;
  byte_1001AB8C8 = v9 > 0;
  -[_DASNetworkQualityPolicy updateSystemConstraintsWithContext:](self, "updateSystemConstraintsWithContext:", v7);
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.duetactivityscheduler.nwstatus.wired")))
  {
    v14 = v8 < 21;
LABEL_14:
    v16 = v14;
    goto LABEL_27;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.duetactivityscheduler.nwstatus.wifi")))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPLLogger sharedInstance](_DASPLLogger, "sharedInstance"));
    objc_msgSend(v15, "reportNewStatus:forTrigger:", v9 > 20, off_1001AB2E0);

    v14 = v8 > 20 || v9 < 21;
    goto LABEL_14;
  }
  v17 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.duetactivityscheduler.nwstatus.cell"));
  v18 = v11 ^ 1;
  if (v10 < 21)
    v18 = 1;
  if (v9 > 20)
    v18 = 1;
  if (v8 <= 20)
    v19 = v18;
  else
    v19 = 1;
  if (v17)
    v16 = v19;
  else
    v16 = 0;
LABEL_27:

  return v16;
}

- (int64_t)companionMinimumQualityForActivity:(id)a3 interface:(int64_t)a4
{
  id v5;
  id v6;
  unsigned __int8 v7;
  int64_t v8;
  void *v9;
  double v10;
  double v11;
  id v12;
  id v13;
  void *v14;
  unsigned __int8 v15;
  id v16;
  unsigned __int8 v18;

  v5 = a3;
  v6 = objc_msgSend(v5, "schedulingPriority");
  if ((unint64_t)v6 >= _DASSchedulingPriorityUserInitiated)
  {
    v8 = 20;
    goto LABEL_11;
  }
  v7 = objc_msgSend(v5, "deferred");
  v8 = 20;
  if (a4 != 3 && (v7 & 1) == 0)
  {
    if (a4 == 1)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "startBefore"));
      objc_msgSend(v9, "timeIntervalSinceNow");
      v11 = v10;

      if (v11 < 0.0)
      {
LABEL_9:
        v8 = 50;
        goto LABEL_11;
      }
    }
    v12 = objc_msgSend(v5, "transferSize");
    v13 = objc_msgSend(v5, "schedulingPriority");
    if ((unint64_t)v13 > _DASSchedulingPriorityMaintenance
      || (v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "launchReason")),
          v15 = objc_msgSend(v14, "isEqualToString:", _DASLaunchReasonBackgroundRemoteNotification),
          v14,
          (v15 & 1) != 0))
    {
LABEL_8:
      v16 = objc_msgSend(v5, "schedulingPriority");
      if ((unint64_t)v16 > _DASSchedulingPriorityUtility
        || (a4 != 2 || (unint64_t)v12 < _DASActivityTransferSizeLarge)
        && (a4 != 1 || (unint64_t)v12 < _DASActivityTransferSizeVeryLarge))
      {
        goto LABEL_9;
      }
LABEL_21:
      v8 = 100;
      goto LABEL_11;
    }
    v18 = objc_msgSend(v5, "noTransferSizeSpecified");
    v8 = 100;
    if (a4 != 2 && (v18 & 1) == 0)
    {
      if (a4 == 1 && (unint64_t)v12 > _DASActivityTransferSizeLarge)
        goto LABEL_21;
      goto LABEL_8;
    }
  }
LABEL_11:

  return v8;
}

- (int)transferSizeIndex:(unint64_t)a3
{
  if (_DASActivityTransferSizeVerySmall >= a3)
    return 0;
  if (_DASActivityTransferSizeSmall >= a3)
    return 1;
  if (_DASActivityTransferSizeModerate >= a3)
    return 2;
  if (_DASActivityTransferSizeLarge >= a3)
    return 3;
  if (_DASActivityTransferSizeVeryLarge >= a3)
    return 4;
  return 5;
}

- (double)scoreWithInexpensiveCellForActivity:(id)a3 networkQuality:(int64_t)a4 interface:(int64_t)a5 radioHot:(BOOL)a6
{
  double result;
  _BOOL4 v7;
  unsigned int v11;
  signed int v12;
  _BOOL4 v13;
  char *v14;
  double *v15;

  result = 0.0;
  if (a4 >= 50)
  {
    v7 = a6;
    v11 = -[_DASNetworkQualityPolicy transferSizeIndex:](self, "transferSizeIndex:", objc_msgSend(a3, "transferSize", 0.0));
    v12 = v11;
    if (a5 == 1)
    {
      v13 = a4 != 100;
      v14 = (char *)&unk_10011D110 + 16 * (int)v11;
    }
    else
    {
      if (+[_DASNetworkEvaluationMonitor inexpensivePathAvailable](_DASNetworkEvaluationMonitor, "inexpensivePathAvailable"))
      {
        v15 = (double *)((char *)&unk_10011D230
                       + 64 * (uint64_t)v12
                       + 32
                       * -[_DASNetworkQualityPolicy smartDataModeEnabled](self, "smartDataModeEnabled")
                       + 16 * v7
                       + 8 * (a4 != 100));
        return *v15;
      }
      v13 = a4 != 100;
      v14 = (char *)&unk_10011D170 + 32 * v12 + 16 * v7;
    }
    v15 = (double *)&v14[8 * v13];
    return *v15;
  }
  return result;
}

- (int64_t)minimumQualityForActivity:(id)a3 interface:(int64_t)a4 interfaceSubtype:(int64_t)a5
{
  return -[_DASNetworkQualityPolicy companionMinimumQualityForActivity:interface:](self, "companionMinimumQualityForActivity:interface:", a3, a4, a5);
}

- (BOOL)isiCloudKeychainActivity:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  unsigned __int8 v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = a3;
  if (objc_msgSend(v3, "requiresNetwork"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "relatedApplications", 0));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "lowercaseString"));
          if ((objc_msgSend(v9, "containsString:", CFSTR("securityd")) & 1) != 0)
          {

LABEL_15:
            v11 = 1;
            goto LABEL_16;
          }
          v10 = objc_msgSend(v9, "containsString:", CFSTR("trustedpeershelper"));

          if ((v10 & 1) != 0)
            goto LABEL_15;
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        v11 = 0;
        if (v6)
          continue;
        break;
      }
    }
    else
    {
      v11 = 0;
    }
LABEL_16:

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)unconstrainedNetworkAvailableForActivity:(id)a3 withContext:(id)a4 withRationale:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unsigned __int8 v12;
  const __CFString *v13;
  NSObject *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  BOOL v20;
  NSObject *v21;
  void *v22;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  NSObject *v33;
  int v34;
  double v35;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[_DASNetworkEvaluationMonitor sharedInstance](_DASNetworkEvaluationMonitor, "sharedInstance"));
  v12 = objc_msgSend(v11, "isUnconstrainedPathAvailableForActivity:", v8);

  if ((v12 & 1) != 0)
    goto LABEL_19;
  if (objc_msgSend(v8, "requiresUnconstrainedNetworking"))
  {
    v13 = CFSTR("requiresUnconstrainedNetworking == YES");
LABEL_13:
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v13));
    objc_msgSend(v10, "addRationaleWithCondition:", v19);

LABEL_14:
    v20 = 0;
    goto LABEL_20;
  }
  if (-[_DASNetworkQualityPolicy isiCloudKeychainActivity:](self, "isiCloudKeychainActivity:", v8))
  {
    v14 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("lowDataMode")));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v34 = 67109120;
      LODWORD(v35) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "iCloudKeychainActivity=%u", (uint8_t *)&v34, 8u);
    }

    v15 = CFSTR("isiCloudKeychainActivity == YES");
LABEL_18:
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v15));
    objc_msgSend(v10, "addRationaleWithCondition:", v22);

LABEL_19:
    v20 = 1;
    goto LABEL_20;
  }
  if (+[_DASPhotosPolicy isiCPLActivity:](_DASPhotosPolicy, "isiCPLActivity:", v8))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPhotosPolicy keyPathForPhotosBudgetOverride](_DASPhotosPolicy, "keyPathForPhotosBudgetOverride"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v16));
    v18 = objc_msgSend(v17, "unsignedIntegerValue");

    if ((v18 & 0x10) != 0)
    {
      v21 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("lowDataMode")));
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v34) = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "shouldOverrideLDM == YES", (uint8_t *)&v34, 2u);
      }

      v15 = CFSTR("shouldOverrideLDM == YES");
      goto LABEL_18;
    }
  }
  if ((objc_msgSend(v8, "requestsApplicationLaunch") & 1) != 0
    || objc_msgSend(v8, "requestsExtensionLaunch"))
  {
    v13 = CFSTR("requestsLaunch == YES");
    goto LABEL_13;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startBefore"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startAfter"));
  objc_msgSend(v24, "timeIntervalSinceDate:", v25);
  v27 = v26;

  if (v27 < 1.0)
    v27 = 1.0;
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startAfter"));
  objc_msgSend(v28, "timeIntervalSinceNow");
  v30 = -v29;

  v31 = v30 / v27;
  if (v31 < 0.9)
    goto LABEL_14;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("isNearingDeadline == YES")));
  objc_msgSend(v10, "addRationaleWithCondition:", v32);

  v33 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("lowDataMode")));
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    v34 = 134217984;
    v35 = v31 * 100.0;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "isNearingDeadline == YES (%2.0f%% complete)", (uint8_t *)&v34, 0xCu);
  }

  v20 = 1;
  +[_DASMetricRecorder incrementOccurrencesForKey:byCount:](_DASMetricRecorder, "incrementOccurrencesForKey:byCount:", CFSTR("com.apple.dasd.ldm.nearingDeadline"), 1);
LABEL_20:

  return v20;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  _DASPolicyResponseRationale *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  uint64_t v29;
  void *v30;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  unsigned __int8 v41;
  id v42;
  double v43;
  id v44;
  double v45;
  uint64_t v46;
  void *v47;
  char v48;
  char v49;
  _QWORD block[5];
  id v51;

  v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005EAF8;
  block[3] = &unk_10015D558;
  block[4] = self;
  v7 = a4;
  v51 = v7;
  if (qword_1001AB8D0 != -1)
    dispatch_once(&qword_1001AB8D0, block);
  v8 = -[_DASPolicyResponseRationale initWithPolicyName:]([_DASPolicyResponseRationale alloc], "initWithPolicyName:", self->_policyName);
  v9 = objc_autoreleasePoolPush();
  v10 = -[_DASNetworkEvaluationMonitor isNetworkPathAvailableForActivity:](self->_networkEvaluator, "isNetworkPathAvailableForActivity:", v6);
  objc_autoreleasePoolPop(v9);
  if ((v10 & 1) == 0)
  {
    -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:](v8, "addRationaleForCondition:withRequiredValue:withCurrentValue:", CFSTR("networkPathAvailability"), 1.0, 0.0);
    -[_DASPolicyResponseRationale setResponseOptions:](v8, "setResponseOptions:", (unint64_t)-[_DASPolicyResponseRationale responseOptions](v8, "responseOptions") | 1);
LABEL_11:
    v22 = (double)0x384uLL;
    v23 = 100;
    goto LABEL_23;
  }
  v11 = objc_msgSend(v6, "schedulingPriority");
  if ((unint64_t)v11 < _DASSchedulingPriorityUtility
    && (objc_msgSend(v6, "deferred") & 1) == 0
    && !-[_DASNetworkQualityPolicy unconstrainedNetworkAvailableForActivity:withContext:withRationale:](self, "unconstrainedNetworkAvailableForActivity:withContext:withRationale:", v6, v7, v8))
  {
    -[_DASPolicyResponseRationale setResponseOptions:](v8, "setResponseOptions:", (unint64_t)-[_DASPolicyResponseRationale responseOptions](v8, "responseOptions") | 2);
    -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:](v8, "addRationaleForCondition:withRequiredValue:withCurrentValue:", CFSTR("unconstrainedNetworkAvailable"), 1.0, 0.0);
    goto LABEL_11;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", _DASCTSMailFetchKey));
  if ((objc_msgSend(v13, "BOOLValue") & 1) == 0)
  {

LABEL_13:
    v24 = objc_msgSend(v6, "schedulingPriority");
    if ((unint64_t)v24 < _DASSchedulingPriorityUserInitiated)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "launchReason"));
      if ((objc_msgSend(v25, "isEqualToString:", _DASLaunchReasonBackgroundRemoteNotification) & 1) != 0)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "submitDate"));
        objc_msgSend(v26, "timeIntervalSinceNow");
        v28 = v27;

        if (v28 < 0.0)
          v28 = -v28;

        if (v28 < 60.0)
          goto LABEL_18;
      }
      else
      {

      }
      if ((uint64_t)+[_CDNetworkContext wiredQuality:](_CDNetworkContext, "wiredQuality:", v7) >= 1)
      {
        v22 = 10800.0;
        goto LABEL_22;
      }
      v32 = +[_CDNetworkContext wifiQuality:](_CDNetworkContext, "wifiQuality:", v7);
      v33 = -[_DASNetworkQualityPolicy minimumQualityForActivity:interface:interfaceSubtype:](self, "minimumQualityForActivity:interface:interfaceSubtype:", v6, 1, 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](_CDContextQueries, "keyPathForPluginStatus"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v34));
      v36 = objc_msgSend(v35, "BOOLValue");

      v49 = 1;
      -[_DASNetworkQualityPolicy scoreForActivity:networkQuality:interface:interfaceSubtype:pluginStatus:radioHot:linkAvailable:](self, "scoreForActivity:networkQuality:interface:interfaceSubtype:pluginStatus:radioHot:linkAvailable:", v6, v32, 1, 0, v36, 0, &v49);
      v38 = v37;
      -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:](v8, "addRationaleForCondition:withRequiredValue:withCurrentValue:", CFSTR("wifiQuality"), (double)v33, (double)(uint64_t)v32);
      if (v38 > 0.0)
        goto LABEL_27;
      if (!+[_DASPhotosPolicy isiCPLActivity:](_DASPhotosPolicy, "isiCPLActivity:", v6)
        || (v39 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPhotosPolicy keyPathForPhotosBudgetOverride](_DASPhotosPolicy, "keyPathForPhotosBudgetOverride")), v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v39)), v41 = objc_msgSend(v40, "unsignedIntegerValue"), v40, v39, (v41 & 2) == 0))
      {
        v42 = +[_CDNetworkContext cellQuality:](_CDNetworkContext, "cellQuality:", v7);
        -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:](v8, "addRationaleForCondition:withRequiredValue:withCurrentValue:", CFSTR("cellQuality"), (double)-[_DASNetworkQualityPolicy minimumQualityForActivity:interface:interfaceSubtype:](self, "minimumQualityForActivity:interface:interfaceSubtype:", v6, 2, 0), (double)(uint64_t)v42);
        v48 = 1;
        -[_DASNetworkQualityPolicy scoreForActivity:networkQuality:interface:interfaceSubtype:pluginStatus:radioHot:linkAvailable:](self, "scoreForActivity:networkQuality:interface:interfaceSubtype:pluginStatus:radioHot:linkAvailable:", v6, v42, 2, 0, v36, +[_CDNetworkContext cellInterfaceUp:](_CDNetworkContext, "cellInterfaceUp:", v7), &v48);
        if (v43 <= 0.0)
        {
          if (v49 || v48 && (objc_msgSend(v6, "requiresInexpensiveNetworking") & 1) == 0)
            v46 = 4;
          else
            v46 = 8;
          -[_DASPolicyResponseRationale setResponseOptions:](v8, "setResponseOptions:", -[_DASPolicyResponseRationale responseOptions](v8, "responseOptions") | v46);
          v22 = (double)0x384uLL;
          v23 = 33;
          goto LABEL_23;
        }
        v38 = v43;
        if (objc_msgSend(v6, "uploadSize"))
        {
          v44 = +[_CDNetworkContext cellUploadCost:](_CDNetworkContext, "cellUploadCost:", v7);
          if (v44 == (id)2)
          {
            v45 = 0.5;
          }
          else
          {
            if (v44 != (id)3)
              goto LABEL_27;
            v45 = 0.1;
          }
          v38 = v38 * v45;
          v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("powerCost == %ld"), v44));
          -[_DASPolicyResponseRationale addRationaleWithCondition:](v8, "addRationaleWithCondition:", v47);

        }
LABEL_27:
        v29 = objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithScore:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithScore:validityDuration:rationale:", v8, v38, (double)0x384uLL));
        goto LABEL_24;
      }
      -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:](v8, "addRationaleForCondition:withRequiredValue:withCurrentValue:", CFSTR("photosOverrideEnergy"), 1.0, 1.0);
    }
LABEL_18:
    v22 = (double)0x384uLL;
LABEL_22:
    v23 = 0;
    goto LABEL_23;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startBefore"));
  objc_msgSend(v14, "timeIntervalSinceDate:", v15);
  v17 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startBefore"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startAfter"));
  objc_msgSend(v18, "timeIntervalSinceDate:", v19);
  v21 = v20;

  if (v17 <= v21)
    goto LABEL_13;
  v22 = (double)0x384uLL;
  v23 = 67;
LABEL_23:
  v29 = objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", v23, v8, v22));
LABEL_24:
  v30 = (void *)v29;

  return v30;
}

- (void)preferredDataSimChanged:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("carrierBundle")));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
    v7 = 138412290;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Preferred data SIM changed for context: %@", (uint8_t *)&v7, 0xCu);

  }
  -[_DASNetworkQualityPolicy loadCTInformationWithSDM:](self, "loadCTInformationWithSDM:", 1);

}

- (void)smartDataModeChanged:(id)a3 userEnabled:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;

  v4 = a4;
  self->_smartDataModeEnabled = a4;
  v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("carrierBundle")));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
    v7 = 138412290;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "SDM changed to %@", (uint8_t *)&v7, 0xCu);

  }
}

- (BOOL)privateNetworkCellConnection
{
  return self->_privateNetworkCellConnection;
}

- (void)setPrivateNetworkCellConnection:(BOOL)a3
{
  self->_privateNetworkCellConnection = a3;
}

- (BOOL)smartDataModeEnabled
{
  return self->_smartDataModeEnabled;
}

- (void)setSmartDataModeEnabled:(BOOL)a3
{
  self->_smartDataModeEnabled = a3;
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

- (_CDContextualKeyPath)wifiStatus
{
  return self->_wifiStatus;
}

- (void)setWifiStatus:(id)a3
{
  objc_storeStrong((id *)&self->_wifiStatus, a3);
}

- (void)setTriggers:(id)a3
{
  objc_storeStrong((id *)&self->_triggers, a3);
}

- (_DASNetworkEvaluationMonitor)networkEvaluator
{
  return self->_networkEvaluator;
}

- (void)setNetworkEvaluator:(id)a3
{
  objc_storeStrong((id *)&self->_networkEvaluator, a3);
}

- (_CDContext)userContext
{
  return self->_userContext;
}

- (void)setUserContext:(id)a3
{
  objc_storeStrong((id *)&self->_userContext, a3);
}

- (void)setWifiPredictionTimeline:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (_CDContextualKeyPath)wiredStatus
{
  return self->_wiredStatus;
}

- (void)setWiredStatus:(id)a3
{
  objc_storeStrong((id *)&self->_wiredStatus, a3);
}

- (_CDContextualKeyPath)cellStatus
{
  return self->_cellStatus;
}

- (void)setCellStatus:(id)a3
{
  objc_storeStrong((id *)&self->_cellStatus, a3);
}

- (void)setCellPredictionTimeline:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (OS_dispatch_source)refreshHoursTimer
{
  return self->_refreshHoursTimer;
}

- (void)setRefreshHoursTimer:(id)a3
{
  objc_storeStrong((id *)&self->_refreshHoursTimer, a3);
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void)setCoreTelephonyClient:(id)a3
{
  objc_storeStrong((id *)&self->_coreTelephonyClient, a3);
}

- (OS_dispatch_queue)telephonyQueue
{
  return self->_telephonyQueue;
}

- (void)setTelephonyQueue:(id)a3
{
  objc_storeStrong((id *)&self->_telephonyQueue, a3);
}

- (NSDictionary)lowCongestionHours
{
  return (NSDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (void)setLowCongestionHours:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSDictionary)discountedHours
{
  return (NSDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)setDiscountedHours:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discountedHours, 0);
  objc_storeStrong((id *)&self->_lowCongestionHours, 0);
  objc_storeStrong((id *)&self->_telephonyQueue, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_refreshHoursTimer, 0);
  objc_storeStrong((id *)&self->_cellPredictionTimeline, 0);
  objc_storeStrong((id *)&self->_cellStatus, 0);
  objc_storeStrong((id *)&self->_wiredStatus, 0);
  objc_storeStrong((id *)&self->_wifiPredictionTimeline, 0);
  objc_storeStrong((id *)&self->_userContext, 0);
  objc_storeStrong((id *)&self->_networkEvaluator, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_wifiStatus, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);
  objc_storeStrong((id *)&self->_policyName, 0);
}

@end
