@implementation SBWakeEvent

- (SBWakeEvent)initWithTimestamp:(unint64_t)a3
{
  -[SBWakeEvent setEventAbsTimestamp:](self, "setEventAbsTimestamp:", a3);
  -[SBWakeEvent setEventRecvContTimestamp:](self, "setEventRecvContTimestamp:", mach_continuous_time());
  return self;
}

- (unint64_t)eventAbsTimestamp
{
  return self->_eventAbsTimestamp;
}

- (void)setEventAbsTimestamp:(unint64_t)a3
{
  self->_eventAbsTimestamp = a3;
}

- (unint64_t)eventRecvContTimestamp
{
  return self->_eventRecvContTimestamp;
}

- (void)setEventRecvContTimestamp:(unint64_t)a3
{
  self->_eventRecvContTimestamp = a3;
}

@end
