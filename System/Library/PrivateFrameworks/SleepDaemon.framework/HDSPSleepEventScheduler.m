@implementation HDSPSleepEventScheduler

- (HDSPSleepEventScheduler)initWithEnvironment:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  HDSPSleepEventScheduler *v9;
  _QWORD v11[4];
  HDSPSleepEventScheduler *v12;

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __47__HDSPSleepEventScheduler_initWithEnvironment___block_invoke;
  v11[3] = &unk_24D4E5400;
  v12 = self;
  v4 = (objc_class *)MEMORY[0x24BEA9898];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(MEMORY[0x24BE6B628], "serialDispatchQueueSchedulerWithName:", CFSTR("com.apple.sleep.HDSPSleepEventScheduler"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithScheduler:", v7);
  v9 = -[HDSPSleepEventScheduler initWithEnvironment:schedulerProvider:limitingScheduler:](v12, "initWithEnvironment:schedulerProvider:limitingScheduler:", v5, v11, v8);

  return v9;
}

HDSPXPCAlarmScheduler *__47__HDSPSleepEventScheduler_initWithEnvironment___block_invoke(uint64_t a1)
{
  HDSPXPCAlarmScheduler *v2;
  id WeakRetained;
  void *v4;
  HDSPXPCAlarmScheduler *v5;

  v2 = [HDSPXPCAlarmScheduler alloc];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "currentDateProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HDSPXPCAlarmScheduler initWithCurrentDateProvider:](v2, "initWithCurrentDateProvider:", v4);

  return v5;
}

- (HDSPSleepEventScheduler)initWithEnvironment:(id)a3 schedulerProvider:(id)a4 limitingScheduler:(id)a5
{
  id v8;
  void (**v9)(id, id);
  id v10;
  HDSPSleepEventScheduler *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void (**v15)(void);
  uint64_t v16;
  HKSPMutexProvider *mutexProvider;
  HDSPSleepEventList *v18;
  HDSPSleepEventList *sleepEvents;
  id v20;
  void *v21;
  uint64_t v22;
  HKSPObserverSet *eventHandlers;
  uint64_t v24;
  NSHashTable *eventProviders;
  uint64_t v26;
  NSHashTable *pendingEventProviders;
  uint64_t v28;
  HDSPEventScheduler *scheduler;
  HDSPSleepEventScheduler *v30;
  objc_super v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  HDSPSleepEventScheduler *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, id))a4;
  v10 = a5;
  v32.receiver = self;
  v32.super_class = (Class)HDSPSleepEventScheduler;
  v11 = -[HDSPSleepEventScheduler init](&v32, sel_init);
  if (v11)
  {
    HKSPLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v34 = v13;
      v35 = 2048;
      v36 = v11;
      v14 = v13;
      _os_log_impl(&dword_21610C000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] initializing...", buf, 0x16u);

    }
    objc_storeWeak((id *)&v11->_environment, v8);
    objc_msgSend(v8, "mutexGenerator");
    v15 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v15[2]();
    v16 = objc_claimAutoreleasedReturnValue();
    mutexProvider = v11->_mutexProvider;
    v11->_mutexProvider = (HKSPMutexProvider *)v16;

    v18 = objc_alloc_init(HDSPSleepEventList);
    sleepEvents = v11->_sleepEvents;
    v11->_sleepEvents = v18;

    v20 = objc_alloc(MEMORY[0x24BEA98C8]);
    objc_msgSend(v8, "defaultCallbackScheduler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "initWithCallbackScheduler:", v21);
    eventHandlers = v11->_eventHandlers;
    v11->_eventHandlers = (HKSPObserverSet *)v22;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v24 = objc_claimAutoreleasedReturnValue();
    eventProviders = v11->_eventProviders;
    v11->_eventProviders = (NSHashTable *)v24;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v26 = objc_claimAutoreleasedReturnValue();
    pendingEventProviders = v11->_pendingEventProviders;
    v11->_pendingEventProviders = (NSHashTable *)v26;

    if (v9)
    {
      v9[2](v9, v8);
      v28 = objc_claimAutoreleasedReturnValue();
      scheduler = v11->_scheduler;
      v11->_scheduler = (HDSPEventScheduler *)v28;
    }
    else
    {
      scheduler = v11->_scheduler;
      v11->_scheduler = 0;
    }

    -[HDSPEventScheduler setDelegate:](v11->_scheduler, "setDelegate:", v11);
    objc_storeStrong((id *)&v11->_limitingScheduler, a5);
    v30 = v11;
  }

  return v11;
}

- (void)_withLock:(id)a3
{
  -[HKSPMutexProvider performBlock:](self->_mutexProvider, "performBlock:", a3);
}

- (void)rescheduleEvents
{
  NSObject *v3;
  id v4;
  _QWORD v5[5];
  uint8_t buf[4];
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = (id)objc_opt_class();
    v4 = v7;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] rescheduleEvents", buf, 0xCu);

  }
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __43__HDSPSleepEventScheduler_rescheduleEvents__block_invoke;
  v5[3] = &unk_24D4E3498;
  v5[4] = self;
  -[HDSPSleepEventScheduler _withLock:](self, "_withLock:", v5);
}

uint64_t __43__HDSPSleepEventScheduler_rescheduleEvents__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_rescheduleEvents");
}

- (void)_lock_rescheduleEvents
{
  _BOOL4 v3;
  NSObject *v4;
  _BOOL4 v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = -[HDSPSleepEventScheduler _lock_shouldScheduleEvents](self, "_lock_shouldScheduleEvents");
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_DWORD *)buf = 138543362;
      v14 = (id)objc_opt_class();
      v6 = v14;
      _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] rescheduling events", buf, 0xCu);

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
    objc_msgSend(WeakRetained, "assertionManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "takeAssertionWithIdentifier:type:", CFSTR("HDSPRescheduleTransaction"), 1);

    objc_msgSend(WeakRetained, "assertionManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "takeAssertionWithIdentifier:type:", CFSTR("HDSPRescheduleAssertion"), 2);

    -[NSHashTable allObjects](self->_eventProviders, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __49__HDSPSleepEventScheduler__lock_rescheduleEvents__block_invoke;
    v12[3] = &unk_24D4E5428;
    v12[4] = self;
    objc_msgSend(v10, "na_each:", v12);

  }
  else
  {
    if (v5)
    {
      *(_DWORD *)buf = 138543362;
      v14 = (id)objc_opt_class();
      v11 = v14;
      _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] unscheduling events", buf, 0xCu);

    }
    -[HDSPSleepEventList removeAllEvents](self->_sleepEvents, "removeAllEvents");
    -[NSHashTable removeAllObjects](self->_pendingEventProviders, "removeAllObjects");
    -[HDSPEventScheduler unschedule](self->_scheduler, "unschedule");
  }
  -[HDSPSleepEventScheduler _enqueueSchedulePendingEventsTask](self, "_enqueueSchedulePendingEventsTask");
}

uint64_t __49__HDSPSleepEventScheduler__lock_rescheduleEvents__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "addObject:", a2);
}

- (void)_enqueueSchedulePendingEventsTask
{
  HKSPLimitingScheduler *limitingScheduler;
  id v4;
  void *v5;
  _QWORD v6[5];

  limitingScheduler = self->_limitingScheduler;
  v4 = objc_alloc(MEMORY[0x24BEA9960]);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __60__HDSPSleepEventScheduler__enqueueSchedulePendingEventsTask__block_invoke;
  v6[3] = &unk_24D4E3498;
  v6[4] = self;
  v5 = (void *)objc_msgSend(v4, "initWithIdentifier:block:delay:", CFSTR("schedulePendingEvents"), v6, 0.1);
  -[HKSPLimitingScheduler scheduleTask:](limitingScheduler, "scheduleTask:", v5);

}

uint64_t __60__HDSPSleepEventScheduler__enqueueSchedulePendingEventsTask__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_schedulePendingEvents");
}

- (BOOL)_lock_shouldScheduleEvents
{
  HDSPEnvironment **p_environment;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  NSObject *v11;
  BOOL v12;
  id v13;
  NSObject *v14;
  id v15;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  p_environment = &self->_environment;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "sleepScheduleModelManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sleepSchedule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isEnabled") & 1) == 0)
  {
    HKSPLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138543362;
      v18 = (id)objc_opt_class();
      v13 = v18;
      _os_log_impl(&dword_21610C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep schedule disabled, not scheduling", (uint8_t *)&v17, 0xCu);

    }
    goto LABEL_11;
  }
  v6 = objc_loadWeakRetained((id *)p_environment);
  objc_msgSend(v6, "behavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isAppleWatch");

  if (v8)
  {
    v9 = objc_loadWeakRetained((id *)p_environment);
    objc_msgSend(v9, "sleepScheduleModelManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sleepSettings");
    v11 = objc_claimAutoreleasedReturnValue();

    if ((-[NSObject watchSleepFeaturesEnabled](v11, "watchSleepFeaturesEnabled") & 1) != 0)
    {

      goto LABEL_5;
    }
    HKSPLogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138543362;
      v18 = (id)objc_opt_class();
      v15 = v18;
      _os_log_impl(&dword_21610C000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep features disabled for this watch, not scheduling", (uint8_t *)&v17, 0xCu);

    }
LABEL_11:

    v12 = 0;
    goto LABEL_12;
  }
LABEL_5:
  v12 = 1;
LABEL_12:

  return v12;
}

- (void)environmentWillBecomeReady:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543362;
    v12 = (id)objc_opt_class();
    v6 = v12;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] environmentWillBecomeReady", (uint8_t *)&v11, 0xCu);

  }
  objc_msgSend(v4, "sleepScheduleModelManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:", self);

  objc_msgSend(v4, "timeChangeListener");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:", self);

  objc_msgSend(v4, "diagnostics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addProvider:", self);

  if (-[HDSPEventScheduler conformsToProtocol:](self->_scheduler, "conformsToProtocol:", &unk_254E34EE8))
  {
    objc_msgSend(v4, "notificationListener");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:", self->_scheduler);

  }
}

- (void)environmentDidBecomeReady:(id)a3
{
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = (id)objc_opt_class();
    v5 = v7;
    _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] environmentDidBecomeReady", (uint8_t *)&v6, 0xCu);

  }
  -[HDSPSleepEventScheduler _loadLastStandardSleepEvent](self, "_loadLastStandardSleepEvent");
  -[HDSPSleepEventScheduler rescheduleEvents](self, "rescheduleEvents");
}

- (void)_loadLastStandardSleepEvent
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __54__HDSPSleepEventScheduler__loadLastStandardSleepEvent__block_invoke;
  v2[3] = &unk_24D4E3498;
  v2[4] = self;
  -[HDSPSleepEventScheduler _withLock:](self, "_withLock:", v2);
}

void __54__HDSPSleepEventScheduler__loadLastStandardSleepEvent__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "userDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hksp_objectForKey:", CFSTR("HDSPLastStandardSleepEvent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x24BEA9878]);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithAllowedClasses:serializedDictionary:", v6, v4);

    v15 = 0;
    objc_msgSend(v7, "deserializeObjectOfClass:error:", objc_opt_class(), &v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v15;
    if (v9)
    {
      HKSPLogForCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v17 = v11;
        v18 = 2114;
        v19 = v4;
        v20 = 2114;
        v21 = v9;
        v12 = v11;
        _os_log_error_impl(&dword_21610C000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] failed to deserialize sleep event %{public}@ with error %{public}@", buf, 0x20u);

      }
    }
    else
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = v8;
      v10 = *(NSObject **)(v13 + 16);
      *(_QWORD *)(v13 + 16) = v14;
    }

  }
}

- (void)_lock_updateLastStandardSleepEvent:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  int v11;
  id v12;
  NSObject *WeakRetained;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  HKSPLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class();
    v8 = v7;
    objc_msgSend(v5, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v7;
    v20 = 2114;
    v21 = v9;
    _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] updating last standard sleep event: %{public}@", buf, 0x16u);

  }
  objc_storeStrong((id *)&self->_lastStandardSleepEvent, a3);
  v10 = objc_alloc_init(MEMORY[0x24BEA9880]);
  v17 = 0;
  v11 = objc_msgSend(v10, "serialize:error:", v5, &v17);
  v12 = v17;
  if (v11)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
    -[NSObject userDefaults](WeakRetained, "userDefaults");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "serializedDictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hksp_setObject:forKey:", v15, CFSTR("HDSPLastStandardSleepEvent"));

  }
  else
  {
    HKSPLogForCategory();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v16 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543874;
    v19 = v16;
    v20 = 2114;
    v21 = v5;
    v22 = 2114;
    v23 = v12;
    v14 = v16;
    _os_log_error_impl(&dword_21610C000, WeakRetained, OS_LOG_TYPE_ERROR, "[%{public}@] failed to serialize sleep event %{public}@ with error %{public}@", buf, 0x20u);
  }

LABEL_7:
}

- (void)_schedulePendingEvents
{
  NSObject *v3;
  id v4;
  id WeakRetained;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD *);
  void *v19;
  HDSPSleepEventScheduler *v20;
  id v21;
  id v22;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v25;
  char v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = objc_opt_class();
    v4 = *(id *)((char *)&buf + 4);
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] gathering pending events", (uint8_t *)&buf, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "currentDateProvider");
  v6 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();

  if (v6)
    v6[2](v6);
  else
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPSleepEventScheduler lastEventTriggerDate](self, "lastEventTriggerDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  objc_msgSend(v7, "dateByAddingTimeInterval:", -*MEMORY[0x24BEA9670]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "laterDate:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v25 = 0x2020000000;
  v26 = 0;
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __49__HDSPSleepEventScheduler__schedulePendingEvents__block_invoke;
  v19 = &unk_24D4E54A0;
  v20 = self;
  v14 = v13;
  v21 = v14;
  v15 = v7;
  v22 = v15;
  p_buf = &buf;
  -[HDSPSleepEventScheduler _withLock:](self, "_withLock:", &v16);
  if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
    -[HDSPSleepEventScheduler _enqueueHandleOverdueEventsTask](self, "_enqueueHandleOverdueEventsTask", v16, v17, v18, v19, v20, v21);

  _Block_object_dispose(&buf, 8);
}

void __49__HDSPSleepEventScheduler__schedulePendingEvents__block_invoke(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v24;
  id WeakRetained;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *);
  void *v31;
  uint64_t v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  if ((HKSPIsUnitTesting() & 1) == 0)
  {
    HKSPLogForCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = (void *)objc_opt_class();
      v4 = (void *)a1[5];
      v5 = *(_QWORD *)(a1[4] + 56);
      *(_DWORD *)buf = 138543874;
      v35 = v3;
      v36 = 2114;
      v37 = v4;
      v38 = 2114;
      v39 = v5;
      v6 = v3;
      _os_log_impl(&dword_21610C000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] looking for events due after: %{public}@ from: %{public}@", buf, 0x20u);

    }
  }
  objc_msgSend(*(id *)(a1[4] + 56), "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = MEMORY[0x24BDAC760];
  v29 = 3221225472;
  v30 = __49__HDSPSleepEventScheduler__schedulePendingEvents__block_invoke_255;
  v31 = &unk_24D4E5478;
  v8 = (void *)a1[5];
  v32 = a1[4];
  v33 = v8;
  objc_msgSend(v7, "na_each:", &v28);

  objc_msgSend(*(id *)(a1[4] + 56), "removeAllObjects", v28, v29, v30, v31, v32);
  if ((HKSPIsUnitTesting() & 1) == 0)
  {
    HKSPLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_opt_class();
      v11 = *(void **)(a1[4] + 32);
      *(_DWORD *)buf = 138543618;
      v35 = v10;
      v36 = 2114;
      v37 = v11;
      v12 = v10;
      _os_log_impl(&dword_21610C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] all upcoming events: %{public}@", buf, 0x16u);

    }
  }
  objc_msgSend(*(id *)(a1[4] + 32), "nextEvent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if ((HKSPIsUnitTesting() & 1) == 0)
    {
      HKSPLogForCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v35 = v15;
        v36 = 2114;
        v37 = v13;
        v16 = v15;
        _os_log_impl(&dword_21610C000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] next event is %{public}@", buf, 0x16u);

      }
    }
    objc_msgSend(v13, "dueDate");
    v17 = objc_claimAutoreleasedReturnValue();
    if ((-[NSObject hksp_isAfterDate:](v17, "hksp_isAfterDate:", a1[6]) & 1) != 0)
    {
      v18 = *(void **)(a1[4] + 64);
      objc_msgSend(v13, "dueDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "scheduleEventForDate:options:", v19, objc_msgSend(v13, "isUserVisible"));

    }
    else
    {
      HKSPLogForCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v35 = v23;
        v24 = v23;
        _os_log_impl(&dword_21610C000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] event is already due", buf, 0xCu);

      }
      *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
    }
  }
  else
  {
    HKSPLogForCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v35 = v20;
      v21 = v20;
      _os_log_impl(&dword_21610C000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] no upcoming events", buf, 0xCu);

    }
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  objc_msgSend(WeakRetained, "assertionManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "releaseAssertionWithIdentifier:", CFSTR("HDSPRescheduleAssertion"));

  objc_msgSend(WeakRetained, "assertionManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "releaseAssertionWithIdentifier:", CFSTR("HDSPRescheduleTransaction"));

}

void __49__HDSPSleepEventScheduler__schedulePendingEvents__block_invoke_255(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeEventsForProvider:", v3);
  objc_msgSend(v3, "upcomingEventsDueAfterDate:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __49__HDSPSleepEventScheduler__schedulePendingEvents__block_invoke_2;
  v14[3] = &unk_24D4E5450;
  v15 = *(id *)(a1 + 40);
  objc_msgSend(v4, "na_filter:", v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "count");
  v7 = HKSPIsUnitTesting();
  if (v6)
  {
    if ((v7 & 1) == 0)
    {
      HKSPLogForCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v17 = v9;
        v18 = 2114;
        v19 = v3;
        v20 = 2114;
        v21 = v5;
        v10 = v9;
        _os_log_impl(&dword_21610C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ has upcoming events: %{public}@", buf, 0x20u);

      }
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addEvents:provider:", v5, v3);
  }
  else if ((v7 & 1) == 0)
  {
    HKSPLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v17 = v12;
      v18 = 2114;
      v19 = v3;
      v13 = v12;
      _os_log_impl(&dword_21610C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ has no upcoming events", buf, 0x16u);

    }
  }

}

uint64_t __49__HDSPSleepEventScheduler__schedulePendingEvents__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "dueDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hksp_isAfterDate:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (NSDate)lastEventTriggerDate
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "userDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hksp_objectForKey:", CFSTR("HDSPLastEventTriggerDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (void)setLastEventTriggerDate:(id)a3
{
  HDSPEnvironment **p_environment;
  id v4;
  void *v5;
  id WeakRetained;

  p_environment = &self->_environment;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_environment);
  objc_msgSend(WeakRetained, "userDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hksp_setObject:forKey:", v4, CFSTR("HDSPLastEventTriggerDate"));

}

- (HKSPSleepEvent)lastStandardSleepEvent
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__14;
  v9 = __Block_byref_object_dispose__14;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __49__HDSPSleepEventScheduler_lastStandardSleepEvent__block_invoke;
  v4[3] = &unk_24D4E3CE8;
  v4[4] = self;
  v4[5] = &v5;
  -[HDSPSleepEventScheduler _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (HKSPSleepEvent *)v2;
}

void __49__HDSPSleepEventScheduler_lastStandardSleepEvent__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
}

- (void)scheduledEventIsDue
{
  NSObject *v3;
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = (id)objc_opt_class();
    v4 = v6;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] scheduledEventIsDue", (uint8_t *)&v5, 0xCu);

  }
  -[HDSPSleepEventScheduler _enqueueHandleOverdueEventsTask](self, "_enqueueHandleOverdueEventsTask");
}

- (void)_enqueueHandleOverdueEventsTask
{
  HKSPLimitingScheduler *limitingScheduler;
  id v4;
  void *v5;
  _QWORD v6[5];

  limitingScheduler = self->_limitingScheduler;
  v4 = objc_alloc(MEMORY[0x24BEA9960]);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__HDSPSleepEventScheduler__enqueueHandleOverdueEventsTask__block_invoke;
  v6[3] = &unk_24D4E3498;
  v6[4] = self;
  v5 = (void *)objc_msgSend(v4, "initWithIdentifier:block:", CFSTR("handleOverdueEvents"), v6);
  -[HKSPLimitingScheduler scheduleTask:](limitingScheduler, "scheduleTask:", v5);

}

uint64_t __58__HDSPSleepEventScheduler__enqueueHandleOverdueEventsTask__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleOverdueEvents");
}

- (void)_handleOverdueEvents
{
  NSObject *v3;
  id v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  HDSPSleepEventScheduler *v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = (id)objc_opt_class();
    v4 = v17;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] handling overdue events", buf, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "currentDateProvider");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    (*(void (**)(uint64_t))(v6 + 16))(v6);
  else
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPSleepEventScheduler setLastEventTriggerDate:](self, "setLastEventTriggerDate:", v8);
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __47__HDSPSleepEventScheduler__handleOverdueEvents__block_invoke;
  v13 = &unk_24D4E3680;
  v14 = self;
  v15 = v8;
  v9 = v8;
  -[HDSPSleepEventScheduler _withLock:](self, "_withLock:", &v10);
  -[HDSPSleepEventScheduler rescheduleEvents](self, "rescheduleEvents", v10, v11, v12, v13, v14);

}

void __47__HDSPSleepEventScheduler__handleOverdueEvents__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, void *);
  void *v10;
  id v11;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "overdueEventsForDate:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __47__HDSPSleepEventScheduler__handleOverdueEvents__block_invoke_2;
  v10 = &unk_24D4E5450;
  v11 = *(id *)(a1 + 40);
  objc_msgSend(v2, "na_filter:", &v7);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeEvents:", v5);
  objc_msgSend(v5, "na_filter:", &__block_literal_global_15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "_lock_updateLastStandardSleepEvent:", v4);
  objc_msgSend(*(id *)(a1 + 32), "notifyForOverdueEvents:", v5, v5, v7, v8, v9, v10);

}

uint64_t __47__HDSPSleepEventScheduler__handleOverdueEvents__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isExpired:", *(_QWORD *)(a1 + 32)) ^ 1;
}

uint64_t __47__HDSPSleepEventScheduler__handleOverdueEvents__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = (void *)MEMORY[0x24BEA98F8];
  v3 = a2;
  objc_msgSend(v2, "standardEventIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "containsObject:", v5);
  return v6;
}

- (void)notifyForOverdueEvents:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id WeakRetained;
  void *v8;
  HKSPObserverSet *eventHandlers;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;
  HDSPSleepEventScheduler *v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v18 = (id)objc_opt_class();
    v19 = 2114;
    v20 = v4;
    v6 = v18;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] overdue events: %{public}@", buf, 0x16u);

  }
  if (objc_msgSend(v4, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
    objc_msgSend(WeakRetained, "assertionManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "takeAssertionWithIdentifier:type:", CFSTR("HDSPNotifyDueAssertion"), 2);

    eventHandlers = self->_eventHandlers;
    v10 = MEMORY[0x24BDAC760];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __50__HDSPSleepEventScheduler_notifyForOverdueEvents___block_invoke;
    v14[3] = &unk_24D4E5530;
    v15 = v4;
    v16 = self;
    -[HKSPObserverSet enumerateObserversWithFutureBlock:](eventHandlers, "enumerateObserversWithFutureBlock:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __50__HDSPSleepEventScheduler_notifyForOverdueEvents___block_invoke_262;
    v13[3] = &unk_24D4E3EA0;
    v13[4] = self;
    v12 = (id)objc_msgSend(v11, "addCompletionBlock:", v13);

  }
}

id __50__HDSPSleepEventScheduler_notifyForOverdueEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __50__HDSPSleepEventScheduler_notifyForOverdueEvents___block_invoke_2;
  v11 = &unk_24D4E5508;
  v4 = *(void **)(a1 + 32);
  v12 = *(_QWORD *)(a1 + 40);
  v13 = v3;
  v5 = v3;
  objc_msgSend(v4, "na_each:", &v8);
  objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult", v8, v9, v10, v11, v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __50__HDSPSleepEventScheduler_notifyForOverdueEvents___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  id v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldNotifyHandler:forEvent:", *(_QWORD *)(a1 + 40), v3))
  {
    HKSPLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)objc_opt_class();
      v6 = *(_QWORD *)(a1 + 40);
      v8 = 138543874;
      v9 = v5;
      v10 = 2114;
      v11 = v6;
      v12 = 2114;
      v13 = v3;
      v7 = v5;
      _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] notifying %{public}@ for %{public}@", (uint8_t *)&v8, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "sleepEventIsDue:", v3);
  }

}

void __50__HDSPSleepEventScheduler_notifyForOverdueEvents___block_invoke_262(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "assertionManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "releaseAssertionWithIdentifier:", CFSTR("HDSPNotifyDueAssertion"));

}

- (BOOL)_shouldNotifyHandler:(id)a3 forEvent:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v5 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v5, "eventIdentifiers"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    objc_msgSend(v5, "eventIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "containsObject:", v9);

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (void)eventProviderHasUpcomingEvents:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "defaultCallbackScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __58__HDSPSleepEventScheduler_eventProviderHasUpcomingEvents___block_invoke;
  v8[3] = &unk_24D4E3680;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "performBlock:", v8);

}

void __58__HDSPSleepEventScheduler_eventProviderHasUpcomingEvents___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)objc_opt_class();
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v14 = v3;
    v15 = 2114;
    v16 = v4;
    v5 = v3;
    _os_log_impl(&dword_21610C000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] eventProviderHasUpcomingEvents: %{public}@", buf, 0x16u);

  }
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __58__HDSPSleepEventScheduler_eventProviderHasUpcomingEvents___block_invoke_266;
  v10 = &unk_24D4E3680;
  v6 = *(void **)(a1 + 40);
  v11 = *(id *)(a1 + 32);
  v12 = v6;
  objc_msgSend(v11, "_withLock:", &v7);
  objc_msgSend(*(id *)(a1 + 32), "_enqueueSchedulePendingEventsTask", v7, v8, v9, v10, v11);

}

uint64_t __58__HDSPSleepEventScheduler_eventProviderHasUpcomingEvents___block_invoke_266(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)eventProviderCancelledEvents:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "defaultCallbackScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__HDSPSleepEventScheduler_eventProviderCancelledEvents___block_invoke;
  v8[3] = &unk_24D4E3680;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "performBlock:", v8);

}

void __56__HDSPSleepEventScheduler_eventProviderCancelledEvents___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)objc_opt_class();
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v11 = v3;
    v12 = 2114;
    v13 = v4;
    v5 = v3;
    _os_log_impl(&dword_21610C000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] eventProviderCancelledEvents: %{public}@", buf, 0x16u);

  }
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__HDSPSleepEventScheduler_eventProviderCancelledEvents___block_invoke_267;
  v7[3] = &unk_24D4E3680;
  v6 = *(void **)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  v9 = v6;
  objc_msgSend(v8, "_withLock:", v7);

}

uint64_t __56__HDSPSleepEventScheduler_eventProviderCancelledEvents___block_invoke_267(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeEventsForProvider:", *(_QWORD *)(a1 + 40));
}

- (void)addEventProvider:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "setSleepEventDelegate:", self);
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __44__HDSPSleepEventScheduler_addEventProvider___block_invoke;
      v7[3] = &unk_24D4E3680;
      v7[4] = self;
      v8 = v4;
      -[HDSPSleepEventScheduler _withLock:](self, "_withLock:", v7);

    }
    else
    {
      HKSPLogForCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v10 = (id)objc_opt_class();
        v11 = 2114;
        v12 = v4;
        v6 = v10;
        _os_log_error_impl(&dword_21610C000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] event provider %{public}@ didn't synthesize a delegate", buf, 0x16u);

      }
    }
  }

}

uint64_t __44__HDSPSleepEventScheduler_addEventProvider___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeEventProvider:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "setSleepEventDelegate:", 0);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __47__HDSPSleepEventScheduler_removeEventProvider___block_invoke;
    v5[3] = &unk_24D4E3680;
    v5[4] = self;
    v6 = v4;
    -[HDSPSleepEventScheduler _withLock:](self, "_withLock:", v5);

  }
}

uint64_t __47__HDSPSleepEventScheduler_removeEventProvider___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeEventsForProvider:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)addEventHandler:(id)a3
{
  if (a3)
    -[HKSPObserverSet addObserver:](self->_eventHandlers, "addObserver:");
}

- (void)removeEventHandler:(id)a3
{
  if (a3)
    -[HKSPObserverSet removeObserver:](self->_eventHandlers, "removeObserver:");
}

- (void)sleepScheduleModelManager:(id)a3 didUpdateSleepScheduleModel:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  HKSPLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543618;
    v9 = (id)objc_opt_class();
    v10 = 2114;
    v11 = v5;
    v7 = v9;
    _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] didUpdateSleepScheduleModel: %{public}@", (uint8_t *)&v8, 0x16u);

  }
  -[HDSPSleepEventScheduler rescheduleEvents](self, "rescheduleEvents");

}

- (void)significantTimeChangeDetected:(id)a3
{
  NSObject *v4;
  id v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint8_t v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v14 = 138543362;
    *(_QWORD *)&v14[4] = objc_opt_class();
    v5 = *(id *)&v14[4];
    _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] significantTimeChangeDetected", v14, 0xCu);

  }
  -[HDSPSleepEventScheduler environment](self, "environment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentDateProvider");
  v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v7[2](v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDSPSleepEventScheduler lastEventTriggerDate](self, "lastEventTriggerDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v10, "hksp_isAfterDate:", v9);

  if ((_DWORD)v7)
  {
    HKSPLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_opt_class();
      *(_DWORD *)v14 = 138543362;
      *(_QWORD *)&v14[4] = v12;
      v13 = v12;
      _os_log_impl(&dword_21610C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] setting lastEventTriggerDate to current date because it's in the future", v14, 0xCu);

    }
    -[HDSPSleepEventScheduler setLastEventTriggerDate:](self, "setLastEventTriggerDate:", v9);
  }
  -[HDSPSleepEventScheduler rescheduleEvents](self, "rescheduleEvents", *(_OWORD *)v14);

}

- (id)_allSleepEvents
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__14;
  v9 = __Block_byref_object_dispose__14;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __42__HDSPSleepEventScheduler__allSleepEvents__block_invoke;
  v4[3] = &unk_24D4E3CE8;
  v4[4] = self;
  v4[5] = &v5;
  -[HDSPSleepEventScheduler _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __42__HDSPSleepEventScheduler__allSleepEvents__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "sleepEvents");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allEvents");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)diagnosticDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HDSPSleepEventScheduler _allSleepEvents](self, "_allSleepEvents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPSleepEventScheduler lastStandardSleepEvent](self, "lastStandardSleepEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Scheduled Events: %@, Last Standard Sleep Event: %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (HDSPEnvironment)environment
{
  return (HDSPEnvironment *)objc_loadWeakRetained((id *)&self->_environment);
}

- (void)setLastStandardSleepEvent:(id)a3
{
  objc_storeStrong((id *)&self->_lastStandardSleepEvent, a3);
}

- (HKSPMutexProvider)mutexProvider
{
  return self->_mutexProvider;
}

- (HDSPSleepEventList)sleepEvents
{
  return self->_sleepEvents;
}

- (HKSPObserverSet)eventHandlers
{
  return self->_eventHandlers;
}

- (NSHashTable)eventProviders
{
  return self->_eventProviders;
}

- (NSHashTable)pendingEventProviders
{
  return self->_pendingEventProviders;
}

- (HDSPEventScheduler)scheduler
{
  return self->_scheduler;
}

- (HKSPLimitingScheduler)limitingScheduler
{
  return self->_limitingScheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_limitingScheduler, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_pendingEventProviders, 0);
  objc_storeStrong((id *)&self->_eventProviders, 0);
  objc_storeStrong((id *)&self->_eventHandlers, 0);
  objc_storeStrong((id *)&self->_sleepEvents, 0);
  objc_storeStrong((id *)&self->_mutexProvider, 0);
  objc_storeStrong((id *)&self->_lastStandardSleepEvent, 0);
  objc_destroyWeak((id *)&self->_environment);
}

@end
