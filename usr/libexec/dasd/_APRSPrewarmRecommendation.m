@implementation _APRSPrewarmRecommendation

- (_APRSPrewarmRecommendation)init
{
  _APRSPrewarmRecommendation *v2;
  os_log_t v3;
  OS_os_log *log;
  uint64_t v5;
  _DKKnowledgeQuerying *knowledgeStore;
  uint64_t v7;
  NSArray *recommendations;
  _DASDataProtectionStateMonitor *v9;
  _DASDataProtectionStateMonitor *dataProtectionStateMonitor;
  _DASDataProtectionStateMonitor *v11;
  void *v12;
  NSObject *v13;
  uint8_t v15[16];
  _QWORD v16[4];
  id v17;
  id location;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)_APRSPrewarmRecommendation;
  v2 = -[_APRSPrewarmRecommendation init](&v19, "init");
  if (v2)
  {
    v3 = os_log_create("com.apple.aprs", "appResume.PrewarmRecommendations");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[_DASPredictionManager sharedKnowledgeStore](_DASPredictionManager, "sharedKnowledgeStore"));
    knowledgeStore = v2->_knowledgeStore;
    v2->_knowledgeStore = (_DKKnowledgeQuerying *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    recommendations = v2->_recommendations;
    v2->_recommendations = (NSArray *)v7;

    -[_APRSPrewarmRecommendation registerForTrial](v2, "registerForTrial");
    -[_APRSPrewarmRecommendation updateTrialParameters](v2, "updateTrialParameters");
    v9 = objc_alloc_init(_DASDataProtectionStateMonitor);
    dataProtectionStateMonitor = v2->_dataProtectionStateMonitor;
    v2->_dataProtectionStateMonitor = v9;

    objc_initWeak(&location, v2);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10001B0D8;
    v16[3] = &unk_10015D438;
    objc_copyWeak(&v17, &location);
    -[_DASDataProtectionStateMonitor setChangeHandler:](v2->_dataProtectionStateMonitor, "setChangeHandler:", v16);
    v11 = v2->_dataProtectionStateMonitor;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDataProtectionStateMonitor dataProtectionClassC](_DASDataProtectionStateMonitor, "dataProtectionClassC"));
    LODWORD(v11) = -[_DASDataProtectionStateMonitor isDataAvailableFor:](v11, "isDataAvailableFor:", v12);

    if ((_DWORD)v11)
    {
      v2->_classCUnlocked = 1;
    }
    else
    {
      v13 = v2->_log;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Class C not yet available.", v15, 2u);
      }
    }
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_1001AB3F0 != -1)
    dispatch_once(&qword_1001AB3F0, &stru_10015D458);
  return (id)qword_1001AB3E8;
}

+ (BOOL)appPreventsPrewarm:(id)a3
{
  id v4;
  unsigned __int8 v5;
  id v6;

  v4 = a3;
  v5 = 1;
  v6 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", v4, 1, 0);

  if ((objc_msgSend(a1, "appHasContinuousBackgroundModeWithRecord:", v6) & 1) == 0)
    v5 = objc_msgSend(a1, "appPrefersUnoptimizedLaunchesWithRecord:", v6);

  return v5;
}

+ (BOOL)appHasContinuousBackgroundModeWithRecord:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "UIBackgroundModes"));
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("continuous"));

  return v4;
}

+ (BOOL)appPrefersUnoptimizedLaunchesWithRecord:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  BOOL v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "infoDictionary"));
  v4 = objc_msgSend(v3, "objectForKey:ofClass:", CFSTR("SBPrefersUnoptimizedLaunch"), objc_opt_class(NSNumber));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  v6 = v5 && (objc_msgSend(v5, "BOOLValue") & 1) != 0;
  return v6;
}

- (void)evaluateRecommendations
{
  NSArray *v3;
  NSArray *recommendations;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[_APRSPrewarmRecommendation appPredictionTimeline](self, "appPredictionTimeline"));
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue(+[_APRSPrewarmRecommendation evaluateRecommendationsFromTimeline:](_APRSPrewarmRecommendation, "evaluateRecommendationsFromTimeline:", v5));
  recommendations = self->_recommendations;
  self->_recommendations = v3;

}

+ (BOOL)isPrewarmAllowedForApp:(id)a3
{
  id v4;
  unsigned int v5;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.purplebuddy")) & 1) != 0
    || (objc_msgSend(v4, "containsString:", CFSTR("UIService")) & 1) != 0
    || (objc_msgSend(v4, "containsString:", CFSTR(".widget")) & 1) != 0
    || (objc_msgSend(v4, "containsString:", CFSTR("com.apple.Reality")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.MTLReplayer")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.Health")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.camera")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.ContinuityCaptureShieldUI")) & 1) != 0)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v5 = objc_msgSend((id)objc_opt_class(a1), "appPreventsPrewarm:", v4) ^ 1;
  }

  return v5;
}

+ (BOOL)isPrewarmAllowed
{
  void *v3;
  unsigned __int8 v4;
  id v6;
  void *v7;
  unsigned __int8 v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v4 = objc_msgSend(v3, "isLowPowerModeEnabled");

  if ((v4 & 1) != 0 || (DMIsMigrationNeeded() & 1) != 0)
    return 0;
  v6 = objc_msgSend((id)objc_opt_class(a1), "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v7, "classCUnlocked");

  return v8;
}

+ (id)candidatesFromTimeline:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v3 = a3;
  v4 = (void *)os_transaction_create("com.apple.dasd.appResume.PrewarmRecommendations");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v6 = os_log_create("com.apple.aprs", "appResume.PrewarmRecommendations");
  if ((objc_msgSend(v3, "isUnavailable") & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueAtDate:", v8));

    objc_msgSend(v5, "addEntriesFromDictionary:", v9);
    v10 = objc_msgSend(v5, "count");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[_APRSPrewarmRecommendation sharedInstance](_APRSPrewarmRecommendation, "sharedInstance"));
    v12 = objc_msgSend(v11, "prewarmCount");

    if (v10 < v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "transitionDates"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));

      if (v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueAtDate:", v14));
        objc_msgSend(v5, "addEntriesFromDictionary:", v15);

      }
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      sub_1000DFB1C((uint64_t)v5, v6, v16, v17, v18, v19, v20, v21);
    v7 = v5;

  }
  return v7;
}

+ (id)appActivationTimeScores:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_APRSBiomeEventAnalyzer sharedInstance](_APRSBiomeEventAnalyzer, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "meanDeltaTimeBetweenColdLaunchAndResume"));

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001B790;
  v8[3] = &unk_10015D480;
  v6 = v3;
  v9 = v6;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);

  return v6;
}

+ (id)scoresToConfidenceLevels:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001B8B8;
  v6[3] = &unk_10015D480;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v7 = v4;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);

  return v4;
}

+ (id)evaluateRecommendationsFromTimeline:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  void *i;
  void *v31;
  void *v32;
  unsigned int v33;
  id v34;
  id v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  id v44;
  id v45;
  uint8_t buf[4];
  void *v47;
  _BYTE v48[128];

  v4 = a3;
  v5 = os_log_create("com.apple.aprs", "appResume.PrewarmRecommendations");
  if ((objc_msgSend((id)objc_opt_class(a1), "isPrewarmAllowed") & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[_APRSPrewarmRecommendation candidatesFromTimeline:](_APRSPrewarmRecommendation, "candidatesFromTimeline:", v4));
    v8 = objc_msgSend(v7, "mutableCopy");

    if (objc_msgSend(v8, "count"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[_APRSPrewarmRecommendation scoresToConfidenceLevels:](_APRSPrewarmRecommendation, "scoresToConfidenceLevels:", v8));
      v10 = objc_msgSend(v9, "mutableCopy");

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[_APRSPrewarmRecommendation appActivationTimeScores:](_APRSPrewarmRecommendation, "appActivationTimeScores:", 0));
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        sub_1000DFB1C((uint64_t)v10, v5, v12, v13, v14, v15, v16, v17);
      v38 = v4;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allKeys"));
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_10001BCFC;
      v43[3] = &unk_10015D4A8;
      v37 = v10;
      v44 = v37;
      v36 = v11;
      v45 = v36;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "sortedArrayUsingComparator:", v43));

      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        sub_1000DFB80((uint64_t)v19, v5, v20, v21, v22, v23, v24, v25);
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v26 = v19;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v40;
        do
        {
          for (i = 0; i != v28; i = (char *)i + 1)
          {
            if (*(_QWORD *)v40 != v29)
              objc_enumerationMutation(v26);
            v31 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
            v32 = (void *)objc_claimAutoreleasedReturnValue(+[_APRSRecommendationEngine sharedInstance](_APRSRecommendationEngine, "sharedInstance"));
            v33 = objc_msgSend(v32, "isAppRunning:", v31);

            if (v33)
            {
              if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v47 = v31;
                _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "BundleID %@ is already running. Skipping from Prewarm", buf, 0xCu);
              }
            }
            else if (+[_APRSPrewarmRecommendation isPrewarmAllowedForApp:](_APRSPrewarmRecommendation, "isPrewarmAllowedForApp:", v31))
            {
              objc_msgSend(v6, "addObject:", v31);
            }
          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
        }
        while (v28);
      }

      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v47 = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "DASDPREWARM prewarm choice list: %@", buf, 0xCu);
      }
      v34 = v6;

      v8 = v37;
      v4 = v38;
    }
    else
    {
      v34 = 0;
    }

  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Prewarm not yet allowed.", buf, 2u);
    }
    v34 = &__NSArray0__struct;
  }

  return v34;
}

- (id)appPredictionTimeline
{
  void *v3;
  void *v4;
  void *v5;
  _DKKnowledgeQuerying *knowledgeStore;
  void *v7;
  id v8;
  NSObject *log;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  void *v14;

  v3 = objc_autoreleasePoolPush();
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams appUsageStream](_DKSystemEventStreams, "appUsageStream"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DKPredictionQuery topNPredictionQueryForStream:withPredicate:withTopN:withMinLikelihood:](_DKPredictionQuery, "topNPredictionQueryForStream:withPredicate:withTopN:withMinLikelihood:", v4, 0, 50, 0.0));

  objc_msgSend(v5, "setSlotDuration:", 7200);
  objc_msgSend(v5, "setMinimumDaysOfHistory:", 1);
  knowledgeStore = self->_knowledgeStore;
  v12 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DKKnowledgeQuerying executeQuery:error:](knowledgeStore, "executeQuery:error:", v5, &v12));
  v8 = v12;
  if (v8)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      sub_1000DFBE4(log);
  }
  v10 = self->_log;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Timeline %@", buf, 0xCu);
  }

  objc_autoreleasePoolPop(v3);
  return v7;
}

- (void)registerForTrial
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[_DASTrialManager sharedInstance](_DASTrialManager, "sharedInstance"));
  objc_msgSend(v3, "addDelegate:", self);

}

- (void)updateTrialParameters
{
  void *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  unint64_t v7;
  int v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_DASTrialManager sharedInstance](_DASTrialManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "factorWithName:", CFSTR("APRS_PrewarmCount")));
  v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      v8 = 134217984;
      v9 = objc_msgSend(v4, "longValue");
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Trial: Prewarm count set to %lld", (uint8_t *)&v8, 0xCu);
    }

    v7 = (unint64_t)objc_msgSend(v4, "longValue");
  }
  else
  {
    if (v6)
    {
      LOWORD(v8) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Trial: Failed to load prewarmCount", (uint8_t *)&v8, 2u);
    }

    v7 = 3;
  }
  self->_prewarmCount = v7;

}

- (NSArray)recommendations
{
  return self->_recommendations;
}

- (void)setRecommendations:(id)a3
{
  objc_storeStrong((id *)&self->_recommendations, a3);
}

- (unint64_t)prewarmCount
{
  return self->_prewarmCount;
}

- (void)setPrewarmCount:(unint64_t)a3
{
  self->_prewarmCount = a3;
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_knowledgeStore;
}

- (void)setKnowledgeStore:(id)a3
{
  objc_storeStrong((id *)&self->_knowledgeStore, a3);
}

- (_DASDataProtectionStateMonitor)dataProtectionStateMonitor
{
  return self->_dataProtectionStateMonitor;
}

- (void)setDataProtectionStateMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_dataProtectionStateMonitor, a3);
}

- (BOOL)classCUnlocked
{
  return self->_classCUnlocked;
}

- (void)setClassCUnlocked:(BOOL)a3
{
  self->_classCUnlocked = a3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_dataProtectionStateMonitor, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
  objc_storeStrong((id *)&self->_recommendations, 0);
}

@end
