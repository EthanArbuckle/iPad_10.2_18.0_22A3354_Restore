@implementation SCKDatabasePollingCondition

- (SCKDatabasePollingCondition)initWithMinIntervalSinceLastSync:(double)a3
{
  SCKDatabasePollingCondition *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCKDatabasePollingCondition;
  result = -[SCKDatabasePollingCondition init](&v5, sel_init);
  if (result)
    result->_minIntervalSinceLastSync = a3;
  return result;
}

- (double)minIntervalSinceLastSync
{
  return self->_minIntervalSinceLastSync;
}

@end
