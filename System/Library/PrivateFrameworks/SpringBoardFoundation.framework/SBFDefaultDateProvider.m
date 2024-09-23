@implementation SBFDefaultDateProvider

- (SBFDefaultDateProvider)init
{
  SBFDefaultDateProvider *v2;
  uint64_t v3;
  NSCalendar *calendar;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBFDefaultDateProvider;
  v2 = -[SBFDefaultDateProvider init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "autoupdatingCurrentCalendar");
    v3 = objc_claimAutoreleasedReturnValue();
    calendar = v2->_calendar;
    v2->_calendar = (NSCalendar *)v3;

  }
  return v2;
}

- (id)date
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
}

- (id)observeMinuteUpdatesWithHandler:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *minuteHandlers;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (!self->_minuteHandlers)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    minuteHandlers = self->_minuteHandlers;
    self->_minuteHandlers = v5;

  }
  v7 = (void *)MEMORY[0x1E0CB37E8];
  ++self->_nextToken;
  objc_msgSend(v7, "numberWithUnsignedInteger:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "copy");
  v10 = (void *)MEMORY[0x18D774178]();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_minuteHandlers, "setObject:forKeyedSubscript:", v10, v8);

  -[SBFDefaultDateProvider _updateMinuteTimer](self, "_updateMinuteTimer");
  return v8;
}

- (void)removeMinuteUpdateHandler:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_minuteHandlers, "removeObjectForKey:", a3);
  -[SBFDefaultDateProvider _updateMinuteTimer](self, "_updateMinuteTimer");
}

- (void)_updateMinuteTimer
{
  uint64_t v3;
  NSTimer *minuteTimer;
  NSTimer *v5;

  v3 = -[NSMutableDictionary count](self->_minuteHandlers, "count");
  minuteTimer = self->_minuteTimer;
  if (v3)
  {
    if (!minuteTimer)
    {
      -[SBFDefaultDateProvider _scheduleNextMinuteTimer](self, "_scheduleNextMinuteTimer");
      return;
    }
  }
  else if (!minuteTimer)
  {
    return;
  }
  if (!-[NSMutableDictionary count](self->_minuteHandlers, "count"))
  {
    -[NSTimer invalidate](self->_minuteTimer, "invalidate");
    v5 = self->_minuteTimer;
    self->_minuteTimer = 0;

  }
}

- (void)_scheduleNextMinuteTimer
{
  void *v3;
  double v4;
  NSTimer *v5;
  NSTimer *minuteTimer;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  -[SBFDefaultDateProvider date](self, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = 0;
  v7 = 0;
  v8 = 0;
  -[NSCalendar getHour:minute:second:nanosecond:fromDate:](self->_calendar, "getHour:minute:second:nanosecond:fromDate:", &v10, &v9, &v8, &v7, v3);
  v4 = 60.0 - ((double)v7 / 1000000000.0 + (double)v8);
  -[NSTimer invalidate](self->_minuteTimer, "invalidate");
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__minuteTimerFired, 0, 0, v4);
  v5 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  minuteTimer = self->_minuteTimer;
  self->_minuteTimer = v5;

}

- (void)_minuteTimerFired
{
  void *v3;
  NSMutableDictionary *minuteHandlers;
  id v5;
  _QWORD v6[4];
  id v7;

  -[SBFDefaultDateProvider date](self, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  minuteHandlers = self->_minuteHandlers;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__SBFDefaultDateProvider__minuteTimerFired__block_invoke;
  v6[3] = &unk_1E200E6A0;
  v7 = v3;
  v5 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](minuteHandlers, "enumerateKeysAndObjectsUsingBlock:", v6);
  -[SBFDefaultDateProvider _scheduleNextMinuteTimer](self, "_scheduleNextMinuteTimer");

}

uint64_t __43__SBFDefaultDateProvider__minuteTimerFired__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a3 + 16))(a3, *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_minuteTimer, 0);
  objc_storeStrong((id *)&self->_minuteHandlers, 0);
}

@end
