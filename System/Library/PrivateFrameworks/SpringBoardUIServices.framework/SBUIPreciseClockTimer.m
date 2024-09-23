@implementation SBUIPreciseClockTimer

- (void)_handleTimePassed
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[SBUIPreciseClockTimer now](SBUIPreciseClockTimer, "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0uLL;
  v14 = 0;
  v15 = 0;
  -[NSCalendar getHour:minute:second:nanosecond:fromDate:](self->_calendar, "getHour:minute:second:nanosecond:fromDate:", (char *)&v16 + 8, &v16, &v15, &v14, v3);
  if (v16 != __PAIR128__(self->_lastHour, self->_lastMinute))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[NSMutableDictionary allValues](self->_minuteUpdateHandlers, "allValues", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++) + 16))();
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v17, 16);
      }
      while (v6);
    }

    v9 = v16;
    self->_lastHour = *((_QWORD *)&v16 + 1);
    self->_lastMinute = v9;
  }
  -[SBUIPreciseClockTimer _updateDisplayLinkFrameIntervalForSecondsPastMinute:](self, "_updateDisplayLinkFrameIntervalForSecondsPastMinute:", (double)v14 / 1000000000.0 + (double)v15);

}

+ (id)now
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateByAddingTimeInterval:", 0.05);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_updateDisplayLinkFrameIntervalForSecondsPastMinute:(double)a3
{
  float v4;
  float v5;
  float minimum;
  float maximum;
  float preferred;
  double v9;
  double v10;
  double v11;
  CAFrameRateRange v12;
  CAFrameRateRange v13;
  CAFrameRateRange v14;

  if (a3 <= 59.8666667)
  {
    v4 = 15.0;
    v5 = 15.0;
  }
  else
  {
    v4 = 60.0;
    v5 = 60.0;
  }
  v12 = CAFrameRateRangeMake(v4, 120.0, v5);
  minimum = v12.minimum;
  maximum = v12.maximum;
  preferred = v12.preferred;
  -[CADisplayLink preferredFrameRateRange](self->_displayLink, "preferredFrameRateRange");
  v14.minimum = minimum;
  v14.maximum = maximum;
  v14.preferred = preferred;
  if (!CAFrameRateRangeIsEqualToRange(v13, v14))
  {
    *(float *)&v9 = minimum;
    *(float *)&v10 = maximum;
    *(float *)&v11 = preferred;
    -[CADisplayLink setPreferredFrameRateRange:](self->_displayLink, "setPreferredFrameRateRange:", v9, v10, v11);
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_6);
  return (id)sharedInstance___sharedInstance;
}

void __39__SBUIPreciseClockTimer_sharedInstance__block_invoke()
{
  SBUIPreciseClockTimer *v0;
  void *v1;

  v0 = objc_alloc_init(SBUIPreciseClockTimer);
  v1 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v0;

}

- (SBUIPreciseClockTimer)init
{
  char *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBUIPreciseClockTimer;
  v2 = -[SBUIPreciseClockTimer init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v3;

    objc_msgSend(MEMORY[0x1E0C99D48], "autoupdatingCurrentCalendar");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v5;

    *(int64x2_t *)(v2 + 40) = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  }
  return (SBUIPreciseClockTimer *)v2;
}

- (void)dealloc
{
  objc_super v3;

  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBUIPreciseClockTimer;
  -[SBUIPreciseClockTimer dealloc](&v3, sel_dealloc);
}

- (id)startMinuteUpdatesWithHandler:(id)a3
{
  void *v4;
  unint64_t nextToken;
  id v6;
  void *v7;
  NSMutableDictionary *minuteUpdateHandlers;
  void *v9;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  nextToken = self->_nextToken;
  v6 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", nextToken);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  minuteUpdateHandlers = self->_minuteUpdateHandlers;
  ++self->_nextToken;
  v9 = (void *)objc_msgSend(v6, "copy");

  -[NSMutableDictionary setObject:forKey:](minuteUpdateHandlers, "setObject:forKey:", v9, v7);
  -[SBUIPreciseClockTimer _updateDisplayLink](self, "_updateDisplayLink");
  return v7;
}

- (void)stopMinuteUpdatesForToken:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_minuteUpdateHandlers, "removeObjectForKey:", a3);
  -[SBUIPreciseClockTimer _updateDisplayLink](self, "_updateDisplayLink");
}

- (void)_updateDisplayLink
{
  uint64_t v3;
  CADisplayLink *displayLink;
  CADisplayLink *v5;
  CADisplayLink *v6;
  CADisplayLink *v7;
  void *v8;
  CADisplayLink *v9;

  v3 = -[NSMutableDictionary count](self->_minuteUpdateHandlers, "count");
  displayLink = self->_displayLink;
  if (v3)
  {
    if (!displayLink)
    {
      objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__onDisplayLink_);
      v5 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
      v6 = self->_displayLink;
      self->_displayLink = v5;

      v7 = self->_displayLink;
      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CADisplayLink addToRunLoop:forMode:](v7, "addToRunLoop:forMode:", v8, *MEMORY[0x1E0C99860]);

      -[CADisplayLink setPreferredFramesPerSecond:](self->_displayLink, "setPreferredFramesPerSecond:", 60);
    }
  }
  else if (displayLink)
  {
    -[CADisplayLink invalidate](displayLink, "invalidate");
    v9 = self->_displayLink;
    self->_displayLink = 0;

    *(int64x2_t *)&self->_lastHour = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_minuteUpdateHandlers, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end
