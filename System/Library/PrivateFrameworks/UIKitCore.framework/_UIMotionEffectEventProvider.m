@implementation _UIMotionEffectEventProvider

- (_UIMotionEffectEventConsumer)consumer
{
  return self->_consumer;
}

- (BOOL)wantsSynchronizedUpdates
{
  return 0;
}

- (void)setConsumer:(id)a3
{
  self->_consumer = (_UIMotionEffectEventConsumer *)a3;
}

- (id)currentEvent
{
  return 0;
}

- (BOOL)shouldLogEvents
{
  return 0;
}

- (double)fastUpdateIntervalForLogs
{
  return 1.0;
}

- (double)slowUpdateIntervalForLogs
{
  return 1.0;
}

@end
