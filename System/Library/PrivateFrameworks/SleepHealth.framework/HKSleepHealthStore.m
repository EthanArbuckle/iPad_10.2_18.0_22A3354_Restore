@implementation HKSleepHealthStore

- (HKSleepHealthStore)initWithHealthStore:(id)a3
{
  id v5;
  HKSleepHealthStore *v6;
  uint64_t v7;
  NAScheduler *scheduler;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  HKTaskServerProxyProvider *proxyProvider;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKSleepHealthStore;
  v6 = -[HKSleepHealthStore init](&v15, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BE6B628], "serialDispatchQueueSchedulerWithName:", CFSTR("com.apple.HKSleepHealthStore"));
    v7 = objc_claimAutoreleasedReturnValue();
    scheduler = v6->_scheduler;
    v6->_scheduler = (NAScheduler *)v7;

    objc_storeStrong((id *)&v6->_healthStore, a3);
    v9 = objc_alloc(MEMORY[0x24BDD4038]);
    objc_msgSend((id)objc_opt_class(), "taskIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v5, v10, v6, v11);
    proxyProvider = v6->_proxyProvider;
    v6->_proxyProvider = (HKTaskServerProxyProvider *)v12;

  }
  return v6;
}

+ (NSString)taskIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)updateCurrentSleepSchedules:(id)a3 sleepDurationGoal:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _HKInitializeLogging();
  v11 = (void *)*MEMORY[0x24BDD3060];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    *(_DWORD *)buf = 138543618;
    v27 = (id)objc_opt_class();
    v28 = 2112;
    v29 = v8;
    v13 = v27;
    _os_log_impl(&dword_20A366000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating current sleep schedules: %@", buf, 0x16u);

  }
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  proxyProvider = self->_proxyProvider;
  v16 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __79__HKSleepHealthStore_updateCurrentSleepSchedules_sleepDurationGoal_completion___block_invoke;
  v22[3] = &unk_24C302408;
  v23 = v8;
  v24 = v9;
  v25 = v14;
  v20[0] = v16;
  v20[1] = 3221225472;
  v20[2] = __79__HKSleepHealthStore_updateCurrentSleepSchedules_sleepDurationGoal_completion___block_invoke_2;
  v20[3] = &unk_24C302430;
  v21 = v25;
  v17 = v25;
  v18 = v9;
  v19 = v8;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v22, v20);

}

uint64_t __79__HKSleepHealthStore_updateCurrentSleepSchedules_sleepDurationGoal_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_updateCurrentSleepSchedules:sleepDurationGoal:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __79__HKSleepHealthStore_updateCurrentSleepSchedules_sleepDurationGoal_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)startSleepTrackingSession
{
  void *v3;
  NSObject *v4;
  id v5;
  HKTaskServerProxyProvider *proxyProvider;
  _QWORD v7[5];
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x24BDD3060];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)buf = 138543362;
    v9 = (id)objc_opt_class();
    v5 = v9;
    _os_log_impl(&dword_20A366000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] starting a sleep tracking session", buf, 0xCu);

  }
  proxyProvider = self->_proxyProvider;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__HKSleepHealthStore_startSleepTrackingSession__block_invoke_2;
  v7[3] = &unk_24C302478;
  v7[4] = self;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", &__block_literal_global_0, v7);
}

uint64_t __47__HKSleepHealthStore_startSleepTrackingSession__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_startSleepTrackingSession");
}

void __47__HKSleepHealthStore_startSleepTrackingSession__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x24BDD3060];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_ERROR))
  {
    v4 = v3;
    v6 = 138543618;
    v7 = (id)objc_opt_class();
    v8 = 2112;
    v9 = v2;
    v5 = v7;
    _os_log_error_impl(&dword_20A366000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] failed to start a sleep tracking session with error: %@", (uint8_t *)&v6, 0x16u);

  }
}

- (void)stopSleepTrackingSession
{
  void *v3;
  NSObject *v4;
  id v5;
  HKTaskServerProxyProvider *proxyProvider;
  _QWORD v7[5];
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x24BDD3060];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)buf = 138543362;
    v9 = (id)objc_opt_class();
    v5 = v9;
    _os_log_impl(&dword_20A366000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] stopping a sleep tracking session", buf, 0xCu);

  }
  proxyProvider = self->_proxyProvider;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__HKSleepHealthStore_stopSleepTrackingSession__block_invoke_2;
  v7[3] = &unk_24C302478;
  v7[4] = self;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", &__block_literal_global_189, v7);
}

uint64_t __46__HKSleepHealthStore_stopSleepTrackingSession__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_stopSleepTrackingSession");
}

void __46__HKSleepHealthStore_stopSleepTrackingSession__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x24BDD3060];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_ERROR))
  {
    v4 = v3;
    v6 = 138543618;
    v7 = (id)objc_opt_class();
    v8 = 2112;
    v9 = v2;
    v5 = v7;
    _os_log_error_impl(&dword_20A366000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] failed to stop a sleep tracking session with error: %@", (uint8_t *)&v6, 0x16u);

  }
}

+ (BOOL)_areAllSamplesSleepTrackingSamples:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)MEMORY[0x24BDD3990];
  v4 = *MEMORY[0x24BDD2A28];
  v5 = a3;
  objc_msgSend(v3, "categoryTypeForIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__HKSleepHealthStore__areAllSamplesSleepTrackingSamples___block_invoke;
  v9[3] = &unk_24C3024C0;
  v10 = v6;
  v7 = v6;
  LOBYTE(v4) = objc_msgSend(v5, "hk_allObjectsPassTest:", v9);

  return v4;
}

uint64_t __57__HKSleepHealthStore__areAllSamplesSleepTrackingSamples___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "sampleType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

+ (BOOL)_areAllSamples:(id)a3 containedInDateInterval:(id)a4
{
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __61__HKSleepHealthStore__areAllSamples_containedInDateInterval___block_invoke;
  v8[3] = &unk_24C3024C0;
  v9 = v5;
  v6 = v5;
  LOBYTE(a3) = objc_msgSend(a3, "hk_allObjectsPassTest:", v8);

  return (char)a3;
}

uint64_t __61__HKSleepHealthStore__areAllSamples_containedInDateInterval___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsDate:", v5))
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v3, "endDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "containsDate:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)saveSleepTrackingSamples:(id)a3 completion:(id)a4
{
  -[HKSleepHealthStore saveSleepTrackingSamples:replacingSamplesInDateInterval:completion:](self, "saveSleepTrackingSamples:replacingSamplesInDateInterval:completion:", a3, 0, a4);
}

- (void)saveSleepTrackingSamples:(id)a3 replacingSamplesInDateInterval:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  os_log_t *v11;
  void *v12;
  _BOOL4 v13;
  NSObject *v14;
  id v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  void *v19;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v21;
  void *v22;
  os_log_t v23;
  void *v24;
  const __CFString *v25;
  os_log_t v26;
  NSObject *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  _HKInitializeLogging();
  v11 = (os_log_t *)MEMORY[0x24BDD3060];
  v12 = (void *)*MEMORY[0x24BDD3060];
  v13 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (!v13)
      goto LABEL_7;
    v14 = v12;
    *(_DWORD *)buf = 138543874;
    v40 = (id)objc_opt_class();
    v41 = 2112;
    v42 = v9;
    v43 = 2112;
    v44 = v8;
    v15 = v40;
    v16 = "[%{public}@] replacing sleep samples in %@ with sleep tracking samples: %@";
    v17 = v14;
    v18 = 32;
  }
  else
  {
    if (!v13)
      goto LABEL_7;
    v14 = v12;
    *(_DWORD *)buf = 138543618;
    v40 = (id)objc_opt_class();
    v41 = 2112;
    v42 = v8;
    v15 = v40;
    v16 = "[%{public}@] saving sleep tracking samples: %@";
    v17 = v14;
    v18 = 22;
  }
  _os_log_impl(&dword_20A366000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);

LABEL_7:
  if ((objc_msgSend((id)objc_opt_class(), "_areAllSamplesSleepTrackingSamples:", v8) & 1) == 0)
  {
    _HKInitializeLogging();
    v23 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_ERROR))
    {
      v27 = v23;
      v28 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v40 = v28;
      v29 = v28;
      _os_log_error_impl(&dword_20A366000, v27, OS_LOG_TYPE_ERROR, "[%{public}@] attempted to save non-sleep samples", buf, 0xCu);

    }
    v24 = (void *)MEMORY[0x24BDD1540];
    v25 = CFSTR("attempted to save non-sleep samples");
    goto LABEL_17;
  }
  if (v9 && (objc_msgSend((id)objc_opt_class(), "_areAllSamples:containedInDateInterval:", v8, v9) & 1) == 0)
  {
    _HKInitializeLogging();
    v26 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_ERROR))
    {
      v30 = v26;
      v31 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v40 = v31;
      v32 = v31;
      _os_log_error_impl(&dword_20A366000, v30, OS_LOG_TYPE_ERROR, "[%{public}@] dateInterval does not contain all samples", buf, 0xCu);

    }
    v24 = (void *)MEMORY[0x24BDD1540];
    v25 = CFSTR("dateInterval does not contain all samples");
LABEL_17:
    objc_msgSend(v24, "hk_error:description:", 3, v25);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v22);
    goto LABEL_18;
  }
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  proxyProvider = self->_proxyProvider;
  v21 = MEMORY[0x24BDAC760];
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __89__HKSleepHealthStore_saveSleepTrackingSamples_replacingSamplesInDateInterval_completion___block_invoke;
  v35[3] = &unk_24C302408;
  v36 = v8;
  v37 = v9;
  v38 = v19;
  v33[0] = v21;
  v33[1] = 3221225472;
  v33[2] = __89__HKSleepHealthStore_saveSleepTrackingSamples_replacingSamplesInDateInterval_completion___block_invoke_2;
  v33[3] = &unk_24C302430;
  v10 = (void (**)(id, _QWORD, void *))v38;
  v34 = v10;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v35, v33);

  v22 = v36;
LABEL_18:

}

uint64_t __89__HKSleepHealthStore_saveSleepTrackingSamples_replacingSamplesInDateInterval_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_saveSleepTrackingSamples:replacingSamplesInDateInterval:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __89__HKSleepHealthStore_saveSleepTrackingSamples_replacingSamplesInDateInterval_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (NAScheduler)scheduler
{
  return self->_scheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

@end
