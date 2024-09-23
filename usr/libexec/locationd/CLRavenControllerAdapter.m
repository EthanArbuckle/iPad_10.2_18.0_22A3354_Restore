@implementation CLRavenControllerAdapter

- (void)invalidate
{
  self->_valid = 0;
  self->_adaptee = 0;
}

- (CLRavenControllerAdapter)initWithController:(void *)a3
{
  CLRavenControllerAdapter *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLRavenControllerAdapter;
  result = -[CLRavenControllerAdapter init](&v5, "init");
  if (result)
  {
    result->_adaptee = a3;
    result->_valid = a3 != 0;
  }
  return result;
}

- (void)handleARSessionState:(unint64_t)a3 fromClient:(id)a4
{
  void *adaptee;
  unint64_t v6;

  v6 = a3;
  adaptee = self->_adaptee;
  if (adaptee)
  {
    if (self->_valid)
      sub_100C76E6C((uint64_t)adaptee, &v6);
  }
}

- (void)handleVIOEstimation:(id)a3 fromClient:(id)a4
{
  void *adaptee;

  adaptee = self->_adaptee;
  if (adaptee)
  {
    if (self->_valid)
      sub_100C76F1C((uint64_t)adaptee, a3);
  }
}

- (void)handleVLLocalizationResult:(id)a3 fromClient:(id)a4
{
  void *adaptee;

  adaptee = self->_adaptee;
  if (adaptee)
  {
    if (self->_valid)
      sub_100C76FCC((uint64_t)adaptee, a3);
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
