@implementation SCROVirtualIOElement

- (SCROVirtualIOElement)init
{
  SCROVirtualIOElement *result;
  int v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SCROVirtualIOElement;
  result = -[SCROVirtualIOElement init](&v4, sel_init);
  if (result)
  {
    v3 = _currentToken++;
    result->_token = v3;
  }
  return result;
}

- (unsigned)ioObject
{
  return 0;
}

- (int)transport
{
  return 8;
}

- (int)identifier
{
  return self->_token;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_opt_new();
}

- (id)bluetoothAddress
{
  return CFSTR("00:11:22:33:FF:EE");
}

@end
