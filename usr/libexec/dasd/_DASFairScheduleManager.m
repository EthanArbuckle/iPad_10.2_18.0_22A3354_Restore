@implementation _DASFairScheduleManager

- (int64_t)compareActivity:(id)a3 withActivity:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  int64_t v19;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  void *v34;

  v6 = a3;
  v7 = a4;
  v8 = self->_activityToDuration;
  objc_sync_enter(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_activityToDuration, "objectForKeyedSubscript:", v9));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_activityToDuration, "objectForKeyedSubscript:", v9));
    objc_msgSend(v12, "doubleValue");
    v14 = v13;

  }
  else
  {
    v14 = 0.0;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_activityToDuration, "objectForKeyedSubscript:", v10));

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_activityToDuration, "objectForKeyedSubscript:", v10));
    objc_msgSend(v16, "doubleValue");
    v18 = v17;

  }
  else
  {
    v18 = 0.0;
  }
  if (v14 < v18)
    goto LABEL_8;
  if (v14 > v18)
  {
LABEL_10:
    v19 = 1;
    goto LABEL_11;
  }
  objc_msgSend(v6, "interval");
  v22 = v21;
  objc_msgSend(v7, "interval");
  if (v22 <= v23)
  {
    objc_msgSend(v6, "interval");
    v25 = v24;
    objc_msgSend(v7, "interval");
    if (v25 < v26)
      goto LABEL_10;
    v27 = objc_msgSend(v6, "schedulingPriority");
    if (v27 <= objc_msgSend(v7, "schedulingPriority"))
    {
      v28 = objc_msgSend(v6, "schedulingPriority");
      if (v28 < objc_msgSend(v7, "schedulingPriority"))
        goto LABEL_10;
      v29 = objc_msgSend(v6, "staticPriority");
      if ((uint64_t)v29 >= (uint64_t)objc_msgSend(v7, "staticPriority"))
      {
        v30 = objc_msgSend(v6, "staticPriority");
        if ((uint64_t)v30 > (uint64_t)objc_msgSend(v7, "staticPriority"))
          goto LABEL_10;
        v31 = objc_msgSend(v6, "maximumRuntime");
        if ((uint64_t)v31 >= (uint64_t)objc_msgSend(v7, "maximumRuntime"))
        {
          v32 = objc_msgSend(v6, "maximumRuntime");
          if ((uint64_t)v32 <= (uint64_t)objc_msgSend(v7, "maximumRuntime"))
          {
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startBefore"));
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startBefore"));
            v19 = (int64_t)objc_msgSend(v33, "compare:", v34);

            goto LABEL_11;
          }
          goto LABEL_10;
        }
      }
    }
  }
LABEL_8:
  v19 = -1;
LABEL_11:

  objc_sync_exit(v8);
  return v19;
}

- (_DASFairScheduleManager)init
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  dispatch_queue_global_t global_queue;
  NSObject *v13;
  dispatch_source_t v14;
  void *v15;
  NSObject *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  objc_super v21;
  uint8_t buf[4];
  uint64_t v23;

  v21.receiver = self;
  v21.super_class = (Class)_DASFairScheduleManager;
  v2 = -[_DASFairScheduleManager init](&v21, "init");
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.das.fairscheduling"));
    v4 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "loadPriorityQueue"));
    v6 = objc_msgSend(v5, "mutableCopy");
    v7 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v6;

    if (!*((_QWORD *)v2 + 1))
    {
      v8 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      v9 = (void *)*((_QWORD *)v2 + 1);
      *((_QWORD *)v2 + 1) = v8;

    }
    v10 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("fairScheduling")));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *((_QWORD *)v2 + 1);
      *(_DWORD *)buf = 138412290;
      v23 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Loading fair scheduling information %@", buf, 0xCu);
    }

    global_queue = dispatch_get_global_queue(-32768, 0);
    v13 = objc_claimAutoreleasedReturnValue(global_queue);
    v14 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v13);
    v15 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v14;

    dispatch_source_set_timer(*((dispatch_source_t *)v2 + 3), 0, 0x4E94914F0000uLL, 0x3B9ACA00uLL);
    objc_initWeak((id *)buf, v2);
    v16 = *((_QWORD *)v2 + 3);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000CBDB4;
    v18[3] = &unk_1001601A8;
    objc_copyWeak(&v20, (id *)buf);
    v19 = v2;
    dispatch_source_set_event_handler(v16, v18);
    dispatch_activate(*((dispatch_object_t *)v2 + 3));

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  return (_DASFairScheduleManager *)v2;
}

- (void)savePriorityQueue
{
  NSUserDefaults *obj;

  obj = self->_fairSchedulingPreferences;
  objc_sync_enter(obj);
  -[NSUserDefaults setObject:forKey:](self->_fairSchedulingPreferences, "setObject:forKey:", self->_activityToDuration, CFSTR("priorityQueue"));
  objc_sync_exit(obj);

}

- (id)loadPriorityQueue
{
  NSUserDefaults *v3;
  void *v4;

  v3 = self->_fairSchedulingPreferences;
  objc_sync_enter(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_fairSchedulingPreferences, "objectForKey:", CFSTR("priorityQueue")));
  objc_sync_exit(v3);

  return v4;
}

- (void)clearPriorityQueue
{
  NSUserDefaults *obj;

  obj = self->_fairSchedulingPreferences;
  objc_sync_enter(obj);
  -[NSUserDefaults removeObjectForKey:](self->_fairSchedulingPreferences, "removeObjectForKey:", CFSTR("priorityQueue"));
  objc_sync_exit(obj);

}

- (void)handleActivityEnd:(id)a3 withLoggingReason:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  double v24;
  __int16 v25;
  double v26;

  v6 = a3;
  v7 = a4;
  v8 = self->_activityToDuration;
  objc_sync_enter(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDate"));
  objc_msgSend(v10, "timeIntervalSinceNow");
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_activityToDuration, "objectForKeyedSubscript:", v9));
  objc_msgSend(v13, "doubleValue");
  v15 = v14 - v12;

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v15));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_activityToDuration, "setObject:forKeyedSubscript:", v16, v9);

  -[_DASFairScheduleManager savePriorityQueue](self, "savePriorityQueue");
  v17 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("fairScheduling")));
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
    v19 = 138413058;
    v20 = v7;
    v21 = 2112;
    v22 = v18;
    v23 = 2048;
    v24 = v12 / -60.0;
    v25 = 2048;
    v26 = v15 / 60.0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@ %@, ran for %.1f mins, total runtime %.1f mins", (uint8_t *)&v19, 0x2Au);

  }
  objc_sync_exit(v8);

}

- (void)activityCanceled:(id)a3
{
  -[_DASFairScheduleManager handleActivityEnd:withLoggingReason:](self, "handleActivityEnd:withLoggingReason:", a3, CFSTR("Canceled"));
}

- (void)activityCompleted:(id)a3
{
  -[_DASFairScheduleManager handleActivityEnd:withLoggingReason:](self, "handleActivityEnd:withLoggingReason:", a3, CFSTR("Completed"));
}

- (void)activityStarted:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  double v16;

  v4 = a3;
  v5 = self->_activityToDuration;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_activityToDuration, "objectForKeyedSubscript:", v6));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_activityToDuration, "objectForKeyedSubscript:", v6));
    objc_msgSend(v8, "doubleValue");
    v10 = v9;

  }
  else
  {
    v10 = 0.0;
  }

  objc_sync_exit(v5);
  v11 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("fairScheduling")));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v13 = 138412546;
    v14 = v12;
    v15 = 2048;
    v16 = v10 / 60.0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Started %@, total runtime from previous runs %0.1f mins", (uint8_t *)&v13, 0x16u);

  }
}

- (NSMutableDictionary)activityToDuration
{
  return self->_activityToDuration;
}

- (void)setActivityToDuration:(id)a3
{
  objc_storeStrong((id *)&self->_activityToDuration, a3);
}

- (NSUserDefaults)fairSchedulingPreferences
{
  return self->_fairSchedulingPreferences;
}

- (void)setFairSchedulingPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_fairSchedulingPreferences, a3);
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_fairSchedulingPreferences, 0);
  objc_storeStrong((id *)&self->_activityToDuration, 0);
}

@end
