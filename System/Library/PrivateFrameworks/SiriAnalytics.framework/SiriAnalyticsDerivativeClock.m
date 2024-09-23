@implementation SiriAnalyticsDerivativeClock

- (SiriAnalyticsDerivativeClock)init
{

  return 0;
}

- (SiriAnalyticsDerivativeClock)initWithClockIdentifier:(id)a3 isolatedStreamUUID:(id)a4 timestampOffset:(unint64_t)a5 rootClock:(id)a6
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  SiriAnalyticsDerivativeClock *v15;
  objc_super v17;

  v11 = a4;
  v12 = a6;
  v13 = a3;
  v14 = mach_absolute_time();
  v17.receiver = self;
  v17.super_class = (Class)SiriAnalyticsDerivativeClock;
  v15 = -[SiriAnalyticsLogicalClock initWithClockIdentifier:timestampOffset:startedOn:](&v17, sel_initWithClockIdentifier_timestampOffset_startedOn_, v13, a5, v14);

  if (v15)
  {
    objc_storeWeak((id *)&v15->_rootClock, v12);
    objc_storeStrong((id *)&v15->_isolatedStreamUUID, a4);
  }

  return v15;
}

- (NSUUID)isolatedStreamUUID
{
  return self->_isolatedStreamUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isolatedStreamUUID, 0);
  objc_destroyWeak((id *)&self->_rootClock);
}

@end
