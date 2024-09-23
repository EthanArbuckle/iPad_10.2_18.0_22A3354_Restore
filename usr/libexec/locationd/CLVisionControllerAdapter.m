@implementation CLVisionControllerAdapter

- (CLVisionControllerAdapter)initWithController:(void *)a3
{
  CLVisionControllerAdapter *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLVisionControllerAdapter;
  result = -[CLVisionControllerAdapter init](&v5, "init");
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

- (void)handleARSessionState:(unint64_t)a3 fromClient:(id)a4
{
  sub_100958628((uint64_t)self->_adaptee, a3);
}

- (void)handleVIOEstimation:(id)a3 fromClient:(id)a4
{
  sub_1009586F4((_BYTE *)self->_adaptee, a3);
}

- (void)handleVLLocalizationResult:(id)a3 fromClient:(id)a4
{
  sub_100958784((_BYTE *)self->_adaptee, a3);
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
