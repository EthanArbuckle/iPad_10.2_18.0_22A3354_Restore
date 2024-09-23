@implementation _APRSFreezerRecommendation

- (_APRSFreezerRecommendation)init
{
  _APRSFreezerRecommendation *v2;
  uint64_t v3;
  _DKKnowledgeQuerying *knowledgeStore;
  os_log_t v5;
  OS_os_log *log;
  uint64_t v7;
  NSArray *freezerRecommendations;
  uint64_t v9;
  NSArray *freezerDemotionRecommendations;
  dispatch_queue_attr_t v11;
  NSObject *v12;
  dispatch_queue_attr_t v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  NSUserDefaults *v17;
  NSUserDefaults *killDefaults;
  uint64_t v19;
  _APRSPLLogger *pLLogger;
  NSObject *v21;
  _APRSFreezerRecommendation *v22;
  _QWORD block[4];
  _APRSFreezerRecommendation *v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)_APRSFreezerRecommendation;
  v2 = -[_APRSFreezerRecommendation init](&v26, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[_DASPredictionManager sharedKnowledgeStore](_DASPredictionManager, "sharedKnowledgeStore"));
    knowledgeStore = v2->_knowledgeStore;
    v2->_knowledgeStore = (_DKKnowledgeQuerying *)v3;

    v5 = os_log_create("com.apple.aprs", "appResume.FreezerRecommendations");
    log = v2->_log;
    v2->_log = (OS_os_log *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    freezerRecommendations = v2->_freezerRecommendations;
    v2->_freezerRecommendations = (NSArray *)v7;

    v9 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    freezerDemotionRecommendations = v2->_freezerDemotionRecommendations;
    v2->_freezerDemotionRecommendations = (NSArray *)v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_BACKGROUND, 0);
    v14 = objc_claimAutoreleasedReturnValue(v13);

    v15 = dispatch_queue_create("com.apple.dasd.appResume.FreezerRecommendations", v14);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v15;

    v17 = (NSUserDefaults *)objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.appResume.freezerRecommendations"));
    killDefaults = v2->_killDefaults;
    v2->_killDefaults = v17;

    v19 = objc_claimAutoreleasedReturnValue(+[_APRSPLLogger sharedInstance](_APRSPLLogger, "sharedInstance"));
    pLLogger = v2->_pLLogger;
    v2->_pLLogger = (_APRSPLLogger *)v19;

    v21 = v2->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100072270;
    block[3] = &unk_10015D4E0;
    v22 = v2;
    v25 = v22;
    dispatch_async(v21, block);
    -[_APRSFreezerRecommendation registerDailyModelUpdateTask](v22, "registerDailyModelUpdateTask");

  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_1001ABA90 != -1)
    dispatch_once(&qword_1001ABA90, &stru_10015EA60);
  return (id)qword_1001ABA88;
}

- (void)evaluateFreezerRecommendations
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  void *v13;
  NSArray *freezerRecommendations;
  NSObject *log;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[16];
  _BYTE v22[128];

  -[_APRSFreezerRecommendation updateTimeline](self, "updateTimeline");
  -[_APRSFreezerRecommendation updateScores](self, "updateScores");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_APRSFreezerRecommendation aggregatorScoresForAllApplicationsAtDate:](self, "aggregatorScoresForAllApplicationsAtDate:", v3));

  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "keysSortedByValueUsingComparator:", &stru_10015EA80));
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    obj = v5;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(obj);
          v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("app"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v11));
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("score"));

          -[NSArray addObject:](v6, "addObject:", v12);
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v8);
    }

    freezerRecommendations = self->_freezerRecommendations;
    self->_freezerRecommendations = v6;

  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "No change in Freezer recommendations", buf, 2u);
    }
  }

}

- (id)appsFromProactiveSuggestions
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *log;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v17;
  void *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (dlopen_preflight((const char *)objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/AppPredictionClient.framework/AppPredictionClient"), "UTF8String")))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[_APRSFreezerRecommendation scoresForAppPredictionType:](self, "scoresForAppPredictionType:", 15));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_APRSFreezerRecommendation scoresForAppPredictionType:](self, "scoresForAppPredictionType:", 16));
    objc_msgSend(v3, "addEntriesFromDictionary:", v4);
    objc_msgSend(v3, "addEntriesFromDictionary:", v5);
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v3;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Proactive scores %@", (uint8_t *)&v17, 0xCu);
    }
    v7 = v3;

  }
  else
  {
    v8 = self->_log;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1000E4070(v8, v9, v10, v11, v12, v13, v14, v15);
    v7 = 0;
  }

  return v7;
}

- (id)scoresForAppPredictionType:(int64_t)a3
{
  void *v4;
  objc_class *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  char *v22;
  double v23;
  void *v24;
  NSObject *log;
  void *v28;
  id v29;
  id v30;
  id obj;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint8_t v41[128];
  __int128 buf;
  Class (*v43)(uint64_t);
  void *v44;
  uint64_t *v45;

  v30 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v37 = 0;
  v38 = &v37;
  v39 = 0x2050000000;
  v4 = (void *)qword_1001ABAA8;
  v40 = qword_1001ABAA8;
  if (!qword_1001ABAA8)
  {
    *(_QWORD *)&buf = _NSConcreteStackBlock;
    *((_QWORD *)&buf + 1) = 3221225472;
    v43 = sub_100075934;
    v44 = &unk_10015D610;
    v45 = &v37;
    sub_100075934((uint64_t)&buf);
    v4 = (void *)v38[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v37, 8);
  v29 = [v5 alloc];
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "cachedSuggestionsForClientModelType:", a3));
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "suggestions"));
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "executableSpecification"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "executableObject"));

        if (v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "scoreSpecification"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v12, "suggestedConfidenceCategory")));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "description"));
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v13, v14);

          v15 = objc_autoreleasePoolPush();
          v16 = objc_alloc((Class)LSApplicationRecord);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "description"));
          v18 = objc_msgSend(v16, "initWithBundleIdentifier:allowPlaceholder:error:", v17, 0, 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "compatibilityObject"));

          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bundleExecutable"));
          if (v20)
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "scoreSpecification"));
            v22 = (char *)objc_msgSend(v21, "suggestedConfidenceCategory");

            v23 = 0.0;
            if ((unint64_t)(v22 - 2) <= 2)
              v23 = dbl_10011D490[(_QWORD)(v22 - 2)];
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v23));
            objc_msgSend(v30, "setObject:forKeyedSubscript:", v24, v20);

          }
          objc_autoreleasePoolPop(v15);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v6);
  }

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v30;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Proactive HomeScreen scores %@", (uint8_t *)&buf, 0xCu);
  }

  return v30;
}

- (void)convertTimelineToApplicationDictionaries:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  _UNKNOWN **v23;
  void *v24;
  double v25;
  _UNKNOWN **v26;
  id v27;
  id v28;
  NSObject *log;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  _APRSFreezerRecommendation *v35;
  id v36;
  id obj;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  void *v47;
  _BYTE v48[128];

  v4 = a3;
  if (objc_msgSend(v4, "isUnavailable"))
  {
    -[_APRSFreezerRecommendation setCurrentProbabilities:](self, "setCurrentProbabilities:", &__NSDictionary0__struct);
    -[_APRSFreezerRecommendation setNextProbabilities:](self, "setNextProbabilities:", &__NSDictionary0__struct);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
    -[_APRSFreezerRecommendation setTransitionDate:](self, "setTransitionDate:", v5);

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "transitionDates"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    -[_APRSFreezerRecommendation setTransitionDate:](self, "setTransitionDate:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueAtDate:", v9));

    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueAtDate:", self->_transitionDate));
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
      sub_1000E4104();
    v35 = self;
    v36 = v4;
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
      sub_1000E40A4();
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "allKeys"));
    objc_msgSend(v8, "addObjectsFromArray:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "allKeys"));
    objc_msgSend(v8, "addObjectsFromArray:", v11);

    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    obj = v8;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v43 != v14)
            objc_enumerationMutation(obj);
          v16 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
          v17 = objc_autoreleasePoolPush();
          v18 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", v16, 0, 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "compatibilityObject"));

          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bundleExecutable"));
          if (v20)
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForKeyedSubscript:", v16));
            objc_msgSend(v21, "doubleValue");
            if (v22 <= 0.1)
              v23 = &off_10016E9C0;
            else
              v23 = (_UNKNOWN **)v21;
            objc_msgSend(v39, "setObject:forKeyedSubscript:", v23, v20);
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", v16));

            objc_msgSend(v24, "doubleValue");
            if (v25 <= 0.1)
              v26 = &off_10016E9C0;
            else
              v26 = (_UNKNOWN **)v24;
            objc_msgSend(v38, "setObject:forKeyedSubscript:", v26, v20);

          }
          objc_autoreleasePoolPop(v17);
        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      }
      while (v13);
    }

    v27 = objc_msgSend(v39, "copy");
    -[_APRSFreezerRecommendation setCurrentProbabilities:](v35, "setCurrentProbabilities:", v27);

    v28 = objc_msgSend(v38, "copy");
    -[_APRSFreezerRecommendation setNextProbabilities:](v35, "setNextProbabilities:", v28);

    log = v35->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v30 = log;
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[_APRSFreezerRecommendation currentProbabilities](v35, "currentProbabilities"));
      *(_DWORD *)buf = 138412290;
      v47 = v31;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Current Probabilities: %@", buf, 0xCu);

    }
    v32 = v35->_log;
    v4 = v36;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = v32;
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[_APRSFreezerRecommendation nextProbabilities](v35, "nextProbabilities"));
      *(_DWORD *)buf = 138412290;
      v47 = v34;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Next Probabilities: %@", buf, 0xCu);

    }
  }

}

- (void)updateTimeline
{
  void *v3;
  void *v4;
  void *v5;
  _DKKnowledgeQuerying *knowledgeStore;
  void *v7;
  id v8;
  NSObject *log;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  void *v20;

  v3 = objc_autoreleasePoolPush();
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams appUsageStream](_DKSystemEventStreams, "appUsageStream"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DKPredictionQuery topNPredictionQueryForStream:withPredicate:withTopN:withMinLikelihood:](_DKPredictionQuery, "topNPredictionQueryForStream:withPredicate:withTopN:withMinLikelihood:", v4, 0, 50, 0.0));

  objc_msgSend(v5, "setSlotDuration:", 7200);
  objc_msgSend(v5, "setMinimumDaysOfHistory:", 1);
  knowledgeStore = self->_knowledgeStore;
  v18 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DKKnowledgeQuerying executeQuery:error:](knowledgeStore, "executeQuery:error:", v5, &v18));
  v8 = v18;
  if (v8)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      sub_1000E4164(log, v10, v11, v12, v13, v14, v15, v16);
  }
  v17 = self->_log;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Updating timeline: %@", buf, 0xCu);
  }
  -[_APRSFreezerRecommendation convertTimelineToApplicationDictionaries:](self, "convertTimelineToApplicationDictionaries:", v7);

  objc_autoreleasePoolPop(v3);
}

- (double)scoreForApplication:(id)a3 atDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_APRSFreezerRecommendation transitionDate](self, "transitionDate"));
  objc_msgSend(v6, "timeIntervalSinceDate:", v8);
  v10 = v9;

  if (v10 <= 0.0)
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[_APRSFreezerRecommendation currentProbabilities](self, "currentProbabilities"));
  else
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[_APRSFreezerRecommendation nextProbabilities](self, "nextProbabilities"));
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v7));

  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  return v15;
}

- (id)predictionScoresForAllApplicationsAtDate:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_APRSFreezerRecommendation transitionDate](self, "transitionDate"));
  objc_msgSend(v4, "timeIntervalSinceDate:", v5);
  v7 = v6;

  if (v7 <= 0.0)
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[_APRSFreezerRecommendation currentProbabilities](self, "currentProbabilities"));
  else
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[_APRSFreezerRecommendation nextProbabilities](self, "nextProbabilities"));
  return v8;
}

- (id)predictedAppsAtDate:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  id v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  id v25;
  void *v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_APRSFreezerRecommendation predictionScoresForAllApplicationsAtDate:](self, "predictionScoresForAllApplicationsAtDate:", a3));
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_APRSFreezerRecommendation appsFromProactiveSuggestions](self, "appsFromProactiveSuggestions"));
  v7 = objc_msgSend(v6, "mutableCopy");

  v8 = v7;
  if (!objc_msgSend(v7, "count"))
  {
    v25 = v5;
LABEL_13:
    v12 = v25;
    goto LABEL_14;
  }
  if (!objc_msgSend(v5, "count"))
  {
    v25 = v7;
    goto LABEL_13;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allKeys"));
  objc_msgSend(v9, "addObjectsFromArray:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allKeys"));
  objc_msgSend(v9, "addObjectsFromArray:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v27 = v9;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allObjects"));
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v15)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        v18 = v5;
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v17));
        objc_msgSend(v19, "doubleValue");
        v21 = v20;
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v17));
        objc_msgSend(v22, "doubleValue");
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v23 * 0.5 + v21 * 0.5));
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v24, v17);

        v5 = v18;
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v14);
  }

LABEL_14:
  return v12;
}

- (id)aggregatorScoresForAllApplicationsAtDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *log;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  int v24;
  id v25;
  void *v26;
  id v27;
  _APRSFreezerRecommendation *v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *i;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  _APRSFreezerRecommendation *v71;
  id v72;
  void *v73;
  uint64_t v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint8_t v79[128];
  uint8_t buf[4];
  id v81;

  v4 = a3;
  v5 = (void *)os_transaction_create("com.apple.dasd.appResume.FreezerRecommendations");
  v6 = objc_autoreleasePoolPush();
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_APRSFreezerRecommendation predictedAppsAtDate:](self, "predictedAppsAtDate:", v4));
  v10 = objc_msgSend(v9, "count");
  v70 = v8;
  objc_msgSend(v8, "addObject:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allKeys"));
  objc_msgSend(v7, "addObjectsFromArray:", v11);

  v71 = self;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v81 = v9;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Prediction scores %@", buf, 0xCu);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[_APRSFreezerRecommendation killScoresForAllApplicationsAtDate:](self, "killScoresForAllApplicationsAtDate:", v4));
  v14 = objc_msgSend(v13, "mutableCopy");

  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(v70, "addObject:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allKeys"));
    objc_msgSend(v7, "addObjectsFromArray:", v15);

    v16 = 3;
  }
  else
  {
    v16 = 2;
  }
  v74 = v16;
  v17 = self->_log;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v81 = v14;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Kill scores %@", buf, 0xCu);
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[_APRSFreezerRecommendation appActivationTimeScores:](self, "appActivationTimeScores:", v4));
  v19 = objc_msgSend(v18, "mutableCopy");

  if (objc_msgSend(v19, "count"))
  {
    objc_msgSend(v70, "addObject:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "allKeys"));
    objc_msgSend(v7, "addObjectsFromArray:", v20);

  }
  else
  {
    --v74;
  }
  v21 = v71->_log;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v81 = v19;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Activation Time scores %@", buf, 0xCu);
  }
  v69 = v19;
  if (v74 == 1)
  {
    v22 = v70;
    v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "firstObject"));
    v24 = 0;
    v25 = 0;
  }
  else if (v10 || (unint64_t)objc_msgSend(v7, "count") >= 0xA)
  {
    v63 = v14;
    v64 = v9;
    v66 = v6;
    v67 = v5;
    v68 = v4;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[_APRSFreezerRecommendation frequentlyUserKilledApps](v71, "frequentlyUserKilledApps"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v65 = v7;
    v27 = v7;
    v28 = v71;
    v29 = v27;
    v30 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v75, v79, 16);
    v31 = v70;
    if (v30)
    {
      v32 = v30;
      v33 = *(_QWORD *)v76;
      v72 = v29;
      do
      {
        for (i = 0; i != v32; i = (char *)i + 1)
        {
          if (*(_QWORD *)v76 != v33)
            objc_enumerationMutation(v29);
          v35 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v26, "containsObject:", v35))
          {
            v36 = v28->_log;
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v81 = v35;
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "App %@ has a high user kill ratio. Skipping Freezer", buf, 0xCu);
            }
          }
          else if ((objc_msgSend(v35, "isEqual:", CFSTR("Camera")) & 1) == 0)
          {
            if (v74 == 2)
            {
              v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "firstObject"));
              v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", v35));
              objc_msgSend(v38, "doubleValue");
              v40 = v39;
              v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "lastObject"));
              v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForKeyedSubscript:", v35));
              objc_msgSend(v42, "doubleValue");
              v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v43 * 0.75 + v40 * 0.25));
              objc_msgSend(v73, "setObject:forKeyedSubscript:", v44, v35);

              v29 = v72;
              v28 = v71;

              v31 = v70;
            }
            else
            {
              v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "firstObject"));
              v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKeyedSubscript:", v35));

              v47 = 0.0;
              v48 = 0.0;
              if (v46)
              {
                v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKeyedSubscript:", v35));
                objc_msgSend(v49, "doubleValue");
                v48 = v50;

              }
              v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectAtIndex:", 2));

              v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectForKeyedSubscript:", v35));
              if (v52)
              {
                v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectForKeyedSubscript:", v35));
                objc_msgSend(v53, "doubleValue");
                v47 = v54;

              }
              v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "lastObject"));

              v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectForKeyedSubscript:", v35));
              if (v56
                && (v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectForKeyedSubscript:", v35)),
                    objc_msgSend(v57, "doubleValue"),
                    v59 = v58,
                    v57,
                    v59 != -1.0))
              {
                v60 = v47 * 0.25 + v48 * 0.25 + v59 * 0.5;
              }
              else
              {
                v60 = v47 * 0.75 + v48 * 0.25;
              }
              v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v60));
              objc_msgSend(v73, "setObject:forKeyedSubscript:", v61, v35);

              v29 = v72;
            }
          }
        }
        v32 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v75, v79, 16);
      }
      while (v32);
    }

    v23 = v73;
    objc_msgSend(v73, "setObject:forKeyedSubscript:", &off_10016E9D8, CFSTR("MobileSafari"));
    v25 = objc_msgSend(v73, "copy");

    v24 = 1;
    v5 = v67;
    v4 = v68;
    v22 = v31;
    v7 = v65;
    v6 = v66;
    v14 = v63;
    v9 = v64;
  }
  else
  {
    v24 = 0;
    v25 = 0;
    v23 = &__NSDictionary0__struct;
    v22 = v70;
  }

  objc_autoreleasePoolPop(v6);
  if (v24)
    v23 = v25;

  return v23;
}

- (id)appActivationTimeScores:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_APRSBiomeEventAnalyzer sharedInstance](_APRSBiomeEventAnalyzer, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "meanDeltaTimeBetweenColdLaunchAndResume"));

  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
    sub_1000E4198();
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100073BAC;
  v9[3] = &unk_10015D480;
  v7 = v4;
  v10 = v7;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v9);

  return v7;
}

+ (id)histogramEventStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("com.apple.dasd.jetsams"));
}

- (id)queryForHistogramWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("com.apple.dasd.jetsams")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DKHistogramQuery histogramQueryForPersistedHistogramsForStream:withCustomIdentifier:](_DKHistogramQuery, "histogramQueryForPersistedHistogramsForStream:withCustomIdentifier:", v4, v3));

  return v5;
}

- (void)_queue_loadHistograms
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *todaysKillHistogram;
  NSDictionary **p_historicalKillHistogram;
  NSMutableSet *v12;
  NSMutableSet *zerosSet;
  NSObject *log;
  NSDate *lastSnapshotTime;
  NSObject *v16;
  NSMutableDictionary *v17;
  NSObject *v18;
  NSDictionary *v19;
  void *context;
  uint8_t buf[4];
  void *v22;

  context = objc_autoreleasePoolPush();
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults dictionaryForKey:](self->_killDefaults, "dictionaryForKey:", CFSTR("histograms")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("current")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("historical")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("zeros")));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("snapshotTS")));
  v8 = (void *)v7;
  if (!v4)
    v4 = &__NSDictionary0__struct;
  if (!v5)
    v5 = &__NSDictionary0__struct;
  if (!v6)
    v6 = &__NSArray0__struct;
  if (!v7)
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  v9 = (NSMutableDictionary *)objc_msgSend(v4, "mutableCopy");
  todaysKillHistogram = self->_todaysKillHistogram;
  self->_todaysKillHistogram = v9;

  p_historicalKillHistogram = &self->_historicalKillHistogram;
  objc_storeStrong((id *)&self->_historicalKillHistogram, v5);
  v12 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v6));
  zerosSet = self->_zerosSet;
  self->_zerosSet = v12;

  objc_storeStrong((id *)&self->_lastSnapshotTime, v8);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    lastSnapshotTime = self->_lastSnapshotTime;
    *(_DWORD *)buf = 138412290;
    v22 = lastSnapshotTime;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Last snapshot: %@", buf, 0xCu);
  }
  v16 = self->_log;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = self->_todaysKillHistogram;
    *(_DWORD *)buf = 138412290;
    v22 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Loaded current histogram: %@", buf, 0xCu);
  }
  v18 = self->_log;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = *p_historicalKillHistogram;
    *(_DWORD *)buf = 138412290;
    v22 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Loaded historical histogram: %@", buf, 0xCu);
  }

  objc_autoreleasePoolPop(context);
}

- (void)_queue_updateHistograms
{
  void *v3;
  NSDictionary *historicalKillHistogram;
  void *v5;
  NSDate *lastSnapshotTime;
  void *v7;
  _QWORD v8[4];
  _QWORD v9[4];

  v3 = objc_autoreleasePoolPush();
  v8[0] = CFSTR("current");
  v8[1] = CFSTR("historical");
  historicalKillHistogram = self->_historicalKillHistogram;
  v9[0] = self->_todaysKillHistogram;
  v9[1] = historicalKillHistogram;
  v8[2] = CFSTR("zeros");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_zerosSet, "allObjects"));
  v8[3] = CFSTR("snapshotTS");
  lastSnapshotTime = self->_lastSnapshotTime;
  v9[2] = v5;
  v9[3] = lastSnapshotTime;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 4));

  -[NSUserDefaults setObject:forKey:](self->_killDefaults, "setObject:forKey:", v7, CFSTR("histograms"));
  objc_autoreleasePoolPop(v3);
}

- (id)_queue_computeScores
{
  void *v3;
  NSDictionary *historicalKillHistogram;
  id v5;
  NSMutableDictionary *todaysKillHistogram;
  id v7;
  NSMutableSet *zerosSet;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  id v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  historicalKillHistogram = self->_historicalKillHistogram;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000741BC;
  v17[3] = &unk_10015EAA8;
  v17[4] = self;
  v5 = v3;
  v18 = v5;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](historicalKillHistogram, "enumerateKeysAndObjectsUsingBlock:", v17);
  todaysKillHistogram = self->_todaysKillHistogram;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100074284;
  v15[3] = &unk_10015D480;
  v7 = v5;
  v16 = v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](todaysKillHistogram, "enumerateKeysAndObjectsUsingBlock:", v15);
  zerosSet = self->_zerosSet;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000742F8;
  v13[3] = &unk_10015EAD0;
  v9 = v7;
  v14 = v9;
  -[NSMutableSet enumerateObjectsUsingBlock:](zerosSet, "enumerateObjectsUsingBlock:", v13);
  v10 = v14;
  v11 = v9;

  return v11;
}

- (void)updateModel
{
  OS_dispatch_queue *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000743B0;
  block[3] = &unk_10015D4E0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)registerDailyModelUpdateTask
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  NSObject *v10;
  id v11;
  _QWORD v12[5];
  uint8_t buf[4];
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100074648;
  v12[3] = &unk_10015D5E8;
  v12[4] = self;
  objc_msgSend(v3, "registerForTaskWithIdentifier:usingQueue:launchHandler:", CFSTR("com.apple.aprs.FreezerModelUpdate"), 0, v12);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "taskRequestForIdentifier:", CFSTR("com.apple.aprs.FreezerModelUpdate")));

  if (!v5)
  {
    v6 = objc_msgSend(objc_alloc((Class)BGRepeatingSystemTaskRequest), "initWithIdentifier:", CFSTR("com.apple.aprs.FreezerModelUpdate"));
    objc_msgSend(v6, "setPriority:", 1);
    objc_msgSend(v6, "setInterval:", 86400.0);
    objc_msgSend(v6, "setRequiresExternalPower:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
    v11 = 0;
    v8 = objc_msgSend(v7, "submitTaskRequest:error:", v6, &v11);
    v9 = v11;

    if ((v8 & 1) == 0)
    {
      v10 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Failed to submit task with error: %@", buf, 0xCu);
      }

    }
  }
}

- (double)secondsFrom:(unint64_t)a3 until:(unint64_t)a4
{
  if (qword_1001ABAA0 != -1)
    dispatch_once(&qword_1001ABAA0, &stru_10015EAF0);
  return (double)((uint64_t)((a3 - a4) * dword_1001ABA98) / *(unsigned int *)algn_1001ABA9C) / 1000000000.0;
}

- (id)appsRecentlyForegrounded
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *j;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  NSObject *log;
  id v36;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[4];
  id v54;
  uint8_t buf[4];
  void *v56;
  _BYTE v57[128];
  _BYTE v58[128];

  v44 = (void *)os_transaction_create("appsRecentlyForegrounded");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v3 = objc_alloc((Class)NSDateInterval);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dateByAddingTimeInterval:", -604800.0));
  v43 = v2;
  v5 = objc_msgSend(v3, "initWithStartDate:endDate:", v4, v2);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams appUsageStream](_DKSystemEventStreams, "appUsageStream"));
  v42 = v5;
  v7 = objc_claimAutoreleasedReturnValue(+[_DKHistogramQuery histogramQueryForStream:interval:](_DKHistogramQuery, "histogramQueryForStream:interval:", v6, v5));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPredictionManager sharedKnowledgeStore](_DASPredictionManager, "sharedKnowledgeStore"));
  v41 = (void *)v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "executeQuery:error:", v7, 0));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v39 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "countDictionary"));
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_100074B54;
  v53[3] = &unk_10015EB18;
  v12 = v10;
  v54 = v12;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v53);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](_CDClientContext, "userContext"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForAppUsageDataDictionaries](_CDContextQueries, "keyPathForAppUsageDataDictionaries"));
  v38 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v14));

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v16 = v15;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v50 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries appUsageBundleID](_CDContextQueries, "appUsageBundleID"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", v22));
        objc_msgSend(v12, "addObject:", v23);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    }
    while (v18);
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v25 = v12;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v27; j = (char *)j + 1)
      {
        if (*(_QWORD *)v46 != v28)
          objc_enumerationMutation(v25);
        v30 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)j);
        v31 = objc_autoreleasePoolPush();
        v32 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", v30, 0, 0);
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "compatibilityObject"));

        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "bundleExecutable"));
        if (v34)
          objc_msgSend(v24, "addObject:", v34);

        objc_autoreleasePoolPop(v31);
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
    }
    while (v27);
  }

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v56 = v24;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Processes recently launched: %@", buf, 0xCu);
  }
  v36 = objc_msgSend(v24, "copy");

  return v36;
}

- (BOOL)process:(id)a3 inSet:(id)a4
{
  id v5;
  id v6;
  unsigned __int8 v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v5 = a3;
  v6 = a4;
  if ((unint64_t)objc_msgSend(v5, "length") > 0x1F)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "hasPrefix:", v5, (_QWORD)v14) & 1) != 0)
          {

            v7 = 1;
            goto LABEL_13;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v10)
          continue;
        break;
      }
    }

    v7 = 0;
  }
  else
  {
    v7 = objc_msgSend(v6, "containsObject:", v5);
  }
LABEL_13:

  return v7;
}

- (void)incorporateLatestJetsamStatistics
{
  void *v3;
  OS_dispatch_queue *queue;
  id v5;
  _QWORD block[5];
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_APRSFreezerRecommendation appsRecentlyForegrounded](self, "appsRecentlyForegrounded"));
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100074D28;
  block[3] = &unk_10015D558;
  block[4] = self;
  v7 = v3;
  v5 = v3;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (id)killScoresForAllApplicationsAtDate:(id)a3
{
  void *v4;
  OS_dispatch_queue *queue;
  id v6;
  NSObject *log;
  id v8;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  _APRSFreezerRecommendation *v14;
  id v15;
  uint8_t buf[4];
  id v17;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary", a3));
  queue = self->_queue;
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_10007539C;
  v13 = &unk_10015D558;
  v14 = self;
  v6 = v4;
  v15 = v6;
  dispatch_sync((dispatch_queue_t)queue, &v10);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Updating Kill Count: %@", buf, 0xCu);
  }
  v8 = objc_msgSend(v6, "copy", v10, v11, v12, v13, v14);

  return v8;
}

- (id)frequentlyUserKilledApps
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  unint64_t v18;
  double v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v26 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_APRSBiomeEventAnalyzer sharedInstance](_APRSBiomeEventAnalyzer, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allAppKillsInfo"));

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v9));
        objc_msgSend(v10, "meanSpringBoardKills");
        v12 = v11;
        objc_msgSend(v10, "meanJetsamKills");
        v14 = v12 + v13;
        objc_msgSend(v10, "meanRunningBoardKills");
        v16 = v14 + v15;
        objc_msgSend(v10, "meanOtherKills");
        v18 = (unint64_t)(v16 + v17);
        if (v18)
        {
          objc_msgSend(v10, "meanSpringBoardKills");
          if (v19 / (double)v18 > 0.85)
          {
            v20 = objc_autoreleasePoolPush();
            v21 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", v9, 0, 0);
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "compatibilityObject"));

            v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bundleExecutable"));
            if (v23)
            {
              v24 = (void *)v23;
              objc_msgSend(v26, "addObject:", v23);

            }
            objc_autoreleasePoolPop(v20);
          }
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v6);
  }

  return v26;
}

- (void)updateScores
{
  -[_APRSFreezerRecommendation incorporateLatestJetsamStatistics](self, "incorporateLatestJetsamStatistics");
}

- (NSArray)freezerRecommendations
{
  return self->_freezerRecommendations;
}

- (void)setFreezerRecommendations:(id)a3
{
  objc_storeStrong((id *)&self->_freezerRecommendations, a3);
}

- (NSArray)freezerDemotionRecommendations
{
  return self->_freezerDemotionRecommendations;
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_knowledgeStore;
}

- (void)setKnowledgeStore:(id)a3
{
  objc_storeStrong((id *)&self->_knowledgeStore, a3);
}

- (NSDictionary)currentProbabilities
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCurrentProbabilities:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSDate)transitionDate
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTransitionDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSDictionary)nextProbabilities
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setNextProbabilities:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableDictionary)todaysKillHistogram
{
  return self->_todaysKillHistogram;
}

- (void)setTodaysKillHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_todaysKillHistogram, a3);
}

- (NSDictionary)historicalKillHistogram
{
  return self->_historicalKillHistogram;
}

- (void)setHistoricalKillHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_historicalKillHistogram, a3);
}

- (NSMutableSet)zerosSet
{
  return self->_zerosSet;
}

- (void)setZerosSet:(id)a3
{
  objc_storeStrong((id *)&self->_zerosSet, a3);
}

- (_APRSPLLogger)pLLogger
{
  return self->_pLLogger;
}

- (void)setPLLogger:(id)a3
{
  objc_storeStrong((id *)&self->_pLLogger, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSDate)lastSnapshotTime
{
  return self->_lastSnapshotTime;
}

- (void)setLastSnapshotTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastSnapshotTime, a3);
}

- (NSUserDefaults)killDefaults
{
  return self->_killDefaults;
}

- (void)setKillDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_killDefaults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_killDefaults, 0);
  objc_storeStrong((id *)&self->_lastSnapshotTime, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_pLLogger, 0);
  objc_storeStrong((id *)&self->_zerosSet, 0);
  objc_storeStrong((id *)&self->_historicalKillHistogram, 0);
  objc_storeStrong((id *)&self->_todaysKillHistogram, 0);
  objc_storeStrong((id *)&self->_nextProbabilities, 0);
  objc_storeStrong((id *)&self->_transitionDate, 0);
  objc_storeStrong((id *)&self->_currentProbabilities, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
  objc_storeStrong((id *)&self->_freezerDemotionRecommendations, 0);
  objc_storeStrong((id *)&self->_freezerRecommendations, 0);
}

@end
