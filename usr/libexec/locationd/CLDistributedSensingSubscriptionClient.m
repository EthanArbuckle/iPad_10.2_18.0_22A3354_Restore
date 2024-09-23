@implementation CLDistributedSensingSubscriptionClient

- (CLDistributedSensingSubscriptionClient)initWithSubscription:(CLDistributedSensingSubscription *)a3
{
  CLDistributedSensingSubscriptionClient *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLDistributedSensingSubscriptionClient;
  result = -[CLDistributedSensingSubscriptionClient init](&v5, "init");
  if (result)
  {
    result->_subscription = a3;
    result->_valid = 1;
  }
  return result;
}

- (void)invalidate
{
  self->_valid = 0;
}

- (void)onVehicleStateUpdate:(id)a3
{
  sub_101056E64((uint64_t)self->_subscription, (uint64_t)a3);
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end
