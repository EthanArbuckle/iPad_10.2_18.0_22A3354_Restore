@implementation _DASSwapModelApplicationKills

- (_DASSwapModelApplicationKills)init
{
  _DASSwapModelApplicationKills *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  OS_os_log *log;
  NSUserDefaults *v11;
  NSUserDefaults *killDefaults;
  uint64_t v13;
  _DASAppResumePLLogger *pLLogger;
  NSObject *v15;
  _DASSwapModelApplicationKills *v16;
  _QWORD block[4];
  _DASSwapModelApplicationKills *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)_DASSwapModelApplicationKills;
  v2 = -[_DASSwapModelApplicationKills init](&v20, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_BACKGROUND, 0);
    v6 = objc_claimAutoreleasedReturnValue(v5);

    v7 = dispatch_queue_create("com.apple.dasd.swap.appKillsModel", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v9 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("swap.appKillsModel")));
    log = v2->_log;
    v2->_log = (OS_os_log *)v9;

    v11 = (NSUserDefaults *)objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.dasd.swapkills"));
    killDefaults = v2->_killDefaults;
    v2->_killDefaults = v11;

    v13 = objc_claimAutoreleasedReturnValue(+[_DASAppResumePLLogger sharedInstance](_DASAppResumePLLogger, "sharedInstance"));
    pLLogger = v2->_pLLogger;
    v2->_pLLogger = (_DASAppResumePLLogger *)v13;

    v15 = v2->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000A45C8;
    block[3] = &unk_10015D4E0;
    v16 = v2;
    v19 = v16;
    dispatch_async(v15, block);
    -[_DASSwapModelApplicationKills registerDailyModelUpdateTask](v16, "registerDailyModelUpdateTask");

  }
  return v2;
}

+ (id)histogramEventStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("com.apple.dasd.jetsams"));
}

- (id)queryForHistogramWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_DASSwapModelApplicationKills histogramEventStream](_DASSwapModelApplicationKills, "histogramEventStream"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DKHistogramQuery histogramQueryForPersistedHistogramsForStream:withCustomIdentifier:](_DKHistogramQuery, "histogramQueryForPersistedHistogramsForStream:withCustomIdentifier:", v4, v3));

  return v5;
}

- (void)_queue_loadHistograms
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *todaysKillHistogram;
  NSDictionary **p_historicalKillHistogram;
  NSMutableSet *v12;
  NSMutableSet *zerosSet;
  NSObject *log;
  NSDate *lastSnapshotTime;
  NSObject *v16;
  NSMutableDictionary *v17;
  NSObject *v18;
  NSDictionary *v19;
  void *context;
  uint8_t buf[4];
  void *v22;

  context = objc_autoreleasePoolPush();
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults dictionaryForKey:](self->_killDefaults, "dictionaryForKey:", CFSTR("histograms")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("current")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("historical")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("zeros")));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("snapshotTS")));
  v8 = (void *)v7;
  if (!v4)
    v4 = &__NSDictionary0__struct;
  if (!v5)
    v5 = &__NSDictionary0__struct;
  if (!v6)
    v6 = &__NSArray0__struct;
  if (!v7)
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  v9 = (NSMutableDictionary *)objc_msgSend(v4, "mutableCopy");
  todaysKillHistogram = self->_todaysKillHistogram;
  self->_todaysKillHistogram = v9;

  p_historicalKillHistogram = &self->_historicalKillHistogram;
  objc_storeStrong((id *)&self->_historicalKillHistogram, v5);
  v12 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v6));
  zerosSet = self->_zerosSet;
  self->_zerosSet = v12;

  objc_storeStrong((id *)&self->_lastSnapshotTime, v8);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    lastSnapshotTime = self->_lastSnapshotTime;
    *(_DWORD *)buf = 138412290;
    v22 = lastSnapshotTime;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Last snapshot: %@", buf, 0xCu);
  }
  v16 = self->_log;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = self->_todaysKillHistogram;
    *(_DWORD *)buf = 138412290;
    v22 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Loaded current histogram: %@", buf, 0xCu);
  }
  v18 = self->_log;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = *p_historicalKillHistogram;
    *(_DWORD *)buf = 138412290;
    v22 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Loaded historical histogram: %@", buf, 0xCu);
  }

  objc_autoreleasePoolPop(context);
}

- (void)_queue_updateHistograms
{
  void *v3;
  NSDictionary *historicalKillHistogram;
  void *v5;
  NSDate *lastSnapshotTime;
  void *v7;
  _QWORD v8[4];
  _QWORD v9[4];

  v3 = objc_autoreleasePoolPush();
  v8[0] = CFSTR("current");
  v8[1] = CFSTR("historical");
  historicalKillHistogram = self->_historicalKillHistogram;
  v9[0] = self->_todaysKillHistogram;
  v9[1] = historicalKillHistogram;
  v8[2] = CFSTR("zeros");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_zerosSet, "allObjects"));
  v8[3] = CFSTR("snapshotTS");
  lastSnapshotTime = self->_lastSnapshotTime;
  v9[2] = v5;
  v9[3] = lastSnapshotTime;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 4));

  -[NSUserDefaults setObject:forKey:](self->_killDefaults, "setObject:forKey:", v7, CFSTR("histograms"));
  objc_autoreleasePoolPop(v3);
}

- (id)_queue_computeScores
{
  void *v3;
  NSDictionary *historicalKillHistogram;
  id v5;
  NSMutableDictionary *todaysKillHistogram;
  id v7;
  NSMutableSet *zerosSet;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  id v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  historicalKillHistogram = self->_historicalKillHistogram;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000A4AE4;
  v17[3] = &unk_10015EAA8;
  v17[4] = self;
  v5 = v3;
  v18 = v5;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](historicalKillHistogram, "enumerateKeysAndObjectsUsingBlock:", v17);
  todaysKillHistogram = self->_todaysKillHistogram;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000A4BAC;
  v15[3] = &unk_10015D480;
  v7 = v5;
  v16 = v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](todaysKillHistogram, "enumerateKeysAndObjectsUsingBlock:", v15);
  zerosSet = self->_zerosSet;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000A4C20;
  v13[3] = &unk_10015EAD0;
  v9 = v7;
  v14 = v9;
  -[NSMutableSet enumerateObjectsUsingBlock:](zerosSet, "enumerateObjectsUsingBlock:", v13);
  v10 = v14;
  v11 = v9;

  return v11;
}

- (void)updateModel
{
  OS_dispatch_queue *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A4CD8;
  block[3] = &unk_10015D4E0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)registerDailyModelUpdateTask
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  NSObject *v10;
  id v11;
  _QWORD v12[5];
  uint8_t buf[4];
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000A4F70;
  v12[3] = &unk_10015D5E8;
  v12[4] = self;
  objc_msgSend(v3, "registerForTaskWithIdentifier:usingQueue:launchHandler:", CFSTR("com.apple.dasd.swapModelUpdate"), 0, v12);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "taskRequestForIdentifier:", CFSTR("com.apple.dasd.swapModelUpdate")));

  if (!v5)
  {
    v6 = objc_msgSend(objc_alloc((Class)BGRepeatingSystemTaskRequest), "initWithIdentifier:", CFSTR("com.apple.dasd.swapModelUpdate"));
    objc_msgSend(v6, "setPriority:", 1);
    objc_msgSend(v6, "setRequiresExternalPower:", 0);
    objc_msgSend(v6, "setInterval:", 86400.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
    v11 = 0;
    v8 = objc_msgSend(v7, "submitTaskRequest:error:", v6, &v11);
    v9 = v11;

    if ((v8 & 1) == 0)
    {
      v10 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Failed to submit task with error: %@", buf, 0xCu);
      }

    }
  }
}

- (double)secondsFrom:(unint64_t)a3 until:(unint64_t)a4
{
  if (qword_1001ABCC8 != -1)
    dispatch_once(&qword_1001ABCC8, &stru_10015F990);
  return (double)((uint64_t)((a3 - a4) * dword_1001ABCC0) / *(unsigned int *)algn_1001ABCC4) / 1000000000.0;
}

- (id)appsRecentlyForegrounded
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *j;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  NSObject *log;
  id v36;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[4];
  id v54;
  uint8_t buf[4];
  void *v56;
  _BYTE v57[128];
  _BYTE v58[128];

  v44 = (void *)os_transaction_create("appsRecentlyForegrounded");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v3 = objc_alloc((Class)NSDateInterval);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dateByAddingTimeInterval:", -604800.0));
  v43 = v2;
  v5 = objc_msgSend(v3, "initWithStartDate:endDate:", v4, v2);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams appUsageStream](_DKSystemEventStreams, "appUsageStream"));
  v42 = v5;
  v7 = objc_claimAutoreleasedReturnValue(+[_DKHistogramQuery histogramQueryForStream:interval:](_DKHistogramQuery, "histogramQueryForStream:interval:", v6, v5));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPredictionManager sharedKnowledgeStore](_DASPredictionManager, "sharedKnowledgeStore"));
  v41 = (void *)v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "executeQuery:error:", v7, 0));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v39 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "countDictionary"));
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_1000A547C;
  v53[3] = &unk_10015EB18;
  v12 = v10;
  v54 = v12;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v53);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](_CDClientContext, "userContext"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForAppUsageDataDictionaries](_CDContextQueries, "keyPathForAppUsageDataDictionaries"));
  v38 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v14));

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v16 = v15;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v50 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries appUsageBundleID](_CDContextQueries, "appUsageBundleID"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", v22));
        objc_msgSend(v12, "addObject:", v23);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    }
    while (v18);
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v25 = v12;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v27; j = (char *)j + 1)
      {
        if (*(_QWORD *)v46 != v28)
          objc_enumerationMutation(v25);
        v30 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)j);
        v31 = objc_autoreleasePoolPush();
        v32 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", v30, 0, 0);
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "compatibilityObject"));

        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "bundleExecutable"));
        if (v34)
          objc_msgSend(v24, "addObject:", v34);

        objc_autoreleasePoolPop(v31);
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
    }
    while (v27);
  }

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v56 = v24;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Processes recently launched: %@", buf, 0xCu);
  }
  v36 = objc_msgSend(v24, "copy");

  return v36;
}

- (BOOL)process:(id)a3 inSet:(id)a4
{
  id v5;
  id v6;
  unsigned __int8 v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v5 = a3;
  v6 = a4;
  if ((unint64_t)objc_msgSend(v5, "length") > 0x1F)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "hasPrefix:", v5, (_QWORD)v14) & 1) != 0)
          {

            v7 = 1;
            goto LABEL_13;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v10)
          continue;
        break;
      }
    }

    v7 = 0;
  }
  else
  {
    v7 = objc_msgSend(v6, "containsObject:", v5);
  }
LABEL_13:

  return v7;
}

- (void)incorporateLatestJetsamStatistics
{
  void *v3;
  OS_dispatch_queue *queue;
  id v5;
  _QWORD block[5];
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModelApplicationKills appsRecentlyForegrounded](self, "appsRecentlyForegrounded"));
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A5650;
  block[3] = &unk_10015D558;
  block[4] = self;
  v7 = v3;
  v5 = v3;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (double)scoreForApplication:(id)a3 atDate:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModelApplicationKills scoresForAllApplicationsAtDate:](self, "scoresForAllApplicationsAtDate:", a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v6));

  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  return v10;
}

- (id)scoresForAllApplicationsAtDate:(id)a3
{
  void *v4;
  OS_dispatch_queue *queue;
  id v6;
  NSObject *log;
  id v8;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  _DASSwapModelApplicationKills *v14;
  id v15;
  uint8_t buf[4];
  id v17;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary", a3));
  queue = self->_queue;
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_1000A5D44;
  v13 = &unk_10015D558;
  v14 = self;
  v6 = v4;
  v15 = v6;
  dispatch_sync((dispatch_queue_t)queue, &v10);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Updating Kill Count: %@", buf, 0xCu);
  }
  v8 = objc_msgSend(v6, "copy", v10, v11, v12, v13, v14);

  return v8;
}

- (void)updateScores
{
  -[_DASSwapModelApplicationKills incorporateLatestJetsamStatistics](self, "incorporateLatestJetsamStatistics");
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMutableDictionary)todaysKillHistogram
{
  return self->_todaysKillHistogram;
}

- (void)setTodaysKillHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_todaysKillHistogram, a3);
}

- (NSDictionary)historicalKillHistogram
{
  return self->_historicalKillHistogram;
}

- (void)setHistoricalKillHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_historicalKillHistogram, a3);
}

- (NSMutableSet)zerosSet
{
  return self->_zerosSet;
}

- (void)setZerosSet:(id)a3
{
  objc_storeStrong((id *)&self->_zerosSet, a3);
}

- (_DASAppResumePLLogger)pLLogger
{
  return self->_pLLogger;
}

- (void)setPLLogger:(id)a3
{
  objc_storeStrong((id *)&self->_pLLogger, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (NSDate)lastSnapshotTime
{
  return self->_lastSnapshotTime;
}

- (void)setLastSnapshotTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastSnapshotTime, a3);
}

- (NSUserDefaults)killDefaults
{
  return self->_killDefaults;
}

- (void)setKillDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_killDefaults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_killDefaults, 0);
  objc_storeStrong((id *)&self->_lastSnapshotTime, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_pLLogger, 0);
  objc_storeStrong((id *)&self->_zerosSet, 0);
  objc_storeStrong((id *)&self->_historicalKillHistogram, 0);
  objc_storeStrong((id *)&self->_todaysKillHistogram, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
