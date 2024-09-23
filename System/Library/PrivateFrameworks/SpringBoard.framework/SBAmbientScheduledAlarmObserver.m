@implementation SBAmbientScheduledAlarmObserver

- (SBAmbientScheduledAlarmObserver)init
{
  SBAmbientScheduledAlarmObserver *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *scheduledTimerQueue;
  NSMutableDictionary *v6;
  NSMutableDictionary *scheduledTimers;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBAmbientScheduledAlarmObserver;
  v2 = -[SBAmbientScheduledAlarmObserver init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.springboard.AmbientScheduledAlarmObserverQueue", v3);
    scheduledTimerQueue = v2->_scheduledTimerQueue;
    v2->_scheduledTimerQueue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    scheduledTimers = v2->_scheduledTimers;
    v2->_scheduledTimers = v6;

  }
  return v2;
}

- (void)dealloc
{
  MTAlarmManager *alarmManager;
  objc_super v4;

  -[SBAmbientScheduledAlarmObserver _unregisterForAlarmNotifications](self, "_unregisterForAlarmNotifications");
  -[SBAmbientScheduledAlarmObserver _invalidateAllScheduledTimers](self, "_invalidateAllScheduledTimers");
  alarmManager = self->_alarmManager;
  self->_alarmManager = 0;

  v4.receiver = self;
  v4.super_class = (Class)SBAmbientScheduledAlarmObserver;
  -[SBAmbientScheduledAlarmObserver dealloc](&v4, sel_dealloc);
}

- (void)setObservationEnabled:(BOOL)a3
{
  if (self->_observationEnabled != a3)
  {
    self->_observationEnabled = a3;
    -[SBAmbientScheduledAlarmObserver _updateAlarmObservation](self, "_updateAlarmObservation");
  }
}

- (void)_updateAlarmObservation
{
  _BOOL4 v3;
  MTAlarmManager *alarmManager;
  MTAlarmManager *v5;
  MTAlarmManager *v6;
  MTAlarmManager *v7;

  v3 = -[SBAmbientScheduledAlarmObserver observationEnabled](self, "observationEnabled");
  alarmManager = self->_alarmManager;
  if (v3)
  {
    if (!alarmManager)
    {
      v5 = (MTAlarmManager *)objc_alloc_init(MEMORY[0x1E0D4FA58]);
      v6 = self->_alarmManager;
      self->_alarmManager = v5;

      -[SBAmbientScheduledAlarmObserver _registerForAlarmNotifications](self, "_registerForAlarmNotifications");
      -[SBAmbientScheduledAlarmObserver _updateScheduledTimersForNextAlarm](self, "_updateScheduledTimersForNextAlarm");
    }
  }
  else if (alarmManager)
  {
    -[SBAmbientScheduledAlarmObserver _unregisterForAlarmNotifications](self, "_unregisterForAlarmNotifications");
    -[SBAmbientScheduledAlarmObserver _invalidateAllScheduledTimers](self, "_invalidateAllScheduledTimers");
    v7 = self->_alarmManager;
    self->_alarmManager = 0;

  }
}

- (void)_invalidateAllScheduledTimers
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableDictionary count](self->_scheduledTimers, "count"))
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    -[NSMutableDictionary allValues](self->_scheduledTimers, "allValues", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "invalidate");
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

    -[NSMutableDictionary removeAllObjects](self->_scheduledTimers, "removeAllObjects");
  }
}

- (void)_registerForAlarmNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__nextAlarmChanged_, *MEMORY[0x1E0D4F980], self->_alarmManager);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__nextAlarmChanged_, *MEMORY[0x1E0D4F990], self->_alarmManager);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__firingAlarmUpdated_, *MEMORY[0x1E0D4F978], self->_alarmManager);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__firingAlarmUpdated_, *MEMORY[0x1E0D4F970], self->_alarmManager);

}

- (void)_unregisterForAlarmNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D4F980], self->_alarmManager);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D4F990], self->_alarmManager);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D4F978], self->_alarmManager);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D4F970], self->_alarmManager);

}

- (void)_nextAlarmChanged:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D4F988]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  SBLogAmbientPresentation();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "alarmID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v10;
    v14 = 2114;
    v15 = v11;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Ambient Scheduled Alarm Observer recieved %{public}@ notification containing alarmID: %{public}@", (uint8_t *)&v12, 0x16u);

  }
  -[SBAmbientScheduledAlarmObserver _updateScheduledTimersForNextAlarm](self, "_updateScheduledTimersForNextAlarm");

}

- (void)_firingAlarmUpdated:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogAmbientPresentation();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Ambient Scheduled Alarm Observer recieved %{public}@ notification for firing alarm update", (uint8_t *)&v8, 0xCu);

  }
  -[SBAmbientScheduledAlarmObserver delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "alarmDidResetForAmbientScheduledAlarmObserver:", self);

  -[SBAmbientScheduledAlarmObserver _updateScheduledTimersForNextAlarm](self, "_updateScheduledTimersForNextAlarm");
}

- (void)_updateScheduledTimersForNextAlarm
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location[2];

  -[MTAlarmManager nextAlarm](self->_alarmManager, "nextAlarm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_initWeak(location, self);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __69__SBAmbientScheduledAlarmObserver__updateScheduledTimersForNextAlarm__block_invoke;
    v7[3] = &unk_1E8EAE958;
    objc_copyWeak(&v8, location);
    v4 = (id)objc_msgSend(v3, "addCompletionBlock:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(location);
  }
  else
  {
    SBLogAmbientPresentation();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "No sleep alarm for ambient scheduled alarm observer!", (uint8_t *)location, 2u);
    }

    -[SBAmbientScheduledAlarmObserver delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "alarmDidResetForAmbientScheduledAlarmObserver:", self);

  }
}

void __69__SBAmbientScheduledAlarmObserver__updateScheduledTimersForNextAlarm__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id WeakRetained;
  void *v8;
  uint8_t v9[16];
  _QWORD block[4];
  id v11;
  id v12;

  v3 = a2;
  v4 = objc_opt_class();
  SBSafeCast(v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__SBAmbientScheduledAlarmObserver__updateScheduledTimersForNextAlarm__block_invoke_2;
    block[3] = &unk_1E8E9F280;
    objc_copyWeak(&v12, (id *)(a1 + 32));
    v11 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v12);
  }
  else
  {
    SBLogAmbientPresentation();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "No sleep alarm for ambient scheduled alarm observer!", v9, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "alarmDidResetForAmbientScheduledAlarmObserver:", WeakRetained);

  }
}

void __69__SBAmbientScheduledAlarmObserver__updateScheduledTimersForNextAlarm__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_scheduleTimersForAlarm:", *(_QWORD *)(a1 + 32));

}

- (void)_scheduleTimersForAlarm:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SBAmbientScheduledAlarmObserver *v9;
  id v10;

  v6 = a3;
  objc_msgSend(v6, "nextFireDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && -[SBAmbientScheduledAlarmObserver observationEnabled](self, "observationEnabled"))
  {
    -[SBAmbientScheduledAlarmObserver _timeIntervalsWithReasons](self, "_timeIntervalsWithReasons");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __59__SBAmbientScheduledAlarmObserver__scheduleTimersForAlarm___block_invoke;
    v7[3] = &unk_1E8EAE980;
    v8 = v4;
    v9 = self;
    v10 = v6;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v7);

  }
}

void __59__SBAmbientScheduledAlarmObserver__scheduleTimersForAlarm___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(a3, "doubleValue");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", *(_QWORD *)(a1 + 32), -v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "compare:", v7);

  if (v9 == -1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "objectForKey:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v11;
    if (v11)
      objc_msgSend(v11, "invalidate");
    v12 = (void *)objc_msgSend(*(id *)(a1 + 40), "_newScheduledTimerForFireDate:", v7);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "setValue:forKey:", v12, v5);
    SBLogAmbientPresentation();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 48), "alarmID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138544130;
      v16 = v5;
      v17 = 2114;
      v18 = v14;
      v19 = 2114;
      v20 = v7;
      v21 = 2114;
      v22 = v12;
      _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "Ambient Scheduled Alarm Observer scheduled new timer for %{public}@ for alarmID: %{public}@ with fire date %{public}@ [ timer = %{public}@ ]", (uint8_t *)&v15, 0x2Au);

    }
    goto LABEL_9;
  }
  if (objc_msgSend(v7, "compare:", *(_QWORD *)(a1 + 32)) == -1)
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scheduledAlarmObserver:timerFiredForReason:", *(_QWORD *)(a1 + 40), v5);
LABEL_9:

  }
}

- (id)_newScheduledTimerForFireDate:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;

  v4 = (objc_class *)MEMORY[0x1E0D70A38];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFireDate:serviceIdentifier:target:selector:userInfo:", v5, CFSTR("com.apple.springboard.AmbientScheduledAlarmObserver"), self, sel__timerFired_, 0);

  objc_msgSend(v6, "setMinimumEarlyFireProportion:", 1.0);
  objc_msgSend(v6, "setUserVisible:", 1);
  objc_msgSend(v6, "scheduleInQueue:", self->_scheduledTimerQueue);
  return v6;
}

- (void)_timerFired:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogAmbientPresentation();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Ambient Scheduled Alarm Observer scheduled timer fired! [ timer = %{public}@ ]", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__SBAmbientScheduledAlarmObserver__timerFired___block_invoke;
  v7[3] = &unk_1E8E9F280;
  objc_copyWeak(&v9, (id *)buf);
  v8 = v4;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

void __47__SBAmbientScheduledAlarmObserver__timerFired___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_publishTimerFired:", *(_QWORD *)(a1 + 32));

}

- (void)_publishTimerFired:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[NSMutableDictionary allKeysForObject:](self->_scheduledTimers, "allKeysForObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_scheduledTimers, "removeObjectForKey:", v6);
    -[SBAmbientScheduledAlarmObserver delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scheduledAlarmObserver:timerFiredForReason:", self, v6);

  }
}

- (id)_timeIntervalsWithReasons
{
  void *v3;
  void *v4;

  -[SBAmbientScheduledAlarmObserver delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalsWithReasonsForScheduledTimersForAmbientScheduledAlarmObserver:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (SBAmbientScheduledAlarmObserverDelegate)delegate
{
  return (SBAmbientScheduledAlarmObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)observationEnabled
{
  return self->_observationEnabled;
}

- (MTAlarmManager)alarmManager
{
  return self->_alarmManager;
}

- (void)setAlarmManager:(id)a3
{
  objc_storeStrong((id *)&self->_alarmManager, a3);
}

- (OS_dispatch_queue)scheduledTimerQueue
{
  return self->_scheduledTimerQueue;
}

- (void)setScheduledTimerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_scheduledTimerQueue, a3);
}

- (NSMutableDictionary)scheduledTimers
{
  return self->_scheduledTimers;
}

- (void)setScheduledTimers:(id)a3
{
  objc_storeStrong((id *)&self->_scheduledTimers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduledTimers, 0);
  objc_storeStrong((id *)&self->_scheduledTimerQueue, 0);
  objc_storeStrong((id *)&self->_alarmManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
