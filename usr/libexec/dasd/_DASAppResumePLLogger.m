@implementation _DASAppResumePLLogger

- (_DASAppResumePLLogger)init
{
  _DASAppResumePLLogger *v2;
  uint64_t v3;
  OS_os_log *log;
  BOOL v5;
  NSUserDefaults *v6;
  NSUserDefaults *defaults;
  uint64_t v8;
  NSDate *lastReportedDate;
  NSObject *v10;
  NSDate *v11;
  uint64_t v12;
  _CDContextualKeyPath *inferredCarryStatusKeyPath;
  _DASAppResumePLLogger *v14;
  NSObject *v15;
  NSObject *v16;
  NSDate *v17;
  objc_super v19;
  uint8_t buf[4];
  NSDate *v21;

  v19.receiver = self;
  v19.super_class = (Class)_DASAppResumePLLogger;
  v2 = -[_DASAppResumePLLogger init](&v19, "init");
  if (!v2)
  {
LABEL_6:
    v14 = v2;
    goto LABEL_10;
  }
  v3 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("appResume")));
  log = v2->_log;
  v2->_log = (OS_os_log *)v3;

  v5 = dlopen_preflight((const char *)objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/PowerLog.framework/PowerLog"), "UTF8String"));
  v2->_powerLogExists = v5;
  if (v5)
  {
    v6 = (NSUserDefaults *)objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.duetactivityscheduler"));
    defaults = v2->_defaults;
    v2->_defaults = v6;

    -[NSUserDefaults doubleForKey:](v2->_defaults, "doubleForKey:", CFSTR("appResumePredictionsReportedDate"));
    v8 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
    lastReportedDate = v2->_lastReportedDate;
    v2->_lastReportedDate = (NSDate *)v8;

    v10 = v2->_log;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v2->_lastReportedDate;
      *(_DWORD *)buf = 138412290;
      v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Last reported date for App predictions to PowerLog is %@", buf, 0xCu);
    }
    v12 = objc_claimAutoreleasedReturnValue(+[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/das/inferredCarryStatus")));
    inferredCarryStatusKeyPath = v2->_inferredCarryStatusKeyPath;
    v2->_inferredCarryStatusKeyPath = (_CDContextualKeyPath *)v12;

    -[_DASAppResumePLLogger initializeCarryStatusLogging](v2, "initializeCarryStatusLogging");
    goto LABEL_6;
  }
  v15 = v2->_log;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    v17 = (NSDate *)objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/PowerLog.framework/PowerLog"), "UTF8String");
    *(_DWORD *)buf = 136315138;
    v21 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Powerlog library at %s does not exist", buf, 0xCu);

  }
  v14 = 0;
LABEL_10:

  return v14;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000243C4;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001AB428 != -1)
    dispatch_once(&qword_1001AB428, block);
  return (id)qword_1001AB420;
}

+ (id)topPredictionsFromScores:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "keysSortedByValueUsingComparator:", &stru_10015D5C0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if ((unint64_t)objc_msgSend(v3, "count") > 9)
  {
    v6 = 10;
  }
  else
  {
    v6 = objc_msgSend(v3, "count");
    if (v6 < 1)
      goto LABEL_7;
  }
  v7 = 0;
  v8 = v6;
  do
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", v7));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", v7));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, v11);

    ++v7;
  }
  while (v8 != v7);
LABEL_7:

  return v5;
}

- (void)logAppResumePredictions:(id)a3 durationCheck:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  double v7;
  NSObject *log;
  const char *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  NSDate *v15;
  NSDate *lastReportedDate;
  NSUserDefaults *defaults;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, void *);
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  void *v26;
  const __CFString *v27;
  id v28;

  v4 = a4;
  v6 = a3;
  if (self->_powerLogExists)
  {
    if (v4 && (-[NSDate timeIntervalSinceNow](self->_lastReportedDate, "timeIntervalSinceNow"), v7 > -1800.0))
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v9 = "Reported predictions to PowerLog in last 30 mins. Skipping";
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, v9, buf, 2u);
      }
    }
    else
    {
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_1000247E8;
      v23[3] = &unk_10015D480;
      v10 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v24 = v10;
      objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v23);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[_DASAppResumePLLogger appsFromProactiveSuggestions](self, "appsFromProactiveSuggestions"));
      v18 = _NSConcreteStackBlock;
      v19 = 3221225472;
      v20 = sub_100024934;
      v21 = &unk_10015D480;
      v12 = v10;
      v22 = v12;
      objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", &v18);
      v27 = CFSTR("appResumePredictions");
      v28 = v12;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1, v18, v19, v20, v21));
      v14 = self->_log;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Logging to PowerLog %@", buf, 0xCu);
      }
      PLLogRegisteredEvent(70, CFSTR("AppResumePredictions"), v13, 0);
      v15 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      lastReportedDate = self->_lastReportedDate;
      self->_lastReportedDate = v15;

      defaults = self->_defaults;
      -[NSDate timeIntervalSinceReferenceDate](self->_lastReportedDate, "timeIntervalSinceReferenceDate");
      -[NSUserDefaults setDouble:forKey:](defaults, "setDouble:forKey:", CFSTR("appResumePredictionsReportedDate"));

    }
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v9 = "PowerLog does not exist";
      goto LABEL_11;
    }
  }

}

+ (id)applicationBundleIDForExecutableName:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;

  v3 = a3;
  v4 = (void *)os_transaction_create("com.apple.dasd.appnamemap");
  v5 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.duetactivityscheduler"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("appNameTranslation")));

  if (v6
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v3)),
        v7,
        v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v3));
    v9 = v6;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationRecord enumeratorWithOptions:](LSApplicationRecord, "enumeratorWithOptions:", 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nextObject"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "compatibilityObject"));

    if (v12)
    {
      do
      {
        v13 = objc_autoreleasePoolPush();
        v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bundleIdentifier"));
        if (v14)
        {
          v15 = (void *)v14;
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bundleExecutable"));

          if (v16)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bundleIdentifier"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bundleExecutable"));
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, v18);

          }
        }
        objc_autoreleasePoolPop(v13);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nextObject"));
        v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "compatibilityObject"));

        v12 = (void *)v20;
      }
      while (v20);
    }
    v21 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.duetactivityscheduler"));
    objc_msgSend(v21, "setObject:forKey:", v9, CFSTR("appNameTranslation"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v3));
  }

  return v8;
}

- (void)logFreezerSkipReasons:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *log;
  NSObject *v8;
  int v9;
  void *v10;
  const __CFString *v11;
  id v12;

  v4 = a3;
  v5 = v4;
  if (self->_powerLogExists)
  {
    v11 = CFSTR("Applications");
    v12 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Logging Freezer skipped reasons to PowerLog %@", (uint8_t *)&v9, 0xCu);
    }
    PLLogRegisteredEvent(70, CFSTR("AppNotFrozenReason"), v6, 0);

  }
  else
  {
    v8 = self->_log;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PowerLog does not exist", (uint8_t *)&v9, 2u);
    }
  }

}

- (id)appsFromProactiveSuggestions
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *log;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[8];
  uint64_t v28;
  Class (*v29)(uint64_t);
  void *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE v36[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (dlopen_preflight((const char *)objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/AppPredictionClient.framework/AppPredictionClient"), "UTF8String")))
  {
    v32 = 0;
    v33 = &v32;
    v34 = 0x2050000000;
    v4 = (void *)qword_1001AB430;
    v35 = qword_1001AB430;
    if (!qword_1001AB430)
    {
      *(_QWORD *)buf = _NSConcreteStackBlock;
      v28 = 3221225472;
      v29 = sub_100025C24;
      v30 = &unk_10015D610;
      v31 = &v32;
      sub_100025C24((uint64_t)buf);
      v4 = (void *)v33[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v32, 8);
    v22 = objc_msgSend([v5 alloc], "initWithConsumerSubType:", 9);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "suggestionLayoutFromCache"));
    v21 = v6;
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allSuggestionsInLayout", v6));
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v36, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(_QWORD *)v24 != v9)
              objc_enumerationMutation(v7);
            v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "executableSpecification"));
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "executableObject"));

            if (v13)
            {
              v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "scoreSpecification"));
              objc_msgSend(v14, "rawScore");
              v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "description"));
              objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, v16);

            }
          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v36, 16);
        }
        while (v8);
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[_DASAppResumePLLogger topPredictionsFromScores:](_DASAppResumePLLogger, "topPredictionsFromScores:", v3));

    }
    else
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Proactive predictions not cached, returning nil", buf, 2u);
      }
      v17 = 0;
    }

  }
  else
  {
    v18 = self->_log;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1000DFEB8(v18);
    v17 = 0;
  }

  return v17;
}

- (void)initializeCarryStatusLogging
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  NSObject *v10;
  NSObject *log;
  id v12;
  _QWORD v13[5];
  uint8_t buf[4];
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100025240;
  v13[3] = &unk_10015D5E8;
  v13[4] = self;
  objc_msgSend(v3, "registerForTaskWithIdentifier:usingQueue:launchHandler:", CFSTR("com.apple.appResume.inferCarryStatus"), 0, v13);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "taskRequestForIdentifier:", CFSTR("com.apple.appResume.inferCarryStatus")));

  if (!v5)
  {
    v6 = objc_msgSend(objc_alloc((Class)BGRepeatingSystemTaskRequest), "initWithIdentifier:", CFSTR("com.apple.appResume.inferCarryStatus"));
    objc_msgSend(v6, "setPriority:", 1);
    objc_msgSend(v6, "setInterval:", 86400.0);
    objc_msgSend(v6, "setMinDurationBetweenInstances:", 85400.0);
    objc_msgSend(v6, "setRequiresProtectionClass:", 3);
    objc_msgSend(v6, "setRequiresExternalPower:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
    v12 = 0;
    v8 = objc_msgSend(v7, "submitTaskRequest:error:", v6, &v12);
    v9 = v12;

    if ((v8 & 1) == 0)
    {
      v10 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Failed to submit task with error: %@", buf, 0xCu);
      }

    }
  }
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    sub_1000DFEF4(log);
}

- (void)logUpdatedCarryStatus
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *log;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](_CDClientContext, "userContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", self->_inferredCarryStatusKeyPath));
  v5 = objc_msgSend(v4, "BOOLValue");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DKKnowledgeStore knowledgeStore](_DKKnowledgeStore, "knowledgeStore"));
  v7 = -[_DASAppResumePLLogger updateCarryStatusWithContext:withKnowledgeStore:](self, "updateCarryStatusWithContext:withKnowledgeStore:", v3, v6);

  if ((_DWORD)v5 == v7)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
      sub_1000DFFA4((uint64_t)v5, log, v13, v14, v15, v16, v17, v18);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v7));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, self->_inferredCarryStatusKeyPath);

    v9 = objc_alloc_init((Class)NSMutableDictionary);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v7));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("CarryType"));

    PLLogRegisteredEvent(70, CFSTR("AppResumeInferredCarry"), v9, 0);
    v11 = self->_log;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      sub_1000DFF30((uint64_t)v9, v11);

  }
}

- (BOOL)updateCarryStatusWithContext:(id)a3 withKnowledgeStore:(id)a4
{
  _BOOL8 v5;
  NSObject *log;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = -[_DASAppResumePLLogger deviceHasEnoughPluggedInTimeWithMinimumDays:withContext:withKnowledgeStore:](self, "deviceHasEnoughPluggedInTimeWithMinimumDays:withContext:withKnowledgeStore:", a3, a4, 14.0);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    sub_1000E0008(v5, log, v7, v8, v9, v10, v11, v12);
  return v5;
}

- (BOOL)deviceHasEnoughPluggedInTimeWithMinimumDays:(double)a3 withContext:(id)a4 withKnowledgeStore:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  NSObject *log;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[2];

  v7 = a5;
  v37 = (void *)os_transaction_create("com.apple.appresume.carrystatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v9 = objc_claimAutoreleasedReturnValue(+[_DKQuery predicateForEventsWithMinimumDuration:](_DKQuery, "predicateForEventsWithMinimumDuration:", 7200.0));
  v10 = 1;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[_DKQuery predicateForEventsWithIntegerValue:](_DKQuery, "predicateForEventsWithIntegerValue:", 1));
  v36 = (void *)v9;
  v46[0] = v9;
  v46[1] = v35;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 2));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams deviceIsPluggedInStream](_DKSystemEventStreams, "deviceIsPluggedInStream"));
  v45 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v45, 1));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0));
  v44 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v44, 1));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[_DKEventQuery eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:](_DKEventQuery, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v12, v14, 0, 0, v16));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "executeQuery:error:", v17, 0));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[_DASAppResumePLLogger concatenateContinuousEventsOfSameState:sortedAscending:](self, "concatenateContinuousEventsOfSameState:sortedAscending:", v18, 0));

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lastObject"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "startDate"));
    objc_msgSend(v8, "timeIntervalSinceDate:", v21);
    v23 = v22;

    if ((unint64_t)objc_msgSend(v19, "count") >= 8)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "firstObject"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "startDate"));
      objc_msgSend(v8, "timeIntervalSinceDate:", v25);
      if (v26 <= 604800.0)
      {

        if (v23 >= a3 * 86400.0)
        {
          v10 = 1;
          goto LABEL_9;
        }
      }
      else
      {

      }
    }
    log = self->_log;
    v10 = 0;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v28 = log;
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v19, "count")));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "firstObject"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "startDate"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lastObject"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "startDate"));
      *(_DWORD *)buf = 138412802;
      v39 = v29;
      v40 = 2112;
      v41 = v31;
      v42 = 2112;
      v43 = v33;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Not real carry device: %@ events, Last plugin: %@, First plugin: %@", buf, 0x20u);

      v10 = 0;
    }
  }
LABEL_9:

  return v10;
}

- (id)concatenateEventsPrivate:(id)a3
{
  id v3;
  id v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  unsigned int v32;
  void *v33;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") <= 1)
  {
    v4 = v3;
    goto LABEL_16;
  }
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = objc_msgSend(v3, "count");
  v6 = v5 - 1;
  if (v5 < 2)
  {
    if (v5 != 1)
      goto LABEL_16;
LABEL_18:
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 0));
    objc_msgSend(v4, "addObject:", v27);

    goto LABEL_16;
  }
  v29 = v4;
  do
  {
    v32 = v6;
    v7 = (v6 - 1);
    v8 = v7 + 1;
    v30 = v6 - 1;
    while (1)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", v8));
      v10 = objc_msgSend(v9, "integerValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", v7));
      if (v10 != objc_msgSend(v11, "integerValue"))
        break;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", v8));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "endDate"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", v7));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "startDate"));
      v16 = objc_msgSend(v13, "isEqualToDate:", v15);

      if (!v16)
        goto LABEL_11;
      --v7;
      if ((int)--v8 <= 0)
      {
        LODWORD(v7) = -1;
        goto LABEL_11;
      }
    }

LABEL_11:
    if ((int)v7 >= v30)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", v32));
      LODWORD(v7) = v30;
    }
    else
    {
      v17 = v32;
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", v32));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "stream"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", v17));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "startDate"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", (int)v7 + 1));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "endDate"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", v17));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "value"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", v17));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "metadata"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[_DKEvent eventWithStream:startDate:endDate:value:metadata:](_DKEvent, "eventWithStream:startDate:endDate:value:metadata:", v28, v18, v20, v22, v24));

    }
    v4 = v29;
    objc_msgSend(v29, "addObject:", v25);

    v6 = v7;
  }
  while ((int)v7 > 0);
  if (!(_DWORD)v7)
    goto LABEL_18;
LABEL_16:

  return v4;
}

- (id)concatenateContinuousEventsOfSameState:(id)a3 sortedAscending:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "reverseObjectEnumerator"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allObjects"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASAppResumePLLogger concatenateEventsPrivate:](self, "concatenateEventsPrivate:", v6));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASAppResumePLLogger concatenateEventsPrivate:](self, "concatenateEventsPrivate:", a3));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "reverseObjectEnumerator"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allObjects"));

  }
  return v7;
}

- (BOOL)powerLogExists
{
  return self->_powerLogExists;
}

- (void)setPowerLogExists:(BOOL)a3
{
  self->_powerLogExists = a3;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (NSDate)lastReportedDate
{
  return self->_lastReportedDate;
}

- (void)setLastReportedDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastReportedDate, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (_CDContextualKeyPath)inferredCarryStatusKeyPath
{
  return self->_inferredCarryStatusKeyPath;
}

- (void)setInferredCarryStatusKeyPath:(id)a3
{
  objc_storeStrong((id *)&self->_inferredCarryStatusKeyPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inferredCarryStatusKeyPath, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_lastReportedDate, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
}

@end
