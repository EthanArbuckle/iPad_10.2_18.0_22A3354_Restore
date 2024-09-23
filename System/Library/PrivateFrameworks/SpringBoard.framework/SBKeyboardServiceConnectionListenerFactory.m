@implementation SBKeyboardServiceConnectionListenerFactory

- (id)newKeyboardServiceListenerForDelegate:(id)a3 serviceQueue:(id)a4
{
  id v5;
  id v6;
  _SBKeyboardServiceConnectionListener *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_SBKeyboardServiceConnectionListener initWithServiceQueue:]([_SBKeyboardServiceConnectionListener alloc], "initWithServiceQueue:", v5);

  -[_SBKeyboardServiceConnectionListener setDelegate:](v7, "setDelegate:", v6);
  return v7;
}

@end
