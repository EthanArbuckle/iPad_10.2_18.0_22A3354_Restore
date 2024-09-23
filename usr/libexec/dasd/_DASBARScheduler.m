@implementation _DASBARScheduler

- (void)setMinimumBackgroundFetchInterval:(double)a3 forApp:(id)a4
{
  id v6;
  OS_dispatch_queue *queue;
  id v8;
  _QWORD block[4];
  id v10;
  _DASBARScheduler *v11;
  double v12;

  v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005CE4;
  block[3] = &unk_10015DB68;
  v10 = v6;
  v11 = self;
  v12 = a3;
  v8 = v6;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (id)topNAppsUserHasLaunchedInSet:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  void *j;
  NSObject *log;
  uint64_t v41;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *context;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[4];
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t buf[4];
  uint64_t v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _QWORD v71[2];
  _BYTE v72[128];

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v51 = (void *)os_transaction_create("com.apple.dasd.bar.topNApps");
    v52 = objc_autoreleasePoolPush();
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v64;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v64 != v9)
            objc_enumerationMutation(v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[_DKQuery predicateForEventsWithStringValue:](_DKQuery, "predicateForEventsWithStringValue:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)i)));
          objc_msgSend(v5, "addObject:", v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
      }
      while (v8);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dateByAddingTimeInterval:", -1209600.0));
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[_DKEventQuery predicateForEventsOfMinimumDuration:](_DKEventQuery, "predicateForEventsOfMinimumDuration:", 10.0));
    v71[0] = v49;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v5));
    v71[1] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v71, 2));
    v16 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v15));

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams appInFocusStream](_DKSystemEventStreams, "appInFocusStream"));
    v50 = (void *)v13;
    v18 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v13, v12);
    v48 = (void *)v16;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[_DKHistogramQuery histogramQueryForStream:interval:withPredicate:](_DKHistogramQuery, "histogramQueryForStream:interval:withPredicate:", v17, v18, v16));

    context = objc_autoreleasePoolPush();
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[_DKKnowledgeQuerying executeQuery:error:](self->_knowledgeStore, "executeQuery:error:", v19, 0));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "countDictionary"));

    if (!v21)
      v21 = &__NSDictionary0__struct;
    if ((unint64_t)objc_msgSend(v21, "count") > 0x32)
    {
      v44 = v19;
      v45 = v12;
      v46 = v4;
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "allKeys"));
      v26 = objc_msgSend(v25, "mutableCopy");

      v61[0] = _NSConcreteStackBlock;
      v61[1] = 3221225472;
      v61[2] = sub_10008BA50;
      v61[3] = &unk_10015E090;
      v43 = v21;
      v62 = v21;
      objc_msgSend(v26, "sortUsingComparator:", v61);
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v28 = v26;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
      if (v29)
      {
        v30 = v29;
        v31 = 0;
        v32 = *(_QWORD *)v58;
LABEL_16:
        v33 = 0;
        while (1)
        {
          if (*(_QWORD *)v58 != v32)
            objc_enumerationMutation(v28);
          v34 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v33);
          if (objc_msgSend(v6, "containsObject:", v34))
          {
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "dk_dedup"));
            objc_msgSend(v27, "addObject:", v35);

            if (++v31 == 50)
              break;
          }
          if (v30 == (id)++v33)
          {
            v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
            if (v30)
              goto LABEL_16;
            break;
          }
        }
      }

      v23 = objc_msgSend(v27, "mutableCopy");
      v12 = v45;
      v4 = v46;
      v21 = v43;
      v19 = v44;
    }
    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "allKeys"));
      v23 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v22));

      objc_msgSend(v23, "intersectSet:", v6);
    }

    objc_autoreleasePoolPop(context);
    objc_autoreleasePoolPop(v52);
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v24 = v23;
    v36 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v53, v69, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v54;
      do
      {
        for (j = 0; j != v37; j = (char *)j + 1)
        {
          if (*(_QWORD *)v54 != v38)
            objc_enumerationMutation(v24);
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
          {
            v41 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)j);
            *(_DWORD *)buf = 138412290;
            v68 = v41;
            _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "User has launched: %@", buf, 0xCu);
          }
        }
        v37 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v53, v69, 16);
      }
      while (v37);
    }

  }
  else
  {
    v24 = v4;
  }

  return v24;
}

- (id)queueAppsWithDelaySpecifiedInSet:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  NSObject *log;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  _BYTE v22[128];

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_msgSend(v4, "mutableCopy");
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v15 = v4;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_appToMinimumLaunchDelay, "valueForKey:", v11));

          if (!v12)
          {
            log = self->_log;
            if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v21 = v11;
              _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "No delay specified for %@", buf, 0xCu);
            }
            objc_msgSend(v5, "removeObject:", v11);
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      }
      while (v8);
    }

    v4 = v15;
  }
  else
  {
    v5 = v4;
  }

  return v5;
}

- (void)queueHandleAppsRevived:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  __int128 v8;
  void *v9;
  id v10;
  char v11;
  uint64_t v12;
  void *i;
  void *v14;
  NSObject *log;
  void *v16;
  NSUserDefaults *killedAppPreferences;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  _BYTE v25[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  v9 = v6;
  if (!v7)
    goto LABEL_14;
  v10 = v7;
  v11 = 0;
  v12 = *(_QWORD *)v20;
  *(_QWORD *)&v8 = 138412290;
  v18 = v8;
  do
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(_QWORD *)v20 != v12)
        objc_enumerationMutation(v6);
      v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
      if (-[NSMutableSet containsObject:](self->_killedApps, "containsObject:", v14, v18, (_QWORD)v19))
      {
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v18;
          v24 = v14;
          _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "App revived: %@", buf, 0xCu);
        }
        -[NSMutableSet removeObject:](self->_killedApps, "removeObject:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dk_dedup"));
        objc_msgSend(v5, "addObject:", v16);

        v11 = 1;
      }
    }
    v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  }
  while (v10);

  if ((v11 & 1) != 0)
  {
    killedAppPreferences = self->_killedAppPreferences;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_killedApps, "allObjects"));
    -[NSUserDefaults setObject:forKey:](killedAppPreferences, "setObject:forKey:", v9, CFSTR("killed"));
LABEL_14:

  }
}

- (void)queueUpdateLastLaunchTimesToDate:(id)a3 forApps:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  NSObject *log;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  _BYTE v28[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults dictionaryForKey:](self->_lastLaunchPreferences, "dictionaryForKey:", CFSTR("launches")));
  v19 = v8;
  if (v8)
    v9 = objc_msgSend(v8, "mutableCopy");
  else
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v10 = v9;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        if (-[NSMutableSet containsObject:](self->_fetchEnabledApps, "containsObject:", v16))
        {
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v25 = v11;
            v26 = 2112;
            v27 = v6;
            _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Updating last launch time for %@ to %@", buf, 0x16u);
          }
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "dk_dedup"));
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v6, v18);

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v13);
  }

  -[NSUserDefaults setObject:forKey:](self->_lastLaunchPreferences, "setObject:forKey:", v10, CFSTR("launches"));
}

- (void)queueScheduleActivitiesForEligibleApps:(id)a3 withDelay:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v6 = a3;
  v17 = (void *)os_transaction_create("com.apple.dasd.bar.scheduleEligibleApps");
  v18 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBARScheduler queueAppsEligibleForBackgroundFetchInSet:](self, "queueAppsEligibleForBackgroundFetchInSet:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v13);
        if (a4)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_appToMinimumLaunchDelay, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v13)));
          objc_msgSend(v15, "doubleValue");
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dateByAddingTimeInterval:"));
          -[_DASBARScheduler queueScheduleActivityForApp:startingAfter:](self, "queueScheduleActivityForApp:startingAfter:", v14, v16);

        }
        else
        {
          -[_DASBARScheduler queueScheduleActivityForApp:startingAfter:](self, "queueScheduleActivityForApp:startingAfter:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v13), v8);
        }
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

}

- (void)queueCancelActivitiesForApps:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  OS_dispatch_queue *schedulingQueue;
  id v14;
  _QWORD v15[4];
  id v16;
  _DASBARScheduler *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_appsToPendingTasks, "objectForKeyedSubscript:", v11));
        if (v12)
        {
          objc_msgSend(v5, "addObject:", v12);
          -[NSMutableDictionary removeObjectForKey:](self->_appsToPendingTasks, "removeObjectForKey:", v11);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  schedulingQueue = self->_schedulingQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100007BC4;
  v15[3] = &unk_10015D558;
  v16 = v5;
  v17 = self;
  v14 = v5;
  dispatch_async((dispatch_queue_t)schedulingQueue, v15);

}

- (void)handleAppsForegrounded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  OS_dispatch_queue *queue;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  _DASBARScheduler *v16;
  id v17;
  id v18;
  id v19;

  v4 = a3;
  v5 = (void *)os_transaction_create("com.apple.dasd.bar.appFG");
  v6 = objc_autoreleasePoolPush();
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000929C;
  block[3] = &unk_10015DD00;
  v10 = v5;
  v15 = v10;
  v16 = self;
  v13 = v4;
  v17 = v13;
  v18 = v8;
  v19 = v7;
  v11 = v7;
  v12 = v8;
  dispatch_sync((dispatch_queue_t)queue, block);

  objc_autoreleasePoolPop(v6);
}

- (BOOL)backgroundLaunchAllowedForBGTaskActivity:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  unsigned __int8 v24;
  NSObject *log;
  NSObject *v26;
  void *v27;
  void *v28;
  BOOL v29;
  void *v30;
  unsigned __int8 v31;
  void *v32;
  unsigned int v33;
  unsigned __int8 v34;
  void *v35;
  void *v36;
  unsigned __int8 v37;
  int v39;
  void *v40;
  __int16 v41;
  void *v42;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "launchReason"));
  v6 = _DASLaunchReasonBackgroundProcessing;
  if ((objc_msgSend(v5, "isEqualToString:", _DASLaunchReasonBackgroundProcessing) & 1) != 0)
    goto LABEL_4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "launchReason"));
  if (objc_msgSend(v7, "isEqualToString:", _DASLaunchReasonHealthResearch))
  {

LABEL_4:
    goto LABEL_5;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "launchReason"));
  v24 = objc_msgSend(v23, "isEqualToString:", _DASLaunchReasonBackgroundRefresh);

  if ((v24 & 1) != 0)
  {
LABEL_5:
    v8 = (void *)os_transaction_create("com.apple.dasd.backgroundLaunchAllowedForBGTask");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "relatedApplications"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));

    v11 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", v10, 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "applicationState"));
    v13 = objc_msgSend(v12, "isValid");

    if ((v13 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
        sub_1000E74B0();
      goto LABEL_33;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "applicationState"));
    v15 = objc_msgSend(v14, "isInstalled");

    if ((v15 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
        sub_1000E742C();
      goto LABEL_33;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "launchReason"));
    v17 = _DASLaunchReasonHealthResearch;
    if ((objc_msgSend(v16, "isEqualToString:", _DASLaunchReasonHealthResearch) & 1) != 0
      || (objc_msgSend(v4, "isContactTracingBackgroundActivity") & 1) != 0)
    {

    }
    else
    {
      v31 = -[_DASBARScheduler backgroundLaunchAllowedForApp:](self, "backgroundLaunchAllowedForApp:", v10);

      if ((v31 & 1) == 0)
      {
        if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
          sub_1000E73A8();
        goto LABEL_33;
      }
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "launchReason"));
    v19 = objc_msgSend(v18, "isEqualToString:", _DASLaunchReasonBackgroundRefresh);

    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UIBackgroundModes"));
      v21 = v20;
      v22 = CFSTR("fetch");
    }
    else
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "launchReason"));
      if (objc_msgSend(v30, "isEqualToString:", v6))
      {

      }
      else
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "launchReason"));
        v33 = objc_msgSend(v32, "isEqualToString:", v17);

        if (!v33)
        {
LABEL_31:
          if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
            sub_1000E7324();
LABEL_33:
          v29 = 0;
LABEL_34:

          goto LABEL_35;
        }
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UIBackgroundModes"));
      v21 = v20;
      v22 = CFSTR("processing");
    }
    v34 = objc_msgSend(v20, "containsObject:", v22);

    if ((v34 & 1) != 0)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clientProvidedIdentifier"));
      if (v35
        && (v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "backgroundTaskSchedulerPermittedIdentifiers")),
            v37 = objc_msgSend(v36, "containsObject:", v35),
            v36,
            (v37 & 1) != 0))
      {
        v29 = 1;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
          sub_1000E72A0();
        v29 = 0;
      }

      goto LABEL_34;
    }
    goto LABEL_31;
  }
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v26 = log;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "launchReason"));
    v39 = 138543618;
    v40 = v27;
    v41 = 2114;
    v42 = v28;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Activity %{public}@ launch reason %{public}@ is not a BGTask reason. Allowing background launch.", (uint8_t *)&v39, 0x16u);

  }
  v29 = 1;
LABEL_35:

  return v29;
}

- (BOOL)backgroundLaunchAllowedForApp:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004B74;
  block[3] = &unk_10015DB40;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
  LOBYTE(queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (id)queueAppsEligibleForBackgroundFetchInSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v4, "intersectSet:", self->_fetchEnabledApps);
  objc_msgSend(v4, "minusSet:", self->_killedApps);
  objc_msgSend(v4, "minusSet:", self->_disallowedApps);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBARScheduler queueAppsWithDelaySpecifiedInSet:](self, "queueAppsWithDelaySpecifiedInSet:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBARScheduler topNAppsUserHasLaunchedInSet:](self, "topNAppsUserHasLaunchedInSet:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v12), "dk_dedup", (_QWORD)v15));
        objc_msgSend(v7, "addObject:", v13);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v7;
}

- (_DASBARScheduler)initWithScheduler:(id)a3
{
  id v5;
  id v6;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  void *v10;
  dispatch_queue_attr_t v11;
  NSObject *v12;
  dispatch_queue_t v13;
  void *v14;
  dispatch_source_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  objc_super v47;

  v5 = a3;
  v47.receiver = self;
  v47.super_class = (Class)_DASBARScheduler;
  v6 = -[_DASBARScheduler init](&v47, "init");
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create("com.apple.backgroundAppRefresh.syncQueue", v8);
    v10 = (void *)*((_QWORD *)v6 + 4);
    *((_QWORD *)v6 + 4) = v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = dispatch_queue_create("com.apple.backgroundAppRefresh.schedulingQueue", v12);
    v14 = (void *)*((_QWORD *)v6 + 5);
    *((_QWORD *)v6 + 5) = v13;

    v15 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *((dispatch_queue_t *)v6 + 4));
    v16 = (void *)*((_QWORD *)v6 + 6);
    *((_QWORD *)v6 + 6) = v15;

    dispatch_set_qos_class_fallback(*((_QWORD *)v6 + 6), 17);
    objc_storeStrong((id *)v6 + 7, a3);
    v17 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v18 = (void *)*((_QWORD *)v6 + 22);
    *((_QWORD *)v6 + 22) = v17;

    v19 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar")));
    v20 = (void *)*((_QWORD *)v6 + 23);
    *((_QWORD *)v6 + 23) = v19;

    v21 = objc_claimAutoreleasedReturnValue(+[_DASPredictionManager sharedKnowledgeStore](_DASPredictionManager, "sharedKnowledgeStore"));
    v22 = (void *)*((_QWORD *)v6 + 3);
    *((_QWORD *)v6 + 3) = v21;

    v23 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v24 = (void *)*((_QWORD *)v6 + 13);
    *((_QWORD *)v6 + 13) = v23;

    v25 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v26 = (void *)*((_QWORD *)v6 + 14);
    *((_QWORD *)v6 + 14) = v25;

    v27 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v28 = (void *)*((_QWORD *)v6 + 15);
    *((_QWORD *)v6 + 15) = v27;

    v29 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v30 = (void *)*((_QWORD *)v6 + 18);
    *((_QWORD *)v6 + 18) = v29;

    v31 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v32 = (void *)*((_QWORD *)v6 + 19);
    *((_QWORD *)v6 + 19) = v31;

    v33 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v34 = (void *)*((_QWORD *)v6 + 16);
    *((_QWORD *)v6 + 16) = v33;

    v35 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v36 = (void *)*((_QWORD *)v6 + 17);
    *((_QWORD *)v6 + 17) = v35;

    v37 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.mt"));
    v38 = (void *)*((_QWORD *)v6 + 9);
    *((_QWORD *)v6 + 9) = v37;

    v39 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.mt.launchDelay"));
    v40 = (void *)*((_QWORD *)v6 + 10);
    *((_QWORD *)v6 + 10) = v39;

    v41 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.mt.lastLaunch"));
    v42 = (void *)*((_QWORD *)v6 + 11);
    *((_QWORD *)v6 + 11) = v41;

    v43 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.mt.killed"));
    v44 = (void *)*((_QWORD *)v6 + 12);
    *((_QWORD *)v6 + 12) = v43;

    objc_msgSend(v6, "registerForAppKilledNotifications");
    objc_msgSend(v6, "reloadRequestedDelays");
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    objc_msgSend(v45, "addObserver:", v6);

  }
  return (_DASBARScheduler *)v6;
}

+ (id)barSchedulerWithScheduler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1)), "initWithScheduler:", v4);

  return v5;
}

- (void)dealloc
{
  int barSettingsChangedToken;
  objc_super v4;

  barSettingsChangedToken = self->_barSettingsChangedToken;
  if (barSettingsChangedToken)
    notify_cancel(barSettingsChangedToken);
  v4.receiver = self;
  v4.super_class = (Class)_DASBARScheduler;
  -[_DASBARScheduler dealloc](&v4, "dealloc");
}

- (id)queueObtainAppsEligibleForBackgroundFetch
{
  void *v3;
  NSObject *log;
  int v6;
  void *v7;

  -[_DASBARScheduler determineAppsWithBackgroundRunningModes](self, "determineAppsWithBackgroundRunningModes");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBARScheduler queueAppsEligibleForBackgroundFetchInSet:](self, "queueAppsEligibleForBackgroundFetchInSet:", self->_fetchEnabledApps));
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Apps Eligible: %@", (uint8_t *)&v6, 0xCu);
  }
  return v3;
}

- (void)determineAppsWithBackgroundRunningModes
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableSet **p_fetchEnabledApps;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *context;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *log;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v24 = (void *)os_transaction_create("com.apple.dasd.bar.appsWithBGRunningModes");
  context = objc_autoreleasePoolPush();
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationRecord enumeratorWithOptions:](LSApplicationRecord, "enumeratorWithOptions:", 0));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nextObject"));
  if (v4)
  {
    v5 = (void *)v4;
    v25 = v3;
    while (1)
    {
      v6 = objc_autoreleasePoolPush();
      if ((objc_msgSend(v5, "isLaunchProhibited") & 1) == 0)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "applicationState"));
        v8 = objc_msgSend(v7, "isRestricted");

        if ((v8 & 1) == 0)
          break;
      }
LABEL_23:
      objc_autoreleasePoolPop(v6);
      v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nextObject"));

      v5 = (void *)v22;
      if (!v22)
        goto LABEL_24;
    }
    v26 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UIBackgroundModes"));
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (!v10)
      goto LABEL_22;
    v11 = v10;
    v12 = *(_QWORD *)v31;
LABEL_7:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v31 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v13);
      if (objc_msgSend(v14, "isEqualToString:", CFSTR("fetch"))
        && !-[_DASBARScheduler appUsesBackgroundTaskScheduler:](self, "appUsesBackgroundTaskScheduler:", v5))
      {
        v19 = self->_log;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          log = v19;
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedName"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));
          *(_DWORD *)buf = 138412546;
          v35 = v27;
          v36 = 2112;
          v37 = v21;
          _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%@ (%@) eligible for BAR", buf, 0x16u);

        }
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "dk_dedup"));

        objc_msgSend(v29, "addObject:", v16);
        p_fetchEnabledApps = &self->_fetchEnabledApps;
        goto LABEL_19;
      }
      if (objc_msgSend(v14, "isEqualToString:", CFSTR("remote-notification")))
        break;
      if (objc_msgSend(v14, "isEqualToString:", CFSTR("newsstand")))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "dk_dedup"));

        p_fetchEnabledApps = &self->_newsstandApps;
        goto LABEL_19;
      }
LABEL_20:
      if (v11 == (id)++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        if (!v11)
        {
LABEL_22:

          v3 = v25;
          v6 = v26;
          goto LABEL_23;
        }
        goto LABEL_7;
      }
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dk_dedup"));

    p_fetchEnabledApps = &self->_pushEnabledApps;
LABEL_19:
    -[NSMutableSet addObject:](*p_fetchEnabledApps, "addObject:", v16);

    goto LABEL_20;
  }
LABEL_24:

  objc_autoreleasePoolPop(context);
}

- (BOOL)isBAREnabledOnWiFiOnly
{
  void *v3;
  void *v4;

  v3 = (void *)os_transaction_create("com.apple.dasd.bar.settings");
  v4 = objc_autoreleasePoolPush();
  LOBYTE(self) = -[NSUserDefaults BOOLForKey:](self->_barPreferences, "BOOLForKey:", CFSTR("WiFiOnly"));
  objc_autoreleasePoolPop(v4);

  return (char)self;
}

- (void)queueHandleBARSettingsChangedNotification:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  unsigned int v7;
  int v8;
  NSObject *v10;
  NSObject *v11;
  char v13;
  int barWiFiOnly;
  NSObject *log;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  _BOOL8 v28;
  void *v29;
  NSObject *v30;
  NSMutableDictionary *appsToPendingTasks;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  const __CFString *v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  NSObject *v43;
  const __CFString *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[4];
  id v60;
  id v61;
  uint8_t v62[128];
  uint8_t buf[4];
  uint64_t v64;
  __int16 v65;
  const __CFString *v66;
  _BYTE v67[128];

  v3 = a3;
  v5 = (void *)os_transaction_create("com.apple.dasd.bar.settingsChanged");
  v6 = objc_autoreleasePoolPush();
  v7 = -[_DASBARScheduler isBAREnabledOnWiFiOnly](self, "isBAREnabledOnWiFiOnly");
  v8 = v7;
  if (self->_barEnabled || !v3)
  {
    if (!self->_barEnabled || v3)
    {
      v13 = !self->_barEnabled || !v3;
      if ((v13 & 1) == 0)
      {
        barWiFiOnly = self->_barWiFiOnly;
        if (barWiFiOnly != v7)
        {
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
            sub_1000E6E74(v8, log);
          self->_barWiFiOnly = v8;
        }
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults dictionaryForKey:](self->_barPreferences, "dictionaryForKey:", CFSTR("KeepAppsUpToDateAppList")));
        v17 = objc_msgSend(v16, "mutableCopy");

        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
        v59[0] = _NSConcreteStackBlock;
        v59[1] = 3221225472;
        v59[2] = sub_10008C0FC;
        v59[3] = &unk_10015EAA8;
        v19 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
        v60 = v19;
        v20 = v18;
        v61 = v20;
        objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v59);
        if (objc_msgSend(v20, "count"))
        {
          if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
            sub_1000E6E14();
          -[_DASBARScheduler queueCancelActivitiesForApps:](self, "queueCancelActivitiesForApps:", v20);
          -[_DASDaemon cancelPushLaunchTasksForApps:](self->_scheduler, "cancelPushLaunchTasksForApps:", v20);
          -[_DASDaemon cancelBackgroundTasksForApps:](self->_scheduler, "cancelBackgroundTasksForApps:", v20);
          -[NSMutableSet unionSet:](self->_disallowedApps, "unionSet:", v20);
        }
        if (objc_msgSend(v19, "count"))
        {
          if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
            sub_1000E6DB4();
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBARScheduler queuePendingRefreshes](self, "queuePendingRefreshes"));
          objc_msgSend(v19, "minusSet:", v21);
          -[NSMutableSet minusSet:](self->_disallowedApps, "minusSet:", v19);
          -[_DASBARScheduler queueScheduleActivitiesForEligibleApps:withDelay:](self, "queueScheduleActivitiesForEligibleApps:withDelay:", v19, 1);

        }
        if (barWiFiOnly != v8)
        {
          v46 = v20;
          v47 = v19;
          v48 = v17;
          v49 = v6;
          v50 = v5;
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBARScheduler queuePendingRefreshes](self, "queuePendingRefreshes"));
          v55 = 0u;
          v56 = 0u;
          v57 = 0u;
          v58 = 0u;
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
          if (v23)
          {
            v24 = v23;
            v25 = *(_QWORD *)v56;
            do
            {
              v26 = 0;
              do
              {
                if (*(_QWORD *)v56 != v25)
                  objc_enumerationMutation(v22);
                v27 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)v26);
                v28 = self->_barWiFiOnly;
                v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_appsToPendingTasks, "objectForKeyedSubscript:", v27));
                objc_msgSend(v29, "setRequiresInexpensiveNetworking:", v28);

                v30 = self->_log;
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
                {
                  appsToPendingTasks = self->_appsToPendingTasks;
                  v32 = v30;
                  v33 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](appsToPendingTasks, "objectForKeyedSubscript:", v27));
                  v34 = (void *)v33;
                  v35 = CFSTR("requires");
                  if (!self->_barWiFiOnly)
                    v35 = CFSTR("does not require");
                  *(_DWORD *)buf = 138412546;
                  v64 = v33;
                  v65 = 2112;
                  v66 = v35;
                  _os_log_debug_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "Activity %@ now %@ inexepensive networking", buf, 0x16u);

                }
                v26 = (char *)v26 + 1;
              }
              while (v24 != v26);
              v36 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
              v24 = v36;
            }
            while (v36);
          }
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon allPendingPushLaunchTasks](self->_scheduler, "allPendingPushLaunchTasks"));
          v51 = 0u;
          v52 = 0u;
          v53 = 0u;
          v54 = 0u;
          v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
          if (v38)
          {
            v39 = v38;
            v40 = *(_QWORD *)v52;
            do
            {
              v41 = 0;
              do
              {
                if (*(_QWORD *)v52 != v40)
                  objc_enumerationMutation(v37);
                v42 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)v41);
                objc_msgSend(v42, "setRequiresInexpensiveNetworking:", self->_barWiFiOnly);
                v43 = self->_log;
                if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
                {
                  v44 = CFSTR("requires");
                  if (!self->_barWiFiOnly)
                    v44 = CFSTR("does not require");
                  *(_DWORD *)buf = 138412546;
                  v64 = (uint64_t)v42;
                  v65 = 2112;
                  v66 = v44;
                  _os_log_debug_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "Activity %@ now %@ inexepensive networking", buf, 0x16u);
                }
                v41 = (char *)v41 + 1;
              }
              while (v39 != v41);
              v45 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
              v39 = v45;
            }
            while (v45);
          }

          v6 = v49;
          v5 = v50;
          v19 = v47;
          v17 = v48;
          v20 = v46;
        }

      }
    }
    else
    {
      v10 = self->_log;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "BAR now disabled", buf, 2u);
      }
      self->_barEnabled = 0;
      -[_DASBARScheduler queueCancelActivitiesForAllApps](self, "queueCancelActivitiesForAllApps");
      -[_DASDaemon cancelAllBackgroundTasks](self->_scheduler, "cancelAllBackgroundTasks");
      dispatch_suspend((dispatch_object_t)self->_appUpdateTimer);
    }
  }
  else
  {
    v11 = self->_log;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "BAR now enabled", buf, 2u);
    }
    self->_barEnabled = 1;
    self->_barWiFiOnly = v8;
    -[_DASBARScheduler queueStartIfBAREnabled](self, "queueStartIfBAREnabled");
  }
  -[_DASBARScheduler recordBARState](self, "recordBARState");
  objc_autoreleasePoolPop(v6);

}

- (void)registerForBARNotifications
{
  void *v3;
  void *v4;
  OS_dispatch_queue *queue;
  id v6;
  const char *v7;
  OS_dispatch_queue *v8;
  _QWORD handler[5];
  _QWORD block[4];
  id v11;
  _DASBARScheduler *v12;

  v3 = objc_autoreleasePoolPush();
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults dictionaryForKey:](self->_barPreferences, "dictionaryForKey:", CFSTR("KeepAppsUpToDateAppList")));
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008C26C;
  block[3] = &unk_10015D558;
  v11 = v4;
  v12 = self;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);

  objc_autoreleasePoolPop(v3);
  v7 = (const char *)objc_msgSend(CFSTR("kKeepAppsUpToDateEnabledChangedNotification"), "UTF8String");
  v8 = self->_queue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10008C360;
  handler[3] = &unk_10015D9B8;
  handler[4] = self;
  notify_register_dispatch(v7, &self->_barSettingsChangedToken, (dispatch_queue_t)v8, handler);
  -[_DASBARScheduler recordBARState](self, "recordBARState");
}

- (void)registerForAppKilledNotifications
{
  OS_dispatch_queue *queue;
  SBSApplicationUserQuitMonitor *v4;
  SBSApplicationUserQuitMonitor *quitMonitor;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008C42C;
  block[3] = &unk_10015D4E0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
  v4 = (SBSApplicationUserQuitMonitor *)objc_msgSend(objc_alloc((Class)SBSApplicationUserQuitMonitor), "initWithDelegate:", self);
  quitMonitor = self->_quitMonitor;
  self->_quitMonitor = v4;

}

- (void)queueHandleAppKilled:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSUserDefaults *killedAppPreferences;
  void *v8;
  OS_dispatch_queue *schedulingQueue;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
    sub_1000E6FB4();
  if ((-[NSMutableSet containsObject:](self->_killedApps, "containsObject:", v4) & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_dedup"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v5));

    -[NSMutableSet unionSet:](self->_killedApps, "unionSet:", v6);
    killedAppPreferences = self->_killedAppPreferences;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_killedApps, "allObjects"));
    -[NSUserDefaults setObject:forKey:](killedAppPreferences, "setObject:forKey:", v8, CFSTR("killed"));

    -[_DASBARScheduler queueCancelActivitiesForApps:](self, "queueCancelActivitiesForApps:", v6);
    schedulingQueue = self->_schedulingQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10008C6B4;
    v11[3] = &unk_10015D558;
    v11[4] = self;
    v12 = v6;
    v10 = v6;
    dispatch_async((dispatch_queue_t)schedulingQueue, v11);

  }
}

- (void)queueHandleAppsKilled:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  char v8;
  void *i;
  void *v10;
  NSMutableSet *killedApps;
  void *v12;
  NSUserDefaults *killedAppPreferences;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    v8 = 1;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if ((-[NSMutableSet containsObject:](self->_killedApps, "containsObject:", v10) & 1) == 0)
        {
          killedApps = self->_killedApps;
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dk_dedup"));
          -[NSMutableSet addObject:](killedApps, "addObject:", v12);

          v8 = 0;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
    if ((v8 & 1) == 0)
    {
      killedAppPreferences = self->_killedAppPreferences;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_killedApps, "allObjects"));
      -[NSUserDefaults setObject:forKey:](killedAppPreferences, "setObject:forKey:", v14, CFSTR("killed"));

      -[_DASBARScheduler queueCancelActivitiesForApps:](self, "queueCancelActivitiesForApps:", v4);
      -[_DASDaemon cancelAppRefreshTasksForApps:](self->_scheduler, "cancelAppRefreshTasksForApps:", v4);
    }
  }

}

- (void)queueHandleAppsUninstalled:(id)a3
{
  id v4;
  OS_dispatch_queue *schedulingQueue;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  NSUserDefaults *barPreferences;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD block[5];
  id v22;
  _BYTE v23[128];

  v4 = a3;
  -[_DASBARScheduler queueCancelActivitiesForApps:](self, "queueCancelActivitiesForApps:", v4);
  schedulingQueue = self->_schedulingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008CA44;
  block[3] = &unk_10015D558;
  block[4] = self;
  v6 = v4;
  v22 = v6;
  dispatch_async((dispatch_queue_t)schedulingQueue, block);
  -[NSMutableSet minusSet:](self->_fetchEnabledApps, "minusSet:", v6);
  -[NSMutableSet minusSet:](self->_pushEnabledApps, "minusSet:", v6);
  -[NSMutableSet minusSet:](self->_newsstandApps, "minusSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults dictionaryForKey:](self->_barPreferences, "dictionaryForKey:", CFSTR("KeepAppsUpToDateAppList")));
  v8 = objc_msgSend(v7, "mutableCopy");

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        -[NSMutableDictionary removeObjectForKey:](self->_appToMinimumLaunchDelay, "removeObjectForKey:", v14, (_QWORD)v17);
        objc_msgSend(v8, "removeObjectForKey:", v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v11);
  }

  barPreferences = self->_barPreferences;
  v16 = objc_msgSend(v8, "copy");
  -[NSUserDefaults setObject:forKey:](barPreferences, "setObject:forKey:", v16, CFSTR("KeepAppsUpToDateAppList"));

  -[NSUserDefaults setObject:forKey:](self->_delayPreferences, "setObject:forKey:", self->_appToMinimumLaunchDelay, CFSTR("delays"));
  -[_DASBARScheduler queueUpdateLastLaunchTimesToDate:forApps:](self, "queueUpdateLastLaunchTimesToDate:forApps:", 0, v9);
  -[_DASBARScheduler queueHandleAppsRevived:](self, "queueHandleAppsRevived:", v9);

}

- (void)applicationsDidUninstall:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  _DASBARScheduler *v10;

  v4 = a3;
  v7 = (id)os_transaction_create("com.apple.dasd.applicationDidUninstall");
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008CAEC;
  block[3] = &unk_10015D558;
  v9 = v4;
  v10 = self;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)applicationsDidInstall:(id)a3
{
  id v4;
  void *v5;
  OS_dispatch_queue *queue;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  _DASBARScheduler *v12;

  v4 = a3;
  v5 = (void *)os_transaction_create("com.apple.dasd.bar.appsInstalled");
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008CCCC;
  block[3] = &unk_10015D530;
  v10 = v5;
  v11 = v4;
  v12 = self;
  v7 = v4;
  v8 = v5;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (id)appsLaunchedInLastDays:(int)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  _QWORD v23[5];

  v5 = (void *)os_transaction_create("com.apple.dasd.appsLaunchedInLastNDays");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dateByAddingTimeInterval:", (double)(-86400 * a3)));
  objc_msgSend(v10, "timeIntervalSinceReferenceDate");
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[BMStreams appLaunch](BMStreams, "appLaunch"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "publisherFromStartTime:", v12));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "filterWithIsIncluded:", &stru_10015F3C0));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10008D158;
  v23[3] = &unk_10015F3E8;
  v23[4] = self;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10008D1C4;
  v20[3] = &unk_10015DDB0;
  v22 = v9;
  v21 = v6;
  v16 = v6;
  v17 = objc_msgSend(v15, "sinkWithCompletion:receiveInput:", v23, v20);

  v18 = objc_msgSend(v16, "copy");
  return v18;
}

- (void)queue_cancelBackgroundTasksForUnusedApps
{
  void *v3;
  OS_dispatch_queue *schedulingQueue;
  id v5;
  _QWORD block[5];
  id v7;
  _QWORD v8[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBARScheduler appsLaunchedInLastDays:](self, "appsLaunchedInLastDays:", 14));
  -[NSMutableSet removeAllObjects](self->_appsLaunchedInLastFourteenDays, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_appsLaunchedInLastThreeDays, "removeAllObjects");
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10008D3AC;
  v8[3] = &unk_10015D480;
  v8[4] = self;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v8);
  schedulingQueue = self->_schedulingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008D410;
  block[3] = &unk_10015D558;
  block[4] = self;
  v7 = v3;
  v5 = v3;
  dispatch_async((dispatch_queue_t)schedulingQueue, block);

}

- (id)queuePendingRefreshes
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_appsToPendingTasks, "allKeys"));
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  return v3;
}

- (void)queueCancelActivitiesForAllApps
{
  void *v3;
  OS_dispatch_queue *schedulingQueue;
  id v5;
  _QWORD v6[4];
  id v7;
  _DASBARScheduler *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_appsToPendingTasks, "allValues"));
  -[NSMutableDictionary removeAllObjects](self->_appsToPendingTasks, "removeAllObjects");
  schedulingQueue = self->_schedulingQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10008D650;
  v6[3] = &unk_10015D558;
  v7 = v3;
  v8 = self;
  v5 = v3;
  dispatch_async((dispatch_queue_t)schedulingQueue, v6);

}

- (void)cancelActivitiesForAllApps
{
  OS_dispatch_queue *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008D7A8;
  block[3] = &unk_10015D4E0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)queueScheduleActivityForApp:(id)a3 startingAfter:(id)a4
{
  id v6;
  id v7;
  NSObject *log;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  OS_dispatch_queue *schedulingQueue;
  id v21;
  _QWORD block[5];
  id v23;
  _QWORD v24[5];
  id v25;
  uint8_t buf[4];
  id v27;

  v6 = a3;
  v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v6;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Scheduling refresh for %@", buf, 0xCu);
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.purplebuddy")))
  {
    v9 = self->_log;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000E70A8(v9, v10, v11);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_appToMinimumLaunchDelay, "objectForKeyedSubscript:", v6));

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), CFSTR("com.apple.fetch."), v6));
      v14 = _DASSchedulingPriorityBackground;
      v15 = _DASLaunchReasonBackgroundFetch;
      v16 = _DASActivityDurationVeryShort;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dateByAddingTimeInterval:", 86400.0));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivity applicationLaunchActivityWithName:priority:forApplication:withReason:duration:startingAfter:startingBefore:](_DASActivity, "applicationLaunchActivityWithName:priority:forApplication:withReason:duration:startingAfter:startingBefore:", v13, v14, v6, v15, v16, v7, v17));

      objc_msgSend(v18, "setShouldBePersisted:", 0);
      objc_msgSend(v18, "setRequiresNetwork:", 1);
      objc_msgSend(v18, "setRequiresInexpensiveNetworking:", self->_barWiFiOnly);
      objc_msgSend(v18, "setTransferSize:", _DASActivityTransferSizeSmall);
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10008DA58;
      v24[3] = &unk_10015F438;
      v24[4] = self;
      v19 = v6;
      v25 = v19;
      objc_msgSend(v18, "setStartHandler:", v24);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_appsToPendingTasks, "setObject:forKeyedSubscript:", v18, v19);
      schedulingQueue = self->_schedulingQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10008DBB0;
      block[3] = &unk_10015D558;
      block[4] = self;
      v23 = v18;
      v21 = v18;
      dispatch_async((dispatch_queue_t)schedulingQueue, block);

    }
  }

}

- (void)createBARApplicationGroup
{
  _DASActivityGroup *v3;
  _DASActivityGroup *barGroup;
  OS_dispatch_queue *schedulingQueue;
  _QWORD block[5];

  v3 = (_DASActivityGroup *)objc_claimAutoreleasedReturnValue(+[_DASActivityGroup groupWithName:maxConcurrent:](_DASActivityGroup, "groupWithName:maxConcurrent:", CFSTR("com.apple.backgroundAppRefresh"), 3));
  barGroup = self->_barGroup;
  self->_barGroup = v3;

  schedulingQueue = self->_schedulingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008DC44;
  block[3] = &unk_10015D4E0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)schedulingQueue, block);
}

- (void)queueStartIfBAREnabled
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *appUpdateTimer;
  dispatch_time_t v11;
  NSObject *v12;
  _QWORD handler[5];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  -[_DASBARScheduler queueReloadRequestedDelays](self, "queueReloadRequestedDelays");
  -[_DASBARScheduler createBARApplicationGroup](self, "createBARApplicationGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBARScheduler queueObtainAppsEligibleForBackgroundFetch](self, "queueObtainAppsEligibleForBackgroundFetch"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        -[_DASBARScheduler queueScheduleActivityForApp:startingAfter:](self, "queueScheduleActivityForApp:startingAfter:", v8, v9);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }
  appUpdateTimer = self->_appUpdateTimer;
  v11 = dispatch_walltime(0, 1000000000);
  dispatch_source_set_timer(appUpdateTimer, v11, 0x9D29229E000uLL, 0x19254D3800uLL);
  v12 = self->_appUpdateTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10008DDFC;
  handler[3] = &unk_10015D4E0;
  handler[4] = self;
  dispatch_source_set_event_handler(v12, handler);
  dispatch_resume((dispatch_object_t)self->_appUpdateTimer);

}

- (void)startIfBAREnabled
{
  OS_dispatch_queue *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008DFBC;
  block[3] = &unk_10015D4E0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)recordBARState
{
  uint64_t v2;

  if (self->_barEnabled)
  {
    if (self->_barWiFiOnly)
      v2 = 2;
    else
      v2 = 3;
  }
  else
  {
    v2 = 1;
  }
  +[_DASMetricRecorder setValue:forKey:](_DASMetricRecorder, "setValue:forKey:", v2, CFSTR("com.apple.dasd.barEnabled"));
}

- (void)start
{
  void *v3;
  void *v4;
  unsigned int v5;
  NSObject *log;
  _BOOL4 v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v3 = objc_autoreleasePoolPush();
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  -[_DASBARScheduler registerForBARNotifications](self, "registerForBARNotifications");
  v5 = objc_msgSend(v4, "isAutomaticAppUpdatesAllowed");
  log = self->_log;
  v7 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "BAR enabled", buf, 2u);
    }
    self->_barEnabled = 1;
    self->_barWiFiOnly = -[_DASBARScheduler isBAREnabledOnWiFiOnly](self, "isBAREnabledOnWiFiOnly");
    -[_DASBARScheduler startIfBAREnabled](self, "startIfBAREnabled");
  }
  else if (v7)
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "BAR disabled", v8, 2u);
  }

  objc_autoreleasePoolPop(v3);
}

- (BOOL)applicationStateRequiresImmediateDelivery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  BOOL v8;
  void *v9;
  NSObject *log;
  id v12;
  uint8_t buf[4];
  id v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessPredicate predicateMatchingBundleIdentifier:](RBSProcessPredicate, "predicateMatchingBundleIdentifier:", v4));
  v12 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessHandle handleForPredicate:error:](RBSProcessHandle, "handleForPredicate:error:", v5, &v12));
  v7 = v12;

  if (v7)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      sub_1000E71DC();
    v8 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentState"));
    if (objc_msgSend(v9, "isDebugging"))
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
        sub_1000E717C();
      v8 = 1;
    }
    else if (objc_msgSend(v9, "taskState") == 4)
    {
      log = self->_log;
      v8 = 1;
      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v4;
        _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Remote Notification: %@ - Running", buf, 0xCu);
      }
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (BOOL)pushLaunchAllowedForApp:(id)a3 immediately:(BOOL *)a4
{
  id v6;
  BOOL v7;
  OS_dispatch_queue *queue;
  id v9;
  void *v10;
  unsigned int v11;
  NSObject *log;
  NSObject *v13;
  void **v15;
  uint64_t v16;
  void (*v17)(_QWORD *);
  void *v18;
  _DASBARScheduler *v19;
  id v20;
  __int128 *v21;
  BOOL *v22;
  uint8_t buf[4];
  id v24;
  __int128 v25;
  uint64_t v26;
  char v27;

  v6 = a3;
  if (a4)
  {
    *a4 = 0;
    if (-[_DASBARScheduler applicationStateRequiresImmediateDelivery:](self, "applicationStateRequiresImmediateDelivery:", v6))
    {
      v7 = 1;
      *a4 = 1;
      goto LABEL_18;
    }
  }
  else if (-[_DASBARScheduler applicationStateRequiresImmediateDelivery:](self, "applicationStateRequiresImmediateDelivery:", v6))
  {
    v7 = 1;
    goto LABEL_18;
  }
  if (self->_barEnabled)
  {
    *(_QWORD *)&v25 = 0;
    *((_QWORD *)&v25 + 1) = &v25;
    v26 = 0x2020000000;
    v27 = 1;
    queue = self->_queue;
    v15 = _NSConcreteStackBlock;
    v16 = 3221225472;
    v17 = sub_10008E4E8;
    v18 = &unk_10015F460;
    v21 = &v25;
    v19 = self;
    v9 = v6;
    v20 = v9;
    v22 = a4;
    dispatch_sync((dispatch_queue_t)queue, &v15);
    if (a4 && *a4
      || (v10 = (void *)objc_claimAutoreleasedReturnValue(+[_APRSPrewarmInterface sharedInstance](_APRSPrewarmInterface, "sharedInstance", v15, v16, v17, v18, v19)), v11 = objc_msgSend(v10, "hasPrewarmAssertionForApplication:", v9), v10, !v11))
    {
      v7 = *(_BYTE *)(*((_QWORD *)&v25 + 1) + 24) != 0;
    }
    else
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v9;
        _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Remote Notification: %@ - Prewarm Assertion", buf, 0xCu);
      }
      v7 = 0;
    }

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    v13 = self->_log;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LODWORD(v25) = 138412290;
      *(_QWORD *)((char *)&v25 + 4) = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Remote Notification: %@ - BAR Disabled", (uint8_t *)&v25, 0xCu);
    }
    v7 = 0;
  }
LABEL_18:

  return v7;
}

- (BOOL)isNewsstandApp:(id)a3
{
  id v4;
  void *v5;
  OS_dispatch_queue *queue;
  BOOL v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10008E7F8;
    block[3] = &unk_10015DB40;
    v11 = &v12;
    block[4] = self;
    v10 = v4;
    dispatch_sync((dispatch_queue_t)queue, block);
    v7 = *((_BYTE *)v13 + 24) != 0;

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)quitMonitor:(id)a3 userClosedLastSceneOfApplicationWithBundleID:(id)a4
{
  id v6;
  OS_dispatch_queue *queue;
  id v8;
  _QWORD block[5];
  id v10;

  v6 = a4;
  if (self->_quitMonitor == a3)
  {
    queue = self->_queue;
    block[1] = 3221225472;
    block[2] = sub_10008E8B8;
    block[3] = &unk_10015D558;
    block[4] = self;
    v8 = v6;
    block[0] = _NSConcreteStackBlock;
    v10 = v6;
    dispatch_sync((dispatch_queue_t)queue, block);

    v6 = v8;
  }

}

- (void)reloadRequestedDelays
{
  OS_dispatch_queue *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008E91C;
  block[3] = &unk_10015D4E0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)queueReloadRequestedDelays
{
  void *v3;
  void *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *appToMinimumLaunchDelay;
  NSMutableDictionary *v7;
  _QWORD v8[4];
  NSMutableDictionary *v9;

  v3 = objc_autoreleasePoolPush();
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults dictionaryForKey:](self->_delayPreferences, "dictionaryForKey:", CFSTR("delays")));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10008EA1C;
  v8[3] = &unk_10015D480;
  v5 = (NSMutableDictionary *)(id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v9 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
    sub_1000E7240();
  appToMinimumLaunchDelay = self->_appToMinimumLaunchDelay;
  self->_appToMinimumLaunchDelay = v5;
  v7 = v5;

  objc_autoreleasePoolPop(v3);
}

- (double)minimumDelayBetweenLaunchesForApp:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  double v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = (double *)&v12;
  v14 = 0x2020000000;
  v15 = 0x7FEFFFFFFFFFFFFFLL;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008EB38;
  block[3] = &unk_10015D930;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (BOOL)backgroundAppRefreshEnabled
{
  return self->_barEnabled;
}

- (BOOL)backgroundAppRefreshEnabledForApp:(id)a3
{
  NSUserDefaults *barPreferences;
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  if (!self->_barEnabled)
    return 0;
  barPreferences = self->_barPreferences;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults dictionaryForKey:](barPreferences, "dictionaryForKey:", CFSTR("KeepAppsUpToDateAppList")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  if (v6)
    v7 = objc_msgSend(v6, "BOOLValue");
  else
    v7 = 1;

  return v7;
}

- (void)disableAppRefreshForApps:(id)a3
{
  id v4;
  NSObject *log;
  int v6;
  id v7;

  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Disabling BAR for %@", (uint8_t *)&v6, 0xCu);
  }
  -[_DASBARScheduler queueHandleAppsKilled:](self, "queueHandleAppsKilled:", v4);

}

- (BOOL)appUsesBackgroundTaskScheduler:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "backgroundTaskSchedulerPermittedIdentifiers"));
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (BOOL)barEnabled
{
  return self->_barEnabled;
}

- (void)setBarEnabled:(BOOL)a3
{
  self->_barEnabled = a3;
}

- (BOOL)barWiFiOnly
{
  return self->_barWiFiOnly;
}

- (void)setBarWiFiOnly:(BOOL)a3
{
  self->_barWiFiOnly = a3;
}

- (SBSApplicationUserQuitMonitor)quitMonitor
{
  return self->_quitMonitor;
}

- (void)setQuitMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_quitMonitor, a3);
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_knowledgeStore;
}

- (void)setKnowledgeStore:(id)a3
{
  objc_storeStrong((id *)&self->_knowledgeStore, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_queue)schedulingQueue
{
  return self->_schedulingQueue;
}

- (void)setSchedulingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_schedulingQueue, a3);
}

- (OS_dispatch_source)appUpdateTimer
{
  return self->_appUpdateTimer;
}

- (void)setAppUpdateTimer:(id)a3
{
  objc_storeStrong((id *)&self->_appUpdateTimer, a3);
}

- (int)barSettingsChangedToken
{
  return self->_barSettingsChangedToken;
}

- (void)setBarSettingsChangedToken:(int)a3
{
  self->_barSettingsChangedToken = a3;
}

- (_DASDaemon)scheduler
{
  return self->_scheduler;
}

- (void)setScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_scheduler, a3);
}

- (_DASActivityGroup)barGroup
{
  return self->_barGroup;
}

- (void)setBarGroup:(id)a3
{
  objc_storeStrong((id *)&self->_barGroup, a3);
}

- (NSUserDefaults)barPreferences
{
  return self->_barPreferences;
}

- (void)setBarPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_barPreferences, a3);
}

- (NSUserDefaults)delayPreferences
{
  return self->_delayPreferences;
}

- (void)setDelayPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_delayPreferences, a3);
}

- (NSUserDefaults)lastLaunchPreferences
{
  return self->_lastLaunchPreferences;
}

- (void)setLastLaunchPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_lastLaunchPreferences, a3);
}

- (NSUserDefaults)killedAppPreferences
{
  return self->_killedAppPreferences;
}

- (void)setKilledAppPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_killedAppPreferences, a3);
}

- (NSMutableSet)fetchEnabledApps
{
  return self->_fetchEnabledApps;
}

- (void)setFetchEnabledApps:(id)a3
{
  objc_storeStrong((id *)&self->_fetchEnabledApps, a3);
}

- (NSMutableSet)pushEnabledApps
{
  return self->_pushEnabledApps;
}

- (void)setPushEnabledApps:(id)a3
{
  objc_storeStrong((id *)&self->_pushEnabledApps, a3);
}

- (NSMutableSet)newsstandApps
{
  return self->_newsstandApps;
}

- (void)setNewsstandApps:(id)a3
{
  objc_storeStrong((id *)&self->_newsstandApps, a3);
}

- (NSMutableSet)disallowedApps
{
  return self->_disallowedApps;
}

- (void)setDisallowedApps:(id)a3
{
  objc_storeStrong((id *)&self->_disallowedApps, a3);
}

- (NSMutableSet)killedApps
{
  return self->_killedApps;
}

- (void)setKilledApps:(id)a3
{
  objc_storeStrong((id *)&self->_killedApps, a3);
}

- (NSMutableSet)appsLaunchedInLastFourteenDays
{
  return self->_appsLaunchedInLastFourteenDays;
}

- (void)setAppsLaunchedInLastFourteenDays:(id)a3
{
  objc_storeStrong((id *)&self->_appsLaunchedInLastFourteenDays, a3);
}

- (NSMutableSet)appsLaunchedInLastThreeDays
{
  return self->_appsLaunchedInLastThreeDays;
}

- (void)setAppsLaunchedInLastThreeDays:(id)a3
{
  objc_storeStrong((id *)&self->_appsLaunchedInLastThreeDays, a3);
}

- (NSSet)foregroundApps
{
  return self->_foregroundApps;
}

- (void)setForegroundApps:(id)a3
{
  objc_storeStrong((id *)&self->_foregroundApps, a3);
}

- (NSMutableDictionary)appToMinimumLaunchDelay
{
  return self->_appToMinimumLaunchDelay;
}

- (void)setAppToMinimumLaunchDelay:(id)a3
{
  objc_storeStrong((id *)&self->_appToMinimumLaunchDelay, a3);
}

- (NSMutableDictionary)appsToPendingTasks
{
  return self->_appsToPendingTasks;
}

- (void)setAppsToPendingTasks:(id)a3
{
  objc_storeStrong((id *)&self->_appsToPendingTasks, a3);
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
  objc_storeStrong((id *)&self->_appsToPendingTasks, 0);
  objc_storeStrong((id *)&self->_appToMinimumLaunchDelay, 0);
  objc_storeStrong((id *)&self->_foregroundApps, 0);
  objc_storeStrong((id *)&self->_appsLaunchedInLastThreeDays, 0);
  objc_storeStrong((id *)&self->_appsLaunchedInLastFourteenDays, 0);
  objc_storeStrong((id *)&self->_killedApps, 0);
  objc_storeStrong((id *)&self->_disallowedApps, 0);
  objc_storeStrong((id *)&self->_newsstandApps, 0);
  objc_storeStrong((id *)&self->_pushEnabledApps, 0);
  objc_storeStrong((id *)&self->_fetchEnabledApps, 0);
  objc_storeStrong((id *)&self->_killedAppPreferences, 0);
  objc_storeStrong((id *)&self->_lastLaunchPreferences, 0);
  objc_storeStrong((id *)&self->_delayPreferences, 0);
  objc_storeStrong((id *)&self->_barPreferences, 0);
  objc_storeStrong((id *)&self->_barGroup, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_appUpdateTimer, 0);
  objc_storeStrong((id *)&self->_schedulingQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
  objc_storeStrong((id *)&self->_quitMonitor, 0);
}

@end
