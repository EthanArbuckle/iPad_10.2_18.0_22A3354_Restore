@implementation SCWDatabasePollingCondition

- (SCWDatabasePollingCondition)initWithMinIntervalSinceLastSync:(double)a3
{
  SCWDatabasePollingCondition *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCWDatabasePollingCondition;
  result = -[SCWDatabasePollingCondition init](&v5, sel_init);
  if (result)
    result->_minIntervalSinceLastSync = a3;
  return result;
}

- (double)minIntervalSinceLastSync
{
  return self->_minIntervalSinceLastSync;
}

@end
