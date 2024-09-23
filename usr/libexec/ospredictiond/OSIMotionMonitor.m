@implementation OSIMotionMonitor

- (OSIMotionMonitor)init
{
  OSIMotionMonitor *v2;
  os_log_t v3;
  OS_os_log *log;
  NSOperationQueue *v5;
  NSOperationQueue *queue;
  CMMotionActivityManager *v7;
  CMMotionActivityManager *activityManager;
  dispatch_queue_global_t global_queue;
  NSObject *v10;
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)OSIMotionMonitor;
  v2 = -[OSIMotionMonitor init](&v15, "init");
  if (v2)
  {
    v3 = os_log_create("com.apple.osintelligence", "signal.motion");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    queue = v2->_queue;
    v2->_queue = v5;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_queue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setQualityOfService:](v2->_queue, "setQualityOfService:", 17);
    v7 = (CMMotionActivityManager *)objc_alloc_init((Class)CMMotionActivityManager);
    activityManager = v2->_activityManager;
    v2->_activityManager = v7;

    objc_initWeak(&location, v2);
    global_queue = dispatch_get_global_queue(-32768, 0);
    v10 = objc_claimAutoreleasedReturnValue(global_queue);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000E100;
    v12[3] = &unk_100060B70;
    objc_copyWeak(&v13, &location);
    notify_register_dispatch("com.apple.inactivity.recentmotion", &v2->_notifyToken, v10, v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (double)percentageStationaryWithActivity:(id)a3 untilDate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  unsigned __int8 v14;
  uint64_t v15;
  double v16;
  double v17;
  void *i;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  NSObject *v26;
  NSObject *log;
  NSObject *v28;
  unsigned int v29;
  void *v30;
  NSObject *v31;
  unsigned int v32;
  void *v33;
  char v34;
  double v35;
  double v36;
  NSObject *v37;
  double v38;
  void *v40;
  id v41;
  OSIMotionMonitor *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  double v48;
  __int16 v49;
  _BYTE v50[14];
  _BYTE v51[128];

  v6 = a3;
  v7 = a4;
  v42 = self;
  v8 = objc_claimAutoreleasedReturnValue(-[OSIMotionMonitor log](self, "log"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_10003E104((uint64_t)v6, v8);

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
  if (v10)
  {
    v11 = v10;
    v40 = v7;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = *(_QWORD *)v44;
    v16 = 0.0;
    v17 = 0.0;
    v41 = v9;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        v19 = v12;
        if (*(_QWORD *)v44 != v15)
          objc_enumerationMutation(v9);
        v20 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v20, "stationary"))
          v21 = objc_msgSend(v20, "confidence") != 0;
        else
          v21 = 0;
        if (!((v12 == 0) | v13 & 1))
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "startDate"));
          objc_msgSend(v22, "timeIntervalSinceDate:", v19);
          v17 = v17 + v23;

          if ((v14 & 1) == 0)
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "startDate"));
            objc_msgSend(v24, "timeIntervalSinceDate:", v19);
            v16 = v16 + v25;

          }
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "startDate"));

        if (objc_msgSend(v20, "confidence") && !objc_msgSend(v20, "unknown"))
        {
          log = v42->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
          {
            v31 = log;
            v32 = objc_msgSend(v20, "stationary");
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "startDate"));
            *(_DWORD *)buf = 138412802;
            v48 = *(double *)&v20;
            v49 = 1024;
            *(_DWORD *)v50 = v32;
            *(_WORD *)&v50[4] = 2112;
            *(_QWORD *)&v50[6] = v33;
            _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "  Using event %@ (%u from %@)", buf, 0x1Cu);

            v9 = v41;
          }
          v14 = objc_msgSend(v20, "stationary");
          v13 = 0;
        }
        else
        {
          v26 = v42->_log;
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            v28 = v26;
            v29 = objc_msgSend(v20, "unknown");
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "startDate"));
            *(_DWORD *)buf = 138412802;
            v48 = *(double *)&v20;
            v49 = 1024;
            *(_DWORD *)v50 = v29;
            v9 = v41;
            *(_WORD *)&v50[4] = 2112;
            *(_QWORD *)&v50[6] = v30;
            _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "  Skipping event %@ (%u from %@)", buf, 0x1Cu);

          }
          v13 = 1;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    }
    while (v11);

    if (v12)
      v34 = v13;
    else
      v34 = 1;
    if ((v34 & 1) != 0)
    {
      v7 = v40;
    }
    else
    {
      v7 = v40;
      objc_msgSend(v40, "timeIntervalSinceDate:", v12);
      v17 = v17 + v35;
      if ((v14 & 1) == 0)
      {
        objc_msgSend(v40, "timeIntervalSinceDate:", v12);
        v16 = v16 + v36;
      }
    }
  }
  else
  {

    v12 = 0;
    v16 = 0.0;
    v21 = 1;
    v17 = 0.0;
  }
  v37 = objc_claimAutoreleasedReturnValue(-[OSIMotionMonitor log](v42, "log"));
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218496;
    v48 = v17 - v16;
    v49 = 2048;
    *(double *)v50 = v16;
    *(_WORD *)&v50[8] = 1024;
    *(_DWORD *)&v50[10] = v21;
    _os_log_debug_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, " Stationary duration: %.0f, Non-stationary duration: %.0f, Last state confident stationary: %u", buf, 0x1Cu);
  }

  v38 = 0.0;
  if (v21)
  {
    v38 = 1.0;
    if (v17 > 0.0)
      v38 = 1.0 - v16 / v17;
  }

  return v38;
}

- (double)percentStationaryOverDuration:(double)a3
{
  double v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  dispatch_semaphore_t v12;
  CMMotionActivityManager *activityManager;
  NSOperationQueue *queue;
  id v15;
  NSObject *v16;
  dispatch_time_t v17;
  NSObject *v18;
  void **v20;
  uint64_t v21;
  intptr_t (*v22)(uint64_t, uint64_t);
  void *v23;
  OSIMotionMonitor *v24;
  id v25;
  NSObject *v26;
  uint64_t *v27;
  uint64_t v28;
  double *v29;
  uint64_t v30;
  uint64_t v31;

  v5 = 1.0;
  if (+[CMMotionActivityManager isActivityAvailable](CMMotionActivityManager, "isActivityAvailable"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateByAddingTimeInterval:", -a3));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities lastLockDate](OSIntelligenceUtilities, "lastLockDate"));
    if (v8)
    {
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "laterDate:", v8));

      v7 = (void *)v9;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities lastPluggedInDate](OSIntelligenceUtilities, "lastPluggedInDate"));
    if (v10)
    {
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "laterDate:", v10));

      v7 = (void *)v11;
    }
    v28 = 0;
    v29 = (double *)&v28;
    v30 = 0x2020000000;
    v31 = 0x3FF0000000000000;
    v12 = dispatch_semaphore_create(0);
    activityManager = self->_activityManager;
    queue = self->_queue;
    v20 = _NSConcreteStackBlock;
    v21 = 3221225472;
    v22 = sub_10000E884;
    v23 = &unk_100060B98;
    v27 = &v28;
    v24 = self;
    v15 = v6;
    v25 = v15;
    v16 = v12;
    v26 = v16;
    -[CMMotionActivityManager queryActivityStartingFromDate:toDate:toQueue:withHandler:](activityManager, "queryActivityStartingFromDate:toDate:toQueue:withHandler:", v7, v15, queue, &v20);
    v17 = dispatch_walltime(0, 10000000000);
    if (dispatch_semaphore_wait(v16, v17))
    {
      v18 = objc_claimAutoreleasedReturnValue(-[OSIMotionMonitor log](self, "log", v20, v21, v22, v23, v24, v25));
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_10003E178(v18);

    }
    else
    {
      v5 = v29[3];
    }

    _Block_object_dispose(&v28, 8);
  }
  return v5;
}

- (BOOL)currentlyInCar
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](_CDClientContext, "userContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForCarConnectedStatus](_CDContextQueries, "keyPathForCarConnectedStatus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForNavigationStatus](_CDContextQueries, "keyPathForNavigationStatus"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForCarConnectedStatus](_CDContextQueries, "keyPathForCarConnectedStatus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", v3));
  if ((objc_msgSend(v6, "BOOLValue") & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", v4));
    if ((objc_msgSend(v8, "BOOLValue") & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", v5));
      v7 = objc_msgSend(v9, "BOOLValue");

    }
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_notifyToken);
  v3.receiver = self;
  v3.super_class = (Class)OSIMotionMonitor;
  -[OSIMotionMonitor dealloc](&v3, "dealloc");
}

- (CMMotionActivityManager)activityManager
{
  return self->_activityManager;
}

- (void)setActivityManager:(id)a3
{
  objc_storeStrong((id *)&self->_activityManager, a3);
}

- (NSOperationQueue)queue
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

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_activityManager, 0);
}

@end
