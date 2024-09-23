@implementation _DASGridDataManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100041334;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001AB598 != -1)
    dispatch_once(&qword_1001AB598, block);
  return (id)qword_1001AB5A0;
}

- (_DASGridDataManager)init
{
  _DASGridDataManager *v2;
  os_log_t v3;
  OS_os_log *log;
  NSUserDefaults *v5;
  NSUserDefaults *defaults;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  uint64_t v11;
  _CDContext *context;
  void *v13;
  id v14;
  uint64_t v15;
  _OSChargingPredictor *pluggedInPredictor;
  dispatch_queue_global_t global_queue;
  NSObject *v18;
  _QWORD v20[4];
  _DASGridDataManager *v21;
  objc_super v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v22.receiver = self;
  v22.super_class = (Class)_DASGridDataManager;
  v2 = -[_DASGridDataManager init](&v22, "init");
  if (v2)
  {
    v3 = os_log_create("com.apple.duetactivityscheduler", "GridDataManager");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = (NSUserDefaults *)objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.duetactivityscheduler"));
    defaults = v2->_defaults;
    v2->_defaults = v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create("com.apple.das.griddatamanager", v8);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;

    v2->_forecastCacheSeconds = 14400.0;
    -[_DASGridDataManager loadState](v2, "loadState");
    v11 = objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](_CDClientContext, "userContext"));
    context = v2->_context;
    v2->_context = (_CDContext *)v11;

    v24 = 0;
    v25 = &v24;
    v26 = 0x2050000000;
    v13 = (void *)qword_1001AB5A8;
    v27 = qword_1001AB5A8;
    if (!qword_1001AB5A8)
    {
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_1000428F8;
      v23[3] = &unk_10015D610;
      v23[4] = &v24;
      sub_1000428F8((uint64_t)v23);
      v13 = (void *)v25[3];
    }
    v14 = objc_retainAutorelease(v13);
    _Block_object_dispose(&v24, 8);
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "predictor"));
    pluggedInPredictor = v2->_pluggedInPredictor;
    v2->_pluggedInPredictor = (_OSChargingPredictor *)v15;

    -[_DASGridDataManager monitorPluggedInState](v2, "monitorPluggedInState");
    v2->_debugNotifyToken = -1;
    global_queue = dispatch_get_global_queue(-32768, 0);
    v18 = objc_claimAutoreleasedReturnValue(global_queue);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100041578;
    v20[3] = &unk_10015D9B8;
    v21 = v2;
    notify_register_dispatch("com.apple.dasd.testGridDataManager", &v2->_debugNotifyToken, v18, v20);

  }
  return v2;
}

- (void)monitorPluggedInState
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](_CDContextQueries, "keyPathForPluginStatus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", v3));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10004167C;
  v6[3] = &unk_10015D740;
  v6[4] = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualChangeRegistration localWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:](_CDContextualChangeRegistration, "localWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:", CFSTR("com.apple.das.environmentpolicy.pluggedInState"), v4, CFSTR("com.apple.dasd.contextstore-registration"), v6));

  -[_CDContext registerCallback:](self->_context, "registerCallback:", v5);
}

- (void)setupHighCarbonImpactWindow:(double)a3
{
  OS_dispatch_queue *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100041860;
  v4[3] = &unk_10015DF50;
  *(double *)&v4[5] = a3;
  v4[4] = self;
  dispatch_sync((dispatch_queue_t)queue, v4);
}

- (BOOL)isHighCarbonImpactWindow
{
  return -[_DASGridDataManager isCarbonImpactHighForState:](self, "isCarbonImpactHighForState:", self->_context);
}

- (BOOL)isCarbonImpactHighForState:(id)a3
{
  unsigned int v4;
  double v5;
  double pluggedInPredictionInterval;
  double v7;
  double v8;

  v4 = +[_DASSystemContext isPluggedIn:](_DASSystemContext, "isPluggedIn:", a3);
  if (v4)
  {
    if (!self->_carbonImpactWindowStartDate
      || (-[NSDate timeIntervalSinceNow](self->_carbonImpactWindowFetchTime, "timeIntervalSinceNow"),
          v5 < -self->_forecastCacheSeconds))
    {
      pluggedInPredictionInterval = self->_pluggedInPredictionInterval;
      if (pluggedInPredictionInterval == -99999.0)
      {
        -[_DASGridDataManager updatePredictedInterval](self, "updatePredictedInterval");
        pluggedInPredictionInterval = self->_pluggedInPredictionInterval;
      }
      -[_DASGridDataManager setupHighCarbonImpactWindow:](self, "setupHighCarbonImpactWindow:", pluggedInPredictionInterval);
    }
    -[NSDate timeIntervalSinceNow](self->_carbonImpactWindowStartDate, "timeIntervalSinceNow");
    LOBYTE(v4) = v7 < 0.0
              && (-[NSDate timeIntervalSinceNow](self->_carbonImpactWindowEndDate, "timeIntervalSinceNow"), v8 > 0.0);
  }
  return v4;
}

- (id)forecastForTimeInterval:(double)a3 from:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  unint64_t v12;
  char *i;
  void *v14;
  void *v15;
  id v17;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "forecastMap"));
  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allKeys"));
    v8 = objc_msgSend(v7, "mutableCopy");

    v9 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("self"), 1);
    v17 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
    objc_msgSend(v8, "sortUsingDescriptors:", v10);

    v11 = objc_msgSend(v8, "count");
    if ((unint64_t)v11 >= (a3 / 900.0))
      v12 = (a3 / 900.0);
    else
      v12 = (unint64_t)v11;
    if (v12)
    {
      for (i = 0; i != (char *)v12; ++i)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", i));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v14));

        objc_msgSend(v6, "addObject:", v15);
      }
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (double)predictedPluggedInterval
{
  _OSChargingPredictor *pluggedInPredictor;
  void *v4;
  id v5;
  NSObject *log;
  NSObject *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  NSObject *v13;
  BOOL v14;
  double v15;
  double v16;
  id v18;
  uint8_t buf[4];
  double v20;
  __int16 v21;
  double v22;

  pluggedInPredictor = self->_pluggedInPredictor;
  v18 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_OSChargingPredictor chargePredictionOutputOfScheme:withError:](pluggedInPredictor, "chargePredictionOutputOfScheme:withError:", 0, &v18));
  v5 = v18;
  if (v5)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v7 = log;
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedDescription"));
      *(_DWORD *)buf = 138412290;
      v20 = *(double *)&v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Error querying the predictor through the client %@", buf, 0xCu);

    }
  }
  objc_msgSend(v4, "confidence");
  v10 = v9;
  objc_msgSend(v4, "chargingDuration");
  v12 = v11;
  v13 = self->_log;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v20 = v12;
    v21 = 2048;
    v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "OSIntelligence predicts Interval:%lf, Confidence:%lf", buf, 0x16u);
  }
  v14 = v10 < 0.75;
  v15 = 0.0;
  if (v14)
    v16 = 0.0;
  else
    v16 = v12;
  if (v16 >= 7200.0)
  {
    v15 = v16;
    if (v16 > 27000.0)
      v15 = 27000.0;
  }

  return v15;
}

- (id)carbonImpactWindowStartForForecast:(id)a3 withStartDate:(id)a4 windowSize:(double)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  uint64_t v26;
  char *v27;
  void *v28;
  char *v29;
  char *v30;
  unint64_t v31;
  char *v32;
  char *v33;
  void *v34;
  char *v35;
  BOOL v36;
  void *v37;
  int64_t v38;
  void *v39;
  NSObject *log;
  NSObject *v41;
  void *v42;
  _DASGridDataManager *v44;
  id v45;
  id v46;
  uint8_t buf[4];
  unint64_t v48;
  __int16 v49;
  void *v50;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "count"))
  {
    v10 = objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v10, "sortUsingComparator:", &stru_10015DF70);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 0));
    objc_msgSend(v11, "doubleValue");
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastObject"));
    objc_msgSend(v14, "doubleValue");
    v16 = vabdd_f64(v13, v15);

    if (v16 >= 100.0)
    {
      v25 = (unint64_t)fmax(floor(a5 / 900.0) + -1.0, 0.0);
      if ((unint64_t)objc_msgSend(v8, "count") >= v25)
      {
        v45 = v10;
        v46 = v9;
        v44 = self;
        if (v25)
        {
          v26 = 0;
          v27 = 0;
          do
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v26));
            v27 = &v27[(_QWORD)objc_msgSend(v28, "unsignedIntegerValue")];

            ++v26;
          }
          while (v25 != v26);
        }
        else
        {
          v27 = 0;
        }
        if ((unint64_t)objc_msgSend(v8, "count") <= v25
          || (v29 = (char *)objc_msgSend(v8, "count"), v30 = &v29[-v25], v29 == (char *)v25))
        {
          v31 = 0;
        }
        else
        {
          v32 = 0;
          v31 = 0;
          v33 = 0;
          do
          {
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", &v32[v25]));
            v35 = &v27[(_QWORD)objc_msgSend(v34, "unsignedIntegerValue")];

            v36 = v35 >= v33;
            if (v35 > v33)
              v33 = v35;
            if (v36)
              v31 = (unint64_t)v32;
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v32));
            v38 = v27 - (_BYTE *)objc_msgSend(v37, "unsignedIntegerValue");

            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", &v32[v25]));
            v27 = (char *)objc_msgSend(v39, "unsignedIntegerValue") + v38;

            ++v32;
          }
          while (v30 != v32);
        }
        log = v44->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
        {
          v41 = log;
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v31));
          *(_DWORD *)buf = 134218242;
          v48 = v31;
          v49 = 2112;
          v50 = v42;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "HighCarbonImpact startIndex %lu, startValue %@", buf, 0x16u);

        }
        v9 = v46;
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v46, (double)v31 * 900.0));
        v10 = v45;
      }
      else
      {
        v24 = 0;
      }
    }
    else
    {
      v17 = self->_log;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = v17;
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 0));
        objc_msgSend(v19, "doubleValue");
        v21 = v20;
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastObject"));
        objc_msgSend(v22, "doubleValue");
        *(_DWORD *)buf = 134218240;
        v48 = v21;
        v49 = 2048;
        v50 = v23;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Not enough variation in forecast values (%lf - %lf). Bailing", buf, 0x16u);

      }
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (void)resetState
{
  NSDate *carbonImpactWindowStartDate;
  NSDate *carbonImpactWindowEndDate;
  NSDate *carbonImpactWindowFetchTime;

  -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", CFSTR("pluggedInPredictionInterval"));
  -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", CFSTR("carbonImpactStartDateInterval"));
  -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", CFSTR("carbonImpactEndDateInterval"));
  -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", CFSTR("carbonImpactFetchDateInterval"));
  -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", CFSTR("forecastCacheInterval"));
  self->_pluggedInPredictionInterval = -99999.0;
  carbonImpactWindowStartDate = self->_carbonImpactWindowStartDate;
  self->_carbonImpactWindowStartDate = 0;

  carbonImpactWindowEndDate = self->_carbonImpactWindowEndDate;
  self->_carbonImpactWindowEndDate = 0;

  carbonImpactWindowFetchTime = self->_carbonImpactWindowFetchTime;
  self->_carbonImpactWindowFetchTime = 0;

  self->_forecastCacheSeconds = 14400.0;
}

- (void)loadState
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  NSDate *v7;
  NSDate *carbonImpactWindowStartDate;
  void *v9;
  NSDate *v10;
  NSDate *carbonImpactWindowEndDate;
  void *v12;
  NSDate *v13;
  NSDate *carbonImpactWindowFetchTime;
  void *v15;
  double v16;
  NSObject *log;
  double pluggedInPredictionInterval;
  NSDate *v19;
  NSDate *v20;
  NSDate *v21;
  double forecastCacheSeconds;
  int v23;
  double v24;
  __int16 v25;
  NSDate *v26;
  __int16 v27;
  NSDate *v28;
  __int16 v29;
  NSDate *v30;
  __int16 v31;
  double v32;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("pluggedInPredictionInterval")));
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "doubleValue");
  else
    v5 = -99999.0;
  self->_pluggedInPredictionInterval = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("carbonImpactStartDateInterval")));

  if (v6)
  {
    objc_msgSend(v6, "doubleValue");
    v7 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
    carbonImpactWindowStartDate = self->_carbonImpactWindowStartDate;
    self->_carbonImpactWindowStartDate = v7;

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("carbonImpactEndDateInterval")));

  if (v9)
  {
    objc_msgSend(v9, "doubleValue");
    v10 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
    carbonImpactWindowEndDate = self->_carbonImpactWindowEndDate;
    self->_carbonImpactWindowEndDate = v10;

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("carbonImpactFetchDateInterval")));

  if (v12)
  {
    objc_msgSend(v12, "doubleValue");
    v13 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
    carbonImpactWindowFetchTime = self->_carbonImpactWindowFetchTime;
    self->_carbonImpactWindowFetchTime = v13;

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("forecastCacheInterval")));

  if (v15)
  {
    objc_msgSend(v15, "doubleValue");
    self->_forecastCacheSeconds = fmax(v16, 14400.0);
  }
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v19 = self->_carbonImpactWindowEndDate;
    pluggedInPredictionInterval = self->_pluggedInPredictionInterval;
    v20 = self->_carbonImpactWindowFetchTime;
    forecastCacheSeconds = self->_forecastCacheSeconds;
    v21 = self->_carbonImpactWindowStartDate;
    v23 = 134219010;
    v24 = pluggedInPredictionInterval;
    v25 = 2112;
    v26 = v21;
    v27 = 2112;
    v28 = v19;
    v29 = 2112;
    v30 = v20;
    v31 = 2048;
    v32 = forecastCacheSeconds;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Loaded state: PluggedIn interval %lf, carbonImpactStart %@, carbonImpactEnd %@, FetchDate %@, Forecast Cache internal %f", (uint8_t *)&v23, 0x34u);
  }

}

- (void)updatePredictedInterval
{
  double v3;

  -[_DASGridDataManager predictedPluggedInterval](self, "predictedPluggedInterval");
  self->_pluggedInPredictionInterval = v3;
  -[NSUserDefaults setDouble:forKey:](self->_defaults, "setDouble:forKey:", CFSTR("pluggedInPredictionInterval"));
}

- (void)saveCarbonImpactWindowState
{
  -[NSDate timeIntervalSinceReferenceDate](self->_carbonImpactWindowStartDate, "timeIntervalSinceReferenceDate");
  -[NSUserDefaults setDouble:forKey:](self->_defaults, "setDouble:forKey:", CFSTR("carbonImpactStartDateInterval"));
  -[NSDate timeIntervalSinceReferenceDate](self->_carbonImpactWindowEndDate, "timeIntervalSinceReferenceDate");
  -[NSUserDefaults setDouble:forKey:](self->_defaults, "setDouble:forKey:", CFSTR("carbonImpactEndDateInterval"));
  -[NSDate timeIntervalSinceReferenceDate](self->_carbonImpactWindowFetchTime, "timeIntervalSinceReferenceDate");
  -[NSUserDefaults setDouble:forKey:](self->_defaults, "setDouble:forKey:", CFSTR("carbonImpactFetchDateInterval"));
  -[NSUserDefaults setDouble:forKey:](self->_defaults, "setDouble:forKey:", CFSTR("forecastCacheInterval"), self->_forecastCacheSeconds);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (int)debugNotifyToken
{
  return self->_debugNotifyToken;
}

- (void)setDebugNotifyToken:(int)a3
{
  self->_debugNotifyToken = a3;
}

- (NSDate)carbonImpactWindowFetchTime
{
  return self->_carbonImpactWindowFetchTime;
}

- (void)setCarbonImpactWindowFetchTime:(id)a3
{
  objc_storeStrong((id *)&self->_carbonImpactWindowFetchTime, a3);
}

- (_OSChargingPredictor)pluggedInPredictor
{
  return self->_pluggedInPredictor;
}

- (void)setPluggedInPredictor:(id)a3
{
  objc_storeStrong((id *)&self->_pluggedInPredictor, a3);
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (double)forecastCacheSeconds
{
  return self->_forecastCacheSeconds;
}

- (void)setForecastCacheSeconds:(double)a3
{
  self->_forecastCacheSeconds = a3;
}

- (NSDate)carbonImpactWindowStartDate
{
  return self->_carbonImpactWindowStartDate;
}

- (void)setCarbonImpactWindowStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_carbonImpactWindowStartDate, a3);
}

- (NSDate)carbonImpactWindowEndDate
{
  return self->_carbonImpactWindowEndDate;
}

- (void)setCarbonImpactWindowEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_carbonImpactWindowEndDate, a3);
}

- (double)pluggedInPredictionInterval
{
  return self->_pluggedInPredictionInterval;
}

- (void)setPluggedInPredictionInterval:(double)a3
{
  self->_pluggedInPredictionInterval = a3;
}

- (_CDContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_carbonImpactWindowEndDate, 0);
  objc_storeStrong((id *)&self->_carbonImpactWindowStartDate, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_pluggedInPredictor, 0);
  objc_storeStrong((id *)&self->_carbonImpactWindowFetchTime, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
