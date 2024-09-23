@implementation _DASIssueDetector

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008F0D0;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001ABC18 != -1)
    dispatch_once(&qword_1001ABC18, block);
  return (id)qword_1001ABC10;
}

- (_DASIssueDetector)init
{
  _DASIssueDetector *v2;
  uint64_t v3;
  OS_os_log *log;
  NSUserDefaults *v5;
  NSUserDefaults *defaults;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_attr_t v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_DASIssueDetector;
  v2 = -[_DASIssueDetector init](&v14, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("issueDetector")));
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = (NSUserDefaults *)objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.dasd.issueDetector"));
    defaults = v2->_defaults;
    v2->_defaults = v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_BACKGROUND, 0);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = dispatch_queue_create("com.apple.duetactivityscheduler.issueDetector", v10);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v11;

  }
  return v2;
}

- (void)schedule
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10008F258;
  v4[3] = &unk_10015D5E8;
  v4[4] = self;
  objc_msgSend(v3, "registerForTaskWithIdentifier:usingQueue:launchHandler:", CFSTR("com.apple.dasd.issueDetector.everyOtherDay"), 0, v4);

}

- (BOOL)hasEnoughTotalPluggedInTimeOfDuration:(int64_t)a3 withMinimumSessionDuration:(int64_t)a4 inLastHours:(double)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *log;
  void *v15;
  double v16;
  double v17;
  id v18;
  id v19;
  id v20;
  char v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  double v29;
  double v30;
  NSObject *v31;
  NSObject *v32;
  void *v34;
  _DASIssueDetector *v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  double v45;
  _BYTE v46[128];

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](_DASPPSDataManager, "sharedInstance"));
  v9 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", a5));
  v10 = objc_alloc((Class)NSDateInterval);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v37 = (void *)v9;
  v12 = objc_msgSend(v10, "initWithStartDate:endDate:", v9, v11);

  v38 = v8;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("IsPluggedIn")));
  v36 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "getPPSTimeSeries:category:valueFilter:metrics:timeFilter:filepath:error:", CFSTR("BackgroundProcessing"), CFSTR("SystemConditionsBattery"), 0, 0));
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    sub_1000E7534((uint64_t)v13, log);
  v35 = self;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));
  objc_msgSend(v15, "epochTimestamp");
  v17 = v16;

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v18 = v13;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v19)
  {
    v20 = v19;
    v21 = 0;
    v22 = *(_QWORD *)v41;
    v23 = 0.0;
LABEL_5:
    v24 = 0;
    while (1)
    {
      if (*(_QWORD *)v41 != v22)
        objc_enumerationMutation(v18);
      v25 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "metricKeysAndValues"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("IsPluggedIn")));
      v28 = objc_msgSend(v27, "BOOLValue");

      if ((v21 & 1) != v28)
      {
        objc_msgSend(v25, "epochTimestamp");
        if ((v28 & 1) != 0)
        {
          v21 = 1;
          v17 = v29;
        }
        else
        {
          v21 = 0;
          v30 = v29 - v17;
          if (v30 <= (double)a4)
            v30 = -0.0;
          v23 = v23 + v30;
        }
      }

      if (v23 > (double)a3)
        break;
      if (v20 == (id)++v24)
      {
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
        if (v20)
          goto LABEL_5;
        break;
      }
    }
  }
  else
  {
    v23 = 0.0;
  }

  v31 = v35->_log;
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v45 = v23;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "PluggedIn duration %f", buf, 0xCu);
  }
  if (v23 < (double)a3)
  {
    v32 = v35->_log;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Not enough plugged in time", buf, 2u);
    }
  }

  return v23 >= (double)a3;
}

- (BOOL)libraryExceedsPhotoCount:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  id v13;
  BOOL v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](_DASPPSDataManager, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("WorkloadType == %@"), &off_10016EC00));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getPPSTimeSeries:category:valueFilter:metrics:timeFilter:filepath:error:", CFSTR("BackgroundProcessing"), CFSTR("WorkloadInformation"), v5, 0, 0, 0, 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v16 = v4;
    v9 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), "metricKeysAndValues"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Size")));
        v13 = objc_msgSend(v12, "integerValue");

        if ((uint64_t)v13 > a3)
        {
          v14 = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
        continue;
      break;
    }
    v14 = 0;
LABEL_11:
    v4 = v16;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)checkProgressForMAD
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  const __CFString *v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  _DASIssueDetector *v25;
  NSObject *log;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  __CFString *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  void *v46;
  void *j;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  char v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  uint64_t v58;
  void *k;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  double v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  NSUserDefaults *defaults;
  void *v71;
  void *v72;
  void *v73;
  _DASIssueDetector *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _QWORD v98[5];
  _QWORD v99[5];
  _BYTE v100[128];
  _BYTE v101[128];
  uint8_t v102[128];
  uint8_t buf[4];
  void *v104;
  _BYTE v105[128];

  if (!-[_DASIssueDetector libraryExceedsPhotoCount:](self, "libraryExceedsPhotoCount:", 1500))
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
      sub_1000E762C();
    return;
  }
  if (!-[_DASIssueDetector hasEnoughTotalPluggedInTimeOfDuration:withMinimumSessionDuration:inLastHours:](self, "hasEnoughTotalPluggedInTimeOfDuration:withMinimumSessionDuration:inLastHours:", 43200, 3600, -172800.0))return;
  v74 = self;
  v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](_DASPPSDataManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -172800.0));
  v5 = objc_alloc((Class)NSDateInterval);
  v78 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateByAddingTimeInterval:", -172800.0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v8 = objc_msgSend(v5, "initWithStartDate:endDate:", v6, v7);

  v72 = v8;
  v73 = v3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getPPSTimeSeries:category:valueFilter:metrics:timeFilter:filepath:error:", CFSTR("BackgroundProcessing"), CFSTR("TaskWorkload"), 0, 0, v8, 0, 0));
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v94, v105, 16);
  v79 = v9;
  if (!v10)
    goto LABEL_20;
  v11 = v10;
  v12 = CFSTR("TaskName");
  v13 = *(_QWORD *)v95;
  do
  {
    for (i = 0; i != v11; i = (char *)i + 1)
    {
      if (*(_QWORD *)v95 != v13)
        objc_enumerationMutation(v9);
      v15 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * (_QWORD)i);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "metricKeysAndValues"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v12));
      if (objc_msgSend(v17, "containsString:", CFSTR("mediaanalysis")))
      {
        v18 = v12;
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("SubCategory")));
        if (objc_msgSend(v19, "containsString:", CFSTR("failed")))
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("CompletedPercentage")));
          objc_msgSend(v81, "setObject:forKeyedSubscript:", v20, v17);
          goto LABEL_16;
        }
        if (!v19)
        {
          objc_msgSend(v15, "epochTimestamp");
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:"));
          objc_msgSend(v20, "timeIntervalSinceDate:", v78);
          if (v21 >= 0.0)
          {
            v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "objectForKeyedSubscript:", v17));
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)objc_msgSend(v77, "integerValue") + 1));
            objc_msgSend(v80, "setObject:forKeyedSubscript:", v24, v17);

            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("CompletedPercentage")));
            v23 = v75;
          }
          else
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("CompletedPercentage")));
            v23 = v76;
          }
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, v17);

          v9 = v79;
LABEL_16:

        }
        v12 = v18;
      }

    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v94, v105, 16);
  }
  while (v11);
LABEL_20:
  v25 = v74;
  log = v74->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v104 = v80;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "MAD Progress Count: %@", buf, 0xCu);
  }
  v27 = v74->_log;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v104 = v76;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Past MAD Progress: %@", buf, 0xCu);
  }
  v28 = v74->_log;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v104 = v75;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Current MAD Progress: %@", buf, 0xCu);
  }
  v29 = v74->_log;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v104 = v81;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Current MAD Failed: %@", buf, 0xCu);
  }
  if (objc_msgSend(v76, "count") && objc_msgSend(v80, "count"))
  {
    v30 = v79;
    if (!objc_msgSend(v80, "count"))
    {
      v35 = &stru_1001617C8;
      goto LABEL_67;
    }
    v92 = 0u;
    v93 = 0u;
    v90 = 0u;
    v91 = 0u;
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "allKeys"));
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v90, v102, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v91;
      v35 = &stru_1001617C8;
LABEL_33:
      v36 = 0;
      while (1)
      {
        if (*(_QWORD *)v91 != v34)
          objc_enumerationMutation(v31);
        v37 = *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * v36);
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "objectForKeyedSubscript:", v37));
        v39 = objc_msgSend(v38, "integerValue");

        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "objectForKeyedSubscript:", v37));
        v41 = objc_msgSend(v40, "integerValue");

        if ((uint64_t)v41 > (uint64_t)v39)
          break;
        if (v33 == (id)++v36)
        {
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v90, v102, 16);
          if (v33)
            goto LABEL_33;
          goto LABEL_39;
        }
      }
LABEL_72:
      v30 = v79;
      goto LABEL_73;
    }
LABEL_39:

    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "allKeys"));
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v86, v101, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v87;
      v35 = &stru_1001617C8;
      v46 = v81;
      while (2)
      {
        for (j = 0; j != v44; j = (char *)j + 1)
        {
          if (*(_QWORD *)v87 != v45)
            objc_enumerationMutation(v42);
          v48 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * (_QWORD)j);
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "objectForKeyedSubscript:", v48));
          v50 = (uint64_t)objc_msgSend(v49, "integerValue");

          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "objectForKeyedSubscript:", v48));
          if (v51)
          {
            v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "objectForKeyedSubscript:", v48));
            objc_msgSend(v52, "integerValue");

          }
          if (v50 <= 89)
          {
            v35 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("No progress for %@"), v48));
            v53 = 1;
            goto LABEL_57;
          }
        }
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v86, v101, 16);
        if (v44)
          continue;
        break;
      }
      v53 = 0;
    }
    else
    {
      v53 = 0;
      v35 = &stru_1001617C8;
      v46 = v81;
    }
LABEL_57:

    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "allKeys"));
    v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v82, v100, 16);
    if (v56)
    {
      v57 = v56;
      v58 = *(_QWORD *)v83;
      do
      {
        for (k = 0; k != v57; k = (char *)k + 1)
        {
          if (*(_QWORD *)v83 != v58)
            objc_enumerationMutation(v55);
          v60 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * (_QWORD)k);
          v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "objectForKeyedSubscript:", v60));
          v62 = (uint64_t)objc_msgSend(v61, "integerValue");

          if (v62 >= 36)
          {
            v63 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed count high for %@"), v60));

            v53 = 1;
            v35 = (__CFString *)v63;
          }
        }
        v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v82, v100, 16);
      }
      while (v57);
    }

    v25 = v74;
    v30 = v79;
    if ((v53 & 1) != 0)
    {
LABEL_67:
      v64 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults valueForKey:](v25->_defaults, "valueForKey:", CFSTR("lastDateForMADProgressTTR")));
      v31 = v64;
      if (!v64 || (objc_msgSend(v64, "timeIntervalSinceNow"), v65 < -2592000.0))
      {
        if (os_log_type_enabled((os_log_t)v25->_log, OS_LOG_TYPE_DEBUG))
          sub_1000E75D4();
        v98[0] = CFSTR("count");
        v98[1] = CFSTR("pastProgress");
        v99[0] = v80;
        v99[1] = v76;
        v98[2] = CFSTR("currentProgress");
        v98[3] = CFSTR("failedProgress");
        v99[2] = v75;
        v99[3] = v81;
        v98[4] = CFSTR("trigger");
        v99[4] = v35;
        v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v99, v98, 5));
        v67 = (void *)objc_claimAutoreleasedReturnValue(-[_DASIssueDetector ttrURLWithTitle:withDescription:withStateDictionary:](v25, "ttrURLWithTitle:withDescription:withStateDictionary:", CFSTR("Tap to file Radar. Slow progress detected for MediaAnalysis background job"), CFSTR("PLEASE ANSWER THESE QUESTIONS TO AID DEBUGGING:\n\n* Is this your regular carry device? \n\n*Were a large number of photos/videos taken in the last 48 hours?\n\n\n"), v66));
        v68 = (void *)objc_claimAutoreleasedReturnValue(+[_DASNotificationManager sharedManager](_DASNotificationManager, "sharedManager"));
        v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 14400.0));
        objc_msgSend(v68, "postNotificationAtDate:withTitle:withTextContent:icon:url:expirationDate:", 0, CFSTR("[Internal] Background Processing Issue"), CFSTR("Tap to file Radar. Slow progress detected for MediaAnalysis background job"), CFSTR("TTR"), v67, v69);

        defaults = v25->_defaults;
        v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        -[NSUserDefaults setValue:forKey:](defaults, "setValue:forKey:", v71, CFSTR("lastDateForMADProgressTTR"));

        goto LABEL_72;
      }
      if (os_log_type_enabled((os_log_t)v25->_log, OS_LOG_TYPE_DEBUG))
        sub_1000E7600();
LABEL_73:

    }
    v54 = v78;
  }
  else
  {
    v54 = v78;
    v30 = v79;
    if (os_log_type_enabled((os_log_t)v74->_log, OS_LOG_TYPE_DEBUG))
      sub_1000E75A8();
  }

}

- (id)ttrURLWithTitle:(id)a3 withDescription:(id)a4 withStateDictionary:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *log;
  uint8_t buf[4];
  void *v17;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ Debug Info:\n %@"), a4, a5));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("tap-to-radar://new?Title=%@&Classification=Serious Bug&ComponentID=787030&ComponentName=Duet&ComponentVersion=Activity Scheduler&Reproducible=Sometimes&Description=%@"), v8, v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet URLQueryAllowedCharacterSet](NSCharacterSet, "URLQueryAllowedCharacterSet"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAddingPercentEncodingWithAllowedCharacters:", v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v12));
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v13;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "TTR URL is %@", buf, 0xCu);
  }

  return v13;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
