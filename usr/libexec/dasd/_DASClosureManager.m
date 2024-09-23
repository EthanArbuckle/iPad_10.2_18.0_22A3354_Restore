@implementation _DASClosureManager

- (_DASClosureManager)init
{
  _DASClosureManager *v2;
  _DASClosureManager *v3;
  _DASCollectTelemetryActivityContext *v4;
  _DASCollectTelemetryActivityContext *collectTelemetryActivityContext;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_DASClosureManager;
  v2 = -[_DASClosureManager init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    -[_DASClosureManager initializeLogs](v2, "initializeLogs");
    -[_DASClosureManager registerForActivities](v3, "registerForActivities");
    v4 = objc_opt_new(_DASCollectTelemetryActivityContext);
    collectTelemetryActivityContext = v3->_collectTelemetryActivityContext;
    v3->_collectTelemetryActivityContext = v4;

  }
  return v3;
}

- (void)initializeLogs
{
  os_log_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  if (!qword_1001ABB20)
  {
    v2 = os_log_create("com.apple.dasd.signpost", "DuetClosuresTelemetry");
    v3 = (void *)qword_1001ABB20;
    qword_1001ABB20 = (uint64_t)v2;

  }
  if (!qword_1001ABB28)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("closureManager")));
    v5 = (void *)qword_1001ABB28;
    qword_1001ABB28 = v4;

  }
}

- (void)registerForActivities
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  unsigned __int8 v16;
  id v17;
  NSObject *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  uint8_t buf[4];
  id v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10007A3B8;
  v22[3] = &unk_10015EC80;
  v22[4] = self;
  objc_msgSend(v3, "registerForTaskWithIdentifier:usingQueue:launchHandler:", CFSTR("com.apple.dasd.closureOnBoot"), 0, v22);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "taskRequestForIdentifier:", CFSTR("com.apple.dasd.closureOnBoot")));

  if (!v5)
  {
    v6 = objc_msgSend(objc_alloc((Class)BGNonRepeatingSystemTaskRequest), "initWithIdentifier:", CFSTR("com.apple.dasd.closureOnBoot"));
    objc_msgSend(v6, "setPriority:", 2);
    objc_msgSend(v6, "setRequiresExternalPower:", 0);
    objc_msgSend(v6, "setTrySchedulingBefore:", 0.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
    v21 = 0;
    v8 = objc_msgSend(v7, "submitTaskRequest:error:", v6, &v21);
    v9 = v21;

    if ((v8 & 1) == 0)
    {
      v10 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Failed to submit task with error: %@", buf, 0xCu);
      }

    }
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10007A48C;
  v20[3] = &unk_10015EC80;
  v20[4] = self;
  objc_msgSend(v11, "registerForTaskWithIdentifier:usingQueue:launchHandler:", CFSTR("com.apple.dasd.closureOpportunistic"), 0, v20);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "taskRequestForIdentifier:", CFSTR("com.apple.dasd.closureOpportunistic")));

  if (!v13)
  {
    v14 = objc_msgSend(objc_alloc((Class)BGNonRepeatingSystemTaskRequest), "initWithIdentifier:", CFSTR("com.apple.dasd.closureOpportunistic"));
    objc_msgSend(v14, "setPriority:", 1);
    objc_msgSend(v14, "setRequiresExternalPower:", 1);
    objc_msgSend(v14, "setRequiresUserInactivity:", 1);
    objc_msgSend(v14, "setTrySchedulingBefore:", 21600.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
    v19 = 0;
    v16 = objc_msgSend(v15, "submitTaskRequest:error:", v14, &v19);
    v17 = v19;

    if ((v16 & 1) == 0)
    {
      v18 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Failed to submit task with error: %@", buf, 0xCu);
      }

    }
  }
}

- (BOOL)isUserInstalledApp:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  BOOL v10;
  NSObject *v11;
  int v13;
  id v14;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "compatibilityObject"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appState"));
  if (!objc_msgSend(v6, "isValid"))
    goto LABEL_6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appState"));
  if ((objc_msgSend(v7, "isInstalled") & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "applicationType"));
  v9 = objc_msgSend(v8, "isEqualToString:", LSUserApplicationType);

  if ((v9 & 1) != 0)
  {
    v10 = 1;
    goto LABEL_10;
  }
LABEL_7:
  v11 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("closureManager")));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Skipping system application '%@'", (uint8_t *)&v13, 0xCu);
  }

  v10 = 0;
LABEL_10:

  return v10;
}

- (BOOL)isDeletableApp:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  BOOL v8;
  NSObject *v9;
  int v11;
  id v12;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "applicationState"));
  if (!objc_msgSend(v5, "isValid"))
    goto LABEL_6;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "applicationState"));
  if ((objc_msgSend(v6, "isInstalled") & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  v7 = objc_msgSend(v4, "isDeletable");

  if ((v7 & 1) != 0)
  {
    v8 = 1;
    goto LABEL_9;
  }
LABEL_7:
  v9 = qword_1001ABB28;
  v8 = 0;
  if (os_log_type_enabled((os_log_t)qword_1001ABB28, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Skipping non-deletable app '%@'", (uint8_t *)&v11, 0xCu);
    v8 = 0;
  }
LABEL_9:

  return v8;
}

- (id)appsToExclude
{
  return &off_10016F4A0;
}

- (void)buildClosuresForApps:(id)a3 withTask:(id)a4 onBoot:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  unsigned __int8 v21;
  id v22;
  NSObject *v23;
  void *v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[5];
  uint8_t v32[4];
  uint64_t v33;
  __int16 v34;
  void *v35;
  uint8_t v36[128];
  uint8_t buf[8];
  __int128 v38;
  char v39;

  v5 = a5;
  v7 = a3;
  v25 = a4;
  v8 = os_signpost_id_generate((os_log_t)qword_1001ABB20);
  v9 = (id)qword_1001ABB20;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "componentsJoinedByString:", CFSTR(",")));
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = v5;
    LOWORD(v38) = 2114;
    *(_QWORD *)((char *)&v38 + 2) = v11;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, v8, "DuetClosuresPrewarm", "onBoot:%d, bundleIDs:%{public}@", buf, 0x12u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&v38 = buf;
  *((_QWORD *)&v38 + 1) = 0x2020000000;
  v39 = 0;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10007ABE4;
  v31[3] = &unk_10015D610;
  v31[4] = buf;
  objc_msgSend(v25, "setExpirationHandler:", v31);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v28;
LABEL_6:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v14)
        objc_enumerationMutation(v12);
      if (*(_BYTE *)(v38 + 24))
        break;
      v16 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v15);
      v17 = qword_1001ABB28;
      if (os_log_type_enabled((os_log_t)qword_1001ABB28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v32 = 138412290;
        v33 = v16;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Building closure for '%@'", v32, 0xCu);
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[_APRSPrewarmInterface sharedInstance](_APRSPrewarmInterface, "sharedInstance"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "closureBuildLaunchAppFromBundleID:", v16));

      if (v19)
      {
        v20 = qword_1001ABB28;
        if (os_log_type_enabled((os_log_t)qword_1001ABB28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v32 = 138412546;
          v33 = v16;
          v34 = 2112;
          v35 = v19;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Encountered error launching %@: %@", v32, 0x16u);
        }
      }

      if (v13 == (id)++v15)
      {
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
        if (v13)
          goto LABEL_6;
        break;
      }
    }
  }

  if (*(_BYTE *)(v38 + 24))
  {
    v26 = 0;
    v21 = objc_msgSend(v25, "setTaskExpiredWithRetryAfter:error:", &v26, 0.0);
    v22 = v26;
    if ((v21 & 1) == 0)
    {
      v23 = (id)qword_1001ABB20;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "identifier"));
        sub_1000E5058(v24, (uint64_t)v22, (uint64_t)v32);
      }

      objc_msgSend(v25, "setTaskCompleted");
    }

  }
  else
  {
    objc_msgSend(v25, "setTaskCompleted");
  }
  _Block_object_dispose(buf, 8);

}

- (id)recentlyInstalledAppsLimitedTo:(int)a3 withStore:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  void *i;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  _BYTE v48[128];
  void *v49;
  void *v50;
  _QWORD v51[2];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DKAppInstallMetadataKey isInstall](_DKAppInstallMetadataKey, "isInstall"));
  v7 = objc_claimAutoreleasedReturnValue(+[_DKQuery predicateForObjectsWithMetadataKey:andIntegerValue:](_DKQuery, "predicateForObjectsWithMetadataKey:andIntegerValue:", v6, 1));

  v8 = (void *)v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -172800.0));
  v10 = objc_claimAutoreleasedReturnValue(+[_DKQuery predicateForEventsWithStartDateAfter:](_DKQuery, "predicateForEventsWithStartDateAfter:", v9));

  v11 = (void *)v10;
  v51[0] = v8;
  v51[1] = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v51, 2));
  v13 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams appInstallStream](_DKSystemEventStreams, "appInstallStream"));
  v50 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v50, 1));
  v49 = v14;
  v17 = (void *)v13;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v49, 1));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[_DKEventQuery eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:](_DKEventQuery, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v17, v16, 0, a3, v18));

  v47 = 0;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "executeQuery:error:", v19, &v47));
  v21 = v47;
  if (v21)
  {
    v22 = qword_1001ABB28;
    if (os_log_type_enabled((os_log_t)qword_1001ABB28, OS_LOG_TYPE_ERROR))
      sub_1000E50A0(v22, v23, v24, v25, v26, v27, v28, v29);
    v30 = &__NSArray0__struct;
  }
  else
  {
    v39 = v17;
    v40 = (void *)v10;
    v41 = v8;
    v42 = v5;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v32 = v20;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v34; i = (char *)i + 1)
        {
          if (*(_QWORD *)v44 != v35)
            objc_enumerationMutation(v32);
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i), "stringValue"));
          objc_msgSend(v31, "addObject:", v37);

        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      }
      while (v34);
    }

    v30 = objc_msgSend(v31, "copy");
    v8 = v41;
    v5 = v42;
    v17 = v39;
    v11 = v40;
  }

  return v30;
}

- (id)appsLaunchedSinceBoot
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  void *v20;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_DASClosureManager mostRecentBootTime](self, "mostRecentBootTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_DKKnowledgeStore knowledgeStore](_DKKnowledgeStore, "knowledgeStore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_DKApplicationMetadataKey extensionHostIdentifier](_DKApplicationMetadataKey, "extensionHostIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DKQuery predicateForObjectsWithMetadataKey:](_DKQuery, "predicateForObjectsWithMetadataKey:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate notPredicateWithSubpredicate:](NSCompoundPredicate, "notPredicateWithSubpredicate:", v5));

  v20 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v2, "timeIntervalSinceDate:", v9);
  if (v10 > 0.0)
  {
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dateByAddingTimeInterval:", 3600.0));

    v9 = (void *)v11;
  }
  v12 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v2, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams appUsageStream](_DKSystemEventStreams, "appUsageStream"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[_DKHistogramQuery histogramQueryForStream:interval:withPredicate:](_DKHistogramQuery, "histogramQueryForStream:interval:withPredicate:", v13, v12, v8));

  v19 = 0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeQuery:error:", v14, &v19));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "countDictionary"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allKeys"));

  return v17;
}

- (void)buildClosuresForMaximum:(int)a3 withMinimumLikelihood:(double)a4 recentInstallCount:(int)a5 task:(id)a6 onBoot:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  NSObject *v13;
  os_signpost_id_t v14;
  os_signpost_id_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  unsigned __int8 v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  unsigned int v53;
  _BOOL4 v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  _QWORD v60[5];
  _QWORD v61[5];
  _QWORD v62[4];
  id v63;
  id v64;
  id v65;
  _QWORD v66[5];
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  char v70;
  uint8_t buf[4];
  void *v72;
  _QWORD v73[3];

  v7 = a7;
  v12 = a6;
  v67 = 0;
  v68 = &v67;
  v69 = 0x2020000000;
  v70 = 0;
  v66[0] = _NSConcreteStackBlock;
  v66[1] = 3221225472;
  v66[2] = sub_10007B8A4;
  v66[3] = &unk_10015D610;
  v66[4] = &v67;
  if (DMIsMigrationNeeded(objc_msgSend(v12, "setExpirationHandler:", v66)))
  {
    v13 = (id)qword_1001ABB20;
    v14 = os_signpost_id_generate((os_log_t)qword_1001ABB20);
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v15 = v14;
      if (os_signpost_enabled(v13))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v72) = v7;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, v15, "DuetClosuresPrewarm", "onBoot:%d, bundleIDs:", buf, 8u);
      }
    }

    objc_msgSend(v12, "setTaskCompleted");
  }
  else
  {
    v54 = v7;
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[_DKKnowledgeStore knowledgeStore](_DKKnowledgeStore, "knowledgeStore"));
    v53 = a5;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[_DKApplicationMetadataKey extensionHostIdentifier](_DKApplicationMetadataKey, "extensionHostIdentifier"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[_DKQuery predicateForObjectsWithMetadataKey:](_DKQuery, "predicateForObjectsWithMetadataKey:", v16));
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate notPredicateWithSubpredicate:](NSCompoundPredicate, "notPredicateWithSubpredicate:", v17));

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -1209600.0));
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[_DKQuery predicateForEventsWithStartDateAfter:](_DKQuery, "predicateForEventsWithStartDateAfter:", v18));

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[_DASClosureManager appsLaunchedSinceBoot](self, "appsLaunchedSinceBoot"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[_DASClosureManager appsToExclude](self, "appsToExclude"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "arrayByAddingObjectsFromArray:", v20));

    if (objc_msgSend(v21, "count"))
    {
      v22 = qword_1001ABB28;
      if (os_log_type_enabled((os_log_t)qword_1001ABB28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v72 = v21;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Excluding apps: %@", buf, 0xCu);
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[_DKQuery predicateForEventsWithStringValueInValues:](_DKQuery, "predicateForEventsWithStringValueInValues:", v21));
      v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate notPredicateWithSubpredicate:](NSCompoundPredicate, "notPredicateWithSubpredicate:", v23));

    }
    else
    {
      v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](NSPredicate, "predicateWithValue:", 1));
    }
    v73[0] = v58;
    v73[1] = v57;
    v73[2] = v56;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v73, 3));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v24));

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams appInFocusStream](_DKSystemEventStreams, "appInFocusStream"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[_DKPredictionQuery topNPredictionQueryForStream:withPredicate:withTopN:withMinLikelihood:](_DKPredictionQuery, "topNPredictionQueryForStream:withPredicate:withTopN:withMinLikelihood:", v26, v25, (int)((double)a3 * 1.5), a4));

    objc_msgSend(v27, "setReadMetadata:", 1);
    objc_msgSend(v27, "setSlotDuration:", 86400);
    objc_msgSend(v27, "setMinimumDaysOfHistory:", 1);
    v65 = 0;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "executeQuery:error:", v27, &v65));
    v29 = v65;
    if (v29)
    {
      v30 = qword_1001ABB28;
      if (os_log_type_enabled((os_log_t)qword_1001ABB28, OS_LOG_TYPE_ERROR))
        sub_1000E4164(v30, v31, v32, v33, v34, v35, v36, v37);
      objc_msgSend(v12, "setTaskCompleted");
    }
    else
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "valueAtDate:", v38));

      v39 = qword_1001ABB28;
      if (os_log_type_enabled((os_log_t)qword_1001ABB28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v72 = v55;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Elements are: %@", buf, 0xCu);
      }
      if (*((_BYTE *)v68 + 24))
      {
        v64 = 0;
        v40 = objc_msgSend(v12, "setTaskExpiredWithRetryAfter:error:", &v64, 0.0);
        v52 = v64;
        if ((v40 & 1) == 0)
        {
          v41 = (id)qword_1001ABB20;
          if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
          {
            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
            sub_1000E5058(v42, (uint64_t)v52, (uint64_t)buf);
          }

          objc_msgSend(v12, "setTaskCompleted");
        }
      }
      else
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "allKeys"));
        v52 = objc_msgSend(v43, "mutableCopy");

        v62[0] = _NSConcreteStackBlock;
        v62[1] = 3221225472;
        v62[2] = sub_10007B8B8;
        v62[3] = &unk_10015ECA8;
        v63 = v55;
        objc_msgSend(v52, "sortUsingComparator:", v62);
        v61[0] = _NSConcreteStackBlock;
        v61[1] = 3221225472;
        v61[2] = sub_10007B948;
        v61[3] = &unk_10015ECD0;
        v61[4] = self;
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v61));
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "filteredArrayUsingPredicate:", v44));

        if ((unint64_t)objc_msgSend(v45, "count") > a3)
        {
          v46 = objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "subarrayWithRange:", 0, a3));

          v45 = (void *)v46;
        }
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "arrayByAddingObject:", CFSTR("com.apple.InputUI")));

        v47 = (void *)objc_claimAutoreleasedReturnValue(-[_DASClosureManager recentlyInstalledAppsLimitedTo:withStore:](self, "recentlyInstalledAppsLimitedTo:withStore:", v53, v59));
        v60[0] = _NSConcreteStackBlock;
        v60[1] = 3221225472;
        v60[2] = sub_10007B954;
        v60[3] = &unk_10015ECD0;
        v60[4] = self;
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v60));
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "filteredArrayUsingPredicate:", v48));

        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "arrayByAddingObjectsFromArray:", v51));
        -[_DASClosureManager buildClosuresForApps:withTask:onBoot:](self, "buildClosuresForApps:withTask:onBoot:", v50, v12, v54);

      }
    }

  }
  _Block_object_dispose(&v67, 8);

}

- (void)buildClosuresOnBootWithTask:(id)a3
{
  -[_DASClosureManager buildClosuresForMaximum:withMinimumLikelihood:recentInstallCount:task:onBoot:](self, "buildClosuresForMaximum:withMinimumLikelihood:recentInstallCount:task:onBoot:", 10, 1, a3, 1, 0.0);
}

- (id)mostRecentBootTime
{
  void *v2;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  int v7[2];

  v4 = 0;
  v5 = 0;
  *(_QWORD *)v7 = 0x1500000001;
  v6 = 16;
  if (sysctl(v7, 2u, &v4, &v6, 0, 0) == -1)
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -86400.0));
  else
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(int)v5 / 1000000.0 + (double)v4));
  return v2;
}

- (void)buildClosuresOpportunisticWithTask:(id)a3
{
  -[_DASClosureManager buildClosuresForMaximum:withMinimumLikelihood:recentInstallCount:task:onBoot:](self, "buildClosuresForMaximum:withMinimumLikelihood:recentInstallCount:task:onBoot:", 50, 5, a3, 0, 0.05);
}

- (void)collectClosureTelemetryWithTask:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _DASCollectTelemetryActivityContext *collectTelemetryActivityContext;
  _QWORD v10[5];
  _QWORD v11[5];
  uint8_t buf[4];
  _DASCollectTelemetryActivityContext *v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASClosureManager mostRecentBootTime](self, "mostRecentBootTime"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -86400.0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "laterDate:", v6));

  -[_DASCollectTelemetryActivityContext updateWithtask:prewarmingStartDate:launchStartDate:](self->_collectTelemetryActivityContext, "updateWithtask:prewarmingStartDate:launchStartDate:", v4, v5, v7);
  v8 = qword_1001ABB28;
  if (os_log_type_enabled((os_log_t)qword_1001ABB28, OS_LOG_TYPE_DEFAULT))
  {
    collectTelemetryActivityContext = self->_collectTelemetryActivityContext;
    *(_DWORD *)buf = 138412290;
    v13 = collectTelemetryActivityContext;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Running telemetry collection using context: %@", buf, 0xCu);
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10007BBE8;
  v11[3] = &unk_10015D4E0;
  v11[4] = self;
  objc_msgSend(v4, "setExpirationHandler:", v11);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10007BBF8;
  v10[3] = &unk_10015ED48;
  v10[4] = self;
  -[_DASClosureManager collectPrewarmingDataWithCompletion:](self, "collectPrewarmingDataWithCompletion:", v10);

}

- (void)collectLaunchDataWithBootBatchTimestamp:(double)a3 opportunisticBatchTimestamp:(double)a4 completion:(id)a5
{
  id v8;
  NSMutableDictionary *v9;
  id v10;
  id v11;
  NSMutableDictionary *v12;
  id v13;
  NSMutableDictionary *v14;
  void *v15;
  _DASCollectTelemetryActivityContext *collectTelemetryActivityContext;
  unsigned __int8 v17;
  id v18;
  unsigned __int8 v19;
  id v20;
  _QWORD v21[4];
  NSMutableDictionary *v22;
  id v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD v27[4];
  NSMutableDictionary *v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD *v31;
  double v32;
  double v33;
  _QWORD v34[3];
  char v35;
  _QWORD v36[3];
  char v37;
  _QWORD v38[3];
  char v39;

  v8 = a5;
  v9 = objc_opt_new(NSMutableDictionary);
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  v39 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v37 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  v35 = 0;
  v10 = objc_alloc_init((Class)SignpostSupportObjectExtractor);
  v11 = objc_alloc_init((Class)SignpostSupportSubsystemCategoryAllowlist);
  objc_msgSend(v11, "addSubsystem:category:", CFSTR("com.apple.app_launch_measurement"), CFSTR("ApplicationLaunch"));
  objc_msgSend(v10, "setSubsystemCategoryFilter:", v11);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10007C55C;
  v27[3] = &unk_10015ED70;
  v32 = a3;
  v33 = a4;
  v29 = v38;
  v30 = v36;
  v31 = v34;
  v12 = v9;
  v28 = v12;
  objc_msgSend(v10, "setEndEventProcessingBlock:", v27);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10007C7FC;
  v21[3] = &unk_10015ED98;
  v13 = v8;
  v23 = v13;
  v14 = v12;
  v22 = v14;
  v24 = v38;
  v25 = v36;
  v26 = v34;
  objc_msgSend(v10, "setProcessingCompletionBlock:", v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[_DASCollectTelemetryActivityContext launchDataCollectionStartDate](self->_collectTelemetryActivityContext, "launchDataCollectionStartDate"));
  collectTelemetryActivityContext = self->_collectTelemetryActivityContext;
  v20 = 0;
  v17 = -[_DASClosureManager extractSignposts:startDate:chunkedByInterval:context:error:](self, "extractSignposts:startDate:chunkedByInterval:context:error:", v10, v15, collectTelemetryActivityContext, &v20, 3600.0);
  v18 = v20;

  if (v18)
    v19 = 0;
  else
    v19 = v17;
  if ((v19 & 1) == 0 && os_log_type_enabled((os_log_t)qword_1001ABB28, OS_LOG_TYPE_ERROR))
    sub_1000E50D4();

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);
  _Block_object_dispose(v38, 8);

}

- (void)collectPrewarmingDataWithCompletion:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  _DASCollectTelemetryActivityContext *collectTelemetryActivityContext;
  unsigned __int8 v10;
  id v11;
  unsigned __int8 v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD v18[7];
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;

  v4 = a3;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = sub_10007CACC;
  v21[4] = sub_10007CADC;
  v22 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = sub_10007CACC;
  v19[4] = sub_10007CADC;
  v20 = 0;
  v5 = objc_alloc_init((Class)SignpostSupportObjectExtractor);
  v6 = objc_alloc_init((Class)SignpostSupportSubsystemCategoryAllowlist);
  objc_msgSend(v6, "addSubsystem:category:", CFSTR("com.apple.dasd.signpost"), CFSTR("DuetClosuresTelemetry"));
  objc_msgSend(v5, "setSubsystemCategoryFilter:", v6);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10007CAE4;
  v18[3] = &unk_10015EDC0;
  v18[5] = v21;
  v18[6] = v19;
  v18[4] = self;
  objc_msgSend(v5, "setEmitEventProcessingBlock:", v18);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10007CCDC;
  v14[3] = &unk_10015EDE8;
  v7 = v4;
  v15 = v7;
  v16 = v21;
  v17 = v19;
  objc_msgSend(v5, "setProcessingCompletionBlock:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASCollectTelemetryActivityContext prewarmingDataCollectionStartDate](self->_collectTelemetryActivityContext, "prewarmingDataCollectionStartDate"));
  collectTelemetryActivityContext = self->_collectTelemetryActivityContext;
  v13 = 0;
  v10 = -[_DASClosureManager extractSignposts:startDate:chunkedByInterval:context:error:](self, "extractSignposts:startDate:chunkedByInterval:context:error:", v5, v8, collectTelemetryActivityContext, &v13, 3600.0);
  v11 = v13;

  if (v11)
    v12 = 0;
  else
    v12 = v10;
  if ((v12 & 1) == 0 && os_log_type_enabled((os_log_t)qword_1001ABB28, OS_LOG_TYPE_ERROR))
    sub_1000E50D4();

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);

}

- (BOOL)extractSignposts:(id)a3 startDate:(id)a4 chunkedByInterval:(double)a5 context:(id)a6 error:(id *)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  id v16;
  char v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  unsigned __int8 v21;
  id v22;
  double v23;
  id *v25;
  id v26;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dateByAddingTimeInterval:", 3600.0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  objc_msgSend(v11, "timeIntervalSinceDate:", v14);
  if (v15 >= -3600.0)
  {
    v16 = 0;
    v17 = 1;
    if (!a7)
      goto LABEL_14;
    goto LABEL_13;
  }
  v25 = a7;
  v18 = 0;
  while (1)
  {
    v19 = objc_msgSend(v12, "wasDeferred", v25);
    if ((v19 & 1) != 0)
    {
      v22 = v11;
      v16 = v18;
LABEL_10:
      v17 = v19 ^ 1;
      v11 = v22;
      goto LABEL_12;
    }
    v20 = objc_autoreleasePoolPush();
    v26 = v18;
    v21 = objc_msgSend(v10, "processLogArchiveWithPath:startDate:endDate:errorOut:", 0, v11, v13, &v26);
    v16 = v26;

    if ((v21 & 1) == 0)
      break;
    v22 = v13;

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "dateByAddingTimeInterval:", 3600.0));
    objc_autoreleasePoolPop(v20);
    objc_msgSend(v22, "timeIntervalSinceDate:", v14);
    v11 = v22;
    v18 = v16;
    if (v23 >= -3600.0)
      goto LABEL_10;
  }
  objc_autoreleasePoolPop(v20);
  v17 = 0;
LABEL_12:
  a7 = v25;
  if (v25)
LABEL_13:
    *a7 = objc_retainAutorelease(v16);
LABEL_14:

  return v17;
}

- (_DASCollectTelemetryActivityContext)collectTelemetryActivityContext
{
  return self->_collectTelemetryActivityContext;
}

- (void)setCollectTelemetryActivityContext:(id)a3
{
  objc_storeStrong((id *)&self->_collectTelemetryActivityContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectTelemetryActivityContext, 0);
}

@end
