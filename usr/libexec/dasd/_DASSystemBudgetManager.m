@implementation _DASSystemBudgetManager

- (void)stopTrackingActivity:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  NSObject *v14;
  int v15;
  double v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;

  v4 = a3;
  -[_DASEnergyUsageTracker stopTrackingActivity:](self->_energyUsageTracker, "stopTrackingActivity:", v4);
  -[_DASNetworkUsageTracker stopTrackingActivity:](self->_networkUsageTracker, "stopTrackingActivity:", v4);
  if (v5 > 0.0)
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSystemBudgetManager dataBudgetForActivity:](self, "dataBudgetForActivity:", v4));
    objc_msgSend(v7, "decrementBy:", v6);
    -[_DASBudgetPersisting updateBudget:](self->_sharedMemoryPersistence, "updateBudget:", v7);
    v8 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("networkbudgeting")));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 134218498;
      v16 = v6;
      v17 = 2112;
      v18 = v4;
      v19 = 2114;
      v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Decremented data budget by %f for activity %@, data budget is now %{public}@", (uint8_t *)&v15, 0x20u);
    }

  }
  if (objc_msgSend(v4, "targetDevice") == (id)3)
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
    if (v9)
    {
      v10 = (void *)v9;
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "widgetID"));
      if (!v11)
      {
LABEL_12:

        goto LABEL_13;
      }
      v12 = (void *)v11;
      v13 = -[NSMutableSet containsObject:](self->_remoteActivities, "containsObject:", v4);

      if (v13)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_budgets, "objectForKeyedSubscript:", CFSTR("com.apple.dasd.remoteWidget")));
        objc_msgSend(v10, "decrementBy:", 1.0);
        -[_DASBudgetPersisting updateBudget:](self->_sharedMemoryPersistence, "updateBudget:", v10);
        v14 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("remoteWidgetsBudget")));
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = 138412546;
          v16 = *(double *)&v4;
          v17 = 2114;
          v18 = v10;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Decremented remote widget budget for activity %@, remote budget is now %{public}@", (uint8_t *)&v15, 0x16u);
        }

        -[NSMutableSet removeObject:](self->_remoteActivities, "removeObject:", v4);
        goto LABEL_12;
      }
    }
  }
LABEL_13:

}

- (void)reportActivityNoLongerRunning:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017534;
  block[3] = &unk_10015D558;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (_DASSystemBudgetManager)init
{
  _DASSystemBudgetManager *v2;
  os_log_t v3;
  OS_os_log *log;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  uint64_t v11;
  _DASBudgetPersisting *sharedMemoryPersistence;
  uint64_t v13;
  _DASNetworkUsageTracker *networkUsageTracker;
  _DASSystemBudgetManager *v15;
  uint64_t v16;
  _DASEnergyUsageTracker *energyUsageTracker;
  id *v18;
  _QWORD *v19;
  id v20;
  _QWORD *v21;
  void *v22;
  _DASBudgetPersisting *v23;
  OS_dispatch_queue *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  dispatch_queue_global_t global_queue;
  NSObject *v30;
  _QWORD handler[4];
  id *v33;
  int out_token;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id *v38;
  _QWORD v39[4];
  _DASSystemBudgetManager *v40;
  objc_super v41;

  v41.receiver = self;
  v41.super_class = (Class)_DASSystemBudgetManager;
  v2 = -[_DASSystemBudgetManager init](&v41, "init");
  if (v2)
  {
    v3 = os_log_create("com.apple.duetactivityscheduler", "systemBudgetManager");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_UTILITY, 0);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create("com.apple.dasd.systemBudgetManagement", v8);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;

    v11 = objc_claimAutoreleasedReturnValue(+[_DASSharedMemoryBudgetPersistence persistence](_DASSharedMemoryBudgetPersistence, "persistence"));
    sharedMemoryPersistence = v2->_sharedMemoryPersistence;
    v2->_sharedMemoryPersistence = (_DASBudgetPersisting *)v11;

    v13 = objc_claimAutoreleasedReturnValue(+[_DASNetworkUsageTracker sharedInstance](_DASNetworkUsageTracker, "sharedInstance"));
    networkUsageTracker = v2->_networkUsageTracker;
    v2->_networkUsageTracker = (_DASNetworkUsageTracker *)v13;

    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_100043E30;
    v39[3] = &unk_10015DFE0;
    v15 = v2;
    v40 = v15;
    v16 = objc_claimAutoreleasedReturnValue(+[_DASEnergyUsageTracker instanceWithReportingHandler:](_DASEnergyUsageTracker, "instanceWithReportingHandler:", v39));
    energyUsageTracker = v15->_energyUsageTracker;
    v15->_energyUsageTracker = (_DASEnergyUsageTracker *)v16;

    v15->_lock._os_unfair_lock_opaque = 0;
    -[_DASSystemBudgetManager instantiateConfiguredBudgets](v15, "instantiateConfiguredBudgets");
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100044008;
    v37[3] = &unk_10015E008;
    v18 = v15;
    v38 = v18;
    v19 = objc_retainBlock(v37);
    v20 = v18[3];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100044014;
    v35[3] = &unk_10015E030;
    v36 = v19;
    v21 = v19;
    objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v35);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18[3], "allValues"));
    v23 = v2->_sharedMemoryPersistence;
    v24 = v2->_queue;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[_DKKnowledgeStore knowledgeStore](_DKKnowledgeStore, "knowledgeStore"));
    v26 = objc_claimAutoreleasedReturnValue(+[_DASBudgetModulator modulatorForBudgetTypes:withBudgets:persistence:withQueue:withStore:](_DASBudgetModulator, "modulatorForBudgetTypes:withBudgets:persistence:withQueue:withStore:", CFSTR("System"), v22, v23, v24, v25));
    v27 = v18[4];
    v18[4] = (id)v26;

    -[_DASNetworkUsageTracker setModulator:](v2->_networkUsageTracker, "setModulator:", v18[4]);
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18[3], "allValues"));
    objc_msgSend(v18, "updateContextStore:", v28);

    out_token = 0;
    global_queue = dispatch_get_global_queue(-32768, 0);
    v30 = objc_claimAutoreleasedReturnValue(global_queue);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100044024;
    handler[3] = &unk_10015D9B8;
    v33 = v18;
    notify_register_dispatch("com.apple.dasd.budgetnotifications", &out_token, v30, handler);

  }
  return v2;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100044130;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001AB5C8 != -1)
    dispatch_once(&qword_1001AB5C8, block);
  return (id)qword_1001AB5D0;
}

- (id)defaultSystemEnergyBudget
{
  double v2;
  void *v3;
  void *v4;
  void **v6;
  uint64_t v7;
  id (*v8)(uint64_t);
  void *v9;
  _DASSystemBudgetManager *v10;
  uint64_t *v11;
  uint64_t v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = (double *)&v12;
  v14 = 0x2020000000;
  v15 = 0x4069000000000000;
  v6 = _NSConcreteStackBlock;
  v7 = 3221225472;
  v8 = sub_100044264;
  v9 = &unk_10015D580;
  v10 = self;
  v11 = &v12;
  if (qword_1001AB5D8 != -1)
    dispatch_once(&qword_1001AB5D8, &v6);
  v2 = v13[3];
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now", v6, v7, v8, v9, v10, v11, v12));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_DASBudget budgetWithName:capacity:allocationType:lastModulatedDate:](_DASBudget, "budgetWithName:capacity:allocationType:lastModulatedDate:", CFSTR("com.apple.dasd.systemEnergy"), 2, v3, v2));

  _Block_object_dispose(&v12, 8);
  return v4;
}

- (id)defaultSystemCellularBudget
{
  double v2;
  void *v3;
  void *v4;
  void **v6;
  uint64_t v7;
  id (*v8)(uint64_t);
  void *v9;
  _DASSystemBudgetManager *v10;
  uint64_t *v11;
  uint64_t v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = (double *)&v12;
  v14 = 0x2020000000;
  v15 = 0x4189000000000000;
  v6 = _NSConcreteStackBlock;
  v7 = 3221225472;
  v8 = sub_1000443A4;
  v9 = &unk_10015D580;
  v10 = self;
  v11 = &v12;
  if (qword_1001AB5E0 != -1)
    dispatch_once(&qword_1001AB5E0, &v6);
  v2 = v13[3];
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now", v6, v7, v8, v9, v10, v11, v12));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_DASBudget budgetWithName:capacity:allocationType:lastModulatedDate:](_DASBudget, "budgetWithName:capacity:allocationType:lastModulatedDate:", CFSTR("com.apple.dasd.systemCellular"), 1, v3, v2));

  _Block_object_dispose(&v12, 8);
  return v4;
}

- (id)customBANetworkingBudget
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_DASBudget budgetWithName:capacity:allocationType:lastModulatedDate:](_DASBudget, "budgetWithName:capacity:allocationType:lastModulatedDate:", CFSTR("com.apple.dasd.baCellular"), 0, v2, 174762.0));

  return v3;
}

- (id)remoteWidgetBudget
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_DASBudget budgetWithName:capacity:allocationType:lastModulatedDate:](_DASBudget, "budgetWithName:capacity:allocationType:lastModulatedDate:", CFSTR("com.apple.dasd.remoteWidget"), 0, v2, 750.0));

  return v3;
}

- (id)dataBudgetForActivity:(id)a3
{
  id v4;
  void *v5;
  NSDictionary *budgets;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clientDataBudgetName"));

  budgets = self->_budgets;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clientDataBudgetName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](budgets, "objectForKeyedSubscript:", v7));

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](budgets, "objectForKeyedSubscript:", CFSTR("com.apple.dasd.systemCellular")));
  }

  return v8;
}

- (void)instantiateConfiguredBudgets
{
  OS_dispatch_queue *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100044598;
  block[3] = &unk_10015D4E0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)unlocked_instantiateConfiguredBudgets
{
  _DASBudgetPersisting *sharedMemoryPersistence;
  void *v4;
  void *v5;
  NSDictionary *v6;
  NSUInteger v7;
  NSObject *log;
  _BOOL4 v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  void *v13;
  id v14;
  NSDictionary *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  void *v21;
  NSDictionary *v22;
  NSDictionary *budgets;
  NSObject *v24;
  NSDictionary *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  NSDictionary *v32;

  sharedMemoryPersistence = self->_sharedMemoryPersistence;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSystemBudgetManager requiredBudgetNames](self, "requiredBudgetNames"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBudgetPersisting loadBudgetsWithExpectedNames:](sharedMemoryPersistence, "loadBudgetsWithExpectedNames:", v4));

  v6 = (NSDictionary *)objc_alloc_init((Class)NSMutableArray);
  -[NSDictionary addObjectsFromArray:](v6, "addObjectsFromArray:", v5);
  v7 = -[NSDictionary count](v6, "count");
  log = self->_log;
  v9 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (!v9)
      goto LABEL_7;
    *(_DWORD *)buf = 138412290;
    v32 = v6;
    v10 = "Found stored budgets: %@";
    v11 = log;
    v12 = 12;
  }
  else
  {
    if (!v9)
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v10 = "No stored budgets";
    v11 = log;
    v12 = 2;
  }
  _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
LABEL_7:
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSystemBudgetManager getMissingBudgetsWithExistingBudgets:](self, "getMissingBudgetsWithExistingBudgets:", v6));
  v14 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v14, "addEntriesFromDictionary:", v13);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v15 = v6;
  v16 = -[NSDictionary countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "name", (_QWORD)v26));
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v20, v21);

      }
      v17 = -[NSDictionary countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v17);
  }

  v22 = (NSDictionary *)objc_msgSend(v14, "copy");
  budgets = self->_budgets;
  self->_budgets = v22;

  v24 = self->_log;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = self->_budgets;
    *(_DWORD *)buf = 138412290;
    v32 = v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Loaded + new Budgets: %@", buf, 0xCu);
  }

}

- (id)requiredBudgetNames
{
  return +[NSMutableSet setWithObjects:](NSMutableSet, "setWithObjects:", CFSTR("com.apple.dasd.systemEnergy"), CFSTR("com.apple.dasd.systemCellular"), CFSTR("com.apple.dasd.baCellular"), CFSTR("com.apple.dasd.remoteWidget"), 0);
}

- (id)getMissingBudgetsWithExistingBudgets:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  NSObject *log;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *j;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *context;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  _BYTE v38[128];
  _BYTE v39[128];

  v4 = a3;
  context = objc_autoreleasePoolPush();
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSystemBudgetManager requiredBudgetNames](self, "requiredBudgetNames"));
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));

        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
          objc_msgSend(v6, "removeObject:", v13);

        }
        else
        {
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Skipping adding stored budget without a name", buf, 2u);
          }
        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
    }
    while (v8);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v15 = v6;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
  if (v16)
  {
    v17 = v16;
    v18 = 0;
    v19 = *(_QWORD *)v29;
    while (1)
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(_QWORD *)v29 != v19)
          objc_enumerationMutation(v15);
        v21 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)j);
        if (objc_msgSend(v21, "isEqualToString:", CFSTR("com.apple.dasd.systemEnergy")))
        {
          v22 = objc_claimAutoreleasedReturnValue(-[_DASSystemBudgetManager defaultSystemEnergyBudget](self, "defaultSystemEnergyBudget"));
        }
        else if (objc_msgSend(v21, "isEqualToString:", CFSTR("com.apple.dasd.systemCellular")))
        {
          v22 = objc_claimAutoreleasedReturnValue(-[_DASSystemBudgetManager defaultSystemCellularBudget](self, "defaultSystemCellularBudget"));
        }
        else if (objc_msgSend(v21, "isEqualToString:", CFSTR("com.apple.dasd.baCellular")))
        {
          v22 = objc_claimAutoreleasedReturnValue(-[_DASSystemBudgetManager customBANetworkingBudget](self, "customBANetworkingBudget"));
        }
        else
        {
          if (!objc_msgSend(v21, "isEqualToString:", CFSTR("com.apple.dasd.remoteWidget")))
            goto LABEL_26;
          v22 = objc_claimAutoreleasedReturnValue(-[_DASSystemBudgetManager remoteWidgetBudget](self, "remoteWidgetBudget"));
        }
        v23 = (void *)v22;

        v18 = v23;
LABEL_26:
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, v21);
        v24 = self->_log;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v37 = v18;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Added missing budget: %@", buf, 0xCu);
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
      if (!v17)
        goto LABEL_32;
    }
  }
  v18 = 0;
LABEL_32:

  objc_autoreleasePoolPop(context);
  return v5;
}

- (id)budgetKeyPathForBudgetName:(id)a3
{
  id v3;
  const __CFString *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = CFSTR("com.apple.dasd.baCellular");
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.dasd.baCellular"))
    || (v4 = CFSTR("com.apple.dasd.remoteWidget"),
        objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.dasd.remoteWidget"))))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/system/budget/%@"), v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", v5));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)postNotificationWithBudget:(id)a3
{
  double v3;
  double v4;
  void *v5;
  unsigned int v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  unsigned int v17;
  const __CFString *v18;
  double v19;
  id v20;

  v20 = a3;
  objc_msgSend(v20, "balance");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "name"));
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.dasd.systemEnergy"));

  if (v6)
  {
    v7 = CFSTR("Negative");
    if (v4 > 0.0)
      v7 = CFSTR("Positive");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Energy Budget is %@"), v7));
    objc_msgSend(v20, "balance");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Exact budget value is %.0lf"), v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[_DASNotificationManager sharedManager](_DASNotificationManager, "sharedManager"));
    v12 = v11;
    v13 = v8;
    v14 = v10;
    v15 = 0;
LABEL_9:
    objc_msgSend(v11, "postNotificationAtDate:withTitle:withTextContent:icon:url:expirationDate:", 0, v13, v14, v15, 0, 0);

    goto LABEL_10;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "name"));
  v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.dasd.systemCellular"));

  if (v17)
  {
    v18 = CFSTR("Negative");
    if (v4 > 0.0)
      v18 = CFSTR("Positive");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Data Budget is %@"), v18));
    objc_msgSend(v20, "balance");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Exact budget value is %.1lfMB"), v19 * 0.000000953674316));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[_DASNotificationManager sharedManager](_DASNotificationManager, "sharedManager"));
    v12 = v11;
    v15 = CFSTR("network");
    v13 = v8;
    v14 = v10;
    goto LABEL_9;
  }
LABEL_10:

}

- (void)onBudgetChange:(id)a3
{
  id v4;
  double v5;
  void *v6;
  NSObject *log;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  void *v16;
  id v17;
  unsigned int v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;

  v4 = a3;
  objc_msgSend(v4, "balance");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v5 > 0.0));
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v8 = log;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v20 = 138412546;
    v21 = v9;
    v22 = 2114;
    v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Updating budget status for %@ to %{public}@", (uint8_t *)&v20, 0x16u);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](_CDClientContext, "userContext"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.dasd.systemEnergy"));

  if (v12)
  {
    v13 = objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForEnergyBudgetRemainingStatus](_CDContextQueries, "keyPathForEnergyBudgetRemainingStatus"));
LABEL_7:
    v16 = (void *)v13;
LABEL_8:
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v6, v16);
    goto LABEL_9;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.dasd.systemCellular"));

  if (v15)
  {
    v13 = objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForNetworkingBudgetRemainingStatus](_CDContextQueries, "keyPathForNetworkingBudgetRemainingStatus"));
    goto LABEL_7;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSystemBudgetManager budgetKeyPathForBudgetName:](self, "budgetKeyPathForBudgetName:", v19));

  if (v16)
    goto LABEL_8;
LABEL_9:

  v17 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.duetactivityscheduler"));
  v18 = objc_msgSend(v17, "BOOLForKey:", CFSTR("postBudgetNotifications"));

  if (v18)
    -[_DASSystemBudgetManager postNotificationWithBudget:](self, "postNotificationWithBudget:", v4);

}

- (void)updateContextStore:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[_DASSystemBudgetManager onBudgetChange:](self, "onBudgetChange:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8));
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

+ (id)involvedProcessesForActivity:(id)a3 withIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relatedApplications"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "involvedProcesses"));

  if (objc_msgSend(v9, "count"))
    objc_msgSend(v7, "addObjectsFromArray:", v9);
  if (objc_msgSend(v8, "count"))
    objc_msgSend(v7, "addObjectsFromArray:", v8);
  if (v5)
    objc_msgSend(v7, "addObject:", v5);

  return v7;
}

+ (id)identifierWithActivity:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "clientName"));
  if ((objc_msgSend(v4, "isEqualToString:", _DASClientNameXPCActivity) & 1) != 0)
    goto LABEL_5;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "clientName"));
  if ((objc_msgSend(v5, "isEqualToString:", _DASClientNameBGST) & 1) != 0
    || objc_msgSend(v3, "delayedStart"))
  {

LABEL_5:
    goto LABEL_6;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", kNWEndpointKey));

  if (v11)
  {
    v7 = CFSTR("nsurlsessiond");
    goto LABEL_18;
  }
LABEL_6:
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleId"));

  if (v6)
  {
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleId"));
  }
  else
  {
    if (objc_msgSend(v3, "pid"))
    {
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue(+[_DASUtils processNameFromPID:](_DASUtils, "processNameFromPID:", objc_msgSend(v3, "pid")));
      if (v7)
        goto LABEL_18;
      v8 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("systemBudgetManager")));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_1000E15DC(v3);

    }
    v9 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("systemBudgetManager")));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000E152C(v3);

    v7 = 0;
  }
LABEL_18:

  return v7;
}

- (id)allBudgets
{
  void *v3;
  NSDictionary *budgets;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  budgets = self->_budgets;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004545C;
  v8[3] = &unk_10015DAF0;
  v9 = v3;
  v5 = v3;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](budgets, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = objc_msgSend(v5, "copy");

  return v6;
}

- (double)balanceForBudgetWithName:(id)a3
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_budgets, "objectForKeyedSubscript:", a3));
  objc_msgSend(v3, "balance");
  v5 = v4;

  return v5;
}

- (double)capacityForBudgetWithName:(id)a3
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_budgets, "objectForKeyedSubscript:", a3));
  objc_msgSend(v3, "capacity");
  v5 = v4;

  return v5;
}

- (void)setBalance:(double)a3 forBudgetWithName:(id)a4
{
  id v6;
  NSObject *log;
  void *v8;
  void *v9;
  int v10;
  double v11;
  __int16 v12;
  id v13;

  v6 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134218242;
    v11 = a3;
    v12 = 2112;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Set Balance: %.2lf for %@", (uint8_t *)&v10, 0x16u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_budgets, "objectForKeyedSubscript:", v6));
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "setBalance:", a3);
    -[_DASSystemBudgetManager updateBudget:](self, "updateBudget:", v9);
  }

}

- (void)decrementBy:(double)a3 forBudgetWithName:(id)a4
{
  id v6;
  NSObject *log;
  void *v8;
  void *v9;
  int v10;
  double v11;
  __int16 v12;
  id v13;

  v6 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134218242;
    v11 = a3;
    v12 = 2112;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Decrement budget by: %.2lf for %@", (uint8_t *)&v10, 0x16u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_budgets, "objectForKeyedSubscript:", v6));
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "decrementBy:", a3);
    -[_DASSystemBudgetManager updateBudget:](self, "updateBudget:", v9);
  }

}

- (void)setCapacity:(double)a3 forBudgetWithName:(id)a4
{
  void *v6;
  id v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_budgets, "objectForKeyedSubscript:", a4));
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "setCapacity:", a3);
    -[_DASSystemBudgetManager updateBudget:](self, "updateBudget:", v7);
    v6 = v7;
  }

}

- (void)updateBudget:(id)a3
{
  -[_DASBudgetPersisting updateBudget:](self->_sharedMemoryPersistence, "updateBudget:", a3);
}

- (void)startTrackingActivity:(id)a3
{
  NSMutableSet *remoteActivities;
  NSMutableSet *v5;
  NSMutableSet *v6;
  id v7;

  v7 = a3;
  -[_DASEnergyUsageTracker startTrackingActivity:](self->_energyUsageTracker, "startTrackingActivity:", v7);
  -[_DASNetworkUsageTracker startTrackingActivity:](self->_networkUsageTracker, "startTrackingActivity:", v7);
  if (objc_msgSend(v7, "targetDevice") == (id)3)
  {
    remoteActivities = self->_remoteActivities;
    if (!remoteActivities)
    {
      v5 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      v6 = self->_remoteActivities;
      self->_remoteActivities = v5;

      remoteActivities = self->_remoteActivities;
    }
    -[NSMutableSet addObject:](remoteActivities, "addObject:", v7);
  }

}

- (void)reportActivityRunning:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100045964;
  block[3] = &unk_10015D558;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)reportActivityRunningWithParameters:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000459EC;
  block[3] = &unk_10015D558;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)reportActivityNoLongerRunningWithParameters:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100045A74;
  block[3] = &unk_10015D558;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)reportUpdateForActivity:(id)a3 withDataConsumed:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  _DASSystemBudgetManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100045B2C;
  block[3] = &unk_10015D530;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)reportMetricsForNetworkUsage:(double)a3 forDataBudget:(id)a4 totalUsage:(double)a5 usageInCell:(double)a6 usageInInexpensive:(double)a7 forActivity:(id)a8
{
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100045EF0;
  v15[3] = &unk_10015E058;
  v16 = a4;
  v17 = a8;
  v18 = a3;
  v19 = a6;
  v20 = a5;
  v21 = a7;
  v13 = v17;
  v14 = v16;
  AnalyticsSendEventLazy(CFSTR("com.apple.dasd.advancedmetrics"), v15);

}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (NSDictionary)budgets
{
  return self->_budgets;
}

- (void)setBudgets:(id)a3
{
  objc_storeStrong((id *)&self->_budgets, a3);
}

- (_DASBudgetModulator)systemBudgetModulator
{
  return self->_systemBudgetModulator;
}

- (void)setSystemBudgetModulator:(id)a3
{
  objc_storeStrong((id *)&self->_systemBudgetModulator, a3);
}

- (_DASBudgetPersisting)sharedMemoryPersistence
{
  return self->_sharedMemoryPersistence;
}

- (void)setSharedMemoryPersistence:(id)a3
{
  objc_storeStrong((id *)&self->_sharedMemoryPersistence, a3);
}

- (_DASNetworkUsageTracker)networkUsageTracker
{
  return self->_networkUsageTracker;
}

- (void)setNetworkUsageTracker:(id)a3
{
  objc_storeStrong((id *)&self->_networkUsageTracker, a3);
}

- (_DASEnergyUsageTracker)energyUsageTracker
{
  return self->_energyUsageTracker;
}

- (void)setEnergyUsageTracker:(id)a3
{
  objc_storeStrong((id *)&self->_energyUsageTracker, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (NSMutableSet)remoteActivities
{
  return self->_remoteActivities;
}

- (void)setRemoteActivities:(id)a3
{
  objc_storeStrong((id *)&self->_remoteActivities, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteActivities, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_energyUsageTracker, 0);
  objc_storeStrong((id *)&self->_networkUsageTracker, 0);
  objc_storeStrong((id *)&self->_sharedMemoryPersistence, 0);
  objc_storeStrong((id *)&self->_systemBudgetModulator, 0);
  objc_storeStrong((id *)&self->_budgets, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
