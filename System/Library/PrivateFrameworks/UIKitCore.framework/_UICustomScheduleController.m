@implementation _UICustomScheduleController

- (_UICustomScheduleController)init
{
  _UICustomScheduleController *v2;
  _UICustomScheduleController *v3;
  $EDD60E64C3A297FC4B567F3E18015A01 v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UICustomScheduleController;
  v2 = -[_UICustomScheduleController init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = *($EDD60E64C3A297FC4B567F3E18015A01 *)(MEMORY[0x1E0DC5D58] + 16);
    v2->_schedule.beginTime = ($EDD60E64C3A297FC4B567F3E18015A01)*MEMORY[0x1E0DC5D58];
    v2->_schedule.endTime = v4;
    v2->_inScheduleTime = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v3, sel__significantTimeChange, 0x1E1761B60, 0);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[_UICustomScheduleController _updateTimeMonitoring:](self, "_updateTimeMonitoring:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, 0x1E1761B60, 0);

  v4.receiver = self;
  v4.super_class = (Class)_UICustomScheduleController;
  -[_UICustomScheduleController dealloc](&v4, sel_dealloc);
}

- (void)addObserver:(id)a3 changeHandler:(id)a4
{
  id v6;
  NSMapTable *observers;
  NSMapTable *v8;
  NSMapTable *v9;
  void *v10;
  id v11;

  v11 = a4;
  v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  observers = self->_observers;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v9 = self->_observers;
    self->_observers = v8;

    observers = self->_observers;
  }
  v10 = (void *)objc_msgSend(v11, "copy");
  -[NSMapTable setObject:forKey:](observers, "setObject:forKey:", v10, v6);

}

- (void)removeObserver:(id)a3
{
  id v4;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[NSMapTable removeObjectForKey:](self->_observers, "removeObjectForKey:", v4);

}

- (void)setSchedule:(id *)a3
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;
  void *v6;
  $0C5CCC690DEBC5377F5A3E228896D6F3 v7;
  $8BCAFA14ABF756F0DA12E4C2E531DC07 schedule;

  schedule = self->_schedule;
  v7 = *a3;
  if ((UISUserInterfaceStyleModeSchedulesEqual() & 1) == 0)
  {
    var1 = a3->var1;
    self->_schedule.beginTime = ($EDD60E64C3A297FC4B567F3E18015A01)a3->var0;
    self->_schedule.endTime = ($EDD60E64C3A297FC4B567F3E18015A01)var1;
    -[_UICustomScheduleController _updateTimeMonitoring](self, "_updateTimeMonitoring", *(_OWORD *)&v7.var0, *(_OWORD *)&v7.var1, *(_OWORD *)&schedule.beginTime, *(_OWORD *)&schedule.endTime);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICustomScheduleController _updateWithDate:](self, "_updateWithDate:", v6);

  }
}

- (BOOL)isInScheduleTime
{
  return self->_inScheduleTime;
}

- (void)forceUpdate
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  _UIUserInterfaceStyleArbiterLogger();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_DEFAULT, "CustomScheduleController forcing update", v5, 2u);
  }

  -[_UICustomScheduleController _updateTimeMonitoring](self, "_updateTimeMonitoring");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICustomScheduleController _updateWithDate:](self, "_updateWithDate:", v4);

}

- (id)nextTransition:(BOOL)a3
{
  _BOOL4 v3;
  UIUserInterfaceStyleArbiterTransition *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a3;
  v5 = objc_alloc_init(UIUserInterfaceStyleArbiterTransition);
  -[UIUserInterfaceStyleArbiterTransition setType:](v5, "setType:", 0);
  v6 = 48;
  if (v3)
  {
    v6 = 32;
    v7 = 40;
  }
  else
  {
    v7 = 56;
  }
  -[UIUserInterfaceStyleArbiterTransition setHour:](v5, "setHour:", *(Class *)((char *)&self->super.isa + v6));
  -[UIUserInterfaceStyleArbiterTransition setMinute:](v5, "setMinute:", *(Class *)((char *)&self->super.isa + v7));
  return v5;
}

- (void)_notifyChange
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMapTable keyEnumerator](self->_observers, "keyEnumerator", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_observers, "objectForKey:", v8);
        v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _UICustomScheduleController *, uint64_t))v9)[2](v9, self, v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)_updateStatus:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 inScheduleTime;
  _DWORD v7[2];
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  _UIUserInterfaceStyleArbiterLogger();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    inScheduleTime = self->_inScheduleTime;
    v7[0] = 67109376;
    v7[1] = v3;
    v8 = 1024;
    v9 = inScheduleTime;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "CustomSchedule is in dark: %d from: %d", (uint8_t *)v7, 0xEu);
  }

  if (self->_inScheduleTime != v3)
  {
    self->_inScheduleTime = v3;
    -[_UICustomScheduleController _notifyChange](self, "_notifyChange");
  }
}

- (void)_updateWithDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL4 v16;
  _BOOL4 v18;
  _BOOL8 v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateBySettingHour:minute:second:ofDate:options:", self->_schedule.beginTime.hour, self->_schedule.beginTime.minute, 0, v4, 4096);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateBySettingHour:minute:second:ofDate:options:", self->_schedule.endTime.hour, self->_schedule.endTime.minute, 0, v4, 4096);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _UIUserInterfaceStyleArbiterLogger();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    formatDate(v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    formatDate(v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    formatDate(v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412802;
    v21 = v9;
    v22 = 2112;
    v23 = v10;
    v24 = 2112;
    v25 = v11;
    _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "CustomSchedule: Updating for date %@ compared to %@ and %@", (uint8_t *)&v20, 0x20u);

  }
  v12 = objc_msgSend(v5, "compareDate:toDate:toUnitGranularity:", v4, v6, 64);
  v13 = objc_msgSend(v5, "compareDate:toDate:toUnitGranularity:", v4, v7, 64);
  v14 = objc_msgSend(v5, "compareDate:toDate:toUnitGranularity:", v6, v7, 64);
  v16 = v12 < 2 || v13 == -1;
  v18 = v12 < 2 && v13 == -1;
  if (v14 != -1)
    v18 = 0;
  if (v14 == 1)
    v19 = v16;
  else
    v19 = v18;
  -[_UICustomScheduleController _updateStatus:](self, "_updateStatus:", v19);

}

- (void)_updateTimeMonitoring
{
  -[_UICustomScheduleController _updateTimeMonitoring:](self, "_updateTimeMonitoring:", UISUserInterfaceStyleModeSchedulesEqual() ^ 1, *MEMORY[0x1E0DC5D58], *(_QWORD *)(MEMORY[0x1E0DC5D58] + 8), *(_QWORD *)(MEMORY[0x1E0DC5D58] + 16), *(_QWORD *)(MEMORY[0x1E0DC5D58] + 24), self->_schedule.beginTime.hour, self->_schedule.beginTime.minute, self->_schedule.endTime.hour, self->_schedule.endTime.minute);
}

- (void)_updateTimeMonitoring:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSTimer *nextEventTimer;
  NSTimer *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  id v26;
  NSTimer *v27;
  NSTimer *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t);
  void *v33;
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v3 = a3;
  v40 = *MEMORY[0x1E0C80C00];
  _UIUserInterfaceStyleArbiterLogger();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v37) = v3;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "CustomSchedule: Update time monitoring: %d", buf, 8u);
  }

  nextEventTimer = self->_nextEventTimer;
  if (nextEventTimer)
  {
    -[NSTimer invalidate](nextEventTimer, "invalidate");
    v7 = self->_nextEventTimer;
    self->_nextEventTimer = 0;

  }
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateBySettingHour:minute:second:ofDate:options:", self->_schedule.beginTime.hour, self->_schedule.beginTime.minute, 0, v9, 4096);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateBySettingHour:minute:second:ofDate:options:", self->_schedule.endTime.hour, self->_schedule.endTime.minute, 0, v9, 4096);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _UIUserInterfaceStyleArbiterLogger();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      formatDate(v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      formatDate(v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v37 = v13;
      v38 = 2112;
      v39 = v14;
      _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_DEFAULT, "CustomSchedule: Monitoring dates %@ and %@", buf, 0x16u);

    }
    v15 = objc_msgSend(v8, "compareDate:toDate:toUnitGranularity:", v10, v11, 64);
    v16 = v10;
    v17 = v11;
    if (v15 != -1)
    {
      if (v15 != 1)
      {
        v20 = 0;
        v18 = 0;
LABEL_22:

        return;
      }
      v16 = v11;
      v17 = v10;
    }
    v18 = v16;
    v19 = v17;
    v20 = v19;
    if (v18 && v19)
    {
      if (objc_msgSend(v8, "compareDate:toDate:toUnitGranularity:", v9, v18, 64) == -1)
      {
        v21 = v18;
      }
      else if (objc_msgSend(v8, "compareDate:toDate:toUnitGranularity:", v9, v20, 64) == -1)
      {
        v21 = v20;
      }
      else
      {
        objc_msgSend(v8, "dateByAddingUnit:value:toDate:options:", 16, 1, v18, 4096);
        v21 = (id)objc_claimAutoreleasedReturnValue();
      }
      v22 = v21;
      _UIUserInterfaceStyleArbiterLogger();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        formatDate(v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v37 = v24;
        _os_log_impl(&dword_185066000, v23, OS_LOG_TYPE_DEFAULT, "CustomSchedule: Setting timer for %@", buf, 0xCu);

      }
      objc_initWeak((id *)buf, self);
      v25 = objc_alloc(MEMORY[0x1E0C99E88]);
      v30 = MEMORY[0x1E0C809B0];
      v31 = 3221225472;
      v32 = __53___UICustomScheduleController__updateTimeMonitoring___block_invoke;
      v33 = &unk_1E16B1B00;
      v26 = v22;
      v34 = v26;
      objc_copyWeak(&v35, (id *)buf);
      v27 = (NSTimer *)objc_msgSend(v25, "initWithFireDate:interval:repeats:block:", v26, 0, &v30, 0.0);
      v28 = self->_nextEventTimer;
      self->_nextEventTimer = v27;

      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop", v30, v31, v32, v33);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "addTimer:forMode:", self->_nextEventTimer, *MEMORY[0x1E0C99860]);

      objc_destroyWeak(&v35);
      objc_destroyWeak((id *)buf);

    }
    goto LABEL_22;
  }
}

- (void)_significantTimeChange
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  _UIUserInterfaceStyleArbiterLogger();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_DEFAULT, "CustomSchedule: Significant time change", v5, 2u);
  }

  -[_UICustomScheduleController _updateTimeMonitoring](self, "_updateTimeMonitoring");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICustomScheduleController _updateWithDate:](self, "_updateWithDate:", v4);

}

- ($0C5CCC690DEBC5377F5A3E228896D6F3)schedule
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;

  var1 = self[1].var1;
  retstr->var0 = self[1].var0;
  retstr->var1 = var1;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextEventTimer, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
