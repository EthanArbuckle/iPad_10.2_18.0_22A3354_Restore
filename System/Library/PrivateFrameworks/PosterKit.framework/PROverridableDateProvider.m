@implementation PROverridableDateProvider

- (PROverridableDateProvider)init
{
  PROverridableDateProvider *v2;
  uint64_t v3;
  NSCalendar *calendar;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PROverridableDateProvider;
  v2 = -[PROverridableDateProvider init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "autoupdatingCurrentCalendar");
    v3 = objc_claimAutoreleasedReturnValue();
    calendar = v2->_calendar;
    v2->_calendar = (NSCalendar *)v3;

  }
  return v2;
}

- (void)setOverrideDate:(id)a3
{
  NSDate *v4;
  NSDate *overrideDate;
  void *v6;
  id v7;

  v7 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (NSDate *)objc_msgSend(v7, "copy");
    overrideDate = self->_overrideDate;
    self->_overrideDate = v4;

    -[PROverridableDateProvider _updateMinuteTimer](self, "_updateMinuteTimer");
    -[PROverridableDateProvider date](self, "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PROverridableDateProvider _notifyObserversDidUpdateDate:](self, "_notifyObserversDidUpdateDate:", v6);

  }
}

- (NSDate)date
{
  NSDate *v2;

  v2 = self->_overrideDate;
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v2 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)addMinuteUpdateObserver:(id)a3
{
  id v4;
  NSHashTable *minuteObservers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    minuteObservers = self->_minuteObservers;
    v8 = v4;
    if (!minuteObservers)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v7 = self->_minuteObservers;
      self->_minuteObservers = v6;

      minuteObservers = self->_minuteObservers;
    }
    -[NSHashTable addObject:](minuteObservers, "addObject:", v8);
    -[PROverridableDateProvider _updateMinuteTimer](self, "_updateMinuteTimer");
    v4 = v8;
  }

}

- (void)removeMinuteUpdateObserver:(id)a3
{
  if (a3)
  {
    -[NSHashTable removeObject:](self->_minuteObservers, "removeObject:");
    -[PROverridableDateProvider _updateMinuteTimer](self, "_updateMinuteTimer");
  }
}

- (void)_updateMinuteTimer
{
  NSTimer *v3;
  BOOL v4;
  NSTimer **p_minuteTimer;
  NSTimer *minuteTimer;
  NSTimer *v7;

  if (!-[NSHashTable count](self->_minuteObservers, "count"))
  {
    v4 = 0;
    minuteTimer = self->_minuteTimer;
    p_minuteTimer = &self->_minuteTimer;
    v3 = minuteTimer;
    if (!minuteTimer)
      return;
    goto LABEL_7;
  }
  v3 = self->_minuteTimer;
  v4 = self->_overrideDate == 0;
  if (*(_OWORD *)&self->_minuteTimer == 0)
  {
    -[PROverridableDateProvider _scheduleNextMinuteTimer](self, "_scheduleNextMinuteTimer");
    return;
  }
  p_minuteTimer = &self->_minuteTimer;
  if (v3)
  {
LABEL_7:
    if (!v4)
    {
      -[NSTimer invalidate](v3, "invalidate");
      v7 = *p_minuteTimer;
      *p_minuteTimer = 0;

    }
  }
}

- (void)_scheduleNextMinuteTimer
{
  void *v3;
  double v4;
  void *v5;
  NSTimer *v6;
  NSTimer *minuteTimer;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  -[PROverridableDateProvider date](self, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v16 = 0;
  v17 = 0;
  v15 = 0;
  -[NSCalendar getHour:minute:second:nanosecond:fromDate:](self->_calendar, "getHour:minute:second:nanosecond:fromDate:", &v18, &v17, &v16, &v15, v3);
  v4 = 60.0 - ((double)v15 / 1000000000.0 + (double)v16);
  -[NSTimer invalidate](self->_minuteTimer, "invalidate");
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0C99E88];
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __53__PROverridableDateProvider__scheduleNextMinuteTimer__block_invoke;
  v12 = &unk_1E2184880;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v5, "timerWithTimeInterval:repeats:block:", 0, &v9, v4);
  v6 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  minuteTimer = self->_minuteTimer;
  self->_minuteTimer = v6;

  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop", v9, v10, v11, v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addTimer:forMode:", self->_minuteTimer, *MEMORY[0x1E0C99860]);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __53__PROverridableDateProvider__scheduleNextMinuteTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_minuteTimerFired");
    WeakRetained = v2;
  }

}

- (void)_minuteTimerFired
{
  void *v3;
  double v4;
  NSTimer *minuteTimer;
  id v6;

  -[PROverridableDateProvider date](self, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSince1970");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", ceil(v4));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[PROverridableDateProvider _notifyObserversDidUpdateDate:](self, "_notifyObserversDidUpdateDate:", v6);
  -[NSTimer invalidate](self->_minuteTimer, "invalidate");
  minuteTimer = self->_minuteTimer;
  self->_minuteTimer = 0;

  -[PROverridableDateProvider _updateMinuteTimer](self, "_updateMinuteTimer");
}

- (void)_notifyObserversDidUpdateDate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSHashTable allObjects](self->_minuteObservers, "allObjects", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "dateProvider:didUpdateDate:", self, v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSDate)overrideDate
{
  return self->_overrideDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_storeStrong((id *)&self->_minuteTimer, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_minuteObservers, 0);
}

@end
