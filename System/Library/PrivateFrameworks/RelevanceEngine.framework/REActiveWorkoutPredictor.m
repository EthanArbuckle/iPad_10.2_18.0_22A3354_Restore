@implementation REActiveWorkoutPredictor

+ (id)supportedFeatures
{
  REFeatureSet *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  REFeatureSet *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  v2 = [REFeatureSet alloc];
  +[REFeature activeWorkoutFeature](REFeature, "activeWorkoutFeature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature dailyAverageWorkoutCountFeature](REFeature, "dailyAverageWorkoutCountFeature", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  +[REFeature performedWorkoutCountFeature](REFeature, "performedWorkoutCountFeature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[REFeatureSet initWithFeatures:](v2, "initWithFeatures:", v6);

  return v7;
}

- (id)_init
{
  _DWORD *v2;
  _DWORD *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)REActiveWorkoutPredictor;
  v2 = -[REPredictor _init](&v5, sel__init);
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "setHasActiveWorkout:", 0);
    v3[17] = 0;
    *((_QWORD *)v3 + 9) = 0;
  }
  return v3;
}

+ (double)updateInterval
{
  return 43200.0;
}

- (void)dealloc
{
  objc_super v3;

  -[REActiveWorkoutPredictor _cancelMonitoringWorkoutIfNeeded](self, "_cancelMonitoringWorkoutIfNeeded");
  v3.receiver = self;
  v3.super_class = (Class)REActiveWorkoutPredictor;
  -[REPredictor dealloc](&v3, sel_dealloc);
}

- (void)resume
{
  const char **v3;
  void *v4;
  const char *v5;
  id v6;
  uint64_t v7;
  void *v8;
  objc_class *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD handler[4];
  id v24;
  id location;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  void *v32;
  uint64_t *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  -[REActiveWorkoutPredictor _cancelMonitoringWorkoutIfNeeded](self, "_cancelMonitoringWorkoutIfNeeded");
  if (!HealthKitLibraryCore_frameworkLibrary_0)
  {
    v30 = xmmword_24CF8C4C8;
    v31 = 0;
    HealthKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (HealthKitLibraryCore_frameworkLibrary_0)
  {
    objc_initWeak(&location, self);
    *(_QWORD *)&v30 = 0;
    *((_QWORD *)&v30 + 1) = &v30;
    v31 = 0x2020000000;
    v3 = (const char **)getkHKHealthDaemonActiveWorkoutServersDidUpdateNotificationSymbolLoc_ptr;
    v32 = (void *)getkHKHealthDaemonActiveWorkoutServersDidUpdateNotificationSymbolLoc_ptr;
    if (!getkHKHealthDaemonActiveWorkoutServersDidUpdateNotificationSymbolLoc_ptr)
    {
      v4 = (void *)HealthKitLibrary_0();
      v3 = (const char **)dlsym(v4, "kHKHealthDaemonActiveWorkoutServersDidUpdateNotification");
      *(_QWORD *)(*((_QWORD *)&v30 + 1) + 24) = v3;
      getkHKHealthDaemonActiveWorkoutServersDidUpdateNotificationSymbolLoc_ptr = (uint64_t)v3;
    }
    _Block_object_dispose(&v30, 8);
    if (!v3)
    {
      dlerror();
      abort_report_np();
      __break(1u);
    }
    v5 = *v3;
    v6 = MEMORY[0x24BDAC9B8];
    v7 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __34__REActiveWorkoutPredictor_resume__block_invoke;
    handler[3] = &unk_24CF8C3E0;
    objc_copyWeak(&v24, &location);
    notify_register_dispatch(v5, &self->_workoutStateNotifyToken, MEMORY[0x24BDAC9B8], handler);

    v26 = 0;
    v27 = &v26;
    v28 = 0x2050000000;
    v8 = (void *)getHKObserverQueryClass_softClass;
    v29 = getHKObserverQueryClass_softClass;
    if (!getHKObserverQueryClass_softClass)
    {
      *(_QWORD *)&v30 = v7;
      *((_QWORD *)&v30 + 1) = 3221225472;
      v31 = (uint64_t)__getHKObserverQueryClass_block_invoke;
      v32 = &unk_24CF8AC38;
      v33 = &v26;
      __getHKObserverQueryClass_block_invoke((uint64_t)&v30);
      v8 = (void *)v27[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v26, 8);
    v10 = [v9 alloc];
    v26 = 0;
    v27 = &v26;
    v28 = 0x2050000000;
    v11 = (void *)getHKSampleTypeClass_softClass;
    v29 = getHKSampleTypeClass_softClass;
    if (!getHKSampleTypeClass_softClass)
    {
      *(_QWORD *)&v30 = v7;
      *((_QWORD *)&v30 + 1) = 3221225472;
      v31 = (uint64_t)__getHKSampleTypeClass_block_invoke;
      v32 = &unk_24CF8AC38;
      v33 = &v26;
      __getHKSampleTypeClass_block_invoke((uint64_t)&v30);
      v11 = (void *)v27[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v26, 8);
    objc_msgSend(v12, "workoutType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v7;
    v21[1] = 3221225472;
    v21[2] = __34__REActiveWorkoutPredictor_resume__block_invoke_2;
    v21[3] = &unk_24CF8C408;
    objc_copyWeak(&v22, &location);
    v14 = (void *)objc_msgSend(v10, "initWithSampleType:predicate:updateHandler:", v13, 0, v21);

    +[RESingleton sharedInstance](REHealthStore, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v7;
    v19[1] = 3221225472;
    v19[2] = __34__REActiveWorkoutPredictor_resume__block_invoke_3;
    v19[3] = &unk_24CF8C240;
    v19[4] = self;
    v16 = v14;
    v20 = v16;
    objc_msgSend(v15, "accessHealthStore:", v19);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    RESignificantTimeChangeNotification();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", self, sel__scheduleFetchWorkoutTimer, v18, 0);

    -[REActiveWorkoutPredictor _scheduleFetchWorkoutTimer](self, "_scheduleFetchWorkoutTimer");
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
}

void __34__REActiveWorkoutPredictor_resume__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateWorkoutState");
    WeakRetained = v2;
  }

}

void __34__REActiveWorkoutPredictor_resume__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_scheduleFetchWorkoutTimer");
    WeakRetained = v2;
  }

}

void __34__REActiveWorkoutPredictor_resume__block_invoke_3(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), *(id *)(a1 + 40));
  v4 = a2;
  objc_msgSend(v4, "executeQuery:", *(_QWORD *)(a1 + 40));

}

- (void)pause
{
  void *v3;
  void *v4;
  void *v5;
  REUpNextTimer *workoutQueryCoalesceTimer;
  _QWORD v7[5];

  -[REActiveWorkoutPredictor _cancelMonitoringWorkoutIfNeeded](self, "_cancelMonitoringWorkoutIfNeeded");
  +[RESingleton sharedInstance](REHealthStore, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__REActiveWorkoutPredictor_pause__block_invoke;
  v7[3] = &unk_24CF8C268;
  v7[4] = self;
  objc_msgSend(v3, "accessHealthStore:", v7);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  RESignificantTimeChangeNotification();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, v5, 0);

  -[REUpNextTimer invalidate](self->_workoutQueryCoalesceTimer, "invalidate");
  workoutQueryCoalesceTimer = self->_workoutQueryCoalesceTimer;
  self->_workoutQueryCoalesceTimer = 0;

}

void __33__REActiveWorkoutPredictor_pause__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;

  objc_msgSend(a2, "stopQuery:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 80);
  *(_QWORD *)(v3 + 80) = 0;

}

- (id)featureValueForFeature:(id)a3 element:(id)a4 engine:(id)a5 trainingContext:(id)a6
{
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;

  v7 = a3;
  +[REFeature activeWorkoutFeature](REFeature, "activeWorkoutFeature");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9)
  {
    +[REFeatureValue featureValueWithBool:](REFeatureValue, "featureValueWithBool:", -[REActiveWorkoutPredictor hasActiveWorkout](self, "hasActiveWorkout"));
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[REFeature dailyAverageWorkoutCountFeature](REFeature, "dailyAverageWorkoutCountFeature");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v7, "isEqual:", v11);

    if (v12)
      +[REFeatureValue featureValueWithDouble:](REFeatureValue, "featureValueWithDouble:", self->_dailyAverageWorkouts);
    else
      +[REFeatureValue featureValueWithInt64:](REFeatureValue, "featureValueWithInt64:", self->_numberOfWorkoutsPerformedToday);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v10;

  return v13;
}

- (void)_cancelMonitoringWorkoutIfNeeded
{
  if (notify_is_valid_token(self->_workoutStateNotifyToken))
    notify_cancel(self->_workoutStateNotifyToken);
}

- (void)_updateWorkoutState
{
  void *v3;
  _QWORD v4[5];
  id v5;
  id location;

  -[REPredictor beginFetchingData](self, "beginFetchingData");
  objc_initWeak(&location, self);
  +[RESingleton sharedInstance](REHealthStore, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __47__REActiveWorkoutPredictor__updateWorkoutState__block_invoke;
  v4[3] = &unk_24CF8C458;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  objc_msgSend(v3, "accessHealthStore:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __47__REActiveWorkoutPredictor__updateWorkoutState__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (v3)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __47__REActiveWorkoutPredictor__updateWorkoutState__block_invoke_2;
    v6[3] = &unk_24CF8C430;
    objc_copyWeak(&v7, (id *)(a1 + 40));
    v6[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "_currentWorkoutSnapshotWithCompletion:", v6);
    objc_destroyWeak(&v7);
  }
  else if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setHasActiveWorkout:", 0);
    objc_msgSend(v5, "finishFetchingData");
    objc_msgSend(v5, "updateObservers");
  }

}

void __47__REActiveWorkoutPredictor__updateWorkoutState__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  id WeakRetained;
  NSObject *v12;
  _QWORD block[5];

  v5 = a2;
  v6 = a3;
  v7 = v5;
  v8 = v7;
  if (v7)
  {
    if (objc_msgSend(v7, "isFirstPartyWorkout"))
    {
      v9 = objc_msgSend(v8, "internalState");
      if (v9 >= 0x11)
        v10 = 0;
      else
        v10 = (0x1F80u >> v9) & 1;
    }
    else
    {
      v10 = ((objc_msgSend(v8, "sessionState") - 2) & 0xFFFFFFFFFFFFFFFDLL) == 0;
    }
  }
  else
  {
    v10 = 0;
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && (_DWORD)v10 != objc_msgSend(*(id *)(a1 + 32), "hasActiveWorkout"))
  {
    objc_msgSend(WeakRetained, "setHasActiveWorkout:", v10);
    objc_msgSend(WeakRetained, "updateObservers");
    objc_msgSend(WeakRetained, "queue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __47__REActiveWorkoutPredictor__updateWorkoutState__block_invoke_3;
    block[3] = &unk_24CF8AAF0;
    block[4] = WeakRetained;
    dispatch_async(v12, block);

  }
}

uint64_t __47__REActiveWorkoutPredictor__updateWorkoutState__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_fetchWorkoutHistory");
  return objc_msgSend(*(id *)(a1 + 32), "finishFetchingData");
}

- (void)_scheduleFetchWorkoutTimer
{
  NSObject *v3;
  _QWORD block[5];

  -[REPredictor queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__REActiveWorkoutPredictor__scheduleFetchWorkoutTimer__block_invoke;
  block[3] = &unk_24CF8AAF0;
  block[4] = self;
  dispatch_async(v3, block);

}

void __54__REActiveWorkoutPredictor__scheduleFetchWorkoutTimer__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "invalidate");
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 20.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__REActiveWorkoutPredictor__scheduleFetchWorkoutTimer__block_invoke_2;
  v7[3] = &unk_24CF8ABD0;
  objc_copyWeak(&v8, &location);
  +[REUpNextTimer timerWithFireDate:queue:block:](REUpNextTimer, "timerWithFireDate:queue:block:", v2, v3, v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v4;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __54__REActiveWorkoutPredictor__scheduleFetchWorkoutTimer__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  LODWORD(v2) = objc_msgSend(v3, "isValid");

  v4 = WeakRetained;
  if ((_DWORD)v2 && WeakRetained)
  {
    objc_msgSend(WeakRetained, "_queue_fetchWorkoutHistory");
    v4 = WeakRetained;
  }

}

- (void)_queue_fetchWorkoutHistory
{
  REUpNextTimer *workoutQueryCoalesceTimer;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  objc_class *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  id location;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  _QWORD v45[3];
  __int128 v46;
  uint64_t v47;
  void *v48;
  uint64_t *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  if (!HealthKitLibraryCore_frameworkLibrary_0)
  {
    v46 = xmmword_24CF8C4C8;
    v47 = 0;
    HealthKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (HealthKitLibraryCore_frameworkLibrary_0)
  {
    -[REPredictor beginFetchingData](self, "beginFetchingData");
    -[REUpNextTimer invalidate](self->_workoutQueryCoalesceTimer, "invalidate");
    workoutQueryCoalesceTimer = self->_workoutQueryCoalesceTimer;
    self->_workoutQueryCoalesceTimer = 0;

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "dateByAddingUnit:value:toDate:options:", 16, -7, v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    REStartOfDayForDate(v5);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    REEndOfDayForDate(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BDD14C0];
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("startDate >= %@"), v33);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v8;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("startDate <= %@"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v45[1] = v9;
    v40 = 0;
    v41 = &v40;
    v42 = 0x2050000000;
    v10 = (void *)getHKQueryClass_softClass;
    v43 = getHKQueryClass_softClass;
    if (!getHKQueryClass_softClass)
    {
      *(_QWORD *)&v46 = MEMORY[0x24BDAC760];
      *((_QWORD *)&v46 + 1) = 3221225472;
      v47 = (uint64_t)__getHKQueryClass_block_invoke;
      v48 = &unk_24CF8AC38;
      v49 = &v40;
      __getHKQueryClass_block_invoke((uint64_t)&v46);
      v10 = (void *)v41[3];
    }
    v11 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v40, 8);
    v40 = 0;
    v41 = &v40;
    v42 = 0x2050000000;
    v12 = (void *)getHKSourceClass_softClass;
    v43 = getHKSourceClass_softClass;
    if (!getHKSourceClass_softClass)
    {
      *(_QWORD *)&v46 = MEMORY[0x24BDAC760];
      *((_QWORD *)&v46 + 1) = 3221225472;
      v47 = (uint64_t)__getHKSourceClass_block_invoke;
      v48 = &unk_24CF8AC38;
      v49 = &v40;
      __getHKSourceClass_block_invoke((uint64_t)&v46);
      v12 = (void *)v41[3];
    }
    v13 = objc_retainAutorelease(v12);
    _Block_object_dispose(&v40, 8);
    objc_msgSend(v13, "defaultSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "predicateForObjectsFromSource:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v45[2] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "andPredicateWithSubpredicates:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x24BDD17C0];
    *(_QWORD *)&v46 = 0;
    *((_QWORD *)&v46 + 1) = &v46;
    v47 = 0x2020000000;
    v19 = (id *)getHKSampleSortIdentifierStartDateSymbolLoc_ptr;
    v48 = (void *)getHKSampleSortIdentifierStartDateSymbolLoc_ptr;
    if (!getHKSampleSortIdentifierStartDateSymbolLoc_ptr)
    {
      v20 = (void *)HealthKitLibrary_0();
      v19 = (id *)dlsym(v20, "HKSampleSortIdentifierStartDate");
      *(_QWORD *)(*((_QWORD *)&v46 + 1) + 24) = v19;
      getHKSampleSortIdentifierStartDateSymbolLoc_ptr = (uint64_t)v19;
    }
    _Block_object_dispose(&v46, 8);
    if (!v19)
    {
      -[RELemmaEnumerator init].cold.1();
      __break(1u);
    }
    v21 = *v19;
    objc_msgSend(v18, "sortDescriptorWithKey:ascending:", v21, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    v40 = 0;
    v41 = &v40;
    v42 = 0x2050000000;
    v23 = (void *)getHKSampleQueryClass_softClass;
    v43 = getHKSampleQueryClass_softClass;
    if (!getHKSampleQueryClass_softClass)
    {
      *(_QWORD *)&v46 = MEMORY[0x24BDAC760];
      *((_QWORD *)&v46 + 1) = 3221225472;
      v47 = (uint64_t)__getHKSampleQueryClass_block_invoke;
      v48 = &unk_24CF8AC38;
      v49 = &v40;
      __getHKSampleQueryClass_block_invoke((uint64_t)&v46);
      v23 = (void *)v41[3];
    }
    v24 = objc_retainAutorelease(v23);
    _Block_object_dispose(&v40, 8);
    v25 = [v24 alloc];
    v40 = 0;
    v41 = &v40;
    v42 = 0x2050000000;
    v26 = (void *)getHKObjectTypeClass_softClass;
    v43 = getHKObjectTypeClass_softClass;
    if (!getHKObjectTypeClass_softClass)
    {
      *(_QWORD *)&v46 = MEMORY[0x24BDAC760];
      *((_QWORD *)&v46 + 1) = 3221225472;
      v47 = (uint64_t)__getHKObjectTypeClass_block_invoke;
      v48 = &unk_24CF8AC38;
      v49 = &v40;
      __getHKObjectTypeClass_block_invoke((uint64_t)&v46);
      v26 = (void *)v41[3];
    }
    v27 = objc_retainAutorelease(v26);
    _Block_object_dispose(&v40, 8);
    objc_msgSend(v27, "workoutType");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v22;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v44, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __54__REActiveWorkoutPredictor__queue_fetchWorkoutHistory__block_invoke;
    v37[3] = &unk_24CF8C480;
    objc_copyWeak(&v38, &location);
    v30 = (void *)objc_msgSend(v25, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v28, v17, 100, v29, v37);

    +[RESingleton sharedInstance](REHealthStore, "sharedInstance");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __54__REActiveWorkoutPredictor__queue_fetchWorkoutHistory__block_invoke_2;
    v35[3] = &unk_24CF8C268;
    v32 = v30;
    v36 = v32;
    objc_msgSend(v31, "accessHealthStore:", v35);

    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);

  }
}

void __54__REActiveWorkoutPredictor__queue_fetchWorkoutHistory__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id WeakRetained;
  NSObject *v12;
  _QWORD v13[5];
  uint8_t buf[16];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    RELogForDomain(8);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __54__REActiveWorkoutPredictor__queue_fetchWorkoutHistory__block_invoke_cold_1((uint64_t)v9, v10);

    v8 = (id)MEMORY[0x24BDBD1A8];
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    RELogForDomain(8);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2132F7000, v12, OS_LOG_TYPE_INFO, "Received new workout data", buf, 2u);
    }

    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __54__REActiveWorkoutPredictor__queue_fetchWorkoutHistory__block_invoke_208;
    v13[3] = &unk_24CF8AAF0;
    v13[4] = WeakRetained;
    objc_msgSend(WeakRetained, "_processWorkoutHistoryData:completion:", v8, v13);
  }

}

uint64_t __54__REActiveWorkoutPredictor__queue_fetchWorkoutHistory__block_invoke_208(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishFetchingData");
}

uint64_t __54__REActiveWorkoutPredictor__queue_fetchWorkoutHistory__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "executeQuery:", *(_QWORD *)(a1 + 32));
}

- (void)_processWorkoutHistoryData:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  id v22;
  unint64_t v23;
  _QWORD block[5];
  id v26;
  id v27;
  uint64_t v28;
  float v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v23 = objc_msgSend(v5, "count");
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = 0;
    v12 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v31 != v12)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v14, "startDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = REDateOccursToday(v15);

        objc_msgSend(v14, "endDate");
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)v17;
        if (v10)
        {
          objc_msgSend(v10, "laterDate:", v17);
          v19 = objc_claimAutoreleasedReturnValue();

          v10 = (void *)v19;
        }
        else
        {
          v10 = (void *)v17;
        }
        v11 += v16;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
    v11 = 0;
  }

  -[REPredictor queue](self, "queue");
  v20 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__REActiveWorkoutPredictor__processWorkoutHistoryData_completion___block_invoke;
  block[3] = &unk_24CF8C4A8;
  v29 = (float)v23 / 7.0;
  block[4] = self;
  v26 = v10;
  v27 = v6;
  v28 = v11;
  v21 = v6;
  v22 = v10;
  dispatch_async(v20, block);

}

uint64_t __66__REActiveWorkoutPredictor__processWorkoutHistoryData_completion___block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 68) = *(_DWORD *)(a1 + 64);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "setLastCompletedWorkoutDate:", *(_QWORD *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "updateObservers");
}

- (float)dailyAverageWorkouts
{
  return self->_dailyAverageWorkouts;
}

- (unint64_t)numberOfWorkoutsPerformedToday
{
  return self->_numberOfWorkoutsPerformedToday;
}

- (BOOL)hasActiveWorkout
{
  return self->_hasActiveWorkout;
}

- (void)setHasActiveWorkout:(BOOL)a3
{
  self->_hasActiveWorkout = a3;
}

- (NSDate)lastCompletedWorkoutDate
{
  return (NSDate *)objc_getProperty(self, a2, 104, 1);
}

- (void)setLastCompletedWorkoutDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCompletedWorkoutDate, 0);
  objc_storeStrong((id *)&self->_workoutQueryCoalesceTimer, 0);
  objc_storeStrong((id *)&self->_workoutObservationQuery, 0);
}

void __54__REActiveWorkoutPredictor__queue_fetchWorkoutHistory__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2132F7000, a2, OS_LOG_TYPE_ERROR, "Unable to fetch workout data: %@", (uint8_t *)&v2, 0xCu);
}

@end
