@implementation _DASENManager

- (void)setIsENActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  int v19;
  id v20;
  __int16 v21;
  double v22;
  __int16 v23;
  unsigned int v24;
  __int16 v25;
  void *v26;

  v4 = a3;
  objc_msgSend(v4, "setIsContactTracingBackgroundActivity:", 0);
  if (!+[_DASConfig isiPhone](_DASConfig, "isiPhone"))
  {
    v14 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("exposure-notification")));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Exposure Notification not supported on non-iPhone device", (uint8_t *)&v19, 2u);
    }
    goto LABEL_12;
  }
  if (-[_DASENManager isPossibleENActivity:](self, "isPossibleENActivity:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "relatedApplications"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
    v7 = -[_DASENManager launchIntervalForENApplication:](self, "launchIntervalForENApplication:", v6);
    v8 = (double)v7;

    if (v7)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dateByAddingTimeInterval:", v8));

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clientProvidedStartDate"));
      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clientProvidedStartDate"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "laterDate:", v10));
        objc_msgSend(v4, "setStartAfter:", v13);

      }
      else
      {
        objc_msgSend(v4, "setStartAfter:", v10);
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startAfter"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dateByAddingTimeInterval:", 3600.0));
      objc_msgSend(v4, "setStartBefore:", v16);

      objc_msgSend(v4, "setIsContactTracingBackgroundActivity:", 1);
    }
    v14 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("exposure-notification")));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_msgSend(v4, "isContactTracingBackgroundActivity");
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startAfter"));
      v19 = 138544130;
      v20 = v4;
      v21 = 2048;
      v22 = v8 / 60.0;
      v23 = 1024;
      v24 = v17;
      v25 = 2114;
      v26 = v18;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Activity: %{public}@, Interval=%.0lf, isCTBackgroundActivity=%u, Eligible=%{public}@", (uint8_t *)&v19, 0x26u);

    }
LABEL_12:

  }
}

- (BOOL)isPossibleENActivity:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "launchReason"));
  if (objc_msgSend(v4, "isEqualToString:", _DASLaunchReasonBackgroundProcessing))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "clientProvidedIdentifier"));
    v6 = objc_msgSend(v5, "hasSuffix:", CFSTR("exposure-notification"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (_DASENManager)init
{
  _DASENManager *v2;
  _DASENManager *v3;
  dispatch_queue_global_t global_queue;
  NSObject *v5;
  _QWORD handler[4];
  _DASENManager *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_DASENManager;
  v2 = -[_DASENManager init](&v9, "init");
  v3 = v2;
  if (v2)
  {
    v2->_token = -1;
    global_queue = dispatch_get_global_queue(-2, 0);
    v5 = objc_claimAutoreleasedReturnValue(global_queue);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000C8AD0;
    handler[3] = &unk_10015D9B8;
    v8 = v3;
    notify_register_dispatch("com.apple.ExposureNotification.trackedAppChanged", &v3->_token, v5, handler);

  }
  return v3;
}

+ (id)manager
{
  return objc_alloc_init((Class)objc_opt_class(a1));
}

+ (id)activeENApplication
{
  id v2;
  dispatch_semaphore_t v3;
  id v4;
  NSObject *v5;
  dispatch_time_t v6;
  id v7;
  _QWORD v9[4];
  id v10;
  NSObject *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v2 = objc_alloc_init((Class)ENManager);
  v3 = dispatch_semaphore_create(0);
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_1000C8CA4;
  v17 = sub_1000C8CB4;
  v18 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000C8CBC;
  v9[3] = &unk_1001600C0;
  v4 = v2;
  v10 = v4;
  v12 = &v13;
  v5 = v3;
  v11 = v5;
  objc_msgSend(v4, "activateWithCompletionHandler:", v9);
  v6 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v5, v6);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

+ (id)enTaskIdentifiersForApplication:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "compatibilityObject"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "backgroundTaskSchedulerPermittedIdentifiers", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v12, "hasSuffix:", CFSTR("exposure-notification")))
          objc_msgSend(v6, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v6;
}

+ (void)launchApplication:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *i;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  uint64_t v20;
  uint64_t v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  _BYTE v29[128];

  v22 = a3;
  v4 = objc_msgSend((id)objc_opt_class(a1), "enTaskIdentifiersForApplication:", v22);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(v4);
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v5)
  {
    v6 = v5;
    v21 = *(_QWORD *)v24;
    v20 = _DASLaunchReasonBackgroundProcessing;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v21)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v9 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("exposure-notification")));
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v28 = v8;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Submitting relaunch for %{public}@", buf, 0xCu);
        }

        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("bgProcessing-%@"), v8));
        v11 = _DASSchedulingPriorityUtility;
        v12 = _DASActivityDurationShort;
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 60.0));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivity applicationLaunchActivityWithName:priority:forApplication:withReason:duration:startingAfter:startingBefore:](_DASActivity, "applicationLaunchActivityWithName:priority:forApplication:withReason:duration:startingAfter:startingBefore:", v10, v11, v22, v20, v12, v13, v14));

        objc_msgSend(v15, "setClientProvidedIdentifier:", v8);
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        objc_msgSend(v15, "setClientProvidedStartDate:", v16);

        objc_msgSend(v15, "setRequiresNetwork:", 1);
        objc_msgSend(v15, "setRequiresPlugin:", 0);
        objc_msgSend(v15, "setIsContactTracingBackgroundActivity:", 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        objc_msgSend(v15, "setSubmitDate:", v17);

        v18 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](_DASDaemon, "sharedInstance"));
        objc_msgSend(v18, "submitActivity:", v15);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v6);
  }

}

+ (void)runPeriodicRelaunchTask
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  void *v8;

  v3 = objc_msgSend((id)objc_opt_class(a1), "activeENApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("exposure-notification")));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_1000EAFB8((uint64_t)v4, v5);

  if (v4)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("exposure-notification")));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Creating EN relaunch task for %{public}@", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend((id)objc_opt_class(a1), "launchApplication:", v4);
  }

}

+ (void)schedulePeriodicRelaunchTask
{
  id v3;
  int v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  NSObject *v15;
  id v16;
  _QWORD v17[5];
  uint8_t buf[4];
  id v19;

  v3 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.duetactivityscheduler"));
  v4 = objc_msgSend(v3, "integerForKey:", CFSTR("enRelaunchInterval"));
  if (v4 <= 0)
    v5 = 86400;
  else
    v5 = v4;
  v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("exposure-notification")));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v19) = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Preferred interval is %d", buf, 8u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000C974C;
  v17[3] = &unk_10015F220;
  v17[4] = a1;
  objc_msgSend(v7, "registerForTaskWithIdentifier:usingQueue:launchHandler:", off_1001AB130, 0, v17);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "taskRequestForIdentifier:", off_1001AB130));

  if (!v9)
  {
    v10 = objc_alloc((Class)BGRepeatingSystemTaskRequest);
    v11 = objc_msgSend(v10, "initWithIdentifier:", off_1001AB130);
    objc_msgSend(v11, "setPriority:", 2);
    objc_msgSend(v11, "setInterval:", (double)v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
    v16 = 0;
    v13 = objc_msgSend(v12, "submitTaskRequest:error:", v11, &v16);
    v14 = v16;

    if ((v13 & 1) == 0)
    {
      v15 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("exposure-notification")));
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Failed to submit task with error: %@", buf, 0xCu);
      }

    }
  }

}

- (void)performIfENActive:(id)a3
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000C9828;
  v6[3] = &unk_1001600E8;
  v7 = objc_alloc_init((Class)ENManager);
  v8 = v3;
  v4 = v3;
  v5 = v7;
  objc_msgSend(v5, "activateWithCompletionHandler:", v6);

}

- (unint64_t)launchIntervalForENApplication:(id)a3
{
  id v3;
  id v4;
  dispatch_semaphore_t v5;
  id v6;
  id v7;
  NSObject *v8;
  dispatch_time_t v9;
  unint64_t v10;
  _QWORD v12[4];
  id v13;
  id v14;
  NSObject *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v3 = a3;
  v4 = objc_alloc_init((Class)ENManager);
  v5 = dispatch_semaphore_create(0);
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000C9A6C;
  v12[3] = &unk_100160110;
  v6 = v3;
  v13 = v6;
  v16 = &v17;
  v7 = v4;
  v14 = v7;
  v8 = v5;
  v15 = v8;
  objc_msgSend(v7, "exposureNotificationGetStatusForBundleIdentifier:completion:", v6, v12);
  v9 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v8, v9);
  v10 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v10;
}

- (void)handleActiveAppChanged
{
  void *v3;
  NSObject *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  unsigned int v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint8_t v33;
  char v34[15];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  NSObject *v42;
  _BYTE v43[128];

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](_DASDaemon, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "allPendingBackgroundTasks"));
  v4 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("exposure-notification")));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v40 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v36 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
        if (-[_DASENManager isPossibleENActivity:](self, "isPossibleENActivity:", v10))
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "relatedApplications"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
          v13 = -[_DASENManager launchIntervalForENApplication:](self, "launchIntervalForENApplication:", v12);

          v14 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("exposure-notification")));
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v40 = v10;
            _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Considering: %@", buf, 0xCu);
          }

          v15 = objc_msgSend(v10, "isContactTracingBackgroundActivity");
          if (v13)
          {
            if ((v15 & 1) != 0)
              continue;
            objc_msgSend(v10, "setIsContactTracingBackgroundActivity:", 1);
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "submitDate"));

            if (!v16)
            {
              v17 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("exposure-notification")));
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                sub_1000EB0AC(&v33, v34, v17);

              v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -3600.0));
              objc_msgSend(v10, "setSubmitDate:", v18);

            }
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "submitDate"));
            v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "dateByAddingTimeInterval:", (double)v13));

            v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "clientProvidedStartDate"));
            if (v21)
            {
              v22 = (void *)v21;
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "clientProvidedStartDate"));
              objc_msgSend(v23, "timeIntervalSinceDate:", v20);
              v25 = v24;

              if (v25 > 0.0)
              {
                v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "clientProvidedStartDate"));

                v20 = v26;
              }
            }
            objc_msgSend(v10, "setStartAfter:", v20);
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "startAfter"));
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "dateByAddingTimeInterval:", 3600.0));
            objc_msgSend(v10, "setStartBefore:", v28);

            v29 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("exposure-notification")));
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "debugDescription"));
              *(_DWORD *)buf = 138543618;
              v40 = v10;
              v41 = 2112;
              v42 = v30;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ now an EN app %@", buf, 0x16u);

            }
LABEL_25:

          }
          else
          {
            if (!v15)
              continue;
            objc_msgSend(v10, "setIsContactTracingBackgroundActivity:", 0);
            v20 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("exposure-notification")));
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "debugDescription"));
              *(_DWORD *)buf = 138543618;
              v40 = v10;
              v41 = 2112;
              v42 = v29;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ no longer an EN app %@", buf, 0x16u);
              goto LABEL_25;
            }
          }

          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "store"));
          objc_msgSend(v31, "saveActivity:", v10);

          continue;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v7);
  }

}

- (int)token
{
  return self->_token;
}

- (void)setToken:(int)a3
{
  self->_token = a3;
}

@end
