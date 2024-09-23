@implementation SiriAnalyticsLogicalClockStatistics

- (unint64_t)clockAgeInNanoseconds
{
  unint64_t endedOn;

  endedOn = self->_endedOn;
  if (!endedOn)
    return 0;
  if (_SiriAnalyticsMachAbsoluteTimeRate_onceToken != -1)
    dispatch_once(&_SiriAnalyticsMachAbsoluteTimeRate_onceToken, &__block_literal_global_391);
  return (unint64_t)(*(double *)&_SiriAnalyticsMachAbsoluteTimeRate_rate * (double)endedOn)
       - (unint64_t)(*(double *)&_SiriAnalyticsMachAbsoluteTimeRate_rate * (double)self->_startedOn);
}

- (unint64_t)utilizationLifetimeInNanoseconds
{
  unint64_t lastMessageEmittedOn;

  lastMessageEmittedOn = self->_lastMessageEmittedOn;
  if (!lastMessageEmittedOn)
    return 0;
  if (_SiriAnalyticsMachAbsoluteTimeRate_onceToken != -1)
    dispatch_once(&_SiriAnalyticsMachAbsoluteTimeRate_onceToken, &__block_literal_global_391);
  return (unint64_t)(*(double *)&_SiriAnalyticsMachAbsoluteTimeRate_rate * (double)lastMessageEmittedOn)
       - (unint64_t)(*(double *)&_SiriAnalyticsMachAbsoluteTimeRate_rate * (double)self->_startedOn);
}

- (void)noteMessageEmitted
{
  uint64_t v3;
  unint64_t v4;

  v3 = mach_absolute_time();
  v4 = self->_messagesEmitted + 1;
  self->_lastMessageEmittedOn = v3;
  self->_messagesEmitted = v4;
  self->_bookkeepingDirtied = 1;
}

- (unint64_t)startedOn
{
  return self->_startedOn;
}

- (void)setStartedOn:(unint64_t)a3
{
  self->_startedOn = a3;
}

- (unint64_t)endedOn
{
  return self->_endedOn;
}

- (void)setEndedOn:(unint64_t)a3
{
  self->_endedOn = a3;
}

- (unint64_t)lastMessageEmittedOn
{
  return self->_lastMessageEmittedOn;
}

- (void)setLastMessageEmittedOn:(unint64_t)a3
{
  self->_lastMessageEmittedOn = a3;
}

- (unint64_t)messagesEmitted
{
  return self->_messagesEmitted;
}

- (void)setMessagesEmitted:(unint64_t)a3
{
  self->_messagesEmitted = a3;
}

- (BOOL)bookkeepingDirtied
{
  return self->_bookkeepingDirtied;
}

- (void)setBookkeepingDirtied:(BOOL)a3
{
  self->_bookkeepingDirtied = a3;
}

@end
