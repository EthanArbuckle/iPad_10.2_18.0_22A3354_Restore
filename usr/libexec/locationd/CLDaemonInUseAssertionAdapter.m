@implementation CLDaemonInUseAssertionAdapter

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void)dealloc
{
  objc_super v2;

  if (self->_valid)
    sub_10192E7BC();
  v2.receiver = self;
  v2.super_class = (Class)CLDaemonInUseAssertionAdapter;
  -[CLDaemonInUseAssertionAdapter dealloc](&v2, "dealloc");
}

- (CLDaemonInUseAssertionAdapter)init
{
  CLDaemonInUseAssertionAdapter *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLDaemonInUseAssertionAdapter;
  result = -[CLDaemonInUseAssertionAdapter init](&v3, "init");
  if (result)
    result->_valid = 1;
  return result;
}

- (BOOL)valid
{
  return self->_valid;
}

@end
