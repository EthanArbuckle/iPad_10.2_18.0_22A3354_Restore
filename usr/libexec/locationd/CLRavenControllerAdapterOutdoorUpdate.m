@implementation CLRavenControllerAdapterOutdoorUpdate

- (CLRavenControllerAdapterOutdoorUpdate)initWithController:(void *)a3
{
  CLRavenControllerAdapterOutdoorUpdate *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLRavenControllerAdapterOutdoorUpdate;
  result = -[CLRavenControllerAdapterOutdoorUpdate init](&v5, "init");
  if (result)
  {
    result->_adaptee = a3;
    result->_valid = a3 != 0;
  }
  return result;
}

- (void)invalidate
{
  self->_valid = 0;
  self->_adaptee = 0;
}

- (void)onOutdoorUpdate:(id)a3
{
  void *adaptee;
  _QWORD v4[7];

  adaptee = self->_adaptee;
  if (adaptee)
  {
    if (self->_valid)
    {
      (*((void (**)(_QWORD *__return_ptr, id, SEL))a3 + 2))(v4, a3, a2);
      sub_100C76D64((uint64_t)adaptee, (uint64_t)v4);
    }
  }
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
