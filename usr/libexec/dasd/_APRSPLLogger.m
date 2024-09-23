@implementation _APRSPLLogger

- (_APRSPLLogger)init
{
  _APRSPLLogger *v2;
  os_log_t v3;
  OS_os_log *log;
  BOOL v5;
  NSUserDefaults *v6;
  NSUserDefaults *defaults;
  uint64_t v8;
  NSDate *lastReportedDate;
  NSObject *v10;
  NSDate *v11;
  uint64_t v12;
  _CDContextualKeyPath *inferredCarryStatusKeyPath;
  dispatch_queue_global_t global_queue;
  NSObject *v15;
  _APRSPLLogger *v16;
  NSMutableDictionary *v17;
  NSMutableDictionary *predictionAccuracies;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSDate *lastCAReportedDate;
  _APRSPLLogger *v25;
  NSObject *v26;
  NSObject *v27;
  NSDate *v28;
  _QWORD handler[4];
  _APRSPLLogger *v31;
  objc_super v32;
  uint8_t buf[4];
  NSDate *v34;

  v32.receiver = self;
  v32.super_class = (Class)_APRSPLLogger;
  v2 = -[_APRSPLLogger init](&v32, "init");
  if (!v2)
  {
LABEL_6:
    v25 = v2;
    goto LABEL_10;
  }
  v3 = os_log_create("com.apple.aprs", "appResume");
  log = v2->_log;
  v2->_log = (OS_os_log *)v3;

  v5 = dlopen_preflight((const char *)objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/PowerLog.framework/PowerLog"), "UTF8String"));
  v2->_powerLogExists = v5;
  if (v5)
  {
    v6 = (NSUserDefaults *)objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.duetactivityscheduler"));
    defaults = v2->_defaults;
    v2->_defaults = v6;

    -[NSUserDefaults doubleForKey:](v2->_defaults, "doubleForKey:", CFSTR("appResumePredictionsReportedDate"));
    v8 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
    lastReportedDate = v2->_lastReportedDate;
    v2->_lastReportedDate = (NSDate *)v8;

    v10 = v2->_log;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v2->_lastReportedDate;
      *(_DWORD *)buf = 138412290;
      v34 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Last reported date for App predictions to PowerLog is %@", buf, 0xCu);
    }
    v12 = objc_claimAutoreleasedReturnValue(+[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/das/inferredCarryStatus")));
    inferredCarryStatusKeyPath = v2->_inferredCarryStatusKeyPath;
    v2->_inferredCarryStatusKeyPath = (_CDContextualKeyPath *)v12;

    -[_APRSPLLogger initializeCarryStatusLogging](v2, "initializeCarryStatusLogging");
    v2->_token = -1;
    global_queue = dispatch_get_global_queue(-2, 0);
    v15 = objc_claimAutoreleasedReturnValue(global_queue);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10003CF20;
    handler[3] = &unk_10015D9B8;
    v16 = v2;
    v31 = v16;
    notify_register_dispatch("com.apple.das.logPrewarmDock", &v2->_token, v15, handler);

    v17 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    predictionAccuracies = v16->_predictionAccuracies;
    v16->_predictionAccuracies = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v2->_defaults, "objectForKey:", CFSTR("appResumeProactivePredictionsAccuracy")));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPredictionAccuracy initFromDictionaryRepresentation:](_DASPredictionAccuracy, "initFromDictionaryRepresentation:", v19));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v16->_predictionAccuracies, "setObject:forKeyedSubscript:", v20, CFSTR("proactive"));

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v2->_defaults, "objectForKey:", CFSTR("appResumeSwapPredictionsAccuracy")));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPredictionAccuracy initFromDictionaryRepresentation:](_DASPredictionAccuracy, "initFromDictionaryRepresentation:", v21));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v16->_predictionAccuracies, "setObject:forKeyedSubscript:", v22, CFSTR("swap"));

    v23 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
    lastCAReportedDate = v16->_lastCAReportedDate;
    v16->_lastCAReportedDate = (NSDate *)v23;

    goto LABEL_6;
  }
  v26 = v2->_log;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = v26;
    v28 = (NSDate *)objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/PowerLog.framework/PowerLog"), "UTF8String");
    *(_DWORD *)buf = 136315138;
    v34 = v28;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Powerlog library at %s does not exist", buf, 0xCu);

  }
  v25 = 0;
LABEL_10:

  return v25;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003D07C;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001AB550 != -1)
    dispatch_once(&qword_1001AB550, block);
  return (id)qword_1001AB548;
}

+ (id)topPredictionsFromScores:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "keysSortedByValueUsingComparator:", &stru_10015DD20));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if ((unint64_t)objc_msgSend(v3, "count") > 9)
  {
    v6 = 10;
  }
  else
  {
    v6 = objc_msgSend(v3, "count");
    if (v6 < 1)
      goto LABEL_7;
  }
  v7 = 0;
  v8 = v6;
  do
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", v7));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", v7));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, v11);

    ++v7;
  }
  while (v8 != v7);
LABEL_7:

  return v5;
}

- (void)logAppResumePredictions:(id)a3 durationCheck:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  double v7;
  NSObject *log;
  const char *v9;
  id v10;
  void *v11;
  NSMutableArray *v12;
  void *v13;
  NSObject *v14;
  NSDate *v15;
  NSDate *lastReportedDate;
  NSUserDefaults *defaults;
  NSObject *v18;
  NSMutableArray *lastPredictions;
  NSMutableArray *v20;
  void **v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, void *);
  void *v24;
  NSMutableArray *v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  void *v29;
  const __CFString *v30;
  NSMutableArray *v31;

  v4 = a4;
  v6 = a3;
  if (self->_powerLogExists)
  {
    if (v4 && (-[NSDate timeIntervalSinceNow](self->_lastReportedDate, "timeIntervalSinceNow"), v7 > -1800.0))
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v9 = "Reported predictions to PowerLog in last 30 mins. Skipping";
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, v9, buf, 2u);
      }
    }
    else
    {
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10003D500;
      v26[3] = &unk_10015D480;
      v10 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v27 = v10;
      objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v26);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[_APRSPLLogger appsFromProactiveSuggestions](self, "appsFromProactiveSuggestions"));
      v21 = _NSConcreteStackBlock;
      v22 = 3221225472;
      v23 = sub_10003D5C8;
      v24 = &unk_10015D480;
      v12 = (NSMutableArray *)v10;
      v25 = v12;
      objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", &v21);
      v30 = CFSTR("appResumePredictions");
      v31 = v12;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1, v21, v22, v23, v24));
      v14 = self->_log;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Logging to PowerLog %@", buf, 0xCu);
      }
      PLLogRegisteredEvent(70, CFSTR("AppResumePredictions"), v13, 0);
      v15 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      lastReportedDate = self->_lastReportedDate;
      self->_lastReportedDate = v15;

      defaults = self->_defaults;
      -[NSDate timeIntervalSinceReferenceDate](self->_lastReportedDate, "timeIntervalSinceReferenceDate");
      -[NSUserDefaults setDouble:forKey:](defaults, "setDouble:forKey:", CFSTR("appResumePredictionsReportedDate"));
      if (self->_lastPredictions)
      {
        v18 = self->_log;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Updating accuracies", buf, 2u);
        }
        -[_APRSPLLogger reportAppResumePredictions](self, "reportAppResumePredictions");
      }
      lastPredictions = self->_lastPredictions;
      self->_lastPredictions = v12;
      v20 = v12;

    }
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v9 = "PowerLog does not exist";
      goto LABEL_15;
    }
  }

}

- (void)reportAppResumePredictions
{
  NSDate *lastReportedDate;
  void *v4;
  void *v5;
  NSObject *log;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  NSObject *v15;
  uint64_t v16;
  NSDate *v17;
  NSDate *lastCAReportedDate;
  _DASPredictionAccuracy *v19;
  _DASPredictionAccuracy *v20;
  NSUserDefaults **p_defaults;
  NSUserDefaults *defaults;
  void *v23;
  NSUserDefaults *v24;
  void *v25;
  _QWORD v26[5];
  uint8_t v27[4];
  uint64_t v28;
  __int128 buf;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  lastReportedDate = self->_lastReportedDate;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDate dateByAddingTimeInterval:](lastReportedDate, "dateByAddingTimeInterval:", 1800.0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_APRSPLLogger queryAppsLaunchedFromStartDate:toEndDate:](self, "queryAppsLaunchedFromStartDate:toEndDate:", lastReportedDate, v4));

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v5;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Apps Launched in the last prediction window %@", (uint8_t *)&buf, 0xCu);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_APRSPLLogger computeAccuraciesWithLastPredictions:andAppsLaunched:](self, "computeAccuraciesWithLastPredictions:andAppsLaunched:", self->_lastPredictions, v5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_predictionAccuracies, "objectForKeyedSubscript:", CFSTR("proactive")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("proactive")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "addPredictionAccuracy:", v9));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_predictionAccuracies, "setObject:forKeyedSubscript:", v10, CFSTR("proactive"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_predictionAccuracies, "objectForKeyedSubscript:", CFSTR("swap")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("swap")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "addPredictionAccuracy:", v12));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_predictionAccuracies, "setObject:forKeyedSubscript:", v13, CFSTR("swap"));

  -[NSDate timeIntervalSinceNow](self->_lastCAReportedDate, "timeIntervalSinceNow");
  if (v14 < -86400.0)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v30 = 0x3032000000;
    v31 = sub_10003DA6C;
    v32 = sub_10003DA7C;
    v33 = (id)objc_claimAutoreleasedReturnValue(-[_APRSPLLogger generateAccuraciesCAEventDictionary](self, "generateAccuraciesCAEventDictionary"));
    v15 = self->_log;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      *(_DWORD *)v27 = 138412290;
      v28 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Posting app prediction accuracy CA Event %@", v27, 0xCu);
    }
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10003DA84;
    v26[3] = &unk_10015DD48;
    v26[4] = &buf;
    AnalyticsSendEventLazy(CFSTR("com.apple.dasd.predictionAccuracy"), v26);
    v17 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    lastCAReportedDate = self->_lastCAReportedDate;
    self->_lastCAReportedDate = v17;

    -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", self->_lastCAReportedDate, CFSTR("appResumePredictionsAccuracyCAReportedKey"));
    v19 = objc_alloc_init(_DASPredictionAccuracy);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_predictionAccuracies, "setObject:forKeyedSubscript:", v19, CFSTR("proactive"));

    v20 = objc_alloc_init(_DASPredictionAccuracy);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_predictionAccuracies, "setObject:forKeyedSubscript:", v20, CFSTR("swap"));

    _Block_object_dispose(&buf, 8);
  }
  defaults = self->_defaults;
  p_defaults = &self->_defaults;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKeyedSubscript:](p_defaults[5], "objectForKeyedSubscript:", CFSTR("proactive")));
  -[NSUserDefaults setObject:forKey:](defaults, "setObject:forKey:", v23, CFSTR("appResumeProactivePredictionsAccuracy"));

  v24 = *p_defaults;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKeyedSubscript:](p_defaults[5], "objectForKeyedSubscript:", CFSTR("swap")));
  -[NSUserDefaults setObject:forKey:](v24, "setObject:forKey:", v25, CFSTR("appResumeSwapPredictionsAccuracy"));

}

- (id)queryAppsLaunchedFromStartDate:(id)a3 toEndDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *log;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BMStreams appLaunch](BMStreams, "appLaunch"));
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v23 = v6;
    v24 = 2112;
    v25 = v7;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Querying for app launch between %@ and %@", buf, 0x16u);
  }
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v11 = v10;
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  v13 = v12;
  v14 = objc_alloc_init((Class)NSMutableArray);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "publisherFromStartTime:", v11));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10003DCA8;
  v19[3] = &unk_10015DDB0;
  v21 = v13;
  v16 = v14;
  v20 = v16;
  v17 = objc_msgSend(v15, "sinkWithCompletion:receiveInput:", &stru_10015DD88, v19);

  return v16;
}

- (id)computeAccuraciesWithLastPredictions:(id)a3 andAppsLaunched:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *log;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void **v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)NSMutableArray);
  v9 = objc_alloc_init((Class)NSMutableArray);
  objc_msgSend(v7, "sortUsingComparator:", &stru_10015DDF0);
  v21 = _NSConcreteStackBlock;
  v22 = 3221225472;
  v23 = sub_10003E058;
  v24 = &unk_10015DE18;
  v10 = v8;
  v25 = v10;
  v11 = v9;
  v26 = v11;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v21);

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v28 = v10;
    v29 = 2112;
    v30 = v11;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Proactive predictions %@ \n Swap predictions %@", buf, 0x16u);
  }
  v13 = objc_alloc_init((Class)NSMutableDictionary);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPredictionUtilites computeAccuraciesFromSortedPredictions:andObservations:withEqualityOperator:](_DASPredictionUtilites, "computeAccuraciesFromSortedPredictions:andObservations:withEqualityOperator:", v10, v6, &stru_10015DE58, v21, v22, v23, v24));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPredictionUtilites computeAccuraciesFromSortedPredictions:andObservations:withEqualityOperator:](_DASPredictionUtilites, "computeAccuraciesFromSortedPredictions:andObservations:withEqualityOperator:", v11, v6, &stru_10015DE78));

  objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("proactive"));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("swap"));
  v16 = self->_log;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("proactive")));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("swap")));
    *(_DWORD *)buf = 138412546;
    v28 = v18;
    v29 = 2112;
    v30 = v19;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Proactive predictions accuracy %@ \n Swap predictions accuracy %@", buf, 0x16u);

  }
  return v13;
}

- (id)generateAccuraciesCAEventDictionary
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_predictionAccuracies, "objectForKeyedSubscript:", CFSTR("swap")));
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  if ((int)objc_msgSend(v3, "totalPredictionIntervals") >= 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accuracyRate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("top1")));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("swap_top1"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("top3")));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("swap_top3"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("top5")));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("swap_top5"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("top10")));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("swap_top10"));

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_predictionAccuracies, "objectForKeyedSubscript:", CFSTR("proactive")));
  if ((int)objc_msgSend(v10, "totalPredictionIntervals") >= 1)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "accuracyRate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("top1")));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("proactive_top1"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("top3")));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("proactive_top3"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("top5")));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("proactive_top5"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("top10")));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("proactive_top10"));

  }
  return v4;
}

- (void)logFreezerSkipReasons:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *log;
  uint8_t v8[8];
  const __CFString *v9;
  id v10;

  v4 = a3;
  v5 = v4;
  if (self->_powerLogExists)
  {
    v9 = CFSTR("Applications");
    v10 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
      sub_1000E1364();
    PLLogRegisteredEvent(70, CFSTR("AppNotFrozenReason"), v6, 0);

  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "PowerLog does not exist", v8, 2u);
    }
  }

}

- (void)logPrewarm:(id)a3 pid:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *log;
  uint8_t v11[8];
  _QWORD v12[2];
  _QWORD v13[2];

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = v6;
  if (self->_powerLogExists)
  {
    v12[0] = CFSTR("BundleID");
    v12[1] = CFSTR("PID");
    v13[0] = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4));
    v13[1] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 2));

    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
      sub_1000E13C4();
    PLLogRegisteredEvent(70, CFSTR("Prewarm"), v9, 0);

  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "PowerLog does not exist", v11, 2u);
    }
  }

}

- (void)logDock:(id)a3 pid:(int)a4 state:(unint64_t)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *log;
  uint8_t v14[8];
  _QWORD v15[3];
  _QWORD v16[3];

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = v8;
  if (self->_powerLogExists)
  {
    v16[0] = v8;
    v15[0] = CFSTR("BundleID");
    v15[1] = CFSTR("PID");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v6));
    v16[1] = v10;
    v15[2] = CFSTR("State");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5));
    v16[2] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 3));

    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
      sub_1000E1424();
    PLLogRegisteredEvent(70, CFSTR("Dock"), v12, 0);

  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "PowerLog does not exist", v14, 2u);
    }
  }

}

- (id)appsFromProactiveSuggestions
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *log;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[8];
  uint64_t v28;
  Class (*v29)(uint64_t);
  void *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE v36[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (dlopen_preflight((const char *)objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/AppPredictionClient.framework/AppPredictionClient"), "UTF8String")))
  {
    v32 = 0;
    v33 = &v32;
    v34 = 0x2050000000;
    v4 = (void *)qword_1001AB558;
    v35 = qword_1001AB558;
    if (!qword_1001AB558)
    {
      *(_QWORD *)buf = _NSConcreteStackBlock;
      v28 = 3221225472;
      v29 = sub_10003F6CC;
      v30 = &unk_10015D610;
      v31 = &v32;
      sub_10003F6CC((uint64_t)buf);
      v4 = (void *)v33[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v32, 8);
    v22 = objc_msgSend([v5 alloc], "initWithConsumerSubType:", 9);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "suggestionLayoutFromCache"));
    v21 = v6;
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allSuggestionsInLayout", v6));
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v36, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(_QWORD *)v24 != v9)
              objc_enumerationMutation(v7);
            v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "executableSpecification"));
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "executableObject"));

            if (v13)
            {
              v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "scoreSpecification"));
              objc_msgSend(v14, "rawScore");
              v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "description"));
              objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, v16);

            }
          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v36, 16);
        }
        while (v8);
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[_APRSPLLogger topPredictionsFromScores:](_APRSPLLogger, "topPredictionsFromScores:", v3));

    }
    else
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Proactive predictions not cached, returning nil", buf, 2u);
      }
      v17 = 0;
    }

  }
  else
  {
    v18 = self->_log;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1000DFEB8(v18);
    v17 = 0;
  }

  return v17;
}

- (BOOL)getInferredCarryStatus
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](_CDClientContext, "userContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", self->_inferredCarryStatusKeyPath));
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)initializeCarryStatusLogging
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  NSObject *v10;
  NSObject *log;
  id v12;
  _QWORD v13[5];
  uint8_t buf[4];
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10003EC78;
  v13[3] = &unk_10015D5E8;
  v13[4] = self;
  objc_msgSend(v3, "registerForTaskWithIdentifier:usingQueue:launchHandler:", CFSTR("com.apple.appResume.inferCarryStatus"), 0, v13);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "taskRequestForIdentifier:", CFSTR("com.apple.appResume.inferCarryStatus")));

  if (!v5)
  {
    v6 = objc_msgSend(objc_alloc((Class)BGRepeatingSystemTaskRequest), "initWithIdentifier:", CFSTR("com.apple.appResume.inferCarryStatus"));
    objc_msgSend(v6, "setPriority:", 1);
    objc_msgSend(v6, "setInterval:", 86400.0);
    objc_msgSend(v6, "setMinDurationBetweenInstances:", 85400.0);
    objc_msgSend(v6, "setRequiresProtectionClass:", 3);
    objc_msgSend(v6, "setRequiresExternalPower:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
    v12 = 0;
    v8 = objc_msgSend(v7, "submitTaskRequest:error:", v6, &v12);
    v9 = v12;

    if ((v8 & 1) == 0)
    {
      v10 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Failed to submit task with error: %@", buf, 0xCu);
      }

    }
  }
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    sub_1000DFEF4(log);
}

- (void)logUpdatedCarryStatus
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *log;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](_CDClientContext, "userContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", self->_inferredCarryStatusKeyPath));
  v5 = objc_msgSend(v4, "BOOLValue");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DKKnowledgeStore knowledgeStore](_DKKnowledgeStore, "knowledgeStore"));
  v7 = -[_APRSPLLogger updateCarryStatusWithContext:withKnowledgeStore:](self, "updateCarryStatusWithContext:withKnowledgeStore:", v3, v6);

  if ((_DWORD)v5 == v7)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
      sub_1000DFFA4((uint64_t)v5, log, v12, v13, v14, v15, v16, v17);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v7));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, self->_inferredCarryStatusKeyPath);

    v9 = objc_alloc_init((Class)NSMutableDictionary);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v7));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("CarryType"));

    PLLogRegisteredEvent(70, CFSTR("AppResumeInferredCarry"), v9, 0);
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
      sub_1000E1484();

  }
}

- (BOOL)updateCarryStatusWithContext:(id)a3 withKnowledgeStore:(id)a4
{
  _BOOL8 v5;
  NSObject *log;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = -[_APRSPLLogger deviceHasEnoughPluggedInTimeWithMinimumDays:withContext:withKnowledgeStore:](self, "deviceHasEnoughPluggedInTimeWithMinimumDays:withContext:withKnowledgeStore:", a3, a4, 14.0);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    sub_1000E0008(v5, log, v7, v8, v9, v10, v11, v12);
  return v5;
}

- (BOOL)deviceHasEnoughPluggedInTimeWithMinimumDays:(double)a3 withContext:(id)a4 withKnowledgeStore:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  NSObject *log;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[2];

  v7 = a5;
  v37 = (void *)os_transaction_create("com.apple.appresume.carrystatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v9 = objc_claimAutoreleasedReturnValue(+[_DKQuery predicateForEventsWithMinimumDuration:](_DKQuery, "predicateForEventsWithMinimumDuration:", 7200.0));
  v10 = 1;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[_DKQuery predicateForEventsWithIntegerValue:](_DKQuery, "predicateForEventsWithIntegerValue:", 1));
  v36 = (void *)v9;
  v46[0] = v9;
  v46[1] = v35;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 2));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams deviceIsPluggedInStream](_DKSystemEventStreams, "deviceIsPluggedInStream"));
  v45 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v45, 1));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0));
  v44 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v44, 1));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[_DKEventQuery eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:](_DKEventQuery, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v12, v14, 0, 0, v16));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "executeQuery:error:", v17, 0));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[_APRSPLLogger concatenateContinuousEventsOfSameState:sortedAscending:](self, "concatenateContinuousEventsOfSameState:sortedAscending:", v18, 0));

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lastObject"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "startDate"));
    objc_msgSend(v8, "timeIntervalSinceDate:", v21);
    v23 = v22;

    if ((unint64_t)objc_msgSend(v19, "count") >= 8)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "firstObject"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "startDate"));
      objc_msgSend(v8, "timeIntervalSinceDate:", v25);
      if (v26 <= 604800.0)
      {

        if (v23 >= a3 * 86400.0)
        {
          v10 = 1;
          goto LABEL_9;
        }
      }
      else
      {

      }
    }
    log = self->_log;
    v10 = 0;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v28 = log;
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v19, "count")));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "firstObject"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "startDate"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lastObject"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "startDate"));
      *(_DWORD *)buf = 138412802;
      v39 = v29;
      v40 = 2112;
      v41 = v31;
      v42 = 2112;
      v43 = v33;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Not real carry device: %@ events, Last plugin: %@, First plugin: %@", buf, 0x20u);

      v10 = 0;
    }
  }
LABEL_9:

  return v10;
}

- (id)concatenateEventsPrivate:(id)a3
{
  id v3;
  id v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  unsigned int v32;
  void *v33;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") <= 1)
  {
    v4 = v3;
    goto LABEL_16;
  }
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = objc_msgSend(v3, "count");
  v6 = v5 - 1;
  if (v5 < 2)
  {
    if (v5 != 1)
      goto LABEL_16;
LABEL_18:
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 0));
    objc_msgSend(v4, "addObject:", v27);

    goto LABEL_16;
  }
  v29 = v4;
  do
  {
    v32 = v6;
    v7 = (v6 - 1);
    v8 = v7 + 1;
    v30 = v6 - 1;
    while (1)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", v8));
      v10 = objc_msgSend(v9, "integerValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", v7));
      if (v10 != objc_msgSend(v11, "integerValue"))
        break;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", v8));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "endDate"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", v7));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "startDate"));
      v16 = objc_msgSend(v13, "isEqualToDate:", v15);

      if (!v16)
        goto LABEL_11;
      --v7;
      if ((int)--v8 <= 0)
      {
        LODWORD(v7) = -1;
        goto LABEL_11;
      }
    }

LABEL_11:
    if ((int)v7 >= v30)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", v32));
      LODWORD(v7) = v30;
    }
    else
    {
      v17 = v32;
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", v32));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "stream"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", v17));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "startDate"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", (int)v7 + 1));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "endDate"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", v17));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "value"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", v17));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "metadata"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[_DKEvent eventWithStream:startDate:endDate:value:metadata:](_DKEvent, "eventWithStream:startDate:endDate:value:metadata:", v28, v18, v20, v22, v24));

    }
    v4 = v29;
    objc_msgSend(v29, "addObject:", v25);

    v6 = v7;
  }
  while ((int)v7 > 0);
  if (!(_DWORD)v7)
    goto LABEL_18;
LABEL_16:

  return v4;
}

- (id)concatenateContinuousEventsOfSameState:(id)a3 sortedAscending:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "reverseObjectEnumerator"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allObjects"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_APRSPLLogger concatenateEventsPrivate:](self, "concatenateEventsPrivate:", v6));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[_APRSPLLogger concatenateEventsPrivate:](self, "concatenateEventsPrivate:", a3));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "reverseObjectEnumerator"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allObjects"));

  }
  return v7;
}

- (BOOL)powerLogExists
{
  return self->_powerLogExists;
}

- (void)setPowerLogExists:(BOOL)a3
{
  self->_powerLogExists = a3;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (NSDate)lastReportedDate
{
  return self->_lastReportedDate;
}

- (void)setLastReportedDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastReportedDate, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (int)token
{
  return self->_token;
}

- (void)setToken:(int)a3
{
  self->_token = a3;
}

- (_CDContextualKeyPath)inferredCarryStatusKeyPath
{
  return self->_inferredCarryStatusKeyPath;
}

- (void)setInferredCarryStatusKeyPath:(id)a3
{
  objc_storeStrong((id *)&self->_inferredCarryStatusKeyPath, a3);
}

- (NSMutableArray)lastPredictions
{
  return self->_lastPredictions;
}

- (void)setLastPredictions:(id)a3
{
  objc_storeStrong((id *)&self->_lastPredictions, a3);
}

- (NSMutableDictionary)predictionAccuracies
{
  return self->_predictionAccuracies;
}

- (void)setPredictionAccuracies:(id)a3
{
  objc_storeStrong((id *)&self->_predictionAccuracies, a3);
}

- (NSDate)lastCAReportedDate
{
  return self->_lastCAReportedDate;
}

- (void)setLastCAReportedDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastCAReportedDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCAReportedDate, 0);
  objc_storeStrong((id *)&self->_predictionAccuracies, 0);
  objc_storeStrong((id *)&self->_lastPredictions, 0);
  objc_storeStrong((id *)&self->_inferredCarryStatusKeyPath, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_lastReportedDate, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
}

@end
