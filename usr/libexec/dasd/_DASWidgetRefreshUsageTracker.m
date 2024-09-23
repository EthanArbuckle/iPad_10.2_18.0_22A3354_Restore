@implementation _DASWidgetRefreshUsageTracker

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002E4A0;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001AB4B0 != -1)
    dispatch_once(&qword_1001AB4B0, block);
  return (id)qword_1001AB4B8;
}

- (_DASWidgetRefreshUsageTracker)init
{
  _DASWidgetRefreshUsageTracker *v2;
  os_log_t v3;
  OS_os_log *log;
  NSMutableDictionary *v5;
  NSMutableDictionary *trackingWidgets;
  NSMutableDictionary *v7;
  NSMutableDictionary *dailyComputedBudgetsForAllWidgets;
  uint64_t v9;
  NSDate *computedBudgetDate;
  uint64_t v11;
  _CDLocalContext *context;
  dispatch_queue_attr_t v13;
  NSObject *v14;
  dispatch_queue_attr_t v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *queue;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)_DASWidgetRefreshUsageTracker;
  v2 = -[_DASWidgetRefreshUsageTracker init](&v20, "init");
  if (v2)
  {
    v3 = os_log_create("com.apple.duetactivityscheduler", "widgetRefresh");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    trackingWidgets = v2->_trackingWidgets;
    v2->_trackingWidgets = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    dailyComputedBudgetsForAllWidgets = v2->_dailyComputedBudgetsForAllWidgets;
    v2->_dailyComputedBudgetsForAllWidgets = v7;

    v9 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
    computedBudgetDate = v2->_computedBudgetDate;
    v2->_computedBudgetDate = (NSDate *)v9;

    v11 = objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](_CDClientContext, "userContext"));
    context = v2->_context;
    v2->_context = (_CDLocalContext *)v11;

    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_UTILITY, 0);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    v17 = dispatch_queue_create("com.apple.dasd.computeWidgetBudgets", v16);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v17;

  }
  return v2;
}

- (id)dailyBudgetForWidget:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[_DASWidgetRefreshUsageTracker computeBudgetFromHistoryForAllWidgets](self, "computeBudgetFromHistoryForAllWidgets");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_dailyComputedBudgetsForAllWidgets, "objectForKey:", v4));

  return v5;
}

- (id)dailyBudgetsForAllWidgets
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  -[_DASWidgetRefreshUsageTracker computeBudgetFromHistoryForAllWidgets](self, "computeBudgetFromHistoryForAllWidgets");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_dailyComputedBudgetsForAllWidgets, "allKeys"));
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[_DASWidgetRefreshUsageTracker dailyBudgetForWidget:](self, "dailyBudgetForWidget:", v10, (_QWORD)v13));
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)computeBudgetFromHistoryForAllWidgets
{
  void *v3;
  double v4;
  double v5;
  OS_dispatch_queue *queue;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  objc_msgSend(v3, "timeIntervalSinceDate:", self->_computedBudgetDate);
  v5 = v4;

  if (v5 > 60.0)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x3032000000;
    v11 = sub_10002E86C;
    v12 = sub_10002E87C;
    v13 = objc_alloc_init((Class)NSMutableDictionary);
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10002E884;
    v7[3] = &unk_10015D8E0;
    v7[4] = self;
    v7[5] = &v8;
    dispatch_sync((dispatch_queue_t)queue, v7);
    objc_storeStrong((id *)&self->_dailyComputedBudgetsForAllWidgets, (id)v9[5]);
    _Block_object_dispose(&v8, 8);

  }
}

- (void)invalidateComputedBudgetCache
{
  OS_dispatch_queue *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002ED58;
  block[3] = &unk_10015D4E0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)flushComputedBudgetCache
{
  OS_dispatch_queue *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002EDE8;
  block[3] = &unk_10015D4E0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (id)getAverageWidgetViewsPerDayWithStore:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *log;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  void *j;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  NSObject *v45;
  uint64_t v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *context;
  void *contexta;
  int v55;
  void *v56;
  id obj;
  id obja;
  void *v59;
  uint64_t v60;
  void *v61;
  id v62;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  id v72;
  _BYTE v73[128];
  _BYTE v74[128];
  uint8_t v75[4];
  uint64_t v76;
  uint8_t buf[4];
  id v78;
  __int16 v79;
  id v80;
  void *v81;
  uint64_t v82;

  v48 = a3;
  v62 = objc_alloc_init((Class)NSMutableDictionary);
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "dateByAddingTimeInterval:", -604800.0));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dateByAddingTimeInterval:", 86400.0));
  v5 = objc_alloc_init((Class)NSMutableDictionary);
  v6 = objc_alloc_init((Class)NSMutableDictionary);
  v7 = 0;
  v47 = kDASWidgetViewStreamName;
  do
  {
    v55 = v7;
    context = objc_autoreleasePoolPush();
    v8 = objc_claimAutoreleasedReturnValue(+[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", v47));
    obj = v3;
    v59 = (void *)v4;
    v9 = objc_claimAutoreleasedReturnValue(+[_DKQuery predicateForEventsWithStartAndEndInDateRangeFrom:to:](_DKQuery, "predicateForEventsWithStartAndEndInDateRangeFrom:to:", v3, v4));
    v52 = (void *)v8;
    v82 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v82, 1));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1));
    v81 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v81, 1));
    v51 = (void *)v9;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[_DKEventQuery eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:](_DKEventQuery, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v9, v10, 0, 5000, v12));

    objc_msgSend(v13, "setReadMetadata:", 0);
    v72 = 0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "executeQuery:error:", v13, &v72));
    v15 = v72;
    if (v15)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v78 = v13;
        v79 = 2112;
        v80 = v15;
        _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Query for widget views %@ failed with error %@", buf, 0x16u);
      }
    }
    v49 = v15;
    v50 = v13;
    v17 = self->_log;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      sub_1000E08F0(v75, v17, v14, &v76);
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v18 = v14;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v69;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(_QWORD *)v69 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)i);
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "stringValue"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", v24));

          if (!v25)
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "startDate"));
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v26, v24);

          }
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForKey:", v24));

          if (v27)
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v24));
            v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v28, "intValue") + 1));
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v29, v24);

          }
          else
          {
            objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_10016E540, v24);
          }

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
      }
      while (v20);
    }

    objc_autoreleasePoolPop(context);
    v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "dateByAddingTimeInterval:", 86400.0));

    v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "dateByAddingTimeInterval:", 86400.0));
    v7 = v55 + 1;
    v3 = (void *)v30;
    v4 = v31;
  }
  while (v55 != 6);
  contexta = (void *)v31;
  v56 = (void *)v30;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  obja = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys"));
  v32 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
  if (v32)
  {
    v33 = v32;
    v60 = *(_QWORD *)v65;
    do
    {
      for (j = 0; j != v33; j = (char *)j + 1)
      {
        if (*(_QWORD *)v65 != v60)
          objc_enumerationMutation(obja);
        v35 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)j);
        v36 = objc_autoreleasePoolPush();
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v35));
        objc_msgSend(v37, "timeIntervalSinceDate:", v61);
        v39 = v38;

        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v35));
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", ((int)objc_msgSend(v40, "intValue") / (int)vcvtpd_s64_f64(v39 / -86400.0))));
        objc_msgSend(v62, "setObject:forKeyedSubscript:", v41, v35);

        v42 = self->_log;
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          v43 = v42;
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v35));
          *(_DWORD *)buf = 138412546;
          v78 = v35;
          v79 = 2112;
          v80 = v44;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "widget: %@ - view count: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v36);
      }
      v33 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
    }
    while (v33);
  }

  v45 = self->_log;
  if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v78 = v62;
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "Average views %@", buf, 0xCu);
  }

  return v62;
}

- (int)allocateBudgetForViewsCurve:(int)a3
{
  if (a3 >= 0x1F)
    return (int)((double)a3 + -59.2305146 + 30.0);
  else
    return a3;
}

- (id)allocatedBudgetsWithAverageViews:(id)a3 groupTotalBudget:(int)a4 individualMaxBudgets:(id)a5 individualMinBudget:(int)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  double v14;
  void *i;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  signed int v20;
  int v21;
  int v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  double v29;
  void *j;
  uint64_t v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  int v36;
  double v37;
  void *v38;
  id obj;
  void *v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];

  v9 = a3;
  v43 = a5;
  v10 = objc_alloc_init((Class)NSMutableDictionary);
  v42 = v9;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allKeys"));
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v49;
    v14 = 0.0;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v49 != v13)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectForKeyedSubscript:", v16));
        v18 = objc_msgSend(v17, "intValue");

        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKeyedSubscript:", v16));
        v20 = objc_msgSend(v19, "intValue");

        v21 = -[_DASWidgetRefreshUsageTracker allocateBudgetForViewsCurve:](self, "allocateBudgetForViewsCurve:", v18);
        if (v21 >= v20)
          v22 = v20;
        else
          v22 = v21;
        if (v22 <= a6)
          v23 = a6;
        else
          v23 = v22;
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v23));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v24, v16);

        v14 = v14 + (double)v21;
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v12);
  }
  else
  {
    v14 = 0.0;
  }
  if (v14 > (double)a4)
  {
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v25 = obj;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v45;
      v29 = (double)a4 / v14;
      do
      {
        for (j = 0; j != v27; j = (char *)j + 1)
        {
          if (*(_QWORD *)v45 != v28)
            objc_enumerationMutation(v25);
          v31 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)j);
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v31));
          objc_msgSend(v32, "doubleValue");
          v34 = v33;

          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKeyedSubscript:", v31));
          v36 = objc_msgSend(v35, "intValue");

          if (v34 <= (double)v36)
            v37 = 1.0;
          else
            v37 = v29;
          v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", round(v34 * v37)));
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v38, v31);

        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      }
      while (v27);
    }

  }
  return v10;
}

- (void)startTrackingActivity:(id)a3
{
  void *v4;
  NSMutableDictionary *trackingWidgets;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "widgetBudgetID"));

  if (v4)
  {
    trackingWidgets = self->_trackingWidgets;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "widgetBudgetID"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](trackingWidgets, "setObject:forKeyedSubscript:", &off_10016E540, v6);

  }
}

- (double)stopTrackingActivity:(id)a3
{
  id v4;
  void *v5;
  double v6;
  NSMutableDictionary *trackingWidgets;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "widgetBudgetID"));

  v6 = 0.0;
  if (v5)
  {
    trackingWidgets = self->_trackingWidgets;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "widgetBudgetID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](trackingWidgets, "objectForKeyedSubscript:", v8));

    if (v9)
    {
      v10 = self->_trackingWidgets;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "widgetBudgetID"));
      -[NSMutableDictionary removeObjectForKey:](v10, "removeObjectForKey:", v11);

      v6 = 1.0;
    }
  }

  return v6;
}

- (double)sumOfValuesOfDictionary:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  double v7;
  void *i;
  void *v9;
  double v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i)));
        objc_msgSend(v9, "doubleValue");
        v7 = v7 + v10;

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

- (unsigned)maxWidgetRefreshBudgetForSystemDaily
{
  return self->_maxWidgetRefreshBudgetForSystemDaily;
}

- (unsigned)maxWidgetRefreshBudgetForIndividualDaily
{
  return self->_maxWidgetRefreshBudgetForIndividualDaily;
}

- (NSMutableDictionary)trackingWidgets
{
  return self->_trackingWidgets;
}

- (void)setTrackingWidgets:(id)a3
{
  objc_storeStrong((id *)&self->_trackingWidgets, a3);
}

- (NSMutableDictionary)dailyComputedBudgetsForAllWidgets
{
  return self->_dailyComputedBudgetsForAllWidgets;
}

- (void)setDailyComputedBudgetsForAllWidgets:(id)a3
{
  objc_storeStrong((id *)&self->_dailyComputedBudgetsForAllWidgets, a3);
}

- (NSDate)computedBudgetDate
{
  return self->_computedBudgetDate;
}

- (void)setComputedBudgetDate:(id)a3
{
  objc_storeStrong((id *)&self->_computedBudgetDate, a3);
}

- (_CDLocalContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_computedBudgetDate, 0);
  objc_storeStrong((id *)&self->_dailyComputedBudgetsForAllWidgets, 0);
  objc_storeStrong((id *)&self->_trackingWidgets, 0);
}

@end
