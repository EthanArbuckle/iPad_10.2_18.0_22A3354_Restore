@implementation CLProactiveInertialOdometryClientDelegate

- (CLProactiveInertialOdometryClientDelegate)initWithLocationController:(void *)a3
{
  CLProactiveInertialOdometryClientDelegate *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLProactiveInertialOdometryClientDelegate;
  result = -[CLProactiveInertialOdometryClientDelegate init](&v5, "init");
  if (result)
  {
    result->_client = a3;
    result->_valid = 0;
  }
  return result;
}

- (void)onBackgroundInertialOdometryState:(id)a3
{
  sub_1006A9E78((uint64_t)self->_client, a3);
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
