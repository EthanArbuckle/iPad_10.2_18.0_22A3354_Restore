@implementation _DASSwapModelApplicationUsage

- (_DASSwapModelApplicationUsage)init
{
  _DASSwapModelApplicationUsage *v2;
  uint64_t v3;
  _DKKnowledgeQuerying *knowledgeStore;
  uint64_t v5;
  OS_os_log *log;
  void *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  unsigned int v11;
  objc_super v13;
  uint8_t buf[4];
  unsigned int v15;

  v13.receiver = self;
  v13.super_class = (Class)_DASSwapModelApplicationUsage;
  v2 = -[_DASSwapModelApplicationUsage init](&v13, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[_DASPredictionManager sharedKnowledgeStore](_DASPredictionManager, "sharedKnowledgeStore"));
    knowledgeStore = v2->_knowledgeStore;
    v2->_knowledgeStore = (_DKKnowledgeQuerying *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("swap.appUsageModel")));
    log = v2->_log;
    v2->_log = (OS_os_log *)v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[_DASTrialManager sharedInstance](_DASTrialManager, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "factorWithName:", CFSTR("APRS_PrewarmDisabled")));
    v9 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        v11 = objc_msgSend(v8, "BOOLeanValue");
        *(_DWORD *)buf = 67109120;
        v15 = v11;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Trial: Prewarm disabled set to %d", buf, 8u);
      }

      v2->_prewarmDisabled = objc_msgSend(v8, "BOOLeanValue");
    }
    else
    {
      if (v10)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Trial: Failed to load prewarmDisabled", buf, 2u);
      }

    }
  }
  return v2;
}

- (void)convertTimelineToApplicationDictionaries:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *log;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *i;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  _UNKNOWN **v37;
  void *v38;
  double v39;
  _UNKNOWN **v40;
  id v41;
  id v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  _DASSwapModelApplicationUsage *v49;
  id v50;
  id obj;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[4];
  void *v61;
  _BYTE v62[128];

  v4 = a3;
  if (objc_msgSend(v4, "isUnavailable"))
  {
    -[_DASSwapModelApplicationUsage setCurrentProbabilities:](self, "setCurrentProbabilities:", &__NSDictionary0__struct);
    -[_DASSwapModelApplicationUsage setNextProbabilities:](self, "setNextProbabilities:", &__NSDictionary0__struct);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
    -[_DASSwapModelApplicationUsage setTransitionDate:](self, "setTransitionDate:", v5);

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "transitionDates"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    -[_DASSwapModelApplicationUsage setTransitionDate:](self, "setTransitionDate:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueAtDate:", v9));

    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueAtDate:", self->_transitionDate));
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
      sub_1000E9630((uint64_t)v55, log, v11, v12, v13, v14, v15, v16);
    v49 = self;
    v50 = v4;
    v17 = self->_log;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      sub_1000E95C8((uint64_t)v54, v17, v18, v19, v20, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "allKeys"));
    objc_msgSend(v8, "addObjectsFromArray:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "allKeys"));
    objc_msgSend(v8, "addObjectsFromArray:", v25);

    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    obj = v8;
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v27; i = (char *)i + 1)
        {
          if (*(_QWORD *)v57 != v28)
            objc_enumerationMutation(obj);
          v30 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)i);
          v31 = objc_autoreleasePoolPush();
          v32 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", v30, 0, 0);
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "compatibilityObject"));

          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "bundleExecutable"));
          if (v34)
          {
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectForKeyedSubscript:", v30));
            objc_msgSend(v35, "doubleValue");
            if (v36 <= 0.1)
              v37 = &off_10016ED20;
            else
              v37 = (_UNKNOWN **)v35;
            objc_msgSend(v53, "setObject:forKeyedSubscript:", v37, v34);
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectForKeyedSubscript:", v30));

            objc_msgSend(v38, "doubleValue");
            if (v39 <= 0.1)
              v40 = &off_10016ED20;
            else
              v40 = (_UNKNOWN **)v38;
            objc_msgSend(v52, "setObject:forKeyedSubscript:", v40, v34);

          }
          objc_autoreleasePoolPop(v31);
        }
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
      }
      while (v27);
    }

    v41 = objc_msgSend(v53, "copy");
    -[_DASSwapModelApplicationUsage setCurrentProbabilities:](v49, "setCurrentProbabilities:", v41);

    v42 = objc_msgSend(v52, "copy");
    -[_DASSwapModelApplicationUsage setNextProbabilities:](v49, "setNextProbabilities:", v42);

    v43 = v49->_log;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      v44 = v43;
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModelApplicationUsage currentProbabilities](v49, "currentProbabilities"));
      *(_DWORD *)buf = 138412290;
      v61 = v45;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Current Probabilities: %@", buf, 0xCu);

    }
    v46 = v49->_log;
    v4 = v50;
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      v47 = v46;
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModelApplicationUsage nextProbabilities](v49, "nextProbabilities"));
      *(_DWORD *)buf = 138412290;
      v61 = v48;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Next Probabilities: %@", buf, 0xCu);

    }
  }

}

- (id)prewarmLaunchAppFromBundleID:(id)a3
{
  id v4;
  NSObject *log;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  unsigned __int8 v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void **v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  void *v33;

  v4 = a3;
  if (+[_APRSPrewarmRecommendation appPreventsPrewarm:](_APRSPrewarmRecommendation, "appPreventsPrewarm:", v4))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v4;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "DASPREWARM Refusing to prewarm %@ because it not allowed by developer", buf, 0xCu);
    }
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
  }
  else
  {
    v7 = objc_alloc_init((Class)RBSLaunchContext);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessIdentity identityForEmbeddedApplicationIdentifier:](RBSProcessIdentity, "identityForEmbeddedApplicationIdentifier:", v4));
    objc_msgSend(v7, "setIdentity:", v8);

    objc_msgSend(v7, "setExplanation:", CFSTR("DAS Prewarm launch"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[RBSDomainAttribute attributeWithDomain:name:](RBSDomainAttribute, "attributeWithDomain:name:", CFSTR("com.apple.dasd"), CFSTR("DYLDLaunch")));
    v33 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v33, 1));
    objc_msgSend(v7, "setAttributes:", v10);

    objc_msgSend(v7, "_setAdditionalEnvironment:", &off_10016F5B0);
    v11 = objc_msgSend(objc_alloc((Class)RBSLaunchRequest), "initWithContext:", v7);
    v27 = 0;
    v28 = 0;
    v26 = 0;
    v12 = objc_msgSend(v11, "execute:assertion:error:", &v28, &v27, &v26);
    v13 = v28;
    v14 = v27;
    v15 = v26;
    v16 = self->_log;
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if ((v12 & 1) != 0)
    {
      if (v17)
      {
        *(_DWORD *)buf = 138412290;
        v30 = v4;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "DASDPREWARM Prewarm app success: %@", buf, 0xCu);
      }
      if (v14)
      {
        v21 = _NSConcreteStackBlock;
        v22 = 3221225472;
        v23 = sub_1000A25A4;
        v24 = &unk_10015E598;
        v25 = v13;
        objc_msgSend(v25, "monitorForDeath:", &v21);
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[_APRSPrewarmInterface sharedInstance](_APRSPrewarmInterface, "sharedInstance", v21, v22, v23, v24));
        objc_msgSend(v18, "appendPrewarmAssertion:withAssertion:", v4, v14);

      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[_APRSMetricRecorder sharedInstance](_APRSMetricRecorder, "sharedInstance"));
      objc_msgSend(v19, "startLoggingForApp:pid:forEvent:", v4, objc_msgSend(v13, "pid"), 0);

    }
    else if (v17)
    {
      *(_DWORD *)buf = 138412546;
      v30 = v4;
      v31 = 2112;
      v32 = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "DASDPREWARM Encountered error launching %@: %@", buf, 0x16u);
    }
    v6 = v15;

  }
  return v6;
}

- (void)prewarmLaunchAppsFromTimeline:(id)a3
{
  id v4;
  void *v5;
  NSObject *log;
  __int128 v7;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;

  v4 = a3;
  if ((objc_msgSend(v4, "isUnavailable") & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[_APRSPrewarmRecommendation evaluateRecommendationsFromTimeline:](_APRSPrewarmRecommendation, "evaluateRecommendationsFromTimeline:", v4));
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "DASDPREWARM prewarm choice list: %@", buf, 0xCu);
    }
    v8 = 0;
    *(_QWORD *)&v7 = 138412290;
    v17 = v7;
    do
    {
      if (v8 >= (unint64_t)objc_msgSend(v5, "count", v17))
        break;
      v9 = self->_log;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = v9;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v8));
        *(_DWORD *)buf = v17;
        v19 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "DASDPREWARM Prewarm app attempt: %@", buf, 0xCu);

      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v8));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModelApplicationUsage prewarmLaunchAppFromBundleID:](self, "prewarmLaunchAppFromBundleID:", v12));

      if (!v13)
      {
        v14 = self->_log;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = v14;
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v8));
          *(_DWORD *)buf = v17;
          v19 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "DASDPREWARM Prewarm of %@ succeeded", buf, 0xCu);

        }
      }

      ++v8;
    }
    while (v8 != 3);

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
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  void *v15;

  v3 = objc_autoreleasePoolPush();
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams appUsageStream](_DKSystemEventStreams, "appUsageStream"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DKPredictionQuery topNPredictionQueryForStream:withPredicate:withTopN:withMinLikelihood:](_DKPredictionQuery, "topNPredictionQueryForStream:withPredicate:withTopN:withMinLikelihood:", v4, 0, 50, 0.0));

  objc_msgSend(v5, "setSlotDuration:", 7200);
  objc_msgSend(v5, "setMinimumDaysOfHistory:", 1);
  knowledgeStore = self->_knowledgeStore;
  v13 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DKKnowledgeQuerying executeQuery:error:](knowledgeStore, "executeQuery:error:", v5, &v13));
  v8 = v13;
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
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Updating timeline: %@", buf, 0xCu);
  }
  if (_os_feature_enabled_impl("DAS", "prewarm_apps") && !self->_prewarmDisabled)
  {
    v12 = self->_log;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "prewarm_app feature flag enabled", buf, 2u);
    }
    -[_DASSwapModelApplicationUsage prewarmLaunchAppsFromTimeline:](self, "prewarmLaunchAppsFromTimeline:", v7);
  }
  else
  {
    v11 = self->_log;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      sub_1000E9698(v11);
  }
  -[_DASSwapModelApplicationUsage convertTimelineToApplicationDictionaries:](self, "convertTimelineToApplicationDictionaries:", v7);

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
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModelApplicationUsage transitionDate](self, "transitionDate"));
  objc_msgSend(v6, "timeIntervalSinceDate:", v8);
  v10 = v9;

  if (v10 <= 0.0)
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModelApplicationUsage currentProbabilities](self, "currentProbabilities"));
  else
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModelApplicationUsage nextProbabilities](self, "nextProbabilities"));
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v7));

  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  return v15;
}

- (id)scoresForAllApplicationsAtDate:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModelApplicationUsage transitionDate](self, "transitionDate"));
  objc_msgSend(v4, "timeIntervalSinceDate:", v5);
  v7 = v6;

  if (v7 <= 0.0)
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModelApplicationUsage currentProbabilities](self, "currentProbabilities"));
  else
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModelApplicationUsage nextProbabilities](self, "nextProbabilities"));
  return v8;
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_knowledgeStore;
}

- (void)setKnowledgeStore:(id)a3
{
  objc_storeStrong((id *)&self->_knowledgeStore, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (BOOL)prewarmDisabled
{
  return self->_prewarmDisabled;
}

- (void)setPrewarmDisabled:(BOOL)a3
{
  self->_prewarmDisabled = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextProbabilities, 0);
  objc_storeStrong((id *)&self->_transitionDate, 0);
  objc_storeStrong((id *)&self->_currentProbabilities, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
}

@end
