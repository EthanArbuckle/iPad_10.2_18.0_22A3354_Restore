@implementation _DASActivityDurationTracker

+ (BOOL)shouldTrackActivity:(id)a3
{
  return objc_msgSend(a3, "isIntensive");
}

- (void)activityCompleted:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD block[4];
  id v8;
  _DASActivityDurationTracker *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017548;
  block[3] = &unk_10015D558;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)activityCanceled:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD block[4];
  id v8;
  _DASActivityDurationTracker *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003114;
  block[3] = &unk_10015D558;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);

}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DEB24;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001ABED8 != -1)
    dispatch_once(&qword_1001ABED8, block);
  return (id)qword_1001ABEE0;
}

- (_DASActivityDurationTracker)init
{
  id v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  dispatch_source_t v11;
  void *v12;
  NSObject *v13;
  dispatch_time_t v14;
  NSObject *v15;
  int *v16;
  int *v17;
  NSObject *v18;
  int *v19;
  NSObject *v20;
  _QWORD v22[4];
  int *v23;
  _QWORD v24[4];
  int *v25;
  _QWORD handler[4];
  int *v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)_DASActivityDurationTracker;
  v2 = -[_DASActivityDurationTracker init](&v28, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("com.apple.dasd.activityDurationManager", v4);
    v6 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v5;

    v7 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("activityDurationTracker")));
    v8 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v7;

    v9 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.dasd.activityDurationTracker"));
    v10 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v9;

    v11 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *((dispatch_queue_t *)v2 + 2));
    v12 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v11;

    v13 = *((_QWORD *)v2 + 3);
    v14 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 86400000000000);
    dispatch_source_set_timer(v13, v14, 0x4E94914F0000uLL, 0xD18C2E2800uLL);
    v15 = *((_QWORD *)v2 + 3);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000DE774;
    handler[3] = &unk_10015D4E0;
    v16 = (int *)v2;
    v27 = v16;
    dispatch_source_set_event_handler(v15, handler);
    dispatch_activate(*((dispatch_object_t *)v2 + 3));
    v16[2] = 0;
    v17 = v16 + 2;
    v18 = *((_QWORD *)v2 + 2);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000DE77C;
    v24[3] = &unk_10015D9B8;
    v19 = v16;
    v25 = v19;
    notify_register_dispatch("com.apple.dasd.testActivityDayDurationsDelete", v17, v18, v24);
    v20 = *((_QWORD *)v2 + 2);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000DE784;
    v22[3] = &unk_10015D9B8;
    v23 = v19;
    notify_register_dispatch("com.apple.dasd.testActivityDayDurationsLoad", v17, v20, v22);

  }
  return (_DASActivityDurationTracker *)v2;
}

- (id)description
{
  return -[NSArray description](self->_dayToDurationsList, "description");
}

- (void)loadState
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSSet *v9;
  void *v10;
  NSArray *v11;
  id v12;
  NSArray *dayToDurationsList;
  NSObject *log;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSArray *v21;
  NSArray *v22;
  NSObject *v23;
  NSArray *v24;
  id v25;
  uint8_t buf[4];
  NSArray *v27;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", CFSTR("/var/mobile/Library/DuetActivityScheduler/activityDayDurations.data")));
  if (v3)
  {
    v4 = objc_opt_class(NSArray);
    v5 = objc_opt_class(_DASActivityDayToDurations);
    v6 = objc_opt_class(NSDictionary);
    v7 = objc_opt_class(NSString);
    v8 = objc_opt_class(NSNumber);
    v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, v5, v6, v7, v8, objc_opt_class(NSDate), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v25 = 0;
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v10, v3, &v25));
    v12 = v25;
    dayToDurationsList = self->_dayToDurationsList;
    self->_dayToDurationsList = v11;

    if (v12)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        sub_1000EC0CC((uint64_t)v12, log, v15, v16, v17, v18, v19, v20);
      v21 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v22 = self->_dayToDurationsList;
      self->_dayToDurationsList = v21;

    }
  }
  else
  {
    v12 = 0;
  }
  v23 = self->_log;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = self->_dayToDurationsList;
    *(_DWORD *)buf = 138412290;
    v27 = v24;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Loaded day to durations data %@", buf, 0xCu);
  }

}

- (void)saveState
{
  NSArray *dayToDurationsList;
  void *v4;
  id v5;
  NSObject *log;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSArray *v13;
  NSArray *v14;
  id v15;

  dayToDurationsList = self->_dayToDurationsList;
  v15 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", dayToDurationsList, 1, &v15));
  v5 = v15;
  if (v5)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      sub_1000EC134((uint64_t)v5, log, v7, v8, v9, v10, v11, v12);
    v13 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v14 = self->_dayToDurationsList;
    self->_dayToDurationsList = v13;

  }
  objc_msgSend(v4, "writeToFile:atomically:", CFSTR("/var/mobile/Library/DuetActivityScheduler/activityDayDurations.data"), 1);

}

- (void)deleteOldDurations
{
  NSArray *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  double v7;
  unint64_t v8;
  NSArray *dayToDurationsList;
  id v10;

  v3 = (NSArray *)-[NSArray mutableCopy](self->_dayToDurationsList, "mutableCopy");
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet"));
  if (-[NSArray count](v3, "count"))
  {
    v4 = 0;
    do
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](v3, "objectAtIndexedSubscript:", v4));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "date"));
      objc_msgSend(v6, "timeIntervalSinceNow");
      v8 = (uint64_t)v7;

      if (v8 <= 0xFFFFFFFFFFF573FFLL)
        objc_msgSend(v10, "addIndex:", v4);
      ++v4;
    }
    while (v4 < -[NSArray count](v3, "count"));
  }
  -[NSArray removeObjectsAtIndexes:](v3, "removeObjectsAtIndexes:", v10);
  dayToDurationsList = self->_dayToDurationsList;
  self->_dayToDurationsList = v3;

}

- (void)addTimeInterval:(double)a3 forActivity:(id)a4
{
  NSArray *dayToDurationsList;
  id v7;
  _DASActivityDayToDurations *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  _DASActivityDayToDurations *v14;
  void *v15;
  void *v16;
  _DASActivityDayToDurations *v17;
  void *v18;
  id v19;
  void *v20;
  double v21;
  void *v22;
  NSArray *v23;
  NSArray *v24;
  id v25;

  v25 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "name"));
  dayToDurationsList = self->_dayToDurationsList;
  if (!dayToDurationsList)
  {
    -[_DASActivityDurationTracker loadState](self, "loadState");
    dayToDurationsList = self->_dayToDurationsList;
  }
  v7 = -[NSArray mutableCopy](dayToDurationsList, "mutableCopy");
  if (!v7)
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v8 = (_DASActivityDayToDurations *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
  if (!v8)
    goto LABEL_8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityDayToDurations date](v8, "date"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v12 = objc_msgSend(v9, "isDate:inSameDayAsDate:", v10, v11);

  if ((v12 & 1) == 0)
  {
    -[_DASActivityDurationTracker deleteOldDurations](self, "deleteOldDurations");
    v13 = -[NSArray mutableCopy](self->_dayToDurationsList, "mutableCopy");

    v7 = v13;
LABEL_8:
    v14 = [_DASActivityDayToDurations alloc];
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v17 = -[_DASActivityDayToDurations initWithDate:activityDurations:](v14, "initWithDate:activityDurations:", v15, v16);

    objc_msgSend(v7, "addObject:", v17);
    v8 = v17;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityDayToDurations activityDurations](v8, "activityDurations"));
  v19 = objc_msgSend(v18, "mutableCopy");

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", v25));
  objc_msgSend(v20, "doubleValue");
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (uint64_t)(v21 + a3)));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v22, v25);

  -[_DASActivityDayToDurations setActivityDurations:](v8, "setActivityDurations:", v19);
  v23 = (NSArray *)objc_msgSend(v7, "copy");
  v24 = self->_dayToDurationsList;
  self->_dayToDurationsList = v23;

  -[_DASActivityDurationTracker saveState](self, "saveState");
}

- (double)runtimeForActivity:(id)a3 inLastNumDays:(unint64_t)a4
{
  id v5;
  NSArray *dayToDurationsList;
  double v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;

  v5 = a3;
  dayToDurationsList = self->_dayToDurationsList;
  v7 = 0.0;
  if (dayToDurationsList)
  {
    if (-[NSArray count](dayToDurationsList, "count"))
    {
      -[NSArray count](self->_dayToDurationsList, "count");
      if (-[NSArray count](self->_dayToDurationsList, "count"))
      {
        v8 = 0;
        do
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_dayToDurationsList, "objectAtIndexedSubscript:", v8));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "activityDurations"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v11));

          if (v12)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "activityDurations"));
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v14));
            objc_msgSend(v15, "doubleValue");
            v17 = v16;

            v7 = v7 + v17;
          }

          ++v8;
        }
        while (v8 < -[NSArray count](self->_dayToDurationsList, "count"));
      }
    }
  }

  return v7;
}

- (BOOL)activityHadEnoughRuntime:(id)a3
{
  double v3;

  -[_DASActivityDurationTracker runtimeForActivity:inLastNumDays:](self, "runtimeForActivity:inLastNumDays:", a3, 7);
  return v3 >= 18000.0;
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

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (NSArray)dayToDurationsList
{
  return self->_dayToDurationsList;
}

- (void)setDayToDurationsList:(id)a3
{
  objc_storeStrong((id *)&self->_dayToDurationsList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayToDurationsList, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
