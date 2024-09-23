@implementation HDSPTimeInBedTracker

- (HDSPTimeInBedTracker)initWithEnvironment:(id)a3
{
  id v4;
  HDSPTimeInBedTracker *v5;
  HDSPTimeInBedTracker *v6;
  void *v7;
  uint64_t v8;
  NAScheduler *sleepIntervalScheduler;
  uint64_t v10;
  HDSPInBedDetector *inBedDetector;
  HDSPTimeInBedTracker *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HDSPTimeInBedTracker;
  v5 = -[HDSPTimeInBedTracker init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_environment, v4);
    HKSPDispatchQueueName();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    HKSPSerialQueueBackedScheduler();
    v8 = objc_claimAutoreleasedReturnValue();
    sleepIntervalScheduler = v6->_sleepIntervalScheduler;
    v6->_sleepIntervalScheduler = (NAScheduler *)v8;

    +[HDSPBiomeInBedDetector inBedDetector](HDSPBiomeInBedDetector, "inBedDetector");
    v10 = objc_claimAutoreleasedReturnValue();
    inBedDetector = v6->_inBedDetector;
    v6->_inBedDetector = (HDSPInBedDetector *)v10;

    v12 = v6;
  }

  return v6;
}

- (void)environmentWillBecomeReady:(id)a3
{
  id v4;

  objc_msgSend(a3, "sleepCoordinator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:", self);

}

- (BOOL)isTimeInBedTrackingEnabled
{
  id WeakRetained;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  BOOL v12;
  id v13;
  NSObject *v14;
  id v15;
  const char *v16;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "behavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "features");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "timeInBedTracking");

  if ((v6 & 1) == 0)
  {
    HKSPLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138543362;
      v19 = (id)objc_opt_class();
      v13 = v19;
      _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] time in bed tracking feature disabled", (uint8_t *)&v18, 0xCu);

    }
    goto LABEL_13;
  }
  -[HDSPTimeInBedTracker sleepScheduleModel](self, "sleepScheduleModel");
  v7 = objc_claimAutoreleasedReturnValue();
  -[NSObject sleepSchedule](v7, "sleepSchedule");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEnabledAndHasOccurrences");

  if ((v9 & 1) == 0)
  {
    HKSPLogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138543362;
      v19 = (id)objc_opt_class();
      v15 = v19;
      v16 = "[%{public}@] sleep schedule disabled";
LABEL_11:
      _os_log_impl(&dword_21610C000, v14, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v18, 0xCu);

    }
LABEL_12:

LABEL_13:
    v12 = 0;
    goto LABEL_14;
  }
  -[NSObject sleepSettings](v7, "sleepSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "timeInBedTracking");

  if ((v11 & 1) == 0)
  {
    HKSPLogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138543362;
      v19 = (id)objc_opt_class();
      v15 = v19;
      v16 = "[%{public}@] time in bed tracking disabled";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  v12 = 1;
LABEL_14:

  return v12;
}

- (HKSPSleepScheduleModel)sleepScheduleModel
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "sleepScheduleModelManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sleepScheduleModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKSPSleepScheduleModel *)v4;
}

- (void)sleepScheduleStateDidChange:(unint64_t)a3 previousState:(unint64_t)a4 reason:(unint64_t)a5
{
  _BOOL4 v7;
  NSObject *v8;
  HDSPTimeInBedTracker *v9;
  HDSPTimeInBedTracker *v10;
  void *v11;
  NSObject *v12;
  int v13;
  HDSPTimeInBedTracker *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7 = -[HDSPTimeInBedTracker isTimeInBedTrackingEnabled](self, "isTimeInBedTrackingEnabled");
  if (a3 == 1 && v7)
  {
    HKSPLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (HDSPTimeInBedTracker *)objc_opt_class();
      v10 = v9;
      NSStringFromHKSPSleepScheduleStateChangeReason();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v9;
      v15 = 2114;
      v16 = v11;
      _os_log_impl(&dword_21610C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] state changed to wake up (%{public}@)", (uint8_t *)&v13, 0x16u);

    }
    if (HKSPSleepScheduleStateIsForBedtime()
      && HKSPSleepScheduleStateChangeReasonIsExpected())
    {
      HKSPLogForCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138543362;
        v14 = self;
        _os_log_impl(&dword_21610C000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] ending time in bed tracking", (uint8_t *)&v13, 0xCu);
      }

      -[HDSPTimeInBedTracker _endSleepSessionWithReason:](self, "_endSleepSessionWithReason:", 0);
    }
  }
}

- (void)_endSleepSessionWithReason:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  id WeakRetained;
  void (**v10)(void);
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_opt_class();
    v7 = v6;
    HDSPSleepSessionEndReasonDescription(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v6;
    v16 = 2114;
    v17 = v8;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] ending sleep session with reason %{public}@", (uint8_t *)&v14, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "currentDateProvider");
  v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v10[2]();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDSPTimeInBedTracker _createSleepSessionWithEndDate:endReason:](self, "_createSleepSessionWithEndDate:endReason:", v11, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPTimeInBedTracker delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sleepTracker:didEndSession:reason:", self, v12, a3);

}

- (id)_createSleepSessionWithEndDate:(id)a3 endReason:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[HDSPTimeInBedTracker _computeSleepSessionStartBeforeDate:](self, "_computeSleepSessionStartBeforeDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v7, v6);
    -[HDSPTimeInBedTracker _computeSessionMetadataForInterval:](self, "_computeSessionMetadataForInterval:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDSPSleepSession sleepSessionWithDateInterval:sleepIntervals:endReason:metadata:requiresFirstUnlock:](HDSPSleepSession, "sleepSessionWithDateInterval:sleepIntervals:endReason:metadata:requiresFirstUnlock:", v8, MEMORY[0x24BDBD1A8], a4, v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HKSPLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138543618;
      v15 = (id)objc_opt_class();
      v16 = 2114;
      v17 = v10;
      v12 = v15;
      _os_log_impl(&dword_21610C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] created %{public}@", (uint8_t *)&v14, 0x16u);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_computeSleepSessionStartBeforeDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HDSPTimeInBedTracker sleepScheduleModel](self, "sleepScheduleModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previousEventWithIdentifier:dueBeforeDate:", *MEMORY[0x24BEA95A0], v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v6;
  objc_msgSend(v5, "sleepSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "sleepTracking");

  if (v9)
  {
    objc_msgSend(v7, "dateByAddingTimeInterval:", -5400.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    HKSPLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543618;
      v16 = (id)objc_opt_class();
      v17 = 2114;
      v18 = v10;
      v12 = v16;
      _os_log_impl(&dword_21610C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] using 90 minutes before bedtime %{public}@ as session start", (uint8_t *)&v15, 0x16u);

    }
  }
  else
  {
    HKSPLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543618;
      v16 = (id)objc_opt_class();
      v17 = 2114;
      v18 = v7;
      v13 = v16;
      _os_log_impl(&dword_21610C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] using bedtime date %{public}@ as session start", (uint8_t *)&v15, 0x16u);

    }
    v10 = v7;
  }

  return v10;
}

- (id)computeSleepIntervalsForInterval:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  NAScheduler *sleepIntervalScheduler;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v15 = (id)objc_opt_class();
    v16 = 2114;
    v17 = v4;
    v6 = v15;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] computing in bed intervals inside %{public}@", buf, 0x16u);

  }
  v7 = (void *)MEMORY[0x24BE6B608];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __57__HDSPTimeInBedTracker_computeSleepIntervalsForInterval___block_invoke;
  v12[3] = &unk_24D4E35E0;
  v12[4] = self;
  v13 = v4;
  sleepIntervalScheduler = self->_sleepIntervalScheduler;
  v9 = v4;
  objc_msgSend(v7, "futureWithBlock:scheduler:", v12, sleepIntervalScheduler);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __57__HDSPTimeInBedTracker_computeSleepIntervalsForInterval___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "detectInBedTimesDuringInterval:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __57__HDSPTimeInBedTracker_computeSleepIntervalsForInterval___block_invoke_2;
  v12[3] = &unk_24D4E3590;
  v6 = *(void **)(a1 + 40);
  v12[4] = *(_QWORD *)(a1 + 32);
  v13 = v6;
  objc_msgSend(v4, "flatMap:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __57__HDSPTimeInBedTracker_computeSleepIntervalsForInterval___block_invoke_4;
  v10[3] = &unk_24D4E35B8;
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v8 = v3;
  v9 = (id)objc_msgSend(v7, "addCompletionBlock:", v10);

}

id __57__HDSPTimeInBedTracker_computeSleepIntervalsForInterval___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_logDetections:", v4);
  objc_msgSend(v4, "na_map:", &__block_literal_global);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_compareWithCoreDuetInBedDetectionForInterval:", *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x24BE6B608], "futureWithResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

HDSPSleepSessionInterval *__57__HDSPTimeInBedTracker_computeSleepIntervalsForInterval___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return +[HDSPSleepSessionInterval sleepSessionIntervalWithInterval:type:](HDSPSleepSessionInterval, "sleepSessionIntervalWithInterval:type:", a2, 1);
}

void __57__HDSPTimeInBedTracker_computeSleepIntervalsForInterval___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  _BYTE v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    HKSPLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v9 = 138543618;
      *(_QWORD *)&v9[4] = objc_opt_class();
      *(_WORD *)&v9[12] = 2114;
      *(_QWORD *)&v9[14] = v6;
      v8 = *(id *)&v9[4];
      _os_log_error_impl(&dword_21610C000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] failed to detect time-in-bed with error: %{public}@", v9, 0x16u);

    }
  }
  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:error:", v5, v6, *(_OWORD *)v9, *(_QWORD *)&v9[16], v10);

}

- (void)_logDetections:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_opt_class();
    v7 = v6;
    *(_DWORD *)buf = 138543618;
    v10 = v6;
    v11 = 2048;
    v12 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] found %lu in-bed intervals", buf, 0x16u);

  }
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __39__HDSPTimeInBedTracker__logDetections___block_invoke;
  v8[3] = &unk_24D4E3608;
  v8[4] = self;
  objc_msgSend(v4, "na_each:", v8);

}

void __39__HDSPTimeInBedTracker__logDetections___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_opt_class();
    v5 = v4;
    objc_msgSend(v2, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "endDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543874;
    v9 = v4;
    v10 = 2112;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] inBed [%@ - %@]", (uint8_t *)&v8, 0x20u);

  }
}

- (void)_compareWithCoreDuetInBedDetectionForInterval:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v6 = v12;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] comparing against _CDInBedDetector...", buf, 0xCu);

  }
  +[HDSPCDInBedDetector inBedDetector](HDSPCDInBedDetector, "inBedDetector");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "detectInBedTimesDuringInterval:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __70__HDSPTimeInBedTracker__compareWithCoreDuetInBedDetectionForInterval___block_invoke;
  v10[3] = &unk_24D4E3630;
  v10[4] = self;
  v9 = (id)objc_msgSend(v8, "addCompletionBlock:", v10);

}

void __70__HDSPTimeInBedTracker__compareWithCoreDuetInBedDetectionForInterval___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
  v5 = a3;
  if (v5)
  {
    HKSPLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138543618;
      v9 = (id)objc_opt_class();
      v10 = 2114;
      v11 = v5;
      v7 = v9;
      _os_log_error_impl(&dword_21610C000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] failed to detect time-in-bed with error: %{public}@", (uint8_t *)&v8, 0x16u);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_logDetections:", a2);
  }

}

- (id)_computeSessionMetadataForInterval:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v30[3];
  _QWORD v31[3];
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v33 = (id)objc_opt_class();
    v34 = 2114;
    v35 = v4;
    v6 = v33;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] _computeSessionMetadataForInterval: %{public}@", buf, 0x16u);

  }
  -[HDSPTimeInBedTracker sleepScheduleModel](self, "sleepScheduleModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "previousOccurrenceBeforeDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  HKSPLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v33 = v11;
    v34 = 2114;
    v35 = v9;
    v12 = v11;
    _os_log_impl(&dword_21610C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] previous occurrence: %{public}@", buf, 0x16u);

  }
  if (objc_msgSend(v9, "isSingleDayOverride"))
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "wakeUpComponents");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dateFromComponents:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bedtimeComponents");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dateFromComponents:", v17);
  }
  else
  {
    objc_msgSend(v4, "endDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "wakeUpComponents");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "hksp_dateNearestMatchingComponents:", v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "startDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bedtimeComponents");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "hksp_dateNearestMatchingComponents:", v17);
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  HKSPLogForCategory();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543874;
    v33 = v22;
    v34 = 2114;
    v35 = v15;
    v36 = 2114;
    v37 = v20;
    v23 = v22;
    _os_log_impl(&dword_21610C000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] user set wake time: %{public}@ user set bed time: %{public}@", buf, 0x20u);

  }
  v24 = (void *)MEMORY[0x24BDBD1B8];
  if (v20 && v15)
  {
    objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone", *MEMORY[0x24BDD3220]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "name");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = *MEMORY[0x24BDD4408];
    v31[0] = v26;
    v31[1] = v20;
    v28 = *MEMORY[0x24BDD4410];
    v30[1] = v27;
    v30[2] = v28;
    v31[2] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v24;
}

- (id)processedSessionForSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  HDSPTimeInBedTracker *v11;

  v4 = a3;
  if ((objc_msgSend(v4, "requiresFirstUnlock") & 1) != 0)
  {
    objc_msgSend(v4, "interval");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDSPTimeInBedTracker computeSleepIntervalsForInterval:](self, "computeSleepIntervalsForInterval:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __51__HDSPTimeInBedTracker_processedSessionForSession___block_invoke;
    v9[3] = &unk_24D4E3590;
    v10 = v4;
    v11 = self;
    objc_msgSend(v6, "flatMap:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE6B608], "futureWithResult:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

id __51__HDSPTimeInBedTracker_processedSessionForSession___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "interval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(*(id *)(a1 + 32), "endReason");
  objc_msgSend(*(id *)(a1 + 32), "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSPSleepSession sleepSessionWithDateInterval:sleepIntervals:endReason:metadata:requiresFirstUnlock:](HDSPSleepSession, "sleepSessionWithDateInterval:sleepIntervals:endReason:metadata:requiresFirstUnlock:", v5, v4, v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  HKSPLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138543618;
    v18 = (id)objc_opt_class();
    v19 = 2114;
    v20 = v8;
    v10 = v18;
    _os_log_impl(&dword_21610C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] finished processing session: %{public}@", (uint8_t *)&v17, 0x16u);

  }
  HKSPLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_opt_class();
    v13 = v12;
    objc_msgSend(v8, "sleepIntervals");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v12;
    v19 = 2112;
    v20 = v14;
    _os_log_impl(&dword_21610C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] processed session has intervals: %@", (uint8_t *)&v17, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BE6B608], "futureWithResult:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (HDSPEnvironment)environment
{
  return (HDSPEnvironment *)objc_loadWeakRetained((id *)&self->_environment);
}

- (HDSPSleepTrackerDelegate)delegate
{
  return (HDSPSleepTrackerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NAScheduler)sleepIntervalScheduler
{
  return self->_sleepIntervalScheduler;
}

- (HDSPInBedDetector)inBedDetector
{
  return self->_inBedDetector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inBedDetector, 0);
  objc_storeStrong((id *)&self->_sleepIntervalScheduler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_environment);
}

@end
