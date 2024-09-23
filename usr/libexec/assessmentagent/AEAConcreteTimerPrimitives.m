@implementation AEAConcreteTimerPrimitives

- (id)scheduledTimerWithDuration:(double)a3 queue:(id)a4 handler:(id)a5
{
  return +[AEADispatchTimer scheduledTimerWithDuration:queue:handler:](AEADispatchTimer, "scheduledTimerWithDuration:queue:handler:", a4, a5, a3);
}

@end
