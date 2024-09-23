@implementation CLPedestrianFenceClientDelegate

- (CLPedestrianFenceClientDelegate)initWithPedestrianFenceClient:(void *)a3
{
  CLPedestrianFenceClientDelegate *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLPedestrianFenceClientDelegate;
  result = -[CLPedestrianFenceClientDelegate init](&v5, "init");
  if (result)
    result->_client = a3;
  return result;
}

- (void)didExitFence:(id)a3
{
  sub_100485C2C((uint64_t)self->_client, (uint64_t)a3);
}

- (void)didFailWithError:(int64_t)a3
{
  sub_100485D94((uint64_t)self->_client, a3);
}

- (void)sessionStatusReport:(id)a3
{
  sub_100485F10((uint64_t)self->_client, a3);
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
