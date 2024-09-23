@implementation _APRSBiomeEventAnalyzer

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100054CC0;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001AB7C8 != -1)
    dispatch_once(&qword_1001AB7C8, block);
  return (id)qword_1001AB7D0;
}

- (_APRSBiomeEventAnalyzer)init
{
  _APRSBiomeEventAnalyzer *v2;
  os_log_t v3;
  OS_os_log *log;
  NSMutableDictionary *v5;
  NSMutableDictionary *bookmarkDictionary;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_APRSBiomeEventAnalyzer;
  v2 = -[_APRSBiomeEventAnalyzer init](&v8, "init");
  if (v2)
  {
    v3 = os_log_create("com.apple.aprs", "appResume.BiomeAnalyzer");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    bookmarkDictionary = v2->_bookmarkDictionary;
    v2->_bookmarkDictionary = v5;

    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_bookmarkDictionary, "setObject:forKeyedSubscript:", 0, CFSTR("appKillBookmark"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_bookmarkDictionary, "setObject:forKeyedSubscript:", 0, CFSTR("appActivationInfoBookmark"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_bookmarkDictionary, "setObject:forKeyedSubscript:", 0, CFSTR("appActivationMeanBookmark"));
    -[_APRSBiomeEventAnalyzer setupDailyTask](v2, "setupDailyTask");
  }
  return v2;
}

- (void)logCompletion:(id)a3 forAnalysisName:(id)a4
{
  id v6;

  v6 = a4;
  if (objc_msgSend(a3, "state"))
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      sub_1000E2324();
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
  {
    sub_1000E22C4();
  }

}

- (void)setupDailyTask
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
  v12[2] = sub_100054FDC;
  v12[3] = &unk_10015D5E8;
  v12[4] = self;
  objc_msgSend(v3, "registerForTaskWithIdentifier:usingQueue:launchHandler:", CFSTR("com.apple.dasd.appResumeDaily"), 0, v12);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "taskRequestForIdentifier:", CFSTR("com.apple.dasd.appResumeDaily")));

  if (!v5)
  {
    v6 = objc_msgSend(objc_alloc((Class)BGRepeatingSystemTaskRequest), "initWithIdentifier:", CFSTR("com.apple.dasd.appResumeDaily"));
    objc_msgSend(v6, "setPriority:", 1);
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

- (id)meanDeltaTimeBetweenColdLaunchAndResume
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -1814400.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_APRSBiomeEventAnalyzer meanDeltaTimeBetweenColdLaunchAndResumeStartingAtDate:withBookmarkKey:](self, "meanDeltaTimeBetweenColdLaunchAndResumeStartingAtDate:withBookmarkKey:", v3, CFSTR("appActivationMeanBookmark")));

  return v4;
}

- (id)meanDeltaTimeBetweenColdLaunchAndResumeStartingAtDate:(id)a3 withBookmarkKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v6 = a3;
  v7 = a4;
  v8 = (void *)os_transaction_create("com.apple.dasd.appResumeMeanActivationTimeCalculations");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("App Activation Metrics - Mean calculation - start date: %@"), v6));
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_1000555FC;
  v28 = sub_10005560C;
  v29 = objc_alloc_init((Class)NSMutableDictionary);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bookmarkDictionary, "objectForKeyedSubscript:", v7));
  v11 = objc_claimAutoreleasedReturnValue(+[_APRSBiomeBase sharedEventQueue](_APRSBiomeBase, "sharedEventQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100055614;
  block[3] = &unk_10015E3C0;
  block[4] = self;
  v19 = v6;
  v20 = v10;
  v21 = v7;
  v22 = v9;
  v23 = &v24;
  v12 = v9;
  v13 = v7;
  v14 = v10;
  v15 = v6;
  dispatch_sync(v11, block);
  v16 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v16;
}

- (id)allAppActivationTimeInfo
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -1814400.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_APRSBiomeEventAnalyzer appActivationTimeInfoStartingAtDate:withBookmarkKey:](self, "appActivationTimeInfoStartingAtDate:withBookmarkKey:", v3, CFSTR("appActivationInfoBookmark")));

  return v4;
}

- (id)appActivationTimeInfoStartingAtDate:(id)a3 withBookmarkKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v6 = a3;
  v7 = a4;
  v8 = (void *)os_transaction_create("com.apple.dasd.appResumeAllActivationTimeCalculations");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("App Activation Metrics - Info calculation - start date: %@"), v6));
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_1000555FC;
  v28 = sub_10005560C;
  v29 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bookmarkDictionary, "objectForKeyedSubscript:", v7));
  v11 = objc_claimAutoreleasedReturnValue(+[_APRSBiomeBase sharedEventQueue](_APRSBiomeBase, "sharedEventQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100055A94;
  block[3] = &unk_10015E3C0;
  block[4] = self;
  v19 = v6;
  v20 = v10;
  v21 = v7;
  v22 = v9;
  v23 = &v24;
  v12 = v9;
  v13 = v7;
  v14 = v10;
  v15 = v6;
  dispatch_sync(v11, block);
  v16 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v16;
}

- (id)appActivationPublisherForEventsFrom:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_APRSBiomeBase publisherForEventsStartingFromDate:](_APRSBiomeAppLaunchTimeEvent, "publisherForEventsStartingFromDate:", v3));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "filterWithIsIncluded:", &stru_10015E400));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "reduceWithInitial:nextPartialResult:", v4, &stru_10015E440));

  return v7;
}

- (id)allAppKillsInfo
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -1814400.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_APRSBiomeEventAnalyzer appKillsInfoStartingAtDate:withBookmarkKey:](self, "appKillsInfoStartingAtDate:withBookmarkKey:", v3, CFSTR("appKillBookmark")));

  return v4;
}

- (id)appKillsInfoStartingAtDate:(id)a3 withBookmarkKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v6 = a3;
  v7 = a4;
  v8 = (void *)os_transaction_create("com.apple.dasd.appResumeAllAppKillInfoCalculations");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("App Kill Metrics - Info calculation - start date: %@"), v6));
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_1000555FC;
  v28 = sub_10005560C;
  v29 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bookmarkDictionary, "objectForKeyedSubscript:", v7));
  v11 = objc_claimAutoreleasedReturnValue(+[_APRSBiomeBase sharedEventQueue](_APRSBiomeBase, "sharedEventQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005604C;
  block[3] = &unk_10015E3C0;
  block[4] = self;
  v19 = v6;
  v20 = v10;
  v21 = v7;
  v22 = v9;
  v23 = &v24;
  v12 = v9;
  v13 = v7;
  v14 = v10;
  v15 = v6;
  dispatch_sync(v11, block);
  v16 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v16;
}

- (id)appKillsInfoPublisherForEventsFrom:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_APRSBiomeBase publisherForEventsStartingFromDate:](_APRSBiomeAppKillEvent, "publisherForEventsStartingFromDate:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "filterWithIsIncluded:", &stru_10015E4A0));
  v5 = objc_alloc_init((Class)NSMutableDictionary);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "reduceWithInitial:nextPartialResult:", v5, &stru_10015E4C0));

  return v6;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (NSMutableDictionary)bookmarkDictionary
{
  return self->_bookmarkDictionary;
}

- (void)setBookmarkDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_bookmarkDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmarkDictionary, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
