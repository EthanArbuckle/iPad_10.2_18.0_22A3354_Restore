@implementation OSIntelligenceAnalyticsManager

+ (id)logWithCategory:(id)a3
{
  id v3;
  os_log_t v4;

  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("inactivity.%@"), a3)));
  v4 = os_log_create("com.apple.osintelligence", (const char *)objc_msgSend(v3, "UTF8String"));

  return v4;
}

+ (id)log
{
  return objc_msgSend(a1, "logWithCategory:", CFSTR("inactivity.analytics"));
}

+ (id)currentBootSessionUUID
{
  void *v2;
  void *v3;
  size_t size;

  size = 0;
  sysctlbyname("kern.bootsessionuuid", 0, &size, 0, 0);
  v2 = malloc_type_malloc(size, 0x71284021uLL);
  sysctlbyname("kern.bootsessionuuid", v2, &size, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v2));
  free(v2);
  return v3;
}

- (OSIntelligenceAnalyticsManager)initWithTrialClient:(id)a3 withNamespace:(id)a4
{
  id v7;
  id v8;
  OSIntelligenceAnalyticsManager *v9;
  NSUserDefaults *v10;
  NSUserDefaults *defaults;
  dispatch_queue_attr_t v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *queue;
  OSIAmbientLightMonitor *v16;
  OSIAmbientLightMonitor *lightMonitor;
  OSIAlarmMonitor *v18;
  OSIAlarmMonitor *alarmMonitor;
  OSIMotionMonitor *v20;
  OSIMotionMonitor *motionMonitor;
  void *v22;
  void *v23;
  char v24;
  NSObject *v25;
  OSIntelligenceAnalyticsManager *v26;
  dispatch_queue_global_t global_queue;
  NSObject *v28;
  OSIntelligenceAnalyticsManager *v29;
  _QWORD v31[4];
  OSIntelligenceAnalyticsManager *v32;
  int v33;
  _QWORD handler[4];
  OSIntelligenceAnalyticsManager *v35;
  int out_token;
  _QWORD block[4];
  OSIntelligenceAnalyticsManager *v38;
  char v39;
  objc_super v40;

  v7 = a3;
  v8 = a4;
  v40.receiver = self;
  v40.super_class = (Class)OSIntelligenceAnalyticsManager;
  v9 = -[OSIntelligenceAnalyticsManager init](&v40, "init");
  if (v9)
  {
    v10 = (NSUserDefaults *)objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.powerd.smartpowernap"));
    defaults = v9->_defaults;
    v9->_defaults = v10;

    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = dispatch_queue_create("com.apple.SPN.queue", v13);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v14;

    v16 = objc_alloc_init(OSIAmbientLightMonitor);
    lightMonitor = v9->_lightMonitor;
    v9->_lightMonitor = v16;

    v18 = objc_alloc_init(OSIAlarmMonitor);
    alarmMonitor = v9->_alarmMonitor;
    v9->_alarmMonitor = v18;

    v20 = objc_alloc_init(OSIMotionMonitor);
    motionMonitor = v9->_motionMonitor;
    v9->_motionMonitor = v20;

    objc_storeStrong((id *)&v9->_trialClient, a3);
    objc_storeStrong((id *)&v9->_trialNamespace, a4);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults stringForKey:](v9->_defaults, "stringForKey:", CFSTR("lastBootUUID")));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceAnalyticsManager currentBootSessionUUID](OSIntelligenceAnalyticsManager, "currentBootSessionUUID"));
    -[NSUserDefaults setObject:forKey:](v9->_defaults, "setObject:forKey:", v23, CFSTR("lastBootUUID"));
    v24 = objc_msgSend(v23, "isEqualToString:", v22) ^ 1;
    v25 = objc_claimAutoreleasedReturnValue(-[OSIntelligenceAnalyticsManager queue](v9, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001E8E8;
    block[3] = &unk_100060F08;
    v26 = v9;
    v38 = v26;
    v39 = v24;
    dispatch_sync(v25, block);

    out_token = 0;
    global_queue = dispatch_get_global_queue(-32768, 0);
    v28 = objc_claimAutoreleasedReturnValue(global_queue);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10001EB80;
    handler[3] = &unk_100060800;
    v29 = v26;
    v35 = v29;
    notify_register_dispatch("com.apple.powerd.smartpowernap", &out_token, v28, handler);

    v33 = 0;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10001ECC8;
    v31[3] = &unk_100060800;
    v32 = v29;
    notify_register_dispatch("com.apple.powerd.smartpowernap.interruption", &v33, v28, v31);

  }
  return v9;
}

+ (id)sharedInstanceWithTrialClient:(id)a3 withNamespace:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001EEF8;
  block[3] = &unk_100060F58;
  v14 = a4;
  v15 = a1;
  v13 = v6;
  v7 = qword_100076890;
  v8 = v14;
  v9 = v6;
  if (v7 != -1)
    dispatch_once(&qword_100076890, block);
  v10 = (id)qword_100076898;

  return v10;
}

- (void)handleNewSPNState:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSMutableDictionary *analytics;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  NSMutableDictionary *currentData;
  NSObject *v33;
  void *v34;
  NSMutableDictionary *v35;
  int v36;
  void *v37;
  __int16 v38;
  NSMutableDictionary *v39;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v6 = v5;
  switch(a3)
  {
    case 0uLL:
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_analytics, "objectForKeyedSubscript:", CFSTR("disabledDate")));

      if (!v10)
        -[OSIntelligenceAnalyticsManager handleNewExitState](self, "handleNewExitState");
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_analytics, "objectForKeyedSubscript:", CFSTR("transientDisabledDate")));

      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_analytics, "objectForKeyedSubscript:", CFSTR("transientDisabledDate")));
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_analytics, "setObject:forKeyedSubscript:", v12, CFSTR("disabledDate"));

        analytics = self->_analytics;
        goto LABEL_11;
      }
      objc_msgSend(v6, "timeIntervalSinceReferenceDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      v14 = self->_analytics;
      v15 = CFSTR("disabledDate");
      goto LABEL_14;
    case 1uLL:
      objc_msgSend(v5, "timeIntervalSinceReferenceDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      v14 = self->_analytics;
      v15 = CFSTR("transientDisabledDate");
LABEL_14:
      -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v13, v15);

      break;
    case 2uLL:
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_analytics, "objectForKeyedSubscript:", CFSTR("transientDisabledDate")));

      if (!v7)
      {
        objc_msgSend(v6, "timeIntervalSinceReferenceDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_analytics, "setObject:forKeyedSubscript:", v16, CFSTR("enabledDate"));

        v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_currentData, "objectForKeyedSubscript:", CFSTR("recommendedWait")));
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_analytics, "setObject:forKeyedSubscript:", v17, CFSTR("recommendedWait"));

        v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_currentData, "objectForKeyedSubscript:", CFSTR("nextAlarmInterval")));
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_analytics, "setObject:forKeyedSubscript:", v18, CFSTR("nextAlarmInterval"));

        v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_currentData, "objectForKeyedSubscript:", CFSTR("nextDNDInterval")));
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_analytics, "setObject:forKeyedSubscript:", v19, CFSTR("nextDNDInterval"));

        v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_currentData, "objectForKeyedSubscript:", CFSTR("prediction")));
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_analytics, "setObject:forKeyedSubscript:", v20, CFSTR("prediction"));

        v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_currentData, "objectForKeyedSubscript:", CFSTR("predictorType")));
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_analytics, "setObject:forKeyedSubscript:", v21, CFSTR("predictorType"));

        v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_currentData, "objectForKeyedSubscript:", CFSTR("queryingMechanism")));
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_analytics, "setObject:forKeyedSubscript:", v22, CFSTR("queryingMechanism"));

        v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_currentData, "objectForKeyedSubscript:", CFSTR("longThreshold")));
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_analytics, "setObject:forKeyedSubscript:", v23, CFSTR("longThreshold"));

        v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_currentData, "objectForKeyedSubscript:", CFSTR("deadlineSetter")));
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_analytics, "setObject:forKeyedSubscript:", v24, CFSTR("deadlineSetter"));

        v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_currentData, "objectForKeyedSubscript:", CFSTR("modelConfidenceLevel")));
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_analytics, "setObject:forKeyedSubscript:", v25, CFSTR("modelConfidenceLevel"));

        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_analytics, "setObject:forKeyedSubscript:", 0, CFSTR("transientDisabledDate"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_analytics, "setObject:forKeyedSubscript:", 0, CFSTR("disabledDate"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_analytics, "setObject:forKeyedSubscript:", &off_100064DD8, CFSTR("interruptionCount"));
        if (+[_OSInactivityPredictor isDeviceRarelyUsedRecently](_OSInactivityPredictor, "isDeviceRarelyUsedRecently"))
        {
          v26 = CFSTR("mostly idle");
        }
        else
        {
          v26 = CFSTR("rarely idle");
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_analytics, "setObject:forKeyedSubscript:", v26, CFSTR("deviceIdleFrequency"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[OSIAmbientLightMonitor currentAmbientLightLevel](self->_lightMonitor, "currentAmbientLightLevel")));
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_analytics, "setObject:forKeyedSubscript:", v27, CFSTR("startLuxValue"));

        v28 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("stationaryLookback"), self->_trialNamespace));
        objc_msgSend(v28, "doubleValue");
        v30 = v29;

        -[OSIMotionMonitor percentStationaryOverDuration:](self->_motionMonitor, "percentStationaryOverDuration:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_analytics, "setObject:forKeyedSubscript:", v31, CFSTR("startMotionValue"));

        currentData = self->_currentData;
        self->_currentData = 0;

        -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", CFSTR("currentData"));
        break;
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_analytics, "objectForKeyedSubscript:", CFSTR("transientDisabledDate")));

      if (v8)
      {
        analytics = self->_analytics;
LABEL_11:
        -[NSMutableDictionary setObject:forKeyedSubscript:](analytics, "setObject:forKeyedSubscript:", 0, CFSTR("transientDisabledDate"));
      }
      break;
  }
  v33 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceAnalyticsManager log](OSIntelligenceAnalyticsManager, "log"));
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    v35 = self->_analytics;
    v36 = 138412546;
    v37 = v34;
    v38 = 2112;
    v39 = v35;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "SPN state %@ - analytics is %@", (uint8_t *)&v36, 0x16u);

  }
  -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", self->_analytics, CFSTR("analytics"));

}

- (void)queryHistoricalInactivityState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dateByAddingTimeInterval:", -3600.0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dateByAddingTimeInterval:", -88200.0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dateByAddingTimeInterval:", -84600.0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_OSLockHistory sharedInstance](_OSLockHistory, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "unlockEventsIntersectingDateRangeFrom:to:", v5, v6));
  +[OSIntelligenceUtilities sumDurationsOfEvents:intersectingDateRangeFrom:to:](OSIntelligenceUtilities, "sumDurationsOfEvents:intersectingDateRangeFrom:to:", v8, v5, v6);
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "count")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_analytics, "setObject:forKeyedSubscript:", v11, CFSTR("activityCountYesterday"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v10));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_analytics, "setObject:forKeyedSubscript:", v12, CFSTR("activityDurationYesterday"));

  v13 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceAnalyticsManager log](OSIntelligenceAnalyticsManager, "log"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "count")));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v10));
    *(_DWORD *)buf = 138413058;
    v25 = v5;
    v26 = 2112;
    v27 = v6;
    v28 = 2112;
    v29 = v23;
    v30 = 2112;
    v31 = v22;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Activity yesterday same hour (%@ - %@) count = %@, cumulative duration = %@.", buf, 0x2Au);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "unlockEventsIntersectingDateRangeFrom:to:", v4, v3));
  +[OSIntelligenceUtilities sumDurationsOfEvents:intersectingDateRangeFrom:to:](OSIntelligenceUtilities, "sumDurationsOfEvents:intersectingDateRangeFrom:to:", v14, v4, v3);
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "count")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_analytics, "setObject:forKeyedSubscript:", v17, CFSTR("activityCountLastHour"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v16));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_analytics, "setObject:forKeyedSubscript:", v18, CFSTR("activityDurationLastHour"));

  v19 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceAnalyticsManager log](OSIntelligenceAnalyticsManager, "log"));
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "count")));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v16));
    *(_DWORD *)buf = 138413058;
    v25 = v4;
    v26 = 2112;
    v27 = v3;
    v28 = 2112;
    v29 = v20;
    v30 = 2112;
    v31 = v21;
    _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Activity last hour (%@ - %@) count = %@, cumulative duration = %@.", buf, 0x2Au);

  }
}

- (void)saveNextAlarmInterval:(id)a3 nextDNDInterval:(id)a4 predictionInterval:(id)a5 recommendedWait:(id)a6 deadlineSetter:(id)a7 modelConfidenceLevel:(int64_t)a8 withPredictor:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSMutableDictionary *currentData;
  NSMutableDictionary *v22;
  NSMutableDictionary *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSMutableDictionary *v30;
  int v31;
  NSMutableDictionary *v32;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a9;
  currentData = self->_currentData;
  if (currentData)
    v22 = currentData;
  else
    v22 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v23 = self->_currentData;
  self->_currentData = v22;

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentData, "setObject:forKeyedSubscript:", v15, CFSTR("nextAlarmInterval"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentData, "setObject:forKeyedSubscript:", v16, CFSTR("nextDNDInterval"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentData, "setObject:forKeyedSubscript:", v17, CFSTR("prediction"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentData, "setObject:forKeyedSubscript:", v18, CFSTR("recommendedWait"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "predictorType"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentData, "setObject:forKeyedSubscript:", v24, CFSTR("predictorType"));

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "queryingMechanism"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentData, "setObject:forKeyedSubscript:", v25, CFSTR("queryingMechanism"));

  objc_msgSend(v20, "longThreshold");
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentData, "setObject:forKeyedSubscript:", v26, CFSTR("longThreshold"));

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "modelVersion"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentData, "setObject:forKeyedSubscript:", v27, CFSTR("modelVersion"));

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentData, "setObject:forKeyedSubscript:", v19, CFSTR("deadlineSetter"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a8));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentData, "setObject:forKeyedSubscript:", v28, CFSTR("modelConfidenceLevel"));

  -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", self->_currentData, CFSTR("currentData"));
  v29 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceAnalyticsManager log](OSIntelligenceAnalyticsManager, "log"));
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v30 = self->_currentData;
    v31 = 138412290;
    v32 = v30;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Saving prediction state %@", (uint8_t *)&v31, 0xCu);
  }

}

- (void)handleNewInterruptNotificationStart:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  NSMutableDictionary *analytics;
  NSMutableDictionary **p_analytics;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  uint64_t v26;
  void *v27;
  _UNKNOWN **v28;
  _UNKNOWN **v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  float v37;
  void *v38;
  double v39;
  NSObject *v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  void *v65;
  uint64_t v66;
  void *v67;
  _UNKNOWN **v68;
  uint64_t v69;
  void *v70;
  _UNKNOWN **v71;
  uint64_t v72;
  void *v73;
  _UNKNOWN **v74;
  uint64_t v75;
  void *v76;
  _UNKNOWN **v77;
  void *v78;
  void *v79;
  void *v80;
  __CFString *v81;
  const __CFString *v82;
  void *v83;
  __CFString *v84;
  const __CFString *v85;
  void *v86;
  uint64_t v87;
  const __CFString *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  const __CFString *v92;
  void *v93;
  void *v94;
  NSObject *v95;
  void *v96;
  void *v97;
  void *v98;
  double v99;
  void *v100;
  void *v101;
  double v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  _UNKNOWN **v109;
  id v110;
  NSObject *v111;
  NSMutableDictionary *v112;
  id v113;
  NSObject *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  NSObject *v119;
  _QWORD v120[4];
  NSObject *v121;
  uint8_t buf[4];
  NSObject *v123;
  __int16 v124;
  NSMutableDictionary *v125;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  p_analytics = &self->_analytics;
  analytics = self->_analytics;
  if (!v3)
  {
    v18 = v6;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](analytics, "objectForKeyedSubscript:", CFSTR("interruption")));

    if (!v19)
      goto LABEL_67;
    v12 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](*p_analytics, "objectForKeyedSubscript:", CFSTR("interruption")));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("interruptStartInterval")));

    if (!v20)
    {
      v41 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceAnalyticsManager log](OSIntelligenceAnalyticsManager, "log"));
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        sub_10003F05C(v41, v42, v43, v44, v45, v46, v47, v48);
      goto LABEL_66;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("interruptStartInterval")));
    objc_msgSend(v22, "doubleValue");
    v24 = v23;

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v18 - v24));
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v25, CFSTR("interruptionDuration"));

    v26 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](*p_analytics, "objectForKeyedSubscript:", CFSTR("recommendedWait")));
    v27 = (void *)v26;
    v28 = &off_100064DF0;
    if (v26)
      v28 = (_UNKNOWN **)v26;
    v29 = v28;

    objc_msgSend(v29, "doubleValue");
    v31 = v30;

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](*p_analytics, "objectForKeyedSubscript:", CFSTR("enabledDate")));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](*p_analytics, "objectForKeyedSubscript:", CFSTR("prediction")));
    v118 = v32;
    if (v32)
    {
      objc_msgSend(v32, "doubleValue");
      v35 = v34 - v31;
      v36 = (v24 - (v34 - v31)) / 3600.0;
      v37 = v36;
      *(float *)&v36 = v37;
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v36));
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v38, CFSTR("intrTimeSinceInactivityStart"));

      if (v33)
      {
        objc_msgSend(v33, "doubleValue");
        *(float *)&v39 = v37 / ((v39 - v35) / 3600.0);
        if (*(float *)&v39 >= 0.0)
        {
          v40 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v40, CFSTR("intrPctInSession"));
        }
        else
        {
          v40 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceAnalyticsManager log](OSIntelligenceAnalyticsManager, "log"));
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            sub_10003F090((uint64_t *)&self->_analytics, v40);
        }

        goto LABEL_24;
      }
    }
    else
    {
      objc_msgSend(v21, "setObject:forKeyedSubscript:", &off_100064E08, CFSTR("intrTimeSinceInactivityStart"));
      if (v33)
      {
LABEL_24:
        objc_msgSend(v33, "doubleValue");
        v51 = (v50 - v24) / 3600.0;
        *(float *)&v51 = v51;
        v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v51));
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v52, CFSTR("intrTimeUntilPredictionEnd"));

        goto LABEL_25;
      }
    }
    objc_msgSend(v21, "setObject:forKeyedSubscript:", &off_100064E08, CFSTR("intrTimeUntilPredictionEnd"));
LABEL_25:
    v117 = v33;
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("intrLuxValue")));
    v119 = v12;
    if (v53)
    {
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("intrLuxValue")));
      v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v54, "intValue")));
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v55, CFSTR("intrLuxValue"));

    }
    else
    {
      objc_msgSend(v21, "setObject:forKeyedSubscript:", &off_100064E08, CFSTR("intrLuxValue"));
    }

    v56 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](*p_analytics, "objectForKeyedSubscript:", CFSTR("nextAlarmInterval")));
    if (v56)
    {
      v57 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](*p_analytics, "objectForKeyedSubscript:", CFSTR("nextAlarmInterval")));
      objc_msgSend(v57, "doubleValue");
      v59 = v58;

      v60 = (v59 - v24) / 3600.0;
      *(float *)&v60 = v60;
      v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v60));
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v61, CFSTR("intrTimeUntilNextAlarm"));

    }
    else
    {
      objc_msgSend(v21, "setObject:forKeyedSubscript:", &off_100064E08, CFSTR("intrTimeUntilNextAlarm"));
    }
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](*p_analytics, "objectForKeyedSubscript:", CFSTR("nextDNDInterval")));
    v116 = v62;
    if (v62)
    {
      objc_msgSend(v62, "doubleValue");
      v64 = (v63 - v24) / 3600.0;
      *(float *)&v64 = v64;
      v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v64));
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v65, CFSTR("intrTimeUntilEndOfDnd"));

    }
    else
    {
      objc_msgSend(v21, "setObject:forKeyedSubscript:", &off_100064E08, CFSTR("intrTimeUntilEndOfDnd"));
    }
    v66 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_analytics, "objectForKeyedSubscript:", CFSTR("activityCountYesterday")));
    v67 = (void *)v66;
    if (v66)
      v68 = (_UNKNOWN **)v66;
    else
      v68 = &off_100064E08;
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v68, CFSTR("intrActivityCountYesterdaySameHour"));

    v69 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_analytics, "objectForKeyedSubscript:", CFSTR("activityDurationYesterday")));
    v70 = (void *)v69;
    if (v69)
      v71 = (_UNKNOWN **)v69;
    else
      v71 = &off_100064E08;
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v71, CFSTR("intrActivityDurationYesterdaySameHour"));

    v72 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_analytics, "objectForKeyedSubscript:", CFSTR("activityCountLastHour")));
    v73 = (void *)v72;
    if (v72)
      v74 = (_UNKNOWN **)v72;
    else
      v74 = &off_100064E08;
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v74, CFSTR("intrActivityCountLastHour"));

    v75 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_analytics, "objectForKeyedSubscript:", CFSTR("activityDurationLastHour")));
    v76 = (void *)v75;
    if (v75)
      v77 = (_UNKNOWN **)v75;
    else
      v77 = &off_100064E08;
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v77, CFSTR("intrActivityDurationLastHour"));

    v78 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_analytics, "objectForKeyedSubscript:", CFSTR("predictorType")));
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v78, CFSTR("predictorType"));

    v79 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_analytics, "objectForKeyedSubscript:", CFSTR("longThreshold")));
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v79, CFSTR("longThreshold"));

    v80 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient treatmentIdWithNamespaceName:](self->_trialClient, "treatmentIdWithNamespaceName:", self->_trialNamespace));
    v81 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "description"));

    if (v81)
      v82 = v81;
    else
      v82 = CFSTR("None");
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v82, CFSTR("treatmentId"));
    v83 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient rolloutIdentifiersWithNamespaceName:](self->_trialClient, "rolloutIdentifiersWithNamespaceName:", self->_trialNamespace));
    v84 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "description"));

    if (v84)
      v85 = v84;
    else
      v85 = CFSTR("None");
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v85, CFSTR("rolloutId"));
    v86 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient experimentIdentifiersWithNamespaceName:](self->_trialClient, "experimentIdentifiersWithNamespaceName:", self->_trialNamespace));
    v87 = objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "description"));

    v115 = (void *)v87;
    if (v87)
      v88 = (const __CFString *)v87;
    else
      v88 = CFSTR("None");
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v88, CFSTR("experimentId"));
    v89 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_analytics, "objectForKeyedSubscript:", CFSTR("interruptionCount")));
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v89, CFSTR("interruptionIndex"));

    v90 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_analytics, "objectForKeyedSubscript:", CFSTR("modelVersion")));
    v91 = (void *)v90;
    if (v90)
      v92 = (const __CFString *)v90;
    else
      v92 = CFSTR("None");
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v92, CFSTR("modelVersion"));

    objc_msgSend(v21, "setObject:forKeyedSubscript:", CFSTR("ospredictiond"), CFSTR("processName"));
    v93 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_analytics, "objectForKeyedSubscript:", CFSTR("deviceIdleFrequency")));
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v93, CFSTR("deviceIdleFrequency"));

    v94 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_analytics, "objectForKeyedSubscript:", CFSTR("queryingMechanism")));
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v94, CFSTR("queryType"));

    v95 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("interruptionDuration")));
    -[NSObject setObject:forKeyedSubscript:](v95, "setObject:forKeyedSubscript:", v96, CFSTR("interruptionDuration"));

    v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("intrLuxValue")));
    -[NSObject setObject:forKeyedSubscript:](v95, "setObject:forKeyedSubscript:", v97, CFSTR("intrLuxValue"));

    v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("intrTimeUntilNextAlarm")));
    objc_msgSend(v98, "doubleValue");
    v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", round(v99)));
    -[NSObject setObject:forKeyedSubscript:](v95, "setObject:forKeyedSubscript:", v100, CFSTR("intrTimeUntilNextAlarm"));

    v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("intrTimeUntilEndOfDnd")));
    objc_msgSend(v101, "doubleValue");
    v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", round(v102)));
    -[NSObject setObject:forKeyedSubscript:](v95, "setObject:forKeyedSubscript:", v103, CFSTR("intrTimeUntilEndOfDnd"));

    v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("intrActivityDurationYesterdaySameHour")));
    -[NSObject setObject:forKeyedSubscript:](v95, "setObject:forKeyedSubscript:", v104, CFSTR("intrActivityDurationYesterdaySameHour"));

    v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("intrActivityDurationLastHour")));
    -[NSObject setObject:forKeyedSubscript:](v95, "setObject:forKeyedSubscript:", v105, CFSTR("intrActivityDurationLastHour"));

    v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("intrActivityCountYesterdaySameHour")));
    -[NSObject setObject:forKeyedSubscript:](v95, "setObject:forKeyedSubscript:", v106, CFSTR("intrActivityCountYesterdaySameHour"));

    v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("intrActivityCountLastHour")));
    -[NSObject setObject:forKeyedSubscript:](v95, "setObject:forKeyedSubscript:", v107, CFSTR("intrActivityCountLastHour"));

    v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("deviceIdleFrequency")));
    if (objc_msgSend(v108, "isEqualToString:", CFSTR("rarely idle")))
      v109 = &off_100064DD8;
    else
      v109 = &off_100064E20;
    -[NSObject setObject:forKeyedSubscript:](v95, "setObject:forKeyedSubscript:", v109, CFSTR("deviceIdleFrequency"));

    v120[0] = _NSConcreteStackBlock;
    v120[1] = 3221225472;
    v120[2] = sub_100020858;
    v120[3] = &unk_100060C10;
    v41 = v21;
    v121 = v41;
    AnalyticsSendEventLazy(CFSTR("com.apple.SmartPowerNap.Interruption"), v120);
    v110 = -[NSObject copy](v95, "copy");
    PLLogRegisteredEvent(24, CFSTR("InactivityPredictionInterruption"), v110, 0);

    v111 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceAnalyticsManager log](OSIntelligenceAnalyticsManager, "log"));
    if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
    {
      v112 = *p_analytics;
      *(_DWORD *)buf = 138412546;
      v123 = v41;
      v124 = 2112;
      v125 = v112;
      _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_DEFAULT, "Logging CA %@ from %@", buf, 0x16u);
    }

    v113 = objc_msgSend((id)objc_opt_class(self), "logWithCategory:", CFSTR("powerlog"));
    v114 = objc_claimAutoreleasedReturnValue(v113);
    if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v123 = v95;
      _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, "Logging to Power Log: %@", buf, 0xCu);
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_analytics, "setObject:forKeyedSubscript:", 0, CFSTR("interruption"));
    -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", self->_analytics, CFSTR("analytics"));

    v12 = v119;
    goto LABEL_66;
  }
  v9 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](analytics, "objectForKeyedSubscript:", CFSTR("enabledDate")));
  if (v9)
  {
    v10 = (void *)v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](*p_analytics, "objectForKeyedSubscript:", CFSTR("interruption")));

    if (!v11)
    {
      v12 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      objc_msgSend(v5, "timeIntervalSinceReferenceDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      -[NSObject setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v13, CFSTR("interruptStartInterval"));

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[OSIAmbientLightMonitor currentAmbientLightLevel](self->_lightMonitor, "currentAmbientLightLevel")));
      -[NSObject setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v14, CFSTR("intrLuxValue"));

      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_analytics, "setObject:forKeyedSubscript:", v12, CFSTR("interruption"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_analytics, "objectForKeyedSubscript:", CFSTR("interruptionCount")));
      if (v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](*p_analytics, "objectForKeyedSubscript:", CFSTR("interruptionCount")));
        v17 = objc_msgSend(v16, "intValue") + 1;

      }
      else
      {
        v17 = 1;
      }

      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v17));
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_analytics, "setObject:forKeyedSubscript:", v49, CFSTR("interruptionCount"));

      -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", self->_analytics, CFSTR("interruption"));
      -[OSIntelligenceAnalyticsManager queryHistoricalInactivityState](self, "queryHistoricalInactivityState");
      v41 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceAnalyticsManager log](OSIntelligenceAnalyticsManager, "log"));
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v123 = v12;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Start interrupt with interrupt states %@", buf, 0xCu);
      }
LABEL_66:

    }
  }
LABEL_67:

}

- (void)handleNewExitState
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  const __CFString *v18;
  void *v19;
  __CFString *v20;
  const __CFString *v21;
  void *v22;
  NSObject *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  _UNKNOWN **v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  float v51;
  void *v52;
  double v53;
  void *v54;
  void *v55;
  const __CFString *v56;
  void *v57;
  double v58;
  void *v59;
  NSObject *v60;
  id v61;
  void *v62;
  _QWORD v63[4];
  id v64;
  uint8_t buf[4];
  void *v66;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_analytics, "objectForKeyedSubscript:", CFSTR("prediction")));
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
    objc_msgSend(v5, "timeIntervalSinceNow");
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_analytics, "objectForKeyedSubscript:", CFSTR("enabledDate")));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      objc_msgSend(v9, "setObject:forKeyedSubscript:", &off_100064DD8, CFSTR("suppressedDurationWithAlarm"));
      objc_msgSend(v9, "setObject:forKeyedSubscript:", &off_100064DD8, CFSTR("suppressedDurationWithDND"));
      objc_msgSend(v9, "setObject:forKeyedSubscript:", &off_100064DD8, CFSTR("suppressedDurationWithNoSignal"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_analytics, "objectForKeyedSubscript:", CFSTR("deadlineSetter")));
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("deadlineSetter"));

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v7 > 0.0));
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("overPredicted"));

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v7 <= 0.0));
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("underPredicted"));

      objc_msgSend(v9, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("overPredictedWithAlarm"));
      objc_msgSend(v9, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("overPredictedWithDND"));
      objc_msgSend(v9, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("overPredictedWithNoSignal"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_analytics, "objectForKeyedSubscript:", CFSTR("predictorType")));
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("predictorType"));

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_analytics, "objectForKeyedSubscript:", CFSTR("queryingMechanism")));
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, CFSTR("queryType"));

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_analytics, "objectForKeyedSubscript:", CFSTR("longThreshold")));
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, CFSTR("longThreshold"));

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient treatmentIdWithNamespaceName:](self->_trialClient, "treatmentIdWithNamespaceName:", self->_trialNamespace));
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "description"));

      if (v17)
        v18 = v17;
      else
        v18 = CFSTR("None");
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, CFSTR("treatmentId"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient rolloutIdentifiersWithNamespaceName:](self->_trialClient, "rolloutIdentifiersWithNamespaceName:", self->_trialNamespace));
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "description"));

      if (v20)
        v21 = v20;
      else
        v21 = CFSTR("None");
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v21, CFSTR("rolloutId"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient experimentIdentifiersWithNamespaceName:](self->_trialClient, "experimentIdentifiersWithNamespaceName:", self->_trialNamespace));
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "description"));

      if (v23)
        v24 = (const __CFString *)v23;
      else
        v24 = CFSTR("None");
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v24, CFSTR("experimentId"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_analytics, "objectForKeyedSubscript:", CFSTR("modelConfidenceLevel")));
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v25, CFSTR("modelConfidenceLevel"));

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_analytics, "objectForKeyedSubscript:", CFSTR("startLuxValue")));
      if (v26)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_analytics, "objectForKeyedSubscript:", CFSTR("startLuxValue")));
        v28 = (uint64_t)objc_msgSend(v27, "intValue");

      }
      else
      {
        v28 = 0xFFFFFFFFLL;
      }

      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v28));
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v36, CFSTR("entryAmbientLightLevel"));

      v37 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_analytics, "objectForKeyedSubscript:", CFSTR("startMotionValue")));
      v38 = (void *)v37;
      if (v37)
        v39 = (_UNKNOWN **)v37;
      else
        v39 = &off_100064E08;
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v39, CFSTR("entryStationaryLevel"), v5);

      v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_analytics, "objectForKeyedSubscript:", CFSTR("recommendedWait")));
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v40, CFSTR("eligibleTimeout"));

      v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_analytics, "objectForKeyedSubscript:", CFSTR("deviceIdleFrequency")));
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v41, CFSTR("deviceIdleFrequency"));

      v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_analytics, "objectForKeyedSubscript:", CFSTR("recommendedWait")));
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v42, CFSTR("eligibleTimeout"));

      v43 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_analytics, "objectForKeyedSubscript:", CFSTR("modelVersion")));
      v44 = (void *)v43;
      if (v43)
        v45 = (const __CFString *)v43;
      else
        v45 = CFSTR("None");
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v45, CFSTR("modelVersion"));

      objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("ospredictiond"), CFSTR("processName"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_analytics, "objectForKeyedSubscript:", CFSTR("enabledDate")));
      objc_msgSend(v46, "doubleValue");
      v48 = v47;

      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v48));
      objc_msgSend(v49, "timeIntervalSinceNow");
      v51 = v50 / -3600.0;
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_analytics, "objectForKeyedSubscript:", CFSTR("nextAlarmInterval")));

      if (v52)
      {
        *(float *)&v53 = v51;
        v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v53));
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v54, CFSTR("suppressedDurationWithAlarm"));

        v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v7 > 0.0));
        v56 = CFSTR("overPredictedWithAlarm");
      }
      else
      {
        v57 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_analytics, "objectForKeyedSubscript:", CFSTR("nextDNDInterval")));

        *(float *)&v58 = v51;
        v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v58));
        if (v57)
        {
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v59, CFSTR("suppressedDurationWithDND"));

          v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v7 > 0.0));
          v56 = CFSTR("overPredictedWithDND");
        }
        else
        {
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v59, CFSTR("suppressedDurationWithNoSignal"));

          v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v7 > 0.0));
          v56 = CFSTR("overPredictedWithNoSignal");
        }
      }
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v55, v56);

      v60 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceAnalyticsManager log](OSIntelligenceAnalyticsManager, "log"));
      v5 = v62;
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v66 = v9;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "Logging SPN Exit Metrics %@", buf, 0xCu);
      }

      v63[0] = _NSConcreteStackBlock;
      v63[1] = 3221225472;
      v63[2] = sub_100020FE4;
      v63[3] = &unk_100060C10;
      v64 = v9;
      v61 = v9;
      AnalyticsSendEventLazy(CFSTR("com.apple.SmartPowerNap.Interruption"), v63);

    }
    else
    {
      v23 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceAnalyticsManager log](OSIntelligenceAnalyticsManager, "log"));
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        sub_10003F108(v23, v29, v30, v31, v32, v33, v34, v35);
    }

  }
}

+ (int)bucketLuxValue:(int)a3
{
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;

  if (a3 < 0x3D)
    v3 = 6;
  else
    v3 = 7;
  if (a3 >= 0x29)
    v4 = v3;
  else
    v4 = 5;
  if (a3 >= 0x15)
    v5 = v4;
  else
    v5 = 4;
  if (a3 >= 0xB)
    v6 = v5;
  else
    v6 = 3;
  if (a3 >= 6)
    v7 = v6;
  else
    v7 = 2;
  if (a3)
    v8 = v7;
  else
    v8 = 1;
  if (a3 >= 0)
    return v8;
  else
    return 0;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (NSMutableDictionary)analytics
{
  return self->_analytics;
}

- (void)setAnalytics:(id)a3
{
  objc_storeStrong((id *)&self->_analytics, a3);
}

- (NSMutableDictionary)currentData
{
  return self->_currentData;
}

- (void)setCurrentData:(id)a3
{
  objc_storeStrong((id *)&self->_currentData, a3);
}

- (NSMutableDictionary)interruptionMetrics
{
  return self->_interruptionMetrics;
}

- (void)setInterruptionMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_interruptionMetrics, a3);
}

- (NSDate)enabledDate
{
  return self->_enabledDate;
}

- (void)setEnabledDate:(id)a3
{
  objc_storeStrong((id *)&self->_enabledDate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OSIAmbientLightMonitor)lightMonitor
{
  return self->_lightMonitor;
}

- (void)setLightMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_lightMonitor, a3);
}

- (OSIAlarmMonitor)alarmMonitor
{
  return self->_alarmMonitor;
}

- (void)setAlarmMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_alarmMonitor, a3);
}

- (OSIMotionMonitor)motionMonitor
{
  return self->_motionMonitor;
}

- (void)setMotionMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_motionMonitor, a3);
}

- (TRIClient)trialClient
{
  return self->_trialClient;
}

- (void)setTrialClient:(id)a3
{
  objc_storeStrong((id *)&self->_trialClient, a3);
}

- (NSString)trialNamespace
{
  return self->_trialNamespace;
}

- (void)setTrialNamespace:(id)a3
{
  objc_storeStrong((id *)&self->_trialNamespace, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialNamespace, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);
  objc_storeStrong((id *)&self->_motionMonitor, 0);
  objc_storeStrong((id *)&self->_alarmMonitor, 0);
  objc_storeStrong((id *)&self->_lightMonitor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_enabledDate, 0);
  objc_storeStrong((id *)&self->_interruptionMetrics, 0);
  objc_storeStrong((id *)&self->_currentData, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
}

@end
