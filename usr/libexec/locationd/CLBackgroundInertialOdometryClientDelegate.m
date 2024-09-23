@implementation CLBackgroundInertialOdometryClientDelegate

- (CLBackgroundInertialOdometryClientDelegate)initWithPedestrianFenceClient:(void *)a3
{
  CLBackgroundInertialOdometryClientDelegate *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLBackgroundInertialOdometryClientDelegate;
  result = -[CLBackgroundInertialOdometryClientDelegate init](&v5, "init");
  if (result)
    result->_client = a3;
  return result;
}

- (void)onBackgroundInertialOdometryState:(id)a3
{
  sub_100486240((uint64_t)self->_client, (uint64_t)a3);
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void)client
{
  return self->_client;
}

- (void)setClient:(void *)a3
{
  self->_client = a3;
}

@end
