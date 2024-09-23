@implementation SiriAnalyticsLogicalClock

- (SiriAnalyticsLogicalClock)init
{

  return 0;
}

- (SiriAnalyticsLogicalClock)initWithClockIdentifier:(id)a3 timestampOffset:(unint64_t)a4 startedOn:(unint64_t)a5
{
  id v8;
  SiriAnalyticsLogicalClock *v9;
  uint64_t v10;
  NSUUID *clockIdentifier;
  SiriAnalyticsLogicalClockStatistics *v12;
  SiriAnalyticsLogicalClockStatistics *clockStatistics;
  objc_super v15;

  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SiriAnalyticsLogicalClock;
  v9 = -[SiriAnalyticsLogicalClock init](&v15, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    clockIdentifier = v9->_clockIdentifier;
    v9->_clockIdentifier = (NSUUID *)v10;

    v9->_timestampOffset = a4;
    v12 = objc_alloc_init(SiriAnalyticsLogicalClockStatistics);
    clockStatistics = v9->_clockStatistics;
    v9->_clockStatistics = v12;

    -[SiriAnalyticsLogicalClockStatistics setStartedOn:](v9->_clockStatistics, "setStartedOn:", a5);
  }

  return v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p clockIdentifier: %@>"), v5, self, self->_clockIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)logicalTimestampForMachAbsoluteTime:(unint64_t)a3
{
  return -[SiriAnalyticsLogicalTimeStamp initWithMachAbsoluteTime:clockIdentifier:]([SiriAnalyticsLogicalTimeStamp alloc], "initWithMachAbsoluteTime:clockIdentifier:", self->_timestampOffset + a3, self->_clockIdentifier);
}

- (void)stopClock
{
  -[SiriAnalyticsLogicalClockStatistics setEndedOn:](self->_clockStatistics, "setEndedOn:", mach_absolute_time());
}

- (BOOL)containsTimestamp:(unint64_t)a3
{
  if (-[SiriAnalyticsLogicalClockStatistics startedOn](self->_clockStatistics, "startedOn") > a3)
    return 0;
  if (-[SiriAnalyticsLogicalClockStatistics endedOn](self->_clockStatistics, "endedOn"))
    return -[SiriAnalyticsLogicalClockStatistics endedOn](self->_clockStatistics, "endedOn") >= a3;
  return 1;
}

- (NSUUID)clockIdentifier
{
  return self->_clockIdentifier;
}

- (int64_t)timestampOffset
{
  return self->_timestampOffset;
}

- (SiriAnalyticsLogicalClockStatistics)clockStatistics
{
  return self->_clockStatistics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clockStatistics, 0);
  objc_storeStrong((id *)&self->_clockIdentifier, 0);
}

@end
