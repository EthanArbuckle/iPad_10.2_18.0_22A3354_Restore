@implementation REActivitySummaryPredictor

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
  +[REFeature activeEnergyCompletionFeature](REFeature, "activeEnergyCompletionFeature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature exerciseTimeCompletionFeature](REFeature, "exerciseTimeCompletionFeature", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  +[REFeature standHourCompletionFeature](REFeature, "standHourCompletionFeature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[REFeatureSet initWithFeatures:](v2, "initWithFeatures:", v6);

  return v7;
}

- (id)_init
{
  _QWORD *v2;
  double v3;
  _QWORD *v4;
  double v5;
  double v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)REActivitySummaryPredictor;
  v2 = -[REPredictor _init](&v10, sel__init);
  v4 = v2;
  if (v2)
  {
    LODWORD(v3) = 0;
    objc_msgSend(v2, "setActiveEnergyPercentComplete:", v3);
    LODWORD(v5) = 0;
    objc_msgSend(v4, "setExerciseTimePercentComplete:", v5);
    LODWORD(v6) = 0;
    objc_msgSend(v4, "setStandHourPercentComplete:", v6);
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v4[8];
    v4[8] = v7;

  }
  return v4;
}

+ (double)updateInterval
{
  return 14400.0;
}

- (void)resume
{
  -[REActivitySummaryPredictor _startActivitySummaryQueryWithRetries:](self, "_startActivitySummaryQueryWithRetries:", 3);
}

- (void)update
{
  -[REActivitySummaryPredictor _stopQueries](self, "_stopQueries");
  -[REActivitySummaryPredictor _startActivitySummaryQueryWithRetries:](self, "_startActivitySummaryQueryWithRetries:", 3);
}

- (id)featureValueForFeature:(id)a3 element:(id)a4 engine:(id)a5 trainingContext:(id)a6
{
  id v7;
  void *v8;
  int v9;
  float v10;
  void *v11;
  int v12;
  void *v13;

  v7 = a3;
  +[REFeature activeEnergyCompletionFeature](REFeature, "activeEnergyCompletionFeature");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9)
  {
    -[REActivitySummaryPredictor activeEnergyPercentComplete](self, "activeEnergyPercentComplete");
  }
  else
  {
    +[REFeature exerciseTimeCompletionFeature](REFeature, "exerciseTimeCompletionFeature");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v7, "isEqual:", v11);

    if (v12)
      -[REActivitySummaryPredictor exerciseTimePercentComplete](self, "exerciseTimePercentComplete");
    else
      -[REActivitySummaryPredictor standHourPercentComplete](self, "standHourPercentComplete");
  }
  +[REFeatureValue featureValueWithDouble:](REFeatureValue, "featureValueWithDouble:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)_startActivitySummaryQueryWithRetries:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  objc_class *v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *, void *);
  void *v15;
  REActivitySummaryPredictor *v16;
  id v17[2];
  id location;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t buf[16];
  void (*v24)(uint64_t);
  void *v25;
  uint64_t *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (a3 <= 0)
  {
    RELogForDomain(8);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[REActivitySummaryPredictor _startActivitySummaryQueryWithRetries:].cold.1(v11);

  }
  else
  {
    if (!HealthKitLibraryCore_frameworkLibrary)
    {
      *(_OWORD *)buf = xmmword_24CF8C2B0;
      v24 = 0;
      HealthKitLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (HealthKitLibraryCore_frameworkLibrary)
    {
      objc_initWeak(&location, self);
      v19 = 0;
      v20 = &v19;
      v21 = 0x2050000000;
      v5 = (void *)get_HKCurrentActivitySummaryQueryClass_softClass;
      v22 = get_HKCurrentActivitySummaryQueryClass_softClass;
      v6 = MEMORY[0x24BDAC760];
      if (!get_HKCurrentActivitySummaryQueryClass_softClass)
      {
        *(_QWORD *)buf = MEMORY[0x24BDAC760];
        *(_QWORD *)&buf[8] = 3221225472;
        v24 = __get_HKCurrentActivitySummaryQueryClass_block_invoke;
        v25 = &unk_24CF8AC38;
        v26 = &v19;
        __get_HKCurrentActivitySummaryQueryClass_block_invoke((uint64_t)buf);
        v5 = (void *)v20[3];
      }
      v7 = objc_retainAutorelease(v5);
      _Block_object_dispose(&v19, 8);
      v8 = [v7 alloc];
      v12 = v6;
      v13 = 3221225472;
      v14 = __68__REActivitySummaryPredictor__startActivitySummaryQueryWithRetries___block_invoke;
      v15 = &unk_24CF8C218;
      objc_copyWeak(v17, &location);
      v17[1] = (id)a3;
      v16 = self;
      v9 = (void *)objc_msgSend(v8, "initWithUpdateHandler:", &v12);
      RELogForDomain(8);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2132F7000, v10, OS_LOG_TYPE_INFO, "Begin activity summary query", buf, 2u);
      }

      -[REActivitySummaryPredictor _runQuery:](self, "_runQuery:", v9, v12, v13, v14, v15);
      objc_destroyWeak(v17);
      objc_destroyWeak(&location);
    }
  }
}

void __68__REActivitySummaryPredictor__startActivitySummaryQueryWithRetries___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[5];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "beginFetchingData");
    if (v9)
    {
      RELogForDomain(8);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        __68__REActivitySummaryPredictor__startActivitySummaryQueryWithRetries___block_invoke_cold_1((uint64_t)v9, v12);

      objc_msgSend(v11, "_stopQuery:", v7);
      objc_msgSend(v11, "_startActivitySummaryQueryWithRetries:", *(_QWORD *)(a1 + 48) - 1);
      objc_msgSend(*(id *)(a1 + 32), "finishFetchingData");
    }
    else
    {
      v13 = *(void **)(a1 + 32);
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __68__REActivitySummaryPredictor__startActivitySummaryQueryWithRetries___block_invoke_5;
      v14[3] = &unk_24CF8AAF0;
      v14[4] = v13;
      objc_msgSend(v13, "_updateWithActivitySummary:completion:", v8, v14);
    }
  }

}

uint64_t __68__REActivitySummaryPredictor__startActivitySummaryQueryWithRetries___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishFetchingData");
}

- (void)_runQuery:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  REActivitySummaryPredictor *v9;

  v4 = a3;
  +[RESingleton sharedInstance](REHealthStore, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __40__REActivitySummaryPredictor__runQuery___block_invoke;
  v7[3] = &unk_24CF8C240;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "accessHealthStore:", v7);

}

void __40__REActivitySummaryPredictor__runQuery___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "executeQuery:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "setByAddingObject:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(v4 + 64);
  *(_QWORD *)(v4 + 64) = v3;

}

- (void)_stopQuery:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  REActivitySummaryPredictor *v9;

  v4 = a3;
  +[RESingleton sharedInstance](REHealthStore, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__REActivitySummaryPredictor__stopQuery___block_invoke;
  v7[3] = &unk_24CF8C240;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "accessHealthStore:", v7);

}

void __41__REActivitySummaryPredictor__stopQuery___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "stopQuery:", *(_QWORD *)(a1 + 32));
  v6 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "mutableCopy");
  objc_msgSend(v6, "removeObject:", *(_QWORD *)(a1 + 32));
  v3 = objc_msgSend(v6, "copy");
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(v4 + 64);
  *(_QWORD *)(v4 + 64) = v3;

}

- (void)_stopQueries
{
  void *v3;
  _QWORD v4[5];

  +[RESingleton sharedInstance](REHealthStore, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __42__REActivitySummaryPredictor__stopQueries__block_invoke;
  v4[3] = &unk_24CF8C268;
  v4[4] = self;
  objc_msgSend(v3, "accessHealthStore:", v4);

}

void __42__REActivitySummaryPredictor__stopQueries__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "stopQuery:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8++), (_QWORD)v12);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 64);
  *(_QWORD *)(v10 + 64) = v9;

}

- (void)_updateWithActivitySummary:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  REActivitySummaryPredictor *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[REPredictor queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__REActivitySummaryPredictor__updateWithActivitySummary_completion___block_invoke;
  block[3] = &unk_24CF8C290;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

uint64_t __68__REActivitySummaryPredictor__updateWithActivitySummary_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  float v29;
  float v30;
  float v31;
  int v32;
  float v33;
  float v34;
  double v35;
  double v36;
  double v37;
  NSObject *v38;
  int v40;
  double v41;
  __int16 v42;
  double v43;
  __int16 v44;
  double v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(getHKUnitClass(), "largeCalorieUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    RELogForDomain(8);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v40) = 0;
      v12 = "Unable to find largeCalorieUnit. Skipping update";
      goto LABEL_7;
    }
LABEL_8:

    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  objc_msgSend(*(id *)(a1 + 32), "activeEnergyBurned");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getHKUnitClass(), "largeCalorieUnit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValueForUnit:", v4);
  v6 = v5;

  objc_msgSend(*(id *)(a1 + 32), "activeEnergyBurnedGoal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getHKUnitClass(), "largeCalorieUnit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValueForUnit:", v8);
  v10 = v9;

  if (v10 < 2.22044605e-16)
  {
    RELogForDomain(8);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v40) = 0;
      v12 = "Activity is not configured. Skipping update";
LABEL_7:
      _os_log_impl(&dword_2132F7000, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v40, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 32), "appleExerciseTime");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getHKUnitClass(), "minuteUnit");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValueForUnit:", v14);
  v16 = v15;

  objc_msgSend(*(id *)(a1 + 32), "appleExerciseTimeGoal");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getHKUnitClass(), "minuteUnit");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "doubleValueForUnit:", v18);
  v20 = v19;

  objc_msgSend(*(id *)(a1 + 32), "appleStandHours");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getHKUnitClass(), "countUnit");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "doubleValueForUnit:", v22);
  v24 = v23;

  objc_msgSend(*(id *)(a1 + 32), "appleStandHoursGoal");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getHKUnitClass(), "countUnit");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "doubleValueForUnit:", v26);
  v28 = v27;

  v29 = v6 / v10;
  v30 = v16 / v20;
  v31 = v24 / v28;
  objc_msgSend(*(id *)(a1 + 40), "activeEnergyPercentComplete");
  LODWORD(v24) = v32;
  objc_msgSend(*(id *)(a1 + 40), "exerciseTimePercentComplete");
  v34 = v33;
  objc_msgSend(*(id *)(a1 + 40), "standHourPercentComplete");
  if (vabds_f32(v29, *(float *)&v24) >= 0.07 || vabds_f32(v30, v34) >= 0.07 || vabds_f32(v31, *(float *)&v35) >= 0.07)
  {
    *(float *)&v35 = v29;
    objc_msgSend(*(id *)(a1 + 40), "setActiveEnergyPercentComplete:", v35);
    *(float *)&v36 = v30;
    objc_msgSend(*(id *)(a1 + 40), "setExerciseTimePercentComplete:", v36);
    *(float *)&v37 = v31;
    objc_msgSend(*(id *)(a1 + 40), "setStandHourPercentComplete:", v37);
    RELogForDomain(8);
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      v40 = 134218496;
      v41 = v29;
      v42 = 2048;
      v43 = v30;
      v44 = 2048;
      v45 = v31;
      _os_log_impl(&dword_2132F7000, v38, OS_LOG_TYPE_INFO, "Updating active summary with new data activeEnergyPercentComplete=%f exerciseTimePercentComplete=%f standHourPercentComplete=%f", (uint8_t *)&v40, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 40), "updateObservers");
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (float)activeEnergyPercentComplete
{
  return self->_activeEnergyPercentComplete;
}

- (void)setActiveEnergyPercentComplete:(float)a3
{
  self->_activeEnergyPercentComplete = a3;
}

- (float)exerciseTimePercentComplete
{
  return self->_exerciseTimePercentComplete;
}

- (void)setExerciseTimePercentComplete:(float)a3
{
  self->_exerciseTimePercentComplete = a3;
}

- (float)standHourPercentComplete
{
  return self->_standHourPercentComplete;
}

- (void)setStandHourPercentComplete:(float)a3
{
  self->_standHourPercentComplete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queries, 0);
}

- (void)_startActivitySummaryQueryWithRetries:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2132F7000, log, OS_LOG_TYPE_ERROR, "No more activity query retries allowed", v1, 2u);
}

void __68__REActivitySummaryPredictor__startActivitySummaryQueryWithRetries___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2132F7000, a2, OS_LOG_TYPE_ERROR, "Encountered error while fetching activity summary %@", (uint8_t *)&v2, 0xCu);
}

@end
