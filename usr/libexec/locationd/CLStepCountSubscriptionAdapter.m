@implementation CLStepCountSubscriptionAdapter

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (CLStepCountSubscriptionAdapter)initWithStepCountSubscription:(void *)a3
{
  CLStepCountSubscriptionAdapter *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLStepCountSubscriptionAdapter;
  result = -[CLStepCountSubscriptionAdapter init](&v5, "init");
  if (result)
    result->_stepCountSubscription = a3;
  return result;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)stepCountSubscription
{
  return self->_stepCountSubscription;
}

- (void)setStepCountSubscription:(void *)a3
{
  self->_stepCountSubscription = a3;
}

@end
