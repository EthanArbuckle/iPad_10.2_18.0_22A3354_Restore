@implementation _DASBudgetModulator

- (id)initForBudgetTypes:(id)a3 withBudgets:(id)a4 persistence:(id)a5 withQueue:(id)a6 withStore:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  os_log_t v21;
  void *v22;
  dispatch_source_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  unsigned int v31;
  int v32;
  int v33;
  NSObject *v34;
  _QWORD *v35;
  dispatch_block_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  double v41;
  NSObject *v42;
  NSObject *v43;
  dispatch_time_t v44;
  NSObject *v45;
  _QWORD v47[4];
  _QWORD *v48;
  _QWORD block[4];
  id v50;
  objc_super v51;
  uint8_t buf[4];
  double v53;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v51.receiver = self;
  v51.super_class = (Class)_DASBudgetModulator;
  v17 = -[_DASBudgetModulator init](&v51, "init");
  if (v17)
  {
    if (v13)
      v18 = v13;
    else
      v18 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v19 = (void *)*((_QWORD *)v17 + 5);
    *((_QWORD *)v17 + 5) = v18;

    objc_storeStrong((id *)v17 + 1, a5);
    objc_storeStrong((id *)v17 + 2, a6);
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("budgetModulation%@"), v12)));
    v21 = os_log_create("com.apple.duetactivityscheduler", (const char *)objc_msgSend(v20, "UTF8String"));
    v22 = (void *)*((_QWORD *)v17 + 12);
    *((_QWORD *)v17 + 12) = v21;

    v23 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *((dispatch_queue_t *)v17 + 2));
    v24 = (void *)*((_QWORD *)v17 + 6);
    *((_QWORD *)v17 + 6) = v23;

    objc_storeStrong((id *)v17 + 7, a7);
    v25 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
    v26 = (void *)*((_QWORD *)v17 + 4);
    *((_QWORD *)v17 + 4) = v25;

    v27 = objc_alloc_init((Class)NSMutableDictionary);
    v28 = (void *)*((_QWORD *)v17 + 11);
    *((_QWORD *)v17 + 11) = v27;

    v29 = objc_alloc_init((Class)NSMutableDictionary);
    v30 = (void *)*((_QWORD *)v17 + 10);
    *((_QWORD *)v17 + 10) = v29;

    v31 = objc_msgSend(v12, "isEqualToString:", CFSTR("Widgets"));
    if (v31)
      v32 = 900;
    else
      v32 = 1800;
    dword_1001AB408 = v32;
    if (v31)
      v33 = 96;
    else
      v33 = 48;
    dword_1001AB40C = v33;
    objc_msgSend(v17, "registerForTrial");
    v34 = *((_QWORD *)v17 + 6);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000214F0;
    block[3] = &unk_10015D4E0;
    v35 = v17;
    v50 = v35;
    v36 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_INHERIT_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
    dispatch_source_set_event_handler(v34, v36);

    v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastModulationDate"));
    v38 = (void *)v35[3];
    v35[3] = v37;

    v39 = dword_1001AB408;
    v40 = (void *)v35[3];
    if (v40)
    {
      objc_msgSend(v40, "timeIntervalSinceNow");
      v39 = llround(fmax(v41 + (double)v39, 0.0));
    }
    v42 = *((_QWORD *)v17 + 12);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v53 = (double)v39 / 60.0;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Setting timer to fire ~%2.0fm from now", buf, 0xCu);
    }
    v43 = *((_QWORD *)v17 + 6);
    v44 = dispatch_walltime(0, 1000000000 * v39 + 60000000000);
    dispatch_source_set_timer(v43, v44, 1000000000 * dword_1001AB408, 0xDBCAC8E00uLL);
    v45 = *((_QWORD *)v17 + 2);
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_100021520;
    v47[3] = &unk_10015D4E0;
    v48 = v35;
    dispatch_async(v45, v47);
    dispatch_activate(*((dispatch_object_t *)v17 + 6));

  }
  return v17;
}

+ (id)modulatorForBudgetTypes:(id)a3 withBudgets:(id)a4 persistence:(id)a5 withQueue:(id)a6 withStore:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1)), "initForBudgetTypes:withBudgets:persistence:withQueue:withStore:", v16, v15, v14, v13, v12);

  return v17;
}

- (void)registerForTrial
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[_DASTrialManager sharedInstance](_DASTrialManager, "sharedInstance"));
  objc_msgSend(v3, "addDelegate:", self);
  -[_DASBudgetModulator updateTrialParametersWithManager:](self, "updateTrialParametersWithManager:", v3);

}

- (void)updateTrialParametersWithManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *log;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "factorWithName:", CFSTR("Budget_UsageModulationMaximumInitialAllotmentPercentage")));
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "doubleValue");
    qword_1001AA1A8 = v7;
  }
  v8 = qword_1001AA1B0;
  v9 = qword_1001AA1B8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "factorWithName:", CFSTR("Budget_MinimumBatteryLevelForFullUsageInitialAllotment")));

  if (v10)
  {
    objc_msgSend(v10, "doubleValue");
    v9 = v11;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "factorWithName:", CFSTR("Budget_MinimumBatteryForUsageInitialAllotment")));

  if (v12)
  {
    objc_msgSend(v12, "doubleValue");
    v8 = v13;
  }
  if (*(double *)&v8 <= *(double *)&v9)
  {
    qword_1001AA1B0 = v8;
    qword_1001AA1B8 = v9;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "factorWithName:", CFSTR("Budget_MinimumUsageAllotmentSlotLookaheadDuration")));

  if (v14)
  {
    objc_msgSend(v14, "doubleValue");
    qword_1001AA1C0 = v15;
  }
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 134218752;
    v18 = qword_1001AA1A8;
    v19 = 2048;
    v20 = qword_1001AA1B0;
    v21 = 2048;
    v22 = qword_1001AA1B8;
    v23 = 2048;
    v24 = qword_1001AA1C0;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Config: Initial Allotment: %.2f, Minimum Level: %.0f, Minimum Full Level: %.0f, Minimum Lookahead: %.0f", (uint8_t *)&v17, 0x2Au);
  }

}

- (void)locked_replaceBudgetsToBeModulated:(id)a3
{
  OS_dispatch_queue *queue;
  id v5;
  NSArray *v6;
  NSArray *budgets;
  NSDate *v8;
  NSDate *lastModulationDate;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)queue);
  -[NSMutableDictionary removeAllObjects](self->_lastPredictionUpdateForWidgets, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_predictedBudgetsForWidgets, "removeAllObjects");
  v6 = (NSArray *)objc_msgSend(v5, "copy");
  budgets = self->_budgets;
  self->_budgets = v6;

  v8 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  lastModulationDate = self->_lastModulationDate;
  self->_lastModulationDate = v8;

  -[_DASBudgetModulator modulateBudgets:lastModulatedAt:forNumberOfModulationSlots:atDate:](self, "modulateBudgets:lastModulatedAt:forNumberOfModulationSlots:atDate:", v5, 0, 1, self->_lastModulationDate);
  -[_DASBudgetPersisting saveBudgets:](self->_persistence, "saveBudgets:", self->_budgets);
}

- (void)locked_addBudgetsToBeModulated:(id)a3
{
  NSArray *v4;
  NSArray *budgets;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_lastModulationDate)
    -[_DASBudgetModulator modulateBudgets:lastModulatedAt:forNumberOfModulationSlots:atDate:](self, "modulateBudgets:lastModulatedAt:forNumberOfModulationSlots:atDate:", v6, 0, 1);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSArray arrayByAddingObjectsFromArray:](self->_budgets, "arrayByAddingObjectsFromArray:", v6));
  budgets = self->_budgets;
  self->_budgets = v4;

  -[_DASBudgetPersisting saveBudgets:](self->_persistence, "saveBudgets:", self->_budgets);
}

- (void)locked_updateBudgetsToBeModulatedAdditions:(id)a3 removals:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSArray *v14;
  NSArray *budgets;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_lastModulationDate)
    -[_DASBudgetModulator modulateBudgets:lastModulatedAt:forNumberOfModulationSlots:atDate:](self, "modulateBudgets:lastModulatedAt:forNumberOfModulationSlots:atDate:", v6, 0, 1);
  v8 = -[NSArray mutableCopy](self->_budgets, "mutableCopy");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v8, "removeObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v13), (_QWORD)v16);
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  objc_msgSend(v8, "addObjectsFromArray:", v6);
  v14 = (NSArray *)objc_msgSend(v8, "copy");
  budgets = self->_budgets;
  self->_budgets = v14;

  -[_DASBudgetPersisting saveBudgets:](self->_persistence, "saveBudgets:", self->_budgets);
}

- (int)numberOfModulationFromDate:(id)a3 toDate:(id)a4
{
  double v4;

  objc_msgSend(a4, "timeIntervalSinceDate:", a3);
  return vcvtmd_s64_f64((v4 + 60.0) / (86400.0 / (double)dword_1001AB40C));
}

- (double)relativeUsageAtDate:(id)a3 withTimeline:(id)a4
{
  id v6;
  id v7;
  double v8;
  void *v9;
  NSObject *log;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  int v42;
  id v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isUnavailable"))
  {
    v8 = 1.0 / (double)dword_1001AB40C;
  }
  else
  {
    v9 = objc_autoreleasePoolPush();
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v42 = 138412290;
      v43 = v7;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Modulation Timeline: %@", (uint8_t *)&v42, 0xCu);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startDate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueAtDate:", v11));
    objc_msgSend(v12, "doubleValue");
    v14 = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startDate"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dateByAddingTimeInterval:", (double)dword_1001AB408));

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "endDate"));
    objc_msgSend(v16, "timeIntervalSinceDate:", v17);
    v19 = v18;

    if (v19 >= 0.0)
    {
      v22 = v16;
    }
    else
    {
      do
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueAtDate:", v16));
        objc_msgSend(v20, "doubleValue");
        v14 = v14 + v21;

        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "dateByAddingTimeInterval:", (double)dword_1001AB408));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "endDate"));
        objc_msgSend(v22, "timeIntervalSinceDate:", v23);
        v25 = v24;

        v16 = v22;
      }
      while (v25 < 0.0);
    }
    v26 = *(double *)&qword_1001AA1C0;
    if (*(double *)&qword_1001AA1C0 > (double)dword_1001AB408)
      v26 = (double)dword_1001AB408;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateByAddingTimeInterval:", v26));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startDate"));
    objc_msgSend(v27, "timeIntervalSinceDate:", v28);
    v30 = v29;

    if (v30 >= 0.0)
    {
      v31 = v27;
    }
    else
    {
      do
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "dateByAddingTimeInterval:", 86400.0));

        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startDate"));
        objc_msgSend(v31, "timeIntervalSinceDate:", v32);
        v34 = v33;

        v27 = v31;
      }
      while (v34 < 0.0);
    }
    v35 = self->_log;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      v36 = v35;
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v14));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueAtDate:", v31));
      v42 = 138412802;
      v43 = v37;
      v44 = 2112;
      v45 = v31;
      v46 = 2112;
      v47 = v38;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "All Likelihoods: %@, Value at %@: %@", (uint8_t *)&v42, 0x20u);

    }
    if (v14 == 0.0)
    {
      v8 = 1.0 / (double)dword_1001AB40C;
    }
    else
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueAtDate:", v31));
      objc_msgSend(v39, "doubleValue");
      v8 = v40 / v14;

    }
    objc_autoreleasePoolPop(v9);
  }

  return v8;
}

- (id)usageTimeline
{
  void *v3;
  void *v4;
  double v5;
  _DKPredictionTimeline *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v4 = v3;
  if (self->_usage && (objc_msgSend(v3, "timeIntervalSinceDate:", self->_lastUsageTimelineUpdate), v5 < 21600.0))
  {
    v6 = self->_usage;
  }
  else
  {
    v7 = objc_autoreleasePoolPush();
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[_DKPredictor predictorWithKnowledgeStore:](_DKPredictor, "predictorWithKnowledgeStore:", self->_store));
    v6 = (_DKPredictionTimeline *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceActivityLikelihood"));
    objc_storeStrong((id *)&self->_usage, v6);
    objc_storeStrong((id *)&self->_lastUsageTimelineUpdate, v4);

    objc_autoreleasePoolPop(v7);
  }

  return v6;
}

- (void)locked_modulateBudgets
{
  void *v3;
  NSDate *lastModulationDate;
  uint64_t v5;
  NSObject *log;
  NSDate *v7;
  NSObject *v8;
  NSArray *budgets;
  NSDate *v10;
  NSDate *v11;
  NSDate *v12;
  int v13;
  NSArray *v14;
  __int16 v15;
  NSDate *v16;
  __int16 v17;
  int v18;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  lastModulationDate = self->_lastModulationDate;
  if (lastModulationDate)
  {
    v5 = -[_DASBudgetModulator numberOfModulationFromDate:toDate:](self, "numberOfModulationFromDate:toDate:", lastModulationDate, v3);
    if (!(_DWORD)v5)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      {
        LOWORD(v13) = 0;
        _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Last updated budgets too recently. Exiting.", (uint8_t *)&v13, 2u);
      }
      goto LABEL_9;
    }
  }
  else
  {
    v5 = 1;
  }
  v7 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v8 = self->_log;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    budgets = self->_budgets;
    v10 = self->_lastModulationDate;
    v13 = 138412802;
    v14 = budgets;
    v15 = 2112;
    v16 = v10;
    v17 = 1024;
    v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Last modulated budgets %@ at %@, modulating for %d slots from then to now", (uint8_t *)&v13, 0x1Cu);
  }
  -[_DASBudgetModulator modulateBudgets:lastModulatedAt:forNumberOfModulationSlots:atDate:](self, "modulateBudgets:lastModulatedAt:forNumberOfModulationSlots:atDate:", self->_budgets, self->_lastModulationDate, v5, v7);
  v11 = self->_lastModulationDate;
  self->_lastModulationDate = v7;
  v12 = v7;

  -[_DASBudgetPersisting saveBudgets:](self->_persistence, "saveBudgets:", self->_budgets);
  -[_DASBudgetPersisting saveModulationDate:](self->_persistence, "saveModulationDate:", v12);

LABEL_9:
}

- (void)modulateBudgets:(id)a3 lastModulatedAt:(id)a4 forNumberOfModulationSlots:(int)a5 atDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  __int128 v13;
  id v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  double v22;
  double v23;
  double v24;
  NSObject *v25;
  double v26;
  void *v27;
  double v28;
  NSObject *log;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  double v44;
  NSObject *v45;
  NSObject *v46;
  double v47;
  double v48;
  double v49;
  uint64_t v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  NSObject *v55;
  NSObject *v56;
  double v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  double v62;
  NSObject *v63;
  NSObject *v64;
  double v65;
  __int128 v66;
  id v67;
  uint64_t v68;
  id v69;
  id obj;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint8_t buf[4];
  double v76;
  __int16 v77;
  double v78;
  __int16 v79;
  double v80;
  _BYTE v81[128];

  v10 = a3;
  v11 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  obj = v10;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v72;
    v16 = -1.0;
    v17 = 0.0;
    *(_QWORD *)&v13 = 134218242;
    v66 = v13;
    v67 = a4;
    v68 = *(_QWORD *)v72;
LABEL_3:
    v18 = 0;
    v69 = v14;
    while (2)
    {
      if (*(_QWORD *)v72 != v15)
        objc_enumerationMutation(obj);
      v19 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v18);
      switch(objc_msgSend(v19, "allocationType", v66))
      {
        case 0u:
          v17 = 0.0;
          goto LABEL_38;
        case 1u:
          objc_msgSend(v19, "capacity");
          v17 = v26 * (double)a5 / (double)dword_1001AB40C;
          goto LABEL_38;
        case 2u:
          if (a4)
          {
            if (v16 < 0.0)
            {
              v27 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBudgetModulator usageTimeline](self, "usageTimeline"));
              -[_DASBudgetModulator relativeUsageAtDate:withTimeline:](self, "relativeUsageAtDate:withTimeline:", v11, v27);
              v16 = v28;

            }
            log = self->_log;
            if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134217984;
              v76 = v16 * 100.0;
              _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Allocating %2.2f%% of budget based on usage", buf, 0xCu);
            }
            objc_msgSend(v19, "capacity");
            v17 = v16 * v30;
            if (objc_msgSend(v19, "allocationType"))
            {
LABEL_40:
              if (v17 != 0.0)
              {
                v46 = self->_log;
                if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v76 = *(double *)&v19;
                  v77 = 2048;
                  v78 = v17;
                  _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Increment budget %@ by %10.2lf", buf, 0x16u);
                }
                objc_msgSend(v19, "incrementBy:", v17);
              }
              goto LABEL_56;
            }
          }
          else
          {
            v34 = (void *)objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](_CDClientContext, "userContext"));
            v35 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForBatteryLevel](_CDContextQueries, "keyPathForBatteryLevel"));
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", v35));
            objc_msgSend(v36, "doubleValue");
            v38 = v37;

            v39 = 0.0;
            if (v38 >= *(double *)&qword_1001AA1B0)
            {
              v39 = *(double *)&qword_1001AA1A8;
              if (v38 < *(double *)&qword_1001AA1B8)
                v39 = (v38 - *(double *)&qword_1001AA1B0)
                    * *(double *)&qword_1001AA1A8
                    / (*(double *)&qword_1001AA1B8 - *(double *)&qword_1001AA1B0);
            }
            objc_msgSend(v19, "capacity");
            v17 = v39 * v40;
            v41 = self->_log;
            if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
            {
              v42 = v41;
              v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "name"));
              *(_DWORD *)buf = v66;
              v76 = v17;
              v77 = 2112;
              v78 = *(double *)&v43;
              _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "Allocating %.0f budget on start for %@", buf, 0x16u);

            }
            v15 = v68;
            v14 = v69;
            if (objc_msgSend(v19, "allocationType"))
            {
LABEL_49:
              v60 = self->_log;
              if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v76 = *(double *)&v19;
                v77 = 2048;
                v78 = v17;
                _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "Set budget balance for %@ to %10.2lf", buf, 0x16u);
              }
              v61 = v19;
              v62 = v17;
LABEL_55:
              objc_msgSend(v61, "setBalance:", v62);
              goto LABEL_56;
            }
          }
LABEL_44:
          objc_msgSend(v19, "balance");
          v48 = v47;
          objc_msgSend(v19, "capacity");
          if (v48 != v49)
          {
            v50 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lastModulatedDate"));
            if (!v50
              || (v51 = (void *)v50,
                  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lastModulatedDate")),
                  objc_msgSend(v11, "timeIntervalSinceDate:", v52),
                  v54 = v53,
                  v52,
                  v14 = v69,
                  v51,
                  v54 >= 86400.0))
            {
              v63 = self->_log;
              if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
              {
                v64 = v63;
                v65 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "name")));
                *(_DWORD *)buf = 138412546;
                v76 = v65;
                v77 = 2048;
                v78 = v17;
                _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_INFO, "Set %@ balance to %10.2lf", buf, 0x16u);

                v14 = v69;
              }
              objc_msgSend(v19, "capacity");
              v61 = v19;
              goto LABEL_55;
            }
          }
          v55 = self->_log;
          if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
          {
            v56 = v55;
            v57 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "name")));
            v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lastModulatedDate"));
            v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "dateByAddingTimeInterval:", 86400.0));
            *(_DWORD *)buf = 138412546;
            v76 = v57;
            v77 = 2112;
            v78 = *(double *)&v59;
            _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "%@ next refresh at %@", buf, 0x16u);

            v15 = v68;
            v14 = v69;

          }
LABEL_56:
          if ((id)++v18 != v14)
            continue;
          v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
          if (!v14)
            goto LABEL_58;
          goto LABEL_3;
        case 3u:
          if (v16 < 0.0)
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBudgetModulator usageTimeline](self, "usageTimeline"));
            -[_DASBudgetModulator relativeUsageAtDate:withTimeline:](self, "relativeUsageAtDate:withTimeline:", v11, v31);
            v16 = v32;

          }
          objc_msgSend(v19, "capacity");
          v17 = v33 * (1.0 - v16);
          goto LABEL_38;
        case 4u:
          if (a4)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "widgetBudgetID"));
            if (a5 < 1)
            {
              v22 = 0.0;
            }
            else
            {
              v21 = 0;
              v22 = 0.0;
              do
              {
                v23 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dateByAddingTimeInterval:", (double)-(v21 * dword_1001AB408))));
                -[_DASBudgetModulator locked_budgetAllocationProportionAtDate:forWidgetBudgetID:](self, "locked_budgetAllocationProportionAtDate:forWidgetBudgetID:", *(_QWORD *)&v23, v20);
                v16 = v24;
                v22 = v22 + v24;
                v25 = self->_log;
                if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412802;
                  v76 = v23;
                  v77 = 2048;
                  v78 = v16;
                  v79 = 2048;
                  v80 = v22;
                  _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Relative usage at slot date %@ is %5.5f, total proportion until now is %5.5f", buf, 0x20u);
                }

                ++v21;
              }
              while (a5 != v21);
            }

            a4 = v67;
            v15 = v68;
            v14 = v69;
          }
          else
          {
            v22 = 0.05;
          }
          objc_msgSend(v19, "capacity");
          v17 = v22 * v44;
          v45 = self->_log;
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218240;
            v76 = v22 * 100.0;
            v77 = 2048;
            v78 = v17;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "Allocating %5.5f%% of widget budget based on usage, resulting in a adjustment of %5.5f", buf, 0x16u);
          }
          goto LABEL_38;
        default:
LABEL_38:
          if (!objc_msgSend(v19, "allocationType"))
            goto LABEL_44;
          if (a4)
            goto LABEL_40;
          goto LABEL_49;
      }
    }
  }
LABEL_58:

}

- (void)updateCapacity:(double)a3 forBudgetWithName:(id)a4
{
  id v6;
  NSArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  unsigned int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v6 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = self->_budgets;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name", (_QWORD)v15));
        v14 = objc_msgSend(v13, "isEqualToString:", v6);

        if (v14)
        {
          objc_msgSend(v12, "setCapacity:", a3);
          goto LABEL_11;
        }
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  -[_DASBudgetPersisting saveBudgets:](self->_persistence, "saveBudgets:", self->_budgets);
}

- (int)computeSlotForDate:(id)a3 relativeToDate:(id)a4
{
  double v4;

  objc_msgSend(a3, "timeIntervalSinceDate:", a4);
  if (v4 < 0.0)
    v4 = v4 + ceil(v4 / -86400.0) * 86400.0;
  return (uint64_t)v4 / dword_1001AB408 % dword_1001AB40C;
}

- (double)locked_budgetAllocationProportionAtDate:(id)a3 forWidgetBudgetID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSDate *v9;
  int v10;
  NSObject *v11;
  NSDate *lastStartOfADayPeriodForBudgetAllocation;
  NSDate *v13;
  double v14;
  double v15;
  int v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  void *v31;
  NSObject *log;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  id v48;
  int i;
  void *v50;
  double v51;
  double v52;
  void *v53;
  NSObject *v54;
  double v55;
  NSObject *v56;
  void *v57;
  unsigned int v58;
  unsigned int v59;
  NSObject *v60;
  void *v61;
  double v62;
  NSObject *v64;
  id v65;
  id v66;
  uint8_t buf[4];
  _BYTE v68[28];
  __int16 v69;
  NSDate *v70;
  __int16 v71;
  id v72;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_predictedBudgetsForWidgets, "objectForKeyedSubscript:", v7));

  if (!v8)
  {
LABEL_6:
    lastStartOfADayPeriodForBudgetAllocation = self->_lastStartOfADayPeriodForBudgetAllocation;
    if (lastStartOfADayPeriodForBudgetAllocation)
    {
      v13 = lastStartOfADayPeriodForBudgetAllocation;
      -[NSDate timeIntervalSinceDate:](v13, "timeIntervalSinceDate:", v6);
      if (v14 >= -86400.0)
      {
        v9 = v13;
      }
      else
      {
        do
        {
          v9 = (NSDate *)objc_claimAutoreleasedReturnValue(-[NSDate dateByAddingTimeInterval:](v13, "dateByAddingTimeInterval:", 86400.0));

          -[NSDate timeIntervalSinceDate:](v9, "timeIntervalSinceDate:", v6);
          v13 = v9;
        }
        while (v15 < -86400.0);
      }
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_lastPredictionUpdateForWidgets, "objectForKeyedSubscript:", v7));

      if (v24)
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_lastPredictionUpdateForWidgets, "objectForKeyedSubscript:", v7));
      else
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSDate dateByAddingTimeInterval:](v9, "dateByAddingTimeInterval:", 0.0));
      v26 = v25;
      objc_msgSend(v25, "timeIntervalSinceDate:", v6);
      if (-v27 <= (double)(8 * dword_1001AB408))
      {
        v23 = v26;
      }
      else
      {
        do
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "dateByAddingTimeInterval:"));

          objc_msgSend(v23, "timeIntervalSinceDate:", v6);
          v26 = v23;
        }
        while (-v28 > (double)(8 * dword_1001AB408));
      }
      while (1)
      {
        objc_msgSend(v23, "timeIntervalSinceDate:", v6);
        if (v30 <= 0.0)
          break;
        v29 = v23;
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "dateByAddingTimeInterval:", (double)(-8 * dword_1001AB408)));

      }
    }
    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      v9 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v22, -5.0));

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSDate dateByAddingTimeInterval:](v9, "dateByAddingTimeInterval:", 0.0));
    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBudgetModulator usageTimelineForWidgetBudgetID:withStartDate:](self, "usageTimelineForWidgetBudgetID:withStartDate:", v7, v9));
    if (objc_msgSend(v31, "isUnavailable"))
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v68 = v7;
        _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Budget allocation predictions unavailable for widget %@, returning even modulation", buf, 0xCu);
      }
      v20 = 1.0 / (double)dword_1001AB40C;
    }
    else
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "startDate"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "valueAtDate:", v33));
      objc_msgSend(v34, "doubleValue");
      v36 = v35;

      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "startDate"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "dateByAddingTimeInterval:", (double)dword_1001AB408));

      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "endDate"));
      objc_msgSend(v38, "timeIntervalSinceDate:", v39);
      v41 = v40;

      v66 = v7;
      if (v41 >= 0.0)
      {
        v44 = v38;
      }
      else
      {
        do
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "valueAtDate:", v38));
          objc_msgSend(v42, "doubleValue");
          v36 = v36 + v43;

          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "dateByAddingTimeInterval:", (double)dword_1001AB408));
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "endDate"));
          objc_msgSend(v44, "timeIntervalSinceDate:", v45);
          v47 = v46;

          v38 = v44;
        }
        while (v47 < 0.0);
      }
      v48 = objc_alloc_init((Class)NSMutableArray);
      for (i = 0; i != 8; ++i)
      {
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "dateByAddingTimeInterval:", (double)(dword_1001AB408 * i)));
        -[_DASBudgetModulator budgetProportionAtDate:withTimeline:withNormalizer:](self, "budgetProportionAtDate:withTimeline:withNormalizer:", v50, v31, v36);
        v52 = v51;

        v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v52));
        objc_msgSend(v48, "addObject:", v53);

      }
      v7 = v66;
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_predictedBudgetsForWidgets, "setObject:forKeyedSubscript:", v48, v66);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lastPredictionUpdateForWidgets, "setObject:forKeyedSubscript:", v23, v66);
      objc_storeStrong((id *)&self->_lastStartOfADayPeriodForBudgetAllocation, v9);
      v54 = self->_log;
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        v55 = (double)(8 * dword_1001AB408);
        v56 = v54;
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "dateByAddingTimeInterval:", v55));
        *(_DWORD *)buf = 138413314;
        *(_QWORD *)v68 = v66;
        *(_WORD *)&v68[8] = 2112;
        *(_QWORD *)&v68[10] = v23;
        *(_WORD *)&v68[18] = 2112;
        *(_QWORD *)&v68[20] = v57;
        v69 = 2112;
        v70 = v9;
        v71 = 2112;
        v72 = v48;
        _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "Computed fresh budget allocation predictions cache for widget %@, START: %@, END: %@, TIMELINE START: %@, PREDICTIONS: %@", buf, 0x34u);

        v7 = v66;
      }
      v58 = -[_DASBudgetModulator computeSlotForDate:relativeToDate:](self, "computeSlotForDate:relativeToDate:", v6, v23);
      v59 = v58;
      if (v58 < 8)
      {
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectAtIndexedSubscript:", v58));
        objc_msgSend(v61, "doubleValue");
        v20 = v62;

      }
      else
      {
        v60 = self->_log;
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        {
          v64 = v60;
          v65 = objc_msgSend(v48, "count");
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v68 = v59;
          *(_WORD *)&v68[4] = 2112;
          *(_QWORD *)&v68[6] = v6;
          *(_WORD *)&v68[14] = 2048;
          *(_QWORD *)&v68[16] = v65;
          _os_log_error_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "PLEASE FILE A RADAR - Requested out of bounds slot index - requestedSlot: %d, requestedDate: %@, size of predicted proportions array: %lu", buf, 0x1Cu);

        }
        v20 = 1.0 / (double)dword_1001AB40C;
      }

    }
    goto LABEL_42;
  }
  v9 = (NSDate *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_lastPredictionUpdateForWidgets, "objectForKeyedSubscript:", v7));
  v10 = -[_DASBudgetModulator computeSlotForDate:relativeToDate:](self, "computeSlotForDate:relativeToDate:", v6, v9);
  if (v10 > 7)
  {
    v11 = self->_log;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v68 = v7;
      *(_WORD *)&v68[8] = 2112;
      *(_QWORD *)&v68[10] = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Cached budget allocation prediction for widget %@ too old, start at %@", buf, 0x16u);
    }

    goto LABEL_6;
  }
  v16 = v10;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_predictedBudgetsForWidgets, "objectForKeyedSubscript:", v7));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndex:", v16));
  objc_msgSend(v18, "doubleValue");
  v20 = v19;

  v21 = self->_log;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)v68 = v7;
    *(_WORD *)&v68[8] = 2112;
    *(_QWORD *)&v68[10] = v9;
    *(_WORD *)&v68[18] = 2048;
    *(double *)&v68[20] = v20;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Cached budget allocation prediction for widget %@ available from %@ : budget proportion %f", buf, 0x20u);
  }
LABEL_42:

  return v20;
}

- (id)usageTimelineForWidgetBudgetID:(id)a3 withStartDate:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _DKKnowledgeStore *store;
  void *v11;
  id v12;
  NSObject *log;
  id v15;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_DKQuery predicateForEventsWithStringValue:](_DKQuery, "predicateForEventsWithStringValue:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", kDASWidgetViewStreamName));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[_DKPredictionQuery predictionQueryForStream:withPredicate:withPredictionType:](_DKPredictionQuery, "predictionQueryForStream:withPredicate:withPredictionType:", v8, v7, 0));

  objc_msgSend(v9, "setAsOfDate:", v6);
  objc_msgSend(v9, "setSlotDuration:", dword_1001AB408);
  store = self->_store;
  v15 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_DKKnowledgeStore executeQuery:error:](store, "executeQuery:error:", v9, &v15));
  v12 = v15;
  log = self->_log;
  if (v12)
  {
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      sub_1000DFE34((uint64_t)v9, (uint64_t)v12, log);
  }
  else if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
  {
    sub_1000DFDC0((uint64_t)v11, log);
  }

  return v11;
}

- (double)budgetProportionAtDate:(id)a3 withTimeline:(id)a4 withNormalizer:(double)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double result;

  v8 = a4;
  v9 = a3;
  -[_DASBudgetModulator gaussianKDEatDate:withTimeline:withNormalizer:](self, "gaussianKDEatDate:withTimeline:withNormalizer:", v9, v8, a5);
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dateByAddingTimeInterval:", (double)dword_1001AB408));

  -[_DASBudgetModulator gaussianKDEatDate:withTimeline:withNormalizer:](self, "gaussianKDEatDate:withTimeline:withNormalizer:", v12, v8, a5);
  v14 = v13;

  -[_DASBudgetModulator areaUnderTrapeziodWithFirstValue:andSecondValue:](self, "areaUnderTrapeziodWithFirstValue:andSecondValue:", v11, v14);
  return result;
}

- (double)gaussianKDEatDate:(id)a3 withTimeline:(id)a4 withNormalizer:(double)a5
{
  id v8;
  id v9;
  void *v10;
  unsigned int v11;
  unsigned int v12;
  double v13;
  signed int v14;
  double v15;
  unsigned int v16;
  unsigned int v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "startDate"));
  v11 = -[_DASBudgetModulator computeSlotForDate:relativeToDate:](self, "computeSlotForDate:relativeToDate:", v8, v10);

  v12 = dword_1001AB40C;
  v13 = 0.0;
  if (dword_1001AB40C >= 2)
  {
    v14 = -(dword_1001AB40C >> 1);
    v15 = 0.0;
    do
    {
      v16 = (v11 + v14) % v12;
      v17 = v11 + v12 + v14;
      if ((int)(v11 + v14) >= 0)
        v17 = v16;
      v18 = (double)(int)(dword_1001AB408 * v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "startDate"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v19, v18));

      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueAtDate:", v20));
      objc_msgSend(v21, "doubleValue");
      v23 = v22 / a5;

      v15 = v15 + v23 * pow(0.980198673, (double)(v14 * v14));
      ++v14;
      v12 = dword_1001AB40C;
    }
    while (v14 < (int)(dword_1001AB40C >> 1));
    v13 = v15 * 0.0797884561;
  }

  return v13;
}

- (double)areaUnderTrapeziodWithFirstValue:(double)a3 andSecondValue:(double)a4
{
  double v4;
  double v5;

  if (a3 >= a4)
    v4 = a4;
  else
    v4 = a3;
  v5 = a4 - a3;
  if (v5 < 0.0)
    v5 = -v5;
  return v4 + v5 * 0.5;
}

- (_DASBudgetPersisting)persistence
{
  return self->_persistence;
}

- (void)setPersistence:(id)a3
{
  objc_storeStrong((id *)&self->_persistence, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSDate)lastModulationDate
{
  return self->_lastModulationDate;
}

- (void)setLastModulationDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastModulationDate, a3);
}

- (NSDate)lastUsageTimelineUpdate
{
  return self->_lastUsageTimelineUpdate;
}

- (void)setLastUsageTimelineUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_lastUsageTimelineUpdate, a3);
}

- (NSArray)budgets
{
  return self->_budgets;
}

- (void)setBudgets:(id)a3
{
  objc_storeStrong((id *)&self->_budgets, a3);
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (_DKKnowledgeStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (_DKPredictionTimeline)usage
{
  return self->_usage;
}

- (void)setUsage:(id)a3
{
  objc_storeStrong((id *)&self->_usage, a3);
}

- (NSDate)lastStartOfADayPeriodForBudgetAllocation
{
  return self->_lastStartOfADayPeriodForBudgetAllocation;
}

- (void)setLastStartOfADayPeriodForBudgetAllocation:(id)a3
{
  objc_storeStrong((id *)&self->_lastStartOfADayPeriodForBudgetAllocation, a3);
}

- (NSMutableDictionary)lastPredictionUpdateForWidgets
{
  return self->_lastPredictionUpdateForWidgets;
}

- (void)setLastPredictionUpdateForWidgets:(id)a3
{
  objc_storeStrong((id *)&self->_lastPredictionUpdateForWidgets, a3);
}

- (NSMutableDictionary)predictedBudgetsForWidgets
{
  return self->_predictedBudgetsForWidgets;
}

- (void)setPredictedBudgetsForWidgets:(id)a3
{
  objc_storeStrong((id *)&self->_predictedBudgetsForWidgets, a3);
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
  objc_storeStrong((id *)&self->_predictedBudgetsForWidgets, 0);
  objc_storeStrong((id *)&self->_lastPredictionUpdateForWidgets, 0);
  objc_storeStrong((id *)&self->_lastStartOfADayPeriodForBudgetAllocation, 0);
  objc_storeStrong((id *)&self->_usage, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_budgets, 0);
  objc_storeStrong((id *)&self->_lastUsageTimelineUpdate, 0);
  objc_storeStrong((id *)&self->_lastModulationDate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_persistence, 0);
}

@end
