@implementation _DASApplicationPolicy

- (BOOL)appliesToActivity:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "launchReason"));
  if ((objc_msgSend(v4, "isEqualToString:", _DASLaunchReasonBackgroundProcessing) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "launchReason"));
    if ((objc_msgSend(v6, "isEqualToString:", _DASLaunchReasonHealthResearch) & 1) != 0)
    {
      v5 = 0;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "launchReason"));
      if ((objc_msgSend(v7, "isEqualToString:", _DASLaunchReasonHealthKit) & 1) != 0)
      {
        v5 = 0;
      }
      else
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "widgetID"));
        if (v8)
        {
          v5 = 0;
        }
        else if ((objc_msgSend(v3, "supportsAnyApplication") & 1) != 0
               || (objc_msgSend(v3, "requestsApplicationLaunch") & 1) != 0)
        {
          v5 = 1;
        }
        else
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "relatedApplications"));
          v5 = objc_msgSend(v9, "count") != 0;

        }
      }

    }
  }

  return v5;
}

+ (id)focalApplicationsWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForAppUsageDataDictionaries](_CDContextQueries, "keyPathForAppUsageDataDictionaries"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v5));

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries appUsageBundleID](_CDContextQueries, "appUsageBundleID", (_QWORD)v17));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v13));

        if (v14)
          objc_msgSend(v4, "addObject:", v14);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  v15 = objc_msgSend(v4, "copy");
  return v15;
}

- (double)weightForActivity:(id)a3
{
  id v3;
  double v4;
  id v5;

  v3 = a3;
  if ((objc_msgSend(v3, "requestsApplicationLaunch") & 1) != 0)
  {
    v4 = 50.0;
  }
  else
  {
    v5 = objc_msgSend(v3, "schedulingPriority");
    if ((unint64_t)v5 >= _DASSchedulingPriorityUtility)
      v4 = 25.0;
    else
      v4 = 5.0;
  }

  return v4;
}

- (double)predictedScoreForActivity:(id)a3 atDate:(id)a4
{
  double result;

  -[_DASApplicationPolicy scoreForActivity:atDate:withRationale:](self, "scoreForActivity:atDate:withRationale:", a3, a4, 0);
  return result;
}

- (double)scoreForActivity:(id)a3 atDate:(id)a4 withRationale:(id)a5
{
  void *v8;
  _DASApplicationPolicy *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *i;
  unint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  double v21;
  void *j;
  uint64_t v23;
  NSMutableDictionary *v24;
  id v25;
  NSObject *v26;
  int v27;
  double v28;
  void *v29;
  NSObject *v30;
  _DASPredictor *predictor;
  id v32;
  NSObject *v33;
  dispatch_time_t v34;
  NSObject *v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  unsigned __int8 v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  double v49;
  double v50;
  NSMutableSet *v51;
  void *v52;
  void *v53;
  id v54;
  unsigned int v55;
  double v56;
  double v57;
  double v58;
  id v60;
  void *v61;
  _DASApplicationPolicy *v62;
  void *v63;
  id v64;
  dispatch_semaphore_t v65;
  id obj;
  id v67;
  _QWORD v68[4];
  id v69;
  _DASApplicationPolicy *v70;
  uint64_t v71;
  id v72;
  id v73;
  NSObject *v74;
  __int128 *v75;
  uint64_t *v76;
  __int128 *p_buf;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  char v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  uint8_t v90[4];
  uint64_t v91;
  __int128 v92;
  uint64_t v93;
  void *v94;
  int v95;
  __int128 buf;
  uint64_t v97;
  uint64_t (*v98)(uint64_t, uint64_t);
  void (*v99)(uint64_t);
  id v100;
  _BYTE v101[128];
  _BYTE v102[128];

  v67 = a3;
  v60 = a4;
  v64 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v9 = self;
  objc_sync_enter(v9);
  obj = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));

  if (!qword_1001AB618 || (objc_msgSend(obj, "timeIntervalSinceDate:"), v10 >= 300.0))
    dword_1001AB610 = arc4random_uniform(0x546u);
  objc_storeStrong((id *)&qword_1001AB618, obj);
  objc_sync_exit(v9);

  if (objc_msgSend(v67, "supportsAnyApplication"))
  {
    -[_DASApplicationPolicy scoreForAnyAppActivity:atDate:](v9, "scoreForAnyAppActivity:atDate:", v67, v60);
    v12 = v11;
    goto LABEL_82;
  }
  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "relatedApplications"));
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v86, v102, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v87;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v87 != v15)
          objc_enumerationMutation(v13);
        if (-[_DASComplicationManager isActiveComplication:](v9->_complicationManager, "isActiveComplication:", *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * (_QWORD)i)))
        {

          v12 = 1.0;
          goto LABEL_82;
        }
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v86, v102, 16);
    }
    while (v14);
  }

  LODWORD(v17) = dword_1001AB610;
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "dateByAddingTimeInterval:", (double)v17 + 450.0));
  v63 = (void *)os_transaction_create("com.apple.dasd.apppolicy.score");
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "relatedApplications"));
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v82, v101, 16);
  if (!v19)
  {
    v21 = 1.0;
    goto LABEL_49;
  }
  v20 = *(_QWORD *)v83;
  v21 = 1.0;
  v62 = v9;
  do
  {
    for (j = 0; j != v19; j = (char *)j + 1)
    {
      if (*(_QWORD *)v83 != v20)
        objc_enumerationMutation(v18);
      v23 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * (_QWORD)j);
      v24 = v9->_timelines;
      objc_sync_enter(v24);
      if (!-[NSMutableSet containsObject:](v9->_daemons, "containsObject:", v23))
      {
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v97 = 0x3032000000;
        v98 = sub_100048548;
        v99 = sub_100048558;
        v100 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v9->_timelines, "objectForKeyedSubscript:", v23));
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v9->_lastApplicationTimelineUpdate, "objectForKeyedSubscript:", v23));
        if (+[_DASPredictionManager predictionNeedsUpdating:atDate:lastUpdatedAt:](_DASPredictionManager, "predictionNeedsUpdating:atDate:lastUpdatedAt:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), obj, v29))
        {
          if (-[_DASApplicationPolicy isDaemon:](v9, "isDaemon:", v23))
          {
            v30 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("predictions")));
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(v92) = 138412290;
              *(_QWORD *)((char *)&v92 + 4) = v23;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%@ is a daemon. Ignoring prediction", (uint8_t *)&v92, 0xCu);
            }

            -[NSMutableSet addObject:](v9->_daemons, "addObject:", v23);
            v28 = 0.0001;
            v21 = v21 * 0.9999;
            v27 = 5;
LABEL_41:

            _Block_object_dispose(&buf, 8);
            goto LABEL_42;
          }
          v65 = dispatch_semaphore_create(0);
          *(_QWORD *)&v92 = 0;
          *((_QWORD *)&v92 + 1) = &v92;
          v93 = 0x2810000000;
          v94 = &unk_10014130A;
          v95 = 0;
          v78 = 0;
          v79 = &v78;
          v80 = 0x2020000000;
          v81 = 0;
          predictor = v9->_predictor;
          v68[0] = _NSConcreteStackBlock;
          v68[1] = 3221225472;
          v68[2] = sub_100048694;
          v68[3] = &unk_10015E0E0;
          v32 = v63;
          v76 = &v78;
          p_buf = &buf;
          v69 = v32;
          v70 = v9;
          v75 = &v92;
          v71 = v23;
          v72 = obj;
          v73 = v67;
          v33 = v65;
          v74 = v33;
          -[_DASPredictor launchLikelihoodPredictionForApp:withHandler:](predictor, "launchLikelihoodPredictionForApp:withHandler:", v23, v68);
          v34 = dispatch_time(0, 5000000000);
          if (dispatch_semaphore_wait(v33, v34))
          {
            os_unfair_lock_lock((os_unfair_lock_t)(*((_QWORD *)&v92 + 1) + 32));
            *((_BYTE *)v79 + 24) = 1;
            os_unfair_lock_unlock((os_unfair_lock_t)(*((_QWORD *)&v92 + 1) + 32));
            +[_DASMetricRecorder recordOccurrenceForKey:](_DASMetricRecorder, "recordOccurrenceForKey:", CFSTR("com.apple.das.timeout.cdapppredictionquery"));
            v35 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("predictions")));
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v90 = 138412290;
              v91 = v23;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Timed out querying for prediction: %@", v90, 0xCu);
            }

          }
          v9 = v62;

          _Block_object_dispose(&v78, 8);
          _Block_object_dispose(&v92, 8);

        }
        v36 = *(void **)(*((_QWORD *)&buf + 1) + 40);
        if (v36 && (objc_msgSend(v36, "isUnavailable") & 1) == 0)
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "valueAtDate:", v61));
          objc_msgSend(v37, "doubleValue");
          v28 = v38;

          if (v64)
          {
            v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v28));
            v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%@.likelihood == %@"), v23, v39));
            objc_msgSend(v64, "addRationaleWithCondition:", v40);

          }
          v27 = 0;
        }
        else
        {
          v27 = 0;
          v28 = 0.0025;
        }
        goto LABEL_41;
      }
      v25 = objc_msgSend(v67, "schedulingPriority");
      v21 = v21 * 0.99;
      if ((unint64_t)v25 > _DASSchedulingPriorityUtility)
      {
        v26 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("predictions")));
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v23;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Daemon %@ doing high-priority work!", (uint8_t *)&buf, 0xCu);
        }

      }
      v27 = 5;
      v28 = 0.01;
LABEL_42:
      objc_sync_exit(v24);

      v41 = 1.0 - v28;
      if (v27)
        v41 = 1.0;
      v21 = v21 * v41;
    }
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v82, v101, 16);
  }
  while (v19);
LABEL_49:

  v42 = objc_msgSend(v67, "requestsApplicationLaunch");
  v43 = sqrt(1.0 - v21);
  if ((v42 & (v43 > 0.25)) != 0)
    v44 = 1.0;
  else
    v44 = v43;
  if (v44 > 2.22044605e-16 && objc_msgSend(v67, "requestsApplicationLaunch"))
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "relatedApplications"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "firstObject"));

    v47 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](_DASDaemon, "sharedInstance"));
    v48 = objc_msgSend(v47, "requestCountForApplication:", v46);

    if (v48)
      v44 = v44 + (double)((unint64_t)v48 - 1) * 0.1;

  }
  if (objc_msgSend(v67, "beforeApplicationLaunch"))
    v49 = 0.0;
  else
    v49 = 0.01;
  if (objc_msgSend(v67, "requestsApplicationLaunch"))
  {
    objc_msgSend(v60, "timeIntervalSinceDate:", obj);
    if (v50 < 0.0)
    {
      v51 = v9->_recentlyUsedApplications;
      objc_sync_enter(v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "relatedApplications"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "firstObject"));

      v44 = v44 * 0.65;
      if (v53 && -[NSMutableSet containsObject:](v9->_recentlyUsedApplications, "containsObject:", v53))
        v44 = v44 + 0.35;

      objc_sync_exit(v51);
    }
    if (v44 > 0.5)
      v44 = 1.0;
    v54 = objc_msgSend(v67, "schedulingPriority");
    if ((unint64_t)v54 >= _DASSchedulingPriorityUserInitiated
      || (v55 = objc_msgSend(v67, "requestsNewsstandLaunch"), v56 = 0.0, v55))
    {
      v56 = v49;
    }
    v57 = 1.0;
    if (v44 <= 1.0)
      v57 = v44;
    if (v56 >= v57)
      v12 = v56;
    else
      v12 = v57;
  }
  else
  {
    v58 = 1.0;
    if (v44 <= 1.0)
      v58 = v44;
    if (v49 >= v58)
      v12 = v49;
    else
      v12 = v58;
  }

LABEL_82:
  return v12;
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (id)initializeTriggers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  _QWORD v8[4];
  void *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForAppUsageDataDictionaries](_CDContextQueries, "keyPathForAppUsageDataDictionaries"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", v2));

  v7[0] = CFSTR("identifier");
  v7[1] = CFSTR("predicate");
  v8[0] = CFSTR("com.apple.das.apppolicy.appchanged");
  v8[1] = v3;
  v7[2] = CFSTR("deviceSet");
  v7[3] = CFSTR("mustWake");
  v8[2] = &off_10016E618;
  v8[3] = &__kCFBooleanTrue;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 4));
  v9 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));

  return v5;
}

- (_DASApplicationPolicy)init
{
  _DASApplicationPolicy *v2;
  _DASApplicationPolicy *v3;
  NSString *policyName;
  uint64_t v5;
  _DASPredictor *predictor;
  uint64_t v7;
  NSMutableDictionary *timelines;
  uint64_t v9;
  NSMutableDictionary *lastApplicationTimelineUpdate;
  uint64_t v11;
  NSMutableSet *daemons;
  uint64_t v13;
  NSArray *triggers;
  uint64_t v15;
  NSMutableSet *recentlyUsedApplications;
  uint64_t v17;
  _DASComplicationManager *complicationManager;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)_DASApplicationPolicy;
  v2 = -[_DASApplicationPolicy init](&v20, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)CFSTR("Application Policy");

    v5 = objc_claimAutoreleasedReturnValue(+[_DASPredictionManager sharedPredictor](_DASPredictionManager, "sharedPredictor"));
    predictor = v3->_predictor;
    v3->_predictor = (_DASPredictor *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    timelines = v3->_timelines;
    v3->_timelines = (NSMutableDictionary *)v7;

    v9 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    lastApplicationTimelineUpdate = v3->_lastApplicationTimelineUpdate;
    v3->_lastApplicationTimelineUpdate = (NSMutableDictionary *)v9;

    v11 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    daemons = v3->_daemons;
    v3->_daemons = (NSMutableSet *)v11;

    v13 = objc_claimAutoreleasedReturnValue(-[_DASApplicationPolicy initializeTriggers](v3, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v13;

    v15 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    recentlyUsedApplications = v3->_recentlyUsedApplications;
    v3->_recentlyUsedApplications = (NSMutableSet *)v15;

    -[_DASApplicationPolicy updateRecentApplications](v3, "updateRecentApplications");
    v17 = objc_claimAutoreleasedReturnValue(+[_DASComplicationManager sharedInstance](_DASComplicationManager, "sharedInstance"));
    complicationManager = v3->_complicationManager;
    v3->_complicationManager = (_DASComplicationManager *)v17;

  }
  return v3;
}

+ (id)policyInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100047850;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001AB5F8 != -1)
    dispatch_once(&qword_1001AB5F8, block);
  return (id)qword_1001AB600;
}

- (void)updateRecentApplications
{
  NSObject *v3;
  dispatch_source_t v4;
  void *v5;
  NSObject *v6;
  dispatch_time_t v7;
  _QWORD handler[5];

  v3 = objc_claimAutoreleasedReturnValue(+[_DASPredictionManager predictionGenerationQueue](_DASPredictionManager, "predictionGenerationQueue"));
  v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v3);
  v5 = (void *)qword_1001AB608;
  qword_1001AB608 = (uint64_t)v4;

  v6 = qword_1001AB608;
  v7 = dispatch_walltime(0, 0);
  dispatch_source_set_timer(v6, v7, 0x1A3185C5000uLL, 0x29E8D60800uLL);
  dispatch_set_qos_class_fallback(qword_1001AB608, 17);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100047964;
  handler[3] = &unk_10015D4E0;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)qword_1001AB608, handler);
  dispatch_resume((dispatch_object_t)qword_1001AB608);
}

- (void)updateAppLaunchedRecently:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  NSMutableSet *recentlyUsedApplications;
  NSMutableSet *v8;
  void *v9;
  NSObject *v10;
  NSMutableSet *v11;
  int v12;
  NSMutableSet *v13;

  v4 = a3;
  v5 = self->_recentlyUsedApplications;
  objc_sync_enter(v5);
  v6 = -[NSMutableSet count](self->_recentlyUsedApplications, "count");
  recentlyUsedApplications = self->_recentlyUsedApplications;
  if ((unint64_t)v6 >= 0x19)
  {
    if ((-[NSMutableSet containsObject:](recentlyUsedApplications, "containsObject:", v4) & 1) != 0)
      goto LABEL_5;
    v8 = self->_recentlyUsedApplications;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet anyObject](v8, "anyObject"));
    -[NSMutableSet removeObject:](v8, "removeObject:", v9);

    recentlyUsedApplications = self->_recentlyUsedApplications;
  }
  -[NSMutableSet addObject:](recentlyUsedApplications, "addObject:", v4);
LABEL_5:
  v10 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar")));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = self->_recentlyUsedApplications;
    v12 = 138412290;
    v13 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Recent Applications: %@", (uint8_t *)&v12, 0xCu);
  }

  objc_sync_exit(v5);
}

- (BOOL)shouldLogScoreToPowerLog
{
  return 1;
}

- (BOOL)isDaemon:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 0, 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "compatibilityObject"));
  return v5 == 0;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;

  v6 = a4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.das.apppolicy.appchanged")))
  {
    v7 = objc_msgSend((id)objc_opt_class(self), "focalApplicationsWithContext:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = objc_msgSend(v8, "count") == 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)updatePredictionsAtDate:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v5 = a3;
  v6 = (void *)os_transaction_create("com.apple.dasd.updatetopnprediction");
  v7 = objc_autoreleasePoolPush();
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPredictor launchLikelihoodForTopNApplications:withLikelihoodGreaterThan:withTemporalResolution:](self->_predictor, "launchLikelihoodForTopNApplications:withLikelihoodGreaterThan:withTemporalResolution:", 10, 3600, 0.142857143));
  -[_DASApplicationPolicy setTopNPrediction:](self, "setTopNPrediction:", v8);

  objc_storeStrong((id *)&self->_lastPredictionTimelineUpdate, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_DASApplicationPolicy topNPrediction](self, "topNPrediction"));
  +[_DASPredictionManager setPrediction:forKey:](_DASPredictionManager, "setPrediction:forKey:", v9, CFSTR("application.topN"));

  v10 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("predictions")));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    sub_1000E1A40(self, v10);

  objc_autoreleasePoolPop(v7);
}

- (double)scoreForAnyAppActivity:(id)a3 atDate:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  double v18;
  void *i;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  id v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD block[5];
  id v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  _BYTE v43[128];

  v6 = a3;
  v28 = a4;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "dateByAddingTimeInterval:", 450.0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = sub_100048548;
  v41 = sub_100048558;
  v42 = 0;
  v8 = objc_claimAutoreleasedReturnValue(+[_DASPredictionManager predictionGenerationQueue](_DASPredictionManager, "predictionGenerationQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100048560;
  block[3] = &unk_10015D930;
  block[4] = self;
  v9 = v7;
  v35 = v9;
  v36 = &v37;
  dispatch_sync(v8, block);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v38[5], "valueAtDate:", v29));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relatedApplications"));
  if (objc_msgSend(v11, "count"))
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relatedApplications"));
  else
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allKeys"));
  v13 = (void *)v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v15 = v13;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v31;
    v18 = 1.0;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v17)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v20));
        v22 = v21;
        if (v21)
        {
          objc_msgSend(v21, "doubleValue");
          v24 = v23;
          objc_msgSend(v14, "addObject:", v20);
          v18 = v18 * (1.0 - v24);
        }

      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
    }
    while (v16);
  }
  else
  {
    v18 = 1.0;
  }

  v25 = objc_autoreleasePoolPush();
  if (objc_msgSend(v14, "count"))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v14));
    objc_msgSend(v6, "setSchedulerRecommendedApplications:", v26);

  }
  objc_autoreleasePoolPop(v25);

  _Block_object_dispose(&v37, 8);
  return fmax(sqrt(1.0 - v18), 0.01);
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  _DASPolicyResponseRationale *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  unsigned __int8 v27;
  uint64_t v28;
  void *v29;
  void *v30;
  unsigned int v31;
  void *v32;
  void *v33;
  unsigned int v34;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  unsigned __int8 v41;
  uint64_t v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  char v48;
  _BYTE v49[128];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "requestsApplicationLaunch"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "launchReason"));
    if (objc_msgSend(v8, "isEqualToString:", _DASLaunchReasonBackgroundRemoteNotification))
    {

    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "launchReason"));
      v10 = objc_msgSend(v9, "isEqualToString:", _DASLaunchReasonBackgroundNewsstand);

      if (!v10)
        goto LABEL_8;
    }
    v48 = 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](_DASDaemon, "sharedInstance"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "barScheduler"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relatedApplications"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));
    v15 = objc_msgSend(v12, "pushLaunchAllowedForApp:immediately:", v14, &v48);

    if (v48)
    {
      v16 = -[_DASPolicyResponseRationale initWithPolicyName:]([_DASPolicyResponseRationale alloc], "initWithPolicyName:", CFSTR("Application Policy"));
      -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:](v16, "addRationaleForCondition:withRequiredValue:withCurrentValue:", CFSTR("appIsForeground"), 1.0, 1.0);
      -[_DASPolicyResponseRationale setResponseOptions:](v16, "setResponseOptions:", (unint64_t)-[_DASPolicyResponseRationale responseOptions](v16, "responseOptions") | 2);
      v17 = 200;
LABEL_35:
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", v17, v16, 10800.0));
      goto LABEL_36;
    }
    if ((v15 & 1) == 0)
    {
      v16 = -[_DASPolicyResponseRationale initWithPolicyName:]([_DASPolicyResponseRationale alloc], "initWithPolicyName:", CFSTR("Application Policy"));
      -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:](v16, "addRationaleForCondition:withRequiredValue:withCurrentValue:", CFSTR("pushDisallowed"), 0.0, 1.0);
      v17 = 100;
      goto LABEL_35;
    }
  }
LABEL_8:
  v18 = objc_msgSend((id)objc_opt_class(self), "focalApplicationsWithContext:", v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relatedApplications"));
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v45;
LABEL_10:
    v24 = 0;
    while (1)
    {
      if (*(_QWORD *)v45 != v23)
        objc_enumerationMutation(v20);
      if ((objc_msgSend(v19, "containsObject:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v24)) & 1) != 0)
        break;
      if (v22 == (id)++v24)
      {
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
        if (v22)
          goto LABEL_10;
        goto LABEL_16;
      }
    }

    if (objc_msgSend(v6, "requestsApplicationLaunch"))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "launchReason"));
      if ((objc_msgSend(v25, "isEqualToString:", _DASLaunchReasonBackgroundFetch) & 1) != 0)
      {

      }
      else
      {
        v27 = objc_msgSend(v6, "isBackgroundTaskActivity");

        if ((v27 & 1) == 0)
          goto LABEL_24;
      }
      v16 = -[_DASPolicyResponseRationale initWithPolicyName:]([_DASPolicyResponseRationale alloc], "initWithPolicyName:", CFSTR("Application Policy"));
      -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:](v16, "addRationaleForCondition:withRequiredValue:withCurrentValue:", CFSTR("appIsForeground"), 0.0, 1.0);
      v28 = objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", 33, v16, 10800.0));
      goto LABEL_32;
    }
    if (!objc_msgSend(v6, "runOnAppForeground"))
      goto LABEL_24;
    objc_msgSend(0, "addRationaleForCondition:withRequiredValue:withCurrentValue:", CFSTR("appIsForeground"), 1.0, 1.0);
    v26 = 67;
    goto LABEL_28;
  }
LABEL_16:

LABEL_24:
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "launchReason"));
  if (objc_msgSend(v29, "isEqualToString:", _DASLaunchReasonBackgroundRemoteNotification))
  {

LABEL_27:
    v26 = 0;
LABEL_28:
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", v26, 0, 10800.0));
    goto LABEL_29;
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "launchReason"));
  v31 = objc_msgSend(v30, "isEqualToString:", _DASLaunchReasonBackgroundNewsstand);

  if (v31)
    goto LABEL_27;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[_DASFileProtectionPolicy policyInstance](_DASFileProtectionPolicy, "policyInstance"));
  v34 = objc_msgSend(v33, "isClassCLocked");

  if (v34)
  {
    v16 = -[_DASPolicyResponseRationale initWithPolicyName:]([_DASPolicyResponseRationale alloc], "initWithPolicyName:", CFSTR("Application Policy"));
    -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:](v16, "addRationaleForCondition:withRequiredValue:withCurrentValue:", CFSTR("classCLocked"), 1.0, 0.0);
    v28 = objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithScore:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithScore:validityDuration:rationale:", v16, 0.5, 10800.0));
LABEL_32:
    v32 = (void *)v28;
    goto LABEL_33;
  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[_DASApplicationPolicy scoreForActivity:atDate:withRationale:](self, "scoreForActivity:atDate:withRationale:", v6, v36, 0);
  v38 = v37;
  if (objc_msgSend(v6, "beforeApplicationLaunch")
    && v38 <= 0.05
    && (v39 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](_CDContextQueries, "keyPathForPluginStatus")), v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v39)), v41 = objc_msgSend(v40, "BOOLValue"), v40, v39, (v41 & 1) == 0))
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("isPluggedIn == %@ AND likelihood == %lf"), &__kCFBooleanFalse, *(_QWORD *)&v38));
    objc_msgSend(0, "addRationaleWithCondition:", v43);

    v42 = objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", 33, 0, (double)0x384uLL));
  }
  else
  {
    v42 = objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithScore:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithScore:validityDuration:rationale:", 0, v38, (double)0x384uLL));
  }
  v32 = (void *)v42;

LABEL_29:
  v16 = 0;
LABEL_33:

LABEL_36:
  return v32;
}

- (NSString)policyName
{
  return self->_policyName;
}

- (void)setPolicyName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)policyDescription
{
  return self->_policyDescription;
}

- (void)setPolicyDescription:(id)a3
{
  objc_storeStrong((id *)&self->_policyDescription, a3);
}

- (void)setTriggers:(id)a3
{
  objc_storeStrong((id *)&self->_triggers, a3);
}

- (_DASPredictor)predictor
{
  return self->_predictor;
}

- (void)setPredictor:(id)a3
{
  objc_storeStrong((id *)&self->_predictor, a3);
}

- (NSMutableDictionary)timelines
{
  return self->_timelines;
}

- (void)setTimelines:(id)a3
{
  objc_storeStrong((id *)&self->_timelines, a3);
}

- (_DKPredictionTimeline)topNPrediction
{
  return self->_topNPrediction;
}

- (void)setTopNPrediction:(id)a3
{
  objc_storeStrong((id *)&self->_topNPrediction, a3);
}

- (NSDate)lastPredictionTimelineUpdate
{
  return self->_lastPredictionTimelineUpdate;
}

- (void)setLastPredictionTimelineUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_lastPredictionTimelineUpdate, a3);
}

- (NSMutableDictionary)lastApplicationTimelineUpdate
{
  return self->_lastApplicationTimelineUpdate;
}

- (void)setLastApplicationTimelineUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_lastApplicationTimelineUpdate, a3);
}

- (NSMutableSet)daemons
{
  return self->_daemons;
}

- (void)setDaemons:(id)a3
{
  objc_storeStrong((id *)&self->_daemons, a3);
}

- (NSMutableSet)recentlyUsedApplications
{
  return self->_recentlyUsedApplications;
}

- (void)setRecentlyUsedApplications:(id)a3
{
  objc_storeStrong((id *)&self->_recentlyUsedApplications, a3);
}

- (_DASComplicationManager)complicationManager
{
  return self->_complicationManager;
}

- (void)setComplicationManager:(id)a3
{
  objc_storeStrong((id *)&self->_complicationManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_complicationManager, 0);
  objc_storeStrong((id *)&self->_recentlyUsedApplications, 0);
  objc_storeStrong((id *)&self->_daemons, 0);
  objc_storeStrong((id *)&self->_lastApplicationTimelineUpdate, 0);
  objc_storeStrong((id *)&self->_lastPredictionTimelineUpdate, 0);
  objc_storeStrong((id *)&self->_topNPrediction, 0);
  objc_storeStrong((id *)&self->_timelines, 0);
  objc_storeStrong((id *)&self->_predictor, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);
  objc_storeStrong((id *)&self->_policyName, 0);
}

@end
