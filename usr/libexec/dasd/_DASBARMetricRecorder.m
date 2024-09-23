@implementation _DASBARMetricRecorder

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100033BE8;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001AB4F0 != -1)
    dispatch_once(&qword_1001AB4F0, block);
  return (id)qword_1001AB4E8;
}

- (_DASBARMetricRecorder)init
{
  _DASBARMetricRecorder *v2;
  uint64_t v3;
  OS_os_log *log;
  NSObject *v5;
  NSUserDefaults *v6;
  NSUserDefaults *defaults;
  uint64_t v8;
  NSMutableDictionary *barMetricDict;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_DASBARMetricRecorder;
  v2 = -[_DASBARMetricRecorder init](&v11, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("barMetricRecorder")));
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = v2->_log;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      sub_1000E0F90(v5);
    v6 = (NSUserDefaults *)objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.dasd.barMetricRecorder"));
    defaults = v2->_defaults;
    v2->_defaults = v6;

    v8 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    barMetricDict = v2->_barMetricDict;
    v2->_barMetricDict = (NSMutableDictionary *)v8;

    -[_DASBARMetricRecorder loadState](v2, "loadState");
  }
  return v2;
}

+ (BOOL)shouldRecordBARMetricForActivity:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "launchReason"));
  if ((objc_msgSend(v4, "isEqualToString:", _DASLaunchReasonBackgroundRemoteNotification) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "launchReason"));
    v5 = objc_msgSend(v6, "isEqualToString:", _DASLaunchReasonBackgroundRefresh);

  }
  return v5;
}

- (void)loadState
{
  _DASBARMetricRecorder *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  NSMutableDictionary *barMetricDict;
  void *v11;
  NSObject *log;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v2 = self;
  objc_sync_enter(v2);
  -[NSMutableDictionary removeAllObjects](v2->_barMetricDict, "removeAllObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v2->_defaults, "objectForKey:", CFSTR("BARMetricDict")));
  v4 = objc_msgSend(v3, "mutableCopy");

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        barMetricDict = v2->_barMetricDict;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v9, (_QWORD)v14));
        -[NSMutableDictionary setObject:forKey:](barMetricDict, "setObject:forKey:", v11, v9);

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  log = v2->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    sub_1000E0FD0((uint64_t *)&v2->_barMetricDict, log, v13);

  objc_sync_exit(v2);
}

- (void)saveState
{
  _DASBARMetricRecorder *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;

  v2 = self;
  objc_sync_enter(v2);
  v3 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithDictionary:copyItems:", v2->_barMetricDict, 1);
  -[NSUserDefaults setObject:forKey:](v2->_defaults, "setObject:forKey:", v3, CFSTR("BARMetricDict"));
  v4 = v2->_log;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v2->_defaults, "objectForKey:", CFSTR("BARMetricDict")));
    sub_1000E103C(v5, (uint64_t)&v6, v4);
  }

  objc_sync_exit(v2);
}

- (void)resetBARMetric
{
  _DASBARMetricRecorder *v2;
  NSObject *log;
  uint64_t v4;

  v2 = self;
  objc_sync_enter(v2);
  -[NSMutableDictionary removeAllObjects](v2->_barMetricDict, "removeAllObjects");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_barMetricDict, "setObject:forKeyedSubscript:", &off_10016E588, CFSTR("BgRefreshSubmissionCount"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_barMetricDict, "setObject:forKeyedSubscript:", &off_10016E588, CFSTR("BgRefreshCompletionCount"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_barMetricDict, "setObject:forKeyedSubscript:", &off_10016E588, CFSTR("PushLaunchSubmissionCount"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_barMetricDict, "setObject:forKeyedSubscript:", &off_10016E588, CFSTR("PushLaunchCompletionCount"));
  -[_DASBARMetricRecorder saveState](v2, "saveState");
  log = v2->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    sub_1000E1088((uint64_t *)&v2->_barMetricDict, log, v4);
  objc_sync_exit(v2);

}

- (void)recordBARMetric:(id)a3 atStage:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  NSObject *log;
  _DASBARMetricRecorder *v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v6 = a3;
  v7 = v6;
  if (a4 == 1)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "launchReason"));
    v9 = objc_msgSend(v12, "isEqualToString:", _DASLaunchReasonBackgroundRefresh);

    v10 = CFSTR("PushLaunchCompletionCount");
    v11 = CFSTR("BgRefreshCompletionCount");
LABEL_5:
    if (v9)
      v13 = v11;
    else
      v13 = v10;
    goto LABEL_11;
  }
  if (!a4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "launchReason"));
    v9 = objc_msgSend(v8, "isEqualToString:", _DASLaunchReasonBackgroundRefresh);

    v10 = CFSTR("PushLaunchSubmissionCount");
    v11 = CFSTR("BgRefreshSubmissionCount");
    goto LABEL_5;
  }
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    sub_1000E10F4(a4, log);
  v13 = 0;
LABEL_11:
  v15 = self;
  objc_sync_enter(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v15->_barMetricDict, "objectForKeyedSubscript:", v13));
  v17 = objc_msgSend(v16, "intValue") + 1;

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v17));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v15->_barMetricDict, "setObject:forKeyedSubscript:", v18, v13);

  objc_sync_exit(v15);
  -[_DASBARMetricRecorder saveState](v15, "saveState");

}

- (id)fetchLatestBARMetric
{
  _DASBARMetricRecorder *v2;
  NSMutableDictionary *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_barMetricDict;
  objc_sync_exit(v2);

  return v3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (NSMutableDictionary)barMetricDict
{
  return self->_barMetricDict;
}

- (void)setBarMetricDict:(id)a3
{
  objc_storeStrong((id *)&self->_barMetricDict, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barMetricDict, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
