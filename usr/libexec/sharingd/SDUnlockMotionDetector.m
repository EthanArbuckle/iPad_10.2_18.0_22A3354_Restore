@implementation SDUnlockMotionDetector

- (SDUnlockMotionDetector)initWithUnlockType:(int64_t)a3
{
  SDUnlockMotionDetector *v4;
  CMMotionManager *v5;
  CMMotionManager *motionManager;
  CMMotionActivityManager *v7;
  CMMotionActivityManager *activityManager;
  CMPedometer *v9;
  CMPedometer *pedometerManager;
  dispatch_queue_t current_queue;
  uint64_t v12;
  OS_dispatch_queue *handlerQueue;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  OS_os_log *logType;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SDUnlockMotionDetector;
  v4 = -[SDUnlockMotionDetector init](&v21, "init");
  if (v4)
  {
    v5 = objc_opt_new(CMMotionManager);
    motionManager = v4->_motionManager;
    v4->_motionManager = v5;

    -[CMMotionManager setAccelerometerUpdateInterval:](v4->_motionManager, "setAccelerometerUpdateInterval:", 1.0);
    v7 = objc_opt_new(CMMotionActivityManager);
    activityManager = v4->_activityManager;
    v4->_activityManager = v7;

    v9 = objc_opt_new(CMPedometer);
    pedometerManager = v4->_pedometerManager;
    v4->_pedometerManager = v9;

    current_queue = dispatch_get_current_queue();
    v12 = objc_claimAutoreleasedReturnValue(current_queue);
    handlerQueue = v4->_handlerQueue;
    v4->_handlerQueue = (OS_dispatch_queue *)v12;

    v4->_type = a3;
    if (a3 == 1)
    {
      v18 = auto_unlock_log(v14);
      v17 = objc_claimAutoreleasedReturnValue(v18);
      goto LABEL_6;
    }
    if (!a3)
    {
      v16 = paired_unlock_log(v14, v15);
      v17 = objc_claimAutoreleasedReturnValue(v16);
LABEL_6:
      logType = v4->_logType;
      v4->_logType = (OS_os_log *)v17;

    }
  }
  return v4;
}

- (void)activate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void **v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id location;

  if (!-[SDUnlockMotionDetector activateCalled](self, "activateCalled"))
  {
    -[SDUnlockMotionDetector setActivateCalled:](self, "setActivateCalled:", 1);
    location = 0;
    objc_initWeak(&location, self);
    if (!-[SDUnlockMotionDetector type](self, "type"))
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector motionManager](self, "motionManager"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1000627EC;
      v12[3] = &unk_1007154F8;
      v12[4] = self;
      objc_copyWeak(&v13, &location);
      objc_msgSend(v3, "startAccelerometerUpdatesToQueue:withHandler:", v4, v12);

      v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector activityManager](self, "activityManager"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
      v7 = _NSConcreteStackBlock;
      v8 = 3221225472;
      v9 = sub_10006286C;
      v10 = &unk_100715520;
      objc_copyWeak(&v11, &location);
      objc_msgSend(v5, "startActivityUpdatesToQueue:withHandler:", v6, &v7);

      objc_destroyWeak(&v11);
      objc_destroyWeak(&v13);
    }
    -[SDUnlockMotionDetector checkActivityState](self, "checkActivityState", v7, v8, v9, v10);
    if ((id)-[SDUnlockMotionDetector type](self, "type") == (id)1)
      -[SDUnlockMotionDetector checkStepState](self, "checkStepState");
    objc_destroyWeak(&location);
  }
}

- (void)invalidate
{
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(void);

  if (!-[SDUnlockMotionDetector invalidateCalled](self, "invalidateCalled"))
  {
    -[SDUnlockMotionDetector setInvalidateCalled:](self, "setInvalidateCalled:", 1);
    -[SDUnlockMotionDetector setMotionDetected:](self, "setMotionDetected:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector motionManager](self, "motionManager"));
    objc_msgSend(v3, "stopAccelerometerUpdates");

    -[SDUnlockMotionDetector setMotionManager:](self, "setMotionManager:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector activityManager](self, "activityManager"));
    objc_msgSend(v4, "stopActivityUpdates");

    -[SDUnlockMotionDetector setActivityManager:](self, "setActivityManager:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector invalidationHandler](self, "invalidationHandler"));

    if (v5)
    {
      v6 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector invalidationHandler](self, "invalidationHandler"));
      v6[2]();

    }
    -[SDUnlockMotionDetector setInvalidationHandler:](self, "setInvalidationHandler:", 0);
  }
}

- (void)checkActivityState
{
  void *v3;
  NSObject *v4;
  void *v5;
  unsigned int v6;
  int v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  void *v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector wristOnDate](self, "wristOnDate"));

  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    if ((id)-[SDUnlockMotionDetector type](self, "type") == (id)1)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v6 = objc_msgSend(v5, "integerForKey:", CFSTR("phoneAutoUnlockWatchMotionActivityWindowSeconds"));
      if (v6)
        v7 = v6;
      else
        v7 = 1800;
      v8 = objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector logType](self, "logType"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v23) = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Using phoneAutoUnlockWatchMotionActivityWindowSeconds %d", buf, 8u);
      }

    }
    else
    {
      v7 = 180;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", (double)-v7));
    v10 = objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector wristOnDate](self, "wristOnDate"));
    if (v10)
    {
      v11 = (void *)v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector wristOnDate](self, "wristOnDate"));
      -[NSObject timeIntervalSinceDate:](v4, "timeIntervalSinceDate:", v12);
      v14 = v13;

      if (v14 < (double)v7)
      {
        v15 = objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector wristOnDate](self, "wristOnDate"));

        v9 = (void *)v15;
      }
    }
    v16 = objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector logType](self, "logType"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v9;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Activity start date %@", buf, 0xCu);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector activityManager](self, "activityManager"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100062C54;
    v20[3] = &unk_100715548;
    v20[4] = self;
    v21 = v9;
    v19 = v9;
    objc_msgSend(v17, "queryActivityStartingFromDate:toDate:toQueue:withHandler:", v19, v4, v18, v20);

  }
  else
  {
    v4 = objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector logType](self, "logType"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Device off wrist, not checking past activity state", buf, 2u);
    }
  }

}

- (void)checkStepState
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  int v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[5];
  uint8_t buf[4];
  uint64_t v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector wristOnDate](self, "wristOnDate"));

  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v6 = objc_msgSend(v5, "integerForKey:", CFSTR("phoneAutoUnlockWatchStepCountWindowSeconds"));
    if ((_DWORD)v6)
      v7 = (int)v6;
    else
      v7 = 1800;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", (double)-v7));
    v9 = objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector logType](self, "logType"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if ((_QWORD)v6 << 32)
        v10 = (int)v6;
      else
        v10 = 1800;
      *(_DWORD *)buf = 134217984;
      v21 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Using phoneAutoUnlockWatchStepCountWindowSeconds %ld", buf, 0xCu);
    }

    v11 = objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector wristOnDate](self, "wristOnDate"));
    if (v11)
    {
      v12 = (void *)v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector wristOnDate](self, "wristOnDate"));
      -[NSObject timeIntervalSinceDate:](v4, "timeIntervalSinceDate:", v13);
      v15 = v14;

      if (v15 < 180.0)
      {
        v16 = objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector wristOnDate](self, "wristOnDate"));

        v8 = (void *)v16;
      }
    }
    v17 = objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector logType](self, "logType"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = (uint64_t)v8;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Step start date %@", buf, 0xCu);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector pedometerManager](self, "pedometerManager"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10006300C;
    v19[3] = &unk_100715570;
    v19[4] = self;
    objc_msgSend(v18, "queryPedometerDataFromDate:toDate:withHandler:", v8, v4, v19);

  }
  else
  {
    v4 = objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector logType](self, "logType"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Device off wrist, not checking past step state", buf, 2u);
    }
  }

}

- (void)handleNewAccelerometerData
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int v12;
  int v13;
  double v14;
  int v15;
  int v16;
  double v17;
  int v18;
  unsigned int v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  unsigned int v33;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector motionManager](self, "motionManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accelerometerData"));
  objc_msgSend(v4, "acceleration");
  v6 = v5;
  v8 = v7;
  v10 = v9;

  -[SDUnlockMotionDetector baseAcceleration](self, "baseAcceleration");
  v12 = (int)(v6 * -100.0 + v11 * 100.0);
  if (v12 >= 0)
    v13 = (int)(v6 * -100.0 + v11 * 100.0);
  else
    v13 = -v12;
  -[SDUnlockMotionDetector baseAcceleration](self, "baseAcceleration");
  v15 = (int)(v8 * -100.0 + v14 * 100.0);
  if (v15 >= 0)
    v16 = (int)(v8 * -100.0 + v14 * 100.0);
  else
    v16 = -v15;
  -[SDUnlockMotionDetector baseAcceleration](self, "baseAcceleration");
  v18 = (int)(v10 * -100.0 + v17 * 100.0);
  if (v18 < 0)
    v18 = -v18;
  v19 = v16 + v13 + v18;
  v20 = objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector logType](self, "logType"));
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    -[SDUnlockMotionDetector baseAcceleration](self, "baseAcceleration");
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("x:%f, y:%f, z:%f"), v21, v22, v23));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("x:%f, y:%f, z:%f"), *(_QWORD *)&v6, *(_QWORD *)&v8, *(_QWORD *)&v10));
    *(_DWORD *)buf = 138412802;
    v29 = v24;
    v30 = 2112;
    v31 = v25;
    v32 = 1024;
    v33 = v19;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Accelerometer changed (base: (%@), new: (%@), diff: %d)", buf, 0x1Cu);

  }
  if (v19 >= 0x1F)
  {
    v26 = objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector logType](self, "logType"));
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v29) = v19;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Accelerometer motion detected with sum change: %d", buf, 8u);
    }

    -[SDUnlockMotionDetector setAccelerometerMotion:](self, "setAccelerometerMotion:", 1);
    if (-[SDUnlockMotionDetector shouldUseAccelerometerMotion](self, "shouldUseAccelerometerMotion"))
    {
      v27 = objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector logType](self, "logType"));
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Using accelerometer motion", buf, 2u);
      }

      -[SDUnlockMotionDetector handleMotionDetected:](self, "handleMotionDetected:", 1);
    }
  }
}

- (void)handleActivityDetected:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector logType](self, "logType"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Activity changed %@", (uint8_t *)&v8, 0xCu);
  }

  if ((uint64_t)objc_msgSend(v4, "confidence") < 1
    || (objc_msgSend(v4, "stationary") & 1) != 0
    || (v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector motionTimer](self, "motionTimer")),
        v6,
        v6))
  {
    if (objc_msgSend(v4, "stationary"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector motionTimer](self, "motionTimer"));

      if (v7)
        -[SDUnlockMotionDetector invalidateMotionTimer](self, "invalidateMotionTimer");
    }
  }
  else
  {
    -[SDUnlockMotionDetector restartMotionTimer](self, "restartMotionTimer");
  }

}

- (BOOL)hasMotion:(id)a3
{
  id v4;
  int64_t v5;
  uint64_t v6;
  unsigned __int8 v7;

  v4 = a3;
  v5 = -[SDUnlockMotionDetector type](self, "type");
  v6 = (uint64_t)objc_msgSend(v4, "confidence");
  if (v5 == 1)
  {
    if (v6 >= 1)
    {
      if ((objc_msgSend(v4, "walking") & 1) == 0 && (objc_msgSend(v4, "running") & 1) == 0)
      {
LABEL_12:
        v7 = objc_msgSend(v4, "cycling");
        goto LABEL_13;
      }
      goto LABEL_10;
    }
LABEL_11:
    v7 = 0;
    goto LABEL_13;
  }
  if (v6 < 1)
    goto LABEL_11;
  if ((objc_msgSend(v4, "walking") & 1) == 0
    && (objc_msgSend(v4, "running") & 1) == 0
    && (objc_msgSend(v4, "automotive") & 1) == 0)
  {
    goto LABEL_12;
  }
LABEL_10:
  v7 = 1;
LABEL_13:

  return v7;
}

- (void)handlePastActivities:(id)a3 withStartDate:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if ((id)-[SDUnlockMotionDetector type](self, "type") == (id)1)
  {
    -[SDUnlockMotionDetector handlePastActivitiesForPhoneAutoUnlock:withStartDate:](self, "handlePastActivitiesForPhoneAutoUnlock:withStartDate:", v7, v6);
  }
  else if (!-[SDUnlockMotionDetector type](self, "type"))
  {
    -[SDUnlockMotionDetector handlePastActivitiesForPairedUnlock:](self, "handlePastActivitiesForPairedUnlock:", v7);
  }

}

- (void)handlePastActivitiesForPairedUnlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  __int128 v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *i;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  double v23;
  NSObject *v24;
  NSObject *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector logType](self, "logType"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Past motion activities %@", buf, 0xCu);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v7)
  {
    v9 = v7;
    v10 = 0;
    v11 = *(_QWORD *)v28;
    *(_QWORD *)&v8 = 138412546;
    v26 = v8;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        if (-[SDUnlockMotionDetector hasMotion:](self, "hasMotion:", v13, v26, (_QWORD)v27))
        {
          if (!v10)
            v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "startDate"));
          v14 = objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector logType](self, "logType"));
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "startDate"));
            *(_DWORD *)buf = v26;
            v32 = v10;
            v33 = 2112;
            v34 = v15;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Comparing motion dates (motion start: %@, current: %@)", buf, 0x16u);

          }
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "startDate"));
          objc_msgSend(v16, "timeIntervalSinceDate:", v10);
          v18 = v17;

          if (v18 > 3.0)
          {
            -[SDUnlockMotionDetector setActivityMotion:](self, "setActivityMotion:", 1);
            v19 = objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector logType](self, "logType"));
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Activity motion detected", buf, 2u);
            }

            if (!-[SDUnlockMotionDetector shouldUseAccelerometerMotion](self, "shouldUseAccelerometerMotion"))
            {
              v20 = objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector logType](self, "logType"));
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Using activity motion", buf, 2u);
              }

              -[SDUnlockMotionDetector handleMotionDetected:](self, "handleMotionDetected:", 1);
            }
          }
        }
        else
        {

          v10 = 0;
        }
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v22 = objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector logType](self, "logType"));
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v32 = v10;
    v33 = 2112;
    v34 = v21;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Comparing motion date to now (motion start: %@, now: %@)", buf, 0x16u);
  }

  if (v10)
  {
    objc_msgSend(v21, "timeIntervalSinceDate:", v10);
    if (v23 > 3.0)
    {
      -[SDUnlockMotionDetector setActivityMotion:](self, "setActivityMotion:", 1);
      v24 = objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector logType](self, "logType"));
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Activity motion detected", buf, 2u);
      }

      if (!-[SDUnlockMotionDetector shouldUseAccelerometerMotion](self, "shouldUseAccelerometerMotion"))
      {
        v25 = objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector logType](self, "logType"));
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Using activity motion", buf, 2u);
        }

        -[SDUnlockMotionDetector handleMotionDetected:](self, "handleMotionDetected:", 1);
      }
    }
  }

}

- (void)handlePastActivitiesForPhoneAutoUnlock:(id)a3 withStartDate:(id)a4
{
  id v6;
  unsigned int v7;
  int v8;
  NSObject *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  unsigned int v21;
  double v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;

  v6 = a3;
  v27 = a4;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v7 = objc_msgSend(v26, "integerForKey:", CFSTR("phoneAutoUnlockWatchMotionActivityThresholdSeconds"));
  if (v7)
    v8 = v7;
  else
    v8 = 90;
  v9 = objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector logType](self, "logType"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v29) = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Activity threshold is %d", buf, 8u);
  }

  if (objc_msgSend(v6, "count"))
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    while (1)
    {
      v14 = v12;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v10));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "startDate"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "laterDate:", v27));

      v17 = v10 + 1;
      if ((unint64_t)objc_msgSend(v6, "count") <= v10 + 1)
      {
        v18 = v11;
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      }
      else
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v10 + 1));
        v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "startDate"));

        v11 = (void *)v19;
      }

      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v10));
      v21 = -[SDUnlockMotionDetector hasMotion:](self, "hasMotion:", v20);

      if (v21)
      {
        objc_msgSend(v11, "timeIntervalSinceDate:", v12);
        v13 = (int)(v22 + (double)v13);
        v23 = objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector logType](self, "logType"));
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138413059;
          v29 = v12;
          v30 = 2112;
          v31 = v11;
          v32 = 1025;
          v33 = v13;
          v34 = 1024;
          v35 = v8;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Comparing motion dates (motion start: %@, end: %@, elapsed: %{private}d, need: %d)", buf, 0x22u);
        }

      }
      if (v13 > v8)
      {
        v24 = objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector logType](self, "logType"));
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Activity motion detected", buf, 2u);
        }

        if (!-[SDUnlockMotionDetector shouldUseAccelerometerMotion](self, "shouldUseAccelerometerMotion"))
          break;
      }
      v10 = v17;
      if ((unint64_t)objc_msgSend(v6, "count") <= v17)
        goto LABEL_22;
    }
    v25 = 1;
  }
  else
  {
    v12 = 0;
    v11 = 0;
LABEL_22:
    -[SDUnlockMotionDetector setCheckedActivityData:](self, "setCheckedActivityData:", 1);
    v25 = 0;
  }
  -[SDUnlockMotionDetector handleMotionDetected:](self, "handleMotionDetected:", v25);

}

- (void)handlePastPedometerData:(id)a3
{
  id v4;
  void *v5;
  signed int v6;
  void *v7;
  signed int v8;
  void *v9;
  void *v10;
  unsigned int v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  _BOOL4 v16;
  int v17;
  _QWORD v18[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "numberOfSteps"));
  v6 = objc_msgSend(v5, "intValue");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "numberOfPushes"));
  v8 = objc_msgSend(v7, "intValue");

  if (v8 > v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "numberOfPushes"));
    v6 = objc_msgSend(v9, "intValue");

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v11 = objc_msgSend(v10, "integerForKey:", CFSTR("phoneAutoUnlockWatchStepCountThreshold"));
  if (v11)
    v12 = v11;
  else
    v12 = 10;
  v13 = objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector logType](self, "logType"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 67109120;
    LODWORD(v18[0]) = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Step activity threshold is %d", (uint8_t *)&v17, 8u);
  }

  v14 = objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector logType](self, "logType"));
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138477827;
    v18[0] = v4;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "step count: %{private}@", (uint8_t *)&v17, 0xCu);
  }

  v15 = objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector logType](self, "logType"));
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v6 < v12)
  {
    if (v16)
    {
      v17 = 67174913;
      LODWORD(v18[0]) = v6;
      WORD2(v18[0]) = 1024;
      *(_DWORD *)((char *)v18 + 6) = v12;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Not enough step data. Steps: %{private}d, threshold: %d", (uint8_t *)&v17, 0xEu);
    }

    -[SDUnlockMotionDetector setCheckedStepData:](self, "setCheckedStepData:", 1);
  }
  else
  {
    if (v16)
    {
      v17 = 67174657;
      LODWORD(v18[0]) = v6;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Step activity detected. Steps: %{private}d", (uint8_t *)&v17, 8u);
    }

  }
  -[SDUnlockMotionDetector handleMotionDetected:](self, "handleMotionDetected:", v6 >= v12);

}

- (void)handleMotionDetected:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const __CFString *v6;
  NSObject *v7;
  const __CFString *v8;
  const __CFString *v9;
  NSObject *handlerQueue;
  _QWORD block[5];
  uint8_t buf[4];
  const __CFString *v13;
  __int16 v14;
  const __CFString *v15;

  v3 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector logType](self, "logType"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    if (v3)
      v6 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Detected motion %@", buf, 0xCu);
  }

  if ((id)-[SDUnlockMotionDetector type](self, "type") != (id)1 || v3)
    goto LABEL_17;
  v7 = objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector logType](self, "logType"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (-[SDUnlockMotionDetector checkedStepData](self, "checkedStepData"))
      v8 = CFSTR("YES");
    else
      v8 = CFSTR("NO");
    if (-[SDUnlockMotionDetector checkedActivityData](self, "checkedActivityData"))
      v9 = CFSTR("YES");
    else
      v9 = CFSTR("NO");
    *(_DWORD *)buf = 138412546;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Checked step data: %@, checked activity data: %@", buf, 0x16u);
  }

  if (-[SDUnlockMotionDetector checkedActivityData](self, "checkedActivityData"))
  {
    if (-[SDUnlockMotionDetector checkedStepData](self, "checkedStepData"))
    {
LABEL_17:
      -[SDUnlockMotionDetector setMotionDetected:](self, "setMotionDetected:", v3);
      handlerQueue = self->_handlerQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100064124;
      block[3] = &unk_1007146D8;
      block[4] = self;
      dispatch_async(handlerQueue, block);
    }
  }
}

- (void)restartMotionTimer
{
  NSObject *v3;
  void *v4;
  id inited;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_time_t v13;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  SDUnlockMotionDetector *v18;
  id v19;
  uint8_t buf[8];

  v3 = objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector logType](self, "logType"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Restarting motion timer", buf, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector motionTimer](self, "motionTimer"));
  if (!v4)
  {
    *(_QWORD *)buf = 0;
    inited = objc_initWeak((id *)buf, self);
    v7 = SFMainQueue(inited, v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v14 = _NSConcreteStackBlock;
    v15 = 3221225472;
    v16 = sub_100064314;
    v17 = &unk_1007147A0;
    v18 = self;
    objc_copyWeak(&v19, (id *)buf);
    v9 = sub_10019AAD8(0, v8, &v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    -[SDUnlockMotionDetector setMotionTimer:](self, "setMotionTimer:", v10, v14, v15, v16, v17, v18);

    v11 = objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector motionTimer](self, "motionTimer"));
    dispatch_resume(v11);

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
  v12 = objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector motionTimer](self, "motionTimer"));
  v13 = sub_10019AAC0(1.0);
  sub_10019AB78(v12, v13);

}

- (void)invalidateMotionTimer
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector logType](self, "logType"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invalidating motion timer", v6, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector motionTimer](self, "motionTimer"));
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[SDUnlockMotionDetector motionTimer](self, "motionTimer"));
    dispatch_source_cancel(v5);

    -[SDUnlockMotionDetector setMotionTimer:](self, "setMotionTimer:", 0);
  }
}

- (BOOL)shouldUseAccelerometerMotion
{
  return sub_1000CE8D0(CFSTR("PUUseAccelerometerMotion"), 0) != 0;
}

- (BOOL)motionDetected
{
  return self->_motionDetected;
}

- (void)setMotionDetected:(BOOL)a3
{
  self->_motionDetected = a3;
}

- (BOOL)accelerometerMotion
{
  return self->_accelerometerMotion;
}

- (void)setAccelerometerMotion:(BOOL)a3
{
  self->_accelerometerMotion = a3;
}

- (BOOL)activityMotion
{
  return self->_activityMotion;
}

- (void)setActivityMotion:(BOOL)a3
{
  self->_activityMotion = a3;
}

- (id)motionDetectedHandler
{
  return self->_motionDetectedHandler;
}

- (void)setMotionDetectedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)wristOnDate
{
  return self->_wristOnDate;
}

- (void)setWristOnDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (OS_os_log)logType
{
  return self->_logType;
}

- (void)setLogType:(id)a3
{
  objc_storeStrong((id *)&self->_logType, a3);
}

- (BOOL)activateCalled
{
  return self->_activateCalled;
}

- (void)setActivateCalled:(BOOL)a3
{
  self->_activateCalled = a3;
}

- (BOOL)invalidateCalled
{
  return self->_invalidateCalled;
}

- (void)setInvalidateCalled:(BOOL)a3
{
  self->_invalidateCalled = a3;
}

- (BOOL)baseAccelerationSet
{
  return self->_baseAccelerationSet;
}

- (void)setBaseAccelerationSet:(BOOL)a3
{
  self->_baseAccelerationSet = a3;
}

- (OS_dispatch_source)motionTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMotionTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (CMMotionManager)motionManager
{
  return self->_motionManager;
}

- (void)setMotionManager:(id)a3
{
  objc_storeStrong((id *)&self->_motionManager, a3);
}

- (CMPedometer)pedometerManager
{
  return self->_pedometerManager;
}

- (void)setPedometerManager:(id)a3
{
  objc_storeStrong((id *)&self->_pedometerManager, a3);
}

- (CMMotionActivityManager)activityManager
{
  return self->_activityManager;
}

- (void)setActivityManager:(id)a3
{
  objc_storeStrong((id *)&self->_activityManager, a3);
}

- ($1AB5FA073B851C12C2339EC22442E995)baseAcceleration
{
  double x;
  double y;
  double z;
  $1AB5FA073B851C12C2339EC22442E995 result;

  x = self->_baseAcceleration.x;
  y = self->_baseAcceleration.y;
  z = self->_baseAcceleration.z;
  result.var2 = z;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- (void)setBaseAcceleration:(id)a3
{
  self->_baseAcceleration = ($83A9B0F16167884A9BDC45564D3E7367)a3;
}

- (BOOL)checkedActivityData
{
  return self->_checkedActivityData;
}

- (void)setCheckedActivityData:(BOOL)a3
{
  self->_checkedActivityData = a3;
}

- (BOOL)checkedStepData
{
  return self->_checkedStepData;
}

- (void)setCheckedStepData:(BOOL)a3
{
  self->_checkedStepData = a3;
}

- (OS_dispatch_queue)handlerQueue
{
  return self->_handlerQueue;
}

- (void)setHandlerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_handlerQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlerQueue, 0);
  objc_storeStrong((id *)&self->_activityManager, 0);
  objc_storeStrong((id *)&self->_pedometerManager, 0);
  objc_storeStrong((id *)&self->_motionManager, 0);
  objc_storeStrong((id *)&self->_motionTimer, 0);
  objc_storeStrong((id *)&self->_logType, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_wristOnDate, 0);
  objc_storeStrong(&self->_motionDetectedHandler, 0);
}

@end
