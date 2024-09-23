@implementation SCLActiveDurationAnalyticsSource

- (SCLActiveDurationAnalyticsSource)initWithInitialState:(id)a3
{
  id v4;
  SCLActiveDurationAnalyticsSource *v5;
  SCLActiveDurationAnalyticsSource *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SCLActiveDurationAnalyticsSource;
  v5 = -[SCLActiveDurationAnalyticsSource init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    mach_timebase_info(&v5->_timebase);
    -[SCLActiveDurationAnalyticsSource setCurrentState:](v6, "setCurrentState:", v4);
  }

  return v6;
}

- (void)server:(id)a3 didUpdateState:(id)a4 fromState:(id)a5
{
  -[SCLActiveDurationAnalyticsSource setCurrentState:](self, "setCurrentState:", a4);
}

- (void)setCurrentState:(id)a3
{
  SCLState *v4;
  SCLState *v5;
  SCLState *currentState;
  int v7;
  int v8;
  id v9;

  v9 = a3;
  v4 = self->_currentState;
  v5 = (SCLState *)objc_msgSend(v9, "copy");
  currentState = self->_currentState;
  self->_currentState = v5;

  v7 = -[SCLActiveDurationAnalyticsSource isActiveForState:](self, "isActiveForState:", v4);
  v8 = -[SCLActiveDurationAnalyticsSource isActiveForState:](self, "isActiveForState:", v9);
  if (v7 != v8)
  {
    if (v8)
    {
      self->_activeStartTimestamp = mach_continuous_approximate_time();
    }
    else
    {
      -[SCLActiveDurationAnalyticsSource commitAnalyticsEventForTransitionFromState:toState:](self, "commitAnalyticsEventForTransitionFromState:toState:", v4, v9);
      -[SCLActiveDurationAnalyticsSource setActiveStartTimestamp:](self, "setActiveStartTimestamp:", 0);
    }
  }

}

- (BOOL)isActiveForState:(id)a3
{
  return a3 && objc_msgSend(a3, "activeState") != 0;
}

- (void)commitAnalyticsEventForTransitionFromState:(id)a3 toState:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[SCLActiveDurationAnalyticsSource secondsSinceContinuousTimestamp:](self, "secondsSinceContinuousTimestamp:", -[SCLActiveDurationAnalyticsSource activeStartTimestamp](self, "activeStartTimestamp"));
  v6 = v5;
  AnalyticsSendEventLazy();

}

id __87__SCLActiveDurationAnalyticsSource_commitAnalyticsEventForTransitionFromState_toState___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("scheduleEnabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isScheduleEnabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v7[1] = CFSTR("inSchedule");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isInSchedule"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  v7[2] = CFSTR("duration");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)secondsSinceContinuousTimestamp:(unint64_t)a3
{
  uint64_t v5;

  v5 = mach_continuous_approximate_time();
  if (v5 >= a3)
    return -[SCLActiveDurationAnalyticsSource secondsWithMachTimeInterval:](self, "secondsWithMachTimeInterval:", v5 - a3);
  else
    return 0;
}

- (unint64_t)secondsWithMachTimeInterval:(unint64_t)a3
{
  return self->_timebase.numer * a3 / self->_timebase.denom / 0x3B9ACA00;
}

- (SCLState)currentState
{
  return self->_currentState;
}

- (unint64_t)activeStartTimestamp
{
  return self->_activeStartTimestamp;
}

- (void)setActiveStartTimestamp:(unint64_t)a3
{
  self->_activeStartTimestamp = a3;
}

- (mach_timebase_info)timebase
{
  return self->_timebase;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentState, 0);
}

@end
