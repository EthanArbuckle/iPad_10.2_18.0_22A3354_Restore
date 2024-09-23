@implementation RTDeviceMetricManager

- (RTDeviceMetricManager)initWithDefaultsManager:(id)a3 motionActivityManager:(id)a4 reachabilityManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  RTDeviceMetricManager *v12;
  RTDeviceMetricManager *v13;
  RTDuetKnowledgeStore *v14;
  RTDuetKnowledgeStore *duetKnowledgeStore;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)RTDeviceMetricManager;
  v12 = -[RTNotifier init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_defaultsManager, a3);
    v14 = objc_alloc_init(RTDuetKnowledgeStore);
    duetKnowledgeStore = v13->_duetKnowledgeStore;
    v13->_duetKnowledgeStore = v14;

    objc_storeStrong((id *)&v13->_motionActivityManager, a4);
    objc_storeStrong((id *)&v13->_reachabilityManager, a5);
    -[RTDeviceMetricManager setup](v13, "setup");
  }

  return v13;
}

- (void)setup
{
  NSObject *v3;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__RTDeviceMetricManager_setup__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __30__RTDeviceMetricManager_setup__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setup");
}

- (void)_setup
{
  RTReachabilityManager *reachabilityManager;
  void *v4;
  id v5;

  reachabilityManager = self->_reachabilityManager;
  +[RTNotification notificationName](RTReachabilityMonitorNotificationReachabilityChanged, "notificationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTNotifier addObserver:selector:name:](reachabilityManager, "addObserver:selector:name:", self, sel_onReachabilityChanged_, v4);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_onDailyMetricsNotification_, CFSTR("RTMetricManagerDailyMetricNotification"), 0);

}

- (void)onReachabilityChanged:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__RTDeviceMetricManager_onReachabilityChanged___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __47__RTDeviceMetricManager_onReachabilityChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onReachabilityChanged:", *(_QWORD *)(a1 + 40));
}

- (void)_onReachabilityChanged:(id)a3
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityMetric);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138412802;
    v32 = v8;
    v33 = 2112;
    v34 = v9;
    v35 = 2112;
    v36 = v10;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, %@, received reachability notification, %@", (uint8_t *)&v31, 0x20u);

  }
  objc_msgSend(v5, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTReachabilityMonitorNotificationReachabilityChanged, "notificationName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqualToString:", v12);

  if (v13)
  {
    v14 = v5;
    -[RTDeviceMetricManager defaultsManager](self, "defaultsManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", CFSTR("RTDefaultsDeviceMetricCurrentReachability"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[RTDeviceMetricManager defaultsManager](self, "defaultsManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", CFSTR("RTDefaultsDeviceMetricCurrentReachabilityStartDate"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 && v18 && objc_msgSend(v18, "compare:", v19) == -1)
    {
      v20 = objc_msgSend(v16, "unsignedIntValue");
      if (objc_msgSend(v14, "reachability") == v20)
      {
LABEL_10:
        _rt_log_facility_get_os_log(RTLogFacilityMetric);
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          v27 = (objc_class *)objc_opt_class();
          NSStringFromClass(v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          +[RTReachabilityManager reachabilityToString:](RTReachabilityManager, "reachabilityToString:", objc_msgSend(v14, "reachability"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = 138412802;
          v32 = v28;
          v33 = 2112;
          v34 = v29;
          v35 = 2112;
          v36 = v30;
          _os_log_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_INFO, "%@, %@, reachability state, %@", (uint8_t *)&v31, 0x20u);

        }
        goto LABEL_13;
      }
      v21 = objc_msgSend(v16, "unsignedIntValue");
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v18, v19);
      -[RTDeviceMetricManager _addToHeapForReachability:endDate:dateInterval:](self, "_addToHeapForReachability:endDate:dateInterval:", v21, v19, v22);

    }
    -[RTDeviceMetricManager defaultsManager](self, "defaultsManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v14, "reachability"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKey:", v24, CFSTR("RTDefaultsDeviceMetricCurrentReachability"));

    -[RTDeviceMetricManager defaultsManager](self, "defaultsManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKey:", v19, CFSTR("RTDefaultsDeviceMetricCurrentReachabilityStartDate"));

    goto LABEL_10;
  }
LABEL_13:

}

- (BOOL)_addToHeapForReachability:(unint64_t)a3 endDate:(id)a4 dateInterval:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  BOOL v13;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v15 = 136315394;
      v16 = "-[RTDeviceMetricManager _addToHeapForReachability:endDate:dateInterval:]";
      v17 = 1024;
      v18 = 136;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval (in %s:%d)", (uint8_t *)&v15, 0x12u);
    }

  }
  v11 = (void *)objc_opt_new();
  -[RTDeviceMetricManager _getFromHeapDateIntervalsForReachability:](self, "_getFromHeapDateIntervalsForReachability:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObjectsFromArray:", v12);

  objc_msgSend(v11, "addObject:", v9);
  v13 = -[RTDeviceMetricManager _addToHeapForReachability:endDate:dateIntervals:](self, "_addToHeapForReachability:endDate:dateIntervals:", a3, v8, v11);

  return v13;
}

- (id)_getFromHeapDateIntervalsForReachability:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v5 = (void *)objc_opt_class();
  -[RTDeviceMetricManager defaultsManager](self, "defaultsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "getReachabilityDefaultStringForTopN:reachability:", 1, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getDateIntervalFromDictionary:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_opt_class();
  -[RTDeviceMetricManager defaultsManager](self, "defaultsManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "getReachabilityDefaultStringForTopN:reachability:", 2, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "getDateIntervalFromDictionary:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_opt_class();
  -[RTDeviceMetricManager defaultsManager](self, "defaultsManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "getReachabilityDefaultStringForTopN:reachability:", 3, a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "getDateIntervalFromDictionary:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)objc_opt_new();
  v21 = v20;
  if (v9)
    objc_msgSend(v20, "addObject:", v9);
  if (v14)
    objc_msgSend(v21, "addObject:", v14);
  if (v19)
    objc_msgSend(v21, "addObject:", v19);

  return v21;
}

- (BOOL)_addToHeapForReachability:(unint64_t)a3 endDate:(id)a4 dateIntervals:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  void *v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v40 = "-[RTDeviceMetricManager _addToHeapForReachability:endDate:dateIntervals:]";
      v41 = 1024;
      v42 = 177;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateIntervals (in %s:%d)", buf, 0x12u);
    }

  }
  objc_msgSend(v8, "dateByAddingTimeInterval:", -86400.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB3880];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __73__RTDeviceMetricManager__addToHeapForReachability_endDate_dateIntervals___block_invoke;
  v35[3] = &unk_1E929D1D0;
  v13 = v11;
  v36 = v13;
  v34 = v8;
  v37 = v34;
  objc_msgSend(v12, "predicateWithBlock:", v35);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "filteredArrayUsingPredicate:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0CB3928];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("self.%@"), CFSTR("duration"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sortDescriptorWithKey:ascending:", v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sortedArrayUsingDescriptors:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v20, "count"))
  {
    objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
  if ((unint64_t)objc_msgSend(v20, "count") < 2)
  {
    v22 = 0;
  }
  else
  {
    objc_msgSend(v20, "objectAtIndexedSubscript:", 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((unint64_t)objc_msgSend(v20, "count") < 3)
  {
    v23 = 0;
  }
  else
  {
    objc_msgSend(v20, "objectAtIndexedSubscript:", 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[RTDeviceMetricManager defaultsManager](self, "defaultsManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "getDictionaryFromDateInterval:", v21);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "getReachabilityDefaultStringForTopN:reachability:", 1, a3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setObject:forKey:", v25, v26);

  -[RTDeviceMetricManager defaultsManager](self, "defaultsManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "getDictionaryFromDateInterval:", v22);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "getReachabilityDefaultStringForTopN:reachability:", 2, a3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setObject:forKey:", v28, v29);

  -[RTDeviceMetricManager defaultsManager](self, "defaultsManager");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "getDictionaryFromDateInterval:", v23);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "getReachabilityDefaultStringForTopN:reachability:", 3, a3);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKey:", v31, v32);

  return 1;
}

BOOL __73__RTDeviceMetricManager__addToHeapForReachability_endDate_dateIntervals___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "compare:", v5);
  if (v6 != -1)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v3, "endDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "compare:", v4))
    {
      v8 = 0;
LABEL_8:

      goto LABEL_9;
    }
  }
  objc_msgSend(v3, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "compare:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(v3, "endDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "compare:", *(_QWORD *)(a1 + 40)) == -1;

  }
  else
  {
    v8 = 1;
  }

  if (v6 != -1)
    goto LABEL_8;
LABEL_9:

  return v8;
}

+ (id)getDateIntervalFromDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("startDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("endDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_5;
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_5;
  v7 = (void *)v6;
  objc_msgSend(v3, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
LABEL_7:

    goto LABEL_8;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "compare:", v10);

  if (v11 == -1)
  {
    v12 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(v3, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v12, "initWithStartDate:endDate:", v7, v13);

    goto LABEL_7;
  }
LABEL_5:
  v8 = 0;
LABEL_8:

  return v8;
}

+ (id)getDictionaryFromDateInterval:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@"), CFSTR("startDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("endDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  objc_msgSend(v4, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)getReachabilityDefaultStringForTopN:(unint64_t)a3 reachability:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0CB3940];
  +[RTReachabilityManager reachabilityToString:](RTReachabilityManager, "reachabilityToString:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("RTDefaultsDeviceMetricTop%lu%@"), a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)getLongestDeviceChargingIntervalsWithTopN:(unint64_t)a3 dateInterval:(id)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  _QWORD block[5];
  id v14;
  uint64_t *v15;
  uint8_t *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[8];
  uint8_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a4;
  if (v8)
  {
    *(_QWORD *)buf = 0;
    v25 = buf;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__63;
    v28 = __Block_byref_object_dispose__63;
    v29 = 0;
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__63;
    v22 = __Block_byref_object_dispose__63;
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    -[RTNotifier queue](self, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __86__RTDeviceMetricManager_getLongestDeviceChargingIntervalsWithTopN_dateInterval_error___block_invoke;
    block[3] = &unk_1E929D1F8;
    v15 = &v18;
    block[4] = self;
    v17 = a3;
    v14 = v8;
    v16 = buf;
    dispatch_sync(v9, block);

    if (a5)
      *a5 = objc_retainAutorelease(*((id *)v25 + 5));
    v10 = (id)v19[5];

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("dateInterval"));
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

void __86__RTDeviceMetricManager_getLongestDeviceChargingIntervalsWithTopN_dateInterval_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[8];
  v5 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(v2, "_getLongestIntervalWithStreamType:topN:dateInterval:flipDateIntervals:error:", 0, v4, v3, 0, &obj);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (id)getLongestDeviceNotChargingIntervalsWithTopN:(unint64_t)a3 dateInterval:(id)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  _QWORD block[5];
  id v14;
  uint64_t *v15;
  uint8_t *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[8];
  uint8_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a4;
  if (v8)
  {
    *(_QWORD *)buf = 0;
    v25 = buf;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__63;
    v28 = __Block_byref_object_dispose__63;
    v29 = 0;
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__63;
    v22 = __Block_byref_object_dispose__63;
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    -[RTNotifier queue](self, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __89__RTDeviceMetricManager_getLongestDeviceNotChargingIntervalsWithTopN_dateInterval_error___block_invoke;
    block[3] = &unk_1E929D1F8;
    v15 = &v18;
    block[4] = self;
    v17 = a3;
    v14 = v8;
    v16 = buf;
    dispatch_sync(v9, block);

    if (a5)
      *a5 = objc_retainAutorelease(*((id *)v25 + 5));
    v10 = (id)v19[5];

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("dateInterval"));
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

void __89__RTDeviceMetricManager_getLongestDeviceNotChargingIntervalsWithTopN_dateInterval_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[8];
  v5 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(v2, "_getLongestIntervalWithStreamType:topN:dateInterval:flipDateIntervals:error:", 0, v4, v3, 1, &obj);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (id)getLongestDeviceLockedIntervalsWithTopN:(unint64_t)a3 dateInterval:(id)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  _QWORD block[5];
  id v14;
  uint64_t *v15;
  uint8_t *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[8];
  uint8_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a4;
  if (v8)
  {
    *(_QWORD *)buf = 0;
    v25 = buf;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__63;
    v28 = __Block_byref_object_dispose__63;
    v29 = 0;
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__63;
    v22 = __Block_byref_object_dispose__63;
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    -[RTNotifier queue](self, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __84__RTDeviceMetricManager_getLongestDeviceLockedIntervalsWithTopN_dateInterval_error___block_invoke;
    block[3] = &unk_1E929D1F8;
    v15 = &v18;
    block[4] = self;
    v17 = a3;
    v14 = v8;
    v16 = buf;
    dispatch_sync(v9, block);

    if (a5)
      *a5 = objc_retainAutorelease(*((id *)v25 + 5));
    v10 = (id)v19[5];

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("dateInterval"));
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

void __84__RTDeviceMetricManager_getLongestDeviceLockedIntervalsWithTopN_dateInterval_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[8];
  v5 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(v2, "_getLongestIntervalWithStreamType:topN:dateInterval:flipDateIntervals:error:", 1, v4, v3, 0, &obj);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (id)getLongestWiFiConnectionIntervalsWithTopN:(unint64_t)a3 dateInterval:(id)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  _QWORD block[5];
  id v14;
  uint64_t *v15;
  uint8_t *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[8];
  uint8_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a4;
  if (v8)
  {
    *(_QWORD *)buf = 0;
    v25 = buf;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__63;
    v28 = __Block_byref_object_dispose__63;
    v29 = 0;
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__63;
    v22 = __Block_byref_object_dispose__63;
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    -[RTNotifier queue](self, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __86__RTDeviceMetricManager_getLongestWiFiConnectionIntervalsWithTopN_dateInterval_error___block_invoke;
    block[3] = &unk_1E929D1F8;
    v15 = &v18;
    block[4] = self;
    v17 = a3;
    v14 = v8;
    v16 = buf;
    dispatch_sync(v9, block);

    if (a5)
      *a5 = objc_retainAutorelease(*((id *)v25 + 5));
    v10 = (id)v19[5];

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("dateInterval"));
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

void __86__RTDeviceMetricManager_getLongestWiFiConnectionIntervalsWithTopN_dateInterval_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[8];
  v5 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(v2, "_getLongestIntervalWithStreamType:topN:dateInterval:flipDateIntervals:error:", 3, v4, v3, 0, &obj);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (id)getLongestStationaryMotionIntervalsWithTopN:(unint64_t)a3 dateInterval:(id)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  _QWORD block[5];
  id v14;
  uint64_t *v15;
  uint8_t *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[8];
  uint8_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a4;
  if (v8)
  {
    *(_QWORD *)buf = 0;
    v25 = buf;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__63;
    v28 = __Block_byref_object_dispose__63;
    v29 = 0;
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__63;
    v22 = __Block_byref_object_dispose__63;
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    -[RTNotifier queue](self, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __88__RTDeviceMetricManager_getLongestStationaryMotionIntervalsWithTopN_dateInterval_error___block_invoke;
    block[3] = &unk_1E929D1F8;
    v15 = &v18;
    block[4] = self;
    v17 = a3;
    v14 = v8;
    v16 = buf;
    dispatch_sync(v9, block);

    if (a5)
      *a5 = objc_retainAutorelease(*((id *)v25 + 5));
    v10 = (id)v19[5];

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("dateInterval"));
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

void __88__RTDeviceMetricManager_getLongestStationaryMotionIntervalsWithTopN_dateInterval_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[8];
  v5 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(v2, "_getLongestStationaryMotionIntervalsWithTopN:dateInterval:error:", v4, v3, &obj);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (id)_getLongestStationaryMotionIntervalsWithTopN:(unint64_t)a3 dateInterval:(id)a4 error:(id *)a5
{
  void *v5;
  dispatch_semaphore_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  dispatch_time_t v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  __CFString *v27;
  NSObject *v28;
  objc_class *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t i;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  BOOL v41;
  void *v42;
  uint64_t v43;
  BOOL v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _BOOL4 v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  unint64_t v60;
  unint64_t v61;
  NSObject *v62;
  objc_class *v63;
  id v64;
  id v65;
  uint64_t v66;
  NSObject *v67;
  objc_class *v68;
  id v69;
  void *v70;
  id v72;
  void *context;
  void *v74;
  unint64_t v75;
  NSObject *dsema;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  _QWORD v84[4];
  NSObject *v85;
  uint64_t *v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t (*v91)(uint64_t, uint64_t);
  void (*v92)(uint64_t);
  id v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t (*v97)(uint64_t, uint64_t);
  void (*v98)(uint64_t);
  id v99;
  void *v100;
  _BYTE buf[12];
  __int16 v102;
  id v103;
  __int16 v104;
  const __CFString *v105;
  __int16 v106;
  unint64_t v107;
  __int16 v108;
  void *v109;
  __int16 v110;
  void *v111;
  __int16 v112;
  uint64_t v113;
  _QWORD v114[4];

  v114[1] = *MEMORY[0x1E0C80C00];
  v80 = a4;
  if (v80)
  {
    v75 = a3;
    v94 = 0;
    v95 = &v94;
    v96 = 0x3032000000;
    v97 = __Block_byref_object_copy__63;
    v98 = __Block_byref_object_dispose__63;
    v99 = 0;
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    context = (void *)MEMORY[0x1D8231EA8]();
    v88 = 0;
    v89 = &v88;
    v90 = 0x3032000000;
    v91 = __Block_byref_object_copy__63;
    v92 = __Block_byref_object_dispose__63;
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v93 = (id)objc_claimAutoreleasedReturnValue();
    v7 = dispatch_semaphore_create(0);
    -[RTDeviceMetricManager motionActivityManager](self, "motionActivityManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "endDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v84[0] = MEMORY[0x1E0C809B0];
    v84[1] = 3221225472;
    v84[2] = __89__RTDeviceMetricManager__getLongestStationaryMotionIntervalsWithTopN_dateInterval_error___block_invoke;
    v84[3] = &unk_1E9296EE0;
    v86 = &v88;
    v87 = &v94;
    v11 = v7;
    v85 = v11;
    objc_msgSend(v8, "fetchMotionActivitiesFromStartDate:endDate:handler:", v9, v10, v84);

    dsema = v11;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(dsema, v13))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSinceDate:", v12);
      v16 = v15;
      v17 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_47);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "filteredArrayUsingPredicate:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "submitToCoreAnalytics:type:duration:", v21, 1, v16);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      v23 = (void *)MEMORY[0x1E0CB35C8];
      v114[0] = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)buf = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v114, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v24);
      v25 = (id)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        v25 = objc_retainAutorelease(v25);

      }
    }
    else
    {
      v25 = 0;
    }

    v72 = v25;
    _rt_log_facility_get_os_log(RTLogFacilityMetric);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v31 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "startDate", v72);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "endDate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend((id)v89[5], "count");
      *(_DWORD *)buf = 138413826;
      *(_QWORD *)&buf[4] = v30;
      v102 = 2112;
      v103 = v31;
      v104 = 2112;
      v105 = CFSTR("Motion Activity");
      v106 = 2048;
      v107 = v75;
      v108 = 2112;
      v109 = v32;
      v110 = 2112;
      v111 = v33;
      v112 = 2048;
      v113 = v34;
      _os_log_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_INFO, "%@, %@, StreamType, %@, topN, %lu, startDate, %@, endDate, %@, fetchedMotionActivities count, %lu", buf, 0x48u);

    }
    objc_msgSend(v80, "endDate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "dateByAddingTimeInterval:", -86400.0);
    v82 = (void *)objc_claimAutoreleasedReturnValue();

    v81 = (void *)objc_opt_new();
    for (i = 1; ; ++i)
    {
      if (i - 1 >= objc_msgSend((id)v89[5], "count", v72) - 1)
      {
        if (objc_msgSend((id)v89[5], "count"))
        {
          objc_msgSend((id)v89[5], "lastObject");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = objc_msgSend(v51, "type") == 1;

          if (v52)
          {
            v53 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v80, "endDate");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v89[5], "lastObject");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "startDate");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "timeIntervalSinceDate:", v56);
            objc_msgSend(v53, "numberWithDouble:");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "addObject:", v57);

          }
        }
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 0);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = v58;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v100, 1);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "sortUsingDescriptors:", v59);

        v60 = objc_msgSend(v81, "count");
        if (v60 >= v75)
          v61 = v75;
        else
          v61 = v60;
        objc_msgSend(v81, "subarrayWithRange:", 0, v61);
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

        _Block_object_dispose(&v88, 8);
        objc_autoreleasePoolPop(context);
        _rt_log_facility_get_os_log(RTLogFacilityMetric);
        v62 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
        {
          v63 = (objc_class *)objc_opt_class();
          NSStringFromClass(v63);
          v64 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v65 = (id)objc_claimAutoreleasedReturnValue();
          v66 = -[__CFString count](v27, "count");
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v64;
          v102 = 2112;
          v103 = v65;
          v104 = 2048;
          v105 = (const __CFString *)v66;
          _os_log_impl(&dword_1D1A22000, v62, OS_LOG_TYPE_INFO, "%@, %@, output intervals count, %lu, ", buf, 0x20u);

        }
        _rt_log_facility_get_os_log(RTLogFacilityMetric);
        v67 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
        {
          v68 = (objc_class *)objc_opt_class();
          NSStringFromClass(v68);
          v69 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v69;
          v102 = 2112;
          v103 = v70;
          v104 = 2112;
          v105 = v27;
          _os_log_impl(&dword_1D1A22000, v67, OS_LOG_TYPE_INFO, "%@, %@, output intervals, %@, ", buf, 0x20u);

        }
        if (a5)
          *a5 = objc_retainAutorelease((id)v95[5]);
        _Block_object_dispose(&v94, 8);

        goto LABEL_39;
      }
      v37 = (void *)MEMORY[0x1D8231EA8]();
      objc_msgSend((id)v89[5], "objectAtIndexedSubscript:", i);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "startDate");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v82, "compare:", v39);
      if (v40 == -1
        || (objc_msgSend((id)v89[5], "objectAtIndexedSubscript:", i),
            v83 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v83, "startDate"),
            v5 = (void *)objc_claimAutoreleasedReturnValue(),
            !objc_msgSend(v82, "compare:", v5)))
      {
        objc_msgSend((id)v89[5], "objectAtIndexedSubscript:", i - 1);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "type");
        v44 = v40 == -1;
        v41 = v43 == 1;

        if (v44)
        {

          if (v43 != 1)
            goto LABEL_25;
LABEL_24:
          v45 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend((id)v89[5], "objectAtIndexedSubscript:", i);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "startDate");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v89[5], "objectAtIndexedSubscript:", i - 1);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "startDate");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "timeIntervalSinceDate:", v49);
          objc_msgSend(v45, "numberWithDouble:");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "addObject:", v50);

          goto LABEL_25;
        }
      }
      else
      {
        v41 = 0;
      }

      if (v41)
        goto LABEL_24;
LABEL_25:
      objc_autoreleasePoolPop(v37);
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval", buf, 2u);
  }

  if (a5)
  {
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("dateInterval"));
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_39:

  return v27;
}

void __89__RTDeviceMetricManager__getLongestStationaryMotionIntervalsWithTopN_dateInterval_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_getLongestIntervalWithStreamType:(int64_t)a3 topN:(unint64_t)a4 dateInterval:(id)a5 flipDateIntervals:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v7;
  RTDuetKnowledgeStream *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  objc_class *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  unint64_t v39;
  unint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  objc_class *v51;
  id v52;
  void *v53;
  NSObject *v54;
  objc_class *v55;
  id v56;
  id v57;
  uint64_t v58;
  NSObject *v59;
  id v61;
  void *context;
  void *v63;
  RTDuetKnowledgeStream *v64;
  id v66;
  id v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _QWORD v75[4];
  id v76;
  id v77;
  id obj;
  _QWORD v79[6];
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t (*v83)(uint64_t, uint64_t);
  void (*v84)(uint64_t);
  id v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t (*v89)(uint64_t, uint64_t);
  void (*v90)(uint64_t);
  id v91;
  _BYTE v92[128];
  void *v93;
  uint8_t buf[4];
  id v95;
  __int16 v96;
  id v97;
  __int16 v98;
  uint64_t v99;
  __int16 v100;
  unint64_t v101;
  __int16 v102;
  void *v103;
  __int16 v104;
  void *v105;
  __int16 v106;
  uint64_t v107;
  uint64_t v108;

  v7 = a6;
  v108 = *MEMORY[0x1E0C80C00];
  v66 = a5;
  if (v66)
  {
    v86 = 0;
    v87 = &v86;
    v88 = 0x3032000000;
    v89 = __Block_byref_object_copy__63;
    v90 = __Block_byref_object_dispose__63;
    v91 = 0;
    v70 = (id)objc_opt_new();
    context = (void *)MEMORY[0x1D8231EA8]();
    v10 = [RTDuetKnowledgeStream alloc];
    -[RTDeviceMetricManager duetKnowledgeStore](self, "duetKnowledgeStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = -[RTDuetKnowledgeStream initWithDuetKnowledgeStore:streamType:](v10, "initWithDuetKnowledgeStore:streamType:", v11, a3);

    v80 = 0;
    v81 = &v80;
    v82 = 0x3032000000;
    v83 = __Block_byref_object_copy__63;
    v84 = __Block_byref_object_dispose__63;
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v85 = (id)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v79[0] = MEMORY[0x1E0C809B0];
    v79[1] = 3221225472;
    v79[2] = __101__RTDeviceMetricManager__getLongestIntervalWithStreamType_topN_dateInterval_flipDateIntervals_error___block_invoke;
    v79[3] = &unk_1E929D220;
    v79[4] = &v86;
    v79[5] = &v80;
    -[RTDuetKnowledgeStream enumerateEventsWithinDateInterval:usingBlock:](v64, "enumerateEventsWithinDateInterval:usingBlock:", v66, v79);
    if (v7)
    {
      v13 = v81[5];
      v14 = (id *)(v87 + 5);
      obj = (id)v87[5];
      -[RTDeviceMetricManager _flippedDateIntervalsFromIntervals:originalDateInterval:error:](self, "_flippedDateIntervalsFromIntervals:originalDateInterval:error:", v13, v66, &obj);
      v15 = objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v14, obj);
      v16 = (void *)v81[5];
      v81[5] = v15;

    }
    _rt_log_facility_get_os_log(RTLogFacilityMetric);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      +[RTDuetKnowledgeStream streamTypeToString:](RTDuetKnowledgeStream, "streamTypeToString:", a3);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "startDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "endDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend((id)v81[5], "count");
      *(_DWORD *)buf = 138413826;
      v95 = v19;
      v96 = 2112;
      v97 = v20;
      v98 = 2112;
      v99 = (uint64_t)v21;
      v100 = 2048;
      v101 = a4;
      v102 = 2112;
      v103 = v22;
      v104 = 2112;
      v105 = v23;
      v106 = 2048;
      v107 = v24;
      _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_INFO, "%@, %@, StreamType, %@, topN, %lu, startDate, %@, endDate, %@, fetchedDateIntervals count, %lu", buf, 0x48u);

    }
    objc_msgSend(v66, "endDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dateByAddingTimeInterval:", -86400.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = (void *)v81[5];
    v28 = (void *)MEMORY[0x1E0CB3880];
    v75[0] = v12;
    v75[1] = 3221225472;
    v75[2] = __101__RTDeviceMetricManager__getLongestIntervalWithStreamType_topN_dateInterval_flipDateIntervals_error___block_invoke_56;
    v75[3] = &unk_1E929D1D0;
    v61 = v26;
    v76 = v61;
    v77 = v66;
    objc_msgSend(v28, "predicateWithBlock:", v75);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "filteredArrayUsingPredicate:", v29);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)v81[5];
    v81[5] = v30;

    v32 = (void *)MEMORY[0x1E0CB3928];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("self.%@"), CFSTR("duration"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "sortDescriptorWithKey:ascending:", v33, 0);
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = (void *)v81[5];
    v93 = v63;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v93, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "sortedArrayUsingDescriptors:", v35);
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = (void *)v81[5];
    v81[5] = v36;

    v38 = (void *)v81[5];
    v39 = objc_msgSend(v38, "count");
    if (v39 >= a4)
      v40 = a4;
    else
      v40 = v39;
    objc_msgSend(v38, "subarrayWithRange:", 0, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)v81[5];
    v81[5] = 0;

    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v69 = v41;
    v43 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v71, v92, 16);
    if (v43)
    {
      v44 = *(_QWORD *)v72;
      do
      {
        for (i = 0; i != v43; ++i)
        {
          if (*(_QWORD *)v72 != v44)
            objc_enumerationMutation(v69);
          v46 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
          v47 = (void *)MEMORY[0x1D8231EA8]();
          _rt_log_facility_get_os_log(RTLogFacilityMetric);
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
          {
            v51 = (objc_class *)objc_opt_class();
            NSStringFromClass(v51);
            v52 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v95 = v52;
            v96 = 2112;
            v97 = v53;
            v98 = 2112;
            v99 = (uint64_t)v46;
            _os_log_debug_impl(&dword_1D1A22000, v48, OS_LOG_TYPE_DEBUG, "%@, %@, interval, %@, ", buf, 0x20u);

          }
          v49 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v46, "duration");
          objc_msgSend(v49, "numberWithDouble:");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "addObject:", v50);

          objc_autoreleasePoolPop(v47);
        }
        v43 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v71, v92, 16);
      }
      while (v43);
    }

    _rt_log_facility_get_os_log(RTLogFacilityMetric);
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      v55 = (objc_class *)objc_opt_class();
      NSStringFromClass(v55);
      v56 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v57 = (id)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v70, "count");
      *(_DWORD *)buf = 138412802;
      v95 = v56;
      v96 = 2112;
      v97 = v57;
      v98 = 2048;
      v99 = v58;
      _os_log_impl(&dword_1D1A22000, v54, OS_LOG_TYPE_INFO, "%@, %@, output intervals count, %lu, ", buf, 0x20u);

    }
    _Block_object_dispose(&v80, 8);

    objc_autoreleasePoolPop(context);
    if (a7)
      *a7 = objc_retainAutorelease((id)v87[5]);
    _Block_object_dispose(&v86, 8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v59, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval", buf, 2u);
    }

    if (a7)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("dateInterval"));
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v70 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v70;
}

void __101__RTDeviceMetricManager__getLongestIntervalWithStreamType_topN_dateInterval_flipDateIntervals_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void **v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v13 = a2;
  v7 = a3;
  v8 = v7;
  if (v7)
  {
    *a4 = 1;
    v9 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v10 = v7;
  }
  else
  {
    v9 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v10 = v13;
  }
  v11 = v10;
  v12 = *v9;
  *v9 = v11;

}

BOOL __101__RTDeviceMetricManager__getLongestIntervalWithStreamType_topN_dateInterval_flipDateIntervals_error___block_invoke_56(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "compare:", v5);
  if (v6 != -1)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v3, "endDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "compare:", v4))
    {
      v8 = 0;
LABEL_8:

      goto LABEL_9;
    }
  }
  objc_msgSend(v3, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "compare:", v10))
  {
    objc_msgSend(v3, "endDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "endDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v11, "compare:", v12) == -1;

  }
  else
  {
    v8 = 1;
  }

  if (v6 != -1)
    goto LABEL_8;
LABEL_9:

  return v8;
}

- (id)_flippedDateIntervalsFromIntervals:(id)a3 originalDateInterval:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  const __CFString *v48;
  NSObject *v49;
  void *v51;
  uint8_t buf[8];
  _QWORD v53[3];

  v53[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v47, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateIntervals", buf, 2u);
    }

    if (!a5)
      goto LABEL_22;
    v48 = CFSTR("dateIntervals");
    goto LABEL_21;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v49, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: originalDateInterval", buf, 2u);
    }

    if (!a5)
      goto LABEL_22;
    v48 = CFSTR("originalDateInterval");
LABEL_21:
    _RTErrorInvalidParameterCreate((uint64_t)v48);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  v10 = (void *)objc_opt_new();
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v11;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("endDate"), 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v53[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v7, "sortedArrayUsingDescriptors:", v13);

    objc_msgSend(v9, "startDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "startDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v15, "compare:", v17);

    if (v18 == -1)
    {
      v19 = objc_alloc(MEMORY[0x1E0CB3588]);
      objc_msgSend(v9, "startDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "startDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v19, "initWithStartDate:endDate:", v20, v22);
      objc_msgSend(v10, "addObject:", v23);

    }
    v51 = v9;
    if (objc_msgSend(v7, "count") >= 2)
    {
      v24 = 0;
      do
      {
        v25 = (void *)MEMORY[0x1D8231EA8]();
        objc_msgSend(v7, "objectAtIndexedSubscript:", v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "endDate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v24 + 1;
        objc_msgSend(v7, "objectAtIndexedSubscript:", v24 + 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "startDate");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v27, "compare:", v30);

        if (v31 == -1)
        {
          v32 = objc_alloc(MEMORY[0x1E0CB3588]);
          objc_msgSend(v7, "objectAtIndexedSubscript:", v24);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "endDate");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectAtIndexedSubscript:", v28);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "startDate");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = (void *)objc_msgSend(v32, "initWithStartDate:endDate:", v34, v36);
          objc_msgSend(v10, "addObject:", v37);

        }
        objc_autoreleasePoolPop(v25);
        v24 = v28;
      }
      while (v28 < objc_msgSend(v7, "count") - 1);
    }
    objc_msgSend(v7, "lastObject");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "endDate");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v51;
    objc_msgSend(v51, "endDate");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "compare:", v40);

    if (v41 == -1)
    {
      v42 = objc_alloc(MEMORY[0x1E0CB3588]);
      objc_msgSend(v7, "lastObject");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "endDate");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "endDate");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (void *)objc_msgSend(v42, "initWithStartDate:endDate:", v44, v45);
      objc_msgSend(v10, "addObject:", v46);

    }
  }
LABEL_23:

  return v10;
}

- (void)onDailyMetricsNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__RTDeviceMetricManager_onDailyMetricsNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __52__RTDeviceMetricManager_onDailyMetricsNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onDailyMetricsNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onDailyMetricsNotification:(id)a3
{
  id v5;
  void *v6;
  char v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("RTMetricManagerDailyMetricNotification"));

  if ((v7 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412802;
      v17 = v14;
      v18 = 2080;
      v19 = "-[RTDeviceMetricManager _onDailyMetricsNotification:]";
      v20 = 1024;
      v21 = 565;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "unknown notification name, %@ (in %s:%d)", (uint8_t *)&v16, 0x1Cu);

    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityMetric);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412546;
    v17 = v10;
    v18 = 2112;
    v19 = (const char *)v5;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%@, received notification, %@", (uint8_t *)&v16, 0x16u);

  }
  objc_msgSend(v5, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("RTMetricManagerDailyMetricNotification"));

  if ((v12 & 1) != 0)
  {
    -[RTDeviceMetricManager _submitDeviceMetricsWithError:](self, "_submitDeviceMetricsWithError:", 0);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v15;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "unknown notification name, %@", (uint8_t *)&v16, 0xCu);

    }
  }

}

- (BOOL)_submitDeviceMetricsWithError:(id *)a3
{
  void *v5;
  id v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  -[RTDeviceMetricManager _getDeviceMetricsWithError:](self, "_getDeviceMetricsWithError:", &v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v16;
  _rt_log_facility_get_os_log(RTLogFacilityMetric);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v5, "count");
    *(_DWORD *)buf = 138412802;
    v18 = v9;
    v19 = 2112;
    v20 = v10;
    v21 = 2048;
    v22 = v11;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, %@, submitting metrics of length, %lu", buf, 0x20u);

  }
  v12 = objc_alloc(MEMORY[0x1E0CB3940]);
  v13 = (void *)objc_msgSend(v12, "initWithCString:encoding:", RTAnalyticsEventInactivityDeviceMetrics, 1);
  log_analytics_submission(v13, v5);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

  if (a3)
    *a3 = objc_retainAutorelease(v6);

  return v6 == 0;
}

- (id)_getDeviceMetricsWithError:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  char v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  int v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  RTDeviceMetricManager *v54;
  void *v55;
  void *v56;
  id *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  id v70;
  id v71;
  id v72;
  id v73;
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(v5, "dateByAddingTimeInterval:", -2419200.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithStartDate:endDate:", v7, v5);

  v9 = (void *)objc_opt_new();
  v10 = 0;
  v11 = 1;
  while (1)
  {
    if ((v11 & 1) == 0)
    {
LABEL_28:
      if (!a3)
        goto LABEL_30;
      goto LABEL_29;
    }
    v12 = (void *)MEMORY[0x1D8231EA8]();
    v73 = v10;
    -[RTDeviceMetricManager _getLongestIntervalWithStreamType:topN:dateInterval:flipDateIntervals:error:](self, "_getLongestIntervalWithStreamType:topN:dateInterval:flipDateIntervals:error:", 1, 3, v8, 0, &v73);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v73;

    if (v14)
      break;
    v72 = 0;
    -[RTDeviceMetricManager _getLongestIntervalWithStreamType:topN:dateInterval:flipDateIntervals:error:](self, "_getLongestIntervalWithStreamType:topN:dateInterval:flipDateIntervals:error:", 0, 3, v8, 0, &v72);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v72;
    if (v15)
    {
      v10 = v15;
      v16 = 2;
    }
    else
    {
      v71 = 0;
      -[RTDeviceMetricManager _getLongestIntervalWithStreamType:topN:dateInterval:flipDateIntervals:error:](self, "_getLongestIntervalWithStreamType:topN:dateInterval:flipDateIntervals:error:", 0, 3, v8, 1, &v71);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v71;
      if (v17)
      {
        v10 = v17;
        v16 = 2;
      }
      else
      {
        v70 = 0;
        -[RTDeviceMetricManager _getLongestIntervalWithStreamType:topN:dateInterval:flipDateIntervals:error:](self, "_getLongestIntervalWithStreamType:topN:dateInterval:flipDateIntervals:error:", 3, 3, v8, 0, &v70);
        v59 = objc_claimAutoreleasedReturnValue();
        v10 = v70;
        if (v10)
        {
          v16 = 2;
          v18 = (void *)v59;
        }
        else
        {
          v52 = v13;
          v53 = v12;
          v55 = v8;
          v56 = v9;
          v57 = a3;
          v58 = v5;
          -[RTDeviceMetricManager _getFromHeapDateIntervalsForReachability:](self, "_getFromHeapDateIntervalsForReachability:", 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)objc_opt_new();
          v66 = 0u;
          v67 = 0u;
          v68 = 0u;
          v69 = 0u;
          v21 = v19;
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v67;
            do
            {
              for (i = 0; i != v23; ++i)
              {
                if (*(_QWORD *)v67 != v24)
                  objc_enumerationMutation(v21);
                v26 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
                v27 = (void *)MEMORY[0x1D8231EA8]();
                v28 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v26, "duration");
                objc_msgSend(v28, "numberWithDouble:");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "addObject:", v29);

                objc_autoreleasePoolPop(v27);
              }
              v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
            }
            while (v23);
          }
          v51 = v21;

          v54 = self;
          -[RTDeviceMetricManager _getFromHeapDateIntervalsForReachability:](self, "_getFromHeapDateIntervalsForReachability:", 2);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = (void *)objc_opt_new();
          v62 = 0u;
          v63 = 0u;
          v64 = 0u;
          v65 = 0u;
          v32 = v30;
          v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
          if (v33)
          {
            v34 = v33;
            v35 = *(_QWORD *)v63;
            do
            {
              for (j = 0; j != v34; ++j)
              {
                if (*(_QWORD *)v63 != v35)
                  objc_enumerationMutation(v32);
                v37 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * j);
                v38 = (void *)MEMORY[0x1D8231EA8]();
                v39 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v37, "duration");
                objc_msgSend(v39, "numberWithDouble:");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "addObject:", v40);

                objc_autoreleasePoolPop(v38);
              }
              v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
            }
            while (v34);
          }

          +[RTMetric binsFromStart:toEnd:gap:](RTMetric, "binsFromStart:toEnd:gap:", &unk_1E9327F98, &unk_1E932CF70, &unk_1E932CF80);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          +[RTMetric binsFromStart:toEnd:gap:](RTMetric, "binsFromStart:toEnd:gap:", &unk_1E9327F98, &unk_1E932CF90, &unk_1E932CF80);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          self = v54;
          v13 = v52;
          objc_msgSend((id)objc_opt_class(), "getMetricsDictionaryForMetricType:intervals:bins:", CFSTR("lock"), v52, v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "addEntriesFromDictionary:", v42);

          objc_msgSend((id)objc_opt_class(), "getMetricsDictionaryForMetricType:intervals:bins:", CFSTR("on_charge"), v61, v41);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "addEntriesFromDictionary:", v43);

          objc_msgSend((id)objc_opt_class(), "getMetricsDictionaryForMetricType:intervals:bins:", CFSTR("not_on_charge"), v60, v41);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "addEntriesFromDictionary:", v44);

          objc_msgSend((id)objc_opt_class(), "getMetricsDictionaryForMetricType:intervals:bins:", CFSTR("wifi_connectivity"), v59, v41);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "addEntriesFromDictionary:", v45);

          objc_msgSend((id)objc_opt_class(), "getMetricsDictionaryForMetricType:intervals:bins:", CFSTR("static_motion"), MEMORY[0x1E0C9AA60], v50);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "addEntriesFromDictionary:", v46);

          objc_msgSend((id)objc_opt_class(), "getMetricsDictionaryForMetricType:intervals:bins:", CFSTR("no_connectivity"), v20, v41);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "addEntriesFromDictionary:", v47);

          objc_msgSend((id)objc_opt_class(), "getMetricsDictionaryForMetricType:intervals:bins:", CFSTR("cell_connectivity"), v31, v41);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v56;
          objc_msgSend(v56, "addEntriesFromDictionary:", v48);

          v5 = v58;
          v18 = (void *)v59;
          v16 = 0;
          a3 = v57;
          v8 = v55;
          v12 = v53;
          v10 = 0;
        }

      }
    }

    objc_autoreleasePoolPop(v12);
    v11 = 0;
    if (v16)
      goto LABEL_28;
  }

  objc_autoreleasePoolPop(v12);
  v10 = v14;
  if (a3)
LABEL_29:
    *a3 = objc_retainAutorelease(v10);
LABEL_30:

  return v9;
}

+ (id)getStringForMetricType:(id)a3 topN:(int64_t)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("longest_interval_%lu_device_%@"), a4, a3);
}

+ (id)getMetricsDictionaryForMetricType:(id)a3 intervals:(id)a4 bins:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  uint8_t *v18;
  __int16 v20;
  __int16 v21;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
LABEL_12:

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    v21 = 0;
    v17 = "Invalid parameter not satisfying: deviceMetricType";
    v18 = (uint8_t *)&v21;
LABEL_15:
    _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, v17, v18, 2u);
    goto LABEL_12;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v20 = 0;
    v17 = "Invalid parameter not satisfying: intervals";
    v18 = (uint8_t *)&v20;
    goto LABEL_15;
  }
  v10 = (void *)objc_opt_new();
  for (i = 0; i != 3; ++i)
  {
    v12 = (void *)MEMORY[0x1D8231EA8]();
    if (objc_msgSend(v8, "count") >= (unint64_t)(i + 1))
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", i);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v13, v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "getStringForMetricType:topN:", v7, i + 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, v15);

    }
    else
    {
      +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", &unk_1E9327FB0, v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "getStringForMetricType:topN:", v7, i + 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, v14);
    }

    objc_autoreleasePoolPop(v12);
  }
LABEL_13:

  return v10;
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsManager, a3);
}

- (RTDuetKnowledgeStore)duetKnowledgeStore
{
  return self->_duetKnowledgeStore;
}

- (void)setDuetKnowledgeStore:(id)a3
{
  objc_storeStrong((id *)&self->_duetKnowledgeStore, a3);
}

- (RTMotionActivityManager)motionActivityManager
{
  return self->_motionActivityManager;
}

- (void)setMotionActivityManager:(id)a3
{
  objc_storeStrong((id *)&self->_motionActivityManager, a3);
}

- (RTReachabilityManager)reachabilityManager
{
  return self->_reachabilityManager;
}

- (void)setReachabilityManager:(id)a3
{
  objc_storeStrong((id *)&self->_reachabilityManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reachabilityManager, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_duetKnowledgeStore, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
}

@end
