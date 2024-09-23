@implementation _DASAutoBugCaptureHelper

+ (BOOL)isActivitySignificantlyOverdue:(id)a3 now:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  NSObject *v14;
  void *v15;
  void *v16;
  BOOL v17;
  int v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;

  v5 = a3;
  v6 = a4;
  v7 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("abcHelper")));
  v8 = v7;
  if (!v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      sub_1000E5468();
    goto LABEL_14;
  }
  if (!v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      sub_1000E5494();
    goto LABEL_14;
  }
  if (!objc_msgSend(v5, "significantlyOverdueAtDate:", v6))
  {
LABEL_14:
    v17 = 0;
    goto LABEL_15;
  }
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "submitDate"));
  if (v9)
  {
    v10 = (void *)v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "submitDate"));
    objc_msgSend(v6, "timeIntervalSinceDate:", v11);
    v13 = v12;

    if (v13 > 2073600.0)
    {
      v14 = v8;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "submitDate"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "startBefore"));
        v19 = 138413058;
        v20 = v5;
        v21 = 2112;
        v22 = v15;
        v23 = 2112;
        v24 = v16;
        v25 = 2112;
        v26 = v6;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Activity %@ significantly overdue, submit: %@, startBefore: %@, now: %@", (uint8_t *)&v19, 0x2Au);

      }
    }
  }
  v17 = 1;
LABEL_15:

  return v17;
}

+ (void)triggerABCCaseForActivities:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  _QWORD v24[4];
  NSObject *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  _BYTE v40[128];

  v3 = a3;
  v4 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("abcHelper")));
  v5 = v4;
  if (v3)
  {
    v23 = v4;
    v6 = objc_alloc_init((Class)NSMutableArray);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v40, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v28;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v11), "name"));
          objc_msgSend(v6, "addObject:", v12);

          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v40, 16);
      }
      while (v9);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsJoinedByString:", CFSTR(",")));
    v14 = objc_alloc_init((Class)SDRDiagnosticReporter);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:", CFSTR("Duet"), CFSTR("Activities Significantly Overdue"), CFSTR("Multiple Activities"), 0, CFSTR("dasd"), 0));
    v38 = kSymptomDiagnosticKeyPayloadDEParameters;
    v35 = v13;
    v36 = CFSTR("com.apple.das.DASDaemon.DuetDiagnosticExtension");
    v34 = CFSTR("kDASActivityNames");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1));
    v37 = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1));
    v39 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1));

    v31 = CFSTR("kDASActivityNames");
    v32 = v13;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
    v33 = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v33, 1));

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100080D6C;
    v24[3] = &unk_10015EF60;
    v5 = v23;
    v21 = v23;
    v25 = v21;
    v26 = v13;
    v22 = v13;
    if ((objc_msgSend(v14, "snapshotWithSignature:duration:events:payload:actions:reply:", v15, v20, v18, 0, v24, 0.0) & 1) == 0&& os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      sub_1000E54EC();
    }

  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    sub_1000E54C0();
  }

}

+ (void)checkAllTasksForBGSystemTask:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  unsigned __int8 v14;
  id v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[4];
  NSObject *v28;
  uint8_t *v29;
  uint8_t buf[8];
  uint8_t *v31;
  uint64_t v32;
  char v33;
  uint8_t v34[4];
  id v35;
  _BYTE v36[128];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("abcHelper")));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Checking activities for significantly overdue tasks", buf, 2u);
  }
  if (v4)
  {
    *(_QWORD *)buf = 0;
    v31 = buf;
    v32 = 0x2020000000;
    v33 = 0;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100081280;
    v27[3] = &unk_10015D580;
    v29 = buf;
    v6 = v5;
    v28 = v6;
    objc_msgSend(v4, "setExpirationHandler:", v27);
    v20 = objc_alloc_init((Class)NSMutableArray);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](_DASDaemon, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allPendingTasks"));

    v18 = v5;
    v19 = v4;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v36, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v13, "userRequestedBackupTask", v18) & 1) != 0
            || objc_msgSend(v13, "beforeDaysFirstActivity"))
          {
            if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v34 = 138412290;
              v35 = v13;
              _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Ignoring activity that is allowed to be overdue: %@", v34, 0xCu);
            }
          }
          else
          {
            if (objc_msgSend((id)objc_opt_class(a1), "isActivitySignificantlyOverdue:now:", v13, v21))
              objc_msgSend(v20, "addObject:", v13);
            if (v31[24])
              goto LABEL_18;
          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v36, 16);
      }
      while (v10);
    }
LABEL_18:

    v5 = v18;
    v4 = v19;
    if (v31[24])
    {
      v22 = 0;
      v14 = objc_msgSend(v19, "setTaskExpiredWithRetryAfter:error:", &v22, 0.0);
      v15 = v22;
      if ((v14 & 1) == 0)
      {
        v16 = v6;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier"));
          sub_1000E5658(v17, (uint64_t)v15, v34, v16);
        }

        objc_msgSend(v19, "setTaskCompleted");
      }

    }
    else
    {
      if (objc_msgSend(v20, "count"))
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v34 = 138412290;
          v35 = v20;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Found significantly overdue activities:\n%@", v34, 0xCu);
        }
        objc_msgSend((id)objc_opt_class(a1), "triggerABCCaseForActivities:", v20);
      }
      objc_msgSend(v19, "setTaskCompleted", v18);
    }

    _Block_object_dispose(buf, 8);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    sub_1000E562C();
  }

}

+ (void)schedule
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  NSObject *v7;
  id v8;

  v3 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("abcHelper")));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_1000E56BC();
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000813C0;
  v6[3] = &unk_10015EF88;
  v7 = v3;
  v8 = a1;
  v5 = v3;
  objc_msgSend(v4, "registerForTaskWithIdentifier:usingQueue:launchHandler:", CFSTR("com.apple.dasd.overdueCheck"), 0, v6);

}

@end
