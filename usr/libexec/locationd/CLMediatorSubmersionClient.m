@implementation CLMediatorSubmersionClient

- (CLMediatorSubmersionClient)initWithMediator:(void *)a3
{
  CLMediatorSubmersionClient *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLMediatorSubmersionClient;
  result = -[CLMediatorSubmersionClient init](&v5, "init");
  if (result)
  {
    result->_client = a3;
    result->_valid = 1;
  }
  else
  {
    MEMORY[0x10] = 0;
  }
  return result;
}

- (void)onSubmersionMeasurementUpdate:(id)a3
{
  sub_1006B9C64((uint64_t)self->_client, a3);
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
