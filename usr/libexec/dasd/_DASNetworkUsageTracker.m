@implementation _DASNetworkUsageTracker

- (double)stopTrackingActivity:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSMutableSet *startedActivites;
  void *v7;
  NSMutableSet *v8;
  void *v9;
  __objc2_class *v10;
  double v11;
  void *v12;
  BOOL v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id *v20;
  dispatch_semaphore_t v21;
  id v22;
  dispatch_time_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  OS_os_log *v32;
  void *v33;
  dispatch_semaphore_t dsema;
  void *v36;
  _QWORD *v37;
  void *v38;
  _QWORD v39[5];
  id v40;
  dispatch_semaphore_t v41;
  uint64_t *v42;
  uint64_t v43;
  double *v44;
  uint64_t v45;
  uint64_t v46;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  void *v50;
  _QWORD v51[2];
  _QWORD v52[2];
  uint64_t v53;
  void *v54;

  v4 = a3;
  v43 = 0;
  v44 = (double *)&v43;
  v45 = 0x2020000000;
  v46 = 0;
  if (!+[_DASNetworkUsageTracker shouldTrackActivity:](_DASNetworkUsageTracker, "shouldTrackActivity:", v4))goto LABEL_10;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  startedActivites = self->_startedActivites;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  LODWORD(startedActivites) = -[NSMutableSet containsObject:](startedActivites, "containsObject:", v7);

  if (!(_DWORD)startedActivites)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      sub_1000177F8();
    os_unfair_lock_unlock(p_lock);
    goto LABEL_10;
  }
  v8 = self->_startedActivites;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  -[NSMutableSet removeObject:](v8, "removeObject:", v9);

  os_unfair_lock_unlock(&self->_lock);
  v10 = (__objc2_class *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clientDataBudgetName"));
  if (v10)
  {
LABEL_4:

    goto LABEL_5;
  }
  v10 = (__objc2_class *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "relatedApplications"));
  if (!-[__objc2_class count](v10, "count"))
  {

    goto LABEL_10;
  }
  if ((objc_msgSend(v4, "requestsApplicationLaunch") & 1) != 0)
    goto LABEL_4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "widgetID"));
  v13 = v12 == 0;

  if (v13)
  {
LABEL_10:
    v11 = v44[3];
    goto LABEL_43;
  }
LABEL_5:
  if (objc_msgSend(v4, "pid"))
  {
    v10 = _DASUtils;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[_DASUtils processNameFromPID:](_DASUtils, "processNameFromPID:", objc_msgSend(v4, "pid")));
  }
  else
  {
    v38 = 0;
  }
  v14 = objc_msgSend(v4, "requestsApplicationLaunch");
  if ((v14 & 1) != 0 || (v10 = (__objc2_class *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "widgetID"))) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "relatedApplications"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v15));

    if ((v14 & 1) != 0)
      goto LABEL_26;
  }
  else
  {
    if (v38)
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:"));
    else
      v16 = 0;
    v10 = 0;
  }

LABEL_26:
  if (v16)
  {
    if ((objc_msgSend(v4, "requestsApplicationLaunch") & 1) != 0)
    {
      v17 = kUsageProcessBundleName;
    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "widgetID"));
      v20 = (id *)&kUsageProcessBundleName;
      if (!v19)
        v20 = (id *)&kUsageProcessProcName;
      v17 = *v20;

    }
    v53 = kSymptomAnalyticsServiceRefreshUsage;
    v54 = &__kCFBooleanTrue;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1));
    v21 = dispatch_semaphore_create(0);
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_10002C6C8;
    v39[3] = &unk_10015D898;
    v39[4] = self;
    v22 = v4;
    v40 = v22;
    v42 = &v43;
    dsema = v21;
    v41 = dsema;
    v37 = objc_retainBlock(v39);
    if ((-[UsageFeed usageToDateWithOptionsFor:nameKind:options:reply:](self->_symptomsFeed, "usageToDateWithOptionsFor:nameKind:options:reply:", v16, v17, v36, v37) & 1) != 0)
    {
      v23 = dispatch_time(0, 10000000000);
      dispatch_semaphore_wait(dsema, v23);
    }
    else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      sub_1000E057C();
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "widgetID"));

    if (v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "relatedApplications"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "firstObject"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.dasd.bytes.widgets.%@"), v26));

      v52[0] = CFSTR("com.apple.dasd.bytes.widgets");
      v52[1] = v27;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v52, 2));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v44[3]));
      v51[0] = v29;
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v44[3]));
      v51[1] = v30;
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v51, 2));
      +[_DASMetricRecorder incrementOccurrencesForKeys:byCounts:](_DASMetricRecorder, "incrementOccurrencesForKeys:byCounts:", v28, v31);

    }
    v32 = self->_log;
    if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v44[3]));
      *(_DWORD *)buf = 138412546;
      v48 = v22;
      v49 = 2112;
      v50 = v33;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v32, OS_LOG_TYPE_DEFAULT, "Data consumed for %@: %@", buf, 0x16u);

    }
    v11 = v44[3];

  }
  else
  {
    os_unfair_lock_lock(&self->_lock);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[_DASNetworkUsageTracker activityToDataMap](self, "activityToDataMap"));
    objc_msgSend(v18, "removeObjectForKey:", v4);

    os_unfair_lock_unlock(p_lock);
    v11 = 0.0;
  }

LABEL_43:
  _Block_object_dispose(&v43, 8);

  return v11;
}

+ (BOOL)shouldTrackActivity:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  BOOL v6;
  id v7;
  unint64_t v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clientDataBudgetName"));
  if (!v5)
  {
    v7 = objc_msgSend(v4, "schedulingPriority");
    v8 = _DASSchedulingPriorityUserInitiated;
    if ((unint64_t)v7 < _DASSchedulingPriorityUserInitiated)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "widgetID"));
      if (v9)
      {
        v6 = 1;
        goto LABEL_20;
      }
    }
    if ((objc_msgSend(v4, "budgeted") & 1) != 0 || objc_msgSend(v4, "dataBudgeted"))
    {
      v10 = objc_msgSend(v4, "requiresNetwork");
      if (v10)
      {
        v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", kNWEndpointKey));
        if (v11)
        {

          v6 = 1;
LABEL_18:
          if ((unint64_t)v7 >= v8)
            goto LABEL_21;
          v9 = 0;
LABEL_20:

          goto LABEL_21;
        }
        if ((objc_msgSend(v4, "requestsApplicationLaunch") & 1) == 0)
        {
          v6 = 0;
LABEL_17:

          goto LABEL_18;
        }
LABEL_14:
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "relatedApplications"));
        v6 = objc_msgSend(v12, "count") != 0;

        if (!v10)
          goto LABEL_18;
        goto LABEL_17;
      }
      if ((objc_msgSend(v4, "requestsApplicationLaunch") & 1) != 0)
        goto LABEL_14;
    }
    v6 = 0;
    goto LABEL_18;
  }
  v6 = 1;
LABEL_21:

  return v6;
}

- (_DASNetworkUsageTracker)init
{
  id v2;
  os_log_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  dispatch_queue_global_t global_queue;
  void *v15;
  id v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)_DASNetworkUsageTracker;
  v2 = -[_DASNetworkUsageTracker init](&v19, "init");
  if (v2)
  {
    v3 = os_log_create("com.apple.duetactivityscheduler", "networkbudgeting");
    v4 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v6 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v5;

    *((_DWORD *)v2 + 2) = 0;
    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v8 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v7;

    v9 = objc_alloc((Class)AnalyticsWorkspace);
    v10 = objc_msgSend(v9, "initWorkspaceWithService:", kSymptomAnalyticsServiceEndpoint);
    if (!v10 && os_log_type_enabled(*((os_log_t *)v2 + 3), OS_LOG_TYPE_ERROR))
      sub_1000E04C4();
    v11 = objc_msgSend(objc_alloc((Class)UsageFeed), "initWithWorkspace:", v10);
    v12 = (void *)*((_QWORD *)v2 + 6);
    *((_QWORD *)v2 + 6) = v11;

    if (!*((_QWORD *)v2 + 6) && os_log_type_enabled(*((os_log_t *)v2 + 3), OS_LOG_TYPE_ERROR))
      sub_1000E0498();
    v13 = objc_alloc((Class)CTCarrierSpaceClient);
    global_queue = dispatch_get_global_queue(-32768, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    v16 = objc_msgSend(v13, "initWithQueue:", v15);
    v17 = (void *)*((_QWORD *)v2 + 7);
    *((_QWORD *)v2 + 7) = v16;

    objc_msgSend(*((id *)v2 + 7), "setDelegate:", v2);
  }
  return (_DASNetworkUsageTracker *)v2;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002BCF8;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001AB478 != -1)
    dispatch_once(&qword_1001AB478, block);
  return (id)qword_1001AB480;
}

- (void)dataPlanMetricsDidChange
{
  NSObject *log;
  uint8_t v4[16];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Carrier data may have changed", v4, 2u);
  }
  -[_DASNetworkUsageTracker dailyBudget](self, "dailyBudget");
  -[_DASBudgetModulator updateCapacity:forBudgetWithName:](self->_modulator, "updateCapacity:forBudgetWithName:", CFSTR("com.apple.dasd.systemCellular"));
}

- (double)dailyDataBudgetFromPlan:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  NSObject *v15;
  NSObject *log;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  NSObject *v20;
  int v22;
  void *v23;
  __int16 v24;
  double v25;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6 || v7)
  {
    log = self->_log;
    v14 = -1.0;
    if (!os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    v22 = 138412290;
    v23 = v8;
    v17 = "Error trying to obtain data plan metrics: %@";
    v18 = log;
    v19 = 12;
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v22, v19);
    goto LABEL_15;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domestic"));

  if (!v9)
  {
    v20 = self->_log;
    v14 = -1.0;
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    LOWORD(v22) = 0;
    v17 = "No capacity returned. Using default";
    v18 = v20;
    v19 = 2;
    goto LABEL_14;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domestic"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "capacityBytes"));

  objc_msgSend(v11, "doubleValue");
  v13 = v12 / 100.0;
  if (v13 <= 1073741820.0)
    v14 = v13;
  else
    v14 = 1073741820.0;
  v15 = self->_log;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 138543618;
    v23 = v11;
    v24 = 2048;
    v25 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Data plan budget is for %{public}@ bytes. Discretionary budget is now %lf bytes", (uint8_t *)&v22, 0x16u);
  }

LABEL_15:
  return v14;
}

- (double)dailyBudget
{
  dispatch_semaphore_t v3;
  CTCarrierSpaceClient *carrierSpaceClient;
  NSObject *v5;
  dispatch_time_t v6;
  double v7;
  _QWORD v9[5];
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  double *v13;
  uint64_t v14;
  unint64_t v15;

  v12 = 0;
  v13 = (double *)&v12;
  v14 = 0x2020000000;
  v15 = 0xBFF0000000000000;
  v3 = dispatch_semaphore_create(0);
  carrierSpaceClient = self->_carrierSpaceClient;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002C084;
  v9[3] = &unk_10015D848;
  v11 = &v12;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  -[CTCarrierSpaceClient fetchDataPlanMetrics:](carrierSpaceClient, "fetchDataPlanMetrics:", v9);
  v6 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v5, v6);
  if (v13[3] >= 0.0)
    v7 = v13[3];
  else
    v7 = 52428800.0;

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)startTrackingActivity:(id)a3
{
  void *v3;
  id v5;
  NSMutableSet *startedActivites;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id *v16;
  void *v17;
  dispatch_semaphore_t v18;
  NSObject *v19;
  _QWORD *v20;
  dispatch_time_t v21;
  _QWORD v22[5];
  id v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;

  v5 = a3;
  if (+[_DASNetworkUsageTracker shouldTrackActivity:](_DASNetworkUsageTracker, "shouldTrackActivity:", v5))
  {
    os_unfair_lock_lock(&self->_lock);
    startedActivites = self->_startedActivites;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
    -[NSMutableSet addObject:](startedActivites, "addObject:", v7);

    os_unfair_lock_unlock(&self->_lock);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "clientDataBudgetName"));
    if (v8)
      goto LABEL_3;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "relatedApplications"));
    if (!objc_msgSend(v8, "count"))
    {
LABEL_34:

      goto LABEL_35;
    }
    if ((objc_msgSend(v5, "requestsApplicationLaunch") & 1) != 0)
    {
LABEL_3:

    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "widgetID"));

      if (!v10)
        goto LABEL_35;
    }
    os_unfair_lock_lock(&self->_lock);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_activityToDataMap, "objectForKeyedSubscript:", v5));
    if (!v8)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_activityToDataMap, "setObject:forKeyedSubscript:", v8, v5);
    }
    os_unfair_lock_unlock(&self->_lock);
    if (objc_msgSend(v5, "pid"))
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[_DASUtils processNameFromPID:](_DASUtils, "processNameFromPID:", objc_msgSend(v5, "pid")));
    else
      v9 = 0;
    v11 = objc_msgSend(v5, "requestsApplicationLaunch");
    if ((v11 & 1) != 0 || (v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "widgetID"))) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "relatedApplications"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v12));

      if ((v11 & 1) != 0)
      {
        if (!v13)
          goto LABEL_33;
        goto LABEL_23;
      }
    }
    else
    {
      if (v9)
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v9));
      else
        v13 = 0;
      v3 = 0;
    }

    if (!v13)
    {
LABEL_33:

      goto LABEL_34;
    }
LABEL_23:
    if ((objc_msgSend(v5, "requestsApplicationLaunch") & 1) != 0)
    {
      v14 = kUsageProcessBundleName;
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "widgetID"));
      v16 = (id *)&kUsageProcessBundleName;
      if (!v15)
        v16 = (id *)&kUsageProcessProcName;
      v14 = *v16;

    }
    v26 = kSymptomAnalyticsServiceRefreshUsage;
    v27 = &__kCFBooleanTrue;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
    v18 = dispatch_semaphore_create(0);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10002C488;
    v22[3] = &unk_10015D870;
    v22[4] = self;
    v23 = v8;
    v24 = v5;
    v19 = v18;
    v25 = v19;
    v20 = objc_retainBlock(v22);
    if ((-[UsageFeed usageToDateWithOptionsFor:nameKind:options:reply:](self->_symptomsFeed, "usageToDateWithOptionsFor:nameKind:options:reply:", v13, v14, v17, v20) & 1) != 0)
    {
      v21 = dispatch_time(0, 10000000000);
      dispatch_semaphore_wait(v19, v21);
    }
    else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      sub_1000E04F0();
    }

    goto LABEL_33;
  }
LABEL_35:

}

- (double)getDataConsumedFromBytesOnCell:(double)result bytesOnCellExpensive:(double)a4 bytesOnCellInexpensive:(double)a5 bytesOnWiFiExpensive:(double)a6
{
  double v6;
  double v7;

  v6 = a4 + a5 + a6;
  v7 = a5 * 0.05 + a4 + a6;
  if (v6 != 0.0)
    return v7;
  return result;
}

- (double)updateDataForActivity:(id)a3 bytesOnCell:(double)a4 bytesOnCellExpensive:(double)a5 bytesOnCellInexpensive:(double)a6 bytesOnWiFiExpensive:(double)a7 bytesOnWiFiInexpensive:(double)a8
{
  id v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  const __CFString *v20;
  void *v21;
  id v22;
  const __CFString *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  unsigned int v28;
  void *v29;
  _DASNetworkUsageTracker *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  NSObject *v46;
  _BOOL4 v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  NSMutableSet *startedActivites;
  void *v62;
  NSMutableSet *v63;
  void *v64;
  double v65;
  void *v67;
  NSObject *log;
  NSObject *loga;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint8_t buf[4];
  void *v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  void *v82;
  __int16 v83;
  void *v84;
  __int16 v85;
  void *v86;
  _QWORD v87[2];
  _QWORD v88[2];

  v14 = a3;
  v15 = +[_DASPhotosPolicy isiCPLActivity:](_DASPhotosPolicy, "isiCPLActivity:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "relatedApplications"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "sortedArrayUsingSelector:", "compare:"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "firstObject"));

  v19 = objc_msgSend(v14, "schedulingPriority");
  if ((unint64_t)v19 <= _DASSchedulingPriorityDefault)
    v20 = CFSTR("disc");
  else
    v20 = CFSTR("non-disc");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.dasd.bytes.%@.%@.cell"), v18, v20));
  v22 = objc_msgSend(v14, "schedulingPriority");
  if ((unint64_t)v22 <= _DASSchedulingPriorityDefault)
    v23 = CFSTR("disc");
  else
    v23 = CFSTR("non-disc");
  v24 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.dasd.bytes.%@.%@.wifi"), v18, v23));
  v25 = (void *)v24;
  if (a5 + a6 + a7 + a8 > 0.0)
  {
    v88[0] = v24;
    v88[1] = v21;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v88, 2));
    v27 = v14;
    v28 = v15;
    v29 = v18;
    v30 = self;
    v31 = v25;
    v32 = v21;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a7 + a8));
    v87[0] = v33;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a5 + a6));
    v87[1] = v34;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v87, 2));
    +[_DASMetricRecorder incrementOccurrencesForKeys:byCounts:](_DASMetricRecorder, "incrementOccurrencesForKeys:byCounts:", v26, v35);

    v21 = v32;
    v25 = v31;
    self = v30;
    v18 = v29;
    v15 = v28;
    v14 = v27;

  }
  if (v15)
  {
    v36 = self->_log;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v72 = v25;
      v37 = v21;
      v38 = v36;
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a5));
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a6));
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a7));
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a8));
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "schedulingPriority")));
      *(_DWORD *)buf = 138544386;
      v76 = v39;
      v77 = 2114;
      v78 = v40;
      v79 = 2114;
      v80 = v41;
      v81 = 2114;
      v82 = v42;
      v83 = 2114;
      v84 = v43;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Cell Expensive Bytes: %{public}@, Cell Inexpensive Bytes: %{public}@, WiFi Expensive Bytes: %{public}@, WiFi Inexpensive Bytes: %{public}@, Priority: %{public}@, Applications: com.apple.mobileslideshow", buf, 0x34u);

      v21 = v37;
      v25 = v72;

    }
  }
  else
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "relatedApplications"));
    v45 = objc_msgSend(v44, "count");

    v46 = self->_log;
    v47 = os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);
    if (v45 == (id)1)
    {
      if (v47)
      {
        log = v46;
        v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a5));
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a6));
        v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a7));
        v70 = v21;
        v73 = v25;
        v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a8));
        v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "schedulingPriority")));
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "relatedApplications"));
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "firstObject"));
        *(_DWORD *)buf = 138544642;
        v76 = v67;
        v77 = 2114;
        v78 = v48;
        v79 = 2114;
        v80 = v49;
        v81 = 2114;
        v82 = v50;
        v83 = 2114;
        v84 = v51;
        v85 = 2112;
        v86 = v53;
        _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Cell Expensive Bytes: %{public}@, Cell Inexpensive Bytes: %{public}@, WiFi Expensive Bytes: %{public}@, WiFi Inexpensive Bytes: %{public}@, Priority: %{public}@, Applications: %@", buf, 0x3Eu);

        v21 = v70;
        v25 = v73;

      }
    }
    else if (v47)
    {
      loga = v46;
      v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a5));
      v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a6));
      v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a7));
      v74 = v25;
      v56 = v21;
      v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a8));
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "schedulingPriority")));
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "relatedApplications"));
      *(_DWORD *)buf = 138544642;
      v76 = v71;
      v77 = 2114;
      v78 = v54;
      v79 = 2114;
      v80 = v55;
      v81 = 2114;
      v82 = v57;
      v83 = 2114;
      v84 = v58;
      v85 = 2112;
      v86 = v59;
      _os_log_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_DEFAULT, "Cell Expensive Bytes: %{public}@, Cell Inexpensive Bytes: %{public}@, WiFi Expensive Bytes: %{public}@, WiFi Inexpensive Bytes: %{public}@, Priority: %{public}@, Applications: %@", buf, 0x3Eu);

      v21 = v56;
      v25 = v74;

    }
  }
  v60 = 0.0;
  if (+[_DASNetworkUsageTracker shouldTrackActivity:](_DASNetworkUsageTracker, "shouldTrackActivity:", v14))
  {
    os_unfair_lock_lock(&self->_lock);
    startedActivites = self->_startedActivites;
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "name"));
    LOBYTE(startedActivites) = -[NSMutableSet containsObject:](startedActivites, "containsObject:", v62);

    if ((startedActivites & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
        sub_1000E0608();
      v63 = self->_startedActivites;
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "name"));
      -[NSMutableSet addObject:](v63, "addObject:", v64);

    }
    os_unfair_lock_unlock(&self->_lock);
    -[_DASNetworkUsageTracker getDataConsumedFromBytesOnCell:bytesOnCellExpensive:bytesOnCellInexpensive:bytesOnWiFiExpensive:](self, "getDataConsumedFromBytesOnCell:bytesOnCellExpensive:bytesOnCellInexpensive:bytesOnWiFiExpensive:", a4, a5, a6, a7);
    v60 = v65;
  }

  return v60;
}

- (_DASBudgetModulator)modulator
{
  return (_DASBudgetModulator *)objc_getProperty(self, a2, 16, 1);
}

- (void)setModulator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (NSMutableSet)startedActivites
{
  return self->_startedActivites;
}

- (void)setStartedActivites:(id)a3
{
  objc_storeStrong((id *)&self->_startedActivites, a3);
}

- (NSMutableDictionary)activityToDataMap
{
  return self->_activityToDataMap;
}

- (void)setActivityToDataMap:(id)a3
{
  objc_storeStrong((id *)&self->_activityToDataMap, a3);
}

- (UsageFeed)symptomsFeed
{
  return self->_symptomsFeed;
}

- (void)setSymptomsFeed:(id)a3
{
  objc_storeStrong((id *)&self->_symptomsFeed, a3);
}

- (CTCarrierSpaceClient)carrierSpaceClient
{
  return self->_carrierSpaceClient;
}

- (void)setCarrierSpaceClient:(id)a3
{
  objc_storeStrong((id *)&self->_carrierSpaceClient, a3);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carrierSpaceClient, 0);
  objc_storeStrong((id *)&self->_symptomsFeed, 0);
  objc_storeStrong((id *)&self->_activityToDataMap, 0);
  objc_storeStrong((id *)&self->_startedActivites, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_modulator, 0);
}

@end
