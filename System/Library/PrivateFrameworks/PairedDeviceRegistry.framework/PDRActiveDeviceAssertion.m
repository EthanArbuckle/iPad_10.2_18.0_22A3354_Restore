@implementation PDRActiveDeviceAssertion

- (PDRActiveDeviceAssertion)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDRActiveDeviceAssertion;
  return -[PDRActiveDeviceAssertion init](&v3, sel_init);
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (PDRDevice)device
{
  return self->_device;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)invalidate
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

@end
