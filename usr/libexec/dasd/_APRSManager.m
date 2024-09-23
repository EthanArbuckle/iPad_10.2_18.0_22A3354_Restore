@implementation _APRSManager

- (void)extractResumeLaunchSignposts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSDate *signpostReaderDate;
  double v8;
  NSDate *v9;
  NSDate *v10;
  NSObject *log;
  __int128 v12;
  double v13;
  OS_os_log *v14;
  NSDate *v15;
  NSDate *v16;
  uint64_t v17;
  unsigned __int8 v18;
  id v19;
  NSObject *v20;
  __int128 v21;
  id v22;
  _QWORD v23[5];
  uint8_t v24[4];
  uint64_t v25;
  __int128 buf;
  uint64_t v27;
  char v28;

  v4 = a3;
  v5 = (void *)os_transaction_create("com.apple.dasd.appResume.SignpostReader");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  signpostReaderDate = self->_signpostReaderDate;
  if (!signpostReaderDate
    || (-[NSDate timeIntervalSinceDate:](signpostReaderDate, "timeIntervalSinceDate:", v6), v8 < -86400.0))
  {
    v9 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -86400.0));
    v10 = self->_signpostReaderDate;
    self->_signpostReaderDate = v9;

  }
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = CFSTR("com.apple.appResume.signpostReader");
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Started %@!", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v27 = 0x2020000000;
  v28 = 0;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000CA3E8;
  v23[3] = &unk_10015D610;
  v23[4] = &buf;
  objc_msgSend(v4, "setExpirationHandler:", v23);
  -[_APRSSignpostReader begin](self->_signpostReader, "begin");
  *(_QWORD *)&v12 = 134217984;
  v21 = v12;
  while (1)
  {
    -[NSDate timeIntervalSinceDate:](self->_signpostReaderDate, "timeIntervalSinceDate:", v6, v21);
    if (v13 >= -3600.0 || *(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
      break;
    v14 = self->_log;
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEBUG))
    {
      -[NSDate timeIntervalSinceDate:](self->_signpostReaderDate, "timeIntervalSinceDate:", v6);
      *(_DWORD *)v24 = v21;
      v25 = v17;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v14, OS_LOG_TYPE_DEBUG, "Time interval %f", v24, 0xCu);
    }

    v15 = (NSDate *)objc_claimAutoreleasedReturnValue(-[NSDate dateByAddingTimeInterval:](self->_signpostReaderDate, "dateByAddingTimeInterval:", 3600.0));
    -[_APRSSignpostReader logAppResumeAndLaunchesFrom:endDate:](self->_signpostReader, "logAppResumeAndLaunchesFrom:endDate:", self->_signpostReaderDate, v15);
    -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", v15, CFSTR("signpostReaderDate"));
    v16 = self->_signpostReaderDate;
    self->_signpostReaderDate = v15;

  }
  -[_APRSSignpostReader end](self->_signpostReader, "end");
  if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
  {
    v22 = 0;
    v18 = objc_msgSend(v4, "setTaskExpiredWithRetryAfter:error:", &v22, 0.0);
    v19 = v22;
    if ((v18 & 1) == 0)
    {
      v20 = self->_log;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        sub_1000EB0E8((uint64_t)v19, v20);
      objc_msgSend(v4, "setTaskCompleted");
    }

  }
  else
  {
    objc_msgSend(v4, "setTaskCompleted");
  }
  _Block_object_dispose(&buf, 8);

}

- (_APRSManager)init
{
  _APRSManager *v2;
  os_log_t v3;
  OS_os_log *log;
  uint64_t v5;
  _APRSRecommendationEngine *engine;
  uint64_t v7;
  _APRSFreezerInterface *freezer;
  uint64_t v9;
  _APRSPrewarmInterface *prewarmLauncher;
  _APRSSignpostReader *v11;
  _APRSSignpostReader *signpostReader;
  NSUserDefaults *v13;
  NSUserDefaults *defaults;
  uint64_t v15;
  NSDate *signpostReaderDate;
  NSInteger v17;
  void *v18;
  _APRSManager *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  unsigned __int8 v24;
  id v25;
  NSObject *v26;
  NSObject *queue;
  _APRSManager *v28;
  dispatch_queue_attr_t v29;
  NSObject *v30;
  dispatch_queue_attr_t v31;
  NSObject *v32;
  dispatch_queue_t v33;
  OS_dispatch_queue *v34;
  uint64_t v35;
  _APRSBiomeAppKillEventWriter *appKillEventWriter;
  uint64_t v37;
  _APRSBiomeEventAnalyzer *eventAnalyzer;
  _QWORD v40[4];
  _APRSManager *v41;
  _QWORD handler[4];
  _APRSManager *v43;
  id v44;
  _QWORD v45[4];
  _APRSManager *v46;
  objc_super v47;
  uint8_t buf[4];
  id v49;

  v47.receiver = self;
  v47.super_class = (Class)_APRSManager;
  v2 = -[_APRSManager init](&v47, "init");
  if (v2)
  {
    v3 = os_log_create("com.apple.aprs", "appResume.manager");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[_APRSRecommendationEngine sharedInstance](_APRSRecommendationEngine, "sharedInstance"));
    engine = v2->_engine;
    v2->_engine = (_APRSRecommendationEngine *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[_APRSFreezerInterface sharedInstance](_APRSFreezerInterface, "sharedInstance"));
    freezer = v2->_freezer;
    v2->_freezer = (_APRSFreezerInterface *)v7;

    v9 = objc_claimAutoreleasedReturnValue(+[_APRSPrewarmInterface sharedInstance](_APRSPrewarmInterface, "sharedInstance"));
    prewarmLauncher = v2->_prewarmLauncher;
    v2->_prewarmLauncher = (_APRSPrewarmInterface *)v9;

    v11 = objc_opt_new(_APRSSignpostReader);
    signpostReader = v2->_signpostReader;
    v2->_signpostReader = v11;

    v13 = (NSUserDefaults *)objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.duetactivityscheduler"));
    defaults = v2->_defaults;
    v2->_defaults = v13;

    v15 = objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v2->_defaults, "objectForKey:", CFSTR("signpostReaderDate")));
    signpostReaderDate = v2->_signpostReaderDate;
    v2->_signpostReaderDate = (NSDate *)v15;

    v17 = -[NSUserDefaults integerForKey:](v2->_defaults, "integerForKey:", CFSTR("prewarmRecomputeInterval"));
    if (v17)
    {
      qword_1001AB138 = (int)v17;
      qword_1001AB140 = (int)v17 / 6;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_1000CA86C;
    v45[3] = &unk_10015D5E8;
    v19 = v2;
    v46 = v19;
    objc_msgSend(v18, "registerForTaskWithIdentifier:usingQueue:launchHandler:", CFSTR("com.apple.appResume.signpostReader"), 0, v45);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "taskRequestForIdentifier:", CFSTR("com.apple.appResume.signpostReader")));

    if (!v21)
    {
      v22 = objc_msgSend(objc_alloc((Class)BGRepeatingSystemTaskRequest), "initWithIdentifier:", CFSTR("com.apple.appResume.signpostReader"));
      objc_msgSend(v22, "setPriority:", 1);
      objc_msgSend(v22, "setInterval:", 86400.0);
      objc_msgSend(v22, "setMinDurationBetweenInstances:", 85400.0);
      objc_msgSend(v22, "setRequiresUserInactivity:", 1);
      objc_msgSend(v22, "setResourceIntensive:", 1);
      objc_msgSend(v22, "setResources:", 7);
      objc_msgSend(v22, "setRequiresProtectionClass:", 3);
      objc_msgSend(v22, "setRequiresExternalPower:", 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
      v44 = 0;
      v24 = objc_msgSend(v23, "submitTaskRequest:error:", v22, &v44);
      v25 = v44;

      if ((v24 & 1) == 0)
      {
        v26 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v49 = v25;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Failed to submit task with error: %@", buf, 0xCu);
        }

      }
    }
    v19->_debugNotifyToken = -1;
    queue = v19->_queue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000CA878;
    handler[3] = &unk_10015D9B8;
    v28 = v19;
    v43 = v28;
    notify_register_dispatch("com.apple.dasd.appResume.Signpost", &v19->_debugNotifyToken, queue, handler);
    v29 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v30 = objc_claimAutoreleasedReturnValue(v29);
    v31 = dispatch_queue_attr_make_with_qos_class(v30, QOS_CLASS_BACKGROUND, 0);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    v33 = dispatch_queue_create("com.apple.appresume.manager", v32);
    v34 = v19->_queue;
    v19->_queue = (OS_dispatch_queue *)v33;

    v35 = objc_claimAutoreleasedReturnValue(+[_APRSBiomeAppKillEventWriter sharedInstance](_APRSBiomeAppKillEventWriter, "sharedInstance"));
    appKillEventWriter = v28->_appKillEventWriter;
    v28->_appKillEventWriter = (_APRSBiomeAppKillEventWriter *)v35;

    v37 = objc_claimAutoreleasedReturnValue(+[_APRSBiomeEventAnalyzer sharedInstance](_APRSBiomeEventAnalyzer, "sharedInstance"));
    eventAnalyzer = v28->_eventAnalyzer;
    v28->_eventAnalyzer = (_APRSBiomeEventAnalyzer *)v37;

    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_1000CA884;
    v40[3] = &unk_10015D4E0;
    v41 = v28;
    -[_APRSManager setupTriggerWithHandler:](v41, "setupTriggerWithHandler:", v40);

  }
  return v2;
}

+ (_APRSManager)sharedInstance
{
  if (qword_1001ABD80 != -1)
    dispatch_once(&qword_1001ABD80, &stru_100160130);
  return (_APRSManager *)(id)qword_1001ABD78;
}

- (void)setupTriggerWithHandler:(id)a3
{
  id v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *timer;
  NSObject *v7;
  id v8;
  NSObject *v9;
  dispatch_time_t v10;
  _DASDataProtectionStateMonitor *v11;
  _DASDataProtectionStateMonitor *dataProtectionStateMonitor;
  _DASDataProtectionStateMonitor *v13;
  void *v14;
  NSObject *log;
  int *p_notifyToken;
  NSObject *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[8];
  _QWORD v22[4];
  id v23;
  id location;
  _QWORD handler[4];
  id v26;

  v4 = a3;
  v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
  timer = self->_timer;
  self->_timer = v5;

  dispatch_set_qos_class_fallback(self->_timer, 17);
  v7 = self->_timer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000CAB60;
  handler[3] = &unk_100160158;
  v8 = v4;
  v26 = v8;
  dispatch_source_set_event_handler(v7, handler);
  v9 = self->_timer;
  v10 = dispatch_walltime(0, 10000000000);
  dispatch_source_set_timer(v9, v10, 1000000000 * qword_1001AB138, 1000000000 * qword_1001AB140);
  v11 = objc_alloc_init(_DASDataProtectionStateMonitor);
  dataProtectionStateMonitor = self->_dataProtectionStateMonitor;
  self->_dataProtectionStateMonitor = v11;

  objc_initWeak(&location, self);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000CAB6C;
  v22[3] = &unk_10015D438;
  objc_copyWeak(&v23, &location);
  -[_DASDataProtectionStateMonitor setChangeHandler:](self->_dataProtectionStateMonitor, "setChangeHandler:", v22);
  v13 = self->_dataProtectionStateMonitor;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDataProtectionStateMonitor dataProtectionClassC](_DASDataProtectionStateMonitor, "dataProtectionClassC"));
  LODWORD(v13) = -[_DASDataProtectionStateMonitor isDataAvailableFor:](v13, "isDataAvailableFor:", v14);

  if ((_DWORD)v13)
  {
    self->_classCUnlocked = 1;
    dispatch_activate((dispatch_object_t)self->_timer);
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Class C not yet available.", buf, 2u);
    }
  }
  self->_notifyToken = -1;
  p_notifyToken = &self->_notifyToken;
  v17 = *(NSObject **)(p_notifyToken + 7);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000CACC4;
  v19[3] = &unk_100160180;
  v18 = v8;
  v20 = v18;
  notify_register_dispatch("com.apple.aprs.triggerHandler", p_notifyToken, v17, v19);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

}

- (void)feedNewRecommendations
{
  _APRSFreezerInterface *freezer;
  void *v4;
  _APRSPrewarmInterface *prewarmLauncher;
  void *v6;
  id v7;

  v7 = (id)os_transaction_create("com.apple.dasd.appResume.Recommendations");
  -[_APRSRecommendationEngine evaluateFreezerRecommendations](self->_engine, "evaluateFreezerRecommendations");
  -[_APRSRecommendationEngine evaluatePrewarmRecommendations](self->_engine, "evaluatePrewarmRecommendations");
  -[_APRSRecommendationEngine updateCurrentRecommendations](self->_engine, "updateCurrentRecommendations");
  freezer = self->_freezer;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_APRSRecommendationEngine freezerRecommendations](self->_engine, "freezerRecommendations"));
  -[_APRSFreezerInterface updateFreezer:](freezer, "updateFreezer:", v4);

  prewarmLauncher = self->_prewarmLauncher;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_APRSRecommendationEngine prewarmRecommendations](self->_engine, "prewarmRecommendations"));
  -[_APRSPrewarmInterface prewarmRecommendations:](prewarmLauncher, "prewarmRecommendations:", v6);

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

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

- (int)debugNotifyToken
{
  return self->_debugNotifyToken;
}

- (void)setDebugNotifyToken:(int)a3
{
  self->_debugNotifyToken = a3;
}

- (NSDate)signpostReaderDate
{
  return self->_signpostReaderDate;
}

- (void)setSignpostReaderDate:(id)a3
{
  objc_storeStrong((id *)&self->_signpostReaderDate, a3);
}

- (_APRSFreezerInterface)freezer
{
  return self->_freezer;
}

- (void)setFreezer:(id)a3
{
  objc_storeStrong((id *)&self->_freezer, a3);
}

- (_APRSPrewarmInterface)prewarmLauncher
{
  return self->_prewarmLauncher;
}

- (void)setPrewarmLauncher:(id)a3
{
  objc_storeStrong((id *)&self->_prewarmLauncher, a3);
}

- (_APRSSignpostReader)signpostReader
{
  return self->_signpostReader;
}

- (void)setSignpostReader:(id)a3
{
  objc_storeStrong((id *)&self->_signpostReader, a3);
}

- (BOOL)classCUnlocked
{
  return self->_classCUnlocked;
}

- (void)setClassCUnlocked:(BOOL)a3
{
  self->_classCUnlocked = a3;
}

- (_DASDataProtectionStateMonitor)dataProtectionStateMonitor
{
  return self->_dataProtectionStateMonitor;
}

- (void)setDataProtectionStateMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_dataProtectionStateMonitor, a3);
}

- (_APRSRecommendationEngine)engine
{
  return self->_engine;
}

- (void)setEngine:(id)a3
{
  objc_storeStrong((id *)&self->_engine, a3);
}

- (_APRSBiomeAppKillEventWriter)appKillEventWriter
{
  return self->_appKillEventWriter;
}

- (void)setAppKillEventWriter:(id)a3
{
  objc_storeStrong((id *)&self->_appKillEventWriter, a3);
}

- (_APRSBiomeEventAnalyzer)eventAnalyzer
{
  return self->_eventAnalyzer;
}

- (void)setEventAnalyzer:(id)a3
{
  objc_storeStrong((id *)&self->_eventAnalyzer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventAnalyzer, 0);
  objc_storeStrong((id *)&self->_appKillEventWriter, 0);
  objc_storeStrong((id *)&self->_engine, 0);
  objc_storeStrong((id *)&self->_dataProtectionStateMonitor, 0);
  objc_storeStrong((id *)&self->_signpostReader, 0);
  objc_storeStrong((id *)&self->_prewarmLauncher, 0);
  objc_storeStrong((id *)&self->_freezer, 0);
  objc_storeStrong((id *)&self->_signpostReaderDate, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
}

@end
