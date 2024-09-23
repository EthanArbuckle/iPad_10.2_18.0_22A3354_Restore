@implementation CLSwimNotifierIntersiloDelegate

- (CLSwimNotifierIntersiloDelegate)init
{
  CLSwimNotifierIntersiloDelegate *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSwimNotifierIntersiloDelegate;
  result = -[CLSwimNotifierIntersiloDelegate init](&v3, "init");
  if (result)
    result->_valid = 1;
  return result;
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
