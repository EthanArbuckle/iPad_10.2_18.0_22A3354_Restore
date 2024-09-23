@implementation HDSPSleepActionManager

- (HDSPSleepActionManager)initWithEnvironment:(id)a3
{
  id v4;
  HDSPSleepActionManager *v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  HKSPObserverSet *observers;
  HDSPSleepActionManager *v13;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  HDSPSleepActionManager *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HDSPSleepActionManager;
  v5 = -[HDSPSleepActionManager init](&v15, sel_init);
  if (v5)
  {
    HKSPLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v17 = v7;
      v18 = 2048;
      v19 = v5;
      v8 = v7;
      _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] initializing...", buf, 0x16u);

    }
    objc_storeWeak((id *)&v5->_environment, v4);
    v9 = objc_alloc(MEMORY[0x24BEA98C8]);
    objc_msgSend(v4, "defaultCallbackScheduler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "initWithCallbackScheduler:", v10);
    observers = v5->_observers;
    v5->_observers = (HKSPObserverSet *)v11;

    v13 = v5;
  }

  return v5;
}

- (NSString)sourceIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)addObserver:(id)a3
{
  -[HKSPObserverSet addObserver:](self->_observers, "addObserver:", a3);
}

- (void)removeObserver:(id)a3
{
  -[HKSPObserverSet removeObserver:](self->_observers, "removeObserver:", a3);
}

- (void)confirmWakeUp:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void (**v13)(void);
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  _WORD v21[17];

  v3 = a3;
  *(_QWORD *)&v21[13] = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_opt_class();
    v7 = v6;
    -[HDSPSleepActionManager environment](self, "environment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543874;
    v19 = v6;
    v20 = 1024;
    *(_DWORD *)v21 = v3;
    v21[2] = 2114;
    *(_QWORD *)&v21[3] = v9;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] wake up early confirmed (wasExplicitConfirmation: %d, %{public}@)", (uint8_t *)&v18, 0x1Cu);

  }
  -[HDSPSleepActionManager environment](self, "environment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sleepCoordinator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentSleepScheduleState");

  if ((HKSPSleepScheduleStateIsForBedtime() & 1) != 0 || (HKSPSleepScheduleStateIsForWindDown() & 1) != 0)
  {
    -[HDSPSleepActionManager environment](self, "environment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currentDateProvider");
    v13 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v13[2]();
    v14 = objc_claimAutoreleasedReturnValue();

    -[HDSPSleepActionManager confirmWakeUp:date:](self, "confirmWakeUp:date:", v3, v14);
  }
  else
  {
    HKSPLogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_opt_class();
      v16 = v15;
      NSStringFromHKSPSleepScheduleState();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v15;
      v20 = 2114;
      *(_QWORD *)v21 = v17;
      _os_log_impl(&dword_21610C000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ignoring request to confirm wake up due to state %{public}@", (uint8_t *)&v18, 0x16u);

    }
  }

}

- (void)confirmWakeUp:(BOOL)a3 date:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v6 = a4;
  -[HDSPSleepActionManager environment](self, "environment");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sleepScheduleModelManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sleepScheduleModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "computeConfirmedWakeUpUntilDateForEarlyWakeUpDate:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDSPSleepActionManager confirmWakeUp:date:confirmUntilDate:](self, "confirmWakeUp:date:confirmUntilDate:", v4, v6, v9);
}

- (void)confirmWakeUp:(BOOL)a3 date:(id)a4 confirmUntilDate:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  HDSPSleepActionManager *v30;
  id v31;
  BOOL v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  _BOOL4 v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v6 = a3;
  v43 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  -[HDSPSleepActionManager environment](self, "environment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  HKSPLogForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_opt_class();
    v14 = v13;
    objc_msgSend(v11, "source");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v34 = v13;
    v35 = 2114;
    v36 = v8;
    v37 = 2114;
    v38 = v9;
    v39 = 1024;
    v40 = v6;
    v41 = 2114;
    v42 = v15;
    _os_log_impl(&dword_21610C000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] wake up notification confirmed at %{public}@, until %{public}@, (wasExplicitConfirmation: %d, %{public}@)", buf, 0x30u);

  }
  -[HDSPSleepActionManager environment](self, "environment");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sleepScheduleModelManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sleepEventRecord");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "mutableCopy");

  objc_msgSend(v19, "setWakeUpEarlyNotificationConfirmedDate:", v8);
  objc_msgSend(v19, "setWakeUpConfirmedUntilDate:", v9);
  -[HDSPSleepActionManager environment](self, "environment");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __62__HDSPSleepActionManager_confirmWakeUp_date_confirmUntilDate___block_invoke;
  v27[3] = &unk_24D4E5AA8;
  v28 = v17;
  v29 = v19;
  v32 = v6;
  v30 = self;
  v31 = v11;
  v21 = v11;
  v22 = v19;
  v23 = v17;
  objc_msgSend(v21, "source");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPSleepActionManager sourceIdentifier](self, "sourceIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  HDSPSourceByReplacingIdentifier(v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "perform:withSource:", v27, v26);

}

void __62__HDSPSleepActionManager_confirmWakeUp_date_confirmUntilDate___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  char v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v8[0] = MEMORY[0x24BDAC760];
  v8[2] = __62__HDSPSleepActionManager_confirmWakeUp_date_confirmUntilDate___block_invoke_2;
  v8[3] = &unk_24D4E5A80;
  v1 = *(void **)(a1 + 56);
  v8[4] = *(_QWORD *)(a1 + 48);
  v10 = *(_BYTE *)(a1 + 64);
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v11 = 0;
  v8[1] = 3221225472;
  v9 = v1;
  LOBYTE(v3) = objc_msgSend(v2, "saveSleepEventRecord:error:preNotifyBlock:", v3, &v11, v8);
  v4 = v11;
  if ((v3 & 1) == 0)
  {
    HKSPLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v13 = v6;
      v14 = 2114;
      v15 = v4;
      v7 = v6;
      _os_log_error_impl(&dword_21610C000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] failed to save event record with error %{public}@", buf, 0x16u);

    }
  }

}

id __62__HDSPSleepActionManager_confirmWakeUp_date_confirmUntilDate___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];
  id v7;
  char v8;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 16);
  v6[0] = MEMORY[0x24BDAC760];
  v6[2] = __62__HDSPSleepActionManager_confirmWakeUp_date_confirmUntilDate___block_invoke_3;
  v6[3] = &unk_24D4E5A58;
  v6[1] = 3221225472;
  v6[4] = v1;
  v8 = *(_BYTE *)(a1 + 48);
  v7 = v2;
  objc_msgSend(v3, "enumerateObserversWithFutureBlock:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __62__HDSPSleepActionManager_confirmWakeUp_date_confirmUntilDate___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  id v11;
  char v12;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "environment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x24BDAC760];
    v8 = 3221225472;
    v9 = __62__HDSPSleepActionManager_confirmWakeUp_date_confirmUntilDate___block_invoke_4;
    v10 = &unk_24D4E5830;
    v11 = v3;
    v12 = *(_BYTE *)(a1 + 48);
    objc_msgSend(v4, "perform:withContext:", &v7, *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult", v7, v8, v9, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __62__HDSPSleepActionManager_confirmWakeUp_date_confirmUntilDate___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "wakeUpWasConfirmed:", *(unsigned __int8 *)(a1 + 40));
}

- (void)dismissGoodMorning
{
  void *v3;
  void (**v4)(void);
  id v5;

  -[HDSPSleepActionManager environment](self, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentDateProvider");
  v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v4[2]();
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[HDSPSleepActionManager dismissGoodMorningOnDate:](self, "dismissGoodMorningOnDate:", v5);
}

- (void)dismissGoodMorningOnDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  HDSPSleepActionManager *v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HDSPSleepActionManager environment](self, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  HKSPLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_opt_class();
    v9 = v8;
    objc_msgSend(v6, "source");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = v8;
    v33 = 2114;
    v34 = v10;
    _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Dismissing good morning (%{public}@)", buf, 0x16u);

  }
  -[HDSPSleepActionManager environment](self, "environment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sleepScheduleModelManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "sleepEventRecord");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  objc_msgSend(v14, "setGoodMorningDismissedDate:", v4);
  HKSPLogForCategory();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (void *)objc_opt_class();
    v17 = v16;
    objc_msgSend(v14, "goodMorningDismissedDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = v16;
    v33 = 2114;
    v34 = v18;
    _os_log_impl(&dword_21610C000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Good morning was dismissed %{public}@", buf, 0x16u);

  }
  -[HDSPSleepActionManager environment](self, "environment");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = MEMORY[0x24BDAC760];
  v27 = v12;
  v28 = v14;
  v29 = self;
  v30 = v6;
  v20 = v6;
  v21 = v14;
  v22 = v12;
  objc_msgSend(v20, "source", v26, 3221225472, __51__HDSPSleepActionManager_dismissGoodMorningOnDate___block_invoke, &unk_24D4E5B20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPSleepActionManager sourceIdentifier](self, "sourceIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  HDSPSourceByReplacingIdentifier(v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "perform:withSource:", &v26, v25);

}

void __51__HDSPSleepActionManager_dismissGoodMorningOnDate___block_invoke(_QWORD *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v8[0] = MEMORY[0x24BDAC760];
  v8[2] = __51__HDSPSleepActionManager_dismissGoodMorningOnDate___block_invoke_2;
  v8[3] = &unk_24D4E5AF8;
  v1 = (void *)a1[7];
  v8[4] = a1[6];
  v2 = (void *)a1[4];
  v3 = a1[5];
  v10 = 0;
  v8[1] = 3221225472;
  v9 = v1;
  LOBYTE(v3) = objc_msgSend(v2, "saveSleepEventRecord:error:preNotifyBlock:", v3, &v10, v8);
  v4 = v10;
  if ((v3 & 1) == 0)
  {
    HKSPLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v12 = v6;
      v13 = 2114;
      v14 = v4;
      v7 = v6;
      _os_log_error_impl(&dword_21610C000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] failed to save event record with error %{public}@", buf, 0x16u);

    }
  }

}

id __51__HDSPSleepActionManager_dismissGoodMorningOnDate___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];
  id v7;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 16);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__HDSPSleepActionManager_dismissGoodMorningOnDate___block_invoke_3;
  v6[3] = &unk_24D4E5AD0;
  v6[4] = v1;
  v7 = v2;
  objc_msgSend(v3, "enumerateObserversWithFutureBlock:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __51__HDSPSleepActionManager_dismissGoodMorningOnDate___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "environment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __51__HDSPSleepActionManager_dismissGoodMorningOnDate___block_invoke_4;
    v7[3] = &unk_24D4E3498;
    v8 = v3;
    objc_msgSend(v4, "perform:withContext:", v7, *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __51__HDSPSleepActionManager_dismissGoodMorningOnDate___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "goodMorningWasDismissed");
}

- (void)dismissSleepLock
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  HKSPObserverSet *observers;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[HDSPSleepActionManager environment](self, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_opt_class();
    v7 = v6;
    objc_msgSend(v4, "source");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v14 = v6;
    v15 = 2114;
    v16 = v8;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Dismissed sleep lock (%{public}@)", buf, 0x16u);

  }
  observers = self->_observers;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __42__HDSPSleepActionManager_dismissSleepLock__block_invoke;
  v11[3] = &unk_24D4E5B48;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  -[HKSPObserverSet enumerateObserversWithBlock:](observers, "enumerateObserversWithBlock:", v11);

}

void __42__HDSPSleepActionManager_dismissSleepLock__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "environment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __42__HDSPSleepActionManager_dismissSleepLock__block_invoke_2;
    v5[3] = &unk_24D4E3498;
    v6 = v3;
    objc_msgSend(v4, "perform:withContext:", v5, *(_QWORD *)(a1 + 40));

  }
}

uint64_t __42__HDSPSleepActionManager_dismissSleepLock__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sleepLockWasDismissed");
}

- (void)sleepAlarmDismissedOnDate:(id)a3 source:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void (**v14)(void);
  NSObject *v15;
  double v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  _QWORD v42[4];
  NSObject *v43;
  id v44;
  HDSPSleepActionManager *v45;
  id v46;
  unint64_t v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[HDSPSleepActionManager environment](self, "environment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  HKSPLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_opt_class();
    v11 = v10;
    objc_msgSend(v8, "source");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v49 = v10;
    v50 = 2114;
    v51 = v6;
    v52 = 2114;
    v53 = v12;
    _os_log_impl(&dword_21610C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep alarm did dismiss: %{public}@ (%{public}@)", buf, 0x20u);

  }
  if (v6)
  {
    -[HDSPSleepActionManager environment](self, "environment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "currentDateProvider");
    v14 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v14[2]();
    v15 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "timeIntervalSinceDate:", v15);
    if (fabs(v16) > 86400.0)
    {
      HKSPLogForCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v49 = v18;
        v50 = 2114;
        v51 = v6;
        v19 = v18;
        _os_log_error_impl(&dword_21610C000, v17, OS_LOG_TYPE_ERROR, "[%{public}@] ignoring sleepAlarm with old dismiss date: %{public}@", buf, 0x16u);

      }
      goto LABEL_19;
    }
    -[HDSPSleepActionManager environment](self, "environment");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "sleepScheduleModelManager");
    v17 = objc_claimAutoreleasedReturnValue();

    -[HDSPSleepActionManager environment](self, "environment");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "sleepCoordinator");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "currentSleepScheduleState");

    if (v25 != 6)
    {
      -[NSObject sleepScheduleModel](v17, "sleepScheduleModel");
      v26 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "closestEventWithIdentifier:dueAroundDate:", *MEMORY[0x24BEA95C8], v15);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v27, "hksp_isWithinInterval:ofDate:", v6, 60.0) & 1) == 0)
      {
        HKSPLogForCategory();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          v38 = (void *)objc_opt_class();
          v39 = v38;
          NSStringFromHKSPSleepScheduleState();
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v49 = v38;
          v50 = 2114;
          v51 = v40;
          _os_log_impl(&dword_21610C000, v37, OS_LOG_TYPE_DEFAULT, "[%{public}@] ignoring sleepAlarm dismissed outside of allowed window during %{public}@", buf, 0x16u);

        }
        goto LABEL_18;
      }

    }
    -[NSObject sleepEventRecord](v17, "sleepEventRecord");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v28, "mutableCopy");

    objc_msgSend(v29, "setWakeUpAlarmDismissedDate:", v6);
    HKSPLogForCategory();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = (void *)objc_opt_class();
      v41 = v31;
      objc_msgSend(v29, "wakeUpAlarmDismissedDate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v49 = v31;
      v50 = 2114;
      v51 = v32;
      _os_log_impl(&dword_21610C000, v30, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep alarm dismissed at %{public}@", buf, 0x16u);

    }
    -[HDSPSleepActionManager environment](self, "environment");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = MEMORY[0x24BDAC760];
    v42[1] = 3221225472;
    v42[2] = __59__HDSPSleepActionManager_sleepAlarmDismissedOnDate_source___block_invoke;
    v42[3] = &unk_24D4E5BC0;
    v43 = v17;
    v44 = v29;
    v45 = self;
    v47 = a4;
    v46 = v8;
    v26 = v29;
    objc_msgSend(v46, "source");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDSPSleepActionManager sourceIdentifier](self, "sourceIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    HDSPSourceByReplacingIdentifier(v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "perform:withSource:", v42, v36);

    v27 = v43;
LABEL_18:

LABEL_19:
    goto LABEL_20;
  }
  HKSPLogForCategory();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
  {
    v20 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v49 = v20;
    v21 = v20;
    _os_log_fault_impl(&dword_21610C000, v15, OS_LOG_TYPE_FAULT, "[%{public}@] sleepAlarm has nil dismiss date", buf, 0xCu);

  }
LABEL_20:

}

void __59__HDSPSleepActionManager_sleepAlarmDismissedOnDate_source___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v9[0] = MEMORY[0x24BDAC760];
  v9[2] = __59__HDSPSleepActionManager_sleepAlarmDismissedOnDate_source___block_invoke_2;
  v9[3] = &unk_24D4E5B98;
  v2 = (void *)a1[7];
  v1 = a1[8];
  v3 = a1[5];
  v9[4] = a1[6];
  v11 = v1;
  v12 = 0;
  v4 = (void *)a1[4];
  v9[1] = 3221225472;
  v10 = v2;
  LOBYTE(v3) = objc_msgSend(v4, "saveSleepEventRecord:error:preNotifyBlock:", v3, &v12, v9);
  v5 = v12;
  if ((v3 & 1) == 0)
  {
    HKSPLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v14 = v7;
      v15 = 2114;
      v16 = v5;
      v8 = v7;
      _os_log_error_impl(&dword_21610C000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] failed to save event record with error %{public}@", buf, 0x16u);

    }
  }

}

id __59__HDSPSleepActionManager_sleepAlarmDismissedOnDate_source___block_invoke_2(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[5];
  id v8;
  uint64_t v9;

  v1 = a1[4];
  v2 = (void *)a1[5];
  v3 = *(void **)(v1 + 16);
  v7[0] = MEMORY[0x24BDAC760];
  v7[2] = __59__HDSPSleepActionManager_sleepAlarmDismissedOnDate_source___block_invoke_3;
  v7[3] = &unk_24D4E5B70;
  v7[1] = 3221225472;
  v4 = a1[6];
  v7[4] = v1;
  v9 = v4;
  v8 = v2;
  objc_msgSend(v3, "enumerateObserversWithFutureBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __59__HDSPSleepActionManager_sleepAlarmDismissedOnDate_source___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  id v14;
  uint64_t v15;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "environment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = __59__HDSPSleepActionManager_sleepAlarmDismissedOnDate_source___block_invoke_4;
    v13 = &unk_24D4E3DB0;
    v5 = v3;
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v14 = v5;
    v15 = v7;
    objc_msgSend(v4, "perform:withContext:", &v10, v6);

  }
  objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult", v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __59__HDSPSleepActionManager_sleepAlarmDismissedOnDate_source___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "wakeUpAlarmWasDismissedFromSource:", *(_QWORD *)(a1 + 40));
}

- (void)sleepAlarmSnoozedUntilDate:(id)a3 source:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  HDSPSleepActionManager *v31;
  id v32;
  unint64_t v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[HDSPSleepActionManager environment](self, "environment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  HKSPLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_opt_class();
    v11 = v10;
    objc_msgSend(v8, "source");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v35 = v10;
    v36 = 2114;
    v37 = v6;
    v38 = 2114;
    v39 = v12;
    _os_log_impl(&dword_21610C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep alarm did snooze: %{public}@ (%{public}@)", buf, 0x20u);

  }
  -[HDSPSleepActionManager environment](self, "environment");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sleepScheduleModelManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "sleepEventRecord");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  objc_msgSend(v16, "setWakeUpAlarmSnoozedUntilDate:", v6);
  HKSPLogForCategory();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (void *)objc_opt_class();
    v19 = v18;
    objc_msgSend(v16, "wakeUpAlarmSnoozedUntilDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v18;
    v36 = 2114;
    v37 = v20;
    _os_log_impl(&dword_21610C000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep alarm snoozed until %{public}@", buf, 0x16u);

  }
  -[HDSPSleepActionManager environment](self, "environment");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __60__HDSPSleepActionManager_sleepAlarmSnoozedUntilDate_source___block_invoke;
  v28[3] = &unk_24D4E5BC0;
  v29 = v14;
  v30 = v16;
  v32 = v8;
  v33 = a4;
  v31 = self;
  v22 = v8;
  v23 = v16;
  v24 = v14;
  objc_msgSend(v22, "source");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPSleepActionManager sourceIdentifier](self, "sourceIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  HDSPSourceByReplacingIdentifier(v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "perform:withSource:", v28, v27);

}

void __60__HDSPSleepActionManager_sleepAlarmSnoozedUntilDate_source___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v9[0] = MEMORY[0x24BDAC760];
  v9[2] = __60__HDSPSleepActionManager_sleepAlarmSnoozedUntilDate_source___block_invoke_2;
  v9[3] = &unk_24D4E5B98;
  v2 = (void *)a1[7];
  v1 = a1[8];
  v3 = a1[5];
  v9[4] = a1[6];
  v11 = v1;
  v12 = 0;
  v4 = (void *)a1[4];
  v9[1] = 3221225472;
  v10 = v2;
  LOBYTE(v3) = objc_msgSend(v4, "saveSleepEventRecord:error:preNotifyBlock:", v3, &v12, v9);
  v5 = v12;
  if ((v3 & 1) == 0)
  {
    HKSPLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v14 = v7;
      v15 = 2114;
      v16 = v5;
      v8 = v7;
      _os_log_error_impl(&dword_21610C000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] failed to save event record with error %{public}@", buf, 0x16u);

    }
  }

}

id __60__HDSPSleepActionManager_sleepAlarmSnoozedUntilDate_source___block_invoke_2(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[5];
  id v8;
  uint64_t v9;

  v1 = a1[4];
  v2 = (void *)a1[5];
  v3 = *(void **)(v1 + 16);
  v7[0] = MEMORY[0x24BDAC760];
  v7[2] = __60__HDSPSleepActionManager_sleepAlarmSnoozedUntilDate_source___block_invoke_3;
  v7[3] = &unk_24D4E5B70;
  v7[1] = 3221225472;
  v4 = a1[6];
  v7[4] = v1;
  v9 = v4;
  v8 = v2;
  objc_msgSend(v3, "enumerateObserversWithFutureBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __60__HDSPSleepActionManager_sleepAlarmSnoozedUntilDate_source___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  id v14;
  uint64_t v15;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "environment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = __60__HDSPSleepActionManager_sleepAlarmSnoozedUntilDate_source___block_invoke_4;
    v13 = &unk_24D4E3DB0;
    v5 = v3;
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v14 = v5;
    v15 = v7;
    objc_msgSend(v4, "perform:withContext:", &v10, v6);

  }
  objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult", v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __60__HDSPSleepActionManager_sleepAlarmSnoozedUntilDate_source___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "wakeUpAlarmWasSnoozedFromSource:", *(_QWORD *)(a1 + 40));
}

+ (id)_latestDateInAlarms:(id)a3 dateBlock:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a3;
  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__19;
  v17 = __Block_byref_object_dispose__19;
  v18 = 0;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __56__HDSPSleepActionManager__latestDateInAlarms_dateBlock___block_invoke;
  v10[3] = &unk_24D4E5BE8;
  v7 = v6;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v5, "na_each:", v10);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __56__HDSPSleepActionManager__latestDateInAlarms_dateBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id obj;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = v2;
  if (!*(_QWORD *)(v4 + 40))
    goto LABEL_4;
  if (objc_msgSend(v2, "hksp_isAfterDate:"))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v3 = obj;
LABEL_4:
    objc_storeStrong((id *)(v4 + 40), v3);
  }

}

+ (BOOL)_isValidSnoozeDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;

  if (!a3)
    return 0;
  v3 = (void *)MEMORY[0x24BDBCE60];
  v4 = a3;
  objc_msgSend(v3, "distantPast");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "isEqualToDate:", v5);

  v6 = v3 ^ 1;
  return v6;
}

- (void)sleepAlarmWasModified
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  -[HDSPSleepActionManager environment](self, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sleepAlarmManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentSleepAlarms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__HDSPSleepActionManager_sleepAlarmWasModified__block_invoke;
  v7[3] = &unk_24D4E3630;
  v7[4] = self;
  v6 = (id)objc_msgSend(v5, "addCompletionBlock:", v7);

}

void __47__HDSPSleepActionManager_sleepAlarmWasModified__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  uint64_t v36;
  _QWORD v37[4];
  id v38;
  id v39;
  uint64_t v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPNilify();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    HKSPLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v42 = (id)objc_opt_class();
      v43 = 2114;
      v44 = v4;
      v8 = v42;
      v9 = "[%{public}@] fetch alarms failed with error: %{public}@";
      v10 = v7;
      v11 = 22;
LABEL_4:
      _os_log_error_impl(&dword_21610C000, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);

    }
  }
  else
  {
    if (!objc_msgSend(v5, "count"))
    {
      HKSPLogForCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        goto LABEL_19;
      *(_DWORD *)buf = 138543362;
      v42 = (id)objc_opt_class();
      v8 = v42;
      v9 = "[%{public}@] no sleep alarms found";
      v10 = v7;
      v11 = 12;
      goto LABEL_4;
    }
    objc_msgSend(*(id *)(a1 + 32), "environment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currentContext");
    v7 = objc_claimAutoreleasedReturnValue();

    HKSPLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)objc_opt_class();
      v15 = v14;
      -[NSObject source](v7, "source");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = v14;
      v43 = 2114;
      v44 = v16;
      _os_log_impl(&dword_21610C000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep alarms modified (%{public}@)", buf, 0x16u);

    }
    objc_msgSend((id)objc_opt_class(), "_latestDateInAlarms:dateBlock:", v6, &__block_literal_global_23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    HKSPLogForCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v42 = v19;
      v43 = 2114;
      v44 = v17;
      v20 = v19;
      _os_log_impl(&dword_21610C000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] latest sleep alarm modified date: %{public}@", buf, 0x16u);

    }
    objc_msgSend((id)objc_opt_class(), "_latestDateInAlarms:dateBlock:", v6, &__block_literal_global_203_0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    HKSPLogForCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v42 = v23;
      v43 = 2114;
      v44 = v21;
      v24 = v23;
      _os_log_impl(&dword_21610C000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] latest sleep alarm snooze date: %{public}@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "environment");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "sleepScheduleModelManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "sleepEventRecord");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v27, "mutableCopy");

    if ((objc_msgSend((id)objc_opt_class(), "_isValidSnoozeDate:", v21) & 1) == 0)
    {
      v29 = (void *)objc_opt_class();
      objc_msgSend(v28, "wakeUpAlarmSnoozedUntilDate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v29) = objc_msgSend(v29, "_isValidSnoozeDate:", v30);

      if ((_DWORD)v29)
      {
        HKSPLogForCategory();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v32 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543362;
          v42 = v32;
          v33 = v32;
          _os_log_impl(&dword_21610C000, v31, OS_LOG_TYPE_DEFAULT, "[%{public}@] snooze date was reset", buf, 0xCu);

        }
        objc_msgSend(v28, "setWakeUpAlarmSnoozedUntilDate:", 0);
        objc_msgSend(*(id *)(a1 + 32), "environment");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v37[0] = MEMORY[0x24BDAC760];
        v37[1] = 3221225472;
        v37[2] = __47__HDSPSleepActionManager_sleepAlarmWasModified__block_invoke_204;
        v37[3] = &unk_24D4E4918;
        v38 = v26;
        v35 = v28;
        v36 = *(_QWORD *)(a1 + 32);
        v39 = v35;
        v40 = v36;
        objc_msgSend(v34, "perform:withSource:", v37);

      }
    }

  }
LABEL_19:

}

uint64_t __47__HDSPSleepActionManager_sleepAlarmWasModified__block_invoke_200(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "lastModifiedDate");
}

uint64_t __47__HDSPSleepActionManager_sleepAlarmWasModified__block_invoke_202(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "snoozeFireDate");
}

void __47__HDSPSleepActionManager_sleepAlarmWasModified__block_invoke_204(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v9 = 0;
  v4 = objc_msgSend(v2, "saveSleepEventRecord:error:", v3, &v9);
  v5 = v9;
  if ((v4 & 1) == 0)
  {
    HKSPLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v11 = v7;
      v12 = 2114;
      v13 = v5;
      v8 = v7;
      _os_log_error_impl(&dword_21610C000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] failed to save event record with error %{public}@", buf, 0x16u);

    }
  }

}

- (HDSPEnvironment)environment
{
  return (HDSPEnvironment *)objc_loadWeakRetained((id *)&self->_environment);
}

- (HKSPObserverSet)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_environment);
}

@end
