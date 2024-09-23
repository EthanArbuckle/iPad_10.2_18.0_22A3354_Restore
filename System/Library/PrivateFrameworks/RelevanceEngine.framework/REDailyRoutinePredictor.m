@implementation REDailyRoutinePredictor

- (id)_init
{
  id v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)REDailyRoutinePredictor;
  v2 = -[REObservableSingleton _init](&v11, sel__init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.RelevanceEngine.REDailyRoutinePredictor", v3);
    v5 = (void *)*((_QWORD *)v2 + 6);
    *((_QWORD *)v2 + 6) = v4;

    +[RESingleton sharedInstance](REPeriodOfDayPredictor, "sharedInstance");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v6;

    objc_msgSend(*((id *)v2 + 2), "addObserver:", v2);
    v8 = objc_opt_new();
    v9 = (void *)*((_QWORD *)v2 + 9);
    *((_QWORD *)v2 + 9) = v8;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[REObservableSingleton removeObserver:](self->_periodOfDayPredictor, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)REDailyRoutinePredictor;
  -[REDailyRoutinePredictor dealloc](&v3, sel_dealloc);
}

- (unint64_t)currentRoutineType
{
  NSNumber *overrideRoutineType;
  uint64_t currentRoutine;

  -[NSLock lock](self->_routineLock, "lock");
  overrideRoutineType = self->_overrideRoutineType;
  if (overrideRoutineType)
    currentRoutine = -[NSNumber unsignedIntegerValue](overrideRoutineType, "unsignedIntegerValue");
  else
    currentRoutine = self->_currentRoutine;
  -[NSLock unlock](self->_routineLock, "unlock");
  return currentRoutine;
}

- (NSDateInterval)currentRoutineInterval
{
  void *v3;

  -[NSLock lock](self->_routineLock, "lock");
  v3 = (void *)-[NSDateInterval copy](self->_currentRoutineInterval, "copy");
  -[NSLock unlock](self->_routineLock, "unlock");
  return (NSDateInterval *)v3;
}

- (id)routineIntervalForNextRoutine:(unint64_t)a3
{
  uint64_t v5;
  unint64_t v6;
  REPeriodOfDayPredictor *periodOfDayPredictor;
  void *v8;
  uint64_t v9;
  void *v10;

  if (a3)
    v5 = a3 == 2;
  else
    v5 = 2;
  v6 = -[REPeriodOfDayPredictor currentPeriodOfDay](self->_periodOfDayPredictor, "currentPeriodOfDay");
  periodOfDayPredictor = self->_periodOfDayPredictor;
  if (v6 == v5)
    -[REPeriodOfDayPredictor intervalForCurrentPeriodOfDay](periodOfDayPredictor, "intervalForCurrentPeriodOfDay");
  else
    -[REPeriodOfDayPredictor dateIntervalForNextPeriodOfDay:](periodOfDayPredictor, "dateIntervalForNextPeriodOfDay:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (a3 == 1)
    {
      -[REDailyRoutinePredictor _morningRoutineIntervalForMorning:](self, "_morningRoutineIntervalForMorning:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    if (a3 == 2)
    {
      -[REDailyRoutinePredictor _eveningRoutineIntervalForEvening:](self, "_eveningRoutineIntervalForEvening:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_13:
      v10 = (void *)v9;
      goto LABEL_14;
    }
  }
  v10 = 0;
LABEL_14:

  return v10;
}

- (id)routineIntervalForPreviousRoutine:(unint64_t)a3
{
  uint64_t v5;
  unint64_t v6;
  REPeriodOfDayPredictor *periodOfDayPredictor;
  void *v8;
  uint64_t v9;
  void *v10;

  if (a3)
    v5 = a3 == 2;
  else
    v5 = 2;
  v6 = -[REPeriodOfDayPredictor currentPeriodOfDay](self->_periodOfDayPredictor, "currentPeriodOfDay");
  periodOfDayPredictor = self->_periodOfDayPredictor;
  if (v6 == v5)
    -[REPeriodOfDayPredictor intervalForCurrentPeriodOfDay](periodOfDayPredictor, "intervalForCurrentPeriodOfDay");
  else
    -[REPeriodOfDayPredictor dateIntervalForPreviousPeriodOfDay:](periodOfDayPredictor, "dateIntervalForPreviousPeriodOfDay:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (a3 == 1)
    {
      -[REDailyRoutinePredictor _morningRoutineIntervalForMorning:](self, "_morningRoutineIntervalForMorning:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    if (a3 == 2)
    {
      -[REDailyRoutinePredictor _eveningRoutineIntervalForEvening:](self, "_eveningRoutineIntervalForEvening:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_13:
      v10 = (void *)v9;
      goto LABEL_14;
    }
  }
  v10 = 0;
LABEL_14:

  return v10;
}

- (id)_morningRoutineIntervalForMorning:(id)a3
{
  REPeriodOfDayPredictor *periodOfDayPredictor;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;

  periodOfDayPredictor = self->_periodOfDayPredictor;
  v4 = a3;
  objc_msgSend(v4, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REPeriodOfDayPredictor dateIntervalForPreviousPeriodOfDay:beforeDate:](periodOfDayPredictor, "dateIntervalForPreviousPeriodOfDay:beforeDate:", 2, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "duration");
  v8 = v7;
  v9 = v7 * 0.400000006;
  objc_msgSend(v4, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dateByAddingTimeInterval:", -(v8 * 0.400000006));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "duration");
  v13 = v12;

  v14 = 4320.0;
  if (v13 <= 4320.0)
    v14 = v13;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:duration:", v11, v9 + v14);

  return v15;
}

- (id)_eveningRoutineIntervalForEvening:(id)a3
{
  REPeriodOfDayPredictor *periodOfDayPredictor;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  periodOfDayPredictor = self->_periodOfDayPredictor;
  v4 = a3;
  objc_msgSend(v4, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REPeriodOfDayPredictor dateIntervalForNextPeriodOfDay:afterDate:](periodOfDayPredictor, "dateIntervalForNextPeriodOfDay:afterDate:", 2, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "duration");
  v8 = v7;
  objc_msgSend(v4, "duration");
  v10 = fmin(v9, 3600.0);
  objc_msgSend(v4, "endDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "dateByAddingTimeInterval:", -v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  RELogForDomain(8);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v12;
    _os_log_impl(&dword_2132F7000, v13, OS_LOG_TYPE_DEFAULT, "eveningStart is: %@", (uint8_t *)&v16, 0xCu);
  }

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:duration:", v12, v8 * 0.400000006 + v10);
  return v14;
}

- (void)periodOfDayPredictorDidUpdatePredictedIntervals:(id)a3
{
  NSObject *queue;
  uint64_t v5;
  id v6;
  NSObject *v7;
  _QWORD v8[5];
  _QWORD block[5];

  queue = self->_queue;
  v5 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__REDailyRoutinePredictor_periodOfDayPredictorDidUpdatePredictedIntervals___block_invoke;
  block[3] = &unk_24CF8AAF0;
  block[4] = self;
  v6 = a3;
  dispatch_async(queue, block);
  -[REDailyRoutinePredictor periodOfDayPredictorDidUpdateCurrentPeriodOfDay:](self, "periodOfDayPredictorDidUpdateCurrentPeriodOfDay:", v6);

  v7 = self->_queue;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __75__REDailyRoutinePredictor_periodOfDayPredictorDidUpdatePredictedIntervals___block_invoke_3;
  v8[3] = &unk_24CF8AAF0;
  v8[4] = self;
  dispatch_async(v7, v8);
}

uint64_t __75__REDailyRoutinePredictor_periodOfDayPredictorDidUpdatePredictedIntervals___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __75__REDailyRoutinePredictor_periodOfDayPredictorDidUpdatePredictedIntervals___block_invoke_2;
  v3[3] = &unk_24CF8C7D8;
  v3[4] = v1;
  return objc_msgSend(v1, "enumerateObservers:", v3);
}

void __75__REDailyRoutinePredictor_periodOfDayPredictorDidUpdatePredictedIntervals___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "dailyRoutinePredictorDidUpdatedPredictedRoutines:", *(_QWORD *)(a1 + 32));

}

uint64_t __75__REDailyRoutinePredictor_periodOfDayPredictorDidUpdatePredictedIntervals___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_setupMorningBeginTimerIfNeeded");
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setupEveningBeginTimerIfNeeded");
}

- (void)_updateCurrentRoutine
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t currentRoutine;
  NSObject *v7;
  NSDateInterval **p_currentRoutineInterval;
  NSDateInterval *v9;
  void *v10;
  NSDateInterval *v11;
  void *v12;
  NSDateInterval *v13;
  BOOL v14;
  NSDateInterval *v15;
  unint64_t v16;
  NSObject *v17;
  unint64_t v18;
  __CFString *v19;
  NSDateInterval *v20;
  unint64_t v21;
  NSObject *queue;
  unint64_t v23;
  NSDateInterval *currentRoutineInterval;
  void *v25;
  unint64_t v26;
  __CFString *v27;
  _QWORD block[7];
  uint8_t buf[4];
  __CFString *v30;
  __int16 v31;
  NSDateInterval *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[REPeriodOfDayPredictor currentPeriodOfDay](self->_periodOfDayPredictor, "currentPeriodOfDay");
  -[REPeriodOfDayPredictor intervalForCurrentPeriodOfDay](self->_periodOfDayPredictor, "intervalForCurrentPeriodOfDay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock lock](self->_routineLock, "lock");
  currentRoutine = self->_currentRoutine;
  RELogForDomain(8);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v23 = self->_currentRoutine;
    if (v23 > 2)
      v27 = 0;
    else
      v27 = off_24CF8C820[v23];
    currentRoutineInterval = self->_currentRoutineInterval;
    REStringForPeriodOfDay(v4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v30 = v27;
    v31 = 2112;
    v32 = currentRoutineInterval;
    v33 = 2112;
    v34 = v25;
    _os_log_debug_impl(&dword_2132F7000, v7, OS_LOG_TYPE_DEBUG, "Current routine (%@, %@) updating based on period of day: %@", buf, 0x20u);

  }
  self->_currentRoutine = 0;
  p_currentRoutineInterval = &self->_currentRoutineInterval;
  v9 = self->_currentRoutineInterval;
  self->_currentRoutineInterval = 0;

  if (v4)
  {
    if (v4 != 1)
    {
      if (v4 != 2)
        goto LABEL_16;
      v26 = 1;
      -[REPeriodOfDayPredictor dateIntervalForPreviousPeriodOfDay:](self->_periodOfDayPredictor, "dateIntervalForPreviousPeriodOfDay:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[REDailyRoutinePredictor _eveningRoutineIntervalForEvening:](self, "_eveningRoutineIntervalForEvening:", v10);
      v11 = (NSDateInterval *)objc_claimAutoreleasedReturnValue();

      -[REPeriodOfDayPredictor dateIntervalForNextPeriodOfDay:](self->_periodOfDayPredictor, "dateIntervalForNextPeriodOfDay:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[REDailyRoutinePredictor _morningRoutineIntervalForMorning:](self, "_morningRoutineIntervalForMorning:", v12);
      v13 = (NSDateInterval *)objc_claimAutoreleasedReturnValue();

      v14 = -[NSDateInterval containsDate:](v13, "containsDate:", v3);
      v15 = v13;
      if (!v14)
      {
        if (!-[NSDateInterval containsDate:](v11, "containsDate:", v3))
        {
LABEL_14:

          goto LABEL_15;
        }
        v26 = 2;
        v15 = v11;
      }
      self->_currentRoutine = v26;
      objc_storeStrong((id *)p_currentRoutineInterval, v15);
      goto LABEL_14;
    }
    -[REDailyRoutinePredictor _eveningRoutineIntervalForEvening:](self, "_eveningRoutineIntervalForEvening:", v5);
    v11 = (NSDateInterval *)objc_claimAutoreleasedReturnValue();
    if (-[NSDateInterval containsDate:](v11, "containsDate:", v3))
    {
      v16 = 2;
      goto LABEL_13;
    }
  }
  else
  {
    -[REDailyRoutinePredictor _morningRoutineIntervalForMorning:](self, "_morningRoutineIntervalForMorning:", v5);
    v11 = (NSDateInterval *)objc_claimAutoreleasedReturnValue();
    if (-[NSDateInterval containsDate:](v11, "containsDate:", v3))
    {
      v16 = 1;
LABEL_13:
      self->_currentRoutine = v16;
      v11 = v11;
      v13 = *p_currentRoutineInterval;
      *p_currentRoutineInterval = v11;
      goto LABEL_14;
    }
  }
LABEL_15:

LABEL_16:
  RELogForDomain(8);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = self->_currentRoutine;
    if (v18 > 2)
      v19 = 0;
    else
      v19 = off_24CF8C820[v18];
    v20 = *p_currentRoutineInterval;
    *(_DWORD *)buf = 138412546;
    v30 = v19;
    v31 = 2112;
    v32 = v20;
    _os_log_impl(&dword_2132F7000, v17, OS_LOG_TYPE_INFO, "Updated routine to %@, %@", buf, 0x16u);
  }

  v21 = self->_currentRoutine;
  -[NSLock unlock](self->_routineLock, "unlock");
  if (currentRoutine != v21)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__REDailyRoutinePredictor__updateCurrentRoutine__block_invoke;
    block[3] = &unk_24CF8C800;
    block[4] = self;
    block[5] = currentRoutine;
    block[6] = v21;
    dispatch_async(queue, block);
  }

}

uint64_t __48__REDailyRoutinePredictor__updateCurrentRoutine__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_queue_didEndEveningRoutine");
  }
  else if (v2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_queue_didEndMorningRoutine");
  }
  objc_msgSend(*(id *)(a1 + 32), "_queue_setupMorningBeginTimerIfNeeded");
  result = objc_msgSend(*(id *)(a1 + 32), "_queue_setupEveningBeginTimerIfNeeded");
  v4 = *(_QWORD *)(a1 + 48);
  if (v4 == 2)
    return objc_msgSend(*(id *)(a1 + 32), "_queue_didBeginEveningRoutine");
  if (v4 == 1)
    return objc_msgSend(*(id *)(a1 + 32), "_queue_didBeginMorningRoutine");
  return result;
}

- (void)_queue_didBeginMorningRoutine
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2_1(&dword_2132F7000, v0, v1, "Began morning routine", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __56__REDailyRoutinePredictor__queue_didBeginMorningRoutine__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "dailyRoutinePredictorDidBeginMorningRoutine:", *(_QWORD *)(a1 + 32));

}

void __56__REDailyRoutinePredictor__queue_didBeginMorningRoutine__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateCurrentRoutine");
    objc_msgSend(v2, "_queue_didEndMorningRoutine");
    WeakRetained = v2;
  }

}

- (void)_queue_didEndMorningRoutine
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2_1(&dword_2132F7000, v0, v1, "Finished morning routine", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __54__REDailyRoutinePredictor__queue_didEndMorningRoutine__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "dailyRoutinePredictorDidEndMorningRoutine:", *(_QWORD *)(a1 + 32));

}

- (void)_queue_didBeginEveningRoutine
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2_1(&dword_2132F7000, v0, v1, "Began evening routine", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __56__REDailyRoutinePredictor__queue_didBeginEveningRoutine__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "dailyRoutinePredictorDidBeginEveningRoutine:", *(_QWORD *)(a1 + 32));

}

void __56__REDailyRoutinePredictor__queue_didBeginEveningRoutine__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateCurrentRoutine");
    objc_msgSend(v2, "_queue_didEndEveningRoutine");
    WeakRetained = v2;
  }

}

- (void)_queue_didEndEveningRoutine
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2_1(&dword_2132F7000, v0, v1, "Finished evening routine", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __54__REDailyRoutinePredictor__queue_didEndEveningRoutine__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "dailyRoutinePredictorDidEndEveningRoutine:", *(_QWORD *)(a1 + 32));

}

- (void)_queue_setupMorningBeginTimerIfNeeded
{
  REUpNextTimer *endMorningRoutineTimer;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  OS_dispatch_queue *queue;
  REUpNextTimer *v9;
  REUpNextTimer *beginEveningRoutineTimer;
  _QWORD v11[4];
  id v12;
  id location;

  -[REUpNextTimer invalidate](self->_endMorningRoutineTimer, "invalidate");
  endMorningRoutineTimer = self->_endMorningRoutineTimer;
  self->_endMorningRoutineTimer = 0;

  if (-[REPeriodOfDayPredictor currentPeriodOfDay](self->_periodOfDayPredictor, "currentPeriodOfDay") == 2
    && !-[REDailyRoutinePredictor currentRoutineType](self, "currentRoutineType"))
  {
    -[REPeriodOfDayPredictor intervalForCurrentPeriodOfDay](self->_periodOfDayPredictor, "intervalForCurrentPeriodOfDay");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[REDailyRoutinePredictor _morningRoutineIntervalForMorning:](self, "_morningRoutineIntervalForMorning:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    objc_msgSend(v5, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateByAddingTimeInterval:", 2.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    queue = self->_queue;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __64__REDailyRoutinePredictor__queue_setupMorningBeginTimerIfNeeded__block_invoke;
    v11[3] = &unk_24CF8ABD0;
    objc_copyWeak(&v12, &location);
    +[REUpNextTimer timerWithFireDate:queue:block:](REUpNextTimer, "timerWithFireDate:queue:block:", v7, queue, v11);
    v9 = (REUpNextTimer *)objc_claimAutoreleasedReturnValue();
    beginEveningRoutineTimer = self->_beginEveningRoutineTimer;
    self->_beginEveningRoutineTimer = v9;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);

  }
}

void __64__REDailyRoutinePredictor__queue_setupMorningBeginTimerIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateCurrentRoutine");
    objc_msgSend(v2, "_queue_didBeginMorningRoutine");
    WeakRetained = v2;
  }

}

- (void)_queue_setupEveningBeginTimerIfNeeded
{
  REUpNextTimer *beginEveningRoutineTimer;
  REUpNextTimer *endEveningRoutineTimer;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  OS_dispatch_queue *queue;
  REUpNextTimer *v10;
  REUpNextTimer *v11;
  _QWORD v12[4];
  id v13;
  id location;

  -[REUpNextTimer invalidate](self->_beginEveningRoutineTimer, "invalidate");
  beginEveningRoutineTimer = self->_beginEveningRoutineTimer;
  self->_beginEveningRoutineTimer = 0;

  -[REUpNextTimer invalidate](self->_endEveningRoutineTimer, "invalidate");
  endEveningRoutineTimer = self->_endEveningRoutineTimer;
  self->_endEveningRoutineTimer = 0;

  if (-[REPeriodOfDayPredictor currentPeriodOfDay](self->_periodOfDayPredictor, "currentPeriodOfDay") == 1
    && !-[REDailyRoutinePredictor currentRoutineType](self, "currentRoutineType"))
  {
    -[REPeriodOfDayPredictor intervalForCurrentPeriodOfDay](self->_periodOfDayPredictor, "intervalForCurrentPeriodOfDay");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[REDailyRoutinePredictor _eveningRoutineIntervalForEvening:](self, "_eveningRoutineIntervalForEvening:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    objc_msgSend(v6, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateByAddingTimeInterval:", 2.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    queue = self->_queue;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __64__REDailyRoutinePredictor__queue_setupEveningBeginTimerIfNeeded__block_invoke;
    v12[3] = &unk_24CF8ABD0;
    objc_copyWeak(&v13, &location);
    +[REUpNextTimer timerWithFireDate:queue:block:](REUpNextTimer, "timerWithFireDate:queue:block:", v8, queue, v12);
    v10 = (REUpNextTimer *)objc_claimAutoreleasedReturnValue();
    v11 = self->_beginEveningRoutineTimer;
    self->_beginEveningRoutineTimer = v10;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);

  }
}

void __64__REDailyRoutinePredictor__queue_setupEveningBeginTimerIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateCurrentRoutine");
    objc_msgSend(v2, "_queue_didBeginEveningRoutine");
    WeakRetained = v2;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideRoutineType, 0);
  objc_storeStrong((id *)&self->_routineLock, 0);
  objc_storeStrong((id *)&self->_currentRoutineInterval, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_endEveningRoutineTimer, 0);
  objc_storeStrong((id *)&self->_beginEveningRoutineTimer, 0);
  objc_storeStrong((id *)&self->_endMorningRoutineTimer, 0);
  objc_storeStrong((id *)&self->_periodOfDayPredictor, 0);
}

- (void)_setOverrideRoutineType:(unint64_t)a3
{
  NSNumber *v4;
  NSNumber *overrideRoutineType;
  NSNumber *v6;
  _QWORD v7[5];

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
    v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  -[NSLock lock](self->_routineLock, "lock");
  overrideRoutineType = self->_overrideRoutineType;
  self->_overrideRoutineType = v4;
  v6 = v4;

  -[NSLock unlock](self->_routineLock, "unlock");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __73__REDailyRoutinePredictor_RETrainingSimulation___setOverrideRoutineType___block_invoke;
  v7[3] = &unk_24CF8C7D8;
  v7[4] = self;
  -[REObservableSingleton enumerateObservers:](self, "enumerateObservers:", v7);

}

uint64_t __73__REDailyRoutinePredictor_RETrainingSimulation___setOverrideRoutineType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dailyRoutinePredictorDidUpdatedPredictedRoutines:", *(_QWORD *)(a1 + 32));
}

@end
