@implementation HDSHWidgetSchedulingManager

- (HDSHWidgetSchedulingManager)initWithProfile:(id)a3
{
  id v4;
  HDSHWidgetSchedulingManager *v5;
  HDSHWidgetSchedulingManager *v6;
  uint64_t v7;
  OS_dispatch_queue *queue;
  id v9;
  void *v10;
  uint64_t v11;
  HKSPSleepStore *sleepStore;
  id v13;
  uint64_t v14;
  HKSPThrottler *reloadThrottler;
  id WeakRetained;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id location;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)HDSHWidgetSchedulingManager;
  v5 = -[HDSHWidgetSchedulingManager init](&v25, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    HKCreateSerialDispatchQueue();
    v7 = objc_claimAutoreleasedReturnValue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v9 = objc_alloc(MEMORY[0x24BEA9950]);
    HKSPGenerateSleepStoreIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "initWithIdentifier:healthStore:options:", v10, 0, 8);
    sleepStore = v6->_sleepStore;
    v6->_sleepStore = (HKSPSleepStore *)v11;

    objc_initWeak(&location, v6);
    v13 = objc_alloc(MEMORY[0x24BEA9968]);
    v19 = MEMORY[0x24BDAC760];
    v20 = 3221225472;
    v21 = __47__HDSHWidgetSchedulingManager_initWithProfile___block_invoke;
    v22 = &unk_24DDB8C90;
    objc_copyWeak(&v23, &location);
    v14 = objc_msgSend(v13, "initWithInterval:executeBlock:", &v19, 1.0);
    reloadThrottler = v6->_reloadThrottler;
    v6->_reloadThrottler = (HKSPThrottler *)v14;

    WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    objc_msgSend(WeakRetained, "daemon", v19, v20, v21, v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "registerDaemonReadyObserver:queue:", v6, v6->_queue);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __47__HDSHWidgetSchedulingManager_initWithProfile___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reloadWidgetsWithReasons:", 1);
  objc_msgSend(WeakRetained, "_updateWidgetRelevances");

}

- (void)dealloc
{
  objc_super v3;

  -[HDSHWidgetSchedulingManager _stopObservingSleep](self, "_stopObservingSleep");
  v3.receiver = self;
  v3.super_class = (Class)HDSHWidgetSchedulingManager;
  -[HDSHWidgetSchedulingManager dealloc](&v3, sel_dealloc);
}

- (void)_startObservingSleep
{
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "dataManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3DC0], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2A28]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:forDataType:", self, v4);

}

- (void)_stopObservingSleep
{
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "dataManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3DC0], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2A28]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forDataType:", self, v4);

}

- (void)_reloadWidgetsWithReasons:(unint64_t)a3
{
  id v3;

  -[HKSPSleepStore widgetManager](self->_sleepStore, "widgetManager", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadWidgetsWithReason:", 1);

}

- (void)_updateWidgetRelevances
{
  id v2;

  -[HKSPSleepStore widgetManager](self->_sleepStore, "widgetManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateRelevances");

}

- (void)daemonReady:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  id WeakRetained;
  void *v8;
  OS_dispatch_queue *queue;
  _QWORD v10[5];
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x24BDD3060];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v6 = v12;
    _os_log_impl(&dword_21AB9E000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] daemonReady", buf, 0xCu);

  }
  -[HDSHWidgetSchedulingManager _startObservingSleep](self, "_startObservingSleep");
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __43__HDSHWidgetSchedulingManager_daemonReady___block_invoke;
  v10[3] = &unk_24DDB8B88;
  v10[4] = self;
  objc_msgSend(v8, "performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:block:", queue, v10);

}

uint64_t __43__HDSHWidgetSchedulingManager_daemonReady___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x24BDD3060];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    *(_DWORD *)v6 = 138543362;
    *(_QWORD *)&v6[4] = objc_opt_class();
    v4 = *(id *)&v6[4];
    _os_log_impl(&dword_21AB9E000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] first unlock occurred", v6, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_reloadWidgetsWithReasons:", 2, *(_OWORD *)v6);
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  id v5;

  objc_msgSend(a3, "na_filter:", &__block_literal_global_0, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend((id)objc_opt_class(), "_logSleepSampleStatistics:", v5);
    -[HKSPThrottler execute](self->_reloadThrottler, "execute");
  }

}

uint64_t __51__HDSHWidgetSchedulingManager_samplesAdded_anchor___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "categoryType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDD2A28]);

  return v8;
}

- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4
{
  if (objc_msgSend(a3, "na_any:", &__block_literal_global_195, a4))
    -[HKSPThrottler execute](self->_reloadThrottler, "execute");
}

uint64_t __64__HDSHWidgetSchedulingManager_samplesOfTypesWereRemoved_anchor___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDD2A28]);

  return v3;
}

+ (void)_logSleepSampleStatistics:(id)a3
{
  id v3;
  id *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  id v23;
  _QWORD v24[8];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __57__HDSHWidgetSchedulingManager__logSleepSampleStatistics___block_invoke;
  v24[3] = &unk_24DDB8D38;
  v24[4] = &v37;
  v24[5] = &v33;
  v24[6] = &v25;
  v24[7] = &v29;
  objc_msgSend(v3, "na_each:", v24);
  _HKInitializeLogging();
  v4 = (id *)MEMORY[0x24BDD3060];
  v5 = (id)*MEMORY[0x24BDD3060];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (id)objc_opt_class();
    v7 = objc_msgSend(v3, "count");
    *(_DWORD *)buf = 138543618;
    v42 = v6;
    v43 = 2048;
    v44 = v7;
    _os_log_impl(&dword_21AB9E000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] %ld sleep samples added", buf, 0x16u);

  }
  _HKInitializeLogging();
  v8 = *v4;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_opt_class();
    v10 = v38[3];
    *(_DWORD *)buf = 138543618;
    v42 = v9;
    v43 = 2048;
    v44 = v10;
    v11 = v9;
    _os_log_impl(&dword_21AB9E000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] in bed: %ld", buf, 0x16u);

  }
  _HKInitializeLogging();
  v12 = *v4;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_opt_class();
    v14 = v34[3];
    *(_DWORD *)buf = 138543618;
    v42 = v13;
    v43 = 2048;
    v44 = v14;
    v15 = v13;
    _os_log_impl(&dword_21AB9E000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] asleep: %ld", buf, 0x16u);

  }
  _HKInitializeLogging();
  v16 = *v4;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_opt_class();
    v18 = v30[3];
    *(_DWORD *)buf = 138543618;
    v42 = v17;
    v43 = 2048;
    v44 = v18;
    v19 = v17;
    _os_log_impl(&dword_21AB9E000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep stages: %ld", buf, 0x16u);

  }
  _HKInitializeLogging();
  v20 = *v4;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = (void *)objc_opt_class();
    v22 = v26[3];
    *(_DWORD *)buf = 138543618;
    v42 = v21;
    v43 = 2048;
    v44 = v22;
    v23 = v21;
    _os_log_impl(&dword_21AB9E000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] first party asleep: %ld", buf, 0x16u);

  }
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

}

void __57__HDSHWidgetSchedulingManager__logSleepSampleStatistics___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  BOOL v10;
  _QWORD *v11;
  id v12;

  v12 = a2;
  if (!objc_msgSend(v12, "value"))
  {
    v11 = (_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
    v6 = v12;
    goto LABEL_11;
  }
  HKCategoryValueSleepAnalysisAsleepValues();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v12, "value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  v6 = v12;
  if (v5)
  {
    ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
    objc_msgSend(v12, "sourceRevision");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "source");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "_isAppleWatch");

    if (v9)
      ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
    v10 = objc_msgSend(v12, "value") == 5;
    v6 = v12;
    if (v10
      || (v10 = objc_msgSend(v12, "value") == 3, v6 = v12, v10)
      || (v10 = objc_msgSend(v12, "value") == 4, v6 = v12, v10))
    {
      v11 = (_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
LABEL_11:
      ++*v11;
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sleepStore, 0);
  objc_storeStrong((id *)&self->_reloadThrottler, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
