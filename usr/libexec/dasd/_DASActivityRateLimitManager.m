@implementation _DASActivityRateLimitManager

- (_DASActivityRateLimitManager)init
{
  _DASActivityRateLimitManager *v2;
  _DASActivityRateLimitManager *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  _CDContext *context;
  os_log_t v13;
  OS_os_log *log;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  dispatch_queue_global_t global_queue;
  NSObject *v28;
  dispatch_source_t v29;
  OS_dispatch_source *cleanupTimer;
  NSObject *v31;
  NSObject *v32;
  dispatch_time_t v33;
  _QWORD handler[4];
  _DASActivityRateLimitManager *v36;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)_DASActivityRateLimitManager;
  v2 = -[_DASActivityRateLimitManager init](&v37, "init");
  v3 = v2;
  if (v2)
  {
    v2->_submittedConfigurationLock._os_unfair_lock_opaque = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[_DASActivityRateLimitManager setRateLimitConfigurations:](v3, "setRateLimitConfigurations:", v4);

    v5 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.duetactivityscheduler"));
    objc_storeStrong((id *)&v3->_defaults, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DASRateLimiterUtilities getCurrentBootSessionUUID](_DASRateLimiterUtilities, "getCurrentBootSessionUUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringForKey:", CFSTR("previousBootUUID")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager loadSubmittedRateLimitConfiguration](v3, "loadSubmittedRateLimitConfiguration"));
    v9 = v8;
    if (v8 && objc_msgSend(v8, "count"))
      v10 = objc_msgSend(v6, "isEqualToString:", v7);
    else
      v10 = 0;
    v11 = objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](_CDClientContext, "userContext"));
    context = v3->_context;
    v3->_context = (_CDContext *)v11;

    v13 = os_log_create("com.apple.duetactivityscheduler", "processRateLimiter");
    log = v3->_log;
    v3->_log = (OS_os_log *)v13;

    os_unfair_lock_lock(&v3->_submittedConfigurationLock);
    if (v10)
      v15 = objc_msgSend(v9, "mutableCopy");
    else
      v15 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v16 = v15;
    -[_DASActivityRateLimitManager setSubmittedConfigurations:](v3, "setSubmittedConfigurations:", v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager submittedConfigurations](v3, "submittedConfigurations"));
    v18 = _DASCKRateLimitConfigurationName;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", _DASCKRateLimitConfigurationName));

    if (!v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[_DASRateLimiterUtilities ckRateLimitConfiguration](_DASRateLimiterUtilities, "ckRateLimitConfiguration"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager submittedConfigurations](v3, "submittedConfigurations"));
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, v18);

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager submittedConfigurations](v3, "submittedConfigurations"));
    v23 = _DASPECRateLimitConfigurationName;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", _DASPECRateLimitConfigurationName));

    if (!v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[_DASRateLimiterUtilities pecRateLimitConfiguration](_DASRateLimiterUtilities, "pecRateLimitConfiguration"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager submittedConfigurations](v3, "submittedConfigurations"));
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v25, v23);

    }
    os_unfair_lock_unlock(&v3->_submittedConfigurationLock);
    -[_DASActivityRateLimitManager saveSubmittedRateLimitConfiguration](v3, "saveSubmittedRateLimitConfiguration");
    global_queue = dispatch_get_global_queue(-32768, 0);
    v28 = objc_claimAutoreleasedReturnValue(global_queue);
    v29 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v28);
    cleanupTimer = v3->_cleanupTimer;
    v3->_cleanupTimer = (OS_dispatch_source *)v29;

    v31 = v3->_cleanupTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10001EDCC;
    handler[3] = &unk_10015D4E0;
    v36 = v3;
    dispatch_source_set_event_handler(v31, handler);
    v32 = v3->_cleanupTimer;
    v33 = dispatch_walltime(0, 14400000000000);
    dispatch_source_set_timer(v32, v33, 0xD18C2E28000uLL, 0xDF8475800uLL);
    dispatch_activate((dispatch_object_t)v3->_cleanupTimer);
    -[NSUserDefaults setObject:forKey:](v3->_defaults, "setObject:forKey:", v6, CFSTR("previousBootUUID"));

  }
  return v3;
}

+ (id)sharedLimiter
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001EE48;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001AB3F8 != -1)
    dispatch_once(&qword_1001AB3F8, block);
  return (id)qword_1001AB400;
}

- (void)cleanupTimerHandler
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];

  obj = (id)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager rateLimitConfigurations](self, "rateLimitConfigurations"));
  objc_sync_enter(obj);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager rateLimitConfigurations](self, "rateLimitConfigurations"));
  v5 = objc_msgSend(v4, "copy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v11));
        if (objc_msgSend(v12, "isInactiveAtDate:", v3))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager rateLimitConfigurations](self, "rateLimitConfigurations"));
          objc_msgSend(v13, "removeObjectForKey:", v11);

          objc_msgSend(v6, "addObject:", v11);
        }

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v8);
  }

  v14 = objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager log](self, "log"));
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager rateLimitConfigurations](self, "rateLimitConfigurations"));
    *(_DWORD *)buf = 138412546;
    v22 = v6;
    v23 = 2112;
    v24 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Removed rate limits %@. Now: %@", buf, 0x16u);

  }
  objc_sync_exit(obj);

}

- (BOOL)limitsApplyToActivity:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  if (-[_DASActivityRateLimitManager rateManagementApplyToActivity:](self, "rateManagementApplyToActivity:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "widgetID"));

    v6 = v5 == 0;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)rateManagementApplyToActivity:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  BOOL v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  void *v21;
  unsigned __int8 v22;
  void *v23;
  unsigned __int8 v24;

  v3 = a3;
  v4 = objc_msgSend(v3, "schedulingPriority");
  if ((unint64_t)v4 > _DASSchedulingPriorityDefault)
    goto LABEL_4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));

  if (!v5)
    goto LABEL_4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPlistParser sharedInstance](_DASPlistParser, "sharedInstance"));
  v7 = objc_msgSend(v6, "containsOverrideForActivity:withLimitation:", v3, kDASProcessRateLimitationName);

  if ((v7 & 1) != 0)
    goto LABEL_4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "groupName"));
  if ((objc_msgSend(v10, "containsString:", CFSTR("com.apple.ckdiscretionaryd")) & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "relatedApplications"));
    if ((objc_msgSend(v11, "containsObject:", CFSTR("com.apple.mediaanalysisd-service")) & 1) != 0)
    {
      v8 = 0;
      goto LABEL_9;
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "relatedApplications"));
    v24 = objc_msgSend(v23, "containsObject:", CFSTR("com.apple.mediaanalysisd"));

    if ((v24 & 1) != 0)
      goto LABEL_4;
  }
  else
  {

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "groupName"));
  if ((objc_msgSend(v12, "containsString:", CFSTR("com.apple.ckdiscretionaryd")) & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "relatedApplications"));
    v14 = objc_msgSend(v13, "containsObject:", CFSTR("com.apple.mobileslideshow"));

    if ((v14 & 1) != 0)
      goto LABEL_4;
  }
  else
  {

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", _DASNonRateLimitedLaunchKey));
  v17 = objc_msgSend(v16, "BOOLValue");

  if ((v17 & 1) == 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", _DASOverrideRateLimitingKey));
    v20 = objc_msgSend(v19, "BOOLValue");

    if ((v20 & 1) == 0)
    {
      if (!objc_msgSend(v3, "requestsApplicationLaunch")
        || (v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "launchReason")),
            v22 = objc_msgSend(v21, "isEqualToString:", _DASLaunchReasonBackgroundRemoteNotification),
            v21,
            (v22 & 1) == 0))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rateLimitConfigurationName"));
        if (!v10)
        {
          v8 = 1;
          goto LABEL_10;
        }
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rateLimitConfigurationName"));
        v8 = 1;
LABEL_9:

LABEL_10:
        goto LABEL_5;
      }
    }
  }
LABEL_4:
  v8 = 0;
LABEL_5:

  return v8;
}

- (void)submitActivity:(id)a3
{
  id v4;

  v4 = a3;
  if (-[_DASActivityRateLimitManager rateManagementApplyToActivity:](self, "rateManagementApplyToActivity:"))
    -[_DASActivityRateLimitManager isActivityRateLimited:atSubmission:](self, "isActivityRateLimited:atSubmission:", v4, 1);

}

- (BOOL)executeActivity:(id)a3
{
  id v4;
  unsigned int v5;

  v4 = a3;
  if (-[_DASActivityRateLimitManager rateManagementApplyToActivity:](self, "rateManagementApplyToActivity:", v4))
    v5 = !-[_DASActivityRateLimitManager isActivityRateLimited:atSubmission:](self, "isActivityRateLimited:atSubmission:", v4, 0);
  else
    LOBYTE(v5) = 1;

  return v5;
}

- (BOOL)isActivityRateLimited:(id)a3 atSubmission:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v18;
  uint64_t v19;

  v4 = a4;
  v6 = a3;
  if (-[_DASActivityRateLimitManager rateManagementApplyToActivity:](self, "rateManagementApplyToActivity:", v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    if (v4)
      v8 = objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager evaluateActivityAtSubmission:](self, "evaluateActivityAtSubmission:", v6));
    else
      v8 = objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager evaluationResultsAtExecution:](self, "evaluationResultsAtExecution:", v6));
    v10 = (void *)v8;
    v11 = objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager shouldLimitActivity:withEvaluationResults:atDate:](self, "shouldLimitActivity:withEvaluationResults:atDate:", v6, v8, v7));
    v12 = (void *)v11;
    if (v11)
    {
      v19 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
      v14 = +[_DASLimiterResponse queryActivityDecision:fromResponses:](_DASLimiterResponse, "queryActivityDecision:fromResponses:", 5, v13);

      if (v14)
      {
        v18 = v12;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
        -[_DASActivityRateLimitManager limitedActivity:withLimitsResponses:](self, "limitedActivity:withLimitsResponses:", v6, v15);

      }
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "maxedRateLimits"));
    v9 = objc_msgSend(v16, "count") != 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)completeActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *log;
  int v10;
  id v11;

  v4 = a3;
  if (-[_DASActivityRateLimitManager rateManagementApplyToActivity:](self, "rateManagementApplyToActivity:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DASRateLimiterUtilities rateLimitIdentifierForActivity:](_DASRateLimiterUtilities, "rateLimitIdentifierForActivity:", v4));
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager rateLimitConfigurations](self, "rateLimitConfigurations"));
      objc_sync_enter(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager rateLimitConfigurations](self, "rateLimitConfigurations"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v5));

      if (v8)
      {
        objc_msgSend(v8, "removePendingActivity:", v4);
      }
      else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      {
        sub_1000DFC24();
      }

      objc_sync_exit(v6);
    }
    else
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138412290;
        v11 = v4;
        _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "No group name for %@", (uint8_t *)&v10, 0xCu);
      }
    }

  }
}

- (void)recalculateStartDates
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *j;
  uint64_t v11;
  void *v12;
  OS_os_log *v13;
  void *v14;
  id obj;
  id v16;
  uint64_t v17;
  unsigned int v18;
  id v19;
  void *i;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  _BYTE v34[128];

  v18 = +[_DASRateLimiterUtilities consideredInLPMWithState:](_DASRateLimiterUtilities, "consideredInLPMWithState:", self->_context);
  obj = (id)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager rateLimitConfigurations](self, "rateLimitConfigurations"));
  objc_sync_enter(obj);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager rateLimitConfigurations](self, "rateLimitConfigurations"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allValues"));

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v16 = v4;
  v19 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v19)
  {
    v17 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v16);
        v5 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "evaluationResultsWithLPMState:", v18, obj));
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pendingActivities"));
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
        if (v8)
        {
          v9 = *(_QWORD *)v22;
          do
          {
            for (j = 0; j != v8; j = (char *)j + 1)
            {
              if (*(_QWORD *)v22 != v9)
                objc_enumerationMutation(v7);
              v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)j);
              v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextEvaluationDate"));
              +[_DASRateLimiterUtilities adjustStartAfterDate:forActivity:](_DASRateLimiterUtilities, "adjustStartAfterDate:forActivity:", v12, v11);

              v13 = self->_log;
              if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_INFO))
              {
                v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextEvaluationDate"));
                *(_DWORD *)buf = 138412546;
                v30 = v11;
                v31 = 2112;
                v32 = v14;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)v13, OS_LOG_TYPE_INFO, "Adjust activity %@ startAfter date to be %@", buf, 0x16u);

              }
            }
            v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
          }
          while (v8);
        }

      }
      v19 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v19);
  }

  objc_sync_exit(obj);
}

- (void)replaceExistingRateLimitsForConfiguration:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  __int128 v9;
  id v10;
  uint64_t v11;
  int *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  NSObject *log;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  _DASActivityRateLimitManager *v31;
  int *v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  id obj;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  id v56;
  __int16 v57;
  void *v58;
  _BYTE v59[128];
  _BYTE v60[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager rateLimitConfigurations](self, "rateLimitConfigurations"));
  v6 = objc_msgSend(v5, "copy");

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v50;
    *(_QWORD *)&v9 = 138412546;
    v36 = v9;
    v12 = &OBJC_IVAR____DASWatchBackgroundBudgetPolicy__triggers;
    v38 = v7;
    v39 = v4;
    v37 = *(_QWORD *)v50;
    do
    {
      v13 = 0;
      v40 = v10;
      do
      {
        if (*(_QWORD *)v50 != v11)
          objc_enumerationMutation(v7);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)v13), v36));
        v15 = v14;
        if (v14)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "configurationName"));
          v43 = v15;
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
          v18 = objc_msgSend(v16, "isEqualToString:", v17);

          v15 = v43;
          if (v18)
          {
            log = self->_log;
            if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v36;
              v54 = v43;
              v55 = 2112;
              v56 = v4;
              _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Replacing configuration %@ with %@", buf, 0x16u);
            }
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rateLimits"));

            v42 = v13;
            if (v20)
            {
              objc_msgSend(v43, "replaceRateLimitConfiguration:", v4);
              v21 = objc_msgSend(v12 + 520, "consideredInLPMWithState:", self->_context);
              if ((_DWORD)v21)
              {
                v22 = self->_log;
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Rate Limits are subjected to LPM Windows", buf, 2u);
                }
              }
              v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "evaluationResultsWithLPMState:", v21));
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "nextEvaluationDate"));
              v45 = 0u;
              v46 = 0u;
              v47 = 0u;
              v48 = 0u;
              obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "pendingActivities"));
              v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
              if (v24)
              {
                v25 = v24;
                v26 = *(_QWORD *)v46;
                do
                {
                  for (i = 0; i != v25; i = (char *)i + 1)
                  {
                    if (*(_QWORD *)v46 != v26)
                      objc_enumerationMutation(obj);
                    v28 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
                    v29 = self->_log;
                    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                    {
                      v30 = v29;
                      v31 = self;
                      v32 = v12;
                      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "description"));
                      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "configurationName"));
                      *(_DWORD *)buf = 138412802;
                      v54 = v33;
                      v55 = 2112;
                      v56 = v23;
                      v57 = 2112;
                      v58 = v34;
                      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Modified rate limit! Adjusted activity %@ start date to %@ configuration %@", buf, 0x20u);

                      v12 = v32;
                      self = v31;

                    }
                    objc_msgSend(v12 + 520, "adjustStartAfterDate:forActivity:", v23, v28);
                  }
                  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
                }
                while (v25);
              }

              v7 = v38;
              v4 = v39;
              v11 = v37;
              v10 = v40;
              v35 = v41;
              v15 = v43;
            }
            else
            {
              v35 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager rateLimitConfigurations](self, "rateLimitConfigurations"));
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "configurationName"));
              objc_msgSend(v35, "removeObjectForKey:", v23);
            }

            v13 = v42;
          }
        }

        v13 = (char *)v13 + 1;
      }
      while (v13 != v10);
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
    }
    while (v10);
  }

}

- (void)saveSubmittedRateLimitConfiguration
{
  os_unfair_lock_s *p_submittedConfigurationLock;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;

  p_submittedConfigurationLock = &self->_submittedConfigurationLock;
  os_unfair_lock_lock(&self->_submittedConfigurationLock);
  v4 = objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager submittedConfigurations](self, "submittedConfigurations"));
  if (v4
    && (v5 = (void *)v4,
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager submittedConfigurations](self, "submittedConfigurations")),
        v7 = objc_msgSend(v6, "count"),
        v6,
        v5,
        v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager submittedConfigurations](self, "submittedConfigurations"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v8));

    v13 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, &v13));
    v11 = v13;
    if (v10)
    {
      -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", v10, CFSTR("rateLimitConfigurations"));
    }
    else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      sub_1000DFCA0();
    }
    os_unfair_lock_unlock(p_submittedConfigurationLock);

  }
  else
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager loadSubmittedRateLimitConfiguration](self, "loadSubmittedRateLimitConfiguration"));
    if (v12)
      -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", CFSTR("rateLimitConfigurations"), v12);
    os_unfair_lock_unlock(p_submittedConfigurationLock);

  }
}

- (id)loadSubmittedRateLimitConfiguration
{
  os_unfair_lock_s *p_submittedConfigurationLock;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v10;
  _QWORD v11[3];

  p_submittedConfigurationLock = &self->_submittedConfigurationLock;
  os_unfair_lock_lock(&self->_submittedConfigurationLock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("rateLimitConfigurations")));
  if (v4)
  {
    v11[0] = objc_opt_class(NSDictionary);
    v11[1] = objc_opt_class(NSString);
    v11[2] = objc_opt_class(_DASActivityRateLimitConfiguration);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 3));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v5));

    v10 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v6, v4, &v10));
    v8 = v10;
    if (!v7 && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      sub_1000DFD00();
    os_unfair_lock_unlock(p_submittedConfigurationLock);

  }
  else
  {
    os_unfair_lock_unlock(p_submittedConfigurationLock);
    v7 = 0;
  }

  return v7;
}

- (void)submitRateLimitConfiguration:(id)a3
{
  id v4;
  void *v5;
  os_unfair_lock_s *p_submittedConfigurationLock;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *log;
  void *v14;
  void *v15;
  OS_os_log *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  __int16 v21;
  void *v22;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager rateLimitConfigurations](self, "rateLimitConfigurations"));
  objc_sync_enter(v5);
  p_submittedConfigurationLock = &self->_submittedConfigurationLock;
  os_unfair_lock_lock(&self->_submittedConfigurationLock);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager submittedConfigurations](self, "submittedConfigurations"));

  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[_DASActivityRateLimitManager setSubmittedConfigurations:](self, "setSubmittedConfigurations:", v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager submittedConfigurations](self, "submittedConfigurations"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v10));

  if (v11 && (v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rateLimits")), v12, !v12))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager submittedConfigurations](self, "submittedConfigurations"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    objc_msgSend(v14, "removeObjectForKey:", v15);
  }
  else
  {
    if (objc_msgSend(v11, "isEqual:", v4))
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 138412290;
        v20 = v4;
        _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Submitted rate limit %@ already exists", (uint8_t *)&v19, 0xCu);
      }
      goto LABEL_13;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager submittedConfigurations](self, "submittedConfigurations"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v4, v15);
  }

  os_unfair_lock_unlock(&self->_submittedConfigurationLock);
  -[_DASActivityRateLimitManager saveSubmittedRateLimitConfiguration](self, "saveSubmittedRateLimitConfiguration");
  -[_DASActivityRateLimitManager replaceExistingRateLimitsForConfiguration:](self, "replaceExistingRateLimitsForConfiguration:", v4);
  os_unfair_lock_lock(&self->_submittedConfigurationLock);
  v16 = self->_log;
  if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager submittedConfigurations](self, "submittedConfigurations"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "allKeys"));
    v19 = 138412546;
    v20 = v4;
    v21 = 2112;
    v22 = v18;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v16, OS_LOG_TYPE_DEFAULT, "Submitted rate limit %@. Submitted rate limits %@", (uint8_t *)&v19, 0x16u);

  }
LABEL_13:
  os_unfair_lock_unlock(p_submittedConfigurationLock);

  objc_sync_exit(v5);
}

- (void)logSubmittedActivity:(id)a3 asRateLimited:(BOOL)a4
{
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  BOOL v9;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "widgetID"));

  if (!v6)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000204B8;
    v7[3] = &unk_10015D508;
    v9 = a4;
    v8 = v5;
    AnalyticsSendEventLazy(CFSTR("com.apple.dasd.rateLimitedAtSubmit"), v7);

  }
}

- (void)initializeRateLimitWithActivity:(id)a3 withIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  os_unfair_lock_s *p_submittedConfigurationLock;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  NSObject *log;
  void *v17;
  void *v18;
  int v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rateLimitConfigurationName"));
  p_submittedConfigurationLock = &self->_submittedConfigurationLock;
  os_unfair_lock_lock(&self->_submittedConfigurationLock);
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager submittedConfigurations](self, "submittedConfigurations"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v8));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager submittedConfigurations](self, "submittedConfigurations"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v8));

LABEL_9:
      os_unfair_lock_unlock(&self->_submittedConfigurationLock);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivityRateLimitConfiguration_Internal rateLimitConfiguration:withIdentifier:](_DASActivityRateLimitConfiguration_Internal, "rateLimitConfiguration:withIdentifier:", v13, v7));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager rateLimitConfigurations](self, "rateLimitConfigurations"));
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v7);

      goto LABEL_10;
    }
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "limitationResponse"));
  v15 = +[_DASLimiterResponse queryActivityDecision:fromResponses:](_DASLimiterResponse, "queryActivityDecision:fromResponses:", 2, v14);

  if (!v15)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[_DASRateLimiterUtilities defaultRateLimiterConfiguration](_DASRateLimiterUtilities, "defaultRateLimiterConfiguration"));
    goto LABEL_9;
  }
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138412290;
    v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Not rate limiting activity %@, already rate limited at submission", (uint8_t *)&v19, 0xCu);
  }
  os_unfair_lock_unlock(p_submittedConfigurationLock);
LABEL_10:

}

- (id)evaluateActivityAtSubmission:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;

  v4 = a3;
  if (-[_DASActivityRateLimitManager rateManagementApplyToActivity:](self, "rateManagementApplyToActivity:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DASRateLimiterUtilities rateLimitIdentifierForActivity:](_DASRateLimiterUtilities, "rateLimitIdentifierForActivity:", v4));
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager rateLimitConfigurations](self, "rateLimitConfigurations"));
      objc_sync_enter(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager rateLimitConfigurations](self, "rateLimitConfigurations"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v5));

      if (v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager unprotectedEvaluateRateLimitedActivity:forIdentifier:](self, "unprotectedEvaluateRateLimitedActivity:forIdentifier:", v4, v5));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "maxedRateLimits"));
        v11 = objc_msgSend(v10, "count") != 0;

        -[_DASActivityRateLimitManager logSubmittedActivity:asRateLimited:](self, "logSubmittedActivity:asRateLimited:", v4, v11);
      }
      else
      {
        -[_DASActivityRateLimitManager initializeRateLimitWithActivity:withIdentifier:](self, "initializeRateLimitWithActivity:withIdentifier:", v4, v5);
        -[_DASActivityRateLimitManager logSubmittedActivity:asRateLimited:](self, "logSubmittedActivity:asRateLimited:", v4, 0);
        v9 = 0;
      }
      objc_sync_exit(v6);

    }
    else
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
        sub_1000DFD60();
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)evaluationResultsAtExecution:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  if (-[_DASActivityRateLimitManager rateManagementApplyToActivity:](self, "rateManagementApplyToActivity:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DASRateLimiterUtilities rateLimitIdentifierForActivity:](_DASRateLimiterUtilities, "rateLimitIdentifierForActivity:", v4));
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager rateLimitConfigurations](self, "rateLimitConfigurations"));
      objc_sync_enter(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager unprotectedEvaluateRateLimitedActivity:forIdentifier:](self, "unprotectedEvaluateRateLimitedActivity:forIdentifier:", v4, v5));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "maxedRateLimits"));
      v9 = objc_msgSend(v8, "count");

      if (v9)
      {
        v10 = v7;
      }
      else
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager rateLimitConfigurations](self, "rateLimitConfigurations"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v5));

        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
        objc_msgSend(v12, "executeActivity:atDate:", v4, v13);

        v10 = 0;
      }

      objc_sync_exit(v6);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
        sub_1000DFD60();
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)evaluateRateLimitedActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (-[_DASActivityRateLimitManager rateManagementApplyToActivity:](self, "rateManagementApplyToActivity:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DASRateLimiterUtilities rateLimitIdentifierForActivity:](_DASRateLimiterUtilities, "rateLimitIdentifierForActivity:", v4));
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager rateLimitConfigurations](self, "rateLimitConfigurations"));
      objc_sync_enter(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager unprotectedEvaluateRateLimitedActivity:forIdentifier:](self, "unprotectedEvaluateRateLimitedActivity:forIdentifier:", v4, v5));
      objc_sync_exit(v6);

    }
    else
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
        sub_1000DFD60();
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)unprotectedEvaluateRateLimitedActivity:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  NSObject *log;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v24;
  int v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;

  v6 = a3;
  v7 = a4;
  if (-[_DASActivityRateLimitManager rateManagementApplyToActivity:](self, "rateManagementApplyToActivity:", v6))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager rateLimitConfigurations](self, "rateLimitConfigurations"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v7));

    if (!v9)
      -[_DASActivityRateLimitManager initializeRateLimitWithActivity:withIdentifier:](self, "initializeRateLimitWithActivity:withIdentifier:", v6, v7);
    v10 = +[_DASRateLimiterUtilities consideredInLPMWithState:](_DASRateLimiterUtilities, "consideredInLPMWithState:", self->_context);
    if (v10)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25) = 0;
        _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Rate Limits are subjected to LPM Windows", (uint8_t *)&v25, 2u);
      }
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "evaluationResultsWithLPMState:", v10));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "maxedRateLimits"));
    v14 = objc_msgSend(v13, "count");

    if (v14)
    {
      objc_msgSend(v9, "addPendingActivity:", v6);
      v15 = self->_log;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = v15;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startAfter"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "nextEvaluationDate"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "maxedRateLimits"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v10));
        v25 = 138413570;
        v26 = v17;
        v27 = 2112;
        v28 = v18;
        v29 = 2114;
        v30 = v6;
        v31 = 2114;
        v32 = v7;
        v33 = 2112;
        v34 = v19;
        v35 = 2112;
        v36 = v20;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Adjusting original start date %@ to start date %@ for activity '%{public}@' with identifier %{public}@ and rate limit %@ while device LPM state is %@", (uint8_t *)&v25, 0x3Eu);

      }
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "nextEvaluationDate"));
      +[_DASRateLimiterUtilities adjustStartAfterDate:forActivity:](_DASRateLimiterUtilities, "adjustStartAfterDate:forActivity:", v21, v6);
    }
    else
    {
      v22 = self->_log;
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        goto LABEL_14;
      v21 = v22;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v10));
      v25 = 138543874;
      v26 = v6;
      v27 = 2112;
      v28 = v7;
      v29 = 2112;
      v30 = v24;
      _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "'%{public}@' is timewise eligible for rate limit configuration %@ while device LPM state is %@", (uint8_t *)&v25, 0x20u);

    }
LABEL_14:

    goto LABEL_15;
  }
  v12 = 0;
LABEL_15:

  return v12;
}

- (id)shouldLimitActivity:(id)a3 withEvaluationResults:(id)a4 atDate:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v8 = a4;
  v9 = a5;
  if (-[_DASActivityRateLimitManager limitsApplyToActivity:](self, "limitsApplyToActivity:", a3)
    && (v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "maxedRateLimits")),
        v11 = objc_msgSend(v10, "count"),
        v10,
        v11))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nextEvaluationDate"));
    objc_msgSend(v12, "timeIntervalSinceDate:", v9);
    v14 = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "maxedRateLimits"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastObject"));

    v17 = kDASProcessRateLimitationName;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "description"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[_DASLimiterResponse limitResponseWithDecision:withLimiter:validityDuration:rationale:](_DASLimiterResponse, "limitResponseWithDecision:withLimiter:validityDuration:rationale:", 5, v17, v18, v14));

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)limitedActivity:(id)a3 withLimitsResponses:(id)a4
{
  id v6;
  id v7;
  BOOL v8;

  v6 = a3;
  v7 = a4;
  if (-[_DASActivityRateLimitManager limitsApplyToActivity:](self, "limitsApplyToActivity:", v6)
    && +[_DASLimiterResponse queryActivityDecision:fromResponses:](_DASLimiterResponse, "queryActivityDecision:fromResponses:", 5, v7))
  {
    +[_DASLimiterResponse updateActivity:withLimitResponse:](_DASLimiterResponse, "updateActivity:withLimitResponse:", v6, v7);
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSMutableDictionary)rateLimitConfigurations
{
  return self->_rateLimitConfigurations;
}

- (void)setRateLimitConfigurations:(id)a3
{
  objc_storeStrong((id *)&self->_rateLimitConfigurations, a3);
}

- (NSMutableDictionary)submittedConfigurations
{
  return self->_submittedConfigurations;
}

- (void)setSubmittedConfigurations:(id)a3
{
  objc_storeStrong((id *)&self->_submittedConfigurations, a3);
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (_CDContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (os_unfair_lock_s)submittedConfigurationLock
{
  return self->_submittedConfigurationLock;
}

- (void)setSubmittedConfigurationLock:(os_unfair_lock_s)a3
{
  self->_submittedConfigurationLock = a3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (NSString)limitationName
{
  return self->_limitationName;
}

- (void)setLimitationName:(id)a3
{
  objc_storeStrong((id *)&self->_limitationName, a3);
}

- (OS_dispatch_source)cleanupTimer
{
  return self->_cleanupTimer;
}

- (void)setCleanupTimer:(id)a3
{
  objc_storeStrong((id *)&self->_cleanupTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cleanupTimer, 0);
  objc_storeStrong((id *)&self->_limitationName, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_submittedConfigurations, 0);
  objc_storeStrong((id *)&self->_rateLimitConfigurations, 0);
}

@end
